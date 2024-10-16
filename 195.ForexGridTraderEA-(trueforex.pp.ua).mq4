//+------------------------------------------------------------------+
//|                      195.ForexGridTraderEA-(trueforex.pp.ua).mq4 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2020, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
/*
   G e n e r a t e d  by ex4-to-mq4 decompiler FREEWARE 4.0.509.5
   Website:  h T tP: //ww W.mE T AQ UO tEs .nE t
   E-mail : S UP poR T@M E tA QUoT e s .NeT
*/
#property copyright "Fxsourcecode � 2012, Forex Source Code Inc."
#property link      "http://www.forexsourcecode.net"

extern bool ShowTradeComment = TRUE;
extern double Lots = 0.02;
extern double MultiLotsFactor = 1.6;
extern double StepLots = 15.0;
extern double TakeProfit = 23.0;
extern bool UseTrailing = FALSE;
extern double TrailStart = 38.0;
extern double TrailStop = 18.0;
extern int MaxOpenOrders = 15;
extern bool SafeEquityStopOut = FALSE;
extern double SafeEquityRisk = 0.5;
extern double Slippage = 3.0;
extern int MagicNumber = 2024536;
extern string TradeComment = "FxGridTraderEA";
bool Gi_168 = FALSE;
double Gd_172 = 48.0;
double G_pips_180 = 500.0;
double Gd_188 = 0.0;
bool Gi_196 = TRUE;
bool Gi_200 = FALSE;
int Gi_204 = 1;
double G_price_208;
double Gd_216;
double G_price_224;
double G_bid_232;
double G_ask_240;
double Gd_248;
double Gd_256;
double Gd_264;
bool Gi_272;
datetime G_time_276 = 0;
int Gi_280;
int Gi_284 = 0;
double Gd_288;
int G_pos_296 = 0;
int Gi_300;
double Gd_304 = 0.0;
bool Gi_312 = FALSE;
bool Gi_316 = FALSE;
bool Gi_320 = FALSE;
int Gi_324;
bool Gi_328 = FALSE;
int G_datetime_332 = 0;
int G_datetime_336 = 0;
double Gd_340;
double Gd_348;
string Gs_off_356 = "OFF";
string Gs_live_364 = "LIVE";
string Gs_372 = "";
bool Gi_unused_380 = TRUE;
bool Gi_unused_384 = TRUE;
int G_acc_number_388 = 0;
int Gi_392;

// E37F0136AA3FFAF149B351F6A4C948E9
int init() {
   if (Digits == 2 || Digits == 4) Gi_392 = 1;
   else Gi_392 = 10;
   G_acc_number_388 = AccountNumber();
   Gd_264 = MarketInfo(Symbol(), MODE_SPREAD) * Point * Gi_392;
//   switch (MarketInfo(Symbol(), MODE_MINLOT)) {
//   case 0.001:
//      Gd_188 = 3;
//      break;
//   case 0.01:
      Gd_188 = 2;
//      break;
//   case 0.1:
//      Gd_188 = 1;
//      break;
 //  case 1.0:
//      Gd_188 = 0;
 //  }
   if (SafeEquityStopOut) Gs_off_356 = "ON";
   if (IsDemo()) Gs_live_364 = "DEMO";
   if (Period() != PERIOD_M1) {
      Print("FGT ERROR :: Invalid Timeframe, Please switch to M1.");
      Alert("FGT ERROR :: ", " Invalid Timeframe, Please switch to M1.");
      Gs_372 = "Invalid Timeframe. FGT works on M1";
      Gi_unused_380 = FALSE;
   }
   if (IsDllsAllowed() == FALSE) {
      Print("FGT ERROR :: DLL call is not allowed. Experts cannot run.");
      Alert("FGT ERROR :: ", " Please Allow DLL call.");
      Gs_372 = "FGT ERROR :: Please Allow DLL call.";
      Gi_unused_384 = FALSE;
      return (0);
   }
   return (0);
}

