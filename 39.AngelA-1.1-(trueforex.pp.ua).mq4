//+------------------------------------------------------------------+
//|                              39.AngelA-1.1-(trueforex.pp.ua).mq4 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
//#include <stdlib.mqh>
#import "stdlib.ex4"
   string ErrorDescription(int a0); // DA69CBAFF4D38B87377667EEC549DE5A
#import

extern string ____1___ = "��������� �������";
extern int Displacement = 0;
extern int steps = 20;
extern bool Line = FALSE;
extern int quantity = 1;
extern string ____2___ = "�������� ���������";
extern double Lots = 0.01;
extern int StopLoss = 0;
extern int TakeProfit = 0;
extern int MagicNumber = 11;
extern int Slippage = 3;
extern int NumberOfTry = 85;
extern bool UseSound = TRUE;
extern string NameFileSound = "expert.wav";
extern color clOpenBuy = LightBlue;
extern color clOpenSell = LightCoral;
extern color clDelete = Honeydew;
extern color clCloseBuy = Aqua;
extern color clCloseSell = Tomato;
extern string NameCloseSound = "ok.wav";
extern string _____����_______ = "______��������� ����� __________________";
extern bool Traling = TRUE;
extern bool TSProfitOnly = TRUE;
extern int TStop_Buy = 45;
extern int TStop_Sell = 45;
extern int TrailingStep = 50;
extern string _____Averag_____ = "______��������� ������� ����������_____";
extern bool AVERAGES = TRUE;
extern int Averag = 5;
extern double koef_averag = 1.0;
extern int alfa_lot = 6;
extern double koef_lot = 3.0;
extern double StopLoss_Av = 0.0;
extern int TakeProfit_Av = 0;
extern bool Close_and_TRL = TRUE;
extern int TRL = 60;
extern int MagNum_Av = 333;
bool gi_264 = FALSE;
bool gi_268 = FALSE;
int g_acc_number_272 = 0;
extern bool ShowComment = FALSE;
int g_time_280 = 0;

// E37F0136AA3FFAF149B351F6A4C948E9
int init() {
   gi_268 = FALSE;
   if (!IsTradeAllowed()) {
      f0_8("��� ���������� ������ ��������� ����������\n" + "��������� ��������� ���������");
      gi_268 = TRUE;
      return;
   }
   if (!IsLibrariesAllowed()) {
      f0_8("��� ���������� ������ ��������� ����������\n" + "��������� ������ �� ������� ���������");
      gi_268 = TRUE;
      return;
   }
   if (!IsTesting()) {
      if (IsExpertEnabled()) f0_8("�������� ����� ������� ��������� �����");
      else f0_8("������ ������ \"��������� ������ ����������\"");
   }
   return (0);
}

// 52D46093050F38C27267BCE42543EF60
int deinit() {
   if (!IsTesting()) Comment("");
   return (0);
}

