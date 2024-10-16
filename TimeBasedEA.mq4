//+------------------------------------------------------------------+
//|                                                  TimeBasedEA.mq4 |
//|                      Copyright � 2008, MetaQuotes Software Corp. |
//|                                       http://www.metaquotes.net/ |
//+------------------------------------------------------------------+
//changed by:       "forex4capital@yahoo.ca"

// Time frame: M5 and higher

extern int     MagicNumber = 20080122;
extern int     OpenHour     = 8;        
extern int     OpenMinute   = 55;      
extern double  TakeProfit  = 10;
extern double  StopLoss    = 10;
extern double  Lots        = 0.1;
extern bool    OpenBuy     = true;
extern bool    OpenSell    = false;
extern int     NumBuys     = 1;
extern int     NumSells    = 1;
extern int     Slippage    = 3;

//+------------------------------------------------------------------+
//|                        S T A R T                                 |
//+------------------------------------------------------------------+
int start()
  {
   int cnt, ticket, total;
   //int ct;
//-------------------------------------+
   if(Bars<100)
     {
      Print("bars less than 100");
      return(0);  
     }
//-------------------------------------+
   if(TakeProfit<10)
     {
      Print("TakeProfit less than 10");
      return(0);  // check TakeProfit
     }
//-------------------------------------+
   //ct = Hour() * 100 + Minute();
   total=OrdersTotal();
   if(total<1) 
     {
      // no opened orders identified
      if(AccountFreeMargin()<(1*Lots))
        {
         Print("We have no money. Free Margin = ", AccountFreeMargin());
         return(0);  
        }
      // check for long position (BUY) possibility
      if (Hour()==OpenHour && Minute()>=OpenMinute && OpenBuy)
      //if(ct == StartHour && Close[1]>Open[1] && OpenBuy)
      //if(ct == StartHour && High[1]<Open[0] && OpenBuy)
        {
         for ( cnt = 0; cnt < NumBuys; cnt++)
         {
           ticket=OrderSend(Symbol(),OP_BUY,Lots,Ask,Slippage,Bid-StopLoss*Point,Ask+TakeProfit*Point,"",MagicNumber,0,Blue);
           if(ticket>0)
           {
            if(OrderSelect(ticket,SELECT_BY_TICKET,MODE_TRADES)) Print("BUY order opened : ",OrderOpenPrice());
           }
           else Print("Error opening BUY order : ",GetLastError()); 
         }
         return(0); 
        }
      // check for short position (SELL) possibility
      if (Hour()==OpenHour && Minute()>=OpenMinute && OpenSell)
      //if(ct == StartHour && Close[1]<Open[1] && OpenSell)
      //if(ct == StartHour && Low[1]>Open[0] && OpenSell)
        {
         for ( cnt = 0; cnt < NumSells; cnt++)
         {
           ticket=OrderSend(Symbol(),OP_SELL,Lots,Bid,Slippage,Ask+StopLoss*Point,Bid-TakeProfit*Point,"",MagicNumber,0,Red);
           if(ticket>0)
           {
            if(OrderSelect(ticket,SELECT_BY_TICKET,MODE_TRADES)) Print("SELL order opened : ",OrderOpenPrice());
           }
           else Print("Error opening SELL order : ",GetLastError());
         } 
         return(0); 
        }
     }
   return(0);
  }
// the end