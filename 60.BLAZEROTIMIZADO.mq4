//+------------------------------------------------------------------+
//|                                           60.BLAZEROTIMIZADO.mq4 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#include <stderror.mqh>
#include <stdlib.mqh>

#property strict
#property copyright     "Blazer Remastered"
#property version       "1.01"
#property link          "https://www.mql5.com/pt/users/wemersonrv/seller"
#property description   "Robô baseado no excelente Blazer Robot V2.1!"
#property description   "Acrescentei alguns ajustes e corrigi algumas falhas que percebi no original."
#property description   "Melhorei também as opções de Gerenciamento de Capital e removi alguns parâmetros"
#property description   "que não tinham importância para o mesmo."
#property description   " "
#property description   "Importante... Como consegui o robô de forma gratuita, a remasterização também será distribuida da "
#property description   "mesma forma. Portanto, se você pagou por ele ou recebeu \"grátis\" por entrar como afiliado de "
#property description   "alguém; quem tirou seu dinheiro é um tremendo de um SAFADO GOLPISTA!"

/////////////////////////////////////////////////////
extern string FFCall = "Noticias FFCall";

 extern int MinsBeforeNews = 60; // mins before an event to stay out of trading
extern int MinsAfterNews  = 20; // mins after  an event to stay out of trading
extern bool UseFFCall = true;
extern bool IncludeHigh = true;
bool NewsTime;


extern string _geral01 = "";              // CONFIGURAÇÕES GERAIS
extern double Lots = 0.01;                 // Lotes Manuais (Não gerenciado)
extern double LotExponent = 1.55;         // Fator incremento
extern double PipStep = 30.0;             // PIP Step
extern double MaxLots = 100.0;            // Max Lotes
extern double TakeProfit = 400.0;          // Take Profit
extern bool UseEquityStop = TRUE;        // Usar EquityStop?
extern double TotalEquityRisk = 20.0;     // Risco Total para EquityStop
extern bool UseTrailingStop = TRUE;      // Usa Trailling Stop´?
extern double TrailStart = 40.0;          // Inicio TraillingStop
extern double TrailStop = 10.0;            // Tamanho Trailling stop
extern double slip = 5.0;                 // Derrapagem (Slippage)

int lotdecimal = 2;
extern string _MM01 = "";              // GERENCIAMENTO DE CAPITAL
extern bool MM_Active = TRUE;         // Utiliza gerenciamento de capital?
extern string _MM02 = "Lote = Fator * Lote Mínimo";   // Fator de Multiplicação = Saldo / Fator
extern string _MM03 = "Lote Minimo: 0.02";            // Ex. Saldo: $ 2.247,30  Fator: $ 1.000,00
extern string _MM04 = "Lote = 2 * 0.02 => 0.04";      // Fator de Multiplicação = 2.247,30/1.000=2,2473 => 2
extern string _MM05 = "Lote será sempre 0.01";        // Enquanto o saldo estiver abaixo do fator
extern double MM_Factor = 1000;                       // Fator de Incremento, baseado no saldo
extern double MM_MinLot = 0.01;                       // Lote Mínimo
extern bool MM_MultiChart = false;                    // Múltiplos pares?
extern string _MM0r = "";              // FILTRO GRID
extern ENUM_TIMEFRAMES    TFBar = PERIOD_CURRENT;   // Time frame to use
extern int HmaPeriod = 30;

extern string _es01 = " ";             // ESTRATÉGIAS
extern bool blazer1=true;              // Ativa Estratégia 1        
extern int MaxTrades_Hilo = 10;        // Max Trades Estratégia 1
bool gi_184 = FALSE; // Parece não ter sentido
double gd_188 = 48.0;   // Futuro
double g_pips_196 = 40.0; // Futuro
double g_slippage_204; // Parece não ter nada
int MagicNumber_Hilo = 10278;
double g_price_216; // ???
double gd_equity; // Parece que~não foi usada
//double gd_unused_232;
//double gd_unused_240;
double gd_248;
double Equity;
double g_price_264;
//double g_bid_272;
//double g_ask_280;
double LastBuyPrice_Hilo;
double LastSellPrice_Hilo;
//double gd_304;
bool gi_312;
string gs_blazer1_316 = "trade1";
int gi_324 = 0;
int gi_328;
int gi_332 = 0;
double gd_336;
int g_pos_344 = 0;
int Trades_Hilo;
double gd_352 = 0.0;
bool gi_360 = FALSE;
bool gi_364 = FALSE;
bool gi_368 = FALSE;
int gi_372;
bool gi_376 = FALSE;
double gd_380;
double gd_388;
extern bool blazer2=true;              // Ativa Estratégia 2
extern int MaxTrades_15 = 10;       // Max Trades Estratégia 2
int g_timeframe_408 = PERIOD_H1;
double g_pips_412 = 40.0;
bool gi_420 = FALSE;
double gd_424 = 48.0;
double g_slippage_432;
int g_magic_176_15 = 22324;
double g_price_444;
double gd_452;
//double gd_unused_460;
//double gd_unused_468;
double g_price_476;
double g_bid_484;
double g_ask_492;
double gd_500;
double gd_508;
//double gd_516;
bool gi_524;
string gs_blazer2_528 = "trade2";
int gi_536 = 0;
int gi_540;
int gi_544 = 0;
double gd_548;
int g_pos_556 = 0;
int gi_560;
double gd_564 = 0.0;
bool gi_572 = FALSE;
bool gi_576 = FALSE;
bool gi_580 = FALSE;
int gi_584;
bool gi_588 = FALSE;
double gd_592;
double gd_600;
int g_datetime_608 = 1;
extern bool blazer3=true;              // Ativa Estratégia 3
extern int MaxTrades_16 = 10;    // Max Trades Estratégia 3
int g_timeframe_624 = PERIOD_M1;
double g_pips_628 = 40.0;
bool gi_636 = FALSE;
double gd_640 = 48.0;
double g_slippage_648;
int g_magic_176_16 = 23794;
double g_price_660;
double gd_668;
//double gd_unused_676;
//double gd_unused_684;
double g_price_692;
double g_bid_700;
double g_ask_708;
double gd_716;
double gd_724;
//double gd_732;
bool gi_740;
string gs_blazer3_744 = "trade3";
int gi_752 = 0;
int gi_756;
int gi_760 = 0;
double gd_764;
int g_pos_772 = 0;
int gi_776;
double gd_780 = 0.0;
bool gi_788 = FALSE;
bool gi_792 = FALSE;
bool gi_796 = FALSE;
int gi_800;
bool gi_804 = FALSE;
double gd_808;
double gd_816;
int g_datetime_824 = 1;
int g_timeframe_828 = PERIOD_M1;
int g_timeframe_832 = PERIOD_M5;
int g_timeframe_836 = PERIOD_M15;
int g_timeframe_840 = PERIOD_M30;
int g_timeframe_844 = PERIOD_H1;
int g_timeframe_848 = PERIOD_H4;
int g_timeframe_852 = PERIOD_D1;
bool g_corner_856 = TRUE;
int gi_860 = 0;
int gi_864 = 10;
int g_window_868 = 0;
bool gi_872 = TRUE;
//bool gi_unused_876 = TRUE;
bool gi_880 = FALSE;
int g_color_884 = Gray;
int g_color_888 = Gray;
int g_color_892 = Gray;
int g_color_896 = DarkOrange;
//int gi_unused_900 = 36095;
int gi_904 = 65280;
int gi_908 = 17919;
int gi_912 = 65280;
int gi_916 = 17919;
int gi_920 = 65280;
int gi_924 = 255;
int gi_928 = 42495;
int g_period_932 = 8;
int g_period_936 = 17;
int g_period_940 = 9;
int g_applied_price_944 = PRICE_CLOSE;
int gi_948 = 65280;
int gi_952 = 4678655;
int gi_956 = 32768;
int gi_960 = 255;
//string gs_unused_964 = "<<<< STR Indicator Settings >>>>>>>>>>>>>";
//string gs_unused_972 = "<<<< RSI Settings >>>>>>>>>>>>>";
int g_period_980 = 9;
int g_applied_price_984 = PRICE_CLOSE;
//string gs_unused_988 = "<<<< CCI Settings >>>>>>>>>>>>>>";
int g_period_996 = 13;
int g_applied_price_1000 = PRICE_CLOSE;
//string gs_unused_1004 = "<<<< STOCH Settings >>>>>>>>>>>";
int g_period_1012 = 5;
int g_period_1016 = 3;
int g_slowing_1020 = 3;
int g_ma_method_1024 = MODE_EMA;
//string gs_unused_1028 = "<<<< STR Colors >>>>>>>>>>>>>>>>";
int gi_1036 = 65280;
int gi_1040 = 255;
int gi_1044 = 42495;
//string gs_unused_1048 = "<<<< MA Settings >>>>>>>>>>>>>>";
int g_period_1056 = 5;
int g_period_1060 = 9;
int g_ma_method_1064 = MODE_EMA;
int g_applied_price_1068 = PRICE_CLOSE;
//string gs_unused_1072 = "<<<< MA Colors >>>>>>>>>>>>>>";
int gi_1080 = 65280;
int gi_1084 = 255;
string gs_dummy_1088;
//string g_text_1096;
//string g_text_1104;
string g_dbl2str_1112 = "";
string g_dbl2str_1120 = "";
int g_color_1128 = ForestGreen;


 // Function to check if it is news time
 void NewsHandling()
 {
     static int PrevMinute = -1;

     if (Minute() != PrevMinute)
     {
         PrevMinute = Minute();
    
     // Use this call to get ONLY impact of previous event
     int impactOfPrevEvent = 
            iCustom(NULL, 0, "FFCal", true, true, false, true, true, 2, 0);

     // Use this call to get ONLY impact of nexy event
     int impactOfNextEvent = 
            iCustom(NULL, 0, "FFCal", true, true, false, true, true, 2, 1);

         int minutesSincePrevEvent =
             iCustom(NULL, 0, "FFCal", true, true, false, true, false, 1, 0);
 
         int minutesUntilNextEvent =
             iCustom(NULL, 0, "FFCal", true, true, false, true, false, 1, 1);
 
         NewsTime = false;
         if ((minutesUntilNextEvent <= MinsBeforeNews) || 
             (minutesSincePrevEvent <= MinsAfterNews))
         {
             NewsTime = true;
         }
     }
 }//newshandling
 
 