// EA2B2676C28C0DB26D39331A336C6B92
int start() {
   string ls_0;
   double ld_8;
   double ld_16;
   double ld_24;
   double ld_32;
   if (gi_264) {
      f0_8("����������� ������! �������� ����������!");
      return;
   }
   if (gi_268) {
      f0_8("�� ������� ���������������� ��������!");
      return;
   }
   if (!IsTesting()) {
      if (g_acc_number_272 > 0 && g_acc_number_272 != AccountNumber()) {
         Comment("�������� �� �����: " + AccountNumber() + " ���������!");
         return;
      }
      Comment("");
   }
   if (ShowComment) {
      ls_0 = "CurTime=" + TimeToStr(TimeCurrent(), TIME_MINUTES) + "  ���.�������=" + DoubleToStr(quantity * 2, 0) + "  �������. ����� ��������=" + steps + "  TakeProfit=" + TakeProfit + "  StopLoss=" + StopLoss + "  Lots=" + DoubleToStr(Lots, 2) + "  ��������=" + Displacement 
         + "\n+------------------------------+" 
         + "\n   ������=" + DoubleToStr(AccountBalance(), 2) 
         + "\n   ������=" + DoubleToStr(AccountEquity(), 2) 
         + "\n   �������=" + DoubleToStr(AccountEquity() - AccountBalance(), 3) + " $" 
         + "\n   �������=" + DoubleToStr(100.0 * (AccountEquity() / AccountBalance() - 1.0), 3) + " %" 
      + "\n+------------------------------+";
      Comment(ls_0);
   } else Comment("");
   if (Traling && (!f0_6(Symbol(), OP_BUY, MagNum_Av))) f0_4(Symbol(), OP_BUY, MagicNumber);
   if (Traling && (!f0_6(Symbol(), OP_SELL, MagNum_Av))) f0_4(Symbol(), OP_SELL, MagicNumber);
   double ld_40 = MarketInfo(Symbol(), MODE_STOPLEVEL) * Point;
   int digits_48 = Digits;
   double ld_52 = 100;
   if (digits_48 == 3 || digits_48 >= 5) ld_52 = 1000;
   int li_60 = 1000.0 * Lots * TakeProfit_Av / ld_52;
   double ld_64 = f0_5(Symbol(), OP_BUY);
   double ld_72 = f0_5(Symbol(), OP_SELL);
   double ld_80 = 0;
   double ld_88 = 0;
   double ld_unused_96 = 0;
   int li_104 = f0_10(Symbol(), OP_BUY, MagNum_Av);
   int li_108 = f0_10(Symbol(), OP_SELL, MagNum_Av);
   int li_112 = f0_10(Symbol(), OP_BUY);
   int li_116 = f0_10(Symbol(), OP_SELL);
   if (li_104 > 0 && ld_64 > li_60) {
      if (Close_and_TRL) f0_0(Symbol(), OP_BUY);
      else f0_19(Symbol(), OP_BUY);
   }
   if (li_108 > 0 && ld_72 > li_60) {
      if (Close_and_TRL) f0_0(Symbol(), OP_SELL);
      else f0_19(Symbol(), OP_SELL);
   }
   if (AVERAGES && f0_12()) {
      if (f0_18(Symbol(), OP_BUY) - Ask > Averag * Point * li_112 * koef_averag && ld_64 < 0.0) {
         ld_80 = NormalizeDouble(f0_1(0, OP_BUY) * koef_lot, alfa_lot);
         if (StopLoss_Av > 0.0) ld_88 = Bid - StopLoss_Av * Point;
         else ld_88 = 0;
         f0_15(Symbol(), OP_BUY, ld_80, ld_88, 0, MagNum_Av);
      }
      if (Bid - f0_18(Symbol(), OP_SELL) > Averag * Point * li_116 * koef_averag && ld_72 < 0.0) {
         ld_80 = NormalizeDouble(f0_1(0, OP_SELL) * koef_lot, alfa_lot);
         if (StopLoss_Av > 0.0) ld_88 = Ask + StopLoss_Av * Point;
         else ld_88 = 0;
         f0_15(Symbol(), OP_SELL, ld_80, ld_88, 0, MagNum_Av);
      }
   }
   int li_120 = 1;
   double ld_124 = Displacement * Point;
   double ld_132 = 0;
   while (ld_124 < Bid) {
      ld_124 += steps * Point;
      li_120++;
   }
   ld_132 = ld_124 - steps * Point;
   if (Line) {
      f0_3(Lime, "r", ld_124);
      f0_3(Red, "s", ld_132);
   }
   double ld_140 = 0;
   double ld_148 = 0;
   if (!f0_6(Symbol(), OP_BUY, MagicNumber)) {
      for (int count_156 = 0; count_156 < quantity; count_156++) {
         ld_8 = ld_124 + count_156 * steps * Point;
         if ((!f0_7(Symbol(), OP_BUYSTOP, MagicNumber, ld_8)) && !f0_13(Symbol(), OP_BUY, MagicNumber, ld_8) && ld_8 - Ask > ld_40) {
            if (StopLoss > 0) ld_140 = ld_8 - StopLoss * Point;
            else ld_140 = 0;
            if (TakeProfit > 0) ld_148 = ld_8 + TakeProfit * Point;
            else ld_148 = 0;
            f0_14(Symbol(), OP_BUYSTOP, Lots, ld_8, ld_140, ld_148, MagicNumber);
         }
      }
      for (int count_160 = 0; count_160 <= 10; count_160++) {
         ld_16 = ld_124 + (count_160 + quantity) * steps * Point;
         if (f0_7(Symbol(), OP_BUYSTOP, MagicNumber, ld_16)) f0_11();
      }
   }
   if (!f0_6(Symbol(), OP_SELL, MagicNumber)) {
      for (int count_164 = 0; count_164 < quantity; count_164++) {
         ld_24 = ld_132 - count_164 * steps * Point;
         if ((!f0_7(Symbol(), OP_SELLSTOP, MagicNumber, ld_24)) && !f0_13(Symbol(), OP_SELL, MagicNumber, ld_24) && Bid - ld_24 > ld_40) {
            if (StopLoss > 0) ld_140 = ld_24 + StopLoss * Point;
            else ld_140 = 0;
            if (TakeProfit > 0) ld_148 = ld_24 - TakeProfit * Point;
            else ld_148 = 0;
            f0_14(Symbol(), OP_SELLSTOP, Lots, ld_24, ld_140, ld_148, MagicNumber);
         }
      }
      for (int count_168 = 0; count_168 <= 10; count_168++) {
         ld_32 = ld_132 - (count_168 + quantity) * steps * Point;
         if (f0_7(Symbol(), OP_SELLSTOP, MagicNumber, ld_32)) f0_11();
      }
   }
   return (0);
}

// 368EFBC5B9D209421F1ED55741A8F403
void f0_3(color a_color_0, string a_dbl2str_4 = "", double a_bid_12 = 0.0, int a_style_20 = 0, int a_width_24 = 1) {
   if (a_dbl2str_4 == "") a_dbl2str_4 = DoubleToStr(Time[0], 0);
   if (a_bid_12 <= 0.0) a_bid_12 = Bid;
   if (ObjectFind(a_dbl2str_4) < 0) ObjectCreate(a_dbl2str_4, OBJ_HLINE, 0, 0, 0);
   ObjectSet(a_dbl2str_4, OBJPROP_PRICE1, a_bid_12);
   ObjectSet(a_dbl2str_4, OBJPROP_COLOR, a_color_0);
   ObjectSet(a_dbl2str_4, OBJPROP_STYLE, a_style_20);
   ObjectSet(a_dbl2str_4, OBJPROP_WIDTH, a_width_24);
}

