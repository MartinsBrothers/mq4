//+------------------------------------------------------------------+
//|                                                    69.Boiler.mq4 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                                                   Boiler_v15.mq4 |
//|  EURUSD H1 Trading Hours 22,23,0,1,6,7                           |
//+------------------------------------------------------------------+
#property copyright "Copyright � 2011, Maximo "
#property link      "http://www.metaquotes.net"

#import "kernel32.dll"
   void GetLocalTime(int& a0[]);
   int GetTimeZoneInformation(int& a0[]);
#import

string EA_comment  = "Boiler_v15";

 bool   AllowTrading    = true;
extern bool   TradeFridays    = False;
extern bool   MoneyManagement = True;
extern double PercentRisk     = 5.0;
extern double LotSize         = 0.05;
extern int    MagicNumber     = 3441;
extern int    StartHour       = 0;
extern int    Orders          = 1; //2
extern bool   Breakeven2orders= False;
extern bool   Dalembert       = False;
double        Dlots;
extern bool   DailyCloseAll   = False;
extern double TP              = 1.95;
extern int    BreakEvenAtPips = 0;
extern int    TrailingStopPips= 66;
extern int    TrailingStep    = 2;
extern int    SetStopLoss     = 0;
extern int    SetTakeProfit   = 0;
extern bool   LevelMarks      = True;

double PipValue    = 0.0001; //4 & 5 digit currency
int totalorders,buys,sells,buylimits,selllimits;
int slippage       = 3;
int dayspast       = 0;
int prevbar;
int previous_orders;
int Transacttime;
int PrevOffsetHour;
bool Newbar = False;
bool TradeDelay = False;
bool Friday;

string Timezone = " --- Timezone ---";
int GMToffset, Myoffset, LoclTime;

int deinit() { Comment(""); return (0); }

int init()
{
   if (Digits < 4) PipValue = 0.01; //2 & 3 digit currency like JPY
   prevbar = Bars;
   Dlots = LotSize;
   return(0);
}

