//+------------------------------------------------------------------+
//|                75.BTC_FapTurbo2_Premium-EDU(trueforex.pp.ua).mq4 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
/*
   2013-12-12 by Capella at http://worldwide-invest.org/
	- No need for DLL-file from vendor ("Kernel32.dll" is part of Windows OS)
	- Overruled need for authentication 
	- Overruled broker company restrictions
	- Fixed bugs that caused compilation errors and warnings
	- Added alternative automatic GMT offset using local computer system time
*/
#property copyright "Copyright � BTC FAPTv2.0 Premium for Bitcoin"
#property link      "http://fapturbo2.com"

#import "Kernel32.dll"
   void GetSystemTime(int& a0[]);
#import

/*
#import "wininet.dll"
   int InternetOpenA(string a0, int a1, string a2, string a3, int a4);
   int InternetOpenUrlA(int a0, string a1, string a2, int a3, int a4, int a5);
   int InternetReadFile(int a0, string a1, int a2, int& a3[]);
   int InternetCloseHandle(int a0);
#import

extern string EMail = "";
extern string ClickbankReceipt = "";
*/

extern string Copyrights = "FapTurbo2.com Premium Robot for Bitcoin";
int Gi_100 = 2;
int Gi_104 = 0;
int Gi_108 = 5;
int Gia_112[9] = {0, 1, 5, 15, 30, 60, 240, 10080, 43200};
int Gi_116 = 1;
int G_timeframe_120 = PERIOD_M1;
int Gi_124 = 1;
int G_datetime_128 = 0;
bool Gi_132;
bool Gi_136;
int G_datetime_140 = 0;
int G_datetime_144 = 0;
int Gi_148 = 0;
string Gs_152;
string Gs_160;
string Gs_168;
int Gi_unused_176 = -3;
int Gi_unused_180 = 3;
int G_digits_184 = 3;
int Gi_188 = 0;
string Gsa_192[2] = {"Scalper", "Medium-Term Trader"};
extern bool UseMediumTermStrategy = TRUE;
extern bool StealthMode = TRUE;
extern bool UseAutoGMToffset = TRUE;
extern int ManualGMToffset = 2;
bool Gi_unused_212 = FALSE;
string Gs_unused_216 = "BTCUSD_Ask";
extern string __MediumTermStrategy__ = "==== MTS on BTC/USD, H1 or higher ====";
extern double MTS_Lots = 0.01;
extern bool MTS_UseMM = FALSE;
extern double MTS_LotsRiskReductor = 5.0;
extern double MTS_MaxLots = 10.0;
extern string _MTS_Trade_Time_Options___;
extern int MTS_StartWorkTimeHour = 1;
extern int MTS_StartSessionMinute = 0;
extern int MTS_EndWorkTimeHour = 22;
extern int MTS_EndSessionMinute = 30;
extern bool MTS_TradeMonday = TRUE;
extern bool MTS_TradeFriday = TRUE;
extern bool MTS_TradeWeekend = TRUE;
extern int MTS_ForceCloseAtEOS = 2;
extern int MTS_AvoidDaysBefore = 0;
extern int MTS_AvoidDaysAfter = 0;
extern string _MTS_Trade_Settings___;
extern bool MTS_ReverseTrade = TRUE;
extern int MTS_TakeProfit = 35;
extern int MTS_StopLoss = 90;
int Gi_unused_328 = 2;
extern bool MTS_AddSpreadToTP = FALSE;
extern double MTS_ProfitLimit = 0.0;
extern double MTS_LossLimit = 0.0;
string Gs_unused_352 = "---------- main Indi params ----------";
int G_timeframe_360 = PERIOD_H4;
int Gi_364 = 6;
int G_period_368 = 30;
int Gi_372 = 0;
int Gi_376 = 15;
int Gi_380 = 55;
int Gi_384 = 1;
int G_period_388 = 25;
int Gi_392 = 1;
int Gi_396 = 25;
int Gi_400 = 75;
int G_timeframe_404 = PERIOD_M1;
int Gi_408 = 1;
int G_period_412 = 20;
int Gi_416 = 1;
int Gi_420 = 40;
extern string remMTSTF = "---------- Filters ----------";
string Gs_dummy_432;
extern bool MTS_UseCustomLevels = FALSE;
extern bool MTS_SimpleHeightFilter = FALSE;
extern int MTS_MaxBarHeight = 10;
int Gi_452 = 720;
int Gi_456 = 0;
int Gi_460 = 720;
int Gi_464 = 0;
int Gi_468 = 1440;
int Gi_472 = 2;
int Gi_476 = 2880;
int Gi_480 = 5;
int Gi_484 = 5760;
int Gi_488 = 5;
extern bool MTS_TrendFilter = TRUE;
extern int MTS_TF_MA_Period = 5;
int G_applied_price_500 = PRICE_CLOSE;
int G_ma_method_504 = MODE_SMA;
extern double MTS_TFMaxPercentMove = 11.5;
string Gs_dummy_516;
extern bool MTS_UseFilterMA = FALSE;
extern int MTS_TFNumFilterMA = 3;
int G_timeframe_532 = PERIOD_M15;
extern int MTS_PeriodFilterMA = 100;
int G_applied_price_540 = PRICE_CLOSE;
int G_ma_method_544 = MODE_SMA;
extern string remMTSOTP = "---------- Other trade params ----------";
extern int MTS_RelaxHours = 0;
extern int MTS_OneTrade = 1;
extern bool MTS_OneOpenTrade = FALSE;
string Gs_dummy_568;
extern double MTS_MaxSpread = 1.0;
extern double MTS_Slippage = 0.1;
int Gi_592 = 30;
extern string MTS_ExpertComment = "BTCPrem2MTS";
extern int MTS_MagicNumber = 20131101;
extern string _____Scalper_____ = "======= Scalper for BTCUSD, M1 =======";
extern double Scalper_Lots = 0.01;
extern bool Scalper_UseMM = FALSE;
extern double Scalper_LotsRiskReductor = 2.0;
extern double Scalper_MaxLots = 100.0;
extern string ___Trade_Time_Options____;
extern int Scalper_StartWorkTimeHour = 5;
extern int Scalper_StartSessionMinute = 0;
extern int Scalper_EndWorkTimeHour = 17;
extern int Scalper_EndSessionMinute = 0;
extern bool Scalper_TradeMonday = TRUE;
extern bool Scalper_TradeFriday = FALSE;
extern bool Scalper_TradeWeekend = FALSE;
extern int Scalper_ForceCloseAtEOS = 1;
extern int Scalper_AvoidDaysBefore = 0;
extern int Scalper_AvoidDaysAfter = 0;
extern string ___Trade_Settings____;
extern bool Scalper_ReverseTrade = FALSE;
extern int Scalper_TakeProfit = 9;
extern int Scalper_StopLoss = 8;
extern bool Scalper_AddSpreadToTP = TRUE;
double Gd_716;
extern double Scalper_ProfitLimit = 0.0;
extern double Scalper_LossLimit = 0.0;
string Gs_unused_740 = "---------- main Indi params ----------";
int G_timeframe_748 = PERIOD_M5;
int Gi_752 = 2;
int G_period_756 = 70;
int Gi_760 = 0;
int Gi_764 = 35;
int Gi_768 = 65;
int G_timeframe_772 = PERIOD_M1;
int Gi_776 = 1;
int G_period_780 = 80;
int Gi_784 = 1;
int Gi_788 = 25;
int Gi_792 = 85;
int G_timeframe_796 = PERIOD_H1;
int Gi_800 = 5;
int G_period_804 = 50;
int Gi_808 = 0;
int Gi_812 = 100;
extern string remTF = "---------- Scalper Filters ----------";
string Gs_dummy_824;
extern bool Scalper_UseCustomLevels = FALSE;
extern bool Scalper_SimpleHeightFilter = FALSE;
extern int Scalper_MaxBarHeight = 6;
int Gi_844 = 60;
int Gi_848 = 0;
int Gi_852 = 90;
int Gi_856 = 0;
int Gi_860 = 120;
int Gi_864 = 0;
int Gi_868 = 150;
int Gi_872 = 0;
int Gi_876 = 180;
int Gi_880 = 0;
extern bool Scalper_TrendFilter = TRUE;
extern int Scalper_TF_MA_Period = 40;
int G_applied_price_892 = PRICE_CLOSE;
int G_ma_method_896 = MODE_SMA;
extern double Scalper_TFMaxPercentMove = 8.0;
double Gd_908 = -100.0;
string Gs_dummy_916;
extern bool Scalper_UseFilterMA = FALSE;
extern int Scalper_TFNumFilterMA = 3;
int G_timeframe_932 = PERIOD_M15;
extern int Scalper_PeriodFilterMA = 100;
int G_applied_price_940 = PRICE_CLOSE;
int G_ma_method_944 = MODE_SMA;
extern string remOTP = "---------- Other Scalper trade params ----------";
extern int Scalper_RelaxHours = 0;
extern int Scalper_OneTrade = 1;
extern bool Scalper_OneOpenTrade = FALSE;
string Gs_dummy_968;
extern double Scalper_MaxSpread = 1.0;
extern int Scalper_Slippage = 0;
int Gi_988 = 15;
extern string Scalper_ExpertComment = "BTCPrem2Sclp";
extern int Scalper_MagicNumber = 20131115;
string Gs_unused_1004 = "-------------- NEWS ----------------";
bool Gi_1012 = FALSE;
int Gi_1016 = 60;
int Gi_1020 = 30;
int Gi_1024 = 0;
int Gi_1028 = 20;
int Gi_1032 = 20;
bool Gi_1036 = FALSE;
color G_color_1040 = Gray;
int Gi_1044 = 0;
string Gs_1048 = "";
int Gi_1056 = 0;
string Gs_1060 = "";
int Gi_1068 = 0;
string Gs_1072 = "";
int Gi_1080 = 0;
string Gs_1084 = "";
int Gi_1092 = 0;
string Gs_1096 = "";
int Gi_1104 = 0;
string Gs_1108 = "";
int Gi_1116 = 0;
string Gs_1120 = "";
int Gi_1128 = 0;
string Gs_1132 = "";
int Gi_1140 = 0;
string Gs_1144 = "";
int Gi_1152 = 0;
string Gs_1156 = "";
string Gs_unused_1164 = "-------------------------------------";
bool Gi_1172 = TRUE;
int Gi_1176 = D'30.03.2008 03:00';
int Gi_1180 = D'26.10.2008 03:00';
int Gi_1184 = D'29.03.2009 03:00';
int Gi_1188 = D'25.10.2009 03:00';
int Gi_1192 = D'28.03.2010 03:00';
int Gi_1196 = D'31.10.2010 03:00';
int Gi_1200 = D'27.03.2011 03:00';
int Gi_1204 = D'30.10.2011 03:00';
int Gi_1208 = D'25.03.2012 03:00';
int Gi_1212 = D'28.10.2012 03:00';
int Gi_1216 = D'31.03.2013 03:00';
int Gi_1220 = D'27.10.2013 03:00';
int Gi_1224 = D'30.03.2013 03:00';
int Gi_1228 = D'26.10.2013 03:00';
int Gi_1232 = D'29.03.2013 03:00';
int Gi_1236 = D'25.10.2013 03:00';
int Gi_1240 = D'01.01.2013 01:00';
extern string ___Other_Parameters___ = "-----------------------------------------";
extern bool TradeMicroLots = FALSE;
extern bool SendEmail = FALSE;
extern bool SoundAlert = FALSE;
extern string SoundFileAtOpen = "alert.wav";
extern string SoundFileAtClose = "alert.wav";
extern color ColorBuy = Blue;
extern color ColorSell = Red;
extern bool WriteLog = TRUE;
extern bool WriteDebugLog = FALSE;
extern bool PrintLogOnChart = TRUE;
bool Gi_1300 = FALSE;
int Gi_1308 = 10;
int Gi_1312 = 4;
int Gi_1316 = 3;
bool Gi_1320 = TRUE;
bool Gi_1324 = TRUE;
int Gi_1328 = 50;
int Gi_1332 = 50;
int Gi_1336 = 50;
int Gi_1340 = 50;
bool Gi_1344 = FALSE;
int Gi_1348 = 0;
string Gs_1352 = "http://fapturbo2.com/gmt.php";
string Gs_1360 = "AlexGmtOffset 1.0";
int Gi_1368 = -1;
int Gi_1372 = 1;
int Gi_1376 = 1;
bool Gi_1380;
bool G_bool_1388;
int Gi_1392;
int G_magic_1396;
int G_digits_1400;
int G_acc_number_1412;
int Gi_1432 = 2;
int Gi_1436 = 1;
int G_slippage_1440;
double G_point_1444;
double Gd_1452;
double Gd_1460;
double G_lotstep_1468;
double Gd_1476;
double Gd_1484;
string Gs_1492;
string Gs_1500 = "New Trade Information";
string Gs_1508 = "New Trade Information";
string Gs_1516 = "����� �������� ����������";
string Gs_1524 = "����� �������� ����������";
bool Gi_1532;
bool Gi_1536 = TRUE;
bool Gi_1540 = TRUE;
int Gi_1544;
int G_datetime_1548;
int G_datetime_1552;
int Gi_1556;
int Gi_1560;
int Gi_1564;
int Gi_1568;
int Gi_1572;
int Gi_1576;
int Gi_1580;
int Gi_1584;
int Gi_1588;
int Gi_1592;
int Gi_1596;
int Gi_1600;
int Gi_1604;
int Gi_1608;
int Gi_1612;
int Gi_1616;
int Gi_1620;
int Gi_1624;
int Gi_1628;
int Gi_1632;
int Gi_1636;
double Gd_1640;
double Gd_1648;
double Gd_1656;
double Gd_1664;
double Gd_1672;
double Gd_1680;
double Gd_1688;
double Gd_1696;
double Gd_1704;
double Gd_1712;
double Gd_1720;
string G_str_concat_1728;
int Gi_1736;
int Gi_1740;
int Gi_1744;
int Gia_1748[10];
string Gsa_1752[10];
bool Gi_1756;
int Gi_1760;
double G_price_1764 = 0.0;
double G_price_1772 = 0.0;
double G_price_1780 = 0.0;
double G_price_1788 = 0.0;
int Gia_1796[8];
int Gia_1800[8];
int Gi_1804 = 0;
string Gs_1808;
string Gsa_1816[7] = {"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"};
double Gd_1820;
double Gd_1828;
int Gi_1836;
double Gda_1840[8] = {0};
string Gs_1844 = "";
int Gi_1852 = 0;
bool Gi_1856 = FALSE;
int Gi_1860 = 0;
bool Gi_1864 = FALSE;
bool Gba_1868[7];
int Gi_1872;
int Gi_1876;
int Gi_1880 = 60;
string Gs_1884;
string Gs_1892 = "";
string Gs_1904 = "";
string Gsa_1912[2] = {"false", "true"};
string Gs_1916;
int Gi_1924;
int Gi_1928;
int Gi_1932;
int G_datetime_1936;
int G_month_1940;
bool Gi_1944 = FALSE;
bool Gi_1948 = TRUE;
string gs_548 = "";

