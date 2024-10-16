//+------------------------------------------------------------------+
//|                                       Two_MA_Cross_Indicator.mq4 |
//|                               Copyright © 2017, Gehtsoft USA LLC |
//|                                            http://fxcodebase.com |
//+------------------------------------------------------------------+
//|                         Donate / Support:  https://goo.gl/9Rj74e |
//|                     BitCoin: 15VCJTLaz12Amr7adHSBtL9v8XomURo9RF  | 
//+------------------------------------------------------------------+
//|                                      Developed by : Mario Jemic  |                    
//|                                          mario.jemic@gmail.com   |
//+------------------------------------------------------------------+

#property copyright "Copyright © 2017, Gehtsoft USA LLC"
#property link      "http://fxcodebase.com"

#property description "This indicator shows the crossing between two MAs"

#property indicator_chart_window
#property indicator_buffers 4

#property indicator_color1  clrRed
#property indicator_width1  1
#property indicator_color2  clrWhite
#property indicator_width2  2
#property indicator_color3  clrLime
#property indicator_width3  2
#property indicator_color4  clrRed
#property indicator_width4  2

enum e_method{ SMA        =  1,
               EMA        =  2,
               Wilder     =  3,
               LWMA       =  4,
               SineWMA    =  5,
               TriMA      =  6,
               LSMA       =  7,
               SMMA       =  8,
               HMA        =  9,
               ZeroLagEMA = 10,
               ITrend     = 11,
               Median     = 12,
               GeoMean    = 13,
               REMA       = 14,
               ILRS       = 15,
               IE_2       = 16,
               TriMAgen   = 17
             };

extern int      MA_Period1     = 30;
extern e_method MA_Method1     = SMA;
extern ENUM_APPLIED_PRICE  MA_Price_Type1 = PRICE_CLOSE;
extern int      MA_Period2     = 100;
extern e_method MA_Method2     = SMA;
extern ENUM_APPLIED_PRICE  MA_Price_Type2 = PRICE_CLOSE;
extern int      Limit_Bars     = 800;

double MA1[], MA2[];
double Price1[], Price2[];
double Up[], Dn[];

//+****************************************************************+

int init(){
   
   IndicatorShortName("Two MA Cross Indicator");
   IndicatorBuffers(6);
   
   SetIndexStyle(0,DRAW_LINE);
   SetIndexBuffer(0,MA1);
   SetIndexLabel(0,"MA1");
   SetIndexDrawBegin(0,Limit_Bars);
   
   SetIndexStyle(1,DRAW_LINE);
   SetIndexBuffer(1,MA2);
   SetIndexLabel(1,"MA2");
   SetIndexDrawBegin(1,Limit_Bars);
   
   SetIndexStyle(2,DRAW_ARROW);
   SetIndexBuffer(2,Up);
   SetIndexArrow(2,233);
   SetIndexLabel(2,"Up");
   
   SetIndexStyle(3,DRAW_ARROW);
   SetIndexBuffer(3,Dn);
   SetIndexArrow(3,234);
   SetIndexLabel(3,"Dn");
   
   SetIndexBuffer(4,Price1);
   SetIndexBuffer(5,Price2);
   
   return(0);
  }
  
