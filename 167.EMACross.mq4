//+------------------------------------------------------------------+
//|                                                 167.EMACross.mq4 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
//|                                                        EMACross.mq4 |
//|                                       Copyright � 2006, Akuma99. |
//|                                      http://akuma99.blogspot.com |
//+------------------------------------------------------------------+
#property copyright "Copyright � 2006, Akuma99."
#property link      "http://www.beginnertrader.com"

extern int trailingStop=40;
extern int stopLoss=40;
extern int maxLots=1;
extern int emaFast=15;
extern int emaSlow=40;
extern double lotSize=1;

int deinit() {

   return(0);
   
}

int start() {

   int total=OrdersTotal(),i;
   
   double emaS = iMA(NULL,0,emaSlow,0,MODE_EMA,PRICE_CLOSE,1);
   double emaF = iMA(NULL,0,emaFast,0,MODE_EMA,PRICE_CLOSE,1);
   double emaS2 = iMA(NULL,0,emaSlow,0,MODE_EMA,PRICE_CLOSE,2);
   double emaF2 = iMA(NULL,0,emaFast,0,MODE_EMA,PRICE_CLOSE,2);
   
   double cloud1 = iMA(NULL,0,200,0,MODE_SMA,PRICE_CLOSE,1);
   double cloud2 = iMA(NULL,0,100,0,MODE_SMA,PRICE_CLOSE,1);
   
   for (i=0;i<total;i++) {

      OrderSelect(i,SELECT_BY_POS,MODE_TRADES);
     
      if (OrderSymbol()==Symbol() && OrderType()==OP_BUY && Bid-trailingStop*Point > OrderStopLoss()){
         
         if (emaF > emaS) {
            if (Bid > OrderOpenPrice()+trailingStop*Point) {
               OrderModify(OrderTicket(),OrderOpenPrice(),Bid-trailingStop*Point,0,0,White);
            }
         } else {
            OrderModify(OrderTicket(),OrderOpenPrice(),Bid-1*Point,0,0,White);
         }
         
      }
      
      if (OrderSymbol()==Symbol() && OrderType()==OP_SELL && Ask-trailingStop*Point < OrderStopLoss()){   
         
         if (emaF < emaS) {
            if (Ask < OrderOpenPrice()-trailingStop*Point) {
               OrderModify(OrderTicket(),OrderOpenPrice(),Ask+trailingStop*Point,0,0,White);
            }
         } else {
            OrderModify(OrderTicket(),OrderOpenPrice(),Ask+1*Point,0,0,White);
         }
         
      }
   
   }
   
   if (total < maxLots) {
      
         if (emaF < emaS && emaF2 >= emaS2 && Close[0] < cloud1 && Close[0] <) {
            placeShortTrade();
         } else if (emaF > emaS && emaF2 <= emaS2) {
            placeLongTrade();
         }

   
   }
   
   return(0);
   
}


void placeLongTrade () {

   double ticket;

   ticket=OrderSend(Symbol(),OP_BUY,lotSize,Ask,3,Ask-stopLoss*Point,0,"ema cross trade",16384,0,Blue);
    
   if(ticket>0) {
      if(OrderSelect(ticket,SELECT_BY_TICKET,MODE_TRADES)) Print("BUY order opened : ",OrderOpenPrice());
   } else {
      Print("Error opening BUY order : ",GetLastError()); 
      return(0); 
   }

}

void placeShortTrade () {
   
   double ticket;

   ticket=OrderSend(Symbol(),OP_SELL,lotSize,Bid,3,Bid+stopLoss*Point,0,"ema cross trade",16384,0,Red);
  
   if(ticket>0) {
      if(OrderSelect(ticket,SELECT_BY_TICKET,MODE_TRADES)) Print("SELL order opened : ",OrderOpenPrice());
   } else {
      Print("Error opening SELL order : ",GetLastError());  
      return(0);   
   }

}
        
