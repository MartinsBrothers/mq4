//+------------------------------------------------------------------+
//|                                           61.Blessing 2 v4.3.mq4 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                                                    Blessing v4.3 |
//|                              Copyright � 2007-2008, MQLCoder.com |
//|                                             support@mqlcoder.com |
//+------------------------------------------------------------------+
#property copyright "Copyright � 2007-2008, FiFtHeLeMeNt."
#property link      "http://www.mqlcoder.com"

// Blessing uses a the (iMA) indicator to trade in a Grid Fashion by setting
// Buy and Sell Stops and Buy and Sell Limits.  The Grid is controlled manually
// with Pip Levels or Automatically using the Average True Range Indicator.
// Account Protection is added based on initial deposit along with allowable
// floating profit and loss changeable by percentage.  Money Management is available.
// The Moving Average indicator defines up or down market when enabled otherwise
// a ranging market variable is set by default.  This trading strategy needs
// a large initial account balance that trades down to microlots.

// *Indicates a change or fix from previous version

// Money Management Lot Minimum and Maximum calculations added*

extern string  InitialAccountSet   = "Enter your initial account balance in USD";
extern int     InitialAccount      = 5000; 

extern string  TradeCommentset     = "Enter whatever you like (i.e.: USDCAD Blessing)";
extern string  TradeComment        = "Blessing";

extern string  NumberPortionSet    = "Portion of Account you want to trade (1-10)";
extern string  NumberPortionSet2   = "Works with Money Management and Equity Protection";
extern int     Portion             = 1;    // Portion of account you want to trade on this pair

extern string  AccountProtect      = "Will protect account portion from excessive negative P/L";
extern bool    UseEquityProtection = true; // Close all orders when negative Float is excessive.
extern double  FloatPercent        = 50;   // Percent of portion for max Float level. 

extern string  BrokerDecimalSet    = "1 for 4 decimal, 10 for 5 decimal broker";
extern int     BrokerDecimal       = 1;    // 1 for 4 decimal broker, 10 for 5 decimal broker

extern string  MoneyManagementSet  = "Set true for MM and false for manual lots";
extern bool    UseMM               = 1;    // Money Management - 1 = true & 0 = false.

extern string  LotAdjustmentSet    = "Works only with MM enabled. (.01 - 5.0)";
extern double  LAF                 = 1.0;  // Adjusts MM base lot for large accounts

extern string  AccountTypeSet      = "Enter 1 for standard or 10 for micro account";
extern string  AccountTypeSet2     = "Works only with MM Enabled";
extern int     Accounttype         = 1;    // Used in Money Management feature only.

extern string  ManuallotSet        = "Lots used if MM is off";
extern double  lot                 = 0.01; // Starting lots if Money Management is off

extern string  LotHedgeSet         = "Hedge Multiplier.  Adjust by +/-.01 intervals ";
extern double  Multiplier          = 1.4;  // Multiplier on each level

extern string  AutoParametersSet   = "Autocalculates the Grid based on Average True Range";
extern bool    AutoCal             = false; // Auto calculation of TakeProfit and Grid size;

extern string  AutoGridAdjust      = "Widens/squishes grid (.5 - 3.0). Used with AutoCal";
extern double  GAF                 = 1.5;  // Widens/Squishes Grid on increments/decrements of .1

extern string  GridSet             = "Default Grid size in Pips";
extern int     GridSet1            = 25;   // Set 1 Grid Size
extern int     TP_Set1             = 50;   // Set 1 Take Profit
extern int     GridSet2            = 50;   // Level 2 Grid Size
extern int     TP_Set2             = 100;  // Level 2 Take Profit
extern int     GridSet3            = 100;  // Level 3 Grid Size
extern int     TP_Set3             = 200;  // Level 3 Take Profit

extern string  TimeGridSet         = "Default grid set time in seconds";
extern int     TimeGrid            = 2400; // Time Grid in seconds , to avoid opening of lots of levels in fast market

extern string  MarketConditionSet  = "Set MC to 2 for Ranging Market";
extern int     MC                  = 2;    // Market condition 0=uptrend 1=downtrend 2=range