// E37F0136AA3FFAF149B351F6A4C948E9
int init() {
   string Ls_8;
   string Ls_24;
   string Ls_32;
   string Ls_44;
   Gi_1380 = TRUE;
   if (IsTesting() || IsOptimization() && (!IsVisualMode())) PrintLogOnChart = FALSE;
   if (!PrintLogOnChart) Comment("");
   string Ls_0 = "\nBTC FapTurbo2 Premium advisory: this robot comes pre-installed on this broker\'s MT4 but to complete your installation of this robot, you must\n" +
      "activate this live account# (if you haven\'t yet) on the License Management page in FAPT2 Members Area at http://fapturbo2.com/members\n" + "If you face any issues with setting up any of our FAPT2 Premium robots, please contact us at premium@fapturbo2.com";
   Comment(Ls_0);
   if (!IsDllsAllowed()) {
      if (Gi_1348 == 0) Comment("Warning: Set Parameter \"AllowDLL Imports\" ON in menu Tools -> Options -> ExpertAdvisors.");
      else Comment("��������������: ���������� ��������� \"AllowDLL Imports\" ��� � ���� ������ -> ��������� -> ���������.");
      Gi_1372 = 0;
      return (0);
   }
   Gi_1372 = 1;
   if (Gi_1372 < 0) Comment("���������� ���������� ������ ����.");
   Gs_1492 = Symbol();
   if (WriteDebugLog) Print("Broker => " + AccountCompany() + " | " + AccountServer());
/*	
   if (AccountCompany() != "FX Choice Limited" && AccountCompany() != "Tallinex Ou") 
	{
      Ls_8 = "BTC FAPT2 Premium will run ONLY on MyFxChoice OR Tallinex. You cannot use this version on any other broker!";
      if (PrintLogOnChart) {
         Comment("\n" 
         + Ls_8);
      } else Print(Ls_8);
      Gi_1372 = 0;
      return (0);
   }
*/	
   Gi_1944 = FALSE;
/*	
   if (AccountCompany() == "Tallinex Ou") 
	{
      Gi_1944 = TRUE;
      MTS_ExpertComment = MTS_ExpertComment + "\t";
      Scalper_ExpertComment = Scalper_ExpertComment + "\t";
   }
*/	
   if (IsDemo()) Gs_1884 = "Demo";
   else Gs_1884 = "Live";
   Gs_1916 = StringSubstr(Gs_1492, 0, 6);
   string Ls_16 = "M1";
   if (UseMediumTermStrategy) Ls_16 = "preferably H1 or higher";
   if (Gs_1916 != "BTCUSD" && Gs_1916 != "BITCOI") {
      if (Gi_1348 == 0) {
         Ls_24 = "Error: Wrong Currency Pair! Run this BTC FAPT2 Premium version on BITCOIN (BTC/USD), " + Ls_16 + " only";
         Alert(Ls_24);
         Print(Ls_24);
         Comment(Ls_24 
         + "\nRead robot manual for instructions!");
      } else {
         Ls_24 = "Error: ����������� BTC FAPT2 Premium ������� ������ �� BITCOIN (BTC/USD), " + Ls_16 + " only";
         Alert(Ls_24);
         Print(Ls_24);
         Comment(Ls_24 
         + "\n������: �������� �������� ����! ������� ����������!");
      }
      Gi_1372 = 0;
      return (0);
   }
   Gi_1372 = 1;
   f0_19();
/*	
   if (Gi_1852 != 1) 
	{
      if (Gi_1852 == -6 || Gi_1852 == -4) Print("This Account# " + AccountNumber() + " is " + Gs_1884);
      if (Gi_1300) Ls_32 = "AuthError(" + Gi_1852 + ") ";
      Print(Ls_32 + Gs_1844);
      Comment("\nBTC FapTurbo2 error: " + Gs_1844);
      Gi_1372 = 0;
      return (0);
   }
*/	
   Gi_1372 = 1;
   if (Gi_1880 > 300) Gi_1880 = 300;
   if (Gi_1880 < 1) Gi_1880 = 1;
   Gi_1856 = FALSE;
   Gi_1860 = TimeCurrent() + 60 * Gi_1880;
   if (Gi_1300) {
      Print("Init: AuthTime=" + TimeToStr(Gi_1860) + ", Result=" + Gi_1852 + ", AuthComment=" + Gs_1844);
      for (int Li_40 = 6; Li_40 >= 0; Li_40--) Print(Gsa_1816[Li_40] + "=" + Gba_1868[Li_40]);
      Print("AllowedDays WeekStart=" + TimeToStr(Gi_1872) + ", WeekEnd=" + TimeToStr(Gi_1876));
   }
   G_point_1444 = Point;
   G_digits_1400 = Digits;
   G_digits_184 = G_digits_1400;
   if (G_digits_1400 == 0) Comment("�������� �������� ����������.");
   Gd_1452 = MarketInfo(Gs_1492, MODE_MAXLOT);
   Gd_1460 = MarketInfo(Gs_1492, MODE_MINLOT);
   G_lotstep_1468 = MarketInfo(Gs_1492, MODE_LOTSTEP);
   Gd_1476 = MarketInfo(Gs_1492, MODE_MARGINREQUIRED) * G_lotstep_1468;
   if (TradeMicroLots) Gi_1392 = 2;
   else Gi_1392 = 1;
   if (UseMediumTermStrategy) {
      Scalper_Lots = MTS_Lots * MathPow(10.0, Gi_188);
      Scalper_MaxLots = MTS_MaxLots * MathPow(10.0, Gi_188);
      Scalper_StartWorkTimeHour = MTS_StartWorkTimeHour;
      Scalper_StartSessionMinute = MTS_StartSessionMinute;
      Scalper_EndWorkTimeHour = MTS_EndWorkTimeHour;
      Scalper_EndSessionMinute = MTS_EndSessionMinute;
      Scalper_TradeMonday = MTS_TradeMonday;
      Scalper_TradeFriday = MTS_TradeFriday;
      Scalper_TradeWeekend = MTS_TradeWeekend;
      Scalper_ForceCloseAtEOS = MTS_ForceCloseAtEOS;
      Scalper_AvoidDaysBefore = MTS_AvoidDaysBefore;
      Scalper_AvoidDaysAfter = MTS_AvoidDaysAfter;
      Scalper_ReverseTrade = MTS_ReverseTrade;
      Scalper_AddSpreadToTP = MTS_AddSpreadToTP;
      Gi_1564 = MTS_TakeProfit * MathPow(10.0, G_digits_184);
      Gi_1568 = MTS_StopLoss * MathPow(10.0, G_digits_184);
      Scalper_ProfitLimit = MTS_ProfitLimit;
      Scalper_LossLimit = MTS_LossLimit;
      G_timeframe_748 = G_timeframe_360;
      Gi_752 = Gi_364;
      G_period_756 = G_period_368;
      Gi_760 = Gi_372;
      Gi_764 = Gi_376;
      Gi_768 = Gi_380;
      Gi_776 = Gi_384;
      G_period_780 = G_period_388;
      Gi_784 = Gi_392;
      Gi_788 = Gi_396;
      Gi_792 = Gi_400;
      G_timeframe_796 = G_timeframe_404;
      Gi_800 = Gi_408;
      G_period_804 = G_period_412;
      Gi_808 = Gi_416;
      Gi_812 = Gi_420;
      Scalper_UseCustomLevels = MTS_UseCustomLevels;
      Scalper_SimpleHeightFilter = MTS_SimpleHeightFilter;
      Scalper_MaxBarHeight = MTS_MaxBarHeight * MathPow(10.0, G_digits_184);
      Gi_1572 = Gi_452;
      Gi_1580 = Gi_1572 + Gi_460;
      Gi_1588 = Gi_1580 + Gi_468;
      Gi_1596 = Gi_1588 + Gi_476;
      Gi_1604 = Gi_1596 + Gi_484;
      Gi_1576 = Gi_456 * MathPow(10.0, G_digits_184);
      Gi_1584 = Gi_464 * MathPow(10.0, G_digits_184);
      Gi_1592 = Gi_472 * MathPow(10.0, G_digits_184);
      Gi_1600 = Gi_480 * MathPow(10.0, G_digits_184);
      Gi_1608 = Gi_488 * MathPow(10.0, G_digits_184);
      Scalper_TrendFilter = MTS_TrendFilter;
      Scalper_TF_MA_Period = MTS_TF_MA_Period;
      G_applied_price_892 = G_applied_price_500;
      G_ma_method_896 = G_ma_method_504;
      Scalper_TFMaxPercentMove = MTS_TFMaxPercentMove;
      Scalper_UseFilterMA = MTS_UseFilterMA;
      Scalper_TFNumFilterMA = MTS_TFNumFilterMA;
      G_timeframe_932 = G_timeframe_532;
      Scalper_PeriodFilterMA = MTS_PeriodFilterMA;
      G_applied_price_940 = G_applied_price_540;
      G_ma_method_944 = G_ma_method_544;
      Scalper_RelaxHours = MTS_RelaxHours;
      Scalper_OneTrade = MTS_OneTrade;
      Scalper_OneOpenTrade = MTS_OneOpenTrade;
      Scalper_MaxSpread = MTS_MaxSpread * MathPow(10.0, G_digits_184);
      Scalper_Slippage = MTS_Slippage * MathPow(10.0, G_digits_184);
      Gi_988 = Gi_592;
      Scalper_ExpertComment = MTS_ExpertComment;
      Scalper_MagicNumber = MTS_MagicNumber;
   } else {
      Scalper_Lots *= MathPow(10.0, Gi_188);
      Scalper_MaxLots *= MathPow(10.0, Gi_188);
      Gi_1564 = Scalper_TakeProfit * MathPow(10.0, G_digits_184);
      Gi_1568 = Scalper_StopLoss * MathPow(10.0, G_digits_184);
      Scalper_MaxBarHeight = Scalper_MaxBarHeight * MathPow(10.0, G_digits_184);
      Gi_1572 = Gi_844;
      Gi_1580 = Gi_1572 + Gi_852;
      Gi_1588 = Gi_1580 + Gi_860;
      Gi_1596 = Gi_1588 + Gi_868;
      Gi_1604 = Gi_1596 + Gi_876;
      Gi_1576 = Gi_848 * MathPow(10.0, G_digits_184);
      Gi_1584 = Gi_856 * MathPow(10.0, G_digits_184);
      Gi_1592 = Gi_864 * MathPow(10.0, G_digits_184);
      Gi_1600 = Gi_872 * MathPow(10.0, G_digits_184);
      Gi_1608 = Gi_880 * MathPow(10.0, G_digits_184);
      Scalper_MaxSpread *= MathPow(10.0, G_digits_184);
      Scalper_Slippage = Scalper_Slippage * MathPow(10.0, G_digits_184);
   }
   if (Scalper_AvoidDaysBefore < 0 || Scalper_AvoidDaysBefore > 31 || Scalper_AvoidDaysAfter < 0 || Scalper_AvoidDaysAfter > 31) {
      if (Scalper_AvoidDaysBefore < 0 || Scalper_AvoidDaysBefore > 31) Ls_44 = "Scalper_AvoidDaysBefore";
      else
         if (Scalper_AvoidDaysAfter < 0 || Scalper_AvoidDaysAfter > 31) Ls_44 = "Scalper_AvoidDaysAfter";
      Ls_24 = Ls_44 + " should be a valid integer from 0 to 31!";
      Alert(Ls_24);
      Print(Ls_24);
      Gi_1372 = 0;
      return (0);
   }
   Gd_1648 = NormalizeDouble((-1 * Gi_1568) * G_point_1444, G_digits_1400);
   Gd_1640 = NormalizeDouble(Gi_1564 * G_point_1444, G_digits_1400);
   Gi_1612 = 60 * Gi_1572;
   Gi_1616 = 60 * Gi_1580;
   Gi_1620 = 60 * Gi_1588;
   Gi_1624 = 60 * Gi_1596;
   Gi_1628 = 60 * Gi_1604;
   Gd_1656 = Gi_1576 * G_point_1444;
   Gd_1664 = Gi_1584 * G_point_1444;
   Gd_1672 = Gi_1592 * G_point_1444;
   Gd_1680 = Gi_1600 * G_point_1444;
   Gd_1688 = Gi_1608 * G_point_1444;
   Gd_1720 = NormalizeDouble(Scalper_MaxBarHeight * G_point_1444, G_digits_1400);
   Gd_1696 = NormalizeDouble(Scalper_MaxSpread * G_point_1444, G_digits_1400);
   Gd_1704 = NormalizeDouble(Gi_1568 * G_point_1444, G_digits_1400);
   Gd_1712 = NormalizeDouble(Gd_1704 / 2.0, G_digits_1400);
   if (Gi_752 >= 0 && Gi_752 <= 8) G_timeframe_748 = Gia_112[Gi_752];
   if (Gi_776 >= 0 && Gi_776 <= 8) G_timeframe_772 = Gia_112[Gi_776];
   if (Gi_800 >= 0 && Gi_800 <= 8) G_timeframe_796 = Gia_112[Gi_800];
   if (Gi_768 <= 0 || Gi_768 >= 100) Gi_768 = 100 - Gi_764;
   if (Gi_792 <= 0 || Gi_792 >= 100) Gi_792 = 100 - Gi_788;
   Gi_1556 = Gi_812 / 2 + 50;
   Gi_1560 = 50 - Gi_812 / 2;
   if (Scalper_TFNumFilterMA >= 0 && Scalper_TFNumFilterMA <= 8) G_timeframe_932 = Gia_112[Scalper_TFNumFilterMA];
   if (Scalper_PeriodFilterMA <= 0) Scalper_UseFilterMA = FALSE;
   if (G_applied_price_940 < PRICE_CLOSE || G_applied_price_940 > PRICE_WEIGHTED) Scalper_UseFilterMA = FALSE;
   if (G_ma_method_944 < MODE_SMA || G_ma_method_944 > MODE_LWMA) Scalper_UseFilterMA = FALSE;
   double leverage_52 = AccountLeverage();
   Gd_1484 = NormalizeDouble(Scalper_LotsRiskReductor * (100 / leverage_52), 2);
   G_magic_1396 = Scalper_MagicNumber;
   G_slippage_1440 = Scalper_Slippage * MathPow(10, Digits - G_digits_1400);
   Gi_1836 = Scalper_EndSessionMinute;
   Gi_1864 = FALSE;
   G_datetime_140 = iTime(NULL, PERIOD_D1, 0);
   G_datetime_144 = TimeCurrent();
   int Li_60 = (G_datetime_144 - G_datetime_140) / Gi_108;
   Gi_148 = G_datetime_140 + Gi_108 * Li_60;
   if (Gi_116 >= 0 && Gi_116 <= 8) G_timeframe_120 = Gia_112[Gi_116];
   if (PrintLogOnChart) Comment("BTC FAPTv2.0 Premium initializing...");
   if (WriteDebugLog) Print("BTC FAPTv2.0 Premium initializing...");
   G_datetime_1936 = TimeCurrent();
   return (0);
}
	 		 		  	 		 		    	 		 	  		  	    		  	 		     	 				 		    			   	 	 	   	   		 		 	    	 	  	  	 	 				 		 	 	    	  		      		  		    	   	
