//+------------------------------------------------------------------+
//|                                   57.Blazer RemasteredFFCall.mq4 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#include <stderror.mqh>
#include <stdlib.mqh>

#property strict
#property copyright     "Blazer Remastered"
#property version       "1.03"
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
extern bool UseFFCall = true; // Utilizar Filtro de noticias
extern bool IncludeHigh = true;
bool NewsTime;


///////////////////////////////////////////////
extern string TimeFilter__ = "Filtro de Data e Hora";
extern bool UtilizeTimeFilter =true; 
extern bool Trade_in_Monday  =true; 
extern bool Trade_in_Tuesday =true; 
extern bool Trade_in_Wednesday=true;
extern bool Trade_in_Thursday=true; 
extern bool Trade_in_Friday  =true;

extern string StartHour = "00:00"; 
extern string EndHour   = "23:59";  

extern double MaxSpread = 17;

extern string _geral01 = "";              // CONFIGURAÇÕES GERAIS
extern double Lots = 0.01;                 // Lotes Manuais (Não gerenciado)
extern double LotExponent = 1.55;         // Fator incremento
extern double PipStep = 30.0;             // PIP Step
extern double MaxLots = 100.0;            // Max Lotes
extern double TakeProfit = 10.0;          // Take Profit

extern bool UseEquityStop = FALSE;        // Usar EquityStop?
extern double TotalEquityRisk = 20.0;     // Risco Total para EquityStop
extern bool AlertPushEquityLoss = false;   //Envia Alerta ao Celular
extern bool CloseAllEquityLoss =  false;   // Caso bata no TotalEquityRisk  fechar as transações com perda

