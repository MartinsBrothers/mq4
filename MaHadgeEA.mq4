#property copyright   "LangitFx"
#property version     "1.00"
#property link        "https://www.facebook.com/langit.fx.5"

#property strict
#include      <stdlib.mqh>
#include      <stderror.mqh>
//+------------------------------------------------------------------+
enum model{Manual};

model   ModeOrder       = Manual;

//+------------------------------------------------------------------+
extern string  TradeSetting    = " ---------------------------------- ";
extern string  EA_Name         = "Ma HadgeEA";
bool    ContinueTrade   = true;
extern string  CommentTrade    = "Ma HadgeEA";
extern int     MagicNumber     = 20200917;
extern string Signal_          = " ---------------- Signal ---------------- ";
extern bool   TradeBuy         = true;
extern bool   TradeSell        = true;
extern bool   UseMA            = true;
extern int     Period_MA_1_    = 50;
extern int     Shift_MA_1_     = 0;
extern ENUM_MA_METHOD Mode_MA_1_       = MODE_EMA;
extern ENUM_APPLIED_PRICE Price_MA_1_  = PRICE_CLOSE;
extern string Parameter          = " ---------------- Parameter ---------------- ";
extern double  Lots            = 0.01; 
extern bool    HiddenTP        = true;
extern int     TakeProfit      = 30;
extern double  Multiplier      = 2;
extern int     PipRange        = 20;
extern bool    UseTrail        = false;
extern int     TrailingStop    = 20;
extern int     TrailingStep    = 10;
bool    Use_TpMoney     = false;
double  TpMoney         = 10;
bool    Use_SLMoney     = false;
double  SL_Money        = 10;
string TimeFilter       = " ---------------- TimeFilter ---------------- ";
bool   UseTimeFilter    = false;
string StartTime_        = "01:00";
string StartTime1       = "00:01";
string EndTime1         = "23:59";
string EndTime_          = "20:00";
int     StopLoss        = 0;




//------------------------------------------------------------------------------------------------------------
//+------------------------------------------------------------------+
//| DO NOT CHANGE THIS SETTING                                       |
//+------------------------------------------------------------------+
static double  tppercent;
int turun        = 10;
int Warna;
int     POModifyMinute  = 999999;
int     MaxOrderLocking = 9999;
bool    OFF_After_Close = false;
bool    Debug           = false;
string         namelineH        = "BuyStop";
string         namelineL        = "SellStop";
string  TimeStart      = "00:00";
string  TimeStop       = "23:59";
int     MagicMaster     = 12345;
double price;
int range; 
double lotbuy,lotsell;
int            Corner          = 1;              
int            PT              = 1,
               DIGIT,SlipPage;
double         POINT;  
int            fot;
double         lpb,lps,ll;
string         lc;
double         openbuylots, openselllots;
static int     first_time;
double         tpline_buy,slline_buy,tpline_sell,slline_sell;
static double  start_trailing_price;
static int     status_BEP;
static double  price_BEP;
static int     status_trailing;
bool mabuy;
bool masel;  
bool buy1;
bool sell1;    
bool CloseAllPair;
double targetmoney;
//==============================================================||
string name_tpbuy         = "TP BUY";
string name_slbuy         = "SL BUY";
string name_tp_sell       = "TP SELL";
string name_sl_sell       = "SL SELL";
string name_BEP           = "BEP";
string name_buy           = "BUY";
string name_sell          = "SELL";
string name_closeall      = "CLOSE ALL";
datetime      StartTime;
color linetpbuy = clrNONE;
color linetpsel = clrNONE;
bool isTime;
bool isTime1;
int            lastordertype; 
//==============================================================||
//+------------------------------------------------------------------+
//| expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
{  StartTime    = TimeCurrent();
   SlipPage = 4;
   AutoDigit(); 
   ChartSetInteger(0,CHART_SHOW_GRID,0,FALSE);      
   ChartSetInteger(0,CHART_SHOW_PERIOD_SEP,0,FALSE);
   ChartSetInteger(0,CHART_MODE,TRUE);
   ChartSetInteger(0,CHART_COLOR_CHART_UP,clrLime); 
   ChartSetInteger(0,CHART_COLOR_CANDLE_BULL,clrBlack);    
   ChartSetInteger(0,CHART_COLOR_CHART_DOWN,clrLime); 
   ChartSetInteger(0,CHART_COLOR_CANDLE_BEAR,clrWhite);      
   return(0);
}
//+------------------------------------------------------------------+
//| expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
{  
   del_button();
   DelObject();
   Comment("");
	return;
}
//+------------------------------------------------------------------+
//| Expert start function                                   |
//+------------------------------------------------------------------+
void OnTick()
{

   if(IsTrade())
   {  
      tester_button_act();
      manual_button();
      
      last_comment();
      comentbesar();
      if(Use_TpMoney){TargetProfit();}
      if(Use_SLMoney){TargetLoss();}
      
      
         if(StartTime_>EndTime_){
   isTime  = TimeCurrent() >= StringToTime(TimeToStr(TimeCurrent(), TIME_DATE) + " " + StartTime_) && TimeCurrent() <= StringToTime(TimeToStr(TimeCurrent(), TIME_DATE) + " " + EndTime1);
   isTime1  = TimeCurrent() >= StringToTime(TimeToStr(TimeCurrent(), TIME_DATE) + " " + StartTime1) && TimeCurrent() <= StringToTime(TimeToStr(TimeCurrent(), TIME_DATE) + " " + EndTime_);}
   else
   if(StartTime_<EndTime_){
   isTime  = TimeCurrent() >= StringToTime(TimeToStr(TimeCurrent(), TIME_DATE) + " " + StartTime_) && TimeCurrent() <= StringToTime(TimeToStr(TimeCurrent(), TIME_DATE) + " " + EndTime_);}


      if(UseTimeFilter && (isTime||isTime1)){     
      if(first_time == 0)SetupTrade();}
      
      if(!UseTimeFilter){if(first_time == 0)SetupTrade();}  

      double price_buystop  = NormalizeDouble(BidPrice()+(PipRange*POINT),DIGIT);
      double price_sellstop = NormalizeDouble(AskPrice()-(PipRange*POINT),DIGIT); 
      

      if(TotalOrder(OP_BUY)+TotalOrder(OP_SELL)==0 && TotalOrder(OP_BUYSTOP)+TotalOrder(OP_SELLSTOP)==1)
      {
         if(lc == EA_Name)
         {
            CloseOrder();
            CloseOrderNoMagic();
            Print("ClosebyTP");
         }
      }      
      
      double tpbuy  = ObjectGetDouble(ChartID(),"TP_Buy",OBJPROP_PRICE);
      double tpsel  = ObjectGetDouble(ChartID(),"TP_Sell",OBJPROP_PRICE);
      //Comment(tpsel,"-",BidPrice());
      if(TotalOrder()>=1 && ((tpbuy>0 && BidPrice()>=tpbuy) || (tpsel>0 && AskPrice()<=tpsel))){CloseOrder();Print("ClosebyTP");CloseOrderNoMagic();}
      //if(TotalOrder()>1 && (AskPrice()<=tpsel)){CloseOrder();Print("2222");}      
      else
      if(TotalOrder()==0){ObjectDelete("TP_Buy");ObjectDelete("TP_Sell");}
      
      if(MagicNumber ==0 && TotalOrderNoMagic()>=1){
            if(TakeProfit>0)
              {
               TPModifBuyNoAV();
               TPModifSellNoAV();
              }
            if(StopLoss>0)
              {
               SLModifBuyNoAV();
               SLModifSellNoAV();
              }}
              
      if(UseTrail){Trailing();Trailing_2_n_Set_TPSL();}
      hedging();

	   }

   return;
}
//========================================