// 45AD93C3B82DC5831689E55E54CD852C
bool f0_7(string as_0 = "", int a_cmd_8 = -1, int a_magic_12 = -1, double ad_16 = -1.0) {
   int digits_24;
   int order_total_28 = OrdersTotal();
   if (as_0 == "0") as_0 = Symbol();
   for (int pos_32 = 0; pos_32 < order_total_28; pos_32++) {
      if (OrderSelect(pos_32, SELECT_BY_POS, MODE_TRADES)) {
         if (OrderSymbol() == as_0 || as_0 == "" && a_cmd_8 < OP_BUY || OrderType() == a_cmd_8) {
            if (OrderType() > OP_SELL && OrderType() < 6) {
               digits_24 = MarketInfo(OrderSymbol(), MODE_DIGITS);
               ad_16 = NormalizeDouble(ad_16, digits_24);
               if (ad_16 < 0.0 || ad_16 == NormalizeDouble(OrderOpenPrice(), digits_24))
                  if (a_magic_12 < 0 || OrderMagicNumber() == a_magic_12) return (TRUE);
            }
         }
      }
   }
   return (FALSE);
}

// 96385223EA9155A49B2BBE7215D26312
bool f0_13(string as_0 = "", int a_cmd_8 = -1, int a_magic_12 = -1, double ad_16 = 0.0) {
   double ld_24;
   double ld_32;
   int digits_40;
   int order_total_44 = OrdersTotal();
   if (as_0 == "0") as_0 = Symbol();
   for (int pos_48 = 0; pos_48 < order_total_44; pos_48++) {
      if (OrderSelect(pos_48, SELECT_BY_POS, MODE_TRADES)) {
         if (OrderSymbol() == as_0 || as_0 == "" && a_cmd_8 < OP_BUY || OrderType() == a_cmd_8) {
            if (OrderType() == OP_BUY || OrderType() == OP_SELL) {
               if (a_magic_12 < 0 || OrderMagicNumber() == a_magic_12) {
                  digits_40 = MarketInfo(OrderSymbol(), MODE_DIGITS);
                  ld_24 = NormalizeDouble(ad_16, digits_40);
                  ld_32 = NormalizeDouble(OrderOpenPrice(), digits_40);
                  if (ad_16 <= 0.0 || ld_24 == ld_32) return (TRUE);
               }
            }
         }
      }
   }
   return (FALSE);
}

