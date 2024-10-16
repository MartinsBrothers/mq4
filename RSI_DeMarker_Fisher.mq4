//+------------------------------------------------------------------+
//|                                     !jl_RSi_DeMarker_Graalun.mq4 |
//|                                                        jeanlouie |
//|                                     https://www.forexfactory.com |
//+------------------------------------------------------------------+
#property copyright "jeanlouie"
#property link      "https://www.forexfactory.com"
#property version   "1.00"
#property description "This indicator displays the RSI, DeMarker and Fisher indicators in the same sub-window."
" Appropriate scaling has been applied to fit 0-100, 0-1, and -3-3 scales onto a 0-100 scale."
#property strict
#property indicator_separate_window
#property indicator_buffers 3


input int rsi_period = 12;                            //RSI period
input color rsi_color = clrDodgerBlue;                //__ color
input int rsi_width = 1;                              //__ width
input ENUM_LINE_STYLE rsi_style = STYLE_SOLID;        //__ style
input int demarker_period = 12;                       //DeMarker period
input color demarker_color = clrRed;                  //__ color
input int demarker_width = 1;                         //__ width
input ENUM_LINE_STYLE demarker_style = STYLE_SOLID;   //__ style
input int fisher_period = 12;                         //Fisher period
input bool fisher_flip = 0;                           //__ flip
input color fisher_color = clrYellow;                 //__ color
input int fisher_width = 1;                           //__ width
input ENUM_LINE_STYLE fisher_style = STYLE_SOLID;     //__ style
input string note_a = "";                             //Levels
input int level_1 = 70;                               //__ top
input int level_2 = 50;                               //__ middle
input int level_3 = 30;                               //__ bottom
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+

int fish_flip = 1+(fisher_flip*-2);
double rsi_buff[];
double dem_buff[];
double fish_buff[];
int OnInit()
  {
   string a = "RSI("+IntegerToString(rsi_period)+")";
   string b = "DeMarker("+IntegerToString(demarker_period)+")";
   string c = "Fisher("+IntegerToString(fisher_period)+")";
   
   IndicatorShortName(a+b+c);
   
   SetIndexBuffer(0, rsi_buff); 
   SetIndexStyle(0, DRAW_LINE,rsi_style,rsi_width,rsi_color);
   SetIndexLabel(0, "RSI"); 
  
   SetIndexBuffer(1, dem_buff); 
   SetIndexStyle(1, DRAW_LINE,demarker_style,demarker_width,demarker_color);
   SetIndexLabel(1, "DeMarker"); 
   
   SetIndexBuffer(2, fish_buff); 
   SetIndexStyle(2, DRAW_LINE,fisher_style,fisher_width,fisher_color);
   SetIndexLabel(2, "Fisher"); 
   
   IndicatorSetDouble(INDICATOR_MAXIMUM,100);
   IndicatorSetDouble(INDICATOR_MINIMUM,0);
   
   IndicatorSetInteger(INDICATOR_LEVELS,3);
   SetLevelStyle(STYLE_DOT,1);
   
   IndicatorSetDouble(INDICATOR_LEVELVALUE,0,level_1);
   IndicatorSetDouble(INDICATOR_LEVELVALUE,1,level_2);
   IndicatorSetDouble(INDICATOR_LEVELVALUE,2,level_3);

   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Custom indicator iteration function                              |
//+------------------------------------------------------------------+
double fish_temp[];
int OnCalculate(const int rates_total,
                const int prev_calculated,
                const datetime &time[],
                const double &open[],
                const double &high[],
                const double &low[],
                const double &close[],
                const long &tick_volume[],
                const long &volume[],
                const int &spread[])
  {
ArraySetAsSeries(fish_temp,false);
if(ArraySize(fish_temp)!=Bars){ArrayResize(fish_temp,Bars,0);}
ArraySetAsSeries(fish_temp,true);

int lookback = 1;
int limit = MathMax(Bars-1-IndicatorCounted()-lookback,0);
for(int i = limit; i >= 0; i--)
{
   rsi_buff[i] = iRSI(Symbol(),0,rsi_period,PRICE_CLOSE,i);
   dem_buff[i] = iDeMarker(Symbol(),0,demarker_period,i)*100;

}

//copy and pasted GRAALun/Fisher transform portion with reverse direction i loop
int limit2;
int counted_bars;
double Value=0,Value1=0,Value2=0,Fish=0,Fish1=0,Fish2=0;
double price;
double MinL=0;
double MaxH=0;
   
   counted_bars=IndicatorCounted();

   if(counted_bars>0) counted_bars--;
   limit2=Bars-counted_bars;

   for(int i=0; i<limit2-1; i++)
   {
      MaxH = High[iHighest(NULL,0,MODE_HIGH,fisher_period,i)];
      MinL = Low[iLowest(NULL,0,MODE_LOW,fisher_period,i)];
      price = (High[i]+Low[i])/2;

      if(MaxH-MinL == 0) Value = 0.33*2*(0-0.5) + 0.67*Value1;
      else Value = 0.33*2*((price-MaxH)/(MinL-MaxH)-0.5) + 0.67*Value1;
      Value=MathMin(MathMax(Value,-0.999),0.999);
      if(1-Value == 0) fish_temp[i]=0.5+0.5*Fish1;
      else fish_temp[i]=0.5*MathLog((1+Value)/(1-Value))+0.5*Fish1;

      Value1=Value;
      Fish1=fish_temp[i];
      fish_buff[i] = fish_temp[i]*fish_flip*16+50;
   }
   return(rates_total);
  }
//+------------------------------------------------------------------+
