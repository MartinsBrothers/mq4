//+------------------------------------------------------------------+
//|                                 67.Blessing2 5.2 configurado.mq4 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                                                  Blessing 2 v5.2 |
//|                              Copyright � 2007-2009, MQLCoder.com |
//|                                                jta@jtatoday.com  |
//|                                             http://www.irxfx.com |
//|                                         fifthelement80@gmail.com |
//|  In no event will authors be liable for any damages whatsoever.  |
//|                      Use at your own risk.                       |
//+------------------------------------------------------------------+

// Added AutoCal Timeframe and Period to External Variables by Bobster

#property copyright "Copyright FiFtHeLeMeNt/J Talon LLC � 2007-2009, ."
#property link      "http://www.mqlcoder.com"
#define  NL    "\n"

extern string  InitialAccountSet   = "Tamanho da conta inicial, Initial account balance";
extern int     InitialAccount      = 1300; 

extern string  TradeComment        = "Blessing";

extern string  NumberPortionSet    = "Account Portion";
extern int     Portion             = 1;    // por��o da conta que vc deseja para este par, Portion of account you want to trade on this pair

extern bool    UseEquityProtection = true; // Close all orders when negative Float is excessive.
extern double  FloatPercent        = 100;   // Percent of portion for max Float level.
extern bool    UsePowerOutSL       = false;   

extern bool    UseMM               = 1;    // Money Management - 1 = true & 0 = false.

extern string  LotAdjustmentSet    = "Only with MM enabled. (.01 - 5.0)";
extern double  LAF                 = 1.0;  // Adjusts MM base lot for large accounts

extern string  AccountTypeSet      = "1=standard, 10=micro for penny/pip)";
extern int     Accounttype         = 1;    // Used in Money Management feature only.

extern string  ManuallotSet        = "Lots used if MM is off";
extern double  lot                 = 0.01; // Starting lots if Money Management is off

extern string  LotHedgeSet         = "Hedge Multiplier.  Adjust by +/-.01 intervals ";
extern double  Multiplier          = 1.4;  // Multiplier on each level

extern string  AutoParametersSet   = "Autocalculates the Grid based on ATR";
extern bool    AutoCal             = false; // Auto calculation of TakeProfit and Grid size;
extern int     AutoCalTF           = 1440;
extern int     AutoCalPeriod       = 21;

extern string  AutoGridAdjust      = "Widens/squishes grid (.5 - 3.0)";
extern double  GAF                 = 1.0;  // Widens/Squishes Grid on increments/decrements of .1

extern string  GridSet             = "Default Grid size in Pips";
extern int     GridSet1            = 40;   // Set 1 Grid Size
extern int     TP_Set1             = 50;   // Set 1 Take Profit
extern int     GridSet2            = 60;   // Level 2 Grid Size
extern int     TP_Set2             = 90;  // Level 2 Take Profit
extern int     GridSet3            = 80;  // Level 3 Grid Size
extern int     TP_Set3             = 170;  // Level 3 Take Profit

extern string  TimeGridSet         = "Default grid set time in seconds";
extern int     TimeGrid            = 2400; // Time Grid in seconds , to avoid opening of lots of levels in fast market

extern string  MarketConditionSet  = "Set MC to 2 for Ranging Market";
extern int     MC                  = 2;    // Market condition 0=uptrend 1=downtrend 2=range

extern string  MovingAverageSet    = "Changes MC for correct trend (up/down)";
extern bool    MCbyMA              = true; // Defines market condition by EMA , if price is above EMA,
                                           // it will take it as an uptrend and goes only long,
                                           // vice versa for below the EMA
extern int     MA_Period           = 100;   // Period of MA

extern string  MaxLevelSet         = "Default of 4 on each level, change sparingly";
extern int     Set1Count           = 3;    // Level 1 max levels
extern int     Set2Count           = 4;    // Level 2 max levels
extern int     MaxLevel            = 99;   // Level 2 max levels (stops placing orders when reaches maxlvl2)
extern int     BELevel             = 12;   // Close All level , when reaches this level, doesn't wait for TP to be hit

