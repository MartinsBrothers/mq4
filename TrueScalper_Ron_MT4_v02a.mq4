//+------------------------------------+
//| TRUE_SCALPER                       |
//+------------------------------------+
//
// This is the one used successfully by Jean-Fran�ois 
//
// Designed for M5 but I attached it to M15 and it worked fine.
//	long if EMA3>EMA7:::EMA3<EMA7<0 
// Code Adapted from  Scalper EAs to use EMA and RSI and multiple currencies


// variables declared here are GLOBAL in scope

#property copyright "Jacob Yego"
#property link      "http://www.PointForex.com/"
// MT4 conversion by Ron Thompson

// generic user input
extern double Lots=0.1;
extern int    TakeProfit=50;
extern int    StopLoss=15;
//extern int    TrailingStop=5;

extern int    Slippage=2;
extern int    ProfitMade=2;


//+------------------------------------+
//| Custom init (usually empty on EAs) |
//|------------------------------------|
// Called ONCE when EA is added to chart
int init()
  {
   return(0);
  }


//+------------------------------------+
//| Custom deinit(usually empty on EAs)|
//+------------------------------------+
// Called ONCE when EA is removed from chart
int deinit()
  {
   return(0);
  }


//+------------------------------------+
//| EA main code                       |
//+------------------------------------+
// Called EACH TICK and possibly every Minute
// in the case that there have been no ticks

int start()
  {

   double p=Point();
   int      cnt=0;
   int      OrdersPerSymbol=0;

   double  bull=0;
   double  bear=0;
   double  RSI=0;
   bool    RSIPOS=0;
   bool    RSINEG=0;
   double  lobar=0;
   double  hibar=0; 
   double  slBUY=0,tpBUY=0;
   double  slSEL=0,tpSEL=0;

   // Error checking
   if(AccountFreeMargin()<(1000*Lots))        {Print("-----NO MONEY"); return(0);}
   if(Bars<100)                               {Print("-----NO BARS "); return(0);}
   
   // 3-period moving average on Bar[1]
   bull=iMA(Symbol(),0,3,0,MODE_EMA,PRICE_CLOSE,1);
   // 7-period moving average on Bar[1]
   bear=iMA(Symbol(),0,7,0,MODE_EMA,PRICE_CLOSE,1);
   
   // 2-period moving average(???) on Bar[2]
   RSI=iRSI(Symbol(),0,2,PRICE_CLOSE,2);
   // Determine what polarity RSI is in
   if(RSI>50) RSIPOS=true;  else RSINEG=false;
   if(RSI<50) RSIPOS=false; else RSINEG=true;


   OrdersPerSymbol=0;
   for(cnt=OrdersTotal();cnt>=0;cnt--)
     {
      OrderSelect(cnt, SELECT_BY_POS, MODE_TRADES);
      if( OrderSymbol()==Symbol() )
        {
         OrdersPerSymbol++;
        }
     }

   // calculate TakeProfit and StopLoss for 
   //Ask(buy, long)
   slBUY=Ask-(StopLoss*p);
   tpBUY=Bid+(TakeProfit*p);
   //Bid (sell, short)
   slSEL=Bid+(StopLoss*p);
   tpSEL=Ask-(TakeProfit*p);

   // so we can eventually do trailing stop
   //if (TakeProfit<=0) {tpBUY=0; tpSEL=0;}           
   //if (StopLoss<=0)   {slBUY=0; slSEL=0;}           

   // place new orders based on direction
   // only of no orders open
   if(OrdersPerSymbol<1)
     {
      if(bull>bear && RSINEG)
		  {
         OrderSend(Symbol(),OP_BUY,Lots,Ask,Slippage,slBUY,tpBUY,"ZJMQCIDFG",11123,0,White);
         return(0);
        }
        
      // not sure if this should be POS or NEG
      if(bull<bear && RSIPOS)
        {
         OrderSend(Symbol(),OP_SELL,Lots,Bid,Slippage,slSEL,tpSEL,"ZJMQCIDFG",11321,0,Red);
         return(0);
        }
     } //if
	
   // CLOSE order if profit target made
   for(cnt=0;cnt<OrdersTotal();cnt++)
     {
      OrderSelect(cnt, SELECT_BY_POS, MODE_TRADES);
      if( OrderSymbol()==Symbol() )
        {
         if(OrderType()==OP_BUY)
           {
            // did we make our desired BUY profit?
            if(  Bid-OrderOpenPrice() > ProfitMade*p  )
              {
               OrderClose(OrderTicket(),Lots,Bid,0,White);
               return(0);
              }
           } // if BUY

         if(OrderType()==OP_SELL)
           {
            // did we make our desired SELL profit?
            if(  OrderOpenPrice()-Ask > (ProfitMade*p)   )
              {
               OrderClose(OrderTicket(),Lots,Ask,0,Red);
               return(0);
              }
           } //if SELL
           
        } // if(OrderSymbol)
        
     } // for

   return(0);
  } // start()