void SetupTrade()
{
   double MA1_  = iMA(Symbol(),Period(),Period_MA_1_,Shift_MA_1_,Mode_MA_1_,Price_MA_1_,1);
         
         if(UseMA){
         mabuy   = MA1_<Close[1];
         masel   = MA1_>Close[1];}
         else 
         if(!UseMA){mabuy = true;masel = true;}
         
         

         buy1   = mabuy && TradeBuy;
         sell1  = masel && TradeSell;     
           

   
   if(Volume[0]<10 && TotalOrder()==0)
   {  

      if(buy1)  
      {
         Order_1(OP_BUY,CommentTrade);
         //ticket = OrderSend(Symbol(),OP_SELLSTOP,Lots,price_sellstop,SlipPage,sl_sellstop,tp_sellstop,"SellStop",MagicNumber,0,clrRed);
         status_BEP = 0;
         price_BEP = 0;
         status_trailing = 0;
         start_trailing_price = 0;
      }   
      else
      if(sell1) 
      {
         Order_1(OP_SELL,CommentTrade);
         //ticket = OrderSend(Symbol(),OP_BUYSTOP,Lots,price_buystop,SlipPage,sl_buystop,tp_buystop,"BuyStop",MagicNumber,0,clrBlue);
         status_BEP = 0;
         price_BEP = 0;
         status_trailing = 0;
         start_trailing_price = 0;
      }
   }
}


bool IsOrder(string comment)
{
   bool isOrder = true;
   
   if(OrderSelect(OrdersTotal()-1,SELECT_BY_POS,MODE_TRADES))
   {
      if((OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber) || (OrderSymbol() == Symbol() && ModeOrder == Manual))
      {  
         if(StringFind(OrderComment(),comment) != -1) isOrder = false;
         
         if(OrderType() == OP_BUY)
         {
            if(OrderStopLoss() > OrderOpenPrice()) isOrder = false;
         }

         if(OrderType() == OP_SELL)
         {
            if(OrderStopLoss() < OrderOpenPrice() && OrderStopLoss() > 0) isOrder = false;
         }
      }
   }
   
   return(isOrder);
}

double TotalPips()
{
   double totalPip = 0, pip = 0;
   string date     = TimeToString(TimeCurrent(),TIME_DATE);
   
   for(int i = OrdersHistoryTotal()-1; i >= 0; i--)
   {
      if(OrderSelect(i,SELECT_BY_POS,MODE_HISTORY))
      {
         if((OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber) || (OrderSymbol() == Symbol() && ModeOrder == Manual))
         {
            if(StringFind(TimeToString(OrderCloseTime(),TIME_DATE),date) != -1)
            {
               if(OrderType() == OP_BUY)
               {
                  pip = (OrderClosePrice()-OrderOpenPrice())/POINT;
                  totalPip += pip;
               }

               if(OrderType() == OP_SELL)
               {
                  pip = (OrderOpenPrice()-OrderClosePrice())/POINT;
                  totalPip += pip;
               }
            }
         }
      }
   }
   
   return(totalPip);
}


int TotalOrder(int ordertype = -1)
{
   int Order = 0;

   for(int i = 0; i < OrdersTotal(); i++)
   {
      if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
      {
         if((OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber) || (OrderSymbol() == Symbol() && ModeOrder == Manual))
         {
            if(ordertype == -1) 
               Order++;
            else if(ordertype == OrderType()) 
               Order++;
         }
      }
   }
   
   return(Order);
}


double SetupLot(int orderType)
{
   double lot    = 0, firstLot = 0,
          MinLot = MarketInfo(Symbol(),MODE_MINLOT),
          MaxLot = MarketInfo(Symbol(),MODE_MAXLOT), 
          lotStep  = MarketInfo(Symbol(),MODE_LOTSTEP); 
   int    lotDigit = 1; if(lotStep == 0.01) lotDigit = 2; if(lotStep == 0.001) lotDigit = 3;        
      
   for(int i = 0; i < OrdersTotal(); i++)
   {
      if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
      {
         if((OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber) || (OrderSymbol() == Symbol() && ModeOrder == Manual))
         {
            lot = MathMax(lot,OrderLots());
         }
      }
   }
 
   lot = Lots;

   
   if(MinLot == 0.01)
      firstLot = NormalizeDouble(firstLot,2);  
   else
      firstLot = NormalizeDouble(firstLot,1);
   
   if(lot == 0)
   {
         lot = Lots;
   } 

   if(lot < MinLot) lot = MinLot;
   if(lot > MaxLot) lot = MaxLot;   
      
   return(lot);
}

double AskPrice(string symbol = "")
{
   if(symbol == "") symbol = Symbol();
   return(MarketInfo(symbol,MODE_ASK));
}

double BidPrice(string symbol = "")
{
   if(symbol == "") symbol = Symbol();
   return(MarketInfo(symbol,MODE_BID));
}

int StopLevel(string symbol = "")
{
   if(symbol == "") symbol = Symbol();
   return((int)MarketInfo(symbol,MODE_STOPLEVEL));
}

string OrderCmd(int ordertype)
{
   string label;

   switch(ordertype)
   {
      case 0: label = "Buy";        break;
      case 1: label = "Sell";       break;
      case 2: label = "Buy Limit";  break;
      case 3: label = "Sell Limit"; break;
      case 4: label = "Buy Stop";   break;
      case 5: label = "Sell Stop";  break;
   }

   return(label);
}

double SetupLot_1()
{
   double lot    = 0, firstLot = 0,
          MinLot = MarketInfo(Symbol(),MODE_MINLOT),
          MaxLot = MarketInfo(Symbol(),MODE_MAXLOT); 
      
   for(int i = 0; i < OrdersTotal(); i++)
   {
      if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
      {
         if(OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber)
         {
            lot = MathMax(lot,OrderLots());
         }
      }
   }
   
   lot = Lots;

   if(MinLot == 0.01)
      firstLot = NormalizeDouble(firstLot,2);  
   else
      firstLot = NormalizeDouble(firstLot,1);
   
   if(lot == 0)
   {
         lot = Lots;
   }     
   if(lot < MinLot) lot = MinLot;
   if(lot > MaxLot) lot = MaxLot;   
   
   if(MinLot == 0.01)
      lot = NormalizeDouble(lot,2);  
   else
      lot = NormalizeDouble(lot,1);
      
   return(lot);
}

int Order_1(int ordertype, string comment)
{
   int             ticket;
   double          lot         = SetupLot_1(),buytp,selltp, sl = 0, tp = 0;
   
   if(ordertype == OP_BUY)  
   {
      price = AskPrice(); 
      if(StopLoss > 0)   sl = 0;
      selltp = NormalizeDouble(price+(TakeProfit*POINT),DIGIT);
      if(!HiddenTP && TakeProfit > 0){ tp = NormalizeDouble(price+(TakeProfit*POINT),DIGIT);CreateLine("TP_Buy",tp,linetpbuy);}   
      if(HiddenTP && TakeProfit > 0){tp =0;CreateLine("TP_Buy",selltp,clrRed);}
   }
   
   if(ordertype == OP_SELL) 
   {
      price = BidPrice(); 
      if(StopLoss > 0)   sl = 0;
      buytp = NormalizeDouble(price-(TakeProfit*POINT),DIGIT);
      if(!HiddenTP && TakeProfit > 0) {tp = NormalizeDouble(price-(TakeProfit*POINT),DIGIT); CreateLine("TP_Sell",tp,linetpsel);   } 
      if(HiddenTP && TakeProfit > 0){tp =0;CreateLine("TP_Sell",buytp,clrRed);}
   }
              
   ticket = OrderSend(Symbol(),ordertype,lot,price,SlipPage,sl,tp,comment,MagicNumber,0);
   if(ticket == -1) ShowError("Order " + OrderCmd(ordertype));
   
   return(ticket);
}