int OnInit(){
   /*
   if (AccountNumber() != 1682654) {
      Alert("This EA is not licensed to your account number!");
      return;
   }
   */
   //gd_304 = MarketInfo(Symbol(), MODE_SPREAD) * Point;
   //gd_516 = MarketInfo(Symbol(), MODE_SPREAD) * Point;
   //gd_732 = MarketInfo(Symbol(), MODE_SPREAD) * Point;
   //ObjectCreate("Lable1", OBJ_LABEL, 0, 0, 1.0);
   //ObjectSet("Lable1", OBJPROP_CORNER, 2);
   //ObjectSet("Lable1", OBJPROP_XDISTANCE, 23);
   //ObjectSet("Lable1", OBJPROP_YDISTANCE, 21);
   
   //g_text_1104 = "wemersonrv@gmail.com";
   //ObjectSetText("Lable1", g_text_1104, 16, "Times New Roman", Aqua);
   //ObjectCreate("Lable", OBJ_LABEL, 0, 0, 1.0);
   //ObjectSet("Lable", OBJPROP_CORNER, 2);
   //ObjectSet("Lable", OBJPROP_XDISTANCE, 3);
   //ObjectSet("Lable", OBJPROP_YDISTANCE, 1);
   //g_text_1096 = "GoodLuck and Happy Trading";
   //ObjectSetText("Lable", g_text_1096, 16, "Times New Roman", DeepSkyBlue);
   return(INIT_SUCCEEDED);
}

void OnDeinit(const int reason){
   ObjectDelete("cja");
   ObjectDelete("Signalprice");
   ObjectDelete("SIG_BARS_TF1");
   ObjectDelete("SIG_BARS_TF2");
   ObjectDelete("SIG_BARS_TF3");
   ObjectDelete("SIG_BARS_TF4");
   ObjectDelete("SIG_BARS_TF5");
   ObjectDelete("SIG_BARS_TF6");
   ObjectDelete("SIG_BARS_TF7");
   ObjectDelete("SSignalMACD_TEXT");
   ObjectDelete("SSignalMACDM1");
   ObjectDelete("SSignalMACDM5");
   ObjectDelete("SSignalMACDM15");
   ObjectDelete("SSignalMACDM30");
   ObjectDelete("SSignalMACDH1");
   ObjectDelete("SSignalMACDH4");
   ObjectDelete("SSignalMACDD1");
   ObjectDelete("SSignalSTR_TEXT");
   ObjectDelete("SignalSTRM1");
   ObjectDelete("SignalSTRM5");
   ObjectDelete("SignalSTRM15");
   ObjectDelete("SignalSTRM30");
   ObjectDelete("SignalSTRH1");
   ObjectDelete("SignalSTRH4");
   ObjectDelete("SignalSTRD1");
   ObjectDelete("SignalEMA_TEXT");
   ObjectDelete("SignalEMAM1");
   ObjectDelete("SignalEMAM5");
   ObjectDelete("SignalEMAM15");
   ObjectDelete("SignalEMAM30");
   ObjectDelete("SignalEMAH1");
   ObjectDelete("SignalEMAH4");
   ObjectDelete("SignalEMAD1");
   ObjectDelete("SIG_DETAIL_1");
   ObjectDelete("SIG_DETAIL_2");
   ObjectDelete("SIG_DETAIL_3");
   ObjectDelete("SIG_DETAIL_4");
   ObjectDelete("SIG_DETAIL_5");
   ObjectDelete("SIG_DETAIL_6");
   ObjectDelete("SIG_DETAIL_7");
   ObjectDelete("SIG_DETAIL_8");
   ObjectDelete("Lable2");
   ObjectDelete("Lable3");

}