// 52D46093050F38C27267BCE42543EF60
int deinit() {
   if (Gi_1036) {
      ObjectDelete("info_str0");
      ObjectDelete("info_str1");
   }
   return (0);
}
				  	    					 	  				    	   		    	    			   		 	 		  	  	 		      	          	 	  	 	  			     			 	 		  	 			  	 	 			 	   			 			 	  		  	
// EA2B2676C28C0DB26D39331A336C6B92
int start() {
   int Li_12;
   int Li_16;
   Gi_1924++;
   int datetime_0 = TimeCurrent();
   int Li_4 = datetime_0 - G_datetime_1936;
   G_datetime_1936 = datetime_0;
   Gi_132 = FALSE;
   int datetime_8 = iTime(NULL, G_timeframe_120, 0);
   if (G_datetime_128 != datetime_8) {
      Gi_1932++;
      Gs_160 = "";
      G_datetime_128 = datetime_8;
      Gi_132 = TRUE;
   }
   Gi_136 = FALSE;
   if (Gi_104 > 0 && TimeCurrent() >= Gi_148) {
      Gi_1928++;
      Gi_136 = TRUE;
      Li_12 = (TimeCurrent() - G_datetime_140) / Gi_108;
      Gi_148 = G_datetime_140 + Gi_108 * (Li_12 + 1);
   }
   Gs_152 = Gs_160 + Gs_168;
   if (Gi_136) G_datetime_144 = TimeCurrent();
   if (Gi_1380) {
      if (UseAutoGMToffset) {
         if (!IsTesting()) {
//            ManualGMToffset = f0_14();
					ManualGMToffset = GMTOffset();    // Added
            if (ManualGMToffset <= -2147483647) {
               Sleep(60000);
               return (0);
            }
         } else {
            Comment("Warning, use manual GMToffsets only on backtest.", 
               "\n", "Automatic GMT offset calculation works only on live/demo trading", 
            "\n", "and should be set as FALSE for backtests - strategy testing.");
            Alert("Warning, use manual GMToffsets only on backtest.", 
               "\n", "Automatic GMT offset calculation works only on live/demo trading", 
            "\n", "and should be set as FALSE for backtests - strategy testing.");
            if (WriteLog) Print("Warning, use manual GMToffsets only on backtest! Set UseAutoGMToffset = False.");
            Gi_1372 = 0;
         }
         Gs_1808 = " (automatic)";
      } else Gs_1808 = " (manual)";
      G_str_concat_1728 = StringConcatenate("Gmt Offset : ", DoubleToStr(ManualGMToffset, 1), Gs_1808, 
      "\n");
      Gi_1632 = Scalper_StartWorkTimeHour + ManualGMToffset;
      Gi_1636 = Scalper_EndWorkTimeHour + ManualGMToffset;
      Gd_1820 = Gi_1632 + Scalper_StartSessionMinute / 100.0;
      Gd_1828 = Gi_1636 + Scalper_EndSessionMinute / 100.0;
      while (true) {
         if (Gi_1632 >= 24) Gi_1632 -= 24;
         else {
            if (Gi_1632 >= 0) break;
            Gi_1632 += 24;
         }
      }
      while (true) {
         if (Gi_1636 >= 24) Gi_1636 -= 24;
         else {
            if (Gi_1636 >= 0) break;
            Gi_1636 += 24;
         }
      }
      if (Scalper_StartSessionMinute < 0 || Scalper_StartSessionMinute > 59) Scalper_StartSessionMinute = 0;
      if (Scalper_EndSessionMinute < 0 || Scalper_EndSessionMinute > 59) Scalper_EndSessionMinute = 0;
      if (Gi_1632 != Gi_1636 || Scalper_StartSessionMinute != Scalper_EndSessionMinute) {
         if (Gi_1308 > 0) {
            Scalper_EndSessionMinute -= Gi_1308;
            if (Scalper_EndSessionMinute < 0) {
               Scalper_EndSessionMinute += 60;
               Gi_1636--;
               if (Gi_1636 < 0) Gi_1636 += 24;
            }
         }
      }
      if (Gi_1012) {
         Gia_1748[0] = Gi_1044 + 3600 * ManualGMToffset;
         Gia_1748[1] = Gi_1056 + 3600 * ManualGMToffset;
         Gia_1748[2] = Gi_1068 + 3600 * ManualGMToffset;
         Gia_1748[3] = Gi_1080 + 3600 * ManualGMToffset;
         Gia_1748[4] = Gi_1092 + 3600 * ManualGMToffset;
         Gia_1748[5] = Gi_1104 + 3600 * ManualGMToffset;
         Gia_1748[6] = Gi_1116 + 3600 * ManualGMToffset;
         Gia_1748[7] = Gi_1128 + 3600 * ManualGMToffset;
         Gia_1748[8] = Gi_1140 + 3600 * ManualGMToffset;
         Gia_1748[9] = Gi_1152 + 3600 * ManualGMToffset;
         Gsa_1752[0] = Gs_1048;
         Gsa_1752[1] = Gs_1060;
         Gsa_1752[2] = Gs_1072;
         Gsa_1752[3] = Gs_1084;
         Gsa_1752[4] = Gs_1096;
         Gsa_1752[5] = Gs_1108;
         Gsa_1752[6] = Gs_1120;
         Gsa_1752[7] = Gs_1132;
         Gsa_1752[8] = Gs_1144;
         Gsa_1752[9] = Gs_1156;
         if (Gi_1036) {
            f0_1("info_str0", 10, 10, G_color_1040);
            f0_1("info_str1", 10, 25, G_color_1040);
         }
         Gi_1736 = 60 * Gi_1016;
         Gi_1740 = 60 * Gi_1020;
         Gi_1744 = 60 * Gi_1024;
      }
      if (Gi_1172) {
         Gia_1796[0] = Gi_1176 + 3600 * ManualGMToffset;
         Gia_1796[1] = Gi_1184 + 3600 * ManualGMToffset;
         Gia_1796[2] = Gi_1192 + 3600 * ManualGMToffset;
         Gia_1796[3] = Gi_1200 + 3600 * ManualGMToffset;
         Gia_1796[4] = Gi_1208 + 3600 * ManualGMToffset;
         Gia_1796[5] = Gi_1216 + 3600 * ManualGMToffset;
         Gia_1796[6] = Gi_1224 + 3600 * ManualGMToffset;
         Gia_1796[7] = Gi_1232 + 3600 * ManualGMToffset;
         Gia_1800[0] = Gi_1180 + 3600 * ManualGMToffset;
         Gia_1800[1] = Gi_1188 + 3600 * ManualGMToffset;
         Gia_1800[2] = Gi_1196 + 3600 * ManualGMToffset;
         Gia_1800[3] = Gi_1204 + 3600 * ManualGMToffset;
         Gia_1800[4] = Gi_1212 + 3600 * ManualGMToffset;
         Gia_1800[5] = Gi_1220 + 3600 * ManualGMToffset;
         Gia_1800[6] = Gi_1228 + 3600 * ManualGMToffset;
         Gia_1800[7] = Gi_1236 + 3600 * ManualGMToffset;
      }
      if (!(IsTesting() || IsOptimization()) && StringLen(AccountName()) <= 0) {
         if (Gi_1348 == 0) {
            Comment("BTC FapTurbo2 EA needs to have an online Terminal.");
            if (Gi_1948) Alert("BTC FapTurbo2 EA needs to have an online Terminal: Connected=" + IsConnected() + ", AccountName=" + AccountName() + " & Account#=" + AccountNumber());
            if (WriteLog) Print("BTC FapTurbo2 EA need have on-line Terminal.");
         } else {
            Comment("��������� BTC FapTurbo2 �����, ����� �������� ��� on-line.");
            if (Gi_1948) Alert("��������� BTC FapTurbo2 �����, ����� �������� ��� on-line.");
            if (WriteLog) Print("��������� BTC FapTurbo2 �����, ����� �������� ��� on-line.");
         }
         Gi_1948 = FALSE;
         if (!(!(IsTesting() || IsOptimization()))) return (0);
         while (StringLen(AccountName()) <= 0 && !IsConnected()) {
            Sleep(5000);
            RefreshRates();
         }
         return (0);
      }
      G_bool_1388 = IsDemo();
      G_acc_number_1412 = AccountNumber();
      Gi_1380 = FALSE;
   }
   if ((!IsTesting()) && !IsOptimization()) {
      if (Gi_1856 && Gi_1860 < TimeCurrent()) {
         Gi_1856 = FALSE;
         Li_16 = 60 * f0_0(24);
         if (Gi_1864) Li_16 = Gi_1880;
         Gi_1860 = TimeCurrent() + 60 * Li_16;
         if (WriteDebugLog) Print("Next Server check will be @ " + TimeToStr(Gi_1860) + " (broker time)");
      }
      if (!Gi_1856 && TimeCurrent() > Gi_1860) {
         Gi_1856 = TRUE;
         f0_19();
      }
      if (Gi_1852 != 1) {
         Gi_1376 = 0;
         Gi_1372 = 0;
         if (Gi_1348 == 0) Comment("\nBTC FapTurbo2 error: " + Gs_1844);
         else Comment("\nBTC FapTurbo2 ??????: " + Gs_1844);
         return (-1);
      }
      Gi_1376 = 1;
   }
   if (!Gi_1372) return (0);
   if (Gi_1372 < 0) Comment("������ � �������� ������.");
/*	
   if (!Gi_1376) 
	{
      if (Gi_1348 == 0) Alert("BTC FapTurbo2: Authentication failed! Your copy is not activated.\n" + Gs_1844);
      else Alert("���� ����� �� ������������. \n" + Gs_1844);
      return (0);
   }
*/	
   if (Gi_1376 < 0) Comment("����� �����-��.");
   if (Gi_1012) Gi_1756 = f0_21();
   if (Gi_1172 && IsTesting()) Gi_1804 = f0_5();
   else Gi_1804 = 0;
   f0_2();
   return (0);
}
	  	 	 	 				     	 	    		 					 	  	 	 				 		    		   	    	 			  		  		  			 	  			   	 	  	 		 	  			 	 	 		     	    	  		   	      	 	 			
