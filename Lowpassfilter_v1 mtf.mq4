//+------------------------------------------------------------------+
//|                                             LowPassFilter_v1.mq4 |
//|                           Copyright © 2007, TrendLaboratory Ltd. |
//|            http://finance.groups.yahoo.com/group/TrendLaboratory |
//|                                   E-mail: igorad2003@yahoo.co.uk |
//+------------------------------------------------------------------+
#property copyright "Copyright © 2007, TrendLaboratory Ltd."
#property link      "http://finance.groups.yahoo.com/group/TrendLaboratory"
//---- indicator settings
#property indicator_chart_window 
#property indicator_buffers 5 
#property indicator_color1  clrYellow 
#property indicator_color2  clrLightBlue 
#property indicator_color3  clrLightBlue 
#property indicator_color4  clrTomato 
#property indicator_color5  clrTomato 
#property indicator_width1  2
#property indicator_width2  2
#property indicator_width3  2 
#property indicator_width4  2
#property indicator_width5  2 
//---- indicator parameters
extern ENUM_TIMEFRAMES  TimeFrame = PERIOD_CURRENT; // Time frame
extern ENUM_APPLIED_PRICE Price          = 0;  //Price mode : 0-Close,1-Open,2-High,3-Low,4-Median,5-Typical,6-Weighted
extern int     Order          = 3;  //Filter Order: 1-EMA,2-2nd Order,3-3rd Order
extern int     FilterPeriod   =14;  //Filter Period 
extern int     PreSmooth      = 1;  //Pre-smoothing period
extern int     PreSmoothMode  = 0;  //Pre-smoothing MA Mode: 0-SMA,1-EMA,2-SMMA,3-LWMA
extern double  PctFilter      = 0;  //Dynamic filter in decimal(multiplier for StdDev)
extern bool     ColorMode     = 0;  //Color mode true/false
extern int     ColorBarBack   = 1;  //Should be 0 or 1 
extern int     AlertMode      = 0;  //Sound Alert switch (0-off,1-on) 
extern int     WarningMode    = 0;  //Sound Warning switch(0-off,1-on) 
input bool     Interpolate    = true;              // Interpolate in mtf mode
//---- indicator buffers
double     Filter[];
double     UpTrend[];
double     DnTrend[];
double     Smoother[];
double     trend[];
double     Del[];
double     AvgDel[],valda[],valdb[],valua[],valub[],count[];

