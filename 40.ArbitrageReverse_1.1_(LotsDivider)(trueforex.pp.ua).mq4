//+------------------------------------------------------------------+
//|       40.ArbitrageReverse_1.1_(LotsDivider)(trueforex.pp.ua).mq4 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                                         ArbitrageReverse_1.1.mq4 |
//|                               Copyright � 2007, Yury V. Reshetov |
//|                                          http://reshetov.xnet.uz |
//+------------------------------------------------------------------+
#property copyright "Copyright � 2007, Yury V. Reshetov"
#property link      "http://reshetov.xnet.uz"
//---- input parameters
extern string separator1="---------------- Entry Settings";
extern double beginPrice = 1.8014;
static int    prevtime = 0;
static double bl = 1000;
extern string separator2="---------------- Money Management";
extern double experts = 1;
extern double LotsDivider = 10;
extern bool UseBasketOptions=false;
extern int    BasketProfit=7500;        // if equity reaches this level, close trades
extern int    BasketLoss=99999;        // if equity reaches this negative level, close trades
extern string separator3="---------------- Order Management";
extern int    magicnumber = 777;
extern int    Slippage=3;             // how many pips of slippage can you tolorate
extern string separator4="---------------- Filters";
extern bool TradeOnSunday=true; //time filter on sunday
extern bool MondayToThursdayTimeFilter=false; //time filter the week
extern int MondayToThursdayStartHour=8; //start hour time filter the week
extern int MondayToThursdayEndHour=17; //end hour time filter the week
extern bool FridayTimeFilter=false; //time filter on friday
extern int FridayStartHour=8; //start hour time filter on friday
extern int FridayEndHour=14; //end hour time filter on friday
double maxEquity;
double minEquity;
double CECount;
double CEProc;
double CEBuy;
double CESell;

//+------------------------------------------------------------------+
//| expert initialization function                                   |
//+------------------------------------------------------------------+
int init()
  {
//----
   return(0);
  }
//+------------------------------------------------------------------+
//| expert deinitialization function                                 |
//+------------------------------------------------------------------+
int deinit()
  {
//----
   return(0);
  }
