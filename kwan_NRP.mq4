//+------------------------------------------------------------------+
//|                                                                  |
//|                 Copyright © 1999-2008, MetaQuotes Software Corp. |
//|                                         http://www.metaquotes.ru |
//+------------------------------------------------------------------+
#property copyright "Metatrader4 Code by jjk2. Based on MBA Thesis from Simon Fraser University written by C.E. ALDEA."
#property link      ""
#property indicator_separate_window
#property indicator_buffers 2
#property indicator_color1 Blue
#property indicator_color2 Red
//----
extern int Count_Bars=1000;

extern string stoch = "Stochastic";
extern int Kperiod = 9;
extern int Dperiod = 6;
extern int slowing = 2;
extern int method_stoch = MODE_SMA;
extern int price_field = 1;
extern int mode = 0;

extern string rsi = "RSI";
extern int period_rsi = 9;

extern string mom = "Momentum";
extern int period_momentum = 9;

//---- buffers
double ExtMapBuffer1[];
double ExtMapBuffer2[];
double ExtMapBuffer3[];
double Formula[];
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int init()
  {
//---- indicator drawing
   IndicatorBuffers(4);
   SetIndexStyle(0,DRAW_ARROW,STYLE_SOLID,3);
   SetIndexBuffer(0,ExtMapBuffer1);
   SetIndexStyle(1,DRAW_ARROW,STYLE_SOLID,3);
   SetIndexBuffer(1,ExtMapBuffer3);
   SetIndexStyle(2,DRAW_NONE,STYLE_SOLID,3,Yellow);//DRAW_NONE,EMPTY,EMPTY);
   SetIndexBuffer(2,ExtMapBuffer2);
   SetIndexBuffer(3,Formula);
   ///-----Name of Indicator 
   string short_name="ZigZag BETA    Current value calculated by indicator:";
   IndicatorShortName(short_name);
//----
   return(0);
  }
//+------------------------------------------------------------------+
//| Custom indicator deinitialization function                       |
//+------------------------------------------------------------------+
int deinit()
  {
//----
//----
   return(0);
  }
//+------------------------------------------------------------------+
//| Custom indicator iteration function                              |
//+------------------------------------------------------------------+
int start()
  {
   int pos=0;
   if (Count_Bars>Bars) {pos=Bars;}else{pos=Count_Bars;}
   int temp=pos;
   while(pos>=0)
     {
      //string xxx = "pos"; 
      double Stoch=iStochastic(NULL,0,Kperiod,Dperiod,slowing,method_stoch,price_field,mode,pos+1);
      double RSI=iRSI(NULL,0,period_rsi,PRICE_OPEN,pos);
      double moment=(iMomentum(NULL,0,period_momentum,PRICE_OPEN,pos));
      //Main Forumla
      //double preFormula = (/Momentum);
      if (moment!=0)
         ExtMapBuffer2[pos]=Stoch*(RSI)/moment;
      //Alert("MACD: ", MACD," ","Stoch: ", Stoch," ", "RSI: ", RSI," ","Momentum: ", momentum," ","Volume: ", Volu);
      //Alert(Stoch*(RSI)/Roc);
      pos--;
     }
     while(temp >=0) 
     {
      ExtMapBuffer1[temp]=EMPTY_VALUE;
      ExtMapBuffer3[temp]=EMPTY_VALUE;
      Formula[temp]=iMAOnArray(ExtMapBuffer2,0,2,0,MODE_SMA,temp);
        if (Formula[temp]>Formula[temp+1])
        {
         ExtMapBuffer1[temp]=Formula[temp];
         if (ExtMapBuffer1[temp+1]==EMPTY_VALUE) ExtMapBuffer1[temp+1]=Formula[temp+1];
         }
         else
         {
         ExtMapBuffer3[temp]=Formula[temp];
         if (ExtMapBuffer3[temp+1]==EMPTY_VALUE) ExtMapBuffer3[temp+1]=Formula[temp+1];
        }
     temp--; 
     }
//----
   return(0);
  }
//+------------------------------------------------------------------+