// 52D46093050F38C27267BCE42543EF60
int deinit() {
   Comment("");
   if (ObjectFind("BG") >= 0) ObjectDelete("BG");
   if (ObjectFind("BG1") >= 0) ObjectDelete("BG1");
   if (ObjectFind("BG2") >= 0) ObjectDelete("BG2");
   if (ObjectFind("BG3") >= 0) ObjectDelete("BG3");
   if (ObjectFind("BG4") >= 0) ObjectDelete("BG4");
   if (ObjectFind("BG5") >= 0) ObjectDelete("BG5");
   if (ObjectFind("NAME") >= 0) ObjectDelete("NAME");
   return (0);
}

// EA2B2676C28C0DB26D39331A336C6B92
int start() {
   int Lia_unused_0[1];
   int Lia_unused_4[1];
   double order_lots_8;
   double order_lots_16;
   double iclose_24;
   double iclose_32;
   int Li_40;
   if (UseTrailing) f0_17(TrailStart, TrailStop, G_price_224);
   if (Gi_168) {
      if (TimeCurrent() >= Gi_280) {
         f0_0();
         Print("Closed All Trades Due To Server TimeOut");
      }
   }
   if (G_time_276 == Time[0]) return (0);
   G_time_276 = Time[0];
   double Ld_44 = f0_15();
   if (SafeEquityStopOut) {
      if (Ld_44 < 0.0 && MathAbs(Ld_44) > SafeEquityRisk / 100.0 * f0_10()) {
         f0_0();
         Print("Closed All due to EQUITY STOP-OUT");
         Gi_328 = FALSE;
      }
   }
   Gi_300 = f0_18();
   if (Gi_300 == 0) Gi_272 = FALSE;
   for (G_pos_296 = OrdersTotal() - 1; G_pos_296 >= 0; G_pos_296--) {
      OrderSelect(G_pos_296, SELECT_BY_POS, MODE_TRADES);
      if (OrderSymbol() != Symbol() || OrderMagicNumber() != MagicNumber) continue;
      if (OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber) {
         if (OrderType() == OP_BUY) {
            Gi_316 = TRUE;
            Gi_320 = FALSE;
            order_lots_8 = OrderLots();
            break;
         }
      }
      if (OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber) {
         if (OrderType() == OP_SELL) {
            Gi_316 = FALSE;
            Gi_320 = TRUE;
            order_lots_16 = OrderLots();
            break;
         }
      }
   }
   Gi_312 = FALSE;
   if (Gi_300 > 0 && Gi_300 <= MaxOpenOrders) {
      RefreshRates();
      Gd_248 = f0_1();
      Gd_256 = f0_6();
      Li_40 = f0_4(Gi_316, Gi_320, Bid, Ask, Gd_248, Gd_256, Point, StepLots, Gi_392);
      if (Li_40 == 1) Gi_312 = TRUE;
      Gs_372 = f0_2(3);
   }
   if (Gi_300 < 1) {
      Gi_320 = FALSE;
      Gi_316 = FALSE;
      Gi_312 = TRUE;
      Gd_216 = AccountEquity();
   }
   if (Gi_312) {
      Gd_248 = f0_1();
      Gd_256 = f0_6();
      if (Gi_320) {
         if (Gi_200) {
            f0_12(0, 1);
            Gd_288 = NormalizeDouble(MultiLotsFactor * order_lots_16, Gd_188);
         } else Gd_288 = f0_3(OP_SELL);
         if (Gi_196) {
            Gi_284 = Gi_300;
            if (Gd_288 > 0.0) {
               RefreshRates();
               Gi_324 = f0_16(1, Gd_288, Bid, Slippage, Ask, 0, 0, TradeComment + "-" + Gi_284, MagicNumber, 0, HotPink);
               if (Gi_324 < 0) {
                  Print("Error: ", GetLastError());
                  return (0);
               }
               Gd_256 = f0_6();
               Gi_312 = FALSE;
               Gi_328 = TRUE;
            }
         }
      } else {
         if (Gi_316) {
            if (Gi_200) {
               f0_12(1, 0);
               Gd_288 = NormalizeDouble(MultiLotsFactor * order_lots_8, Gd_188);
            } else Gd_288 = f0_3(OP_BUY);
            if (Gi_196) {
               Gi_284 = Gi_300;
               if (Gd_288 > 0.0) {
                  Gi_324 = f0_16(0, Gd_288, Ask, Slippage, Bid, 0, 0, TradeComment + "-" + Gi_284, MagicNumber, 0, Lime);
                  if (Gi_324 < 0) {
                     Print("Error: ", GetLastError());
                     return (0);
                  }
                  Gd_248 = f0_1();
                  Gi_312 = FALSE;
                  Gi_328 = TRUE;
               }
            }
         }
      }
   }
   if (Gi_312 && Gi_300 < 1) {
      iclose_24 = iClose(Symbol(), 0, 2);
      iclose_32 = iClose(Symbol(), 0, 1);
      G_bid_232 = Bid;
      G_ask_240 = Ask;
      if ((!Gi_320) && (!Gi_316)) {
         Gi_284 = Gi_300;
         
         if (iclose_24 > iclose_32) {
            Gd_288 = f0_3(OP_SELL);
            if (Gd_288 > 0.0) {
               Gi_324 = f0_16(1, Gd_288, G_bid_232, Slippage, G_bid_232, 0, 0, TradeComment + " " + MagicNumber + "-" + Gi_284, MagicNumber, 0, HotPink);
               if (Gi_324 < 0) {
                  Print(Gd_288, "Error: ", GetLastError());
                  return (0);
               }
               Gd_248 = f0_1();
               Gi_328 = TRUE;
            }
         } else {
            Gd_288 = f0_3(OP_BUY);
            if (Gd_288 > 0.0) {
               Gi_324 = f0_16(0, Gd_288, G_ask_240, Slippage, G_ask_240, 0, 0, TradeComment + " " + MagicNumber + "-" + Gi_284, MagicNumber, 0, Lime);
               if (Gi_324 < 0) {
                  Print(Gd_288, "Error: ", GetLastError());
                  return (0);
               }
               Gd_256 = f0_6();
               Gi_328 = TRUE;
            }
         }
      }
      if (Gi_324 > 0) Gi_280 = TimeCurrent() + 60.0 * (60.0 * Gd_172);
      Gi_312 = FALSE;
   }
   Gi_300 = f0_18();
   G_price_224 = 0;
   double Ld_52 = 0;
   for (G_pos_296 = OrdersTotal() - 1; G_pos_296 >= 0; G_pos_296--) {
      OrderSelect(G_pos_296, SELECT_BY_POS, MODE_TRADES);
      if (OrderSymbol() != Symbol() || OrderMagicNumber() != MagicNumber) continue;
      if (OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber) {
         if (OrderType() == OP_BUY || OrderType() == OP_SELL) {
            G_price_224 += OrderOpenPrice() * OrderLots();
            Ld_52 += OrderLots();
         }
      }
   }
   if (Gi_300 > 0) G_price_224 = NormalizeDouble(G_price_224 / Ld_52, Digits);
   if (Gi_328) {
      for (G_pos_296 = OrdersTotal() - 1; G_pos_296 >= 0; G_pos_296--) {
         OrderSelect(G_pos_296, SELECT_BY_POS, MODE_TRADES);
         if (OrderSymbol() != Symbol() || OrderMagicNumber() != MagicNumber) continue;
         if (OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber) {
            if (OrderType() == OP_BUY) {
               G_price_208 = G_price_224 + TakeProfit * Point * Gi_392;
               Gd_304 = G_price_224 - G_pips_180 * Point * Gi_392;
               Gi_272 = TRUE;
            }
         }
         if (OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber) {
            if (OrderType() == OP_SELL) {
               G_price_208 = G_price_224 - TakeProfit * Point * Gi_392;
               Gd_304 = G_price_224 + G_pips_180 * Point * Gi_392;
               Gi_272 = TRUE;
            }
         }
      }
   }
   if (Gi_328) {
      if (Gi_272 == TRUE) {
         for (G_pos_296 = OrdersTotal() - 1; G_pos_296 >= 0; G_pos_296--) {
            OrderSelect(G_pos_296, SELECT_BY_POS, MODE_TRADES);
            if (OrderSymbol() != Symbol() || OrderMagicNumber() != MagicNumber) continue;
            if (OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber) OrderModify(OrderTicket(), G_price_224, OrderStopLoss(), G_price_208, 0, Yellow);
            Gi_328 = FALSE;
         }
      }
   }
   f0_14();
   return (0);
}