// 2E04D211E5E011E580FC0663E9A8CA5E
void f0_2() {
   double Ld_28;
   int Li_36;
   string Ls_40;
   int bool_48;
   string Ls_52;
   double Ld_60;
   string Ls_68;
   string Ls_76;
   string Ls_84;
   string Ls_92;
   string str_concat_100;
   int bool_108;
   bool Li_112;
   int month_116;
   string Ls_120;
   bool bool_128;
   int Li_132;
   int Li_136;
   string Ls_140;
   double irsi_148;
   double irsi_156;
   double ima_164;
   int Li_172;
   int Li_176;
   string Ls_unused_180;
   int count_188;
   double ima_192;
   Gi_1544 = TimeCurrent() - Gi_1804;
   int Li_0 = Gi_1544 - 3600 * ManualGMToffset;
   int day_of_week_4 = TimeDayOfWeek(Li_0);
   int day_8 = TimeDay(Li_0);
   double Ld_12 = NormalizeDouble(Ask - Bid, Digits);
   if (Ld_12 < 0.0) Ld_12 = NormalizeDouble(MarketInfo(Gs_1492, MODE_SPREAD) * Point, Digits);
   string str_concat_20 = "";
   if (Scalper_ProfitLimit > 0.0 || Scalper_LossLimit > 0.0) {
      if (Gi_1632 != Gi_1636 || Scalper_StartSessionMinute != Scalper_EndSessionMinute) {
         Ld_28 = f0_7();
         if (Gi_1348 == 0) {
            str_concat_20 = StringConcatenate("Current Profit:            ", DoubleToStr(Ld_28, 2), " ", AccountCurrency(), 
            "\n");
         } else {
            str_concat_20 = StringConcatenate("������� �������:            ", DoubleToStr(Ld_28, 2), " ", AccountCurrency(), 
            "\n");
         }
         if (Scalper_ProfitLimit > 0.0) {
            if (Gi_1348 == 0) {
               str_concat_20 = StringConcatenate(str_concat_20, "Profit Limit:                ", DoubleToStr(Scalper_ProfitLimit, 2), " ", AccountCurrency(), 
               "\n");
            } else {
               str_concat_20 = StringConcatenate(str_concat_20, "����������� �������:                ", DoubleToStr(Scalper_ProfitLimit, 2), " ", AccountCurrency(), 
               "\n");
            }
         }
         if (Scalper_LossLimit > 0.0) {
            if (Gi_1348 == 0) {
               str_concat_20 = StringConcatenate(str_concat_20, "Loss Limit:                  ", DoubleToStr(-1.0 * Scalper_LossLimit, 2), " ", AccountCurrency(), 
               "\n");
            } else {
               str_concat_20 = StringConcatenate(str_concat_20, "����������� ������:                  ", DoubleToStr(-1.0 * Scalper_LossLimit, 2), " ", AccountCurrency(), 
               "\n");
            }
         }
      }
   }
   if (PrintLogOnChart) {
      if (!(WriteDebugLog || Gi_1300)) Gs_1904 = "";
      Li_36 = f0_10();
      Ls_40 = "T/P=" + Gi_1564 + " pips, S/L=" + Gi_1568 + " pips\n";
      bool_48 = Scalper_UseMM;
      Ls_52 = "LRR=" + DoubleToStr(Scalper_LotsRiskReductor, 2);
      if (!Scalper_UseMM) Ls_52 = "LotSize=" + DoubleToStr(Scalper_Lots, 2);
      Ld_60 = Ld_12 * MathPow(10, G_digits_1400);
      Ls_68 = "Current Spread: " + DoubleToStr(Ld_60, 0) + " pips, MaxSpread: " + DoubleToStr(Scalper_MaxSpread, 0) + " pips \n";
      G_str_concat_1728 = StringConcatenate("Gmt Offset : ", DoubleToStr(ManualGMToffset + Gi_1804 / 3600, 1), Gs_1808, 
      "\n");
      Ls_76 = "Broker Time: " + TimeToStr(TimeCurrent()) + " " + Gsa_1816[DayOfWeek()];
      if (Gi_1300) Ls_76 = Ls_76 + ", EffCurrent Time=" + TimeToStr(Gi_1544);
      Ls_84 = "GMT  Time : " + TimeToStr(Li_0) + " " + Gsa_1816[day_of_week_4];
      Ls_92 = "Active Time: " + Scalper_StartWorkTimeHour + ":" + f0_3(Scalper_StartSessionMinute) + " to " + Scalper_EndWorkTimeHour + ":" + f0_3(Gi_1836) + " (GMT)";
      if (Gi_1348 == 0) {
         if (Gi_1852 != 1) str_concat_100 = "";
         else {
            str_concat_100 = StringConcatenate("------------------------------------------------\n", "Num of Open trades on " + Gs_1492 + " = " + Li_36 
               + "\n", Ls_40 + "MM=" + Gsa_1912[bool_48] + ", " + Ls_52 
               + "\n" 
               + Ls_68 + str_concat_20 + "------------------------------------------------\n", Ls_76 
               + "\n" 
               + Ls_84 
               + "\n" 
               + G_str_concat_1728 + Ls_92 
               + "\n" 
               + Gs_1904 + "------------------------------------------------\n", "BROKER INFORMATION:\n" + "Broker Company:      " + AccountCompany() 
               + "\n" 
               + "------------------------------------------------\n", "ACCOUNT INFORMATION:\n" + "Account Name:         " + AccountName() 
               + "\n" 
               + "Account Number:      " + AccountNumber() 
               + "\n" 
               + "Account Type:          " + Gs_1884 
               + "\n" 
               + "Account Leverage:     " + DoubleToStr(AccountLeverage(), 0) 
               + "\n" 
               + "Account Balance:       " + DoubleToStr(AccountBalance(), 2) 
               + "\n" 
               + "Account Currency:     " + AccountCurrency() 
               + "\n" 
               + "Account Equity:         " + DoubleToStr(AccountEquity(), 2) 
               + "\n" 
               + "------------------------------------------------\n", "MARGIN INFORMATION:\n" + "Free Margin:            " + DoubleToStr(AccountFreeMargin(), 2) 
               + "\n" 
               + "Used Margin:            " + DoubleToStr(AccountMargin(), 2) 
               + "\n" 
            + "------------------------------------------------\n", "No time limitation");
         }
      } else {
         if (Gi_1852 != 1) str_concat_100 = "";
         else {
            str_concat_100 = StringConcatenate("------------------------------------------------\n", "Num of Open trades on " + Gs_1492 + " = " + Li_36 
               + "\n", Ls_40 + "MM=" + Gsa_1912[bool_48] + ", " + Ls_52 
               + "\n" 
               + Ls_68 + str_concat_20 + "------------------------------------------------\n", Ls_76 
               + "\n" 
               + Ls_84 
               + "\n" 
               + G_str_concat_1728 + Ls_92 
               + "\n" 
               + Gs_1904 + "------------------------------------------------\n", "���������� � �������:" 
               + "\n" 
               + "���������� ��������:      " + AccountCompany() 
               + "\n" 
               + "------------------------------------------------\n", "���������� � �����:" 
               + "\n" 
               + "�������� �����:          " + AccountName() 
               + "\n" 
               + "����� �����:       " + AccountNumber() 
               + "\n" 
               + "Account Type:        " + Gs_1884 
               + "\n" 
               + "����� �����:     " + DoubleToStr(AccountLeverage(), 0) 
               + "\n" 
               + "������:       " + DoubleToStr(AccountBalance(), 2) 
               + "\n" 
               + "������ �����:     " + AccountCurrency() 
               + "\n" 
               + "��������:         " + DoubleToStr(AccountEquity(), 2) 
               + "\n" 
               + "------------------------------------------------\n", "���������� � �����:" 
               + "\n" 
               + "��������� �����:              " + DoubleToStr(AccountFreeMargin(), 2) 
               + "\n" 
               + "������������ �����:              " + DoubleToStr(AccountMargin(), 2) 
               + "\n" 
            + "------------------------------------------------");
         }
      }
      bool_108 = UseMediumTermStrategy;
      Comment("\n BTC FAPTv2.0 " + Gsa_192[bool_108] + ": " + Gs_1844 
         + "\n" 
      + Gs_1892 + str_concat_100);
   }
   Gs_1892 = "";
   Gs_1904 = "";
   if (Li_0 >= Gi_1240) {
      if (Gi_100 > 0 && Gi_124 == 1) {
         if (Gi_100 == 1 && !Gi_136) return;
         if (Gi_100 == 2 && !Gi_132) return;
      }
      if (StealthMode) f0_26();
      if (Scalper_UseCustomLevels) f0_16();
      f0_11();
      if (Gi_1632 != Gi_1636 || Scalper_StartSessionMinute != Scalper_EndSessionMinute) {
         if (Scalper_ProfitLimit > 0.0) {
            if (Ld_28 >= Scalper_ProfitLimit) {
               f0_18("ALL");
               Gs_1904 = Gs_1904 + "Profit taken\n";
               return;
            }
         }
         if (Scalper_LossLimit > 0.0) {
            if (Ld_28 <= -1.0 * Scalper_LossLimit) {
               f0_18("ALL");
               Gs_1904 = Gs_1904 + "Loss hit\n";
               return;
            }
         }
      }
      if (Gi_100 > 0) {
         if (Gi_100 == 1 && !Gi_136) return;
         if (Gi_100 == 2 && !Gi_132) return;
      }
      Li_112 = f0_4();
      month_116 = TimeMonth(Li_0);
      if (Scalper_ForceCloseAtEOS == 3 && G_month_1940 != month_116) {
         if (Li_112) {
            Ls_120 = "Starting new Monthly Session, closing any open trades";
            Print("ForceCloseAtEOM: " + Ls_120);
            f0_18(Symbol());
         }
         G_month_1940 = month_116;
      } else {
         bool_128 = TimeHour(Li_0) == 22;
         Li_132 = TimeMinute(Li_0) >= 55;
         Li_136 = TimeHour(Li_0) >= 23;
         if (Scalper_ForceCloseAtEOS == 2 && day_of_week_4 == 5 && (bool_128 && Li_132) || Li_136) {
            if (Li_112) {
               Ls_140 = "Weekly Session over on Friday, closing any open trades";
               Print("ForceCloseAtEOW: " + Ls_140);
               f0_18(Symbol());
            }
         } else {
            if (Scalper_AvoidDaysBefore > 0 && day_8 <= Scalper_AvoidDaysBefore) Gs_1904 = "AvoidDaysBefore filter\n";
            else {
               if (Scalper_AvoidDaysAfter > 0 && day_8 >= Scalper_AvoidDaysAfter) Gs_1904 = "AvoidDaysAfter filter\n";
               else {
                  if (day_of_week_4 == 0 || day_of_week_4 > 5 && (!Scalper_TradeWeekend)) Gs_1904 = "Weekend filter\n";
                  else {
                     if (!Scalper_TradeFriday) {
                        if (day_of_week_4 == 5) {
                           Gs_1904 = "TradeFriday filter\n";
                           return;
                        }
                     }
                     if (!Scalper_TradeMonday) {
                        if (day_of_week_4 <= 1) {
                           Gs_1904 = "TradeMonday filter\n";
                           return;
                        }
                     }
                     if (day_of_week_4 == 1 && TimeHour(Li_0) < Scalper_StartWorkTimeHour || (TimeHour(Li_0) == Scalper_StartWorkTimeHour && TimeMinute(Li_0) < Scalper_StartSessionMinute)) Gs_1904 = "Early Monday trading not allowed\n";
                     else {
                        if (!Gba_1868[day_of_week_4] && Li_0 >= Gi_1872 && Li_0 < Gi_1876) Gs_1892 = "\nBTC Fapturbo2 will not trade on this day of this week due to possible volatile news/events/holidays!\n";
                        else {
                           if (!f0_15(Gi_1544, Gi_1632, Scalper_StartSessionMinute, Gi_1636, Scalper_EndSessionMinute)) {
                              Gs_1904 = Gs_1904 + "Not Time to Trade\n";
                              if (Scalper_ForceCloseAtEOS == 1 && Gi_1864) {
                                 if (f0_4() == TRUE) {
                                    Print("ForceCloseAtEOD: Session over, closing any open trades");
                                    f0_18(Symbol());
                                 }
                              }
                              Gi_1864 = FALSE;
                              if (!f0_4()) {
                                 Gi_1540 = TRUE;
                                 Gi_1536 = TRUE;
                              }
                           } else {
                              if (!Gi_1864) {
                                 Gi_1864 = TRUE;
                                 if (WriteDebugLog) Print("BTC FAPT2 Premium trading is in session: checking server...");
                                 if ((!IsTesting()) && !IsOptimization()) {
                                    Gi_1856 = TRUE;
                                    f0_19();
                                    Gi_1860 = TimeCurrent();
                                    Gi_1320 = TRUE;
                                 }
                                 if (!f0_4()) {
                                    Gi_1540 = TRUE;
                                    Gi_1536 = TRUE;
                                 }
                              }
                              if (Scalper_RelaxHours > 0) {
                                 if (f0_27() == TRUE) {
                                    Gs_1904 = "RelaxHours filter\n";
                                    return;
                                 }
                              }
                              if (Scalper_SimpleHeightFilter) {
                                 if (f0_28() == TRUE) {
                                    Gs_1904 = "SimpleHeight Filter\n";
                                    return;
                                 }
                              }
                              if (Scalper_TrendFilter) {
                                 if (f0_9() == TRUE) {
                                    Gs_1904 = "Trend Filter\n";
                                    return;
                                 }
                              }
                              if (Scalper_OneTrade != 0) {
                                 if (f0_12() == TRUE) {
                                    if (Gi_1300) {
                                       if (Gi_1348 == 0) Print("Already have one trade inside this interval of time.");
                                       else Print("��� ���� ���� ������ ������ ����� ��������� �������.");
                                    }
                                    Gs_1904 = "OneTrade filter: Already have one trade inside this interval of time\n";
                                    return;
                                 }
                              }
                              if (Scalper_OneOpenTrade) {
                                 if (f0_23() > 0) {
                                    if (Gi_1300) {
                                       if (Gi_1348 == 0) Print("Already have open order with MagicNumber = ", G_magic_1396);
                                       else Print("��� ���� ���� ����� � MagicNumber = ", G_magic_1396);
                                    }
                                    Gs_1904 = "OpenOneTrade filter: Already have open order with MagicNumber = " + G_magic_1396 
                                    + "\n";
                                    return;
                                 }
                              }
                              if (Gi_1012) {
                                 if (Gi_1756) {
                                    Gs_1904 = "News Filter\n";
                                    return;
                                 }
                              }
                              if (Ld_12 > Gd_1696) {
                                 if (WriteLog && (!Gi_1532)) {
                                    if (Gi_1348 == 0) {
                                       Print("Trade signal is missed due to invalid high spread. BTC Fapturbo2 will try again later when spreads come to normal. Current spread = ", DoubleToStr(Ld_12, Digits),
                                          ",  MaxSpread = ", DoubleToStr(Gd_1696, Digits));
                                    } else {
                                       Print("�������� ������ �������� ��-�� �������� ������.");
                                       Print("������� ����� = ", DoubleToStr(Ld_12, Digits), ",  MaxSpread = ", DoubleToStr(Gd_1696, Digits));
                                       Print("FapTurbo2 ����� ��������� �����, ����� ����� ������ ����������.");
                                    }
                                 }
                                 Gi_1532 = TRUE;
                              } else {
                                 HideTestIndicators(TRUE);
                                 irsi_148 = iRSI(NULL, G_timeframe_748, G_period_756, PRICE_CLOSE, Gi_760);
                                 irsi_156 = iRSI(NULL, G_timeframe_772, G_period_780, PRICE_CLOSE, Gi_784);
                                 ima_164 = iMA(NULL, G_timeframe_796, G_period_804, 0, MODE_SMA, PRICE_MEDIAN, Gi_808);
                                 HideTestIndicators(FALSE);
                                 Li_172 = f0_4();
                                 if (Scalper_ReverseTrade == FALSE) Li_176 = !Li_172 && irsi_148 < Gi_764 || irsi_156 < Gi_788 && ima_164 >= Ask + 0.0002;
                                 else {
                                    Li_176 = !Li_172 && irsi_148 > Gi_768 || irsi_156 > Gi_792 && ima_164 <= Bid - 0.0002;
                                    Ls_unused_180 = "(ReversedTrade) ";
                                 }
                                 if (Li_176 == 1) {
                                    if (Gi_1536) {
                                       if (!Scalper_UseFilterMA) count_188 = 0;
                                       else {
                                          ima_192 = iMA(NULL, G_timeframe_932, Scalper_PeriodFilterMA, 0, G_ma_method_944, G_applied_price_940, 0);
                                          if (Close[0] <= ima_192) count_188++;
                                       }
                                       if (count_188 == 0) {
                                          f0_13(OP_BUY, Gi_1564, Gi_1568);
                                          Gi_1536 = FALSE;
                                          Gi_1540 = TRUE;
                                       }
                                    }
                                 }
                                 Li_172 = f0_4();
                                 if (Scalper_ReverseTrade == FALSE) Li_176 = !Li_172 && irsi_148 > Gi_768 || irsi_156 > Gi_792 && ima_164 <= Bid - 0.0002;
                                 else Li_176 = !Li_172 && irsi_148 < Gi_764 || irsi_156 < Gi_788 && ima_164 >= Ask + 0.0002;
                                 if (Li_176 == 1) {
                                    if (Gi_1540) {
                                       if (!Scalper_UseFilterMA) count_188 = 0;
                                       else {
                                          ima_192 = iMA(NULL, PERIOD_M15, Scalper_PeriodFilterMA, 0, G_ma_method_944, G_applied_price_940, 0);
                                          if (Close[0] >= ima_192) count_188++;
                                       }
                                       if (count_188 == 0) {
                                          f0_13(OP_SELL, Gi_1564, Gi_1568);
                                          Gi_1540 = FALSE;
                                          Gi_1536 = TRUE;
                                       }
                                    }
                                 }
                                 if (irsi_148 < Gi_1556 && irsi_148 > Gi_1560) {
                                    Gi_1540 = TRUE;
                                    Gi_1536 = TRUE;
                                 }
                              }
                           }
                        }
                     }
                  }
               }
            }
         }
      }
   }
}
			 		 		       		 	    	  	 			 	 			 		     						 	  	 			 	    				 	  						 		 		 		 	   		  	   	  	 		 	 				 	 			 	 					 	   		 	  		 
// 2FDD172D8DFADBAEDD3582F64A4AC280
string f0_3(int Ai_0) {
   string Ls_4;
   if (Ai_0 < 10) Ls_4 = "0";
   else Ls_4 = "";
   return (Ls_4 + "" + Ai_0);
}
		  	     	  	 	 			 	 	  		  	 					     	  		  	 	   	   						 			 		  			 	    	  		 			 	    		 	  	   	   		 					 	  			  	  		 	 			 		 	
// FBC8B84378C5BE93622295AD2B5DB6D4
int f0_27() {
   int datetime_16;
   bool Li_20;
   double Ld_24;
   double Ld_32;
   double Ld_40;
   int datetime_52;
   int ticket_0 = -1;
   int Li_4 = OrdersHistoryTotal() - 1;
   int datetime_8 = -2147483647;
   for (int pos_12 = Li_4; pos_12 >= 0; pos_12--) {
      if (OrderSelect(pos_12, SELECT_BY_POS, MODE_HISTORY)) {
         if (OrderMagicNumber() == G_magic_1396) {
            if (OrderSymbol() == Gs_1492) {
               datetime_16 = OrderCloseTime();
               if (datetime_8 < datetime_16) {
                  datetime_8 = datetime_16;
                  ticket_0 = OrderTicket();
               }
            }
         }
      }
   }
   if (ticket_0 < 0) return (0);
   if (OrderSelect(ticket_0, SELECT_BY_TICKET)) {
      Li_20 = FALSE;
      Ld_24 = NormalizeDouble(OrderOpenPrice(), Digits);
      Ld_32 = NormalizeDouble(OrderClosePrice(), Digits);
      Ld_40 = NormalizeDouble(OrderStopLoss(), Digits);
      if (OrderType() == OP_BUY) {
         if (Ld_32 <= Ld_40 && Ld_40 != 0.0) Li_20 = TRUE;
         else
            if (NormalizeDouble(Ld_24 - Ld_32, Digits) >= Gd_1712) Li_20 = TRUE;
      } else {
         if (Ld_32 >= Ld_40 && Ld_40 != 0.0) Li_20 = TRUE;
         else
            if (NormalizeDouble(Ld_32 - Ld_24, Digits) >= Gd_1712) Li_20 = TRUE;
      }
   } else return (0);
   if (!Li_20) return (0);
   int shift_48 = iBarShift(NULL, PERIOD_H1, datetime_8, FALSE);
   if (shift_48 < Scalper_RelaxHours) {
      datetime_52 = iTime(NULL, PERIOD_H1, 0);
      if (G_datetime_1552 == datetime_52) return (1);
      if (WriteLog) {
         if (Gi_1348 == 0) Print("Relax Hours Left = " + DoubleToStr(shift_48 - Scalper_RelaxHours, 0) + " (after StopLoss).");
         else Print("�������� Relax ����� = " + DoubleToStr(shift_48 - Scalper_RelaxHours, 0) + " (����� StopLoss).");
      }
      G_datetime_1552 = datetime_52;
      return (1);
   }
   return (0);
}
			         		 	 	 			 	   		 	 		 	        			  				  	  		 				  	  		   	  	   			 		 	 			     			  	 	     				 			 		  		  		  	 	 	 				 	
