//+------------------------------------------------------------------+
//|                                                       (Name).mq4 |
//|                                   Copyright 2023 Forex LLC Corp. |
//|                                                                  |
//+------------------------------------------------------------------+

#property copyright "https://t.me/llcgroupc10"
#property link      ""
#property version   "5.02"

#property description   "Forex LLC Group In Romania"
#property description   "Support Mail- llcgroup10@gmail.com"
#property description   "Support Telegram ID @llcgroup10 "
#property description   "Telegram Channel ID @llcgroupc10 "
#property description   "Used Currency/Pair US30 and DE40"
#property description   "Time Frame M5"
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
extern string Robot_Name = "Forex Mega-LLC V5.02";

extern double Fixed_Lot = 1;                    
extern double Auto_Lot = 0;   // Per 500= 1Lot                  
extern double Max_Lot = 30; 
extern double DayTargetMoney = 600;
extern string Settings = "All Setting Automatically Adjusted...";
extern bool UseMM = True;
extern double Risk = 1;
extern bool VirtualTakeProfit = True;
extern bool UseStopLoss = True;
extern bool VirtualStopLoss = True;
extern bool UseTakeProfitAll = True;
extern bool AutoTargetMoney = True;
extern bool AutoStopLossMoney = True;
extern double StoplossMoney  = 1;
extern bool UseVirtualTrailing = True;
extern int CandlestickHighLow = 500;
extern int MaxOrderBuy = 10000;
extern int MaxOrderSell = 10000;
extern int PendingDistance = 7;
extern int Pipstep = 899;
extern int     MaTrend_Period = 200;
extern int     MFI_Period = 5;
extern bool    UseDefaultMFI_Period = true;
extern int     BuyWhenMFIBelow = 65;
extern int     SellWhenMFIAbove = 35;
extern double  MFI_Overbought_Value = 75.0; 
extern double  MFI_Oversold_Value = 25.0;
extern int     useMFI4BarsBack = 0;
extern int     BuyWhenAbove = 55;
extern int     SellWhenBelow = 45;
extern int     useNewExitStrategy = 0;
extern int     MFI_High_OverBought_Exit = 98;
extern int     MFI_Low_OverSold_Exit = 2;
extern int     useMFI14_Exit = 1;
extern int     MFI_Exit_Period = 14;
extern int     Signal_TimeFrame = 5;
extern int     useMaAngleFilter = 44;
extern int     TrendTimeFrame = 5;
extern int     CurShift=54;
extern double  FirstMove = 20; 
extern double  FirstStopLoss = 50; 
extern double  SecondMove = 30;    
extern double  SecondStopLoss = 30;  
extern double  ThirdMove = 40;     
extern double  TrailingStop3 = 20; 
extern int TrailingStart = 8; 
extern double  BreakEven = 30;
extern int     LockInPips = 1;  
extern int     Price           =  00;
extern int     EMAPeriod       = 13;
extern int     EMAShift        =  2;    
extern int     InitialStop     =  0;
extern double  StepParabolic = 0.02;
extern double  MaxParabolic  = 0.2;
extern int     Interval      = 5;
//--
double Lots =0.01;
double LotExponent =1.44;
extern int lotdecimal =2;
double PipStep =190.0;
double MaxLots = 30.0;
bool MM = FALSE;
extern double RisdInPercent = 5.0;
extern bool AutoLotSize = True;
double TakeProfit = 50.0;
extern double  StopLoss=0;
bool UseEquityStop = FALSE;
extern double TotalEquityRisk = 20.0;
bool UseTrailingStop = True;
extern double TrailStart = 13.0;
extern double TrailStop = 3.0;
extern double slip = 3.0;
//---
extern double  SarStep = 0.02;
extern double  SarMax = 0.20;
extern string Start_Time = "08:00";                 // Start Time
extern string Stop_Time = "23:00";                  // Stop Time
//---
int MaxTrades_Hilo = 20;
bool gi_184 = FALSE;
double gd_188 = 48.0;
double g_pips_196 = 40.0;
double g_slippage_204;
int MagicNumber_Hilo = 10278;
double g_price_216;
double gd_224;
double gd_unused_232;
double gd_unused_240;
double gd_248;
double gd_256;
double g_price_264;
//-
double gd_288;
double gd_296;
double gd_304;
bool gi_312;
string gs_316 = "";
int gi_324 = 0;
int gi_328;
int gi_332 = 0;
double gd_336;
int g_pos_344 = 0;
int gi_348;
double gd_352 = 0.0;
bool gi_360 = FALSE;
bool gi_364 = FALSE;
bool gi_368 = FALSE;
int gi_372;
bool gi_376 = FALSE;
double gd_380;
double gd_388;
int MaxTrades_15 = 20;
int g_timeframe_408 = PERIOD_H1;
double g_pips_412 = 40.0;
bool gi_420 = FALSE;
double gd_424 = 48.0;
double g_slippage_432;
int g_magic_176_15 = 22324;
double g_price_444;
double gd_452;
double gd_unused_460;
double gd_unused_468;
double g_price_476;
//-
double gd_500;
double gd_508;
double gd_516;
bool gi_524;
string gs_528 = "";
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
int MaxTrades_16 = 20;
int g_timeframe_624 = PERIOD_M1;
double g_pips_628 = 40.0;
bool gi_636 = FALSE;
double gd_640 = 48.0;
double g_slippage_648;
int g_magic_176_16 = 23794;
double g_price_660;
double gd_668;
double gd_unused_676;
double gd_unused_684;
double g_price_692;
//-
double gd_716;
double gd_724;
double gd_732;
bool gi_740;
string gs_744 = "Forex Mega-LLC V5.02";
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
bool cg =FALSE;
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
bool gi_unused_876 = TRUE;
bool gi_880 = FALSE;
int g_color_884 = Gray;
int g_color_888 = Gray;
int g_color_892 = Gray;
int g_color_896 = DarkOrange;
int gi_unused_900 = 36095;
int g_color_904 = Lime;
int g_color_908 = OrangeRed;
int gi_912 = 65280;
int gi_916 = 17919;
int g_color_920 = Lime;
int g_color_924 = Red;
int g_color_928 = Orange;
int g_period_932 = 8;
int g_period_936 = 17;
int g_period_940 = 9;
int g_applied_price_944 = PRICE_CLOSE;
int g_color_948 = Lime;
int g_color_952 = Tomato;
int g_color_956 = Green;
int g_color_960 = Red;
string gs_unused_964 = "<<<< STR Indicator Settings >>>>>>>>>>>>>";
string gs_unused_972 = "<<<< RSI Settings >>>>>>>>>>>>>";
int g_period_980 = 9;
int g_applied_price_984 = PRICE_CLOSE;
string gs_unused_988 = "<<<< CCI Settings >>>>>>>>>>>>>>";
int g_period_996 = 13;
int g_applied_price_1000 = PRICE_CLOSE;
string gs_unused_1004 = "<<<< STOCH Settings >>>>>>>>>>>";
int g_period_1012 = 5;
int g_period_1016 = 3;
int g_slowing_1020 = 3;
int g_ma_method_1024 = MODE_EMA;
string gs_unused_1028 = "<<<< STR Colors >>>>>>>>>>>>>>>>";
int g_color_1036 = Lime;
int g_color_1040 = Red;
int g_color_1044 = Orange;
string gs_unused_1048 = "<<<< MA Settings >>>>>>>>>>>>>>";
int g_period_1056 = 5;
int g_period_1060 = 9;
int g_ma_method_1064 = MODE_EMA;
int g_applied_price_1068 = PRICE_CLOSE;
string gs_unused_1072 = "<<<< MA Colors >>>>>>>>>>>>>>";
int g_color_1080 = Lime;
int g_color_1084 = Red;
string gs_dummy_1088;
string g_text_1096;
string g_text_1104;
string g_dbl2str_1112 = "";
string g_dbl2str_1120 = "";
int g_color_1128 = ForestGreen;
// Modify
string objname[4] = {"Account Equity:","Volatility Ratio","Account Balance:","Spread"};
//******************************************* for meter
string Id = "aaa";
#define TABSIZE  19
#define ORDER    2
bool AccountIsIBFXmini = false;
bool LoopOnInit=false;
string aTradePair[]= {"GBPJPY"};
string aPair[]   = {"EURUSD","GBPUSD","AUDUSD","NZDUSD","USDJPY","USDCHF","USDCAD","EURCAD","GBPCAD",
                    "EURJPY","EURGBP","EURCHF","EURAUD","EURNZD","GBPJPY","GBPCHF","EURJPY"};
