//+------------------------------------------------------------------+
//|                                            103.Cronex Taichi.mq4 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                                                Cronex Taichi.mq4 |
//|                                        Copyright � 2007, Cronex. |
//|                                       http://www.metaquotes.net/ |
//+------------------------------------------------------------------+
#property  copyright "Copyright � 2007, Cronex"
#property  link      "http://www.metaquotes.net/"
//---- indicator settings
#property  indicator_chart_window
#property  indicator_buffers 6
#property  indicator_color1  Silver
#property  indicator_color2  Red
#property  indicator_color3  Lime
#property  indicator_color4  DarkOrange
#property  indicator_color5  DeepSkyBlue
#property  indicator_color6  DeepSkyBlue
#property  indicator_width1  2
#property  indicator_width4  2

//---- indicator parameters

extern int Tenkan=9;
extern int Kijun=26;
extern int Senkou=52;
extern int FlatSE=7;
//---- indicator buffers
double     TaichiBuffer[];
double     TaichiForBuffer[];
double     SignalBuffer[];
double     SSignalBuffer[];
double     FlatBuffer1[];
double     FlatBuffer2[];

//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int init()
  {
//---- drawing settings
   SetIndexStyle(0,DRAW_LINE);
   SetIndexStyle(1,DRAW_LINE);
   SetIndexStyle(2,DRAW_LINE);
   SetIndexStyle(3,DRAW_LINE);
   SetIndexStyle(4,DRAW_HISTOGRAM,STYLE_DOT);
   SetIndexStyle(5,DRAW_HISTOGRAM,STYLE_DOT);


//   SetIndexDrawBegin(1,SignalSMA);
   IndicatorDigits(Digits+1);
//---- indicator buffers mapping
   SetIndexBuffer(0,TaichiBuffer);
   SetIndexBuffer(1,SignalBuffer);
   SetIndexBuffer(2,SSignalBuffer);   
   SetIndexBuffer(3,TaichiForBuffer);
   SetIndexBuffer(4,FlatBuffer1);
   SetIndexBuffer(5,FlatBuffer2);
   SetIndexShift(3,Kijun);
//   SetIndexDrawBegin(3,Kijun);
//---- name for DataWindow and indicator subwindow label
   IndicatorShortName("Cronex Taichi");
   SetIndexLabel(0,"Taichi");
   SetIndexLabel(1,"Signal");
   SetIndexLabel(2,"SSignal");
   SetIndexLabel(3,"TaichiFor");
   SetIndexLabel(4,"FlatUp");
   SetIndexLabel(5,"FlatDn");
//---- initialization done
   return(0);
  }
//+------------------------------------------------------------------+
//| Cronex Taichi                                                    |
//+------------------------------------------------------------------+
int start()
  {
  
   double TenkanSen,KijunSen,SenkouSpanA,SenkouSpanB,ChinkouSpan;
  
   int limit;
   int counted_bars=IndicatorCounted();
//---- last counted bar will be recounted
   if(counted_bars>0) counted_bars--;
   limit=Bars-counted_bars;
//---- macd counted in the 1-st buffer
   for(int i=-Kijun; i<limit; i++)
      {
      TenkanSen   = iIchimoku(NULL,0,Tenkan,Kijun,Senkou,MODE_TENKANSEN,i);
      KijunSen    = iIchimoku(NULL,0,Tenkan,Kijun,Senkou,MODE_KIJUNSEN,i);
      SenkouSpanA = iIchimoku(NULL,0,Tenkan,Kijun,Senkou,MODE_SENKOUSPANA,i);
      SenkouSpanB = iIchimoku(NULL,0,Tenkan,Kijun,Senkou,MODE_SENKOUSPANB,i);
      ChinkouSpan = iIchimoku(NULL,0,Tenkan,Kijun,Senkou,MODE_CHINKOUSPAN,i);      
      if (i>=0)
       {
        TaichiBuffer[i]=(TenkanSen+KijunSen+SenkouSpanA+SenkouSpanB)/4;
        TaichiForBuffer[i+Kijun]=(SenkouSpanA+SenkouSpanB)/2;
       }
      else TaichiForBuffer[i+Kijun]=(SenkouSpanA+SenkouSpanB)/2;
      }
//========================== signal line counted ================
   for(i=0; i<limit; i++)
    {
     SignalBuffer[i]=iMAOnArray(TaichiBuffer,Bars,Kijun,0,MODE_LWMA,i);
     SSignalBuffer[i]=iMAOnArray(TaichiBuffer,Bars,Senkou,0,MODE_LWMA,i);   
     FlatBuffer1[i]=0;
     FlatBuffer2[i]=0;
//========================== Flat line counted ================
   if(MathAbs(((TaichiBuffer[i]-SignalBuffer[i])+(TaichiBuffer[i]- SSignalBuffer[i])+(SignalBuffer[i]-SSignalBuffer[i]))/3)<FlatSE*Point)
    {
     FlatBuffer1[i]=SignalBuffer[i]+FlatSE*Point;
     FlatBuffer2[i]=SignalBuffer[i]-FlatSE*Point;       
    }

    }
//---- done

   return(0);
  }

  
//+------------------------------------------------------------------+
        