// 5E4BB5D9B4EB32C0588068B9C5F804C7
int f0_9() {
   double Ld_4;
   double Ld_12;
   double Ld_20;
   bool Li_28;
   if (Gi_1312 <= 0 || Gi_1316 < 0 || Gi_1316 > 100) return (0);
   for (int Li_0 = 0; Li_0 <= Gi_1316; Li_0++) {
      Ld_4 = NormalizeDouble(iMA(NULL, PERIOD_M15, Scalper_TF_MA_Period, 0, G_ma_method_896, G_applied_price_892, Li_0), G_digits_1400);
      Ld_12 = NormalizeDouble(iMA(NULL, PERIOD_M15, Scalper_TF_MA_Period, 0, G_ma_method_896, G_applied_price_892, Li_0 + Gi_1312), G_digits_1400);
      if (Ld_12 > 0.0) Ld_20 = 100.0 * MathAbs(Ld_4 - Ld_12) / Ld_12;
      if (Gd_908 < Ld_20) Gd_908 = Ld_20;
      Li_28 = FALSE;
      if (Ld_20 > Scalper_TFMaxPercentMove) Li_28 = TRUE;
      if (Li_28) break;
   }
   if (Li_0 > Gi_1316) return (0);
   if (Gi_1320 && WriteDebugLog || Gi_1300) {
      if (Gi_1348 == 0) Print("Market is risky at the moment. Trading is temporarily forbidden by the filter TrendFilter.");
      else Print("������� ����� � ������� ���������. �������� ��������� �������� TrendFilter.");
      if (Li_0 != 0) {
         if (Gi_1348 == 0) Print("Relax Bars Left = " + DoubleToStr(Gi_1316 - Li_0, 0) + " (after MaxPercentMove).");
         else Print("�������� Relax ����� = " + DoubleToStr(Gi_1316 - Li_0, 0) + " (����� MaxPercentMove).");
      }
      Gi_1320 = FALSE;
   }
   return (1);
}
			 	   	    	 			 	 	 		  	  	  	 		   	    		 				   		 						   		 			  		 	 	 		  				 	 	  	  	 	    	 	    										 			 			 		 			 	 		  
// FD7C17F9E8FFB4CD334C8A8C01FCE02A
int f0_28() {
   int datetime_4;
   bool Li_0 = FALSE;
   if (NormalizeDouble(iHigh(NULL, PERIOD_M15, 1) - iLow(NULL, PERIOD_M15, 1), G_digits_1400) > Gd_1720) Li_0 = TRUE;
   if (NormalizeDouble(iHigh(NULL, PERIOD_M15, 2) - iLow(NULL, PERIOD_M15, 2), G_digits_1400) > Gd_1720) Li_0 = TRUE;
   if (Li_0) {
      datetime_4 = iTime(NULL, PERIOD_M15, 0);
      if (G_datetime_1548 == datetime_4) return (1);
      if (Gi_1324 && WriteDebugLog || Gi_1300) {
         Gi_1324 = FALSE;
         if (Gi_1348 == 0) Print("Market is risky at the moment. Trading is temporarily forbidden by the filter SimpleHeightFilter.");
         else Print("������� ����� � ������� ���������. �������� ��������� �������� SimpleHeightFilter.");
      }
      G_datetime_1548 = datetime_4;
      return (1);
   }
   return (0);
}
	 		  	 		 						   						  	         	 		 			  	 	 	 					  	 	 	     			      			 	  		   			 		  			  			  	   	  	 		 		 	  	 		 				   		   
// AA3497737B53671269D7F7CBCE5ADEB4
bool f0_15(int Ai_0, int Ai_4, int Ai_8, int Ai_12, int Ai_16) {
   int Li_28;
   int Li_32;
   int hour_20 = TimeHour(Ai_0);
   int minute_24 = TimeMinute(Ai_0);
   if (Ai_4 == Ai_12 && Ai_8 == Ai_16) return (TRUE);
   if (Ai_16 == 0) {
      if (Ai_12 == 0) Li_28 = 23;
      else Li_28 = Ai_12 - 1;
      Li_32 = 59;
   } else {
      Li_28 = Ai_12;
      Li_32 = Ai_16 - 1;
   }
   double Ld_36 = Ai_4 + Ai_8 / 100.0;
   double Ld_44 = Li_28 + Li_32 / 100.0;
   double Ld_52 = hour_20 + minute_24 / 100.0;
   bool Li_ret_60 = FALSE;
   if (Ld_36 < Ld_44 && Ld_36 <= Ld_52 && Ld_52 <= Ld_44) Li_ret_60 = TRUE;
   if (Ld_36 > Ld_44 && (Ld_36 <= Ld_52) || (Ld_52 <= Ld_44)) Li_ret_60 = TRUE;
   return (Li_ret_60);
}
	 		 	 			 		   	   	   		  				     	 			 		 			 	 		  			   	  	   		 		   						 			 	   	  			  	  	 			 	 	  	   	 	 		  			 		    	   	 		 
// 3070E883A104FCC047A1A6B240434873
int f0_4() {
   int Li_0 = OrdersTotal() - 1;
   for (int pos_4 = Li_0; pos_4 >= 0; pos_4--) {
      if (OrderSelect(pos_4, SELECT_BY_POS, MODE_TRADES)) {
         if (OrderMagicNumber() == G_magic_1396) {
            if (OrderSymbol() == Gs_1492)
               if (OrderType() <= OP_SELL) return (1);
         }
      }
   }
   return (0);
}
	     	 			 					 											     		  	 			 		  	  		 				 	 	 	 			   					    		 		  		 					 							  	    	    	 	 		    	  	    				 				   
// A076F38073ABEC669F1459B783418EA6
int f0_13(int A_cmd_0, int Ai_unused_4, int Ai_unused_8) {
   int Li_12;
   double price_24;
   color color_32;
   int ticket_40;
   int error_44;
   string Ls_48;
   double price_56;
   if (Gi_988 > 0) {
      Li_12 = f0_0(Gi_988);
      if ((!IsTesting()) && !IsOptimization()) Sleep(1000 * Li_12);
   }
   double Ld_16 = NormalizeDouble(f0_24(), 2);
   if (AccountFreeMarginCheck(Gs_1492, A_cmd_0, Ld_16) <= 0.0 || GetLastError() == 134/* NOT_ENOUGH_MONEY */) {
      if (Gi_1348 == 0) {
         Print("You don\'t have free margin.");
         Comment("You don\'t have free margin.");
      } else {
         Print("��� �������� ������ ������������ ��������� �����.");
         Comment("��� �������� ������ ������������ ��������� �����.");
      }
      return (-1);
   }
   RefreshRates();
   if (A_cmd_0 == OP_BUY) {
      price_24 = Ask;
      color_32 = ColorBuy;
   } else {
      price_24 = Bid;
      color_32 = ColorSell;
   }
   int Li_36 = Gi_1432;
   while (Li_36 > 0) {
      if (Scalper_AddSpreadToTP) Gd_716 = MarketInfo(Gs_1492, MODE_SPREAD) * MathPow(10, G_point_1444 - Point);
      ticket_40 = OrderSend(Gs_1492, A_cmd_0, Ld_16, price_24, G_slippage_1440, 0, 0, Scalper_ExpertComment, G_magic_1396, 0, color_32);
      Sleep(MathRand() / 1000);
      if (ticket_40 < 0) {
         error_44 = GetLastError();
         if (WriteDebugLog) {
            if (A_cmd_0 == OP_BUY) Ls_48 = "OP_BUY";
            else Ls_48 = "OP_SELL";
            Print("Open: OrderSend(", Ls_48, ") error = ", f0_22(error_44));
         }
         if (error_44 != 136/* OFF_QUOTES */) break;
         if (!(Gi_1344)) break;
         Sleep(6000);
         RefreshRates();
         if (A_cmd_0 == OP_BUY) price_56 = Ask;
         else price_56 = Bid;
         Print("div#4");
         if (NormalizeDouble(MathAbs((price_56 - price_24) / G_point_1444), 0) > Gi_1436) break;
         price_24 = price_56;
         Li_36--;
         if (Li_36 > 0) {
            if (Gi_1348 == 0) Print("... Possible to open order.");
            else Print("... �������� ������� �����.");
         }
         Ld_16 = NormalizeDouble(Ld_16 / 2.0, Gi_1392);
         if (Ld_16 < Gd_1460) Ld_16 = Gd_1460;
      } else {
         if (OrderSelect(ticket_40, SELECT_BY_TICKET)) price_24 = OrderOpenPrice();
         if (SendEmail) {
            if (Gi_1348 == 0) {
               SendMail(Gs_1500, StringConcatenate("BTC Fapturbo2 Trade Information\nCurrency Pair: ", StringSubstr(Gs_1492, 0, 6), 
                  "\nTime: ", TimeToStr(TimeCurrent(), TIME_DATE|TIME_MINUTES|TIME_SECONDS), 
                  "\nOrder Type: ", f0_25(A_cmd_0), 
                  "\nPrice: ", DoubleToStr(price_24, Digits), 
                  "\nLot size: ", DoubleToStr(Ld_16, Gi_1392), 
                  "\nEvent: Trade Opened", 
                  "\n\nCurrent Balance: ", DoubleToStr(AccountBalance(), 2), " ", AccountCurrency(), 
               "\nCurrent Equity: ", DoubleToStr(AccountEquity(), 2), " ", AccountCurrency()));
            } else {
               SendMail(Gs_1516, StringConcatenate("BTC Fapturbo2 �������� ����������\n�������� ����: ", StringSubstr(Gs_1492, 0, 6), 
                  "\n�����: ", TimeToStr(TimeCurrent(), TIME_DATE|TIME_MINUTES|TIME_SECONDS), 
                  "\n��� ������: ", f0_25(A_cmd_0), 
                  "\n����: ", DoubleToStr(price_24, Digits), 
                  "\n������ ����: ", DoubleToStr(Ld_16, Gi_1392), 
                  "\n�������: �������� ������", 
                  "\n\n������� ������: ", DoubleToStr(AccountBalance(), 2), " ", AccountCurrency(), 
               "\n������� ��������: ", DoubleToStr(AccountEquity(), 2), " ", AccountCurrency()));
            }
         }
         if (!(SoundAlert)) break;
         PlaySound(SoundFileAtOpen);
         break;
      }
   }
   return (ticket_40);
}
	   		  			    		 		   					 		   				  			   	 	  	 	 			 		 		 														 		 	 				 		    				     	  		     		 			   	 	 	   	  		 		  	  
// B59EAB0C7109E29D53AB58CE25ADBF1B
void f0_16() {
   int Li_12;
   double Ld_16;
   double Ld_24;
   int Li_32;
   double Ld_36;
   string Ls_44;
   int Li_unused_0 = MarketInfo(Gs_1492, MODE_SPREAD);
   int Li_4 = OrdersTotal() - 1;
   for (int pos_8 = Li_4; pos_8 >= 0; pos_8--) {
      if (!OrderSelect(pos_8, SELECT_BY_POS, MODE_TRADES)) {
         if (WriteDebugLog) Print("NoiseFilter: OrderSelect() error = ", GetLastError());
      } else {
         if (OrderMagicNumber() == G_magic_1396) {
            if (OrderType() <= OP_SELL) {
               if (OrderSymbol() == Gs_1492) {
                  Li_12 = Gi_1544 - OrderOpenTime();
                  if (Li_12 > Gi_1612) {
                     Ld_16 = NormalizeDouble(OrderClosePrice(), Digits);
                     Ld_24 = NormalizeDouble(OrderOpenPrice(), Digits);
                     Li_32 = 0;
                     if (OrderType() == OP_BUY) Ld_36 = Ld_16 - Ld_24;
                     else Ld_36 = Ld_24 - Ld_16;
                     if (Li_12 < Gi_1616 && Ld_36 >= Gd_1656) Li_32 = 1;
                     else {
                        if (Li_12 > Gi_1616 && Li_12 < Gi_1620 && Ld_36 >= Gd_1664) Li_32 = 2;
                        else {
                           if (Li_12 > Gi_1620 && Li_12 < Gi_1624 && Ld_36 >= Gd_1672) Li_32 = 3;
                           else {
                              if (Li_12 > Gi_1624 && Li_12 < Gi_1628 && Ld_36 >= Gd_1680) Li_32 = 4;
                              else
                                 if (Li_12 > Gi_1628 && Ld_36 >= Gd_1688) Li_32 = 5;
                           }
                        }
                     }
                     if (Li_32 != 0) {
                        Ls_44 = "NoiseFilter => Profit=" + DoubleToStr(Ld_36 / G_point_1444, 2) + ", Level#" + Li_32;
                        if (WriteDebugLog) Print(Ls_44);
                        f0_20(OrderTicket(), OrderLots(), OrderType(), G_slippage_1440, Ls_44);
                     }
                  }
               }
            }
         }
      }
   }
}
						     	   	 	     	     		 		  		     	  	  		  	 	  	 	 			   				    			   	  			 	              	 				  			 	 		 				 	  				  	 	    	 	