// 9FDEBEDD6557A3BB9931DD4354992A42
void f0_14(string a_symbol_0, int a_cmd_8, double a_lots_12, double a_price_20, double a_price_28 = 0.0, double a_price_36 = 0.0, int a_magic_44 = 0, int a_datetime_48 = 0) {
   color color_52;
   int datetime_56;
   double ask_60;
   double bid_68;
   double point_76;
   int error_84;
   int ticket_88;
   string comment_92 = WindowExpertName() + " " + f0_16(Period());
   if (a_symbol_0 == "" || a_symbol_0 == "0") a_symbol_0 = Symbol();
   int stoplevel_100 = MarketInfo(a_symbol_0, MODE_STOPLEVEL);
   if (a_cmd_8 == OP_BUYLIMIT || a_cmd_8 == OP_BUYSTOP) color_52 = clOpenBuy;
   else color_52 = clOpenSell;
   if (a_datetime_48 > 0 && a_datetime_48 < TimeCurrent()) a_datetime_48 = 0;
   for (int li_104 = 1; li_104 <= NumberOfTry; li_104++) {
      if (!IsTesting() && (!IsExpertEnabled()) || IsStopped()) {
         Print("SetOrder(): ��������� ������ �������");
         return;
      }
      while (!IsTradeAllowed()) Sleep(5000);
      RefreshRates();
      datetime_56 = TimeCurrent();
      ticket_88 = OrderSend(a_symbol_0, a_cmd_8, a_lots_12, a_price_20, Slippage, a_price_28, a_price_36, comment_92, a_magic_44, a_datetime_48, color_52);
      if (ticket_88 > 0) {
         if (!(UseSound)) break;
         PlaySound(NameFileSound);
         return;
      }
      error_84 = GetLastError();
      if (error_84 == 128/* TRADE_TIMEOUT */ || error_84 == 142 || error_84 == 143) {
         Sleep(66000);
         if (f0_2(a_symbol_0, a_cmd_8, a_magic_44, datetime_56)) {
            if (!(UseSound)) break;
            PlaySound(NameFileSound);
            return;
         }
         Print("Error(", error_84, ") set order: ", ErrorDescription(error_84), ", try ", li_104);
      } else {
         point_76 = MarketInfo(a_symbol_0, MODE_POINT);
         ask_60 = MarketInfo(a_symbol_0, MODE_ASK);
         bid_68 = MarketInfo(a_symbol_0, MODE_BID);
         if (error_84 == 130/* INVALID_STOPS */) {
            switch (a_cmd_8) {
            case OP_BUYLIMIT:
               if (a_price_20 > ask_60 - stoplevel_100 * point_76) a_price_20 = ask_60 - stoplevel_100 * point_76;
               if (a_price_28 > a_price_20 - (stoplevel_100 + 1) * point_76) a_price_28 = a_price_20 - (stoplevel_100 + 1) * point_76;
               if (!(a_price_36 > 0.0 && a_price_36 < a_price_20 + (stoplevel_100 + 1) * point_76)) break;
               a_price_36 = a_price_20 + (stoplevel_100 + 1) * point_76;
               break;
            case OP_BUYSTOP:
               if (a_price_20 < ask_60 + (stoplevel_100 + 1) * point_76) a_price_20 = ask_60 + (stoplevel_100 + 1) * point_76;
               if (a_price_28 > a_price_20 - (stoplevel_100 + 1) * point_76) a_price_28 = a_price_20 - (stoplevel_100 + 1) * point_76;
               if (!(a_price_36 > 0.0 && a_price_36 < a_price_20 + (stoplevel_100 + 1) * point_76)) break;
               a_price_36 = a_price_20 + (stoplevel_100 + 1) * point_76;
               break;
            case OP_SELLLIMIT:
               if (a_price_20 < bid_68 + stoplevel_100 * point_76) a_price_20 = bid_68 + stoplevel_100 * point_76;
               if (a_price_28 > 0.0 && a_price_28 < a_price_20 + (stoplevel_100 + 1) * point_76) a_price_28 = a_price_20 + (stoplevel_100 + 1) * point_76;
               if (a_price_36 <= a_price_20 - (stoplevel_100 + 1) * point_76) break;
               a_price_36 = a_price_20 - (stoplevel_100 + 1) * point_76;
               break;
            case OP_SELLSTOP:
               if (a_price_20 > bid_68 - stoplevel_100 * point_76) a_price_20 = bid_68 - stoplevel_100 * point_76;
               if (a_price_28 > 0.0 && a_price_28 < a_price_20 + (stoplevel_100 + 1) * point_76) a_price_28 = a_price_20 + (stoplevel_100 + 1) * point_76;
               if (a_price_36 <= a_price_20 - (stoplevel_100 + 1) * point_76) break;
               a_price_36 = a_price_20 - (stoplevel_100 + 1) * point_76;
            }
            Print("SetOrder(): ��������������� ������� ������");
         }
         Print("Error(", error_84, ") set order: ", ErrorDescription(error_84), ", try ", li_104);
         Print("Ask=", ask_60, "  Bid=", bid_68, "  sy=", a_symbol_0, "  ll=", a_lots_12, "  op=", f0_17(a_cmd_8), "  pp=", a_price_20, "  sl=", a_price_28, "  tp=", a_price_36,
            "  mn=", a_magic_44);
         if (ask_60 == 0.0 && bid_68 == 0.0) f0_8("SetOrder(): ��������� � ������ ����� ������� ������� " + a_symbol_0);
         if (error_84 == 2/* COMMON_ERROR */ || error_84 == 64/* ACCOUNT_DISABLED */ || error_84 == 65/* INVALID_ACCOUNT */ || error_84 == 133/* TRADE_DISABLED */) {
            gi_264 = TRUE;
            return;
         }
         if (error_84 == 4/* SERVER_BUSY */ || error_84 == 131/* INVALID_TRADE_VOLUME */ || error_84 == 132/* MARKET_CLOSED */) {
            Sleep(300000);
            return;
         }
         if (error_84 == 8/* TOO_FREQUENT_REQUESTS */ || error_84 == 141/* TOO_MANY_REQUESTS */) Sleep(100000);
         if (error_84 == 139/* ORDER_LOCKED */ || error_84 == 140/* LONG_POSITIONS_ONLY_ALLOWED */ || error_84 == 148/* TRADE_TOO_MANY_ORDERS */) break;
         if (error_84 == 146/* TRADE_CONTEXT_BUSY */) while (IsTradeContextBusy()) Sleep(11000);
         if (error_84 == 147/* TRADE_EXPIRATION_DENIED */) a_datetime_48 = 0;
         else
            if (error_84 != 135/* PRICE_CHANGED */ && error_84 != 138/* REQUOTE */) Sleep(7700.0);
      }
   }
}

// AC13B0D7764C581227BB6C52D24050B2
string f0_16(int a_timeframe_0 = 0) {
   if (a_timeframe_0 == 0) a_timeframe_0 = Period();
   switch (a_timeframe_0) {
   case PERIOD_M1:
      return ("M1");
   case PERIOD_M5:
      return ("M5");
   case PERIOD_M15:
      return ("M15");
   case PERIOD_M30:
      return ("M30");
   case PERIOD_H1:
      return ("H1");
   case PERIOD_H4:
      return ("H4");
   case PERIOD_D1:
      return ("Daily");
   case PERIOD_W1:
      return ("Weekly");
   case PERIOD_MN1:
      return ("Monthly");
   }
   return ("UnknownPeriod");
}

