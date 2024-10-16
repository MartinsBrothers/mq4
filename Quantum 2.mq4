#property copyright ""
#property strict
                          
#property indicator_chart_window
#property  indicator_buffers 2 
#property  indicator_color1 clrBlue
#property  indicator_color2 clrRed
#property  indicator_width1 5
#property  indicator_width2 5

extern int LookBackPeriod = 300; // Look back period
double arru[],arrd[];

//------------------------------------------------------------------
//
//------------------------------------------------------------------
int OnInit()
{
   SetIndexBuffer(0,arru); SetIndexStyle(0,DRAW_ARROW);  SetIndexArrow(0,250); 
   SetIndexBuffer(1,arrd); SetIndexStyle(1,DRAW_ARROW);  SetIndexArrow(1,250); 
   IndicatorShortName( "Quantum("+(string)LookBackPeriod+")" );
   return(INIT_SUCCEEDED);
}
void OnDeinit(const int& reason) {   return; }
int OnCalculate (const int       rates_total,
                 const int       prev_calculated,
                 const datetime& time[],
                 const double&   open[],
                 const double&   high[],
                 const double&   low[],
                 const double&   close[],
                 const long&     tick_volume[],
                 const long&     volume[],
                 const int&      spread[] )
{
   int counted_bars = prev_calculated;
      if(counted_bars < 0) return(-1);
      if(counted_bars > 0) counted_bars--;
      for(int i=MathMin(rates_total-counted_bars,rates_total-1); i>=0 && !_StopFlag; i--)
      {
         arru[i] = (ArrayMinimum(low ,LookBackPeriod,i)==i) ? low[i]  : EMPTY_VALUE;
         arrd[i] = (ArrayMaximum(high,LookBackPeriod,i)==i) ? high[i] : EMPTY_VALUE;
      }
   return(rates_total);
}