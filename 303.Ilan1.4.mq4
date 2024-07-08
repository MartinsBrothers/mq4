/*
   Generated by EX4-TO-MQ4 decompiler V4.0.224.1 []
   Website: http://beam.to/betsafe
   BETSAFE
*/
#property copyright "BETSAFE"
#property link      "http://beam.to/betsafe"

extern int MMType = 1;
extern bool UseClose = FALSE;
extern bool UseAdd = TRUE;
extern double LotExponent = 1.667;
extern double slip = 3.0;
extern double Lots = 0.1;
extern double LotsDigits = 2.0;
extern double TakeProfit = 10.0;
double g_pips_128 = 500.0;
double gd_136 = 10.0;
double gd_144 = 10.0;
extern double PipStep = 30.0;
extern int MaxTrades = 10;
extern bool UseEquityStop = FALSE;
extern double TotalEquityRisk = 20.0;
extern bool UseTrailingStop = FALSE;
extern bool UseTimeOut = FALSE;
extern double MaxTradeOpenHours = 48.0;
int g_magic_192 = 12324;
double g_price_196;
double gd_204;
double gd_unused_212;
double gd_unused_220;
double g_price_228;
double g_bid_236;
double g_ask_244;
double gd_252;
double gd_260;
double gd_276;
bool gi_284;
string gs_288 = "Ilan1/4";
int g_time_296 = 0;
int gi_300;
int gi_304 = 0;
double gd_308;
int g_pos_316 = 0;
int gi_320;
double gd_324 = 0.0;
bool gi_332 = FALSE;
bool gi_336 = FALSE;
bool gi_340 = FALSE;
int gi_344;
bool gi_348 = FALSE;
int g_datetime_352 = 0;
int g_datetime_356 = 0;
double gd_360;
double gd_368;

int init() {
   gd_276 = MarketInfo(Symbol(), MODE_SPREAD) * Point;
   return (0);
}

int deinit() {
   return (0);
}