// 195F7A8C3579B807C96412E1BAFAE599
int f0_2(string as_0 = "", int a_cmd_8 = -1, int a_magic_12 = -1, int ai_16 = 0) {
   int cmd_20;
   int order_total_24 = OrdersTotal();
   if (as_0 == "0") as_0 = Symbol();
   for (int pos_28 = 0; pos_28 < order_total_24; pos_28++) {
      if (OrderSelect(pos_28, SELECT_BY_POS, MODE_TRADES)) {
         cmd_20 = OrderType();
         if (cmd_20 > OP_SELL && cmd_20 < 6) {
            if (OrderSymbol() == as_0 || as_0 == "" && a_cmd_8 < OP_BUY || cmd_20 == a_cmd_8) {
               if (a_magic_12 < 0 || OrderMagicNumber() == a_magic_12)
                  if (ai_16 <= OrderOpenTime()) return (1);
            }
         }
      }
   }
   return (0);
}

// B6838164ED869516345D96B32AA351B5
string f0_17(int ai_0) {
   switch (ai_0) {
   case 0:
      return ("Buy");
   case 1:
      return ("Sell");
   case 2:
      return ("Buy Limit");
   case 3:
      return ("Sell Limit");
   case 4:
      return ("Buy Stop");
   case 5:
      return ("Sell Stop");
   }
   return ("Unknown Operation");
}

// 4C2A8FE7EAF24721CC7A9F0175115BD4
void f0_8(string as_0) {
   Comment(as_0);
   if (StringLen(as_0) > 0) Print(as_0);
}

// 799AF68C43B7A1F7C46DFF1272441792
void f0_11() {
   bool is_deleted_0;
   int error_4;
   if (OrderSelect(OrderTicket(), SELECT_BY_TICKET, MODE_TRADES)) {
      for (int li_8 = 1; li_8 <= NumberOfTry; li_8++) {
         if (!IsTesting() && (!IsExpertEnabled()) || IsStopped()) break;
         while (!IsTradeAllowed()) Sleep(5000);
         is_deleted_0 = OrderDelete(OrderTicket(), clDelete);
         if (is_deleted_0) {
            if (!(UseSound)) break;
            PlaySound(NameFileSound);
            return;
         }
         error_4 = GetLastError();
         Print("������ (", error_4, ") ��� �������� BUYSTOP", ": ", ErrorDescription(error_4), ", ������� ", li_8);
         Sleep(5000);
      }
   }
}

// 395A05BD16B9D77F4950469BF7BE5CFD
void f0_4(string as_0 = "", int a_cmd_8 = -1, int a_magic_12 = -1) {
   double point_16;
   double price_24;
   int order_total_32 = OrdersTotal();
   if (as_0 == "0") as_0 = Symbol();
   for (int pos_36 = 0; pos_36 < order_total_32; pos_36++) {
      if (OrderSelect(pos_36, SELECT_BY_POS, MODE_TRADES)) {
         if (OrderSymbol() == as_0 || as_0 == "" && a_cmd_8 < OP_BUY || OrderType() == a_cmd_8) {
            point_16 = MarketInfo(OrderSymbol(), MODE_POINT);
            if (a_magic_12 < 0 || OrderMagicNumber() == a_magic_12) {
               if (OrderType() == OP_BUY) {
                  price_24 = MarketInfo(OrderSymbol(), MODE_BID);
                  if (!TSProfitOnly || price_24 - OrderOpenPrice() > TStop_Buy * point_16)
                     if (OrderStopLoss() < price_24 - (TStop_Buy + TrailingStep - 1) * point_16) f0_20(-1, price_24 - TStop_Buy * point_16, -1);
               }
               if (OrderType() == OP_SELL) {
                  price_24 = MarketInfo(OrderSymbol(), MODE_ASK);
                  if (!TSProfitOnly || OrderOpenPrice() - price_24 > TStop_Sell * point_16)
                     if (OrderStopLoss() > price_24 + (TStop_Sell + TrailingStep - 1) * point_16 || OrderStopLoss() == 0.0) f0_20(-1, price_24 + TStop_Sell * point_16, -1);
               }
            }
         }
      }
   }
}

