/*
   Generated by EX4-TO-MQ4 decompiler V4.0.224.1 []
   Website: http://purebeam.biz
   E-mail : purebeam@gmail.com
*/
#property copyright "Copyright � 2009, Eracash.com"
#property link      "http://www.eracash.com"
#property show_inputs

extern int MMType = 1;
extern bool UseClose = FALSE;
extern bool UseAdd = TRUE;
extern double LotExponent = 1.667;
extern double slip = 3.0;
extern double Lots = 0.1;
extern double LotsDigits = 2.0;
extern double TakeProfit = 10.0;
extern double Stoploss = 500.0;
double gd_136 = 10.0;
double gd_144 = 10.0;
extern double PipStep = 30.0;
extern int MaxTrades = 10;
extern bool UseEquityStop = FALSE;
extern double TotalEquityRisk = 20.0;
extern bool UseTrailingStop = FALSE;
extern bool UseTimeOut = FALSE;
extern double MaxTradeOpenHours = 48.0;
extern bool TimeFilter = FALSE;
extern int StartHour = 2;
extern int EndHour = 16;
int g_magic_204 = 12324;
double g_price_208;
double gd_216;
double gd_unused_224;
double gd_unused_232;
double g_price_240;
double g_bid_248;
double g_ask_256;
double gd_264;
double gd_272;
double gd_288;
bool gi_296;
string gs_300 = "Robot Forex 2013";
int g_time_308 = 0;
int gi_312;
int gi_316 = 0;
double gd_320;
int g_pos_328 = 0;
int gi_332;
double gd_336 = 0.0;
bool gi_344 = FALSE;
bool gi_348 = FALSE;
bool gi_352 = FALSE;
int gi_356;
bool gi_360 = FALSE;
int g_datetime_364 = 0;
int g_datetime_368 = 0;
double gd_372;
double gd_380;

int init() {
   gd_288 = MarketInfo(Symbol(), MODE_SPREAD) * Point;
   if (IsTesting() == TRUE) Display_Info();
   if (IsTesting() == FALSE) Display_Info();
   return (0);
}

int deinit() {
   return (0);
}

