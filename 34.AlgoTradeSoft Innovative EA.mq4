//+------------------------------------------------------------------+
//|                         AlgoTradeSoft Innovative EA unlocked.mq4 |
//|                        Copyright 2016, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2016, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict
//--- input parameters
input string   Expert_Properties====================================================================================;
input int      Expert_Id=8888;
input string   Expert_Comment=AlgoTradeSoft;
input string   Order_Properties====================================================================================;
input string   Spread_Properties=-----------------------S P R E A D------------------------------------------------------------------------------------------------------------------------;
input double   Spread_MaxAverage=2.0;
input bool     Spread_FastBackTest=true;
input string   Lot_Properties=-----------------------L O T--------------------------------------------------------------------------------------------------------------------------------------;
input int      Lot_Type=1;
input double   Lot_FixedSize=0.1;
input double   Lot_Risk=1.0;
input double   Lot_Max=0.0;
input double   Lot_PersonalPercent=0.0;
input string   StopLoss_Properties=-----------------------S T O P - L O S S--------------------------------------------------------------------------------------------------------------------;
input double   StopLoss_FixedSize=1.5;
input string   TakeProfit_Properties=-----------------------T A K E - P R O F I T----------------------------------------------------------------------------------------------------------------;
input double   TakeProfit_FixedSize=150.0;
input string   BreakEven_Properties=-----------------------B R E A K - E V E N------------------------------------------------------------------------------------------------------------------;
input double   BreakEven_After=3.0;
input double   BreakEven_To=1.0;
input string   TrailingStop_Properties=-----------------------T R A I L I N G - S T O P---------------------------------------------------------------------------------------------------------;
input double   TrailingStop_Size=1.0;
input double   TrailingStop_Step=0.8;
input bool     TrailingStop_CorrectSL=true;
input bool     TrailingStop_UseRealOPAndSL=true;
input int      TrailingStop_TrailingMode=0;
input int      TrailingStop_TimeScale=1;
input int      TrailingStop_VolatilityScale=3;
input int      TrailingStop_VolumeScale=3;
input double   TrailingStop_ChangeCorr=1.2;
input string   Time_Properties=-----------------------T I M E--------------------------------------------------------------------------------------------------------------------------------;
input int      EveryDay_StartHour=23;
input int      EveryDay_StartMinute=50;
input int      EveryDay_EndHour=21;
input int      EveryDay_EndMinute=45;
input string   FridayStopTime=20:45;
input string   Time_GMT_Properties=-----------------------G M T----------------------------------------------------------------------------------------------------------------------------------;
input int      Time_GMT_Mode=0;
input int      Time_Manual_GMT_Offset=2;
input string   Signal_Properties====================================================================================;
input double   BrokerQuotesShift=0.0;
input double   CustomCommission=0.0;
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//---
   
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---
   
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
//---
   
  }
//+------------------------------------------------------------------+
double spread;spread=Ask-Bid;
int b,s,c,k,cnt,ticket;
double red,blue,daily,weekly;


