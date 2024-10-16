//+------------------------------------------------------------------+
//|                                      AF-Global Expert (Name).mq4 |
//|                        Copyright 2018, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+

#property copyright "Copyright 2013-2018, AFSID-Group.Cv"
#property link      "https://afs-id.com"
#property version   "18.0"

#property description   "======COMBINED AF-Scalper.Ltd, AF-FiboScalper And AF-TrendKiller====="
#property description   "=Expert Type Scalping Day="
#property description   "=Minimum Deposit 1000$/2 Pair= EURUSD GBPUSD"
#property description   "=Recommended Pair EURUSD,EURJPY,USDJPY,GBPUSD,GBPJPY="
#property description   "=TF H1="
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+

extern string LicenceTO = " Juan Guillermo Lara ";
extern string ATURANWAJIB = "GLOBAL-SETTINGS";
extern string OnlineIndicatorAddress ="103.233.102.2"; //Online Indicator.
extern string IndicatorServer = "https://afs-id.com"; //Connecting to server
extern bool UseOnlineIndicator = True;
extern double Lots = 0.01;
extern double LotExponent = 1.44;
extern int lotdecimal = 2;
extern double PipStep = 180.0;
extern double MaxLots = 99.0;
extern bool MM = FALSE;
extern double TakeProfit = 50.0;
extern bool UseEquityStop = FALSE;
extern double TotalEquityRisk = 20.0;
extern bool UseTrailingStop = FALSE;
extern double TrailStart = 13.0;
extern double TrailStop = 3.0;
extern double slip = 5.0;
extern string ATURANFIBO = "SETTINGS For AF-FiboScalper";
extern int MaxTrades_Hilo = 20;
bool gi_184 = FALSE;
double gd_188 = 48.0;
double g_pips_196 = 40.0;
double g_slippage_204;
extern int MagicNumber_Hilo = 10278;
double g_price_216;
double gd_224;
double gd_unused_232;
double gd_unused_240;
double gd_248;
double gd_256;
double g_price_264;
double g_bid_272;
double g_ask_280;
double gd_288;
double gd_296;
double gd_304;
bool gi_312;
string gs_316 = "Global*AF-FiboScalper/2019";
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
extern string ATURANAFSCALPER = "SETTINGS For AF-Scalper";
extern int MaxTrades_15 = 20;
int g_timeframe_408 = PERIOD_H1;
double g_pips_412 = 40.0;
bool gi_420 = FALSE;
double gd_424 = 48.0;
double g_slippage_432;
extern int g_magic_176_15 = 22324;
double g_price_444;
double gd_452;
double gd_unused_460;
double gd_unused_468;
double g_price_476;
double g_bid_484;
double g_ask_492;
double gd_500;
double gd_508;
double gd_516;
bool gi_524;
string gs_528 = "Global*AF-Scalper.Ltd/2019";
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
extern string ATURANTRENDKILLER = "SETTINGS For AF-TrendKiller";
extern int MaxTrades_16 = 20;
int g_timeframe_624 = PERIOD_M1;
double g_pips_628 = 40.0;
bool gi_636 = FALSE;
double gd_640 = 48.0;
double g_slippage_648;
extern int g_magic_176_16 = 23794;
extern bool UseNewsFilter = FALSE;
double g_price_660;
double gd_668;
double gd_unused_676;
double gd_unused_684;
double g_price_692;
double g_bid_700;
double g_ask_708;
double gd_716;
double gd_724;
double gd_732;
bool gi_740;
string gs_744 = "Global*AF-TrendKiller/2019";
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

