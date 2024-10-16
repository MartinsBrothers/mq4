//+------------------------------------------------------------------+
//|                                                    17.10Pips.mq4 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#include <stdlib.mqh>
#include <stderror.mqh> 
//+------------------------------------------------------------------+
//|                                                       10Pips.mq4 |
//+------------------------------------------------------------------+
//|                                 Copyright � 2013, Russian trades |
//|                                              http://rutrade.info |
//+------------------------------------------------------------------+
#property copyright "Copyright � 2013, Russian trades"
#property link      "http://rutrade.info"

//------------------------------------------
extern double   LotsFor10000      = 0.5;   // ����� �� 10000 ��������
extern int      StartHour         = 1;     // ����
extern int      EndHour           = 7;     // ������
extern int      Tries             = 2;     // ���-�� ������� �� ����� �� ��������
extern double   Multiplier        = 4;     // ��������� ������
extern int      TakeProfit        = 10;    //
extern int      StopLoss          = 30;    //
extern int      Magic             = 20131017;
extern int      Slippage          = 3;
extern string   comment           = "10Pips v1.0";
//------------------------------------------

double slope, tma_high, tma_low, 
       mlots, sl, tp, BLots;
int    retries = 5,
       _OR_err = 0,
       ticket,
       
       trailing_level,       // trailing stop
       trailing_step,        // trailing step
       stop_level,           // minimum level of the price to install a Stop Loss / Take Profit
       order_type,           // order type
       order_ticket,         // order ticket 
       orders_total;
double target, price, tstop;
double order_open_price;  // order open price
double tp_sell, tp_buy, order_stop_loss;
bool   buy_open    = false; // buy  flag
bool   sell_open   = false; // sell flag
//------------------------------------------
double bid, ask, point;
double h1, h2, h3, l1, l2, l3;
int    digits;
int    spread;
int    acount;
string info;