int Order(int ordertype, string comment, double uselot = 0)
{
   int             ticket;
   double          lot         = uselot,buytp,selltp, sl = 0, tp = 0;
   
   if(ordertype == OP_BUY)  
   {
      price = AskPrice(); 
      if(StopLoss > 0)   sl = 0;
      buytp = NormalizeDouble(price+(TakeProfit*POINT),DIGIT);
      if(!HiddenTP && TakeProfit > 0){ tp = NormalizeDouble(price+(TakeProfit*POINT),DIGIT);   CreateLine("TP_Buy",tp,linetpbuy);  }
      if(HiddenTP && TakeProfit > 0){ tp = 0;   CreateLine("TP_Buy",buytp,clrRed);  } 
   }
   
   if(ordertype == OP_SELL) 
   {
      price = BidPrice(); 
      if(StopLoss > 0)   sl = 0;
      selltp = NormalizeDouble(price-(TakeProfit*POINT),DIGIT);
      if(!HiddenTP && TakeProfit > 0) {tp = NormalizeDouble(price-(TakeProfit*POINT),DIGIT);  CreateLine("TP_Sell",tp,linetpsel); }
      if(HiddenTP && TakeProfit > 0) {tp = 0;  CreateLine("TP_Sell",selltp,clrRed); }    
   }
              
   ticket = OrderSend(Symbol(),ordertype,lot,price,SlipPage,sl,tp,comment,MagicNumber,0);
   if(ticket == -1) ShowError("Order " + OrderCmd(ordertype));
   
   return(ticket);
}

int OrderPO(int ordertype, string comment, double price_, double lots)
{
   int             ticket;
   double          sl = 0, tp = 0;
              
   ticket = OrderSend(Symbol(),ordertype,lots,price_,SlipPage,sl,tp,comment,MagicNumber,0);
   if(ticket == -1) ShowError("Order " + OrderCmd(ordertype));
   
   return(ticket);
}

int TotalOrderNoMagic(int ordertype=-1)
  {
   int Order=0;

   for(int i=0; i<OrdersTotal(); i++)
     {
      if(!OrderSelect(i,0)) continue;
      if(OrderSymbol()!=Symbol()) continue;
      if(ordertype==-1)
         Order++;
      if(ordertype==OrderType())
         Order++;
     }

   return(Order);
  }
void TargetProfit()
{  
   double profit = 0;
   if(TotalOrder() > 0)
   {
      for(int i = 0; i < OrdersTotal(); i++)
      {
         if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
         {
            if(OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber)
            {
				   profit = profit+(OrderProfit()+OrderSwap()+OrderCommission());
            }
         }
      }
      
      if(TotalOrder() > 0)targetmoney = TpMoney;

      if(TpMoney > 0)
      {
         if(profit >= TpMoney)  CloseAllPair = true;
         {
          if(CloseAllPair) 
            {         
            while(TotalOrder() > 0)
            {
               CloseOrder();
            }
            Print("Close by TP Money");
            }
         }
      }    
   }
   if(TotalOrder() == 0) 
   {
      CloseAllPair = false;
      
   }   
}


void TargetLoss()
{  
   double loss = 0;
   if(TotalOrder() > 0)
   {
      for(int i = 0; i < OrdersTotal(); i++)
      {
         if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
         {
            if(OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber)
            {
				   loss = loss+(OrderProfit()+OrderSwap()+OrderCommission());
            }
         }
      }
      
      if(TotalOrder() > 0)targetmoney = -SL_Money;

      if(TpMoney > 0)
      {
         if(loss < -targetmoney)  CloseAllPair = true;
         {
          if(CloseAllPair) 
            {         
            while(TotalOrder() > 0)
            {
               CloseOrder();
            }
            Print("Close by SL Money");
            }
         }
      }    
   }
   if(TotalOrder() == 0) 
   {
      CloseAllPair = false;
      
   }   
}


void CloseOrder(int ordertype = -1)
{   
   for(int i = OrdersTotal()-1; i >= 0; i--)
   {
      if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
      {
         if((OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber) || (OrderSymbol() == Symbol() && ModeOrder == Manual))
         {
            if(ordertype == -1)
            {
               if(OrderType() == OP_BUY) 
               {     
                  if(!OrderClose(OrderTicket(),OrderLots(),BidPrice(OrderSymbol()),SlipPage,Blue)) ShowError("Close " + OrderCmd(OrderType())); 
               }
               else if(OrderType() == OP_SELL)
               {      
                  if(!OrderClose(OrderTicket(),OrderLots(),AskPrice(OrderSymbol()),SlipPage,Red)) ShowError("Close " + OrderCmd(OrderType()));
               } 
               else
               {
                  if(!OrderDelete(OrderTicket())) ShowError("Delete Pending Order " + OrderCmd(OrderType()));
               }
            }
            else
            {
               if(OrderType() == ordertype)
               {
                  if(ordertype == OP_BUY)
                  {   
                     if(!OrderClose(OrderTicket(),OrderLots(),BidPrice(OrderSymbol()),SlipPage,Blue)) ShowError("Close " + OrderCmd(OrderType()));
                  } 
                  else if(ordertype == OP_SELL)   
                  {
                     if(!OrderClose(OrderTicket(),OrderLots(),AskPrice(OrderSymbol()),SlipPage,Red)) ShowError("Close " + OrderCmd(OrderType()));
                  } 
                  else
                  {
                     if(!OrderDelete(OrderTicket())) ShowError("Delete Pending Order " + OrderCmd(OrderType()));
                  }
               }
            }
         }
      }
   }
}

void CloseOrderComment(int ordertype = -1, string comment = "")
{   
   for(int i = OrdersTotal()-1; i >= 0; i--)
   {
      if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
      {
         if(OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber && OrderComment()==comment)
         {
            if(ordertype == -1)
            {
               if(OrderType() == OP_BUY) 
               {     
                  if(!OrderClose(OrderTicket(),OrderLots(),BidPrice(OrderSymbol()),SlipPage,Blue)) ShowError("Close " + OrderCmd(OrderType())); 
               }
               else if(OrderType() == OP_SELL)
               {      
                  if(!OrderClose(OrderTicket(),OrderLots(),AskPrice(OrderSymbol()),SlipPage,Red)) ShowError("Close " + OrderCmd(OrderType()));
               } 
               else
               {
                  if(!OrderDelete(OrderTicket())) ShowError("Delete Pending Order " + OrderCmd(OrderType()));
               }
            }
            else
            {
               if(OrderType() == ordertype)
               {
                  if(ordertype == OP_BUY)
                  {   
                     if(!OrderClose(OrderTicket(),OrderLots(),BidPrice(OrderSymbol()),SlipPage,Blue)) ShowError("Close " + OrderCmd(OrderType()));
                  } 
                  else if(ordertype == OP_SELL)   
                  {
                     if(!OrderClose(OrderTicket(),OrderLots(),AskPrice(OrderSymbol()),SlipPage,Red)) ShowError("Close " + OrderCmd(OrderType()));
                  } 
                  else
                  {
                     if(!OrderDelete(OrderTicket())) ShowError("Delete Pending Order " + OrderCmd(OrderType()));
                  }
               }
            }
         }
      }
   }
}

