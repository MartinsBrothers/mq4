//+------------------------------------------------------------------+
//|                                                  OnChart MFI.mq4 |
//|                               Copyright © 2022, Koros Jafarzadeh |
//|                   https://www.mql5.com/en/users/koros0111/seller |
//+------------------------------------------------------------------+
#property copyright "Copyright © 2022, Koros Jafarzadeh, Telegram ID : @KorosJafarzadeh"
#property link      "https://www.mql5.com/en/users/koros0111/seller"
//----
#property indicator_chart_window
#property indicator_buffers 4
#property indicator_color1 clrDarkSlateGray
#property indicator_color2 clrDarkSlateGray
#property indicator_color3 clrDarkSlateGray
#property indicator_color4 clrDarkOrange
#property indicator_width4 2
#property indicator_style1 STYLE_DOT
//---- parameters
extern ENUM_TIMEFRAMES    TimeFrame    = PERIOD_CURRENT; // TimeFrame
extern int                MFIPeriod    = 14;             // MFI Period
extern int                maPeriod     = 20;             // MA Period
extern int                maMethod     = 1;              // MA Method
extern int                maPrice      = 0;              // MA Price
extern int                overBought   = 70;             // OverBought
extern int                overSold     = 30;             // OverSold

//---- buffers
double ExtMapBuffer1[];
double ExtMapBuffer2[];
double ExtMapBuffer3[];
double ExtMapBuffer4[];
datetime RTimeArray[];
datetime TTimeArray[];
ENUM_TIMEFRAMES atrTimeFrame;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int init()
  {
   SetIndexBuffer(0, ExtMapBuffer1);
   SetIndexBuffer(1, ExtMapBuffer2);
   SetIndexBuffer(2, ExtMapBuffer3);
   SetIndexBuffer(3, ExtMapBuffer4);
//----
   atrTimeFrame = PERIOD_D1;
   if(TimeFrame >= atrTimeFrame)
      switch(TimeFrame)
        {
         case PERIOD_D1:
            atrTimeFrame = PERIOD_W1;
            break;
         default:
            atrTimeFrame = PERIOD_MN1;
        }
   return(0);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int deinit()
  {
   return(0);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int start()
  {
   double maValue;
   double avgRange;
   double mfiValue;
   int    counted_bars = IndicatorCounted();
   int    limit;
   int    i, r, y;
//----
   if(counted_bars < 0)
      return(-1);
   if(counted_bars > 0)
      counted_bars--;
   limit = Bars - counted_bars;
//----
   ArrayCopySeries(RTimeArray, MODE_TIME, NULL, atrTimeFrame);
   ArrayCopySeries(TTimeArray, MODE_TIME, NULL, TimeFrame);
//----
   for(i = 0, r = 0, y = 0; i < limit; i++)
     {
      if(Time[i] < RTimeArray[r])
         r++;
      if(Time[i] < TTimeArray[y])
         y++;
      avgRange        = iATR(NULL, atrTimeFrame, maPeriod, r);
      maValue         = iMA(NULL, TimeFrame, maPeriod, 0, maMethod, maPrice, y);
      mfiValue        = iMFI(NULL, TimeFrame, MFIPeriod, y);
      ExtMapBuffer1[i] = maValue;
      ExtMapBuffer2[i] = maValue + (avgRange * (overBought - 50) / 100);
      ExtMapBuffer3[i] = maValue - (avgRange * (50 -  overSold) / 100);
      ExtMapBuffer4[i] = maValue + avgRange * (mfiValue - 50) / 100;
     }
   return(0);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int stringToTimeFrame(string tfs)
  {
   int tf = 0;
   tfs = StringUpperCase(tfs);
   if(tfs == "M1" || tfs == "1")
      tf = PERIOD_M1;
   if(tfs == "M5" || tfs == "5")
      tf = PERIOD_M5;
   if(tfs == "M15" || tfs == "15")
      tf = PERIOD_M15;
   if(tfs == "M30" || tfs == "30")
      tf = PERIOD_M30;
   if(tfs == "H1" || tfs == "60")
      tf = PERIOD_H1;
   if(tfs == "H4" || tfs == "240")
      tf = PERIOD_H4;
   if(tfs == "D1" || tfs == "1440")
      tf = PERIOD_D1;
   if(tfs == "W1" || tfs == "10080")
      tf = PERIOD_W1;
   if(tfs == "MN" || tfs == "43200")
      tf = PERIOD_MN1;
   if(tf < Period())
      tf = Period();
   return(tf);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string StringUpperCase(string str)
  {
   string   s = str;
   int      lenght = StringLen(str) - 1;
   int      Char;
//----
   while(lenght >= 0)
     {
      Char = StringGetChar(s, lenght);
      //----
      if((Char > 96 && Char < 123) || (Char > 223 && Char < 256))
         s = StringSetChar(s, lenght, Char - 32);
      else
         if(Char > -33 && Char < 0)
            s = StringSetChar(s, lenght, Char + 224);
      lenght--;
     }
//----
   return(s);
  }
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