string aMajor[] = {"US30","GER40","GBP","CHF","CAD","AUD","NZD","JPY"};
int    aMajorPos[] = {185,160,135,110,85,60,35,10};
string aOrder[ORDER]    = {"BUY ","SELL "};
int    aTable[TABSIZE]  = {0,3,10,25,40,50,60,75,90,97,100};
int PairCount;
int CurrencyCount;
double aMeter[];
double aHigh[];
double aLow[];
double aBid[];
double aAsk[];
double aRatio[];
double aRange[];
double aLookup[];
double aStrength[];
int aIndex[2][100];
//  Meter
int Box_Top = 5;                   // Box Top Distance
//+------------------------------------------------------------------+ Start Of Currency Power Meter
double LowValue = 2.0;
double MaxValue = 8.0;
string PairAlert = "";
int AlertDelay = 30;
int Hours = 1;
string sOutput = "US30,GER40,GBP,NZD,USD,CAD,CHF,JPY";
string sPairs = "US30,GER40,GBP,EURJPY,EURAUD,EURNZD,GBPUSD,AUDUSD,NZDUSD,USDJPY,USDCHF,USDCAD,EURCAD,CADJPY,GBPJPY,GBPCHF";
color cCurrency = Lime;
color cScoreHigh = Aqua;
color cScoreHour = Orange;
string gsa_160[16];
string gsa_164[8];
int gia_168[8] = {220, 190, 160, 130, 100, 70, 40, 10};
int gia_172[] = {16612911, 16620590, 16702510, 15990063, 11206190, 5569869, 4193654, 3669164, 3407316, 3144445, 3144189, 3138813, 3069181, 3126526, 3046654, 3098621, 4207864, 4207864, 4207864, 4207864};
int gia_176[11] = {0, 4, 11, 23, 39, 50, 61, 78, 89, 96, 100};
int gi_180 = 16;
int gi_184U = 8;
double gda_188[8];
double gda_192[16];
double gda_196[16];
double gda_200[8];
double gda_204[16];
double gda_208[16];
int g_datetime_212 = 0;
bool gi_220 = TRUE;
int gia_228[64] = {65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 43, 47};
int gi_232 = 1;
string gs_dummy_236;
int gi_244 = 0;
int gi_248 = 0;
int g_count_252 = 0;
string gs_256;
int gia_264[1];
//End Of Currency Power Meter
//Start Of FX Market Signal
int Side = 1;
int MP_Y = 0; 
int MP_X = 0;
color Highest_Color          = Blue;
color Distance_from_Highest_Color = DodgerBlue;
color Lowest_Color           = Red;
color Distance_from_Lowest_Color  = OrangeRed;
color Hi_to_Lo_Color         = Peru;
color Daily_Av_Up_Color      = Blue;
color Daily_Av_Dn_Color      = Red;
color Time_n_Spread_Color    = LimeGreen;
color PipsToOpen_Up_Color    = Blue;
color PipsToOpen_Dn_Color    = Red;
bool  Show_Signals      = true;
int MAFast_Period = 1; 
int MAFast_Method = 0; 
int MAFast_Apply_To = 0;
int MAFast_Shift = 0;
int MASlow_Period = 4; 
int MASlow_Method = 0;
int MASlow_Apply_To = 1;
int MASlow_Shift = 0;
int TMAFast_Period = 1; 
int TMAFast_Method = 0; 
int TMAFast_Apply_To = 0;
int TMAFast_Shift = 0;
int TMASlow_Period = 20; 
int TMASlow_Method = 0;
int TMASlow_Apply_To = 0;
int TMASlow_Shift = 0;
int RSI_Period = 5;
int RSI_PRICE_TYPE = 0;
int CCI_Period = 20;
int CCI_PRICE_TYPE = 0;
int STOCH_K_Period = 5;
int STOCH_D_Period = 3;
int STOCH_Slowing = 3;
int STOCH_MA_MODE = 0;
int STOCH_Price_Field = 0;
color LegendColor = Gainsboro;
color PriceColor_Up = LimeGreen;
color PriceColor_Dn = Red;
color NeutralColor = LightGray;
color Arrow_Up = Lime;
color Arrow_Dn = Red;
color Arrow_Nt = White;
//---
double vA, vB, vC, TFs, High_Lama, Low_Lama;
int TimeFrame, xmp, ymp, space, baris, fontsize, cTF, cCC, cX, cSTR, cTR;
string textmp, fontname, Teks_Menit, Teks_Detik;
string UpSymbol="ñ",  DnSymbol="ò", NtSymbol="«", SignalSymbol;
color SignalColor;
int    R1, R5, R10, R20, RAvg, nmp, imp;
string Teks_ReRata = "", Teks_Rerata_Kemarin ="";
color  warna_ReRata, WarnaTeks;
double v_RSI, v_Stoch, v_CCI;
//+------------------------------------------------------------------+ End Of FX Market Signal
//+------------------------------------------------------------------+
//| Expire Date And Account Number Lock                              |
//+------------------------------------------------------------------+
int Account_Number = 0;                   // ex: 2164786 (Use 0 For Unlimited Account)
datetime Expiry_Date = D'31.12.2029';     // ex: D'31.12.2019'
//+------------------------------------------------------------------+
int init() {
//+------------------------------------------------------------------+
//| Expire Date And Account Number Lock                              |
//+------------------------------------------------------------------+
   if(Account_Number != AccountNumber() && Account_Number != 0){Alert("Your Account is not Registered (" + 
   AccountNumber() + ") Please Contact Skype & WhatsApp Number  !");ExpertRemove();}
   else if(Expiry_Date < TimeCurrent()){Alert("Licence Ended Please Contact Skype & WhatsApp Number");ExpertRemove();}
 //  else if(IsTesting()){Alert("Only Live Market Is Allowed");ExpertRemove();}
//+------------------------------------------------------------------+
  HideTestIndicators(true);// Belel Hide
  ChartSetInteger(0,CHART_SHOW_ONE_CLICK,0);
  if(!IsTesting())
    {
     EventSetMillisecondTimer(500);
    }
//******************************************* for meter
   int ps;
   PairCount=ArrayRange(aPair,0);
   CurrencyCount=ArrayRange(aMajor,0);
   ps=ArrayRange(aMajorPos,0);
   if(CurrencyCount!=ps) Print("The size of array aMajor is not equals to aMajorPos");

   ArrayResize(aMeter,CurrencyCount);
   ArrayResize(aHigh,PairCount);
   ArrayResize(aLow,PairCount);
   ArrayResize(aBid,PairCount);
   ArrayResize(aAsk,PairCount);
   ArrayResize(aRatio,PairCount);
   ArrayResize(aRange,PairCount);
   ArrayResize(aLookup,PairCount);
   ArrayResize(aStrength,PairCount);
   
   init_tradepair_index();
//----
   initGraph();
   if (LoopOnInit)
   {
      while (true)
      {
        if (IsConnected()) main();
        if (!IsConnected()) objectBlank();
        WindowRedraw();
        Sleep(1000);
      }
   }
//*******************************************
   gd_304 = MarketInfo(Symbol(), MODE_SPREAD) * Point;
   gd_516 = MarketInfo(Symbol(), MODE_SPREAD) * Point;
   gd_732 = MarketInfo(Symbol(), MODE_SPREAD) * Point;
   
   ObjectCreate("Lable1", OBJ_LABEL, 0, 0, 1.0);
   ObjectSet("Lable1", OBJPROP_CORNER, 2);
   ObjectSet("Lable1", OBJPROP_XDISTANCE, 7);
   ObjectSet("Lable1", OBJPROP_YDISTANCE, 90);
   ObjectSet("Lable1", OBJPROP_SELECTABLE, 0);
   g_text_1104 = "Forex LLC Group In Romania";
   ObjectSetText("Lable1", g_text_1104, 24, "Calibri", clrOrange);
   
   ObjectCreate("Lable", OBJ_LABEL, 0, 0, 1.0);
   ObjectSet("Lable", OBJPROP_CORNER, 2);
   ObjectSet("Lable", OBJPROP_XDISTANCE, 7);
   ObjectSet("Lable", OBJPROP_YDISTANCE, 55);
   ObjectSet("Lable", OBJPROP_SELECTABLE, 0);
   g_text_1096 = "Support Mail- llcgroup10@gmail.com";
   ObjectSetText("Lable", g_text_1096, 20, "Arial blacl", clrOrangeRed);
   
   ObjectCreate("Lable4", OBJ_LABEL, 0, 0, 1.0);
   ObjectSet("Lable4", OBJPROP_CORNER, 2);
   ObjectSet("Lable4", OBJPROP_XDISTANCE, 7);
   ObjectSet("Lable4", OBJPROP_YDISTANCE, 10);
   ObjectSet("Lable4", OBJPROP_SELECTABLE, 0);
   string g_text_10961 = "Robot Working Automatically...";
   ObjectSetText("Lable4", g_text_10961, 22, "Segoe UI Black", clrRed);
//+------------------------------------------------------------------+ Start Of Currency Power Meter
   int li_12;
   gi_220 = TRUE;
   string ls_0 = sOutput;
   int index_8 = 0;
   while (StringLen(ls_0) > 0) {
      li_12 = StringFind(ls_0, ",");
      gsa_164[index_8] = StringSubstr(ls_0, 0, 3);
      ls_0 = StringSubstr(ls_0, li_12 + 1);
      index_8++;
      if (li_12 < 0) break;
   }
   gi_184U = index_8;
   if (gi_184U > 8) {
      gi_184U = 8;
      Comment("\n\n ERRORR:\n  Maximum NUMBER of Output Currencies is 8 \n Only first 8 will be taken");
   }
   index_8 = 0;
   ls_0 = sPairs;
   while (StringLen(ls_0) > 0) {
      li_12 = StringFind(ls_0, ",");
      gsa_160[index_8] = StringSubstr(ls_0, 0, li_12);
      ls_0 = StringSubstr(ls_0, li_12 + 1);
      index_8++;
      if (li_12 < 0) break;
   }
   gi_180 = index_8;
   if (gi_180 > 16) {
      gi_180 = 16;
      Comment("\n\n ERRORR:\n  Maximum NUMBER of Pairs is 16 \n Only first 16 will be taken");
   }
   Print("PairCount:", gi_180);
   for (int index_16 = 0; index_16 < gi_184U; index_16++) {
       for (int count_20 = 0; count_20 < 20; count_20++) {
         objectCreateMeter("CPM" + gsa_164[index_16] + count_20, gia_168[index_16] + 1, 7 * (5 + count_20));
         objectCreateMeter("CPM" + gsa_164[index_16] + count_20 + "x", gia_168[index_16] - 4, 7 * (5 + count_20));
         objectCreateMeter("CPM" + gsa_164[index_16] + count_20 + "h", gia_168[index_16] + 11, 7 * (5 + count_20));
      }
       objectCreateMeter("CPM" + gsa_164[index_16], gia_168[index_16], 8, gsa_164[index_16], 9, "Verdana", cCurrency);
      objectCreateMeter("CPM" + gsa_164[index_16] + "_Str", gia_168[index_16], 42, DoubleToStr(0, 1), 8, "Verdana", cScoreHigh, 90);
      objectCreateMeter("CPM" + gsa_164[index_16] + "_Str_h", gia_168[index_16] + 12, 42, DoubleToStr(0, 1), 8, "Verdana", cScoreHour, 90);
    }
    
   ObjectsRedraw();
//End Of Currency Power Meter
   return (0);
}
//+--+
int deinit() {
   DeleteExistingLabels(); // Fore meter
   //  Modify
   for(int i=0;i<4;i++)
     {
      ObjectDelete(objname[i]);
     }
   
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
   ObjectDelete("Lable");
   ObjectDelete("Lable1");
   ObjectDelete("Lable2");
   ObjectDelete("Lable3");
   ObjectDelete("Lable4");
   Comment("");
   
   // Belal Duplicate
   ObjectDelete("SSignalTrend_TEXT");
   ObjectDelete("SSignalTrendM1");
   ObjectDelete("SSignalTrendM5");
   ObjectDelete("SSignalTrendM15");
   ObjectDelete("SSignalTrendM30");
   ObjectDelete("SSignalTrendH1");
   ObjectDelete("SSignalTrendH4");
   ObjectDelete("SSignalTrendD1");
  
   ObjectDelete("SSignalBand_TEXT");
   ObjectDelete("SSignalBandM1");
   ObjectDelete("SSignalBandM5");
   ObjectDelete("SSignalBandM15");
   ObjectDelete("SSignalBandM30");
   ObjectDelete("SSignalBandH1");
   ObjectDelete("SSignalBandH4");
   ObjectDelete("SSignalBandD1");
   
   ObjectDelete("SSignalRSI_TEXT");
   ObjectDelete("SSignalRSIM1");
   ObjectDelete("SSignalRSIM5");
   ObjectDelete("SSignalRSIM15");
   ObjectDelete("SSignalRSIM30");
   ObjectDelete("SSignalRSIH1");
   ObjectDelete("SSignalRSIH4");
   ObjectDelete("SSignalRSID1");
//+------------------------------------------------------------------+ Start Of Currency Power Meter
   int objs_total_0;
   Comment("");
   string name_4 = "";
   bool li_12 = TRUE;
   while (li_12) {
      li_12 = FALSE;
      objs_total_0 = ObjectsTotal();
      for (int li_16 = 0; li_16 < objs_total_0; li_16++) {
         name_4 = ObjectName(li_16);
         if (StringFind(name_4, "CPM") != -1) {
            ObjectDelete(name_4);
            li_12 = TRUE;
         }
      }
   }
//+------------------------------------------------------------------+ End Of Currency Power Meter
//+------------------------------------------------------------------+ Start Of FX Market Signal
   for(int k = ObjectsTotal() - 1; k >= 0; k--)
     {
       string label = ObjectName(k);
       if(StringSubstr(label, 0, 4) != "MP14")
           continue;
       ObjectDelete(label);   
     }
//+------------------------------------------------------------------+ End Of FX Market Signal
   EventKillTimer();
//---
   return (0);
}
//=============================================================================================================
int start()
 {
//---
   if (!LoopOnInit) main(); // For meter
   double iopenbelal = iOpen(NULL, PERIOD_D1, 0);
   double iclosebelal = iClose(NULL, PERIOD_D1, 0);
   double belalvola = DoubleToStr((iclosebelal - iopenbelal) / Point, 0);
   int xdistance = 22; // DAN BAM(Komaile dane jabe)
   int ydistance = 5;// OPOR NICHE (Baraile Opore Jabe)
   for(int i=0;i<4;i++)
     {
      int ycal = ydistance;
      if(i > 1)
        {
         ycal = ydistance+17;
        }
      int xcal = xdistance;
      if(i == 0 || i == 2)
        {
         xcal = xdistance+190;
        }
      color infoclr = clrLime;
      if(i == 1 || i == 3)
        {
         infoclr = clrOrangeRed;
        }
      ObjectCreate (objname[i], OBJ_LABEL, 0, 0, 0);
      ObjectSetText(objname[i], objname[i], 12, "Calibri", infoclr);
      ObjectSet    (objname[i], OBJPROP_CORNER, 3);
      ObjectSet    (objname[i], OBJPROP_XDISTANCE, xcal);
      ObjectSet    (objname[i], OBJPROP_YDISTANCE, ycal);
      ObjectSet    (objname[i], OBJPROP_SELECTABLE,false);
      ObjectSet    (objname[i], OBJPROP_HIDDEN,true);
     }
  ObjectSetString(0,"Spread",OBJPROP_TEXT,"Spread: "+DoubleToStr((MarketInfo(Symbol(), MODE_SPREAD)/10), 1));
  ObjectSetString(0,"Volatility Ratio",OBJPROP_TEXT,"Volatility Ratio: "+(string)belalvola);
  ObjectSetString(0,"Account Balance:",OBJPROP_TEXT,"Account Balance: "+DoubleToStr(AccountBalance(), 2));
  ObjectSetString(0,"Account Equity:",OBJPROP_TEXT,"Account Equity: "+DoubleToStr(AccountEquity(),2));
//------------------------------------------------------------------------------  
   int li_0;
   int li_4;
   int li_8;
   int li_12;
   int li_16;
   int li_20;
   int li_24;
   color color_28;
   color color_32;
   color color_36;
   color color_40;
   color color_44;
   color color_48;
   color color_52;
   string ls_unused_56;
   color color_64;
   color color_68;
   color color_72;
   color color_76;
   color color_80;
   color color_84;
   color color_88;
   color color_92;
   string ls_unused_96;
   color color_104;
   int li_unused_108;
   double ihigh_112;
   double ilow_120;
   double iclose_128;
   double iclose_136;
   double ld_144;
   double ld_152;
   double ld_160;
   int li_168;
   int count_172;
   double ld_176;
   double ld_184;
   int li_192;
   int count_196;
   int ind_counted_200 = IndicatorCounted();
   if (Lots > MaxLots) Lots = MaxLots;
   
   Comment("" 
     // + "\n"
      //+ "\n" 
      //+ "\n" 
      //+ "\n" 
      //+ "\n" 
      //+ "\n" 
      //+ "\n" 
      //+ "\n" 
      //+ "\n"
      //+ " Support mail         :threesystem1@gmail.com" 
      //+ "\n"
      //+ " Copy Right           :TFC Group" 
      //+ "\n" 
      //+ "___________________________________________________" 
      //+ "\n" 
      //+ " Broker                 :" + AccountCompany() 
      //+ "\n" 
      //+ "                             Brokers Time              :" + TimeToStr(TimeCurrent(), TIME_DATE|TIME_SECONDS) 
      //+ "\n" 
      //+ "___________________________________________________" 
      // + "\n" 
      //+ " Name                  :" + AccountName() 
      //+ "\n" 
      //+ " Account Number   :" + AccountNumber() 
      //+ "\n" 
      //+ "                             Account Currency        :" + AccountCurrency() 
      //+ "\n" 
      //+ "____________________________________________________" 
      //+ "\n"
      //+ " Orders F              :" + CountTrades_Hilo() 
      //+ "\n"
      //+ " Orders C              :" + CountTrades_15() 
      //+ "\n" 
      //+ " Orders T              :" + CountTrades_16() 
      //+ "\n" 
      //+ " All Orders            :" + OrdersTotal() 
      //+ "\n" 
      //+ "_____________________________________________________" 
      //+ "\n" 
      //+ "                             Balance                      :" + DoubleToStr(AccountBalance(), 2) 
      //+ "\n" 
      //+ "                             Equity                        :" + DoubleToStr(AccountEquity(), 2) 
      //+ "\n" 
   + "");
   gd_248 = NormalizeDouble(AccountBalance(), 2);
   gd_256 = NormalizeDouble(AccountEquity(), 2);
   if (gd_256 >= 5.0 * (gd_248 / 6.0)) g_color_1128 = DodgerBlue;
   if (gd_256 >= 4.0 * (gd_248 / 6.0) && gd_256 < 5.0 * (gd_248 / 6.0)) g_color_1128 = DeepSkyBlue;
   if (gd_256 >= 3.0 * (gd_248 / 6.0) && gd_256 < 4.0 * (gd_248 / 6.0)) g_color_1128 = Gold;
   if (gd_256 >= 2.0 * (gd_248 / 6.0) && gd_256 < 3.0 * (gd_248 / 6.0)) g_color_1128 = OrangeRed;
   if (gd_256 >= gd_248 / 6.0 && gd_256 < 2.0 * (gd_248 / 6.0)) g_color_1128 = Crimson;
   if (gd_256 < gd_248 / 5.0) g_color_1128 = Red;
   /*
   ObjectDelete("Lable2");
   ObjectCreate("Lable2", OBJ_LABEL, 0, 0, 1.0);
   ObjectSet("Lable2", OBJPROP_CORNER, 3);
   ObjectSet("Lable2", OBJPROP_XDISTANCE, 153);
   ObjectSet("Lable2", OBJPROP_YDISTANCE, 31);
   g_dbl2str_1112 = DoubleToStr(AccountBalance(), 2);
   ObjectSetText("Lable2", "Account BALANCE:  " + g_dbl2str_1112 + "", 10, "Times New Roman", DodgerBlue);
   ObjectDelete("Lable3");
   ObjectCreate("Lable3", OBJ_LABEL, 0, 0, 1.0);
   ObjectSet("Lable3", OBJPROP_CORNER, 3);
   ObjectSet("Lable3", OBJPROP_XDISTANCE, 153);
   ObjectSet("Lable3", OBJPROP_YDISTANCE, 11);
   g_dbl2str_1120 = DoubleToStr(AccountEquity(), 2);
   ObjectSetText("Lable3", "Account EQUITY:  " + g_dbl2str_1120 + "", 10, "Times New Roman", g_color_1128);
   */
   int ind_counted_204 = IndicatorCounted();
   string text_208 = "";
   string text_216 = "";
   string text_224 = "";
   string text_232 = "";
   string text_240 = "";
   string text_248 = "";
   string text_256 = "";
   if (g_timeframe_828 == PERIOD_M1) text_208 = "M1";
   if (g_timeframe_828 == PERIOD_M5) text_208 = "M5";
   if (g_timeframe_828 == PERIOD_M15) text_208 = "M15";
   if (g_timeframe_828 == PERIOD_M30) text_208 = "M30";
   if (g_timeframe_828 == PERIOD_H1) text_208 = "H1";
   if (g_timeframe_828 == PERIOD_H4) text_208 = "H4";
   if (g_timeframe_828 == PERIOD_D1) text_208 = "D1";
   if (g_timeframe_828 == PERIOD_W1) text_208 = "W1";
   if (g_timeframe_828 == PERIOD_MN1) text_208 = "MN";
   if (g_timeframe_832 == PERIOD_M1) text_216 = "M1";
   if (g_timeframe_832 == PERIOD_M5) text_216 = "M5";
   if (g_timeframe_832 == PERIOD_M15) text_216 = "M15";
   if (g_timeframe_832 == PERIOD_M30) text_216 = "M30";
   if (g_timeframe_832 == PERIOD_H1) text_216 = "H1";
   if (g_timeframe_832 == PERIOD_H4) text_216 = "H4";
   if (g_timeframe_832 == PERIOD_D1) text_216 = "D1";
   if (g_timeframe_832 == PERIOD_W1) text_216 = "W1";
   if (g_timeframe_832 == PERIOD_MN1) text_216 = "MN";
   if (g_timeframe_836 == PERIOD_M1) text_224 = "M1";
   if (g_timeframe_836 == PERIOD_M5) text_224 = "M5";
   if (g_timeframe_836 == PERIOD_M15) text_224 = "M15";
   if (g_timeframe_836 == PERIOD_M30) text_224 = "M30";
   if (g_timeframe_836 == PERIOD_H1) text_224 = "H1";
   if (g_timeframe_836 == PERIOD_H4) text_224 = "H4";
   if (g_timeframe_836 == PERIOD_D1) text_224 = "D1";
   if (g_timeframe_836 == PERIOD_W1) text_224 = "W1";
   if (g_timeframe_836 == PERIOD_MN1) text_224 = "MN";
   if (g_timeframe_840 == PERIOD_M1) text_232 = "M1";
   if (g_timeframe_840 == PERIOD_M5) text_232 = "M5";
   if (g_timeframe_840 == PERIOD_M15) text_232 = "M15";
   if (g_timeframe_840 == PERIOD_M30) text_232 = "M30";
   if (g_timeframe_840 == PERIOD_H1) text_232 = "H1";
   if (g_timeframe_840 == PERIOD_H4) text_232 = "H4";
   if (g_timeframe_840 == PERIOD_D1) text_232 = "D1";
   if (g_timeframe_840 == PERIOD_W1) text_232 = "W1";
   if (g_timeframe_840 == PERIOD_MN1) text_232 = "MN";
   if (g_timeframe_844 == PERIOD_M1) text_240 = "M1";
   if (g_timeframe_844 == PERIOD_M5) text_240 = "M5";
   if (g_timeframe_844 == PERIOD_M15) text_240 = "M15";
   if (g_timeframe_844 == PERIOD_M30) text_240 = "M30";
   if (g_timeframe_844 == PERIOD_H1) text_240 = "H1";
   if (g_timeframe_844 == PERIOD_H4) text_240 = "H4";
   if (g_timeframe_844 == PERIOD_D1) text_240 = "D1";
   if (g_timeframe_844 == PERIOD_W1) text_240 = "W1";
   if (g_timeframe_844 == PERIOD_MN1) text_240 = "MN";
   if (g_timeframe_848 == PERIOD_M1) text_248 = "M1";
   if (g_timeframe_848 == PERIOD_M5) text_248 = "M5";
   if (g_timeframe_848 == PERIOD_M15) text_248 = "M15";
   if (g_timeframe_848 == PERIOD_M30) text_248 = "M30";
   if (g_timeframe_848 == PERIOD_H1) text_248 = "H1";
   if (g_timeframe_848 == PERIOD_H4) text_248 = "H4";
   if (g_timeframe_848 == PERIOD_D1) text_248 = "D1";
   if (g_timeframe_848 == PERIOD_W1) text_248 = "W1";
   if (g_timeframe_848 == PERIOD_MN1) text_248 = "MN";
   if (g_timeframe_852 == PERIOD_M1) text_256 = "M1";
   if (g_timeframe_852 == PERIOD_M5) text_256 = "M5";
   if (g_timeframe_852 == PERIOD_M15) text_256 = "M15";
   if (g_timeframe_852 == PERIOD_M30) text_256 = "M30";
   if (g_timeframe_852 == PERIOD_H1) text_256 = "H1";
   if (g_timeframe_852 == PERIOD_H4) text_256 = "H4";
   if (g_timeframe_852 == PERIOD_D1) text_256 = "D1";
   if (g_timeframe_852 == PERIOD_W1) text_256 = "W1";
   if (g_timeframe_852 == PERIOD_MN1) text_256 = "MN";
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
   if (gi_860 < 0) return (0);
   ObjectDelete("SIG_BARS_TF1");
   ObjectCreate("SIG_BARS_TF1", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SIG_BARS_TF1", text_208, 7, "Arial Bold", g_color_884);
   ObjectSet("SIG_BARS_TF1", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SIG_BARS_TF1", OBJPROP_XDISTANCE, gi_864 + 134 + li_0);
   ObjectSet("SIG_BARS_TF1", OBJPROP_YDISTANCE, gi_860 + 25);
   ObjectDelete("SIG_BARS_TF2");
   ObjectCreate("SIG_BARS_TF2", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SIG_BARS_TF2", text_216, 7, "Arial Bold", g_color_884);
   ObjectSet("SIG_BARS_TF2", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SIG_BARS_TF2", OBJPROP_XDISTANCE, gi_864 + 114 + li_4);
   ObjectSet("SIG_BARS_TF2", OBJPROP_YDISTANCE, gi_860 + 25);
   ObjectDelete("SIG_BARS_TF3");
   ObjectCreate("SIG_BARS_TF3", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SIG_BARS_TF3", text_224, 7, "Arial Bold", g_color_884);
   ObjectSet("SIG_BARS_TF3", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SIG_BARS_TF3", OBJPROP_XDISTANCE, gi_864 + 94 + li_8);
   ObjectSet("SIG_BARS_TF3", OBJPROP_YDISTANCE, gi_860 + 25);
   ObjectDelete("SIG_BARS_TF4");
   ObjectCreate("SIG_BARS_TF4", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SIG_BARS_TF4", text_232, 7, "Arial Bold", g_color_884);
   ObjectSet("SIG_BARS_TF4", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SIG_BARS_TF4", OBJPROP_XDISTANCE, gi_864 + 74 + li_12);
   ObjectSet("SIG_BARS_TF4", OBJPROP_YDISTANCE, gi_860 + 25);
   ObjectDelete("SIG_BARS_TF5");
   ObjectCreate("SIG_BARS_TF5", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SIG_BARS_TF5", text_240, 7, "Arial Bold", g_color_884);
   ObjectSet("SIG_BARS_TF5", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SIG_BARS_TF5", OBJPROP_XDISTANCE, gi_864 + 54 + li_16);
   ObjectSet("SIG_BARS_TF5", OBJPROP_YDISTANCE, gi_860 + 25);
   ObjectDelete("SIG_BARS_TF6");
   ObjectCreate("SIG_BARS_TF6", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SIG_BARS_TF6", text_248, 7, "Arial Bold", g_color_884);
   ObjectSet("SIG_BARS_TF6", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SIG_BARS_TF6", OBJPROP_XDISTANCE, gi_864 + 34 + li_20);
   ObjectSet("SIG_BARS_TF6", OBJPROP_YDISTANCE, gi_860 + 25);
   ObjectDelete("SIG_BARS_TF7");
   ObjectCreate("SIG_BARS_TF7", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SIG_BARS_TF7", text_256, 7, "Arial Bold", g_color_884);
   ObjectSet("SIG_BARS_TF7", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SIG_BARS_TF7", OBJPROP_XDISTANCE, gi_864 + 14 + li_24);
   ObjectSet("SIG_BARS_TF7", OBJPROP_YDISTANCE, gi_860 + 25);
   string text_264 = "";
   string text_272 = "";
   string text_280 = "";
   string text_288 = "";
   string text_296 = "";
   string text_304 = "";
   string text_312 = "";
   string ls_unused_320 = "";
   string ls_unused_328 = "";
   double imacd_336 = iMACD(NULL, g_timeframe_828, g_period_932, g_period_936, g_period_940, g_applied_price_944, MODE_MAIN, 0);
   double imacd_344 = iMACD(NULL, g_timeframe_828, g_period_932, g_period_936, g_period_940, g_applied_price_944, MODE_SIGNAL, 0);
   double imacd_352 = iMACD(NULL, g_timeframe_832, g_period_932, g_period_936, g_period_940, g_applied_price_944, MODE_MAIN, 0);
   double imacd_360 = iMACD(NULL, g_timeframe_832, g_period_932, g_period_936, g_period_940, g_applied_price_944, MODE_SIGNAL, 0);
   double imacd_368 = iMACD(NULL, g_timeframe_836, g_period_932, g_period_936, g_period_940, g_applied_price_944, MODE_MAIN, 0);
   double imacd_376 = iMACD(NULL, g_timeframe_836, g_period_932, g_period_936, g_period_940, g_applied_price_944, MODE_SIGNAL, 0);
   double imacd_384 = iMACD(NULL, g_timeframe_840, g_period_932, g_period_936, g_period_940, g_applied_price_944, MODE_MAIN, 0);
   double imacd_392 = iMACD(NULL, g_timeframe_840, g_period_932, g_period_936, g_period_940, g_applied_price_944, MODE_SIGNAL, 0);
   double imacd_400 = iMACD(NULL, g_timeframe_844, g_period_932, g_period_936, g_period_940, g_applied_price_944, MODE_MAIN, 0);
   double imacd_408 = iMACD(NULL, g_timeframe_844, g_period_932, g_period_936, g_period_940, g_applied_price_944, MODE_SIGNAL, 0);
   double imacd_416 = iMACD(NULL, g_timeframe_848, g_period_932, g_period_936, g_period_940, g_applied_price_944, MODE_MAIN, 0);
   double imacd_424 = iMACD(NULL, g_timeframe_848, g_period_932, g_period_936, g_period_940, g_applied_price_944, MODE_SIGNAL, 0);
   double imacd_432 = iMACD(NULL, g_timeframe_852, g_period_932, g_period_936, g_period_940, g_applied_price_944, MODE_MAIN, 0);
   double imacd_440 = iMACD(NULL, g_timeframe_852, g_period_932, g_period_936, g_period_940, g_applied_price_944, MODE_SIGNAL, 0);
   if (imacd_336 > imacd_344) {
      text_288 = "-";
      color_40 = g_color_956;
   }
   if (imacd_336 <= imacd_344) {
      text_288 = "-";
      color_40 = g_color_952;
   }
   if (imacd_336 > imacd_344 && imacd_336 > 0.0) {
      text_288 = "-";
      color_40 = g_color_948;
   }
   if (imacd_336 <= imacd_344 && imacd_336 < 0.0) {
      text_288 = "-";
      color_40 = g_color_960;
   }
   if (imacd_352 > imacd_360) {
      text_296 = "-";
      color_44 = g_color_956;
   }
   if (imacd_352 <= imacd_360) {
      text_296 = "-";
      color_44 = g_color_952;
   }
   if (imacd_352 > imacd_360 && imacd_352 > 0.0) {
      text_296 = "-";
      color_44 = g_color_948;
   }
   if (imacd_352 <= imacd_360 && imacd_352 < 0.0) {
      text_296 = "-";
      color_44 = g_color_960;
   }
   if (imacd_368 > imacd_376) {
      text_304 = "-";
      color_48 = g_color_956;
   }
   if (imacd_368 <= imacd_376) {
      text_304 = "-";
      color_48 = g_color_952;
   }
   if (imacd_368 > imacd_376 && imacd_368 > 0.0) {
      text_304 = "-";
      color_48 = g_color_948;
   }
   if (imacd_368 <= imacd_376 && imacd_368 < 0.0) {
      text_304 = "-";
      color_48 = g_color_960;
   }
   if (imacd_384 > imacd_392) {
      text_312 = "-";
      color_52 = g_color_956;
   }
   if (imacd_384 <= imacd_392) {
      text_312 = "-";
      color_52 = g_color_952;
   }
   if (imacd_384 > imacd_392 && imacd_384 > 0.0) {
      text_312 = "-";
      color_52 = g_color_948;
   }
   if (imacd_384 <= imacd_392 && imacd_384 < 0.0) {
      text_312 = "-";
      color_52 = g_color_960;
   }
   if (imacd_400 > imacd_408) {
      text_272 = "-";
      color_32 = g_color_956;
   }
   if (imacd_400 <= imacd_408) {
      text_272 = "-";
      color_32 = g_color_952;
   }
   if (imacd_400 > imacd_408 && imacd_400 > 0.0) {
      text_272 = "-";
      color_32 = g_color_948;
   }
   if (imacd_400 <= imacd_408 && imacd_400 < 0.0) {
      text_272 = "-";
      color_32 = g_color_960;
   }
   if (imacd_416 > imacd_424) {
      text_280 = "-";
      color_36 = g_color_956;
   }
   if (imacd_416 <= imacd_424) {
      text_280 = "-";
      color_36 = g_color_952;
   }
   if (imacd_416 > imacd_424 && imacd_416 > 0.0) {
      text_280 = "-";
      color_36 = g_color_948;
   }
   if (imacd_416 <= imacd_424 && imacd_416 < 0.0) {
      text_280 = "-";
      color_36 = g_color_960;
   }
   if (imacd_432 > imacd_440) {
      text_264 = "-";
      color_28 = g_color_956;
   }
   if (imacd_432 <= imacd_440) {
      text_264 = "-";
      color_28 = g_color_952;
   }
   if (imacd_432 > imacd_440 && imacd_432 > 0.0) {
      text_264 = "-";
      color_28 = g_color_948;
   }
   if (imacd_432 <= imacd_440 && imacd_432 < 0.0) {
      text_264 = "-";
      color_28 = g_color_960;
   }
   ObjectDelete("SSignalMACD_TEXT");
   ObjectCreate("SSignalMACD_TEXT", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SSignalMACD_TEXT", "PARABOLIC", 6, "Tahoma Narrow", g_color_888);
   ObjectSet("SSignalMACD_TEXT", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SSignalMACD_TEXT", OBJPROP_XDISTANCE, gi_864 + 153);
   ObjectSet("SSignalMACD_TEXT", OBJPROP_YDISTANCE, gi_860 + 35);
   ObjectDelete("SSignalMACDM1");
   ObjectCreate("SSignalMACDM1", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SSignalMACDM1", text_288, 45, "Tahoma Narrow", color_40);
   ObjectSet("SSignalMACDM1", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SSignalMACDM1", OBJPROP_XDISTANCE, gi_864 + 130);
   ObjectSet("SSignalMACDM1", OBJPROP_YDISTANCE, gi_860 + 2);
   ObjectDelete("SSignalMACDM5");
   ObjectCreate("SSignalMACDM5", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SSignalMACDM5", text_296, 45, "Tahoma Narrow", color_44);
   ObjectSet("SSignalMACDM5", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SSignalMACDM5", OBJPROP_XDISTANCE, gi_864 + 110);
   ObjectSet("SSignalMACDM5", OBJPROP_YDISTANCE, gi_860 + 2);
   ObjectDelete("SSignalMACDM15");
   ObjectCreate("SSignalMACDM15", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SSignalMACDM15", text_304, 45, "Tahoma Narrow", color_48);
   ObjectSet("SSignalMACDM15", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SSignalMACDM15", OBJPROP_XDISTANCE, gi_864 + 90);
   ObjectSet("SSignalMACDM15", OBJPROP_YDISTANCE, gi_860 + 2);
   ObjectDelete("SSignalMACDM30");
   ObjectCreate("SSignalMACDM30", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SSignalMACDM30", text_312, 45, "Tahoma Narrow", color_52);
   ObjectSet("SSignalMACDM30", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SSignalMACDM30", OBJPROP_XDISTANCE, gi_864 + 70);
   ObjectSet("SSignalMACDM30", OBJPROP_YDISTANCE, gi_860 + 2);
   ObjectDelete("SSignalMACDH1");
   ObjectCreate("SSignalMACDH1", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SSignalMACDH1", text_272, 45, "Tahoma Narrow", color_32);
   ObjectSet("SSignalMACDH1", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SSignalMACDH1", OBJPROP_XDISTANCE, gi_864 + 50);
   ObjectSet("SSignalMACDH1", OBJPROP_YDISTANCE, gi_860 + 2);
   ObjectDelete("SSignalMACDH4");
   ObjectCreate("SSignalMACDH4", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SSignalMACDH4", text_280, 45, "Tahoma Narrow", color_36);
   ObjectSet("SSignalMACDH4", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SSignalMACDH4", OBJPROP_XDISTANCE, gi_864 + 30);
   ObjectSet("SSignalMACDH4", OBJPROP_YDISTANCE, gi_860 + 2);
   ObjectDelete("SSignalMACDD1");
   ObjectCreate("SSignalMACDD1", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SSignalMACDD1", text_264, 45, "Tahoma Narrow", color_28);
   ObjectSet("SSignalMACDD1", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SSignalMACDD1", OBJPROP_XDISTANCE, gi_864 + 10);
   ObjectSet("SSignalMACDD1", OBJPROP_YDISTANCE, gi_860 + 2);
   
  
   double irsi_448 = iRSI(NULL, g_timeframe_852, g_period_980, g_applied_price_984, 0);
   double irsi_456 = iRSI(NULL, g_timeframe_848, g_period_980, g_applied_price_984, 0);
   double irsi_464 = iRSI(NULL, g_timeframe_844, g_period_980, g_applied_price_984, 0);
   double irsi_472 = iRSI(NULL, g_timeframe_840, g_period_980, g_applied_price_984, 0);
   double irsi_480 = iRSI(NULL, g_timeframe_836, g_period_980, g_applied_price_984, 0);
   double irsi_488 = iRSI(NULL, g_timeframe_832, g_period_980, g_applied_price_984, 0);
   double irsi_496 = iRSI(NULL, g_timeframe_828, g_period_980, g_applied_price_984, 0);
   double istochastic_504 = iStochastic(NULL, g_timeframe_852, g_period_1012, g_period_1016, g_slowing_1020, g_ma_method_1024, 0, MODE_MAIN, 0);
   double istochastic_512 = iStochastic(NULL, g_timeframe_848, g_period_1012, g_period_1016, g_slowing_1020, g_ma_method_1024, 0, MODE_MAIN, 0);
   double istochastic_520 = iStochastic(NULL, g_timeframe_844, g_period_1012, g_period_1016, g_slowing_1020, g_ma_method_1024, 0, MODE_MAIN, 0);
   double istochastic_528 = iStochastic(NULL, g_timeframe_840, g_period_1012, g_period_1016, g_slowing_1020, g_ma_method_1024, 0, MODE_MAIN, 0);
   double istochastic_536 = iStochastic(NULL, g_timeframe_836, g_period_1012, g_period_1016, g_slowing_1020, g_ma_method_1024, 0, MODE_MAIN, 0);
   double istochastic_544 = iStochastic(NULL, g_timeframe_832, g_period_1012, g_period_1016, g_slowing_1020, g_ma_method_1024, 0, MODE_MAIN, 0);
   double istochastic_552 = iStochastic(NULL, g_timeframe_828, g_period_1012, g_period_1016, g_slowing_1020, g_ma_method_1024, 0, MODE_MAIN, 0);
   double icci_560 = iCCI(NULL, g_timeframe_852, g_period_996, g_applied_price_1000, 0);
   double icci_568 = iCCI(NULL, g_timeframe_848, g_period_996, g_applied_price_1000, 0);
   double icci_576 = iCCI(NULL, g_timeframe_844, g_period_996, g_applied_price_1000, 0);
   double icci_584 = iCCI(NULL, g_timeframe_840, g_period_996, g_applied_price_1000, 0);
   double icci_592 = iCCI(NULL, g_timeframe_836, g_period_996, g_applied_price_1000, 0);
   double icci_600 = iCCI(NULL, g_timeframe_832, g_period_996, g_applied_price_1000, 0);
   double icci_608 = iCCI(NULL, g_timeframe_828, g_period_996, g_applied_price_1000, 0);
   string text_616 = "";
   string text_624 = "";
   string text_632 = "";
   string text_640 = "";
   string text_648 = "";
   string text_656 = "";
   string text_664 = "";
   string ls_unused_672 = "";
   string ls_unused_680 = "";
   text_664 = "-";
   color color_688 = g_color_1044;
   text_648 = "-";
   color color_692 = g_color_1044;
   text_616 = "-";
   color color_696 = g_color_1044;
   text_656 = "-";
   color color_700 = g_color_1044;
   text_624 = "-";
   color color_704 = g_color_1044;
   text_632 = "-";
   color color_708 = g_color_1044;
   text_640 = "-";
   color color_712 = g_color_1044;
   if (irsi_448 > 50.0 && istochastic_504 > 40.0 && icci_560 > 0.0) {
      text_664 = "-";
      color_688 = g_color_1036;
   }
   if (irsi_456 > 50.0 && istochastic_512 > 40.0 && icci_568 > 0.0) {
      text_648 = "-";
      color_692 = g_color_1036;
   }
   if (irsi_464 > 50.0 && istochastic_520 > 40.0 && icci_576 > 0.0) {
      text_616 = "-";
      color_696 = g_color_1036;
   }
   if (irsi_472 > 50.0 && istochastic_528 > 40.0 && icci_584 > 0.0) {
      text_656 = "-";
      color_700 = g_color_1036;
   }
   if (irsi_480 > 50.0 && istochastic_536 > 40.0 && icci_592 > 0.0) {
      text_624 = "-";
      color_704 = g_color_1036;
   }
   if (irsi_488 > 50.0 && istochastic_544 > 40.0 && icci_600 > 0.0) {
      text_632 = "-";
      color_708 = g_color_1036;
   }
   if (irsi_496 > 50.0 && istochastic_552 > 40.0 && icci_608 > 0.0) {
      text_640 = "-";
      color_712 = g_color_1036;
   }
   if (irsi_448 < 50.0 && istochastic_504 < 60.0 && icci_560 < 0.0) {
      text_664 = "-";
      color_688 = g_color_1040;
   }
   if (irsi_456 < 50.0 && istochastic_512 < 60.0 && icci_568 < 0.0) {
      text_648 = "-";
      color_692 = g_color_1040;
   }
   if (irsi_464 < 50.0 && istochastic_520 < 60.0 && icci_576 < 0.0) {
      text_616 = "-";
      color_696 = g_color_1040;
   }
   if (irsi_472 < 50.0 && istochastic_528 < 60.0 && icci_584 < 0.0) {
      text_656 = "-";
      color_700 = g_color_1040;
   }
   if (irsi_480 < 50.0 && istochastic_536 < 60.0 && icci_592 < 0.0) {
      text_624 = "-";
      color_704 = g_color_1040;
   }
   if (irsi_488 < 50.0 && istochastic_544 < 60.0 && icci_600 < 0.0) {
      text_632 = "-";
      color_708 = g_color_1040;
   }
   if (irsi_496 < 50.0 && istochastic_552 < 60.0 && icci_608 < 0.0) {
      text_640 = "-";
      color_712 = g_color_1040;
   }
   ObjectDelete("SSignalSTR_TEXT");
   ObjectCreate("SSignalSTR_TEXT", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SSignalSTR_TEXT", "CHANNEL", 6, "Tahoma Narrow", g_color_888);
   ObjectSet("SSignalSTR_TEXT", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SSignalSTR_TEXT", OBJPROP_XDISTANCE, gi_864 + 153);
   ObjectSet("SSignalSTR_TEXT", OBJPROP_YDISTANCE, gi_860 + 43);
   ObjectDelete("SignalSTRM1");
   ObjectCreate("SignalSTRM1", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SignalSTRM1", text_640, 45, "Tahoma Narrow", color_712);
   ObjectSet("SignalSTRM1", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SignalSTRM1", OBJPROP_XDISTANCE, gi_864 + 130);
   ObjectSet("SignalSTRM1", OBJPROP_YDISTANCE, gi_860 + 10);
   ObjectDelete("SignalSTRM5");
   ObjectCreate("SignalSTRM5", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SignalSTRM5", text_632, 45, "Tahoma Narrow", color_708);
   ObjectSet("SignalSTRM5", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SignalSTRM5", OBJPROP_XDISTANCE, gi_864 + 110);
   ObjectSet("SignalSTRM5", OBJPROP_YDISTANCE, gi_860 + 10);
   ObjectDelete("SignalSTRM15");
   ObjectCreate("SignalSTRM15", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SignalSTRM15", text_624, 45, "Tahoma Narrow", color_704);
   ObjectSet("SignalSTRM15", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SignalSTRM15", OBJPROP_XDISTANCE, gi_864 + 90);
   ObjectSet("SignalSTRM15", OBJPROP_YDISTANCE, gi_860 + 10);
   ObjectDelete("SignalSTRM30");
   ObjectCreate("SignalSTRM30", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SignalSTRM30", text_656, 45, "Tahoma Narrow", color_700);
   ObjectSet("SignalSTRM30", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SignalSTRM30", OBJPROP_XDISTANCE, gi_864 + 70);
   ObjectSet("SignalSTRM30", OBJPROP_YDISTANCE, gi_860 + 10);
   ObjectDelete("SignalSTRH1");
   ObjectCreate("SignalSTRH1", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SignalSTRH1", text_616, 45, "Tahoma Narrow", color_696);
   ObjectSet("SignalSTRH1", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SignalSTRH1", OBJPROP_XDISTANCE, gi_864 + 50);
   ObjectSet("SignalSTRH1", OBJPROP_YDISTANCE, gi_860 + 10);
   ObjectDelete("SignalSTRH4");
   ObjectCreate("SignalSTRH4", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SignalSTRH4", text_648, 45, "Tahoma Narrow", color_692);
   ObjectSet("SignalSTRH4", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SignalSTRH4", OBJPROP_XDISTANCE, gi_864 + 30);
   ObjectSet("SignalSTRH4", OBJPROP_YDISTANCE, gi_860 + 10);
   ObjectDelete("SignalSTRD1");
   ObjectCreate("SignalSTRD1", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SignalSTRD1", text_664, 45, "Tahoma Narrow", color_688);
   ObjectSet("SignalSTRD1", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SignalSTRD1", OBJPROP_XDISTANCE, gi_864 + 10);
   ObjectSet("SignalSTRD1", OBJPROP_YDISTANCE, gi_860 + 10);
   double ima_716 = iMA(Symbol(), g_timeframe_828, g_period_1056, 0, g_ma_method_1064, g_applied_price_1068, 0);
   double ima_724 = iMA(Symbol(), g_timeframe_828, g_period_1060, 0, g_ma_method_1064, g_applied_price_1068, 0);
   double ima_732 = iMA(Symbol(), g_timeframe_832, g_period_1056, 0, g_ma_method_1064, g_applied_price_1068, 0);
   double ima_740 = iMA(Symbol(), g_timeframe_832, g_period_1060, 0, g_ma_method_1064, g_applied_price_1068, 0);
   double ima_748 = iMA(Symbol(), g_timeframe_836, g_period_1056, 0, g_ma_method_1064, g_applied_price_1068, 0);
   double ima_756 = iMA(Symbol(), g_timeframe_836, g_period_1060, 0, g_ma_method_1064, g_applied_price_1068, 0);
   double ima_764 = iMA(Symbol(), g_timeframe_840, g_period_1056, 0, g_ma_method_1064, g_applied_price_1068, 0);
   double ima_772 = iMA(Symbol(), g_timeframe_840, g_period_1060, 0, g_ma_method_1064, g_applied_price_1068, 0);
   double ima_780 = iMA(Symbol(), g_timeframe_844, g_period_1056, 0, g_ma_method_1064, g_applied_price_1068, 0);
   double ima_788 = iMA(Symbol(), g_timeframe_844, g_period_1060, 0, g_ma_method_1064, g_applied_price_1068, 0);
   double ima_796 = iMA(Symbol(), g_timeframe_848, g_period_1056, 0, g_ma_method_1064, g_applied_price_1068, 0);
   double ima_804 = iMA(Symbol(), g_timeframe_848, g_period_1060, 0, g_ma_method_1064, g_applied_price_1068, 0);
   double ima_812 = iMA(Symbol(), g_timeframe_852, g_period_1056, 0, g_ma_method_1064, g_applied_price_1068, 0);
   double ima_820 = iMA(Symbol(), g_timeframe_852, g_period_1060, 0, g_ma_method_1064, g_applied_price_1068, 0);
   string text_828 = "";
   string text_836 = "";
   string text_844 = "";
   string text_852 = "";
   string text_860 = "";
   string text_868 = "";
   string text_876 = "";
   string ls_unused_884 = "";
   string ls_unused_892 = "";
   if (ima_716 > ima_724) {
      text_828 = "-";
      color_64 = g_color_1080;
   }
   if (ima_716 <= ima_724) {
      text_828 = "-";
      color_64 = g_color_1084;
   }
   if (ima_732 > ima_740) {
      text_836 = "-";
      color_68 = g_color_1080;
   }
   if (ima_732 <= ima_740) {
      text_836 = "-";
      color_68 = g_color_1084;
   }
   if (ima_748 > ima_756) {
      text_844 = "-";
      color_72 = g_color_1080;
   }
   if (ima_748 <= ima_756) {
      text_844 = "-";
      color_72 = g_color_1084;
   }
   if (ima_764 > ima_772) {
      text_852 = "-";
      color_76 = g_color_1080;
   }
   if (ima_764 <= ima_772) {
      text_852 = "-";
      color_76 = g_color_1084;
   }
   if (ima_780 > ima_788) {
      text_860 = "-";
      color_80 = g_color_1080;
   }
   if (ima_780 <= ima_788) {
      text_860 = "-";
      color_80 = g_color_1084;
   }
   if (ima_796 > ima_804) {
      text_868 = "-";
      color_84 = g_color_1080;
   }
   if (ima_796 <= ima_804) {
      text_868 = "-";
      color_84 = g_color_1084;
   }
   if (ima_812 > ima_820) {
      text_876 = "-";
      color_88 = g_color_1080;
   }
   if (ima_812 <= ima_820) {
      text_876 = "-";
      color_88 = g_color_1084;
   }
   ObjectDelete("SignalEMA_TEXT");
   ObjectCreate("SignalEMA_TEXT", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SignalEMA_TEXT", "B BANDS", 6, "Tahoma Narrow", g_color_888);
   ObjectSet("SignalEMA_TEXT", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SignalEMA_TEXT", OBJPROP_XDISTANCE, gi_864 + 153);
   ObjectSet("SignalEMA_TEXT", OBJPROP_YDISTANCE, gi_860 + 51);
   ObjectDelete("SignalEMAM1");
   ObjectCreate("SignalEMAM1", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SignalEMAM1", text_828, 45, "Tahoma Narrow", color_64);
   ObjectSet("SignalEMAM1", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SignalEMAM1", OBJPROP_XDISTANCE, gi_864 + 130);
   ObjectSet("SignalEMAM1", OBJPROP_YDISTANCE, gi_860 + 18);
   ObjectDelete("SignalEMAM5");
   ObjectCreate("SignalEMAM5", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SignalEMAM5", text_836, 45, "Tahoma Narrow", color_68);
   ObjectSet("SignalEMAM5", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SignalEMAM5", OBJPROP_XDISTANCE, gi_864 + 110);
   ObjectSet("SignalEMAM5", OBJPROP_YDISTANCE, gi_860 + 18);
   ObjectDelete("SignalEMAM15");
   ObjectCreate("SignalEMAM15", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SignalEMAM15", text_844, 45, "Tahoma Narrow", color_72);
   ObjectSet("SignalEMAM15", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SignalEMAM15", OBJPROP_XDISTANCE, gi_864 + 90);
   ObjectSet("SignalEMAM15", OBJPROP_YDISTANCE, gi_860 + 18);
   ObjectDelete("SignalEMAM30");
   ObjectCreate("SignalEMAM30", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SignalEMAM30", text_852, 45, "Tahoma Narrow", color_76);
   ObjectSet("SignalEMAM30", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SignalEMAM30", OBJPROP_XDISTANCE, gi_864 + 70);
   ObjectSet("SignalEMAM30", OBJPROP_YDISTANCE, gi_860 + 18);
   ObjectDelete("SignalEMAH1");
   ObjectCreate("SignalEMAH1", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SignalEMAH1", text_860, 45, "Tahoma Narrow", color_80);
   ObjectSet("SignalEMAH1", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SignalEMAH1", OBJPROP_XDISTANCE, gi_864 + 50);
   ObjectSet("SignalEMAH1", OBJPROP_YDISTANCE, gi_860 + 18);
   ObjectDelete("SignalEMAH4");
   ObjectCreate("SignalEMAH4", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SignalEMAH4", text_868, 45, "Tahoma Narrow", color_84);
   ObjectSet("SignalEMAH4", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SignalEMAH4", OBJPROP_XDISTANCE, gi_864 + 30);
   ObjectSet("SignalEMAH4", OBJPROP_YDISTANCE, gi_860 + 18);
   ObjectDelete("SignalEMAD1");
   ObjectCreate("SignalEMAD1", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SignalEMAD1", text_876, 45, "Tahoma Narrow", color_88);
   ObjectSet("SignalEMAD1", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SignalEMAD1", OBJPROP_XDISTANCE, gi_864 + 10);
   ObjectSet("SignalEMAD1", OBJPROP_YDISTANCE, gi_860 + 18);
   
   
      //----------------- Duplicate Belal-------------------------------   
   ObjectDelete("SSignalTrend_TEXT");
   ObjectCreate("SSignalTrend_TEXT", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SSignalTrend_TEXT", "TREND", 6, "Tahoma Narrow", g_color_888);
   ObjectSet("SSignalTrend_TEXT", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SSignalTrend_TEXT", OBJPROP_XDISTANCE, gi_864 + 153);
   ObjectSet("SSignalTrend_TEXT", OBJPROP_YDISTANCE, gi_860 + 59);
   ObjectDelete("SSignalTrendM1");
   ObjectCreate("SSignalTrendM1", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SSignalTrendM1", text_288, 45, "Tahoma Narrow", color_40);
   ObjectSet("SSignalTrendM1", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SSignalTrendM1", OBJPROP_XDISTANCE, gi_864 + 130);
   ObjectSet("SSignalTrendM1", OBJPROP_YDISTANCE, gi_860 + 26);
   ObjectDelete("SSignalTrendM5");
   ObjectCreate("SSignalTrendM5", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SSignalTrendM5", text_296, 45, "Tahoma Narrow", color_44);
   ObjectSet("SSignalTrendM5", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SSignalTrendM5", OBJPROP_XDISTANCE, gi_864 + 110);
   ObjectSet("SSignalTrendM5", OBJPROP_YDISTANCE, gi_860 + 26);
   ObjectDelete("SSignalTrendM15");
   ObjectCreate("SSignalTrendM15", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SSignalTrendM15", text_304, 45, "Tahoma Narrow", color_704);
   ObjectSet("SSignalTrendM15", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SSignalTrendM15", OBJPROP_XDISTANCE, gi_864 + 90);
   ObjectSet("SSignalTrendM15", OBJPROP_YDISTANCE, gi_860 + 26);
   ObjectDelete("SSignalTrendM30");
   ObjectCreate("SSignalTrendM30", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SSignalTrendM30", text_312, 45, "Tahoma Narrow", color_700);
   ObjectSet("SSignalTrendM30", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SSignalTrendM30", OBJPROP_XDISTANCE, gi_864 + 70);
   ObjectSet("SSignalTrendM30", OBJPROP_YDISTANCE, gi_860 + 26);
   ObjectDelete("SSignalTrendH1");
   ObjectCreate("SSignalTrendH1", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SSignalTrendH1", text_272, 45, "Tahoma Narrow", color_80);
   ObjectSet("SSignalTrendH1", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SSignalTrendH1", OBJPROP_XDISTANCE, gi_864 + 50);
   ObjectSet("SSignalTrendH1", OBJPROP_YDISTANCE, gi_860 + 26);
   ObjectDelete("SSignalTrendH4");
   ObjectCreate("SSignalTrendH4", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SSignalTrendH4", text_280, 45, "Tahoma Narrow", color_84);
   ObjectSet("SSignalTrendH4", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SSignalTrendH4", OBJPROP_XDISTANCE, gi_864 + 30);
   ObjectSet("SSignalTrendH4", OBJPROP_YDISTANCE, gi_860 + 26);
   ObjectDelete("SSignalTrendD1");
   ObjectCreate("SSignalTrendD1", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SSignalTrendD1", text_264, 45, "Tahoma Narrow", color_28);
   ObjectSet("SSignalTrendD1", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SSignalTrendD1", OBJPROP_XDISTANCE, gi_864 + 10);
   ObjectSet("SSignalTrendD1", OBJPROP_YDISTANCE, gi_860 + 26);
   
   ObjectDelete("SSignalRSI_TEXT");
   ObjectCreate("SSignalRSI_TEXT", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SSignalRSI_TEXT", "CMA", 6, "Tahoma Narrow", g_color_888);
   ObjectSet("SSignalRSI_TEXT", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SSignalRSI_TEXT", OBJPROP_XDISTANCE, gi_864 + 153);
   ObjectSet("SSignalRSI_TEXT", OBJPROP_YDISTANCE, gi_860 + 67);
   ObjectDelete("SSignalRSIM1");
   ObjectCreate("SSignalRSIM1", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SSignalRSIM1", text_288, 45, "Tahoma Narrow", color_712);
   ObjectSet("SSignalRSIM1", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SSignalRSIM1", OBJPROP_XDISTANCE, gi_864 + 130);
   ObjectSet("SSignalRSIM1", OBJPROP_YDISTANCE, gi_860 + 34);
   ObjectDelete("SSignalRSIM5");
   ObjectCreate("SSignalRSIM5", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SSignalRSIM5", text_296, 45, "Tahoma Narrow", color_708);
   ObjectSet("SSignalRSIM5", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SSignalRSIM5", OBJPROP_XDISTANCE, gi_864 + 110);
   ObjectSet("SSignalRSIM5", OBJPROP_YDISTANCE, gi_860 + 34);
   ObjectDelete("SSignalRSIM15");
   ObjectCreate("SSignalRSIM15", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SSignalRSIM15", text_304, 45, "Tahoma Narrow", color_48);
   ObjectSet("SSignalRSIM15", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SSignalRSIM15", OBJPROP_XDISTANCE, gi_864 + 90);
   ObjectSet("SSignalRSIM15", OBJPROP_YDISTANCE, gi_860 + 34);
   ObjectDelete("SSignalRSIM30");
   ObjectCreate("SSignalRSIM30", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SSignalRSIM30", text_312, 45, "Tahoma Narrow", color_52);
   ObjectSet("SSignalRSIM30", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SSignalRSIM30", OBJPROP_XDISTANCE, gi_864 + 70);
   ObjectSet("SSignalRSIM30", OBJPROP_YDISTANCE, gi_860 + 34);
   ObjectDelete("SSignalRSIH1");
   ObjectCreate("SSignalRSIH1", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SSignalRSIH1", text_272, 45, "Tahoma Narrow", color_64);
   ObjectSet("SSignalRSIH1", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SSignalRSIH1", OBJPROP_XDISTANCE, gi_864 + 50);
   ObjectSet("SSignalRSIH1", OBJPROP_YDISTANCE, gi_860 + 34);
   ObjectDelete("SSignalRSIH4");
   ObjectCreate("SSignalRSIH4", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SSignalRSIH4", text_280, 45, "Tahoma Narrow", color_68);
   ObjectSet("SSignalRSIH4", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SSignalRSIH4", OBJPROP_XDISTANCE, gi_864 + 30);
   ObjectSet("SSignalRSIH4", OBJPROP_YDISTANCE, gi_860 + 34);
   ObjectDelete("SSignalRSID1");
   ObjectCreate("SSignalRSID1", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SSignalRSID1", text_264, 45, "Tahoma Narrow", color_688);
   ObjectSet("SSignalRSID1", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SSignalRSID1", OBJPROP_XDISTANCE, gi_864 + 10);
   ObjectSet("SSignalRSID1", OBJPROP_YDISTANCE, gi_860 + 34);
   
   ObjectDelete("SSignalBand_TEXT");
   ObjectCreate("SSignalBand_TEXT", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SSignalBand_TEXT", "RSI", 6, "Tahoma Narrow", g_color_888);
   ObjectSet("SSignalBand_TEXT", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SSignalBand_TEXT", OBJPROP_XDISTANCE, gi_864 + 153);
   ObjectSet("SSignalBand_TEXT", OBJPROP_YDISTANCE, gi_860 + 75);
   ObjectDelete("SSignalBandM1");
   ObjectCreate("SSignalBandM1", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SSignalBandM1", text_288, 45, "Tahoma Narrow", color_32);
   ObjectSet("SSignalBandM1", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SSignalBandM1", OBJPROP_XDISTANCE, gi_864 + 130);
   ObjectSet("SSignalBandM1", OBJPROP_YDISTANCE, gi_860 + 42);
   ObjectDelete("SSignalBandM5");
   ObjectCreate("SSignalBandM5", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SSignalBandM5", text_296, 45, "Tahoma Narrow", color_36);
   ObjectSet("SSignalBandM5", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SSignalBandM5", OBJPROP_XDISTANCE, gi_864 + 110);
   ObjectSet("SSignalBandM5", OBJPROP_YDISTANCE, gi_860 + 42);
   ObjectDelete("SSignalBandM15");
   ObjectCreate("SSignalBandM15", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SSignalBandM15", text_304, 45, "Tahoma Narrow", color_696);
   ObjectSet("SSignalBandM15", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SSignalBandM15", OBJPROP_XDISTANCE, gi_864 + 90);
   ObjectSet("SSignalBandM15", OBJPROP_YDISTANCE, gi_860 + 42);
   ObjectDelete("SSignalBandM30");
   ObjectCreate("SSignalBandM30", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SSignalBandM30", text_312, 45, "Tahoma Narrow", color_692);
   ObjectSet("SSignalBandM30", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SSignalBandM30", OBJPROP_XDISTANCE, gi_864 + 70);
   ObjectSet("SSignalBandM30", OBJPROP_YDISTANCE, gi_860 + 42);
   ObjectDelete("SSignalBandH1");
   ObjectCreate("SSignalBandH1", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SSignalBandH1", text_272, 45, "Tahoma Narrow", color_72);
   ObjectSet("SSignalBandH1", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SSignalBandH1", OBJPROP_XDISTANCE, gi_864 + 50);
   ObjectSet("SSignalBandH1", OBJPROP_YDISTANCE, gi_860 + 42);
   ObjectDelete("SSignalBandH4");
   ObjectCreate("SSignalBandH4", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SSignalBandH4", text_280, 45, "Tahoma Narrow", color_76);
   ObjectSet("SSignalBandH4", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SSignalBandH4", OBJPROP_XDISTANCE, gi_864 + 30);
   ObjectSet("SSignalBandH4", OBJPROP_YDISTANCE, gi_860 + 42);
   ObjectDelete("SSignalBandD1");
   ObjectCreate("SSignalBandD1", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SSignalBandD1", text_264, 45, "Tahoma Narrow", color_88);
   ObjectSet("SSignalBandD1", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SSignalBandD1", OBJPROP_XDISTANCE, gi_864 + 10);
   ObjectSet("SSignalBandD1", OBJPROP_YDISTANCE, gi_860 + 42);  
   //********************************************************************************************
   double ld_900 = NormalizeDouble(MarketInfo(Symbol(), MODE_BID), Digits);
   double ima_908 = iMA(Symbol(), PERIOD_M1, 1, 0, MODE_EMA, PRICE_CLOSE, 1);
   string ls_unused_916 = "";
   if (ima_908 > ld_900) {
      ls_unused_916 = "";
      color_92 = g_color_924;
   }
   if (ima_908 < ld_900) {
      ls_unused_916 = "";
      color_92 = g_color_920;
   }
   if (ima_908 == ld_900) {
      ls_unused_916 = "";
      color_92 = g_color_928;
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
         ObjectSetText("Signalprice", DoubleToStr(ld_900, Digits), 30, "Arial", color_92);
         ObjectSet("Signalprice", OBJPROP_CORNER, g_corner_856);
         ObjectSet("Signalprice", OBJPROP_XDISTANCE, gi_864 + 8);
         ObjectSet("Signalprice", OBJPROP_YDISTANCE, gi_860 + 90);
         ObjectSet("Signalprice", OBJPROP_SELECTABLE,0);
      }
   }
   if (gi_880 == TRUE) {
      if (gi_872 == TRUE) {
         ObjectDelete("Signalprice");
         ObjectCreate("Signalprice", OBJ_LABEL, g_window_868, 0, 0);
         ObjectSetText("Signalprice", DoubleToStr(ld_900, Digits), 15, "Arial", color_92);
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
   string ls_unused_948 = "";
   string ls_unused_956 = "";
   string dbl2str_964 = "";
   string dbl2str_972 = "";
   string dbl2str_980 = "";
   string dbl2str_988 = "";
   string ls_unused_996 = "";
   string ls_unused_1004 = "";
   string ls_1012 = "";
   double iopen_1020 = iOpen(NULL, PERIOD_D1, 0);
   double iclose_1028 = iClose(NULL, PERIOD_D1, 0);
   double ld_1036 = (Ask - Bid) / Point;
   double ihigh_1044 = iHigh(NULL, PERIOD_D1, 0);
   double ilow_1052 = iLow(NULL, PERIOD_D1, 0);
   dbl2str_972 = DoubleToStr((iclose_1028 - iopen_1020) / Point, 0);
   dbl2str_964 = DoubleToStr(ld_1036, Digits - 4);
   dbl2str_980 = DoubleToStr(li_940, Digits - 4);
   ls_1012 = (iHigh(NULL, PERIOD_D1, 1) - iLow(NULL, PERIOD_D1, 1)) / Point;
   dbl2str_988 = DoubleToStr((ihigh_1044 - ilow_1052) / Point, 0);
   if (iclose_1028 >= iopen_1020) {
      ls_unused_996 = "-";
      color_104 = g_color_904;
   }
   if (iclose_1028 < iopen_1020) {
      ls_unused_996 = "-";
      color_104 = g_color_908;
   }
   if (dbl2str_980 >= ls_1012) {
      ls_unused_1004 = "-";
      li_unused_108 = gi_912;
   }
   if (dbl2str_980 < ls_1012) {
      ls_unused_1004 = "-";
      li_unused_108 = gi_916;
   }
   /*
   ObjectDelete("SIG_DETAIL_1");
   ObjectCreate("SIG_DETAIL_1", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SIG_DETAIL_1", "Spread", 14, "Times New Roman", g_color_892);
   ObjectSet("SIG_DETAIL_1", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SIG_DETAIL_1", OBJPROP_XDISTANCE, gi_864 + 65);
   ObjectSet("SIG_DETAIL_1", OBJPROP_YDISTANCE, gi_860 + 100);
   ObjectDelete("SIG_DETAIL_2");
   ObjectCreate("SIG_DETAIL_2", OBJ_LABEL, g_window_868, 0, 0);
   ObjectSetText("SIG_DETAIL_2", "" + dbl2str_964 + "", 14, "Times New Roman", g_color_896);
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
   ObjectSetText("SIG_DETAIL_4", "" + dbl2str_972 + "", 14, "Times New Roman", color_104);
   ObjectSet("SIG_DETAIL_4", OBJPROP_CORNER, g_corner_856);
   ObjectSet("SIG_DETAIL_4", OBJPROP_XDISTANCE, gi_864 + 10);
   ObjectSet("SIG_DETAIL_4", OBJPROP_YDISTANCE, gi_860 + 115);
   */
   double ld_1060 = LotExponent;
   int li_1068 = lotdecimal;
   double ld_1072 = TakeProfit;
   bool bool_1080 = UseEquityStop;
   double ld_1084 = TotalEquityRisk;
   bool bool_1092 = UseTrailingStop;
   double ld_1096 = TrailStart;
   double ld_1104 = TrailStop;
   double ld_1112 = PipStep;
   double ld_1120 = slip;
   if (MM == TRUE) {
      if (MathCeil(AccountBalance()) < 200000.0) ld_144 = Lots;
      else ld_144 = 0.00001 * MathCeil(AccountBalance());
   } else ld_144 = Lots;
   if (bool_1092) TrailingAlls_Hilo(ld_1096, ld_1104, g_price_264);
   if (gi_184) {
      if (TimeCurrent() >= gi_328) {
         CloseThisSymbolAll_Hilo();
         Print("Closed All due_Hilo to TimeOut");
      }
   }
   if (gi_324 == Time[0]) return (0);
   gi_324 = Time[0];
   double ld_1128 = CalculateProfit_Hilo();
   if (bool_1080) {
      if (ld_1128 < 0.0 && MathAbs(ld_1128) > ld_1084 / 100.0 * AccountEquityHigh_Hilo()) {
         CloseThisSymbolAll_Hilo();
         Print("Closed All due_Hilo to Stop Out");
         gi_376 = FALSE;
      }
   }
   gi_348 = CountTrades_Hilo();
   if (gi_348 == 0) gi_312 = FALSE;
   for (g_pos_344 = OrdersTotal() - 1; g_pos_344 >= 0; g_pos_344--) {
      cg = OrderSelect(g_pos_344, SELECT_BY_POS, MODE_TRADES);
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
   if (gi_348 > 0 && gi_348 <= MaxTrades_Hilo) {
      RefreshRates();
      gd_288 = FindLastBuyPrice_Hilo();
      gd_296 = FindLastSellPrice_Hilo();
      if (gi_364 && gd_288 - Ask >= ld_1112 * Point) gi_360 = TRUE;
      if (gi_368 && Bid - gd_296 >= ld_1112 * Point) gi_360 = TRUE;
   }
   if (gi_348 < 1) {
      gi_368 = FALSE;
      gi_364 = FALSE;
      gi_360 = TRUE;
      gd_224 = AccountEquity();
   }
   if (gi_360) {
      gd_288 = FindLastBuyPrice_Hilo();
      gd_296 = FindLastSellPrice_Hilo();
      if (gi_368) {
         gi_332 = gi_348;
         gd_336 = NormalizeDouble(ld_144 * MathPow(ld_1060, gi_332), li_1068);
         RefreshRates();
         gi_372 = OpenPendingOrder_Hilo(1, gd_336, Bid, ld_1120, Ask, 0, 0, gs_316 + "-" + gi_332, MagicNumber_Hilo, 0, HotPink);
         if (gi_372 < 0) {
            Print("Error: ", GetLastError());
            return (0);
         }
         gd_296 = FindLastSellPrice_Hilo();
         gi_360 = FALSE;
         gi_376 = TRUE;
      } else {
         if (gi_364) {
            gi_332 = gi_348;
            gd_336 = NormalizeDouble(ld_144 * MathPow(ld_1060, gi_332), li_1068);
            gi_372 = OpenPendingOrder_Hilo(0, gd_336, Ask, ld_1120, Bid, 0, 0, gs_316 + "-" + gi_332, MagicNumber_Hilo, 0, Lime);
            if (gi_372 < 0) {
               Print("Error: ", GetLastError());
               return (0);
            }
            gd_288 = FindLastBuyPrice_Hilo();
            gi_360 = FALSE;
            gi_376 = TRUE;
         }
      }
   }
   if (gi_360 && gi_348 < 1) {
      ihigh_112 = iHigh(Symbol(), 0, 1);
      ilow_120 = iLow(Symbol(), 0, 2);

      if ((!gi_368) && !gi_364) {
         gi_332 = gi_348;
         gd_336 = NormalizeDouble(ld_144 * MathPow(ld_1060, gi_332), li_1068);
         if (ihigh_112 > ilow_120) {
            if (iRSI(NULL, PERIOD_H1, 14, PRICE_CLOSE, 1) > 30.0) {

               if (gi_372 < 0) {
                  Print("Error: ", GetLastError());
                  return (0);
               }
               gd_288 = FindLastBuyPrice_Hilo();
               gi_376 = TRUE;
            }
         } else {
            if (iRSI(NULL, PERIOD_H1, 14, PRICE_CLOSE, 1) < 70.0) {

               if (gi_372 < 0) {
                  Print("Error: ", GetLastError());
                  return (0);
               }
               gd_296 = FindLastSellPrice_Hilo();
               gi_376 = TRUE;
            }
         }
         if (gi_372 > 0) gi_328 = TimeCurrent() + 60.0 * (60.0 * gd_188);
         gi_360 = FALSE;
      }
   }
   gi_348 = CountTrades_Hilo();
   g_price_264 = 0;
   double ld_1136 = 0;
   for (g_pos_344 = OrdersTotal() - 1; g_pos_344 >= 0; g_pos_344--) {
      cg = OrderSelect(g_pos_344, SELECT_BY_POS, MODE_TRADES);
      if (OrderSymbol() != Symbol() || OrderMagicNumber() != MagicNumber_Hilo) continue;
      if (OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber_Hilo) {
         if (OrderType() == OP_BUY || OrderType() == OP_SELL) {
            g_price_264 += OrderOpenPrice() * OrderLots();
            ld_1136 += OrderLots();
         }
      }
   }
   if (gi_348 > 0) g_price_264 = NormalizeDouble(g_price_264 / ld_1136, Digits);
   if (gi_376) {
      for (g_pos_344 = OrdersTotal() - 1; g_pos_344 >= 0; g_pos_344--) {
         cg = OrderSelect(g_pos_344, SELECT_BY_POS, MODE_TRADES);
         if (OrderSymbol() != Symbol() || OrderMagicNumber() != MagicNumber_Hilo) continue;
         if (OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber_Hilo) {
            if (OrderType() == OP_BUY) {
               g_price_216 = g_price_264 + ld_1072 * Point;
               gd_unused_232 = g_price_216;
               gd_352 = g_price_264 - g_pips_196 * Point;
               gi_312 = TRUE;
            }
         }
         if (OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber_Hilo) {
            if (OrderType() == OP_SELL) {
               g_price_216 = g_price_264 - ld_1072 * Point;
               gd_unused_240 = g_price_216;
               gd_352 = g_price_264 + g_pips_196 * Point;
               gi_312 = TRUE;
            }
         }
      }
   }
   if (gi_376) {
      if (gi_312 == TRUE) {
         for (g_pos_344 = OrdersTotal() - 1; g_pos_344 >= 0; g_pos_344--) {
            cg = OrderSelect(g_pos_344, SELECT_BY_POS, MODE_TRADES);
            if (OrderSymbol() != Symbol() || OrderMagicNumber() != MagicNumber_Hilo) continue;
            if (OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber_Hilo) {
               while (!OrderModify(OrderTicket(), g_price_264, OrderStopLoss(), g_price_216, 0, Yellow)) {
                  Sleep(1000);
                  RefreshRates();
               }
            }
            gi_376 = FALSE;
         }
      }
   }
   double ld_1144 = LotExponent;
   int li_1152 = lotdecimal;
   double ld_1156 = TakeProfit;
   bool bool_1164 = UseEquityStop;
   double ld_1168 = TotalEquityRisk;
   bool bool_1176 = UseTrailingStop;
   double ld_1180 = TrailStart;
   double ld_1188 = TrailStop;
   double ld_1196 = PipStep;
   double ld_1204 = slip;
   if (MM == TRUE) {
      if (MathCeil(AccountBalance()) < 200000.0) ld_152 = Lots;
      else ld_152 = 0.00001 * MathCeil(AccountBalance());
   } else ld_152 = Lots;
   if (bool_1176) TrailingAlls_15(ld_1180, ld_1188, g_price_476);
   if (gi_420) {
      if (TimeCurrent() >= gi_540) {
         CloseThisSymbolAll_15();
         Print("Closed All due to TimeOut");
      }
   }
   if (gi_536 != Time[0]) {
      gi_536 = Time[0];
      ld_160 = CalculateProfit_15();
      if (bool_1164) {
         if (ld_160 < 0.0 && MathAbs(ld_160) > ld_1168 / 100.0 * AccountEquityHigh_15()) {
            CloseThisSymbolAll_15();
            Print("Closed All due to Stop Out");
            gi_588 = FALSE;
         }
      }
      gi_560 = CountTrades_15();
      if (gi_560 == 0) gi_524 = FALSE;
      for (g_pos_556 = OrdersTotal() - 1; g_pos_556 >= 0; g_pos_556--) {
         cg = OrderSelect(g_pos_556, SELECT_BY_POS, MODE_TRADES);
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
         if (gi_576 && gd_500 - Ask >= ld_1196 * Point) gi_572 = TRUE;
         if (gi_580 && Bid - gd_508 >= ld_1196 * Point) gi_572 = TRUE;
      }
      if (gi_560 < 1) {
         gi_580 = FALSE;
         gi_576 = FALSE;
         gi_572 = TRUE;
         gd_452 = AccountEquity();
      }
      if (gi_572) {
         gd_500 = FindLastBuyPrice_15();
         gd_508 = FindLastSellPrice_15();
         if (gi_580) {
            gi_544 = gi_560;
            gd_548 = NormalizeDouble(ld_152 * MathPow(ld_1144, gi_544), li_1152);
            RefreshRates();
            gi_584 = OpenPendingOrder_15(1, gd_548, Bid, ld_1204, Ask, 0, 0, gs_528 + "-" + gi_544, g_magic_176_15, 0, HotPink);
            if (gi_584 < 0) {
               Print("Error: ", GetLastError());
               return (0);
            }
            gd_508 = FindLastSellPrice_15();
            gi_572 = FALSE;
            gi_588 = TRUE;
         } else {
            if (gi_576) {
               gi_544 = gi_560;
               gd_548 = NormalizeDouble(ld_152 * MathPow(ld_1144, gi_544), li_1152);
               gi_584 = OpenPendingOrder_15(0, gd_548, Ask, ld_1204, Bid, 0, 0, gs_528 + "-" + gi_544, g_magic_176_15, 0, Lime);
               if (gi_584 < 0) {
                  Print("Error: ", GetLastError());
                  return (0);
               }
               gd_500 = FindLastBuyPrice_15();
               gi_572 = FALSE;
               gi_588 = TRUE;
            }
         }
      }
   }
   if (g_datetime_608 != iTime(NULL, g_timeframe_408, 0)) {
      li_168 = OrdersTotal();
      count_172 = 0;
      for (int li_1212 = li_168; li_1212 >= 1; li_1212--) {
         cg = OrderSelect(li_1212 - 1, SELECT_BY_POS, MODE_TRADES);
         if (OrderSymbol() != Symbol() || OrderMagicNumber() != g_magic_176_15) continue;
         if (OrderSymbol() == Symbol() && OrderMagicNumber() == g_magic_176_15) count_172++;
      }
      if (li_168 == 0 || count_172 < 1) {
         iclose_128 = iClose(Symbol(), 0, 2);
         iclose_136 = iClose(Symbol(), 0, 1);

         gi_544 = gi_560;
         gd_548 = ld_152;
         if (iclose_128 > iclose_136) {

            if (gi_584 < 0) {
               Print("Error: ", GetLastError());
               return (0);
            }
            gd_500 = FindLastBuyPrice_15();
            gi_588 = TRUE;
         } else {

            if (gi_584 < 0) {
               Print("Error: ", GetLastError());
               return (0);
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
      cg = OrderSelect(g_pos_556, SELECT_BY_POS, MODE_TRADES);
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
         cg = OrderSelect(g_pos_556, SELECT_BY_POS, MODE_TRADES);
         if (OrderSymbol() != Symbol() || OrderMagicNumber() != g_magic_176_15) continue;
         if (OrderSymbol() == Symbol() && OrderMagicNumber() == g_magic_176_15) {
            if (OrderType() == OP_BUY) {
               g_price_444 = g_price_476 + ld_1156 * Point;
               gd_unused_460 = g_price_444;
               gd_564 = g_price_476 - g_pips_412 * Point;
               gi_524 = TRUE;
            }
         }
         if (OrderSymbol() == Symbol() && OrderMagicNumber() == g_magic_176_15) {
            if (OrderType() == OP_SELL) {
               g_price_444 = g_price_476 - ld_1156 * Point;
               gd_unused_468 = g_price_444;
               gd_564 = g_price_476 + g_pips_412 * Point;
               gi_524 = TRUE;
            }
         }
      }
   }
   if (gi_588) {
      if (gi_524 == TRUE) {
         for (g_pos_556 = OrdersTotal() - 1; g_pos_556 >= 0; g_pos_556--) {
            cg = OrderSelect(g_pos_556, SELECT_BY_POS, MODE_TRADES);
            if (OrderSymbol() != Symbol() || OrderMagicNumber() != g_magic_176_15) continue;
            if (OrderSymbol() == Symbol() && OrderMagicNumber() == g_magic_176_15) {
               while (!OrderModify(OrderTicket(), g_price_476, OrderStopLoss(), g_price_444, 0, Yellow)) {
                  Sleep(1000);
                  RefreshRates();
               }
            }
            gi_588 = FALSE;
         }
      }
   }
   double ld_1224 = LotExponent;
   int li_1232 = lotdecimal;
   double ld_1236 = TakeProfit;
   bool bool_1244 = UseEquityStop;
   double ld_1248 = TotalEquityRisk;
   bool bool_1256 = UseTrailingStop;
   double ld_1260 = TrailStart;
   double ld_1268 = TrailStop;
   double ld_1276 = PipStep;
   double ld_1284 = slip;
   if (MM == TRUE) {
      if (MathCeil(AccountBalance()) < 200000.0) ld_176 = Lots;
      else ld_176 = 0.00001 * MathCeil(AccountBalance());
   } else ld_176 = Lots;
   if (bool_1256) TrailingAlls_16(ld_1260, ld_1268, g_price_692);
   if (gi_636) {
      if (TimeCurrent() >= gi_756) {
         CloseThisSymbolAll_16();
         Print("Closed All due to TimeOut");
      }
   }
   if (gi_752 != Time[0]) {
      gi_752 = Time[0];
      ld_184 = CalculateProfit_16();
      if (bool_1244) {
         if (ld_184 < 0.0 && MathAbs(ld_184) > ld_1248 / 100.0 * AccountEquityHigh_16()) {
            CloseThisSymbolAll_16();
            Print("Closed All due to Stop Out");
            gi_804 = FALSE;
         }
      }
      gi_776 = CountTrades_16();
      if (gi_776 == 0) gi_740 = FALSE;
      for (g_pos_772 = OrdersTotal() - 1; g_pos_772 >= 0; g_pos_772--) {
         cg = OrderSelect(g_pos_772, SELECT_BY_POS, MODE_TRADES);
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
         if (gi_792 && gd_716 - Ask >= ld_1276 * Point) gi_788 = TRUE;
         if (gi_796 && Bid - gd_724 >= ld_1276 * Point) gi_788 = TRUE;
      }
      if (gi_776 < 1) {
         gi_796 = FALSE;
         gi_792 = FALSE;
         gd_668 = AccountEquity();
      }
      if (gi_788) {
         gd_716 = FindLastBuyPrice_16();
         gd_724 = FindLastSellPrice_16();
         if (gi_796) {
            gi_760 = gi_776;
            gd_764 = NormalizeDouble(ld_176 * MathPow(ld_1224, gi_760), li_1232);
            RefreshRates();
            gi_800 = OpenPendingOrder_16(1, gd_764, Bid, ld_1284, Ask, 0, 0, gs_744 + "-" + gi_760, g_magic_176_16, 0, HotPink);
            if (gi_800 < 0) {
               Print("Error: ", GetLastError());
               return (0);
            }
            gd_724 = FindLastSellPrice_16();
            gi_788 = FALSE;
            gi_804 = TRUE;
         } else {
            if (gi_792) {
               gi_760 = gi_776;
               gd_764 = NormalizeDouble(ld_176 * MathPow(ld_1224, gi_760), li_1232);
               gi_800 = OpenPendingOrder_16(0, gd_764, Ask, ld_1284, Bid, 0, 0, gs_744 + "-" + gi_760, g_magic_176_16, 0, Lime);
               if (gi_800 < 0) {
                  Print("Error: ", GetLastError());
                  return (0);
               }
               gd_716 = FindLastBuyPrice_16();
               gi_788 = FALSE;
               gi_804 = TRUE;
            }
         }
      }
   }
   if (g_datetime_824 != iTime(NULL, g_timeframe_624, 0)) {
      li_192 = OrdersTotal();
      count_196 = 0;
      for (int li_1292 = li_192; li_1292 >= 1; li_1292--) {
         cg = OrderSelect(li_1292 - 1, SELECT_BY_POS, MODE_TRADES);
         if (OrderSymbol() != Symbol() || OrderMagicNumber() != g_magic_176_16) continue;
         if (OrderSymbol() == Symbol() && OrderMagicNumber() == g_magic_176_16) count_196++;
      }
      if (li_192 == 0 || count_196 < 1) {
         iclose_128 = iClose(Symbol(), 0, 2);
         iclose_136 = iClose(Symbol(), 0, 1);


         gi_760 = gi_776;
         gd_764 = ld_176;
         if (iclose_128 > iclose_136) {
            if (iRSI(NULL, PERIOD_H1, 14, PRICE_CLOSE, 1) > 30.0) {

               if (gi_800 < 0) {
                  Print("Error: ", GetLastError());
                  return (0);
               }
               gd_716 = FindLastBuyPrice_16();
               gi_804 = TRUE;
            }
         } else {
            if (iRSI(NULL, PERIOD_H1, 14, PRICE_CLOSE, 1) < 70.0) {

               if (gi_800 < 0) {
                  Print("Error: ", GetLastError());
                  return (0);
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
      cg = OrderSelect(g_pos_772, SELECT_BY_POS, MODE_TRADES);
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
         cg = OrderSelect(g_pos_772, SELECT_BY_POS, MODE_TRADES);
         if (OrderSymbol() != Symbol() || OrderMagicNumber() != g_magic_176_16) continue;
         if (OrderSymbol() == Symbol() && OrderMagicNumber() == g_magic_176_16) {
            if (OrderType() == OP_BUY) {
               g_price_660 = g_price_692 + ld_1236 * Point;
               gd_unused_676 = g_price_660;
               gd_780 = g_price_692 - g_pips_628 * Point;
               gi_740 = TRUE;
            }
         }
         if (OrderSymbol() == Symbol() && OrderMagicNumber() == g_magic_176_16) {
            if (OrderType() == OP_SELL) {
               g_price_660 = g_price_692 - ld_1236 * Point;
               gd_unused_684 = g_price_660;
               gd_780 = g_price_692 + g_pips_628 * Point;
               gi_740 = TRUE;
            }
         }
      }
   }
   if (gi_804) {
      if (gi_740 == TRUE) {
         for (g_pos_772 = OrdersTotal() - 1; g_pos_772 >= 0; g_pos_772--) {
            cg = OrderSelect(g_pos_772, SELECT_BY_POS, MODE_TRADES);
            if (OrderSymbol() != Symbol() || OrderMagicNumber() != g_magic_176_16) continue;
            if (OrderSymbol() == Symbol() && OrderMagicNumber() == g_magic_176_16) {
               while (!OrderModify(OrderTicket(), g_price_692, OrderStopLoss(), g_price_660, 0, Yellow)) {
                  Sleep(1000);
                  RefreshRates();
               }
            }
            gi_804 = FALSE;
         }
      }
   }
   
//+------------------------------------------------------------------+ Start Of Currency Power Meter
   int count_16;
   int count_20;
   string ls_24;
   double ld_32;
   double ld_40;
   double low_48;
   double ld_56;
   double ld_72;
   double bid_80;
   double ld_88 = 0.01;
   if (gi_220 == TRUE) {
      for (int index_8 = 0; index_8 < gi_180; index_8++) {
         RefreshRates();
         ld_88 = 0.0001;
         ls_24 = gsa_160[index_8];
         if (StringSubstr(ls_24, 3, 3) == "JPY") ld_88 = 0.01;
         low_48 = MarketInfo(ls_24, MODE_LOW);
         bid_80 = MarketInfo(ls_24, MODE_BID);
         ld_56 = (bid_80 - low_48) / MathMax(MarketInfo(ls_24, MODE_HIGH) - low_48, ld_88);
         gda_192[index_8] = CheckRatio(100.0 * ld_56);
         gda_196[index_8] = 9.9 - CheckRatio(100.0 * ld_56);
         low_48 = MyLowest(ls_24);
         ld_72 = MyHighest(ls_24);
         ld_56 = (bid_80 - low_48) / MathMax(ld_72 - low_48, ld_88);
         gda_208[index_8] = CheckRatio(100.0 * ld_56);
         gda_204[index_8] = 9.9 - CheckRatio(100.0 * ld_56);
      }
      for (int index_12 = 0; index_12 < gi_184U; index_12++) {
         count_16 = 0;
         count_20 = 0;
         ld_32 = 0;
         ld_40 = 0;
         for (index_8 = 0; index_8 < gi_180; index_8++) {
            if (StringSubstr(gsa_160[index_8], 0, 3) == gsa_164[index_12]) {
               ld_32 += gda_192[index_8];
               count_16++;
               ld_40 += gda_208[index_8];
               count_20++;
            }
            if (StringSubstr(gsa_160[index_8], 3, 3) == gsa_164[index_12]) {
               ld_32 += gda_196[index_8];
               count_16++;
               ld_40 += gda_204[index_8];
               count_20++;
            }
            if (count_16 > 0) gda_188[index_12] = NormalizeDouble(ld_32 / count_16, 1);
            else gda_188[index_12] = -1;
            if (count_20 > 0) gda_200[index_12] = NormalizeDouble(ld_40 / count_20, 1);
            else gda_200[index_12] = -1;
         }
      }
      for (index_12 = 0; index_12 < gi_184U; index_12++) {
         ShowData(index_12);
         if (gda_188[index_12] < LowValue && StringFind(PairAlert, gsa_164[index_12]) != -1 && TimeCurrent() - g_datetime_212 > AlertDelay) {
            PlaySound("news.wav");
            g_datetime_212 = TimeCurrent();
         }
         if (gda_188[index_12] > MaxValue && StringFind(PairAlert, gsa_164[index_12]) != -1 && TimeCurrent() - g_datetime_212 > AlertDelay) {
            PlaySound("news.wav");
            g_datetime_212 = TimeCurrent();
         }
      }
   }
//+------------------------------------------------------------------+ End Of Currency Power Meter
//+------------------------------------------------------------------+ Start Of FX Market Signal
   TimeFrame = 15;
   vA = iMA(Symbol(),0,1,0,MODE_EMA,PRICE_CLOSE,0);
   vB = iMA(Symbol(), TimeFrame, MAFast_Period, MAFast_Shift, MAFast_Method, MAFast_Apply_To, 0);
   vC = iMA(Symbol(), TimeFrame, MASlow_Period, MASlow_Shift, MASlow_Method, MASlow_Apply_To, 0);
   Write("MP14001", 0, MP_X+9, MP_Y+42, DoubleToStr(vA,Digits), 34, "Arial", CheckColor(vB, vC, PriceColor_Up, PriceColor_Dn) );

   vB=iHigh(NULL,1440,0); textmp=DoubleToStr(vB, Digits);
   Write("MP14002", 0, MP_X+100, MP_Y+34, textmp, 10, "Tahoma Bold", Highest_Color);
   
   vC=iLow(NULL,1440,0); textmp=DoubleToStr(vC, Digits);
   Write("MP14003", 0, MP_X+100, MP_Y+82, textmp, 10, "Tahoma Bold", Lowest_Color);
   
   textmp=DoubleToStr((vA-vB)/Point,0);
   Write("MP14004", 0, MP_X+56, MP_Y+34, textmp, 10, "Tahoma Bold", Distance_from_Highest_Color);
   
   textmp=DoubleToStr((vA-vC)/Point,0);
   Write("MP14005", 0, MP_X+56, MP_Y+82, textmp, 10, "Tahoma Bold", Distance_from_Lowest_Color);
   
   textmp=DoubleToStr((vB-vC)/Point,0);
   Write("MP14006", 0, MP_X+10, MP_Y+34, textmp, 10, "Tahoma Bold", Hi_to_Lo_Color);
   
   R1=0; R5=0; R10=0; R20=0; RAvg=0; imp=0;
   R1 =  (iHigh(NULL,PERIOD_D1,1)-iLow(NULL,PERIOD_D1,1))/Point;
   for(imp=1;imp<=5;imp++)   
     R5  = R5  + (iHigh(NULL,PERIOD_D1,imp)-iLow(NULL,PERIOD_D1,imp))/Point;
   for(imp=1;imp<=10;imp++)
     R10 = R10 + (iHigh(NULL,PERIOD_D1,imp)-iLow(NULL,PERIOD_D1,imp))/Point;
   for(imp=1;imp<=20;imp++)
     R20 = R20 + (iHigh(NULL,PERIOD_D1,imp)-iLow(NULL,PERIOD_D1,imp))/Point;

   R5 = R5/5;
   R10 = R10/10;
   R20 = R20/20;
   RAvg  =  (R1+R5+R10+R20)/4;    
   
   Teks_ReRata = (DoubleToStr(RAvg,Digits-4));
   Teks_Rerata_Kemarin = (iHigh(NULL,PERIOD_D1,1)-iLow(NULL,PERIOD_D1,1))/Point;
   
   if (Teks_ReRata > Teks_Rerata_Kemarin) {warna_ReRata = Daily_Av_Up_Color;}
      else {warna_ReRata = Daily_Av_Dn_Color;}
      
   Write("MP14007", 0, MP_X+10, MP_Y+82, Teks_ReRata, 10, "Tahoma Bold", warna_ReRata);
   
   vB = (Time[4]-Time[5])-MathMod(CurTime(),Time[4]-Time[5]);
   vA = vB/60;
   vB = (vA-MathFloor(vA))*60;
   vA = MathFloor(vA);
   Teks_Menit = DoubleToStr(vA,0);
   Teks_Detik = DoubleToStr(vB,0);
   textmp=Teks_Menit+":"+Teks_Detik;
   Write("MP14008", 0, MP_X+100, MP_Y+94, textmp, 10, "Tahoma Bold", Time_n_Spread_Color);
   
   vA = (Ask - Bid)/Point;
   textmp = (DoubleToStr(vA, Digits-4));
   Write("MP14009", 0, MP_X+56, MP_Y+94, textmp, 10, "Tahoma Bold", Time_n_Spread_Color);
   
   vA = iOpen(NULL,1440,0);
   vB = iClose(NULL,1440,0);
   SignalColor=CheckColor(vB, vA, PipsToOpen_Up_Color, PipsToOpen_Dn_Color);
   textmp=DoubleToStr((vB-vA)/Point,0);
   Write("MP14010", Side, MP_X+10, MP_Y+124, textmp, 10, "Tahoma Bold", SignalColor);
   textmp=Symbol();
   Write("MP14010", Side, MP_X+15, MP_Y+144, textmp, 20, "Tahoma Bold",CheckColor(vB, vC, PriceColor_Up, PriceColor_Dn));

   if (Show_Signals)
      {
       cTF=MP_X+130; cX=MP_X+100; cCC=MP_X+70; cSTR=MP_X+40; cTR=MP_X+10; 
       Write("MP14011", Side, MP_X+cTF,  MP_Y+180, "TF", 10, "Arial", LegendColor);
       Write("MP14012", Side, MP_X+cCC,  MP_Y+180, "CC", 10, "Arial", LegendColor);
       Write("MP14013", Side, MP_X+cX-5, MP_Y+180, "BS", 10, "Arial", LegendColor);
       Write("MP14014", Side, MP_X+cSTR, MP_Y+180, "Str", 10, "Arial", LegendColor);
       Write("MP14015", Side, MP_X+cTR,  MP_Y+180, "TR", 10, "Arial", LegendColor);
   
       xmp=cTF;
       ymp=MP_Y+156; space=12; fontname="Arial"; fontsize=8;
       Write("MP14019", Side, xmp, ymp+(04*space), "H4", fontsize, fontname, LegendColor);
       Write("MP14020", Side, xmp, ymp+(05*space), "H1", fontsize, fontname, LegendColor);
       Write("MP14021", Side, xmp, ymp+(06*space), "M30", fontsize, fontname, LegendColor);
       Write("MP14022", Side, xmp, ymp+(07*space), "M15", fontsize, fontname, LegendColor);
       Write("MP14023", Side, xmp, ymp+(08*space), "M5", fontsize, fontname, LegendColor);
       Write("MP14024", Side, xmp, ymp+(09*space), "M1", fontsize, fontname, LegendColor);
   
       nmp=4; ymp=MP_Y+156; space=12;
       while (nmp<=9)
             {
              switch (nmp)
                {
                 case 4: TFs =   240;  baris=4;  break; 
                 case 5: TFs =    60;  baris=5;  break; 
                 case 6: TFs =    30;  baris=6;  break; 
                 case 7: TFs =    15;  baris=7;  break; 
                 case 8: TFs =     5;  baris=8;  break; 
                 case 9: TFs =     1;  baris=9; break; 
                }

                vA = iMA(Symbol(),TFs, TMAFast_Period, TMAFast_Shift, TMAFast_Method, TMAFast_Apply_To, 0);
                vB = iMA(Symbol(),TFs, TMASlow_Period, TMASlow_Shift, TMASlow_Method, TMASlow_Apply_To, 0);
                if (vA>vB)
                   { SignalSymbol=UpSymbol; SignalColor=Arrow_Up; }
                else if  (vA<vB)
                   { SignalSymbol=DnSymbol; SignalColor=Arrow_Dn; }
                else {SignalSymbol=NtSymbol; SignalColor=Arrow_Nt; }
                Write("MP14025"+DoubleToStr(nmp,0), Side, cTR, ymp+(baris*space), SignalSymbol, 10, "Wingdings", SignalColor );
             
                v_RSI   = iRSI(Symbol(), TFs, RSI_Period , RSI_PRICE_TYPE, 0);
                v_Stoch = iStochastic(Symbol(), TFs, STOCH_K_Period,STOCH_D_Period,STOCH_Slowing, STOCH_MA_MODE, STOCH_Price_Field, MODE_MAIN, 0);
                v_CCI   = iCCI(Symbol(), TFs,CCI_Period , CCI_PRICE_TYPE, 0);
                
                if ((v_RSI > 50) && (v_Stoch > 40) && (v_CCI > 0)) { SignalSymbol = UpSymbol; SignalColor = Arrow_Up ;} 
                else if ((v_RSI < 50) && (v_Stoch < 60) && (v_CCI < 0)) { SignalSymbol = DnSymbol; SignalColor = Arrow_Dn ;}
             
                else if ((v_RSI < 50) && (v_Stoch > 40) && (v_CCI > 0)) { SignalSymbol = NtSymbol;  SignalColor = Arrow_Nt; }
                else if ((v_RSI > 50) && (v_Stoch < 60) && (v_CCI < 0)) { SignalSymbol = NtSymbol;  SignalColor = Arrow_Nt; }
                else if ((v_RSI < 50) && (v_Stoch > 40) && (v_CCI < 0)) { SignalSymbol = NtSymbol;  SignalColor = Arrow_Nt; }
                else if ((v_RSI > 50) && (v_Stoch < 60) && (v_CCI > 0)) { SignalSymbol = NtSymbol;  SignalColor = Arrow_Nt; }
                else if ((v_RSI > 50) && (v_Stoch > 40) && (v_CCI < 0)) { SignalSymbol = NtSymbol;  SignalColor = Arrow_Nt; }
                else if ((v_RSI > 50) && (v_Stoch < 60) && (v_CCI < 0)) { SignalSymbol = NtSymbol;  SignalColor = Arrow_Nt; }
             
                Write("MP14026"+DoubleToStr(nmp,0), Side, cSTR, ymp+(baris*space), SignalSymbol, 10, "Wingdings", SignalColor );
             
                vB = iMA(Symbol(), TFs, MAFast_Period, MAFast_Shift, MAFast_Method, MAFast_Apply_To, 0);
                vC = iMA(Symbol(), TFs, MASlow_Period, MASlow_Shift, MASlow_Method, MASlow_Apply_To, 0);
                if (vB>vC)
                   { SignalSymbol=UpSymbol; SignalColor=Arrow_Up; }
                else { SignalSymbol=DnSymbol; SignalColor=Arrow_Dn; }
                Write("MP14027"+DoubleToStr(nmp,0), Side, cX-3, ymp+(baris*space), SignalSymbol, 10, "Wingdings", SignalColor);
             
                vC = iClose( NULL , TFs, 0) - iOpen( NULL , TFs, 0);
                if ( vC > 0 ) 
                   { SignalColor = PriceColor_Up;  SignalSymbol="n"; }
                else if ( vC < 0 )  { SignalColor = PriceColor_Dn; SignalSymbol="n"; }
                else { SignalColor = NeutralColor; SignalSymbol="ª"; }
                Write("MP14028"+DoubleToStr(nmp,0), Side, cCC+2, ymp+(baris*space), SignalSymbol, 10, "Wingdings", SignalColor ); //x=120
                nmp++;
             }
         }
//+------------------------------------------------------------------+ End Of FX Market Signal
   return (0);
}
//+------------------------------------------------------------------+
int CountTrades_Hilo() {
   int count_0 = 0;
   for (int pos_4 = OrdersTotal() - 1; pos_4 >= 0; pos_4--) {
      cg = OrderSelect(pos_4, SELECT_BY_POS, MODE_TRADES);
      if (OrderSymbol() != Symbol() || OrderMagicNumber() != MagicNumber_Hilo) continue;
      if (OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber_Hilo)
         if (OrderType() == OP_SELL || OrderType() == OP_BUY) count_0++;
   }
   return (count_0);
}

void CloseThisSymbolAll_Hilo() {
   for (int pos_0 = OrdersTotal() - 1; pos_0 >= 0; pos_0--) {
      cg = OrderSelect(pos_0, SELECT_BY_POS, MODE_TRADES);
      if (OrderSymbol() == Symbol()) {
         if (OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber_Hilo) {
            if (OrderType() == OP_BUY) cg = OrderClose(OrderTicket(), OrderLots(), Bid, g_slippage_204, Blue);
            if (OrderType() == OP_SELL) cg = OrderClose(OrderTicket(), OrderLots(), Ask, g_slippage_204, Red);
         }
         Sleep(1000);
      }
   }
}

int OpenPendingOrder_Hilo(int ai_0, double a_lots_4, double ad_unused_12, int a_slippage_20, double ad_unused_24, int ai_32, int ai_36, string a_comment_40, int a_magic_48, int a_datetime_52, color a_color_56) {
   int ticket_60 = 0;
   int error_64 = 0;
   int count_68 = 0;
   int li_72 = 100;
   switch (ai_0) {
   case 0:
      for (count_68 = 0; count_68 < li_72; count_68++) {
         RefreshRates();
         ticket_60 = OrderSend(Symbol(), OP_BUY, a_lots_4, Ask, a_slippage_20, StopLong_Hilo(Bid, ai_32), TakeLong_Hilo(Ask, ai_36), a_comment_40, a_magic_48, a_datetime_52,
            a_color_56);
         error_64 = GetLastError();
         if (error_64 == 0/* NO_ERROR */) break;
         if (!((error_64 == 4/* SERVER_BUSY */ || error_64 == 137/* BROKER_BUSY */ || error_64 == 146/* TRADE_CONTEXT_BUSY */ || error_64 == 136/* OFF_QUOTES */))) break;
         Sleep(5000);
      }
      break;
   case 1:
      for (count_68 = 0; count_68 < li_72; count_68++) {
         ticket_60 = OrderSend(Symbol(), OP_SELL, a_lots_4, Bid, a_slippage_20, StopShort_Hilo(Ask, ai_32), TakeShort_Hilo(Bid, ai_36), a_comment_40, a_magic_48, a_datetime_52,
            a_color_56);
         error_64 = GetLastError();
         if (error_64 == 0/* NO_ERROR */) break;
         if (!((error_64 == 4/* SERVER_BUSY */ || error_64 == 137/* BROKER_BUSY */ || error_64 == 146/* TRADE_CONTEXT_BUSY */ || error_64 == 136/* OFF_QUOTES */))) break;
         Sleep(5000);
      }
   }
   return (ticket_60);
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
      cg = OrderSelect(g_pos_344, SELECT_BY_POS, MODE_TRADES);
      if (OrderSymbol() != Symbol() || OrderMagicNumber() != MagicNumber_Hilo) continue;
      if (OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber_Hilo)
         if (OrderType() == OP_BUY || OrderType() == OP_SELL) ld_ret_0 += OrderProfit();
   }
   return (ld_ret_0);
}

void TrailingAlls_Hilo(int ai_0, int ai_4, double a_price_8) {
   int li_16;
   double order_stoploss_20;
   double price_28;
   if (ai_4 != 0) {
      for (int pos_36 = OrdersTotal() - 1; pos_36 >= 0; pos_36--) {
         if (OrderSelect(pos_36, SELECT_BY_POS, MODE_TRADES)) {
            if (OrderSymbol() != Symbol() || OrderMagicNumber() != MagicNumber_Hilo) continue;
            if (OrderSymbol() == Symbol() || OrderMagicNumber() == MagicNumber_Hilo) {
               if (OrderType() == OP_BUY) {
                  li_16 = NormalizeDouble((Bid - a_price_8) / Point, 0);
                  if (li_16 < ai_0) continue;
                  order_stoploss_20 = OrderStopLoss();
                  price_28 = Bid - ai_4 * Point;
                  if (order_stoploss_20 == 0.0 || (order_stoploss_20 != 0.0 && price_28 > order_stoploss_20)) cg = OrderModify(OrderTicket(), a_price_8, price_28, OrderTakeProfit(), 0, Aqua);
               }
               if (OrderType() == OP_SELL) {
                  li_16 = NormalizeDouble((a_price_8 - Ask) / Point, 0);
                  if (li_16 < ai_0) continue;
                  order_stoploss_20 = OrderStopLoss();
                  price_28 = Ask + ai_4 * Point;
                  if (order_stoploss_20 == 0.0 || (order_stoploss_20 != 0.0 && price_28 < order_stoploss_20)) cg = OrderModify(OrderTicket(), a_price_8, price_28, OrderTakeProfit(), 0, Red);
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
   double order_open_price_0;
   int ticket_8;
   double ld_unused_12 = 0;
   int ticket_20 = 0;
   for (int pos_24 = OrdersTotal() - 1; pos_24 >= 0; pos_24--) {
      cg = OrderSelect(pos_24, SELECT_BY_POS, MODE_TRADES);
      if (OrderSymbol() != Symbol() || OrderMagicNumber() != MagicNumber_Hilo) continue;
      if (OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber_Hilo && OrderType() == OP_BUY) {
         ticket_8 = OrderTicket();
         if (ticket_8 > ticket_20) {
            order_open_price_0 = OrderOpenPrice();
            ld_unused_12 = order_open_price_0;
            ticket_20 = ticket_8;
         }
      }
   }
   return (order_open_price_0);
}

double FindLastSellPrice_Hilo() {
   double order_open_price_0;
   int ticket_8;
   double ld_unused_12 = 0;
   int ticket_20 = 0;
   for (int pos_24 = OrdersTotal() - 1; pos_24 >= 0; pos_24--) {
      cg = OrderSelect(pos_24, SELECT_BY_POS, MODE_TRADES);
      if (OrderSymbol() != Symbol() || OrderMagicNumber() != MagicNumber_Hilo) continue;
      if (OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber_Hilo && OrderType() == OP_SELL) {
         ticket_8 = OrderTicket();
         if (ticket_8 > ticket_20) {
            order_open_price_0 = OrderOpenPrice();
            ld_unused_12 = order_open_price_0;
            ticket_20 = ticket_8;
         }
      }
   }
   return (order_open_price_0);
}

int CountTrades_15() {
   int count_0 = 0;
   for (int pos_4 = OrdersTotal() - 1; pos_4 >= 0; pos_4--) {
      cg = OrderSelect(pos_4, SELECT_BY_POS, MODE_TRADES);
      if (OrderSymbol() != Symbol() || OrderMagicNumber() != g_magic_176_15) continue;
      if (OrderSymbol() == Symbol() && OrderMagicNumber() == g_magic_176_15)
         if (OrderType() == OP_SELL || OrderType() == OP_BUY) count_0++;
   }
   return (count_0);
}

void CloseThisSymbolAll_15() {
   for (int pos_0 = OrdersTotal() - 1; pos_0 >= 0; pos_0--) {
      cg = OrderSelect(pos_0, SELECT_BY_POS, MODE_TRADES);
      if (OrderSymbol() == Symbol()) {
         if (OrderSymbol() == Symbol() && OrderMagicNumber() == g_magic_176_15) {
            if (OrderType() == OP_BUY) cg = OrderClose(OrderTicket(), OrderLots(), Bid, g_slippage_432, Blue);
            if (OrderType() == OP_SELL) cg = OrderClose(OrderTicket(), OrderLots(), Ask, g_slippage_432, Red);
         }
         Sleep(1000);
      }
   }
}

int OpenPendingOrder_15(int ai_0, double a_lots_4, double ad_unused_12, int a_slippage_20, double ad_unused_24, int ai_32, int ai_36, string a_comment_40, int a_magic_48, int a_datetime_52, color a_color_56) {
   int ticket_60 = 0;
   int error_64 = 0;
   int count_68 = 0;
   int li_72 = 100;
   switch (ai_0) {
   case 0:
      for (count_68 = 0; count_68 < li_72; count_68++) {
         RefreshRates();
         ticket_60 = OrderSend(Symbol(), OP_BUY, a_lots_4, Ask, a_slippage_20, StopLong_15(Bid, ai_32), TakeLong_15(Ask, ai_36), a_comment_40, a_magic_48, a_datetime_52, a_color_56);
         error_64 = GetLastError();
         if (error_64 == 0/* NO_ERROR */) break;
         if (!((error_64 == 4/* SERVER_BUSY */ || error_64 == 137/* BROKER_BUSY */ || error_64 == 146/* TRADE_CONTEXT_BUSY */ || error_64 == 136/* OFF_QUOTES */))) break;
         Sleep(5000);
      }
      break;
   case 1:
      for (count_68 = 0; count_68 < li_72; count_68++) {
         ticket_60 = OrderSend(Symbol(), OP_SELL, a_lots_4, Bid, a_slippage_20, StopShort_15(Ask, ai_32), TakeShort_15(Bid, ai_36), a_comment_40, a_magic_48, a_datetime_52,
            a_color_56);
         error_64 = GetLastError();
         if (error_64 == 0/* NO_ERROR */) break;
         if (!((error_64 == 4/* SERVER_BUSY */ || error_64 == 137/* BROKER_BUSY */ || error_64 == 146/* TRADE_CONTEXT_BUSY */ || error_64 == 136/* OFF_QUOTES */))) break;
         Sleep(5000);
      }
   }
   return (ticket_60);
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
      cg = OrderSelect(g_pos_556, SELECT_BY_POS, MODE_TRADES);
      if (OrderSymbol() != Symbol() || OrderMagicNumber() != g_magic_176_15) continue;
      if (OrderSymbol() == Symbol() && OrderMagicNumber() == g_magic_176_15)
         if (OrderType() == OP_BUY || OrderType() == OP_SELL) ld_ret_0 += OrderProfit();
   }
   return (ld_ret_0);
}

void TrailingAlls_15(int ai_0, int ai_4, double a_price_8) {
   int li_16;
   double order_stoploss_20;
   double price_28;
   if (ai_4 != 0) {
      for (int pos_36 = OrdersTotal() - 1; pos_36 >= 0; pos_36--) {
         if (OrderSelect(pos_36, SELECT_BY_POS, MODE_TRADES)) {
            if (OrderSymbol() != Symbol() || OrderMagicNumber() != g_magic_176_15) continue;
            if (OrderSymbol() == Symbol() || OrderMagicNumber() == g_magic_176_15) {
               if (OrderType() == OP_BUY) {
                  li_16 = NormalizeDouble((Bid - a_price_8) / Point, 0);
                  if (li_16 < ai_0) continue;
                  order_stoploss_20 = OrderStopLoss();
                  price_28 = Bid - ai_4 * Point;
                  if (order_stoploss_20 == 0.0 || (order_stoploss_20 != 0.0 && price_28 > order_stoploss_20)) cg = OrderModify(OrderTicket(), a_price_8, price_28, OrderTakeProfit(), 0, Aqua);
               }
               if (OrderType() == OP_SELL) {
                  li_16 = NormalizeDouble((a_price_8 - Ask) / Point, 0);
                  if (li_16 < ai_0) continue;
                  order_stoploss_20 = OrderStopLoss();
                  price_28 = Ask + ai_4 * Point;
                  if (order_stoploss_20 == 0.0 || (order_stoploss_20 != 0.0 && price_28 < order_stoploss_20)) cg = OrderModify(OrderTicket(), a_price_8, price_28, OrderTakeProfit(), 0, Red);
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
   double order_open_price_0;
   int ticket_8;
   double ld_unused_12 = 0;
   int ticket_20 = 0;
   for (int pos_24 = OrdersTotal() - 1; pos_24 >= 0; pos_24--) {
      cg = OrderSelect(pos_24, SELECT_BY_POS, MODE_TRADES);
      if (OrderSymbol() != Symbol() || OrderMagicNumber() != g_magic_176_15) continue;
      if (OrderSymbol() == Symbol() && OrderMagicNumber() == g_magic_176_15 && OrderType() == OP_BUY) {
         ticket_8 = OrderTicket();
         if (ticket_8 > ticket_20) {
            order_open_price_0 = OrderOpenPrice();
            ld_unused_12 = order_open_price_0;
            ticket_20 = ticket_8;
         }
      }
   }
   return (order_open_price_0);
}

double FindLastSellPrice_15() {
   double order_open_price_0;
   int ticket_8;
   double ld_unused_12 = 0;
   int ticket_20 = 0;
   for (int pos_24 = OrdersTotal() - 1; pos_24 >= 0; pos_24--) {
      cg = OrderSelect(pos_24, SELECT_BY_POS, MODE_TRADES);
      if (OrderSymbol() != Symbol() || OrderMagicNumber() != g_magic_176_15) continue;
      if (OrderSymbol() == Symbol() && OrderMagicNumber() == g_magic_176_15 && OrderType() == OP_SELL) {
         ticket_8 = OrderTicket();
         if (ticket_8 > ticket_20) {
            order_open_price_0 = OrderOpenPrice();
            ld_unused_12 = order_open_price_0;
            ticket_20 = ticket_8;
         }
      }
   }
   return (order_open_price_0);
}

int CountTrades_16() {
   int count_0 = 0;
   for (int pos_4 = OrdersTotal() - 1; pos_4 >= 0; pos_4--) {
      cg = OrderSelect(pos_4, SELECT_BY_POS, MODE_TRADES);
      if (OrderSymbol() != Symbol() || OrderMagicNumber() != g_magic_176_16) continue;
      if (OrderSymbol() == Symbol() && OrderMagicNumber() == g_magic_176_16)
         if (OrderType() == OP_SELL || OrderType() == OP_BUY) count_0++;
   }
   return (count_0);
}

void CloseThisSymbolAll_16() {
   for (int pos_0 = OrdersTotal() - 1; pos_0 >= 0; pos_0--) {
      cg = OrderSelect(pos_0, SELECT_BY_POS, MODE_TRADES);
      if (OrderSymbol() == Symbol()) {
         if (OrderSymbol() == Symbol() && OrderMagicNumber() == g_magic_176_16) {
            if (OrderType() == OP_BUY) cg = OrderClose(OrderTicket(), OrderLots(), Bid, g_slippage_648, Blue);
            if (OrderType() == OP_SELL) cg = OrderClose(OrderTicket(), OrderLots(), Ask, g_slippage_648, Red);
         }
         Sleep(1000);
      }
   }
}

int OpenPendingOrder_16(int ai_0, double a_lots_4, double ad_unused_12, int a_slippage_20, double ad_unused_24, int ai_32, int ai_36, string a_comment_40, int a_magic_48, int a_datetime_52, color a_color_56) {
   int ticket_60 = 0;
   int error_64 = 0;
   int count_68 = 0;
   int li_72 = 100;
   switch (ai_0) {
   case 0:
      for (count_68 = 0; count_68 < li_72; count_68++) {
         RefreshRates();
         ticket_60 = OrderSend(Symbol(), OP_BUY, a_lots_4, Ask, a_slippage_20, StopLong_16(Bid, ai_32), TakeLong_16(Ask, ai_36), a_comment_40, a_magic_48, a_datetime_52, a_color_56);
         error_64 = GetLastError();
         if (error_64 == 0/* NO_ERROR */) break;
         if (!((error_64 == 4/* SERVER_BUSY */ || error_64 == 137/* BROKER_BUSY */ || error_64 == 146/* TRADE_CONTEXT_BUSY */ || error_64 == 136/* OFF_QUOTES */))) break;
         Sleep(5000);
      }
      break;
   case 1:
      for (count_68 = 0; count_68 < li_72; count_68++) {
         ticket_60 = OrderSend(Symbol(), OP_SELL, a_lots_4, Bid, a_slippage_20, StopShort_16(Ask, ai_32), TakeShort_16(Bid, ai_36), a_comment_40, a_magic_48, a_datetime_52,
            a_color_56);
         error_64 = GetLastError();
         if (error_64 == 0/* NO_ERROR */) break;
         if (!((error_64 == 4/* SERVER_BUSY */ || error_64 == 137/* BROKER_BUSY */ || error_64 == 146/* TRADE_CONTEXT_BUSY */ || error_64 == 136/* OFF_QUOTES */))) break;
         Sleep(5000);
      }
   }
   return (ticket_60);
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
      cg = OrderSelect(g_pos_772, SELECT_BY_POS, MODE_TRADES);
      if (OrderSymbol() != Symbol() || OrderMagicNumber() != g_magic_176_16) continue;
      if (OrderSymbol() == Symbol() && OrderMagicNumber() == g_magic_176_16)
         if (OrderType() == OP_BUY || OrderType() == OP_SELL) ld_ret_0 += OrderProfit();
   }
   return (ld_ret_0);
}

void TrailingAlls_16(int ai_0, int ai_4, double a_price_8) {
   int li_16;
   double order_stoploss_20;
   double price_28;
   if (ai_4 != 0) {
      for (int pos_36 = OrdersTotal() - 1; pos_36 >= 0; pos_36--) {
         if (OrderSelect(pos_36, SELECT_BY_POS, MODE_TRADES)) {
            if (OrderSymbol() != Symbol() || OrderMagicNumber() != g_magic_176_16) continue;
            if (OrderSymbol() == Symbol() || OrderMagicNumber() == g_magic_176_16) {
               if (OrderType() == OP_BUY) {
                  li_16 = NormalizeDouble((Bid - a_price_8) / Point, 0);
                  if (li_16 < ai_0) continue;
                  order_stoploss_20 = OrderStopLoss();
                  price_28 = Bid - ai_4 * Point;
                  if (order_stoploss_20 == 0.0 || (order_stoploss_20 != 0.0 && price_28 > order_stoploss_20)) cg = OrderModify(OrderTicket(), a_price_8, price_28, OrderTakeProfit(), 0, Aqua);
               }
               if (OrderType() == OP_SELL) {
                  li_16 = NormalizeDouble((a_price_8 - Ask) / Point, 0);
                  if (li_16 < ai_0) continue;
                  order_stoploss_20 = OrderStopLoss();
                  price_28 = Ask + ai_4 * Point;
                  if (order_stoploss_20 == 0.0 || (order_stoploss_20 != 0.0 && price_28 < order_stoploss_20)) cg = OrderModify(OrderTicket(), a_price_8, price_28, OrderTakeProfit(), 0, Red);
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
   double order_open_price_0;
   int ticket_8;
   double ld_unused_12 = 0;
   int ticket_20 = 0;
   for (int pos_24 = OrdersTotal() - 1; pos_24 >= 0; pos_24--) {
      cg = OrderSelect(pos_24, SELECT_BY_POS, MODE_TRADES);
      if (OrderSymbol() != Symbol() || OrderMagicNumber() != g_magic_176_16) continue;
      if (OrderSymbol() == Symbol() && OrderMagicNumber() == g_magic_176_16 && OrderType() == OP_BUY) {
         ticket_8 = OrderTicket();
         if (ticket_8 > ticket_20) {
            order_open_price_0 = OrderOpenPrice();
            ld_unused_12 = order_open_price_0;
            ticket_20 = ticket_8;
         }
      }
   }
   return (order_open_price_0);
}

double FindLastSellPrice_16() {
   double order_open_price_0;
   int ticket_8;
   double ld_unused_12 = 0;
   int ticket_20 = 0;
   for (int pos_24 = OrdersTotal() - 1; pos_24 >= 0; pos_24--) {
      cg = OrderSelect(pos_24, SELECT_BY_POS, MODE_TRADES);
      if (OrderSymbol() != Symbol() || OrderMagicNumber() != g_magic_176_16) continue;
      if (OrderSymbol() == Symbol() && OrderMagicNumber() == g_magic_176_16 && OrderType() == OP_SELL) {
         ticket_8 = OrderTicket();
         if (ticket_8 > ticket_20) {
            order_open_price_0 = OrderOpenPrice();
            ld_unused_12 = order_open_price_0;
            ticket_20 = ticket_8;
         }
      }
   }
   return (order_open_price_0);
}
//---
void main()
  {
   double point;
   int    index, pindex, cnt;
   string ext = StringSubstr(Symbol(),6,0);
   string mySymbol = aPair[index]+ext;
   double cmeter;

   for (index = 0; index < PairCount; index++)
   {
      RefreshRates();
      point            = GetPoint(mySymbol);
      aHigh[index]     = MarketInfo(mySymbol,MODE_HIGH);
      aLow[index]      = MarketInfo(mySymbol,MODE_LOW);
      aBid[index]      = MarketInfo(mySymbol,MODE_BID);
      aAsk[index]      = MarketInfo(mySymbol,MODE_ASK);
      aRange[index]    = MathMax((aHigh[index]-aLow[index])/point,1);
      aRatio[index]    = (aBid[index]-aLow[index])/aRange[index]/point; 
      aLookup[index]   = iLookup(aRatio[index]*100);
      aStrength[index] = 9.9-aLookup[index];          
   } 

   for (pindex=0; pindex<CurrencyCount; pindex++)
   { 
     cnt=0; 
     cmeter=0;
     for (index = 0; index < PairCount; index++)
     {
       if (StringSubstr(aPair[index],0,3)==aMajor[pindex])
       {
        cnt++;
        cmeter = cmeter + aLookup[index];
       }
       if (StringSubstr(aPair[index],3,3)==aMajor[pindex])
       {
        cnt++;
        cmeter = cmeter + aStrength[index];
       }
       if (cnt>0) aMeter[pindex]=NormalizeDouble(cmeter / cnt,1); else aMeter[pindex]=-1;
     }
   }
             
   objectBlank();
   
   for (pindex=0; pindex<CurrencyCount; pindex++)
   {
     paintCurr(pindex, aMeter[pindex]); 
   }
  }
//---
void init_tradepair_index()
{
  int i,n,tpcount;
  string cpair, m1,m2;
  tpcount=ArraySize(aTradePair);
  
  for(n=0; n<tpcount; n++)
  {
    cpair=aTradePair[0];
    m1=StringSubstr(cpair,0,3);
    m2=StringSubstr(cpair,3,3);
    aIndex[0,n]=-1;
    aIndex[1,n]=-1;
    for(i=0;i<CurrencyCount;i++)
    {
      if(m1==aMajor[i]) aIndex[0,n]=i;
      if(m2==aMajor[i]) aIndex[1,n]=i;
    }
    if(aIndex[0,n]==-1 || aIndex[1,n]==-1) 
      Print("Currency Pair : ",cpair," is not tradeable, check array definition!");
  }
}
//---
double GetPoint(string mSymbol)
{
 double myPoint = 0.0001, YenPoint = 0.01;
 string mySymbol;
 if (StringSubstr(mySymbol,3,3) == "JPY") return (YenPoint);
 return(myPoint);
}
//---
int iLookup(double ratio) 
  {
   int   index=-1, i;
   if(ratio <= aTable[0]) index = 0;
   else {
     for (i=1; i<TABSIZE; i++) if(ratio < aTable[i]) {index=i-1;  break; }
     if(index==-1) index=10;
   }
   return(index);
  }
//---
void initGraph()
  {
   int pindex;
   DeleteExistingLabels();
   for (pindex=0; pindex<CurrencyCount; pindex++)
   { 
      objectCreate(Id + aMajor[pindex],aMajorPos[pindex]+2+477,Box_Top+3,aMajor[pindex],8,"Arial",clrOrangeRed); // komale bam barale dan
      objectCreate(Id + aMajor[pindex]+"p",aMajorPos[pindex]+4+477,Box_Top+17,DoubleToStr(9,1),9,"Arial",clrLime); // komale bam barale dan
   }
   WindowRedraw();
  }
//+------------------------------------------------------------------+
void objectCreate(string name,int x,int y,string text="-",int size=42,string font="Arial",color colour=CLR_NONE)
  {
   ObjectCreate(name,OBJ_LABEL,0,0,0);
   ObjectSet(name,OBJPROP_CORNER,3);// muve........
   ObjectSet(name,OBJPROP_COLOR,colour);
   ObjectSet(name,OBJPROP_XDISTANCE,x);
   ObjectSet(name,OBJPROP_YDISTANCE,y);
   ObjectSet(name,OBJPROP_SELECTABLE,0);
   ObjectSetText(name,text,size,font,colour);
  }
//---
void objectBlank()
  {
   int pindex;
   for (pindex=0; pindex<CurrencyCount; pindex++)
     { 
      ObjectSet(Id + aMajor[pindex],OBJPROP_COLOR,CLR_NONE);
      ObjectSet(Id + aMajor[pindex]+"p",OBJPROP_COLOR,CLR_NONE);
     }
  }
//---
void paintCurr(int pindex, double value)
{
  ObjectSet(Id + aMajor[pindex],OBJPROP_COLOR,clrOrangeRed);
  ObjectSetText(Id + aMajor[pindex]+"p",DoubleToStr(value,1),9,"Arial",clrLime);
}
//---
void DeleteExistingLabels()
{
   int objLabels = ObjectsTotal(OBJ_LABEL);
   string objName;
   if (objLabels > 0)
   {
      for (int i = objLabels; i >= 0;i--)
      {
         objName = ObjectName(i);
         if (StringFind(objName,Id, 0) >= 0) { ObjectDelete(objName); continue; }  
      }
   }
}
//+------------------------------------------------------------------+ Start Of Currency Power Meter
int CheckRatio(double ad_0) {
   int li_ret_8 = -1;
   if (ad_0 <= 0.0) li_ret_8 = 0;
   else {
      for (int index_12 = 0; index_12 < 11; index_12++) {
         if (ad_0 < gia_176[index_12]) {
            li_ret_8 = index_12 - 1;
            break;
         }
      }
      if (li_ret_8 == -1) li_ret_8 = 10;
   }
   return (li_ret_8);
}
//---
double MyLowest(string a_symbol_0) {
   double ilow_8 = iLow(a_symbol_0, 0, 0);
   int timeframe_16 = 15;
   int li_20 = 4;
   if (Hours < 3) {
      timeframe_16 = 5;
      li_20 = 12;
   }
   for (int li_24 = 0; li_24 < Hours * li_20; li_24++)
      if (ilow_8 > iLow(a_symbol_0, timeframe_16, li_24)) ilow_8 = iLow(a_symbol_0, timeframe_16, li_24);
   return (ilow_8);
}
//---
double MyHighest(string a_symbol_0) {
   double ihigh_8 = iHigh(a_symbol_0, 0, 0);
   int timeframe_16 = 15;
   int li_20 = 4;
   if (Hours < 3) {
      timeframe_16 = 5;
      li_20 = 12;
   }
   for (int li_24 = 0; li_24 < Hours * li_20; li_24++)
      if (ihigh_8 < iHigh(a_symbol_0, timeframe_16, li_24)) ihigh_8 = iHigh(a_symbol_0, timeframe_16, li_24);
   return (ihigh_8);
}
//---
void objectCreateMeter(string a_name_0, int a_x_8, int a_y_12, string a_text_16 = ".", int a_fontsize_24 = 42, string a_fontname_28 = "Arial", color a_color_36 = -1, int angl = 0) {
   ObjectCreate(a_name_0, OBJ_LABEL, 0, 0, 0);
   ObjectSet(a_name_0, OBJPROP_CORNER, 3);
   ObjectSet(a_name_0, OBJPROP_COLOR, a_color_36);
   ObjectSet(a_name_0, OBJPROP_XDISTANCE, a_x_8+ 780); // komale bam barale dan
   ObjectSet(a_name_0, OBJPROP_YDISTANCE, a_y_12);
   ObjectSet(a_name_0, OBJPROP_ANGLE, angl);
   ObjectSet(a_name_0, OBJPROP_SELECTABLE, false);
   ObjectSetText(a_name_0, a_text_16, a_fontsize_24, a_fontname_28, a_color_36);
}
//---
void ShowData(int ai_0) {
   double ld_4 = 0;
   for (int index_12 = 0; index_12 < 20; index_12++) {
      ld_4 = index_12;
      if (gda_188[ai_0] > ld_4 / 2.0) {
         ObjectSet("CPM" + gsa_164[ai_0] + index_12, OBJPROP_COLOR, gia_172[index_12]);
         ObjectSet("CPM" + gsa_164[ai_0] + index_12 + "x", OBJPROP_COLOR, gia_172[index_12]);
      } else {
         ObjectSet("CPM" + gsa_164[ai_0] + index_12, OBJPROP_COLOR, CLR_NONE);
         ObjectSet("CPM" + gsa_164[ai_0] + index_12 + "x", OBJPROP_COLOR, CLR_NONE);
      }
      if (gda_200[ai_0] > ld_4 / 2.0) ObjectSet("CPM" + gsa_164[ai_0] + index_12 + "h", OBJPROP_COLOR, gia_172[index_12]);
      else ObjectSet("CPM" + gsa_164[ai_0] + index_12 + "h", OBJPROP_COLOR, CLR_NONE);
   }
   ObjectSetText("CPM" + gsa_164[ai_0] + "_Str", DoubleToStr(gda_188[ai_0], 1), 8, "Verdana", cScoreHigh);
   ObjectSetText("CPM" + gsa_164[ai_0] + "_Str_h", DoubleToStr(gda_200[ai_0], 1), 8, "Verdana", cScoreHour);
}
//+------------------------------------------------------------------+ End Of Currency Power Meter
//+------------------------------------------------------------------+ Start Of FX Market Signal
void Write(string LBL, double side, int pos_x, int pos_y, string texts, int fontsizes, string fontnames, color Tcolor=CLR_NONE)
  {
    ObjectCreate(LBL, OBJ_LABEL, 0, 0, 0);
    ObjectSetText(LBL, texts, fontsizes, fontnames, Tcolor);
    ObjectSet(LBL, OBJPROP_CORNER, side);
    ObjectSet(LBL, OBJPROP_XDISTANCE, pos_x);
    ObjectSet(LBL, OBJPROP_YDISTANCE, pos_y);
    ObjectSet(LBL, OBJPROP_SELECTABLE, false);
  }
//---
color CheckColor(double a, double b, color u, color d)
   {
     if (a>b) { return (u); } else { return (d); }
   }
//+------------------------------------------------------------------+ End Of FX Market Signal
void OnTimer()
{
   color jilik = clrRed;
   switch(ObjectGetInteger(0,"Lable4", OBJPROP_COLOR))
     {
      case clrRed : jilik = clrGreen; break;
      case clrGreen : jilik = clrDarkGoldenrod; break;
      case clrGold : jilik = clrDarkOliveGreen; break;
      case clrBlue : jilik = clrDarkKhaki; break;
      default: jilik = clrRed; break;
     }
   ObjectSetInteger(0,"Lable4", OBJPROP_COLOR, jilik);
}
//---