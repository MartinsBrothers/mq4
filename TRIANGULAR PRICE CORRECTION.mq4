/*
   Generated by EX4-TO-MQ4 decompiler ONE FILE V4.0.217.1
   EX4 ID : 82ACC3FE9E0E8660641926B78CCC55CF
   Website: http://purebeam.biz
   E-mail : purebeam@gmail.com
*/
#property copyright "Copyright © 2008,4XFX "
#property link      "http://www.4xfx.biz"

#include <WinUser32.mqh>

extern bool MicroBroker = TRUE;
int gi_unused_80 = 1;
int gi_unused_84 = 1;
double gd_unused_88 = 0.025;
double gd_unused_96 = 0.0;
extern int Risk = 15;
extern double Lots = 0.1;
double gd_unused_116 = 50.0;
extern int Slippage = 3;
bool gi_unused_128 = FALSE;
extern bool UseMoneyManagement = TRUE;
extern double MagicNumber = 111208.0;
string gs_eurusd_144 = "EURUSD";
string gs_euraud_152 = "EURAUD";
string gs_audusd_160 = "AUDUSD";
extern double Fontsize = 7.0;
int gi_unused_176 = 7;
int gi_unused_180 = 1;
bool gi_unused_184 = FALSE;
bool gi_unused_188 = FALSE;
double gd_192 = 0.0;
double gd_unused_200 = 0.0;
int g_pos_208;
int g_error_212;
int gi_216;
string g_comment_228 = "T.P.C";
int gi_236;

double LotSize() {
   if (AccountFreeMargin() / AccountBalance() < (Risk / 100) << 1) {
      Alert("Not enough margin to order");
      return (0);
   }
   gd_192 = AccountEquity() * Risk / 1000.0 / 100.0;
   return (gd_192);
}

int init() {
   adjustForIBFXMini();
   PlaySound("Conditions.wav");
   int l_mb_code_0 = MessageBox("Do you expressly understand and agree that 4XFX shall not be liable for any direct loss or profits.4XFX makes no guarantee past performance will be indicative or future results." 
   + "\n\nBy clicking YES you agree to these conditions. Start EXPERT ADVISOR ?", "RISK DISCLAIMER", MB_YESNO|MB_ICONEXCLAMATION);
   if (l_mb_code_0 == IDNO) return (0);
   return (0);
}

int deinit() {
   Comment("Waiting for data tick......................... ");
   ObjectsDeleteAll(0, OBJ_LABEL);
   ObjectDelete("PipRectangle");
   ObjectDelete("InfoString");
   ObjectDelete("AvgEntryAdviseReminder");
   return (0);
}