// F7F05CD58384F11F2D4F8C4A7DEE6806
void f0_26() {
   double Ld_12;
   double Ld_20;
   double Ld_28;
   if (Gi_1564 <= 0 && Gi_1568 <= 0) return;
   int Li_unused_0 = MarketInfo(Gs_1492, MODE_SPREAD);
   int Li_4 = OrdersTotal() - 1;
   for (int pos_8 = Li_4; pos_8 >= 0; pos_8--) {
      if (!OrderSelect(pos_8, SELECT_BY_POS, MODE_TRADES)) {
         if (WriteDebugLog) Print("WatchLevels: OrderSelect() error = ", GetLastError());
      } else {
         if (OrderMagicNumber() == G_magic_1396) {
            if (OrderType() <= OP_SELL) {
               if (OrderSymbol() == Gs_1492) {
                  Ld_12 = NormalizeDouble(OrderClosePrice(), Digits);
                  Ld_20 = NormalizeDouble(OrderOpenPrice(), Digits);
                  if (Scalper_AddSpreadToTP > FALSE) Gd_1640 = NormalizeDouble((Gi_1564 + Gd_716) * Point, G_digits_1400);
                  if (OrderType() == OP_BUY) {
                     Ld_28 = Ld_12 - Ld_20;
                     if (!((Gd_1640 > 0.0 && Ld_28 >= Gd_1640) || (Gd_1648 < 0.0 && Ld_28 <= Gd_1648))) continue;
                     if (WriteDebugLog) {
                        if (Gi_1348 == 0) Print("WatchLevels: level for close BUY");
                        else Print("WatchLevels: ������� ��� �������� BUY");
                     }
                     f0_20(OrderTicket(), OrderLots(), 0, G_slippage_1440, "WatchLevel => Profit=" + DoubleToStr(Ld_28 / G_point_1444, 2));
                     continue;
                  }
                  Ld_28 = Ld_20 - Ld_12;
                  if ((Gd_1640 > 0.0 && Ld_28 >= Gd_1640) || (Gd_1648 < 0.0 && Ld_28 <= Gd_1648)) {
                     if (WriteDebugLog) {
                        if (Gi_1348 == 0) Print("WatchLevels: level for close SELL");
                        else Print("WatchLevels: ������� ��� �������� SELL");
                     }
                     f0_20(OrderTicket(), OrderLots(), 1, G_slippage_1440, "WatchLevel => Profit=" + DoubleToStr(Ld_28 / G_point_1444, 2));
                  }
               }
            }
         }
      }
   }
}
	   	 		 		  		   		 		  			   		 			 		 		  	 	   	  	  	 			  					    				  	 	 	      		 			 			 					  	 			  			      		 	    			   		 	 		
// EBFE91FAEB07FF5788FD1001AD46AE29
double f0_24() {
   if (!Scalper_UseMM) return (Scalper_Lots);
   double Ld_0 = AccountFreeMargin() * Gd_1484 / 100.0;
   double Ld_ret_8 = NormalizeDouble(MathFloor(Ld_0 / Gd_1476) * G_lotstep_1468, Gi_1392);
   if (Ld_ret_8 < Gd_1460) Ld_ret_8 = Gd_1460;
   if (Ld_ret_8 > Gd_1452) Ld_ret_8 = Gd_1452;
   if (Ld_ret_8 > Scalper_MaxLots) Ld_ret_8 = Scalper_MaxLots;
   return (Ld_ret_8);
}
	 	 		 	 	         	     	 	 				  			 	 	    		  		 	   				 	 		 				  	 					 			 		    	   	 	 	   				 		 		 			 	   	 	 		  	 	      	  			
// 8462948247872A69E451400AF9B9AE1B
void f0_11() {
   double Ld_16;
   double price_24;
   double Ld_32;
   double Ld_40;
   bool Li_48;
   bool Li_52;
   bool Li_56;
   double point_60;
   double point_68;
   bool bool_76;
   double Ld_0 = NormalizeDouble(MarketInfo(Gs_1492, MODE_STOPLEVEL) * Point, Digits);
   int Li_8 = OrdersTotal() - 1;
   for (int pos_12 = Li_8; pos_12 >= 0; pos_12--) {
      if (!OrderSelect(pos_12, SELECT_BY_POS, MODE_TRADES)) {
         if (WriteDebugLog) Print("SetOrderLevels: OrderSelect() error = ", GetLastError());
      } else {
         if (OrderMagicNumber() == G_magic_1396) {
            if (OrderType() <= OP_SELL) {
               if (OrderSymbol() == Gs_1492) {
                  Ld_16 = NormalizeDouble(OrderClosePrice(), G_digits_1400);
                  price_24 = NormalizeDouble(OrderOpenPrice(), G_digits_1400);
                  Ld_32 = NormalizeDouble(OrderStopLoss(), G_digits_1400);
                  Ld_40 = NormalizeDouble(OrderTakeProfit(), G_digits_1400);
                  Li_48 = TRUE;
                  Li_52 = FALSE;
                  Li_56 = FALSE;
                  if (Ld_32 == 0.0) {
                     Li_52 = Gi_1568;
                     if (StealthMode) Li_52 = Li_52 + (Gi_1328 + f0_0(Gi_1332)) * MathPow(10.0, G_digits_184);
                     if (Li_52 != FALSE) {
                        if (OrderType() == OP_BUY) {
                           point_60 = NormalizeDouble(price_24 - Li_52 * G_point_1444, G_digits_1400);
                           if (point_60 <= 0.0) point_60 = Point;
                           if (Ld_16 - point_60 <= Ld_0) Li_48 = FALSE;
                        } else {
                           point_60 = NormalizeDouble(price_24 + Li_52 * G_point_1444, G_digits_1400);
                           if (point_60 - Ld_16 <= Ld_0) Li_48 = FALSE;
                        }
                     }
                  } else point_60 = Ld_32;
                  if (Ld_40 == 0.0) {
                     Li_56 = Gi_1564 + Scalper_AddSpreadToTP * Gd_716;
                     if (StealthMode) Li_56 = Li_56 + (Gi_1336 + f0_0(Gi_1340)) * MathPow(10.0, G_digits_184);
                     if (Li_56 != FALSE) {
                        if (OrderType() == OP_BUY) {
                           point_68 = NormalizeDouble(price_24 + Li_56 * G_point_1444, G_digits_1400);
                           if (point_68 - Ld_16 <= Ld_0) Li_48 = FALSE;
                        } else {
                           point_68 = NormalizeDouble(price_24 - Li_56 * G_point_1444, G_digits_1400);
                           if (point_68 <= 0.0) point_68 = Point;
                           if (Ld_16 - point_68 <= Ld_0) Li_48 = FALSE;
                        }
                     }
                  } else point_68 = Ld_40;
                  if (Li_52 != 0 && Li_56 != 0 && Li_48) {
                     while (!IsTradeAllowed()) Sleep(1000);
                     bool_76 = OrderModify(OrderTicket(), price_24, point_60, point_68, 0, CLR_NONE);
                     if (!bool_76)
                        if (WriteDebugLog) Print("SetOrderLevels: OrderModify error = ", GetLastError());
                  }
               }
            }
         }
      }
   }
}
	    	 	 		 	     			    								 		 	 	 		 	 		   			   	 	  	 				 		  			 			 	 				   			  	 				  			   	 		  	  	       		          			 			
// 8F834653C8A77559EA2B01D0E617F799
int f0_12() {
   int datetime_28;
   if (Gi_1632 == Gi_1636 && Scalper_StartSessionMinute == Scalper_EndSessionMinute) return (0);
   int datetime_0 = TimeCurrent();
   int Li_4 = iTime(NULL, PERIOD_D1, 0);
   int hour_8 = TimeHour(datetime_0);
   int Li_unused_12 = 0;
   if (Gi_1632 > Gi_1636)
      if (hour_8 < Gi_1632) Li_4 -= 86400;
   Li_4 += 3600 * Gi_1632 + 60 * Scalper_StartSessionMinute;
   int Li_16 = OrdersTotal() - 1;
   int datetime_20 = -2147483647;
   for (int pos_24 = Li_16; pos_24 >= 0; pos_24--) {
      if (OrderSelect(pos_24, SELECT_BY_POS, MODE_TRADES)) {
         if (OrderMagicNumber() == G_magic_1396) {
            if (OrderSymbol() == Gs_1492) {
               datetime_28 = OrderOpenTime();
               if (datetime_20 < datetime_28) datetime_20 = datetime_28;
            }
         }
      }
   }
   if (datetime_20 >= Li_4) return (1);
   Li_16 = OrdersHistoryTotal() - 1;
   datetime_20 = -2147483647;
   for (pos_24 = Li_16; pos_24 >= 0; pos_24--) {
      if (OrderSelect(pos_24, SELECT_BY_POS, MODE_HISTORY)) {
         if (OrderMagicNumber() == G_magic_1396) {
            if (OrderSymbol() == Gs_1492) {
               datetime_28 = OrderOpenTime();
               if (datetime_20 < datetime_28) datetime_20 = datetime_28;
            }
         }
      }
   }
   if (datetime_20 >= Li_4) return (1);
   return (0);
}
		 	 	  	 			  				 	  		 	 			  		  	  	 			 	 		  		 		     		  	  				 	  		 	   							 	   	 	 	      	 	   	    				 	  	 		 	   				 	 	  
// 68B009D85437AE26601F80D05260476E
int f0_10() {
   int count_0 = 0;
   for (int pos_4 = 0; pos_4 < OrdersTotal(); pos_4++) {
      if (OrderSelect(pos_4, SELECT_BY_POS, MODE_TRADES)) {
         if (OrderMagicNumber() == G_magic_1396)
            if (OrderSymbol() == Gs_1492) count_0++;
      }
   }
   return (count_0);
}
		  		    	    	 			   	  		 		 						    	   	  	 	 	 	   		 			 						  					    	 			 			      		    	   		  		 		 		 	  	 	  	  	  	 			  	 	
// D43CF0F27808F53715C65F405A5023D1
int f0_20(int A_ticket_0, double A_lots_4, int Ai_12, int A_slippage_16, string As_unused_20 = "") {
   color color_28;
   int Li_48;
   double price_52;
   bool is_closed_60;
   int error_64;
   string Ls_68;
   bool Li_76;
   if (Ai_12 == 0) color_28 = ColorBuy;
   else color_28 = ColorSell;
   int count_32 = 0;
   int count_36 = 0;
   int count_40 = 0;
   int count_44 = 0;
   while (true) {
      if (Gi_988 > 0) {
         Li_48 = f0_0(Gi_988);
         if ((!IsTesting()) && !IsOptimization()) Sleep(1000 * Li_48);
      }
      while (!IsTradeAllowed()) Sleep(1000);
      RefreshRates();
      if (Ai_12 == 0) price_52 = NormalizeDouble(Bid, Digits);
      else price_52 = NormalizeDouble(Ask, Digits);
      is_closed_60 = OrderClose(A_ticket_0, A_lots_4, price_52, A_slippage_16, color_28);
      if (!is_closed_60) {
         error_64 = GetLastError();
         if (WriteDebugLog) {
            if (Ai_12 == 0) Ls_68 = "BUY";
            else Ls_68 = "SELL";
            Print("OrderClose(", Ls_68, ",", A_ticket_0, ") error = ", f0_22(error_64));
         }
         Li_76 = FALSE;
         switch (error_64) {
         case 0/* NO_ERROR */:
            Sleep(10000);
            if (!(OrderSelect(A_ticket_0, SELECT_BY_TICKET))) break;
            if (OrderCloseTime() != 0) break;
            Li_76 = TRUE;
            break;
         case 1/* NO_RESULT */: break;
         case 2/* COMMON_ERROR */: break;
         case 3/* INVALID_TRADE_PARAMETERS */: break;
         case 4/* SERVER_BUSY */: break;
         case 5/* OLD_VERSION */: break;
         case 6/* NO_CONNECTION */:
            Sleep(10000);
            if (!(IsConnected())) break;
            Li_76 = TRUE;
            break;
         case 7/* NOT_ENOUGH_RIGHTS */: break;
         case 8/* TOO_FREQUENT_REQUESTS */: break;
         case 9/* MALFUNCTIONAL_TRADE */: break;
         case 64/* ACCOUNT_DISABLED */: break;
         case 65/* INVALID_ACCOUNT */: break;
         case 128/* TRADE_TIMEOUT */:
            Sleep(70000);
            if (!(OrderSelect(A_ticket_0, SELECT_BY_TICKET))) break;
            if (OrderCloseTime() != 0) break;
            Li_76 = TRUE;
            break;
         case 129/* INVALID_PRICE */:
            Sleep(6000);
            count_32++;
            if (count_32 > 3) break;
            Li_76 = TRUE;
            break;
         case 130/* INVALID_STOPS */:
            Sleep(6000);
            count_36++;
            if (count_36 > 3) break;
            Li_76 = TRUE;
            break;
         case 131/* INVALID_TRADE_VOLUME */: break;
         case 132/* MARKET_CLOSED */: break;
         case 133/* TRADE_DISABLED */: break;
         case 134/* NOT_ENOUGH_MONEY */: break;
         case 135/* PRICE_CHANGED */:
            Li_76 = TRUE;
            break;
         case 136/* OFF_QUOTES */:
            Sleep(6000);
            Li_76 = TRUE;
            break;
         case 137/* BROKER_BUSY */:
            Sleep(20000);
            count_40++;
            if (count_40 > 3) break;
            Li_76 = TRUE;
            break;
         case 138/* REQUOTE */:
            count_44++;
            if (count_44 > 3) break;
            Li_76 = TRUE;
            break;
         case 139/* ORDER_LOCKED */: break;
         case 140/* LONG_POSITIONS_ONLY_ALLOWED */: break;
         case 141/* TOO_MANY_REQUESTS */: break;
         case 142:
            Sleep(70000);
            if (!(OrderSelect(A_ticket_0, SELECT_BY_TICKET))) break;
            if (OrderCloseTime() != 0) break;
            Li_76 = TRUE;
            break;
         case 143:
            Sleep(70000);
            if (!(OrderSelect(A_ticket_0, SELECT_BY_TICKET))) break;
            if (OrderCloseTime() != 0) break;
            Li_76 = TRUE;
            break;
         case 144: break;
         case 145/* TRADE_MODIFY_DENIED */:
            Sleep(20000);
            Li_76 = TRUE;
            break;
         case 146/* TRADE_CONTEXT_BUSY */:
            while (IsTradeContextBusy()) Sleep(1000);
            Li_76 = TRUE;
            break;
         case 147/* TRADE_EXPIRATION_DENIED */: break;
         case 148/* TRADE_TOO_MANY_ORDERS */: break;
         case 4000/* NO_MQLERROR */:
            Sleep(10000);
            if (!(OrderSelect(A_ticket_0, SELECT_BY_TICKET))) break;
            if (OrderCloseTime() != 0) break;
            Li_76 = TRUE;
         case 4051/* INVALID_FUNCTION_PARAMETER_VALUE */: break;
         case 4062/* STRING_PARAMETER_EXPECTED */: break;
         case 4063/* INTEGER_PARAMETER_EXPECTED */: break;
         case 4064/* DOUBLE_PARAMETER_EXPECTED */: break;
         case 4105/* NO_ORDER_SELECTED */: break;
         case 4106/* UNKNOWN_SYMBOL */: break;
         case 4107/* INVALID_PRICE_PARAM */: break;
         case 4108/* INVALID_TICKET */: break;
         case 4109/* TRADE_NOT_ALLOWED */: break;
         case 4110/* LONGS__NOT_ALLOWED */: break;
         case 4111/* SHORTS_NOT_ALLOWED */: break;
         }
         if (!(Li_76)) break;
      } else {
         if (OrderSelect(A_ticket_0, SELECT_BY_TICKET)) price_52 = OrderClosePrice();
         if (SendEmail) {
            if (Gi_1348 == 0) {
               SendMail(Gs_1508, StringConcatenate("BTC Fapturbo2 Trade Information\nCurrency Pair: ", StringSubstr(Gs_1492, 0, 6), 
                  "\nTime: ", TimeToStr(TimeCurrent(), TIME_DATE|TIME_MINUTES|TIME_SECONDS), 
                  "\nOrder Type: ", f0_25(Ai_12), 
                  "\nPrice: ", DoubleToStr(price_52, Digits), 
                  "\nLot size: ", DoubleToStr(A_lots_4, Gi_1392), 
                  "\nEvent: Trade Closed", 
                  "\n\nCurrent Balance: ", DoubleToStr(AccountBalance(), 2), " ", AccountCurrency(), 
               "\nCurrent Equity: ", DoubleToStr(AccountEquity(), 2), " ", AccountCurrency()));
            } else {
               SendMail(Gs_1524, StringConcatenate("BTC Fapturbo2 �������� ����������\n�������� ����: ", StringSubstr(Gs_1492, 0, 6), 
                  "\n�����: ", TimeToStr(TimeCurrent(), TIME_DATE|TIME_MINUTES|TIME_SECONDS), 
                  "\n��� ������: ", f0_25(Ai_12), 
                  "\n����: ", DoubleToStr(price_52, Digits), 
                  "\n������ ����: ", DoubleToStr(A_lots_4, Gi_1392), 
                  "\n�������: �������� ������", 
                  "\n\n������� ������: ", DoubleToStr(AccountBalance(), 2), " ", AccountCurrency(), 
               "\n������� ��������: ", DoubleToStr(AccountEquity(), 2), " ", AccountCurrency()));
            }
         }
         if (!(SoundAlert)) break;
         PlaySound(SoundFileAtClose);
      }
      break;
   }
   return (is_closed_60);
}
					      	 	 	 	   	 	      	 		  	      	 		  		    	  	 					   	 		    	 	   	   		 	   	       	  	 			   			 				 						  					 	 	   		 	