int start()
{
   if (!IsDllsAllowed()) { Alert("ShowGMT: DLLs are disabled.  To enable tick the checkbox in the Common Tab of indicator"); return; }
   AutoGMTOffset();
   MoneyManagement();   
   if (Dalembert==True) LotSize = DalembertLotSize();

   int li_188 = 100; //JPY
   int digs  = Digits;
   if (StringFind(Symbol(), "JPY", 0) == -1) li_188 = 10000; //other than JPY pairs

   bool TimeToTrade = False;
   //if (Hour() == StartHour) TimeToTrade = True;
   if (IsTesting()) //Backtester time correction
   {
      int testtime;
      testtime = TimeHour(LoclTime) + Myoffset;
      if (testtime >= 24) testtime = testtime - 24;
      if (testtime < 0) testtime = testtime + 24;
      if (testtime == StartHour) TimeToTrade = True;
   }
   else if (TimeHour(LoclTime) == StartHour) TimeToTrade = True; 
 
   //int OffsetHour = Hour() - StartHour; //syncronize Daily start Hour broker time  
   int OffsetHour = TimeHour(LoclTime) - StartHour; //syncronize Daily start Hour GMT
   if (IsTesting()) OffsetHour = testtime - StartHour; //Backtester time correction for GMT
   if (OffsetHour >= 24) OffsetHour = OffsetHour - 24;
   if (OffsetHour < 0) OffsetHour = OffsetHour + 24;
 
   double OpenPrice = iOpen(Symbol(),PERIOD_H1,OffsetHour) * li_188;
   
   // Direction Logic
   //double OpenPrice = iOpen(Symbol(), PERIOD_D1, dayspast) * li_188;
   int Mod=(180* MathSqrt(OpenPrice) - 225.0)/360;
   double dir=(((180* MathSqrt(OpenPrice) - 225.0)/360)-Mod)*360;
   string strdir = "Unknown: " + dir;
   if (dir >= 0.0 && dir <= 90.0 || dir >= 180.0 && dir <= 270.0) strdir="Long";
   if (dir > 90.0 && dir < 180.0 || dir > 270.0 && dir <= 360.0) strdir="Short";

   double ld_124 = 0, ld_132 = 0, ld_148 = 0, ld_156 = 0, ld_164 = 0;
   // Grid width
   if (dir >= 90.0) {
      ld_124 = NormalizeDouble(dir / 90.0, 0);
      ld_148 = dir / ld_124;
      ld_164 = ld_148 / 180.0;
   } else {
      ld_132 = NormalizeDouble(90 / dir, 0);
      ld_156 = dir * ld_132;
      ld_164 = ld_156 / 180.0;
   }
   
   double Entry_1;
   double Entry_2;
   double TP1;
   double TP2;
   double SL;
   double ld_196 = MathSqrt(OpenPrice);
   
   if (strdir=="Long")
   {
      Entry_1 = NormalizeDouble(OpenPrice / li_188,digs); //White
      Entry_2 = NormalizeDouble((ld_196 - ld_164 / 2.0) * (ld_196 - ld_164 / 2.0) / li_188,digs); //Orange
      TP1 = NormalizeDouble((ld_196 + ld_164 / 2.0) * (ld_196 + ld_164 / 2.0) / li_188,digs); //Lime
      TP2 = NormalizeDouble((ld_196 + ld_164) * (ld_196 + ld_164) / li_188,digs); //Green
      SL = NormalizeDouble((ld_196 - ld_164) * (ld_196 - ld_164) / li_188,digs); //Red
   }
   
   if (strdir=="Short")
   {
      Entry_1 = NormalizeDouble(OpenPrice / li_188,digs); //White
      Entry_2 = NormalizeDouble((ld_196 + ld_164 / 2.0) * (ld_196 + ld_164 / 2.0) / li_188,digs); //Orange
      TP1 = NormalizeDouble((ld_196 - ld_164 / 2.0) * (ld_196 - ld_164 / 2.0) / li_188,digs); //Lime
      TP2 = NormalizeDouble((ld_196 - ld_164) * (ld_196 - ld_164) / li_188,digs); //Green
      SL = NormalizeDouble((ld_196 + ld_164) * (ld_196 + ld_164) / li_188,digs); //Red
   }
    
   if (LevelMarks && PrevOffsetHour != OffsetHour)
   {
      ObjectCreate("white_line" + Time[0], OBJ_ARROW, 0, TimeCurrent(),Entry_1);
      ObjectSet("white_line" + Time[0], OBJPROP_ARROWCODE, 4);
      ObjectSet("white_line" + Time[0], OBJPROP_COLOR, White);
      ObjectCreate("orange_line" + Time[0], OBJ_ARROW, 0, TimeCurrent(),Entry_2);
      ObjectSet("orange_line" + Time[0], OBJPROP_ARROWCODE, 4);
      ObjectSet("orange_line" + Time[0], OBJPROP_COLOR, Orange);
      ObjectCreate("lime_line" + Time[0], OBJ_ARROW, 0, TimeCurrent(),TP1);
      ObjectSet("lime_line" + Time[0], OBJPROP_ARROWCODE, 4);
      ObjectSet("lime_line" + Time[0], OBJPROP_COLOR, Lime);
      ObjectCreate("green_line" + Time[0], OBJ_ARROW, 0, TimeCurrent(),TP2);
      ObjectSet("green_line" + Time[0], OBJPROP_ARROWCODE, 4);
      ObjectSet("green_line" + Time[0], OBJPROP_COLOR, Green);
      ObjectCreate("red_line" + Time[0], OBJ_ARROW, 0, TimeCurrent(),SL);
      ObjectSet("red_line" + Time[0], OBJPROP_ARROWCODE, 4);
      ObjectSet("red_line" + Time[0], OBJPROP_COLOR, Red);
      //Print("OffsetHour= ",OffsetHour);
   }
   PrevOffsetHour = OffsetHour;
   Newbar = False;
   if (prevbar != Bars) Newbar = True; prevbar = Bars;
   
   bool TradeOnFriday = True;
   if (TradeFridays==False && DayOfWeek()==5) TradeOnFriday = False;
   
   Count_Orders();
   if (previous_orders > buys + sells) Close_Orders();
   previous_orders = buys + sells;
   
   if (totalorders > 0) ManageTrade();

   int Ticket = 0;
   double TPn = (Entry_1 - Entry_2) * TP; //TPn pips added to Entry_1 for TakeProfit price
   double TPX,SLX;
   
   if (TimeToTrade == True && Transacttime != iTime(NULL,PERIOD_H4,0) && strdir == "Long")
   {              
      if (totalorders > 0) Close_Orders(); //close yesterdays orders if DailyCloseAll
      if (AllowTrading && TradeOnFriday && totalorders < 1)
      {
         if (Orders>0)
         {   
            if (!Trade_Check()) return;
            Ticket = OrderSend(Symbol(), OP_BUY, LotSize, Ask, slippage, 0, 0,EA_comment, MagicNumber,0, Blue); Sleep(1000);         
            if (Ticket < 0) { Print("Error opening Order " + GetLastError()); return (0); }
            else Transacttime = iTime(NULL,PERIOD_H4,0);
            if (OrderSelect(Ticket, SELECT_BY_TICKET) != False)
            {
               //OrderModify(Ticket, OrderOpenPrice(), SL, (TPn + Entry_1), OrderExpiration(), Blue);
               if (SetStopLoss > 0) SLX = OrderOpenPrice() - SetStopLoss * PipValue; else SLX = SL; 
               if (SetTakeProfit > 0) TPX = OrderOpenPrice() + SetTakeProfit * PipValue; else TPX = (TPn + Entry_1);
               OrderModify(Ticket, OrderOpenPrice(), SLX, TPX, OrderExpiration(), Blue);
            }
         }
         if (SetStopLoss > 0) SLX = OrderOpenPrice() - SetStopLoss * PipValue; else SLX = SL;
         if (Orders==2) 
         {
            if (Breakeven2orders) Ticket = OrderSend(Symbol(),OP_BUYLIMIT, LotSize,Entry_2, slippage, SLX, NormalizeDouble((OrderOpenPrice() + Entry_2) / 2,digs),EA_comment,MagicNumber,0,Blue);
            else Ticket = OrderSend(Symbol(),OP_BUYLIMIT, LotSize,Entry_2, slippage, SLX, OrderOpenPrice(),EA_comment,MagicNumber,0,Blue);
         }
         if (Orders==0) Ticket = OrderSend(Symbol(),OP_BUYLIMIT, LotSize,Entry_2, slippage, SLX, (TPn + Entry_2),EA_comment,MagicNumber,0,Blue);
         Sleep(1000);
         if (Ticket < 0) { Print("Error opening Limit Order " + GetLastError()); return (0); }
         else Transacttime = iTime(NULL,PERIOD_H4,0);
      }
   }

   if (TimeToTrade == True && Transacttime != iTime(NULL,PERIOD_H4,0) && strdir == "Short")
   {
      if (totalorders > 0) Close_Orders();  //close yesterdays orders if DailyCloseAll
      if (AllowTrading && TradeOnFriday && totalorders < 1)
      {
         if (Orders>0)
         {
            if (!Trade_Check()) return;
            Ticket = OrderSend(Symbol(), OP_SELL, LotSize, Bid, slippage, 0, 0,EA_comment, MagicNumber,0, Magenta); Sleep(1000);
            if (Ticket < 0) { Print("Error opening Order " + GetLastError()); return (0); }
            else Transacttime = iTime(NULL,PERIOD_H4,0);
            if (OrderSelect(Ticket, SELECT_BY_TICKET) != False)
            {
               //OrderModify(Ticket, OrderOpenPrice(), SL, (TPn + Entry_1), OrderExpiration(), Magenta);
               if (SetStopLoss > 0) SLX = OrderOpenPrice() + SetStopLoss * PipValue; else SLX = SL;
               if (SetTakeProfit > 0) TPX = OrderOpenPrice() - SetTakeProfit * PipValue; else TPX = (TPn + Entry_1);  
               OrderModify(Ticket, OrderOpenPrice(), SLX, TPX, OrderExpiration(), Magenta);
            }
         }
         if (SetStopLoss > 0) SLX = OrderOpenPrice() + SetStopLoss * PipValue; else SLX = SL;
         if (Orders==2)
         {
            if (Breakeven2orders) Ticket = OrderSend(Symbol(),OP_SELLLIMIT, LotSize,Entry_2, slippage, SLX, NormalizeDouble((OrderOpenPrice() + Entry_2) / 2,digs),EA_comment,MagicNumber,0,Magenta);
            else Ticket = OrderSend(Symbol(),OP_SELLLIMIT, LotSize,Entry_2, slippage, SLX, OrderOpenPrice(),EA_comment,MagicNumber,0,Magenta);
         }
         if (Orders==0) Ticket = OrderSend(Symbol(),OP_SELLLIMIT, LotSize,Entry_2, slippage, SLX, (TPn + Entry_2),EA_comment,MagicNumber,0,Magenta); //TP1
         Sleep(1000);
         if (Ticket < 0) { Print("Error opening Limit Order " + GetLastError()); return (0); }
         else Transacttime = iTime(NULL,PERIOD_H4,0);
      }
   }
   // When Orders=1 Entry_2 becomes a setting point for breakeven on Entry_1
   if (AllowTrading && buys==1 && buylimits<1 && strdir=="Long" && Orders==1 && Bid <= Entry_2) SetBreakEven(Entry_2);
   if (AllowTrading && sells==1 && selllimits<1 && strdir=="Short" && Orders==1 && Ask >= Entry_2) SetBreakEven(Entry_2);

   
   string msg = "";
   msg = msg 
   + "\n " + EA_comment + " Advisor"
   + "\n "
   + "\n GMT  " + TimeToStr(LoclTime,TIME_MINUTES)
   + "\n TPn:  " + DoubleToStr(MathAbs(TPn) / PipValue,1)
   + "\n Lots:  " + DoubleToStr(LotSize,2)
   + "\n Direction: " + strdir
   + "\n"
   + "\n Entry1= " + DoubleToStr(Entry_1,digs)
   + "\n Entry2= " + DoubleToStr(Entry_2,digs)
   + "\n     TP1= " + DoubleToStr(TP1,digs)
   + "\n     TP2= " + DoubleToStr(TP2,digs)
   + "\n       SL= " + DoubleToStr(SL,digs);
   
   //+ "\n\n OffsetHour= " + OffsetHour;
   
   Comment(msg);

   return(0);
}