// F235F73FF9E6C9B0402F9856A41D6B1B
void f0_20(double a_order_open_price_0 = -1.0, double a_order_stoploss_8 = 0.0, double a_order_takeprofit_16 = 0.0, int a_datetime_24 = 0) {
   bool bool_28;
   color color_32;
   double ask_36;
   double bid_44;
   int error_52;
   int digits_56 = MarketInfo(OrderSymbol(), MODE_DIGITS);
   if (a_order_open_price_0 <= 0.0) a_order_open_price_0 = OrderOpenPrice();
   if (a_order_stoploss_8 < 0.0) a_order_stoploss_8 = OrderStopLoss();
   if (a_order_takeprofit_16 < 0.0) a_order_takeprofit_16 = OrderTakeProfit();
   a_order_open_price_0 = NormalizeDouble(a_order_open_price_0, digits_56);
   a_order_stoploss_8 = NormalizeDouble(a_order_stoploss_8, digits_56);
   a_order_takeprofit_16 = NormalizeDouble(a_order_takeprofit_16, digits_56);
   double ld_60 = NormalizeDouble(OrderOpenPrice(), digits_56);
   double ld_68 = NormalizeDouble(OrderStopLoss(), digits_56);
   double ld_76 = NormalizeDouble(OrderTakeProfit(), digits_56);
   if (a_order_open_price_0 != ld_60 || a_order_stoploss_8 != ld_68 || a_order_takeprofit_16 != ld_76) {
      for (int li_84 = 1; li_84 <= NumberOfTry; li_84++) {
         if (!IsTesting() && (!IsExpertEnabled()) || IsStopped()) break;
         while (!IsTradeAllowed()) Sleep(5000);
         RefreshRates();
         bool_28 = OrderModify(OrderTicket(), a_order_open_price_0, a_order_stoploss_8, a_order_takeprofit_16, a_datetime_24, color_32);
         if (bool_28) {
            if (!(UseSound)) break;
            PlaySound(NameFileSound);
            return;
         }
         error_52 = GetLastError();
         ask_36 = MarketInfo(OrderSymbol(), MODE_ASK);
         bid_44 = MarketInfo(OrderSymbol(), MODE_BID);
         Print("Error(", error_52, ") modifying order: ", ErrorDescription(error_52), ", try ", li_84);
         Print("Ask=", ask_36, "  Bid=", bid_44, "  sy=", OrderSymbol(), "  op=" + f0_17(OrderType()), "  pp=", a_order_open_price_0, "  sl=", a_order_stoploss_8, "  tp=",
            a_order_takeprofit_16);
         Sleep(10000);
      }
   }
}

// 3BCCACB4B4383CDE800E153E4E0564E9
double f0_5(string as_0 = "", int a_cmd_8 = -1, int a_magic_12 = -1) {
   double ld_ret_16 = 0;
   int order_total_24 = OrdersTotal();
   if (as_0 == "0") as_0 = Symbol();
   for (int pos_28 = 0; pos_28 < order_total_24; pos_28++) {
      if (OrderSelect(pos_28, SELECT_BY_POS, MODE_TRADES)) {
         if (OrderSymbol() == as_0 || as_0 == "" && a_cmd_8 < OP_BUY || OrderType() == a_cmd_8) {
            if (OrderType() == OP_BUY || OrderType() == OP_SELL)
               if (a_magic_12 < 0 || OrderMagicNumber() == a_magic_12) ld_ret_16 += OrderProfit() + OrderCommission() + OrderSwap();
         }
      }
   }
   return (ld_ret_16);
}

// D44F08D88EC8DF395BC77B10160EC2D8
double f0_18(string as_0 = "", int a_cmd_8 = -1, int a_magic_12 = -1) {
   int datetime_16;
   double order_open_price_20 = 0;
   int order_total_28 = OrdersTotal();
   if (as_0 == "0") as_0 = Symbol();
   for (int pos_32 = 0; pos_32 < order_total_28; pos_32++) {
      if (OrderSelect(pos_32, SELECT_BY_POS, MODE_TRADES)) {
         if (OrderSymbol() == as_0 || as_0 == "") {
            if (OrderType() == OP_BUY || OrderType() == OP_SELL) {
               if (a_cmd_8 < OP_BUY || OrderType() == a_cmd_8) {
                  if (a_magic_12 < 0 || OrderMagicNumber() == a_magic_12) {
                     if (datetime_16 < OrderOpenTime()) {
                        datetime_16 = OrderOpenTime();
                        order_open_price_20 = OrderOpenPrice();
                     }
                  }
               }
            }
         }
      }
   }
   return (order_open_price_20);
}

// 13E391FB27D1D5A3577461A0B0F6FDAA
double f0_1(string as_0 = "", int a_cmd_8 = -1, int a_magic_12 = -1) {
   int datetime_16;
   double order_lots_20 = -1;
   int order_total_28 = OrdersTotal();
   if (as_0 == "0") as_0 = Symbol();
   for (int pos_32 = 0; pos_32 < order_total_28; pos_32++) {
      if (OrderSelect(pos_32, SELECT_BY_POS, MODE_TRADES)) {
         if (OrderSymbol() == as_0 || as_0 == "") {
            if (OrderType() == OP_BUY || OrderType() == OP_SELL) {
               if (a_cmd_8 < OP_BUY || OrderType() == a_cmd_8) {
                  if (a_magic_12 < 0 || OrderMagicNumber() == a_magic_12) {
                     if (datetime_16 < OrderOpenTime()) {
                        datetime_16 = OrderOpenTime();
                        order_lots_20 = OrderLots();
                     }
                  }
               }
            }
         }
      }
   }
   return (order_lots_20);
}