// E2B63227338851B5B4F672F3959EE923
int f0_23() {
   int count_0 = 0;
   int Li_4 = OrdersTotal() - 1;
   for (int pos_8 = Li_4; pos_8 >= 0; pos_8--) {
      if (OrderSelect(pos_8, SELECT_BY_POS, MODE_TRADES))
         if (OrderMagicNumber() == G_magic_1396) count_0++;
   }
   return (count_0);
}
	 	 	 	  	   			   	 			 	 	    	  		 	  	   	    		  		 					 			 		  	 	 		    			   	   	 		  	 	 		 			 	 	 	 				 	  	 		    	 				   	 	  	
// F787E1ED503D2D47A476A44E6CA26384
string f0_25(int Ai_0) {
   string Ls_ret_8;
   switch (Ai_0) {
   case 0:
      Ls_ret_8 = "Buy";
      break;
   case 1:
      Ls_ret_8 = "Sell";
      break;
   case 2:
      Ls_ret_8 = "BuyLimit";
      break;
   case 3:
      Ls_ret_8 = "SellLimit";
      break;
   case 4:
      Ls_ret_8 = "BuyStop";
      break;
   case 5:
      Ls_ret_8 = "SellStop";
      break;
   default:
      Ls_ret_8 = "Unknown";
   }
   return (Ls_ret_8);
}
					      	 	 	 	   	 	      	 		  	      	 		  		    	  	 					   	 		    	 	   	   		 	   	       	  	 			   			 				 						  					 	 	   		 	
// 58EBE0EA31797FDDCC7266521BDE03EC
double f0_7() {
   int Li_16;
   int datetime_20;
   int hour_24;
   int Li_unused_28;
   double Ld_ret_0 = 0;
   int Li_8 = OrdersTotal() - 1;
   for (int pos_12 = Li_8; pos_12 >= 0; pos_12--) {
      if (!OrderSelect(pos_12, SELECT_BY_POS, MODE_TRADES)) {
         if (WriteDebugLog) Print("CalculateProfitSession: OrderSelect() error = ", GetLastError());
      } else
         if (OrderMagicNumber() == G_magic_1396) Ld_ret_0 += OrderProfit() + OrderSwap() + OrderCommission();
   }
   if (Gi_1632 == Gi_1636 && Scalper_StartSessionMinute == Scalper_EndSessionMinute) Li_16 = 0;
   else {
      datetime_20 = TimeCurrent();
      Li_16 = iTime(NULL, PERIOD_D1, 0);
      hour_24 = TimeHour(datetime_20);
      Li_unused_28 = 0;
      if (Gi_1632 > Gi_1636)
         if (hour_24 < Gi_1632) Li_16 -= 86400;
      Li_16 += 3600 * Gi_1632 + 60 * Scalper_StartSessionMinute;
   }
   Li_8 = OrdersHistoryTotal() - 1;
   for (pos_12 = Li_8; pos_12 >= 0; pos_12--) {
      if (!OrderSelect(pos_12, SELECT_BY_POS, MODE_HISTORY)) {
         if (WriteDebugLog) Print("CalculateProfitSession: OrderSelect() error = ", GetLastError());
      } else {
         if (OrderMagicNumber() == G_magic_1396)
            if (OrderCloseTime() >= Li_16) Ld_ret_0 += OrderProfit() + OrderSwap() + OrderCommission();
      }
   }
   return (Ld_ret_0);
}
			         		 	 	 			 	   		 	 		 	        			  				  	  		 				  	  		   	  	   			 		 	 			     			  	 	     				 			 		  		  		  	 	 	 				 	
// C5A7E99141EEEFCB0510E8BEB7152151
int f0_18(string A_symbol_0) {
   int cmd_20;
   bool is_deleted_24;
   int Li_ret_8 = 0;
   int Li_12 = OrdersTotal() - 1;
   for (int pos_16 = Li_12; pos_16 >= 0; pos_16--) {
      if (!OrderSelect(pos_16, SELECT_BY_POS, MODE_TRADES)) {
         if (WriteDebugLog) Print("CloseAllTrades: OrderSelect() error = ", GetLastError());
      } else {
         if (A_symbol_0 != "ALL")
            if (OrderSymbol() != A_symbol_0) continue;
         if (OrderMagicNumber() == G_magic_1396) {
            cmd_20 = OrderType();
            RefreshRates();
            while (!IsTradeAllowed()) Sleep(1000);
            if (cmd_20 <= OP_SELL) is_deleted_24 = f0_20(OrderTicket(), OrderLots(), cmd_20, G_slippage_1440);
            else {
               is_deleted_24 = OrderDelete(OrderTicket());
               if (!is_deleted_24)
                  if (WriteDebugLog) Print("CloseAllTrades: OrderDelete() error = ", GetLastError());
            }
            if (!is_deleted_24) Li_ret_8 = -1;
         }
      }
   }
   return (Li_ret_8);
}
	 		 	 			 		   	   	   		  				     	 			 		 			 	 		  			   	  	   		 		   						 			 	   	  			  	  	 			 	 	  	   	 	 		  			 		    	   	 		 
/*
int f0_14() {
   string Ls_8;
   int Li_ret_16;
   int Li_20;
   Gi_1368 = InternetOpenA(Gs_1360, 0, "0", "0", 0);
   string Ls_0 = "XXXXXXXXXX";
   if (!f0_6(Gs_1352, Ls_0)) {
      if (Gi_1348 == 0) Ls_8 = "Error getting GMT data from server.";
      else Ls_8 = "������ ��� ��������� ������ � �������.";
      Comment(Ls_8);
      Print(Ls_8);
      Li_ret_16 = 2;
   } else {
      Li_20 = TimeCurrent() - StrToInteger(Ls_0);
      Li_ret_16 = MathFloor((Li_20 + 1800) / 3600.0);
   }
   InternetCloseHandle(Gi_1368);
   return (Li_ret_16);
}
*/
	 				 	 	 	             	   				   		 	 	 	  		  	  	   		 	 	 		  			  	  				 		  		        	 	     							 		 	 	 	   			 		  			         			
// 20C2592F4ED892233DB3D7C98D848A20
void f0_1(string A_name_0, int A_x_8, int A_y_12, color A_color_16, string A_text_20 = "") {
   ObjectCreate(A_name_0, OBJ_LABEL, 0, 0, 0);
   ObjectSet(A_name_0, OBJPROP_CORNER, 2);
   ObjectSet(A_name_0, OBJPROP_XDISTANCE, A_x_8);
   ObjectSet(A_name_0, OBJPROP_YDISTANCE, A_y_12);
   ObjectSetText(A_name_0, A_text_20, 10, "Arial", A_color_16);
}
	 			 	 		 	 				    					          	 	 		 	 	  	 	   					 		 	 	  	  			  	   			    		    		 		   		  				 	   	 		 		 				  	 							    	   
// D9FE32DED9736DEA09F5984C6BF49D2D
int f0_21() {
   string str_concat_24;
   bool Li_ret_0 = FALSE;
   int Li_4 = EMPTY_VALUE;
   int Li_8 = 3600 * ManualGMToffset + 0;
   int Li_12 = -1;
   int Li_16 = -1;
   for (int index_20 = 0; index_20 < 10; index_20++) {
      if (Gi_1544 > Gia_1748[index_20]) {
         if (Li_8 < Gia_1748[index_20]) {
            Li_8 = Gia_1748[index_20];
            Li_16 = index_20;
         }
      } else {
         if (Li_4 > Gia_1748[index_20]) {
            Li_4 = Gia_1748[index_20];
            Li_12 = index_20;
         }
      }
   }
   if (Gi_1036) {
      if (Li_12 < 0) str_concat_24 = "Next: no data";
      else str_concat_24 = StringConcatenate("Next: ", TimeToStr(Li_4, TIME_DATE|TIME_MINUTES), " ", Gsa_1752[Li_12]);
      ObjectSetText("info_str0", str_concat_24, 10, "Arial", G_color_1040);
      if (Li_16 < 0) str_concat_24 = "Last: no data";
      else str_concat_24 = StringConcatenate("Last: ", TimeToStr(Li_8, TIME_DATE|TIME_MINUTES), " ", Gsa_1752[Li_16]);
      ObjectSetText("info_str1", str_concat_24, 10, "Arial", G_color_1040);
   }
   if (Gi_1016 > 0) {
      if (Li_12 >= 0)
         if (Li_4 - Gi_1544 <= Gi_1736) Li_ret_0 = TRUE;
   }
   if (Gi_1020 > 0) {
      if (Li_16 >= 0)
         if (Gi_1544 - Li_8 <= Gi_1740) Li_ret_0 = TRUE;
   }
   if (Gi_1024 > 0) {
      if (Li_12 >= 0) {
         if (Li_4 - Gi_1544 <= Gi_1744) {
            Li_ret_0 = TRUE;
            if (Gi_1760 != Li_4) {
               Gi_1760 = Li_4;
               RefreshRates();
               if (Gi_1028 > 0) {
                  G_price_1764 = NormalizeDouble(Bid - Gi_1028 * G_point_1444, Digits);
                  G_price_1780 = NormalizeDouble(Ask + Gi_1028 * G_point_1444, Digits);
               } else {
                  G_price_1764 = 0;
                  G_price_1780 = 0;
               }
               if (Gi_1032 > 0) {
                  G_price_1772 = NormalizeDouble(Bid + Gi_1032 * G_point_1444, Digits);
                  G_price_1788 = NormalizeDouble(Ask - Gi_1032 * G_point_1444, Digits);
               } else {
                  G_price_1772 = 0;
                  G_price_1788 = 0;
               }
            }
            f0_17();
         }
      }
   }
   return (Li_ret_0);
}
		 			    		   	 		    	  	  		 			 		    		  	  	   	 	    	 			 	 				  	 			      			 		       	     	  			  		  	 		 	 		 	  	 		  	 		   	 	
// C0C57AA32B0A4681B7C903814E63B50B
void f0_17() {
   double Ld_16;
   double price_24;
   double price_32;
   bool Li_40;
   double price_44;
   double price_52;
   bool bool_60;
   double Ld_0 = NormalizeDouble(MarketInfo(Gs_1492, MODE_STOPLEVEL) * Point, Digits);
   int Li_8 = OrdersTotal() - 1;
   for (int pos_12 = Li_8; pos_12 >= 0; pos_12--) {
      if (!OrderSelect(pos_12, SELECT_BY_POS, MODE_TRADES)) {
         if (WriteLog) Print("SetNewsLevels: OrderSelect() error = ", f0_22(GetLastError()));
      } else {
         if (OrderMagicNumber() == G_magic_1396) {
            if (OrderType() <= OP_SELL) {
               if (OrderSymbol() == Gs_1492) {
                  Ld_16 = NormalizeDouble(OrderClosePrice(), Digits);
                  price_24 = NormalizeDouble(OrderStopLoss(), Digits);
                  price_32 = NormalizeDouble(OrderTakeProfit(), Digits);
                  Li_40 = FALSE;
                  if (OrderType() == OP_BUY) {
                     if (G_price_1764 != 0.0) {
                        if (price_24 == G_price_1764) price_44 = price_24;
                        else {
                           if (NormalizeDouble(Bid - G_price_1764, Digits) >= Ld_0) {
                              price_44 = G_price_1764;
                              Li_40 = TRUE;
                           } else {
                              if (WriteLog) Print("SetNewsLevels: it is impossible to modify a stop-loss, new value is near to the current price.");
                              price_44 = price_24;
                           }
                        }
                     } else price_44 = price_24;
                     if (G_price_1772 != 0.0) {
                        if (price_32 == G_price_1772) price_52 = price_32;
                        else {
                           if (NormalizeDouble(G_price_1772 - Bid, Digits) >= Ld_0) {
                              price_52 = G_price_1772;
                              Li_40 = TRUE;
                           } else {
                              if (WriteLog) Print("SetNewsLevels: it is impossible to modify a take-profit, new value is near to the current price.");
                              price_52 = price_32;
                           }
                        }
                     } else price_52 = price_32;
                  } else {
                     if (G_price_1780 != 0.0) {
                        if (price_24 == G_price_1780) price_44 = price_24;
                        else {
                           if (NormalizeDouble(G_price_1780 - Ask, Digits) >= Ld_0) {
                              price_44 = G_price_1780;
                              Li_40 = TRUE;
                           } else {
                              if (WriteLog) Print("SetNewsLevels: it is impossible to modify a stop-loss, new value is near to the current price.");
                              price_44 = price_24;
                           }
                        }
                     } else price_44 = price_24;
                     if (G_price_1788 != 0.0) {
                        if (price_32 == G_price_1788) price_52 = price_32;
                        else {
                           if (NormalizeDouble(Ask - G_price_1788, Digits) >= Ld_0) {
                              price_52 = G_price_1788;
                              Li_40 = TRUE;
                           } else {
                              if (WriteLog) Print("SetNewsLevels: it is impossible to modify a take-profit, new value is near to the current price.");
                              price_52 = price_32;
                           }
                        }
                     } else price_52 = price_32;
                  }
                  if (Li_40) {
                     while (!IsTradeAllowed()) Sleep(1000);
                     bool_60 = OrderModify(OrderTicket(), OrderOpenPrice(), price_44, price_52, 0, CLR_NONE);
                     if (!bool_60)
                        if (WriteLog) Print("SetNewsLevels: OrderModify(", f0_25(OrderType()), ") error = ", f0_22(GetLastError()));
                  }
               }
            }
         }
      }
   }
}
		     		 	 		  						  	 			 		 			   		 	 						 		   	  	 		   		  	 	 		  			  		 	 						 		 				 	       	 	 	 		 		   					   	  								 