int init() {
   gd_304 = MarketInfo(Symbol(), MODE_SPREAD) * Point;
   gd_516 = MarketInfo(Symbol(), MODE_SPREAD) * Point;
   gd_732 = MarketInfo(Symbol(), MODE_SPREAD) * Point;
   ObjectCreate("Lable1", OBJ_LABEL, 0, 0, 1.0);
   ObjectSet("Lable1", OBJPROP_CORNER, 2);
   ObjectSet("Lable1", OBJPROP_XDISTANCE, 23);
   ObjectSet("Lable1", OBJPROP_YDISTANCE, 21);
   g_text_1104 = "AFSID GROUP";
   ObjectSetText("Lable1", g_text_1104, 12, "Times New Roman", Aqua);
   ObjectCreate("Lable", OBJ_LABEL, 0, 0, 1.0);
   ObjectSet("Lable", OBJPROP_CORNER, 2);
   ObjectSet("Lable", OBJPROP_XDISTANCE, 3);
   ObjectSet("Lable", OBJPROP_YDISTANCE, 1);
   g_text_1096 = " https://afs-id.com";
   ObjectSetText("Lable", g_text_1096, 11, "Times New Roman", DeepSkyBlue);
   return (0);
}

int deinit() {
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
   Comment("https://afs-id.com");
   return (0);
}
//=============================================================================================================
int start()
  {
   //string batas=""; //Year, Month, Date, Expiration
   //int tt=StrToTime(batas);
   //if(TimeCurrent()>tt)
     {
     // Alert(" Licence Ended Please Visit https://afs-id.com/ ");
      //return(0);
}
//=============================================================================================================

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
   
   Comment("AFSID GROUP" 
      + "\n" 
      + "https://afs-id.com" 
      + "\n" 
      + "___________________________________________________" 
      + "\n" 
      + "Broker                                    :" + AccountCompany() 
      + "\n" 
      + "Brokers Time                          :" + TimeToStr(TimeCurrent(), TIME_DATE|TIME_SECONDS) 
      + "\n" 
      + "___________________________________________________" 
      + "\n" 
      + "Name                                     :" + AccountName() 
      + "\n" 
      + "Account Number                    :" + AccountNumber() 
      + "\n" 
      + "Account Currency                  :" + AccountCurrency() 
      + "\n" 
      + "____________________________________________________" 
      + "\n" 
      + "Open Orders FiboScalper         :" + CountTrades_Hilo() 
      + "\n" 
      + "Open Orders AF-Scalper          :" + CountTrades_15() 
      + "\n" 
      + "Open Orders AF-TrendKiller     :" + CountTrades_16() 
      + "\n" 
      + "ALL ORDERS                          :" + OrdersTotal() 
      + "\n" 
      + "_____________________________________________________" 
      + "\n" 
      + "Account BALANCE                  :" + DoubleToStr(AccountBalance(), 2) 
      + "\n" 
      + "Account EQUITY                     :" + DoubleToStr(AccountEquity(), 2) 
      + "\n" 
   + "AFSID GROUP");
   gd_248 = NormalizeDouble(AccountBalance(), 2);
   gd_256 = NormalizeDouble(AccountEquity(), 2);
   if (gd_256 >= 5.0 * (gd_248 / 6.0)) g_color_1128 = DodgerBlue;
   if (gd_256 >= 4.0 * (gd_248 / 6.0) && gd_256 < 5.0 * (gd_248 / 6.0)) g_color_1128 = DeepSkyBlue;
   if (gd_256 >= 3.0 * (gd_248 / 6.0) && gd_256 < 4.0 * (gd_248 / 6.0)) g_color_1128 = Gold;
   if (gd_256 >= 2.0 * (gd_248 / 6.0) && gd_256 < 3.0 * (gd_248 / 6.0)) g_color_1128 = OrangeRed;
   if (gd_256 >= gd_248 / 6.0 && gd_256 < 2.0 * (gd_248 / 6.0)) g_color_1128 = Crimson;
   if (gd_256 < gd_248 / 5.0) g_color_1128 = Red;
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
   ObjectSetText("SSignalMACD_TEXT", "MACD", 6, "Tahoma Narrow", g_color_888);
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
   ObjectSetText("SSignalSTR_TEXT", "STR", 6, "Tahoma Narrow", g_color_888);
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
   ObjectSetText("SignalEMA_TEXT", "EMA", 6, "Tahoma Narrow", g_color_888);
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
         ObjectSetText("Signalprice", DoubleToStr(ld_900, Digits), 35, "Arial", color_92);
         ObjectSet("Signalprice", OBJPROP_CORNER, g_corner_856);
         ObjectSet("Signalprice", OBJPROP_XDISTANCE, gi_864 + 10);
         ObjectSet("Signalprice", OBJPROP_YDISTANCE, gi_860 + 56);
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
      g_bid_272 = Bid;
      g_ask_280 = Ask;
      if ((!gi_368) && !gi_364) {
         gi_332 = gi_348;
         gd_336 = NormalizeDouble(ld_144 * MathPow(ld_1060, gi_332), li_1068);
         if (ihigh_112 > ilow_120) {
            if (iRSI(NULL, PERIOD_H1, 14, PRICE_CLOSE, 1) > 30.0) {
               gi_372 = OpenPendingOrder_Hilo(1, gd_336, g_bid_272, ld_1120, g_bid_272, 0, 0, gs_316 + "-" + gi_332, MagicNumber_Hilo, 0, HotPink);
               if (gi_372 < 0) {
                  Print("Error: ", GetLastError());
                  return (0);
               }
               gd_288 = FindLastBuyPrice_Hilo();
               gi_376 = TRUE;
            }
         } else {
            if (iRSI(NULL, PERIOD_H1, 14, PRICE_CLOSE, 1) < 70.0) {
               gi_372 = OpenPendingOrder_Hilo(0, gd_336, g_ask_280, ld_1120, g_ask_280, 0, 0, gs_316 + "-" + gi_332, MagicNumber_Hilo, 0, Lime);
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
         g_bid_484 = Bid;
         g_ask_492 = Ask;
         gi_544 = gi_560;
         gd_548 = ld_152;
         if (iclose_128 > iclose_136) {
            gi_584 = OpenPendingOrder_15(1, gd_548, g_bid_484, ld_1204, g_bid_484, 0, 0, gs_528 + "-" + gi_544, g_magic_176_15, 0, HotPink);
            if (gi_584 < 0) {
               Print("Error: ", GetLastError());
               return (0);
            }
            gd_500 = FindLastBuyPrice_15();
            gi_588 = TRUE;
         } else {
            gi_584 = OpenPendingOrder_15(0, gd_548, g_ask_492, ld_1204, g_ask_492, 0, 0, gs_528 + "-" + gi_544, g_magic_176_15, 0, Lime);
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
         g_bid_700 = Bid;
         g_ask_708 = Ask;
         gi_760 = gi_776;
         gd_764 = ld_176;
         if (iclose_128 > iclose_136) {
            if (iRSI(NULL, PERIOD_H1, 14, PRICE_CLOSE, 1) > 30.0) {
               gi_800 = OpenPendingOrder_16(1, gd_764, g_bid_700, ld_1284, g_bid_700, 0, 0, gs_744 + "-" + gi_760, g_magic_176_16, 0, HotPink);
               if (gi_800 < 0) {
                  Print("Error: ", GetLastError());
                  return (0);
               }
               gd_716 = FindLastBuyPrice_16();
               gi_804 = TRUE;
            }
         } else {
            if (iRSI(NULL, PERIOD_H1, 14, PRICE_CLOSE, 1) < 70.0) {
               gi_800 = OpenPendingOrder_16(0, gd_764, g_ask_708, ld_1284, g_ask_708, 0, 0, gs_744 + "-" + gi_760, g_magic_176_16, 0, Lime);
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
   return (0);
}

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


//NOTE:
         //YOU CAN MODIFY THE EXPERT NAME AND EXPERT COMMENT BUT YOU CANNOT CHANGE THE EXPERT SERVER ADDRESS AND IP ADDRESS
         //MORE INFO PLEASE WHATSAPP TO +62.811.93.2525.5
         //SKYPE AFSID-Group
         //OFFICIAL SITE HTTPS://AFS-ID.COM