// AA5EA51BFAC7B64E723BF276E0075513
void f0_14() {
   if (ShowTradeComment) {
      if (ObjectFind("BG") < 0) {
         ObjectCreate("BG", OBJ_LABEL, 0, 0, 0);
         ObjectSetText("BG", "g", 210, "Webdings", Orange);
         ObjectSet("BG", OBJPROP_CORNER, 0);
         ObjectSet("BG", OBJPROP_BACK, TRUE);
         ObjectSet("BG", OBJPROP_XDISTANCE, 0);
         ObjectSet("BG", OBJPROP_YDISTANCE, 15);
      }
      if (ObjectFind("BG1") < 0) {
         ObjectCreate("BG1", OBJ_LABEL, 0, 0, 0);
         ObjectSetText("BG1", "g", 210, "Webdings", DimGray);
         ObjectSet("BG1", OBJPROP_BACK, FALSE);
         ObjectSet("BG1", OBJPROP_XDISTANCE, 0);
         ObjectSet("BG1", OBJPROP_YDISTANCE, 42);
      }
      if (ObjectFind("BG2") < 0) {
         ObjectCreate("BG2", OBJ_LABEL, 0, 0, 0);
         ObjectSetText("BG2", "g", 210, "Webdings", DimGray);
         ObjectSet("BG2", OBJPROP_CORNER, 0);
         ObjectSet("BG2", OBJPROP_BACK, TRUE);
         ObjectSet("BG2", OBJPROP_XDISTANCE, 0);
         ObjectSet("BG2", OBJPROP_YDISTANCE, 42);
      }
      if (ObjectFind("NAME") < 0) {
         ObjectCreate("NAME", OBJ_LABEL, 0, 0, 0);
         ObjectSetText("NAME", "FOREX GRID TRADER EA - " + Symbol(), 9, "Arial Bold", White);
         ObjectSet("NAME", OBJPROP_CORNER, 0);
         ObjectSet("NAME", OBJPROP_BACK, FALSE);
         ObjectSet("NAME", OBJPROP_XDISTANCE, 5);
         ObjectSet("NAME", OBJPROP_YDISTANCE, 23);
      }
      if (ObjectFind("BG3") < 0) {
         ObjectCreate("BG3", OBJ_LABEL, 0, 0, 0);
         ObjectSetText("BG3", "g", 110, "Webdings", DimGray);
         ObjectSet("BG3", OBJPROP_CORNER, 0);
         ObjectSet("BG3", OBJPROP_BACK, TRUE);
         ObjectSet("BG3", OBJPROP_XDISTANCE, 0);
         ObjectSet("BG3", OBJPROP_YDISTANCE, 73);
      }
      if (ObjectFind("BG5") < 0) {
         ObjectCreate("BG5", OBJ_LABEL, 0, 0, 0);
         ObjectSetText("BG5", "g", 210, "Webdings", DimGray);
         ObjectSet("BG5", OBJPROP_CORNER, 0);
         ObjectSet("BG5", OBJPROP_BACK, FALSE);
         ObjectSet("BG5", OBJPROP_XDISTANCE, 0);
         ObjectSet("BG5", OBJPROP_YDISTANCE, 73);
      }
      f0_9();
   }
}