int init(){return(0);}
int deinit(){return(0);}
int start(){
   if(accounMM<720) {return(0);}
/*   if(!IsTesting() && c<=0) {
      
      
                 " Press \"F8,\" & select \"Common\" tab to check\n"
                 " \"show object descriptions.\"","FYI it",MB_OK|MB_ICONINFORMATION);
      
   
  ) {
     ("Given the nature of the custom indicator \n"+
                 "\"Support Resistance\", and the assignment of \n"+
                 "StopLoss and TakeProfit values taken from \n"+
                 "trend lines generated by this indicator, \n"+
                 "only live demo testing is of any benefit \n"+
                 "to you, the user of this ea.","Backtesting it",
                 MB_OK|MB_ICONSTOP);
      k++;}*/
   
   red=iCustom(Symbol(),0,"Instant TrendLine",0,0);
   blue=iCustom(Symbol(),0,"Instant TrendLine",1,0);
   daily=iCustom(Symbol(),0,"Support Resistance",1440,144,13,1,5,true,Aqua,DeepPink,Red,DarkOrange,DeepSkyBlue,Lime,0,0);
   weekly=iCustom(Symbol(),0,"Support Resistance",10080,144,13,1,5,true,Aqua,DeepPink,Red,DarkOrange,DeepSkyBlue,Lime,0,0);
   
   
   PosCounter();
   
   if(Open[1]<red && Close[1]>red && b==0) {
      ticket=OrderSend(Symbol(),
                        OP_BUY,
                        LotsOptimized(),
                        Close[0],
                        spread,
                        StopLoss(),
                        TakeProfit(),
                        Period()+comment,
                        Magic,
                        0,//OrderExpiration
                        Aqua);
                        if(ticket>0)   {
                            if(OrderSelect(ticket,SELECT_BY_TICKET,MODE_TRADES))
                                  {   Print(ticket); }
                            else Print("Error Opening Buy Order: ",GetLastError());
                            return(0);}}

   if(Open[1]>red && Close[1]<red && s==0) {
      ticket=OrderSend(Symbol(),
                        OP_SELL,
                        LotsOptimized(),
                        Close[0],
                        spread,
                        StopLoss(),
                        TakeProfit(),
                        Period()+comment,
                        Magic,
                        0,//OrderExpiration
                        Maroon);
                        if(ticket>0)   {
                              if(OrderSelect(ticket,SELECT_BY_TICKET,MODE_TRADES))
                                    {   Print(ticket); }
                              else Print("Error Opening Sell Order: ",GetLastError());
                              return(0);}}

   if(b>0 || s>0) {Mod.Order();}

   TrailStop();

   for(cnt=0;cnt<OrdersTotal();cnt++)  {
   OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES);
      if((OrderTakeProfit()<=0 || OrderStopLoss()<=0) && OrderSymbol()==Symbol() &&
         OrderComment()==Period()+comment && OrderProfit()>OrderSwap())  {
               OrderClose(OrderTicket(),OrderLots(),Close[0],spread,Snow);}
      /*if(OrderStopLoss()<=0) { Mod.Order();}*/ }
   
   if(!IsTesting()) {Comments();}
   
   Old.Object.Delete();
   
return(0);}
//+---------------------------FUNCTIONS------------------------------+
void PosCounter() {
   b=0;s=0;
   for(int cnt=0;cnt<=OrdersTotal();cnt++)   {
      OrderSelect(cnt, SELECT_BY_POS, MODE_TRADES);
      if(OrderSymbol()==Symbol() && OrderMagicNumber()==Magic &&
         OrderComment()==Period()+comment) {
         if(OrderType() == OP_SELL)     s++;
         if(OrderType() == OP_BUY)      b++;}}}

double LotsOptimized()  {
   double lot;
   int    orders=HistoryTotal();
   int    losses=0;
   lot=NormalizeDouble(AccountFreeMargin()*MaximumRisk/Margin.Per.Lot,2);
   if(DecreaseFactor>0) {
      for(int i=orders-1;i>=0;i--)  {
         if(OrderSelect(i,SELECT_BY_POS,MODE_HISTORY)==false) { Print("Error in history!"); break; }
         if(OrderSymbol()!=Symbol() || OrderType()>OP_SELL) continue;
         if(OrderProfit()>0) break;
         if(OrderProfit()<0) losses++; }
      if(losses>1) lot=NormalizeDouble(lot-lot*losses/DecreaseFactor,2);   }
   if(lot<0.01) lot=0.01;
return(lot);   }//end LotsOptimized


double StopLoss() {
   double sl=0;
   for(int o=0;o<ObjectsTotal();o++)  {
      if(Close[1]>red && ObjectGetValueByShift(ObjectName(o),0)<Open[1]) {
         sl=ObjectGetValueByShift(ObjectName(o),0);}//buy stoploss
      if(Close[1]<red && ObjectGetValueByShift(ObjectName(o),0)>Open[1])  {
         sl=ObjectGetValueByShift(ObjectName(o),0);}}//sell stoploss
return(sl);}//end StopLoss