double TotalProfit()
{  
   double profit = 0;
   if(TotalOrder() > 0)
   {
      
    
      for(int i = 0; i < OrdersTotal(); i++)
      {
         if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
         {
            if((OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber) || (OrderSymbol() == Symbol() && ModeOrder == Manual)) 
            {
               profit += OrderProfit()+OrderCommission()+OrderSwap();
            }
         }
      }
   }
   
   return(profit);
}

void ShowError(string label)
{
	string Error;
	int    error = GetLastError();
	
	Error        = StringConcatenate("Terminal: ",TerminalName(),"\n",
	                                  label," error ",error,"\n",
	                                  ErrorDescription(error));
	if(error > 2) 
	{
	  if(IsTesting())
	     Comment(Error);
	  else   
	     Alert(Error);
   }
}
        
void AutoDigit()
{
   POINT = MarketInfo(Symbol(),MODE_POINT);
   DIGIT = (int)MarketInfo(Symbol(),MODE_DIGITS);
   
   if (DIGIT == 3 || DIGIT == 5)
   {
      PT              = 10;
      SlipPage       *= 10;
      TakeProfit     *= 10;
      StopLoss       *= 10;
      TrailingStop   *= 10;
      TrailingStep   *= 10;      
      PipRange       *= 10;         
      
   }
}

bool IsTrade()
{
   bool trade = true;
   
   if(!IsTesting())
   {
      if(!IsTradeAllowed()) 
      {
         Alert("Allow live trading is disable, press F7, \nselect Common tab, check Allow live trading");
         trade = false;
      }
   
      if(!IsExpertEnabled()) 
      {
         Alert("Expert Advisor is disable, click AutoTrading button to activate it ");
         trade = false;
      }   
   }
   
   return(trade);
}

void DelObject(string objectName = "")
{
   for(int i = ObjectsTotal()-1; i >= 0; i--)
	{
	   if(StringFind(ObjectName(i),WindowExpertName()) != -1)
	   {
	   	if(objectName == "")
	  			ObjectDelete(ObjectName(i));
	   	else
	   		if(StringFind(ObjectName(i),objectName) != -1) ObjectDelete(ObjectName(i));
		}
	}
}

void expired_po()
{
   int i;
   
   double upper = NormalizeDouble(AskPrice()+(PipRange*POINT),DIGIT);
   double lower = NormalizeDouble(BidPrice()-(PipRange*POINT),DIGIT); 
   
   for(i=0; i<OrdersTotal(); i++)
   {
      if(OrderSelect(i,SELECT_BY_POS)) 
      if ((OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber) || (OrderSymbol() == Symbol() && ModeOrder == Manual))
      {
         if((OrderType()==OP_BUYSTOP && upper < OrderOpenPrice()) || (OrderType()==OP_SELLSTOP && lower > OrderOpenPrice()))
         {
            if(TimeCurrent() >= OrderOpenTime()+POModifyMinute*60)
            {
               if(!OrderDelete(OrderTicket())) ShowError("Delete Pending Order " + OrderCmd(OrderType()));
            }
         }
      }
   }
}  

void FirstOrderType()
{
   datetime EarliestOrder = D'2099/12/31';
   
   for (int i = 0; i < OrdersTotal(); i++) {
      if (OrderSelect(i, SELECT_BY_POS,MODE_TRADES)) {
         if ((OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber) || (OrderSymbol() == Symbol() && ModeOrder == Manual)) {
            if (EarliestOrder > OrderOpenTime()) {
                EarliestOrder = OrderOpenTime();
                fot = OrderType();
            }
         }  
      }
   }      
}

double last_price(int ordertype = -1)
{
   int i;
   for(i=0; i<OrdersTotal(); i++)
   {
      if(OrderSelect(i,SELECT_BY_POS)) 
      if ((OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber) || (OrderSymbol() == Symbol() && ModeOrder == Manual))
      {
         if(OrderType()==ordertype)
         {
            price = NormalizeDouble(OrderOpenPrice(),DIGIT);
         }
      }
   }
   return(price);
}

void last_lot()
{
   int i;
   for(i=0; i<OrdersTotal(); i++)
   {
    if(OrderSelect(i,SELECT_BY_POS)) 
     if (OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber)
      {
       ll = OrderLots();
      }
   }
}

void last_comment()
{
   int i;
   for(i=0; i<OrdersTotal(); i++)
   {
      if(OrderSelect(i,SELECT_BY_POS)) 
      if (OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber)
      {
         lc = OrderComment();
      }
   }
}

void LotsTotal()
{
   int r;
   if(OrdersTotal()>0)
   {
      openbuylots = 0; openselllots = 0;    //  set the variables to zero
      for(int i=0;i<OrdersTotal();i++)
      {
         r = OrderSelect(i,SELECT_BY_POS,MODE_TRADES);
         if((OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber) || (OrderSymbol() == Symbol() && ModeOrder == Manual))
         {  
            if(OrderCloseTime()==0)
            {
               if(OrderType()==OP_BUY) openbuylots += OrderLots();          
               if(OrderType()==OP_SELL) openselllots += OrderLots();
            }
         }
      }
   }
}