int Count_Orders()
{
   TradeDelay = False;
   totalorders=0; buys=0; sells=0; buylimits=0; selllimits=0;
   for (int i=0; i<OrdersTotal(); i++)
   { 
      if (OrderSelect(i,SELECT_BY_POS,MODE_TIME)==true)
      {
         if (OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber)
         {
            if (TimeCurrent() - OrderOpenTime() < 3600) TradeDelay = True; //3600 secs = 1 hour
            else TradeDelay = False;
            if (OrderType() == OP_BUY) buys++;
            if (OrderType() == OP_SELL) sells++;
            if (OrderType() == OP_BUYLIMIT) buylimits++;
            if (OrderType() == OP_SELLLIMIT) selllimits++;
            totalorders++;
         }
      }
   }
}

void Close_Orders() {
   if (OrdersTotal() > 0) {
      for (int order_total = OrdersTotal(); order_total >= 0; order_total--) {
         OrderSelect(order_total, SELECT_BY_POS, MODE_TRADES);
         if (OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber)
         {
            if (DailyCloseAll || previous_orders >  buys + sells) //close 2nd order when 1st order closed
            {
               if (OrderType() == OP_BUY) OrderClose(OrderTicket(), OrderLots(), Bid, slippage, Blue);
               if (OrderType() == OP_SELL) OrderClose(OrderTicket(), OrderLots(), Ask, slippage, Red);
               if (OrderType() == OP_BUYLIMIT) OrderDelete(OrderTicket(),CLR_NONE);
               if (OrderType() == OP_SELLLIMIT) OrderDelete(OrderTicket(),CLR_NONE);
               Sleep(1000);
            }
            if (!DailyCloseAll && Orders == 0) //reset the pending only order daily
            {
               if (OrderType() == OP_BUYLIMIT) OrderDelete(OrderTicket(),CLR_NONE);
               if (OrderType() == OP_SELLLIMIT) OrderDelete(OrderTicket(),CLR_NONE);
            }
         }
      }
   }
}