extern int     slippage            = 999; // Tolerance of order slips/requotes for closing

//+------------------------------------------------------------------+
//| Internal Parameters Set                                          |
//+------------------------------------------------------------------+

bool           ca                  = false;
string         EA_name             = "Blessing � FiFtHeLeMeNt/J Talon LLC";
int            magic               = 0;
double         slip                = 0;       
int            d                   = 5;      // Used to offset entry to round numbers , for example if you set d=5,
                                             // it will place its sell order on 1.5795 instead of 1.5780
double         LotInc              = 0;      // Lot Increment on each level, very dangerous
string         Filename;
int            BrokerDecimal       = 1;
string         POSL_On             = "No";
int            count;
double         PortionBalance;
double         InitialAccountMultiPortion;
double         PortionEquity;

//+------------------------------------------------------------------+
//| expert initialization function                                   |
//+------------------------------------------------------------------+

int init()
  {
   if (Symbol() == "AUDCADm" || Symbol() == "AUDCAD") magic = 101101;
   if (Symbol() == "AUDJPYm" || Symbol() == "AUDJPY") magic = 101102;
   if (Symbol() == "AUDNZDm" || Symbol() == "AUDNZD") magic = 101103;
   if (Symbol() == "AUDUSDm" || Symbol() == "AUDUSD") magic = 101104;
   if (Symbol() == "CHFJPYm" || Symbol() == "CHFJPY") magic = 101105;
   if (Symbol() == "EURAUDm" || Symbol() == "EURAUD") magic = 101106;
   if (Symbol() == "EURCADm" || Symbol() == "EURCAD") magic = 101107;
   if (Symbol() == "EURCHFm" || Symbol() == "EURCHF") magic = 101108;
   if (Symbol() == "EURGBPm" || Symbol() == "EURGBP") magic = 101109;
   if (Symbol() == "EURJPYm" || Symbol() == "EURJPY") magic = 101110;
   if (Symbol() == "EURUSDm" || Symbol() == "EURUSD") magic = 101111;
   if (Symbol() == "GBPCHFm" || Symbol() == "GBPCHF") magic = 101112;
   if (Symbol() == "GBPJPYm" || Symbol() == "GBPJPY") magic = 101113;
   if (Symbol() == "GBPUSDm" || Symbol() == "GBPUSD") magic = 101114;
   if (Symbol() == "NZDJPYm" || Symbol() == "NZDJPY") magic = 101115;
   if (Symbol() == "NZDUSDm" || Symbol() == "NZDUSD") magic = 101116;
   if (Symbol() == "USDCHFm" || Symbol() == "USDCHF") magic = 101117;
   if (Symbol() == "USDJPYm" || Symbol() == "USDJPY") magic = 101118;
   if (Symbol() == "USDCADm" || Symbol() == "USDCAD") magic = 101119;
   
   if (magic == 0) magic = 701999;
   
   if(Digits==3 || Digits==5) BrokerDecimal = 10;
   
   Filename = StringConcatenate(EA_name+"_",Symbol(),"_",Period(),"_M",".txt");
   
   return(0);
  }

//+------------------------------------------------------------------+
//| expert deinitialization function                                 |
//+------------------------------------------------------------------+

int deinit()
  {
//----
   
//----
   return(0);
  }

//+------------------------------------------------------------------+
//| expert start function                                            |
//+------------------------------------------------------------------+