// 4727B18CDF3D87FC162499B4B5B8D383
int f0_5() {
   int Li_ret_0 = 0;
   int Li_4 = TimeCurrent() - Gi_1804 - 3600 * ManualGMToffset;
   for (int index_8 = 0; index_8 < 8; index_8++) {
      if (Gia_1796[index_8] <= 0 || Gia_1800[index_8] <= 0) continue;
      if (Gia_1796[index_8] <= Li_4) {
         if (Gia_1800[index_8] >= Li_4) {
            Li_ret_0 = 3600;
            break;
         }
      }
   }
   return (Li_ret_0);
}
			  			    	 	  	 		 	    			 			 	 			    	  	 						   		    	  	 	     	 	 	  				   	 		 		   		 			 	  							     		    	 		   	  	 		  		
/*
bool f0_6(string As_0, string &As_8, bool Ai_16 = TRUE) {
   int Li_20 = InternetOpenUrlA(Gi_1368, As_0, "0", 0, -2080374528, 0);
   if (Li_20 == 0) return (FALSE);
   int Lia_24[] = {1};
   string Ls_28 = "xxx";
   if (Ai_16) Ls_28 = "xxxxxxxxxx";
   string Ls_unused_36 = Ls_28;
   int Li_44 = InternetReadFile(Li_20, Ls_28, StringLen(Ls_28), Lia_24);
   if (Li_20 != 0) InternetCloseHandle(Li_20);
   As_8 = Ls_28;
   return (TRUE);
}
		   	 	  	 	    				     										 	 	  	 	 		 	 			     	  	 	 		 		   		 			   				  				  	  			  		    	 			 	  	  	    		 	       				 			
// 5D1D13E650A45B2AFA232F9A0C55E95E
int f0_8() {
   string Ls_16;
   int str2int_24;
   string Ls_0 = "http://fapturbo2.com/auth/index.php?email=" + EMail + "&cbreceipt=" + ClickbankReceipt + "&currpair=BTCUSD&acc=" + AccountNumber() + "&r=1&brkr=" + Gi_1944;
   Gi_1368 = InternetOpenA("FapTurbo2", 0, "0", "0", 0);
   string Ls_8 = "XXX";
   if (!f0_6(Ls_0, Ls_8, 0)) {
      Ls_16 = "Error getting data to server.";
      Comment(Ls_16);
      Print(Ls_16);
      str2int_24 = -2;
   } else str2int_24 = StrToInteger(Ls_8);
   InternetCloseHandle(Gi_1368);
   return (str2int_24);
}
*/
	 	 	 	  	   			   	 			 	 	    	  		 	  	   	    		  		 					 			 		  	 	 		    			   	   	 		  	 	 		 			 	 	 	 				 	  	 		    	 				   	 	  	
// C75F7811D70D17DBCD88E9D03752CBED
int f0_19() {
//   Gi_1852 = f0_8();
   Gi_1852 = 1; 
   if (Gi_1852 == -1) {
      Gs_1844 = "Authentication Failed [Invalid Internet Connection]\n[Trades are not available]";
      return (-1);
   }
   if (Gi_1852 == -2) {
      Gs_1844 = "Authentication Failed [Invalid Internet Connection]\nTemporary Internet Connection issue but robot is operational\nIf this message persists, please reintialize the robot again after a few minutes\n[Trades are not available]";
      return (1);
   }
   if (Gi_1852 == 0 || Gi_1852 == -3) {
      Gs_1844 = "Authentication Failed [Wrong/Empty E-Mail or ClickbankReceipt]\n[Trades are not available]";
      return (-3);
   }
   if (Gi_1852 == -5) {
      Gs_1844 = "PREMIUM error: This is NOT a registered Premium account! Please contact our Premium Support (premium@fapturbo2.com)\n[Trades are not available]";
      return (-5);
   }
   if (Gi_1852 == -7) {
      Gs_1844 = "BANNED: You have refunded your FapTurbo2 purchase!!\nPlease contact our Support (premium@fapturbo2.com) in order to purchase a new licence.\n[Trades are not available]";
      return (-7);
   }
   if (Gi_1852 == -6) {
      Gs_1844 = "Authentication Failed - You have not yet registered your Live Account#\nKindly register your Live account on the License Management page in FAPT2 Members Area at http://fapturbo2.com/members\n[Trades are not available]";
      return (-6);
   }
   if (Gi_1852 == -4) {
      Gs_1844 = "Authentication Failed [Invalid Real Money Account Number]\nKindly update or correct the live account# for this broker on the License Management page in FAPT2 Members Area at http://fapturbo2.com/members\n[Trades are not available]";
      return (-4);
   }
   if (Gi_1852 == -9) {
      Gs_1844 = "Authentication Failed [Empty/Invalid Email or CBreceipt#]\n[Trades are not available]";
      return (-9);
   }
   if (Gi_1852 == -10) {
      Gs_1844 = "Authentication Failed [Invalid Email or CBreceipt#]\n[Trades are not available]";
      return (-10);
   }
   if (Gi_1852 == -11) {
      Gs_1844 = "Authentication Failed [Incorrect Email]\n[Trades are not available]";
      return (-11);
   }
   if (Gi_1852 == -12) {
      Gs_1844 = "Authentication Failed [Invalid CBreceipt# for this Email]\n[Trades are not available]";
      return (-12);
   }
   if (Gi_1852 == -8) {
      Gs_1844 = "You have dropped the robot onto the Wrong Pair or Symbol\n[Trades are not available]";
      return (-8);
   }
   if (Gi_1852 == 1) {
      Gs_1844 = "Authenticated successfully!";
      return (1);
   }
   return (0);
}
	 		 	  		 		  		   	  			  			      	  		 		 	 	 	 		 				   		 	   					   		 			 					   	   		  	    			 	    	   			 		  	 	 		   		   	 	  
// 17BAA58F59079CF7BD3EF3659D426BFB
int f0_0(int Ai_0) {
   MathSrand(TimeLocal());
   return (MathRand() % Ai_0);
}
	  	     					 	  	 		 	 		 	 	 	 	      						     	  	 	   						   		 		   	  	  	 		  	 		   		 		  		 	    	    			   	 		    	 	 	  	 			 	
// DA69CBAFF4D38B87377667EEC549DE5A
string f0_22(int Ai_0) {
   string Ls_ret_4;
   switch (Ai_0) {
   case 0:
   case 1:
      Ls_ret_4 = "no error";
      break;
   case 2:
      Ls_ret_4 = "common error";
      break;
   case 3:
      Ls_ret_4 = "invalid trade parameters";
      break;
   case 4:
      Ls_ret_4 = "trade server is busy";
      break;
   case 5:
      Ls_ret_4 = "old version of the client terminal";
      break;
   case 6:
      Ls_ret_4 = "no connection with trade server";
      break;
   case 7:
      Ls_ret_4 = "not enough rights";
      break;
   case 8:
      Ls_ret_4 = "too frequent requests";
      break;
   case 9:
      Ls_ret_4 = "malfunctional trade operation (never returned error)";
      break;
   case 64:
      Ls_ret_4 = "account disabled";
      break;
   case 65:
      Ls_ret_4 = "invalid account";
      break;
   case 128:
      Ls_ret_4 = "trade timeout";
      break;
   case 129:
      Ls_ret_4 = "invalid price";
      break;
   case 130:
      Ls_ret_4 = "invalid stops";
      break;
   case 131:
      Ls_ret_4 = "invalid trade volume";
      break;
   case 132:
      Ls_ret_4 = "market is closed";
      break;
   case 133:
      Ls_ret_4 = "trade is disabled";
      break;
   case 134:
      Ls_ret_4 = "not enough money";
      break;
   case 135:
      Ls_ret_4 = "price changed";
      break;
   case 136:
      Ls_ret_4 = "off quotes";
      break;
   case 137:
      Ls_ret_4 = "broker is busy (never returned error)";
      break;
   case 138:
      Ls_ret_4 = "requote";
      break;
   case 139:
      Ls_ret_4 = "order is locked";
      break;
   case 140:
      Ls_ret_4 = "long positions only allowed";
      break;
   case 141:
      Ls_ret_4 = "too many requests";
      break;
   case 145:
      Ls_ret_4 = "modification denied because order too close to market";
      break;
   case 146:
      Ls_ret_4 = "trade context is busy";
      break;
   case 147:
      Ls_ret_4 = "expirations are denied by broker";
      break;
   case 148:
      Ls_ret_4 = "amount of open and pending orders has reached the limit";
      break;
   case 4000:
      Ls_ret_4 = "no error (never generated code)";
      break;
   case 4001:
      Ls_ret_4 = "wrong function pointer";
      break;
   case 4002:
      Ls_ret_4 = "array index is out of range";
      break;
   case 4003:
      Ls_ret_4 = "no memory for function call stack";
      break;
   case 4004:
      Ls_ret_4 = "recursive stack overflow";
      break;
   case 4005:
      Ls_ret_4 = "not enough stack for parameter";
      break;
   case 4006:
      Ls_ret_4 = "no memory for parameter string";
      break;
   case 4007:
      Ls_ret_4 = "no memory for temp string";
      break;
   case 4008:
      Ls_ret_4 = "not initialized string";
      break;
   case 4009:
      Ls_ret_4 = "not initialized string in array";
      break;
   case 4010:
      Ls_ret_4 = "no memory for array\' string";
      break;
   case 4011:
      Ls_ret_4 = "too long string";
      break;
   case 4012:
      Ls_ret_4 = "remainder from zero divide";
      break;
   case 4013:
      Ls_ret_4 = "zero divide";
      break;
   case 4014:
      Ls_ret_4 = "unknown command";
      break;
   case 4015:
      Ls_ret_4 = "wrong jump (never generated error)";
      break;
   case 4016:
      Ls_ret_4 = "not initialized array";
      break;
   case 4017:
      Ls_ret_4 = "dll calls are not allowed";
      break;
   case 4018:
      Ls_ret_4 = "cannot load library";
      break;
   case 4019:
      Ls_ret_4 = "cannot call function";
      break;
   case 4020:
      Ls_ret_4 = "expert function calls are not allowed";
      break;
   case 4021:
      Ls_ret_4 = "not enough memory for temp string returned from function";
      break;
   case 4022:
      Ls_ret_4 = "system is busy (never generated error)";
      break;
   case 4050:
      Ls_ret_4 = "invalid function parameters count";
      break;
   case 4051:
      Ls_ret_4 = "invalid function parameter value";
      break;
   case 4052:
      Ls_ret_4 = "string function internal error";
      break;
   case 4053:
      Ls_ret_4 = "some array error";
      break;
   case 4054:
      Ls_ret_4 = "incorrect series array using";
      break;
   case 4055:
      Ls_ret_4 = "custom indicator error";
      break;
   case 4056:
      Ls_ret_4 = "arrays are incompatible";
      break;
   case 4057:
      Ls_ret_4 = "global variables processing error";
      break;
   case 4058:
      Ls_ret_4 = "global variable not found";
      break;
   case 4059:
      Ls_ret_4 = "function is not allowed in testing mode";
      break;
   case 4060:
      Ls_ret_4 = "function is not confirmed";
      break;
   case 4061:
      Ls_ret_4 = "send mail error";
      break;
   case 4062:
      Ls_ret_4 = "string parameter expected";
      break;
   case 4063:
      Ls_ret_4 = "integer parameter expected";
      break;
   case 4064:
      Ls_ret_4 = "double parameter expected";
      break;
   case 4065:
      Ls_ret_4 = "array as parameter expected";
      break;
   case 4066:
      Ls_ret_4 = "requested history data in update state";
      break;
   case 4099:
      Ls_ret_4 = "end of file";
      break;
   case 4100:
      Ls_ret_4 = "some file error";
      break;
   case 4101:
      Ls_ret_4 = "wrong file name";
      break;
   case 4102:
      Ls_ret_4 = "too many opened files";
      break;
   case 4103:
      Ls_ret_4 = "cannot open file";
      break;
   case 4104:
      Ls_ret_4 = "incompatible access to a file";
      break;
   case 4105:
      Ls_ret_4 = "no order selected";
      break;
   case 4106:
      Ls_ret_4 = "unknown symbol";
      break;
   case 4107:
      Ls_ret_4 = "invalid price parameter for trade function";
      break;
   case 4108:
      Ls_ret_4 = "invalid ticket";
      break;
   case 4109:
      Ls_ret_4 = "trade is not allowed in the expert properties";
      break;
   case 4110:
      Ls_ret_4 = "longs are not allowed in the expert properties";
      break;
   case 4111:
      Ls_ret_4 = "shorts are not allowed in the expert properties";
      break;
   case 4200:
      Ls_ret_4 = "object is already exist";
      break;
   case 4201:
      Ls_ret_4 = "unknown object property";
      break;
   case 4202:
      Ls_ret_4 = "object is not exist";
      break;
   case 4203:
      Ls_ret_4 = "unknown object type";
      break;
   case 4204:
      Ls_ret_4 = "no object name";
      break;
   case 4205:
      Ls_ret_4 = "object coordinates error";
      break;
   case 4206:
      Ls_ret_4 = "no specified subwindow";
      break;
   default:
      Ls_ret_4 = "unknown error";
   }
   return (Ls_ret_4);
}

//-------------------- added -----------------

int GMTOffset() 
{
   int lia_0[4];
   int lia_4[43];
   GetSystemTime(lia_0);
   int li_36 = lia_0[0] & 65535;
   int li_40 = lia_0[0] >> 16;
   int li_44 = lia_0[1] >> 16;
   int li_48 = lia_0[2] & 65535;
   int li_52 = lia_0[2] >> 16;
   int li_56 = lia_0[3] & 65535;
   string ls_8 = FormatDateTime(li_36, li_40, li_44, li_48, li_52, li_56);
   double ld_28 = TimeCurrent() - StrToTime(ls_8);
   gs_548 = "\n   Greenwich Mean Time : " + TimeToStr(StrToTime(ls_8), TIME_DATE|TIME_MINUTES|TIME_SECONDS) 
      + "\n   Broker Time : " + TimeToStr(TimeCurrent(), TIME_DATE|TIME_MINUTES|TIME_SECONDS) 
   + "\n   Local Time : " + TimeToStr(TimeLocal(), TIME_DATE|TIME_MINUTES|TIME_SECONDS);
   return (MathRound(ld_28 / 3600.0));
}

string FormatDateTime (int ai_0, int ai_4, int ai_8, int ai_12, int ai_16, int ai_20) 
{
   string ls_24 = ai_4 + 100;
   ls_24 = StringSubstr(ls_24, 1);
   string ls_32 = ai_8 + 100;
   ls_32 = StringSubstr(ls_32, 1);
   string ls_40 = ai_12 + 100;
   ls_40 = StringSubstr(ls_40, 1);
   string ls_48 = ai_16 + 100;
   ls_48 = StringSubstr(ls_48, 1);
   string ls_56 = ai_20 + 100;
   ls_56 = StringSubstr(ls_56, 1);
   return (StringConcatenate(ai_0, ".", ls_24, ".", ls_32, " ", ls_40, ":", ls_48, ":", ls_56));
}	
        