int start() {
   double l_ord_lots_28;
   double l_ord_lots_36;
   double l_iclose_44;
   double l_iclose_52;
   bool l_bool_0 = IsDemo();
   if (!l_bool_0) {
      Alert("You can not use the program with a real account!");
      return (0);
   }
   string ls_4 = "false";
   string ls_12 = "false";
   if (TimeFilter == FALSE || (TimeFilter && (EndHour > StartHour && (Hour() >= StartHour && Hour() <= EndHour)) || (StartHour > EndHour && !(Hour() >= EndHour && Hour() <= StartHour)))) ls_4 = "true";
   if (TimeFilter && (EndHour > StartHour && !(Hour() >= StartHour && Hour() <= EndHour)) || (StartHour > EndHour && (Hour() >= EndHour && Hour() <= StartHour))) ls_12 = "true";
   if (UseTrailingStop) TrailingAlls(gd_136, gd_144, g_price_240);
   if (UseTimeOut) {
      if (TimeCurrent() >= gi_312) {
         CloseThisSymbolAll();
         Print("Closed All due to TimeOut");
      }
   }
   if (g_time_308 == Time[0]) return (0);
   g_time_308 = Time[0];
   double ld_20 = CalculateProfit();
   if (UseEquityStop) {
      if (ld_20 < 0.0 && MathAbs(ld_20) > TotalEquityRisk / 100.0 * AccountEquityHigh()) {
         CloseThisSymbolAll();
         Print("Closed All due to Stop Out");
         gi_360 = FALSE;
      }
   }
   gi_332 = CountTrades();
   if (gi_332 == 0) gi_296 = FALSE;
   for (g_pos_328 = OrdersTotal() - 1; g_pos_328 >= 0; g_pos_328--) {
      OrderSelect(g_pos_328, SELECT_BY_POS, MODE_TRADES);
      if (OrderSymbol() != Symbol() || OrderMagicNumber() != g_magic_204) continue;
      if (OrderSymbol() == Symbol() && OrderMagicNumber() == g_magic_204) {
         if (OrderType() == OP_BUY) {
            gi_348 = TRUE;
            gi_352 = FALSE;
            l_ord_lots_28 = OrderLots();
            break;
         }
      }
      if (OrderSymbol() == Symbol() && OrderMagicNumber() == g_magic_204) {
         if (OrderType() == OP_SELL) {
            gi_348 = FALSE;
            gi_352 = TRUE;
            l_ord_lots_36 = OrderLots();
            break;
         }
      }
   }
   if (gi_332 > 0 && gi_332 <= MaxTrades) {
      RefreshRates();
      gd_264 = FindLastBuyPrice();
      gd_272 = FindLastSellPrice();
      if (gi_348 && gd_264 - Ask >= PipStep * Point) gi_344 = TRUE;
      if (gi_352 && Bid - gd_272 >= PipStep * Point) gi_344 = TRUE;
   }
   if (gi_332 < 1) {
      gi_352 = FALSE;
      gi_348 = FALSE;
      gi_344 = TRUE;
      gd_216 = AccountEquity();
   }
   if (gi_344) {
      gd_264 = FindLastBuyPrice();
      gd_272 = FindLastSellPrice();
      if (gi_352) {
         if (UseClose || ls_12 == "true") {
            fOrderCloseMarket(0, 1);
            gd_320 = NormalizeDouble(LotExponent * l_ord_lots_36, LotsDigits);
         } else gd_320 = fGetLots(OP_SELL);
         if (UseAdd && ls_4 == "true") {
            gi_316 = gi_332;
            if (gd_320 > 0.0) {
               RefreshRates();
               gi_356 = OpenPendingOrder(1, gd_320, Bid, slip, Ask, 0, 0, gs_300 + "-" + gi_316, g_magic_204, 0, HotPink);
               if (gi_356 < 0) {
                  Print("Error: ", GetLastError());
                  return (0);
               }
               gd_272 = FindLastSellPrice();
               gi_344 = FALSE;
               gi_360 = TRUE;
            }
         }
      } else {
         if (gi_348) {
            if (UseClose || ls_12 == "true") {
               fOrderCloseMarket(1, 0);
               gd_320 = NormalizeDouble(LotExponent * l_ord_lots_28, LotsDigits);
            } else gd_320 = fGetLots(OP_BUY);
            if (UseAdd && ls_4 == "true") {
               gi_316 = gi_332;
               if (gd_320 > 0.0) {
                  gi_356 = OpenPendingOrder(0, gd_320, Ask, slip, Bid, 0, 0, gs_300 + "-" + gi_316, g_magic_204, 0, Lime);
                  if (gi_356 < 0) {
                     Print("Error: ", GetLastError());
                     return (0);
                  }
                  gd_264 = FindLastBuyPrice();
                  gi_344 = FALSE;
                  gi_360 = TRUE;
               }
            }
         }
      }
   }
   if (gi_344 && gi_332 < 1) {
      l_iclose_44 = iClose(Symbol(), 0, 2);
      l_iclose_52 = iClose(Symbol(), 0, 1);
      g_bid_248 = Bid;
      g_ask_256 = Ask;
      if (!gi_352 && !gi_348 && ls_4 == "true") {
         gi_316 = gi_332;
         if (l_iclose_44 > l_iclose_52) {
            gd_320 = fGetLots(OP_SELL);
            if (gd_320 > 0.0) {
               gi_356 = OpenPendingOrder(1, gd_320, g_bid_248, slip, g_bid_248, 0, 0, gs_300 + "-" + gi_316, g_magic_204, 0, HotPink);
               if (gi_356 < 0) {
                  Print(gd_320, "Error: ", GetLastError());
                  return (0);
               }
               gd_264 = FindLastBuyPrice();
               gi_360 = TRUE;
            }
         } else {
            gd_320 = fGetLots(OP_BUY);
            if (gd_320 > 0.0) {
               gi_356 = OpenPendingOrder(0, gd_320, g_ask_256, slip, g_ask_256, 0, 0, gs_300 + "-" + gi_316, g_magic_204, 0, Lime);
               if (gi_356 < 0) {
                  Print(gd_320, "Error: ", GetLastError());
                  return (0);
               }
               gd_272 = FindLastSellPrice();
               gi_360 = TRUE;
            }
         }
      }
      if (gi_356 > 0) gi_312 = TimeCurrent() + 60.0 * (60.0 * MaxTradeOpenHours);
      gi_344 = FALSE;
   }
   gi_332 = CountTrades();
   g_price_240 = 0;
   double ld_60 = 0;
   for (g_pos_328 = OrdersTotal() - 1; g_pos_328 >= 0; g_pos_328--) {
      OrderSelect(g_pos_328, SELECT_BY_POS, MODE_TRADES);
      if (OrderSymbol() != Symbol() || OrderMagicNumber() != g_magic_204) continue;
      if (OrderSymbol() == Symbol() && OrderMagicNumber() == g_magic_204) {
         if (OrderType() == OP_BUY || OrderType() == OP_SELL) {
            g_price_240 += OrderOpenPrice() * OrderLots();
            ld_60 += OrderLots();
         }
      }
   }
   if (gi_332 > 0) g_price_240 = NormalizeDouble(g_price_240 / ld_60, Digits);
   if (gi_360) {
      for (g_pos_328 = OrdersTotal() - 1; g_pos_328 >= 0; g_pos_328--) {
         OrderSelect(g_pos_328, SELECT_BY_POS, MODE_TRADES);
         if (OrderSymbol() != Symbol() || OrderMagicNumber() != g_magic_204) continue;
         if (OrderSymbol() == Symbol() && OrderMagicNumber() == g_magic_204) {
            if (OrderType() == OP_BUY) {
               g_price_208 = g_price_240 + TakeProfit * Point;
               gd_unused_224 = g_price_208;
               gd_336 = g_price_240 - Stoploss * Point;
               gi_296 = TRUE;
            }
         }
         if (OrderSymbol() == Symbol() && OrderMagicNumber() == g_magic_204) {
            if (OrderType() == OP_SELL) {
               g_price_208 = g_price_240 - TakeProfit * Point;
               gd_unused_232 = g_price_208;
               gd_336 = g_price_240 + Stoploss * Point;
               gi_296 = TRUE;
            }
         }
      }
   }
   if (gi_360) {
      if (gi_296 == TRUE) {
         for (g_pos_328 = OrdersTotal() - 1; g_pos_328 >= 0; g_pos_328--) {
            OrderSelect(g_pos_328, SELECT_BY_POS, MODE_TRADES);
            if (OrderSymbol() != Symbol() || OrderMagicNumber() != g_magic_204) continue;
            if (OrderSymbol() == Symbol() && OrderMagicNumber() == g_magic_204) OrderModify(OrderTicket(), g_price_240, OrderStopLoss(), g_price_208, 0, Yellow);
            gi_360 = FALSE;
         }
      }
   }
   return (0);
}