// 50257C26C4E5E915F022247BABD914FE
double f0_5(double Ad_0) {
   return (NormalizeDouble(Ad_0, Digits));
}

// 9B1AEE847CFB597942D106A4135D4FE6
int f0_12(bool Ai_0 = TRUE, bool Ai_4 = TRUE) {
   int Li_ret_8 = 0;
   for (int pos_12 = OrdersTotal() - 1; pos_12 >= 0; pos_12--) {
      if (OrderSelect(pos_12, SELECT_BY_POS, MODE_TRADES)) {
         if (OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber) {
            if (OrderType() == OP_BUY && Ai_0) {
               RefreshRates();
               if (!IsTradeContextBusy()) {
                  if (!OrderClose(OrderTicket(), OrderLots(), f0_5(Bid), 5, CLR_NONE)) {
                     Print("Error close BUY " + OrderTicket());
                     Li_ret_8 = -1;
                  }
               } else {
                  if (G_datetime_332 == iTime(NULL, 0, 0)) return (-2);
                  G_datetime_332 = iTime(NULL, 0, 0);
                  Print("Need close BUY " + OrderTicket() + ". Trade Context Busy");
                  return (-2);
               }
            }
            if (OrderType() == OP_SELL && Ai_4) {
               RefreshRates();
               if (!IsTradeContextBusy()) {
                  if (!((!OrderClose(OrderTicket(), OrderLots(), f0_5(Ask), 5, CLR_NONE)))) continue;
                  Print("Error Closing SELL Trade : " + OrderTicket());
                  Li_ret_8 = -1;
                  continue;
               }
               if (G_datetime_336 == iTime(NULL, 0, 0)) return (-2);
               G_datetime_336 = iTime(NULL, 0, 0);
               Print("Need to close SELL trade : " + OrderTicket() + ". Trade Context Busy");
               return (-2);
            }
         }
      }
   }
   return (Li_ret_8);
}

