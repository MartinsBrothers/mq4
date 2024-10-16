//+------------------------------------------------------------------+
//|                                            37.Always in play.mq4 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                                                   BB Trading.mq4 |
//|                                Copyright � 2005-2006, David W. Thomas |
//|                                           http://www.davidwt.com |
//+------------------------------------------------------------------+
#property copyright "Copyright � 2005-2006, David W. Thomas"
#property link      "http://www.davidwt.com"
#include <stdlib.mqh>
/*
 This trades the cycle action between the Bollinger Bands during a flat market.
 Also, trades a breakout of the Bands.
*/
#define I_LIMIT_BUY     0
#define I_LIMIT_SELL    1
#define I_STOP_BUY      2
#define I_STOP_SELL     3
#define MAX_ORDER_COUNT 4

//---- input parameters
extern double    Lots=1.0;
extern int       StopLoss=15;
extern int       TakeProfit=3;         // can be smaller profit than allowed in the order's TakeProfit; either this or minimum allowed will be put into the order's takeprofit, the expert will still take profit even if its small.
extern int       hedge_gap=5;          // distance in pips of the straddle hedge orders from the cycle limit orders.
extern int       start_hour=0;         // can limit trading to between this start hour
extern int       end_hour=24;          // and this end hour, inclusive.
extern int       bb_period=20;         // Bollinger Band number of periods.
extern int       bb_deviations=2;      // Bollinger Band number of deviations.
extern int       min_bb_size=6;        // it is a suggested minimum value, if not profitable with other given parameters, it will be adjusted.
extern int       max_bb_size=20;       // maximum distance in pips of the Bollinger bands to allow trading.
extern double    max_bb_slope=1;       // maximum slope for BB MA to allow trading, in pips, though fractional can be used.
extern int       bars_for_bb_flat=2;   // minimum number of bars for the BB MA to be flat (less than max_bb_slope) to allow trading; does not count current bar.
extern int       bars_for_bb_trend=2;  // minimum number of bars for the BB MA to be trending (greater than max_bb_slope) to disallow trading and close pending orders; does not count current bar.
extern int       slippage=2;
extern bool      enter_new_trades=true;// to just manage the current orders.

//---- global variables
bool ok_to_execute_start = true;
bool hours_in_order = true;
double sllevel;
double normTakeProfit = 0;
double smallTakeProfit = 0;
double normStoploss = 0;
double slip = 0;
double hedgeGap = 0;
datetime ordertimelen = 0;
datetime minexpiration = 0;
datetime lastordersendtime =0;
int spread = 0;
int maxOfBarsForBBma = 0;
bool inFlatMode = false;
bool inTrendMode = false;
datetime curBarTime = 0;
string ordertag;
int ordertagnumber = 0xbb01;
int tickets[MAX_ORDER_COUNT];


