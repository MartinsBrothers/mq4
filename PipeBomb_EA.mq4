
//+------------------------------------------------------------------+
//|                                                                  |
//|             PipeBomb.mq4 - Ver 1.0 @ 02/09/2007 by Bluto         |
//|                                                                  |
//+------------------------------------------------------------------+


#property copyright "Bluto"
#property link      "None"

extern double LotSize=5;
extern int    Slippage=3;
extern double StopLoss=20;
extern double TakeProfit=600;
extern double RiskPercent=2.0;
extern bool   UseMoneyMgmt=true;

int           MagicNumber=0;
int           ticket;
int           BuyOrders=0;
int           SellOrders=0;
int           i;

bool          Buy_A_Bomb=false, Sell_A_Bomb=false;
double        StepMA_Up_1=0;
double        StepMA_Up_2=0;
double        StepMA_Dn_1=0;
double        StepMA_Dn_2=0;
double        MM_MinLotSize=0;
double        MM_MaxLotSize=0;
double        MM_LotStep=0;
double        MM_Decimals=0;
double        MM_OrderLotSize=0;
int           MM_AcctLeverage=0;
int           MM_CurrencyLotSize=0;


int init()
{
   if (Symbol()=="AUDCADm" || Symbol()=="AUDCAD") {MagicNumber=200001;}
   if (Symbol()=="AUDJPYm" || Symbol()=="AUDJPY") {MagicNumber=200002;}
   if (Symbol()=="AUDNZDm" || Symbol()=="AUDNZD") {MagicNumber=200003;}
   if (Symbol()=="AUDUSDm" || Symbol()=="AUDUSD") {MagicNumber=200004;}
   if (Symbol()=="CHFJPYm" || Symbol()=="CHFJPY") {MagicNumber=200005;}
   if (Symbol()=="EURAUDm" || Symbol()=="EURAUD") {MagicNumber=200006;}
   if (Symbol()=="EURCADm" || Symbol()=="EURCAD") {MagicNumber=200007;}
   if (Symbol()=="EURCHFm" || Symbol()=="EURCHF") {MagicNumber=200008;}
   if (Symbol()=="EURGBPm" || Symbol()=="EURGBP") {MagicNumber=200009;}
   if (Symbol()=="EURJPYm" || Symbol()=="EURJPY") {MagicNumber=200010;}
   if (Symbol()=="EURUSDm" || Symbol()=="EURUSD") {MagicNumber=200011;}
   if (Symbol()=="GBPCHFm" || Symbol()=="GBPCHF") {MagicNumber=200012;}   
   if (Symbol()=="GBPJPYm" || Symbol()=="GBPJPY") {MagicNumber=200013;}
   if (Symbol()=="GBPUSDm" || Symbol()=="GBPUSD") {MagicNumber=200014;}
   if (Symbol()=="NZDJPYm" || Symbol()=="NZDJPY") {MagicNumber=200015;}
   if (Symbol()=="NZDUSDm" || Symbol()=="NZDUSD") {MagicNumber=200016;}
   if (Symbol()=="USDCHFm" || Symbol()=="USDCHF") {MagicNumber=200017;}
   if (Symbol()=="USDJPYm" || Symbol()=="USDJPY") {MagicNumber=200018;}
   if (Symbol()=="USDCADm" || Symbol()=="USDCAD") {MagicNumber=200019;}
   if (MagicNumber==0) {MagicNumber = 200999;}  
 
 return(0);
}

int deinit()
{
 return(0);
}