// A076F38073ABEC669F1459B783418EA6
void f0_15(string a_symbol_0, int a_cmd_8, double a_lots_12, double a_price_20 = 0.0, double a_price_28 = 0.0, int a_magic_36 = 0) {
   color color_40;
   int datetime_44;
   double price_48;
   double price_56;
   double price_64;
   int digits_72;
   int error_76;
   int ticket_80 = 0;
   string comment_84 = WindowExpertName() + " " + f0_16(Period());
   if (a_symbol_0 == "" || a_symbol_0 == "0") a_symbol_0 = Symbol();
   if (a_cmd_8 == OP_BUY) color_40 = clOpenBuy;
   else color_40 = clOpenSell;
   for (int li_92 = 1; li_92 <= NumberOfTry; li_92++) {
      if ((!IsTesting()) && IsStopped()) {
         Print("OpenPosition(): ��������� ������ �������");
         return;
      }
      while (!IsTradeAllowed()) Sleep(5000);
      RefreshRates();
      digits_72 = MarketInfo(a_symbol_0, MODE_DIGITS);
      price_56 = MarketInfo(a_symbol_0, MODE_ASK);
      price_64 = MarketInfo(a_symbol_0, MODE_BID);
      if (a_cmd_8 == OP_BUY) price_48 = price_56;
      else price_48 = price_64;
      price_48 = NormalizeDouble(price_48, digits_72);
      datetime_44 = TimeCurrent();
      ticket_80 = OrderSend(a_symbol_0, a_cmd_8, a_lots_12, price_48, Slippage, a_price_20, a_price_28, comment_84, a_magic_36, 0, color_40);
      if (ticket_80 > 0) {
         if (!(UseSound)) break;
         PlaySound(NameFileSound);
         return;
      }
      error_76 = GetLastError();
      if (price_56 == 0.0 && price_64 == 0.0) f0_8("��������� � ������ ����� ������� ������� " + a_symbol_0);
      Print("Error(", error_76, ") opening position: ", ErrorDescription(error_76), ", try ", li_92);
      Print("Ask=", price_56, " Bid=", price_64, " sy=", a_symbol_0, " ll=", a_lots_12, " op=", f0_17(a_cmd_8), " pp=", price_48, " sl=", a_price_20, " tp=", a_price_28,
         " mn=", a_magic_36);
      if (error_76 == 2/* COMMON_ERROR */ || error_76 == 64/* ACCOUNT_DISABLED */ || error_76 == 65/* INVALID_ACCOUNT */ || error_76 == 133/* TRADE_DISABLED */) {
         gi_264 = TRUE;
         return;
      }
      if (error_76 == 4/* SERVER_BUSY */ || error_76 == 131/* INVALID_TRADE_VOLUME */ || error_76 == 132/* MARKET_CLOSED */) {
         Sleep(300000);
         return;
      }
      if (error_76 == 128/* TRADE_TIMEOUT */ || error_76 == 142 || error_76 == 143) {
         Sleep(66666.0);
         if (f0_6(a_symbol_0, a_cmd_8, a_magic_36, datetime_44)) {
            if (!(UseSound)) break;
            PlaySound(NameFileSound);
            return;
         }
      }
      if (error_76 == 140/* LONG_POSITIONS_ONLY_ALLOWED */ || error_76 == 148/* TRADE_TOO_MANY_ORDERS */ || error_76 == 4110/* LONGS__NOT_ALLOWED */ || error_76 == 4111/* SHORTS_NOT_ALLOWED */) break;
      if (error_76 == 141/* TOO_MANY_REQUESTS */) Sleep(100000);
      if (error_76 == 145/* TRADE_MODIFY_DENIED */) Sleep(17000);
      if (error_76 == 146/* TRADE_CONTEXT_BUSY */) while (IsTradeContextBusy()) Sleep(11000);
      if (error_76 != 135/* PRICE_CHANGED */) Sleep(7700.0);
   }
}

// 436F5A19B3A03B7E56C5A3C6E5948369
bool f0_6(string as_0 = "", int a_cmd_8 = -1, int a_magic_12 = -1, int ai_16 = 0) {
   int order_total_20 = OrdersTotal();
   if (as_0 == "0") as_0 = Symbol();
   for (int pos_24 = 0; pos_24 < order_total_20; pos_24++) {
      if (OrderSelect(pos_24, SELECT_BY_POS, MODE_TRADES)) {
         if (OrderSymbol() == as_0 || as_0 == "") {
            if (OrderType() == OP_BUY || OrderType() == OP_SELL) {
               if (a_cmd_8 < OP_BUY || OrderType() == a_cmd_8) {
                  if (a_magic_12 < 0 || OrderMagicNumber() == a_magic_12)
                     if (ai_16 <= OrderOpenTime()) return (TRUE);
               }
            }
         }
      }
   }
   return (FALSE);
}

// 95E590D5BA8DB02B9CDAD0FB1F345D85
int f0_12() {
   if (g_time_280 == Time[0]) return (0);
   g_time_280 = Time[0];
   return (1);
}

// 748592AF014F215B4EB24DFF53177209
int f0_10(string as_0 = "", int a_cmd_8 = -1, int a_magic_12 = -1) {
   int order_total_16 = OrdersTotal();
   int count_20 = 0;
   if (as_0 == "0") as_0 = Symbol();
   for (int pos_24 = 0; pos_24 < order_total_16; pos_24++) {
      if (OrderSelect(pos_24, SELECT_BY_POS, MODE_TRADES)) {
         if (OrderSymbol() == as_0 || as_0 == "") {
            if (OrderType() == OP_BUY || OrderType() == OP_SELL) {
               if (a_cmd_8 < OP_BUY || OrderType() == a_cmd_8)
                  if (a_magic_12 < 0 || OrderMagicNumber() == a_magic_12) count_20++;
            }
         }
      }
   }
   return (count_20);
}

