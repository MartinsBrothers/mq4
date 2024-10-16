//+------------------------------------------------------------------+
//|                                           73.Breakout Expert.mq4 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
/*

*********************************************************************
          
                       Akuma99 Sign Posts
                   Copyright � 2006  Akuma99
                  http://akuma99.blogspot.com    

       For help on this indicator, tutorials and information 
               visit http://akuma99.blogspot.com/
                  
*********************************************************************

*/

#property link        "http://akuma99.blogspot.com"
#property copyright   "� 2006 Akuma99 (http://akuma99.blogspot.com)"

extern double offset = -1;
extern int spread = 5;
extern int atrPeriod = 0;
extern int trailingStop = 50;

extern int sl = 50;
extern int lockProfit = 20;

extern bool protection=false;
extern bool tradeAllDay=false;

double hStore;
double lStore;

extern double Lots = 0.1;
double Slippage = 3;

int maxLots = 1;

int init() {
   
   return(0);

}

int start() {
   
   int total, i, err;
   double ts, diff;
   string setup = "Breakout_" + Symbol();
   
   total=OrdersTotal();
   
   /*for (i=0;i<OrdersTotal();i++){
   
      OrderSelect(i,SELECT_BY_POS,MODE_TRADES);
      
      if(OrderSymbol()==Symbol() && OrderType()==OP_BUY && protection==true){
         if(High[0]-OrderOpenPrice()>=trailingStop*Point && OrderStopLoss()!=OrderOpenPrice() && OrderStopLoss()-OrderOpenPrice() != lockProfit){
            OrderModify(OrderTicket(),OrderOpenPrice(),OrderOpenPrice()+lockProfit*Point,OrderTakeProfit(),0,White);
 
         }   
      }  
       
      if(OrderSymbol()==Symbol() && OrderType()==OP_SELL && protection==true){
         if(OrderOpenPrice()-Low[0]>=trailingStop*Point && OrderStopLoss()!=OrderOpenPrice() && OrderOpenPrice()-OrderStopLoss() != lockProfit){
            OrderModify(OrderTicket(),OrderOpenPrice(),OrderOpenPrice()-lockProfit*Point,OrderTakeProfit(),0,White);
         }
      }
   
   }*/
   
   if(total < maxLots) {
      
      // no opened orders identified
      if(AccountFreeMargin()<(1000*Lots)) {
         Print("We have no money. Free Margin = ", AccountFreeMargin());
         return(0);  
      }
        
      int   j;
      
      if (TimeHour(Time[0]) == 8+offset) {
      
         double atr = iATR(NULL, 0, atrPeriod, 0);
         double h=High[1], l=Low[1];
      
         for (j=8; j>=0; j--) {
      
            if (High[j] > h) {
               h = High[j];
            }
            
            if (Low[j] < l) {
               l = Low[j];
            }
      
         }
         
         hStore = h+(spread*Point)+(atr/2);
         lStore = l-(atr/2);
      
      }
      
         if (tradeAllDay == false) {
            if (Ask >= hStore && Open[0] < hStore && TimeHour(Time[0]) > 8 && TimeHour(Time[0]) < 16) {
               placeLongTrade();
            } else if (Bid <= lStore && Open[0] > lStore && TimeHour(Time[0]) > 8 && TimeHour(Time[0]) < 16) {
               placeShortTrade();
            }
         } else if (tradeAllDay == true) {
            if (Ask >= hStore && Open[0] < hStore) {
               placeLongTrade();
            } else if (Bid <= lStore && Open[0] > lStore) {
               placeShortTrade();
            }
         }
         
      }
      
   return(0);

}

void placeLongTrade () {

   double ticket;

   ticket=OrderSend(Symbol(),OP_BUY,Lots,Ask,3,Ask-(40*Point),Ask+50*Point,"macd sample",16384,0,Blue);
    
   if(ticket>0) {
      if(OrderSelect(ticket,SELECT_BY_TICKET,MODE_TRADES)) Print("BUY order opened : ",OrderOpenPrice());
   } else {
      Print("Error opening BUY order : ",GetLastError()); 
      return(0); 
   }

}

void placeShortTrade () {
   
   double ticket;

   ticket=OrderSend(Symbol(),OP_SELL,Lots,Bid,3,Bid+(40*Point),Bid-50*Point,"macd sample",16384,0,Red);
  
   if(ticket>0) {
      if(OrderSelect(ticket,SELECT_BY_TICKET,MODE_TRADES)) Print("SELL order opened : ",OrderOpenPrice());
   } else {
      Print("Error opening SELL order : ",GetLastError());  
      return(0);   
   }

}
        