double ND(double ad_0) {
   return (NormalizeDouble(ad_0, Digits));
}

int fOrderCloseMarket(bool ai_0 = TRUE, bool ai_4 = TRUE) {
   int li_ret_8 = 0;
   for (int l_pos_12 = OrdersTotal() - 1; l_pos_12 >= 0; l_pos_12--) {
      if (OrderSelect(l_pos_12, SELECT_BY_POS, MODE_TRADES)) {
         if (OrderSymbol() == Symbol() && OrderMagicNumber() == g_magic_204) {
            if (OrderType() == OP_BUY && ai_0) {
               RefreshRates();
               if (!IsTradeContextBusy()) {
                  if (!OrderClose(OrderTicket(), OrderLots(), ND(Bid), 5, CLR_NONE)) {
                     Print("Error close BUY " + OrderTicket());
                     li_ret_8 = -1;
                  }
               } else {
                  if (g_datetime_364 != iTime(NULL, 0, 0)) {
                     g_datetime_364 = iTime(NULL, 0, 0);
                     Print("Need close BUY " + OrderTicket() + ". Trade Context Busy");
                  }
                  return (-2);
               }
            }
            if (OrderType() == OP_SELL && ai_4) {
               RefreshRates();
               if (!IsTradeContextBusy()) {
                  if (!OrderClose(OrderTicket(), OrderLots(), ND(Ask), 5, CLR_NONE)) {
                     Print("Error close SELL " + OrderTicket());
                     li_ret_8 = -1;
                  }
               } else {
                  if (g_datetime_368 != iTime(NULL, 0, 0)) {
                     g_datetime_368 = iTime(NULL, 0, 0);
                     Print("Need close SELL " + OrderTicket() + ". Trade Context Busy");
                  }
                  return (-2);
               }
            }
         }
      }
   }
   return (li_ret_8);
}

