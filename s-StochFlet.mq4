//+------------------------------------------------------------------+
//|                                                  s-StochFlet.mq4 |
//|                      Copyright © 2011, MetaQuotes Software Corp. |
//|                                        http://www.metaquotes.net |
//+------------------------------------------------------------------+
#property copyright "Copyright © 2011, MetaQuotes Software Corp."
#property link      "http://www.metaquotes.net"

#property copyright "Copyright © 2010, MetaQuotes Software Corp."
#property link      "http://www.metaquotes.net"

#property indicator_separate_window
#property indicator_minimum 0
#property indicator_maximum 100
#property indicator_buffers 5
#property indicator_color1 EMPTY
#property indicator_color2 EMPTY
#property indicator_color3 Green
#property indicator_color4 Crimson
#property indicator_color5 SkyBlue
#property indicator_level1 80
#property indicator_level2 50
#property indicator_level3 20
#property indicator_levelcolor Maroon
#property indicator_levelwidth 1
#property indicator_levelstyle STYLE_DOT


//---- input parameters
extern int KPeriod=21;
extern int DPeriod=12;
extern int Slowing=3;
extern int method=0;//0-Ïðîñòîå ñêîëüçÿùåå ñðåäíåå,1-Ýêñïîíåíöèàëüíîå ñêîëüçÿùåå ñðåäíåå,
                    //2-Ñãëàæåííîå ñêîëüçÿùåå ñðåäíåå,3-Ëèíåéíî-âçâåøåííîå ñêîëüçÿùåå ñðåäíåå
extern int price=0;//0 - Low/High èëè 1 - Close/Close
extern string äëÿ_WPR="";
extern int ExtWPRPeriod = 14;  
               
extern double ZoneHighPer = 70;
extern double ZoneLowPer = 30;
extern bool modeone=true;
extern bool PlaySoundBuy = true;
extern bool PlaySoundSell = true;
int CheckBarForSound = 0;
extern string FileSoundBuy = "mkbell";
extern string FileSoundSell = "mkbell";

//---- buffers
double MainBuffer[];
double SignalBuffer[];

double LineUpBuffer[];
double LineDnBuffer[];
double ExtWPRBuffer[];

//----
int draw_begin1=0;
int draw_begin2=0;

datetime BarSoundTime = 0;

//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int init()
  {
   string short_name;
//---- 2 additional buffers are used for counting.
   IndicatorBuffers(5);
//---- indicator lines
   SetIndexStyle(0,DRAW_LINE,EMPTY,1);
   SetIndexBuffer(0, MainBuffer);
   SetIndexStyle(1,DRAW_LINE,EMPTY,1);
   SetIndexBuffer(1, SignalBuffer);
   SetIndexStyle(2,DRAW_HISTOGRAM,EMPTY,2);
   SetIndexBuffer(2, LineUpBuffer);
   SetIndexStyle(3,DRAW_HISTOGRAM,EMPTY,2);
   SetIndexBuffer(3, LineDnBuffer);
   SetIndexStyle(4,DRAW_LINE,EMPTY,1);
   SetIndexBuffer(4, ExtWPRBuffer);   
   
//---- name for DataWindow and indicator subwindow label
   short_name="s-StochFlet";
   IndicatorShortName(short_name);
   SetIndexLabel(0,short_name);
   SetIndexLabel(1,"Signal");
//----
   draw_begin1=KPeriod+Slowing;
   draw_begin2=draw_begin1+DPeriod;
  SetIndexDrawBegin(0,draw_begin1);
  SetIndexDrawBegin(1,draw_begin2);
  SetIndexDrawBegin(4, ExtWPRPeriod);
//----
   SetIndexEmptyValue(2,indicator_minimum);
   SetIndexEmptyValue(3,indicator_minimum);
   return(0);
  }
//+------------------------------------------------------------------+
//| Stochastic oscillator                                            |
//+------------------------------------------------------------------+
datetime LastUpTime=0,LastDnTime=0;
int direction=0;