void hedging()
{
   int ticket;
   
   FirstOrderType(); LotsTotal();
   
   double nextbuy, nextsell; last_comment();

   
   int totalopen = TotalOrder(OP_BUY)+TotalOrder(OP_SELL);
   
   if(totalopen >= 1)range = PipRange;
 
   
   if(TotalOrder(OP_SELLSTOP)>0 && lc != EA_Name && TotalOrder(OP_BUY)>0)
   {
      CloseOrder(OP_SELLSTOP);
   }
         
   if(TotalOrder(OP_BUYSTOP)>0 && lc != EA_Name && TotalOrder(OP_SELL)>0)
   {
      CloseOrder(OP_BUYSTOP);
   }


   double price_buystop  = NormalizeDouble(BidPrice()+(PipRange*POINT),DIGIT);
   double price_sellstop = NormalizeDouble(BidPrice()-(PipRange*POINT),DIGIT);
          
   double tp_buystop = 0,linetp_buystop = 0, sl_buystop = 0, linesl_buystop = 0;
   double tp_sellstop = 0, linetp_sellstop = 0, sl_sellstop = 0, linesl_sellstop = 0;
   

   
   
   if(fot == 0)//OP_BUY
   {
      if(TotalOrder(OP_BUY)>TotalOrder(OP_SELL) && TotalOrder(OP_BUY) > 0)
      {
         last_price_buy(); last_comment(); last_lot();
         nextsell = NormalizeDouble(lpb-(range*POINT),DIGIT);
         if(TakeProfit > 0)
         {
         if(!HiddenTP){
         tp_sellstop = NormalizeDouble(nextsell-(TakeProfit*POINT),DIGIT); 
         CreateLine("TP_Sell",tp_sellstop,linetpsel);  }
         if(HiddenTP){
         tp_sellstop = 0; 
         linetp_sellstop = NormalizeDouble(nextsell-(TakeProfit*POINT),DIGIT);  
         CreateLine("TP_Sell",linetp_sellstop,clrRed);  }         
         }
   
         if(StopLoss > 0)
         {
         sl_sellstop = 0;//NormalizeDouble(nextsell+(StopLoss*POINT),DIGIT)
         }
 
         if(TotalOrder(OP_SELLSTOP)==0)
         {
            if(totalopen >= 1)lotsell = ll*Multiplier;
            //if(totalopen == MaxOrder-1)lotsell = (openbuylots-openselllots)+SelisihMaxLots; 
            ticket  = OrderSend(Symbol(),OP_SELLSTOP,lotsell,nextsell,SlipPage,sl_sellstop,tp_sellstop,EA_Name,MagicNumber,0,clrRed);
         }
      }
      
      if(TotalOrder(OP_BUY)==TotalOrder(OP_SELL) && TotalOrder(OP_BUY) > 0)
      {
         last_price_sell();  last_lot();
         nextbuy = NormalizeDouble(lps+(range*POINT),DIGIT);
         if(TakeProfit > 0)
         {
         if(!HiddenTP){
         tp_buystop  = NormalizeDouble(nextbuy+(TakeProfit*POINT),DIGIT);
         CreateLine("TP_Buy",tp_buystop,linetpbuy);}
         if(HiddenTP){
         tp_buystop  = 0;
         linetp_buystop  = NormalizeDouble(nextbuy+(TakeProfit*POINT),DIGIT);         
         CreateLine("TP_Buy",linetp_buystop,clrRed);}         
         }
   
         if(StopLoss > 0)
         {
         sl_buystop  = 0;//NormalizeDouble(nextbuy-(StopLoss*POINT),DIGIT)
         }         
         if(TotalOrder(OP_BUYSTOP)==0)
         {
            if(totalopen >= 1)lotbuy = ll*Multiplier;
            //if(totalopen == MaxOrder-1)lotbuy = (openselllots-openbuylots)+SelisihMaxLots; 
            ticket = OrderSend(Symbol(),OP_BUYSTOP,lotbuy,nextbuy,SlipPage,sl_buystop,tp_buystop,EA_Name,MagicNumber,0,clrBlue);
         }
      }
   }
   
   if(fot == 1)//OP_SELL
   {
      if(TotalOrder(OP_SELL)>TotalOrder(OP_BUY) && TotalOrder(OP_SELL) > 0)
      {
         last_price_sell(); last_comment(); last_lot();
         nextbuy = NormalizeDouble(lps+(range*POINT),DIGIT);
         if(TakeProfit > 0)
         {
         if(!HiddenTP){
         tp_buystop  = NormalizeDouble(nextbuy+(TakeProfit*POINT),DIGIT);
         CreateLine("TP_Buy",tp_buystop,linetpbuy);}
         if(HiddenTP){
         tp_buystop  = 0;
         linetp_buystop  = NormalizeDouble(nextbuy+(TakeProfit*POINT),DIGIT);         
         CreateLine("TP_Buy",linetp_buystop,clrRed);}   
         }
   
         if(StopLoss > 0)
         {
         sl_buystop  = 0;//NormalizeDouble(nextbuy-(StopLoss*POINT),DIGIT)
         }          
         if(TotalOrder(OP_BUYSTOP)==0)
         {
            if(totalopen >= 1)lotbuy = ll*Multiplier;
            //if(totalopen == MaxOrder-1)lotbuy = (openselllots-openbuylots)+SelisihMaxLots; 
            ticket = OrderSend(Symbol(),OP_BUYSTOP,lotbuy,nextbuy,SlipPage,sl_buystop,tp_buystop,EA_Name,MagicNumber,0,clrBlue);
         }
      }
      
      if(TotalOrder(OP_BUY)==TotalOrder(OP_SELL) && TotalOrder(OP_SELL) > 0)
      {
         last_price_buy(); last_lot();
         nextsell = NormalizeDouble(lpb-(range*POINT),DIGIT);
         if(TakeProfit > 0)
         {
         if(!HiddenTP){
         tp_sellstop = NormalizeDouble(nextsell-(TakeProfit*POINT),DIGIT); 
         CreateLine("TP_Sell",tp_sellstop,linetpsel);  }
         if(HiddenTP){
         tp_sellstop = 0; 
         linetp_sellstop = NormalizeDouble(nextsell-(TakeProfit*POINT),DIGIT);  
         CreateLine("TP_Sell",linetp_sellstop,clrRed);  }   
         }
   
         if(StopLoss > 0)
         {
         sl_sellstop = 0;//NormalizeDouble(nextsell+(StopLoss*POINT),DIGIT)
         }         
         if(TotalOrder(OP_SELLSTOP)==0)
         {
            if(totalopen >= 1)lotsell = ll*Multiplier;
            //if(totalopen == MaxOrder-1)lotsell = (openbuylots-openselllots)+SelisihMaxLots; 
            ticket = OrderSend(Symbol(),OP_SELLSTOP,lotsell,nextsell,SlipPage,sl_sellstop,tp_sellstop,EA_Name,MagicNumber,0,clrRed);
         }
      }
   }
}


void TPModif(int ordertype = -1)
{
   bool q;
   int i;
   double tp = 0;
   if(TotalOrder(OP_BUY)>=1 && TotalOrder(OP_SELL)==0 && ordertype == 0 && TakeProfit > 0)
   {
      tp = NormalizeDouble(last_price(0)+(TakeProfit*POINT),DIGIT);
   }
   if(TotalOrder(OP_BUY)==0 && TotalOrder(OP_SELL)>=1 && ordertype == 1 && TakeProfit > 0)
   {
      tp = NormalizeDouble(last_price(1)-(TakeProfit*POINT),DIGIT);
   }
   for(i=0; i<OrdersTotal(); i++)
   {
      if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
      {
         if(OrderTakeProfit() != tp && OrderType()==ordertype)
         {
            if((OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber) || (OrderSymbol() == Symbol() && ModeOrder == Manual))
            {  
               q = OrderModify(OrderTicket(),OrderOpenPrice(),OrderStopLoss(),tp,OrderExpiration(),clrWhite);
            }
         }
      }                   
   }
} 


void SLModif(int ordertype = -1)
{  
   bool q;
   int i;
   double sl = 0;
   if(TotalOrder(OP_BUY)>=1 && TotalOrder(OP_SELL)==0 && ordertype == 0 && StopLoss > 0)
   {
      sl = NormalizeDouble(last_price(0)-(StopLoss*POINT),DIGIT);
   }
   if(TotalOrder(OP_BUY)==0 && TotalOrder(OP_SELL)>=1 && ordertype == 1 && StopLoss > 0)
   {
      sl = NormalizeDouble(last_price(1)+(StopLoss*POINT),DIGIT);
   }
   
   for(i=0; i<OrdersTotal(); i++)
   {
      if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
      {
         if(OrderStopLoss() != sl && OrderType()==ordertype)
         {
            if((OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber) || (OrderSymbol() == Symbol() && ModeOrder == Manual))
            {
               if(OrderType()==OP_BUY)
               {
                  if(OrderStopLoss()==0 || OrderStopLoss() < OrderOpenPrice())
                  {
                     q = OrderModify(OrderTicket(),OrderOpenPrice(),sl,OrderTakeProfit(),OrderExpiration(),clrWhite); 
                  }
               }
               
               if(OrderType()==OP_SELL)
               {
                  if(OrderStopLoss()==0 || OrderStopLoss() > OrderOpenPrice())
                  {
                     q = OrderModify(OrderTicket(),OrderOpenPrice(),sl,OrderTakeProfit(),OrderExpiration(),clrWhite); 
                  }
               }
            }
         }
      }                   
   }
}