int start()
{ 

//----- Money Management & Lot Sizing Stuff.

  MM_AcctLeverage = AccountLeverage();
  MM_MinLotSize = MarketInfo(Symbol(),MODE_MINLOT);
  MM_MaxLotSize = MarketInfo(Symbol(),MODE_MAXLOT);
  MM_LotStep = MarketInfo(Symbol(),MODE_LOTSTEP);
  MM_CurrencyLotSize = MarketInfo(Symbol(),MODE_LOTSIZE);

  if(MM_LotStep == 0.01) {MM_Decimals = 2;}
  if(MM_LotStep == 0.1) {MM_Decimals = 1;}

  if (UseMoneyMgmt == true)
   {
    MM_OrderLotSize = AccountEquity() * (RiskPercent * 0.01) / (MM_CurrencyLotSize / MM_AcctLeverage);
    MM_OrderLotSize = StrToDouble(DoubleToStr(MM_OrderLotSize,MM_Decimals));
   }
    else
   {
    MM_OrderLotSize = LotSize;
   }

  if (MM_OrderLotSize < MM_MinLotSize) {MM_OrderLotSize = MM_MinLotSize;}
  if (MM_OrderLotSize > MM_MaxLotSize) {MM_OrderLotSize = MM_MaxLotSize;}

//----- Check last two bars of StepMa indicator for crossover signals.
  
  double StepMA_Up_1 = iCustom(NULL,Period(),"N_StepMA_1_Email",7,1,0,500,false,0,1);
  double StepMA_Up_2 = iCustom(NULL,Period(),"N_StepMA_1_Email",7,1,0,500,false,0,2);
  double StepMA_Dn_1 = iCustom(NULL,Period(),"N_StepMA_1_Email",7,1,0,500,false,1,1);
  double StepMA_Dn_2 = iCustom(NULL,Period(),"N_StepMA_1_Email",7,1,0,500,false,1,2);
   
  if(StepMA_Up_1 < StepMA_Dn_1 && StepMA_Up_2 > StepMA_Dn_2) {Sell_A_Bomb=true;Buy_A_Bomb=false;}
  if(StepMA_Up_1 > StepMA_Dn_1 && StepMA_Up_2 < StepMA_Dn_2) {Sell_A_Bomb=false;Buy_A_Bomb=true;}

//----- Count number of existing open buy & sell orders; update trailing stops.
  
  BuyOrders=0;
  SellOrders=0; 
  
  for(i=OrdersTotal();i >= 0;i--) 
   {
    OrderSelect(i,SELECT_BY_POS,MODE_TRADES);
    if (OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber) 
     {
      if (OrderType() == OP_BUY && StopLoss > 0)
       {
        BuyOrders++;
        if (StopLoss > 0 && Bid - (StopLoss * Point) > OrderStopLoss())
         {
          OrderModify(OrderTicket(),OrderOpenPrice(),NormalizeDouble(Bid - (StopLoss * Point),Digits),OrderTakeProfit(),0);
         }
       }   
      if (OrderType() == OP_SELL)
       {
        SellOrders++;
        if (StopLoss > 0 && Ask + (StopLoss * Point) < OrderStopLoss())
         {
          OrderModify(OrderTicket(),OrderOpenPrice(),NormalizeDouble(Ask + (StopLoss * Point),Digits),OrderTakeProfit(),0);
         }
       }  
     }
   } 

//----- If we have a new buy signal, close existing sell orders; if we have a new sell signal, close existing buy orders; reset order counters.
//----- Next, create new buy or sell order.
         
  if (Buy_A_Bomb==true) 
   {
    if(SellOrders > 0)
     {
      CloseShorts(MagicNumber);
      SellOrders = 0; 
     }
    if(BuyOrders == 0)
     {    
      ticket = OpenPendingOrder(OP_BUY,MM_OrderLotSize,Ask,Slippage,Bid,StopLoss,TakeProfit,"Pipe Bomb",MagicNumber,0,Lime);
      if(ticket<0)
       {
        Print("OrderSend failed with error #",GetLastError());
        return(0);
       }
      else
       {
        BuyOrders++;
       }    
     }
   }
   
  if (Sell_A_Bomb==true) 
   {
    if(BuyOrders > 0)
     {
      CloseLongs(MagicNumber);
      BuyOrders = 0;
     }  
    if (SellOrders == 0) 
     { 
      ticket = OpenPendingOrder(OP_SELL,MM_OrderLotSize,Bid,Slippage,Ask,StopLoss,TakeProfit,"Pipe Bomb",MagicNumber,0,HotPink);
      if(ticket<0)
       {
        Print("OrderSend failed with error #",GetLastError());
        return(0);
       }
      else
       {
        SellOrders++;
       }    
     }
   }
   
  return(0);
}