void OnTick() {

 NewsHandling();
if(NewsTime && UseFFCall) return;

   int li_0=0;
   int li_4=0;
   int li_8=0;
   int li_12=0;
   int li_16=0;
   int li_20=0;
   int li_24=0;
   color l_color_28=0;
   color l_color_32=0;
   color l_color_36=0;
   color l_color_40=0;
   color l_color_44=0;
   color l_color_48=0;
   color l_color_52=0;
   //string ls_unused_56;
   color l_color_64=0;
   color l_color_68=0;
   color l_color_72=0;
   color l_color_76=0;
   color l_color_80=0;
   color l_color_84=0;
   color l_color_88=0;
   color l_color_92=0;
   //string ls_unused_96;
   color l_color_104=0;
   //int li_unused_108;
   double l_ihigh_112;
   double l_ilow_120;
   double l_iclose_128;
   double l_iclose_136;
   double ld_144;
   double ld_152;
   double ld_160;
   int l_ord_total_168;
   int l_count_172;
   double ld_176;
   double ld_184;
   int foo=0;
   int l_ord_total_192;
   int l_count_196;
   int l_ind_counted_200 = IndicatorCounted();
   if (Lots > MaxLots && !MM_Active) Lots = MaxLots;
   Comment("" 
      + "\n" 
      + "MACH 4 Edição XP " 
      + "\n" 
      + "________________________________" 
      + "\n" 
      + "Corretora:           " + AccountCompany() 
      + "\n" 
      + "Horário da corretora:     " + TimeToStr(TimeCurrent(), TIME_DATE|TIME_SECONDS) 
      + "\n" 
      + "________________________________" 
      + "\n" 
      + "Nome:                 " + AccountName() 
      + "\n" 
      + "Conta Número:   " + string(AccountNumber() )
      + "\n" 
      + "Moeda: " + AccountCurrency() 
      + "\n" 
      + "_______________________________" 
      + "\n" 
      + "Ordens Abertas - Estratégia 1:   " + string(CountTrades_Hilo() )
      + "\n" 
      + "Ordens Abertas - Estratégia 2:   " + string(CountTrades_15() )
      + "\n" 
      + "Ordens Abertas - Estratégia 3:   " + string(CountTrades_16() )
      + "\n" 
      + "TODAS AS ORDENS:          " + string(OrdersTotal() )
      + "\n" 
      + "_______________________________" 
      + "\n" 
      + "Saldo Atual:     " + DoubleToStr(AccountBalance(), 2) 
      + "\n" 
      + "Equidade:      " + DoubleToStr(AccountEquity(), 2) 
      + "\n"
      + "_______________________________" 
      + "\n"
      + "Gerenciamento de capital:   " + (MM_Active?"SIM":"NÃO")
      + "\n"
      + "Lote inicial atual:   " + DoubleToStr(DefineLot(), 2) 
      + "\n"      
      );
   gd_248 = NormalizeDouble(AccountBalance(), 2);
   Equity = NormalizeDouble(AccountEquity(), 2);
       int SinalOp =  iCustom(NULL, 0, "FXMACH4i1", TFBar , HmaPeriod,4,0);
      //  int SinalOp2 =  iCustom(NULL, 0, "FXMACH4i1", 5 , 30,4,0);
        
   if (Equity >= 5.0 * (gd_248 / 6.0)) g_color_1128 = DodgerBlue;
   if (Equity >= 4.0 * (gd_248 / 6.0) && Equity < 5.0 * (gd_248 / 6.0)) g_color_1128 = DeepSkyBlue;
   if (Equity >= 3.0 * (gd_248 / 6.0) && Equity < 4.0 * (gd_248 / 6.0)) g_color_1128 = Gold;
   if (Equity >= 2.0 * (gd_248 / 6.0) && Equity < 3.0 * (gd_248 / 6.0)) g_color_1128 = OrangeRed;
   if (Equity >= gd_248 / 6.0 && Equity < 2.0 * (gd_248 / 6.0)) g_color_1128 = Crimson;
   if (Equity < gd_248 / 5.0) g_color_1128 = Red;
   ObjectDelete("Lable2");
   ObjectCreate("Lable2", OBJ_LABEL, 0, 0, 1.0);
   ObjectSet("Lable2", OBJPROP_CORNER, 3);
   ObjectSet("Lable2", OBJPROP_XDISTANCE, 153);
   ObjectSet("Lable2", OBJPROP_YDISTANCE, 31);
   g_dbl2str_1112 = DoubleToStr(AccountBalance(), 2);
   ObjectSetText("Lable2", "Saldo Atual:  " + g_dbl2str_1112 + "", 16, "Times New Roman", DodgerBlue);
   ObjectDelete("Lable3");
   ObjectCreate("Lable3", OBJ_LABEL, 0, 0, 1.0);
   ObjectSet("Lable3", OBJPROP_CORNER, 3);
   ObjectSet("Lable3", OBJPROP_XDISTANCE, 153);
   ObjectSet("Lable3", OBJPROP_YDISTANCE, 11);
   g_dbl2str_1120 = DoubleToStr(AccountEquity(), 2);
   ObjectSetText("Lable3", "Equidade:  " + g_dbl2str_1120 + "", 16, "Times New Roman", g_color_1128);
   int l_ind_counted_204 = IndicatorCounted();
   string l_text_208 = "";
   string l_text_216 = "";
   string l_text_224 = "";
   string l_text_232 = "";
   string l_text_240 = "";
   string l_text_248 = "";
   string l_text_256 = "";
 
   /*
   if (MM_Active == TRUE) {
      if (MathCeil(AccountBalance()) < 200000.0) ld_144 = Lots;
      else ld_144 = 0.00001 * MathCeil(AccountBalance());
   } else ld_144 = Lots;
   */
   ld_144 = DefineLot();
      
   if (UseTrailingStop) TrailingAlls_Hilo(TrailStart, TrailStop, g_price_264);
   if (gi_184) {
      if (TimeCurrent() >= gi_328) {
         CloseThisSymbolAll_Hilo();
         Print("Closed All due_Hilo to TimeOut");
      }
   }
   if (gi_324 == Time[0]) return;
   gi_324 = Time[0];
   double ld_1128 = CalculateProfit_Hilo();
   if (UseEquityStop) {
      if (ld_1128 < 0.0 && MathAbs(ld_1128) > TotalEquityRisk / 100.0 * AccountEquityHigh_Hilo()) {
        // CloseThisSymbolAll_Hilo();
        // Print("Closed All due_Hilo to Stop Out");
         // gi_376 = FALSE;
         return;
      }
   }
   Trades_Hilo = CountTrades_Hilo();
   if (Trades_Hilo == 0) gi_312 = FALSE;
   for (g_pos_344 = OrdersTotal() - 1; g_pos_344 >= 0; g_pos_344--) {
      if( !OrderSelect(g_pos_344, SELECT_BY_POS, MODE_TRADES) ){ continue; }
      if (OrderSymbol() != Symbol() || OrderMagicNumber() != MagicNumber_Hilo) continue;
      if (OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber_Hilo) {
         if (OrderType() == OP_BUY) {
            gi_364 = TRUE;
            gi_368 = FALSE;
            break;
         }
      }
      if (OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber_Hilo) {
         if (OrderType() == OP_SELL) {
            gi_364 = FALSE;
            gi_368 = TRUE;
            break;
         }
      }
   }
   if (Trades_Hilo > 0 && Trades_Hilo <= MaxTrades_Hilo) {
      RefreshRates();
      LastBuyPrice_Hilo = FindLastBuyPrice_Hilo();
      LastSellPrice_Hilo = FindLastSellPrice_Hilo();
      if (gi_364 && LastBuyPrice_Hilo - Ask >= PipStep * Point && SinalOp > 0) gi_360 = TRUE;
      if (gi_368 && Bid - LastSellPrice_Hilo >= PipStep * Point && SinalOp < 0 ) gi_360 = TRUE;
   }
   if (Trades_Hilo < 1) {
      gi_368 = FALSE;
      gi_364 = FALSE;
      gi_360 = TRUE;
      gd_equity = AccountEquity();
   }
   if (gi_360) {
      LastBuyPrice_Hilo = FindLastBuyPrice_Hilo();
      LastSellPrice_Hilo = FindLastSellPrice_Hilo();
      if (gi_368&&blazer1) {
         gi_332 = Trades_Hilo;
         gd_336 = NormalizeDouble(ld_144 * MathPow(LotExponent, gi_332), lotdecimal);
         RefreshRates();
         gi_372 = OpenPendingOrder_Hilo(1, gd_336, Bid, slip, Ask, 0, 0, gs_blazer1_316 + "-" + string(gi_332), MagicNumber_Hilo, 0, HotPink);
         if (gi_372 < 0) {
            Print("Error: ", GetLastError());
            return ;
         }
         LastSellPrice_Hilo = FindLastSellPrice_Hilo();
         gi_360 = FALSE;
         gi_376 = TRUE;
      } else {
         if (gi_364&&blazer1) {
            gi_332 = Trades_Hilo;
            gd_336 = NormalizeDouble(ld_144 * MathPow(LotExponent, gi_332), lotdecimal);
            gi_372 = OpenPendingOrder_Hilo(0, gd_336, Ask, slip, Bid, 0, 0, gs_blazer1_316 + "-" + string(gi_332), MagicNumber_Hilo, 0, Lime);
            if (gi_372 < 0) {
               Print("Error: ", GetLastError());
               return ;
            }
            LastBuyPrice_Hilo = FindLastBuyPrice_Hilo();
            gi_360 = FALSE;
            gi_376 = TRUE;
         }
      }
   }
   if (gi_360 && Trades_Hilo < 1&&blazer1) {
      l_ihigh_112 = iHigh(Symbol(), PERIOD_H4, 1);
      l_ilow_120 = iLow(Symbol(), PERIOD_H4, 2);
      //g_bid_272 = Bid;
      //g_ask_280 = Ask;
      if (!gi_368 && !gi_364) {
         gi_332 = Trades_Hilo;
         gd_336 = NormalizeDouble(ld_144 * MathPow(LotExponent, gi_332), lotdecimal);
         if (l_ihigh_112 > l_ilow_120) {
            if (iRSI(NULL, PERIOD_H1, 14, PRICE_CLOSE, 1) > 30.0) {
               gi_372 = OpenPendingOrder_Hilo(1, gd_336, Bid, slip, Bid, 0, 0, gs_blazer1_316 + "-" + string(gi_332), MagicNumber_Hilo, 0, HotPink);
               if (gi_372 < 0) {
                  Print("Error: ", GetLastError());
                  return ;
               }
               LastBuyPrice_Hilo = FindLastBuyPrice_Hilo();
               gi_376 = TRUE;
            }
         } else {
            if (iRSI(NULL, PERIOD_H1, 14, PRICE_CLOSE, 1) < 70.0) {
               gi_372 = OpenPendingOrder_Hilo(0, gd_336, Ask, slip, Ask, 0, 0, gs_blazer1_316 + "-" + string(gi_332), MagicNumber_Hilo, 0, Lime);
               if (gi_372 < 0) {
                  Print("Error: ", GetLastError());
                  return ;
               }
               LastSellPrice_Hilo = FindLastSellPrice_Hilo();
               gi_376 = TRUE;
            }
         }
         if (gi_372 > 0) gi_328 = TimeCurrent() + 60.0 * (60.0 * gd_188);
         gi_360 = FALSE;
      }
   }
   Trades_Hilo = CountTrades_Hilo();
   g_price_264 = 0;
   double ld_1136 = 0;
   for (g_pos_344 = OrdersTotal() - 1; g_pos_344 >= 0; g_pos_344--) {
      if( !OrderSelect(g_pos_344, SELECT_BY_POS, MODE_TRADES) ){ continue; }
      if (OrderSymbol() != Symbol() || OrderMagicNumber() != MagicNumber_Hilo) continue;
      if (OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber_Hilo) {
         if (OrderType() == OP_BUY || OrderType() == OP_SELL) {
            g_price_264 += OrderOpenPrice() * OrderLots();
            ld_1136 += OrderLots();
         }
      }
   }
   if (Trades_Hilo > 0) g_price_264 = NormalizeDouble(g_price_264 / ld_1136, Digits);
   if (gi_376) {
      for (g_pos_344 = OrdersTotal() - 1; g_pos_344 >= 0; g_pos_344--) {
         if( !OrderSelect(g_pos_344, SELECT_BY_POS, MODE_TRADES) ){ continue; }
         if (OrderSymbol() != Symbol() || OrderMagicNumber() != MagicNumber_Hilo) continue;
         if (OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber_Hilo) {
            if (OrderType() == OP_BUY) {
               g_price_216 = g_price_264 + TakeProfit * Point;
               //gd_unused_232 = g_price_216;
               gd_352 = g_price_264 - g_pips_196 * Point;
               gi_312 = TRUE;
            }
         }
         if (OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber_Hilo) {
            if (OrderType() == OP_SELL) {
               g_price_216 = g_price_264 - TakeProfit * Point;
               //gd_unused_240 = g_price_216;
               gd_352 = g_price_264 + g_pips_196 * Point;
               gi_312 = TRUE;
            }
         }
      }
   }
   if (gi_376) {
      if (gi_312 == TRUE) {
         for (g_pos_344 = OrdersTotal() - 1; g_pos_344 >= 0; g_pos_344--) {
            if( !OrderSelect(g_pos_344, SELECT_BY_POS, MODE_TRADES) ){ continue; }
            if (OrderSymbol() != Symbol() || OrderMagicNumber() != MagicNumber_Hilo) continue;
            if (OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber_Hilo && CanModify(OrderTicket()) ) {
               ResetLastError();
               //while (!OrderModify(OrderTicket(), g_price_264, OrderStopLoss(), g_price_216, 0, Yellow)) {
               while (true) {
                  foo=OrderModify(OrderTicket(), g_price_264, OrderStopLoss(), g_price_216, 0, Yellow);
                  foo=GetLastError();
                  if( foo==0 || foo==1 || foo==4000 || foo==4108){ break; }
                  ShowError(foo, "Loop");
                  Sleep(1000);
                  RefreshRates();                  
                  // Caso a ordem já está fechada, interrompe loop
                  // Pois não tem porque modificá-la 
                  if( !CanModify(OrderTicket()) ){ break; }
               }
            }
            gi_376 = FALSE;
         }
      }
   }
   /*
   if (MM_Active == TRUE) {
      if (MathCeil(AccountBalance()) < 200000.0) ld_152 = Lots;
      else ld_152 = 0.00001 * MathCeil(AccountBalance());
   } else ld_152 = Lots;
   */
   ld_152 = DefineLot();
      
   if (UseTrailingStop) TrailingAlls_15(TrailStart, TrailStop, g_price_476);
   if (gi_420) {
      if (TimeCurrent() >= gi_540) {
         CloseThisSymbolAll_15();
         Print("Closed All due to TimeOut");
      }
   }
   if (gi_536 != Time[0]) {
      gi_536 = Time[0];
      ld_160 = CalculateProfit_15();
      if (UseEquityStop) {
         if (ld_160 < 0.0 && MathAbs(ld_160) > TotalEquityRisk / 100.0 * AccountEquityHigh_15()) {
           // CloseThisSymbolAll_15();
           // Print("Closed All due to Stop Out");
           // gi_588 = FALSE;
           return;
         }
      }
      gi_560 = CountTrades_15();
      if (gi_560 == 0) gi_524 = FALSE;
      for (g_pos_556 = OrdersTotal() - 1; g_pos_556 >= 0; g_pos_556--) {
         if( !OrderSelect(g_pos_556, SELECT_BY_POS, MODE_TRADES) ){ continue; }
         if (OrderSymbol() != Symbol() || OrderMagicNumber() != g_magic_176_15) continue;
         if (OrderSymbol() == Symbol() && OrderMagicNumber() == g_magic_176_15) {
            if (OrderType() == OP_BUY) {
               gi_576 = TRUE;
               gi_580 = FALSE;
               break;
            }
         }
         if (OrderSymbol() == Symbol() && OrderMagicNumber() == g_magic_176_15) {
            if (OrderType() == OP_SELL) {
               gi_576 = FALSE;
               gi_580 = TRUE;
               break;
            }
         }
      }
      if (gi_560 > 0 && gi_560 <= MaxTrades_15) {
         RefreshRates();
         gd_500 = FindLastBuyPrice_15();
         gd_508 = FindLastSellPrice_15();
         if (gi_576 && gd_500 - Ask >= PipStep * Point && SinalOp > 0) gi_572 = TRUE;
         if (gi_580 && Bid - gd_508 >= PipStep * Point && SinalOp < 0) gi_572 = TRUE;
      }
      if (gi_560 < 1) {
         gi_580 = FALSE;
         gi_576 = FALSE;
         gi_572 = TRUE;
         gd_452 = AccountEquity();
      }
      if (gi_572&&blazer2) {
         gd_500 = FindLastBuyPrice_15();
         gd_508 = FindLastSellPrice_15();
         if (gi_580) {
            gi_544 = gi_560;
            gd_548 = NormalizeDouble(ld_152 * MathPow(LotExponent, gi_544), lotdecimal);
            RefreshRates();
            gi_584 = OpenPendingOrder_15(1, gd_548, Bid, slip, Ask, 0, 0, gs_blazer2_528 + "-" + string(gi_544), g_magic_176_15, 0, HotPink);
            if (gi_584 < 0) {
               Print("Error: ", GetLastError());
               return ;
            }
            gd_508 = FindLastSellPrice_15();
            gi_572 = FALSE;
            gi_588 = TRUE;
         } else {
            if (gi_576&&blazer2) {
               gi_544 = gi_560;
               gd_548 = NormalizeDouble(ld_152 * MathPow(LotExponent, gi_544), lotdecimal);
               gi_584 = OpenPendingOrder_15(0, gd_548, Ask, slip, Bid, 0, 0, gs_blazer2_528 + "-" + string(gi_544), g_magic_176_15, 0, Lime);
               if (gi_584 < 0) {
                  Print("Error: ", GetLastError());
                  return ;
               }
               gd_500 = FindLastBuyPrice_15();
               gi_572 = FALSE;
               gi_588 = TRUE;
            }
         }
      }
   }
   if (g_datetime_608 != iTime(NULL, g_timeframe_408, 0)) {
      l_ord_total_168 = OrdersTotal();
      l_count_172 = 0;
      for (int li_1212 = l_ord_total_168; li_1212 >= 1; li_1212--) {
         if( !OrderSelect(li_1212 - 1, SELECT_BY_POS, MODE_TRADES) ){ continue; }
         if (OrderSymbol() != Symbol() || OrderMagicNumber() != g_magic_176_15) continue;
         if (OrderSymbol() == Symbol() && OrderMagicNumber() == g_magic_176_15) l_count_172++;
      }
      if ( (l_ord_total_168 == 0 || l_count_172 < 1) && blazer2) {
         l_iclose_128 = iClose(Symbol(), 0, 2);
         l_iclose_136 = iClose(Symbol(), 0, 1);
         g_bid_484 = Bid;
         g_ask_492 = Ask;
         gi_544 = gi_560;
         gd_548 = ld_152;
         if (l_iclose_128 > l_iclose_136) {
            gi_584 = OpenPendingOrder_15(1, gd_548, g_bid_484, slip, g_bid_484, 0, 0, gs_blazer2_528 + "-" + string(gi_544), g_magic_176_15, 0, HotPink);
            if (gi_584 < 0) {
               Print("Error: ", GetLastError());
               return ;
            }
            gd_500 = FindLastBuyPrice_15();
            gi_588 = TRUE;
         } else {
            gi_584 = OpenPendingOrder_15(0, gd_548, g_ask_492, slip, g_ask_492, 0, 0, gs_blazer2_528 + "-" + string(gi_544), g_magic_176_15, 0, Lime);
            if (gi_584 < 0) {
               Print("Error: ", GetLastError());
               return ;
            }
            gd_508 = FindLastSellPrice_15();
            gi_588 = TRUE;
         }
         if (gi_584 > 0) gi_540 = TimeCurrent() + 60.0 * (60.0 * gd_424);
         gi_572 = FALSE;
      }
      g_datetime_608 = iTime(NULL, g_timeframe_408, 0);
   }
   gi_560 = CountTrades_15();
   g_price_476 = 0;
   double ld_1216 = 0;
   for (g_pos_556 = OrdersTotal() - 1; g_pos_556 >= 0; g_pos_556--) {
      if( !OrderSelect(g_pos_556, SELECT_BY_POS, MODE_TRADES) ){ continue; }
      if (OrderSymbol() != Symbol() || OrderMagicNumber() != g_magic_176_15) continue;
      if (OrderSymbol() == Symbol() && OrderMagicNumber() == g_magic_176_15) {
         if (OrderType() == OP_BUY || OrderType() == OP_SELL) {
            g_price_476 += OrderOpenPrice() * OrderLots();
            ld_1216 += OrderLots();
         }
      }
   }
   if (gi_560 > 0) g_price_476 = NormalizeDouble(g_price_476 / ld_1216, Digits);
   if (gi_588) {
      for (g_pos_556 = OrdersTotal() - 1; g_pos_556 >= 0; g_pos_556--) {
         if( !OrderSelect(g_pos_556, SELECT_BY_POS, MODE_TRADES) ){ continue; }
         if (OrderSymbol() != Symbol() || OrderMagicNumber() != g_magic_176_15) continue;
         if (OrderSymbol() == Symbol() && OrderMagicNumber() == g_magic_176_15) {
            if (OrderType() == OP_BUY) {
               g_price_444 = g_price_476 + TakeProfit * Point;
               //gd_unused_460 = g_price_444;
               gd_564 = g_price_476 - g_pips_412 * Point;
               gi_524 = TRUE;
            }
         }
         if (OrderSymbol() == Symbol() && OrderMagicNumber() == g_magic_176_15) {
            if (OrderType() == OP_SELL) {
               g_price_444 = g_price_476 - TakeProfit * Point;
               //gd_unused_468 = g_price_444;
               gd_564 = g_price_476 + g_pips_412 * Point;
               gi_524 = TRUE;
            }
         }
      }
   }
   if (gi_588) {
      if (gi_524 == TRUE) {
         for (g_pos_556 = OrdersTotal() - 1; g_pos_556 >= 0; g_pos_556--) {
            if( !OrderSelect(g_pos_556, SELECT_BY_POS, MODE_TRADES) ){ continue; }
            if (OrderSymbol() != Symbol() || OrderMagicNumber() != g_magic_176_15) continue;
            if (OrderSymbol() == Symbol() && OrderMagicNumber() == g_magic_176_15 && CanModify(OrderTicket()) ) {
               ResetLastError();
               //while (!OrderModify(OrderTicket(), g_price_476, OrderStopLoss(), g_price_444, 0, Yellow)) {
               while (true) {
                  foo=OrderModify(OrderTicket(), g_price_476, OrderStopLoss(), g_price_444, 0, Yellow);
                  foo=GetLastError();
                  if( foo==0 || foo==1 || foo==4000 || foo==4108){ break; }
                  ShowError(foo, "Loop");
                  Sleep(1000);
                  RefreshRates();
                  // Caso a ordem já está fechada, interrompe loop
                  // Pois não tem porque modificá-la 
                  if( !CanModify(OrderTicket()) ){ break; }
               }
            }
            gi_588 = FALSE;
         }
      }
   }
   /*
   if (MM_Active == TRUE) {
      if (MathCeil(AccountBalance()) < 200000.0) ld_176 = Lots;
      else ld_176 = 0.00001 * MathCeil(AccountBalance());
   } else ld_176 = Lots;
   */
   ld_176 = DefineLot();
   
   if (UseTrailingStop) TrailingAlls_16(TrailStart, TrailStop, g_price_692);
   if (gi_636) {
      if (TimeCurrent() >= gi_756) {
         CloseThisSymbolAll_16();
         Print("Closed All due to TimeOut");
      }
   }
   if (gi_752 != Time[0]) {
      gi_752 = Time[0];
      ld_184 = CalculateProfit_16();
      if (UseEquityStop) {
         if (ld_184 < 0.0 && MathAbs(ld_184) > TotalEquityRisk / 100.0 * AccountEquityHigh_16()) {
           // CloseThisSymbolAll_16();
           // Print("Closed All due to Stop Out");
           // gi_804 = FALSE;
            return;
         }
      }
      gi_776 = CountTrades_16();
      if (gi_776 == 0) gi_740 = FALSE;
      for (g_pos_772 = OrdersTotal() - 1; g_pos_772 >= 0; g_pos_772--) {
         if( !OrderSelect(g_pos_772, SELECT_BY_POS, MODE_TRADES) ){ continue; }
         if (OrderSymbol() != Symbol() || OrderMagicNumber() != g_magic_176_16) continue;
         if (OrderSymbol() == Symbol() && OrderMagicNumber() == g_magic_176_16) {
            if (OrderType() == OP_BUY) {
               gi_792 = TRUE;
               gi_796 = FALSE;
               break;
            }
         }
         if (OrderSymbol() == Symbol() && OrderMagicNumber() == g_magic_176_16) {
            if (OrderType() == OP_SELL) {
               gi_792 = FALSE;
               gi_796 = TRUE;
               break;
            }
         }
      }
      if (gi_776 > 0 && gi_776 <= MaxTrades_16) {
         RefreshRates();
         gd_716 = FindLastBuyPrice_16();
         gd_724 = FindLastSellPrice_16();
         if (gi_792 && gd_716 - Ask >= PipStep * Point && SinalOp > 0) gi_788 = TRUE;
         if (gi_796 && Bid - gd_724 >= PipStep * Point && SinalOp < 0) gi_788 = TRUE;
      }
      if (gi_776 < 1) {
         gi_796 = FALSE;
         gi_792 = FALSE;
         gd_668 = AccountEquity();
      }
      if (gi_788) {
         gd_716 = FindLastBuyPrice_16();
         gd_724 = FindLastSellPrice_16();
         if (gi_796&&blazer3) {
            gi_760 = gi_776;
            gd_764 = NormalizeDouble(ld_176 * MathPow(LotExponent, gi_760), lotdecimal);
            RefreshRates();
            gi_800 = OpenPendingOrder_16(1, gd_764, Bid, slip, Ask, 0, 0, gs_blazer3_744 + "-" + string(gi_760), g_magic_176_16, 0, HotPink);
            if (gi_800 < 0) {
               Print("Error: ", GetLastError());
               return ;
            }
            gd_724 = FindLastSellPrice_16();
            gi_788 = FALSE;
            gi_804 = TRUE;
         } else {
            if (gi_792&&blazer3) {
               gi_760 = gi_776;
               gd_764 = NormalizeDouble(ld_176 * MathPow(LotExponent, gi_760), lotdecimal);
               gi_800 = OpenPendingOrder_16(0, gd_764, Ask, slip, Bid, 0, 0, gs_blazer3_744 + "-" + string(gi_760), g_magic_176_16, 0, Lime);
               if (gi_800 < 0) {
                  Print("Error: ", GetLastError());
                  return ;
               }
               gd_716 = FindLastBuyPrice_16();
               gi_788 = FALSE;
               gi_804 = TRUE;
            }
         }
      }
   }
   if (g_datetime_824 != iTime(NULL, g_timeframe_624, 0)) {
      l_ord_total_192 = OrdersTotal();
      l_count_196 = 0;
      for (int li_1292 = l_ord_total_192; li_1292 >= 1; li_1292--) {
         if( !OrderSelect(li_1292 - 1, SELECT_BY_POS, MODE_TRADES) ){ continue; }
         if (OrderSymbol() != Symbol() || OrderMagicNumber() != g_magic_176_16) continue;
         if (OrderSymbol() == Symbol() && OrderMagicNumber() == g_magic_176_16) l_count_196++;
      }
      if ( (l_ord_total_192 == 0 || l_count_196 < 1) && blazer3) {
         l_iclose_128 = iClose(Symbol(), 0, 2);
         l_iclose_136 = iClose(Symbol(), 0, 1);
         g_bid_700 = Bid;
         g_ask_708 = Ask;
         gi_760 = gi_776;
         gd_764 = ld_176;
         if (l_iclose_128 > l_iclose_136) {
            if (iRSI(NULL, PERIOD_H1, 14, PRICE_CLOSE, 1) > 30.0) {
               gi_800 = OpenPendingOrder_16(1, gd_764, g_bid_700, slip, g_bid_700, 0, 0, gs_blazer3_744 + "-" + string(gi_760), g_magic_176_16, 0, HotPink);
               if (gi_800 < 0) {
                  Print("Error: ", GetLastError());
                  return ;
               }
               gd_716 = FindLastBuyPrice_16();
               gi_804 = TRUE;
            }
         } else {
            if (iRSI(NULL, PERIOD_H1, 14, PRICE_CLOSE, 1) < 70.0) {
               gi_800 = OpenPendingOrder_16(0, gd_764, g_ask_708, slip, g_ask_708, 0, 0, gs_blazer3_744 + "-" + string(gi_760), g_magic_176_16, 0, Lime);
               if (gi_800 < 0) {
                  Print("Error: ", GetLastError());
                  return ;
               }
               gd_724 = FindLastSellPrice_16();
               gi_804 = TRUE;
            }
         }
         if (gi_800 > 0) gi_756 = TimeCurrent() + 60.0 * (60.0 * gd_640);
         gi_788 = FALSE;
      }
      g_datetime_824 = iTime(NULL, g_timeframe_624, 0);
   }
   gi_776 = CountTrades_16();
   g_price_692 = 0;
   double ld_1296 = 0;
   for (g_pos_772 = OrdersTotal() - 1; g_pos_772 >= 0; g_pos_772--) {
      if( !OrderSelect(g_pos_772, SELECT_BY_POS, MODE_TRADES) ){ continue; }
      if (OrderSymbol() != Symbol() || OrderMagicNumber() != g_magic_176_16) continue;
      if (OrderSymbol() == Symbol() && OrderMagicNumber() == g_magic_176_16) {
         if (OrderType() == OP_BUY || OrderType() == OP_SELL) {
            g_price_692 += OrderOpenPrice() * OrderLots();
            ld_1296 += OrderLots();
         }
      }
   }
   if (gi_776 > 0) g_price_692 = NormalizeDouble(g_price_692 / ld_1296, Digits);
   if (gi_804) {
      for (g_pos_772 = OrdersTotal() - 1; g_pos_772 >= 0; g_pos_772--) {
         if( !OrderSelect(g_pos_772, SELECT_BY_POS, MODE_TRADES) ){ continue; }
         if (OrderSymbol() != Symbol() || OrderMagicNumber() != g_magic_176_16) continue;
         if (OrderSymbol() == Symbol() && OrderMagicNumber() == g_magic_176_16) {
            if (OrderType() == OP_BUY) {
               g_price_660 = g_price_692 + TakeProfit * Point;
               //gd_unused_676 = g_price_660;
               gd_780 = g_price_692 - g_pips_628 * Point;
               gi_740 = TRUE;
            }
         }
         if (OrderSymbol() == Symbol() && OrderMagicNumber() == g_magic_176_16) {
            if (OrderType() == OP_SELL) {
               g_price_660 = g_price_692 - TakeProfit * Point;
               //gd_unused_684 = g_price_660;
               gd_780 = g_price_692 + g_pips_628 * Point;
               gi_740 = TRUE;
            }
         }
      }
   }
   if (gi_804) {
      if (gi_740 == TRUE) {
         for (g_pos_772 = OrdersTotal() - 1; g_pos_772 >= 0; g_pos_772--) {
            if( !OrderSelect(g_pos_772, SELECT_BY_POS, MODE_TRADES) ){ continue; }
            if (OrderSymbol() != Symbol() || OrderMagicNumber() != g_magic_176_16) continue;
            if (OrderSymbol() == Symbol() && OrderMagicNumber() == g_magic_176_16 && CanModify(OrderTicket()) ) {
               ResetLastError();
               //while (!OrderModify(OrderTicket(), g_price_692, OrderStopLoss(), g_price_660, 0, Yellow)) {
               while (true) {
                  foo=OrderModify(OrderTicket(), g_price_692, OrderStopLoss(), g_price_660, 0, Yellow);
                  foo=GetLastError();
                  if( foo==0 || foo==1 || foo==4000 || foo==4108){ break; }
                  ShowError(foo, "Loop");
                  Sleep(1000);
                  RefreshRates();
                  // Caso a ordem já está fechada, interrompe loop
                  // Pois não tem porque modificá-la 
                  if( !CanModify(OrderTicket()) ){ break; }
               }
            }
            gi_804 = FALSE;
         }
      }
   }
   return ;
}