int last_order_type()
{
   int i;
   lastordertype = -1;
   for(i=0; i<OrdersTotal(); i++)
   {
    if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES)) 
      {
         if((OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber) || (OrderSymbol() == Symbol() && ModeOrder == Manual))
         {
            if(OrderType()==OP_BUY || OrderType()==OP_SELL)
            lastordertype = OrderType();
         }
      }
   }
   return(lastordertype);
}



void CreateLine(string name = "", double price_ = 0, color clr_Line = clrRed)
{
   ObjectCreate(ChartID(),name,OBJ_HLINE,0,0,price_);
   ObjectSet(name,OBJPROP_COLOR,clr_Line);
   ObjectSet(name,OBJPROP_STYLE,STYLE_DASHDOT);
   ObjectSetText(name,StringSubstr(name,0,2),10,"Times New Roman",clrWhite);
}

void DeleteLine()
{
   ObjectDelete(ChartID(),name_BEP);
   ObjectDelete(ChartID(),name_sl_sell);
   ObjectDelete(ChartID(),name_slbuy);
   ObjectDelete(ChartID(),name_tp_sell);
   ObjectDelete(ChartID(),name_tpbuy);
} 


void CloseOrderbutton(int ordertype = -1)
{   
   for(int i = OrdersTotal()-1; i >= 0; i--)
   {
      if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
      {
            if(ordertype == -1)
            {
               if(OrderType() == OP_BUY) 
               {     
                  if(!OrderClose(OrderTicket(),OrderLots(),BidPrice(OrderSymbol()),SlipPage,Blue)) ShowError("Close " + OrderCmd(OrderType())); 
               }
               else if(OrderType() == OP_SELL)
               {      
                  if(!OrderClose(OrderTicket(),OrderLots(),AskPrice(OrderSymbol()),SlipPage,Red)) ShowError("Close " + OrderCmd(OrderType()));
               } 
               else
               {
                  if(!OrderDelete(OrderTicket())) ShowError("Delete Pending Order " + OrderCmd(OrderType()));
               }
            }
            else
            {
               if(OrderType() == ordertype)
               {
                  if(ordertype == OP_BUY)
                  {   
                     if(!OrderClose(OrderTicket(),OrderLots(),BidPrice(OrderSymbol()),SlipPage,Blue)) ShowError("Close " + OrderCmd(OrderType()));
                  } 
                  else if(ordertype == OP_SELL)   
                  {
                     if(!OrderClose(OrderTicket(),OrderLots(),AskPrice(OrderSymbol()),SlipPage,Red)) ShowError("Close " + OrderCmd(OrderType()));
                  } 
                  else
                  {
                     if(!OrderDelete(OrderTicket())) ShowError("Delete Pending Order " + OrderCmd(OrderType()));
                  }
               }
            }
         
      }
   }
}


void last_price_buy()
{
   int i;
   for(i=0; i<OrdersTotal(); i++)
   {
    if(OrderSelect(i,SELECT_BY_POS)&&OrderType()==OP_BUY) 
    if (OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber)
      {
       lpb = NormalizeDouble(OrderOpenPrice(),DIGIT);
      }
   }
}

void last_price_sell()
{
   int i;
   for(i=0; i<OrdersTotal(); i++)
   {
    if(OrderSelect(i,SELECT_BY_POS)&&OrderType()==OP_SELL) 
    if (OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber)
      {
       lps = NormalizeDouble(OrderOpenPrice(),DIGIT);
      }
   }
}
void CloseOrderNoMagic(int ordertype = -1)
{   
   for(int i = OrdersTotal()-1; i >= 0; i--)
   {
      if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
      {
         if(OrderSymbol() == Symbol())
         {
            if(ordertype == -1)
            {
               if(OrderType() == OP_BUY) 
               {     
                  if(!OrderClose(OrderTicket(),OrderLots(),BidPrice(OrderSymbol()),SlipPage,Blue)) ShowError("Close " + OrderCmd(OrderType())); 
               }
               else if(OrderType() == OP_SELL)
               {      
                  if(!OrderClose(OrderTicket(),OrderLots(),AskPrice(OrderSymbol()),SlipPage,Red)) ShowError("Close " + OrderCmd(OrderType()));
               } 
               else
               {
                  if(!OrderDelete(OrderTicket())) ShowError("Delete Pending Order " + OrderCmd(OrderType()));
               }
            }
            else
            {
               if(OrderType() == ordertype)
               {
                  if(ordertype == OP_BUY)
                  {   
                     if(!OrderClose(OrderTicket(),OrderLots(),BidPrice(OrderSymbol()),SlipPage,Blue)) ShowError("Close " + OrderCmd(OrderType()));
                  } 
                  else if(ordertype == OP_SELL)   
                  {
                     if(!OrderClose(OrderTicket(),OrderLots(),AskPrice(OrderSymbol()),SlipPage,Red)) ShowError("Close " + OrderCmd(OrderType()));
                  } 
                  else
                  {
                     if(!OrderDelete(OrderTicket())) ShowError("Delete Pending Order " + OrderCmd(OrderType()));
                  }
               }
            }
         }
      }
   }
}
void CloseOrderpair(int ordertype = -1)
{   
   for(int i = OrdersTotal()-1; i >= 0; i--)
   {
      if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
      {
         if(OrderSymbol() == Symbol())
         {
            if(ordertype == -1)
            {
               if(OrderType() == OP_BUY) 
               {     
                  if(!OrderClose(OrderTicket(),OrderLots(),BidPrice(OrderSymbol()),SlipPage,Blue)) ShowError("Close " + OrderCmd(OrderType())); 
               }
               else if(OrderType() == OP_SELL)
               {      
                  if(!OrderClose(OrderTicket(),OrderLots(),AskPrice(OrderSymbol()),SlipPage,Red)) ShowError("Close " + OrderCmd(OrderType()));
               } 
               else
               {
                  if(!OrderDelete(OrderTicket())) ShowError("Delete Pending Order " + OrderCmd(OrderType()));
               }
            }
            else
            {
               if(OrderType() == ordertype)
               {
                  if(ordertype == OP_BUY)
                  {   
                     if(!OrderClose(OrderTicket(),OrderLots(),BidPrice(OrderSymbol()),SlipPage,Blue)) ShowError("Close " + OrderCmd(OrderType()));
                  } 
                  else if(ordertype == OP_SELL)   
                  {
                     if(!OrderClose(OrderTicket(),OrderLots(),AskPrice(OrderSymbol()),SlipPage,Red)) ShowError("Close " + OrderCmd(OrderType()));
                  } 
                  else
                  {
                     if(!OrderDelete(OrderTicket())) ShowError("Delete Pending Order " + OrderCmd(OrderType()));
                  }
               }
            }
         }
      }
   }
}

double TotalProfitBuy()
{  
   double profit = 0;
   if(TotalOrder(OP_BUY) > 0)
   {
      for(int i = 0; i < OrdersTotal(); i++)
      {
         if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
         {
            if(OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber && OrderType()==OP_BUY) profit += OrderProfit()+OrderSwap()+OrderCommission();
         }
      }
   }
   
   return(profit);
}

double TotalProfitSell()
{  
   double profit = 0;
   if(TotalOrder(OP_SELL) > 0)
   {
      
    
      for(int i = 0; i < OrdersTotal(); i++)
      {
         if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
         {
            if(OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber && OrderType()==OP_SELL) profit += OrderProfit()+OrderSwap()+OrderCommission();
         }
      }
   }
   
   return(profit);
}