// 2FC9212C93C86A99B2C376C96453D3A4
double f0_3(int A_cmd_0) {
   double lots_4;
   int datetime_12;
   switch (Gi_204) {
   case 0:
      lots_4 = Lots;
      break;
   case 1:
      lots_4 = NormalizeDouble(Lots * MathPow(MultiLotsFactor, Gi_284), Gd_188);
      break;
   case 2:
      datetime_12 = 0;
      lots_4 = Lots;
      for (int pos_20 = OrdersHistoryTotal() - 1; pos_20 >= 0; pos_20--) {
         if (!OrderSelect(pos_20, SELECT_BY_POS, MODE_HISTORY)) return (-3);
         if (OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber) {
            if (datetime_12 < OrderCloseTime()) {
               datetime_12 = OrderCloseTime();
               if (OrderProfit() < 0.0) {
                  lots_4 = NormalizeDouble(OrderLots() * MultiLotsFactor, Gd_188);
                  continue;
               }
               lots_4 = Lots;
            }
         }
      }
   }
   if (AccountFreeMarginCheck(Symbol(), A_cmd_0, lots_4) <= 0.0) return (-1);
   if (GetLastError() == 134/* NOT_ENOUGH_MONEY */) return (-2);
   return (lots_4);
}

// F7B1F0AA13347699EFAE0D924298CB02
int f0_18() {
   int count_0 = 0;
   for (int pos_4 = OrdersTotal() - 1; pos_4 >= 0; pos_4--) {
      OrderSelect(pos_4, SELECT_BY_POS, MODE_TRADES);
      if (OrderSymbol() != Symbol() || OrderMagicNumber() != MagicNumber) continue;
      if (OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber)
         if (OrderType() == OP_SELL || OrderType() == OP_BUY) count_0++;
   }
   return (count_0);
}