int start() {
   double l_ord_lots_8;
   double l_ord_lots_16;
   double l_iclose_24;
   double l_iclose_32;
   if (UseTrailingStop) TrailingAlls(gd_136, gd_144, g_price_228);
   if (UseTimeOut) {
      if (TimeCurrent() >= gi_300) {
         CloseThisSymbolAll();
         Print("Closed All due to TimeOut");
      }
   }
   if (g_time_296 == Time[0]) return (0);
   g_time_296 = Time[0];
   double ld_0 = CalculateProfit();
   if (UseEquityStop) {
      if (ld_0 < 0.0 && MathAbs(ld_0) > TotalEquityRisk / 100.0 * AccountEquityHigh()) {
         CloseThisSymbolAll();
         Print("Closed All due to Stop Out");
         gi_348 = FALSE;
      }
   }
   gi_320 = CountTrades();
   if (gi_320 == 0) gi_284 = FALSE;
   for (g_pos_316 = OrdersTotal() - 1; g_pos_316 >= 0; g_pos_316--) {
      OrderSelect(g_pos_316, SELECT_BY_POS, MODE_TRADES);
      if (OrderSymbol() != Symbol() || OrderMagicNumber() != g_magic_192) continue;
      if (OrderSymbol() == Symbol() && OrderMagicNumber() == g_magic_192) {
         if (OrderType() == OP_BUY) {
            gi_336 = TRUE;
            gi_340 = FALSE;
            l_ord_lots_8 = OrderLots();
            break;
         }
      }
      if (OrderSymbol() == Symbol() && OrderMagicNumber() == g_magic_192) {
         if (OrderType() == OP_SELL) {
            gi_336 = FALSE;
            gi_340 = TRUE;
            l_ord_lots_16 = OrderLots();
            break;
         }
      }
   }
   if (gi_320 > 0 && gi_320 <= MaxTrades) {
      RefreshRates();
      gd_252 = FindLastBuyPrice();
      gd_260 = FindLastSellPrice();
      if (gi_336 && gd_252 - Ask >= PipStep * Point) gi_332 = TRUE;
      if (gi_340 && Bid - gd_260 >= PipStep * Point) gi_332 = TRUE;
   }
   if (gi_320 < 1) {
      gi_340 = FALSE;
      gi_336 = FALSE;
      gi_332 = TRUE;
      gd_204 = AccountEquity();
   }
   if (gi_332) {
      gd_252 = FindLastBuyPrice();
      gd_260 = FindLastSellPrice();
      if (gi_340) {
         if (UseClose) {
            fOrderCloseMarket(0, 1);
            gd_308 = NormalizeDouble(LotExponent * l_ord_lots_16, LotsDigits);
         } else gd_308 = fGetLots(OP_SELL);
         if (UseAdd) {
            gi_304 = gi_320;
            if (gd_308 > 0.0) {
               RefreshRates();
               gi_344 = OpenPendingOrder(1, gd_308, Bid, slip, Ask, 0, 0, gs_288 + "-" + gi_304, g_magic_192, 0, HotPink);
               if (gi_344 < 0) {
                  Print("Error: ", GetLastError());
                  return (0);
               }
               gd_260 = FindLastSellPrice();
               gi_332 = FALSE;
               gi_348 = TRUE;
            }
         }
      } else {
         if (gi_336) {
            if (UseClose) {
               fOrderCloseMarket(1, 0);
               gd_308 = NormalizeDouble(LotExponent * l_ord_lots_8, LotsDigits);
            } else gd_308 = fGetLots(OP_BUY);
            if (UseAdd) {
               gi_304 = gi_320;
               if (gd_308 > 0.0) {
                  gi_344 = OpenPendingOrder(0, gd_308, Ask, slip, Bid, 0, 0, gs_288 + "-" + gi_304, g_magic_192, 0, Lime);
                  if (gi_344 < 0) {
                     Print("Error: ", GetLastError());
                     return (0);
                  }
                  gd_252 = FindLastBuyPrice();
                  gi_332 = FALSE;
                  gi_348 = TRUE;
               }
            }
         }
      }
   }
   if (gi_332 && gi_320 < 1) {
      l_iclose_24 = iClose(Symbol(), 0, 2);
      l_iclose_32 = iClose(Symbol(), 0, 1);
      g_bid_236 = Bid;
      g_ask_244 = Ask;
      if (!gi_340 && !gi_336) {
         gi_304 = gi_320;
         if (l_iclose_24 > l_iclose_32) {
            gd_308 = fGetLots(OP_SELL);
            if (gd_308 > 0.0) {
               gi_344 = OpenPendingOrder(1, gd_308, g_bid_236, slip, g_bid_236, 0, 0, gs_288 + "-" + gi_304, g_magic_192, 0, HotPink);
               if (gi_344 < 0) {
                  Print(gd_308, "Error: ", GetLastError());
                  return (0);
               }
               gd_252 = FindLastBuyPrice();
               gi_348 = TRUE;
            }
         } else {
            gd_308 = fGetLots(OP_BUY);
            if (gd_308 > 0.0) {
               gi_344 = OpenPendingOrder(0, gd_308, g_ask_244, slip, g_ask_244, 0, 0, gs_288 + "-" + gi_304, g_magic_192, 0, Lime);
               if (gi_344 < 0) {
                  Print(gd_308, "Error: ", GetLastError());
                  return (0);
               }
               gd_260 = FindLastSellPrice();
               gi_348 = TRUE;
            }
         }
      }
      if (gi_344 > 0) gi_300 = TimeCurrent() + 60.0 * (60.0 * MaxTradeOpenHours);
      gi_332 = FALSE;
   }
   gi_320 = CountTrades();
   g_price_228 = 0;
   double ld_40 = 0;
   for (g_pos_316 = OrdersTotal() - 1; g_pos_316 >= 0; g_pos_316--) {
      OrderSelect(g_pos_316, SELECT_BY_POS, MODE_TRADES);
      if (OrderSymbol() != Symbol() || OrderMagicNumber() != g_magic_192) continue;
      if (OrderSymbol() == Symbol() && OrderMagicNumber() == g_magic_192) {
         if (OrderType() == OP_BUY || OrderType() == OP_SELL) {
            g_price_228 += OrderOpenPrice() * OrderLots();
            ld_40 += OrderLots();
         }
      }
   }
   if (gi_320 > 0) g_price_228 = NormalizeDouble(g_price_228 / ld_40, Digits);
   if (gi_348) {
      for (g_pos_316 = OrdersTotal() - 1; g_pos_316 >= 0; g_pos_316--) {
         OrderSelect(g_pos_316, SELECT_BY_POS, MODE_TRADES);
         if (OrderSymbol() != Symbol() || OrderMagicNumber() != g_magic_192) continue;
         if (OrderSymbol() == Symbol() && OrderMagicNumber() == g_magic_192) {
            if (OrderType() == OP_BUY) {
               g_price_196 = g_price_228 + TakeProfit * Point;
               gd_unused_212 = g_price_196;
               gd_324 = g_price_228 - g_pips_128 * Point;
               gi_284 = TRUE;
            }
         }
         if (OrderSymbol() == Symbol() && OrderMagicNumber() == g_magic_192) {
            if (OrderType() == OP_SELL) {
               g_price_196 = g_price_228 - TakeProfit * Point;
               gd_unused_220 = g_price_196;
               gd_324 = g_price_228 + g_pips_128 * Point;
               gi_284 = TRUE;
            }
         }
      }
   }
   if (gi_348) {
      if (gi_284 == TRUE) {
         for (g_pos_316 = OrdersTotal() - 1; g_pos_316 >= 0; g_pos_316--) {
            OrderSelect(g_pos_316, SELECT_BY_POS, MODE_TRADES);
            if (OrderSymbol() != Symbol() || OrderMagicNumber() != g_magic_192) continue;
            if (OrderSymbol() == Symbol() && OrderMagicNumber() == g_magic_192) OrderModify(OrderTicket(), g_price_228, OrderStopLoss(), g_price_196, 0, Yellow);
            gi_348 = FALSE;
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
         if (OrderSymbol() == Symbol() && OrderMagicNumber() == g_magic_192) {
            if (OrderType() == OP_BUY && ai_0) {
               RefreshRates();
               if (!IsTradeContextBusy()) {
                  if (!OrderClose(OrderTicket(), OrderLots(), ND(Bid), 5, CLR_NONE)) {
                     Print("Error close BUY " + OrderTicket());
                     li_ret_8 = -1;
                  }
               } else {
                  if (g_datetime_352 != iTime(NULL, 0, 0)) {
                     g_datetime_352 = iTime(NULL, 0, 0);
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
                  if (g_datetime_356 != iTime(NULL, 0, 0)) {
                     g_datetime_356 = iTime(NULL, 0, 0);
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
      l_lots_4 = NormalizeDouble(Lots * MathPow(LotExponent, gi_304), LotsDigits);
      break;
   case 2:
      l_datetime_16 = 0;
      l_lots_4 = Lots;
      for (int l_pos_20 = OrdersHistoryTotal() - 1; l_pos_20 >= 0; l_pos_20--) {
         if (OrderSelect(l_pos_20, SELECT_BY_POS, MODE_HISTORY)) {
            if (OrderSymbol() == Symbol() && OrderMagicNumber() == g_magic_192) {
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
      if (OrderSymbol() != Symbol() || OrderMagicNumber() != g_magic_192) continue;
      if (OrderSymbol() == Symbol() && OrderMagicNumber() == g_magic_192)
         if (OrderType() == OP_SELL || OrderType() == OP_BUY) l_count_0++;
   }
   return (l_count_0);
}

void CloseThisSymbolAll() {
   for (int l_pos_0 = OrdersTotal() - 1; l_pos_0 >= 0; l_pos_0--) {
      OrderSelect(l_pos_0, SELECT_BY_POS, MODE_TRADES);
      if (OrderSymbol() == Symbol()) {
         if (OrderSymbol() == Symbol() && OrderMagicNumber() == g_magic_192) {
            if (OrderType() == OP_BUY) OrderClose(OrderTicket(), OrderLots(), Bid, slip, Blue);
            if (OrderType() == OP_SELL) OrderClose(OrderTicket(), OrderLots(), Ask, slip, Red);
         }
         Sleep(1000);
      }
   }
}

int OpenPendingOrder(int ai_0, double a_lots_4, double a_price_12, int a_slippage_20, double ad_24, int ai_32, int ai_36, string a_comment_40, int a_magic_48, int a_datetime_52, color a_color_56) {
   int l_ticket_60 = 0;
   int l_error_64 = 0;
   int l_count_68 = 0;
   int li_72 = 100;
   switch (ai_0) {
   case 2:
      for (l_count_68 = 0; l_count_68 < li_72; l_count_68++) {
         l_ticket_60 = OrderSend(Symbol(), OP_BUYLIMIT, a_lots_4, a_price_12, a_slippage_20, StopLong(ad_24, ai_32), TakeLong(a_price_12, ai_36), a_comment_40, a_magic_48, a_datetime_52, a_color_56);
         l_error_64 = GetLastError();
         if (l_error_64 == 0/* NO_ERROR */) break;
         if (!(l_error_64 == 4/* SERVER_BUSY */ || l_error_64 == 137/* BROKER_BUSY */ || l_error_64 == 146/* TRADE_CONTEXT_BUSY */ || l_error_64 == 136/* OFF_QUOTES */)) break;
         Sleep(1000);
      }
      break;
   case 4:
      for (l_count_68 = 0; l_count_68 < li_72; l_count_68++) {
         l_ticket_60 = OrderSend(Symbol(), OP_BUYSTOP, a_lots_4, a_price_12, a_slippage_20, StopLong(ad_24, ai_32), TakeLong(a_price_12, ai_36), a_comment_40, a_magic_48, a_datetime_52, a_color_56);
         l_error_64 = GetLastError();
         if (l_error_64 == 0/* NO_ERROR */) break;
         if (!(l_error_64 == 4/* SERVER_BUSY */ || l_error_64 == 137/* BROKER_BUSY */ || l_error_64 == 146/* TRADE_CONTEXT_BUSY */ || l_error_64 == 136/* OFF_QUOTES */)) break;
         Sleep(5000);
      }
      break;
   case 0:
      for (l_count_68 = 0; l_count_68 < li_72; l_count_68++) {
         RefreshRates();
         l_ticket_60 = OrderSend(Symbol(), OP_BUY, a_lots_4, Ask, a_slippage_20, StopLong(Bid, ai_32), TakeLong(Ask, ai_36), a_comment_40, a_magic_48, a_datetime_52, a_color_56);
         l_error_64 = GetLastError();
         if (l_error_64 == 0/* NO_ERROR */) break;
         if (!(l_error_64 == 4/* SERVER_BUSY */ || l_error_64 == 137/* BROKER_BUSY */ || l_error_64 == 146/* TRADE_CONTEXT_BUSY */ || l_error_64 == 136/* OFF_QUOTES */)) break;
         Sleep(5000);
      }
      break;
   case 3:
      for (l_count_68 = 0; l_count_68 < li_72; l_count_68++) {
         l_ticket_60 = OrderSend(Symbol(), OP_SELLLIMIT, a_lots_4, a_price_12, a_slippage_20, StopShort(ad_24, ai_32), TakeShort(a_price_12, ai_36), a_comment_40, a_magic_48, a_datetime_52, a_color_56);
         l_error_64 = GetLastError();
         if (l_error_64 == 0/* NO_ERROR */) break;
         if (!(l_error_64 == 4/* SERVER_BUSY */ || l_error_64 == 137/* BROKER_BUSY */ || l_error_64 == 146/* TRADE_CONTEXT_BUSY */ || l_error_64 == 136/* OFF_QUOTES */)) break;
         Sleep(5000);
      }
      break;
   case 5:
      for (l_count_68 = 0; l_count_68 < li_72; l_count_68++) {
         l_ticket_60 = OrderSend(Symbol(), OP_SELLSTOP, a_lots_4, a_price_12, a_slippage_20, StopShort(ad_24, ai_32), TakeShort(a_price_12, ai_36), a_comment_40, a_magic_48, a_datetime_52, a_color_56);
         l_error_64 = GetLastError();
         if (l_error_64 == 0/* NO_ERROR */) break;
         if (!(l_error_64 == 4/* SERVER_BUSY */ || l_error_64 == 137/* BROKER_BUSY */ || l_error_64 == 146/* TRADE_CONTEXT_BUSY */ || l_error_64 == 136/* OFF_QUOTES */)) break;
         Sleep(5000);
      }
      break;
   case 1:
      for (l_count_68 = 0; l_count_68 < li_72; l_count_68++) {
         l_ticket_60 = OrderSend(Symbol(), OP_SELL, a_lots_4, Bid, a_slippage_20, StopShort(Ask, ai_32), TakeShort(Bid, ai_36), a_comment_40, a_magic_48, a_datetime_52, a_color_56);
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
   for (g_pos_316 = OrdersTotal() - 1; g_pos_316 >= 0; g_pos_316--) {
      OrderSelect(g_pos_316, SELECT_BY_POS, MODE_TRADES);
      if (OrderSymbol() != Symbol() || OrderMagicNumber() != g_magic_192) continue;
      if (OrderSymbol() == Symbol() && OrderMagicNumber() == g_magic_192)
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
            if (OrderSymbol() != Symbol() || OrderMagicNumber() != g_magic_192) continue;
            if (OrderSymbol() == Symbol() || OrderMagicNumber() == g_magic_192) {
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
   if (CountTrades() == 0) gd_360 = AccountEquity();
   if (gd_360 < gd_368) gd_360 = gd_368;
   else gd_360 = AccountEquity();
   gd_368 = AccountEquity();
   return (gd_360);
}

double FindLastBuyPrice() {
   double l_ord_open_price_8;
   int l_ticket_24;
   double ld_unused_0 = 0;
   int l_ticket_20 = 0;
   for (int l_pos_16 = OrdersTotal() - 1; l_pos_16 >= 0; l_pos_16--) {
      OrderSelect(l_pos_16, SELECT_BY_POS, MODE_TRADES);
      if (OrderSymbol() != Symbol() || OrderMagicNumber() != g_magic_192) continue;
      if (OrderSymbol() == Symbol() && OrderMagicNumber() == g_magic_192 && OrderType() == OP_BUY) {
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
      if (OrderSymbol() != Symbol() || OrderMagicNumber() != g_magic_192) continue;
      if (OrderSymbol() == Symbol() && OrderMagicNumber() == g_magic_192 && OrderType() == OP_SELL) {
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
        