double TakeProfit()  {
   double tp=0;
   for(int p=0;p<ObjectsTotal();p++)  {
      if(Close[1]>red && ObjectGetValueByShift(ObjectName(p),0)>=High[Highest(Symbol(),0,MODE_HIGH,144,0)]) {
         tp=ObjectGetValueByShift(ObjectName(p),0);}//buy tp
      if(Close[1]<red && ObjectGetValueByShift(ObjectName(p),0)<=High[Highest(Symbol(),0,MODE_HIGH,144,0)])  {
         tp=ObjectGetValueByShift(ObjectName(p),0);}}//sell tp
return(tp);}//end TakeProfit

void Mod.Order()   {
   for(int cnt=0;cnt<OrdersTotal();cnt++) {
   OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES);
      if(OrderSymbol()==Symbol() && OrderComment()==Period()+comment)   {
         if(OrderType()==OP_BUYSTOP &&
            (NormalizeDouble(red,Digits)<OrderOpenPrice() ||
             OrderStopLoss()<=0))  {
               OrderModify(OrderTicket(),
                           No
//---
   
  }

  //+------------------------------------------------------------------+
//|                          Instantaneous Trend Line by John Ehlers |
//|                               Copyright © 2004, Poul_Trade_Forum |
//|                                                         Aborigen |
//|                                          http://forex.kbpauk.ru/ |
//+------------------------------------------------------------------+
#property copyright "Poul Trade Forum"
#property link      "http://forex.kbpauk.ru/"
#property indicator_chart_window
#property indicator_buffers 2
#property indicator_color1 Red
#property indicator_color2 Blue
//---- buffers
double TRBuffer[];
double ZLBuffer[];
double Value1[],Value2,Value3,Value4,Value5[2],Value11[2];
double Price[],InPhase[2],Quadrature[2],Phase[2],DeltaPhase[],InstPeriod[2],Period_,Trendline;
double test[];
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int init()
  {
   string short_name;
   IndicatorBuffers(5);
//---- indicator line
   SetIndexStyle(0,DRAW_LINE,EMPTY,2,Red);
   SetIndexStyle(1,DRAW_LINE,EMPTY,2,Blue);
   SetIndexBuffer(0,TRBuffer);
   SetIndexBuffer(1,ZLBuffer);
   SetIndexBuffer(2,Value1);
   SetIndexBuffer(3,Price); 
   SetIndexBuffer(4,DeltaPhase);

   SetIndexEmptyValue(0,0);
   SetIndexEmptyValue(1,0);
//---- name for DataWindow and indicator subwindow label
   short_name="Instantaneous Trend";
   IndicatorShortName(short_name);
   SetIndexLabel(0,short_name);
//----
   SetIndexDrawBegin(0,30);
   SetIndexDrawBegin(1,30);
//----

   return(0);
  }

int deinit(){return(0);}
int start()
  {
   int    counted_bars=IndicatorCounted(),i,shift,count;
 

if (counted_bars==0) counted_bars=100;
i=(Bars-counted_bars)-2;
for (shift=i; shift>=0;shift--)
{
InPhase[1] =InPhase[0]; Quadrature[1] =Quadrature[0];
Phase[1]=Phase[0]; InstPeriod[1] = InstPeriod[0];
Value5[1] =Value5[0];Value11[1] =Value11[0];
Price[shift]=(High[shift+1]+Low[shift+1])/2;
//  {Compute InPhase and Quadrature components}
   Value1[shift] = Price[shift] - Price[shift+6];
   Value2 =Value1[shift+3];
   Value3 =0.75*(Value1[shift] - Value1[shift+6]) + 0.25*(Value1[shift+2] - Value1[shift+4]);
   InPhase[0] = 0.33*Value2 + 0.67*InPhase[1];
   Quadrature[0] = 0.2*Value3 + 0.8*Quadrature[1];
 
//   {Use ArcTangent to compute the current phase}
if (MathAbs(InPhase[0]+InPhase[1])>0) Phase[0]=MathArctan(MathAbs((Quadrature[0]+Quadrature[1])/(InPhase[0]+InPhase[1])));
//   {Resolve the ArcTangent ambiguity}
   if (InPhase[0] < 0 && Quadrature[0] > 0)  Phase[0] = 180 - Phase[0];
   if (InPhase[0] < 0 && Quadrature[0] < 0)  Phase[0] = 180 + Phase[0];
   if (InPhase[0] > 0 && Quadrature[0] < 0)  Phase[0] = 360 - Phase[0];
   
//   {Compute a differential    phase, resolve phase wraparound, and limit delta phase errors}
   DeltaPhase[shift] = Phase[1] - Phase[0];
   if (Phase[1] < 90 &&  Phase[0] > 270) DeltaPhase[shift] = 360 + Phase[1] - Phase[0];
   if (DeltaPhase[shift] < 1)  DeltaPhase[shift] = 1;
   if (DeltaPhase[shift] > 60) DeltaPhase[shift] = 60;
 
//   {Sum DeltaPhases  to reach 360  degrees. The sum is the instantaneous period.}
   InstPeriod[0] = 0;
   Value4 = 0;
   for (count = 0;count<=40;count++) 
      {
       Value4 = Value4 + DeltaPhase[shift+count];
       if  (Value4 > 360 && InstPeriod[0]  == 0) InstPeriod[0] = count;
     } 
//   {Resolve Instantaneous  Period    errors and  smooth}
   if (InstPeriod[0] == 0) InstPeriod[0] = InstPeriod[1];
   Value5[0] = 0.25*(InstPeriod[0]) + 0.75*Value5[1];
   
//   {Compute Trendline as simple average over the measured dominant cycle period}
   Period_ = MathCeil(Value5[0]); Trendline = 0;///Period_ = IntPortion(Value5)
   for    (count = 0;count<=Period_ + 1;count++)
       { Trendline = Trendline + Price[shift+count]; }
   
   if (Period_ > 0) Trendline = Trendline    / (Period_  + 2);
   Value11[0] = 0.33*(Price[shift] + 0.5*(Price[shift] - Price[shift+3])) + 0.67*Value11[1];
   
   TRBuffer[shift]=Trendline;
   ZLBuffer[shift]=Value11[0];

//----
}
/*
Comment("Last Tick:",TimeToStr(CurTime(),TIME_DATE|TIME_SECONDS),"\n",
        "Instant Trendline","\n",
        "Red Trend: ",TRBuffer[0],"\n",
        "Blue Trend: ",ZLBuffer[0]);*/
return(0);
}


//+------------------------------------------------------------------+
//|                                             SUPRESMultiFrame.mq4 |
//|                                                                  |
//|                                                            RD    |
//+------------------------------------------------------------------+
#property copyright "RD"
#property link      "marynarz15@wp.pl"
#property indicator_chart_window
#define MaxObject    1000
//---- indicator parameters
extern int TimeFrame=15;
extern int BarsMax=144;
extern int ExtDepth=13;
extern int ExtDeviation=1;
extern int ExtBackstep=5;
extern bool DeleteObjectsOnExit=true;
extern color LineColor1=RosyBrown;
extern color LineColor5=Aqua;
extern color LineColor15=DeepPink;
extern color LineColor30=PaleVioletRed;
extern color LineColor60=Red;
extern color LineColor240=DarkOrange;
extern color LineColor1440=DeepSkyBlue;
extern color LineColor10080=Lime;
//-----------------------
double ExtMapBuffer[];
double ExtMapBuffer2[];
int SUPRESCount=0;
int linewidth;
string NamePattern;
color LineColor;


//+------------------------------------------------------------------+
//|                           Delete objects                         |
//+------------------------------------------------------------------+
int DeleteSupRes()
   {     
      int ObjectCount=ObjectsTotal();
      string names[MaxObject];
      for (int i=0; i<ObjectCount;i++)
         names[i]=ObjectName(i);
      for (i=0; i<ObjectCount;i++) 
      {
         string objname=names[i];
         objname=StringSubstr(objname,0,StringLen(NamePattern));
         if (objname!=NamePattern || ObjectType(names[i])!=OBJ_TREND)
               names[i]="";              
      }
      for (i=0; i<ObjectCount;i++)
      { 
         if (names[i]!="") { 
         ObjectDelete(names[i]);}
      }   
      return(0);
   }

//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int init()
  {
   IndicatorBuffers(2);
   SetIndexBuffer(0,ExtMapBuffer);
   SetIndexBuffer(1,ExtMapBuffer2);
   SetIndexEmptyValue(0,0.0);
   ArraySetAsSeries(ExtMapBuffer,true);
   ArraySetAsSeries(ExtMapBuffer2,true);
   switch (TimeFrame)
     {
        case 1: linewidth=1; LineColor=LineColor1; break;   
        case 5: linewidth=1; LineColor=LineColor5; break;
        case 15: linewidth=1; LineColor=LineColor15; break;
        case 30: linewidth=1; LineColor=LineColor30; break;
        case 60: linewidth=1; LineColor=LineColor60; break;
        case 240: linewidth=1; LineColor=LineColor240; break;
        case 1440: linewidth=1; LineColor=LineColor1440; break;
        case 10080: linewidth=1; LineColor=LineColor10080; break;
        default: linewidth=1; TimeFrame=Period(); break;
     }
   NamePattern=DoubleToStr(TimeFrame,0)+" SUPRES ";
   if (BarsMax<55) BarsMax=55;
   
   DeleteSupRes();
   return(0);
  }
  
//+------------------------------------------------------------------+
//| Custom indicator deinitialization function                       |
//+------------------------------------------------------------------+
int deinit()
  {
      if (DeleteObjectsOnExit) DeleteSupRes();
      return(0);
  }   
  
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int start()
  {
   int    shift, back,lasthighpos,lastlowpos;
   double val,res;
   double curlow,curhigh,lasthigh,lastlow;
   string objectname;
   
   if(BarsMax==0) {BarsMax=Bars/2;}// return(0);
   for(shift=iBars(NULL,TimeFrame)-ExtDepth; shift>=0; shift--)
     {
      val=iLow(NULL,TimeFrame,Lowest(NULL,TimeFrame,MODE_LOW,ExtDepth,shift));
      if(val==lastlow) val=0.0;
      else 
        { 
         lastlow=val; 
         if((iLow(NULL,TimeFrame,shift)-val)>(ExtDeviation*Point)) val=0.0;
         else
           {
            for(back=1; back<=ExtBackstep; back++)
              {
               res=ExtMapBuffer[shift+back];
               if((res!=0)&&(res>val)) ExtMapBuffer[shift+back]=0.0; 
              }
           }
        } 
      ExtMapBuffer[shift]=val;
      //--- high
      val=iHigh(NULL,TimeFrame,Highest(NULL,TimeFrame,MODE_HIGH,ExtDepth,shift));
      if(val==lasthigh) val=0.0;
      else 
        {
         lasthigh=val;
         if((val-iHigh(NULL,TimeFrame,shift))>(ExtDeviation*Point)) val=0.0;
         else
           {
            for(back=1; back<=ExtBackstep; back++)
              {
               res=ExtMapBuffer2[shift+back];
               if((res!=0)&&(res<val)) ExtMapBuffer2[shift+back]=0.0; 
              } 
           }
        }
      ExtMapBuffer2[shift]=val;
     }

   // final cutting 
   lasthigh=-1; lasthighpos=-1;
   lastlow=-1;  lastlowpos=-1;

   for(shift=iBars(NULL,TimeFrame)-ExtDepth; shift>=0; shift--)
     {
      curlow=ExtMapBuffer[shift];
      curhigh=ExtMapBuffer2[shift];
      if((curlow==0)&&(curhigh==0)) continue;
      //---
      if(curhigh!=0)
        {
         if(lasthigh>0) 
           {
            if(lasthigh<curhigh) ExtMapBuffer2[lasthighpos]=0;
            else ExtMapBuffer2[shift]=0;
           }
         //---
         if(lasthigh<curhigh || lasthigh<0)
           {
            lasthigh=curhigh;
            lasthighpos=shift;
           }
         lastlow=-1;
        }
      //----
      if(curlow!=0)
        {
         if(lastlow>0)
           {
            if(lastlow>curlow) ExtMapBuffer[lastlowpos]=0;
            else ExtMapBuffer[shift]=0;
           }
         //---
         if((curlow<lastlow)||(lastlow<0))
           {
            lastlow=curlow;
            lastlowpos=shift;
           } 
         lasthigh=-1;
        }
     }
  
   for(shift=iBars(NULL,TimeFrame)-1; shift>=0; shift--)
     {
      if(shift>=iBars(NULL,TimeFrame)-ExtDepth) ExtMapBuffer[shift]=0.0;
      else
        {
         res=ExtMapBuffer2[shift];
         if(res!=0.0) ExtMapBuffer[shift]=res;
        }
     }
 ///////////////////////// Lines creation /////////////////   
   int count=0;
   double TempBufferPrice[MaxObject];   
   int TempBufferBar[MaxObject];
   string ObjectNames[MaxObject];
 //////////////////////// lists of lines //////////////////  
   for(shift=BarsMax; shift>0; shift--)
       if (ExtMapBuffer[shift]>0)
         {
            count++;
            TempBufferPrice[count-1]=ExtMapBuffer[shift];
            TempBufferBar[count-1]=shift;
         }   
   for(int i=0; i<count; i++)   
         ObjectNames[i]=/*TimeFrame+"m S/R("+i+")"+DoubleToStr(TempBufferPrice[i],Digits)+" "+*/
                        TimeToStr(iTime(NULL,TimeFrame,TempBufferBar[i]),TIME_DATE|TIME_MINUTES);

 /////// deleting pending objects ///////////////     
   int ObjectForDeleteCount=0;
   string ObjectsForDelete[MaxObject];
   for(i=0; i<ObjectsTotal(); i++)   
      {
         objectname=ObjectName(i);
         if (StringSubstr(objectname,0,StringLen(NamePattern))==NamePattern)
            {
               ObjectForDeleteCount++;
               ObjectsForDelete[ObjectForDeleteCount-1]=objectname;
            }   
      }
   for(i=0; i<count-2; i++)
      {
         objectname=ObjectNames[i];
            for(int j=0; j<ObjectForDeleteCount; j++)
                 if(ObjectsForDelete[j]==objectname)
                  {
                      ObjectsForDelete[j]="";    
                      break;
                  }     
      }
   for(j=0; j<ObjectForDeleteCount; j++)
      if (ObjectsForDelete[j]!="")
      { 
         ObjectDelete(ObjectsForDelete[j]);
      }
 ////////////// objects plotting /////////////////  
   for(i=0; i<count; i++)   
      {
         if (ObjectFind(ObjectNames[i])==-1)
            {
                ObjectCreate(ObjectNames[i],OBJ_TREND,0,iTime(NULL,TimeFrame,TempBufferBar[i]),TempBufferPrice[i],
                                 iTime(NULL,TimeFrame,TempBufferBar[i])+10080*60,TempBufferPrice[i]);
                ObjectSet(ObjectNames[i],OBJPROP_WIDTH,linewidth); 
                ObjectSet(ObjectNames[i],OBJPROP_COLOR,LineColor);
                ObjectSet(ObjectNames[i],OBJPROP_RAY,True);
                ObjectSetText(ObjectNames[i],ObjectNames[i]/*+" "+DoubleToStr(TempBufferPrice[i],Digits),8,"Courier",LightSteelBlue*/);
            } 
      }        
}
        