// 09CBB5F5CE12C31A043D5C81BF20AA4A
void f0_0() {
   for (int pos_0 = OrdersTotal() - 1; pos_0 >= 0; pos_0--) {
      OrderSelect(pos_0, SELECT_BY_POS, MODE_TRADES);
      if (OrderSymbol() == Symbol()) {
         if (OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber) {
            if (OrderType() == OP_BUY) OrderClose(OrderTicket(), OrderLots(), Bid, Slippage, Blue);
            if (OrderType() == OP_SELL) OrderClose(OrderTicket(), OrderLots(), Ask, Slippage, Red);
         }
         Sleep(1000);
      }
   }
}

// D362D41CFF235C066CFB390D52F4EB13
int f0_16(int Ai_0, double A_lots_4, double Ad_unused_12, int A_slippage_20, double Ad_unused_24, int Ai_32, int Ai_36, string A_comment_40, int A_magic_48, int A_datetime_52, color A_color_56) {
   int ticket_60 = 0;
   int error_64 = 0;
   int count_68 = 0;
   int Li_72 = 100;
   switch (Ai_0) {
   case 0:
      for (count_68 = 0; count_68 < Li_72; count_68++) {
         RefreshRates();
         ticket_60 = OrderSend(Symbol(), OP_BUY, A_lots_4, Ask, A_slippage_20, f0_7(Bid, Ai_32), f0_19(Ask, Ai_36), A_comment_40, A_magic_48, A_datetime_52, A_color_56);
         error_64 = GetLastError();
         if (error_64 == 0/* NO_ERROR */) break;
         if (!((error_64 == 4/* SERVER_BUSY */ || error_64 == 137/* BROKER_BUSY */ || error_64 == 146/* TRADE_CONTEXT_BUSY */ || error_64 == 136/* OFF_QUOTES */))) break;
         Sleep(5000);
      }
      break;
   case 1:
      for (count_68 = 0; count_68 < Li_72; count_68++) {
         ticket_60 = OrderSend(Symbol(), OP_SELL, A_lots_4, Bid, A_slippage_20, f0_11(Ask, Ai_32), f0_13(Bid, Ai_36), A_comment_40, A_magic_48, A_datetime_52, A_color_56);
         error_64 = GetLastError();
         if (error_64 == 0/* NO_ERROR */) break;
         if (!((error_64 == 4/* SERVER_BUSY */ || error_64 == 137/* BROKER_BUSY */ || error_64 == 146/* TRADE_CONTEXT_BUSY */ || error_64 == 136/* OFF_QUOTES */))) break;
         Sleep(5000);
      }
   }
   return (ticket_60);
}

// 58B0897F29A3AD862616D6CBF39536ED
double f0_7(double Ad_0, int Ai_8) {
   if (Ai_8 == 0) return (0);
   return (Ad_0 - Ai_8 * Point * Gi_392);
}

// 945D754CB0DC06D04243FCBA25FC0802
double f0_11(double Ad_0, int Ai_8) {
   if (Ai_8 == 0) return (0);
   return (Ad_0 + Ai_8 * Point * Gi_392);
}

// FD4055E1AC0A7D690C66D37B2C70E529
double f0_19(double Ad_0, int Ai_8) {
   if (Ai_8 == 0) return (0);
   return (Ad_0 + Ai_8 * Point * Gi_392);
}

// A9B24A824F70CC1232D1C2BA27039E8D
double f0_13(double Ad_0, int Ai_8) {
   if (Ai_8 == 0) return (0);
   return (Ad_0 - Ai_8 * Point * Gi_392);
}