//+****************************************************************+

  
int start(){
   
   int i;
   int counted_bars=IndicatorCounted();
   int limit = Bars-counted_bars-1;
   if (Limit_Bars) limit = Limit_Bars;
   
   int multiplier = 1;   
   
   for(i=limit; i>=0; i--){
      
      Price1[i] = iMA(NULL,0,1,0,0,ENUM_APPLIED_PRICE(MA_Price_Type1),i);
      
      switch(MA_Method1){
         case 1 : MA1[i] = SMA(Price1,MA_Period1,i, multiplier); break;
         case 2 : MA1[i] = EMA(Price1[i],MA1[i+(1*multiplier)],MA_Period1,i); break;
         case 3 : MA1[i] = Wilder(Price1[i],MA1[i+(1*multiplier)],MA_Period1,i); break;  
         case 4 : MA1[i] = LWMA(Price1,MA_Period1,i, multiplier); break;
         case 5 : MA1[i] = SineWMA(Price1,MA_Period1,i, multiplier); break;
         case 6 : MA1[i] = TriMA(Price1,MA_Period1,i, multiplier); break;
         case 7 : MA1[i] = LSMA(Price1,MA_Period1,i, multiplier); break;
         case 8 : MA1[i] = SMMA(Price1,MA1[i+(1*multiplier)],MA_Period1,i, multiplier); break;
         case 9 : MA1[i] = HMA(Price1,MA_Period1,i, multiplier); break;
         case 10: MA1[i] = ZeroLagEMA(Price1,MA1[i+(1*multiplier)],MA_Period1,i, multiplier); break;
         case 11: MA1[i] = ITrend(Price1,MA1,MA_Period1,i, multiplier); break;
         case 12: MA1[i] = Median(Price1,MA_Period1,i, multiplier); break;
         case 13: MA1[i] = GeoMean(Price1,MA_Period1,i, multiplier); break;
         case 14: MA1[i] = REMA(Price1[i],MA1,MA_Period1,0.5,i, multiplier); break;
         case 15: MA1[i] = ILRS(Price1,MA_Period1,i, multiplier); break;
         case 16: MA1[i] = IE2(Price1,MA_Period1,i, multiplier); break;
         case 17: MA1[i] = TriMA_gen(Price1,MA_Period1,i, multiplier); break;
         default: MA1[i] = SMA(Price1,MA_Period1,i, multiplier); break;
      }
      
   }
   
   for(i=limit; i>=0; i--){
      
      Price2[i] = iMA(NULL,0,1,0,0,ENUM_APPLIED_PRICE(MA_Price_Type2),i);
      
      switch(MA_Method2){
         case 1 : MA2[i] = SMA(Price2,MA_Period2,i, multiplier); break;
         case 2 : MA2[i] = EMA(Price2[i],MA2[i+(1*multiplier)],MA_Period2,i); break;
         case 3 : MA2[i] = Wilder(Price2[i],MA2[i+(1*multiplier)],MA_Period2,i); break;  
         case 4 : MA2[i] = LWMA(Price2,MA_Period2,i, multiplier); break;
         case 5 : MA2[i] = SineWMA(Price2,MA_Period2,i, multiplier); break;
         case 6 : MA2[i] = TriMA(Price2,MA_Period2,i, multiplier); break;
         case 7 : MA2[i] = LSMA(Price2,MA_Period2,i, multiplier); break;
         case 8 : MA2[i] = SMMA(Price2,MA2[i+(1*multiplier)],MA_Period2,i, multiplier); break;
         case 9 : MA2[i] = HMA(Price2,MA_Period2,i, multiplier); break;
         case 10: MA2[i] = ZeroLagEMA(Price2,MA2[i+(1*multiplier)],MA_Period2,i, multiplier); break;
         case 11: MA2[i] = ITrend(Price2,MA2,MA_Period2,i, multiplier); break;
         case 12: MA2[i] = Median(Price2,MA_Period2,i, multiplier); break;
         case 13: MA2[i] = GeoMean(Price2,MA_Period2,i, multiplier); break;
         case 14: MA2[i] = REMA(Price2[i],MA2,MA_Period2,0.5,i, multiplier); break;
         case 15: MA2[i] = ILRS(Price2,MA_Period2,i, multiplier); break;
         case 16: MA2[i] = IE2(Price2,MA_Period2,i, multiplier); break;
         case 17: MA2[i] = TriMA_gen(Price2,MA_Period2,i, multiplier); break;
         default: MA2[i] = SMA(Price2,MA_Period2,i, multiplier); break;
      }
      
   }
   
   for (i=Limit_Bars; i>=(Limit_Bars-MathMax(MA_Period1,MA_Period2)); i--){
      MA1[i] = EMPTY_VALUE;
      MA2[i] = EMPTY_VALUE;
   }
   
   for(i=limit; i>=0; i--){
   
      if (MA2[i+1]>MA1[i+1] && MA2[i]<MA1[i]){
         Up[i]=MA1[i];
      }
      else{
         Up[i]=EMPTY_VALUE;
      }
      if (MA2[i+1]<MA1[i+1] && MA2[i]>MA1[i]){
         Dn[i]=MA1[i];
      }
      else{
         Dn[i]=EMPTY_VALUE;
      }
      
   }
   
   return(0);
   
}
  
double SMA(double &array[],int per,int bar, int mult=1){
   double Sum = 0;
   for(int i = 0;i < per;i++) Sum += array[bar+(i*mult)];
   return(Sum/per);
}                

double EMA(double price,double prev,int per,int bar){
   if(bar >= Bars - 2)
      double ema = price;
   else 
      ema = prev + 2.0/(1+per)*(price - prev); 
   return(ema);
}

double Wilder(double price,double prev,int per,int bar){
   if(bar >= Bars - 2)
      double wilder = price;
   else 
      wilder = prev + (price - prev)/per; 
   return(wilder);
}

double LWMA(double &array[],int per,int bar, int mult=1){
   double Sum = 0;
   double Weight = 0;
   for(int i = 0;i < per;i++){ 
      Weight+= (per - i);
      Sum += array[bar+(i*mult)]*(per - i);
   }
   if(Weight>0)
      double lwma = Sum/Weight;
   else
      lwma = 0; 
   return(lwma);
} 

double SineWMA(double &array[],int per,int bar, int mult=1){
   double pi = 3.1415926535;
   double Sum = 0;
   double Weight = 0;
   for(int i = 0;i < per;i++){ 
      Weight+= MathSin(pi*(i+1)/(per+1));
      Sum += array[bar+(i*mult)]*MathSin(pi*(i+1)/(per+1)); 
   }
   if(Weight>0)
      double swma = Sum/Weight;
   else
      swma = 0; 
   return(swma);
}