extern bool UseTrailingStop = TRUE;      // Usa Trailling Stop´?
extern double TrailStart = 13.0;          // Inicio TraillingStop
extern double TrailStop = 3.0;            // Tamanho Trailling stop
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


 if(UtilizeTimeFilter && !TimeFilter()) return;
 
 double vSpread = MarketInfo(Symbol(), MODE_SPREAD);
   if (vSpread > MaxSpread ) return ;
   
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
   Comment("\n" 
      + "Blazer Robot Extreme 1.0" 
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
   if (g_timeframe_828 == PERIOD_M1) l_text_208 = "M1";
   if (g_timeframe_828 == PERIOD_M5) l_text_208 = "M5";
   if (g_timeframe_828 == PERIOD_M15) l_text_208 = "M15";
   if (g_timeframe_828 == PERIOD_M30) l_text_208 = "M30";
   if (g_timeframe_828 == PERIOD_H1) l_text_208 = "H1";
   if (g_timeframe_828 == PERIOD_H4) l_text_208 = "H4";
   if (g_timeframe_828 == PERIOD_D1) l_text_208 = "D1";
   if (g_timeframe_828 == PERIOD_W1) l_text_208 = "W1";
   if (g_timeframe_828 == PERIOD_MN1) l_text_208 = "MN";
   if (g_timeframe_832 == PERIOD_M1) l_text_216 = "M1";
   if (g_timeframe_832 == PERIOD_M5) l_text_216 = "M5";
   if (g_timeframe_832 == PERIOD_M15) l_text_216 = "M15";
   if (g_timeframe_832 == PERIOD_M30) l_text_216 = "M30";
   if (g_timeframe_832 == PERIOD_H1) l_text_216 = "H1";
   if (g_timeframe_832 == PERIOD_H4) l_text_216 = "H4";
   if (g_timeframe_832 == PERIOD_D1) l_text_216 = "D1";
   if (g_timeframe_832 == PERIOD_W1) l_text_216 = "W1";
   if (g_timeframe_832 == PERIOD_MN1) l_text_216 = "MN";
   if (g_timeframe_836 == PERIOD_M1) l_text_224 = "M1";
   if (g_timeframe_836 == PERIOD_M5) l_text_224 = "M5";
   if (g_timeframe_836 == PERIOD_M15) l_text_224 = "M15";
   if (g_timeframe_836 == PERIOD_M30) l_text_224 = "M30";
   if (g_timeframe_836 == PERIOD_H1) l_text_224 = "H1";
   if (g_timeframe_836 == PERIOD_H4) l_text_224 = "H4";
   if (g_timeframe_836 == PERIOD_D1) l_text_224 = "D1";
   if (g_timeframe_836 == PERIOD_W1) l_text_224 = "W1";
   if (g_timeframe_836 == PERIOD_MN1) l_text_224 = "MN";
   if (g_timeframe_840 == PERIOD_M1) l_text_232 = "M1";
   if (g_timeframe_840 == PERIOD_M5) l_text_232 = "M5";
   if (g_timeframe_840 == PERIOD_M15) l_text_232 = "M15";
   if (g_timeframe_840 == PERIOD_M30) l_text_232 = "M30";
   if (g_timeframe_840 == PERIOD_H1) l_text_232 = "H1";
   if (g_timeframe_840 == PERIOD_H4) l_text_232 = "H4";
   if (g_timeframe_840 == PERIOD_D1) l_text_232 = "D1";
   if (g_timeframe_840 == PERIOD_W1) l_text_232 = "W1";
   if (g_timeframe_840 == PERIOD_MN1) l_text_232 = "MN";
   if (g_timeframe_844 == PERIOD_M1) l_text_240 = "M1";
   if (g_timeframe_844 == PERIOD_M5) l_text_240 = "M5";
   if (g_timeframe_844 == PERIOD_M15) l_text_240 = "M15";
   if (g_timeframe_844 == PERIOD_M30) l_text_240 = "M30";
   if (g_timeframe_844 == PERIOD_H1) l_text_240 = "H1";
   if (g_timeframe_844 == PERIOD_H4) l_text_240 = "H4";
   if (g_timeframe_844 == PERIOD_D1) l_text_240 = "D1";
   if (g_timeframe_844 == PERIOD_W1) l_text_240 = "W1";
   if (g_timeframe_844 == PERIOD_MN1) l_text_240 = "MN";
   if (g_timeframe_848 == PERIOD_M1) l_text_248 = "M1";
   if (g_timeframe_848 == PERIOD_M5) l_text_248 = "M5";
   if (g_timeframe_848 == PERIOD_M15) l_text_248 = "M15";
   if (g_timeframe_848 == PERIOD_M30) l_text_248 = "M30";
   if (g_timeframe_848 == PERIOD_H1) l_text_248 = "H1";
   if (g_timeframe_848 == PERIOD_H4) l_text_248 = "H4";
   if (g_timeframe_848 == PERIOD_D1) l_text_248 = "D1";
   if (g_timeframe_848 == PERIOD_W1) l_text_248 = "W1";
   if (g_timeframe_848 == PERIOD_MN1) l_text_248 = "MN";
   if (g_timeframe_852 == PERIOD_M1) l_text_256 = "M1";
   if (g_timeframe_852 == PERIOD_M5) l_text_256 = "M5";
   if (g_timeframe_852 == PERIOD_M15) l_text_256 = "M15";
   if (g_timeframe_852 == PERIOD_M30) l_text_256 = "M30";
   if (g_timeframe_852 == PERIOD_H1) l_text_256 = "H1";
   if (g_timeframe_852 == PERIOD_H4) l_text_256 = "H4";
   if (g_timeframe_852 == PERIOD_D1) l_text_256 = "D1";
   if (g_timeframe_852 == PERIOD_W1) l_text_256 = "W1";
   if (g_timeframe_852 == PERIOD_MN1) l_text_256 = "MN";
   if (g_timeframe_828 == PERIOD_M15) li_0 = -2;
   if (g_timeframe_828 == PERIOD_M30) li_0 = -2;
   if (g_timeframe_832 == PERIOD_M15) li_4 = -2;
   if (g_timeframe_832 == PERIOD_M30) li_4 = -2;
   if (g_timeframe_836 == PERIOD_M15) li_8 = -2;
   if (g_timeframe_836 == PERIOD_M30) li_8 = -2;
   if (g_timeframe_840 == PERIOD_M15) li_12 = -2;
   if (g_timeframe_840 == PERIOD_M30) li_12 = -2;
   if (g_timeframe_844 == PERIOD_M15) li_16 = -2;
   if (g_timeframe_844 == PERIOD_M30) li_16 = -2;
   if (g_timeframe_848 == PERIOD_M15) li_20 = -2;
   if (g_timeframe_848 == PERIOD_M30) li_20 = -2;
   if (g_timeframe_852 == PERIOD_M15) li_24 = -2;
   if (g_timeframe_848 == PERIOD_M30) li_24 = -2;
   if (gi_860 < 0) return ;
   ObjectDelete("SIG_BARS_TF1");
   ObjectCreate("SIG_BARS_TF1", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SIG_BARS_TF1", l_text_208, 7, "Arial Bold", g_color_884);
   ObjectSet("SIG_BARS_TF1", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SIG_BARS_TF1", OBJPROP_XDISTANCE, gi_864 + 134 + li_0);
   ObjectSet("SIG_BARS_TF1", OBJPROP_YDISTANCE, gi_860 + 25);
   ObjectDelete("SIG_BARS_TF2");
   ObjectCreate("SIG_BARS_TF2", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SIG_BARS_TF2", l_text_216, 7, "Arial Bold", g_color_884);
   ObjectSet("SIG_BARS_TF2", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SIG_BARS_TF2", OBJPROP_XDISTANCE, gi_864 + 114 + li_4);
   ObjectSet("SIG_BARS_TF2", OBJPROP_YDISTANCE, gi_860 + 25);
   ObjectDelete("SIG_BARS_TF3");
   ObjectCreate("SIG_BARS_TF3", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SIG_BARS_TF3", l_text_224, 7, "Arial Bold", g_color_884);
   ObjectSet("SIG_BARS_TF3", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SIG_BARS_TF3", OBJPROP_XDISTANCE, gi_864 + 94 + li_8);
   ObjectSet("SIG_BARS_TF3", OBJPROP_YDISTANCE, gi_860 + 25);
   ObjectDelete("SIG_BARS_TF4");
   ObjectCreate("SIG_BARS_TF4", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SIG_BARS_TF4", l_text_232, 7, "Arial Bold", g_color_884);
   ObjectSet("SIG_BARS_TF4", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SIG_BARS_TF4", OBJPROP_XDISTANCE, gi_864 + 74 + li_12);
   ObjectSet("SIG_BARS_TF4", OBJPROP_YDISTANCE, gi_860 + 25);
   ObjectDelete("SIG_BARS_TF5");
   ObjectCreate("SIG_BARS_TF5", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SIG_BARS_TF5", l_text_240, 7, "Arial Bold", g_color_884);
   ObjectSet("SIG_BARS_TF5", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SIG_BARS_TF5", OBJPROP_XDISTANCE, gi_864 + 54 + li_16);
   ObjectSet("SIG_BARS_TF5", OBJPROP_YDISTANCE, gi_860 + 25);
   ObjectDelete("SIG_BARS_TF6");
   ObjectCreate("SIG_BARS_TF6", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SIG_BARS_TF6", l_text_248, 7, "Arial Bold", g_color_884);
   ObjectSet("SIG_BARS_TF6", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SIG_BARS_TF6", OBJPROP_XDISTANCE, gi_864 + 34 + li_20);
   ObjectSet("SIG_BARS_TF6", OBJPROP_YDISTANCE, gi_860 + 25);
   ObjectDelete("SIG_BARS_TF7");
   ObjectCreate("SIG_BARS_TF7", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SIG_BARS_TF7", l_text_256, 7, "Arial Bold", g_color_884);
   ObjectSet("SIG_BARS_TF7", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SIG_BARS_TF7", OBJPROP_XDISTANCE, gi_864 + 14 + li_24);
   ObjectSet("SIG_BARS_TF7", OBJPROP_YDISTANCE, gi_860 + 25);
   string l_text_264 = "";
   string l_text_272 = "";
   string l_text_280 = "";
   string l_text_288 = "";
   string l_text_296 = "";
   string l_text_304 = "";
   string l_text_312 = "";
   //string ls_unused_320 = "";
   //string ls_unused_328 = "";
   double l_imacd_336 = iMACD(NULL, g_timeframe_828, g_period_932, g_period_936, g_period_940, g_applied_price_944, MODE_MAIN, 0);
   double l_imacd_344 = iMACD(NULL, g_timeframe_828, g_period_932, g_period_936, g_period_940, g_applied_price_944, MODE_SIGNAL, 0);
   double l_imacd_352 = iMACD(NULL, g_timeframe_832, g_period_932, g_period_936, g_period_940, g_applied_price_944, MODE_MAIN, 0);
   double l_imacd_360 = iMACD(NULL, g_timeframe_832, g_period_932, g_period_936, g_period_940, g_applied_price_944, MODE_SIGNAL, 0);
   double l_imacd_368 = iMACD(NULL, g_timeframe_836, g_period_932, g_period_936, g_period_940, g_applied_price_944, MODE_MAIN, 0);
   double l_imacd_376 = iMACD(NULL, g_timeframe_836, g_period_932, g_period_936, g_period_940, g_applied_price_944, MODE_SIGNAL, 0);
   double l_imacd_384 = iMACD(NULL, g_timeframe_840, g_period_932, g_period_936, g_period_940, g_applied_price_944, MODE_MAIN, 0);
   double l_imacd_392 = iMACD(NULL, g_timeframe_840, g_period_932, g_period_936, g_period_940, g_applied_price_944, MODE_SIGNAL, 0);
   double l_imacd_400 = iMACD(NULL, g_timeframe_844, g_period_932, g_period_936, g_period_940, g_applied_price_944, MODE_MAIN, 0);
   double l_imacd_408 = iMACD(NULL, g_timeframe_844, g_period_932, g_period_936, g_period_940, g_applied_price_944, MODE_SIGNAL, 0);
   double l_imacd_416 = iMACD(NULL, g_timeframe_848, g_period_932, g_period_936, g_period_940, g_applied_price_944, MODE_MAIN, 0);
   double l_imacd_424 = iMACD(NULL, g_timeframe_848, g_period_932, g_period_936, g_period_940, g_applied_price_944, MODE_SIGNAL, 0);
   double l_imacd_432 = iMACD(NULL, g_timeframe_852, g_period_932, g_period_936, g_period_940, g_applied_price_944, MODE_MAIN, 0);
   double l_imacd_440 = iMACD(NULL, g_timeframe_852, g_period_932, g_period_936, g_period_940, g_applied_price_944, MODE_SIGNAL, 0);
   if (l_imacd_336 > l_imacd_344) {
      l_text_288 = "-";
      l_color_40 = gi_956;
   }
   if (l_imacd_336 <= l_imacd_344) {
      l_text_288 = "-";
      l_color_40 = gi_952;
   }
   if (l_imacd_336 > l_imacd_344 && l_imacd_336 > 0.0) {
      l_text_288 = "-";
      l_color_40 = gi_948;
   }
   if (l_imacd_336 <= l_imacd_344 && l_imacd_336 < 0.0) {
      l_text_288 = "-";
      l_color_40 = gi_960;
   }
   if (l_imacd_352 > l_imacd_360) {
      l_text_296 = "-";
      l_color_44 = gi_956;
   }
   if (l_imacd_352 <= l_imacd_360) {
      l_text_296 = "-";
      l_color_44 = gi_952;
   }
   if (l_imacd_352 > l_imacd_360 && l_imacd_352 > 0.0) {
      l_text_296 = "-";
      l_color_44 = gi_948;
   }
   if (l_imacd_352 <= l_imacd_360 && l_imacd_352 < 0.0) {
      l_text_296 = "-";
      l_color_44 = gi_960;
   }
   if (l_imacd_368 > l_imacd_376) {
      l_text_304 = "-";
      l_color_48 = gi_956;
   }
   if (l_imacd_368 <= l_imacd_376) {
      l_text_304 = "-";
      l_color_48 = gi_952;
   }
   if (l_imacd_368 > l_imacd_376 && l_imacd_368 > 0.0) {
      l_text_304 = "-";
      l_color_48 = gi_948;
   }
   if (l_imacd_368 <= l_imacd_376 && l_imacd_368 < 0.0) {
      l_text_304 = "-";
      l_color_48 = gi_960;
   }
   if (l_imacd_384 > l_imacd_392) {
      l_text_312 = "-";
      l_color_52 = gi_956;
   }
   if (l_imacd_384 <= l_imacd_392) {
      l_text_312 = "-";
      l_color_52 = gi_952;
   }
   if (l_imacd_384 > l_imacd_392 && l_imacd_384 > 0.0) {
      l_text_312 = "-";
      l_color_52 = gi_948;
   }
   if (l_imacd_384 <= l_imacd_392 && l_imacd_384 < 0.0) {
      l_text_312 = "-";
      l_color_52 = gi_960;
   }
   if (l_imacd_400 > l_imacd_408) {
      l_text_272 = "-";
      l_color_32 = gi_956;
   }
   if (l_imacd_400 <= l_imacd_408) {
      l_text_272 = "-";
      l_color_32 = gi_952;
   }
   if (l_imacd_400 > l_imacd_408 && l_imacd_400 > 0.0) {
      l_text_272 = "-";
      l_color_32 = gi_948;
   }
   if (l_imacd_400 <= l_imacd_408 && l_imacd_400 < 0.0) {
      l_text_272 = "-";
      l_color_32 = gi_960;
   }
   if (l_imacd_416 > l_imacd_424) {
      l_text_280 = "-";
      l_color_36 = gi_956;
   }
   if (l_imacd_416 <= l_imacd_424) {
      l_text_280 = "-";
      l_color_36 = gi_952;
   }
   if (l_imacd_416 > l_imacd_424 && l_imacd_416 > 0.0) {
      l_text_280 = "-";
      l_color_36 = gi_948;
   }
   if (l_imacd_416 <= l_imacd_424 && l_imacd_416 < 0.0) {
      l_text_280 = "-";
      l_color_36 = gi_960;
   }
   if (l_imacd_432 > l_imacd_440) {
      l_text_264 = "-";
      l_color_28 = gi_956;
   }
   if (l_imacd_432 <= l_imacd_440) {
      l_text_264 = "-";
      l_color_28 = gi_952;
   }
   if (l_imacd_432 > l_imacd_440 && l_imacd_432 > 0.0) {
      l_text_264 = "-";
      l_color_28 = gi_948;
   }
   if (l_imacd_432 <= l_imacd_440 && l_imacd_432 < 0.0) {
      l_text_264 = "-";
      l_color_28 = gi_960;
   }
   ObjectDelete("SSignalMACD_TEXT");
   ObjectCreate("SSignalMACD_TEXT", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SSignalMACD_TEXT", "MACD", 6, "Tahoma Narrow", g_color_888);
   ObjectSet("SSignalMACD_TEXT", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SSignalMACD_TEXT", OBJPROP_XDISTANCE, gi_864 + 153);
   ObjectSet("SSignalMACD_TEXT", OBJPROP_YDISTANCE, gi_860 + 35);
   ObjectDelete("SSignalMACDM1");
   ObjectCreate("SSignalMACDM1", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SSignalMACDM1", l_text_288, 45, "Tahoma Narrow", l_color_40);
   ObjectSet("SSignalMACDM1", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SSignalMACDM1", OBJPROP_XDISTANCE, gi_864 + 130);
   ObjectSet("SSignalMACDM1", OBJPROP_YDISTANCE, gi_860 + 2);
   ObjectDelete("SSignalMACDM5");
   ObjectCreate("SSignalMACDM5", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SSignalMACDM5", l_text_296, 45, "Tahoma Narrow", l_color_44);
   ObjectSet("SSignalMACDM5", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SSignalMACDM5", OBJPROP_XDISTANCE, gi_864 + 110);
   ObjectSet("SSignalMACDM5", OBJPROP_YDISTANCE, gi_860 + 2);
   ObjectDelete("SSignalMACDM15");
   ObjectCreate("SSignalMACDM15", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SSignalMACDM15", l_text_304, 45, "Tahoma Narrow", l_color_48);
   ObjectSet("SSignalMACDM15", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SSignalMACDM15", OBJPROP_XDISTANCE, gi_864 + 90);
   ObjectSet("SSignalMACDM15", OBJPROP_YDISTANCE, gi_860 + 2);
   ObjectDelete("SSignalMACDM30");
   ObjectCreate("SSignalMACDM30", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SSignalMACDM30", l_text_312, 45, "Tahoma Narrow", l_color_52);
   ObjectSet("SSignalMACDM30", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SSignalMACDM30", OBJPROP_XDISTANCE, gi_864 + 70);
   ObjectSet("SSignalMACDM30", OBJPROP_YDISTANCE, gi_860 + 2);
   ObjectDelete("SSignalMACDH1");
   ObjectCreate("SSignalMACDH1", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SSignalMACDH1", l_text_272, 45, "Tahoma Narrow", l_color_32);
   ObjectSet("SSignalMACDH1", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SSignalMACDH1", OBJPROP_XDISTANCE, gi_864 + 50);
   ObjectSet("SSignalMACDH1", OBJPROP_YDISTANCE, gi_860 + 2);
   ObjectDelete("SSignalMACDH4");
   ObjectCreate("SSignalMACDH4", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SSignalMACDH4", l_text_280, 45, "Tahoma Narrow", l_color_36);
   ObjectSet("SSignalMACDH4", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SSignalMACDH4", OBJPROP_XDISTANCE, gi_864 + 30);
   ObjectSet("SSignalMACDH4", OBJPROP_YDISTANCE, gi_860 + 2);
   ObjectDelete("SSignalMACDD1");
   ObjectCreate("SSignalMACDD1", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SSignalMACDD1", l_text_264, 45, "Tahoma Narrow", l_color_28);
   ObjectSet("SSignalMACDD1", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SSignalMACDD1", OBJPROP_XDISTANCE, gi_864 + 10);
   ObjectSet("SSignalMACDD1", OBJPROP_YDISTANCE, gi_860 + 2);
   double l_irsi_448 = iRSI(NULL, g_timeframe_852, g_period_980, g_applied_price_984, 0);
   double l_irsi_456 = iRSI(NULL, g_timeframe_848, g_period_980, g_applied_price_984, 0);
   double l_irsi_464 = iRSI(NULL, g_timeframe_844, g_period_980, g_applied_price_984, 0);
   double l_irsi_472 = iRSI(NULL, g_timeframe_840, g_period_980, g_applied_price_984, 0);
   double l_irsi_480 = iRSI(NULL, g_timeframe_836, g_period_980, g_applied_price_984, 0);
   double l_irsi_488 = iRSI(NULL, g_timeframe_832, g_period_980, g_applied_price_984, 0);
   double l_irsi_496 = iRSI(NULL, g_timeframe_828, g_period_980, g_applied_price_984, 0);
   double l_istochastic_504 = iStochastic(NULL, g_timeframe_852, g_period_1012, g_period_1016, g_slowing_1020, g_ma_method_1024, 0, MODE_MAIN, 0);
   double l_istochastic_512 = iStochastic(NULL, g_timeframe_848, g_period_1012, g_period_1016, g_slowing_1020, g_ma_method_1024, 0, MODE_MAIN, 0);
   double l_istochastic_520 = iStochastic(NULL, g_timeframe_844, g_period_1012, g_period_1016, g_slowing_1020, g_ma_method_1024, 0, MODE_MAIN, 0);
   double l_istochastic_528 = iStochastic(NULL, g_timeframe_840, g_period_1012, g_period_1016, g_slowing_1020, g_ma_method_1024, 0, MODE_MAIN, 0);
   double l_istochastic_536 = iStochastic(NULL, g_timeframe_836, g_period_1012, g_period_1016, g_slowing_1020, g_ma_method_1024, 0, MODE_MAIN, 0);
   double l_istochastic_544 = iStochastic(NULL, g_timeframe_832, g_period_1012, g_period_1016, g_slowing_1020, g_ma_method_1024, 0, MODE_MAIN, 0);
   double l_istochastic_552 = iStochastic(NULL, g_timeframe_828, g_period_1012, g_period_1016, g_slowing_1020, g_ma_method_1024, 0, MODE_MAIN, 0);
   double l_icci_560 = iCCI(NULL, g_timeframe_852, g_period_996, g_applied_price_1000, 0);
   double l_icci_568 = iCCI(NULL, g_timeframe_848, g_period_996, g_applied_price_1000, 0);
   double l_icci_576 = iCCI(NULL, g_timeframe_844, g_period_996, g_applied_price_1000, 0);
   double l_icci_584 = iCCI(NULL, g_timeframe_840, g_period_996, g_applied_price_1000, 0);
   double l_icci_592 = iCCI(NULL, g_timeframe_836, g_period_996, g_applied_price_1000, 0);
   double l_icci_600 = iCCI(NULL, g_timeframe_832, g_period_996, g_applied_price_1000, 0);
   double l_icci_608 = iCCI(NULL, g_timeframe_828, g_period_996, g_applied_price_1000, 0);
   string l_text_616 = "";
   string l_text_624 = "";
   string l_text_632 = "";
   string l_text_640 = "";
   string l_text_648 = "";
   string l_text_656 = "";
   string l_text_664 = "";
   //string ls_unused_672 = "";
   //string ls_unused_680 = "";
   l_text_664 = "-";
   color l_color_688 = gi_1044;
   l_text_648 = "-";
   color l_color_692 = gi_1044;
   l_text_616 = "-";
   color l_color_696 = gi_1044;
   l_text_656 = "-";
   color l_color_700 = gi_1044;
   l_text_624 = "-";
   color l_color_704 = gi_1044;
   l_text_632 = "-";
   color l_color_708 = gi_1044;
   l_text_640 = "-";
   color l_color_712 = gi_1044;
   if (l_irsi_448 > 50.0 && l_istochastic_504 > 40.0 && l_icci_560 > 0.0) {
      l_text_664 = "-";
      l_color_688 = gi_1036;
   }
   if (l_irsi_456 > 50.0 && l_istochastic_512 > 40.0 && l_icci_568 > 0.0) {
      l_text_648 = "-";
      l_color_692 = gi_1036;
   }
   if (l_irsi_464 > 50.0 && l_istochastic_520 > 40.0 && l_icci_576 > 0.0) {
      l_text_616 = "-";
      l_color_696 = gi_1036;
   }
   if (l_irsi_472 > 50.0 && l_istochastic_528 > 40.0 && l_icci_584 > 0.0) {
      l_text_656 = "-";
      l_color_700 = gi_1036;
   }
   if (l_irsi_480 > 50.0 && l_istochastic_536 > 40.0 && l_icci_592 > 0.0) {
      l_text_624 = "-";
      l_color_704 = gi_1036;
   }
   if (l_irsi_488 > 50.0 && l_istochastic_544 > 40.0 && l_icci_600 > 0.0) {
      l_text_632 = "-";
      l_color_708 = gi_1036;
   }
   if (l_irsi_496 > 50.0 && l_istochastic_552 > 40.0 && l_icci_608 > 0.0) {
      l_text_640 = "-";
      l_color_712 = gi_1036;
   }
   if (l_irsi_448 < 50.0 && l_istochastic_504 < 60.0 && l_icci_560 < 0.0) {
      l_text_664 = "-";
      l_color_688 = gi_1040;
   }
   if (l_irsi_456 < 50.0 && l_istochastic_512 < 60.0 && l_icci_568 < 0.0) {
      l_text_648 = "-";
      l_color_692 = gi_1040;
   }
   if (l_irsi_464 < 50.0 && l_istochastic_520 < 60.0 && l_icci_576 < 0.0) {
      l_text_616 = "-";
      l_color_696 = gi_1040;
   }
   if (l_irsi_472 < 50.0 && l_istochastic_528 < 60.0 && l_icci_584 < 0.0) {
      l_text_656 = "-";
      l_color_700 = gi_1040;
   }
   if (l_irsi_480 < 50.0 && l_istochastic_536 < 60.0 && l_icci_592 < 0.0) {
      l_text_624 = "-";
      l_color_704 = gi_1040;
   }
   if (l_irsi_488 < 50.0 && l_istochastic_544 < 60.0 && l_icci_600 < 0.0) {
      l_text_632 = "-";
      l_color_708 = gi_1040;
   }
   if (l_irsi_496 < 50.0 && l_istochastic_552 < 60.0 && l_icci_608 < 0.0) {
      l_text_640 = "-";
      l_color_712 = gi_1040;
   }
   ObjectDelete("SSignalSTR_TEXT");
   ObjectCreate("SSignalSTR_TEXT", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SSignalSTR_TEXT", "STR", 6, "Tahoma Narrow", g_color_888);
   ObjectSet("SSignalSTR_TEXT", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SSignalSTR_TEXT", OBJPROP_XDISTANCE, gi_864 + 153);
   ObjectSet("SSignalSTR_TEXT", OBJPROP_YDISTANCE, gi_860 + 43);
   ObjectDelete("SignalSTRM1");
   ObjectCreate("SignalSTRM1", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SignalSTRM1", l_text_640, 45, "Tahoma Narrow", l_color_712);
   ObjectSet("SignalSTRM1", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SignalSTRM1", OBJPROP_XDISTANCE, gi_864 + 130);
   ObjectSet("SignalSTRM1", OBJPROP_YDISTANCE, gi_860 + 10);
   ObjectDelete("SignalSTRM5");
   ObjectCreate("SignalSTRM5", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SignalSTRM5", l_text_632, 45, "Tahoma Narrow", l_color_708);
   ObjectSet("SignalSTRM5", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SignalSTRM5", OBJPROP_XDISTANCE, gi_864 + 110);
   ObjectSet("SignalSTRM5", OBJPROP_YDISTANCE, gi_860 + 10);
   ObjectDelete("SignalSTRM15");
   ObjectCreate("SignalSTRM15", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SignalSTRM15", l_text_624, 45, "Tahoma Narrow", l_color_704);
   ObjectSet("SignalSTRM15", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SignalSTRM15", OBJPROP_XDISTANCE, gi_864 + 90);
   ObjectSet("SignalSTRM15", OBJPROP_YDISTANCE, gi_860 + 10);
   ObjectDelete("SignalSTRM30");
   ObjectCreate("SignalSTRM30", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SignalSTRM30", l_text_656, 45, "Tahoma Narrow", l_color_700);
   ObjectSet("SignalSTRM30", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SignalSTRM30", OBJPROP_XDISTANCE, gi_864 + 70);
   ObjectSet("SignalSTRM30", OBJPROP_YDISTANCE, gi_860 + 10);
   ObjectDelete("SignalSTRH1");
   ObjectCreate("SignalSTRH1", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SignalSTRH1", l_text_616, 45, "Tahoma Narrow", l_color_696);
   ObjectSet("SignalSTRH1", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SignalSTRH1", OBJPROP_XDISTANCE, gi_864 + 50);
   ObjectSet("SignalSTRH1", OBJPROP_YDISTANCE, gi_860 + 10);
   ObjectDelete("SignalSTRH4");
   ObjectCreate("SignalSTRH4", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SignalSTRH4", l_text_648, 45, "Tahoma Narrow", l_color_692);
   ObjectSet("SignalSTRH4", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SignalSTRH4", OBJPROP_XDISTANCE, gi_864 + 30);
   ObjectSet("SignalSTRH4", OBJPROP_YDISTANCE, gi_860 + 10);
   ObjectDelete("SignalSTRD1");
   ObjectCreate("SignalSTRD1", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SignalSTRD1", l_text_664, 45, "Tahoma Narrow", l_color_688);
   ObjectSet("SignalSTRD1", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SignalSTRD1", OBJPROP_XDISTANCE, gi_864 + 10);
   ObjectSet("SignalSTRD1", OBJPROP_YDISTANCE, gi_860 + 10);
   double l_ima_716 = iMA(Symbol(), g_timeframe_828, g_period_1056, 0, g_ma_method_1064, g_applied_price_1068, 0);
   double l_ima_724 = iMA(Symbol(), g_timeframe_828, g_period_1060, 0, g_ma_method_1064, g_applied_price_1068, 0);
   double l_ima_732 = iMA(Symbol(), g_timeframe_832, g_period_1056, 0, g_ma_method_1064, g_applied_price_1068, 0);
   double l_ima_740 = iMA(Symbol(), g_timeframe_832, g_period_1060, 0, g_ma_method_1064, g_applied_price_1068, 0);
   double l_ima_748 = iMA(Symbol(), g_timeframe_836, g_period_1056, 0, g_ma_method_1064, g_applied_price_1068, 0);
   double l_ima_756 = iMA(Symbol(), g_timeframe_836, g_period_1060, 0, g_ma_method_1064, g_applied_price_1068, 0);
   double l_ima_764 = iMA(Symbol(), g_timeframe_840, g_period_1056, 0, g_ma_method_1064, g_applied_price_1068, 0);
   double l_ima_772 = iMA(Symbol(), g_timeframe_840, g_period_1060, 0, g_ma_method_1064, g_applied_price_1068, 0);
   double l_ima_780 = iMA(Symbol(), g_timeframe_844, g_period_1056, 0, g_ma_method_1064, g_applied_price_1068, 0);
   double l_ima_788 = iMA(Symbol(), g_timeframe_844, g_period_1060, 0, g_ma_method_1064, g_applied_price_1068, 0);
   double l_ima_796 = iMA(Symbol(), g_timeframe_848, g_period_1056, 0, g_ma_method_1064, g_applied_price_1068, 0);
   double l_ima_804 = iMA(Symbol(), g_timeframe_848, g_period_1060, 0, g_ma_method_1064, g_applied_price_1068, 0);
   double l_ima_812 = iMA(Symbol(), g_timeframe_852, g_period_1056, 0, g_ma_method_1064, g_applied_price_1068, 0);
   double l_ima_820 = iMA(Symbol(), g_timeframe_852, g_period_1060, 0, g_ma_method_1064, g_applied_price_1068, 0);
   string l_text_828 = "";
   string l_text_836 = "";
   string l_text_844 = "";
   string l_text_852 = "";
   string l_text_860 = "";
   string l_text_868 = "";
   string l_text_876 = "";
   //string ls_unused_884 = "";
   //string ls_unused_892 = "";
   if (l_ima_716 > l_ima_724) {
      l_text_828 = "-";
      l_color_64 = gi_1080;
   }
   if (l_ima_716 <= l_ima_724) {
      l_text_828 = "-";
      l_color_64 = gi_1084;
   }
   if (l_ima_732 > l_ima_740) {
      l_text_836 = "-";
      l_color_68 = gi_1080;
   }
   if (l_ima_732 <= l_ima_740) {
      l_text_836 = "-";
      l_color_68 = gi_1084;
   }
   if (l_ima_748 > l_ima_756) {
      l_text_844 = "-";
      l_color_72 = gi_1080;
   }
   if (l_ima_748 <= l_ima_756) {
      l_text_844 = "-";
      l_color_72 = gi_1084;
   }
   if (l_ima_764 > l_ima_772) {
      l_text_852 = "-";
      l_color_76 = gi_1080;
   }
   if (l_ima_764 <= l_ima_772) {
      l_text_852 = "-";
      l_color_76 = gi_1084;
   }
   if (l_ima_780 > l_ima_788) {
      l_text_860 = "-";
      l_color_80 = gi_1080;
   }
   if (l_ima_780 <= l_ima_788) {
      l_text_860 = "-";
      l_color_80 = gi_1084;
   }
   if (l_ima_796 > l_ima_804) {
      l_text_868 = "-";
      l_color_84 = gi_1080;
   }
   if (l_ima_796 <= l_ima_804) {
      l_text_868 = "-";
      l_color_84 = gi_1084;
   }
   if (l_ima_812 > l_ima_820) {
      l_text_876 = "-";
      l_color_88 = gi_1080;
   }
   if (l_ima_812 <= l_ima_820) {
      l_text_876 = "-";
      l_color_88 = gi_1084;
   }
   ObjectDelete("SignalEMA_TEXT");
   ObjectCreate("SignalEMA_TEXT", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SignalEMA_TEXT", "EMA", 6, "Tahoma Narrow", g_color_888);
   ObjectSet("SignalEMA_TEXT", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SignalEMA_TEXT", OBJPROP_XDISTANCE, gi_864 + 153);
   ObjectSet("SignalEMA_TEXT", OBJPROP_YDISTANCE, gi_860 + 51);
   ObjectDelete("SignalEMAM1");
   ObjectCreate("SignalEMAM1", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SignalEMAM1", l_text_828, 45, "Tahoma Narrow", l_color_64);
   ObjectSet("SignalEMAM1", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SignalEMAM1", OBJPROP_XDISTANCE, gi_864 + 130);
   ObjectSet("SignalEMAM1", OBJPROP_YDISTANCE, gi_860 + 18);
   ObjectDelete("SignalEMAM5");
   ObjectCreate("SignalEMAM5", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SignalEMAM5", l_text_836, 45, "Tahoma Narrow", l_color_68);
   ObjectSet("SignalEMAM5", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SignalEMAM5", OBJPROP_XDISTANCE, gi_864 + 110);
   ObjectSet("SignalEMAM5", OBJPROP_YDISTANCE, gi_860 + 18);
   ObjectDelete("SignalEMAM15");
   ObjectCreate("SignalEMAM15", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SignalEMAM15", l_text_844, 45, "Tahoma Narrow", l_color_72);
   ObjectSet("SignalEMAM15", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SignalEMAM15", OBJPROP_XDISTANCE, gi_864 + 90);
   ObjectSet("SignalEMAM15", OBJPROP_YDISTANCE, gi_860 + 18);
   ObjectDelete("SignalEMAM30");
   ObjectCreate("SignalEMAM30", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SignalEMAM30", l_text_852, 45, "Tahoma Narrow", l_color_76);
   ObjectSet("SignalEMAM30", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SignalEMAM30", OBJPROP_XDISTANCE, gi_864 + 70);
   ObjectSet("SignalEMAM30", OBJPROP_YDISTANCE, gi_860 + 18);
   ObjectDelete("SignalEMAH1");
   ObjectCreate("SignalEMAH1", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SignalEMAH1", l_text_860, 45, "Tahoma Narrow", l_color_80);
   ObjectSet("SignalEMAH1", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SignalEMAH1", OBJPROP_XDISTANCE, gi_864 + 50);
   ObjectSet("SignalEMAH1", OBJPROP_YDISTANCE, gi_860 + 18);
   ObjectDelete("SignalEMAH4");
   ObjectCreate("SignalEMAH4", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SignalEMAH4", l_text_868, 45, "Tahoma Narrow", l_color_84);
   ObjectSet("SignalEMAH4", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SignalEMAH4", OBJPROP_XDISTANCE, gi_864 + 30);
   ObjectSet("SignalEMAH4", OBJPROP_YDISTANCE, gi_860 + 18);
   ObjectDelete("SignalEMAD1");
   ObjectCreate("SignalEMAD1", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SignalEMAD1", l_text_876, 45, "Tahoma Narrow", l_color_88);
   ObjectSet("SignalEMAD1", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SignalEMAD1", OBJPROP_XDISTANCE, gi_864 + 10);
   ObjectSet("SignalEMAD1", OBJPROP_YDISTANCE, gi_860 + 18);
   double ld_900 = NormalizeDouble(MarketInfo(Symbol(), MODE_BID), Digits);
   double l_ima_908 = iMA(Symbol(), PERIOD_M1, 1, 0, MODE_EMA, PRICE_CLOSE, 1);
   //string ls_unused_916 = "";
   if (l_ima_908 > ld_900) {
      //ls_unused_916 = "";
      l_color_92 = gi_924;
   }
   if (l_ima_908 < ld_900) {
      //ls_unused_916 = "";
      l_color_92 = gi_920;
   }
   if (l_ima_908 == ld_900) {
      //ls_unused_916 = "";
      l_color_92 = gi_928;
   }
   ObjectDelete("cja");
   ObjectCreate("cja", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("cja", "cja", 8, "Tahoma Narrow", DimGray);
   ObjectSet("cja", OBJPROP_CORNER, g_corner_856);
   ObjectSet("cja", OBJPROP_XDISTANCE, gi_864 + 153);
   ObjectSet("cja", OBJPROP_YDISTANCE, gi_860 + 23);
   if (gi_880 == FALSE) {
      if (gi_872 == TRUE) {
         ObjectDelete("Signalprice");
         ObjectCreate("Signalprice", OBJ_LABEL, g_window_868, 0, 0);
         ObjectSetText("Signalprice", DoubleToStr(ld_900, Digits), 35, "Arial", l_color_92);
         ObjectSet("Signalprice", OBJPROP_CORNER, g_corner_856);
         ObjectSet("Signalprice", OBJPROP_XDISTANCE, gi_864 + 10);
         ObjectSet("Signalprice", OBJPROP_YDISTANCE, gi_860 + 56);
      }
   }
   if (gi_880 == TRUE) {
      if (gi_872 == TRUE) {
         ObjectDelete("Signalprice");
         ObjectCreate("Signalprice", OBJ_LABEL, g_window_868, 0, 0);
         ObjectSetText("Signalprice", DoubleToStr(ld_900, Digits), 15, "Arial", l_color_92);
         ObjectSet("Signalprice", OBJPROP_CORNER, g_corner_856);
         ObjectSet("Signalprice", OBJPROP_XDISTANCE, gi_864 + 10);
         ObjectSet("Signalprice", OBJPROP_YDISTANCE, gi_860 + 60);
      }
   }
   int li_924 = 0;
   int li_928 = 0;
   int li_932 = 0;
   int li_936 = 0;
   int li_940 = 0;
   int li_944 = 0;
   li_924 = (iHigh(NULL, PERIOD_D1, 1) - iLow(NULL, PERIOD_D1, 1)) / Point;
   for (li_944 = 1; li_944 <= 5; li_944++) li_928 = li_928 + (iHigh(NULL, PERIOD_D1, li_944) - iLow(NULL, PERIOD_D1, li_944)) / Point;
   for (li_944 = 1; li_944 <= 10; li_944++) li_932 = li_932 + (iHigh(NULL, PERIOD_D1, li_944) - iLow(NULL, PERIOD_D1, li_944)) / Point;
   for (li_944 = 1; li_944 <= 20; li_944++) li_936 = li_936 + (iHigh(NULL, PERIOD_D1, li_944) - iLow(NULL, PERIOD_D1, li_944)) / Point;
   li_928 /= 5;
   li_932 /= 10;
   li_936 /= 20;
   li_940 = (li_924 + li_928 + li_932 + li_936) / 4;
   //string ls_unused_948 = "";
   //string ls_unused_956 = "";
   string l_dbl2str_964 = "";
   string l_dbl2str_972 = "";
   string l_dbl2str_980 = "";
   string l_dbl2str_988 = "";
   //string ls_unused_996 = "";
   //string ls_unused_1004 = "";
   string ls_1012 = "";
   double l_iopen_1020 = iOpen(NULL, PERIOD_D1, 0);
   double l_iclose_1028 = iClose(NULL, PERIOD_D1, 0);
   double ld_1036 = (Ask - Bid) / Point;
   double l_ihigh_1044 = iHigh(NULL, PERIOD_D1, 0);
   double l_ilow_1052 = iLow(NULL, PERIOD_D1, 0);
   l_dbl2str_972 = DoubleToStr((l_iclose_1028 - l_iopen_1020) / Point, 0);
   l_dbl2str_964 = DoubleToStr(ld_1036, Digits - 4);
   l_dbl2str_980 = DoubleToStr(li_940, Digits - 4);
   ls_1012 = string((iHigh(NULL, PERIOD_D1, 1) - iLow(NULL, PERIOD_D1, 1)) / Point);
   l_dbl2str_988 = DoubleToStr((l_ihigh_1044 - l_ilow_1052) / Point, 0);
   if (l_iclose_1028 >= l_iopen_1020) {
      //ls_unused_996 = "-";
      l_color_104 = gi_904;
   }
   if (l_iclose_1028 < l_iopen_1020) {
      //ls_unused_996 = "-";
      l_color_104 = gi_908;
   }
   /*
   if (l_dbl2str_980 >= ls_1012) {
      //ls_unused_1004 = "-";
      //li_unused_108 = gi_912;
   }
   if (l_dbl2str_980 < ls_1012) {
      //ls_unused_1004 = "-";
      //li_unused_108 = gi_916;
   }
   */
   ObjectDelete("SIG_DETAIL_1");
   ObjectCreate("SIG_DETAIL_1", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SIG_DETAIL_1", "Spread", 14, "Times New Roman", g_color_892);
   ObjectSet("SIG_DETAIL_1", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SIG_DETAIL_1", OBJPROP_XDISTANCE, gi_864 + 65);
   ObjectSet("SIG_DETAIL_1", OBJPROP_YDISTANCE, gi_860 + 100);
   ObjectDelete("SIG_DETAIL_2");
   ObjectCreate("SIG_DETAIL_2", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SIG_DETAIL_2", "" + l_dbl2str_964 + "", 14, "Times New Roman", g_color_896);
   ObjectSet("SIG_DETAIL_2", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SIG_DETAIL_2", OBJPROP_XDISTANCE, gi_864 + 10);
   ObjectSet("SIG_DETAIL_2", OBJPROP_YDISTANCE, gi_860 + 100);
   ObjectDelete("SIG_DETAIL_3");
   ObjectCreate("SIG_DETAIL_3", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SIG_DETAIL_3", "Volatility Ratio", 14, "Times New Roman", g_color_892);
   ObjectSet("SIG_DETAIL_3", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SIG_DETAIL_3", OBJPROP_XDISTANCE, gi_864 + 65);
   ObjectSet("SIG_DETAIL_3", OBJPROP_YDISTANCE, gi_860 + 115);
   ObjectDelete("SIG_DETAIL_4");
   ObjectCreate("SIG_DETAIL_4", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SIG_DETAIL_4", "" + l_dbl2str_972 + "", 14, "Times New Roman", l_color_104);
   ObjectSet("SIG_DETAIL_4", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SIG_DETAIL_4", OBJPROP_XDISTANCE, gi_864 + 10);
   ObjectSet("SIG_DETAIL_4", OBJPROP_YDISTANCE, gi_860 + 115);
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
         if(CloseAllEquityLoss) CloseThisSymbolAll_Hilo();
         if(AlertPushEquityLoss) SendNotification("EquityLoss "+ ld_1128);
         Print("Closed All due_Hilo to Stop Out");
         gi_376 = FALSE;
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
      if (gi_364 && LastBuyPrice_Hilo - Ask >= PipStep * Point) gi_360 = TRUE;
      if (gi_368 && Bid - LastSellPrice_Hilo >= PipStep * Point) gi_360 = TRUE;
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
      l_ihigh_112 = iHigh(Symbol(), 0, 1);
      l_ilow_120 = iLow(Symbol(), 0, 2);
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
           if(CloseAllEquityLoss) CloseThisSymbolAll_15();
            
            if(AlertPushEquityLoss) SendNotification("EquityLoss "+ ld_160);
         
            Print("Closed All due to Stop Out");
            gi_588 = FALSE;
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
         if (gi_576 && gd_500 - Ask >= PipStep * Point) gi_572 = TRUE;
         if (gi_580 && Bid - gd_508 >= PipStep * Point) gi_572 = TRUE;
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
           if(CloseAllEquityLoss) CloseThisSymbolAll_16();
             
            if(AlertPushEquityLoss) SendNotification("EquityLoss "+ ld_184);
            Print("Closed All due to Stop Out");
            gi_804 = FALSE;
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
         if (gi_792 && gd_716 - Ask >= PipStep * Point) gi_788 = TRUE;
         if (gi_796 && Bid - gd_724 >= PipStep * Point) gi_788 = TRUE;
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



bool TimeFilter(){

 bool _res = false;
   datetime _time_curent = TimeCurrent();
   datetime _time_start = StrToTime(DoubleToStr(Year(),0)+"."+DoubleToStr(Month(),0)+"."+DoubleToStr(Day(),0)+" "+StartHour);
   datetime _time_stop = StrToTime(DoubleToStr(Year(),0)+"."+DoubleToStr(Month(),0)+"."+DoubleToStr(Day(),0)+" "+EndHour);
   if(((Trade_in_Monday==true) && (TimeDayOfWeek(Time[0]) == 1)) ||
   ((Trade_in_Tuesday==true) && (TimeDayOfWeek(Time[0]) == 2)) ||
   ((Trade_in_Wednesday==true) && (TimeDayOfWeek(Time[0]) == 3)) ||
   ((Trade_in_Thursday==true) && (TimeDayOfWeek(Time[0]) == 4)) ||
   ((Trade_in_Friday==true) && (TimeDayOfWeek(Time[0]) == 5)))
   
   
   if(_time_start > _time_stop){
      if(_time_curent >= _time_start || _time_curent <= _time_stop) _res = true;
   }else   
      if(_time_curent >= _time_start && _time_curent <= _time_stop) _res = true;
      
      return(_res); 
  
 }        
 
        
