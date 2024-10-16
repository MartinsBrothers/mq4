//+------------------------------------------------------------------+
//|                                         48.automated trading.mq4 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                                                   10points 3.mq4 |
//|                              Copyright � 2005, Alejandro Galindo |
//|                                              http://elCactus.com |
//+------------------------------------------------------------------+
#property copyright "Copyright � 2005, Alejandro Galindo"
#property link      "http://elCactus.com"
//                  "some modifications by Ron Thompson"
//                  "http://www.lightpatch.com/forex/"

extern double TakeProfit = 60;
extern double Lots = 0.01;
extern double InitialStop = 0;
extern double TrailingStop = 0.5;

extern int MaxTrades=8;
extern int Pips=5;
extern int SecureProfit=4;
extern int AccountProtection=1;
extern int OrderstoProtect=3;
extern int ReverseCondition=0;

extern bool mm=false;
extern int risk=12;

int  slippage=5;


int  OpenOrders=0, cnt=0;
double sl=0, tp=0;
double BuyPrice=0, SellPrice=0;
double lotsi=0, mylotsi=0;
int mode=0, myOrderType=0;
bool ContinueOpening=True;
double LastPrice=0;
int  PreviousOpenOrders=0;
double Profit=0;
int LastTicket=0, LastType=0;
double LastClosePrice=0, LastLots=0;
double Pivot=0;
double PipValue=0;
string text="", text2="";

//RT Trade tracking management
int      MagicNumber  = 200605141743;
string   TradeComment = "10.3_v00_";



//+----------------+
//| initialization |
//+----------------+
int init()
  {
  }



//+-------------------+
//| de-initialization |
//+-------------------+
int deinit()
  {
  }