int CountTrades_Hilo() {
   int l_count_0 = 0;
   for (int l_pos_4 = OrdersTotal() - 1; l_pos_4 >= 0; l_pos_4--) {
      if( !OrderSelect(l_pos_4, SELECT_BY_POS, MODE_TRADES) ){ continue; }
      if (OrderSymbol() != Symbol() || OrderMagicNumber() != MagicNumber_Hilo) continue;
      if (OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber_Hilo)
         if (OrderType() == OP_SELL || OrderType() == OP_BUY) l_count_0++;
   }
   return (l_count_0);
}

void CloseThisSymbolAll_Hilo() {
   bool foo=false;
   for (int l_pos_0 = OrdersTotal() - 1; l_pos_0 >= 0; l_pos_0--) {
      if( !OrderSelect(l_pos_0, SELECT_BY_POS, MODE_TRADES) ){ continue; }
      if (OrderSymbol() == Symbol()) {
         if (OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber_Hilo) {
            if (OrderType() == OP_BUY) 
               foo=OrderClose(OrderTicket(), OrderLots(), Bid, g_slippage_204, Blue);
               
            if (OrderType() == OP_SELL) 
               foo=OrderClose(OrderTicket(), OrderLots(), Ask, g_slippage_204, Red);
         }
         Sleep(1000);
      }
   }
}