double TriMA(double &array[],int per,int bar, int mult=1){
   double sma;
   int len = MathCeil((per+1)*0.5);
   double sum=0;
   for(int i = 0;i < len;i++) {
      sma = SMA(array,len,bar+(i*mult),mult);
      sum += sma;
   } 
   double trima = sum/len;
   return(trima);
}

double LSMA(double &array[],int per,int bar, int mult=1){   
   double Sum=0;
   for(int i=per; i>=1; i--) Sum += (i-(per+1)/3.0)*array[bar+((per-i)*mult)];
   double lsma = Sum*6/(per*(per+1));
   return(lsma);
}

double SMMA(double &array[],double prev,int per,int bar, int mult=1){
   if(bar == Bars - per)
      double smma = SMA(array,per,bar, mult);
   else if(bar < Bars - per){
      double Sum = 0;
      for(int i = 0;i < per;i++) Sum += array[bar+((i+1)*mult)];
      smma = (Sum - prev + array[bar])/per;
   }
   return(smma);
}                

double HMA(double &array[],int per,int bar, int mult=1){
   double tmp1[];
   int len = MathSqrt(per);
   ArrayResize(tmp1,len);
   if(bar == Bars - per)
      double hma = array[bar]; 
   else if(bar < Bars - per){
      for(int i=0;i<len;i++) tmp1[i] = 2*LWMA(array,per/2,bar+(i*mult),mult) - LWMA(array,per,bar+(i*mult),mult);  
      hma = LWMA(tmp1,len,0); 
   }  
   return(hma);
}

double ZeroLagEMA(double &price[],double prev,int per,int bar, int mult=1){
   double alfa = 2.0/(1+per); 
   int lag = 0.5*(per - 1); 
   if(bar >= Bars - lag)
      double zema = price[bar];
   else 
      zema = alfa*(2*price[bar] - price[bar+(lag*mult)]) + (1-alfa)*prev;
   return(zema);
}

double ITrend(double &price[],double &array[],int per,int bar, int mult=1){
   double alfa = 2.0/(per+1);
   if (bar < Bars - 7)
      double it = (alfa - 0.25*alfa*alfa)*price[bar] + 0.5*alfa*alfa*price[bar+(1*mult)] - (alfa - 0.75*alfa*alfa)*price[bar+(2*mult)] + 2*(1-alfa)*array[bar+(1*mult)] - (1-alfa)*(1-alfa)*array[bar+(2*mult)];
   else
      it = (price[bar] + 2*price[bar+(1*mult)] + price[bar+(2*mult)])/4;
   return(it);
}

double Median(double &price[],int per,int bar, int mult=1){
   double array[];
   ArrayResize(array,per);
   for(int i = 0; i < per;i++) array[i] = price[bar+(i*mult)];
   ArraySort(array);
   int num = MathRound((per-1)/2); 
   if(MathMod(per,2) > 0) double median = array[num]; else median = 0.5*(array[num]+array[num+1]);
   return(median); 
}

double GeoMean(double &price[],int per,int bar, int mult=1){
   if(bar < Bars - per){ 
      double gmean = MathPow(price[bar],1.0/per); 
      for(int i = 1; i < per;i++) gmean *= MathPow(price[bar+(i*mult)],1.0/per); 
   }   
   return(gmean);
}

double REMA(double price,double &array[],int per,double lambda,int bar, int mult=1){
   double alpha =  2.0/(per + 1);
   if(bar >= Bars - 3)
      double rema = price;
   else 
      rema = (array[bar+(1*mult)]*(1+2*lambda) + alpha*(price - array[bar+(1*mult)]) - lambda*array[bar+(2*mult)])/(1+lambda);    
   return(rema);
}

double ILRS(double &price[],int per,int bar, int mult=1){
   double sum = per*(per-1)*0.5;
   double sum2 = (per-1)*per*(2*per-1)/6.0;
   double sum1 = 0;
   double sumy = 0;
   for(int i=0;i<per;i++){ 
      sum1 += i*price[bar+(i*mult)];
      sumy += price[bar+(i*mult)];
   }
   double num1 = per*sum1 - sum*sumy;
   double num2 = sum*sum - per*sum2;
   if(num2 != 0) double slope = num1/num2; else slope = 0; 
   double ilrs = slope + SMA(price,per,bar,mult);
   return(ilrs);
}

double IE2(double &price[],int per,int bar, int mult=1){
   double ie = 0.5*(ILRS(price,per,bar,mult) + LSMA(price,per,bar,mult));
   return(ie); 
}
 

double TriMA_gen(double &array[],int per,int bar, int mult=1){
   int len1 = MathFloor((per+1)*0.5);
   int len2 = MathCeil((per+1)*0.5);
   double sum=0;
   for(int i = 0;i < len2;i++) sum += SMA(array,len1,bar+(i*mult),mult);
   double trimagen = sum/len2;
   return(trimagen);
}