int        draw_begin;
bool       UpTrendAlert=false, DownTrendAlert=false;
string indicatorFileName;
#define _mtfCall(_buff,_ind) iCustom(NULL,TimeFrame,indicatorFileName,PERIOD_CURRENT,Price,Order,FilterPeriod,PreSmooth,PreSmoothMode,PctFilter,ColorMode,ColorBarBack,AlertMode,WarningMode,_buff,_ind)
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int init()
{
//---- indicator buffers mapping
   IndicatorBuffers(10);
   SetIndexBuffer(0,Filter);
   SetIndexBuffer(1,valua); 
   SetIndexBuffer(2,valub);
   SetIndexBuffer(3,valda);
   SetIndexBuffer(4,valdb);
   SetIndexBuffer(5,Smoother);
   SetIndexBuffer(6,trend);  
   SetIndexBuffer(7,Del);
   SetIndexBuffer(8,AvgDel);
   SetIndexBuffer(9,count);
//---- drawing settings
   SetIndexStyle(0,DRAW_LINE);
   SetIndexStyle(1,DRAW_LINE);
   SetIndexStyle(2,DRAW_LINE);
   draw_begin = FilterPeriod + PreSmooth;
   SetIndexDrawBegin(0,draw_begin);
   SetIndexDrawBegin(1,draw_begin);
   SetIndexDrawBegin(2,draw_begin);
   IndicatorDigits(MarketInfo(Symbol(),MODE_DIGITS)+1);
//---- name for DataWindow and indicator subwindow label
   IndicatorShortName("LowPassFilter("+Order+","+FilterPeriod+")");
   SetIndexLabel(0,"LowPassFilter");
   SetIndexLabel(1,"UpTrend");
   SetIndexLabel(2,"DnTrend");
//---- initialization done
   indicatorFileName = WindowExpertName();
   TimeFrame         = fmax(TimeFrame,_Period);
   return(0);
}
//+------------------------------------------------------------------+
//| LowPassFilter_v1                                                 |
//+------------------------------------------------------------------+
int start()
{
   int counted_bars=IndicatorCounted();
      if(counted_bars<0) return(-1);
      if(counted_bars>0) counted_bars--;
         int limit = fmin(Bars-counted_bars,Bars-1); count[0] = limit;
         
         //
         //
         //
         
         if (TimeFrame != Period())
         {
            limit = (int)MathMax(limit,MathMin(Bars-1,_mtfCall(9,0)*TimeFrame/_Period));
            if (ColorMode && trend[limit]==-1) CleanPoint(limit,Bars,valda,valdb);
            if (ColorMode && trend[limit]== 1) CleanPoint(limit,Bars,valua,valub);
            for(int i=limit; i>=0 && !_StopFlag; i--)
            {
               int y = iBarShift(NULL,TimeFrame,Time[i]);
                  Filter[i]  = _mtfCall(0,y);
                  trend[i]   = _mtfCall(6,y); 
                  valda[i]   = valdb[i] = valua[i] = valub[i] = EMPTY_VALUE;
              
                  //
                  //
                  //
                     
                  if (!Interpolate || (i>0 && y==iBarShift(NULL,TimeFrame,Time[i-1]))) continue;
                    #define _interpolate(buff) buff[i+k] = buff[i]+(buff[i+n]-buff[i])*k/n
                    int n,k; datetime btime = iTime(NULL,TimeFrame,y);
                       for(n = 1; (i+n)<Bars && Time[i+n] >= btime; n++) continue;	
                       for(k = 1; k<n && (i+n)<Bars && (i+k)<Bars; k++) _interpolate(Filter); 
                                       
              }
         for (i=limit; i >= 0; i--)
         {
             if (ColorMode && trend[i]==-1) PlotPoint(i,Bars,valda,valdb,Filter);
             if (ColorMode && trend[i]== 1) PlotPoint(i,Bars,valua,valub,Filter);
	      }     
   return(0);
   }  
   
   //
   //
   //
             
   int shift;
   double a, b, c;
   
   if(counted_bars<1)
   for(i=1;i<=draw_begin;i++) 
   {
   Filter[Bars-i]=0; 
   UpTrend[Bars-i]=0; 
   DnTrend[Bars-i]=0;
   }
//---- last counted bar will be recounted
   if (ColorMode && trend[limit]==-1) CleanPoint(limit,Bars,valda,valdb);
   if (ColorMode && trend[limit]== 1) CleanPoint(limit,Bars,valua,valub);
   for(shift=limit; shift>=0; shift--) Smoother[shift] = iMA(NULL,0,PreSmooth,0,PreSmoothMode,Price,shift);
   for(shift=limit; shift>=0; shift--)
   {
      if(Order == 1) Filter[shift] = iMAOnArray(Smoother,0,FilterPeriod,0,1,shift);
      else
		if(Order == 2) 
		{
		  a = exp(-sqrt(2)*M_PI/FilterPeriod);
		  b = 2*a*cos(sqrt(2)*M_PI/FilterPeriod);
    	  Filter[shift] = b*Filter[shift+1] - a*a*Filter[shift+2] + (1 - b + a*a)*Smoother[shift];
		}
		
		else
		if(Order == 3) 
		{
		  a = exp(-M_PI/FilterPeriod);
		  b = 2*a*cos(sqrt(3)*M_PI/FilterPeriod);
    	  c = exp(-2*M_PI/FilterPeriod); //a * a;
    	  Filter[shift] = (b+c)*Filter[shift+1] - (c+b*c)*Filter[shift+2] + c*c*Filter[shift+3] + (1-b+c)*(1-c)*Smoother[shift];
		}
  
   int Length = FilterPeriod;
      
      if (PctFilter>0)
      {
      Del[shift] = MathAbs(Filter[shift] - Filter[shift+1]);
   
      double sumdel=0;
      for (int j=0;j<=Length-1;j++) sumdel = sumdel+Del[shift+j];
      AvgDel[shift] = sumdel/Length;
    
      double sumpow = 0;
      for (j=0;j<=Length-1;j++) sumpow+=MathPow(Del[j+shift]-AvgDel[j+shift],2);
      double StdDev = MathSqrt(sumpow/Length); 
     
      double filter = PctFilter * StdDev;
     
      if(MathAbs(Filter[shift]-Filter[shift+1]) < filter ) Filter[shift]=Filter[shift+1];
      }
      else
      filter=0;
   
      
      
         valda[shift] = valdb[shift] = valua[shift] = valub[shift] = EMPTY_VALUE;
         trend[shift] = trend[shift+1];
 
         if (Filter[shift] - Filter[shift+1] > filter) trend[shift] = 1;
         if (Filter[shift+1] - Filter[shift] > filter) trend[shift] =-1;
         if (ColorMode && trend[shift]==-1) PlotPoint(shift,Bars,valda,valdb,Filter);
         if (ColorMode && trend[shift]== 1) PlotPoint(shift,Bars,valua,valub,Filter);
    
         if (trend[shift]>0)
         {
            //UpTrend[shift] = Filter[shift]; 
            //if (trend[shift+ColorBarBack]<0) UpTrend[shift+ColorBarBack]=Filter[shift+ColorBarBack];
            //DnTrend[i] = EMPTY_VALUE;
            if (WarningMode>0 && trend[shift+1]<0 && shift==0) PlaySound("alert2.wav");
         }
         else              
         if (trend[shift]<0)
         { 
            //DnTrend[shift] = Filter[shift]; 
            //if (trend[shift+ColorBarBack]>0) DnTrend[shift+ColorBarBack]=Filter[shift+ColorBarBack];
            //UpTrend[shift] = EMPTY_VALUE;
            if (WarningMode>0 && trend[shift+1]>0 && shift==0) PlaySound("alert2.wav");
         }               
     // }
   }         
//----------   
   string Message;
   
   if ( trend[2]<0 && trend[1]>0 && Volume[0]>1 && !UpTrendAlert)
	{
	Message = " "+Symbol()+" M"+Period()+": Lowpassfilter Signal for BUY";
	if ( AlertMode>0 ) Alert (Message); 
	UpTrendAlert=true; DownTrendAlert=false;
	} 
	 	  
	if ( trend[2]>0 && trend[1]<0 && Volume[0]>1 && !DownTrendAlert)
	{
	Message = " "+Symbol()+" M"+Period()+": Lowpassfilter Signal for SELL";
	if ( AlertMode>0 ) Alert (Message); 
	DownTrendAlert=true; UpTrendAlert=false;
	} 	         
//---- done
   return(0);
}