//+------------------------------------------------------------------+
//| expert initialization function                                   |
//+------------------------------------------------------------------+
int init()
{
	string msg;
	if (StopLoss <= 0 && TakeProfit <= 0)
	{
		msg = "Both the StopLoss and TakeProfit cannot be zero (or negative), so terminating the expert.";
		Comment(msg);
		Print(msg);
		ok_to_execute_start = false;
		return(1);
	}
	if (start_hour == end_hour)
	{
		// start and end hours are equal, so set for full 24 hour trading.
		start_hour = 0;
		end_hour = 24;
	}
	hours_in_order = start_hour < end_hour;
	ordertag = "Inside BB trade " + Symbol()+ " " + Period(); // this is used to tag the orders and only maintain the orders with this tag.
	spread = MarketInfo(Symbol(), MODE_SPREAD);

	// convert from pip settings to price settings and validate parameters:
	sllevel = MarketInfo(Symbol(), MODE_STOPLEVEL);
	if (TakeProfit < 0)
		TakeProfit = 0;
	if (TakeProfit >= sllevel)
		normTakeProfit = TakeProfit*Point;
	else if (TakeProfit > 0)
		normTakeProfit = sllevel*Point;

	// may adjust the BB min/max size if not allowing a profit.
	smallTakeProfit = TakeProfit*Point;
	int min_profitable_bb_size = TakeProfit + spread + 1;
	if (min_bb_size < min_profitable_bb_size)
	{
		if (!IsTesting())
		{
			min_bb_size = min_profitable_bb_size;
			Print("Adjusted min_bb_size to ", min_bb_size, ", because it was too small to make a profit.");
		}
		else
		{
			msg = "min_bb_size=" + min_bb_size + " is not large enough to make any profit, needs to be at least " + min_profitable_bb_size + ", so terminating this expert.";
			Comment(msg);
			Print(msg);
			ok_to_execute_start = false;
			return(1);
		}
	}
	min_profitable_bb_size++;
	if (max_bb_size < min_profitable_bb_size)
	{
		if (!IsTesting())
		{
			max_bb_size = min_profitable_bb_size;
			Print("Adjusted max_bb_size to ", max_bb_size, ", because it was too small to make a profit.");
		}
		else
		{
			msg = "max_bb_size=" + max_bb_size + " is not large enough to make any profit, needs to be at least " + min_profitable_bb_size + ", so terminating this expert.";
			Comment(msg);
			Print(msg);
			ok_to_execute_start = false;
			return(1);
		}
	}
	if (min_bb_size >= max_bb_size)
	{
		if (!IsTesting())
		{
			min_bb_size = max_bb_size;
			Print("Adjusted min_bb_size to ", min_bb_size, ", because it was larger or equal to max_bb_size=",max_bb_size,".");
		}
		else
		{
			msg = "min_bb_size=" + min_bb_size + " is larger (or equal to) max_bb_size=" + max_bb_size + ", so terminating this expert.";
			Comment(msg);
			Print(msg);
			ok_to_execute_start = false;
			return(1);
		}
	}

	maxOfBarsForBBma = MathMax(bars_for_bb_flat, bars_for_bb_trend);
	max_bb_slope = max_bb_slope * Point;
	
	if (StopLoss >= sllevel)
		normStoploss = StopLoss * Point;
	else if (StopLoss > 0)
		normStoploss = sllevel * Point;
	sllevel = sllevel * Point;
	slip = slippage * Point;
	hedgeGap = hedge_gap * Point;

	// how long to keep a limit order on.  also, the expiration parameter has to be at least 30 mins.
	ordertimelen = Period()*60*2;
	if (ordertimelen < 30*60)
		minexpiration = 30*60;
	else
		minexpiration = ordertimelen + 10;  // 10 more secs, to allow the expert a chance to remove the order and its arrows.

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
	if (!ok_to_execute_start)
		return(1);

	// get Bollinger Band data.
	double bbu = iBands(NULL, 0, bb_period, bb_deviations, 0, PRICE_TYPICAL, MODE_UPPER, 0);
	double bbl = iBands(NULL, 0, bb_period, bb_deviations, 0, PRICE_TYPICAL, MODE_LOWER, 0);
	int bbsize = NormalizeDouble(bbu - bbl, Digits)/Point;
	bbu = NormalizeDouble(bbu, Digits);
	bbl = NormalizeDouble(bbl, Digits);
	Comment(ordertag,"\nBB: min=",min_bb_size," max=",max_bb_size," current=", bbsize);

	if (curBarTime != Time[0])
	{
		// test prior BB MA slopes.
		int countforallow = 0;
		int countforstop = 0;
		double priorma = iMA(NULL, 0, bb_period, 0, MODE_SMA, PRICE_TYPICAL, maxOfBarsForBBma+1);
		double curma;
		for (int n = maxOfBarsForBBma; n > 0; n--)
		{
			curma = iMA(NULL, 0, bb_period, 0, MODE_SMA, PRICE_TYPICAL, n);
			if (MathAbs(curma - priorma) <= max_bb_slope)
			{
				if (n <= bars_for_bb_flat)
					countforallow++;
			}
			else
			{
				if (n <= bars_for_bb_trend)
					countforstop++;
			}
		}
		inFlatMode = countforallow >= bars_for_bb_flat;
		inTrendMode = countforstop >= bars_for_bb_trend;
		curBarTime = Time[0];
	}

	double entryprice, tp, sl, pricediff;

	// handle the current orders.
	for (int i = 0; i < MAX_ORDER_COUNT; i++)
	{
		if (tickets[i] > 0 && OrderSelect(tickets[i], SELECT_BY_TICKET))
		{
			if (OrderCloseTime() != 0)
				tickets[i] = 0;
			else if (CurTime() - OrderOpenTime() > ordertimelen || bbsize > max_bb_size || inTrendMode)
				DeleteOrder();
		}
	}
	if (tickets[I_LIMIT_BUY] > 0 && OrderSelect(tickets[I_LIMIT_BUY], SELECT_BY_TICKET))
	{
		if (OrderType() == OP_BUY)
		{
			pricediff = Bid - OrderOpenPrice();
			if (TakeProfit > 0 && pricediff >= smallTakeProfit || inTrendMode)
			{	// small takeprofit execution.
				OrderClose(tickets[I_LIMIT_BUY], Lots, Bid, slippage, Blue);
				tickets[I_LIMIT_BUY] = 0;
			}
			else if (normStoploss > 0 && pricediff > normStoploss && OrderStopLoss() < (Bid - normStoploss))
			{	// move the stoploss as a trailing stop.
				OrderModify(tickets[I_LIMIT_BUY], OrderOpenPrice(), Bid - normStoploss, OrderTakeProfit(), OrderExpiration(), Blue);
			}
		}
	}
	if (tickets[I_LIMIT_SELL] > 0 && OrderSelect(tickets[I_LIMIT_SELL], SELECT_BY_TICKET))
	{
		if (OrderType() == OP_SELL)
		{
			pricediff = OrderOpenPrice() - Ask;
			if (TakeProfit > 0 && pricediff >= smallTakeProfit || inTrendMode)
			{	// small takeprofit execution.
				OrderClose(tickets[I_LIMIT_SELL], Lots, Ask, slippage, Red);
				tickets[I_LIMIT_SELL] = 0;
			}
			else if (normStoploss > 0 && pricediff > normStoploss && OrderStopLoss() > (Ask + normStoploss))
			{	// move the stoploss as a trailing stop.
				OrderModify(tickets[I_LIMIT_SELL], OrderOpenPrice(), Ask + normStoploss, OrderTakeProfit(), OrderExpiration(), Red);
			}
		}
	}
	if (tickets[I_STOP_BUY] > 0 && OrderSelect(tickets[I_STOP_BUY], SELECT_BY_TICKET))
	{
		if (OrderType() == OP_BUY)
		{
			pricediff = Bid - OrderOpenPrice();
			sl = OrderOpenPrice() - OrderStopLoss();
			if (OrderStopLoss() > 0 && pricediff > sl && OrderStopLoss() < (Bid - sl))
			{	// move the stoploss as a trailing stop.
				OrderModify(tickets[I_STOP_BUY], OrderOpenPrice(), Bid - sl, OrderTakeProfit(), OrderExpiration(), Blue);
			}
		}
	}
	if (tickets[I_STOP_SELL] > 0 && OrderSelect(tickets[I_STOP_SELL], SELECT_BY_TICKET))
	{
		if (OrderType() == OP_SELL)
		{
			pricediff = OrderOpenPrice() - Ask;
			sl = OrderStopLoss() - OrderOpenPrice();
			if (OrderStopLoss() > 0 && pricediff > sl && OrderStopLoss() > (Ask + sl))
			{	// move the stoploss as a trailing stop.
				OrderModify(tickets[I_STOP_SELL], OrderOpenPrice(), Ask + sl, OrderTakeProfit(), OrderExpiration(), Red);
			}
		}
	}

	// check conditions for possibly initiating new order.
	if (!enter_new_trades)
		return(0);
	int curhour = TimeHour(CurTime());
	if (hours_in_order)
	{
		if (curhour > end_hour || curhour < start_hour)
		{
			Comment("Not trading because its outside of the specified hours.");
			return(0);
		}
	}
	else if (curhour > end_hour && curhour < start_hour)
	{
		Comment("Not trading because its outside of the specified hours.");
		return(0);
	}

	if (bbsize < min_bb_size || bbsize > max_bb_size || !inFlatMode)
	{
		Comment(ordertag,"\nBB: min=",min_bb_size," max=",max_bb_size," current=", bbsize,". Not trading.");
		return(0);
	}
	//if (CurTime() - lastordersendtime < 6)
	//	return(0);

	if (tickets[I_LIMIT_BUY] <= 0)
	{
		// setup the buy order.
		entryprice = bbl + 1*Point;
		if (normTakeProfit > 0)
			tp = entryprice + normTakeProfit;
		else
			tp = 0;
		if (normStoploss > 0)
			sl = entryprice - normStoploss;
		else
			sl = 0;
		tickets[I_LIMIT_BUY] = SendOrder(OP_BUYLIMIT, entryprice, sl, tp);
	}
	if (tickets[I_LIMIT_SELL] <= 0)
	{
		// setup the sell order.
		entryprice = bbu - 1*Point;
		if (normTakeProfit > 0)
			tp = entryprice - normTakeProfit;
		else
			tp = 0;
		if (normStoploss > 0)
			sl = entryprice + normStoploss;
		else
			sl = 0;
		tickets[I_LIMIT_SELL] = SendOrder(OP_SELLLIMIT, entryprice, sl, tp);
	}
	if (tickets[I_STOP_BUY] <= 0 && tickets[I_LIMIT_SELL] > 0 && OrderSelect(tickets[I_LIMIT_SELL], SELECT_BY_TICKET))
	{
		entryprice = OrderOpenPrice() + hedgeGap;
		if (normTakeProfit > 0)	// just checking if going to use a trailing stop instead of take profit.
			tp = entryprice + normStoploss;	// intentionally using stoploss to recover the limit order loss.
		else
			tp = 0;
		if (normStoploss > 0) // just checking to see if any stoploss should be used.
		{
			if (normTakeProfit > 0)
				sl = entryprice - normTakeProfit; // intentionally using takeprofit of limit order to be sure this loss doesn't over shoot the takeprofit of the limit order.
			else
				sl = entryprice - normStoploss;
		}
		else
			sl = 0;
		tickets[I_STOP_BUY] = SendOrder(OP_BUYSTOP, entryprice, sl, tp);
	}
	if (tickets[I_STOP_SELL] <= 0 && tickets[I_LIMIT_BUY] > 0 && OrderSelect(tickets[I_LIMIT_BUY], SELECT_BY_TICKET))
	{
		entryprice = OrderOpenPrice() - hedgeGap;
		if (normTakeProfit > 0)	// just checking if going to use a trailing stop instead of take profit.
			tp = entryprice - normStoploss;	// intentionally using stoploss to recover the limit order loss.
		else
			tp = 0;
		if (normStoploss > 0) // just checking to see if any stoploss should be used.
		{
			if (normTakeProfit > 0)
				sl = entryprice + normTakeProfit; // intentionally using takeprofit of limit order to be sure this loss doesn't over shoot the takeprofit of the limit order.
			else
				sl = entryprice + normStoploss;
		}
		else
			sl = 0;
		tickets[I_STOP_SELL] = SendOrder(OP_SELLSTOP, entryprice, sl, tp);
	}

	return(0);
}