int start()
  {
   int    i,k;
   int    counted_bars=IndicatorCounted();
   double price;
      double dMaxHigh, dMinLow; 
//----
   if(Bars<=draw_begin2) return(0);
//---- initial zero
   if(counted_bars<1)
     {
      for(i=1;i<=draw_begin1;i++) MainBuffer[Bars-i]=0;
      for(i=1;i<=draw_begin2;i++) SignalBuffer[Bars-i]=0;
     }

//---- last counted bar will be recounted
   if(counted_bars>0) counted_bars--;
   int limit=Bars-counted_bars;
//---- signal line is simple movimg average
   for(i=0; i<limit; i++)
   {
      MainBuffer[i]=iStochastic(NULL,0,KPeriod,DPeriod,Slowing,method,price,MODE_MAIN,i);
      SignalBuffer[i]=iStochastic(NULL,0,21,DPeriod,Slowing,method,price,MODE_SIGNAL,i);
      
   }
   

   i = Bars - ExtWPRPeriod - 1;
   if(counted_bars > ExtWPRPeriod) 
       i = Bars - counted_bars - 1;  
   while(i >= 0)
     {

       dMaxHigh = High[Highest(NULL, 0, MODE_HIGH, ExtWPRPeriod, i)];
       dMinLow = Low[Lowest(NULL, 0, MODE_LOW, ExtWPRPeriod, i)];      
       if(!CompareDouble((dMaxHigh - dMinLow), 0.0))
      
           ExtWPRBuffer[i] = 100+(-100*(dMaxHigh - Close[i]) / (dMaxHigh - dMinLow));
           
      i--;
     }

//---- vertical line draw
   if(counted_bars>0) counted_bars--;
     limit=Bars-counted_bars;
   for(i=limit-1; i>=0; i--)
   {
      double SS0 = SignalBuffer[i];
      double SS1 = SignalBuffer[i+1];
      double SF0 = MainBuffer[i];
      double SF1 = MainBuffer[i+1];

      if ((SF0>SS0) && (SF1<SS1) // ïåðåñå÷åíèå Ñèãíàëüíîé ëèíèè Ìàéíîì
      && (SF1<ZoneLowPer) && (SS1<ZoneLowPer))
       {
            LineUpBuffer[i] = indicator_maximum;
            int idx = iBarShift(NULL,0,LastUpTime);
            if(modeone && idx != i && direction == 1)LineUpBuffer[idx] = indicator_minimum;
            LastUpTime=Time[i];
            direction = 1;
      }
      else LineUpBuffer[i] = indicator_minimum;

      if ((SF0<SS0) && (SF1>SS1) && // ïåðåñå÷åíèå Ñèãíàëüíîé ëèíèè Ìàéíîì
         (SF1>ZoneHighPer) && (SS1>ZoneHighPer)) {
            LineDnBuffer[i] = indicator_maximum;
            idx = iBarShift(NULL,0,LastDnTime);
            if(modeone && idx != i && direction == -1)LineDnBuffer[idx] = indicator_minimum;
            LastDnTime=Time[i];
            direction = -1;
      }
      else LineDnBuffer[i] = indicator_minimum;
   }
//----
  if (PlaySoundBuy && (LineUpBuffer[CheckBarForSound]>0))
  {
     if (BarSoundTime!=Time[CheckBarForSound])
        PlaySound(FileSoundBuy);
     BarSoundTime = Time[CheckBarForSound];
  }

  if (PlaySoundSell && (LineDnBuffer[CheckBarForSound]>0))
  {
     if (BarSoundTime!=Time[CheckBarForSound])
        PlaySound(FileSoundSell);
     BarSoundTime = Time[CheckBarForSound];
  }

   return(0);
  }
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//| Ôóíêöèÿ ñðàíåíèÿ äâóõ âåùåñòâåííûõ ÷èñåë.                        |
//+------------------------------------------------------------------+
bool CompareDouble(double Number1, double Number2)
  {
    bool Compare = NormalizeDouble(Number1 - Number2, 8) == 0;
    return(Compare);
  } 
//+------------------------------------------------------------------+ 