//-------------------------------------------------------------------
//                                                                  
//-------------------------------------------------------------------

void CleanPoint(int i,int bars,double& first[],double& second[])
{
   if (i>=bars-3) return;
   if ((second[i]  != EMPTY_VALUE) && (second[i+1] != EMPTY_VALUE))
        second[i+1] = EMPTY_VALUE;
   else
      if ((first[i] != EMPTY_VALUE) && (first[i+1] != EMPTY_VALUE) && (first[i+2] == EMPTY_VALUE))
          first[i+1] = EMPTY_VALUE;
}

void PlotPoint(int i,int bars,double& first[],double& second[],double& from[])
{
   if (i>=bars-2) return;
   if (first[i+1] == EMPTY_VALUE)
      if (first[i+2] == EMPTY_VALUE) 
            { first[i]  = from[i]; first[i+1]  = from[i+1]; second[i] = EMPTY_VALUE; }
      else  { second[i] = from[i]; second[i+1] = from[i+1]; first[i]  = EMPTY_VALUE; }
   else     { first[i]  = from[i];                          second[i] = EMPTY_VALUE; }
}


//
//
//

string sTfTable[] = {"M1","M5","M15","M30","H1","H4","D1","W1","MN"};
int    iTfTable[] = {1,5,15,30,60,240,1440,10080,43200};

string timeFrameToString(int tf)
{
   for (int i=ArraySize(iTfTable)-1; i>=0; i--) 
         if (tf==iTfTable[i]) return(sTfTable[i]);
                              return("");
}