double TotalLot(int orderType)
{  
   double totalLots = 0;
   
   if(TotalOrder() > 0)
   { 
      for(int i = OrdersTotal()-1; i >= 0; i--)
      {
         if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
         {
            if(OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber)
            {
               if(OrderType() == orderType) totalLots += OrderLots();
            }
         }
      }
   }
   
   return(totalLots);
}

void Trailing_2_n_Set_TPSL()
{
   int totalopen = TotalOrder(OP_BUY)+TotalOrder(OP_SELL);
   last_price_buy(); last_price_sell(); last_order_type();
   tpline_buy = 0; tpline_sell = 0; 
   if(status_trailing == 0){slline_buy = 0; slline_sell = 0;}
   
   if(totalopen > 1)
   {
      if(TotalProfit() >= 0)
      {
         status_BEP = 1;
         if(price_BEP == 0)
         {
            if(lastordertype == 1)price_BEP = AskPrice();
            if(lastordertype == 0)price_BEP = BidPrice();  
         }
         if(price_BEP > 0 && UseTrail)
         {
            if(lastordertype == 0)start_trailing_price = NormalizeDouble(price_BEP+(TrailingStop*POINT),DIGIT);
            if(lastordertype == 1)start_trailing_price = NormalizeDouble(price_BEP-(TrailingStop*POINT),DIGIT);
         }
      }
         
      if(TotalProfit() < 0)
      {
         status_BEP = 0;
         start_trailing_price = 0;
      }
      
      if(lastordertype == 1)
      {
         if(price_BEP > 0 && price_BEP > lps)price_BEP = 0;
         CreateLine(name_tp_sell,tpline_sell,clrRed);
         if(price_BEP > 0)
         {
            
            if(StopLoss > 0 && status_trailing == 0 && UseTrail)
            {
               slline_sell = NormalizeDouble(price_BEP+(StopLoss*POINT),DIGIT);
               if(AskPrice() >= slline_sell)
               {
                  while(TotalOrder()>0)
                  {
                     CloseOrder();
                     Print("Close by Trailing");
                  }
               }
            }
         }
     
      }
      
      //=========================================================================
      
      if(lastordertype == 0)
      {
         if(price_BEP > 0 && price_BEP < lpb)price_BEP = 0;
         CreateLine(name_tpbuy,tpline_buy,clrRed);
         
            if(StopLoss > 0 && status_trailing == 0 && UseTrail)
            {
               slline_buy = NormalizeDouble(price_BEP-(StopLoss*POINT),DIGIT);
               if(BidPrice() <= slline_buy)
               {
                  while(TotalOrder()>0)
                  {
                     CloseOrder();
                     Print("Close by Trailing");
                  }
               }
            }
         }
     
      
      
      //==========================================================

      if(lastordertype == 0 && UseTrail)//buy
      {
         if(start_trailing_price > 0 && BidPrice() >= start_trailing_price)
         {
            status_trailing = 1;
            if(slline_buy < NormalizeDouble(BidPrice()-(TrailingStep*POINT),DIGIT))
            slline_buy = NormalizeDouble(BidPrice()-(TrailingStep*POINT),DIGIT);
         }
         if(status_trailing == 1 && BidPrice() <= slline_buy && TotalProfit()>0.02)
         {
            while(TotalOrder()>0)
            {
               CloseOrder();
               Print("Close by Trailing");
            }
         }
      }
      
      if(lastordertype == 1 && UseTrail)//sell
      {
         if(start_trailing_price > 0 && AskPrice() <= start_trailing_price)
         {
            status_trailing = 1;
            if(slline_sell > NormalizeDouble(AskPrice()+(TrailingStep*POINT),DIGIT) || slline_sell == 0)
            slline_sell = NormalizeDouble(AskPrice()+(TrailingStep*POINT),DIGIT);
         }
         if(status_trailing == 1 && AskPrice() >= slline_sell && TotalProfit()>0.02)
         {
            while(TotalOrder()>0)
            {
               CloseOrder();
               Print("Close by Trailing");
            }
         }
      }
   }
}

void Trailing()
{
   if(TotalOrder(OP_BUY)+TotalOrder(OP_SELL) == 1 && TrailingStop > 0 && TrailingStep > 0)
   {  
	   bool     modif         = false;
	   double   sl            = 0;
      
      for(int i = 0; i < OrdersTotal(); i++)
      {
         if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
         {
            if(OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber)
            {
               if(OrderType() == OP_BUY)
               {
                  if((BidPrice()-OrderOpenPrice())/POINT >= TrailingStop)
                  {
                     if(OrderStopLoss() == 0)
                        sl = NormalizeDouble(BidPrice()-(TrailingStep*POINT),DIGIT);
                     else
                        sl  = NormalizeDouble(BidPrice()-(TrailingStep*POINT),DIGIT);
                     
                     if(sl > NormalizeDouble(OrderStopLoss(),DIGIT)) modif = OrderModify(OrderTicket(),OrderOpenPrice(),sl,OrderTakeProfit(),0);
                  }
               }
               
               if(OrderType() == OP_SELL)
               {
                  if((OrderOpenPrice()-AskPrice())/POINT >= TrailingStop)
                  {
                     if(OrderStopLoss() == 0)
                        sl = NormalizeDouble(AskPrice()+(TrailingStep*POINT),DIGIT);
                     else
                        sl = NormalizeDouble(AskPrice()+(TrailingStep*POINT),DIGIT);   
                     
                     if(sl < NormalizeDouble(OrderStopLoss(),DIGIT) || OrderStopLoss() == 0) modif = OrderModify(OrderTicket(),OrderOpenPrice(),sl,OrderTakeProfit(),0);
                  } 
               }               
            }       
         }
      }    
   }
}  
void del_button()
{

   ObjectDelete(name_buy);
   ObjectDelete(name_sell);   
   ObjectDelete(name_closeall);


}

void create_button(string name, int x_distance, int y_distance, int x_size, int y_size, color bcolor, color tcolor, string title)
{
   ObjectCreate(ChartID(),name,OBJ_BUTTON,0,0,0);
   ObjectSet(name,OBJPROP_XDISTANCE,x_distance);
   ObjectSet(name,OBJPROP_YDISTANCE,y_distance);
   ObjectSet(name,OBJPROP_XSIZE,x_size);
   ObjectSet(name,OBJPROP_YSIZE,y_size);
   ObjectSet(name,OBJPROP_BGCOLOR,bcolor);
   ObjectSet(name,OBJPROP_COLOR,tcolor);
   ObjectSetString(ChartID(),name,OBJPROP_TEXT,title);
}

void manual_button()
{   
   if(IsTesting()){
   create_button(name_buy,230,50,95,30,clrMediumBlue,clrWhite,"BUY");
   create_button(name_sell,350,50,95,30,clrCrimson,clrWhite,"SELL");  }
   create_button(name_closeall,550,50,95,30,clrGold,clrBlack,"CLOSE ALL");
}