double fGetLots(int a_cmd_0) {
   double l_lots_4;
   int l_datetime_16;
   switch (MMType) {
   case 0:
      l_lots_4 = Lots;
      break;
   case 1:
      l_lots_4 = NormalizeDouble(Lots * MathPow(LotExponent, gi_316), LotsDigits);
      break;
   case 2:
      l_datetime_16 = 0;
      l_lots_4 = Lots;
      for (int l_pos_20 = OrdersHistoryTotal() - 1; l_pos_20 >= 0; l_pos_20--) {
         if (OrderSelect(l_pos_20, SELECT_BY_POS, MODE_HISTORY)) {
            if (OrderSymbol() == Symbol() && OrderMagicNumber() == g_magic_204) {
               if (l_datetime_16 < OrderCloseTime()) {
                  l_datetime_16 = OrderCloseTime();
                  if (OrderProfit() < 0.0) l_lots_4 = NormalizeDouble(OrderLots() * LotExponent, LotsDigits);
                  else l_lots_4 = Lots;
               }
            }
         } else return (-3);
      }
   }
   if (AccountFreeMarginCheck(Symbol(), a_cmd_0, l_lots_4) <= 0.0) return (-1);
   if (GetLastError() == 134/* NOT_ENOUGH_MONEY */) return (-2);
   return (l_lots_4);
}

int CountTrades() {
   int l_count_0 = 0;
   for (int l_pos_4 = OrdersTotal() - 1; l_pos_4 >= 0; l_pos_4--) {
      OrderSelect(l_pos_4, SELECT_BY_POS, MODE_TRADES);
      if (OrderSymbol() != Symbol() || OrderMagicNumber() != g_magic_204) continue;
      if (OrderSymbol() == Symbol() && OrderMagicNumber() == g_magic_204)
         if (OrderType() == OP_SELL || OrderType() == OP_BUY) l_count_0++;
   }
   return (l_count_0);
}

void CloseThisSymbolAll() {
   for (int l_pos_0 = OrdersTotal() - 1; l_pos_0 >= 0; l_pos_0--) {
      OrderSelect(l_pos_0, SELECT_BY_POS, MODE_TRADES);
      if (OrderSymbol() == Symbol()) {
         if (OrderSymbol() == Symbol() && OrderMagicNumber() == g_magic_204) {
            if (OrderType() == OP_BUY) OrderClose(OrderTicket(), OrderLots(), Bid, slip, Blue);
            if (OrderType() == OP_SELL) OrderClose(OrderTicket(), OrderLots(), Ask, slip, Red);
         }
         Sleep(1000);
      }
   }
}

