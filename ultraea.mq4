//+-------------------------------------------------------------------+
//|                                                  Forexstay EA.mq4 |
//|                                 Email: dodgemonster0123@gmail.com |
//|                           ------------------------------- © 2017  |
//+-------------------------------------------------------------------+
#property copyright "skilful_coder ( from MQL5.com ) © 2017"
#property link "https://www.mql5.com/en/users/skilful_coder/portfolio"
#property version "1.00"
#property strict
#include <stdlib.mqh> 
enum trade{ 
 a=0//Buy/Sell
,b=1//BuyStop/SellStop
,c=2//Trailing Pending
};
input string EAComment             = "UsagiTsukino-EA";// EA Comment
input trade  TradeOpen             = 2;      // Trade Open Type
 int    Volumelevel                = 0;    // Volume level
input double PipBeforeLimitOrder   = 2;      // PipBeforeLimitOrder
input bool   UseCustom             = 1;      // Use Custom Indicator
input bool   UseLWMAtofilter       = 1;      // Use LWMA to filter
input double Xpips                 = 20;     // X pips from LWMA 
input string ______________________="xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx";//________Trade Parameters
input double Lot                   = 0.01;   // Lot Size
input bool   UseRisk               = 0;      // Use MM
input double RiskPercent           = 0.1;    // Risk %  
input double MinLots               = 0.01;   // Min Lot
input double MaxLots               = 100.0;  // Max Lot
input double StopLoss              = 50;      // Stop Loss
input double TakeProfit            = 10;     // Take Profit
input bool   ExitOpposite          = 0;      // Exit by Opposite signal
input int    MagicNumber           = 777;    // Magic Number
input int    MaxOpenOrders         = 1;      // Max.Open Orders
input double MaxSpread             = 10;     // Max Spread        
input int    Slippage              = 5;      // Slippage
input bool   ShowInfo              = 0;      // Show Info to Chart 
input ENUM_BASE_CORNER Corner      = 1;      // Info Corner
input string TrailingStopLoss      = "--------------------< Trailing Stop >--------------------";//Trailing Stop Settings ............................................................................................................
input bool   UseTrailingStop       = 0;      // Use Trailing 
input double TrailingStart	        = 15;     // Trailing Start
input double TrailingStop          = 10;     // Trailing Distance 
input string Time_Filter           = "--------------------< Time Filter >--------------------";//Time Filter ........................................................................................................... 
input bool   Use_Time_Filter       = 0;      // Use Time Filter
input string Time_Start            = "00:00";// Time Start
input string Time_End              = "23:59";// Time End
input string ___________________1__="==============================================================================";//_________LWMA High
input int    MA_Period1            = 3;          // Period  
input ENUM_MA_METHOD MA_Method1    = MODE_LWMA;  // Method 
input ENUM_APPLIED_PRICE MA_Price1 = PRICE_HIGH; // Price 
input string ___________________2__="==============================================================================";//_________LWMA Low
input int    MA_Period2            = 3;          // Period  
input ENUM_MA_METHOD MA_Method2    = MODE_LWMA;  // Method 
input ENUM_APPLIED_PRICE MA_Price2 = PRICE_LOW;  // Price 
//HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH
int    Pip=1,lotdigit=0; 
string text[26],prefix="";
bool   Buy=0,Sell=0,Buy2=0,Sell2=0,Buy3=0,Sell3=0; 
double lots=0,ClosingArray[100],Sloss=0,Tprof=0,point=0.0001,Bopen,Sopen;
//HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH//
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
void OnInit() 
{ 
   ArrayResize(text,26); 
   if(MarketInfo(Symbol(),MODE_LOTSTEP)==1) lotdigit=0;
   if(MarketInfo(Symbol(),MODE_LOTSTEP)==0.1) lotdigit=1;   
   if(MarketInfo(Symbol(),MODE_LOTSTEP)==0.01) lotdigit=2;
   int digits=(int)MarketInfo(Symbol(),MODE_DIGITS);
   
   if(digits==4 || (Bid<1000 && digits==2)){ Pip=1;} 
   else Pip=10;
   
   if(digits<=1) point = 1; //CFD & Indexes  
   if(digits==4 || digits==5) point = 0.0001; 
   if((digits==2 || digits==3) && Bid>1000) point = 1;
   if((digits==2 || digits==3) && Bid<1000) point = 0.01;
   if(StringFind(NULL,"XAU")>-1 || StringFind(NULL,"xau")>-1 || 
   StringFind(NULL,"GOLD")>-1) point = 0.1;//Gold   
 
   if(IsTesting()) prefix="Test"+IntegerToString(MagicNumber)+Symbol();
   else prefix=IntegerToString(MagicNumber)+Symbol();
   
   return;
}  
//HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH//  
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
{
  if(!IsTesting()){
  for(int i= ObjectsTotal(); i>=0; i--) 
     {
      string name= ObjectName(i);
      if(StringSubstr(name,0,4)=="Info")
        {
         ObjectDelete(name);}
        }
     }
     else GVDel(prefix);
 return;
}  
//OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
//+------------------------------------------------------------------+
//|  Get Signals                                                     |
//+------------------------------------------------------------------+
double SPA(int buff,int shift){
double val = iCustom(Symbol(),0,"forexstay-sm-sounds-english-05",0,0,0,0,0,buff,shift);return(val);} 