int OpenPendingOrder_Hilo(int ai_0, double a_lots_4, double ad_unused_12, int a_slippage_20, double ad_unused_24, int ai_32, int ai_36, string a_comment_40, int a_magic_48, int a_datetime_52, color a_color_56) {
   int l_ticket_60 = 0;
   int l_error_64 = 0;
   int l_count_68 = 0;
   int li_72 = 100;
   switch (ai_0) {
   case 0:
      for (l_count_68 = 0; l_count_68 < li_72; l_count_68++) {
         RefreshRates();
         l_ticket_60 = OrderSend(Symbol(), OP_BUY, a_lots_4, Ask, a_slippage_20, StopLong_Hilo(Bid, ai_32), TakeLong_Hilo(Ask, ai_36), a_comment_40, a_magic_48, a_datetime_52, a_color_56);
         l_error_64 = GetLastError();
         if (l_error_64 == 0/* NO_ERROR */) break;
         if (!((l_error_64 == 4/* SERVER_BUSY */ || l_error_64 == 137/* BROKER_BUSY */ || l_error_64 == 146/* TRADE_CONTEXT_BUSY */ || l_error_64 == 136/* OFF_QUOTES */))) break;
         Sleep(5000);
      }
      break;
   case 1:
      for (l_count_68 = 0; l_count_68 < li_72; l_count_68++) {
         l_ticket_60 = OrderSend(Symbol(), OP_SELL, a_lots_4, Bid, a_slippage_20, StopShort_Hilo(Ask, ai_32), TakeShort_Hilo(Bid, ai_36), a_comment_40, a_magic_48, a_datetime_52, a_color_56);
         l_error_64 = GetLastError();
         if (l_error_64 == 0/* NO_ERROR */) break;
         if (!((l_error_64 == 4/* SERVER_BUSY */ || l_error_64 == 137/* BROKER_BUSY */ || l_error_64 == 146/* TRADE_CONTEXT_BUSY */ || l_error_64 == 136/* OFF_QUOTES */))) break;
         Sleep(5000);
      }
   }
   return (l_ticket_60);
}