//+------------------------------------------------------------------+
//| expert start function                                            |
//+------------------------------------------------------------------+
int start()
  {
  
   if ((TradeOnSunday==false&&DayOfWeek()==0)||(MondayToThursdayTimeFilter&&DayOfWeek()>=1&&DayOfWeek()<=4&&!(Hour()>=MondayToThursdayStartHour&&Hour()<=MondayToThursdayEndHour))||
   (FridayTimeFilter&&DayOfWeek()==5&&!(Hour()>=FridayStartHour&&Hour()<=FridayEndHour))){CloseEverything();return(0);}
   double CurrentProfit=0;
   double CurrentBasket=0;

   //Basket profit or loss
   CurrentBasket=AccountEquity()-AccountBalance();
   
   if(UseBasketOptions&&CurrentBasket>maxEquity) maxEquity=CurrentBasket;
   if(UseBasketOptions&&CurrentBasket<minEquity) minEquity=CurrentBasket;
   
   // actual basket closure
   if(UseBasketOptions&& CurrentBasket>=BasketProfit || CurrentBasket<=(BasketLoss*(-1)))
     {
      CloseEverything();
      CECount++;
     }

   if(Time[0] == prevtime) 
       return(0);
   prevtime = Time[0];
   if(!IsTradeAllowed()) 
     {
       prevtime = Time[1];
       return(0);
     }
//----
   int total = OrdersHistoryTotal();
   double money = bl * beginPrice;
   int i = 0;
   for (i = 0; i < total; i++) 
     {
       OrderSelect(i, SELECT_BY_POS, MODE_HISTORY);
       if(OrderSymbol() == Symbol() && OrderMagicNumber() == magicnumber) 
         {
           if(OrderType() == OP_BUY) 
             {
               money = money + (OrderClosePrice() - 
                       OrderOpenPrice()) * 10 * OrderLots();
             } 
           else 
             {
               money = money - (OrderClosePrice() - 
                       OrderOpenPrice()) * 10 * OrderLots();
             }
         }
     }
   total = OrdersTotal();   
   double com =  bl;
   int tickbuy = -1;
   double buyprofit = 0;
   double buyvolume = 0;
   int ticksell = -1;
   double sellprofit = 0;
   double sellvolume = 0;
   for(i = 0; i < total; i++) 
     {
       OrderSelect(i, SELECT_BY_POS, MODE_TRADES);
       if(OrderMagicNumber() == magicnumber) 
         {
           if(OrderType() == OP_BUY) 
             {
               if(OrderSymbol() == Symbol()) 
                 {
                   buyvolume = OrderLots();
                   money = money - 10 * buyvolume * OrderOpenPrice();
                   tickbuy = OrderTicket();
                   buyprofit = OrderProfit();
                 }
               com = com + 10 * OrderLots(); 
             } 
           else 
             {
               if(OrderSymbol() == Symbol()) 
                 {
                   sellvolume = OrderLots();
                   money = money + 10 * sellvolume * OrderOpenPrice();
                   ticksell = OrderTicket();
                   sellprofit = OrderProfit();
                 }
               com = com - 10 * OrderLots(); 
             }
         }
     }
   if(! IsTradeAllowed()) 
     {
       prevtime = Time[1];
       return(0);
     }
   closeby(ticksell, tickbuy);
   if(!IsTradeAllowed()) 
     {
       prevtime = Time[1];
       return(0);
     }
   double lots = 0;
   double price = 0;
   double dt = (money / Ask - com) * experts / (experts + 1);
   if(dt < 0) 
     {
       if(buyprofit < 0) 
           return(0);
       if(sellprofit > 0.01) 
           return(0);
       dt = (com - money / Bid) * experts / (experts + 1);
       if(dt < 1) 
         {
           closeby(tickbuy, ticksell);
           return(0);
         }
       if(dt > 10) 
           dt = 10;
       lots = MathFloor(dt) / 10;
       if(tickbuy >= 0) 
         {
           if(buyvolume > lots) 
             {
               OrderClose(tickbuy, lots, Bid, 3, Blue);
               Sleep(30000);
             } 
           else 
             {
               OrderClose(tickbuy, buyvolume, Bid, 3, Blue);
               tickbuy = -1;
               Sleep(30000);
             }
         } 
       else 
         {
           lots = getLots(lots);
           if(lots > 0) 
             {
               ticksell = OrderSend(Symbol(), OP_SELL, lots, Bid, 3, 
                          0, 0, "ArbitrageReverse", magicnumber, 0, Red);
               Sleep(30000);
             }
         }
     } 
   else 
     {
       if(sellprofit < 0) 
           return(0);
       if(buyprofit > 0.001) 
           return(0);
       if(dt < 1) 
         {
           closeby(ticksell, tickbuy);
           return(0);
         }
       if(dt > 10) 
           dt = 10;
       lots = MathFloor(dt) / 10;
       if(ticksell >= 0) 
         {
           if(sellvolume > lots) 
             {
               OrderClose(ticksell, lots, Ask, 3, Red);
               Sleep(30000);
             } 
           else 
             {
               OrderClose(ticksell, sellvolume, Ask, 3, Red);
               ticksell = -1;
               Sleep(30000);
             }
         } 
       else 
         {
           lots = getLots(lots);
           if(lots > 0) 
             {
               tickbuy = OrderSend(Symbol(), OP_BUY, lots, Ask, 3, 0, 
                         0, "ArbitrageReverse",  magicnumber, 0, Blue);
               Sleep(30000);
             }
         }
     }
//----
   if(!IsTradeAllowed()) 
     {
       prevtime = Time[1];
       return(0);
     }
   closeby(tickbuy, ticksell);
//----
   return(0);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void closeby(int sell, int buy) 
  {
   if(sell >= 0 && buy >= 0) 
     {
       OrderCloseBy(buy, sell, Green);
       Sleep(30000);
     }
  }
  
  int CloseEverything()
  {
   double myAsk;
   double myBid;
   int    myTkt;
   double myLot;
   int    myTyp;

   int i;
   bool result = false;
    
   for(i=OrdersTotal();i>=0;i--)
     {
      OrderSelect(i, SELECT_BY_POS);

      myAsk=MarketInfo(OrderSymbol(),MODE_ASK);            
      myBid=MarketInfo(OrderSymbol(),MODE_BID);            
      myTkt=OrderTicket();
      myLot=OrderLots();
      myTyp=OrderType();
            
      switch( myTyp )
        {
         //Close opened long positions
         case OP_BUY      :result = OrderClose(myTkt, myLot, myBid, Slippage, Red);
         CEBuy++;
         break;
      
         //Close opened short positions
         case OP_SELL     :result = OrderClose(myTkt, myLot, myAsk, Slippage, Red);
         CESell++;
         break;

         //Close pending orders
         case OP_BUYLIMIT :
         case OP_BUYSTOP  :
         case OP_SELLLIMIT:
         case OP_SELLSTOP :result = OrderDelete( OrderTicket() );
       }
    
      if(result == false)
        {
         Alert("Order " , myTkt , " failed to close. Error:" , GetLastError() );
         Print("Order " , myTkt , " failed to close. Error:" , GetLastError() );
         Sleep(3000);
        }  

      Sleep(1000);
      CEProc++;

     } //for
  
  } // closeeverything

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double getLots(double lt) 
  {
   double marginrequired = MarketInfo(Symbol(), MODE_MARGINREQUIRED);
   double freemargin = AccountFreeMargin();
   if(freemargin > (marginrequired * lt)) 
     {
       return(lt);
     } 
   double result = freemargin / marginrequired;
   result = (MathFloor(result * 10) / 10) / LotsDivider;
   return(result);
  }
//+------------------------------------------------------------------+


        