void tester_button_act()
{
      double priceBuy = BidPrice(), priceSell = AskPrice();
      if(IsTesting()){  
      if(ObjectGetInteger(ChartID(),name_buy,OBJPROP_STATE) == 1)
      {
         Order(OP_BUY,"buy button",SetupLot(OP_BUY)); 
         ObjectSetInteger(ChartID(),name_buy,OBJPROP_STATE,0);
      }
      if(ObjectGetInteger(ChartID(),name_sell,OBJPROP_STATE) == 1)
      {
         Order(OP_SELL,"sell button",SetupLot(OP_SELL)); 
         ObjectSetInteger(ChartID(),name_sell,OBJPROP_STATE,0);
      }   }
             
       if(ObjectGetInteger(ChartID(),name_closeall,OBJPROP_STATE) == 1)
      {
      Print("Close By Button");
      CloseOrder();
      CloseOrderNoMagic();
      ObjectSetInteger(ChartID(),name_closeall,OBJPROP_STATE,0);
      }     
   
}  

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TPModifBuyNoAV()
  {
   bool q;
   int i;
   double tpbuy=0,slbuy=0;


   for(i=0; i<OrdersTotal(); i++)
     {
      if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
        {
         if(OrderType()==OP_BUY && OrderSymbol()==Symbol())
           {
            tpbuy=NormalizeDouble(OrderOpenPrice()+(TakeProfit*POINT),DIGIT);
            if(OrderTakeProfit()!=tpbuy)
              {
               q=OrderModify(OrderTicket(),OrderOpenPrice(),OrderStopLoss(),tpbuy,OrderExpiration(),clrWhite);
              }          
           }
        }
     }
 
}  

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SLModifBuyNoAV()
  {
   bool q;
   int i;
   double slbuy=0;


   for(i=0; i<OrdersTotal(); i++)
     {
      if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
        {
         if(OrderType()==OP_BUY && OrderSymbol()==Symbol())
           {
            slbuy=NormalizeDouble(OrderOpenPrice()-(StopLoss*POINT),DIGIT);
            if(OrderStopLoss()!=slbuy)
              {
               q=OrderModify(OrderTicket(),OrderOpenPrice(),slbuy,OrderTakeProfit(),OrderExpiration(),clrWhite);
              }
           }
        }
     }
  
}  
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TPModifSellNoAV()
  {
   bool q;
   int i;
   double tpsell=0;


   for(i=0; i<OrdersTotal(); i++)
     {
      if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
        {
         if(OrderType()==OP_SELL && OrderSymbol()==Symbol())
           {
            tpsell=NormalizeDouble(OrderOpenPrice()-(TakeProfit*POINT),DIGIT);
            if(OrderTakeProfit()!=tpsell)
              {
               q=OrderModify(OrderTicket(),OrderOpenPrice(),OrderStopLoss(),tpsell,OrderExpiration(),clrWhite);
              }
           }   
        }
     }
 
}  

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SLModifSellNoAV()
  {
   bool q;
   int i;
   double slsell=0;


   for(i=0; i<OrdersTotal(); i++)
     {
      if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
        {
         if(OrderType()==OP_SELL && OrderSymbol()==Symbol())
           {
            slsell=NormalizeDouble(OrderOpenPrice()+(StopLoss*POINT),DIGIT);
            if(OrderStopLoss()!=slsell)
              {
               q=OrderModify(OrderTicket(),OrderOpenPrice(),slsell,OrderTakeProfit(),OrderExpiration(),clrWhite);
              }
           }
        }
     }
 
}  
void comentbesar() {
  
   if (Seconds() >= 0 && Seconds() < 10) Warna = 255;
   if (Seconds() >= 10 && Seconds() < 20) Warna = 15631086;
   if (Seconds() >= 20 && Seconds() < 30) Warna= 42495;
   if (Seconds() >= 30 && Seconds() < 40) Warna = 16711680;
   if (Seconds() >= 40 && Seconds() < 50) Warna = 65535;
   if (Seconds() >= 50 && Seconds() <= 59) Warna = 16776960;

   ObjectCreate("EAname", OBJ_LABEL, 0, 0, 0);
   ObjectSet("EAname", OBJPROP_CORNER, 0);
   ObjectSet("EAname", OBJPROP_XDISTANCE, 50);
   ObjectSet("EAname", OBJPROP_YDISTANCE, 30+turun);
   ObjectSetText("EAname", EA_Name, 15, "Tahoma", Warna);
   
   ObjectCreate("PelangiFx20",OBJ_LABEL,0,0,0);
   ObjectSetText("PelangiFx20","Broker : "+AccountServer(),10,"Tahoma",Gold);
   ObjectSet("PelangiFx20",OBJPROP_CORNER,0);
   ObjectSet("PelangiFx20",OBJPROP_XDISTANCE,50);
   ObjectSet("PelangiFx20",OBJPROP_YDISTANCE,60+turun);

   ObjectCreate("PelangiFx21",OBJ_LABEL,0,0,0);
   ObjectSetText("PelangiFx21","Laverage  1: "+(string)AccountLeverage() + "   >>> Spread : " + (string)(MarketInfo(Symbol(),MODE_SPREAD)/PT) ,10,"Tahoma",Gold);
   ObjectSet("PelangiFx21",OBJPROP_CORNER,0);
   ObjectSet("PelangiFx21",OBJPROP_XDISTANCE,50);
   ObjectSet("PelangiFx21",OBJPROP_YDISTANCE,80+turun);

   ObjectCreate("PelangiFx22",OBJ_LABEL,0,0,0);
   ObjectSetText("PelangiFx22","Account Number   : "+(string)AccountNumber(),10,"Tahoma",Gold);
   ObjectSet("PelangiFx22",OBJPROP_CORNER,0);
   ObjectSet("PelangiFx22",OBJPROP_XDISTANCE,50);
   ObjectSet("PelangiFx22",OBJPROP_YDISTANCE,100+turun);

   ObjectCreate("PelangiFx23",OBJ_LABEL,0,0,0);
   ObjectSetText("PelangiFx23","Account Name   : "+AccountName(),10,"Tahoma",Gold);
   ObjectSet("PelangiFx23",OBJPROP_CORNER,0);
   ObjectSet("PelangiFx23",OBJPROP_XDISTANCE,50);
   ObjectSet("PelangiFx23",OBJPROP_YDISTANCE,120+turun);
   
   
   ObjectCreate("PelangiFx28",OBJ_LABEL,0,0,0);
   ObjectSetText("PelangiFx28","Balance : "+DoubleToString(AccountBalance(),2),10,"Tahoma",Gold);
   ObjectSet("PelangiFx28",OBJPROP_CORNER,0);
   ObjectSet("PelangiFx28",OBJPROP_XDISTANCE,50);
   ObjectSet("PelangiFx28",OBJPROP_YDISTANCE,140+turun);

   ObjectCreate("PelangiFx29",OBJ_LABEL,0,0,0);
   ObjectSetText("PelangiFx29","Equity : "+DoubleToString(AccountEquity(),2),10,"Tahoma",Gold);
   ObjectSet("PelangiFx29",OBJPROP_CORNER,0);
   ObjectSet("PelangiFx29",OBJPROP_XDISTANCE,50);
   ObjectSet("PelangiFx29",OBJPROP_YDISTANCE,160+turun);
 
   ObjectCreate("PelangiFx29a",OBJ_LABEL,0,0,0);
   if(TotalProfit()>0){ObjectSetText("PelangiFx29a","Profit : "+DoubleToString(TotalProfit(),2),10,"Tahoma",clrLime);}
   if(TotalProfit()<0){ObjectSetText("PelangiFx29a","Loss : "+DoubleToString(TotalProfit(),2),10,"Tahoma",clrRed);}
   if(TotalProfit()==0){ObjectSetText("PelangiFx29a","Profit/Loss : "+DoubleToString(TotalProfit(),2),10,"Tahoma",clrGold);}    
   ObjectSet("PelangiFx29a",OBJPROP_CORNER,0);
   ObjectSet("PelangiFx29a",OBJPROP_XDISTANCE,50);
   ObjectSet("PelangiFx29a",OBJPROP_YDISTANCE,180+turun);
}