extern string  MovingAverageSet    = "Changes MC for correct trend (up/down)";
extern bool    MCbyMA              = true; // Defines market condition by EMA , if price is above EMA,
                                           // it will take it as an uptrend and goes only long,
                                           // vice versa for below the EMA

extern string  FineTuneMASet       = "Changes period MA Indicator (5 thru 140)";
extern int     MA_Period           = 100;   // Period of MA

extern string  MaxLevelSet         = "Default of 4 on each level, change sparingly";
extern int     Set1Count           = 4;    // Level 1 max levels
extern int     Set2Count           = 4;    // Level 2 max levels
extern int     MaxLevel            = 99;   // Level 2 max levels (stops placing orders when reaches maxlvl2)
extern int     BELevel             = 12;   // Close All level , when reaches this level, doesn't wait for TP to be hit

extern string  Slippageset         = "Slippage Tolerance for closing";
extern int     slippage            = 5.0; // Tolerance of order slips/requotes for closing

// Internal Parameters

bool           ca                  = false;
string         EA_name             = "Blessing";
int            magic               = 0;
double         slip                = 0;       
int            d                   = 5;      // Used to offset entry to round numbers , for example if you set d=5,
                                             // it will place its sell order on 1.5795 instead of 1.5780
double         LotInc              = 0;      // Lot Increment on each level, very dangerous
string         Filename;

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
   double m,lot2;
   double lp; // last buy price
   double ll; //last lot
   double ltp; //last tp
   double lopt; // last open time
   int g2;
   double tp2;
   double entry;
   double pr=0; // profit;
   double sumlot;
   int lticket;
   double mp,mp2; // median price

//+------------------------------------------------------------------+
//| Trading with EA Criteria                                         |
//+------------------------------------------------------------------+

double PortionBalancetrade, InitialAccountMultiPortion;
PortionBalancetrade = NormalizeDouble(AccountBalance()/Portion,0);
InitialAccountMultiPortion = InitialAccount/Portion;

if (PortionBalancetrade < InitialAccountMultiPortion) return(0);

//Print(6,"   ",PortionBalancetrade,"   ",InitialAccountMultiPortion);

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
if(Lotsize>50/MathPow(Multiplier,6)  && Accounttype == 10) lot=NormalizeDouble(50/MathPow(Multiplier,6),2);
}
//Print(1.0,"   ",Contracts,"    ",Factor,"    ",lot,"    ",LAF,"   ",Accounttype);

//+------------------------------------------------------------------+
//| ATR to autocalculate the Grid                                    | 
//+------------------------------------------------------------------+     

double GridStart;
double value1 = iATR(NULL,PERIOD_D1,21,0);
    if(AutoCal==True)
    {
      if(Point == 0.01)   value1 = value1*100;
      if(Point == 0.0001) value1 = value1*10000;
      GridStart = (value1*2/10) * GAF;
      GridSet1  = GridStart;
      TP_Set1   = GridStart + GridSet1;
      GridSet2  = TP_Set1;
      TP_Set2   = (GridStart + GridSet1) * 2;
      GridSet3  = TP_Set2;
      TP_Set3   = (GridStart + GridSet1) * 4; 
 
   }       
//+------------------------------------------------------------------+
//| Moving Average Indicator for Calculation of Trend Direction      |
//+------------------------------------------------------------------+      

if (MCbyMA) {
     MC=-1;
     if (Bid<iMA(Symbol(),0,MA_Period,0,MODE_EMA,PRICE_CLOSE,0)) MC=1;
     if (Bid>iMA(Symbol(),0,MA_Period,0,MODE_EMA,PRICE_CLOSE,0)) MC=0;
     
}

 for (y = 0; y < OrdersTotal(); y++)
   {
      OrderSelect (y, SELECT_BY_POS, MODE_TRADES);
      if ((OrderMagicNumber()==magic) && (OrderSymbol()==Symbol()) && (OrderType()==OP_BUY)) {
        cb++;
        pr=pr+OrderProfit();
      }
      if ((OrderMagicNumber()==magic) && (OrderSymbol()==Symbol()) && (OrderType()==OP_SELL)) {
        cs++;
        pr=pr+OrderProfit();
      }
      if ((OrderMagicNumber()==magic) && (OrderSymbol()==Symbol()) && (OrderType()==OP_BUYLIMIT)) cbl++;
      if ((OrderMagicNumber()==magic) && (OrderSymbol()==Symbol()) && (OrderType()==OP_SELLLIMIT)) csl++;
      if ((OrderMagicNumber()==magic) && (OrderSymbol()==Symbol()) && (OrderType()==OP_BUYSTOP)) cbs++;
      if ((OrderMagicNumber()==magic) && (OrderSymbol()==Symbol()) && (OrderType()==OP_SELLSTOP)) css++;
   }