double StopLong_Hilo(double ad_0, int ai_8) {
   if (ai_8 == 0) return (0);
   return (ad_0 - ai_8 * Point);
}

double StopShort_Hilo(double ad_0, int ai_8) {
   if (ai_8 == 0) return (0);
   return (ad_0 + ai_8 * Point);
}

double TakeLong_Hilo(double ad_0, int ai_8) {
   if (ai_8 == 0) return (0);
   return (ad_0 + ai_8 * Point);
}

double TakeShort_Hilo(double ad_0, int ai_8) {
   if (ai_8 == 0) return (0);
   return (ad_0 - ai_8 * Point);
}

double CalculateProfit_Hilo() {
   double ld_ret_0 = 0;
   for (g_pos_344 = OrdersTotal() - 1; g_pos_344 >= 0; g_pos_344--) {
      if( !OrderSelect(g_pos_344, SELECT_BY_POS, MODE_TRADES) ){ continue; }
      if (OrderSymbol() != Symbol() || OrderMagicNumber() != MagicNumber_Hilo) continue;
      if (OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber_Hilo)
         if (OrderType() == OP_BUY || OrderType() == OP_SELL) ld_ret_0 += OrderProfit();
   }
   return (ld_ret_0);
}

void TrailingAlls_Hilo(int ai_0, int ai_4, double a_price_8) {
   int li_16;
   double l_ord_stoploss_20;
   double l_price_28;
   bool foo=false;
   if (ai_4 != 0) {
      for (int l_pos_36 = OrdersTotal() - 1; l_pos_36 >= 0; l_pos_36--) {
         if (OrderSelect(l_pos_36, SELECT_BY_POS, MODE_TRADES)) {
            if (OrderSymbol() != Symbol() || OrderMagicNumber() != MagicNumber_Hilo) continue;
            if (OrderSymbol() == Symbol() || OrderMagicNumber() == MagicNumber_Hilo) {
               if (OrderType() == OP_BUY) {
                  li_16 = NormalizeDouble((Bid - a_price_8) / Point, 0);
                  if (li_16 < ai_0) continue;
                  l_ord_stoploss_20 = OrderStopLoss();
                  l_price_28 = Bid - ai_4 * Point;
                  if (l_ord_stoploss_20 == 0.0 || (l_ord_stoploss_20 != 0.0 && l_price_28 > l_ord_stoploss_20)) {
                     // Somente ajustar a ordem se ela estiver aberta
                     if( CanModify(OrderTicket()) ){
                        ResetLastError();
                        foo=OrderModify(OrderTicket(), a_price_8, l_price_28, OrderTakeProfit(), 0, Aqua);
                        if(!foo){ ShowError(GetLastError(), "Normal"); }
                     }
                  }
               }
               if (OrderType() == OP_SELL) {
                  li_16 = NormalizeDouble((a_price_8 - Ask) / Point, 0);
                  if (li_16 < ai_0) continue;
                  l_ord_stoploss_20 = OrderStopLoss();
                  l_price_28 = Ask + ai_4 * Point;
                  if (l_ord_stoploss_20 == 0.0 || (l_ord_stoploss_20 != 0.0 && l_price_28 < l_ord_stoploss_20)){
                     // Somente ajustar a ordem se ela estiver aberta
                     if( CanModify(OrderTicket()) ){
                        ResetLastError();
                        foo=OrderModify(OrderTicket(), a_price_8, l_price_28, OrderTakeProfit(), 0, Red);
                        if(!foo){ ShowError(GetLastError(), "Normal"); }
                     }
                  }
               }
            }
            Sleep(1000);
         }
      }
   }
}

double AccountEquityHigh_Hilo() {
   if (CountTrades_Hilo() == 0) gd_380 = AccountEquity();
   if (gd_380 < gd_388) gd_380 = gd_388;
   else gd_380 = AccountEquity();
   gd_388 = AccountEquity();
   return (gd_380);
}

double FindLastBuyPrice_Hilo() {
   double l_ord_open_price_0;
   int l_ticket_8;
   //double ld_unused_12 = 0;
   int l_ticket_20 = 0;
   for (int l_pos_24 = OrdersTotal() - 1; l_pos_24 >= 0; l_pos_24--) {
      if( !OrderSelect(l_pos_24, SELECT_BY_POS, MODE_TRADES) ){ continue; }
      if (OrderSymbol() != Symbol() || OrderMagicNumber() != MagicNumber_Hilo) continue;
      if (OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber_Hilo && OrderType() == OP_BUY) {
         l_ticket_8 = OrderTicket();
         if (l_ticket_8 > l_ticket_20) {
            l_ord_open_price_0 = OrderOpenPrice();
            //ld_unused_12 = l_ord_open_price_0;
            l_ticket_20 = l_ticket_8;
         }
      }
   }
   return (l_ord_open_price_0);
}

double FindLastSellPrice_Hilo() {
   double l_ord_open_price_0;
   int l_ticket_8;
   //double ld_unused_12 = 0;
   int l_ticket_20 = 0;
   for (int l_pos_24 = OrdersTotal() - 1; l_pos_24 >= 0; l_pos_24--) {
      if( !OrderSelect(l_pos_24, SELECT_BY_POS, MODE_TRADES) ){ continue; }
      if (OrderSymbol() != Symbol() || OrderMagicNumber() != MagicNumber_Hilo) continue;
      if (OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber_Hilo && OrderType() == OP_SELL) {
         l_ticket_8 = OrderTicket();
         if (l_ticket_8 > l_ticket_20) {
            l_ord_open_price_0 = OrderOpenPrice();
            //ld_unused_12 = l_ord_open_price_0;
            l_ticket_20 = l_ticket_8;
         }
      }
   }
   return (l_ord_open_price_0);
}

int CountTrades_15() {
   int l_count_0 = 0;
   for (int l_pos_4 = OrdersTotal() - 1; l_pos_4 >= 0; l_pos_4--) {
      if( !OrderSelect(l_pos_4, SELECT_BY_POS, MODE_TRADES) ){ continue; }
      if (OrderSymbol() != Symbol() || OrderMagicNumber() != g_magic_176_15) continue;
      if (OrderSymbol() == Symbol() && OrderMagicNumber() == g_magic_176_15)
         if (OrderType() == OP_SELL || OrderType() == OP_BUY) l_count_0++;
   }
   return (l_count_0);
}

void CloseThisSymbolAll_15() {
   bool foo=false;
   for (int l_pos_0 = OrdersTotal() - 1; l_pos_0 >= 0; l_pos_0--) {
      if( !OrderSelect(l_pos_0, SELECT_BY_POS, MODE_TRADES) ){ continue; }
      if (OrderSymbol() == Symbol()) {
         if (OrderSymbol() == Symbol() && OrderMagicNumber() == g_magic_176_15) {
            if (OrderType() == OP_BUY)
               foo=OrderClose(OrderTicket(), OrderLots(), Bid, g_slippage_432, Blue);
               
            if (OrderType() == OP_SELL) 
               foo=OrderClose(OrderTicket(), OrderLots(), Ask, g_slippage_432, Red);
         }
         Sleep(1000);
      }
   }
}