bool Trade_Check() {
      for (double cb=0; IsTradeContextBusy() && cb < 50; cb++) Sleep(100); //Wait upto 5 seconds
      if (cb > 0) Print("Trade context was busy ", DoubleToStr(100 * cb / 1000, 2)," seconds");
      if (!IsTradeAllowed()) return(0);
      else return(1);
}

void SetBreakEven(double Entry_2) {
   for (int pos = 0; pos < OrdersTotal(); pos++)
   {
      if (OrderSelect(pos, SELECT_BY_POS) == TRUE && OrderMagicNumber() == MagicNumber && OrderSymbol() == Symbol())
      {
         if (OrderType() == OP_BUY)
         {
            if (Bid <= Entry_2) OrderModify(OrderTicket(), OrderOpenPrice(), OrderStopLoss(), OrderOpenPrice(), 0);         
         }
         if (OrderType() == OP_SELL)  
         {
            if (Ask >= Entry_2) OrderModify(OrderTicket(), OrderOpenPrice(), OrderStopLoss(), OrderOpenPrice(), 0);
         }
      }
   }
}

void MoneyManagement()
{
   if (MoneyManagement) LotSize = (AccountEquity() * PercentRisk / 100) / 1000;
   
   double lot_min  = MarketInfo(Symbol(), MODE_MINLOT);
   double lot_max  = MarketInfo(Symbol(), MODE_MAXLOT);
   double lot_step = MarketInfo(Symbol(), MODE_LOTSTEP);

   if(LotSize <= lot_min ) LotSize = lot_min;                // checking for minimum lot
   else  if(LotSize >= lot_max ) LotSize = lot_max;          // checking for maximum lot
   else LotSize = MathFloor(LotSize / lot_step) * lot_step;  // rounding to the nearest
   LotSize = (NormalizeDouble(LotSize,2));                   // normalization of

   if (MoneyManagement) Dlots = LotSize;
}