// D1DDCE31F1A86B3140880F6B1877CBF8
double f0_15() {
   double Ld_ret_0 = 0;
   for (G_pos_296 = OrdersTotal() - 1; G_pos_296 >= 0; G_pos_296--) {
      OrderSelect(G_pos_296, SELECT_BY_POS, MODE_TRADES);
      if (OrderSymbol() != Symbol() || OrderMagicNumber() != MagicNumber) continue;
      if (OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber)
         if (OrderType() == OP_BUY || OrderType() == OP_SELL) Ld_ret_0 += OrderProfit();
   }
   return (Ld_ret_0);
}

// F4F2EE5CE6F3F7678B6B3F2A5D4685D7
void f0_17(int Ai_0, int Ai_4, double A_price_8) {
   int Li_16;
   double order_stoploss_20;
   double price_28;
   if (Ai_4 != 0) {
      for (int pos_36 = OrdersTotal() - 1; pos_36 >= 0; pos_36--) {
         if (OrderSelect(pos_36, SELECT_BY_POS, MODE_TRADES)) {
            if (OrderSymbol() != Symbol() || OrderMagicNumber() != MagicNumber) continue;
            if (OrderSymbol() == Symbol() || OrderMagicNumber() == MagicNumber) {
               if (OrderType() == OP_BUY) {
                  Li_16 = NormalizeDouble((Bid - A_price_8) / Point / Gi_392, 0);
                  if (Li_16 < Ai_0) continue;
                  order_stoploss_20 = OrderStopLoss();
                  price_28 = Bid - Ai_4 * Point * Gi_392;
                  if (order_stoploss_20 == 0.0 || (order_stoploss_20 != 0.0 && price_28 > order_stoploss_20)) OrderModify(OrderTicket(), A_price_8, price_28, OrderTakeProfit(), 0, Aqua);
               }
               if (OrderType() == OP_SELL) {
                  Li_16 = NormalizeDouble((A_price_8 - Ask) / Point / Gi_392, 0);
                  if (Li_16 < Ai_0) continue;
                  order_stoploss_20 = OrderStopLoss();
                  price_28 = Ask + Ai_4 * Point * Gi_392;
                  if (order_stoploss_20 == 0.0 || (order_stoploss_20 != 0.0 && price_28 < order_stoploss_20)) OrderModify(OrderTicket(), A_price_8, price_28, OrderTakeProfit(), 0, Red);
               }
            }
            Sleep(1000);
         }
      }
   }
}

// 78BAA8FAE18F93570467778F2E829047
double f0_10() {
   if (f0_18() == 0) Gd_340 = AccountEquity();
   if (Gd_340 < Gd_348) Gd_340 = Gd_348;
   else Gd_340 = AccountEquity();
   Gd_348 = AccountEquity();
   return (Gd_340);
}

// 2569208C5E61CB15E209FFE323DB48B7
double f0_1() {
   double order_open_price_0;
   int ticket_8;
   double Ld_unused_12 = 0;
   int ticket_20 = 0;
   for (int pos_24 = OrdersTotal() - 1; pos_24 >= 0; pos_24--) {
      OrderSelect(pos_24, SELECT_BY_POS, MODE_TRADES);
      if (OrderSymbol() != Symbol() || OrderMagicNumber() != MagicNumber) continue;
      if (OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber && OrderType() == OP_BUY) {
         ticket_8 = OrderTicket();
         if (ticket_8 > ticket_20) {
            order_open_price_0 = OrderOpenPrice();
            Ld_unused_12 = order_open_price_0;
            ticket_20 = ticket_8;
         }
      }
   }
   return (order_open_price_0);
}

// 5710F6E623305B2C1458238C9757193B
double f0_6() {
   double order_open_price_0;
   int ticket_8;
   double Ld_unused_12 = 0;
   int ticket_20 = 0;
   for (int pos_24 = OrdersTotal() - 1; pos_24 >= 0; pos_24--) {
      OrderSelect(pos_24, SELECT_BY_POS, MODE_TRADES);
      if (OrderSymbol() != Symbol() || OrderMagicNumber() != MagicNumber) continue;
      if (OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber && OrderType() == OP_SELL) {
         ticket_8 = OrderTicket();
         if (ticket_8 > ticket_20) {
            order_open_price_0 = OrderOpenPrice();
            Ld_unused_12 = order_open_price_0;
            ticket_20 = ticket_8;
         }
      }
   }
   return (order_open_price_0);
}