//+-------+
//| start |
//+-------+
int start()
  {

   // preset the lot size
   lotsi=Lots; 

   // Calculate lot size for a STANDARD account
   //if(mm) lotsi=MathCeil(AccountBalance()*risk/10000); 
   //if (lotsi>100){ lotsi=100; }
   
   // Calculate lot size for a mini/micro account
   if(mm) lotsi=MathCeil(AccountBalance()*risk/10000)/10; 
   if (lotsi>50){ lotsi=50; }

   // count orders belonging to this EA
   OpenOrders=0;
   for(cnt=OrdersTotal();cnt>=0;cnt--)
   {
     OrderSelect(cnt, SELECT_BY_POS, MODE_TRADES);
     if( OrderSymbol()==Symbol() && OrderMagicNumber()==MagicNumber)
	  {				
	  	  OpenOrders++;
	  }
   }     
   
   // what does this do???????????????
   if (PipValue==0) { PipValue=5; }
   

   // does this mean...
   // close all the orders if something does TP or SL???????????????

   if (PreviousOpenOrders>OpenOrders) 
   {	  
	  for(cnt=OrdersTotal();cnt>=0;cnt--)
	  {
	     OrderSelect(cnt, SELECT_BY_POS, MODE_TRADES);
	  	  mode=OrderType();
        if( OrderSymbol()==Symbol() && OrderMagicNumber()==MagicNumber)
		  {
			if (mode==OP_BUY) { OrderClose(OrderTicket(),OrderLots(),OrderClosePrice(),slippage,Blue); }
			if (mode==OP_SELL) { OrderClose(OrderTicket(),OrderLots(),OrderClosePrice(),slippage,Red); }
			return(0);
		 }
	  }
   }

   PreviousOpenOrders=OpenOrders;
   if (OpenOrders>=MaxTrades) 
   {
	  ContinueOpening=False;
   } else {
	  ContinueOpening=True;
   }

   if (LastPrice==0) 
   {
     //RT for some reason, this one has to start
     //   at zero and go to OrdersTotal
     //   otherwise orders do NOT close at all
	  for(cnt=0;cnt<OrdersTotal();cnt++)
	  {	
	    OrderSelect(cnt, SELECT_BY_POS, MODE_TRADES);
		 mode=OrderType();	
       if( OrderSymbol()==Symbol() && OrderMagicNumber()==MagicNumber)
		 {
			LastPrice=OrderOpenPrice();
			if (mode==OP_BUY) { myOrderType=2; }
			if (mode==OP_SELL) { myOrderType=1;	}
		 }
	  }
   }

   if (OpenOrders<1) 
   {
	  myOrderType=3;
	  if (iMACD(NULL,0,14,26,9,PRICE_CLOSE,MODE_MAIN,0)>iMACD(NULL,0,14,26,9,PRICE_CLOSE,MODE_MAIN,1)) { myOrderType=2; }
	  if (iMACD(NULL,0,14,26,9,PRICE_CLOSE,MODE_MAIN,0)<iMACD(NULL,0,14,26,9,PRICE_CLOSE,MODE_MAIN,1)) { myOrderType=1; }

	  if (ReverseCondition==1)
	  {
	  	  if (myOrderType==1) { myOrderType=2; }
		  else { if (myOrderType==2) { myOrderType=1; } }
	  }
   }

   // if we have opened positions we take care of them
   for(cnt=OrdersTotal();cnt>=0;cnt--)
   {
     OrderSelect(cnt, SELECT_BY_POS, MODE_TRADES);
     if( OrderSymbol()==Symbol() && OrderMagicNumber()==MagicNumber)
	  {	
	  	  if (OrderType()==OP_SELL) 
	  	  {			
	  	  	  if (TrailingStop>0) 
			  {
				  if (OrderOpenPrice()-Ask>=(TrailingStop+Pips)*Point) 
				  {						
					 if (OrderStopLoss()>(Ask+Point*TrailingStop))
					 {			
					    OrderModify(OrderTicket(),OrderOpenPrice(),Ask+Point*TrailingStop,OrderClosePrice()-TakeProfit*Point-TrailingStop*Point,800,Purple);
	  					 return(0);	  					
	  				 }
	  			  }
			  }
	  	  }
   
	  	  if (OrderType()==OP_BUY)
	  	  {
	  		 if (TrailingStop>0) 
	  		 {
			   if (Bid-OrderOpenPrice()>=(TrailingStop+Pips)*Point) 
				{
					if (OrderStopLoss()<(Bid-Point*TrailingStop)) 
					{					   
					   OrderModify(OrderTicket(),OrderOpenPrice(),Bid-Point*TrailingStop,OrderClosePrice()+TakeProfit*Point+TrailingStop*Point,800,Yellow);
                  return(0);
					}
  				}
			 }
	  	  }
   	}
   }
   
   Profit=0;
   LastTicket=0;
   LastType=0;
	LastClosePrice=0;
	LastLots=0;	
   for(cnt=OrdersTotal();cnt>=0;cnt--)
	{
	  OrderSelect(cnt, SELECT_BY_POS, MODE_TRADES);
     if( OrderSymbol()==Symbol() && OrderMagicNumber()==MagicNumber)
	  {			
	  	   LastTicket=OrderTicket();
			if (OrderType()==OP_BUY) { LastType=OP_BUY; }
			if (OrderType()==OP_SELL) { LastType=OP_SELL; }
			LastClosePrice=OrderClosePrice();
			LastLots=OrderLots();
			if (LastType==OP_BUY) 
			{
				if (OrderClosePrice()<OrderOpenPrice()) 
					{ Profit=Profit-(OrderOpenPrice()-OrderClosePrice())*OrderLots()/Point; }
				if (OrderClosePrice()>OrderOpenPrice()) 
					{ Profit=Profit+(OrderClosePrice()-OrderOpenPrice())*OrderLots()/Point; }
			}
			if (LastType==OP_SELL) 
			{
				if (OrderClosePrice()>OrderOpenPrice()) 
					{ Profit=Profit-(OrderClosePrice()-OrderOpenPrice())*OrderLots()/Point; }
				if (OrderClosePrice()<OrderOpenPrice()) 
					{ Profit=Profit+(OrderOpenPrice()-OrderClosePrice())*OrderLots()/Point; }
			}
	  }
   }
	
	Profit=Profit*PipValue;
	text2="Profit: $"+DoubleToStr(Profit,2)+" +/-";
   if (OpenOrders>=(MaxTrades-OrderstoProtect) && AccountProtection==1) 
   {	    
	     if (Profit>=SecureProfit) 
	     {
	        OrderClose(LastTicket,LastLots,LastClosePrice,slippage,Yellow);		 
	        ContinueOpening=False;
	        return(0);
	     }
   }

      if (!IsTesting()) 
      {
	     if (myOrderType==3) { text="No conditions to open trades"; }
	     else { text="                         "; }
	     Comment("LastPrice=",LastPrice," Previous open orders=",PreviousOpenOrders,"\nContinue opening=",ContinueOpening," OrderType=",myOrderType,"\n",text2,"\nLots=",lotsi,"\n",text);
      }

      if (myOrderType==1 && ContinueOpening) 
      {	
	     if ((Bid-LastPrice)>=Pips*Point || OpenOrders<1) 
	     {		
		    SellPrice=Bid;				
		    LastPrice=0;
		    if (TakeProfit==0) { tp=0; }
		    else { tp=SellPrice-TakeProfit*Point; }	
		    if (InitialStop==0) { sl=0; }
		    else { sl=SellPrice+InitialStop*Point;  }
		    if (OpenOrders!=0) 
		    {
			      mylotsi=lotsi;			
			      for(cnt=1;cnt<=OpenOrders;cnt++)
			      {
				     if (MaxTrades>12) { mylotsi=NormalizeDouble(mylotsi*1.5,2); }
				     else { mylotsi=NormalizeDouble(mylotsi*2,2); }
			      }
		    } else { mylotsi=lotsi; }
		    if (mylotsi>100) { mylotsi=100; }
	         OrderSend(Symbol(),OP_SELL,mylotsi,SellPrice,slippage,sl,tp,TradeComment,MagicNumber,0,Red);		    		    
		    return(0);
	     }
      }
      
      if (myOrderType==2 && ContinueOpening) 
      {
	     if ((LastPrice-Ask)>=Pips*Point || OpenOrders<1) 
	     {		
		    BuyPrice=Ask;
		    LastPrice=0;
		    if (TakeProfit==0) { tp=0; }
		    else { tp=BuyPrice+TakeProfit*Point; }	
		    if (InitialStop==0)  { sl=0; }
		    else { sl=BuyPrice-InitialStop*Point; }
		    if (OpenOrders!=0) {
			   mylotsi=lotsi;			
			   for(cnt=1;cnt<=OpenOrders;cnt++)
			   {
				  if (MaxTrades>12) { mylotsi=NormalizeDouble(mylotsi*1.5,2); }
				  else { mylotsi=NormalizeDouble(mylotsi*2,2); }
			   }
		    } else { mylotsi=lotsi; }
		    if (mylotsi>100) { mylotsi=100; }
		    OrderSend(Symbol(),OP_BUY,mylotsi,BuyPrice,slippage,sl,tp,TradeComment,MagicNumber,0,Blue);		    
		    return(0);
	     }
  
     }   
  
  }//start


        