//+------------------------------------------------------------------+
//| Account Protection                                               |
//+------------------------------------------------------------------+ 

if(UseEquityProtection) EquityProtection(NormalizeDouble(pr,0));
   
   
if (cs==0 && cb==0 && cbs==0 && cbl==0 && css==0 && csl==0) ca=false;
   
   slip = NormalizeDouble((slippage * BrokerDecimal),0);
  
   if (((cb>=BELevel || cs>=BELevel) && pr>0) || ca) {
     ca=true;
     for (y = 0; y < OrdersTotal(); y++)
     {
       OrderSelect (y, SELECT_BY_POS, MODE_TRADES);
       if ((OrderMagicNumber()==magic) && (OrderSymbol()==Symbol()) && (OrderType()==OP_BUY || OrderType()==OP_SELL)) OrderClose(OrderTicket(),OrderLots(),OrderClosePrice(),slip,Lime);
       if ((OrderMagicNumber()==magic) && (OrderSymbol()==Symbol()) && (OrderType()==OP_BUYLIMIT || OrderType()==OP_SELLLIMIT || OrderType()==OP_BUYSTOP || OrderType()==OP_SELLSTOP)) OrderDelete(OrderTicket(),White);
     }
     return;
   }

      d = d;
      if (BrokerDecimal == 10) d=50;
      g2=GridSet1;
      tp2=TP_Set1;
      

   if (cb>=Set1Count || cs>=Set1Count) {
     g2=GridSet2;
     tp2=TP_Set2;
   }

   if (cb>=Set2Count+Set1Count || cs>=Set2Count+Set1Count) {
     g2=GridSet3;
     tp2=TP_Set3;
   }
   
//+------------------------------------------------------------------+
//| Broker Decimal Selection                                         |
//+------------------------------------------------------------------+ 

if (BrokerDecimal == 10){
     g2=g2*10;
     tp2=tp2*10;
     }

//Print(2.0,"   ",d,"   ",g2,"   ",tp2);  

//+------------------------------------------------------------------+
//| Trade Selection Logic                                            |
//+------------------------------------------------------------------+ 

   if ((cb==0) && (cs==0)) {
     for (y = 0; y < OrdersTotal(); y++)
     {
       OrderSelect (y, SELECT_BY_POS, MODE_TRADES);
       if ((OrderMagicNumber()==magic) && (OrderSymbol()==Symbol()) && (OrderLots()>lot)) OrderDelete(OrderTicket(),White);
     }


     if (MC==0) {
        if (cbs==0) {
          m=MathMod(Ask/Point,g2);
          if ((g2-m+d)>MarketInfo(Symbol(),MODE_STOPLEVEL)) {
            OrderSend(Symbol(),OP_BUYSTOP,lot,Ask*2-Bid+(g2-m+d)*Point,0,0,Ask*2-Bid+(g2-m+d+tp2)*Point,TradeComment,magic,0,DodgerBlue);
            Print("s2");
            return;
          }
        }
        if (cbl==0) {
          m=MathMod(Ask/Point,g2);
          if ((m+d)>MarketInfo(Symbol(),MODE_STOPLEVEL)) {
            OrderSend(Symbol(),OP_BUYLIMIT,lot,Ask*2-Bid-(m+d)*Point,0,0,Ask*2-Bid-(m+d-tp2)*Point,TradeComment,magic,0,DodgerBlue);
            Print("s1");
            return;
          }
        }
     }

     if (MC==1) {
        if (csl==0) {
          m=MathMod(Bid/Point,g2);
          if ((g2-m-d)>MarketInfo(Symbol(),MODE_STOPLEVEL)) {
            OrderSend(Symbol(),OP_SELLLIMIT,lot,Bid+(g2-m-d)*Point,0,0,Bid+(g2-m-d-tp2)*Point,TradeComment,magic,0,OrangeRed);
            Print("s2");
            return;
          }
        }
        if (css==0) {
          m=MathMod(Bid/Point,g2);
          if ((m+d)>MarketInfo(Symbol(),MODE_STOPLEVEL)) {
            OrderSend(Symbol(),OP_SELLSTOP,lot,Bid-(m+d)*Point,0,0,Bid-(m+d+tp2)*Point,TradeComment,magic,0,OrangeRed);
            Print("s1");
            return;
          }
        }
     }
        
     
     if (MC==2) {
        if (css==0) {
          m=MathMod(Bid/Point,g2);
          if ((m+d)>MarketInfo(Symbol(),MODE_STOPLEVEL)) {
            OrderSend(Symbol(),OP_SELLSTOP,lot,Bid-(m+d)*Point,0,0,Bid-(m+d+tp2)*Point,TradeComment,magic,0,OrangeRed);
            Print("s1");
            return;
          }
        }
        if (cbs==0) {
          m=MathMod(Ask/Point,g2);
          if ((g2-m+d)>MarketInfo(Symbol(),MODE_STOPLEVEL)) {
            OrderSend(Symbol(),OP_BUYSTOP,lot,Ask*2-Bid+(g2-m+d)*Point,0,0,Ask*2-Bid+(g2-m+d+tp2)*Point,TradeComment,magic,0,DodgerBlue);
            Print("s2");
            return;
          }
        }
      }

   }
