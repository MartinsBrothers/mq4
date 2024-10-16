//+------------------------------------------------------------------+
//|                                                    XAU iNDEX.mq4 |
//|                                  Copyright © All rights reserved |
//|                                               required mql4 file |
//+------------------------------------------------------------------+
#property copyright     "https://t.me/XAUiNDEX"
#property description   "Copyright XAU iNDEX LTD."
#property version       "3.02"
#property description   "Support Contact WhatsApp/Tlegram ID +8801303972717"
#property description   "Used Currency XAUUSD"
#property description   ""
#property description   "Minimum Deposit 200$ To Unlimited"
#property description   "Time Frame M1"
//------------------------------------------------------------------------------------------------------------------
int Account_Number = 0;                                     
string Account_Fail_Text = "Your Account Is Not Allowed";   
datetime Expiry_Date = D'15.12.2099';
string Expire_Text = "Trial Period Expired";                
string Account_Name = "";                                   
string Account_Name_Text = "Account Name Is Not Matched";   
bool Backtst_Only = false;                                  
string Backtest_Text = "Backtest Use Only";                 
//------------------------------------------------------------------------------------------------------------------
extern string Licence = "XAU iNDEX-ID-5003241";
extern string Menu = "XAU iNDEX INSTAL";
extern bool ema_filter = FALSE;
extern int ema_period = 55;
extern int AppliedPrice = 35;
extern double Deviation = 41;
extern int lopesShift1 = 87;
extern int lopesShift2 = 26;
extern int ema_tf = 5;
extern bool auto_tf_settings = FALSE;
bool gi_112 = FALSE;
bool gi_116 = TRUE;
extern bool auto_trade_at_cross = TRUE;
extern bool trade_at_the_cross_only = FALSE;
extern bool open_with_tc = TRUE;
extern bool use_tc_hedge = TRUE;
extern double max = 0.2;
extern int time_frame_for_signal = 66;
extern bool open_with_tc2 = TRUE;
extern bool close_with_tc2 = FALSE;
extern double psar2 = 0.06;
extern double max2 = 0.2;
extern int time_frame_for_signal2 = 5;
extern bool reverse_second_tc_entry = TRUE;
extern bool reverse_second_tc_exits = TRUE;
bool gi_unused_216 = FALSE;
extern bool use_martingale = FALSE;
enum LotType
{
fix = 1, // Fixed Lot
auto = 2 // Auto Lot
};
extern LotType Lot_Type = auto;              
extern double Fixed_Lot = 0.01;              
double Auto_Lot = 0.01;                      
extern double Max_Lot = 6;                  
int Pip_Step = 500;                          
int Pending_Distance = 51;                   
int Stop_Loss = 35;                          
int Trail_Stop = 65;                        
int Max_Spread = 17;                         
extern int Magic = 123321;                   
extern bool dis_dbl_hedge = FALSE;
extern double at_percent_profit = 6.0;
extern double profit_target_percent = 0.5;
extern double emergency_loss_protection = 50;
extern bool breakeven = FALSE;
extern bool use_hidden_stop_loss = FALSE;
extern bool use_hidden_take_profit = FALSE;
extern bool trail = FALSE;
extern bool hi_lo_filter = FALSE;
extern double h_l_tf = 240.0;
extern bool one_pivot = FALSE;
extern int piv_period = 60;
extern double level = 50.0;
extern bool auto_pivot = FALSE;
extern double orders = 1.0;
extern bool pivot_filter = FALSE;
extern int bars_back = 1;
extern bool show_piv_lines = TRUE;
extern double m1_tf = 60.0;
extern double m1 = 50.0;
extern double m1_tfs = 60.0;
extern double h1s = 50.0;
extern int m1s = 50;
extern int kperiod = 41;
extern int dperiod = 8;
extern int s_lowing = 32;
extern int lolevel = 51;
extern int uplevel = 45;
extern int slowing = 7;
extern int k_period = 42;
extern int d_period = 32;
extern int lo_level = 20;
extern int up_level = 47;
extern int maPereode = 46;
extern double mn_tfs = 4578.0;
extern bool pricefilter = TRUE;
extern bool patternsfilter = TRUE;
extern string Start_Time = "00:00";        
extern string Stop_Time = "23:59";         
int Slippage = 100;
string Comments = "XAU iNDEX";
string info[7] = {"Status:","Balance:","Equity:","Spread:","Volatility:","Time:","Account No.:"};
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  { 
//----------------------------------------------------------------------------------------------------------
   ChartSetInteger(0,CHART_FOREGROUND,0,0);
   ChartSetInteger(0,CHART_SHOW_ONE_CLICK,0);
   if(Account_Number != AccountNumber() && Account_Number != 0){Alert(Account_Fail_Text);ExpertRemove();}
   else if(Expiry_Date < TimeCurrent()){Alert(Expire_Text);ExpertRemove();}
   else if(Account_Name != AccountName() && Account_Name != ""){Alert(Account_Name_Text);ExpertRemove();}
   if(Backtst_Only && !IsTesting()){Alert(Backtest_Text);ExpertRemove();}
   Panel();
   //if(IsTesting()){Alert("Only Live Market Is Allowed");ExpertRemove();} 
//-----------------------------------------------------------------------------------------------------------
ChartSetInteger(0,CHART_AUTOSCROLL,0,1);
ChartSetInteger(0,CHART_SHIFT,0,1);
ChartSetDouble(0,CHART_SHIFT_SIZE,22);
HideTestIndicators(true);
//-----------------------------------------------------------------------------------------------------------
   int   err,lastError;
//----
   initGraph();
   //while (true)                                                             
      {
      if (IsConnected()) main();
      if (!IsConnected()) objectBlank();
      }
//-----------------------------------------------------------------------------------------------------------
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---
   for(int i=0;i<7;i++)
     {
      ObjectDelete(info[i]);
      ObjectDelete(info[i]+" Value");
     }
   ObjectDelete("infoHeader");
   ObjectDelete("XAU iNDEX");
//+------------------------------------------------------------------+
   ObjectDelete("timeframe");
   ObjectDelete("line1");
   ObjectDelete("stoploss");
   ObjectDelete("Stop");
   ObjectDelete("pipstostop");
   ObjectDelete("PipsStop");
   ObjectDelete("line2");
   ObjectDelete("pipsprofit");
   ObjectDelete("pips_profit");
   ObjectDelete("percentbalance");
   ObjectDelete("percent_profit");
   ObjectDelete("line3");
   ObjectDelete("maxlot1");
   ObjectDelete("maxlot2");
   ObjectDelete("line4");
   ObjectDelete("pivots");
   ObjectDelete("line5");
   ObjectDelete("R3_Label");
   ObjectDelete("R3_Value");
   ObjectDelete("R2_Label");
   ObjectDelete("R2_Value");
   ObjectDelete("R1_Label");
   ObjectDelete("R1_Value");
   ObjectDelete("Pivot_Label");
   ObjectDelete("Pivot_Value");
   ObjectDelete("S1_Label");
   ObjectDelete("S1_Value");
   ObjectDelete("S2_Label");
   ObjectDelete("S2_Value");
   ObjectDelete("S3_Label");
   ObjectDelete("S3_Value");
   ObjectDelete("daily_range");
   ObjectDelete("line6");
   ObjectDelete("today");
   ObjectDelete("today_range");
   ObjectDelete("yesterday");
   ObjectDelete("yesterday_range");
   ObjectDelete("5_days");
   ObjectDelete("5_days_range");
   ObjectDelete("10_days");
   ObjectDelete("10_days_range");
   ObjectDelete("20_days");
   ObjectDelete("20_days_range");
   ObjectDelete("50_days");
   ObjectDelete("50_days_range");
   ObjectDelete("line7");
   ObjectDelete("Average");
   ObjectDelete("Average_range");
   ObjectDelete("line8");
   
   ObjectDelete("Trend_UP");
   ObjectDelete("line9");
   ObjectDelete("Trend_UP_text");
   ObjectDelete("Trend_UP_value");
   ObjectDelete("Trend_DOWN_text");
   ObjectDelete("Trend_DOWN_value");
   ObjectDelete("line10");
   ObjectDelete("line12");
   ObjectDelete("Trend");
   ObjectDelete("Trend_comment");
   ObjectDelete("line13");
   ObjectDelete("line11");
   ObjectDelete("UpdateText");
//+------------------------------------------------------------------+
   ObjectsDeleteAll(0,OBJ_LABEL);
   Print("shutdown error - ",GetLastError());      
//---
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
//---

     {
      string objname = "UpdateText";
      if(ObjectFind(objname) < 0)
        {
         int cheight = ChartGetInteger(0,CHART_HEIGHT_IN_PIXELS,0);
         int cwidth = ChartGetInteger(0,CHART_WIDTH_IN_PIXELS,0);
         ObjectCreate(0,objname, OBJ_LABEL, 0, 0, 0);
         ObjectSetInteger(0,objname,OBJPROP_XDISTANCE,(cwidth/2.5)-60);
         ObjectSetInteger(0,objname,OBJPROP_YDISTANCE,(cheight/2)-10);
         ObjectSetInteger(0,objname,OBJPROP_CORNER,0);
         ObjectSetString(0,objname,OBJPROP_FONT,"Arial");
         ObjectSetInteger(0,objname,OBJPROP_FONTSIZE,14);
         ObjectSetInteger(0,objname,OBJPROP_COLOR,clrOrangeRed);
         ObjectSetInteger(0,objname,OBJPROP_BACK,false);
         ObjectSetInteger(0,objname,OBJPROP_SELECTABLE,false);
         ObjectSetInteger(0,objname,OBJPROP_SELECTED,false);
         ObjectSetInteger(0,objname,OBJPROP_HIDDEN,true);
         ObjectSetInteger(0,objname,OBJPROP_ZORDER,false);
        }
     }
   if(Expiry_Date < TimeCurrent()){Alert(Expire_Text);ExpertRemove();}
   string time = TimeToStr(TimeCurrent(), TIME_MINUTES);
   double stoplevel = MarketInfo(Symbol(), MODE_STOPLEVEL);
   double spread = MarketInfo(Symbol(), MODE_SPREAD);
   color currentbg = (color)ChartGetInteger(0,CHART_COLOR_BACKGROUND);
   ObjectSetInteger(0,"infoHeader",OBJPROP_BGCOLOR, currentbg);
   ObjectSetInteger(0,"XAU iNDEX",OBJPROP_BGCOLOR, currentbg);
   string obstatus = "Off";
   color obstatusclr = clrOrange;
   color spreadclr = clrOrange;
   if(IsExpertEnabled())
     {
      obstatus = "On";
      obstatusclr = clrLime;
     }
   if(spread <= Max_Spread)
     {
      spreadclr = clrLime;
     }
   ObjectSetString(0,"Status: Value",OBJPROP_TEXT,obstatus);
   ObjectSetInteger(0,"Status: Value",OBJPROP_COLOR,obstatusclr);
   ObjectSetString(0,"Balance: Value",OBJPROP_TEXT,DoubleToStr(AccountBalance(), 2));
   ObjectSetString(0,"Equity: Value",OBJPROP_TEXT,DoubleToStr(AccountEquity(), 2));
   ObjectSetString(0,"Spread: Value",OBJPROP_TEXT,DoubleToStr(spread/10, 1));
   ObjectSetInteger(0,"Spread: Value",OBJPROP_COLOR,spreadclr);
   ObjectSetString(0,"Volatility: Value",OBJPROP_TEXT,DoubleToStr((MathAbs(iOpen(Symbol(),1440,0)-iClose(Symbol(),1440,0))/20/Point), 2));
   ObjectSetString(0,"Time: Value",OBJPROP_TEXT,TimeToStr(TimeCurrent(), TIME_SECONDS));
   ObjectSetString(0,"Account No.: Value",OBJPROP_TEXT,(string)AccountNumber());
//---
   
   FerruFx();
   if (IsConnected()) main();
   if (!IsConnected()) objectBlank();
//---
  }
//+------------------------------------------------------------------+
int ThisPairTrade(int cmd)
{
   int ThisPairTrade = 0;
   for(int i=0;i<OrdersTotal();i++)
     {
      int Select = OrderSelect(i, SELECT_BY_POS, MODE_TRADES);
      if((OrderType() == cmd || OrderType() == cmd+4) && OrderSymbol() == Symbol() && OrderMagicNumber() == Magic)
        {
         ThisPairTrade++;
        }
     }
   return(ThisPairTrade);
}
//---
void Panel()
{
   color currentbg = (color)ChartGetInteger(0,CHART_COLOR_BACKGROUND);
   color TextColorLeft = clrRed;
   color TextColorRight = clrLime;
   color MainColor = clrSlateGray;
   color BGColor = C'74,109,149';
   int Headx = 260;
   int Heady = 10;
   
   
   
   for(int i=0;i<7;i++)
     {
      ObjectCreate (info[i], OBJ_LABEL, 0, 0, 0);
      ObjectSetText(info[i], info[i] ,14, "Bahnschrift SemiBold SemiConden", TextColorLeft);
      ObjectSet    (info[i], OBJPROP_CORNER, 1);
      ObjectSet    (info[i], OBJPROP_XDISTANCE, Headx-100);
      ObjectSet    (info[i], OBJPROP_YDISTANCE, Heady+30+i*25);
      ObjectSet    (info[i], OBJPROP_SELECTABLE,false);
      ObjectSet    (info[i], OBJPROP_HIDDEN,true);
      
      ObjectCreate (info[i]+" Value", OBJ_LABEL, 0, 0, 0);
      ObjectSetText(info[i]+" Value", "" ,14, "Bahnschrift SemiBold SemiConden", TextColorRight);
      ObjectSet    (info[i]+" Value", OBJPROP_CORNER, 1);
      ObjectSet    (info[i]+" Value", OBJPROP_XDISTANCE, Headx-240);
      ObjectSet    (info[i]+" Value", OBJPROP_YDISTANCE, Heady+30+i*25);
      ObjectSet    (info[i]+" Value", OBJPROP_SELECTABLE,false);
      ObjectSet    (info[i]+" Value", OBJPROP_HIDDEN,true);
     }
}
//---
#resource "\\Indicators\\ZigZag.ex4"
#resource "\\Indicators\\iExposure.ex4"
#resource "\\Indicators\\Accelerator.ex4"
#resource "\\Indicators\\Custom Moving Averages.ex4"
#resource "\\Indicators\\Parabolic.ex4"
#resource "\\Indicators\\Alligator.ex4"
#resource "\\Indicators\\ATR.ex4"
#resource "\\Indicators\\Bands.ex4"
#resource "\\Indicators\\CCI.ex4"
#resource "\\Indicators\\Heiken Ashi.ex4"
//---
//+------------------------------------------------------------------+
 string    Which_Corner_for_all  = "=== Select corner. 0=Upper Left, 1=Upper Right, 2=lower left , 3=lower right ===";
 int       Global_Corner         =     3;

 string    Trade_info_box            = "=== Trade Info Box ===";
 bool      box_trade_analysis    =    false;
 int       X_trade_analysis      =      10;
 int       Y_analysis            =      20;

 string    Trend_box             = "=== Trend Box ===";
 bool      box_trend             =    true;
 int       X_trend               =     270;
 int       eY_trend               =     20;

 string    Pivots_box            = "=== Pivots Box ===";
 bool      box_pivots            =    false;
 int       X_pivots              =      17;
 int       Y_pivots              =     200;

 string    Range_box             = "=== Range Box ===";
 bool      box_range             =    false;
 int       X_range               =     150;
 int       Y_range               =     200;

//---- Open trade info parameters
 string    Trade_info            = "=== Trade Info ===";
 bool      AccountMini           =     false;  // If false, account is standard
 double    LeverageToTrade       =      5.0;  // Leverage which you want to trade per position (e.g. you have a 200:1 account and you want to trade 10:1 of this leverage, just put 10)
 double    PipValue              =    0.832;  // Pip Value

//---- Level to change the strength "weak" to "strong"
 double TrendStrongLevel = 75.00;

//---- Indicators to calculate the trend
 string    Trend_calculation     = "=== Trend calculation and display ===";
 bool      display_fast_MA       =     true;
 bool      display_medium_MA     =     true;
 bool      display_slow_MA       =     true;
 bool      display_CCI           =     true;
 bool      display_MACD          =     true;
 bool      display_ADX           =     true;
 bool      display_BULLS         =     true;
 bool      display_BEARS         =     true;
 bool      display_STOCH         =     true;
 bool      display_RSI           =     true;
 bool      display_FORCE         =     true;
 bool      display_MOMENTUM      =     true;
 bool      display_DeMARKER      =     true;
 bool      display_WAE           =     false;

//---- Timeframes to display and calculate the trend
 string    TF_calculation        = "=== If display false, set coef to 0 ===";
 string    Coefs_TF              = "3 TF true, SUM of their coef must be 3";
 bool      display_M1            =     true;
 double    coef_m1               =      1.0;
 bool      display_M5            =     true;
 double    coef_m5               =      1.0;
 bool      display_M15           =     true;
 double    coef_m15              =      1.0;
 bool      display_M30           =     true;
 double    coef_m30              =      1.0;
 bool      display_H1            =     true;
 double    coef_H1               =      1.0;
 bool      display_H4            =     true;
 double    coef_H4               =      1.0;
 bool      display_D1            =     true;
 double    coef_D1               =      1.0;

//---- Indicators parameters
 string    Shift_Settings_test_only        = "=== Format: 2007.05.07 00:00 ===";
 datetime  look_time_shift       = D'2007.05.07 00:00';  // Shift for test if "test" is true
 double    shift_indicators      =                   0;  // Shift for indicators if "test" is false
 bool      test                  =               false;

string    MA_Settings           = "=== Moving Average Settings ===";
int       FastMAPeriod          =           20;  // Fast Moving Average period
int       MediumMAPeriod        =           50;  // Medium Moving Average period
int       SlowMAPeriod          =          100;  // Slow Moving Average period
int       MAMethod              =     MODE_EMA;  // Moving Average method
int       MAPrice               =  PRICE_CLOSE;  // Moving Average price

string    CCI_Settings          = "=== CCI Settings ===";
int       CCIPeriod             =           14;  // Commodity Channel Index  period
int       CCIPrice              =  PRICE_CLOSE;  // CCI price

string    MACD_Settings         = "=== MACD Settings ===";
int       MACDFast              =           12;  // MACD fast EMA period
int       MACDSlow              =           26;  // MACD slow EMA period
int       MACDSignal            =            9;  // MACD signal SMA period

string    ADX_Settings          = "=== ADX Settings ===";
int       ADXPeriod             =           14;  // Average Directional movement  period
int       ADXPrice              =  PRICE_CLOSE;  // ADX price

string    BULLS_Settings        = "=== BULLS Settings ===";
int       BULLSPeriod           =           13;  // Bulls Power  period
int       BULLSPrice            =  PRICE_CLOSE;  // Bulls Power price

string    BEARS_Settings        = "=== BEARS Settings ===";
int       BEARSPeriod           =           13;  // Bears Power  period
int       BEARSPrice            =  PRICE_CLOSE;  // Bears Power price

string    STOCHASTIC_Settings   = "=== STOCHASTIC Settings ===";
int       STOKPeriod            =            5;  // Stochastic %K  period
int       STODPeriod            =            3;  // Stochastic %D  period
int       STOSlowing            =            3;  // Stochastic slowing

string    RSI_Settings          = "=== RSI Settings ===";
int       RSIPeriod             =           14;  // RSI  period

string    FORCE_Settings        = "=== FORCE INDEX Settings ===";
int       FIPeriod              =           14;  // Force Index period
int       FIMethod              =     MODE_SMA;  // Force Index method
int       FIPrice               =  PRICE_CLOSE;  // Force Index price

string    MOMENTUM_Settings     = "=== MOMENTUM INDEX Settings ===";
int       MOMPeriod             =           14;  // Momentum period
int       MOMPrice              =  PRICE_CLOSE;  // Momentum price

string    DeMARKER_Settings     = "=== DeMARKER Settings ===";
int       DEMPeriod             =           14;  // DeMarker  period



int TimeZone=0;
bool pivots = true;
bool alert = true;

double yesterday_high=0;
double yesterday_open=0;
double yesterday_low=0;
double yesterday_close=0;
double today_open=0;
double today_high=0;
double today_low=0;

double rates_h1[2][6];
double rates_d1[2][6];
//+------------------------------------------------------------------+
 string StochsValues = "== Stochastic Oscillators ==";
 int Stoch_K = 14;
 int Stoch_D = 3;
 int Stoch_Slowing = 3;
 string MAvalues = "== Moving Averages ==";
 int MA_Period = 14;
 int MA_Shift = 0;
 string MACDvalues = "== MACD ==";
 int MACD_Period1 = 12;
 int MACD_Period2 = 26;
 int MACD_Period3 = 9;
 string MAXvalues = "== MA Xover ==";
 int FastLWMA = 3;
 int SlowSMA = 5;
 string PSARvalues = "== Parabolic SAR ==";
 double PSAR_Step = 0.02;
 double PSAR_Max = 0.2;