int OpenPendingOrder_15(int ai_0, double a_lots_4, double ad_unused_12, int a_slippage_20, double ad_unused_24, int ai_32, int ai_36, string a_comment_40, int a_magic_48, int a_datetime_52, color a_color_56) {
   int l_ticket_60 = 0;
   int l_error_64 = 0;
   int l_count_68 = 0;
   int li_72 = 100;
   switch (ai_0) {
   case 0:
      for (l_count_68 = 0; l_count_68 < li_72; l_count_68++) {
         RefreshRates();
         l_ticket_60 = OrderSend(Symbol(), OP_BUY, a_lots_4, Ask, a_slippage_20, StopLong_15(Bid, ai_32), TakeLong_15(Ask, ai_36), a_comment_40, a_magic_48, a_datetime_52, a_color_56);
         l_error_64 = GetLastError();
         if (l_error_64 == 0/* NO_ERROR */) break;
         if (!((l_error_64 == 4/* SERVER_BUSY */ || l_error_64 == 137/* BROKER_BUSY */ || l_error_64 == 146/* TRADE_CONTEXT_BUSY */ || l_error_64 == 136/* OFF_QUOTES */))) break;
         Sleep(5000);
      }
      break;
   case 1:
      for (l_count_68 = 0; l_count_68 < li_72; l_count_68++) {
         l_ticket_60 = OrderSend(Symbol(), OP_SELL, a_lots_4, Bid, a_slippage_20, StopShort_15(Ask, ai_32), TakeShort_15(Bid, ai_36), a_comment_40, a_magic_48, a_datetime_52, a_color_56);
         l_error_64 = GetLastError();
         if (l_error_64 == 0/* NO_ERROR */) break;
         if (!((l_error_64 == 4/* SERVER_BUSY */ || l_error_64 == 137/* BROKER_BUSY */ || l_error_64 == 146/* TRADE_CONTEXT_BUSY */ || l_error_64 == 136/* OFF_QUOTES */))) break;
         Sleep(5000);
      }
   }
   return (l_ticket_60);
}

double StopLong_15(double ad_0, int ai_8) {
   if (ai_8 == 0) return (0);
   return (ad_0 - ai_8 * Point);
}

double StopShort_15(double ad_0, int ai_8) {
   if (ai_8 == 0) return (0);
   return (ad_0 + ai_8 * Point);
}

double TakeLong_15(double ad_0, int ai_8) {
   if (ai_8 == 0) return (0);
   return (ad_0 + ai_8 * Point);
}

double TakeShort_15(double ad_0, int ai_8) {
   if (ai_8 == 0) return (0);
   return (ad_0 - ai_8 * Point);
}

double CalculateProfit_15() {
   double ld_ret_0 = 0;
   for (g_pos_556 = OrdersTotal() - 1; g_pos_556 >= 0; g_pos_556--) {
      if( !OrderSelect(g_pos_556, SELECT_BY_POS, MODE_TRADES) ){ continue; }
      if (OrderSymbol() != Symbol() || OrderMagicNumber() != g_magic_176_15) continue;
      if (OrderSymbol() == Symbol() && OrderMagicNumber() == g_magic_176_15)
         if (OrderType() == OP_BUY || OrderType() == OP_SELL) ld_ret_0 += OrderProfit();
   }
   return (ld_ret_0);
}

void TrailingAlls_15(int ai_0, int ai_4, double a_price_8) {
   int li_16;
   double l_ord_stoploss_20;
   double l_price_28;
   bool foo=false;
   if (ai_4 != 0) {
      for (int l_pos_36 = OrdersTotal() - 1; l_pos_36 >= 0; l_pos_36--) {
         if (OrderSelect(l_pos_36, SELECT_BY_POS, MODE_TRADES)) {
            if (OrderSymbol() != Symbol() || OrderMagicNumber() != g_magic_176_15) continue;
            if (OrderSymbol() == Symbol() || OrderMagicNumber() == g_magic_176_15) {
               if (OrderType() == OP_BUY) {
                  li_16 = NormalizeDouble((Bid - a_price_8) / Point, 0);
                  if (li_16 < ai_0) continue;
                  l_ord_stoploss_20 = OrderStopLoss();
                  l_price_28 = Bid - ai_4 * Point;
                  if (l_ord_stoploss_20 == 0.0 || (l_ord_stoploss_20 != 0.0 && l_price_28 > l_ord_stoploss_20)){ 
                     // Somente ajustar a ordem se ela estiver aberta
                     if( CanModify(OrderTicket()) ){
                        ResetLastError();
                        foo=OrderModify(OrderTicket(), a_price_8, l_price_28, OrderTakeProfit(), 0, Aqua);
                        if(!foo){ ShowError(GetLastError(), "Normal"); }
                     }
                  }
               }
               if (OrderType() == OP_SELL) {
                  li_16 = NormalizeDouble((a_price_8 - Ask) / Point, 0);
                  if (li_16 < ai_0) continue;
                  l_ord_stoploss_20 = OrderStopLoss();
                  l_price_28 = Ask + ai_4 * Point;
                  if (l_ord_stoploss_20 == 0.0 || (l_ord_stoploss_20 != 0.0 && l_price_28 < l_ord_stoploss_20)){
                     // Somente ajustar a ordem se ela estiver aberta
                     if( CanModify(OrderTicket()) ){
                        ResetLastError();
                        foo=OrderModify(OrderTicket(), a_price_8, l_price_28, OrderTakeProfit(), 0, Red);
                        if(!foo){ ShowError(GetLastError(), "Normal"); }
                     }
                  }
               }
            }
            Sleep(1000);
         }
      }
   }
}

double AccountEquityHigh_15() {
   if (CountTrades_15() == 0) gd_592 = AccountEquity();
   if (gd_592 < gd_600) gd_592 = gd_600;
   else gd_592 = AccountEquity();
   gd_600 = AccountEquity();
   return (gd_592);
}

double FindLastBuyPrice_15() {
   double l_ord_open_price_0;
   int l_ticket_8;
   //double ld_unused_12 = 0;
   int l_ticket_20 = 0;
   for (int l_pos_24 = OrdersTotal() - 1; l_pos_24 >= 0; l_pos_24--) {
      if( !OrderSelect(l_pos_24, SELECT_BY_POS, MODE_TRADES) ){ continue; }
      if (OrderSymbol() != Symbol() || OrderMagicNumber() != g_magic_176_15) continue;
      if (OrderSymbol() == Symbol() && OrderMagicNumber() == g_magic_176_15 && OrderType() == OP_BUY) {
         l_ticket_8 = OrderTicket();
         if (l_ticket_8 > l_ticket_20) {
            l_ord_open_price_0 = OrderOpenPrice();
            //ld_unused_12 = l_ord_open_price_0;
            l_ticket_20 = l_ticket_8;
         }
      }
   }
   return (l_ord_open_price_0);
}

double FindLastSellPrice_15() {
   double l_ord_open_price_0;
   int l_ticket_8;
   //double ld_unused_12 = 0;
   int l_ticket_20 = 0;
   for (int l_pos_24 = OrdersTotal() - 1; l_pos_24 >= 0; l_pos_24--) {
      if( !OrderSelect(l_pos_24, SELECT_BY_POS, MODE_TRADES) ){ continue; }
      if (OrderSymbol() != Symbol() || OrderMagicNumber() != g_magic_176_15) continue;
      if (OrderSymbol() == Symbol() && OrderMagicNumber() == g_magic_176_15 && OrderType() == OP_SELL) {
         l_ticket_8 = OrderTicket();
         if (l_ticket_8 > l_ticket_20) {
            l_ord_open_price_0 = OrderOpenPrice();
            //ld_unused_12 = l_ord_open_price_0;
            l_ticket_20 = l_ticket_8;
         }
      }
   }
   return (l_ord_open_price_0);
}

int CountTrades_16() {
   int l_count_0 = 0;
   for (int l_pos_4 = OrdersTotal() - 1; l_pos_4 >= 0; l_pos_4--) {
      if( !OrderSelect(l_pos_4, SELECT_BY_POS, MODE_TRADES) ){ continue; }
      if (OrderSymbol() != Symbol() || OrderMagicNumber() != g_magic_176_16) continue;
      if (OrderSymbol() == Symbol() && OrderMagicNumber() == g_magic_176_16)
         if (OrderType() == OP_SELL || OrderType() == OP_BUY) l_count_0++;
   }
   return (l_count_0);
}

void CloseThisSymbolAll_16() {
   bool foo=false;
   for (int l_pos_0 = OrdersTotal() - 1; l_pos_0 >= 0; l_pos_0--) {
      if( !OrderSelect(l_pos_0, SELECT_BY_POS, MODE_TRADES) ){ continue; }
      if (OrderSymbol() == Symbol()) {
         if (OrderSymbol() == Symbol() && OrderMagicNumber() == g_magic_176_16) {
            if (OrderType() == OP_BUY) 
               foo=OrderClose(OrderTicket(), OrderLots(), Bid, g_slippage_648, Blue);
               
            if (OrderType() == OP_SELL) 
               foo=OrderClose(OrderTicket(), OrderLots(), Ask, g_slippage_648, Red);
         }
         Sleep(1000);
      }
   }
}