//Print(5,"    ",TradeComment);  
   if (cb>0 || cs>0) {
     for (y = 0; y < OrdersTotal(); y++)
     {
        OrderSelect (y, SELECT_BY_POS, MODE_TRADES);
        if ((OrderMagicNumber()==magic) && (OrderSymbol()==Symbol()) && (OrderType()!=OP_SELL) && (OrderType()!=OP_BUY) && OrderLots()==lot) OrderDelete(OrderTicket(),White);
     }
   }
   
   
   if (cb>0) {
     sumlot=0;
     mp=0;
     for (y = 0; y < OrdersTotal(); y++)
     {
       OrderSelect (y, SELECT_BY_POS, MODE_TRADES);
       if ((OrderMagicNumber() != magic) || (OrderType()!=OP_BUY) || (OrderSymbol()!=Symbol())) { continue; }
       lp=OrderOpenPrice();
       ll=OrderLots();
       ltp=OrderTakeProfit();
       lopt=OrderOpenTime();
       lticket=OrderTicket();
       sumlot=sumlot+ll;
       mp=mp+ll*lp;
     }
     mp=mp/sumlot;
     

       if ((TimeCurrent()-TimeGrid>lopt) && (cb<MaxLevel)) {
         if (lp>Ask) entry=NormalizeDouble(lp-(MathRound((lp-Ask)/Point/g2)+1)*g2*Point,Digits); else entry=NormalizeDouble(lp-g2*Point,Digits);
         if (ll <= 0.01) lot2=NormalizeDouble(ll*2+LotInc,2); else lot2=NormalizeDouble(ll*Multiplier+LotInc,2);
         
         if (cbl==0) {
           OrderSend(Symbol(),OP_BUYLIMIT,lot2,entry,0,0,entry+tp2*Point,TradeComment,magic,0,DodgerBlue);
           Print("s3");
           return;
         }

         if (cbl==1) {
           for (y = 0; y < OrdersTotal(); y++)
           {
              OrderSelect (y, SELECT_BY_POS, MODE_TRADES);
              if (OrderType()==OP_BUYLIMIT && OrderMagicNumber()==magic && (OrderSymbol()==Symbol()) && entry-OrderOpenPrice()>g2/2*Point) {
                OrderModify(OrderTicket(),entry,OrderStopLoss(),entry+tp2*Point,0,Yellow);
                Print("mo1");
              }
            }
         }
         
       } 


     for (y = 0; y < OrdersTotal(); y++) // Sync TPs
     {
       OrderSelect (y, SELECT_BY_POS, MODE_TRADES);
       if ((OrderMagicNumber() != magic) || (OrderType()!=OP_BUY) || (MathAbs(OrderTakeProfit()-ltp)<Point) || (OrderSymbol()!=Symbol())) { continue; }
       OrderModify(OrderTicket(),OrderOpenPrice(),OrderStopLoss(),ltp,0,Yellow);
       Print("m1");
       return;
     }
     
   }

   if (cs>0) {
     sumlot=0;
     mp=0;
     for (y = 0; y < OrdersTotal(); y++)
     {
       OrderSelect (y, SELECT_BY_POS, MODE_TRADES);
       if ((OrderMagicNumber() != magic) || (OrderType()!=OP_SELL) || (OrderSymbol()!=Symbol())) { continue; }
       lp=OrderOpenPrice();
       ll=OrderLots();
       ltp=OrderTakeProfit();
       lopt=OrderOpenTime();
       lticket=OrderTicket();
       sumlot=sumlot+ll;
       mp=mp+ll*lp;
     }
     mp=mp/sumlot;
     

       if ((TimeCurrent()-TimeGrid>lopt) && (cs<MaxLevel)) {

         if (Bid>lp) entry=NormalizeDouble(lp+(MathRound((-lp+Bid)/Point/g2)+1)*g2*Point,Digits); else entry=NormalizeDouble(lp+g2*Point,Digits);
         if (ll <= 0.01) lot2=NormalizeDouble(ll*2+LotInc,2); else lot2=NormalizeDouble(ll*Multiplier+LotInc,2);
         
         if (csl==0) {
            OrderSend(Symbol(),OP_SELLLIMIT,lot2,entry,0,0,entry-tp2*Point,TradeComment,magic,0,OrangeRed);
            Print("s4");
            return;
         }

         if (csl==1) {
           for (y = 0; y < OrdersTotal(); y++)
           {
              OrderSelect (y, SELECT_BY_POS, MODE_TRADES);
              if (OrderType()==OP_SELLLIMIT && OrderMagicNumber()==magic && (OrderSymbol()==Symbol()) && OrderOpenPrice()-entry>g2/2*Point) {
                OrderModify(OrderTicket(),entry,OrderStopLoss(),entry-tp2*Point,0,Yellow);
                Print("mo2");
              }
            }
         }
      }

     for (y = 0; y < OrdersTotal(); y++)
     {
       OrderSelect (y, SELECT_BY_POS, MODE_TRADES);
       if ((OrderMagicNumber() != magic) || (OrderType()!=OP_SELL) || (MathAbs(OrderTakeProfit()-ltp)<Point) || (OrderSymbol()!=Symbol())) { continue; }
       OrderModify(OrderTicket(),OrderOpenPrice(),OrderStopLoss(),ltp,0,Yellow);
       Print("m2");
       return;
     }
   }
   
  
      
      return(0);
  }
 