long Vol(int shift){
long val = iVolume(NULL,0,shift);return(val);} 

double LWMA1(int shift){double val = iMA(NULL,0,MA_Period1,0,MA_Method1,MA_Price1,shift);return(val);}   
double LWMA2(int shift){double val = iMA(NULL,0,MA_Period2,0,MA_Method2,MA_Price2,shift);return(val);} 


//OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO  
//+------------------------------------------------------------------+
//|  Open Rules                                                      | iClose(NULL,0,0)
//+------------------------------------------------------------------+
void Indicators() 
{      
     Buy  = (UseCustom && SPA(1,2) != 0 && SPA(1,2) != EMPTY_VALUE);                           
     Sell = (UseCustom && SPA(0,2) != 0 && SPA(0,2) != EMPTY_VALUE);      
     
     Buy2  = (Vol(1) > Volumelevel);                           
     Sell2 = (Vol(1) > Volumelevel); 
     
     Sell3  = (UseLWMAtofilter && iClose(NULL,0,0) < LWMA2(0)-Xpips*point && iOpen(NULL,0,0) > LWMA2(0)-Xpips*point);               
     Buy3 = (UseLWMAtofilter && iClose(NULL,0,0) > LWMA1(0)+Xpips*point && iOpen(NULL,0,0) < LWMA1(0)+Xpips*point);
}                
//HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH//
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick(){  

     if(Bars < 10){Print("Not enough bars for working the EA");return;}
     int err; 
     Indicators();   
     OrdersClose();
     ModifyOrder();
     TrailingStops();
     if(!IsOptimization()){PrintInfo();}
     Bopen = NormalizeDouble(Ask + PipBeforeLimitOrder*point,_Digits);
     Sopen = NormalizeDouble(Bid - PipBeforeLimitOrder*point,_Digits);     
//+-------------------------------------------------------------------------------------------------------------//
     double Spread = NormalizeDouble((MarketInfo(Symbol(), MODE_SPREAD)/Pip),1);
     if(Spread > MaxSpread) 
       {
        Print("Spread (",Spread,")"," > ","Max Spread (",MaxSpread,")");
        Alert("Spread (",Spread,")"," > ","Max Spread (",MaxSpread,")");return;
       }     
//+---------------------------------------------------------------------------------------------------------------+ 
     if(Lots() > MaxLots || Lots() < MinLots) 
       {
         Print("Lot Error:"" ", Lots()," ","(Max Lot =",MaxLots,",""Min Lots =",MinLots," ) - ", EAComment);return;
       } 
//HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH
      if(TradeOpen==1 && ((!UseCustom) || (UseCustom && Buy)) && Buy2 && ((!UseLWMAtofilter) || (UseLWMAtofilter && Buy3)) && GoodTime() && MaxOpenOrders > Orders(-1)){            
        if(StopLoss == 0){ Sloss = 0;}
        else{ Sloss = NormalizeDouble(Bopen-StopLoss*point,_Digits);}
        if(TakeProfit == 0){ Tprof = 0;}
        else{ Tprof = NormalizeDouble(Bopen+TakeProfit*point,_Digits);}
        int Ticket = OrderSend(Symbol(), OP_BUYSTOP, Lots(), Bopen, Slippage*Pip, Sloss, Tprof, EAComment, MagicNumber, 0, clrGreen);
        err = GetLastError();if(err!=ERR_NO_ERROR){ Print("Error on Order open = ", ErrorDescription(err));} 
        }       
      if(TradeOpen==1 && ((!UseCustom) || (UseCustom && Sell)) && Sell2 && ((!UseLWMAtofilter) || (UseLWMAtofilter && Sell3)) && GoodTime() && MaxOpenOrders > Orders(-1)){ 
        if(StopLoss == 0){ Sloss = 0;}
        else{ Sloss = NormalizeDouble(Sopen+StopLoss*point,_Digits);}
        if(TakeProfit == 0){ Tprof = 0;}
        else{ Tprof = NormalizeDouble(Sopen-TakeProfit*point,_Digits);}
        int Tickets = OrderSend(Symbol(), OP_SELLSTOP, Lots(), Sopen, Slippage*Pip, Sloss, Tprof, EAComment, MagicNumber, 0, clrMagenta);
        err = GetLastError();if(err!=ERR_NO_ERROR){ Print("Error on Order open = ", ErrorDescription(err));}
        }   
//HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH
     if(TradeOpen==0 && ((!UseCustom) || (UseCustom && Buy)) && Buy2 && ((!UseLWMAtofilter) || (UseLWMAtofilter && Buy3)) && GoodTime() && MaxOpenOrders > Orders(-1) && CurrBar() && ClosedBar()) 
        {     
         if(StopLoss == 0){Sloss = 0;} else{
         Sloss = Ask - StopLoss * point;}
         if(TakeProfit == 0){Tprof = 0;}else{ 
         Tprof = Bid + TakeProfit * point;}    
         int Ticket  = OrderSend(Symbol(), OP_BUY, Lots(), Ask, Slippage*Pip, Sloss, Tprof, EAComment, MagicNumber, 0, clrBlue);
         err = GetLastError();if(err!=ERR_NO_ERROR){ Print("Error on Order open = ", ErrorDescription(err));}
         }       
     if(TradeOpen==0 && ((!UseCustom) || (UseCustom && Sell)) && Sell2 && ((!UseLWMAtofilter) || (UseLWMAtofilter && Sell3)) && GoodTime() && MaxOpenOrders > Orders(-1) && CurrBar() && ClosedBar()) 
        {
         if(StopLoss == 0){Sloss = 0;}else{ 
         Sloss = Bid + StopLoss * point;}
         if(TakeProfit == 0){Tprof = 0;}else{  
         Tprof = Ask - TakeProfit * point;}
         int Tickets  = OrderSend(Symbol(), OP_SELL, Lots(), Bid, Slippage*Pip, Sloss, Tprof, EAComment, MagicNumber, 0, clrRed);
         err = GetLastError();if(err!=ERR_NO_ERROR){ Print("Error on Order open = ", ErrorDescription(err));}
         } 
//HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH
      if(TradeOpen==2 && ((!UseCustom) || (UseCustom && Buy)) && Buy2 && ((!UseLWMAtofilter) || (UseLWMAtofilter && Buy3)) && GoodTime() && MaxOpenOrders > Orders(-1)){            
        if(StopLoss == 0){ Sloss = 0;}
        else{ Sloss = NormalizeDouble(Bopen-StopLoss*point,_Digits);}
        if(TakeProfit == 0){ Tprof = 0;}
        else{ Tprof = NormalizeDouble(Bopen+TakeProfit*point,_Digits);}
        int Ticket = OrderSend(Symbol(), OP_BUYSTOP, Lots(), Bopen, Slippage*Pip, Sloss, Tprof, EAComment, MagicNumber, 0, clrGreen);
        err = GetLastError();if(err!=ERR_NO_ERROR){ Print("Error on Order open = ", ErrorDescription(err));} 
        GVSet("buy",1);
        }       
      if(TradeOpen==2 && ((!UseCustom) || (UseCustom && Sell)) && Sell2 && ((!UseLWMAtofilter) || (UseLWMAtofilter && Sell3)) && GoodTime() && MaxOpenOrders > Orders(-1)){ 
        if(StopLoss == 0){ Sloss = 0;}
        else{ Sloss = NormalizeDouble(Sopen+StopLoss*point,_Digits);}
        if(TakeProfit == 0){ Tprof = 0;}
        else{ Tprof = NormalizeDouble(Sopen-TakeProfit*point,_Digits);}
        int Tickets = OrderSend(Symbol(), OP_SELLSTOP, Lots(), Sopen, Slippage*Pip, Sloss, Tprof, EAComment, MagicNumber, 0, clrMagenta);
        err = GetLastError();if(err!=ERR_NO_ERROR){ Print("Error on Order open = ", ErrorDescription(err));}
        GVSet("sell",1);
        } 
   return;
} 
//HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH//
void ModifyOrder() 
  {
   int totalOrders = OrdersTotal(), numPos = 0, numPosB = 0, numPosS = 0; 
   
   for(int i = 0; i < totalOrders; i++) 
     {
       bool Os = OrderSelect(i, SELECT_BY_POS);    
       if(OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber)
         {   
          if(OrderType() == OP_BUYSTOP) 
            {   
            double EntryPriceBuy = Ask + PipBeforeLimitOrder * point;            
            if(StopLoss == 0){Sloss = 0;}else{ 
            Sloss = EntryPriceBuy - StopLoss * point;}
            if(TakeProfit == 0){Tprof = 0;}else{  
            Tprof = EntryPriceBuy + TakeProfit * point;}  
            if(Ask + PipBeforeLimitOrder * point < OrderOpenPrice())              
              {
               bool Om = OrderModify(OrderTicket(), NormalizeDouble(EntryPriceBuy,_Digits), Sloss, Tprof, 0, clrLimeGreen);
              } 
            }             
          if(OrderType() == OP_SELLSTOP) 
            { 
            double EntryPriceSell = Bid - PipBeforeLimitOrder * point;
            if(StopLoss == 0){Sloss = 0;}else{ 
            Sloss = EntryPriceSell  + StopLoss * point;}
            if(TakeProfit == 0){Tprof = 0;}else{  
            Tprof = EntryPriceSell  - TakeProfit * point;}              
            if(Bid - PipBeforeLimitOrder * point > OrderOpenPrice())
              {
               bool Om = OrderModify(OrderTicket(), NormalizeDouble(EntryPriceSell,_Digits), Sloss, Tprof, 0, clrOrangeRed);
              }
       }}} 
}
//HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH//
//+------------------------------------------------------------------+
//| Close Opened Orders                                              |
//+------------------------------------------------------------------+
void OrdersClose()
{ 
   int err; if(!ExitOpposite)return; 
   
   for(int i = 0; i < OrdersTotal(); i++) 
      {
       bool OrSel = OrderSelect(i, SELECT_BY_POS, MODE_TRADES);    
       if(OrderSymbol() == Symbol() && (MagicNumber == 0 || OrderMagicNumber() == MagicNumber)) 
         {
          if(OrderType() == OP_BUY && Sell && iTime(NULL,0,0) > iTime(NULL,0,iBarShift(NULL,0,OrderOpenTime(),1))) 
            {
             bool close = OrderClose(OrderTicket(), OrderLots(), OrderClosePrice(), 0, clrBlue);CloseOrders(0); 
             err = GetLastError(); if(err!=ERR_NO_ERROR){ Print("Error on Order closing = ", ErrorDescription(err));}
            }               
          if(OrderType() == OP_SELL && Buy && iTime(NULL,0,0) > iTime(NULL,0,iBarShift(NULL,0,OrderOpenTime(),1)))   
            {
             bool close = OrderClose(OrderTicket(), OrderLots(), OrderClosePrice(), 0, clrRed);CloseOrders(1); 
             err = GetLastError(); if(err!=ERR_NO_ERROR){ Print("Error on Order closing = ", ErrorDescription(err));}
             }}}  
}    
//HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHᵈ၈ӈ筈聈H(߈P᝗聈Ḩ磕ƨ遈罈ҨX¿ÈHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH//
//+------------------------------------------------------------------+
//| Calculate Trade Volume(Lot)                                      |
//+------------------------------------------------------------------+
double Lots()
{ 
   lots = Lot; double LotStep = MarketInfo(Symbol(),MODE_LOTSTEP), 
   MaxLot = MarketInfo(Symbol(),MODE_MAXLOT), MinLot = MarketInfo(Symbol(),MODE_MINLOT);

   if(UseRisk){ lots = MathFloor((AccountFreeMargin()*RiskPercent/100/MarketInfo
   (Symbol(),MODE_MARGINREQUIRED))/MarketInfo(Symbol(),MODE_LOTSTEP))*MarketInfo(Symbol(),MODE_LOTSTEP);}   
   return( MathRound(MathMin(MathMax(lots,MinLot),MaxLot)/LotStep)*LotStep );
} 
//HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH//
//+------------------------------------------------------------------+
//| Trailing Stop                                                    |
//+------------------------------------------------------------------+
void TrailingStops() 
{
  if(!UseTrailingStop || TrailingStop == 0)return; 
  
  for(int i = 0; i < OrdersTotal(); i++) 
     {
      if(OrderSelect(i, SELECT_BY_POS, MODE_TRADES))
      {    
      if(OrderSymbol() == Symbol() && (MagicNumber == 0 || OrderMagicNumber() == MagicNumber)) 
        {         
        if(OrderType() == OP_BUY) 
          { 
          if(Bid - OrderOpenPrice() > TrailingStart * point && OrderStopLoss() < ND(Bid-TrailingStop*point)) 
            { 
             Trail(ND(Bid - TrailingStop * point),OrderTicket());
            }
        }                       
        if(OrderType() == OP_SELL)          
          {
          if(OrderOpenPrice() - Ask > TrailingStart * point && (OrderStopLoss()==0||OrderStopLoss()>ND(Ask+TrailingStop*point)))
            {
             Trail(ND(Ask + TrailingStop * point),OrderTicket());                     
            }
         }
}}}}
//+------------------------------------------------------------------------------------------------------------------------------------+
void Trail(double sl, int ticket)
{  
   int err;
   if(OrderSelect(ticket, SELECT_BY_TICKET,MODE_TRADES))
     {    
      if(OrderSymbol() == Symbol() && OrderType() <= 1) 
        {   
         bool modify = OrderModify(ticket, OrderOpenPrice(), sl, OrderTakeProfit(), 0, clrGold);err = GetLastError();
         if(err!=ERR_NO_ERROR){ Print("Error on Trail Order modify = ", ErrorDescription(err));}}
        }
}
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+
double ND(double price)
{
   if(price > 0)return(NormalizeDouble(price,_Digits));
   return(0);
}
//HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH//
//+------------------------------------------------------------------+
//| Trade Time Settings                                              |
//+------------------------------------------------------------------+   
bool GoodTime()
{
  int hs1 = StrToInteger(StringSubstr(Time_Start, 0, 2)), ms1 = StrToInteger(StringSubstr(Time_Start, 3, 2));
  int he1 = StrToInteger(StringSubstr(Time_End, 0, 2)), me1 = StrToInteger(StringSubstr(Time_End, 3, 2));

  if(!Use_Time_Filter)return(true);
  
  if(Use_Time_Filter && hs1 < he1)
    {
    if(((TimeHour(TimeCurrent()) == hs1 && TimeMinute(TimeCurrent()) >= ms1) && TimeHour(TimeCurrent()) < he1) 
    || (TimeHour(TimeCurrent()) > hs1 && TimeHour(TimeCurrent()) < he1) 
    || ((TimeMinute(TimeCurrent()) <= me1 && TimeHour(TimeCurrent()) == he1) && TimeHour(TimeCurrent()) > hs1) 
    || (TimeHour(TimeCurrent()) < he1 && TimeHour(TimeCurrent()) > hs1))
    return(true);
    }
  if(Use_Time_Filter && hs1 > he1)
    {
    if((TimeHour(TimeCurrent()) == hs1 && TimeMinute(TimeCurrent()) >= ms1 && TimeHour(TimeCurrent()) < 24)
    || (TimeHour(TimeCurrent()) > hs1 && TimeHour(TimeCurrent()) < 24)
    || (TimeHour(TimeCurrent()) == he1 && TimeMinute(TimeCurrent()) <= me1 && TimeHour(TimeCurrent()) >= 0)
    || (TimeHour(TimeCurrent()) < he1 && TimeHour(TimeCurrent()) >= 0))
    return(true);
    }    
   return(false);   
} 
//HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH// 
//+------------------------------------------------------------------+
//| Print info to chart                                              |
//+------------------------------------------------------------------+
void PrintInfo()
{
  string Current = "NO ORDER";
  
  if(CurrentProfit()!=0){ Current = DoubleToStr(CurrentProfit(),2);}
    
  if(ShowInfo){    
    text[1]= EAComment;
    text[2]= "-------------------------------------------";
    text[3]= "Time Current: " + TimeToStr(TimeCurrent());
    text[4]= "-------------------------------------------";    
    text[5]= "Account Number: " + IntegerToString(AccountNumber());
    text[6]= "Account Leverage: " + IntegerToString(AccountLeverage());
    text[7]= "Account Balance: " + DoubleToStr(AccountBalance(), 2);
    text[8]= "Account Equity: " + DoubleToStr(AccountEquity(), 2);
    text[9]= "Free Margin: " + DoubleToStr(AccountFreeMargin(), 2);
    text[10]= "Used Margin: " + DoubleToStr(AccountMargin(), 2 );
    text[11]= "Account Today Profit: " + DoubleToStr(DailyProfits(), 2);
    text[12]= "-------------------------------------------";
    text[13]= "Lot Size: " + DoubleToStr(lots,lotdigit);
    text[14]= "Spread: " + DoubleToStr(MarketInfo(Symbol(), MODE_SPREAD)/Pip, 2); 
    text[15]= "Current Profit: " + Current;
    text[16]= "-------------------------------------------";
    
    int i=1, k=20;
    while (i<=19)
    {
       string ChartInfo = "Info"+IntegerToString(i);
       ObjectCreate(ChartInfo, OBJ_LABEL, 0, 0, 0);
       ObjectSetText(ChartInfo, text[i], 9, "Arial", clrAqua);
       ObjectSet(ChartInfo, OBJPROP_CORNER, Corner);   
       ObjectSet(ChartInfo, OBJPROP_XDISTANCE, 7);  
       ObjectSet(ChartInfo, OBJPROP_YDISTANCE, k);
       i++;
       k=k+13;
    }
  }
}
//HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH//
//+------------------------------------------------------------------+
//| Get total order                                                  |
//+------------------------------------------------------------------+
int Orders(int type)
{
   int count=0;
   //-1= All,0=Buy,1=Sell,2=BuyLimit,3=SellLimit,4=BuyStop,5=SellStop,6=AllBuy,7=AllSell,8=AllMarket,9=AllPending;   
   for(int x=OrdersTotal()-1;x>=0;x--)
      {
      if(OrderSelect(x,SELECT_BY_POS,MODE_TRADES)){ 
      if(OrderSymbol()==Symbol() && (MagicNumber == 0 || OrderMagicNumber() == MagicNumber)) 
        {
         if(type < 0){ count++;}
         if(OrderType() == type && type >= 0){ count++;}  
         if(OrderType() <= 1 && type == 8){ count++;}  
         if(OrderType() > 1 && type == 9){ count++;}  
         if((OrderType() == 0 || OrderType() == 2 || OrderType() == 4) && type == 6){ count++;}
         if((OrderType() == 1 || OrderType() == 3 || OrderType() == 5) && type == 7){ count++;}       
        }}}   
   return(count);
}
//HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH//
//+------------------------------------------------------------+
//|  Close Orders                                              |
//+------------------------------------------------------------+  
bool CloseOrders(int type)
{ //-1= All,0=Buy,1=Sell,2=BuyLimit,3=SellLimit,4=BuyStop,5=SellStop,6=All Buys,7=All Sells,8=All Market,9=All Pending;
  bool oc=0;    
  for(int i=OrdersTotal()-1;i>=0;i--){
  bool os = OrderSelect(i,SELECT_BY_POS, MODE_TRADES);
  if(OrderSymbol()==Symbol() && (MagicNumber == 0 || OrderMagicNumber() == MagicNumber))
    {   
     if(type==-1){
     if(OrderType()==0){ oc = OrderClose(OrderTicket(),OrderLots(),Bid,1000,clrGold);}
     if(OrderType()==1){ oc = OrderClose(OrderTicket(),OrderLots(),Ask,1000,clrGold);}      
     if(OrderType()>1){ oc = OrderDelete(OrderTicket());}}  
     if(OrderType()>1 && type==9){ oc = OrderDelete(OrderTicket());} 
     if(OrderType()<=1 && type==8){ oc = OrderClose(OrderTicket(),OrderLots(),OrderClosePrice(),1000,clrGold);}
     if(OrderType()==type && type==0){ oc = OrderClose(OrderTicket(),OrderLots(),Bid,1000,clrGold);}
     if(OrderType()==type && type==1){ oc = OrderClose(OrderTicket(),OrderLots(),Ask,1000,clrGold);} 
     if(OrderType()==type && OrderType()> 1){ oc = OrderDelete(OrderTicket());} 
     if(OrderType()==0 && type==6){ oc = OrderClose(OrderTicket(),OrderLots(),Bid,1000,clrGold);}  
     if((OrderType()==2 || OrderType()== 4) && type==6){ oc = OrderDelete(OrderTicket());}   
     if(OrderType()==1 && type==7){ oc = OrderClose(OrderTicket(),OrderLots(),Bid,1000,clrGold);}  
     if((OrderType()==3 || OrderType()== 5) && type==7){ oc = OrderDelete(OrderTicket());}       
     for(int x=0;x<100;x++)
     {
      if(ClosingArray[x]==0)
      {
       ClosingArray[x]=OrderTicket();
       break; } } } }
   return(oc);
}      
//HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH//
//+------------------------------------------------------------------+
//| Check Free Margin                                                |
//+------------------------------------------------------------------+
bool MarginCheck(int type)// 0 - buy, 1 - sell;
{  
   if((AccountFreeMarginCheck(Symbol(), OP_BUY, Lots()) <= 0.0 || 
      GetLastError() == ERR_NOT_ENOUGH_MONEY) && type==0){
      Print("NOT ENOUGH MONEY TO TRADE OPEN");return(false);} 
      
   if((AccountFreeMarginCheck(Symbol(), OP_SELL, Lots()) <= 0.0 || 
      GetLastError() == ERR_NOT_ENOUGH_MONEY) && type==1){
      Print("NOT ENOUGH MONEY TO TRADE OPEN");return(false);} 
            
   return(true);
}  
//HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH//   
//+----------------------------------------------------------------------------------+
//| Daily Profit                                                                     |
//+----------------------------------------------------------------------------------+  
double DailyProfits()
{   
   int i; double LastDayProfits=0;
   for(i=0;i<OrdersHistoryTotal();i++)
    {
     bool os = OrderSelect(i,SELECT_BY_POS,MODE_HISTORY);
     if(OrderMagicNumber()==MagicNumber && TimeDayOfYear(OrderCloseTime())==DayOfYear()){
     LastDayProfits=LastDayProfits+OrderProfit()+OrderSwap()+OrderCommission();}}
  
   for(i = 0; i < OrdersTotal(); i++) 
    {
     bool Os = OrderSelect(i,SELECT_BY_POS, MODE_TRADES); 
     if(OrderMagicNumber()==MagicNumber && TimeDayOfYear(OrderOpenTime())==DayOfYear()){
     LastDayProfits=LastDayProfits+OrderProfit()+OrderSwap()+OrderCommission();
   }}       
  return(LastDayProfits);
}
//HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH//   
//+----------------------------------------------------------------------------------+
//| Current Profit                                                                   |
//+----------------------------------------------------------------------------------+  
double CurrentProfit()
{   
   double Profit=0;
   for(int i = 0;i < OrdersTotal();i++) 
      {
       bool Os = OrderSelect(i, SELECT_BY_POS, MODE_TRADES); 
       if(OrderSymbol()==Symbol() && (MagicNumber == 0 || OrderMagicNumber() == MagicNumber)){
       Profit=Profit+OrderProfit()+OrderSwap()+OrderCommission();}
      }       
  return(Profit);
}  
//HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH//
//+------------------------------------------------------------------+
//| Disable trade in current bar(if one is already open)             |
//+------------------------------------------------------------------+
bool CurrBar()
{ 
   bool yes = 1;
//+------------------------------------------------------------------+
   for(int i = OrdersTotal()-1; i >= 0; i--)
      {
    	if(OrderSelect(i, SELECT_BY_POS, MODE_TRADES))
    	{  
    	if(OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber) 
      {     
       if(OrderOpenTime() >= iTime(Symbol(),0,0)) yes = 0;   
      }}}   
   return(yes);
}     
//HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH//
//+------------------------------------------------------------------+
//| Disable trade in current bar(if one is already opened and closed)|
//+------------------------------------------------------------------+
bool ClosedBar()
{ 
   bool yes = 1;
//+------------------------------------------------------------------+
   for(int i = OrdersHistoryTotal()-1; i>=0; i--)
      {
      if(OrderSelect(i,SELECT_BY_POS,MODE_HISTORY)==false) 
      { 
      Print("Error in history!"); break; 
      }
      if(OrderSymbol() != Symbol() || OrderType()>OP_SELL) continue;
      if(OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber) 
      {	    
      if(OrderOpenTime() >= iTime(NULL,0,0)) yes = 0;   
    	}}   
   return(yes);
}      
//HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH   
//+------------------------------------------------------------------+
//|  Global Variable Set                                             |
//+------------------------------------------------------------------+  
datetime GVSet(string name,double value)
{
   return(GlobalVariableSet(prefix+name,value));
}
//+------------------------------------------------------------------+
//|  Global Variable Get                                             |
//+------------------------------------------------------------------+
double GVGet(string name)
{
   return(GlobalVariableGet(prefix+name));
}
//+------------------------------------------------------------------+
//|  Global Variable Delete                                          |
//+------------------------------------------------------------------+
bool GVDel(string pref)
{
   for(int tries=0; tries<10; tries++)
      {
      int obj=GlobalVariablesTotal();
      for(int o=0; o<obj;o++)
         {
          string name=GlobalVariableName(o);
          int index=StringFind(name,pref,0);
          if(index>-1)GlobalVariableDel(name);
         }
      }
   return(0);  
}  
//HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH//