int OpenPendingOrder_16(int ai_0, double a_lots_4, double ad_unused_12, int a_slippage_20, double ad_unused_24, int ai_32, int ai_36, string a_comment_40, int a_magic_48, int a_datetime_52, color a_color_56) {
   int l_ticket_60 = 0;
   int l_error_64 = 0;
   int l_count_68 = 0;
   int li_72 = 100;
   switch (ai_0) {
   case 0:
      for (l_count_68 = 0; l_count_68 < li_72; l_count_68++) {
         RefreshRates();
         l_ticket_60 = OrderSend(Symbol(), OP_BUY, a_lots_4, Ask, a_slippage_20, StopLong_16(Bid, ai_32), TakeLong_16(Ask, ai_36), a_comment_40, a_magic_48, a_datetime_52, a_color_56);
         l_error_64 = GetLastError();
         if (l_error_64 == 0/* NO_ERROR */) break;
         if (!((l_error_64 == 4/* SERVER_BUSY */ || l_error_64 == 137/* BROKER_BUSY */ || l_error_64 == 146/* TRADE_CONTEXT_BUSY */ || l_error_64 == 136/* OFF_QUOTES */))) break;
         Sleep(5000);
      }
      break;
   case 1:
      for (l_count_68 = 0; l_count_68 < li_72; l_count_68++) {
         l_ticket_60 = OrderSend(Symbol(), OP_SELL, a_lots_4, Bid, a_slippage_20, StopShort_16(Ask, ai_32), TakeShort_16(Bid, ai_36), a_comment_40, a_magic_48, a_datetime_52, a_color_56);
         l_error_64 = GetLastError();
         if (l_error_64 == 0/* NO_ERROR */) break;
         if (!((l_error_64 == 4/* SERVER_BUSY */ || l_error_64 == 137/* BROKER_BUSY */ || l_error_64 == 146/* TRADE_CONTEXT_BUSY */ || l_error_64 == 136/* OFF_QUOTES */))) break;
         Sleep(5000);
      }
   }
   return (l_ticket_60);
}

double StopLong_16(double ad_0, int ai_8) {
   if (ai_8 == 0) return (0);
   return (ad_0 - ai_8 * Point);
}

double StopShort_16(double ad_0, int ai_8) {
   if (ai_8 == 0) return (0);
   return (ad_0 + ai_8 * Point);
}

double TakeLong_16(double ad_0, int ai_8) {
   if (ai_8 == 0) return (0);
   return (ad_0 + ai_8 * Point);
}

double TakeShort_16(double ad_0, int ai_8) {
   if (ai_8 == 0) return (0);
   return (ad_0 - ai_8 * Point);
}

double CalculateProfit_16() {
   double ld_ret_0 = 0;
   for (g_pos_772 = OrdersTotal() - 1; g_pos_772 >= 0; g_pos_772--) {
      if( !OrderSelect(g_pos_772, SELECT_BY_POS, MODE_TRADES) ){ continue; }
      if (OrderSymbol() != Symbol() || OrderMagicNumber() != g_magic_176_16) continue;
      if (OrderSymbol() == Symbol() && OrderMagicNumber() == g_magic_176_16)
         if (OrderType() == OP_BUY || OrderType() == OP_SELL) ld_ret_0 += OrderProfit();
   }
   return (ld_ret_0);
}

void TrailingAlls_16(int ai_0, int ai_4, double a_price_8) {
   int li_16;
   double l_ord_stoploss_20;
   double l_price_28;
   bool foo=false;
   
   if (ai_4 != 0) {
      for (int l_pos_36 = OrdersTotal() - 1; l_pos_36 >= 0; l_pos_36--) {
         if (OrderSelect(l_pos_36, SELECT_BY_POS, MODE_TRADES)) {
            if (OrderSymbol() != Symbol() || OrderMagicNumber() != g_magic_176_16) continue;
            if (OrderSymbol() == Symbol() || OrderMagicNumber() == g_magic_176_16) {
               if (OrderType() == OP_BUY) {
                  li_16 = NormalizeDouble((Bid - a_price_8) / Point, 0);
                  if (li_16 < ai_0) continue;
                  l_ord_stoploss_20 = OrderStopLoss();
                  l_price_28 = Bid - ai_4 * Point;
                  if (l_ord_stoploss_20 == 0.0 || (l_ord_stoploss_20 != 0.0 && l_price_28 > l_ord_stoploss_20)){
                     // Somente ajustar a ordem se ela estiver aberta
                     if( CanModify(OrderTicket()) ){
                        ResetLastError();
                        foo=OrderModify(OrderTicket(), a_price_8, l_price_28, OrderTakeProfit(), 0, Aqua);
                        if(!foo) { ShowError(GetLastError(), "Normal"); }
                     }
                  }
               }
               if (OrderType() == OP_SELL) {
                  li_16 = NormalizeDouble((a_price_8 - Ask) / Point, 0);
                  if (li_16 < ai_0) continue;
                  l_ord_stoploss_20 = OrderStopLoss();
                  l_price_28 = Ask + ai_4 * Point;
                  if (l_ord_stoploss_20 == 0.0 || (l_ord_stoploss_20 != 0.0 && l_price_28 < l_ord_stoploss_20)){
                     // Somente ajustar a ordem se ela estiver aberta
                     if( CanModify(OrderTicket()) ){
                        ResetLastError();
                        foo=OrderModify(OrderTicket(), a_price_8, l_price_28, OrderTakeProfit(), 0, Red);
                        if(!foo){ ShowError(GetLastError(), "Normal"); }
                     }
                  }
               }
            }
            Sleep(1000);
         }
      }
   }
}

double AccountEquityHigh_16() {
   if (CountTrades_16() == 0) gd_808 = AccountEquity();
   if (gd_808 < gd_816) gd_808 = gd_816;
   else gd_808 = AccountEquity();
   gd_816 = AccountEquity();
   return (gd_808);
}

double FindLastBuyPrice_16() {
   double l_ord_open_price_0;
   int l_ticket_8;
   //double ld_unused_12 = 0;
   int l_ticket_20 = 0;
   for (int l_pos_24 = OrdersTotal() - 1; l_pos_24 >= 0; l_pos_24--) {
      if( !OrderSelect(l_pos_24, SELECT_BY_POS, MODE_TRADES) ){ continue; }
      if (OrderSymbol() != Symbol() || OrderMagicNumber() != g_magic_176_16) continue;
      if (OrderSymbol() == Symbol() && OrderMagicNumber() == g_magic_176_16 && OrderType() == OP_BUY) {
         l_ticket_8 = OrderTicket();
         if (l_ticket_8 > l_ticket_20) {
            l_ord_open_price_0 = OrderOpenPrice();
            //ld_unused_12 = l_ord_open_price_0;
            l_ticket_20 = l_ticket_8;
         }
      }
   }
   return (l_ord_open_price_0);
}

double FindLastSellPrice_16() {
   double l_ord_open_price_0;
   int l_ticket_8;
   //double ld_unused_12 = 0;
   int l_ticket_20 = 0;
   for (int l_pos_24 = OrdersTotal() - 1; l_pos_24 >= 0; l_pos_24--) {
      if( !OrderSelect(l_pos_24, SELECT_BY_POS, MODE_TRADES) ){ continue; }
      if (OrderSymbol() != Symbol() || OrderMagicNumber() != g_magic_176_16) continue;
      if (OrderSymbol() == Symbol() && OrderMagicNumber() == g_magic_176_16 && OrderType() == OP_SELL) {
         l_ticket_8 = OrderTicket();
         if (l_ticket_8 > l_ticket_20) {
            l_ord_open_price_0 = OrderOpenPrice();
            //ld_unused_12 = l_ord_open_price_0;
            l_ticket_20 = l_ticket_8;
         }
      }
   }
   return (l_ord_open_price_0);
}

bool CanModify(int ticket){

   return OrdersTotal() > 0;
   /*
   if( OrderType() == OP_BUY || OrderType() == OP_SELL)
      return OrderCloseTime() == 0;
      
   return false;

   /*
   bool result = false;
   
   OrderSelect(ticket, SELECT_BY_TICKET
   for(int i=OrdersHistoryTotal()-1;i>=0;i--){
      if( !OrderSelect(i,SELECT_BY_POS,MODE_HISTORY) ){ continue; }
      if(OrderTicket()==ticket){
         result=true;
         break;
      }
   }
   
   return result;
   */

}

void ShowError(int error, string complement){

   if(error == 1 || error == 130){ return ; }
   
   string ErrorText = ErrorDescription(error);
   StringToUpper( ErrorText );
   Print(complement, ": Ordem: ", OrderTicket(), ". Falha ao tentar alterar ordem: ", error, " \"", ErrorText, "\"" );
   ResetLastError();

}

int ChartCount(){

   if(!MM_MultiChart){ return 1; }
   int count=1;
   long currChart,prevChart=ChartFirst();
   
   
   while(count<1000){
      currChart=ChartNext(prevChart);
      
      if(currChart<0) break;
      
      prevChart=currChart;
      count++;
   }
   
   //Print(count, " gráficos abertos");
     
   return count;
   
}

double DefineLot(){

   double lot = Lots;
   double MM_MaxLot=MarketInfo(Symbol(), MODE_MAXLOT);
   
   if(MM_Active){
      lot = MathFloor(AccountBalance() / MM_Factor);
      if(lot == 0){
         lot = 0.01;
      }else{
         lot = NormalizeDouble( (lot / ChartCount()) * MM_MinLot, lotdecimal );
         if(lot < MM_MinLot){ lot = MM_MinLot; }
         if(lot > MM_MaxLot){ lot = MM_MaxLot; }
      }
   }
   
   return lot;
}
        