//+---------------------------------------------------------------------+
//| function to put in an entry order or market order if price too close|
//+---------------------------------------------------------------------+
int SendOrder(int type, double price, double sl, double tp)
{
	int markettype;
	color arrow_color;
	double currentprice;
	switch (type)
	{
		case OP_BUYLIMIT:
		case OP_BUYSTOP:
			markettype = OP_BUY;
			arrow_color = Blue;
			currentprice = Ask;
			break;
		case OP_SELLLIMIT:
		case OP_SELLSTOP:
			markettype = OP_SELL;
			arrow_color = Red;
			currentprice = Bid;
			break;
		default:
			return(0);
	}
	int ticket = 0;
	if (MathAbs(price - currentprice) <= sllevel)
	{  // cannot put in a limit order to close to the price, so only try for a market order.
		if (MathAbs(price - currentprice) <= slip)
		{  // if the price is within the slippage distance, put in a market order.
			ticket = OrderSend(Symbol(), markettype, Lots, price, slippage, sl, tp, ordertag, ordertagnumber, 0, arrow_color);
			lastordersendtime = CurTime();
		}
	}
	else
	{
		ticket = OrderSend(Symbol(), type, Lots, price, slippage, sl, tp, ordertag, ordertagnumber, CurTime()+minexpiration, arrow_color);
		lastordersendtime = CurTime();
	}
	return(ticket);
}

//+------------------------------------------------------------------+
//| function to not only delete order, but remove objects for it     |
//+------------------------------------------------------------------+
void DeleteOrder()
{
	int ticket = OrderTicket();
	string pre = "#" + ticket + " ";
	string post;
	switch (OrderType())
	{
		case OP_BUYLIMIT:
			post = "buy limit";
			tickets[I_LIMIT_BUY] = 0;
			break;
		case OP_SELLLIMIT:
			post = "sell limit";
	  		tickets[I_LIMIT_SELL] = 0;
			break;
		case OP_BUYSTOP:
			post = "buy stop";
	  		tickets[I_STOP_BUY] = 0;
			break;
		case OP_SELLSTOP:
			post = "sell stop";
			break;
		default:
			return;
	}
	OrderDelete(ticket);
	// only want to keep the arrows for orders that are filled, so remove
	// those that are not filled, since they clutter the chart.
	ObjectDelete(pre + post);
	ObjectDelete(pre + "sl");
	ObjectDelete(pre + "tp");
}

//+------------------------------------------------------------------+


        
