
#property copyright ""
#property link      ""
#include <WinUser32.mqh>

extern bool MicroBroker = TRUE;
extern double DollarTargetAmount = 50.0; //Target TP $$
extern bool gi_92 = TRUE; //Berhubungan target $$ per hari
extern double TradeTime = 1.0;
extern double LotSize = 0.2;
extern string pair1 = "GBPUSD";
extern string pair2 = "EURGBP";
extern string pair3 = "EURUSD";
extern string comment = " ";

input string  info = "============ mungkin ini berhubungan dengan rusnus di 3 pair itu mas =====";
input string info2 = " soalnya di setiap masing2 pair ada settingan nya mas, 2 parameter di bawah mas, maaf"; 
extern int gi_136 = 20; //Hidden 1
extern int gi_140 = 40; //Hidden 2

double gd_144;
double pair1_ord_open_price;
double pair2_ord_open_price;
double pair3_ord_open_price;
double Profit_locked_level;
double Fontsize = 7.0;
string per_str = "";
string per_strL = "";
string per_strR = "";

int init() {
   
   return (0);
}

int deinit() {
   Comment("Scanning for trade data......................... ");
   ObjectsDeleteAll(0, OBJ_LABEL);
   return (0);
}

int start() {
   double DI;
   double Re;
   double l_ihigh_16;
   double l_ilow_24;
   double ld_32;
   double l_ilow_40;
   double l_ihigh_48;
   int ord_total;
   RefreshRates();
  
   if (DayOfWeek() == 0) return (0);
    ObjectCreate("ObjLabel1", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("ObjLabel1", " 4 ", 7, "Arial", Blue);
   ObjectSet("ObjLabel1", OBJPROP_CORNER, 3);
   ObjectSet("ObjLabel1", OBJPROP_XDISTANCE, 20);
   ObjectSet("ObjLabel1", OBJPROP_YDISTANCE, 20);
   ObjectCreate("ObjLabel2", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("ObjLabel2", " X ", 11, "Arial Bold", White);
   ObjectSet("ObjLabel2", OBJPROP_CORNER, 3);
   ObjectSet("ObjLabel2", OBJPROP_XDISTANCE, 10);
   ObjectSet("ObjLabel2", OBJPROP_YDISTANCE, 20);
   ObjectCreate("ObjLabel3", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("ObjLabel3", " F", 8, "Arial", Red);
   ObjectSet("ObjLabel3", OBJPROP_CORNER, 3);
   ObjectSet("ObjLabel3", OBJPROP_XDISTANCE, 8);
   ObjectSet("ObjLabel3", OBJPROP_YDISTANCE, 20);
   ObjectCreate("ObjLabel4", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("ObjLabel4", "Ù", 8, "Wingdings", LimeGreen);
   ObjectSet("ObjLabel4", OBJPROP_CORNER, 3);
   ObjectSet("ObjLabel4", OBJPROP_XDISTANCE, 14);
   ObjectSet("ObjLabel4", OBJPROP_YDISTANCE, 13);
   ObjectCreate("ObjLabel5", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("ObjLabel5", "Ú", 8, "Wingdings", Red);
   ObjectSet("ObjLabel5", OBJPROP_CORNER, 3);
   ObjectSet("ObjLabel5", OBJPROP_XDISTANCE, 14);
   ObjectSet("ObjLabel5", OBJPROP_YDISTANCE, 30);
   ObjectCreate("ObjLabel6", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("ObjLabel6", "WWW.4XFX.BIZ", 7, "Arial", Silver);
   ObjectSet("ObjLabel6", OBJPROP_CORNER, 3);
   ObjectSet("ObjLabel6", OBJPROP_XDISTANCE, 5);
   ObjectSet("ObjLabel6", OBJPROP_YDISTANCE, 3);
   
   double ld_72 = 100 - 100.0 * (AccountEquity() / AccountBalance());
    Comment("                EA ACTIVE             ", "                     Account name : ", AccountName(), "  Account Number : ", AccountNumber(), " Account Balance $ ", MathRound(AccountBalance()), 
      "\n                                                                    ", OrdersTotal(), " Number of Orders Placed ", " Current Profit $ ", MathRound(AccountProfit()), " Account Free Margin $ ", MathRound(AccountFreeMargin()), " Account Equity $ ", MathRound(AccountEquity()), 
   "\n                                                                    ", "Date & Time : ", TimeToStr(TimeCurrent(), TIME_DATE|TIME_SECONDS), "  ", AccountServer());
   
   if (MicroBroker == TRUE) DI = 2;
   else DI = 1;
   double l_lots_80 = LotSize;
   double l_lots_88 = LotSize;
   if (MarketInfo(pair2, MODE_LOTSIZE) == 1000.0) Re = 0.1;
   if (MarketInfo(pair2, MODE_LOTSIZE) == 10000.0) Re = 1;
   if (MarketInfo(pair2, MODE_LOTSIZE) == 100000.0) Re = 10;
   string l_symbol_96 = pair2;
   string l_symbol_104 = pair3;
   string l_symbol_112 = pair1;
   string ls_120 = MarketInfo(pair2, MODE_BID);
   string ls_128 = MarketInfo(pair3, MODE_BID);
   string ls_136 = MarketInfo(pair1, MODE_BID);
   double l_ihigh_144 = iHigh(pair1, PERIOD_H4, 1);
   double l_ilow_152 = iLow(pair1, PERIOD_H4, 1);
   double ld_160 = (l_ihigh_144 + l_ilow_152) / 2.0;
   double l_ilow_168 = iLow(pair1, PERIOD_H4, 1);
   double l_ihigh_176 = iHigh(pair1, PERIOD_H4, 1);
   double ld_184 = (l_ilow_168 + l_ihigh_176) / 2.0;
   double l_point_192 = MarketInfo(pair1, MODE_POINT);
   double l_digits_200 = MarketInfo(pair1, MODE_DIGITS);
   double ld_208 = (l_ihigh_144 - l_ilow_152) / (l_ilow_168 - l_ihigh_176);
   double ld_216 = (l_ilow_168 - l_ihigh_176) / gi_136;
   ld_216 = MathRound((l_ilow_168 - l_ihigh_176) / gi_136 / (l_point_192 * gi_140)) * (l_point_192 * gi_140);
   double ld_224 = MathRound(ld_184 / (l_point_192 * gi_140)) * (l_point_192 * gi_140);
   ld_224 = ld_224 + ld_216 / 2.0 + ld_216 * (gi_136 / 2 - 1) - 0.0 * ld_216;
   double ld_232 = ld_160 + (ld_224 - ld_184) * ld_208;
   if (DayOfWeek() != 0) {
      l_ihigh_16 = iHigh(pair2, PERIOD_H4, 1);
      l_ilow_24 = iLow(pair2, PERIOD_H4, 1);
      ld_32 = (l_ihigh_16 + l_ilow_24) / 2.0;
      l_ilow_40 = iLow(pair2, PERIOD_H4, 1);
      l_ihigh_48 = iHigh(pair2, PERIOD_H4, 1);
   }
   if (DayOfWeek() == 0) {
      l_ihigh_16 = iHigh(pair2, PERIOD_H4, 2);
      l_ilow_24 = iLow(pair2, PERIOD_H4, 2);
      ld_32 = (l_ihigh_16 + l_ilow_24) / 2.0;
      l_ilow_40 = iLow(pair2, PERIOD_H4, 2);
      l_ihigh_48 = iHigh(pair2, PERIOD_H4, 2);
   }
   double ld_240 = (l_ilow_40 + l_ihigh_48) / 2.0;
   double l_point_248 = MarketInfo(pair2, MODE_POINT);
   double l_digits_256 = MarketInfo(pair2, MODE_DIGITS);
   double ld_264 = (l_ihigh_16 - l_ilow_24) / (l_ilow_40 - l_ihigh_48);
   double ld_272 = (l_ilow_40 - l_ihigh_48) / gi_136;
   ld_272 = MathRound((l_ilow_40 - l_ihigh_48) / gi_136 / (l_point_248 * gi_140)) * (l_point_248 * gi_140);
   double ld_280 = MathRound(ld_240 / (l_point_248 * gi_140)) * (l_point_248 * gi_140);
   ld_280 = ld_280 + ld_272 / 2.0 + ld_272 * (gi_136 / 2 - 1) - 0.0 * ld_272;
   Profit_locked_level = ld_32 + (ld_280 - ld_240) * ld_264;
   double ld_296 = Profit_locked_level * LotSize;
   double l_ihigh_304 = iHigh(pair3, PERIOD_H4, 1);
   double l_ilow_312 = iLow(pair3, PERIOD_H4, 1);
   double ld_320 = (l_ihigh_304 + l_ilow_312) / 2.0;
   double l_ilow_328 = iLow(pair3, PERIOD_H4, 1);
   double l_ihigh_336 = iHigh(pair3, PERIOD_H4, 1);
   double ld_344 = (l_ilow_328 + l_ihigh_336) / 2.0;
   double l_point_352 = MarketInfo(pair3, MODE_POINT);
   double l_digits_360 = MarketInfo(pair3, MODE_DIGITS);
   double ld_368 = (l_ihigh_304 - l_ilow_312) / (l_ilow_328 - l_ihigh_336);
   double ld_376 = (l_ilow_328 - l_ihigh_336) / gi_136;
   ld_376 = MathRound((l_ilow_328 - l_ihigh_336) / gi_136 / (l_point_352 * gi_140)) * (l_point_352 * gi_140);
   double ld_384 = MathRound(ld_344 / (l_point_352 * gi_140)) * (l_point_352 * gi_140);
   ld_384 = ld_384 + ld_376 / 2.0 + ld_376 * (gi_136 / 2 - 1) - 0.0 * ld_376;
   double ld_392 = ld_320 + (ld_384 - ld_344) * ld_368;
   double Price_pair2 = MarketInfo(pair2, MODE_BID);
   per_strL = "ã";
   per_strR = "ä";
   
   ObjectCreate("P1", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("P1", StringSubstr(l_symbol_96, 0, 8), Fontsize, "Arial Bold", Red);
   ObjectSet("P1", OBJPROP_CORNER, 0);
   ObjectSet("P1", OBJPROP_XDISTANCE, 30);
   ObjectSet("P1", OBJPROP_YDISTANCE, 30);
   ObjectCreate("P1a", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("P1a", StringSubstr(ls_120, 0, 6), Fontsize, "Arial Bold", Lime);
   ObjectSet("P1a", OBJPROP_CORNER, 0);
   ObjectSet("P1a", OBJPROP_XDISTANCE, 40);
   ObjectSet("P1a", OBJPROP_YDISTANCE, 40);
   ObjectCreate("t1", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("t1", per_strL, Fontsize, "Wingdings", White);
   ObjectSet("t1", OBJPROP_CORNER, 0);
   ObjectSet("t1", OBJPROP_XDISTANCE, 50);
   ObjectSet("t1", OBJPROP_YDISTANCE, 50);
   ObjectCreate("t2", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("t2", per_strL, Fontsize, "Wingdings", White);
   ObjectSet("t2", OBJPROP_CORNER, 0);
   ObjectSet("t2", OBJPROP_XDISTANCE, 45);
   ObjectSet("t2", OBJPROP_YDISTANCE, 60);
   ObjectCreate("t3", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("t3", per_strL, Fontsize, "Wingdings", White);
   ObjectSet("t3", OBJPROP_CORNER, 0);
   ObjectSet("t3", OBJPROP_XDISTANCE, 40);
   ObjectSet("t3", OBJPROP_YDISTANCE, 70);
   ObjectCreate("t4", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("t4", per_strL, Fontsize, "Wingdings", White);
   ObjectSet("t4", OBJPROP_CORNER, 0);
   ObjectSet("t4", OBJPROP_XDISTANCE, 35);
   ObjectSet("t4", OBJPROP_YDISTANCE, 80);
   ObjectCreate("t5", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("t5", per_strL, Fontsize, "Wingdings", White);
   ObjectSet("t5", OBJPROP_CORNER, 0);
   ObjectSet("t5", OBJPROP_XDISTANCE, 30);
   ObjectSet("t5", OBJPROP_YDISTANCE, 90);
   ObjectCreate("t6", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("t6", per_strL, Fontsize, "Wingdings", White);
   ObjectSet("t6", OBJPROP_CORNER, 0);
   ObjectSet("t6", OBJPROP_XDISTANCE, 25);
   ObjectSet("t6", OBJPROP_YDISTANCE, 100);
   ObjectCreate("P2", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("P2", StringSubstr(l_symbol_104, 0, 8), Fontsize, "Arial Bold", Red);
   ObjectSet("P2", OBJPROP_CORNER, 0);
   ObjectSet("P2", OBJPROP_XDISTANCE, 0);
   ObjectSet("P2", OBJPROP_YDISTANCE, 110);
   ObjectCreate("P2a", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("P2a", StringSubstr(ls_128, 0, 6), Fontsize, "Arial Bold", Lime);
   ObjectSet("P2a", OBJPROP_CORNER, 0);
   ObjectSet("P2a", OBJPROP_XDISTANCE, 10);
   ObjectSet("P2a", OBJPROP_YDISTANCE, 120);
   ObjectCreate("P3", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("P3", StringSubstr(l_symbol_112, 0, 8), Fontsize, "Arial Bold", Red);
   ObjectSet("P3", OBJPROP_CORNER, 0);
   ObjectSet("P3", OBJPROP_XDISTANCE, 70);
   ObjectSet("P3", OBJPROP_YDISTANCE, 110);
   ObjectCreate("P3a", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("P3a", StringSubstr(ls_136, 0, 6), Fontsize, "Arial Bold", Lime);
   ObjectSet("P3a", OBJPROP_CORNER, 0);
   ObjectSet("P3a", OBJPROP_XDISTANCE, 80);
   ObjectSet("P3a", OBJPROP_YDISTANCE, 120);
   ObjectCreate("t7", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("t7", "-------x--------", Fontsize, "Arial Bold", White);
   ObjectSet("t7", OBJPROP_CORNER, 0);
   ObjectSet("t7", OBJPROP_XDISTANCE, 30);
   ObjectSet("t7", OBJPROP_YDISTANCE, 100);
   ObjectCreate("t1b", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("t1b", per_strR, Fontsize, "Wingdings", White);
   ObjectSet("t1b", OBJPROP_CORNER, 0);
   ObjectSet("t1b", OBJPROP_XDISTANCE, 55);
   ObjectSet("t1b", OBJPROP_YDISTANCE, 50);
   ObjectCreate("t2b", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("t2b", per_strR, Fontsize, "Wingdings", White);
   ObjectSet("t2b", OBJPROP_CORNER, 0);
   ObjectSet("t2b", OBJPROP_XDISTANCE, 60);
   ObjectSet("t2b", OBJPROP_YDISTANCE, 60);
   ObjectCreate("t3b", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("t3b", per_strR, Fontsize, "Wingdings", White);
   ObjectSet("t3b", OBJPROP_CORNER, 0);
   ObjectSet("t3b", OBJPROP_XDISTANCE, 65);
   ObjectSet("t3b", OBJPROP_YDISTANCE, 70);
   ObjectCreate("t4b", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("t4b", per_strR, Fontsize, "Wingdings", White);
   ObjectSet("t4b", OBJPROP_CORNER, 0);
   ObjectSet("t4b", OBJPROP_XDISTANCE, 70);
   ObjectSet("t4b", OBJPROP_YDISTANCE, 80);
   ObjectCreate("t5b", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("t5b", per_strR, Fontsize, "Wingdings", White);
   ObjectSet("t5b", OBJPROP_CORNER, 0);
   ObjectSet("t5b", OBJPROP_XDISTANCE, 75);
   ObjectSet("t5b", OBJPROP_YDISTANCE, 90);
   ObjectCreate("t6b", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("t6b", per_strR, Fontsize, "Wingdings", White);
   ObjectSet("t6b", OBJPROP_CORNER, 0);
   ObjectSet("t6b", OBJPROP_XDISTANCE, 80);
   ObjectSet("t6b", OBJPROP_YDISTANCE, 100);
   
   
   if (gi_92 == TRUE) {
      if (Hour() == TradeTime && OrdersTotal() < 3) {
         if (Price_pair2 < Profit_locked_level) {
            if (MarketInfo(pair1, MODE_BID) * Profit_locked_level * MarketInfo(pair2, MODE_LOTSIZE) - MarketInfo(pair3, MODE_ASK) * MarketInfo(pair3, MODE_LOTSIZE) > 11.0 * Re &&
               MarketInfo(pair1, MODE_BID) * Profit_locked_level * MarketInfo(pair2, MODE_LOTSIZE) - MarketInfo(pair3, MODE_ASK) * MarketInfo(pair3, MODE_LOTSIZE) < 33.0 * Re)   
                  {
                per_strL = "ã";
                per_strR = "ã";
               if (OrdersTotal() == 1) OrderSend(pair1, OP_SELL, NormalizeDouble(ld_296, DI), MarketInfo(pair1, MODE_BID), 5, 0, 0,comment, 0, 0, Red);
               if (OrdersTotal() == 0) OrderSend(pair2, OP_SELLLIMIT, NormalizeDouble(l_lots_80, DI), Profit_locked_level, 5, 0, 0,comment, 0, 0, Red);
               if (OrdersTotal() == 2) OrderSend(pair3, OP_BUY, NormalizeDouble(l_lots_88, DI), MarketInfo(pair3, MODE_ASK), 5, 0, 0,comment, 0, 0, Blue);
            }
         }
         if (Price_pair2 > Profit_locked_level) {
            if (MarketInfo(pair3, MODE_BID) * MarketInfo(pair3, MODE_LOTSIZE) - MarketInfo(pair1, MODE_ASK) * Profit_locked_level * MarketInfo(pair2, MODE_LOTSIZE) > 11.0 * Re &&
               MarketInfo(pair3, MODE_BID) * MarketInfo(pair3, MODE_LOTSIZE) - MarketInfo(pair1, MODE_ASK) * Profit_locked_level * MarketInfo(pair2, MODE_LOTSIZE) < 33.0 * Re)    
                 {
                 per_strR = "ä";
                 per_strL = "ä";
   
               if (OrdersTotal() == 1) OrderSend(pair1, OP_BUY, NormalizeDouble(ld_296, DI), MarketInfo(pair1, MODE_ASK), 5, 0, 0,comment, 0, 0, Blue);
               if (OrdersTotal() == 0) OrderSend(pair2, OP_BUYLIMIT, NormalizeDouble(l_lots_80, DI), Profit_locked_level, 5, 0, 0,comment, 0, 0, Blue);
               if (OrdersTotal() == 2) OrderSend(pair3, OP_SELL, NormalizeDouble(l_lots_88, DI), MarketInfo(pair3, MODE_BID), 5, 0, 0,comment, 0, 0, Red);
            }
         }
      }
   }
   if (OrdersTotal() == 0) {
   }
   for (int pos = 0; pos < OrdersTotal(); pos++) {
      if (OrderSelect(pos, SELECT_BY_POS, MODE_TRADES)) {
         if (OrderSymbol() == pair1) pair1_ord_open_price = OrderOpenPrice();
         if (OrderSymbol() == pair2) pair2_ord_open_price = OrderOpenPrice();
         if (OrderSymbol() == pair3) pair3_ord_open_price = OrderOpenPrice();
      }
   }
   if (pair3_ord_open_price * MarketInfo(pair3, MODE_LOTSIZE) - pair2_ord_open_price * pair1_ord_open_price * MarketInfo(pair2, MODE_LOTSIZE) > 0.0) gd_144 = pair3_ord_open_price * MarketInfo(pair3, MODE_LOTSIZE) - pair2_ord_open_price * pair1_ord_open_price * MarketInfo(pair2, MODE_LOTSIZE);
   if (pair2_ord_open_price * pair1_ord_open_price * MarketInfo(pair2, MODE_LOTSIZE) - pair3_ord_open_price * MarketInfo(pair3, MODE_LOTSIZE) > 0.0) gd_144 = pair2_ord_open_price * pair1_ord_open_price * MarketInfo(pair2, MODE_LOTSIZE) - pair3_ord_open_price * MarketInfo(pair3, MODE_LOTSIZE);
   if (gd_144 > 0.0) {
      if (AccountProfit() > gd_144 * LotSize - 0.2 * (gd_144 * LotSize) || AccountProfit() <= (-(AccountBalance() * DollarTargetAmount / 100.0))) {
         DeletePendingOrders();
         ord_total = OrdersTotal();
         for (int pos1 = ord_total - 1; pos1 >= 0; pos1--) {
            OrderSelect(pos1, SELECT_BY_POS);
            if (OrderType() == OP_BUY) OrderClose(OrderTicket(), OrderLots(), MarketInfo(OrderSymbol(), MODE_BID), 5, Red);
            if (OrderType() == OP_SELL) OrderClose(OrderTicket(), OrderLots(), MarketInfo(OrderSymbol(), MODE_ASK), 5, Red);
         }
      }
   }
   if (OrdersTotal() == 3) {
   }
   return (0);
}

void DeletePendingOrders() {
   int l_ord_total_0 = OrdersTotal();
   for (int l_pos_4 = l_ord_total_0 - 1; l_pos_4 >= 0; l_pos_4--) {
      OrderSelect(l_pos_4, SELECT_BY_POS, MODE_TRADES);
      if (OrderType() == OP_BUYLIMIT || OrderType() == OP_SELLLIMIT || OrderType() == OP_BUYSTOP || OrderType() == OP_SELLSTOP) OrderDelete(OrderTicket());
   }
}

void adjustForIBFXMini() {
   if (StringLen(Symbol()) == 7) {
      pair1 = pair1 + "m";
      pair2 = pair2 + "m";
      pair3 = pair3 + "m";
   }
}