int start() {
   double ld_16;
   double ld_unused_40;
   double ld_unused_212;
   double ld_unused_220;
   double l_price_228;
   if (gi_236 == Time[0]) return (0);
   gi_236 = Time[0];
   string ls_0 = "2037.10.01";
   int l_str2time_8 = StrToTime(ls_0);
   if (TimeCurrent() >= l_str2time_8) {
      Alert("EA EXPIRED....TO PURCHASE PLEASE EMAIL INFO@4XFX.BIZ ");
      return (0);
   }
   if (Symbol() != gs_eurusd_144) {
      Alert("THIS EA MUST BE RUN A 1 HR CHART EURUSD ONLY. PLEASE SWITCH TO A EURUSD CHART");
      return (0);
   
   }
   
   bool l_bool_12 = IsDemo();
   if (l_bool_12) {
      Alert("You can not use the program with a real account!");
      return (0);
      
   }
   
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
   ObjectSetText("ObjLabel4", "Щ", 8, "Wingdings", LimeGreen);
   ObjectSet("ObjLabel4", OBJPROP_CORNER, 3);
   ObjectSet("ObjLabel4", OBJPROP_XDISTANCE, 14);
   ObjectSet("ObjLabel4", OBJPROP_YDISTANCE, 13);
   ObjectCreate("ObjLabel5", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("ObjLabel5", "Ъ", 8, "Wingdings", Red);
   ObjectSet("ObjLabel5", OBJPROP_CORNER, 3);
   ObjectSet("ObjLabel5", OBJPROP_XDISTANCE, 14);
   ObjectSet("ObjLabel5", OBJPROP_YDISTANCE, 30);
   ObjectCreate("ObjLabel6", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("ObjLabel6", "WWW.4XFX.BIZ", 7, "Arial", Silver);
   ObjectSet("ObjLabel6", OBJPROP_CORNER, 3);
   ObjectSet("ObjLabel6", OBJPROP_XDISTANCE, 5);
   ObjectSet("ObjLabel6", OBJPROP_YDISTANCE, 3);
   if (MicroBroker == TRUE) ld_16 = 2;
   else ld_16 = 1;
   if (UseMoneyManagement == TRUE) Lots = LotSize();
   gi_unused_188 = FALSE;
   gi_unused_184 = FALSE;
   double ld_unused_32 = MarketInfo(Symbol(), MODE_SPREAD);
   if (MarketInfo(Symbol(), MODE_POINT) == 0.01) ld_unused_40 = 0.01;
   else ld_unused_40 = 0.0001;
   double l_iclose_48 = iClose(gs_eurusd_144, 0, 1);
   double l_iclose_56 = iClose(gs_euraud_152, 0, 1);
   double l_iclose_64 = iClose(gs_audusd_160, 0, 1);
   double l_price_72 = l_iclose_56 * l_iclose_64;
   double ld_80 = 1.0 * l_iclose_48 / l_iclose_64;
   double ld_88 = 1.0 * l_iclose_48 / l_iclose_56;
   string l_symbol_96 = gs_eurusd_144;
   string l_symbol_104 = gs_euraud_152;
   string l_symbol_112 = gs_audusd_160;
   string ls_120 = l_price_72;
   string ls_128 = ld_80;
   string ls_136 = ld_88;
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
   ObjectSetText("t1", "д", Fontsize, "Wingdings", White);
   ObjectSet("t1", OBJPROP_CORNER, 0);
   ObjectSet("t1", OBJPROP_XDISTANCE, 50);
   ObjectSet("t1", OBJPROP_YDISTANCE, 50);
   ObjectCreate("t2", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("t2", "д", Fontsize, "Wingdings", White);
   ObjectSet("t2", OBJPROP_CORNER, 0);
   ObjectSet("t2", OBJPROP_XDISTANCE, 45);
   ObjectSet("t2", OBJPROP_YDISTANCE, 60);
   ObjectCreate("t3", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("t3", "д", Fontsize, "Wingdings", White);
   ObjectSet("t3", OBJPROP_CORNER, 0);
   ObjectSet("t3", OBJPROP_XDISTANCE, 40);
   ObjectSet("t3", OBJPROP_YDISTANCE, 70);
   ObjectCreate("t4", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("t4", "д", Fontsize, "Wingdings", White);
   ObjectSet("t4", OBJPROP_CORNER, 0);
   ObjectSet("t4", OBJPROP_XDISTANCE, 35);
   ObjectSet("t4", OBJPROP_YDISTANCE, 80);
   ObjectCreate("t5", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("t5", "д", Fontsize, "Wingdings", White);
   ObjectSet("t5", OBJPROP_CORNER, 0);
   ObjectSet("t5", OBJPROP_XDISTANCE, 30);
   ObjectSet("t5", OBJPROP_YDISTANCE, 90);
   ObjectCreate("t6", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("t6", "д", Fontsize, "Wingdings", White);
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
   ObjectSet("t7", OBJPROP_XDISTANCE, 25);
   ObjectSet("t7", OBJPROP_YDISTANCE, 100);
   ObjectCreate("t1b", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("t1b", "г", Fontsize, "Wingdings", White);
   ObjectSet("t1b", OBJPROP_CORNER, 0);
   ObjectSet("t1b", OBJPROP_XDISTANCE, 55);
   ObjectSet("t1b", OBJPROP_YDISTANCE, 50);
   ObjectCreate("t2b", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("t2b", "г", Fontsize, "Wingdings", White);
   ObjectSet("t2b", OBJPROP_CORNER, 0);
   ObjectSet("t2b", OBJPROP_XDISTANCE, 60);
   ObjectSet("t2b", OBJPROP_YDISTANCE, 60);
   ObjectCreate("t3b", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("t3b", "г", Fontsize, "Wingdings", White);
   ObjectSet("t3b", OBJPROP_CORNER, 0);
   ObjectSet("t3b", OBJPROP_XDISTANCE, 65);
   ObjectSet("t3b", OBJPROP_YDISTANCE, 70);
   ObjectCreate("t4b", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("t4b", "г", Fontsize, "Wingdings", White);
   ObjectSet("t4b", OBJPROP_CORNER, 0);
   ObjectSet("t4b", OBJPROP_XDISTANCE, 70);
   ObjectSet("t4b", OBJPROP_YDISTANCE, 80);
   ObjectCreate("t5b", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("t5b", "г", Fontsize, "Wingdings", White);
   ObjectSet("t5b", OBJPROP_CORNER, 0);
   ObjectSet("t5b", OBJPROP_XDISTANCE, 75);
   ObjectSet("t5b", OBJPROP_YDISTANCE, 90);
   ObjectCreate("t6b", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("t6b", "г", Fontsize, "Wingdings", White);
   ObjectSet("t6b", OBJPROP_CORNER, 0);
   ObjectSet("t6b", OBJPROP_XDISTANCE, 80);
   ObjectSet("t6b", OBJPROP_YDISTANCE, 100);
   if (gi_236 == Time[0]) {
      if (Ask < l_price_72) {
         gi_216 = OrderSend(Symbol(), OP_BUY, NormalizeDouble(Lots, ld_16), Ask, Slippage, 0, l_price_72, g_comment_228, MagicNumber + 1.0, 0, Blue);
         if (gi_216 < 1) {
            g_error_212 = GetLastError();
            Print("Error : ", g_error_212);
         }
      }
      if (Ask > l_price_72) {
         gi_216 = OrderSend(Symbol(), OP_SELL, NormalizeDouble(Lots, ld_16), Bid, Slippage, 0, l_price_72, g_comment_228, MagicNumber + 2.0, 0, Red);
         if (gi_216 < 1) {
            g_error_212 = GetLastError();
            Print("Error : ", g_error_212);
         }
      }
   }
   Comment("                EA ACTIVE             ", "                     Account name : ", AccountName(), "  Account Number : ", AccountNumber(), " Account Balance $ ", MathRound(AccountBalance()), 
      "\n                                                                    ", OrdersTotal(), " Number of Orders Placed ", " Current Profit $ ", MathRound(AccountProfit()), " Account Free Margin $ ", MathRound(AccountFreeMargin()), " Account Equity $ ", MathRound(AccountEquity()), 
   "\n                                                                    ", "Date & Time : ", TimeToStr(TimeCurrent(), TIME_DATE|TIME_SECONDS), "  ", AccountServer());
   double ld_144 = 0;
   double ld_152 = 0;
   double ld_160 = 0;
   double ld_168 = 0;
   double ld_176 = 0;
   int l_ord_total_184 = OrdersTotal();
   int l_count_188 = 0;
   for (int l_pos_192 = l_ord_total_184 - 1; l_pos_192 >= 0; l_pos_192--) {
      if (OrderSelect(l_pos_192, SELECT_BY_POS)) {
         if (OrderSymbol() == Symbol()) {
            if (OrderType() == OP_BUY) {
               ld_144 += OrderLots();
               ld_160 = ld_160 + OrderProfit() + OrderCommission() + OrderSwap();
               l_count_188++;
               ld_176 += OrderOpenPrice();
            }
            if (OrderType() == OP_SELL) {
               ld_152 += OrderLots();
               ld_168 = ld_168 + OrderProfit() + OrderCommission() + OrderSwap();
               l_count_188++;
               ld_176 += OrderOpenPrice();
            }
         }
      }
   }
   if (l_count_188 < 2) return (0);
   ld_176 = NormalizeDouble(ld_176 / l_count_188, Digits);
   double ld_196 = 0;
   double l_tickvalue_204 = MarketInfo(Symbol(), MODE_TICKVALUE);
   if (ld_144 > 0.0) ld_unused_212 = NormalizeDouble(Bid - ld_160 / (l_tickvalue_204 * ld_144) * Point, Digits);
   else ld_unused_212 = 0;
   if (ld_152 > 0.0) ld_unused_220 = NormalizeDouble(Ask + ld_168 / (l_tickvalue_204 * ld_152) * Point, Digits);
   else ld_unused_220 = 0;
   if (ld_144 - ld_152 > 0.0) ld_196 = NormalizeDouble(Bid - (ld_160 + ld_168) / (l_tickvalue_204 * (ld_144 - ld_152)) * Point, Digits);
   if (ld_152 - ld_144 > 0.0) ld_196 = NormalizeDouble(Ask + (ld_160 + ld_168) / (l_tickvalue_204 * (ld_152 - ld_144)) * Point, Digits);
   for (l_pos_192 = 0; l_pos_192 < OrdersTotal(); l_pos_192++) {
      OrderSelect(l_pos_192, SELECT_BY_POS);
      if (OrdersTotal() >= 3) {
         l_price_228 = ld_196;
         gi_216 = OrderModify(OrderTicket(), OrderOpenPrice(), 0, l_price_228, 0, Yellow);
      }
   }
   if (AccountEquity() > AccountBalance() && gi_236 == Time[0]) CloseAll();
   return (0);
}

void CloseAll() {
   int l_ord_total_0 = OrdersTotal();
   for (int l_count_4 = 0; l_count_4 < l_ord_total_0; l_count_4++) {
      OrderSelect(g_pos_208, SELECT_BY_POS, MODE_TRADES);
      if (OrderType() == OP_SELL || OrderType() == OP_BUY && Symbol() == Symbol() && OrderMagicNumber() >= MagicNumber + 1.0) {
         PlaySound("slotwin.wav");
         OrderClose(OrderTicket(), OrderLots(), OrderClosePrice(), 0, White);
      }
   }
}

void adjustForIBFXMini() {
   if (StringLen(Symbol()) == 7) {
      gs_eurusd_144 = gs_eurusd_144 + "m";
      gs_euraud_152 = gs_euraud_152 + "m";
      gs_audusd_160 = gs_audusd_160 + "m";
   }
}