int start()
  {
   int y;
   int cb=0; // Count buy
   int cs=0; // Count sell
   int cbl=0; // Count buy limit
   int csl=0; // Count sell limit
   int cbs=0; // Count buy limit
   int css=0; // Count sell limit
   double tbl=0; //Count lot size
   double tsl=0; //Count lot size
   double tl=0; //total lots out
   double to=0; //total buy and sell order out
   double buysl=0; //stop losses are set to zero if POSL off
   double sellsl=0; //stop losses are set to zero if POSL off
   double POSL=0; //Initialize POSL
   double m,lot2;
   double lp; // last buy price
   double ll; //last lot
   double ltp; //last tp
   double lopt; // last open time
   double g2;
   double tp2;
   double entry;
   double pr=0; // profit;
   double sumlot;
   int lticket;
   double mp,mp2; // median price
  
//+------------------------------------------------------------------+
//| Calculate Total Profits and Total Orders                         |
//+------------------------------------------------------------------+ 

for (y = 0; y < OrdersTotal(); y++)
   {
      OrderSelect (y, SELECT_BY_POS, MODE_TRADES);
      if ((OrderMagicNumber()==magic) && (OrderSymbol()==Symbol()) && (OrderType()==OP_BUY)) {
        cb++;
        pr=pr+OrderProfit();
        tbl=tbl+OrderLots();
      }
      if ((OrderMagicNumber()==magic) && (OrderSymbol()==Symbol()) && (OrderType()==OP_SELL)) {
        cs++;
        pr=pr+OrderProfit();
        tsl=tsl+OrderLots();
      }
      if ((OrderMagicNumber()==magic) && (OrderSymbol()==Symbol()) && (OrderType()==OP_BUYLIMIT)) cbl++;
      if ((OrderMagicNumber()==magic) && (OrderSymbol()==Symbol()) && (OrderType()==OP_SELLLIMIT)) csl++;
      if ((OrderMagicNumber()==magic) && (OrderSymbol()==Symbol()) && (OrderType()==OP_BUYSTOP)) cbs++;
      if ((OrderMagicNumber()==magic) && (OrderSymbol()==Symbol()) && (OrderType()==OP_SELLSTOP)) css++;
      tl=tbl+tsl;
      to=cb+cs;}
      
//+------------------------------------------------------------------+
//| Account Protection                                               |
//+------------------------------------------------------------------+ 
  
  PortionBalance = NormalizeDouble(AccountBalance()/Portion,2);
  PortionEquity  = NormalizeDouble(PortionBalance + pr,2);
  if(UseEquityProtection) {
       if ( PortionBalance - PortionEquity >= (PortionBalance * FloatPercent/100) )  
               ExitAllTrades(Red,"Equity Stop Loss Reached");}  

//+------------------------------------------------------------------+
//| Trading with EA Criteria                                         |
//+------------------------------------------------------------------+

  InitialAccountMultiPortion = InitialAccount/Portion;
      if (PortionBalance < InitialAccountMultiPortion){ 
            PlaySound("alert.wav");
            Print("Account Balance is less than Initial Account Balance setting"); 
            MessageBox( "Account Balance is less than Initial Account Balance on " + Symbol()+ Period(), "Blessing 2: Warning", 48 );
  return(0);}

//+------------------------------------------------------------------+
//| Power Out Stop Loss Protection                                   |
//+------------------------------------------------------------------+ 

  if(UsePowerOutSL) {
     POSL_On = "Yes";
     int correct = 1;
     double pipvalue=MarketInfo(Symbol(),MODE_TICKVALUE);
     if(Accounttype == 1 && pipvalue < 5) correct = 10;
     if(tl == 0){
       POSL = 600;
       if(Digits==3 || Digits==5) POSL = POSL * 10;
       buysl = Ask - POSL * Point;
       sellsl= Bid + POSL * Point;}
    
     if(tl > 0){
       POSL =  NormalizeDouble((PortionBalance * (FloatPercent + 1)/100)/(pipvalue * tl * correct),0);
       if(POSL > 600) POSL = 600;
       if(Digits==3 || Digits==5) POSL = POSL * 10;
       buysl = Ask - POSL * Point;
       sellsl= Bid + POSL * Point;}
       
     if(to == 0) count = 0;
     if(to > 0 && to > count){
     
     // sync up order stop losses
     for (int q = 0; q < OrdersTotal(); q++) {
        OrderSelect (q, SELECT_BY_POS, MODE_TRADES);
        if ((OrderMagicNumber()==magic) && (OrderSymbol()==Symbol()) && (OrderType()==OP_BUY)) {
            OrderModify(OrderTicket(), OrderOpenPrice(), buysl, OrderTakeProfit(), 0, Purple);}
        if ((OrderMagicNumber()==magic) && (OrderSymbol()==Symbol()) && (OrderType()==OP_SELL)) {
            OrderModify(OrderTicket(), OrderOpenPrice(), sellsl, OrderTakeProfit(), 0, Purple);} } } 
        count = to;}

//+------------------------------------------------------------------+
//| Money Management and Lot size coding                             |
//+------------------------------------------------------------------+
   
  if(UseMM){

  double Contracts, Factor, Lotsize;

          Contracts = (AccountBalance()/10000)/Portion;
          Factor    = Multiplier+
                MathPow(Multiplier,2)+
                MathPow(Multiplier,3)+
                MathPow(Multiplier,4)+
                MathPow(Multiplier,5)+
                MathPow(Multiplier,6);

          Lotsize=LAF*Accounttype*(Contracts/(1.0 + Factor));

    //Determine Lot size boundries from minimum to maximum

          lot=NormalizeDouble(Lotsize,2);

          if(Lotsize<0.01) lot=0.01;
          if(Lotsize>100/MathPow(Multiplier,6) && Accounttype == 1) lot=NormalizeDouble(100/MathPow(Multiplier,6),2);
          if(Lotsize>50/MathPow(Multiplier,6)  && Accounttype == 10) lot=NormalizeDouble(50/MathPow(Multiplier,6),2);}

//+------------------------------------------------------------------+
//| ATR to autocalculate the Grid                                    | 
//+------------------------------------------------------------------+     

  double GridStart,value1;
  double atrvalue = iATR(NULL,AutoCalTF,AutoCalPeriod,0);  // Bobster added external variables; default is 1440, 21
    if(AutoCal==True){
      if(Digits == 2 || Digits == 3) value1 = atrvalue*100;
      if(Digits == 4 || Digits == 5) value1 = atrvalue*10000;
      GridStart = value1*2/10;
      GridSet1  = GridStart;
      TP_Set1   = GridStart + GridSet1;
      GridSet2  = TP_Set1;
      TP_Set2   = (GridStart + GridSet1) * 2;
      GridSet3  = TP_Set2;
      TP_Set3   = (GridStart + GridSet1) * 4;}       
 
//+------------------------------------------------------------------+
//| Moving Average Indicator for Calculation of Trend Direction      |
//+------------------------------------------------------------------+      

  if (MCbyMA) {
     MC=-1;
     if (Bid<iMA(Symbol(),0,MA_Period,0,MODE_EMA,PRICE_CLOSE,0)) MC=1;
     if (Bid>iMA(Symbol(),0,MA_Period,0,MODE_EMA,PRICE_CLOSE,0)) MC=0;}

//+------------------------------------------------------------------+
//| Blessing Code                                                    |
//+------------------------------------------------------------------+   
   
  if (cs==0 && cb==0 && cbs==0 && cbl==0 && css==0 && csl==0) ca=false;
     
   slip = NormalizeDouble((slippage * BrokerDecimal),0);
  
   if (((cb>=BELevel || cs>=BELevel) && pr>0) || ca) {
     ca=true;
     for (y = 0; y < OrdersTotal(); y++){
       OrderSelect (y, SELECT_BY_POS, MODE_TRADES);
       if ((OrderMagicNumber()==magic) && (OrderSymbol()==Symbol()) && (OrderType()==OP_BUY || OrderType()==OP_SELL)) OrderClose(OrderTicket(),OrderLots(),OrderClosePrice(),slip,Lime);
       if ((OrderMagicNumber()==magic) && (OrderSymbol()==Symbol()) && (OrderType()==OP_BUYLIMIT || OrderType()==OP_SELLLIMIT || OrderType()==OP_BUYSTOP || OrderType()==OP_SELLSTOP)) OrderDelete(OrderTicket(),White);}
     return;}

      d = d;
      if (BrokerDecimal == 10) d=50;
      g2=GridSet1;
      tp2=TP_Set1;

   if (cb>=Set1Count || cs>=Set1Count) {
     g2=GridSet2;
     tp2=TP_Set2;}

   if (cb>=Set2Count+Set1Count || cs>=Set2Count+Set1Count) {
     g2=GridSet3;
     tp2=TP_Set3;}
   
//+------------------------------------------------------------------+
//| Broker Decimal Selection                                         |
//+------------------------------------------------------------------+ 

  if (BrokerDecimal == 10){
     g2 *= 10;
     tp2 *= 10;}

//+------------------------------------------------------------------+
//| Adjust Grid and Normalize Values                                 |
//+------------------------------------------------------------------+

  g2  = NormalizeDouble(g2*GAF,0);
  tp2 = NormalizeDouble(tp2*GAF,0);
  
//+------------------------------------------------------------------+
//| Trade Selection Logic                                            |
//+------------------------------------------------------------------+ 

   if ((cb==0) && (cs==0)) {
     for (y = 0; y < OrdersTotal(); y++)
     {
       OrderSelect (y, SELECT_BY_POS, MODE_TRADES);
       if ((OrderMagicNumber()==magic) && (OrderSymbol()==Symbol()) && (OrderLots()>lot)) OrderDelete(OrderTicket()); }

   if (MC==0) {
        if (cbs==0) {
          m=MathMod(Ask/Point,g2);
          if ((g2-m+d)>MarketInfo(Symbol(),MODE_STOPLEVEL)) {
            OrderSend(Symbol(),OP_BUYSTOP,lot,Ask*2-Bid+(g2-m+d)*Point,0,buysl,Ask*2-Bid+(g2-m+d+tp2)*Point,TradeComment,magic,0,CLR_NONE);
            Print("s2");
            return;} }
        if (cbl==0) {
          m=MathMod(Ask/Point,g2);
          if ((m+d)>MarketInfo(Symbol(),MODE_STOPLEVEL)) {
            OrderSend(Symbol(),OP_BUYLIMIT,lot,Ask*2-Bid-(m+d)*Point,0,buysl,Ask*2-Bid-(m+d-tp2)*Point,TradeComment,magic,0,CLR_NONE);
            Print("s1");
            return;} } }

   if (MC==1) {
        if (csl==0) {
          m=MathMod(Bid/Point,g2);
          if ((g2-m-d)>MarketInfo(Symbol(),MODE_STOPLEVEL)) {
            OrderSend(Symbol(),OP_SELLLIMIT,lot,Bid+(g2-m-d)*Point,0,sellsl,Bid+(g2-m-d-tp2)*Point,TradeComment,magic,0,CLR_NONE);
            Print("s2");
            return;} }
        if (css==0) {
          m=MathMod(Bid/Point,g2);
          if ((m+d)>MarketInfo(Symbol(),MODE_STOPLEVEL)) {
            OrderSend(Symbol(),OP_SELLSTOP,lot,Bid-(m+d)*Point,0,sellsl,Bid-(m+d+tp2)*Point,TradeComment,magic,0,CLR_NONE);
            Print("s1");
            return; } } }
       
   if (MC==2) {
        if (css==0) {
          m=MathMod(Bid/Point,g2);
          if ((m+d)>MarketInfo(Symbol(),MODE_STOPLEVEL)) {
            OrderSend(Symbol(),OP_SELLSTOP,lot,Bid-(m+d)*Point,0,sellsl,Bid-(m+d+tp2)*Point,TradeComment,magic,0,CLR_NONE);
            Print("s1");
            return; } }
        if (cbs==0) {
          m=MathMod(Ask/Point,g2);
          if ((g2-m+d)>MarketInfo(Symbol(),MODE_STOPLEVEL)) {
            OrderSend(Symbol(),OP_BUYSTOP,lot,Ask*2-Bid+(g2-m+d)*Point,0,buysl,Ask*2-Bid+(g2-m+d+tp2)*Point,TradeComment,magic,0,CLR_NONE);
            Print("s2");
            return;} } } }

   if (cb>0 || cs>0) {
     for (y = 0; y < OrdersTotal(); y++){
        OrderSelect (y, SELECT_BY_POS, MODE_TRADES);
        if ((OrderMagicNumber()==magic) && (OrderSymbol()==Symbol()) && (OrderType()!=OP_SELL) && (OrderType()!=OP_BUY) && OrderLots()==lot) OrderDelete(OrderTicket());} }
   
   if (cb>0) {
     sumlot=0;
     mp=0;
     for (y = 0; y < OrdersTotal(); y++){
       OrderSelect (y, SELECT_BY_POS, MODE_TRADES);
       if ((OrderMagicNumber() != magic) || (OrderType()!=OP_BUY) || (OrderSymbol()!=Symbol())) { continue; }
       lp=OrderOpenPrice();
       ll=OrderLots();
       ltp=OrderTakeProfit();
       lopt=OrderOpenTime();
       lticket=OrderTicket();
       sumlot=sumlot+ll;
       mp=mp+ll*lp;}
      
       mp=mp/sumlot;
 
   if ((TimeCurrent()-TimeGrid>lopt) && (cb<MaxLevel)) {
         if (lp>Ask) entry=NormalizeDouble(lp-(MathRound((lp-Ask)/Point/g2)+1)*g2*Point,Digits); else entry=NormalizeDouble(lp-g2*Point,Digits);
         if (ll <= 0.01) lot2=NormalizeDouble(ll*2+LotInc,2); else lot2=NormalizeDouble(ll*Multiplier+LotInc,2);
       
         if (cbl==0) {
           OrderSend(Symbol(),OP_BUYLIMIT,lot2,entry,0,buysl,entry+tp2*Point,TradeComment,magic);
           Print("s3");
           return;}

         if (cbl==1) {
           for (y = 0; y < OrdersTotal(); y++){
              OrderSelect (y, SELECT_BY_POS, MODE_TRADES);
              if (OrderType()==OP_BUYLIMIT && OrderMagicNumber()==magic && (OrderSymbol()==Symbol()) && entry-OrderOpenPrice()>g2/2*Point) {
                OrderModify(OrderTicket(),entry,buysl,entry+tp2*Point,0);
                Print("mo1");} } } } 
         
         for (y = 0; y < OrdersTotal(); y++){ // Sync TPs
           OrderSelect (y, SELECT_BY_POS, MODE_TRADES);
           if ((OrderMagicNumber() != magic) || (OrderType()!=OP_BUY) || (MathAbs(OrderTakeProfit()-ltp)<Point) || (OrderSymbol()!=Symbol())) { continue; }
           OrderModify(OrderTicket(),OrderOpenPrice(),buysl,ltp,0,Blue);
           Print("m1");
           return;} }

   if (cs>0) {
     sumlot=0;
     mp=0;
     for (y = 0; y < OrdersTotal(); y++){
       OrderSelect (y, SELECT_BY_POS, MODE_TRADES);
       if ((OrderMagicNumber() != magic) || (OrderType()!=OP_SELL) || (OrderSymbol()!=Symbol())) { continue; }
       lp=OrderOpenPrice();
       ll=OrderLots();
       ltp=OrderTakeProfit();
       lopt=OrderOpenTime();
       lticket=OrderTicket();
       sumlot=sumlot+ll;
       mp=mp+ll*lp;}
      
       mp=mp/sumlot;
 
   if ((TimeCurrent()-TimeGrid>lopt) && (cs<MaxLevel)) {
         if (Bid>lp) entry=NormalizeDouble(lp+(MathRound((-lp+Bid)/Point/g2)+1)*g2*Point,Digits); else entry=NormalizeDouble(lp+g2*Point,Digits);
         if (ll <= 0.01) lot2=NormalizeDouble(ll*2+LotInc,2); else lot2=NormalizeDouble(ll*Multiplier+LotInc,2);
         
         if (csl==0) {
            OrderSend(Symbol(),OP_SELLLIMIT,lot2,entry,0,sellsl,entry-tp2*Point,TradeComment,magic);
            Print("s4");
            return;}

         if (csl==1) {
           for (y = 0; y < OrdersTotal(); y++)           {
              OrderSelect (y, SELECT_BY_POS, MODE_TRADES);
              if (OrderType()==OP_SELLLIMIT && OrderMagicNumber()==magic && (OrderSymbol()==Symbol()) && OrderOpenPrice()-entry>g2/2*Point) {
              OrderModify(OrderTicket(),entry,sellsl,entry-tp2*Point,0);
              Print("mo2");} } } }

        for (y = 0; y < OrdersTotal(); y++){ // Sync TPs
          OrderSelect (y, SELECT_BY_POS, MODE_TRADES);
          if ((OrderMagicNumber() != magic) || (OrderType()!=OP_SELL) || (MathAbs(OrderTakeProfit()-ltp)<Point) || (OrderSymbol()!=Symbol())) { continue; }
          OrderModify(OrderTicket(),OrderOpenPrice(),sellsl,ltp,0,Blue);
          Print("m2");
          return;} }
             
//+------------------------------------------------------------------+
//| External Script Code                                             |
//+------------------------------------------------------------------+

  string Message;

   Message = "                "+EA_name + NL +
             "                            Current Time is      " +  TimeToStr(TimeCurrent(), TIME_SECONDS) + NL + NL +                        
             "                            Initial Account Set              " + DoubleToStr(InitialAccount, 0) + NL +
             "                            Equity Protection % Set      " + DoubleToStr(FloatPercent, 0) + NL + NL +
             "                            Power Off Stop Loss on?         " + POSL_On + NL + NL +
             "                            Starting lot size                   " + DoubleToStr(lot, 2) + NL + NL +

             "                            Portion P/L                        " + DoubleToStr(pr, 2) + NL + NL +     
             
             "                            Buy   " + cb + "  Sell   " + cs + NL + NL +
             "                            Account Portion   " + DoubleToStr(Portion, 0) + "   Total Risk on Account Percent  " + DoubleToStr(FloatPercent/Portion, 0) + NL +                
             "                            Portion Balance      " + DoubleToStr(PortionBalance, 2);
             

   Comment(Message);  
      
return(0);
}
 
//+------------------------------------------------------------------+
//| Exit Trade Function                                              |
//+------------------------------------------------------------------+ 

  void ExitAllTrades(color Color, string reason){
    slip = NormalizeDouble((slippage * BrokerDecimal),0);
    bool success;
    for (int cnt = OrdersTotal() - 1; cnt >= 0; cnt --){
      OrderSelect(cnt, SELECT_BY_POS, MODE_TRADES);
      if (OrderSymbol() == Symbol() && OrderMagicNumber() == magic){
         OrderDelete(OrderTicket(),Color);
         success=OrderClose(OrderTicket(), OrderLots(), OrderClosePrice(), slip, Color);
         if(success==true){
            Print("Closed all positions because ",reason);} } } }   

//+------------------------------------------------------------------+
//| expert end function                                              |
//+------------------------------------------------------------------+
        