// 059B0D4DA2C19C05E682F73846603B50
void f0_0(string as_0 = "", int a_cmd_8 = -1, int a_magic_12 = -1) {
   int order_total_16 = OrdersTotal();
   if (as_0 == "0") as_0 = Symbol();
   for (int pos_20 = order_total_16 - 1; pos_20 >= 0; pos_20--) {
      if (OrderSelect(pos_20, SELECT_BY_POS, MODE_TRADES)) {
         if (OrderSymbol() == as_0 || as_0 == "" && a_cmd_8 < OP_BUY || OrderType() == a_cmd_8) {
            if (OrderType() == OP_BUY || OrderType() == OP_SELL) {
               if (a_magic_12 < 0 || OrderMagicNumber() == a_magic_12)
                  if (OrderProfit() + OrderSwap() > 0.0) f0_9();
            }
         }
      }
   }
   order_total_16 = OrdersTotal();
   for (pos_20 = order_total_16 - 1; pos_20 >= 0; pos_20--) {
      if (OrderSelect(pos_20, SELECT_BY_POS, MODE_TRADES)) {
         if (OrderSymbol() == as_0 || as_0 == "" && a_cmd_8 < OP_BUY || OrderType() == a_cmd_8) {
            if (OrderType() == OP_BUY || OrderType() == OP_SELL)
               if (a_magic_12 < 0 || OrderMagicNumber() == a_magic_12) f0_9();
         }
      }
   }
}

// 5AEEEB0339BF3B809576C8AEEC9E9A92
void f0_9() {
   bool is_closed_0;
   color color_4;
   double order_lots_8;
   double price_16;
   double price_24;
   double price_32;
   int error_40;
   if (OrderType() == OP_BUY || OrderType() == OP_SELL) {
      for (int li_44 = 1; li_44 <= NumberOfTry; li_44++) {
         if (!IsTesting() && (!IsExpertEnabled()) || IsStopped()) break;
         while (!IsTradeAllowed()) Sleep(5000);
         RefreshRates();
         price_16 = MarketInfo(OrderSymbol(), MODE_ASK);
         price_24 = MarketInfo(OrderSymbol(), MODE_BID);
         if (OrderType() == OP_BUY) {
            price_32 = price_24;
            color_4 = clCloseBuy;
         } else {
            price_32 = price_16;
            color_4 = clCloseSell;
         }
         order_lots_8 = OrderLots();
         is_closed_0 = OrderClose(OrderTicket(), order_lots_8, price_32, Slippage, color_4);
         if (is_closed_0) {
            if (!(UseSound)) break;
            PlaySound(NameCloseSound);
            return;
         }
         error_40 = GetLastError();
         if (error_40 == 146/* TRADE_CONTEXT_BUSY */) while (IsTradeContextBusy()) Sleep(11000);
         Print("Error(", error_40, ") Close ", f0_17(OrderType()), " ", ErrorDescription(error_40), ", try ", li_44);
         Print(OrderTicket(), "  Ask=", price_16, "  Bid=", price_24, "  pp=", price_32);
         Print("sy=", OrderSymbol(), "  ll=", order_lots_8, "  sl=", OrderStopLoss(), "  tp=", OrderTakeProfit(), "  mn=", OrderMagicNumber());
         Sleep(5000);
      }
   } else Print("������������ �������� ��������. Close ", f0_17(OrderType()));
}

// EB671871E905D094DA2FBE0F08C35C46
void f0_19(string as_0 = "", int a_cmd_8 = -1, int a_magic_12 = -1) {
   double point_16;
   double price_24;
   int order_total_32 = OrdersTotal();
   if (as_0 == "0") as_0 = Symbol();
   for (int pos_36 = 0; pos_36 < order_total_32; pos_36++) {
      if (OrderSelect(pos_36, SELECT_BY_POS, MODE_TRADES)) {
         if (OrderSymbol() == as_0 || as_0 == "" && a_cmd_8 < OP_BUY || OrderType() == a_cmd_8) {
            point_16 = MarketInfo(OrderSymbol(), MODE_POINT);
            if (a_magic_12 < 0 || OrderMagicNumber() == a_magic_12 && TRL < TakeProfit_Av) {
               if (OrderType() == OP_BUY) {
                  price_24 = MarketInfo(OrderSymbol(), MODE_BID);
                  if (OrderStopLoss() < price_24 - TakeProfit_Av * point_16) f0_20(-1, price_24 - TRL * point_16, -1);
               }
               if (OrderType() == OP_SELL) {
                  price_24 = MarketInfo(OrderSymbol(), MODE_ASK);
                  if (OrderStopLoss() > price_24 + TakeProfit_Av * point_16 || OrderStopLoss() == 0.0) f0_20(-1, price_24 + TRL * point_16, -1);
               }
            }
         }
      }
   }
}
        