//----- Order Processing Functions

void CloseLongs(int MagicNumber)
{
 int trade;
 for(trade=OrdersTotal()-1;trade>=0;trade--)
 {
  if(OrderSelect(trade,SELECT_BY_POS,MODE_TRADES)==false)
   continue;

  if(OrderSymbol()!=Symbol()||OrderMagicNumber()!=MagicNumber)
   continue;
   
  if(OrderSymbol()==Symbol()&&OrderMagicNumber()==MagicNumber)
  if(OrderType()==OP_BUY)
   OrderClose(OrderTicket(),OrderLots(),Bid,Slippage,Blue);
 }//for
}

void CloseShorts(int MagicNumber)
{
 int trade;
 for(trade=OrdersTotal()-1;trade>=0;trade--)
 {
  if(OrderSelect(trade,SELECT_BY_POS,MODE_TRADES)==false)
   continue;

  if(OrderSymbol()!=Symbol()||OrderMagicNumber()!=MagicNumber)
   continue;
   
  if(OrderSymbol()==Symbol()&&OrderMagicNumber()==MagicNumber)
  if(OrderType()==OP_SELL)
   OrderClose(OrderTicket(),OrderLots(),Ask,Slippage,Red);
 }//for
}

int OpenPendingOrder(int pType,double pLots,double pLevel,int sp, double pr, int sl, int tp,string pComment,int pMagic,datetime pExpiration,color pColor)
{
  int ticket=0;
  int err=0;
  int c = 0;
  int NumberOfTries = 10;
  switch (pType)
  {
      case OP_BUY:
         for(c = 0 ; c < NumberOfTries ; c++)
         {  
            RefreshRates();
            ticket=OrderSend(Symbol(),OP_BUY,pLots,Ask,sp,StopLong(Bid,sl),TakeLong(Bid,tp),pComment,pMagic,pExpiration,pColor);
            if (ticket > 0) break;
            err=GetLastError();
            if(err==0)
            { 
               break;
            }
            else
            {
               if(err==4 || err==137 ||err==146 || err==136) //Busy errors
               {
                  Sleep(5000);
                  continue;
               }
               else //normal error
               {
                  Print("Error Code= ", err);
                  break;
               }  
            }
         } 
         break;
      case OP_SELL:
         for(c = 0 ; c < NumberOfTries ; c++)
         {
            RefreshRates();
            ticket=OrderSend(Symbol(),OP_SELL,pLots,Bid,sp,StopShort(Ask,sl),TakeShort(Ask,tp),pComment,pMagic,pExpiration,pColor);
            if (ticket > 0) break;
            err=GetLastError();
            if(err==0)
            { 
               break;
            }
            else
            {
               if(err==4 || err==137 ||err==146 || err==136) //Busy errors
               {
                  Sleep(5000);
                  continue;
               }
               else //normal error
               {
                  Print("Error Code= ", err);
                  break;
               }  
            }
         } 
         break;
  } 
  
  return(ticket);
}  

double StopLong(double price,int stop)
{
 if(stop==0)
  return(0);
 else
  return(price-(stop*Point));
}

double StopShort(double price,int stop)
{
 if(stop==0)
  return(0);
 else
  return(price+(stop*Point));
}

double TakeLong(double price,int take)
{
 if(take==0)
  return(0);
 else
  return(price+(take*Point));
}

double TakeShort(double price,int take)
{
 if(take==0)
  return(0);
 else
  return(price-(take*Point));
}