//+------------------------------------------------------------------+
//| Equity Protection Function                                       |
//+------------------------------------------------------------------+ 
  
 void EquityProtection(int Profit) { 
      
      double PortionBalance, PortionEquity;
      PortionBalance = NormalizeDouble(AccountBalance()/Portion,0);
      PortionEquity  = NormalizeDouble(PortionBalance + Profit,0);
      
      for (int i=0; i<OrdersTotal(); i++) {  
      if (OrderSelect(i, SELECT_BY_POS, MODE_TRADES)) {  
         if ( (OrderSymbol()==Symbol()) && (OrderMagicNumber()==magic) && (OrderComment()==TradeComment) ) {  
            
            slip = NormalizeDouble((slippage * BrokerDecimal),0);
            
            if (OrderType()==OP_BUY)  
               if ( PortionBalance - PortionEquity >= (PortionBalance * FloatPercent/100) )  
                 OrderClose(OrderTicket(),OrderLots(),Bid,slip,Red); 
            if (OrderType()==OP_SELL)  
               if ( PortionBalance - PortionEquity >= (PortionBalance * FloatPercent/100) )  
                 OrderClose(OrderTicket(),OrderLots(),Ask,slip,Red); 
     
         
         } 
      } 
   } 
}  
//+------------------------------------------------------------------+
//| expert end function                                              |
//+------------------------------------------------------------------+
        