string Currs[] = {"EURUSD", "GBPUSD"};
//+------------------------------------------------------------------+
//| expert initialization function                                   |
//+------------------------------------------------------------------+
int init()
{
   if(Digits == 3 || Digits == 5)
   {
       BLots       = LotsFor10000;
       Slippage   *= 10;
   }
   
   return(0);
}
//+------------------------------------------------------------------+
//| expert deinitialization function                                 |
//+------------------------------------------------------------------+
int deinit()
{

   return(0);
}
//+------------------------------------------------------------------+
//| expert start function                                            |
//+------------------------------------------------------------------+
int start()
{
   if (TimeHour(TimeCurrent()) >= StartHour && TimeHour(TimeCurrent()) <= EndHour && 
       CountBuy() + CountSell() == 0)
   {
       CheckLastOrder();
       OpenSellOrder();
       OpenBuyOrder(); 
   }
   
   ModifyOrders();

   return(0);
}
//+------------------------------------------------------------------+
void CheckLastOrder()
{
   datetime last_time;
   datetime ltime = 0;
   int      aticket = 0;
       
   for(int i=OrdersHistoryTotal()-1; i>=0; i--)
   {
       if(OrderSelect(i, SELECT_BY_POS, MODE_HISTORY))
       {
          if(OrderMagicNumber() == Magic)
          {
             last_time = OrderCloseTime();
             if(last_time > ltime)
             {
                ltime  = last_time;
                aticket = OrderTicket();
             }
          }
       }
   }
   
   if(aticket == 0)
   {
      Print("����� �� ������, ticket = 0");
      Comment("����� �� ������, ticket = 0");
      LotsFor10000 = BLots;
      return;
   }
   Sleep(1000);
      
   Print("Check next lot");
   if (OrderSelect(aticket, SELECT_BY_TICKET, MODE_HISTORY))
   {
       Print("Last order selected, ticket: " + aticket); 
       Comment("Last order selected, ticket: " + aticket + ", Profit: " + OrderProfit()); 
       if (OrderProfit() < 0)
       {
          Print("Profit < 0");
          
          if (OrderLots() >= BLots*Tries)
             LotsFor10000 = BLots;
          else LotsFor10000 = NormalizeDouble(LotsFor10000 * Multiplier, 2);
       } else LotsFor10000 = BLots;
   }
   
}
//+------------------------------------------------------------------+
double GetLots()
{
   double clots;
   clots = AccountBalance()    / 10000.0 * LotsFor10000;
   clots = MathMax(clots, MarketInfo(Symbol(), MODE_MINLOT));
   clots = MathMin(clots, MarketInfo(Symbol(), MODE_MAXLOT));
   clots = NormalizeDouble(clots, 2);
   return (clots);
}
//+------------------------------------------------------------------+
void ModifyOrders()
{
   string smb;
   int asl, atp;
   
   for (int i=0; i<OrdersTotal(); i++)
   {
      if (OrderSelect(i, SELECT_BY_POS, MODE_TRADES))
      {
         if (OrderMagicNumber() == Magic && OrderSymbol() == Symbol())
         {
            smb    = OrderSymbol();
            bid    = MarketInfo(smb, MODE_BID);
            ask    = MarketInfo(smb, MODE_ASK);
            point  = MarketInfo(smb, MODE_POINT);
            digits = MarketInfo(smb, MODE_DIGITS);
            spread = MarketInfo(smb, MODE_SPREAD);
            asl    = StopLoss;
            atp    = TakeProfit;
            
            if (digits == 3 || digits == 5)
            {
               atp *= 10;
               asl *= 10;
            }
               
            if (OrderType() == OP_SELL)
            {
                sl = NormalizeDouble(OrderOpenPrice() + asl*point, digits);
                tp = NormalizeDouble(OrderOpenPrice() - atp*point, digits);
                
                if(sl != OrderStopLoss() || tp != OrderTakeProfit())
                   OrderModifyReliable(OrderTicket(), OrderOpenPrice(), sl, tp, 0);
            } 
            else if (OrderType() == OP_BUY)
            {
                sl = NormalizeDouble(OrderOpenPrice() - asl*point, digits);
                tp = NormalizeDouble(OrderOpenPrice() + atp*point, digits);
                
                if(sl != OrderStopLoss() || tp != OrderTakeProfit())
                   OrderModifyReliable(OrderTicket(), OrderOpenPrice(), sl, tp, 0);
            
            }
         }
      }
   }
}
//+------------------------------------------------------------------+
void OpenSellOrder()
{
   mlots = GetLots();
   bid = MarketInfo(Symbol(), MODE_BID);
   ticket = OrderSendReliable(Symbol(), OP_SELL,  mlots, bid, Slippage, 0, 0, comment, Magic, 0, Red);
}
//+------------------------------------------------------------------+
int OpenBuyOrder()
{
   mlots = GetLots();
   ask = MarketInfo(Symbol(), MODE_ASK);
   ticket = OrderSendReliable(Symbol(), OP_BUY,  mlots, ask, Slippage, 0, 0, comment, Magic, 0, Blue);
   return(ticket);
}
//+------------------------------------------------------------------+
int CountBuy() 
{
   int count = 0;
   for (int trade = OrdersTotal() - 1; trade >= 0; trade--) 
   {
      if (OrderSelect(trade, SELECT_BY_POS, MODE_TRADES))
      {
         if (OrderSymbol() == Symbol() && OrderMagicNumber() == Magic && OrderType() == OP_BUY)
             count++;
      }
   }
   return (count);
}
//+------------------------------------------------------------------+
int CountSell() 
{
   int count = 0;
   for (int trade = OrdersTotal() - 1; trade >= 0; trade--) 
   {
      if (OrderSelect(trade, SELECT_BY_POS, MODE_TRADES))
      {
         if (OrderSymbol() == Symbol() && OrderMagicNumber() == Magic && OrderType() == OP_SELL)
             count++;
      }
   }
   return (count);
}
//+------------------------------------------------------------------+
int OrderSendReliable(string asymbol, int cmd, double volume, double aprice,
					  int slippage, double stoploss, double takeprofit,
					  string acomment, int magic, datetime expiration = 0, 
					  color arrow_color = CLR_NONE) 
{
	int err = GetLastError(); 
	err = 0; 
	bool exit_loop = false;
	bool limit_to_market = false; 

	err = GetLastError(); 
	err = 0; 
	ticket = -1;

	if ((cmd == OP_BUY) || (cmd == OP_SELL)) 
	{
		int cnt = 0;
		while (!exit_loop) 
		{
			if (IsTradeAllowed()) 
			{
				ticket = OrderSend(asymbol, cmd, volume, aprice, slippage, 
									stoploss, takeprofit, acomment, magic, 
									expiration, arrow_color);
				err = GetLastError();
			} 
			else 
			{
				cnt++;
			} 
			switch (err) 
			{
				case ERR_NO_ERROR:
					exit_loop = true;
					break;
					
				case ERR_SERVER_BUSY:
				case ERR_NO_CONNECTION:
				case ERR_INVALID_PRICE:
				case ERR_OFF_QUOTES:
				case ERR_BROKER_BUSY:
				case ERR_TRADE_CONTEXT_BUSY: 
					cnt++;
					break;
					
				case ERR_PRICE_CHANGED:
				case ERR_REQUOTE:
					RefreshRates();
					continue; 
					
				default:
					exit_loop = true;
					break; 
					
			}  // end switch 

			if (cnt > retries) 
			 	exit_loop = true; 
			 	
			if (!exit_loop) 
			{
				Sleep(1000); 
				RefreshRates(); 
			}
			
			if (exit_loop) 
			{
				if (err != ERR_NO_ERROR) 
				{
					Print("������ : " + err); 
				}
			}
		}
		
		if (err == ERR_NO_ERROR) 
		{
			OrderSelect(ticket, SELECT_BY_TICKET, MODE_TRADES); 
			return(ticket);
		} 
		Print("������ �������� ������ ����� " + cnt + " �������.");
		Print("������ : " + err); 
		return(-1); 
	}
	return(-1);
}
//+------------------------------------------------------------------+
bool OrderModifyReliable(int aticket, double aprice, double stoploss, 
						 double takeprofit, datetime expiration, 
						 color arrow_color = CLR_NONE) 
{
	if (IsStopped()) 
	{
		Print("������, ����������: IsStopped() == true");
		return(false);
	}
	
	int cnt = 0;
	while(!IsTradeAllowed() && cnt < retries) 
	{
		Sleep(500); 
		cnt++;
	}
	if (!IsTradeAllowed()) 
	{
		Print("������: �������� ����������� - IsTradeAllowed()==false");
		_OR_err = ERR_TRADE_CONTEXT_BUSY; 
		return(false);  
	}


	
//	if (false) 
	{
		 OrderSelect(aticket, SELECT_BY_TICKET, MODE_TRADES);
		 string asymbol = OrderSymbol();
		 int adigits = MarketInfo(asymbol, MODE_DIGITS);
		 if (adigits > 0) 
		 {
			 aprice = NormalizeDouble(aprice,adigits);
			 stoploss = NormalizeDouble(stoploss,adigits);
			 takeprofit = NormalizeDouble(takeprofit,adigits); 
		 }
		 if (stoploss != 0) OrderReliable_EnsureValidStop(asymbol,aprice,stoploss); 
	}

	int err = GetLastError(); // so we clear the global variable.  
	err = 0; 
	_OR_err = 0; 
	bool exit_loop = false;
	cnt = 0;
	bool result = false;
	
	while (!exit_loop) 
	{
		if (IsTradeAllowed()) 
		{
			result = OrderModify(aticket, aprice, stoploss, 
								 takeprofit, expiration, arrow_color);
			err = GetLastError();
			_OR_err = err; 
		} 
		else 
			cnt++;

		if (result == true) 
			exit_loop = true;

		switch (err) 
		{
			case ERR_NO_ERROR:
				exit_loop = true;
				break;
				
			case ERR_NO_RESULT:
				exit_loop = true;
				break;
				
			case ERR_SERVER_BUSY:
			case ERR_NO_CONNECTION:
			case ERR_INVALID_PRICE:
			case ERR_OFF_QUOTES:
			case ERR_BROKER_BUSY:
			case ERR_TRADE_CONTEXT_BUSY: 
			case ERR_TRADE_TIMEOUT:		// for modify this is a retryable error, I hope. 
				cnt++; 	// a retryable error
				break;
				
			case ERR_PRICE_CHANGED:
			case ERR_REQUOTE:
				RefreshRates();
				continue; 	// we can apparently retry immediately according to MT docs.
				
			default:
				// an apparently serious, unretryable error.
				exit_loop = true;
				break; 
				
		}  // end switch 

		if (cnt > retries) 
			exit_loop = true; 
			
		if (!exit_loop) 
		{
			Print("������, �������:  (" + cnt + "/" + retries + 
								"): "  +  OrderReliableErrTxt(err)); 
			Sleep(500); 
			RefreshRates(); 
		}
		
		if (exit_loop) 
		{
			if ((err != ERR_NO_ERROR) && (err != ERR_NO_RESULT)) 
				Print("������: "  + OrderReliableErrTxt(err)); 
		}
	}  
	
	// we have now exited from loop. 
	if ((result == true) || (err == ERR_NO_ERROR)) 
	{
		Print("�������� �����������");
		OrderSelect(aticket, SELECT_BY_TICKET, MODE_TRADES); 
		OrderPrint(); 
		return(true); // SUCCESS! 
	} 
	
	if (err == ERR_NO_RESULT) 
	{
		return(true);
	}
	
	Print("������ ����������� ����� " + cnt + " �������");
	Print("������ �����������: "  + aticket + " " + asymbol + 
						"@" + aprice + " tp@" + takeprofit + " sl@" + stoploss); 
	Print("������ : " + OrderReliableErrTxt(err)); 
	
	return(false);  
}
//+------------------------------------------------------------------+
void OrderReliable_EnsureValidStop(string asymbol, double aprice, double& asl) 
{
	// Return if no S/L
	if (asl == 0) 
		return;
	
	double servers_min_stop = MarketInfo(asymbol, MODE_STOPLEVEL) * MarketInfo(asymbol, MODE_POINT); 
	
	if (MathAbs(aprice - asl) <= servers_min_stop) 
	{
		// we have to adjust the stop.
		if (aprice > asl)
			asl = aprice - servers_min_stop;	// we are long
			
		else if (aprice < asl)
			asl = aprice + servers_min_stop;	// we are short
			
		else
			Print("EnsureValidStop: error, passed in aprice == sl, cannot adjust"); 
			
		asl = NormalizeDouble(asl, MarketInfo(asymbol, MODE_DIGITS)); 
	}
}
//+------------------------------------------------------------------+
string OrderReliableErrTxt(int err) 
{
	return ("" + err + ":" + ErrorDescription(err)); 
}
//+------------------------------------------------------------------+


        