int OpenPendingOrder(int ai_0, double a_lots_4, double a_price_12, int a_slippage_20, double ad_24, int ai_unused_32, int ai_36, string a_comment_40, int a_magic_48, int a_datetime_52, color a_color_56) {
   int l_ticket_60 = 0;
   int l_error_64 = 0;
   int l_count_68 = 0;
   int li_72 = 100;
   switch (ai_0) {
   case 2:
      for (l_count_68 = 0; l_count_68 < li_72; l_count_68++) {
         l_ticket_60 = OrderSend(Symbol(), OP_BUYLIMIT, a_lots_4, a_price_12, a_slippage_20, StopLong(ad_24, Stoploss), TakeLong(a_price_12, ai_36), a_comment_40, a_magic_48, a_datetime_52, a_color_56);
         l_error_64 = GetLastError();
         if (l_error_64 == 0/* NO_ERROR */) break;
         if (!(l_error_64 == 4/* SERVER_BUSY */ || l_error_64 == 137/* BROKER_BUSY */ || l_error_64 == 146/* TRADE_CONTEXT_BUSY */ || l_error_64 == 136/* OFF_QUOTES */)) break;
         Sleep(1000);
      }
      break;
   case 4:
      for (l_count_68 = 0; l_count_68 < li_72; l_count_68++) {
         l_ticket_60 = OrderSend(Symbol(), OP_BUYSTOP, a_lots_4, a_price_12, a_slippage_20, StopLong(ad_24, Stoploss), TakeLong(a_price_12, ai_36), a_comment_40, a_magic_48, a_datetime_52, a_color_56);
         l_error_64 = GetLastError();
         if (l_error_64 == 0/* NO_ERROR */) break;
         if (!(l_error_64 == 4/* SERVER_BUSY */ || l_error_64 == 137/* BROKER_BUSY */ || l_error_64 == 146/* TRADE_CONTEXT_BUSY */ || l_error_64 == 136/* OFF_QUOTES */)) break;
         Sleep(5000);
      }
      break;
   case 0:
      for (l_count_68 = 0; l_count_68 < li_72; l_count_68++) {
         RefreshRates();
         l_ticket_60 = OrderSend(Symbol(), OP_BUY, a_lots_4, Ask, a_slippage_20, StopLong(Bid, Stoploss), TakeLong(Ask, ai_36), a_comment_40, a_magic_48, a_datetime_52, a_color_56);
         l_error_64 = GetLastError();
         if (l_error_64 == 0/* NO_ERROR */) break;
         if (!(l_error_64 == 4/* SERVER_BUSY */ || l_error_64 == 137/* BROKER_BUSY */ || l_error_64 == 146/* TRADE_CONTEXT_BUSY */ || l_error_64 == 136/* OFF_QUOTES */)) break;
         Sleep(5000);
      }
      break;
   case 3:
      for (l_count_68 = 0; l_count_68 < li_72; l_count_68++) {
         l_ticket_60 = OrderSend(Symbol(), OP_SELLLIMIT, a_lots_4, a_price_12, a_slippage_20, StopShort(ad_24, Stoploss), TakeShort(a_price_12, ai_36), a_comment_40, a_magic_48, a_datetime_52, a_color_56);
         l_error_64 = GetLastError();
         if (l_error_64 == 0/* NO_ERROR */) break;
         if (!(l_error_64 == 4/* SERVER_BUSY */ || l_error_64 == 137/* BROKER_BUSY */ || l_error_64 == 146/* TRADE_CONTEXT_BUSY */ || l_error_64 == 136/* OFF_QUOTES */)) break;
         Sleep(5000);
      }
      break;
   case 5:
      for (l_count_68 = 0; l_count_68 < li_72; l_count_68++) {
         l_ticket_60 = OrderSend(Symbol(), OP_SELLSTOP, a_lots_4, a_price_12, a_slippage_20, StopShort(ad_24, Stoploss), TakeShort(a_price_12, ai_36), a_comment_40, a_magic_48, a_datetime_52, a_color_56);
         l_error_64 = GetLastError();
         if (l_error_64 == 0/* NO_ERROR */) break;
         if (!(l_error_64 == 4/* SERVER_BUSY */ || l_error_64 == 137/* BROKER_BUSY */ || l_error_64 == 146/* TRADE_CONTEXT_BUSY */ || l_error_64 == 136/* OFF_QUOTES */)) break;
         Sleep(5000);
      }
      break;
   case 1:
      for (l_count_68 = 0; l_count_68 < li_72; l_count_68++) {
         l_ticket_60 = OrderSend(Symbol(), OP_SELL, a_lots_4, Bid, a_slippage_20, StopShort(Ask, Stoploss), TakeShort(Bid, ai_36), a_comment_40, a_magic_48, a_datetime_52, a_color_56);
         l_error_64 = GetLastError();
         if (l_error_64 == 0/* NO_ERROR */) break;
         if (!(l_error_64 == 4/* SERVER_BUSY */ || l_error_64 == 137/* BROKER_BUSY */ || l_error_64 == 146/* TRADE_CONTEXT_BUSY */ || l_error_64 == 136/* OFF_QUOTES */)) break;
         Sleep(5000);
      }
   }
   return (l_ticket_60);
}

double StopLong(double ad_0, int ai_8) {
   if (ai_8 == 0) return (0);
   return (ad_0 - ai_8 * Point);
}

double StopShort(double ad_0, int ai_8) {
   if (ai_8 == 0) return (0);
   return (ad_0 + ai_8 * Point);
}

double TakeLong(double ad_0, int ai_8) {
   if (ai_8 == 0) return (0);
   return (ad_0 + ai_8 * Point);
}

double TakeShort(double ad_0, int ai_8) {
   if (ai_8 == 0) return (0);
   return (ad_0 - ai_8 * Point);
}

double CalculateProfit() {
   double ld_ret_0 = 0;
   for (g_pos_328 = OrdersTotal() - 1; g_pos_328 >= 0; g_pos_328--) {
      OrderSelect(g_pos_328, SELECT_BY_POS, MODE_TRADES);
      if (OrderSymbol() != Symbol() || OrderMagicNumber() != g_magic_204) continue;
      if (OrderSymbol() == Symbol() && OrderMagicNumber() == g_magic_204)
         if (OrderType() == OP_BUY || OrderType() == OP_SELL) ld_ret_0 += OrderProfit();
   }
   return (ld_ret_0);
}