//+------------------------------------------------------------------+
void FerruFx()
{
   double UP_1, UP_2, UP_3, UP_4, UP_5, UP_6, UP_7, UP_8, UP_9, UP_10;
double UP_11, UP_12, UP_13, UP_14, UP_15, UP_16, UP_17, UP_18, UP_19, UP_20;
double UP_21, UP_22, UP_23, UP_24, UP_25, UP_26, UP_27, UP_28, UP_29, UP_30;
double UP_31, UP_32, UP_33, UP_34, UP_35, UP_36, UP_37, UP_38, UP_39, UP_40;
double UP_41, UP_42, UP_43, UP_44, UP_45, UP_46, UP_47, UP_48, UP_49, UP_50;
double UP_51, UP_52, UP_53, UP_54, UP_55, UP_56, UP_57, UP_58, UP_59, UP_60;
double UP_61, UP_62, UP_63, UP_64;

double DOWN_1, DOWN_2, DOWN_3, DOWN_4, DOWN_5, DOWN_6, DOWN_7, DOWN_8, DOWN_9, DOWN_10;
double DOWN_11, DOWN_12, DOWN_13, DOWN_14, DOWN_15, DOWN_16, DOWN_17, DOWN_18, DOWN_19, DOWN_20;
double DOWN_21, DOWN_22, DOWN_23, DOWN_24, DOWN_25, DOWN_26, DOWN_27, DOWN_28, DOWN_29, DOWN_30;
double DOWN_31, DOWN_32, DOWN_33, DOWN_34, DOWN_35, DOWN_36, DOWN_37, DOWN_38, DOWN_39, DOWN_40;
double DOWN_41, DOWN_42, DOWN_43, DOWN_44, DOWN_45, DOWN_46, DOWN_47, DOWN_48, DOWN_49, DOWN_50;
double DOWN_51, DOWN_52, DOWN_53, DOWN_54, DOWN_55, DOWN_56, DOWN_57, DOWN_58, DOWN_59, DOWN_60;
double DOWN_61, DOWN_62, DOWN_63, DOWN_64;

double UP_65, UP_66, UP_67, UP_68, UP_69, UP_70;
double UP_71, UP_72, UP_73, UP_74, UP_75, UP_76, UP_77, UP_78, UP_79, UP_80;
double UP_81, UP_82, UP_83, UP_84, UP_85, UP_86, UP_87, UP_88, UP_89, UP_90;
double UP_91, UP_92, UP_93, UP_94, UP_95, UP_96, UP_97, UP_98, UP_99, UP_100;
double UP_101, UP_102, UP_103, UP_104, UP_105, UP_106, UP_107, UP_108, UP_109, UP_110;
double UP_111, UP_112;

double DOWN_65, DOWN_66, DOWN_67, DOWN_68, DOWN_69, DOWN_70;
double DOWN_71, DOWN_72, DOWN_73, DOWN_74, DOWN_75, DOWN_76, DOWN_77, DOWN_78, DOWN_79, DOWN_80;
double DOWN_81, DOWN_82, DOWN_83, DOWN_84, DOWN_85, DOWN_86, DOWN_87, DOWN_88, DOWN_89, DOWN_90;
double DOWN_91, DOWN_92, DOWN_93, DOWN_94, DOWN_95, DOWN_96, DOWN_97, DOWN_98, DOWN_99, DOWN_100;
double DOWN_101, DOWN_102, DOWN_103, DOWN_104, DOWN_105, DOWN_106, DOWN_107, DOWN_108, DOWN_109, DOWN_110;
double DOWN_111, DOWN_112;
  
double count_m1, count_m5, count_m15, count_m30, count_h1, count_h4, count_d1;

  if ( display_M1 == true) { count_m1 = 1; }
  if ( display_M5 == true) { count_m5 = 1; }
  if ( display_M15 == true) { count_m15 = 1; }
  if ( display_M30 == true) { count_m30 = 1; }
  if ( display_H1 == true) { count_h1 = 1; }
  if ( display_H4 == true) { count_h4 = 1; }
  if ( display_D1 == true) { count_d1 = 1; }
  
  double count_tf = count_m1 + count_m5 + count_m15 + count_m30 + count_h1 + count_h4 + count_d1;
  double coef = coef_m1 + coef_m5 + coef_m15 + coef_m30 + coef_H1 + coef_H4 + coef_D1;
  if( coef != count_tf ) { Alert("The sum of the coefs must be ",  count_tf,". Your setting is ", coef,"!!!"); }
  
  
  int j,total=OrdersTotal();
   for(j=0;j<total;j++)
   {
    OrderSelect(j, SELECT_BY_POS, MODE_TRADES);
   }
   
   color color_common_line = White;
   color color_common_text = White;
   color color_connection;
   
   if( box_trade_analysis == true )
   {
   
//---- Timeframe and symbol

   string Timeframe = "";
   color color_timeframe=SkyBlue;
   
   double time_frame=Period();
   string symbol=Symbol();
   
   if(time_frame==1) { Timeframe = "M1"; }
   if(time_frame==5) { Timeframe = "M5"; }
   if(time_frame==15) { Timeframe = "M15"; }
   if(time_frame==30) { Timeframe = "M30"; }
   if(time_frame==60) { Timeframe = "H1"; }
   if(time_frame==240) { Timeframe = "H4"; }
   if(time_frame==1440) { Timeframe = "D1"; }
   if(time_frame==10080) { Timeframe = "W1"; }
   if(time_frame==43200) { Timeframe = "MN"; }
   
   int Xdist_timeframe, Ydist_timeframe;
   int Xdist_line;
   int Ydist_line1, Ydist_line2, Ydist_line3, Ydist_line4;
   int Xdist_text;
   int Xdist_value;
   int Xdist_stoploss, Ydist_stoploss, Ydist_stop;
   int Xdist_pipstostop, Ydist_pipstostop, Ydist_pipsstop;
   int Xdist_pipsprofit, Ydist_pipsprofit, Ydist_pips_profit;
   int Xdist_percentbalance, Ydist_percentbalance, Ydist_percent_profit;
   int Xdist_maxlot1, Ydist_maxlot1, Ydist_maxlot2;
    
    Xdist_timeframe = 10 + X_trade_analysis; Ydist_timeframe = 15 + (Y_analysis-15);
    Xdist_line = 2 + X_trade_analysis;
    Ydist_line1 = 27 + (Y_analysis-15); Ydist_line2 = 77 + (Y_analysis-15); Ydist_line3 = 117 + (Y_analysis-15); Ydist_line4= 140 + (Y_analysis-15);
    Xdist_text = 3 + X_trade_analysis;
    Xdist_value = 92 + X_trade_analysis;
    Ydist_stoploss = 43 + (Y_analysis-15); Ydist_stop = 43 + (Y_analysis-15);
    Ydist_pipstostop = 62 + (Y_analysis-15); Ydist_pipsstop = 62 + (Y_analysis-15);
    Ydist_pipsprofit = 88 + (Y_analysis-15); Ydist_pips_profit = 88 + (Y_analysis-15);
    Ydist_percentbalance = 106 + (Y_analysis-15); Ydist_percent_profit = 106 + (Y_analysis-15);
    Ydist_maxlot1 = 129 + (Y_analysis-15); Ydist_maxlot2 = 129 + (Y_analysis-15);
    
   ObjectCreate("timeframe", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("timeframe","+  "+symbol+"  "+Timeframe+"  +",9, "Verdana", color_timeframe);
   ObjectSet("timeframe", OBJPROP_CORNER, Global_Corner);
   ObjectSet("timeframe", OBJPROP_XDISTANCE, Xdist_timeframe);
   ObjectSet("timeframe", OBJPROP_YDISTANCE, Ydist_timeframe);
   
   ObjectCreate("line1", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("line1","--------------------------",7, "Verdana", color_common_line);
   ObjectSet("line1", OBJPROP_CORNER, Global_Corner);
   ObjectSet("line1", OBJPROP_XDISTANCE, Xdist_line);
   ObjectSet("line1", OBJPROP_YDISTANCE, Ydist_line1);
   
// Stop Loss
   
   ObjectCreate("stoploss", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("stoploss","Stop Loss",7, "Verdana", color_common_text);
   ObjectSet("stoploss", OBJPROP_CORNER, Global_Corner);
   ObjectSet("stoploss", OBJPROP_XDISTANCE, Xdist_text);
   ObjectSet("stoploss", OBJPROP_YDISTANCE, Ydist_stoploss);
   
   string Stop_Loss = "";
   color color_stop;
   
   if(OrderStopLoss() > 0) { Stop_Loss = DoubleToStr(OrderStopLoss(),2); color_stop = Orange; }
   if(total == 0 || OrderStopLoss() == 0) { Stop_Loss = "-------"; color_stop = Red; }
   
   ObjectCreate("Stop", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("Stop",Stop_Loss,7, "Verdana", color_stop);
   ObjectSet("Stop", OBJPROP_CORNER, Global_Corner);
   ObjectSet("Stop", OBJPROP_XDISTANCE, Xdist_value);
   ObjectSet("Stop", OBJPROP_YDISTANCE, Ydist_stop);
   
//---- Pips to reach the Stop Loss
   
   ObjectCreate("pipstostop", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("pipstostop","Pips to Stop",7, "Verdana", color_common_text);
   ObjectSet("pipstostop", OBJPROP_CORNER, Global_Corner);
   ObjectSet("pipstostop", OBJPROP_XDISTANCE, Xdist_text);
   ObjectSet("pipstostop", OBJPROP_YDISTANCE, Ydist_pipstostop);
   
   string Pips_To_Stop = "";
   color color_pips_stop;
     
   if(OrderStopLoss() > 0 && OrderType()==OP_BUY) { Pips_To_Stop = DoubleToStr((Bid - OrderStopLoss())*100,0)+" pips"; color_pips_stop = Orange; }
   if(OrderStopLoss() > 0 && OrderType()==OP_SELL) { Pips_To_Stop = DoubleToStr((OrderStopLoss() - Ask)*100,0)+" pips"; color_pips_stop = Orange; }
   if(total == 0 || OrderStopLoss() == 0) { Pips_To_Stop = "-------"; color_pips_stop = Red; }
   
   ObjectCreate("PipsStop", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("PipsStop",Pips_To_Stop,7, "Verdana", color_pips_stop);
   ObjectSet("PipsStop", OBJPROP_CORNER, Global_Corner);
   ObjectSet("PipsStop", OBJPROP_XDISTANCE, Xdist_value);
   ObjectSet("PipsStop", OBJPROP_YDISTANCE, Ydist_pipsstop);
   
   ObjectCreate("line2", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("line2","--------------------------",7, "Verdana", color_common_line);
   ObjectSet("line2", OBJPROP_CORNER, Global_Corner);
   ObjectSet("line2", OBJPROP_XDISTANCE, Xdist_line);
   ObjectSet("line2", OBJPROP_YDISTANCE, Ydist_line2);
   
//---- Pips Profit

   ObjectCreate("pipsprofit", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("pipsprofit","Pips Profit",7, "Verdana", color_common_text);
   ObjectSet("pipsprofit", OBJPROP_CORNER, Global_Corner);
   ObjectSet("pipsprofit", OBJPROP_XDISTANCE, Xdist_text);
   ObjectSet("pipsprofit", OBJPROP_YDISTANCE, Ydist_pipsprofit);

   string pips_profit = "";
   color color_pipsprofit;
   
   if(total == 0) { pips_profit = "-------"; color_pipsprofit = Red; }
   else
   {
    pips_profit = DoubleToStr((OrderProfit() / (OrderLots()*PipValue)),0) + " pips";
    if(StrToDouble(pips_profit) >= 0) { color_pipsprofit = Lime; }
    else {color_pipsprofit = Red; }
   }
   
   ObjectCreate("pips_profit", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("pips_profit",pips_profit,7, "Verdana", color_pipsprofit);
   ObjectSet("pips_profit", OBJPROP_CORNER, Global_Corner);
   ObjectSet("pips_profit", OBJPROP_XDISTANCE, Xdist_value);
   ObjectSet("pips_profit", OBJPROP_YDISTANCE, Ydist_pips_profit);   
     
//---- Percent of balance

   ObjectCreate("percentbalance", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("percentbalance","% of Balance",7, "Verdana", color_common_text);
   ObjectSet("percentbalance", OBJPROP_CORNER, Global_Corner);
   ObjectSet("percentbalance", OBJPROP_XDISTANCE, Xdist_text);
   ObjectSet("percentbalance", OBJPROP_YDISTANCE, Ydist_percentbalance);
   
   string percent_profit = "";
   color color_percentprofit;
   
   if(total == 0) { percent_profit = "-------"; color_percentprofit = Red; }
   else
   {
    percent_profit = DoubleToStr((((OrderProfit()-OrderSwap()) / AccountBalance())*100),2) + " %";
    if(StrToDouble(percent_profit) >= 0) { color_percentprofit = Lime; }
    else {color_percentprofit = Red; }
   }
   
   ObjectCreate("percent_profit", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("percent_profit",percent_profit,7, "Verdana", color_percentprofit);
   ObjectSet("percent_profit", OBJPROP_CORNER, Global_Corner);
   ObjectSet("percent_profit", OBJPROP_XDISTANCE, Xdist_value);
   ObjectSet("percent_profit", OBJPROP_YDISTANCE, Ydist_percent_profit);
   
   ObjectCreate("line3", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("line3","--------------------------",7, "Verdana", color_common_line);
   ObjectSet("line3", OBJPROP_CORNER, Global_Corner);
   ObjectSet("line3", OBJPROP_XDISTANCE, Xdist_line);
   ObjectSet("line3", OBJPROP_YDISTANCE, Ydist_line3);  
   
//---- Maximum Lot to trade

   ObjectCreate("maxlot1", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("maxlot1","Max lot to trade",7, "Verdana", color_common_text);
   ObjectSet("maxlot1", OBJPROP_CORNER, Global_Corner);
   ObjectSet("maxlot1", OBJPROP_XDISTANCE, Xdist_text);
   ObjectSet("maxlot1", OBJPROP_YDISTANCE, Ydist_maxlot1);
   
   string MaxLot = "";
   color color_maxlot = Orange;
   
   if(total>0)
   {
    if(AccountMini == true)
    {
     MaxLot = DoubleToStr((((AccountBalance()/10000)*LeverageToTrade)-OrderLots()),2);
    }
    else
    {
     MaxLot = DoubleToStr((((AccountBalance()/100000)*LeverageToTrade)-OrderLots()),2);
    }
   }
   else
   {
    if(AccountMini == true)
    {
     MaxLot = DoubleToStr((((AccountBalance()/10000)*LeverageToTrade)),2);
    }
    else
    {
     MaxLot = DoubleToStr((((AccountBalance()/100000)*LeverageToTrade)),2);
    }
   }
   
   ObjectCreate("maxlot2", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("maxlot2",MaxLot,7, "Verdana", color_maxlot);
   ObjectSet("maxlot2", OBJPROP_CORNER, Global_Corner);
   ObjectSet("maxlot2", OBJPROP_XDISTANCE, Xdist_value);
   ObjectSet("maxlot2", OBJPROP_YDISTANCE, Ydist_maxlot2);
   
   ObjectCreate("line4", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("line4","--------------------------",7, "Verdana", color_common_line);
   ObjectSet("line4", OBJPROP_CORNER, Global_Corner);
   ObjectSet("line4", OBJPROP_XDISTANCE, Xdist_line);
   ObjectSet("line4", OBJPROP_YDISTANCE, Ydist_line4);
   
  }   // if( box_trade_analysis == true )
  
   
// Shift calculation for indicators (tests only)

   double shift_1, shift_5, shift_15, shift_30, shift_60, shift_240, shift_1440, shift_10080;
   
   if( test == true )
   {
    shift_1=iBarShift(NULL,PERIOD_M1,look_time_shift,false);
    shift_5=iBarShift(NULL,PERIOD_M5,look_time_shift,false);
    shift_15=iBarShift(NULL,PERIOD_M15,look_time_shift,false);
    shift_30=iBarShift(NULL,PERIOD_M30,look_time_shift,false);
    shift_60=iBarShift(NULL,PERIOD_H1,look_time_shift,false);
    shift_240=iBarShift(NULL,PERIOD_H4,look_time_shift,false);
    shift_1440=iBarShift(NULL,PERIOD_D1,look_time_shift,false);
    shift_10080=iBarShift(NULL,PERIOD_W1,look_time_shift,false);
   }
   else
   {
    shift_1=shift_indicators;
    shift_5=shift_indicators;
    shift_15=shift_indicators;
    shift_30=shift_indicators;
    shift_60=shift_indicators;
    shift_240=shift_indicators;
    shift_1440=shift_indicators;
    shift_10080=shift_indicators;
   }
   
// Indicator (Moving Average)

   // FAST
   
   if( display_fast_MA == true )
   {
   if( display_M1 == true )
   {
   double FastMA_1_1 = iMA(NULL,PERIOD_M1,FastMAPeriod,0,MAMethod,MAPrice,shift_1);
   double FastMA_2_1 = iMA(NULL,PERIOD_M1,FastMAPeriod,0,MAMethod,MAPrice,shift_1+1);
   if ((FastMA_1_1 > FastMA_2_1)) { UP_1 = 1; DOWN_1 = 0; }
   if ((FastMA_1_1 < FastMA_2_1)) { UP_1 = 0; DOWN_1 = 1; }
   }
  
   if( display_M5 == true )
   {   
   double FastMA_1_5 = iMA(NULL,PERIOD_M5,FastMAPeriod,0,MAMethod,MAPrice,shift_5);
   double FastMA_2_5 = iMA(NULL,PERIOD_M5,FastMAPeriod,0,MAMethod,MAPrice,shift_5+1);
   if ((FastMA_1_5 > FastMA_2_5)) { UP_2 = 1; DOWN_2 = 0; }
   if ((FastMA_1_5 < FastMA_2_5)) { UP_2 = 0; DOWN_2 = 1; }
   }
   
   if( display_M15 == true )
   {   
   double FastMA_1_15 = iMA(NULL,PERIOD_M15,FastMAPeriod,0,MAMethod,MAPrice,shift_15);
   double FastMA_2_15 = iMA(NULL,PERIOD_M15,FastMAPeriod,0,MAMethod,MAPrice,shift_15+1);
   if ((FastMA_1_15 > FastMA_2_15)) { UP_3 = 1; DOWN_3 = 0; }
   if ((FastMA_1_15 < FastMA_2_15)) { UP_3 = 0; DOWN_3 = 1; }
   }
   
   if( display_M30 == true )
   {   
   double FastMA_1_30 = iMA(NULL,PERIOD_M30,FastMAPeriod,0,MAMethod,MAPrice,shift_30);
   double FastMA_2_30 = iMA(NULL,PERIOD_M30,FastMAPeriod,0,MAMethod,MAPrice,shift_30+1);
   if ((FastMA_1_30 > FastMA_2_30)) { UP_4 = 1; DOWN_4 = 0; }
   if ((FastMA_1_30 < FastMA_2_30)) { UP_4 = 0; DOWN_4 = 1; }
   }
   
   if( display_H1 == true )
   {  
   double FastMA_1_60 = iMA(NULL,PERIOD_H1,FastMAPeriod,0,MAMethod,MAPrice,shift_60);
   double FastMA_2_60 = iMA(NULL,PERIOD_H1,FastMAPeriod,0,MAMethod,MAPrice,shift_60+1);
   if ((FastMA_1_60 > FastMA_2_60)) { UP_5 = 1; DOWN_5 = 0; }
   if ((FastMA_1_60 < FastMA_2_60)) { UP_5 = 0; DOWN_5 = 1; }
   }
   
   if( display_H4 == true )
   {
   double FastMA_1_240 = iMA(NULL,PERIOD_H4,FastMAPeriod,0,MAMethod,MAPrice,shift_240);
   double FastMA_2_240 = iMA(NULL,PERIOD_H4,FastMAPeriod,0,MAMethod,MAPrice,shift_240+1);
   if ((FastMA_1_240 > FastMA_2_240)) { UP_6 = 1; DOWN_6 = 0; }
   if ((FastMA_1_240 < FastMA_2_240)) { UP_6 = 0; DOWN_6 = 1; }
   }
   
   if( display_D1 == true )
   {
   double FastMA_1_1440 = iMA(NULL,PERIOD_D1,FastMAPeriod,0,MAMethod,MAPrice,shift_1440);
   double FastMA_2_1440 = iMA(NULL,PERIOD_D1,FastMAPeriod,0,MAMethod,MAPrice,shift_1440+1);
   if ((FastMA_1_1440 > FastMA_2_1440)) { UP_7 = 1; DOWN_7 = 0; }
   if ((FastMA_1_1440 < FastMA_2_1440)) { UP_7 = 0; DOWN_7 = 1; }
   }
   }
   
   // MEDIUM
   
   if( display_medium_MA == true )
   {
   if( display_M1 == true )
   {
   double MediumMA_1_1 = iMA(NULL,PERIOD_M1,MediumMAPeriod,0,MAMethod,MAPrice,shift_1);
   double MediumMA_2_1 = iMA(NULL,PERIOD_M1,MediumMAPeriod,0,MAMethod,MAPrice,shift_1+1);
   if ((MediumMA_1_1 > MediumMA_2_1)) { UP_9 = 1; DOWN_9 = 0; }
   if ((MediumMA_1_1 < MediumMA_2_1)) { UP_9 = 0; DOWN_9 = 1; }
   }
   
   if( display_M5 == true )
   {
   double MediumMA_1_5 = iMA(NULL,PERIOD_M5,MediumMAPeriod,0,MAMethod,MAPrice,shift_5);
   double MediumMA_2_5 = iMA(NULL,PERIOD_M5,MediumMAPeriod,0,MAMethod,MAPrice,shift_5+1);
   if ((MediumMA_1_5 > MediumMA_2_5)) { UP_10 = 1; DOWN_10 = 0; }
   if ((MediumMA_1_5 < MediumMA_2_5)) { UP_10 = 0; DOWN_10 = 1; }
   }
   
   if( display_M15 == true )
   {
   double MediumMA_1_15 = iMA(NULL,PERIOD_M15,MediumMAPeriod,0,MAMethod,MAPrice,shift_15);
   double MediumMA_2_15 = iMA(NULL,PERIOD_M15,MediumMAPeriod,0,MAMethod,MAPrice,shift_15+1);
   if ((MediumMA_1_15 > MediumMA_2_15)) { UP_11 = 1; DOWN_11 = 0; }
   if ((MediumMA_1_15 < MediumMA_2_15)) { UP_11 = 0; DOWN_11 = 1; }
   }
   
   if( display_M30 == true )
   {
   double MediumMA_1_30 = iMA(NULL,PERIOD_M30,MediumMAPeriod,0,MAMethod,MAPrice,shift_30);
   double MediumMA_2_30 = iMA(NULL,PERIOD_M30,MediumMAPeriod,0,MAMethod,MAPrice,shift_30+1);
   if ((MediumMA_1_30 > MediumMA_2_30)) { UP_12 = 1; DOWN_12 = 0; }
   if ((MediumMA_1_30 < MediumMA_2_30)) { UP_12 = 0; DOWN_12 = 1; }
   }
   
   if( display_H1 == true )
   {
   double MediumMA_1_60 = iMA(NULL,PERIOD_H1,MediumMAPeriod,0,MAMethod,MAPrice,shift_60);
   double MediumMA_2_60 = iMA(NULL,PERIOD_H1,MediumMAPeriod,0,MAMethod,MAPrice,shift_60+1);
   if ((MediumMA_1_60 > MediumMA_2_60)) { UP_13 = 1; DOWN_13 = 0; }
   if ((MediumMA_1_60 < MediumMA_2_60)) { UP_13 = 0; DOWN_13 = 1; }
   }
   
   if( display_H4 == true )
   {
   double MediumMA_1_240 = iMA(NULL,PERIOD_H4,MediumMAPeriod,0,MAMethod,MAPrice,shift_240);
   double MediumMA_2_240 = iMA(NULL,PERIOD_H4,MediumMAPeriod,0,MAMethod,MAPrice,shift_240+1);
   if ((MediumMA_1_240 > MediumMA_2_240)) { UP_14 = 1; DOWN_14 = 0; }
   if ((MediumMA_1_240 < MediumMA_2_240)) { UP_14 = 0; DOWN_14 = 1; }
   }
   
   if( display_D1 == true )
   {
   double MediumMA_1_1440 = iMA(NULL,PERIOD_D1,MediumMAPeriod,0,MAMethod,MAPrice,shift_1440);
   double MediumMA_2_1440 = iMA(NULL,PERIOD_D1,MediumMAPeriod,0,MAMethod,MAPrice,shift_1440+1);
   if ((MediumMA_1_1440 > MediumMA_2_1440)) { UP_15 = 1; DOWN_15 = 0; }
   if ((MediumMA_1_1440 < MediumMA_2_1440)) { UP_15 = 0; DOWN_15 = 1; }
   }
   }
   
   // SLOW
   
   if( display_slow_MA == true )
   {
   if( display_M1 == true )
   {
   double SlowMA_1_1 = iMA(NULL,PERIOD_M1,SlowMAPeriod,0,MAMethod,MAPrice,shift_1);
   double SlowMA_2_1 = iMA(NULL,PERIOD_M1,SlowMAPeriod,0,MAMethod,MAPrice,shift_1+1);
   if ((SlowMA_1_1 > SlowMA_2_1)) { UP_17 = 1; DOWN_17 = 0; }
   if ((SlowMA_1_1 < SlowMA_2_1)) { UP_17 = 0; DOWN_17 = 1; }
   }
   
   if( display_M5 == true )
   {
   double SlowMA_1_5 = iMA(NULL,PERIOD_M5,SlowMAPeriod,0,MAMethod,MAPrice,shift_5);
   double SlowMA_2_5 = iMA(NULL,PERIOD_M5,SlowMAPeriod,0,MAMethod,MAPrice,shift_5+1);
   if ((SlowMA_1_5 > SlowMA_2_5)) { UP_18 = 1; DOWN_18 = 0; }
   if ((SlowMA_1_5 < SlowMA_2_5)) { UP_18 = 0; DOWN_18 = 1; }
   }
   
   if( display_M15 == true )
   {
   double SlowMA_1_15 = iMA(NULL,PERIOD_M15,SlowMAPeriod,0,MAMethod,MAPrice,shift_15);
   double SlowMA_2_15 = iMA(NULL,PERIOD_M15,SlowMAPeriod,0,MAMethod,MAPrice,shift_15+1);
   if ((SlowMA_1_15 > SlowMA_2_15)) { UP_19 = 1; DOWN_19 = 0; }
   if ((SlowMA_1_15 < SlowMA_2_15)) { UP_19 = 0; DOWN_19 = 1; }
   }
   
   if( display_M30 == true )
   {
   double SlowMA_1_30 = iMA(NULL,PERIOD_M30,SlowMAPeriod,0,MAMethod,MAPrice,shift_30);
   double SlowMA_2_30 = iMA(NULL,PERIOD_M30,SlowMAPeriod,0,MAMethod,MAPrice,shift_30+1);
   if ((SlowMA_1_30 > SlowMA_2_30)) { UP_20 = 1; DOWN_20 = 0; }
   if ((SlowMA_1_30 < SlowMA_2_30)) { UP_20 = 0; DOWN_20 = 1; }
   }
   
   if( display_H1 == true )
   {
   double SlowMA_1_60 = iMA(NULL,PERIOD_H1,SlowMAPeriod,0,MAMethod,MAPrice,shift_60);
   double SlowMA_2_60 = iMA(NULL,PERIOD_H1,SlowMAPeriod,0,MAMethod,MAPrice,shift_60+1);
   if ((SlowMA_1_60 > SlowMA_2_60)) { UP_21 = 1; DOWN_21 = 0; }
   if ((SlowMA_1_60 < SlowMA_2_60)) { UP_21 = 0; DOWN_21 = 1; }
   }
   
   if( display_H4 == true )
   {
   double SlowMA_1_240 = iMA(NULL,PERIOD_H4,SlowMAPeriod,0,MAMethod,MAPrice,shift_240);
   double SlowMA_2_240 = iMA(NULL,PERIOD_H4,SlowMAPeriod,0,MAMethod,MAPrice,shift_240+1);
   if ((SlowMA_1_240 > SlowMA_2_240)) { UP_22 = 1; DOWN_22 = 0; }
   if ((SlowMA_1_240 < SlowMA_2_240)) { UP_22 = 0; DOWN_22 = 1; }
   }
   
   if( display_D1 == true )
   {
   double SlowMA_1_1440 = iMA(NULL,PERIOD_D1,SlowMAPeriod,0,MAMethod,MAPrice,shift_1440);
   double SlowMA_2_1440 = iMA(NULL,PERIOD_D1,SlowMAPeriod,0,MAMethod,MAPrice,shift_1440+1);
   if ((SlowMA_1_1440 > SlowMA_2_1440)) { UP_23 = 1; DOWN_23 = 0; }
   if ((SlowMA_1_1440 < SlowMA_2_1440)) { UP_23 = 0; DOWN_23 = 1; }
   }
   }
   
// Indicator (CCI)
   
   if( display_CCI == true )
   {
   if( display_M1 == true )
   {
   double CCI_1=iCCI(NULL,PERIOD_M1,CCIPeriod,CCIPrice,shift_1);
   if ((CCI_1 > 0)) { UP_25 = 1; DOWN_25 = 0; }
   if ((CCI_1 < 0)) { UP_25 = 0; DOWN_25 = 1; }
   }
   
   if( display_M5 == true )
   {
   double CCI_5=iCCI(NULL,PERIOD_M5,CCIPeriod,CCIPrice,shift_5);
   if ((CCI_5 > 0)) { UP_26 = 1; DOWN_26 = 0; }
   if ((CCI_5 < 0)) { UP_26 = 0; DOWN_26 = 1; }
   }
   
   if( display_M15 == true )
   {
   double CCI_15=iCCI(NULL,PERIOD_M15,CCIPeriod,CCIPrice,shift_15);
   if ((CCI_15 > 0)) { UP_27 = 1; DOWN_27 = 0; }
   if ((CCI_15 < 0)) { UP_27 = 0; DOWN_27 = 1; }
   }
   
   if( display_M30 == true )
   {
   double CCI_30=iCCI(NULL,PERIOD_M30,CCIPeriod,CCIPrice,shift_30);
   if ((CCI_30 > 0)) { UP_28 = 1; DOWN_28 = 0; }
   if ((CCI_30 < 0)) { UP_28 = 0; DOWN_28 = 1; }
   }
   
   if( display_H1 == true )
   {
   double CCI_60=iCCI(NULL,PERIOD_H1,CCIPeriod,CCIPrice,shift_60);
   if ((CCI_60 > 0)) { UP_29 = 1; DOWN_29 = 0; }
   if ((CCI_60 < 0)) { UP_29 = 0; DOWN_29 = 1; }
   }
   
   if( display_H4 == true )
   {
   double CCI_240=iCCI(NULL,PERIOD_H4,CCIPeriod,CCIPrice,shift_240);
   if ((CCI_240 > 0)) { UP_30 = 1; DOWN_30 = 0; }
   if ((CCI_240 < 0)) { UP_30 = 0; DOWN_30 = 1; }
   }
   
   if( display_D1 == true )
   {
   double CCI_1440=iCCI(NULL,PERIOD_D1,CCIPeriod,CCIPrice,shift_1440);
   if ((CCI_1440 > 0)) { UP_31 = 1; DOWN_31 = 0; }
   if ((CCI_1440 < 0)) { UP_31 = 0; DOWN_31 = 1; }
   }
   }
   
// Indicator (MACD)
   
   if( display_MACD == true )
   {
   if( display_M1 == true )
   {
   double MACD_m_1=iMACD(NULL,PERIOD_M1,MACDFast,MACDSlow,MACDSignal,PRICE_CLOSE,MODE_MAIN,shift_1);
   double MACD_s_1=iMACD(NULL,PERIOD_M1,MACDFast,MACDSlow,MACDSignal,PRICE_CLOSE,MODE_SIGNAL,shift_1);
   if ((MACD_m_1 > MACD_s_1)) { UP_33 = 1; DOWN_33 = 0; }
   if ((MACD_m_1 < MACD_s_1)) { UP_33 = 0; DOWN_33 = 1; }
   }
   
   if( display_M5 == true )
   {
   double MACD_m_5=iMACD(NULL,PERIOD_M5,MACDFast,MACDSlow,MACDSignal,PRICE_CLOSE,MODE_MAIN,shift_5);
   double MACD_s_5=iMACD(NULL,PERIOD_M5,MACDFast,MACDSlow,MACDSignal,PRICE_CLOSE,MODE_SIGNAL,shift_5);
   if ((MACD_m_5 > MACD_s_5)) { UP_34 = 1; DOWN_34 = 0; }
   if ((MACD_m_5 < MACD_s_5)) { UP_34 = 0; DOWN_34 = 1; }
   }
   
   if( display_M15 == true )
   {
   double MACD_m_15=iMACD(NULL,PERIOD_M15,MACDFast,MACDSlow,MACDSignal,PRICE_CLOSE,MODE_MAIN,shift_15);
   double MACD_s_15=iMACD(NULL,PERIOD_M15,MACDFast,MACDSlow,MACDSignal,PRICE_CLOSE,MODE_SIGNAL,shift_15);
   if ((MACD_m_15 > MACD_s_15)) { UP_35 = 1; DOWN_35 = 0; }
   if ((MACD_m_15 < MACD_s_15)) { UP_35 = 0; DOWN_35 = 1; }
   }
   
   if( display_M30 == true )
   {
   double MACD_m_30=iMACD(NULL,PERIOD_M30,MACDFast,MACDSlow,MACDSignal,PRICE_CLOSE,MODE_MAIN,shift_30);
   double MACD_s_30=iMACD(NULL,PERIOD_M30,MACDFast,MACDSlow,MACDSignal,PRICE_CLOSE,MODE_SIGNAL,shift_30);
   if ((MACD_m_30 > MACD_s_30)) { UP_36 = 1; DOWN_36 = 0; }
   if ((MACD_m_30 < MACD_s_30)) { UP_36 = 0; DOWN_36 = 1; }
   }
   
   if( display_H1 == true )
   {
   double MACD_m_60=iMACD(NULL,PERIOD_H1,MACDFast,MACDSlow,MACDSignal,PRICE_CLOSE,MODE_MAIN,shift_60);
   double MACD_s_60=iMACD(NULL,PERIOD_H1,MACDFast,MACDSlow,MACDSignal,PRICE_CLOSE,MODE_SIGNAL,shift_60);
   if ((MACD_m_60 > MACD_s_60)) { UP_37 = 1; DOWN_37 = 0; }
   if ((MACD_m_60 < MACD_s_60)) { UP_37 = 0; DOWN_37 = 1; }
   }
   
   if( display_H4 == true )
   {
   double MACD_m_240=iMACD(NULL,PERIOD_H4,MACDFast,MACDSlow,MACDSignal,PRICE_CLOSE,MODE_MAIN,shift_240);
   double MACD_s_240=iMACD(NULL,PERIOD_H4,MACDFast,MACDSlow,MACDSignal,PRICE_CLOSE,MODE_SIGNAL,shift_240);
   if ((MACD_m_240 > MACD_s_240)) { UP_38 = 1; DOWN_38 = 0; }
   if ((MACD_m_240 < MACD_s_240)) { UP_38 = 0; DOWN_38 = 1; }
   }
   
   if( display_D1 == true )
   {
   double MACD_m_1440=iMACD(NULL,PERIOD_D1,MACDFast,MACDSlow,MACDSignal,PRICE_CLOSE,MODE_MAIN,shift_1440);
   double MACD_s_1440=iMACD(NULL,PERIOD_D1,MACDFast,MACDSlow,MACDSignal,PRICE_CLOSE,MODE_SIGNAL,shift_1440);
   if ((MACD_m_1440 > MACD_s_1440)) { UP_39 = 1; DOWN_39 = 0; }
   if ((MACD_m_1440 < MACD_s_1440)) { UP_39 = 0; DOWN_39 = 1; }
   }
   }
   
// Indicator (ADX)
   
   if( display_ADX == true )
   {
   if( display_M1 == true )
   {
   double ADX_plus_1=iADX(NULL,PERIOD_M1,ADXPeriod,ADXPrice,MODE_PLUSDI,shift_1);
   double ADX_minus_1=iADX(NULL,PERIOD_M1,ADXPeriod,ADXPrice,MODE_MINUSDI,shift_1);
   if ((ADX_plus_1 > ADX_minus_1)) { UP_41 = 1; DOWN_41 = 0; }
   if ((ADX_plus_1 < ADX_minus_1)) { UP_41 = 0; DOWN_41 = 1; }
   }
   
   if( display_M5 == true )
   {
   double ADX_plus_5=iADX(NULL,PERIOD_M5,ADXPeriod,ADXPrice,MODE_PLUSDI,shift_5);
   double ADX_minus_5=iADX(NULL,PERIOD_M5,ADXPeriod,ADXPrice,MODE_MINUSDI,shift_5);
   if ((ADX_plus_5 > ADX_minus_5)) { UP_42 = 1; DOWN_42 = 0; }
   if ((ADX_plus_5 < ADX_minus_5)) { UP_42 = 0; DOWN_42 = 1; }
   }
   
   if( display_M15 == true )
   {
   double ADX_plus_15=iADX(NULL,PERIOD_M15,ADXPeriod,ADXPrice,MODE_PLUSDI,shift_15);
   double ADX_minus_15=iADX(NULL,PERIOD_M15,ADXPeriod,ADXPrice,MODE_MINUSDI,shift_15);
   if ((ADX_plus_15 > ADX_minus_15)) { UP_43 = 1; DOWN_43 = 0; }
   if ((ADX_plus_15 < ADX_minus_15)) { UP_43 = 0; DOWN_43 = 1; }
   }
   
   if( display_M30 == true )
   {
   double ADX_plus_30=iADX(NULL,PERIOD_M30,ADXPeriod,ADXPrice,MODE_PLUSDI,shift_30);
   double ADX_minus_30=iADX(NULL,PERIOD_M30,ADXPeriod,ADXPrice,MODE_MINUSDI,shift_30);
   if ((ADX_plus_30 > ADX_minus_30)) { UP_44 = 1; DOWN_44 = 0; }
   if ((ADX_plus_30 < ADX_minus_30)) { UP_44 = 0; DOWN_44 = 1; }
   }
   
   if( display_H1 == true )
   {
   double ADX_plus_60=iADX(NULL,PERIOD_H1,ADXPeriod,ADXPrice,MODE_PLUSDI,shift_60);
   double ADX_minus_60=iADX(NULL,PERIOD_H1,ADXPeriod,ADXPrice,MODE_MINUSDI,shift_60);
   if ((ADX_plus_60 > ADX_minus_60)) { UP_45 = 1; DOWN_45 = 0; }
   if ((ADX_plus_60 < ADX_minus_60)) { UP_45 = 0; DOWN_45 = 1; }
   }
   
   if( display_H4 == true )
   {
   double ADX_plus_240=iADX(NULL,PERIOD_H4,ADXPeriod,ADXPrice,MODE_PLUSDI,shift_240);
   double ADX_minus_240=iADX(NULL,PERIOD_H4,ADXPeriod,ADXPrice,MODE_MINUSDI,shift_240);
   if ((ADX_plus_240 > ADX_minus_240)) { UP_46 = 1; DOWN_46 = 0; }
   if ((ADX_plus_240 < ADX_minus_240)) { UP_46 = 0; DOWN_46 = 1; }
   }
   
   if( display_D1 == true )
   {
   double ADX_plus_1440=iADX(NULL,PERIOD_D1,ADXPeriod,ADXPrice,MODE_PLUSDI,shift_1440);
   double ADX_minus_1440=iADX(NULL,PERIOD_D1,ADXPeriod,ADXPrice,MODE_MINUSDI,shift_1440);
   if ((ADX_plus_1440 > ADX_minus_1440)) { UP_47 = 1; DOWN_47 = 0; }
   if ((ADX_plus_1440 < ADX_minus_1440)) { UP_47 = 0; DOWN_47 = 1; }
   }
   }
   
// Indicator (BULLS)
   
   if( display_BULLS == true )
   {
   if( display_M1 == true )
   {
   double bulls_1=iBullsPower(NULL,PERIOD_M1,BULLSPeriod,BULLSPrice,shift_1);
   if ((bulls_1 > 0)) { UP_49 = 1; DOWN_49 = 0; }
   if ((bulls_1 < 0)) { UP_49 = 0; DOWN_49 = 1; }
   }
   
   if( display_M5 == true )
   {
   double bulls_5=iBullsPower(NULL,PERIOD_M5,BULLSPeriod,BULLSPrice,shift_5);
   if ((bulls_5 > 0)) { UP_50 = 1; DOWN_50 = 0; }
   if ((bulls_5 < 0)) { UP_50 = 0; DOWN_50 = 1; }
   }
   
   if( display_M15 == true )
   {
   double bulls_15=iBullsPower(NULL,PERIOD_M15,BULLSPeriod,BULLSPrice,shift_15);
   if ((bulls_15 > 0)) { UP_51 = 1; DOWN_51 = 0; }
   if ((bulls_15 < 0)) { UP_51 = 0; DOWN_51 = 1; }
   }
   
   if( display_M30 == true )
   {
   double bulls_30=iBullsPower(NULL,PERIOD_M30,BULLSPeriod,BULLSPrice,shift_30);
   if ((bulls_30 > 0)) { UP_52 = 1; DOWN_52 = 0; }
   if ((bulls_30 < 0)) { UP_52 = 0; DOWN_52 = 1; }
   }
   
   if( display_H1 == true )
   {
   double bulls_60=iBullsPower(NULL,PERIOD_H1,BULLSPeriod,BULLSPrice,shift_60);
   if ((bulls_60 > 0)) { UP_53 = 1; DOWN_53 = 0; }
   if ((bulls_60 < 0)) { UP_53 = 0; DOWN_53 = 1; }
   }
   
   if( display_H4 == true )
   {
   double bulls_240=iBullsPower(NULL,PERIOD_H4,BULLSPeriod,BULLSPrice,shift_240);
   if ((bulls_240 > 0)) { UP_54 = 1; DOWN_54 = 0; }
   if ((bulls_240 < 0)) { UP_54 = 0; DOWN_54 = 1; }
   }
   
   if( display_D1 == true )
   {
   double bulls_1440=iBullsPower(NULL,PERIOD_D1,BULLSPeriod,BULLSPrice,shift_1440);
   if ((bulls_1440 > 0)) { UP_55 = 1; DOWN_55 = 0; }
   if ((bulls_1440 < 0)) { UP_55 = 0; DOWN_55 = 1; }
   }
   }
   
// Indicator (BEARS)
   
   if( display_BEARS == true )
   {
   if( display_M1 == true )
   {
   double bears_1=iBearsPower(NULL,PERIOD_M1,BEARSPeriod,BEARSPrice,shift_1);
   if ((bears_1 > 0)) { UP_57 = 1; DOWN_57 = 0; }
   if ((bears_1 < 0)) { UP_57 = 0; DOWN_57 = 1; }
   }
   
   if( display_M5 == true )
   {
   double bears_5=iBearsPower(NULL,PERIOD_M5,BEARSPeriod,BEARSPrice,shift_5);
   if ((bears_5 > 0)) { UP_58 = 1; DOWN_58 = 0; }
   if ((bears_5 < 0)) { UP_58 = 0; DOWN_58 = 1; }
   }
   
   if( display_M15 == true )
   {
   double bears_15=iBearsPower(NULL,PERIOD_M15,BEARSPeriod,BEARSPrice,shift_15);
   if ((bears_15 > 0)) { UP_59 = 1; DOWN_59 = 0; }
   if ((bears_15 < 0)) { UP_59 = 0; DOWN_59 = 1; }
   }
   
   if( display_M30 == true )
   {
   double bears_30=iBearsPower(NULL,PERIOD_M30,BEARSPeriod,BEARSPrice,shift_30);
   if ((bears_30 > 0)) { UP_60 = 1; DOWN_60 = 0; }
   if ((bears_30 < 0)) { UP_60 = 0; DOWN_60 = 1; }
   }
   
   if( display_H1 == true )
   {
   double bears_60=iBearsPower(NULL,PERIOD_H1,BEARSPeriod,BEARSPrice,shift_60);
   if ((bears_60 > 0)) { UP_61 = 1; DOWN_61 = 0; }
   if ((bears_60 < 0)) { UP_61 = 0; DOWN_61 = 1; }
   }
   
   if( display_H4 == true )
   {
   double bears_240=iBearsPower(NULL,PERIOD_H4,BEARSPeriod,BEARSPrice,shift_240);
   if ((bears_240 > 0)) { UP_62 = 1; DOWN_62 = 0; }
   if ((bears_240 < 0)) { UP_62 = 0; DOWN_62 = 1; }
   }
   
   if( display_D1 == true )
   {
   double bears_1440=iBearsPower(NULL,PERIOD_D1,BEARSPeriod,BEARSPrice,shift_1440);
   if ((bears_1440 > 0)) { UP_63 = 1; DOWN_63 = 0; }
   if ((bears_1440 < 0)) { UP_63 = 0; DOWN_63 = 1; }
   }
   }
   
// Indicator (STOCH)

   if( display_STOCH == true )
   {
   if( display_M1 == true )
   {
   double stoch_m_1=iStochastic(NULL,PERIOD_M1,STOKPeriod,STODPeriod,STOSlowing,MODE_SMA,1,MODE_MAIN,shift_1);
   double stoch_s_1=iStochastic(NULL,PERIOD_M1,STOKPeriod,STODPeriod,STOSlowing,MODE_SMA,1,MODE_SIGNAL,shift_1);
   if (stoch_m_1 >= stoch_s_1) { UP_65 = 1; DOWN_65 = 0; }
   if (stoch_m_1 < stoch_s_1) { UP_65 = 0; DOWN_65 = 1; }
   }
   
   if( display_M5 == true )
   {
   double stoch_m_5=iStochastic(NULL,PERIOD_M5,STOKPeriod,STODPeriod,STOSlowing,MODE_SMA,1,MODE_MAIN,shift_5);
   double stoch_s_5=iStochastic(NULL,PERIOD_M5,STOKPeriod,STODPeriod,STOSlowing,MODE_SMA,1,MODE_SIGNAL,shift_5);
   if (stoch_m_5 >= stoch_s_5) { UP_66 = 1; DOWN_66 = 0; }
   if (stoch_m_5 < stoch_s_5) { UP_66 = 0; DOWN_66 = 1; }
   }
   
   if( display_M15 == true )
   {
   double stoch_m_15=iStochastic(NULL,PERIOD_M15,STOKPeriod,STODPeriod,STOSlowing,MODE_SMA,1,MODE_MAIN,shift_15);
   double stoch_s_15=iStochastic(NULL,PERIOD_M15,STOKPeriod,STODPeriod,STOSlowing,MODE_SMA,1,MODE_SIGNAL,shift_15);
   if (stoch_m_15 >= stoch_s_15) { UP_67 = 1; DOWN_67 = 0; }
   if (stoch_m_15 < stoch_s_15) { UP_67 = 0; DOWN_67 = 1; }
   }
   
   if( display_M30 == true )
   {
   double stoch_m_30=iStochastic(NULL,PERIOD_M30,STOKPeriod,STODPeriod,STOSlowing,MODE_SMA,1,MODE_MAIN,shift_30);
   double stoch_s_30=iStochastic(NULL,PERIOD_M30,STOKPeriod,STODPeriod,STOSlowing,MODE_SMA,1,MODE_SIGNAL,shift_30);
   if (stoch_m_30 >= stoch_s_30) { UP_68 = 1; DOWN_68 = 0; }
   if (stoch_m_30 < stoch_s_30) { UP_68 = 0; DOWN_68 = 1; }
   }
   
   if( display_H1 == true )
   {
   double stoch_m_60=iStochastic(NULL,PERIOD_H1,STOKPeriod,STODPeriod,STOSlowing,MODE_SMA,1,MODE_MAIN,shift_60);
   double stoch_s_60=iStochastic(NULL,PERIOD_H1,STOKPeriod,STODPeriod,STOSlowing,MODE_SMA,1,MODE_SIGNAL,shift_60);
   if (stoch_m_60 >= stoch_s_60) { UP_69 = 1; DOWN_69 = 0; }
   if (stoch_m_60 < stoch_s_60) { UP_69 = 0; DOWN_69 = 1; }
   }
   
   if( display_H4 == true )
   {
   double stoch_m_240=iStochastic(NULL,PERIOD_H4,STOKPeriod,STODPeriod,STOSlowing,MODE_SMA,1,MODE_MAIN,shift_240);
   double stoch_s_240=iStochastic(NULL,PERIOD_H4,STOKPeriod,STODPeriod,STOSlowing,MODE_SMA,1,MODE_SIGNAL,shift_240);
   if (stoch_m_240 >= stoch_s_240) { UP_70 = 1; DOWN_70 = 0; }
   if (stoch_m_240 < stoch_s_240) { UP_70 = 0; DOWN_70 = 1; }
   }
   
   if( display_D1 == true )
   {
   double stoch_m_1440=iStochastic(NULL,PERIOD_D1,STOKPeriod,STODPeriod,STOSlowing,MODE_SMA,1,MODE_MAIN,shift_1440);
   double stoch_s_1440=iStochastic(NULL,PERIOD_D1,STOKPeriod,STODPeriod,STOSlowing,MODE_SMA,1,MODE_SIGNAL,shift_1440);
   if (stoch_m_1440 >= stoch_s_1440) { UP_71 = 1; DOWN_71 = 0; }
   if (stoch_m_1440 < stoch_s_1440) { UP_71 = 0; DOWN_71 = 1; }
   }
   }
   
// Indicator (RSI)
   
   if( display_RSI == true )
   {
   if( display_M1 == true )
   {
   double rsi_1=iRSI(NULL,PERIOD_M1,RSIPeriod,PRICE_CLOSE,shift_1);
   if (rsi_1 >= 50) { UP_73 = 1; DOWN_73 = 0; }
   if (rsi_1 < 50) { UP_73 = 0; DOWN_73 = 1; }
   }
   
   if( display_M5 == true )
   {
   double rsi_5=iRSI(NULL,PERIOD_M5,RSIPeriod,PRICE_CLOSE,shift_5);
   if (rsi_5 >= 50) { UP_74 = 1; DOWN_74 = 0; }
   if (rsi_5 < 50) { UP_74 = 0; DOWN_74 = 1; }
   }
   
   if( display_M15 == true )
   {
   double rsi_15=iRSI(NULL,PERIOD_M15,RSIPeriod,PRICE_CLOSE,shift_15);
   if (rsi_15 >= 50) { UP_75 = 1; DOWN_75 = 0; }
   if (rsi_15 < 50) { UP_75 = 0; DOWN_75 = 1; }
   }
   
   if( display_M30 == true )
   {
   double rsi_30=iRSI(NULL,PERIOD_M30,RSIPeriod,PRICE_CLOSE,shift_30);
   if (rsi_30 >= 50) { UP_76 = 1; DOWN_76 = 0; }
   if (rsi_30 < 50) { UP_76 = 0; DOWN_76 = 1; }
   }
   
   if( display_H1 == true )
   {
   double rsi_60=iRSI(NULL,PERIOD_H1,RSIPeriod,PRICE_CLOSE,shift_60);
   if (rsi_60 >= 50) { UP_77 = 1; DOWN_77 = 0; }
   if (rsi_60 < 50) { UP_77 = 0; DOWN_77 = 1; }
   }
   
   if( display_H4 == true )
   {
   double rsi_240=iRSI(NULL,PERIOD_H4,RSIPeriod,PRICE_CLOSE,shift_240);
   if (rsi_240 >= 50) { UP_78 = 1; DOWN_78 = 0; }
   if (rsi_240 < 50) { UP_78 = 0; DOWN_78 = 1; }
   }
   
   if( display_D1 == true )
   {
   double rsi_1440=iRSI(NULL,PERIOD_D1,RSIPeriod,PRICE_CLOSE,shift_1440);
   if (rsi_1440 >= 50) { UP_79 = 1; DOWN_79 = 0; }
   if (rsi_1440 < 50) { UP_79 = 0; DOWN_79 = 1; }
   }
   }
   
// Indicator (FORCE INDEX)
   
   if( display_FORCE == true )
   {
   if( display_M1 == true )
   {
   double fi_1=iForce(NULL,PERIOD_M1,FIPeriod,FIMethod,FIPrice,shift_1);
   if (fi_1 >= 0) { UP_81 = 1; DOWN_81 = 0; }
   if (fi_1 < 0) { UP_81 = 0; DOWN_81 = 1; }
   }
   
   if( display_M5 == true )
   {
   double fi_5=iForce(NULL,PERIOD_M5,FIPeriod,FIMethod,FIPrice,shift_5);
   if (fi_5 >= 0) { UP_82 = 1; DOWN_82 = 0; }
   if (fi_5 < 0) { UP_82 = 0; DOWN_82 = 1; }
   }
   
   if( display_M15 == true )
   {
   double fi_15=iForce(NULL,PERIOD_M15,FIPeriod,FIMethod,FIPrice,shift_15);
   if (fi_15 >= 0) { UP_83 = 1; DOWN_83 = 0; }
   if (fi_15 < 0) { UP_83 = 0; DOWN_83 = 1; }
   }
   
   if( display_M30 == true )
   {
   double fi_30=iForce(NULL,PERIOD_M30,FIPeriod,FIMethod,FIPrice,shift_30);
   if (fi_30 >= 0) { UP_84 = 1; DOWN_84 = 0; }
   if (fi_30 < 0) { UP_84 = 0; DOWN_84 = 1; }
   }
   
   if( display_H1 == true )
   {
   double fi_60=iForce(NULL,PERIOD_H1,FIPeriod,FIMethod,FIPrice,shift_60);
   if (fi_60 >= 0) { UP_85 = 1; DOWN_85 = 0; }
   if (fi_60 < 0) { UP_85 = 0; DOWN_85 = 1; }
   }
   
   if( display_H4 == true )
   {
   double fi_240=iForce(NULL,PERIOD_H4,FIPeriod,FIMethod,FIPrice,shift_240);
   if (fi_240 >= 0) { UP_86 = 1; DOWN_86 = 0; }
   if (fi_240 < 0) { UP_86 = 0; DOWN_86 = 1; }
   }
   
   if( display_D1 == true )
   {
   double fi_1440=iForce(NULL,PERIOD_D1,FIPeriod,FIMethod,FIPrice,shift_1440);
   if (fi_1440 >= 0) { UP_87 = 1; DOWN_87 = 0; }
   if (fi_1440 < 0) { UP_87 = 0; DOWN_87 = 1; }
   }
   }
   
// Indicator (MOMENTUM)
   
   if( display_MOMENTUM == true )
   {
   if( display_M1 == true )
   {
   double momentum_1=iMomentum(NULL,PERIOD_M1,MOMPeriod,MOMPrice,shift_1);
   if (momentum_1 >= 100) { UP_89 = 1; DOWN_89 = 0; }
   if (momentum_1 < 100) { UP_89 = 0; DOWN_89 = 1; }
   }
   
   if( display_M5 == true )
   {
   double momentum_5=iMomentum(NULL,PERIOD_M5,MOMPeriod,MOMPrice,shift_5);
   if (momentum_5 >= 100) { UP_90 = 1; DOWN_90 = 0; }
   if (momentum_5 < 100) { UP_90 = 0; DOWN_90 = 1; }
   }
   
   if( display_M15 == true )
   {
   double momentum_15=iMomentum(NULL,PERIOD_M15,MOMPeriod,MOMPrice,shift_15);
   if (momentum_15 >= 100) { UP_91 = 1; DOWN_91 = 0; }
   if (momentum_15 < 100) { UP_91 = 0; DOWN_91 = 1; }
   }
   
   if( display_M30 == true )
   {
   double momentum_30=iMomentum(NULL,PERIOD_M30,MOMPeriod,MOMPrice,shift_30);
   if (momentum_30 >= 100) { UP_92 = 1; DOWN_92 = 0; }
   if (momentum_30 < 100) { UP_92 = 0; DOWN_92 = 1; }
   }
   
   if( display_H1 == true )
   {
   double momentum_60=iMomentum(NULL,PERIOD_H1,MOMPeriod,MOMPrice,shift_60);
   if (momentum_60 >= 100) { UP_93 = 1; DOWN_93 = 0; }
   if (momentum_60 < 100) { UP_93 = 0; DOWN_93 = 1; }
   }
   
   if( display_H4 == true )
   {
   double momentum_240=iMomentum(NULL,PERIOD_H4,MOMPeriod,MOMPrice,shift_240);
   if (momentum_240 >= 100) { UP_94 = 1; DOWN_94 = 0; }
   if (momentum_240 < 100) { UP_94 = 0; DOWN_94 = 1; }
   }
   
   if( display_D1 == true )
   {
   double momentum_1440=iMomentum(NULL,PERIOD_D1,MOMPeriod,MOMPrice,shift_1440);
   if (momentum_1440 >= 100) { UP_95 = 1; DOWN_95 = 0; }
   if (momentum_1440 < 100) { UP_95 = 0; DOWN_95 = 1; }
   }
   }
   
// Indicator (DE MARKER)
   
   
   if( display_DeMARKER == true )
   {
   if( display_M1 == true )
   {
   double demarker_1_0=iDeMarker(NULL,PERIOD_M1,DEMPeriod,shift_1);
   double demarker_1_1=iDeMarker(NULL,PERIOD_M1,DEMPeriod,shift_1+1);
   if (demarker_1_0 >= demarker_1_1) { UP_97 = 1; DOWN_97 = 0; }
   if (demarker_1_0 < demarker_1_1) { UP_97 = 0; DOWN_97 = 1; }
   }
   
   if( display_M5 == true )
   {
   double demarker_5_0=iDeMarker(NULL,PERIOD_M5,DEMPeriod,shift_5);
   double demarker_5_1=iDeMarker(NULL,PERIOD_M5,DEMPeriod,shift_5+1);
   if (demarker_5_0 >= demarker_5_1) { UP_98 = 1; DOWN_98 = 0; }
   if (demarker_5_0 < demarker_5_1) { UP_98 = 0; DOWN_98 = 1; }
   }
   
   if( display_M15 == true )
   {
   double demarker_15_0=iDeMarker(NULL,PERIOD_M15,DEMPeriod,shift_15);
   double demarker_15_1=iDeMarker(NULL,PERIOD_M15,DEMPeriod,shift_15+1);
   if (demarker_15_0 >= demarker_15_1) { UP_99 = 1; DOWN_99 = 0; }
   if (demarker_15_0 < demarker_15_1) { UP_99 = 0; DOWN_99 = 1; }
   }
   
   if( display_M30 == true )
   {
   double demarker_30_0=iDeMarker(NULL,PERIOD_M30,DEMPeriod,shift_30);
   double demarker_30_1=iDeMarker(NULL,PERIOD_M30,DEMPeriod,shift_30+1);
   if (demarker_30_0 >= demarker_30_1) { UP_100 = 1; DOWN_100 = 0; }
   if (demarker_30_0 < demarker_30_1) { UP_100 = 0; DOWN_100 = 1; }
   }
   
   if( display_H1 == true )
   {
   double demarker_60_0=iDeMarker(NULL,PERIOD_H1,DEMPeriod,shift_60);
   double demarker_60_1=iDeMarker(NULL,PERIOD_H1,DEMPeriod,shift_60+1);
   if (demarker_60_0 >= demarker_60_1) { UP_101 = 1; DOWN_101 = 0; }
   if (demarker_60_0 < demarker_60_1) { UP_101 = 0; DOWN_101 = 1; }
   }
   
   if( display_H4 == true )
   {
   double demarker_240_0=iDeMarker(NULL,PERIOD_H4,DEMPeriod,shift_240);
   double demarker_240_1=iDeMarker(NULL,PERIOD_H4,DEMPeriod,shift_240+1);
   if (demarker_240_0 >= demarker_240_1) { UP_102 = 1; DOWN_102 = 0; }
   if (demarker_240_0 < demarker_240_1) { UP_102 = 0; DOWN_102 = 1; }
   }
   
   if( display_D1 == true )
   {
   double demarker_1440_0=iDeMarker(NULL,PERIOD_D1,DEMPeriod,shift_1440);
   double demarker_1440_1=iDeMarker(NULL,PERIOD_D1,DEMPeriod,shift_1440+1);
   if (demarker_1440_0 >= demarker_1440_1) { UP_103 = 1; DOWN_103 = 0; }
   if (demarker_1440_0 < demarker_1440_1) { UP_103 = 0; DOWN_103 = 1; }
   }
   }
   
// Indicator (Waddah Attar Explosion)
   
   if( display_WAE == true )
   {
   if( display_M1 == true )
   {
   double wae_histo_up_1_0 = iCustom(NULL,PERIOD_M1,"Waddah_Attar_Explosion",150,30,15,15,false,1,true,true,true,true,0,shift_1);
   double wae_histo_up_1_1 = iCustom(NULL,PERIOD_M1,"Waddah_Attar_Explosion",150,30,15,15,false,1,true,true,true,true,0,shift_1+1);
   double wae_histo_down_1_0 = iCustom(NULL,PERIOD_M1,"Waddah_Attar_Explosion",150,30,15,15,false,1,true,true,true,true,1,shift_1);
   double wae_histo_down_1_1 = iCustom(NULL,PERIOD_M1,"Waddah_Attar_Explosion",150,30,15,15,false,1,true,true,true,true,1,shift_1+1);
   if (wae_histo_up_1_0 > wae_histo_up_1_1 || wae_histo_down_1_0 < wae_histo_down_1_1) { UP_105 = 1; DOWN_105 = 0; }
   if (wae_histo_up_1_0 < wae_histo_up_1_1 || wae_histo_down_1_0 > wae_histo_down_1_1) { UP_105 = 0; DOWN_105 = 1; }
   }
   
   if( display_M5 == true )
   {
   double wae_histo_up_5_0 = iCustom(NULL,PERIOD_M5,"Waddah_Attar_Explosion",150,30,15,15,false,1,true,true,true,true,0,shift_5);
   double wae_histo_up_5_1 = iCustom(NULL,PERIOD_M5,"Waddah_Attar_Explosion",150,30,15,15,false,1,true,true,true,true,0,shift_5+1);
   double wae_histo_down_5_0 = iCustom(NULL,PERIOD_M5,"Waddah_Attar_Explosion",150,30,15,15,false,1,true,true,true,true,1,shift_5);
   double wae_histo_down_5_1 = iCustom(NULL,PERIOD_M5,"Waddah_Attar_Explosion",150,30,15,15,false,1,true,true,true,true,1,shift_5+1);
   if (wae_histo_up_5_0 > wae_histo_up_5_1 || wae_histo_down_5_0 < wae_histo_down_5_1) { UP_106 = 1; DOWN_106 = 0; }
   if (wae_histo_up_5_0 < wae_histo_up_5_1 || wae_histo_down_5_0 > wae_histo_down_5_1) { UP_106 = 0; DOWN_106 = 1; }
   }
   
   if( display_M15 == true )
   {
   double wae_histo_up_15_0 = iCustom(NULL,PERIOD_M15,"Waddah_Attar_Explosion",150,30,15,15,false,1,true,true,true,true,0,shift_15);
   double wae_histo_up_15_1 = iCustom(NULL,PERIOD_M15,"Waddah_Attar_Explosion",150,30,15,15,false,1,true,true,true,true,0,shift_15+1);
   double wae_histo_down_15_0 = iCustom(NULL,PERIOD_M15,"Waddah_Attar_Explosion",150,30,15,15,false,1,true,true,true,true,1,shift_15);
   double wae_histo_down_15_1 = iCustom(NULL,PERIOD_M15,"Waddah_Attar_Explosion",150,30,15,15,false,1,true,true,true,true,1,shift_15+1);
   if (wae_histo_up_15_0 > wae_histo_up_15_1 || wae_histo_down_15_0 < wae_histo_down_15_1) { UP_107 = 1; DOWN_107 = 0; }
   if (wae_histo_up_15_0 < wae_histo_up_15_1 || wae_histo_down_15_0 > wae_histo_down_15_1) { UP_107 = 0; DOWN_107 = 1; }
   }
   
   if( display_M30 == true )
   {
   double wae_histo_up_30_0 = iCustom(NULL,PERIOD_M30,"Waddah_Attar_Explosion",150,30,15,15,false,1,true,true,true,true,0,shift_30);
   double wae_histo_up_30_1 = iCustom(NULL,PERIOD_M30,"Waddah_Attar_Explosion",150,30,15,15,false,1,true,true,true,true,0,shift_30+1);
   double wae_histo_down_30_0 = iCustom(NULL,PERIOD_M30,"Waddah_Attar_Explosion",150,30,15,15,false,1,true,true,true,true,1,shift_30);
   double wae_histo_down_30_1 = iCustom(NULL,PERIOD_M30,"Waddah_Attar_Explosion",150,30,15,15,false,1,true,true,true,true,1,shift_30+1);
   if (wae_histo_up_30_0 > wae_histo_up_30_1 || wae_histo_down_30_0 < wae_histo_down_30_1) { UP_108 = 1; DOWN_108 = 0; }
   if (wae_histo_up_30_0 < wae_histo_up_30_1 || wae_histo_down_30_0 > wae_histo_down_30_1) { UP_108 = 0; DOWN_108 = 1; }
   }
   
   if( display_H1 == true )
   {
   double wae_histo_up_60_0 = iCustom(NULL,PERIOD_H1,"Waddah_Attar_Explosion",150,30,15,15,false,1,true,true,true,true,0,shift_60);
   double wae_histo_up_60_1 = iCustom(NULL,PERIOD_H1,"Waddah_Attar_Explosion",150,30,15,15,false,1,true,true,true,true,0,shift_60+1);
   double wae_histo_down_60_0 = iCustom(NULL,PERIOD_H1,"Waddah_Attar_Explosion",150,30,15,15,false,1,true,true,true,true,1,shift_60);
   double wae_histo_down_60_1 = iCustom(NULL,PERIOD_H1,"Waddah_Attar_Explosion",150,30,15,15,false,1,true,true,true,true,1,shift_60+1);
   if (wae_histo_up_60_0 > wae_histo_up_60_1 || wae_histo_down_60_0 < wae_histo_down_60_1) { UP_109 = 1; DOWN_109 = 0; }
   if (wae_histo_up_60_0 < wae_histo_up_60_1 || wae_histo_down_60_0 > wae_histo_down_60_1) { UP_109 = 0; DOWN_109 = 1; }
   }
   
   if( display_H4 == true )
   {
   double wae_histo_up_240_0 = iCustom(NULL,PERIOD_H4,"Waddah_Attar_Explosion",150,30,15,15,false,1,true,true,true,true,0,shift_240);
   double wae_histo_up_240_1 = iCustom(NULL,PERIOD_H4,"Waddah_Attar_Explosion",150,30,15,15,false,1,true,true,true,true,0,shift_240+1);
   double wae_histo_down_240_0 = iCustom(NULL,PERIOD_H4,"Waddah_Attar_Explosion",150,30,15,15,false,1,true,true,true,true,1,shift_240);
   double wae_histo_down_240_1 = iCustom(NULL,PERIOD_H4,"Waddah_Attar_Explosion",150,30,15,15,false,1,true,true,true,true,1,shift_240+1);
   if (wae_histo_up_240_0 > wae_histo_up_240_1 || wae_histo_down_240_0 < wae_histo_down_240_1) { UP_110 = 1; DOWN_110 = 0; }
   if (wae_histo_up_240_0 < wae_histo_up_240_1 || wae_histo_down_240_0 > wae_histo_down_240_1) { UP_110 = 0; DOWN_110 = 1; }
   }
   
   if( display_D1 == true )
   {
   double wae_histo_up_1440_0 = iCustom(NULL,PERIOD_D1,"Waddah_Attar_Explosion",150,30,15,15,false,1,true,true,true,true,0,shift_1440);
   double wae_histo_up_1440_1 = iCustom(NULL,PERIOD_D1,"Waddah_Attar_Explosion",150,30,15,15,false,1,true,true,true,true,0,shift_1440+1);
   double wae_histo_down_1440_0 = iCustom(NULL,PERIOD_D1,"Waddah_Attar_Explosion",150,30,15,15,false,1,true,true,true,true,1,shift_1440);
   double wae_histo_down_1440_1 = iCustom(NULL,PERIOD_D1,"Waddah_Attar_Explosion",150,30,15,15,false,1,true,true,true,true,1,shift_1440+1);
   if (wae_histo_up_1440_0 > wae_histo_up_1440_1 || wae_histo_down_1440_0 < wae_histo_down_1440_1) { UP_111 = 1; DOWN_111 = 0; }
   if (wae_histo_up_1440_0 < wae_histo_up_1440_1 || wae_histo_down_1440_0 > wae_histo_down_1440_1) { UP_111 = 0; DOWN_111 = 1; }
   }
   }

//---- Count Indicators

   double Indy_count = UP_1 + UP_9 + UP_17 + UP_25 + UP_33 + UP_41 + UP_49 + UP_57 + UP_65 + UP_73 + UP_81 + UP_89 + UP_97 + UP_105
                     + UP_2 + UP_10 + UP_18 + UP_26 + UP_34 + UP_42 + UP_50 + UP_58 + UP_66 + UP_74 + UP_82 + UP_90 + UP_98 + UP_106
                     + UP_3 + UP_11 + UP_19 + UP_27 + UP_35 + UP_43 + UP_51 + UP_59 + UP_67 + UP_75 + UP_83 + UP_91 + UP_99 + UP_107
                     + UP_4 + UP_12 + UP_20 + UP_28 + UP_36 + UP_44 + UP_52 + UP_60 + UP_68 + UP_76 + UP_84 + UP_92 + UP_100 + UP_108
                     + UP_5 + UP_13 + UP_21 + UP_29 + UP_37 + UP_45 + UP_53 + UP_61 + UP_69 + UP_77 + UP_85 + UP_93 + UP_101 + UP_109
                     + UP_6 + UP_14 + UP_22 + UP_30 + UP_38 + UP_46 + UP_54 + UP_62 + UP_70 + UP_78 + UP_86 + UP_94 + UP_102 + UP_110
                     + UP_7 + UP_15 + UP_23 + UP_31 + UP_39 + UP_47 + UP_55 + UP_63 + UP_71 + UP_79 + UP_87 + UP_95 + UP_103 + UP_111
                     + DOWN_1 + DOWN_9 + DOWN_17 + DOWN_25 + DOWN_33 + DOWN_41 + DOWN_49 + DOWN_57 + DOWN_65 + DOWN_73 + DOWN_81 + DOWN_89 + DOWN_97 + DOWN_105
                     + DOWN_2 + DOWN_10 + DOWN_18 + DOWN_26 + DOWN_34 + DOWN_42 + DOWN_50 + DOWN_58 + DOWN_66 + DOWN_74 + DOWN_82 + DOWN_90 + DOWN_98 + DOWN_106
                     + DOWN_3 + DOWN_11 + DOWN_19 + DOWN_27 + DOWN_35 + DOWN_43 + DOWN_51 + DOWN_59 + DOWN_67 + DOWN_75 + DOWN_83 + DOWN_91 + DOWN_99 + DOWN_107
                     + DOWN_4 + DOWN_12 + DOWN_20 + DOWN_28 + DOWN_36 + DOWN_44 + DOWN_52 + DOWN_60 + DOWN_68 + DOWN_76 + DOWN_84 + DOWN_92 + DOWN_100 + DOWN_108
                     + DOWN_5 + DOWN_13 + DOWN_21 + DOWN_29 + DOWN_37 + DOWN_45 + DOWN_53 + DOWN_61 + DOWN_69 + DOWN_77 + DOWN_85 + DOWN_93 + DOWN_101 + DOWN_109
                     + DOWN_6 + DOWN_14 + DOWN_22 + DOWN_30 + DOWN_38 + DOWN_46 + DOWN_54 + DOWN_62 + DOWN_70 + DOWN_78 + DOWN_86 + DOWN_94 + DOWN_102 + DOWN_110
                     + DOWN_7 + DOWN_15 + DOWN_23 + DOWN_31 + DOWN_39 + DOWN_47 + DOWN_55 + DOWN_63 + DOWN_71 + DOWN_79 + DOWN_87 + DOWN_95 + DOWN_103 + DOWN_111;
                       
//---- Calculation of the trend. Let's give TFs more "force"
   
   double UP_m1 = (UP_1 + UP_9 + UP_17 + UP_25 + UP_33 + UP_41 + UP_49 + UP_57 + UP_65 + UP_73 + UP_81 + UP_89 + UP_97 + UP_105) * coef_m1;
   double UP_m5 = (UP_2 + UP_10 + UP_18 + UP_26 + UP_34 + UP_42 + UP_50 + UP_58 + UP_66 + UP_74 + UP_82 + UP_90 + UP_98 + UP_106) * coef_m5;
   double UP_m15 = (UP_3 + UP_11 + UP_19 + UP_27 + UP_35 + UP_43 + UP_51 + UP_59 + UP_67 + UP_75 + UP_83 + UP_91 + UP_99 + UP_107) * coef_m15;
   double UP_m30 = (UP_4 + UP_12 + UP_20 + UP_28 + UP_36 + UP_44 + UP_52 + UP_60 + UP_68 + UP_76 + UP_84 + UP_92 + UP_100 + UP_108) * coef_m30;
   double UP_H1 = (UP_5 + UP_13 + UP_21 + UP_29 + UP_37 + UP_45 + UP_53 + UP_61 + UP_69 + UP_77 + UP_85 + UP_93 + UP_101 + UP_109) * coef_H1;
   double UP_H4 = (UP_6 + UP_14 + UP_22 + UP_30 + UP_38 + UP_46 + UP_54 + UP_62 + UP_70 + UP_78 + UP_86 + UP_94 + UP_102 + UP_110) * coef_H4;
   double UP_D1 = (UP_7 + UP_15 + UP_23 + UP_31 + UP_39 + UP_47 + UP_55 + UP_63 + UP_71 + UP_79 + UP_87 + UP_95 + UP_103 + UP_111) * coef_D1;
   
   double TrendUP = UP_m1 + UP_m5 + UP_m15 + UP_m30 + UP_H1 + UP_H4 + UP_D1;
   
   double DOWN_m1 = (DOWN_1 + DOWN_9 + DOWN_17 + DOWN_25 + DOWN_33 + DOWN_41 + DOWN_49 + DOWN_57 + DOWN_65 + DOWN_73 + DOWN_81 + DOWN_89 + DOWN_97 + DOWN_105) * coef_m1;
   double DOWN_m5 = (DOWN_2 + DOWN_10 + DOWN_18 + DOWN_26 + DOWN_34 + DOWN_42 + DOWN_50 + DOWN_58 + DOWN_66 + DOWN_74 + DOWN_82 + DOWN_90 + DOWN_98 + DOWN_106) * coef_m5;
   double DOWN_m15 = (DOWN_3 + DOWN_11 + DOWN_19 + DOWN_27 + DOWN_35 + DOWN_43 + DOWN_51 + DOWN_59 + DOWN_67 + DOWN_75 + DOWN_83 + DOWN_91 + DOWN_99 + DOWN_107) * coef_m15;
   double DOWN_m30 = (DOWN_4 + DOWN_12 + DOWN_20 + DOWN_28 + DOWN_36 + DOWN_44 + DOWN_52 + DOWN_60 + DOWN_68 + DOWN_76 + DOWN_84 + DOWN_92 + DOWN_100 + DOWN_108) * coef_m30;
   double DOWN_H1 = (DOWN_5 + DOWN_13 + DOWN_21 + DOWN_29 + DOWN_37 + DOWN_45 + DOWN_53 + DOWN_61 + DOWN_69 + DOWN_77 + DOWN_85 + DOWN_93 + DOWN_101 + DOWN_109) * coef_H1;
   double DOWN_H4 = (DOWN_6 + DOWN_14 + DOWN_22 + DOWN_30 + DOWN_38 + DOWN_46 + DOWN_54 + DOWN_62 + DOWN_70 + DOWN_78 + DOWN_86 + DOWN_94 + DOWN_102 + DOWN_110) * coef_H4;
   double DOWN_D1 = (DOWN_7 + DOWN_15 + DOWN_23 + DOWN_31 + DOWN_39 + DOWN_47 + DOWN_55 + DOWN_63 + DOWN_71 + DOWN_79 + DOWN_87 + DOWN_95 + DOWN_103 + DOWN_111) * coef_D1;
   
   double TrendDOWN = DOWN_m1 + DOWN_m5 + DOWN_m15 + DOWN_m30 + DOWN_H1 + DOWN_H4 + DOWN_D1;
   
   string Trend_UP = DoubleToStr(((TrendUP/Indy_count)*100),0);
   string Trend_DOWN = DoubleToStr((100 - StrToDouble(Trend_UP)),0);
                                  
   // UPBuffer[0] = Trend_UP;
   // DOWNBuffer[0] = Trend_DOWN;
   
//---- Result of the trend
   
   int xloc;
   int yloc;
   ChartTimePriceToXY(0, 0, Time[0], Bid, xloc, yloc);
   int height = ChartGetInteger(0,CHART_HEIGHT_IN_PIXELS,0);
   int Y_trend = MathMin(MathMax(((height-yloc)+eY_trend-87), 5), (height-140));

   int trend_corner = 1;
   if( box_trend == true )
   {
   
   ObjectCreate("Trend_UP", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("Trend_UP","+   Trend   +",9, "Verdana", DarkOrange);
   ObjectSet("Trend_UP", OBJPROP_CORNER, Global_Corner);
   ObjectSet("Trend_UP", OBJPROP_XDISTANCE, 908+X_trend-900);
   ObjectSet("Trend_UP", OBJPROP_YDISTANCE, 1+Y_trend);
   
   ObjectCreate("line9", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("line9","----------------",8, "Verdana", DarkOrange);
   ObjectSet("line9", OBJPROP_CORNER, Global_Corner);
   ObjectSet("line9", OBJPROP_XDISTANCE, 907+X_trend-900);
   ObjectSet("line9", OBJPROP_YDISTANCE, 12+Y_trend);
   
   ObjectCreate("Trend_UP_text", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("Trend_UP_text","UP",9, "Verdana", Lime);
   ObjectSet("Trend_UP_text", OBJPROP_CORNER, Global_Corner);
   ObjectSet("Trend_UP_text", OBJPROP_XDISTANCE, 909+X_trend-900);
   ObjectSet("Trend_UP_text", OBJPROP_YDISTANCE, 26+Y_trend);
   
   ObjectCreate("Trend_UP_value", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("Trend_UP_value",Trend_UP+"%",9, "Verdana", PeachPuff);
   ObjectSet("Trend_UP_value", OBJPROP_CORNER, Global_Corner);
   ObjectSet("Trend_UP_value", OBJPROP_XDISTANCE, 955+X_trend-900);
   ObjectSet("Trend_UP_value", OBJPROP_YDISTANCE, 26+Y_trend);
   
   ObjectCreate("Trend_DOWN_text", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("Trend_DOWN_text","DOWN",9, "Verdana", Red);
   ObjectSet("Trend_DOWN_text", OBJPROP_CORNER, Global_Corner);
   ObjectSet("Trend_DOWN_text", OBJPROP_XDISTANCE, 909+X_trend-900);
   ObjectSet("Trend_DOWN_text", OBJPROP_YDISTANCE, 46+Y_trend);
   
   ObjectCreate("Trend_DOWN_value", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("Trend_DOWN_value",Trend_DOWN+"%",9, "Verdana", PeachPuff);
   ObjectSet("Trend_DOWN_value", OBJPROP_CORNER, Global_Corner);
   ObjectSet("Trend_DOWN_value", OBJPROP_XDISTANCE, 955+X_trend-900);
   ObjectSet("Trend_DOWN_value", OBJPROP_YDISTANCE, 46+Y_trend);
   
   string trend;
   string comment;
   color coltrend;
   color colcomment;
   double xt, xc;
   
   if(StrToDouble(Trend_UP) >= TrendStrongLevel) { trend = "UP"; coltrend = Lime; xt = 935; comment = "[strong]"; xc = 921; colcomment = Lime; /* if (alert == true) { Alert(TimeToStr(TimeCurrent(),TIME_SECONDS)," Trend UP > "TrendStrongLevel"% on ",Symbol()," ", Bid); PlaySound("tick.wav"); } */ }
   else if(StrToDouble(Trend_UP) < TrendStrongLevel && StrToDouble(Trend_UP) >= 50) { trend = "UP"; coltrend = Lime; xt = 935; comment = "[weak]"; xc = 924; colcomment = Orange; }
   else if(StrToDouble(Trend_DOWN) >= TrendStrongLevel) { trend = "DOWN"; coltrend = Red; xt = 918; comment = "[strong]"; xc = 921; colcomment = Red; /* if (alert == true) { Alert(TimeToStr(TimeCurrent(),TIME_SECONDS)," Trend DOWN > "TrendStrongLevel"% on ",Symbol()," ", Bid); PlaySound("tick.wav"); } */ }
   else if(StrToDouble(Trend_DOWN) < TrendStrongLevel && StrToDouble(Trend_DOWN) > 50) { trend = "DOWN"; coltrend = Red; xt = 918; comment = "[weak]"; xc = 924; colcomment = Orange; }
   
   ObjectCreate("line10", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("line10","----------------",8, "Verdana", coltrend);
   ObjectSet("line10", OBJPROP_CORNER, Global_Corner);
   ObjectSet("line10", OBJPROP_XDISTANCE, 907+X_trend-900);
   ObjectSet("line10", OBJPROP_YDISTANCE, 61+Y_trend);
   
   ObjectCreate("line12", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("line12","----------------",8, "Verdana", coltrend);
   ObjectSet("line12", OBJPROP_CORNER, Global_Corner);
   ObjectSet("line12", OBJPROP_XDISTANCE, 907+X_trend-900);
   ObjectSet("line12", OBJPROP_YDISTANCE, 64+Y_trend);
   
   ObjectCreate("Trend", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("Trend",trend,18, "Impact", coltrend);
   ObjectSet("Trend", OBJPROP_CORNER, Global_Corner);
   ObjectSet("Trend", OBJPROP_XDISTANCE, xt+X_trend-900);
   ObjectSet("Trend", OBJPROP_YDISTANCE, 76+Y_trend);
   
   ObjectCreate("Trend_comment", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("Trend_comment",comment,10, "Verdana", colcomment);
   ObjectSet("Trend_comment", OBJPROP_CORNER, Global_Corner);
   ObjectSet("Trend_comment", OBJPROP_XDISTANCE, xc+X_trend-900);
   ObjectSet("Trend_comment", OBJPROP_YDISTANCE, 106+Y_trend);
   
   ObjectCreate("line13", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("line13","----------------",8, "Verdana", coltrend);
   ObjectSet("line13", OBJPROP_CORNER, Global_Corner);
   ObjectSet("line13", OBJPROP_XDISTANCE, 907+X_trend-900);
   ObjectSet("line13", OBJPROP_YDISTANCE, 123+Y_trend);
   
   ObjectCreate("line11", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("line11","----------------",8, "Verdana", coltrend);
   ObjectSet("line11", OBJPROP_CORNER, Global_Corner);
   ObjectSet("line11", OBJPROP_XDISTANCE, 907+X_trend-900);
   ObjectSet("line11", OBJPROP_YDISTANCE, 126+Y_trend);
   
   }   // if( box_trend == true )
   
   
// DAILY PIVOTS AND RANGE
   
//---- Get new daily prices

   ArrayCopyRates(rates_d1, Symbol(), PERIOD_D1);
   
//---- modifs ibfx
   int offset = 0;
   if(DayOfWeek()==1) offset=1;
//----

   double day50_high = rates_d1[50+offset][3];
   double day50_low = rates_d1[50+offset][2]; 
   double day49_high = rates_d1[49+offset][3];
   double day49_low = rates_d1[49+offset][2]; 
   double day48_high = rates_d1[48+offset][3];
   double day48_low = rates_d1[48+offset][2]; 
   double day47_high = rates_d1[47+offset][3];
   double day47_low = rates_d1[47+offset][2]; 
   double day46_high = rates_d1[46+offset][3];
   double day46_low = rates_d1[46+offset][2]; 
   double day45_high = rates_d1[45+offset][3];
   double day45_low = rates_d1[45+offset][2]; 
   double day44_high = rates_d1[44+offset][3];
   double day44_low = rates_d1[44+offset][2]; 
   double day43_high = rates_d1[43+offset][3];
   double day43_low = rates_d1[43+offset][2]; 
   double day42_high = rates_d1[42+offset][3];
   double day42_low = rates_d1[42+offset][2]; 
   double day41_high = rates_d1[41+offset][3];
   double day41_low = rates_d1[41+offset][2]; 
   double day40_high = rates_d1[40+offset][3];
   double day40_low = rates_d1[40+offset][2]; 
   double day39_high = rates_d1[39+offset][3];
   double day39_low = rates_d1[39+offset][2]; 
   double day38_high = rates_d1[38+offset][3];
   double day38_low = rates_d1[38+offset][2]; 
   double day37_high = rates_d1[37+offset][3];
   double day37_low = rates_d1[37+offset][2]; 
   double day36_high = rates_d1[36+offset][3];
   double day36_low = rates_d1[36+offset][2]; 
   double day35_high = rates_d1[35+offset][3];
   double day35_low = rates_d1[35+offset][2]; 
   double day34_high = rates_d1[34+offset][3];
   double day34_low = rates_d1[34+offset][2]; 
   double day33_high = rates_d1[33+offset][3];
   double day33_low = rates_d1[33+offset][2]; 
   double day32_high = rates_d1[32+offset][3];
   double day32_low = rates_d1[32+offset][2]; 
   double day31_high = rates_d1[31+offset][3];
   double day31_low = rates_d1[31+offset][2]; 
   double day30_high = rates_d1[30+offset][3];
   double day30_low = rates_d1[30+offset][2]; 
   double day29_high = rates_d1[29+offset][3];
   double day29_low = rates_d1[29+offset][2]; 
   double day28_high = rates_d1[28+offset][3];
   double day28_low = rates_d1[28+offset][2]; 
   double day27_high = rates_d1[27+offset][3];
   double day27_low = rates_d1[27+offset][2]; 
   double day26_high = rates_d1[26+offset][3];
   double day26_low = rates_d1[26+offset][2]; 
   double day25_high = rates_d1[25+offset][3];
   double day25_low = rates_d1[25+offset][2]; 
   double day24_high = rates_d1[24+offset][3];
   double day24_low = rates_d1[24+offset][2]; 
   double day23_high = rates_d1[23+offset][3];
   double day23_low = rates_d1[23+offset][2]; 
   double day22_high = rates_d1[22+offset][3];
   double day22_low = rates_d1[22+offset][2]; 
   double day21_high = rates_d1[21+offset][3];
   double day21_low = rates_d1[21+offset][2]; 
   double day20_high = rates_d1[20+offset][3];
   double day20_low = rates_d1[20+offset][2]; 
   double day19_high = rates_d1[19+offset][3];
   double day19_low = rates_d1[19+offset][2]; 
   double day18_high = rates_d1[18+offset][3];
   double day18_low = rates_d1[18+offset][2]; 
   double day17_high = rates_d1[17+offset][3];
   double day17_low = rates_d1[17+offset][2]; 
   double day16_high = rates_d1[16+offset][3];
   double day16_low = rates_d1[16+offset][2]; 
   double day15_high = rates_d1[15+offset][3];
   double day15_low = rates_d1[15+offset][2]; 
   double day14_high = rates_d1[14+offset][3];
   double day14_low = rates_d1[14+offset][2]; 
   double day13_high = rates_d1[13+offset][3];
   double day13_low = rates_d1[13+offset][2]; 
   double day12_high = rates_d1[12+offset][3];
   double day12_low = rates_d1[12+offset][2]; 
   double day11_high = rates_d1[11+offset][3];
   double day11_low = rates_d1[11+offset][2]; 
   double day10_high = rates_d1[10+offset][3];
   double day10_low = rates_d1[10+offset][2]; 
   double day9_high = rates_d1[9+offset][3];
   double day9_low = rates_d1[9+offset][2];
   double day8_high = rates_d1[8+offset][3];
   double day8_low = rates_d1[8+offset][2]; 
   double day7_high = rates_d1[7+offset][3];
   double day7_low = rates_d1[7+offset][2]; 
   double day6_high = rates_d1[6+offset][3];
   double day6_low = rates_d1[6+offset][2]; 
   double day5_high = rates_d1[5+offset][3];
   double day5_low = rates_d1[5+offset][2]; 
   double day4_high = rates_d1[4+offset][3];
   double day4_low = rates_d1[4+offset][2]; 
   double day3_high = rates_d1[3+offset][3];
   double day3_low = rates_d1[3+offset][2]; 
   double day2_high = rates_d1[2+offset][3];
   double day2_low = rates_d1[2+offset][2]; 
   double yesterday_high = rates_d1[1+offset][3];
   double yesterday_low = rates_d1[1+offset][2];
   double yesterday_close = rates_d1[1+offset][4];
   double day_high = rates_d1[0][3];
   double day_low = rates_d1[0][2];
   
/*
   int i=0;

   ArrayCopyRates(rates_h1, Symbol(), PERIOD_H1);
   for (i=0;i<=25;i++)
   {
    if (TimeMinute(rates_h1[i][0])==0 && (TimeHour(rates_h1[i][0])-TimeZone)==0)
    {
     yesterday_close = rates_h1[i+1][4];      
     yesterday_open = rates_h1[i+24][1];
     today_open = rates_h1[i][1];      
     break;
    }
   }
*/

//---- Calculate Pivots et range

   double D = (day_high - day_low);
   double Q = (yesterday_high - yesterday_low);
   double Q2 = (day2_high - day2_low);
   double Q3 = (day3_high - day3_low);
   double Q4 = (day4_high - day4_low);
   double Q5 = (day5_high - day5_low);
   double Q6 = (day6_high - day6_low);
   double Q7 = (day7_high - day7_low);
   double Q8 = (day8_high - day8_low);
   double Q9 = (day9_high - day9_low);
   double Q10 = (day10_high - day10_low);
   double Q11 = (day11_high - day11_low);
   double Q12 = (day12_high - day12_low);
   double Q13 = (day13_high - day13_low);
   double Q14 = (day14_high - day14_low);
   double Q15 = (day15_high - day15_low);
   double Q16 = (day16_high - day16_low);
   double Q17 = (day17_high - day17_low);
   double Q18 = (day18_high - day18_low);
   double Q19 = (day19_high - day19_low);
   double Q20 = (day20_high - day20_low);
   double Q21 = (day21_high - day21_low);
   double Q22 = (day22_high - day22_low);
   double Q23 = (day23_high - day23_low);
   double Q24 = (day24_high - day24_low);
   double Q25 = (day25_high - day25_low);
   double Q26 = (day26_high - day26_low);
   double Q27 = (day27_high - day27_low);
   double Q28 = (day28_high - day28_low);
   double Q29 = (day29_high - day29_low);
   double Q30 = (day30_high - day30_low);
   double Q31 = (day31_high - day31_low);
   double Q32 = (day32_high - day32_low);
   double Q33 = (day33_high - day33_low);
   double Q34 = (day34_high - day34_low);
   double Q35 = (day35_high - day35_low);
   double Q36 = (day36_high - day36_low);
   double Q37 = (day37_high - day37_low);
   double Q38 = (day38_high - day38_low);
   double Q39 = (day39_high - day39_low);
   double Q40 = (day40_high - day40_low);
   double Q41 = (day41_high - day41_low);
   double Q42 = (day42_high - day42_low);
   double Q43 = (day43_high - day43_low);
   double Q44 = (day44_high - day44_low);
   double Q45 = (day45_high - day45_low);
   double Q46 = (day46_high - day46_low);
   double Q47 = (day47_high - day47_low);
   double Q48 = (day48_high - day48_low);
   double Q49 = (day49_high - day49_low);
   double Q50 = (day50_high - day50_low);
   double P = (yesterday_high + yesterday_low + yesterday_close) / 3;
   double R1 = (2*P)-yesterday_low;
   double S1 = (2*P)-yesterday_high;
   double R2 = P+(R1 - S1);
   double S2 = P-(R1 - S1);
	double R3 = (2*P)+(yesterday_high-(2*yesterday_low));
	double S3 = (2*P)-((2* yesterday_high)-yesterday_low);
	
	
	
	
	
	int Precision, dig;
{
   if( StringFind( Symbol(), "JPY", 0) != -1 ) { Precision = 100; dig = 2;}
   else                                        { Precision = 10000; dig = 4; }
} 
	double D0 = D * Precision;
	double Q0 = Q * Precision;
	double Q5_av = ((Q + Q2 + Q3 + Q4 + Q5) / 5) * Precision;
	double Q10_av = ((Q + Q2 + Q3 + Q4 + Q5 + Q6 + Q7 + Q8 + Q9 + Q10) / 10) * Precision;
	double Q20_av = ((Q + Q2 + Q3 + Q4 + Q5 + Q6 + Q7 + Q8 + Q9
	                 + Q10 + Q11 + Q12 + Q13 + Q14 + Q15 + Q16 + Q17 + Q18 + Q19 + Q20) / 20) * Precision;
	/*
	double Q30_av = ((Q + Q2 + Q3 + Q4 + Q5 + Q6 + Q7 + Q8 + Q9
	                 + Q10 + Q11 + Q12 + Q13 + Q14 + Q15 + Q16 + Q17 + Q18 + Q19
	                 + Q20 + Q21 + Q22 + Q23 + Q24 + Q25 + Q26 + Q27 + Q28 + Q29 + Q30) / 30) * Precision;
	double Q40_av = ((Q + Q2 + Q3 + Q4 + Q5 + Q6 + Q7 + Q8 + Q9
	                 + Q10 + Q11 + Q12 + Q13 + Q14 + Q15 + Q16 + Q17 + Q18 + Q19
	                 + Q20 + Q21 + Q22 + Q23 + Q24 + Q25 + Q26 + Q27 + Q28 + Q29
	                 + Q30 + Q31 + Q32 + Q33 + Q34 + Q35 + Q36 + Q37 + Q38 + Q39 + Q40) / 40) * Precision;
	*/
	double Q50_av = ((Q + Q2 + Q3 + Q4 + Q5 + Q6 + Q7 + Q8 + Q9
	                 + Q10 + Q11 + Q12 + Q13 + Q14 + Q15 + Q16 + Q17 + Q18 + Q19
	                 + Q20 + Q21 + Q22 + Q23 + Q24 + Q25 + Q26 + Q27 + Q28 + Q29
	                 + Q30 + Q31 + Q32 + Q33 + Q34 + Q35 + Q36 + Q37 + Q38 + Q39
	                 + Q40 + Q41 + Q42 + Q43 + Q44 + Q45 + Q46 + Q47 + Q48 + Q49 + Q50) / 50) * Precision;
	
	double average_range = (Q0 + Q5_av + Q10_av + Q20_av + Q50_av) / 5;
	
	
//---- Set Pivots labels

   if( box_pivots == true )
   {
   int Ydist_line5;
   int Xdist_pivots, Ydist_pivots;
   int Ydist_R3, Ydist_R2, Ydist_R1, Ydist_PV, Ydist_S1, Ydist_S2, Ydist_S3;
   color color_pivots_1=PaleVioletRed;
   
    Xdist_line = 1010+(X_pivots-1000); Xdist_text = 1013+(X_pivots-1000); Xdist_value = 1050+(X_pivots-1000);
    Ydist_line5 = 16+(Y_pivots-5);
    Xdist_pivots = 1010+(X_pivots-1000); Ydist_pivots = 5+(Y_pivots-5);
    Ydist_R3 = 30+(Y_pivots-5); Ydist_R2 = 45+(Y_pivots-5); Ydist_R1 = 60+(Y_pivots-5); Ydist_PV = 75+(Y_pivots-5); Ydist_S1 = 90+(Y_pivots-5); Ydist_S2 = 105+(Y_pivots-5); Ydist_S3 = 120+(Y_pivots-5);
   

   ObjectCreate("pivots", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("pivots","+Daily Pivots+",9, "Verdana", color_pivots_1);
   ObjectSet("pivots", OBJPROP_CORNER, Global_Corner);
   ObjectSet("pivots", OBJPROP_XDISTANCE, Xdist_pivots);
   ObjectSet("pivots", OBJPROP_YDISTANCE, Ydist_pivots);
   
   ObjectCreate("line5", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("line5","------------------",7, "Verdana", color_pivots_1);
   ObjectSet("line5", OBJPROP_CORNER, Global_Corner);
   ObjectSet("line5", OBJPROP_XDISTANCE, Xdist_line);
   ObjectSet("line5", OBJPROP_YDISTANCE, Ydist_line5);
   
   ObjectCreate("R3_Label", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("R3_Label","R3",9, "Verdana", Gainsboro);
   ObjectSet("R3_Label", OBJPROP_CORNER, Global_Corner);
   ObjectSet("R3_Label", OBJPROP_XDISTANCE, Xdist_text);
   ObjectSet("R3_Label", OBJPROP_YDISTANCE, Ydist_R3);
   
   ObjectCreate("R3_Value", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("R3_Value"," "+DoubleToStr(R3,dig),9, "Verdana", Gainsboro);
   ObjectSet("R3_Value", OBJPROP_CORNER, Global_Corner);
   ObjectSet("R3_Value", OBJPROP_XDISTANCE, Xdist_value);
   ObjectSet("R3_Value", OBJPROP_YDISTANCE, Ydist_R3);
   
   ObjectCreate("R2_Label", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("R2_Label","R2",9, "Verdana", Silver);
   ObjectSet("R2_Label", OBJPROP_CORNER, Global_Corner);
   ObjectSet("R2_Label", OBJPROP_XDISTANCE, Xdist_text);
   ObjectSet("R2_Label", OBJPROP_YDISTANCE, Ydist_R2);
   
   ObjectCreate("R2_Value", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("R2_Value"," "+DoubleToStr(R2,dig),9, "Verdana", Silver);
   ObjectSet("R2_Value", OBJPROP_CORNER, Global_Corner);
   ObjectSet("R2_Value", OBJPROP_XDISTANCE, Xdist_value);
   ObjectSet("R2_Value", OBJPROP_YDISTANCE, Ydist_R2);
   
   ObjectCreate("R1_Label", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("R1_Label","R1",9, "Verdana", DarkGray);
   ObjectSet("R1_Label", OBJPROP_CORNER, Global_Corner);
   ObjectSet("R1_Label", OBJPROP_XDISTANCE, Xdist_text);
   ObjectSet("R1_Label", OBJPROP_YDISTANCE, Ydist_R1);
   
   ObjectCreate("R1_Value", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("R1_Value"," "+DoubleToStr(R1,dig),9, "Verdana", DarkGray);
   ObjectSet("R1_Value", OBJPROP_CORNER, Global_Corner);
   ObjectSet("R1_Value", OBJPROP_XDISTANCE, Xdist_value);
   ObjectSet("R1_Value", OBJPROP_YDISTANCE, Ydist_R1);
   
   ObjectCreate("Pivot_Label", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("Pivot_Label","PV",9, "Verdana", Gray);
   ObjectSet("Pivot_Label", OBJPROP_CORNER, Global_Corner);
   ObjectSet("Pivot_Label", OBJPROP_XDISTANCE, Xdist_text);
   ObjectSet("Pivot_Label", OBJPROP_YDISTANCE, Ydist_PV);
   
   ObjectCreate("Pivot_Value", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("Pivot_Value"," "+DoubleToStr(P,dig),9, "Verdana", Gray);
   ObjectSet("Pivot_Value", OBJPROP_CORNER, Global_Corner);
   ObjectSet("Pivot_Value", OBJPROP_XDISTANCE, Xdist_value);
   ObjectSet("Pivot_Value", OBJPROP_YDISTANCE, Ydist_PV);
   
   ObjectCreate("S1_Label", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("S1_Label","S1",9, "Verdana", DarkGray);
   ObjectSet("S1_Label", OBJPROP_CORNER, Global_Corner);
   ObjectSet("S1_Label", OBJPROP_XDISTANCE, Xdist_text);
   ObjectSet("S1_Label", OBJPROP_YDISTANCE, Ydist_S1);
   
   ObjectCreate("S1_Value", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("S1_Value"," "+DoubleToStr(S1,dig),9, "Verdana", DarkGray);
   ObjectSet("S1_Value", OBJPROP_CORNER, Global_Corner);
   ObjectSet("S1_Value", OBJPROP_XDISTANCE, Xdist_value);
   ObjectSet("S1_Value", OBJPROP_YDISTANCE, Ydist_S1);
   
   ObjectCreate("S2_Label", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("S2_Label","S2",9, "Verdana", Silver);
   ObjectSet("S2_Label", OBJPROP_CORNER, Global_Corner);
   ObjectSet("S2_Label", OBJPROP_XDISTANCE, Xdist_text);
   ObjectSet("S2_Label", OBJPROP_YDISTANCE, Ydist_S2);
   
   ObjectCreate("S2_Value", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("S2_Value"," "+DoubleToStr(S2,dig),9, "Verdana", Silver);
   ObjectSet("S2_Value", OBJPROP_CORNER, Global_Corner);
   ObjectSet("S2_Value", OBJPROP_XDISTANCE, Xdist_value);
   ObjectSet("S2_Value", OBJPROP_YDISTANCE, Ydist_S2);
   
   ObjectCreate("S3_Label", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("S3_Label","S3",9, "Verdana", Gainsboro);
   ObjectSet("S3_Label", OBJPROP_CORNER, Global_Corner);
   ObjectSet("S3_Label", OBJPROP_XDISTANCE, Xdist_text);
   ObjectSet("S3_Label", OBJPROP_YDISTANCE, Ydist_S3);
   
   ObjectCreate("S3_Value", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("S3_Value"," "+DoubleToStr(S3,dig),9, "Verdana", Gainsboro);
   ObjectSet("S3_Value", OBJPROP_CORNER, Global_Corner);
   ObjectSet("S3_Value", OBJPROP_XDISTANCE, Xdist_value);
   ObjectSet("S3_Value", OBJPROP_YDISTANCE, Ydist_S3);
   
   }   // if( box_pivots == true )
   
   
   
// DAILY RANGE

   if( box_range == true )
   {

   int Ydist_line6, Ydist_line7, Ydist_line8;
   int Corner_range, Xdist_range, Ydist_range;
   int Ydist_today, Ydist_yesterday, Ydist_5, Ydist_10, Ydist_20, Ydist_50;
   int Ydist_average;
  
    Xdist_line = 1121+(X_range-1115); Xdist_text = 1124+(X_range-1115); Xdist_value = 1185+(X_range-1115);
    Ydist_line6 = 16+(Y_range-5); Ydist_line7 = 112+(Y_range-5); Ydist_line8 = 127+(Y_range-5);
    Corner_range = 1; Xdist_range = 1120+(X_range-1115); Ydist_range = 5+(Y_range-5);
    Ydist_today = 28+(Y_range-5); Ydist_yesterday = 42+(Y_range-5); Ydist_5 = 57+(Y_range-5); Ydist_10 = 72+(Y_range-5); Ydist_20 = 87+(Y_range-5); Ydist_50 = 102+(Y_range-5); Ydist_average = 118+(Y_range-5);
  
   ObjectCreate("daily_range", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("daily_range","+Daily Range+",9, "Verdana", MediumTurquoise);
   ObjectSet("daily_range", OBJPROP_CORNER, Global_Corner);
   ObjectSet("daily_range", OBJPROP_XDISTANCE, Xdist_range);
   ObjectSet("daily_range", OBJPROP_YDISTANCE, Ydist_range);
   
   ObjectCreate("line6", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("line6","------------------",8, "Verdana", MediumTurquoise);
   ObjectSet("line6", OBJPROP_CORNER, Global_Corner);
   ObjectSet("line6", OBJPROP_XDISTANCE, Xdist_line);
   ObjectSet("line6", OBJPROP_YDISTANCE, Ydist_line6);
   
   ObjectCreate("today", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("today","Today",9, "Verdana", WhiteSmoke);
   ObjectSet("today", OBJPROP_CORNER, Global_Corner);
   ObjectSet("today", OBJPROP_XDISTANCE, Xdist_text);
   ObjectSet("today", OBJPROP_YDISTANCE, Ydist_today);
   
   ObjectCreate("today_range", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("today_range",DoubleToStr(D0,0),9, "Verdana", WhiteSmoke);
   ObjectSet("today_range", OBJPROP_CORNER, Global_Corner);
   ObjectSet("today_range", OBJPROP_XDISTANCE, Xdist_value);
   ObjectSet("today_range", OBJPROP_YDISTANCE, Ydist_today);
   
   ObjectCreate("yesterday", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("yesterday","1 Day",9, "Verdana", Gainsboro);
   ObjectSet("yesterday", OBJPROP_CORNER, Global_Corner);
   ObjectSet("yesterday", OBJPROP_XDISTANCE, Xdist_text);
   ObjectSet("yesterday", OBJPROP_YDISTANCE, Ydist_yesterday);
   
   ObjectCreate("yesterday_range", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("yesterday_range",DoubleToStr(Q0,0),9, "Verdana", Gainsboro);
   ObjectSet("yesterday_range", OBJPROP_CORNER, Global_Corner);
   ObjectSet("yesterday_range", OBJPROP_XDISTANCE, Xdist_value);
   ObjectSet("yesterday_range", OBJPROP_YDISTANCE, Ydist_yesterday);
   
   ObjectCreate("5_days", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("5_days","5 Days",9, "Verdana", LightGray);
   ObjectSet("5_days", OBJPROP_CORNER, Global_Corner);
   ObjectSet("5_days", OBJPROP_XDISTANCE, Xdist_text);
   ObjectSet("5_days", OBJPROP_YDISTANCE, Ydist_5);
   
   ObjectCreate("5_days_range", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("5_days_range",DoubleToStr(Q5_av,0),9, "Verdana", LightGray);
   ObjectSet("5_days_range", OBJPROP_CORNER, Global_Corner);
   ObjectSet("5_days_range", OBJPROP_XDISTANCE, Xdist_value);
   ObjectSet("5_days_range", OBJPROP_YDISTANCE, Ydist_5);
   
   ObjectCreate("10_days", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("10_days","10 Days",9, "Verdana", Silver);
   ObjectSet("10_days", OBJPROP_CORNER, Global_Corner);
   ObjectSet("10_days", OBJPROP_XDISTANCE, Xdist_text);
   ObjectSet("10_days", OBJPROP_YDISTANCE, Ydist_10);
   
   ObjectCreate("10_days_range", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("10_days_range",DoubleToStr(Q10_av,0),9, "Verdana", Silver);
   ObjectSet("10_days_range", OBJPROP_CORNER, Global_Corner);
   ObjectSet("10_days_range", OBJPROP_XDISTANCE, Xdist_value);
   ObjectSet("10_days_range", OBJPROP_YDISTANCE, Ydist_10);
   
   ObjectCreate("20_days", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("20_days","20 Days",9, "Verdana", DarkGray);
   ObjectSet("20_days", OBJPROP_CORNER, Global_Corner);
   ObjectSet("20_days", OBJPROP_XDISTANCE, Xdist_text);
   ObjectSet("20_days", OBJPROP_YDISTANCE, Ydist_20);
   
   ObjectCreate("20_days_range", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("20_days_range",DoubleToStr(Q20_av,0),9, "Verdana", DarkGray);
   ObjectSet("20_days_range", OBJPROP_CORNER, Global_Corner);
   ObjectSet("20_days_range", OBJPROP_XDISTANCE, Xdist_value);
   ObjectSet("20_days_range", OBJPROP_YDISTANCE, Ydist_20);
   
   ObjectCreate("50_days", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("50_days","50 Days",9, "Verdana", Gray);
   ObjectSet("50_days", OBJPROP_CORNER, Global_Corner);
   ObjectSet("50_days", OBJPROP_XDISTANCE, Xdist_text);
   ObjectSet("50_days", OBJPROP_YDISTANCE, Ydist_50);
   
   ObjectCreate("50_days_range", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("50_days_range",DoubleToStr(Q50_av,0),9, "Verdana", Gray);
   ObjectSet("50_days_range", OBJPROP_CORNER, Global_Corner);
   ObjectSet("50_days_range", OBJPROP_XDISTANCE, Xdist_value);
   ObjectSet("50_days_range", OBJPROP_YDISTANCE, Ydist_50);
   
   ObjectCreate("line7", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("line7","------------------",8, "Verdana", PeachPuff);
   ObjectSet("line7", OBJPROP_CORNER, Global_Corner);
   ObjectSet("line7", OBJPROP_XDISTANCE, Xdist_line);
   ObjectSet("line7", OBJPROP_YDISTANCE, Ydist_line7);
   
   ObjectCreate("Average", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("Average","Average",9, "Verdana", Coral);
   ObjectSet("Average", OBJPROP_CORNER, Global_Corner);
   ObjectSet("Average", OBJPROP_XDISTANCE, Xdist_text);
   ObjectSet("Average", OBJPROP_YDISTANCE, Ydist_average);
   
   ObjectCreate("Average_range", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("Average_range",DoubleToStr(average_range,0),9, "Verdana", SandyBrown);
   ObjectSet("Average_range", OBJPROP_CORNER, Global_Corner);
   ObjectSet("Average_range", OBJPROP_XDISTANCE, Xdist_value);
   ObjectSet("Average_range", OBJPROP_YDISTANCE, Ydist_average);
   
   ObjectCreate("line8", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("line8","------------------",8, "Verdana", PeachPuff);
   ObjectSet("line8", OBJPROP_CORNER, Global_Corner);
   ObjectSet("line8", OBJPROP_XDISTANCE, Xdist_line);
   ObjectSet("line8", OBJPROP_YDISTANCE, Ydist_line8);
   
   }
}
//+------------------------------------------------------------------+
void main()                                                             
  {   
   RefreshRates();  
   // Variables -------------------
   double M1stochK,M1stochD,M5stochK,M5stochD,M15stochK,M15stochD,M30stochK,M30stochD,H1stochK,H1stochD,H4stochK,H4stochD,D1stochK,D1stochD,StochK,StochD,StochKprev,StochDprev;
   double MAM1,MAM5,MAM15,MAM30,MAH1,MAH4,MAD1,MAM1prev,MAM5prev,MAM15prev,MAM30prev,MAH1prev,MAH4prev,MAD1prev,MACurrent,MAPrevious;
   double Spread,PSARCurrent,PSARPrev,MACDCurrent,MACDPrev,MACDSignal,MACDSignalPrev,MAXover1,MAXover2,VolumePercent,Vol,VolPrev,WPR,Bar1,Bar2,Bar3,Bar4,Bar5,Bar6,Bar7,Bar8,Bar9,Bar10;
   double Bar1percent,Bar2percent,Bar3percent,Bar4percent,Bar5percent,BarsAverage1,BarsAverage2,BarsAverage3,BarsAverage4,BarsAverage5,BarsAllpercent;
   int trendM1,trendM5,trendM15,trendM30,trendH1,trendH4,trendD1,PSAR,MACD,MAXoverSignal,VolValue,WPRValueUp,WPRValueDown,Bar1Col,Bar2Col,Bar3Col,Bar4Col,Bar5Col,BarReading,Signal;
   
   // Stochs ----------------------------------------------------------------------------------------------  
   M1stochK = iStochastic(Symbol(), PERIOD_M1, Stoch_K,Stoch_D, Stoch_Slowing, MODE_SMA, 0, MODE_MAIN, 0);
   M1stochD = iStochastic(Symbol(), PERIOD_M1, Stoch_K,Stoch_D, Stoch_Slowing, MODE_SMA, 0, MODE_SIGNAL, 0);
   M5stochK = iStochastic(Symbol(), PERIOD_M5, Stoch_K,Stoch_D, Stoch_Slowing, MODE_SMA, 0, MODE_MAIN, 0);
   M5stochD = iStochastic(Symbol(), PERIOD_M5, Stoch_K,Stoch_D, Stoch_Slowing, MODE_SMA, 0, MODE_SIGNAL, 0);
   M15stochK = iStochastic(Symbol(), PERIOD_M15, Stoch_K,Stoch_D, Stoch_Slowing, MODE_SMA, 0, MODE_MAIN, 0);
   M15stochD = iStochastic(Symbol(), PERIOD_M15, Stoch_K,Stoch_D, Stoch_Slowing, MODE_SMA, 0, MODE_SIGNAL, 0);
   M30stochK = iStochastic(Symbol(), PERIOD_M30, Stoch_K,Stoch_D, Stoch_Slowing, MODE_SMA, 0, MODE_MAIN, 0);
   M30stochD = iStochastic(Symbol(), PERIOD_M30, Stoch_K,Stoch_D, Stoch_Slowing, MODE_SMA, 0, MODE_SIGNAL, 0);
   H1stochK = iStochastic(Symbol(), PERIOD_H1, Stoch_K,Stoch_D, Stoch_Slowing, MODE_SMA, 0, MODE_MAIN, 0);
   H1stochD = iStochastic(Symbol(), PERIOD_H1, Stoch_K,Stoch_D, Stoch_Slowing, MODE_SMA, 0, MODE_SIGNAL, 0);
   H4stochK = iStochastic(Symbol(), PERIOD_H4, Stoch_K,Stoch_D, Stoch_Slowing, MODE_SMA, 0, MODE_MAIN, 0);
   H4stochD = iStochastic(Symbol(), PERIOD_H4, Stoch_K,Stoch_D, Stoch_Slowing, MODE_SMA, 0, MODE_SIGNAL, 0);
   D1stochK = iStochastic(Symbol(), PERIOD_D1, Stoch_K,Stoch_D, Stoch_Slowing, MODE_SMA, 0, MODE_MAIN, 0);
   D1stochD = iStochastic(Symbol(), PERIOD_D1, Stoch_K,Stoch_D, Stoch_Slowing, MODE_SMA, 0, MODE_SIGNAL, 0);  
   StochK = iStochastic(Symbol(), 0, Stoch_K,Stoch_D, Stoch_Slowing, MODE_SMA, 0, MODE_MAIN, 0);
   StochD = iStochastic(Symbol(), 0, Stoch_K,Stoch_D, Stoch_Slowing, MODE_SMA, 0, MODE_SIGNAL, 0);
   StochKprev = iStochastic(Symbol(), 0, Stoch_K,Stoch_D, Stoch_Slowing, MODE_SMA, 0, MODE_MAIN, 1);
   StochDprev = iStochastic(Symbol(), 0, Stoch_K,Stoch_D, Stoch_Slowing, MODE_SMA, 0, MODE_SIGNAL, 1);
   
   // MA's ---------------------------------------------------------- 
   MAM1=iMA(NULL,PERIOD_M1,MA_Period,MA_Shift,MODE_EMA,PRICE_CLOSE,0);
   MAM5=iMA(NULL,PERIOD_M5,MA_Period,MA_Shift,MODE_EMA,PRICE_CLOSE,0);
   MAM15=iMA(NULL,PERIOD_M15,MA_Period,MA_Shift,MODE_EMA,PRICE_CLOSE,0);
   MAM30=iMA(NULL,PERIOD_M30,MA_Period,MA_Shift,MODE_EMA,PRICE_CLOSE,0);
   MAH1=iMA(NULL,PERIOD_H1,MA_Period,MA_Shift,MODE_EMA,PRICE_CLOSE,0);
   MAH4=iMA(NULL,PERIOD_H4,MA_Period,MA_Shift,MODE_EMA,PRICE_CLOSE,0);
   MAD1=iMA(NULL,PERIOD_D1,MA_Period,MA_Shift,MODE_EMA,PRICE_CLOSE,0);
   
   MAM1prev=iMA(NULL,PERIOD_M1,MA_Period,MA_Shift,MODE_EMA,PRICE_CLOSE,1);
   MAM5prev=iMA(NULL,PERIOD_M5,MA_Period,MA_Shift,MODE_EMA,PRICE_CLOSE,1);
   MAM15prev=iMA(NULL,PERIOD_M15,MA_Period,MA_Shift,MODE_EMA,PRICE_CLOSE,1);
   MAM30prev=iMA(NULL,PERIOD_M30,MA_Period,MA_Shift,MODE_EMA,PRICE_CLOSE,1);
   MAH1prev=iMA(NULL,PERIOD_H1,MA_Period,MA_Shift,MODE_EMA,PRICE_CLOSE,1);
   MAH4prev=iMA(NULL,PERIOD_H4,MA_Period,MA_Shift,MODE_EMA,PRICE_CLOSE,1);
   MAD1prev=iMA(NULL,PERIOD_D1,MA_Period,MA_Shift,MODE_EMA,PRICE_CLOSE,1);
   
   MACurrent=iMA(NULL,0,MA_Period,MA_Shift,MODE_EMA,PRICE_CLOSE,0);
   MAPrevious=iMA(NULL,0,MA_Period,MA_Shift,MODE_EMA,PRICE_CLOSE,1);   
   
      if(MAM1 > MAM1prev)  
     {
      trendM1=1;
     }   
     if(MAM1 < MAM1prev)  
     {
      trendM1=0;
     }     
     if(MAM5 > MAM5prev)  
     {
      trendM5=1;
     }   
     if(MAM5 < MAM5prev)  
     {
      trendM5=0;
     }    
     if(MAM15 > MAM15prev)  
     {
      trendM15=1;
     } 
     if(MAM15 < MAM15prev)  
     {
      trendM15=0;
     }    
     if(MAM30 > MAM30prev)  
     {
      trendM30=1;
     } 
     if(MAM30 < MAM30prev)  
     {
      trendM30=0;
     }   
     if(MAH1 > MAH1prev)  
     {
      trendH1=1;
     } 
     if(MAH1 < MAH1prev)  
     {
      trendH1=0;
     }  
     if(MAH4 > MAH4prev)  
     {
      trendH4=1;
     } 
     if(MAH4 < MAH4prev)  
     {
      trendH4=0;
     }   
     if(MAD1 > MAD1prev)  
     {
      trendD1=1;
     } 
     if(MAD1 < MAD1prev)  
     {
      trendD1=0;
     } 
   // Spread ---------------
   
   Spread=NormalizeDouble(((Ask-Bid)/Point)/10,1);
   
   // ParabolicSAR -------------------------------
   
   PSARCurrent= iSAR(NULL,0,PSAR_Step,PSAR_Max,0);
   PSARPrev= iSAR(NULL,0,PSAR_Step,PSAR_Max,1);
   
   if (PSARCurrent>PSARPrev)
      {
      PSAR=1;
      }
   if (PSARCurrent<PSARPrev)
      {
      PSAR=0;
      }
   // MACD ---------------------------------------
   
   MACDCurrent = iMACD(NULL,0,MACD_Period1,MACD_Period2,MACD_Period3,PRICE_CLOSE,MODE_MAIN,0);
   MACDPrev = iMACD(NULL,0,MACD_Period1,MACD_Period2,MACD_Period3,PRICE_CLOSE,MODE_MAIN,1);
   MACDSignal = iMACD(NULL,0,MACD_Period1,MACD_Period2,MACD_Period3,PRICE_CLOSE,MODE_SIGNAL,0);
   MACDSignalPrev = iMACD(NULL,0,MACD_Period1,MACD_Period2,MACD_Period3,PRICE_CLOSE,MODE_SIGNAL,1);
   
   if (MACDCurrent>MACDPrev && ((MACDCurrent && MACDPrev)>MACDSignal || (MACDCurrent && MACDPrev)<MACDSignal))
      {
      MACD=3;
      }
   if (MACDCurrent<MACDSignal && MACDPrev>MACDSignalPrev)
      {
      MACD=2;
      }      
   if (MACDCurrent<MACDPrev && ((MACDCurrent && MACDPrev)>MACDSignal || (MACDCurrent && MACDPrev)<MACDSignal))
      {
      MACD=1;
      }   
   if (MACDCurrent>MACDSignal && MACDPrev<MACDSignalPrev)
      {
      MACD=0;
      }   
   if (MACDCurrent>0 && MACDPrev<0)
      {
      MACD=4;
      }         
   if (MACDCurrent<0 && MACDPrev>0)
      {
      MACD=5;
      } 
  // MA XOVER  ---------------------------------------

      MAXover1=iMA(NULL,0,FastLWMA,0,MODE_LWMA,PRICE_CLOSE,0);
      MAXover2=iMA(NULL,0,SlowSMA,0,MODE_SMA,PRICE_CLOSE,0);

   if (MAXover1>MAXover2)
      {
      MAXoverSignal=1;
      }
   if (MAXover1<MAXover2)
      {
      MAXoverSignal=0;
      }
   // Williams%Range ---------------------------------
   
     WPR=iWPR(NULL,0,14,0);
      
   if (WPR<=0 && WPR>=-5)
   {
   WPRValueUp=1;
   }
   if (WPR>=-20 && WPR<-5)
   {
   WPRValueUp=2;
   }   
   if (WPR>=-30 && WPR<-20)
   {
   WPRValueUp=3;
   }   
   if (WPR>=-40 && WPR<-30)
   {
   WPRValueUp=4;
   }   
   if (WPR>-50 && WPR<-40)
   {
   WPRValueUp=5;
   }      
   if (WPR<-50 && WPR>=-60)
   {
   WPRValueDown=6;
   }   
   if (WPR<=-60 && WPR>=-70)
   {
   WPRValueDown=7;
   }
   if (WPR<=-70 && WPR>=-80)
   {
   WPRValueDown=8;
   }   
   if (WPR<=-80 && WPR>=-95)
   {
   WPRValueDown=9;
   }   
   if (WPR<=-95 && WPR>=-100)
   {
   WPRValueDown=10;
   }   
      
   // BarMeter ---------------------------------------------------------
   
   if (Close[0] > Close[1])
   {
   Bar1 = (Close[0] - Close[1])*100000;
   }
   if (Close[0] < Close[1])
   {
   Bar1 = (Close[1] - Close[0])*100000;
   }
  
   if (Close[1] > Close[2])
   {
   Bar2 = (Close[1] - Close[2])*100000;
   }
   if (Close[1] < Close[2])
   {
   Bar2 = (Close[2] - Close[1])*100000;
   }

   if (Close[2] > Close[3])
   {
   Bar3 = (Close[2] - Close[3])*100000;
   }
   if (Close[2] < Close[3])
   {
   Bar3 = (Close[3] - Close[2])*100000;
   }
   
   if (Close[3] > Close[4])
   {
   Bar4 = (Close[3] - Close[4])*100000;
   }
   if (Close[3] < Close[4])
   {
   Bar4 = (Close[4] - Close[3])*100000;
   }
   
   if (Close[4] > Close[5])
   {
   Bar5 = (Close[4] - Close[5])*100000;
   }
   if (Close[4] < Close[5])
   {
   Bar5 = (Close[5] - Close[4])*100000;
   }
       
   if (Close[5] > Close[6])
   {
   Bar6 = (Close[5] - Close[6])*100000;
   }
   if (Close[5] < Close[6])
   {
   Bar6 = (Close[6] - Close[5])*100000;
   }
   
   if (Close[6] > Close[7])
   {
   Bar7 = (Close[6] - Close[7])*100000;
   }
   if (Close[6] < Close[7])
   {
   Bar7 = (Close[7] - Close[6])*100000;
   }
   
   if (Close[7] > Close[8])
   {
   Bar8 = (Close[7] - Close[8])*100000;
   }
   if (Close[7] < Close[8])
   {
   Bar8 = (Close[8] - Close[7])*100000;
   }
   
   if (Close[8] > Close[9])
   {
   Bar9 = (Close[8] - Close[9])*100000;
   }
   if (Close[8] < Close[9])
   {
   Bar9 = (Close[9] - Close[8])*100000;
   }
   
   if (Close[9] > Close[10])
   {
   Bar10 = (Close[9] - Close[10])*100000;
   }
   if (Close[9] < Close[10])
   {
   Bar10 = (Close[10] - Close[9])*100000;
   }            
   //----------------------------------------    
   BarsAverage1 = (Bar2 + Bar3 + Bar4 + Bar5)/4;
   BarsAverage2 = (Bar3 + Bar4 + Bar5 + Bar6)/4;
   BarsAverage3 = (Bar4 + Bar5 + Bar6 + Bar7)/4;
   BarsAverage4 = (Bar5 + Bar6 + Bar7 + Bar8)/4;
   BarsAverage5 = (Bar6 + Bar7 + Bar8 + Bar9)/4;
   
   Bar1percent = NormalizeDouble((Bar1/BarsAverage1)*100,0);
   Bar2percent = NormalizeDouble((Bar2/BarsAverage2)*100,0);
   Bar3percent = NormalizeDouble((Bar3/BarsAverage3)*100,0);
   Bar4percent = NormalizeDouble((Bar4/BarsAverage4)*100,0);
   Bar5percent = NormalizeDouble((Bar5/BarsAverage5)*100,0);
   BarsAllpercent = NormalizeDouble(((Bar2 + Bar3 + Bar4 + Bar5)/4)*100,0);
   
   if (Bar1percent==0) //Stopped
   {
   BarReading = 1;
   }
   if (Bar1percent>Bar2percent && Bar1percent>100 && Bar1percent!=0) //Speeding Up
   {
   BarReading = 2;
   }
   if (Bar1percent<=100 && Bar1percent!=0) //Steady
   {
   BarReading = 3;
   }
   if (Bar1percent<Bar2percent && Bar2percent>100 && Bar1percent>100 && Bar1percent!=0) //Slowing Down
   {
   BarReading = 4;
   }
   //----------------------------------------  
   if (Bar1percent==0 || Close[0] == Close[1])
     {
     Bar1Col = 12;
     } 
   if (Bar1percent<25 && Bar1percent>0)
     {
     Bar1Col = 11;
     }   
   if (Bar1percent>=400)
     {
     if (Close[0] > Close[1])
       {
       Bar1Col = 1;
       }
       else if (Close[0] < Close[1]) Bar1Col = 10;
     }  
   if (Bar1percent>=200 && Bar1percent<400)
     {
     if (Close[0] > Close[1])
       {
       Bar1Col = 2;
       }
       else if (Close[0] < Close[1]) Bar1Col = 9;
     }  
   if (Bar1percent>=100 && Bar1percent<200)
     {
     if (Close[0] > Close[1])
       {
       Bar1Col = 3;
       }
       else if (Close[0] < Close[1]) Bar1Col = 8;
     }  
   if (Bar1percent>=50 && Bar1percent<100)
     {
     if (Close[0] > Close[1])
       {
       Bar1Col = 4;
       }
       else if (Close[0] < Close[1]) Bar1Col = 7;
     }    
   if (Bar1percent>=25 && Bar1percent<50)
     {
     if (Close[0] > Close[1])
       {
       Bar1Col = 5;
       }
       else if (Close[0] < Close[1]) Bar1Col = 6;
     }  
   //--------------------------------------
   if (Bar2percent==0 || Close[1] == Close[2])
     {
     Bar2Col = 12;
     } 
   if (Bar2percent<25 && Bar2percent>0)
     {
     Bar2Col = 11;
     }   
   if (Bar2percent>=400)
     {
     if (Close[1] > Close[2])
       {
       Bar2Col = 1;
       }
       else if (Close[1] < Close[2]) Bar2Col = 10;
     }  
   if (Bar2percent>=200 && Bar2percent<400)
     {
     if (Close[1] > Close[2])
       {
       Bar2Col = 2;
       }
       else if (Close[1] < Close[2]) Bar2Col = 9;
     }  
   if (Bar2percent>=100 && Bar2percent<200)
     {
     if (Close[1] > Close[2])
       {
       Bar2Col = 3;
       }
       else if (Close[1] < Close[2]) Bar2Col = 8;
     }  
   if (Bar2percent>=50 && Bar2percent<100)
     {
     if (Close[1] > Close[2])
       {
       Bar2Col = 4;
       }
       else if (Close[1] < Close[2]) Bar2Col = 7;
     }      
   if (Bar2percent>=25 && Bar2percent<50)
     {
     if (Close[1] > Close[2])
       {
       Bar2Col = 5;
       }
       else if (Close[1] < Close[2]) Bar2Col = 6;
     }    
   //--------------------------------------
   if (Bar3percent==0 || Close[2] == Close[3])
     {
     Bar3Col = 12;
     } 
   if (Bar3percent<25 && Bar3percent>0)
     {
     Bar3Col = 11;
     }   
   if (Bar3percent>=400)
     {
     if (Close[2] > Close[3])
       {
       Bar3Col = 1;
       }
       else if (Close[2] < Close[3]) Bar3Col = 10;
     }  
   if (Bar3percent>=200 && Bar3percent<400)
     {
     if (Close[2] > Close[3])
       {
       Bar3Col = 2;
       }
       else if (Close[2] < Close[3]) Bar3Col = 9;
     }  
   if (Bar3percent>=100 && Bar3percent<200)
     {
     if (Close[2] > Close[3])
       {
       Bar3Col = 3;
       }
       else if (Close[2] < Close[3]) Bar3Col = 8;
     }   
   if (Bar3percent>=50 && Bar3percent<100)
     {
     if (Close[2] > Close[3])
       {
       Bar3Col = 4;
       }
       else if (Close[2] < Close[3]) Bar3Col = 7;
     }        
   if (Bar3percent>=25 && Bar3percent<50)
     {
     if (Close[2] > Close[3])
       {
       Bar3Col = 5;
       }
       else if (Close[2] < Close[3]) Bar3Col = 6;
     }   
   //--------------------------------------
   if (Bar4percent==0 || Close[3] == Close[4])
     {
     Bar4Col = 12;
     } 
   if (Bar4percent<25 && Bar4percent>0)
     {
     Bar4Col = 11;
     }   
   if (Bar4percent>=400)
     {
     if (Close[3] > Close[4])
       {
       Bar4Col = 1;
       }
       else if (Close[3] < Close[4]) Bar4Col = 10;
     }   
   if (Bar4percent>=200 && Bar4percent<400)
     {
     if (Close[3] > Close[4])
       {
       Bar4Col = 2;
       }
       else if (Close[3] < Close[4]) Bar4Col = 9;
     }   
   if (Bar4percent>=100 && Bar4percent<200)
     {
     if (Close[3] > Close[4])
       {
       Bar4Col = 3;
       }
       else if (Close[3] < Close[4]) Bar4Col = 8;
     }    
   if (Bar4percent>=50 && Bar4percent<100)
      {
     if (Close[3] > Close[4])
       {
       Bar4Col = 4;
       }
       else if (Close[3] < Close[4]) Bar4Col = 7;
     }        
   if (Bar4percent>=25 && Bar4percent<50)
     {
     if (Close[3] > Close[4])
       {
       Bar4Col = 5;
       }
       else if (Close[3] < Close[4]) Bar4Col = 6;
     }   
   //--------------------------------------
   if (Bar5percent==0 || Close[4] == Close[5])
     {
     Bar5Col = 12;
     } 
   if (Bar5percent<25 && Bar5percent>0)
     {
     Bar5Col = 11;
     }   
   if (Bar5percent>=400)
     {
     if (Close[4] > Close[5])
       {
       Bar5Col = 1;
       }
       else if (Close[4] < Close[5]) Bar5Col = 10;
     }   
   if (Bar5percent>=200 && Bar5percent<400)
     {
     if (Close[4] > Close[5])
       {
       Bar5Col = 2;
       }
       else if (Close[4] < Close[5]) Bar5Col = 9;
     }    
   if (Bar5percent>=100 && Bar5percent<200)
     {
     if (Close[4] > Close[5])
       {
       Bar5Col = 3;
       }
       else if (Close[4] < Close[5]) Bar5Col = 8;
     }     
   if (Bar5percent>=50 && Bar5percent<100)
     {
     if (Close[4] > Close[5])
       {
       Bar5Col = 4;
       }
       else if (Close[4] < Close[5]) Bar5Col = 7;
     }         
   if (Bar5percent>=25 && Bar5percent<50)
     {
     if (Close[4] > Close[5])
       {
       Bar5Col = 5;
       }
       else if (Close[4] < Close[5]) Bar5Col = 6;
     }    
    
    //Signal Down  ------------------------ 
    if ((MACD==1 || MACD==2) && MAXoverSignal==0 && WPR<-50 && MACurrent<MAPrevious && StochK<StochKprev && Close[0]<Close[1])
     {
     Signal = 1;
     }    
    
    //Signal Up  ------------------------  
    if ((MACD==3 || MACD==0) && MAXoverSignal==1 && WPR>-50 && MACurrent>MAPrevious && StochK>StochKprev && Close[0]>Close[1])
     {
     Signal = 2;
     }    
      
   //--------------------------------------       
   objectBlank(); 
   paintM1(M1stochK);
   paintM5(M5stochK);
   paintM15(M15stochK);
   paintM30(M30stochK);
   paintH1(H1stochK);
   paintH4(H4stochK);
   paintD1(D1stochK);
   paintLine();
   paintMA_M1(trendM1);
   paintMA_M5(trendM5);
   paintMA_M15(trendM15);
   paintMA_M30(trendM30);
   paintMA_H1(trendH1);
   paintMA_H4(trendH4);
   paintMA_D1(trendD1);
   paint2Line();
   paintWPRUp(WPRValueUp);
   paintWPRDown(WPRValueDown);
   paintWPRValue(WPR); 
   paintSpread(Spread);
   paintSpreadLines();
   paintPSAR(PSAR);
   paintMACD(MACD);
   paintMAXover(MAXoverSignal);
   paintBars();
   paintBarValue1(Bar1percent);
   paintBarValue2(Bar2percent);
   paintBarValue3(Bar3percent);
   paintBarValue4(Bar4percent);
   paintBarValue5(Bar5percent);
   paintBar1(Bar1Col);
   paintBar2(Bar2Col);
   paintBar3(Bar3Col);
   paintBar4(Bar4Col);
   paintBar5(Bar5Col);
   paintBarReading(BarReading);
   paintSignal(Signal);
                                                                        
  }
//----------------------------------------   
void initGraph() 
  {
   ObjectsDeleteAll(0,OBJ_LABEL);
Panel();
// Stochastic Graphs -------------------
   objectCreate("M_1_90",130,91);
   objectCreate("M_1_80",130,83);
   objectCreate("M_1_70",130,75);
   objectCreate("M_1_60",130,67);
   objectCreate("M_1_50",130,59);  
   objectCreate("M_1_40",130,51);
   objectCreate("M_1_30",130,43);
   objectCreate("M_1_20",130,35);
   objectCreate("M_1_10",130,27);
   objectCreate("M_1_0",130,19);
   objectCreate("M_1",135,20,"M1",7,"Arial Narrow",SkyBlue);
   objectCreate("M_1p",134,29,DoubleToStr(9,1),8,"Arial Narrow",Silver);
   
   objectCreate("M_5_90",110,91);
   objectCreate("M_5_80",110,83);
   objectCreate("M_5_70",110,75);
   objectCreate("M_5_60",110,67);
   objectCreate("M_5_50",110,59);  
   objectCreate("M_5_40",110,51);
   objectCreate("M_5_30",110,43);
   objectCreate("M_5_20",110,35);
   objectCreate("M_5_10",110,27);
   objectCreate("M_5_0",110,19);
   objectCreate("M_5",115,20,"M5",7,"Arial Narrow",SkyBlue);
   objectCreate("M_5p",114,29,DoubleToStr(9,1),8,"Arial Narrow",Silver);
   
   objectCreate("M_15_90",90,91);
   objectCreate("M_15_80",90,83);
   objectCreate("M_15_70",90,75);
   objectCreate("M_15_60",90,67);
   objectCreate("M_15_50",90,59);  
   objectCreate("M_15_40",90,51);
   objectCreate("M_15_30",90,43);
   objectCreate("M_15_20",90,35);
   objectCreate("M_15_10",90,27);
   objectCreate("M_15_0",90,19);
   objectCreate("M_15",93,20,"M15",7,"Arial Narrow",SkyBlue);
   objectCreate("M_15p",94,29,DoubleToStr(9,1),8,"Arial Narrow",Silver);
   
   objectCreate("M_30_90",70,91);
   objectCreate("M_30_80",70,83);
   objectCreate("M_30_70",70,75);
   objectCreate("M_30_60",70,67);
   objectCreate("M_30_50",70,59);  
   objectCreate("M_30_40",70,51);
   objectCreate("M_30_30",70,43);
   objectCreate("M_30_20",70,35);
   objectCreate("M_30_10",70,27);
   objectCreate("M_30_0",70,19);
   objectCreate("M_30",73,20,"M30",7,"Arial Narrow",SkyBlue);
   objectCreate("M_30p",74,29,DoubleToStr(9,1),8,"Arial Narrow",Silver);

   objectCreate("H_1_90",50,91);
   objectCreate("H_1_80",50,83);
   objectCreate("H_1_70",50,75);
   objectCreate("H_1_60",50,67);
   objectCreate("H_1_50",50,59);  
   objectCreate("H_1_40",50,51);
   objectCreate("H_1_30",50,43);
   objectCreate("H_1_20",50,35);
   objectCreate("H_1_10",50,27);
   objectCreate("H_1_0",50,19);
   objectCreate("H_1",54,20,"H1",7,"Arial Narrow",SkyBlue);
   objectCreate("H_1p",54,29,DoubleToStr(9,1),8,"Arial Narrow",Silver);
   
   objectCreate("H_4_90",30,91);
   objectCreate("H_4_80",30,83);
   objectCreate("H_4_70",30,75);
   objectCreate("H_4_60",30,67);
   objectCreate("H_4_50",30,59);  
   objectCreate("H_4_40",30,51);
   objectCreate("H_4_30",30,43);
   objectCreate("H_4_20",30,35);
   objectCreate("H_4_10",30,27);
   objectCreate("H_4_0",30,19);
   objectCreate("H_4",34,20,"H4",7,"Arial Narrow",SkyBlue);
   objectCreate("H_4p",34,29,DoubleToStr(9,1),8,"Arial Narrow",Silver);

   objectCreate("D_1_90",10,91);
   objectCreate("D_1_80",10,83);
   objectCreate("D_1_70",10,75);
   objectCreate("D_1_60",10,67);
   objectCreate("D_1_50",10,59);  
   objectCreate("D_1_40",10,51);
   objectCreate("D_1_30",10,43);
   objectCreate("D_1_20",10,35);
   objectCreate("D_1_10",10,27);
   objectCreate("D_1_0",10,19);
   objectCreate("D_1",15,20,"D1",7,"Arial Narrow",SkyBlue);
   objectCreate("D_1p",14,29,DoubleToStr(9,1),8,"Arial Narrow",Silver);
   
   objectCreate("line",10,14,"-----------------------------------",10,"Arial",DimGray);  
   objectCreate("line1",10,35,"-----------------------------------",10,"Arial",DimGray);  
   objectCreate("line2",10,118,"-----------------------------------",10,"Arial",DimGray);
   objectCreate("sign",11,6,"STOCHASTIC OSCILLATORS",9,"Arial Narrow",DimGray);
   
   // MA Graphs -------------------------------------------------------------------------------
   objectCreate("2M_1_MA",130,137);
   objectCreate("2M_5_MA",110,137);
   objectCreate("2M_15_MA",90,137);
   objectCreate("2M_30_MA",70,137);
   objectCreate("2H_1_MA",50,137);
   objectCreate("2H_4_MA",30,137);
   objectCreate("2D_1_MA",10,137);   
   
   objectCreate("2M_1",135,147,"M1",7,"Arial Narrow",SkyBlue);
   objectCreate("2M_5",115,147,"M5",7,"Arial Narrow",SkyBlue);
   objectCreate("2M_15",93,147,"M15",7,"Arial Narrow",SkyBlue);
   objectCreate("2M_30",73,147,"M30",7,"Arial Narrow",SkyBlue);
   objectCreate("2H_1",54,147,"H1",7,"Arial Narrow",SkyBlue);
   objectCreate("2H_4",34,147,"H4",7,"Arial Narrow",SkyBlue);
   objectCreate("2D_1",15,147,"D1",7,"Arial Narrow",SkyBlue);
   
   objectCreate("2line",10,141,"-----------------------------------",10,"Arial",DimGray);  
   objectCreate("2line1",10,152,"-----------------------------------",10,"Arial",DimGray);  
   objectCreate("2line2",10,164,"-----------------------------------",10,"Arial",DimGray);
   objectCreate("2sign",12,132,"MOVING AVERAGE TREND",9,"Arial Narrow",DimGray);
   
   // MACD Graphs ----------------------------------------------------------------------------- 
   objectCreate("MACD_Value1",118,271,"p",20,"Wingdings 3",Lime);
   objectCreate("MACD_Value2",122,271,"X",20,"Arial",Red);
   objectCreate("MACD_Value3",118,271,"q",20,"Wingdings 3",Red);
   objectCreate("MACD_Value4",122,271,"X",20,"Arial",Lime);  
   objectCreate("MACD_Value5",122,271,"0",20,"Arial",Lime);  
   objectCreate("MACD_Value6",122,271,"0",20,"Arial",Red);  
   objectCreate("MACD_Chart",112,259,"CURRENT",7,"Arial Narrow",SkyBlue);   
   objectCreate("MACD_Line1",113,252,"---------",10,"Arial",DimGray);  
   objectCreate("MACD_Line2",113,265,"---------",10,"Arial",DimGray);  
   objectCreate("MACD_Title",115,243,"MACD",9,"Arial Narrow",DimGray);
   
   // PSAR Graph ----------------------------------------------------------------------------- 
   objectCreate("PSAR_Value1",118,206,"p",20,"Wingdings 3",Lime);
   objectCreate("PSAR_Value2",118,206,"q",20,"Wingdings 3",Red);
   objectCreate("PSAR_Chart",112,194,"CURRENT",7,"Arial Narrow",SkyBlue);  
   objectCreate("PSAR_Line1",113,187,"---------",10,"Arial",DimGray);  
   objectCreate("PSAR_Line2",113,200,"---------",10,"Arial",DimGray);  
   objectCreate("PSAR_Line3",113,229,"---------",10,"Arial",DimGray);
   objectCreate("PSAR_Title",115,178,"P-SAR",9,"Arial Narrow",DimGray);
   
   // WPR Graph -----------------------------------------------------------------------------  
   objectCreate("WPRpercent",12,300,"%",8,"Arial",Silver);
   objectCreate("WPRValue",22,300,DoubleToStr(9,1),9,"Arial",Silver);
  
   object2Create("V+5",12,288); 
   object2Create("V+4",12,280); 
   object2Create("V+3",12,272); 
   object2Create("V+2",12,264); 
   object2Create("V+1",12,256);   
   object2Create("V=0",12,248); 
   object2Create("V-1",12,240); 
   object2Create("V-2",12,232); 
   object2Create("V-3",12,224); 
   object2Create("V-4",12,216); 
   object2Create("V-5",12,208); 
   
   objectCreate("VolumeChart",10,194,"CURRENT",7,"Arial Narrow",SkyBlue);
   objectCreate("WPRLine1",10,187,"---------",10,"Arial",DimGray);  
   objectCreate("WPRLine2",10,200,"---------",10,"Arial",DimGray);  
   objectCreate("WPRLine3",10,292,"---------",10,"Arial",DimGray);
   objectCreate("WPRTitle",10,178,"WPR%",9,"Arial Narrow",DimGray);
   
   // Spread Graph ----------------------------------------------------------------------------- 
   objectCreate("SpreadLine3",60,229,"-----------",10,"Arial",DimGray);
   objectCreate("SpreadLine2",60,200,"-----------",10,"Arial",DimGray);
   objectCreate("SpreadLine1",60,187,"-----------",10,"Arial",DimGray); 
   objectCreate("SpreadPips",72,194,"PIPS",7,"Arial Narrow",SkyBlue); 
   objectCreate("SpreadTitle",61,178,"SPREAD",9,"Arial Narrow",DimGray);
   objectCreate("SpreadValue",68,206,DoubleToStr(9,1),18,"Arial",White);
   
   // MAXover Graph ------------------------------------------------------------------------ 
   objectCreate("MAXoverValue1",69,271,"p",20,"Wingdings 3",Lime);
   objectCreate("MAXoverValue2",69,271,"q",20,"Wingdings 3",Red);  
   objectCreate("MAXoverChart",64,259,"CURRENT",7,"Arial Narrow",SkyBlue);
   objectCreate("MAXoverLine1",60,252,"-----------",10,"Arial",DimGray);  
   objectCreate("MAXoverLine2",60,265,"-----------",10,"Arial",DimGray);  
   objectCreate("MAXoverTitle",70,243,"MA-X",9,"Arial Narrow",DimGray);
   
   // BarMeter Graph ------------------------------------------------------------------------
   objectCreate("BarsLine1",60,314,"----------------------",10,"Arial",DimGray);  
   objectCreate("BarsLine2",60,336,"----------------------",10,"Arial",DimGray);  
   objectCreate("BarsLine3",60,377,"----------------------",10,"Arial",DimGray);
   objectCreate("BarsTitle",67,306,"BAR % METER",9,"Arial Narrow",DimGray);
  
   object3Create("Bar_5",132,335);
   object3Create("Bar_4",114,335);
   object3Create("Bar_3",96,335);
   object3Create("Bar_2",78,335);
   object3Create("Bar_1",60,335);   
   
   objectCreate("B_5",134,320,"B5",7,"Arial Narrow",SkyBlue);
   objectCreate("B_4",116,320,"B4",7,"Arial Narrow",SkyBlue);
   objectCreate("B_3",98,320,"B3",7,"Arial Narrow",SkyBlue);
   objectCreate("B_2",80,320,"B2",7,"Arial Narrow",SkyBlue);
   objectCreate("B_1",62,320,"B1",7,"Arial Narrow",SkyBlue);
   objectCreate("BarsPercent",52,330,"%",7,"Arial Narrow",Silver);
   objectCreate("Bar_Value1",62,330,DoubleToStr(9,1),8,"Arial",White);
   objectCreate("Bar_Value2",80,330,DoubleToStr(9,1),8,"Arial",White);
   objectCreate("Bar_Value3",98,330,DoubleToStr(9,1),8,"Arial",White);
   objectCreate("Bar_Value4",116,330,DoubleToStr(9,1),8,"Arial",White);
   objectCreate("Bar_Value5",134,330,DoubleToStr(9,1),8,"Arial",White);
   objectCreate("BarsSlowing",70,385,"Slowing Down",8,"Arial",Silver);
   objectCreate("BarsSpeeding",70,385,"Speeding Up",8,"Arial",Silver);
   objectCreate("BarsStopped",83,385,"Stopped",8,"Arial",Silver);
   objectCreate("BarsSteady",85,385,"Steady",8,"Arial",Silver);
   
   // Signal Graph ------------------------------------------------------------------------
   objectCreate("SignalLine1",10,336,"---------",10,"Arial",DimGray);   
   objectCreate("SignalLine2",10,377,"---------",10,"Arial",DimGray);
   objectCreate("SignalTitle",9,327,"SIGNAL",9,"Arial Narrow",DimGray);
   objectCreate("SignalUp",10,342,"p",28,"Wingdings 3",Lime);
   objectCreate("SignalDown",10,342,"q",28,"Wingdings 3",Red);
   objectCreate("SignalWait",10,342,"6",28,"Wingdings",Silver);
   //objectCreate("SignalLine3",10,392,"----------------------------------",10,"Arial",DimGray);

   WindowRedraw();
  }
  
//+------------------------------------------------------------------+
void objectCreate(string name,int x,int y,string text="-",int size=42,
                  string font="Arial",color colour=CLR_NONE)
  {
   ObjectCreate(name,OBJ_LABEL,0,0,0);
   ObjectSet(name,OBJPROP_CORNER,3);
   ObjectSet(name,OBJPROP_COLOR,colour);
   ObjectSet(name,OBJPROP_XDISTANCE,x);
   ObjectSet(name,OBJPROP_YDISTANCE,y);
   ObjectSetText(name,text,size,font,colour);
  }

void object2Create(string name,int x,int y,string text="_",int size=42,
                  string font="Arial",color colour=CLR_NONE)
  {
   ObjectCreate(name,OBJ_LABEL,0,0,0);
   ObjectSet(name,OBJPROP_CORNER,3);
   ObjectSet(name,OBJPROP_COLOR,colour);
   ObjectSet(name,OBJPROP_XDISTANCE,x);
   ObjectSet(name,OBJPROP_YDISTANCE,y);
   ObjectSetText(name,text,size,font,colour);
  }
  
void object3Create(string name,int x,int y,string text="I",int size=36,
                  string font="Arial Bold",color colour=CLR_NONE)
  {
   ObjectCreate(name,OBJ_LABEL,0,0,0);
   ObjectSet(name,OBJPROP_CORNER,3);
   ObjectSet(name,OBJPROP_COLOR,colour);
   ObjectSet(name,OBJPROP_XDISTANCE,x);
   ObjectSet(name,OBJPROP_YDISTANCE,y);
   ObjectSetText(name,text,size,font,colour);
  }
  
void objectBlank()
  {
// Stochastic Graphs -------------------
   ObjectSet("M_1_90",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("M_1_80",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("M_1_70",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("M_1_60",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("M_1_50",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("M_1_40",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("M_1_30",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("M_1_20",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("M_1_10",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("M_1_0",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("M_1",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("M_1p",OBJPROP_COLOR,CLR_NONE);

   ObjectSet("M_5_90",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("M_5_80",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("M_5_70",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("M_5_60",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("M_5_50",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("M_5_40",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("M_5_30",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("M_5_20",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("M_5_10",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("M_5_0",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("M_5",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("M_5p",OBJPROP_COLOR,CLR_NONE);

   ObjectSet("M_15_90",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("M_15_80",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("M_15_70",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("M_15_60",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("M_15_50",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("M_15_40",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("M_15_30",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("M_15_20",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("M_15_10",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("M_15_0",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("M_15",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("M_15p",OBJPROP_COLOR,CLR_NONE);

   ObjectSet("M_30_90",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("M_30_80",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("M_30_70",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("M_30_60",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("M_30_50",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("M_30_40",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("M_30_30",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("M_30_20",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("M_30_10",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("M_30_0",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("M_30",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("M_30p",OBJPROP_COLOR,CLR_NONE);

   ObjectSet("H_1_90",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("H_1_80",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("H_1_70",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("H_1_60",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("H_1_50",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("H_1_40",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("H_1_30",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("H_1_20",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("H_1_10",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("H_1_0",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("H_1",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("H_1p",OBJPROP_COLOR,CLR_NONE);

   ObjectSet("H_4_90",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("H_4_80",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("H_4_70",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("H_4_60",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("H_4_50",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("H_4_40",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("H_4_30",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("H_4_20",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("H_4_10",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("H_4_0",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("H_4",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("H_4p",OBJPROP_COLOR,CLR_NONE);

   ObjectSet("D_1_90",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("D_1_80",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("D_1_70",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("D_1_60",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("D_1_50",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("D_1_40",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("D_1_30",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("D_1_20",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("D_1_10",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("D_1_0",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("D_1",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("D_1p",OBJPROP_COLOR,CLR_NONE);
   
   ObjectSet("line",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("line1",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("line2",OBJPROP_COLOR,CLR_NONE); 
   ObjectSet("sign",OBJPROP_COLOR,CLR_NONE);
   
   // MA Graphs -------------------
   
   ObjectSet("2M_1_MA",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("2M_5_MA",OBJPROP_COLOR,CLR_NONE); 
   ObjectSet("2M_15_MA",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("2M_30_MA",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("2H_1_MA",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("2H_4_MA",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("2D_1_MA",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("2D_1_MA",OBJPROP_COLOR,CLR_NONE);   
   
   ObjectSet("2M_1",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("2M_5",OBJPROP_COLOR,CLR_NONE); 
   ObjectSet("2M_15",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("2M_30",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("2H_1",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("2H_4",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("2D_1",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("2D_1",OBJPROP_COLOR,CLR_NONE);
   
   ObjectSet("2line1",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("2line2",OBJPROP_COLOR,CLR_NONE); 
   ObjectSet("2line",OBJPROP_COLOR,CLR_NONE); 
   ObjectSet("2sign",OBJPROP_COLOR,CLR_NONE); 
   
   // WPR Graph -------------------
   
   ObjectSet("V+5",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("V+4",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("V+3",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("V+2",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("V+1",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("V=0",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("V-1",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("V-2",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("V-3",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("V-4",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("V-5",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("VolumeChart",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("WPRTitle",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("WPRpercent",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("WPRValue",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("WPRLine1",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("WPRLine2",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("WPRLine3",OBJPROP_COLOR,CLR_NONE);
   
   // Spread Graph -------------------
   
   ObjectSet("SpreadValue",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("SpreadTitle",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("SpreadPips",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("SpreadLine1",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("SpreadLine2",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("SpreadLine3",OBJPROP_COLOR,CLR_NONE);
   
   // PSAR Graph -------------------
   
   ObjectSet("PSAR_Value1",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("PSAR_Value2",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("PSAR_Chart",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("PSAR_Line1",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("PSAR_Line2",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("PSAR_Line3",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("PSAR_Title",OBJPROP_COLOR,CLR_NONE);
   
   // MACD Graph -------------------
   
   ObjectSet("MACD_Value1",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("MACD_Value2",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("MACD_Value3",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("MACD_Value4",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("MACD_Value5",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("MACD_Value6",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("MACD_Chart",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("MACD_Line1",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("MACD_Line2",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("MACD_Title",OBJPROP_COLOR,CLR_NONE);
   
   // MA Xover Graph -------------------
   
   ObjectSet("MAXoverValue1",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("MAXoverValue2",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("MAXoverChart",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("MAXoverLine1",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("MAXoverLine2",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("MAXoverTitle",OBJPROP_COLOR,CLR_NONE);  
   
   // BarMeter Graph -------------------
   
   ObjectSet("BarsLine1",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("BarsLine2",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("BarsLine3",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("BarsTitle",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("BarsDescription",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("Bar_Value1",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("Bar_Value2",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("Bar_Value3",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("Bar_Value4",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("Bar_Value5",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("Bar_1",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("Bar_2",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("Bar_3",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("Bar_4",OBJPROP_COLOR,CLR_NONE); 
   ObjectSet("Bar_5",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("B_1",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("B_2",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("B_3",OBJPROP_COLOR,CLR_NONE); 
   ObjectSet("B_4",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("B_5",OBJPROP_COLOR,CLR_NONE); 
   ObjectSet("BarsSpeeding",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("BarsSlowing",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("BarsSteady",OBJPROP_COLOR,CLR_NONE); 
   ObjectSet("BarsStopped",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("BarsPercent",OBJPROP_COLOR,CLR_NONE);
   
   // Signal Graph -------------------
   ObjectSet("SignalLine1",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("SignalLine2",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("SignalTitle",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("SignalUp",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("SignalDown",OBJPROP_COLOR,CLR_NONE);
   ObjectSet("SignalWait",OBJPROP_COLOR,CLR_NONE); 
  }

   
void paintM1(double value)
  {
   if (value >= 90) ObjectSet("M_1_90",OBJPROP_COLOR,Lime);
   if (value >= 80) ObjectSet("M_1_80",OBJPROP_COLOR,Lime);
   if (value >= 70) ObjectSet("M_1_70",OBJPROP_COLOR,LawnGreen);   
   if (value >= 60) ObjectSet("M_1_60",OBJPROP_COLOR,GreenYellow);
   if (value >= 50) ObjectSet("M_1_50",OBJPROP_COLOR,Yellow);
   if (value >= 40) ObjectSet("M_1_40",OBJPROP_COLOR,Gold);
   if (value >= 30) ObjectSet("M_1_30",OBJPROP_COLOR,Orange);
   if (value >= 20) ObjectSet("M_1_20",OBJPROP_COLOR,DarkOrange);   
   if (value >= 10) ObjectSet("M_1_10",OBJPROP_COLOR,OrangeRed);
   if (value >= 0) ObjectSet("M_1_0",OBJPROP_COLOR,Red);
   ObjectSet("M_1",OBJPROP_COLOR,SkyBlue);
   ObjectSetText("M_1p",DoubleToStr(value,0),8,"Arial Narrow",Silver);
  }

void paintM5(double value)
  {
   if (value > 90) ObjectSet("M_5_90",OBJPROP_COLOR,Lime);
   if (value > 80) ObjectSet("M_5_80",OBJPROP_COLOR,Lime);
   if (value > 70) ObjectSet("M_5_70",OBJPROP_COLOR,LawnGreen);   
   if (value > 60) ObjectSet("M_5_60",OBJPROP_COLOR,GreenYellow);
   if (value > 50) ObjectSet("M_5_50",OBJPROP_COLOR,Yellow);
   if (value > 40) ObjectSet("M_5_40",OBJPROP_COLOR,Gold);
   if (value > 30) ObjectSet("M_5_30",OBJPROP_COLOR,Orange);
   if (value > 20) ObjectSet("M_5_20",OBJPROP_COLOR,DarkOrange);   
   if (value > 10) ObjectSet("M_5_10",OBJPROP_COLOR,OrangeRed);
   if (value > 0) ObjectSet("M_5_0",OBJPROP_COLOR,Red);
   ObjectSet("M_5",OBJPROP_COLOR,SkyBlue);
   ObjectSetText("M_5p",DoubleToStr(value,0),8,"Arial Narrow",Silver);
  }

void paintM15(double value)
  {
   if (value > 90) ObjectSet("M_15_90",OBJPROP_COLOR,Lime);
   if (value > 80) ObjectSet("M_15_80",OBJPROP_COLOR,Lime);
   if (value > 70) ObjectSet("M_15_70",OBJPROP_COLOR,LawnGreen);   
   if (value > 60) ObjectSet("M_15_60",OBJPROP_COLOR,GreenYellow);
   if (value > 50) ObjectSet("M_15_50",OBJPROP_COLOR,Yellow);
   if (value > 40) ObjectSet("M_15_40",OBJPROP_COLOR,Gold);
   if (value > 30) ObjectSet("M_15_30",OBJPROP_COLOR,Orange);
   if (value > 20) ObjectSet("M_15_20",OBJPROP_COLOR,DarkOrange);   
   if (value > 10) ObjectSet("M_15_10",OBJPROP_COLOR,OrangeRed);
   if (value > 0) ObjectSet("M_15_0",OBJPROP_COLOR,Red);
   ObjectSet("M_15",OBJPROP_COLOR,SkyBlue);
   ObjectSetText("M_15p",DoubleToStr(value,0),8,"Arial Narrow",Silver);
  }

void paintM30(double value)
  {
   if (value > 90) ObjectSet("M_30_90",OBJPROP_COLOR,Lime);
   if (value > 80) ObjectSet("M_30_80",OBJPROP_COLOR,Lime);
   if (value > 70) ObjectSet("M_30_70",OBJPROP_COLOR,LawnGreen);   
   if (value > 60) ObjectSet("M_30_60",OBJPROP_COLOR,GreenYellow);
   if (value > 50) ObjectSet("M_30_50",OBJPROP_COLOR,Yellow);
   if (value > 40) ObjectSet("M_30_40",OBJPROP_COLOR,Gold);
   if (value > 30) ObjectSet("M_30_30",OBJPROP_COLOR,Orange);
   if (value > 20) ObjectSet("M_30_20",OBJPROP_COLOR,DarkOrange);   
   if (value > 10) ObjectSet("M_30_10",OBJPROP_COLOR,OrangeRed);
   if (value > 0) ObjectSet("M_30_0",OBJPROP_COLOR,Red);
   ObjectSet("M_30",OBJPROP_COLOR,SkyBlue);
   ObjectSetText("M_30p",DoubleToStr(value,0),8,"Arial Narrow",Silver);
  }

void paintH1(double value)
  {
   if (value > 90) ObjectSet("H_1_90",OBJPROP_COLOR,Lime);
   if (value > 80) ObjectSet("H_1_80",OBJPROP_COLOR,Lime);
   if (value > 70) ObjectSet("H_1_70",OBJPROP_COLOR,LawnGreen);   
   if (value > 60) ObjectSet("H_1_60",OBJPROP_COLOR,GreenYellow);
   if (value > 50) ObjectSet("H_1_50",OBJPROP_COLOR,Yellow);
   if (value > 40) ObjectSet("H_1_40",OBJPROP_COLOR,Gold);
   if (value > 30) ObjectSet("H_1_30",OBJPROP_COLOR,Orange);
   if (value > 20) ObjectSet("H_1_20",OBJPROP_COLOR,DarkOrange);   
   if (value > 10) ObjectSet("H_1_10",OBJPROP_COLOR,OrangeRed);
   if (value > 0) ObjectSet("H_1_0",OBJPROP_COLOR,Red);
   ObjectSet("H_1",OBJPROP_COLOR,SkyBlue);
   ObjectSetText("H_1p",DoubleToStr(value,0),8,"Arial Narrow",Silver);
  }

void paintH4(double value)
  {
   if (value > 90) ObjectSet("H_4_90",OBJPROP_COLOR,Lime);
   if (value > 80) ObjectSet("H_4_80",OBJPROP_COLOR,Lime);
   if (value > 70) ObjectSet("H_4_70",OBJPROP_COLOR,LawnGreen);   
   if (value > 60) ObjectSet("H_4_60",OBJPROP_COLOR,GreenYellow);
   if (value > 50) ObjectSet("H_4_50",OBJPROP_COLOR,Yellow);
   if (value > 40) ObjectSet("H_4_40",OBJPROP_COLOR,Gold);
   if (value > 30) ObjectSet("H_4_30",OBJPROP_COLOR,Orange);
   if (value > 20) ObjectSet("H_4_20",OBJPROP_COLOR,DarkOrange);   
   if (value > 10) ObjectSet("H_4_10",OBJPROP_COLOR,OrangeRed);
   if (value > 0) ObjectSet("H_4_0",OBJPROP_COLOR,Red);
   ObjectSet("H_4",OBJPROP_COLOR,SkyBlue);
   ObjectSetText("H_4p",DoubleToStr(value,0),8,"Arial Narrow",Silver);
  }

void paintD1(double value)
  {
   if (value > 90) ObjectSet("D_1_90",OBJPROP_COLOR,Lime);
   if (value > 80) ObjectSet("D_1_80",OBJPROP_COLOR,Lime);
   if (value > 70) ObjectSet("D_1_70",OBJPROP_COLOR,LawnGreen);   
   if (value > 60) ObjectSet("D_1_60",OBJPROP_COLOR,GreenYellow);
   if (value > 50) ObjectSet("D_1_50",OBJPROP_COLOR,Yellow);
   if (value > 40) ObjectSet("D_1_40",OBJPROP_COLOR,Gold);
   if (value > 30) ObjectSet("D_1_30",OBJPROP_COLOR,Orange);
   if (value > 20) ObjectSet("D_1_20",OBJPROP_COLOR,DarkOrange);   
   if (value > 10) ObjectSet("D_1_10",OBJPROP_COLOR,OrangeRed);
   if (value > 0) ObjectSet("D_1_0",OBJPROP_COLOR,Red);
   ObjectSet("D_1",OBJPROP_COLOR,SkyBlue);
   ObjectSetText("D_1p",DoubleToStr(value,0),8,"Arial Narrow",Silver);
  }
  
void paintLine()
  {
   ObjectSet("line",OBJPROP_COLOR,DimGray);
   ObjectSet("line1",OBJPROP_COLOR,DimGray);
   ObjectSet("line2",OBJPROP_COLOR,DimGray);
   ObjectSet("sign",OBJPROP_COLOR,DimGray);
  }
  
  // MA Graphs -------------------
  
  void paintMA_M1(int value)
  {
   if (value==1) ObjectSet("2M_1_MA",OBJPROP_COLOR,Lime);
   if (value==0) ObjectSet("2M_1_MA",OBJPROP_COLOR,Red);
   ObjectSet("2M_1",OBJPROP_COLOR,SkyBlue);
  }
  
    void paintMA_M5(int value)
  {
   if (value==1) ObjectSet("2M_5_MA",OBJPROP_COLOR,Lime);
   if (value==0) ObjectSet("2M_5_MA",OBJPROP_COLOR,Red);
   ObjectSet("2M_5",OBJPROP_COLOR,SkyBlue);
  }
  
    void paintMA_M15(int value)
  {
   if (value==1) ObjectSet("2M_15_MA",OBJPROP_COLOR,Lime);
   if (value==0) ObjectSet("2M_15_MA",OBJPROP_COLOR,Red);
   ObjectSet("2M_15",OBJPROP_COLOR,SkyBlue);
  }
  
    void paintMA_M30(int value)
  {
   if (value==1) ObjectSet("2M_30_MA",OBJPROP_COLOR,Lime);
   if (value==0) ObjectSet("2M_30_MA",OBJPROP_COLOR,Red);
   ObjectSet("2M_30",OBJPROP_COLOR,SkyBlue);
  }
  
    void paintMA_H1(int value)
  {
   if (value==1) ObjectSet("2H_1_MA",OBJPROP_COLOR,Lime);
   if (value==0) ObjectSet("2H_1_MA",OBJPROP_COLOR,Red);
   ObjectSet("2H_1",OBJPROP_COLOR,SkyBlue);
  }
  
    void paintMA_H4(int value)
  {
   if (value==1) ObjectSet("2H_4_MA",OBJPROP_COLOR,Lime);
   if (value==0) ObjectSet("2H_4_MA",OBJPROP_COLOR,Red);
   ObjectSet("2H_4",OBJPROP_COLOR,SkyBlue);
  }
  
    void paintMA_D1(int value)
  {
   if (value==1) ObjectSet("2D_1_MA",OBJPROP_COLOR,Lime);
   if (value==0) ObjectSet("2D_1_MA",OBJPROP_COLOR,Red);
   ObjectSet("2D_1",OBJPROP_COLOR,SkyBlue);
  }
  
  void paint2Line()
  {
   ObjectSet("2line",OBJPROP_COLOR,DimGray);
   ObjectSet("2line1",OBJPROP_COLOR,DimGray);
   ObjectSet("2line2",OBJPROP_COLOR,DimGray);
   ObjectSet("2sign",OBJPROP_COLOR,DimGray);
  }
  
  // WPR% Graphs -------------------
  
   void paintWPRUp(int value)
  {
   if (value==1 && value>0) ObjectSet("V+5",OBJPROP_COLOR,Lime);
   if (value<=2 && value>0) ObjectSet("V+4",OBJPROP_COLOR,Lime);
   if (value<=3 && value>0) ObjectSet("V+3",OBJPROP_COLOR,LawnGreen);
   if (value<=4 && value>0) ObjectSet("V+2",OBJPROP_COLOR,LawnGreen);
   if (value<=5 && value>0) ObjectSet("V+1",OBJPROP_COLOR,GreenYellow);
  }
   void paintWPRDown(int value)
   {
   ObjectSet("V=0",OBJPROP_COLOR,Yellow);
   if (value>=6) ObjectSet("V-1",OBJPROP_COLOR,Gold);
   if (value>=7) ObjectSet("V-2",OBJPROP_COLOR,Orange);
   if (value>=8) ObjectSet("V-3",OBJPROP_COLOR,DarkOrange); 
   if (value>=9) ObjectSet("V-4",OBJPROP_COLOR,OrangeRed); 
   if (value==10) ObjectSet("V-5",OBJPROP_COLOR,Red);   
   ObjectSet("WPRLine1",OBJPROP_COLOR,DimGray);
   ObjectSet("WPRLine2",OBJPROP_COLOR,DimGray);
   ObjectSet("WPRLine3",OBJPROP_COLOR,DimGray);
   ObjectSet("WPRTitle",OBJPROP_COLOR,DimGray);
   ObjectSet("VolumeChart",OBJPROP_COLOR,SkyBlue);
   ObjectSet("WPRpercent",OBJPROP_COLOR,Silver);  
  }     
  void paintWPRValue(int value)
  {
   ObjectSetText("WPRValue",DoubleToStr(value,0),9,"Arial",White);        
  }   
   
  // Spread Graphs -------------------    
  void paintSpread(double value)
  {
   ObjectSet("SpreadPips",OBJPROP_COLOR,SkyBlue);
   ObjectSetText("SpreadValue",DoubleToStr(value,1),18,"Arial Narrow",White);
  }    
  
    void paintSpreadLines()
  {
   ObjectSet("SpreadLine1",OBJPROP_COLOR,DimGray);
   ObjectSet("SpreadLine2",OBJPROP_COLOR,DimGray);
   ObjectSet("SpreadLine3",OBJPROP_COLOR,DimGray);
   ObjectSet("SpreadTitle",OBJPROP_COLOR,DimGray);
  }
  
  // PSAR Graphs -------------------
    void paintPSAR(int value)
  {
   if (value==1) 
   {
   objectCreate("PSAR_Value1",118,206,"p",20,"Wingdings 3",Lime);
   ObjectDelete("PSAR_Value2");
   ObjectSet("PSAR_Value1",OBJPROP_COLOR,Lime); 
   }
   if (value==0) 
   {
   objectCreate("PSAR_Value2",118,206,"q",20,"Wingdings 3",Red);
   ObjectDelete("PSAR_Value1");
   ObjectSet("PSAR_Value2",OBJPROP_COLOR,Red);
   }
   ObjectSet("PSAR_Title",OBJPROP_COLOR,DimGray);
   ObjectSet("PSAR_Chart",OBJPROP_COLOR,SkyBlue);
   ObjectSet("PSAR_Line1",OBJPROP_COLOR,DimGray);
   ObjectSet("PSAR_Line2",OBJPROP_COLOR,DimGray);
   ObjectSet("PSAR_Line3",OBJPROP_COLOR,DimGray);
  }
  
    // MACD Graphs -------------------
    void paintMACD(int value)
  {
   if (value==3) 
   {
   objectCreate("MACD_Value1",118,271,"p",20,"Wingdings 3",Lime);
   ObjectDelete("MACD_Value2");
   ObjectDelete("MACD_Value3");
   ObjectDelete("MACD_Value4");
   ObjectDelete("MACD_Value5");
   ObjectDelete("MACD_Value6");
   ObjectSet("MACD_Value1",OBJPROP_COLOR,Lime);
   }
   if (value==2) 
   {
   objectCreate("MACD_Value2",122,271,"X",20,"Arial",Red);
   ObjectDelete("MACD_Value4");
   ObjectDelete("MACD_Value3");
   ObjectDelete("MACD_Value1");
   ObjectDelete("MACD_Value5");
   ObjectDelete("MACD_Value6");
   ObjectSet("MACD_Value2",OBJPROP_COLOR,Red);
   }
   if (value==1) 
   {
   objectCreate("MACD_Value3",118,271,"q",20,"Wingdings 3",Red);
   ObjectDelete("MACD_Value2");
   ObjectDelete("MACD_Value4");
   ObjectDelete("MACD_Value1");
   ObjectDelete("MACD_Value5");
   ObjectDelete("MACD_Value6");
   ObjectSet("MACD_Value3",OBJPROP_COLOR,Red); 
   }
   if (value==0) 
   {
   objectCreate("MACD_Value4",122,271,"X",20,"Arial",Lime);   
   ObjectDelete("MACD_Value2");
   ObjectDelete("MACD_Value3");
   ObjectDelete("MACD_Value1");
   ObjectDelete("MACD_Value5");
   ObjectDelete("MACD_Value6");
   ObjectSet("MACD_Value4",OBJPROP_COLOR,Lime);
   }
   if (value==4) 
   {
   objectCreate("MACD_Value5",122,271,"0",20,"Arial",Lime);   
   ObjectDelete("MACD_Value2");
   ObjectDelete("MACD_Value3");
   ObjectDelete("MACD_Value1");
   ObjectDelete("MACD_Value4");
   ObjectDelete("MACD_Value6");
   ObjectSet("MACD_Value5",OBJPROP_COLOR,Lime);
   }
   if (value==5) 
   {
   objectCreate("MACD_Value6",122,271,"0",20,"Arial",Red);   
   ObjectDelete("MACD_Value2");
   ObjectDelete("MACD_Value3");
   ObjectDelete("MACD_Value1");
   ObjectDelete("MACD_Value4");
   ObjectDelete("MACD_Value5");
   ObjectSet("MACD_Value6",OBJPROP_COLOR,Red);
   }      
   ObjectSet("MACD_Title",OBJPROP_COLOR,DimGray);
   ObjectSet("MACD_Chart",OBJPROP_COLOR,SkyBlue);
   ObjectSet("MACD_Line1",OBJPROP_COLOR,DimGray);
   ObjectSet("MACD_Line2",OBJPROP_COLOR,DimGray);
  }
  
    // MAXover Graphs -------------------
    void paintMAXover(int value)
  {
   if (value==1) 
   {
   objectCreate("MAXoverValue1",69,271,"p",20,"Wingdings 3",Lime);
   ObjectDelete("MAXoverValue2");
   ObjectSet("MAXoverValue1",OBJPROP_COLOR,Lime); 
   }
   if (value==0) 
   {
   objectCreate("MAXoverValue2",69,271,"q",20,"Wingdings 3",Red);
   ObjectDelete("MAXoverValue1");
   ObjectSet("MAXoverValue2",OBJPROP_COLOR,Red);
   }
   ObjectSet("MAXoverTitle",OBJPROP_COLOR,DimGray);
   ObjectSet("MAXoverChart",OBJPROP_COLOR,SkyBlue);
   ObjectSet("MAXoverLine1",OBJPROP_COLOR,DimGray);
   ObjectSet("MAXoverLine2",OBJPROP_COLOR,DimGray);
  }
  // BarMeter Graphs -------------------------------
  
  void paintBar1(double value)
  {
   if (value == 11) ObjectSet("Bar_1",OBJPROP_COLOR,C'035,035,035');
   if (value == 12) ObjectSet("Bar_1",OBJPROP_COLOR,C'000,000,000');
   if (value == 1) ObjectSet("Bar_1",OBJPROP_COLOR,C'000,255,000');
   if (value == 2) ObjectSet("Bar_1",OBJPROP_COLOR,C'000,200,000');
   if (value == 3) ObjectSet("Bar_1",OBJPROP_COLOR,C'000,150,000');
   if (value == 4) ObjectSet("Bar_1",OBJPROP_COLOR,C'000,100,000');   
   if (value == 5) ObjectSet("Bar_1",OBJPROP_COLOR,C'000,070,000');
   if (value == 6) ObjectSet("Bar_1",OBJPROP_COLOR,C'070,000,000');
   if (value == 7) ObjectSet("Bar_1",OBJPROP_COLOR,C'100,000,000');
   if (value == 8) ObjectSet("Bar_1",OBJPROP_COLOR,C'150,000,000');   
   if (value == 9) ObjectSet("Bar_1",OBJPROP_COLOR,C'200,000,000');
   if (value == 10) ObjectSet("Bar_1",OBJPROP_COLOR,C'255,000,000');
  }  
    void paintBar2(double value)
  {
   if (value == 11) ObjectSet("Bar_2",OBJPROP_COLOR,C'035,035,035');
   if (value == 12) ObjectSet("Bar_2",OBJPROP_COLOR,C'000,000,000');
   if (value == 1) ObjectSet("Bar_2",OBJPROP_COLOR,C'000,255,000');
   if (value == 2) ObjectSet("Bar_2",OBJPROP_COLOR,C'000,200,000');
   if (value == 3) ObjectSet("Bar_2",OBJPROP_COLOR,C'000,150,000');
   if (value == 4) ObjectSet("Bar_2",OBJPROP_COLOR,C'000,100,000');   
   if (value == 5) ObjectSet("Bar_2",OBJPROP_COLOR,C'000,070,000');
   if (value == 6) ObjectSet("Bar_2",OBJPROP_COLOR,C'070,000,000');
   if (value == 7) ObjectSet("Bar_2",OBJPROP_COLOR,C'100,000,000');
   if (value == 8) ObjectSet("Bar_2",OBJPROP_COLOR,C'150,000,000');   
   if (value == 9) ObjectSet("Bar_2",OBJPROP_COLOR,C'200,000,000');
   if (value == 10) ObjectSet("Bar_2",OBJPROP_COLOR,C'255,000,000');
  }  
    void paintBar3(double value)
  {
   if (value == 11) ObjectSet("Bar_3",OBJPROP_COLOR,C'035,035,035');
   if (value == 12) ObjectSet("Bar_3",OBJPROP_COLOR,C'000,000,000');
   if (value == 1) ObjectSet("Bar_3",OBJPROP_COLOR,C'000,255,000');
   if (value == 2) ObjectSet("Bar_3",OBJPROP_COLOR,C'000,200,000');
   if (value == 3) ObjectSet("Bar_3",OBJPROP_COLOR,C'000,150,000');
   if (value == 4) ObjectSet("Bar_3",OBJPROP_COLOR,C'000,100,000');   
   if (value == 5) ObjectSet("Bar_3",OBJPROP_COLOR,C'000,070,000');
   if (value == 6) ObjectSet("Bar_3",OBJPROP_COLOR,C'070,000,000');
   if (value == 7) ObjectSet("Bar_3",OBJPROP_COLOR,C'100,000,000');
   if (value == 8) ObjectSet("Bar_3",OBJPROP_COLOR,C'150,000,000');   
   if (value == 9) ObjectSet("Bar_3",OBJPROP_COLOR,C'200,000,000');
   if (value == 10) ObjectSet("Bar_3",OBJPROP_COLOR,C'255,000,000');
  }  
    void paintBar4(double value)
  {
   if (value == 11) ObjectSet("Bar_4",OBJPROP_COLOR,C'035,035,035');
   if (value == 12) ObjectSet("Bar_4",OBJPROP_COLOR,C'000,000,000');
   if (value == 1) ObjectSet("Bar_4",OBJPROP_COLOR,C'000,255,000');
   if (value == 2) ObjectSet("Bar_4",OBJPROP_COLOR,C'000,200,000');
   if (value == 3) ObjectSet("Bar_4",OBJPROP_COLOR,C'000,150,000');
   if (value == 4) ObjectSet("Bar_4",OBJPROP_COLOR,C'000,100,000');   
   if (value == 5) ObjectSet("Bar_4",OBJPROP_COLOR,C'000,070,000');
   if (value == 6) ObjectSet("Bar_4",OBJPROP_COLOR,C'070,000,000');
   if (value == 7) ObjectSet("Bar_4",OBJPROP_COLOR,C'100,000,000');
   if (value == 8) ObjectSet("Bar_4",OBJPROP_COLOR,C'150,000,000');   
   if (value == 9) ObjectSet("Bar_4",OBJPROP_COLOR,C'200,000,000');
   if (value == 10) ObjectSet("Bar_4",OBJPROP_COLOR,C'255,000,000');
  }  
    void paintBar5(double value)
  {
   if (value == 11) ObjectSet("Bar_5",OBJPROP_COLOR,C'035,035,035');
   if (value == 12) ObjectSet("Bar_5",OBJPROP_COLOR,C'000,000,000');
   if (value == 1) ObjectSet("Bar_5",OBJPROP_COLOR,C'000,255,000');
   if (value == 2) ObjectSet("Bar_5",OBJPROP_COLOR,C'000,200,000');
   if (value == 3) ObjectSet("Bar_5",OBJPROP_COLOR,C'000,150,000');
   if (value == 4) ObjectSet("Bar_5",OBJPROP_COLOR,C'000,100,000');   
   if (value == 5) ObjectSet("Bar_5",OBJPROP_COLOR,C'000,070,000');
   if (value == 6) ObjectSet("Bar_5",OBJPROP_COLOR,C'070,000,000');
   if (value == 7) ObjectSet("Bar_5",OBJPROP_COLOR,C'100,000,000');
   if (value == 8) ObjectSet("Bar_5",OBJPROP_COLOR,C'150,000,000');   
   if (value == 9) ObjectSet("Bar_5",OBJPROP_COLOR,C'200,000,000');
   if (value == 10) ObjectSet("Bar_5",OBJPROP_COLOR,C'255,000,000');
  }  
   void paintBars()
  {
   ObjectSet("BarsLine1",OBJPROP_COLOR,DimGray);
   ObjectSet("BarsLine2",OBJPROP_COLOR,DimGray);
   ObjectSet("BarsLine3",OBJPROP_COLOR,DimGray);
   ObjectSet("BarsTitle",OBJPROP_COLOR,DimGray);
   ObjectSet("BarsPercent",OBJPROP_COLOR,Silver);
   ObjectSet("BarsDescription",OBJPROP_COLOR,DimGray);
   ObjectSet("B_1",OBJPROP_COLOR,SkyBlue);
   ObjectSet("B_2",OBJPROP_COLOR,SkyBlue);
   ObjectSet("B_3",OBJPROP_COLOR,SkyBlue);
   ObjectSet("B_4",OBJPROP_COLOR,SkyBlue);
   ObjectSet("B_5",OBJPROP_COLOR,SkyBlue);
  }  
   void paintBarValue1(double value)
  {
  ObjectSetText("Bar_Value1",DoubleToStr(value,0),8,"Arial Narrow",White);
  }    
  void paintBarValue2(double value)
  {
  ObjectSetText("Bar_Value2",DoubleToStr(value,0),8,"Arial Narrow",DimGray);
  } 
  void paintBarValue3(double value)
  {
  ObjectSetText("Bar_Value3",DoubleToStr(value,0),8,"Arial Narrow",DimGray);
  } 
  void paintBarValue4(double value)
  {
  ObjectSetText("Bar_Value4",DoubleToStr(value,0),8,"Arial Narrow",DimGray);
  } 
  void paintBarValue5(double value)
  {
  ObjectSetText("Bar_Value5",DoubleToStr(value,0),8,"Arial Narrow",DimGray);
  } 
  void paintBarReading(int value)
  {
   if (value==1) 
   {
   objectCreate("BarsStopped",83,385,"Stopped",8,"Arial",Silver);
   ObjectDelete("BarsSpeeding");
   ObjectDelete("BarsSteady");
   ObjectDelete("BarsSlowing");
   ObjectSet("BarsStopped",OBJPROP_COLOR,Silver); 
   }
   if (value==2) 
   {
   objectCreate("BarsSpeeding",70,385,"Speeding Up",8,"Arial",Silver);
   ObjectDelete("BarsStopped");
   ObjectDelete("BarsSteady");
   ObjectDelete("BarsSlowing");
   ObjectSet("BarsSpeeding",OBJPROP_COLOR,Silver);
   }
   if (value==3) 
   {
   objectCreate("BarsSteady",85,385,"Steady",8,"Arial",Silver);
   ObjectDelete("BarsSpeeding");
   ObjectDelete("BarsStopped");
   ObjectDelete("BarsSlowing");
   ObjectSet("BarsSteady",OBJPROP_COLOR,Silver); 
   }
   if (value==4) 
   {
   objectCreate("BarsSlowing",70,385,"Slowing Down",8,"Arial",Silver);
   ObjectDelete("BarsSpeeding");
   ObjectDelete("BarsSteady");
   ObjectDelete("BarsStopped");
   ObjectSet("BarsSlowing",OBJPROP_COLOR,Silver);
   }
  }
  
   // Signal Graphs -------------------
    void paintSignal(int value)
  {
   if (value==1) 
   {
   objectCreate("SignalDown",10,342,"q",28,"Wingdings 3",Red);
   ObjectDelete("SignalUp");
   ObjectDelete("SignalWait");
   ObjectSet("SignalDown",OBJPROP_COLOR,Red); 
   }
   if (value==2) 
   {
   objectCreate("SignalUp",10,342,"p",28,"Wingdings 3",Lime);
   ObjectDelete("SignalDown");
   ObjectDelete("SignalWait");
   ObjectSet("SignalUp",OBJPROP_COLOR,Lime);
   }
   if (value==0) 
   {
   objectCreate("SignalWait",17,342,"6",28,"Wingdings",Silver);
   ObjectDelete("SignalDown");
   ObjectDelete("SignalUp");
   ObjectSet("SignalWait",OBJPROP_COLOR,DimGray);
   }
   ObjectSet("SignalLine1",OBJPROP_COLOR,DimGray);
   ObjectSet("SignalLine2",OBJPROP_COLOR,DimGray);
   ObjectSet("SignalTitle",OBJPROP_COLOR,DimGray);
  return(0);
    }
   