double DalembertLotSize() 
{ 
   datetime LastCloseTime; 
   double NewLots;
   double lot_min  = MarketInfo(Symbol(), MODE_MINLOT);
   for(int cnt = OrdersHistoryTotal() - 1; cnt>=0 ;cnt--) 
   { 
      if(OrderSelect(cnt,SELECT_BY_POS,MODE_HISTORY)) 
      { 
         if(OrderSymbol()==Symbol() && OrderMagicNumber() == MagicNumber) 
         { 
            if(OrderCloseTime() > LastCloseTime) 
            { 
               LastCloseTime = OrderCloseTime();
               NewLots = OrderLots() - lot_min * (1 - 2*(OrderProfit() < 0)); 
            } 
         } 
      } 
   }      
   if (NewLots <= Dlots) return(Dlots);
   return (NewLots); 
}

void ManageTrade() {
   double price;
   for (int pos = 0; pos < OrdersTotal(); pos++)
   {
      if (OrderSelect(pos, SELECT_BY_POS) == TRUE && OrderMagicNumber() == MagicNumber && OrderSymbol() == Symbol())
      {
         if (OrderType() == OP_BUY)
         {
            if (BreakEvenAtPips > 0)
              if (Bid - OrderOpenPrice() >= BreakEvenAtPips * PipValue && OrderStopLoss() < OrderOpenPrice())
                  OrderModify(OrderTicket(), OrderOpenPrice(), OrderOpenPrice(), OrderTakeProfit(), 0);
            if (TrailingStopPips > 0)
            {
               if (Bid > OrderStopLoss() + TrailingStopPips * PipValue + (TrailingStep * PipValue))
               {
                  price = Bid - TrailingStopPips * PipValue; // * TrailingStep example = 2
                  OrderModify(OrderTicket(), OrderOpenPrice(), price, OrderTakeProfit(), 0);
               }
            }
         }

         if (OrderType() == OP_SELL)
         {
            if (BreakEvenAtPips > 0)
              if (OrderOpenPrice() - Ask >= BreakEvenAtPips * PipValue && OrderStopLoss() > OrderOpenPrice())
                  OrderModify(OrderTicket(), OrderOpenPrice(), OrderOpenPrice(), OrderTakeProfit(), OrderExpiration(),0); 
            if (TrailingStopPips > 0)
            {
               if (Ask < OrderStopLoss() - TrailingStopPips * PipValue - (TrailingStep * PipValue))
               {
                 price = Ask + TrailingStopPips * PipValue; // * TrailingStep example = 2
                 OrderModify(OrderTicket(), OrderOpenPrice(), price, OrderTakeProfit(), 0);
               }
            }
         }
      }
   }
}

int AutoGMTOffset() {
   int Timezone[43];
   int offset1 = -420;
   int offset2 = GetTimeZoneInformation(Timezone);
   if (offset2 != 0) offset1 = Timezone[0];
   if (offset2 == 2) offset1 += Timezone[42];
   LoclTime = TimeLocal() + 60 * offset1;
   GMToffset = (TimeCurrent() - LoclTime) / 3500;
   Myoffset = + ((TimeLocal() - LoclTime) / 3500);
   return (0); 
}


        