void TrailingAlls(int ai_0, int ai_4, double a_price_8) {
   int li_16;
   double l_ord_stoploss_20;
   double l_price_28;
   if (ai_4 != 0) {
      for (int l_pos_36 = OrdersTotal() - 1; l_pos_36 >= 0; l_pos_36--) {
         if (OrderSelect(l_pos_36, SELECT_BY_POS, MODE_TRADES)) {
            if (OrderSymbol() != Symbol() || OrderMagicNumber() != g_magic_204) continue;
            if (OrderSymbol() == Symbol() || OrderMagicNumber() == g_magic_204) {
               if (OrderType() == OP_BUY) {
                  li_16 = NormalizeDouble((Bid - a_price_8) / Point, 0);
                  if (li_16 < ai_0) continue;
                  l_ord_stoploss_20 = OrderStopLoss();
                  l_price_28 = Bid - ai_4 * Point;
                  if (l_ord_stoploss_20 == 0.0 || (l_ord_stoploss_20 != 0.0 && l_price_28 > l_ord_stoploss_20)) OrderModify(OrderTicket(), a_price_8, l_price_28, OrderTakeProfit(), 0, Aqua);
               }
               if (OrderType() == OP_SELL) {
                  li_16 = NormalizeDouble((a_price_8 - Ask) / Point, 0);
                  if (li_16 < ai_0) continue;
                  l_ord_stoploss_20 = OrderStopLoss();
                  l_price_28 = Ask + ai_4 * Point;
                  if (l_ord_stoploss_20 == 0.0 || (l_ord_stoploss_20 != 0.0 && l_price_28 < l_ord_stoploss_20)) OrderModify(OrderTicket(), a_price_8, l_price_28, OrderTakeProfit(), 0, Red);
               }
            }
            Sleep(1000);
         }
      }
   }
}

double AccountEquityHigh() {
   if (CountTrades() == 0) gd_372 = AccountEquity();
   if (gd_372 < gd_380) gd_372 = gd_380;
   else gd_372 = AccountEquity();
   gd_380 = AccountEquity();
   return (gd_372);
}

double FindLastBuyPrice() {
   double l_ord_open_price_8;
   int l_ticket_24;
   double ld_unused_0 = 0;
   int l_ticket_20 = 0;
   for (int l_pos_16 = OrdersTotal() - 1; l_pos_16 >= 0; l_pos_16--) {
      OrderSelect(l_pos_16, SELECT_BY_POS, MODE_TRADES);
      if (OrderSymbol() != Symbol() || OrderMagicNumber() != g_magic_204) continue;
      if (OrderSymbol() == Symbol() && OrderMagicNumber() == g_magic_204 && OrderType() == OP_BUY) {
         l_ticket_24 = OrderTicket();
         if (l_ticket_24 > l_ticket_20) {
            l_ord_open_price_8 = OrderOpenPrice();
            ld_unused_0 = l_ord_open_price_8;
            l_ticket_20 = l_ticket_24;
         }
      }
   }
   return (l_ord_open_price_8);
}

double FindLastSellPrice() {
   double l_ord_open_price_8;
   int l_ticket_24;
   double ld_unused_0 = 0;
   int l_ticket_20 = 0;
   for (int l_pos_16 = OrdersTotal() - 1; l_pos_16 >= 0; l_pos_16--) {
      OrderSelect(l_pos_16, SELECT_BY_POS, MODE_TRADES);
      if (OrderSymbol() != Symbol() || OrderMagicNumber() != g_magic_204) continue;
      if (OrderSymbol() == Symbol() && OrderMagicNumber() == g_magic_204 && OrderType() == OP_SELL) {
         l_ticket_24 = OrderTicket();
         if (l_ticket_24 > l_ticket_20) {
            l_ord_open_price_8 = OrderOpenPrice();
            ld_unused_0 = l_ord_open_price_8;
            l_ticket_20 = l_ticket_24;
         }
      }
   }
   return (l_ord_open_price_8);
}

void Display_Info() {
   Comment("Robot Forex 2013 Profesional Demo\n", "Copyright � 2013, Eracash.com\n", "Visit: www.eracash.com\n", "This system not for sale or Share\n", "Forex Account Server:", AccountServer(), 
      "\n", "Lots:  ", Lots, 
      "\n", "Symbol: ", Symbol(), 
      "\n", "Price:  ", NormalizeDouble(Bid, 4), 
      "\n", "Date: ", Month(), "-", Day(), "-", Year(), " Server Time: ", Hour(), ":", Minute(), ":", Seconds(), 
   "\n");
}