// 6ABA3523C7A75AAEA41CC0DEC7953CC5
void f0_9() {
   Comment("" 
      + "\n" 
      + "\n" 
      + "\n" 
      + "EXPERT VERSION: 1.0" 
      + "\n" 
      + "=======================================" 
      + "\n" 
      + "-----------------------------------------------------------------------------------" 
      + "\n" 
      + "AUTHENTICATION STATUS" 
      + "\n" 
      + "-----------------------------------------------------------------------------------" 
      + "\n" 
      + "STATUS MESSAGE:   " + Gs_372 
      + "\n" 
      + "-----------------------------------------------------------------------------------" 
      + "\n" 
      + "ACCOUNT INFORMATION" 
      + "\n" 
      + "-----------------------------------------------------------------------------------" 
      + "\n" 
      + "Account Name:                " + AccountName() 
      + "\n" 
      + "Account Number:             " + AccountNumber() 
      + "\n" 
      + "Account Type:                 " + Gs_live_364 
      + "\n" 
      + "Account Leverage:           1:" + DoubleToStr(AccountLeverage(), 0) 
      + "\n" 
      + "Account Balance:             " + DoubleToStr(AccountBalance(), 2) 
      + "\n" 
      + "Account Equity:               " + DoubleToStr(AccountEquity(), 2) 
      + "\n" 
      + "-----------------------------------------------------------------------------------" 
      + "\n" 
      + "TRADE INFORMATIONS " 
      + "\n" 
      + "------------------------------------------------------------------------------------" 
      + "\n" 
      + "SAFE EQUITY STOP OUT :        " + Gs_off_356 
      + "\n" 
      + "SAFE EQUITY RISK % :             " + DoubleToStr(SafeEquityRisk, 2) 
      + "\n" 
      + "NEXT LOT(S) :                            " + DoubleToStr(Gd_288, 2) 
      + "\n" 
      + "OPEN TRADES :                         " + DoubleToStr(f0_8(), 0) 
      + "\n" 
      + "FLOATING P/L :                         " + DoubleToStr(AccountProfit(), 2) 
      + "\n" 
   + "=======================================");
}

// 689C35E4872BA754D7230B8ADAA28E48
int f0_8() {
   int order_total_0 = OrdersTotal();
   int count_4 = 0;
   for (int pos_8 = 0; pos_8 < order_total_0; pos_8++) {
      OrderSelect(pos_8, SELECT_BY_POS, MODE_TRADES);
      if (OrderType() == OP_SELL || OrderType() == OP_BUY && OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber) count_4++;
   }
   return (count_4);
}

// 28EFB830D150E70A8BB0F12BAC76EF35
string f0_2(int Ai_0) {
   if (Ai_0 == 0) return ("HTTP Error");
   if (Ai_0 == 1) return ("Account does not exist or banned");
   if (Ai_0 == 2) return ("Account Activation Successful");
   if (Ai_0 == 3) return ("Account Authentication Successful");
   if (Ai_0 == 4) return ("Account not Activated!!!");
   if (Ai_0 == 5) return ("Insert a valid CLICKBANK ID.");
   return ("Ok");
}

// 3A78E0F3B66AACDC6416A39A7A42E07A
int f0_4(int Ai_0, int Ai_4, double Ad_8, double Ad_16, double Ad_24, double Ad_32, double Ad_40, double Ad_48, double Ad_56) {
   if (Ai_0 && Ad_40 * Ad_48 * Ad_56 <= Ad_24 - Ad_16) return (1);
   if (Ai_4 && Ad_8 - Ad_32 >= Ad_56 * Ad_48 * Ad_40) return (1);
   return (0);
}

        
