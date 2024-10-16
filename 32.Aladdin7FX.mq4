//+------------------------------------------------------------------+
//|                                                32.Aladdin7FX.mq4 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
//
#property copyright "Copyright � 2012, Finans Plus "
#property link      "http://www.finans-plus.ru"

extern string EA_Name = "Aladdin 7 FX Pro";
extern string Creator = "Copyright � 2012, Finans Plus";
extern string Options1 = "��������";
extern bool UseStopLevels = TRUE;
extern bool IsMarketExecution = FALSE;
extern double MaxSpread = 2.0;
extern double OpenSlippage = 2.0;
extern double CloseSlippage = 3.0;
extern string Option2 = "��������� �����";
extern int TakeProfit = 26;
extern int StopLoss = 120;
extern int GoProfit = 1;
extern int GoProfitTriger = 10;
extern int MaxLossPoints = -65;
extern string Options3 = "��������� MM";
extern double FixedLot = 0.1;
extern double AutoMM = 0.0;
extern double AutoMM_Max = 20.0;
extern bool RecoveryMode = FALSE;
extern string Opt1 = "---If RecoveryMode = TRUE, setup---";
extern int MaxAnalizCount = 50;
extern double Risk = 25.0;
extern double MultiLotPercent = 1.1;
extern string Options4 = "��������� ���������";
extern double TrailingStop = 0.0;
extern double TrailingStep = 0.0;
extern double Utral = 10.0;
extern string Options5 = "������� �����������";
extern int iMA_Period = 75;
extern int iCCI_Period = 18;
extern int iATR_Period = 14;
extern int iWPR_Period = 11;
extern int maMethod = 2;
int g_applied_price_284 = PRICE_CLOSE;
extern string Profoptions6 = "��������� �����������";
extern bool Optimization = FALSE;
extern string _AddOpenFilters = "����";
extern int FilterATR = 6;
extern double iCCI_OpenFilter = 150.0;
extern string _OpenOrderFilters = "��������";
extern int iMA_Filter_Open_a = 15;
extern int iMA_Filter_Open_b = 39;
extern int iWPR_Filter_Open_a = -99;
extern int iWPR_Filter_Open_b = -95;
extern string _CloseOrderFilters = "�����";
extern int Price_Filter_Close = 14;
extern int iWPR_Filter_Close = -19;
extern string Options7 = "����������� ���������";
extern bool LongTrade = TRUE;
extern bool ShortTrade = TRUE;
extern bool No_Hedge_Trades = TRUE;
extern bool OneOrderInBarMode = TRUE;
int gi_384 = 5;
extern int MagicNumber = 88888;
bool gi_392 = TRUE;
bool gi_396 = TRUE;
bool gi_400 = TRUE;
extern string End = "*** Good Luck ***";
double gd_412;
double gd_420;
int gi_428;
double gd_432;
string gs_440;
int g_slippage_448;
int gi_unused_452;
int gi_unused_456 = 1;
int g_bars_460;
double gd_464;
bool gi_472;
bool gi_476;
string g_comment_480 = "Aladdin 7 FX Pro";
int gi_488 = 0;
double g_minlot_492 = 0.01;
double g_maxlot_500 = 0.01;
double g_lotstep_508 = 0.01;
int gi_516 = 100000;
double g_marginrequired_520 = 1000.0;
double gd_528 = 1.0;
double gd_536;
int gi_544;
int gi_548;
int gi_552;
int gi_556;
int gi_560;
int gi_564;
int g_color_568 = Blue;
int g_color_572 = Red;
int g_color_576 = DodgerBlue;
int g_color_580 = DeepPink;

void init() {
   if (IsTesting() && (!IsVisualMode())) {
      gi_400 = FALSE;
      OneOrderInBarMode = FALSE;
   }
   if (!gi_400) Comment("");
   gs_440 = Symbol();
   if (Digits < 4) {
      gd_420 = 0.01;
      gi_428 = 2;
      gd_432 = 0.001;
      gd_412 = 1;
   } else {
      gd_420 = 0.0001;
      gi_428 = 4;
      gd_432 = 0.00001;
      gd_412 = 10;
   }
   g_slippage_448 = OpenSlippage * MathPow(10, Digits - gi_428);
   gi_unused_452 = CloseSlippage * MathPow(10, Digits - gi_428);
   gd_464 = NormalizeDouble(MaxSpread * gd_420, gi_428 + 1);
   if (ObjectFind("BKGR") >= 0) ObjectDelete("BKGR");
   if (ObjectFind("BKGR2") >= 0) ObjectDelete("BKGR2");
   if (ObjectFind("BKGR3") >= 0) ObjectDelete("BKGR3");
   if (ObjectFind("BKGR4") >= 0) ObjectDelete("BKGR4");
   if (ObjectFind("LV") >= 0) ObjectDelete("LV");
   g_minlot_492 = MarketInfo(Symbol(), MODE_MINLOT);
   g_maxlot_500 = MarketInfo(Symbol(), MODE_MAXLOT);
   gi_516 = MarketInfo(Symbol(), MODE_LOTSIZE);
   g_lotstep_508 = MarketInfo(Symbol(), MODE_LOTSTEP);
   g_marginrequired_520 = MarketInfo(Symbol(), MODE_MARGINREQUIRED);
   double ld_0 = 0;
   if (StringSubstr(AccountCurrency(), 0, 3) == "JPY") {
      ld_0 = MarketInfo("USDJPY" + StringSubstr(Symbol(), 6), MODE_BID);
      if (ld_0 > 0.1) gd_528 = ld_0;
      else gd_528 = 84;
   }
   if (StringSubstr(AccountCurrency(), 0, 3) == "GBP") {
      ld_0 = MarketInfo("GBPUSD" + StringSubstr(Symbol(), 6), MODE_BID);
      if (ld_0 > 0.1) gd_528 = 1 / ld_0;
      else gd_528 = 0.6211180124;
   }
   if (StringSubstr(AccountCurrency(), 0, 3) == "EUR") {
      ld_0 = MarketInfo("EURUSD" + StringSubstr(Symbol(), 6), MODE_BID);
      if (ld_0 > 0.1) gd_528 = 1 / ld_0;
      else gd_528 = 0.7042253521;
   }
   gi_544 = iWPR_Filter_Open_a;
   gi_548 = iWPR_Filter_Open_b;
   gi_552 = (-100) - iWPR_Filter_Open_a;
   gi_556 = (-100) - iWPR_Filter_Open_b;
   gi_560 = iWPR_Filter_Close;
   gi_564 = (-100) - iWPR_Filter_Close;
}

void deinit() {
   if (ObjectFind("BKGR") >= 0) ObjectDelete("BKGR");
   if (ObjectFind("BKGR2") >= 0) ObjectDelete("BKGR2");
   if (ObjectFind("BKGR3") >= 0) ObjectDelete("BKGR3");
   if (ObjectFind("BKGR4") >= 0) ObjectDelete("BKGR4");
   if (ObjectFind("LV") >= 0) ObjectDelete("LV");
}

void start() {
   int li_0 = 0;
   if (!IsDemo() && !IsTradeAllowed()) {
      li_0 = 1;
      Comment("\n", "������ ������ Aladdin 7 FX ��� ����-������, ��� �������� ������ �������� ���� http://finans-plus.ru. ");
      return;
   }
   li_0 = 2;
   if (gi_400) f0_8();
   f0_5();
   f0_18();
   if (AutoMM > 0.0 && (!RecoveryMode)) gd_536 = MathMax(g_minlot_492, MathMin(g_maxlot_500, MathCeil(MathMin(AutoMM_Max, AutoMM) / gd_528 / 100.0 * AccountFreeMargin() / g_lotstep_508 / (gi_516 / 100)) * g_lotstep_508));
   if (AutoMM > 0.0 && RecoveryMode) gd_536 = f0_1();
   if (AutoMM == 0.0) gd_536 = FixedLot;
   if (iBars(Symbol(), PERIOD_M15) < iMA_Period || iBars(Symbol(), PERIOD_M15) < iWPR_Period || iBars(Symbol(), PERIOD_M15) < iATR_Period || iBars(Symbol(), PERIOD_M15) < iCCI_Period) {
      Print("������������ ������������ ������ ��� ��������");
      return;
   }
   if (DayOfWeek() == 1 && iVolume(NULL, PERIOD_D1, 0) < 5.0) return;
   if (!IsTesting() && IsStopped()) return;
   if (!IsTesting() && !IsTradeAllowed()) return;
   if (!IsTesting() && IsTradeContextBusy()) return;
   HideTestIndicators(TRUE);
   if (li_0 == 2) f0_11();
}

void f0_11() {
   bool li_0 = TRUE;
   bool li_4 = TRUE;
   if (No_Hedge_Trades == TRUE && f0_16(OP_SELL)) li_0 = FALSE;
   if (No_Hedge_Trades == TRUE && f0_16(OP_BUY)) li_4 = FALSE;
   if (f0_14()) {
      if (f0_7() && (!f0_16(OP_BUY)) && li_0 && f0_15(OP_BUY) && LongTrade) {
         if (f0_0()) {
            if ((!gi_472) && gi_396) {
               Print("�������� ������ �� ������� �������� ��-�� �������� ������.");
               Print("������� ����� = ", DoubleToStr((Ask - Bid) / gd_420, 1), ",  MaxSpread = ", DoubleToStr(MaxSpread, 1));
               Print("������� Aladdin7FX ����� ��������� �����, ����� ����� ������ ����������.");
            }
            gi_472 = TRUE;
         } else {
            gi_472 = FALSE;
            f0_6(OP_BUY);
         }
      }
      if (f0_9() && (!f0_16(OP_SELL)) && li_4 && f0_15(OP_SELL) && ShortTrade) {
         if (f0_0()) {
            if ((!gi_476) && gi_396) {
               Print("�������� ������ �� ������� �������� ��-�� �������� ������.");
               Print("������� ����� = ", DoubleToStr((Ask - Bid) / gd_420, 1), ",  MaxSpread = ", DoubleToStr(MaxSpread, 1));
               Print("������� Aladdin7FX ����� ��������� �����, ����� ����� ������ ����������.");
            }
            gi_476 = TRUE;
         } else {
            gi_476 = FALSE;
            f0_6(OP_SELL);
         }
      }
   }
}

void f0_6(int a_cmd_0) {
   int li_4;
   color color_8;
   string ls_unused_20;
   double price_28;
   double price_52;
   double price_60;
   int ticket_12 = 0;
   int li_36 = gi_384;
   int error_40 = 0;
   double price_44 = 0;
   double ld_68 = NormalizeDouble(TakeProfit * gd_420, gi_428);
   double ld_76 = NormalizeDouble(StopLoss * gd_420, gi_428);
   if (gi_488 > 0) {
      MathSrand(TimeLocal());
      li_4 = MathRand() % gi_488;
      if (gi_392) Print("DelayRandomiser: �������� ", li_4, " ������.");
      Sleep(1000 * li_4);
   }
   double ld_84 = gd_536;
   if (AccountFreeMarginCheck(gs_440, a_cmd_0, ld_84) <= 0.0 || GetLastError() == 134/* NOT_ENOUGH_MONEY */) {
      if (gi_396) {
         Print("��� �������� ������ ������������ ��������� �����.");
         Comment("��� �������� ������ ������������ ��������� �����.");
      }
   } else {
      RefreshRates();
      if (a_cmd_0 == OP_BUY) {
         price_28 = NormalizeDouble(Ask, Digits);
         color_8 = g_color_568;
         if (UseStopLevels) {
            price_52 = NormalizeDouble(price_28 + ld_68, Digits);
            price_60 = NormalizeDouble(price_28 - ld_76, Digits);
         } else {
            price_52 = 0;
            price_60 = 0;
         }
      } else {
         price_28 = NormalizeDouble(Bid, Digits);
         color_8 = g_color_572;
         if (UseStopLevels) {
            price_52 = NormalizeDouble(price_28 - ld_68, Digits);
            price_60 = NormalizeDouble(price_28 + ld_76, Digits);
         } else {
            price_52 = 0;
            price_60 = 0;
         }
      }
      if (IsMarketExecution && UseStopLevels) {
         ticket_12 = OrderSend(gs_440, a_cmd_0, ld_84, price_28, g_slippage_448, 0, 0, g_comment_480, MagicNumber, 0, color_8);
         if (ticket_12 > 0) {
            f0_17(gs_440, ticket_12, OrderOpenPrice(), price_60, price_52, Black);
            return;
         }
      } else {
         ticket_12 = OrderSend(gs_440, a_cmd_0, ld_84, price_28, g_slippage_448, price_60, price_52, g_comment_480, MagicNumber, 0, color_8);
         if (ticket_12 > 0) return;
      }
      if (a_cmd_0 != OP_BUY && a_cmd_0 != OP_SELL) return;
      error_40 = GetLastError();
      if (ticket_12 < 0 && error_40 == 135/* PRICE_CHANGED */ || error_40 == 138/* REQUOTE */ || error_40 == 146/* TRADE_CONTEXT_BUSY */) {
         Print("Requote. Error" + error_40 + ". Ticket: " + ticket_12);
         price_44 = price_28;
         for (int li_92 = 1; li_92 <= li_36; li_92++) {
            RefreshRates();
            if (a_cmd_0 == OP_BUY) {
               if (Ask <= price_44) {
                  if (IsMarketExecution && UseStopLevels) {
                     ticket_12 = OrderSend(gs_440, a_cmd_0, ld_84, NormalizeDouble(Ask, Digits), g_slippage_448, 0, 0, g_comment_480, MagicNumber, 0, color_8);
                     if (ticket_12 > 0) {
                        f0_17(gs_440, ticket_12, OrderOpenPrice(), price_60, price_52, Black);
                        return;
                     }
                  } else {
                     ticket_12 = OrderSend(gs_440, a_cmd_0, ld_84, NormalizeDouble(Ask, Digits), g_slippage_448, price_60, price_52, g_comment_480, MagicNumber, 0, color_8);
                     if (ticket_12 > 0) break;
                  }
                  if (GetLastError() != 135/* PRICE_CHANGED */ && GetLastError() != 138/* REQUOTE */ && GetLastError() != 146/* TRADE_CONTEXT_BUSY */) break;
                  Print("Requote. " + "Attempt " + ((li_92 + 1)));
                  continue;
               }
            }
            if (a_cmd_0 == OP_SELL) {
               if (Bid >= price_44) {
                  if (IsMarketExecution && UseStopLevels) {
                     ticket_12 = OrderSend(gs_440, a_cmd_0, ld_84, NormalizeDouble(Bid, Digits), g_slippage_448, 0, 0, g_comment_480, MagicNumber, 0, color_8);
                     if (ticket_12 > 0) {
                        f0_17(gs_440, ticket_12, OrderOpenPrice(), price_60, price_52, Black);
                        return;
                     }
                  } else {
                     ticket_12 = OrderSend(gs_440, a_cmd_0, ld_84, NormalizeDouble(Bid, Digits), g_slippage_448, price_60, price_52, g_comment_480, MagicNumber, 0, color_8);
                     if (ticket_12 > 0) break;
                  }
                  if (GetLastError() != 135/* PRICE_CHANGED */ && GetLastError() != 138/* REQUOTE */ && GetLastError() != 146/* TRADE_CONTEXT_BUSY */) break;
                  Print("Requote. " + "Attempt " + ((ticket_12 + 1)));
               }
            }
         }
      }
   }
}

void f0_18() {
   int li_0 = OrdersTotal() - 1;
   int error_4 = GetLastError();
   for (int pos_8 = li_0; pos_8 >= 0; pos_8--) {
      if (!OrderSelect(pos_8, SELECT_BY_POS, MODE_TRADES)) {
         if (gi_396) Print("��������� ������ �� ����� ������� ������. �������: ", f0_13(error_4));
      } else {
         if (OrderType() == OP_BUY && GoProfitTriger > 0) {
            if (OrderMagicNumber() == MagicNumber && OrderSymbol() == gs_440) {
               if (Bid - OrderOpenPrice() > GoProfitTriger * gd_420 && MathAbs(OrderOpenPrice() + GoProfit * gd_420 - OrderStopLoss()) >= Point && NormalizeDouble(OrderOpenPrice() +
                  GoProfit * gd_420, Digits) >= OrderStopLoss() + Point) f0_17(gs_440, OrderTicket(), OrderOpenPrice(), NormalizeDouble(OrderOpenPrice() + GoProfit * gd_420, Digits), OrderTakeProfit(), Blue);
            }
         }
         if (OrderType() == OP_SELL && GoProfitTriger > 0) {
            if (OrderMagicNumber() == MagicNumber && OrderSymbol() == gs_440) {
               if (OrderOpenPrice() - Ask > GoProfitTriger * gd_420 && MathAbs(OrderOpenPrice() - GoProfit * gd_420 - OrderStopLoss()) >= Point && NormalizeDouble(OrderOpenPrice() - GoProfit * gd_420,
                  Digits) <= OrderStopLoss() - Point) f0_17(gs_440, OrderTicket(), OrderOpenPrice(), NormalizeDouble(OrderOpenPrice() - GoProfit * gd_420, Digits), OrderTakeProfit(), Red);
            }
         }
         if (TrailingStop > 1.0 && OrderMagicNumber() == MagicNumber) {
            if (OrderType() == OP_SELL && OrderOpenPrice() - Ask > Utral * Point * gd_412) {
               if (TrailingStop > 0.0 && TrailingStop > 1.0) {
                  if (OrderOpenPrice() - Ask > TrailingStop * Point * gd_412)
                     if (OrderStopLoss() - Point * TrailingStep * gd_412 > Ask + Point * TrailingStop * gd_412 && Ask + Point * TrailingStop * gd_412 <= OrderStopLoss() - Point) OrderModify(OrderTicket(), OrderOpenPrice(), Ask + Point * TrailingStop * gd_412, OrderTakeProfit(), 0, CLR_NONE);
               }
            } else {
               if (OrderType() == OP_BUY && Bid - OrderOpenPrice() > Utral * Point * gd_412) {
                  if (TrailingStop > 0.0 && TrailingStop > 1.0) {
                     if (Bid - OrderOpenPrice() > TrailingStop * Point * gd_412)
                        if (OrderStopLoss() + Point * TrailingStep * gd_412 < Bid - Point * TrailingStop * gd_412 && Bid - Point * TrailingStop * gd_412 >= OrderStopLoss() + Point) OrderModify(OrderTicket(), OrderOpenPrice(), Bid - Point * TrailingStop * gd_412, OrderTakeProfit(), 0, CLR_NONE);
                  }
               }
            }
         }
         if (TrailingStop < 1.0 && OrderMagicNumber() == MagicNumber) {
            if (OrderType() == OP_SELL && TrailingStop < 1.0) {
               if (TrailingStop <= 0.0) continue;
               if (OrderOpenPrice() - Ask <= Utral * Point * gd_412) continue;
               if (!(OrderStopLoss() - Point * TrailingStep * gd_412 > Ask + (OrderOpenPrice() - Ask) * TrailingStop && Ask + (OrderOpenPrice() - Ask) * TrailingStop <= OrderStopLoss() - Point)) continue;
               OrderModify(OrderTicket(), OrderOpenPrice(), Ask + (OrderOpenPrice() - Ask) * TrailingStop, OrderTakeProfit(), 0, CLR_NONE);
               continue;
            }
            if (OrderType() == OP_BUY) {
               if (TrailingStop > 0.0 && TrailingStop < 1.0) {
                  if (Bid - OrderOpenPrice() > Utral * Point * gd_412) {
                     if (OrderStopLoss() + Point * TrailingStep * gd_412 < Bid - (Bid - OrderOpenPrice()) * TrailingStop && Bid - (Bid - OrderOpenPrice()) * TrailingStop >= OrderStopLoss() +
                        Point) OrderModify(OrderTicket(), OrderOpenPrice(), Bid - (Bid - OrderOpenPrice()) * TrailingStop, OrderTakeProfit(), 0, CLR_NONE);
                  }
               }
            }
         }
      }
   }
}

void f0_17(string a_symbol_0 = "", int a_ticket_8 = 0, double a_order_open_price_12 = -1.0, double a_order_stoploss_20 = 0.0, double a_order_takeprofit_28 = 0.0, color a_color_36 = -1) {
   bool bool_44;
   int error_52;
   int ticket_40 = OrderTicket();
   if (a_symbol_0 == "") a_symbol_0 = Symbol();
   int li_60 = 5;
   int li_64 = 10;
   if (a_order_open_price_12 <= 0.0) a_order_open_price_12 = OrderOpenPrice();
   if (a_order_stoploss_20 < 0.0) a_order_stoploss_20 = OrderStopLoss();
   if (a_order_takeprofit_28 < 0.0) a_order_takeprofit_28 = OrderTakeProfit();
   int digits_48 = MarketInfo(a_symbol_0, MODE_DIGITS);
   a_order_open_price_12 = NormalizeDouble(a_order_open_price_12, digits_48);
   a_order_stoploss_20 = NormalizeDouble(a_order_stoploss_20, digits_48);
   a_order_takeprofit_28 = NormalizeDouble(a_order_takeprofit_28, digits_48);
   if (a_order_open_price_12 != OrderOpenPrice() || a_order_stoploss_20 != OrderStopLoss() || a_order_takeprofit_28 != OrderTakeProfit()) {
      for (int li_56 = 1; li_56 <= li_64; li_56++) {
         if (!IsTesting() && (!IsExpertEnabled()) || IsStopped()) break;
         while (!IsTradeAllowed()) Sleep(5000);
         RefreshRates();
         bool_44 = OrderModify(a_ticket_8, a_order_open_price_12, a_order_stoploss_20, a_order_takeprofit_28, 0, a_color_36);
         if (bool_44 == TRUE) break;
         error_52 = GetLastError();
         if (gi_396) Print("��������� ������ �� ����� ����������� ������ (", f0_10(OrderType()), ",", ticket_40, "). �������: ", f0_13(error_52), ". ������� �", li_56);
         Sleep(1000 * li_60);
      }
   }
}

void f0_5() {
   int li_0 = OrdersTotal() - 1;
   int error_4 = GetLastError();
   for (int pos_8 = li_0; pos_8 >= 0; pos_8--) {
      if (!OrderSelect(pos_8, SELECT_BY_POS, MODE_TRADES)) {
         if (gi_396) Print("��������� ������ �� ����� ������� ������. �������: ", f0_13(error_4));
      } else {
         if (OrderType() == OP_BUY) {
            if (OrderMagicNumber() == MagicNumber && OrderSymbol() == gs_440)
               if (Bid >= OrderOpenPrice() + TakeProfit * gd_420 || Bid <= OrderOpenPrice() - StopLoss * gd_420 || f0_2(OrderOpenPrice(), f0_3())) f0_12(OrderTicket(), Bid);
         }
         if (OrderType() == OP_SELL) {
            if (OrderMagicNumber() == MagicNumber && OrderSymbol() == gs_440)
               if (Ask <= OrderOpenPrice() - TakeProfit * gd_420 || Ask >= OrderOpenPrice() + StopLoss * gd_420 || f0_4(OrderOpenPrice(), f0_3())) f0_12(OrderTicket(), Ask);
         }
      }
   }
}

void f0_12(int a_ticket_0, double ad_4) {
   double price_12;
   int slippage_20;
   color color_36;
   double ld_24 = ad_4;
   int li_32 = gi_384;
   OrderSelect(a_ticket_0, SELECT_BY_TICKET, MODE_TRADES);
   int cmd_40 = OrderType();
   if (cmd_40 == OP_BUY) {
      price_12 = NormalizeDouble(Bid, Digits);
      color_36 = g_color_576;
   }
   if (cmd_40 == OP_SELL) {
      price_12 = NormalizeDouble(Ask, Digits);
      color_36 = g_color_580;
   }
   if (MathAbs(OrderTakeProfit() - price_12) > MarketInfo(Symbol(), MODE_FREEZELEVEL) * Point) {
      if (MathAbs(OrderStopLoss() - price_12) > MarketInfo(Symbol(), MODE_FREEZELEVEL) * Point) {
         if (OrderClose(a_ticket_0, OrderLots(), price_12, CloseSlippage, color_36) == FALSE) {
            if (GetLastError() != 135/* PRICE_CHANGED */ && GetLastError() != 138/* REQUOTE */ && GetLastError() != 146/* TRADE_CONTEXT_BUSY */) return;
            Print("Requote");
            for (int li_44 = 1; li_44 <= li_32; li_44++) {
               RefreshRates();
               if (cmd_40 == OP_BUY) {
                  slippage_20 = MathRound((Bid - ld_24) / gd_420);
                  if (Bid >= ld_24) {
                     Print("Closing order. Attempt " + ((li_44 + 1)));
                     if (OrderClose(a_ticket_0, OrderLots(), NormalizeDouble(Bid, Digits), slippage_20, color_36)) break;
                     if (!((GetLastError() != 135/* PRICE_CHANGED */ && GetLastError() != 138/* REQUOTE */ && GetLastError() != 146/* TRADE_CONTEXT_BUSY */))) continue;
                     return;
                  }
               }
               if (cmd_40 == OP_SELL) {
                  slippage_20 = MathRound((ld_24 - Ask) / gd_420);
                  if (ld_24 >= Ask) {
                     Print("Closing order. Attempt " + ((li_44 + 1)));
                     if (OrderClose(a_ticket_0, OrderLots(), NormalizeDouble(Ask, Digits), slippage_20, color_36)) break;
                     if (GetLastError() != 135/* PRICE_CHANGED */ && GetLastError() != 138/* REQUOTE */ && GetLastError() != 146/* TRADE_CONTEXT_BUSY */) break;
                  }
               }
            }
         }
      }
   }
}

int f0_7() {
   bool li_ret_0 = FALSE;
   bool li_4 = FALSE;
   bool li_8 = FALSE;
   bool li_12 = FALSE;
   double iclose_16 = iClose(NULL, PERIOD_M15, 1);
   double ima_24 = iMA(NULL, PERIOD_M15, iMA_Period, 0, maMethod, g_applied_price_284, 1);
   double iwpr_32 = iWPR(NULL, PERIOD_M15, iWPR_Period, 1);
   double iatr_40 = iATR(NULL, PERIOD_M15, iATR_Period, 1);
   double icci_48 = iCCI(NULL, PERIOD_M15, iCCI_Period, PRICE_TYPICAL, 1);
   double ld_56 = NormalizeDouble(iMA_Filter_Open_a * gd_420, gi_428);
   double ld_64 = NormalizeDouble(iMA_Filter_Open_b * gd_420, gi_428);
   double bid_72 = Bid;
   if (iatr_40 <= FilterATR * gd_420) return (0);
   if (iclose_16 - ima_24 > ld_56 && iclose_16 - bid_72 >= (-gd_432) && gi_544 > iwpr_32) li_4 = TRUE;
   else li_4 = FALSE;
   if (iclose_16 - ima_24 > ld_64 && iclose_16 - bid_72 >= (-gd_432) && (-iCCI_OpenFilter) > icci_48) li_8 = TRUE;
   else li_8 = FALSE;
   if (iclose_16 - ima_24 > ld_64 && iclose_16 - bid_72 >= (-gd_432) && gi_548 > iwpr_32) li_12 = TRUE;
   else li_12 = FALSE;
   if (li_4 == TRUE || li_8 == TRUE || li_12 == TRUE) li_ret_0 = TRUE;
   else li_ret_0 = FALSE;
   return (li_ret_0);
}

int f0_9() {
   bool li_ret_0 = FALSE;
   bool li_4 = FALSE;
   bool li_8 = FALSE;
   bool li_12 = FALSE;
   double iclose_16 = iClose(NULL, PERIOD_M15, 1);
   double ima_24 = iMA(NULL, PERIOD_M15, iMA_Period, 0, maMethod, g_applied_price_284, 1);
   double iwpr_32 = iWPR(NULL, PERIOD_M15, iWPR_Period, 1);
   double iatr_40 = iATR(NULL, PERIOD_M15, iATR_Period, 1);
   double icci_48 = iCCI(NULL, PERIOD_M15, iCCI_Period, PRICE_TYPICAL, 1);
   double ld_56 = NormalizeDouble(iMA_Filter_Open_a * gd_420, gi_428);
   double ld_64 = NormalizeDouble(iMA_Filter_Open_b * gd_420, gi_428);
   double bid_72 = Bid;
   if (iatr_40 <= FilterATR * gd_420) return (0);
   if (ima_24 - iclose_16 > ld_56 && iclose_16 - bid_72 <= gd_432 && iwpr_32 > gi_552) li_4 = TRUE;
   else li_4 = FALSE;
   if (ima_24 - iclose_16 > ld_64 && iclose_16 - bid_72 <= gd_432 && icci_48 > iCCI_OpenFilter) li_8 = TRUE;
   else li_8 = FALSE;
   if (ima_24 - iclose_16 > ld_64 && iclose_16 - bid_72 <= gd_432 && iwpr_32 > gi_556) li_12 = TRUE;
   else li_12 = FALSE;
   if (li_4 == TRUE || li_8 == TRUE || li_12 == TRUE) li_ret_0 = TRUE;
   else li_ret_0 = FALSE;
   return (li_ret_0);
}

int f0_2(double ad_0, int ai_8) {
   bool li_ret_12 = FALSE;
   bool li_16 = FALSE;
   bool li_20 = FALSE;
   double iwpr_24 = iWPR(NULL, PERIOD_M15, iWPR_Period, 1);
   double iclose_32 = iClose(NULL, PERIOD_M15, 1);
   double iopen_40 = iOpen(NULL, PERIOD_M1, 1);
   double iclose_48 = iClose(NULL, PERIOD_M1, 1);
   double ld_56 = NormalizeDouble((-MaxLossPoints) * gd_420, gi_428);
   double ld_64 = NormalizeDouble(Price_Filter_Close * gd_420, gi_428);
   double bid_72 = Bid;
   if (ad_0 - bid_72 <= ld_56 && iclose_32 - bid_72 <= gd_432 && iwpr_24 > gi_560 && ai_8 == 1) li_16 = TRUE;
   else li_16 = FALSE;
   if (iopen_40 > iclose_48 && bid_72 - ad_0 >= ld_64 && ai_8 == 1) li_20 = TRUE;
   else li_20 = FALSE;
   if (li_16 == TRUE || li_20 == TRUE) li_ret_12 = TRUE;
   else li_ret_12 = FALSE;
   return (li_ret_12);
}

int f0_4(double ad_0, int ai_8) {
   bool li_ret_12 = FALSE;
   bool li_16 = FALSE;
   bool li_20 = FALSE;
   double iwpr_24 = iWPR(NULL, PERIOD_M15, iWPR_Period, 1);
   double iclose_32 = iClose(NULL, PERIOD_M15, 1);
   double iopen_40 = iOpen(NULL, PERIOD_M1, 1);
   double iclose_48 = iClose(NULL, PERIOD_M1, 1);
   double ld_56 = NormalizeDouble((-MaxLossPoints) * gd_420, gi_428);
   double ld_64 = NormalizeDouble(Price_Filter_Close * gd_420, gi_428);
   double bid_72 = Bid;
   double ask_80 = Ask;
   if (ask_80 - ad_0 <= ld_56 && iclose_32 - bid_72 >= (-gd_432) && iwpr_24 < gi_564 && ai_8 == 1) li_16 = TRUE;
   else li_16 = FALSE;
   if (iopen_40 < iclose_48 && ad_0 - ask_80 >= ld_64 && ai_8 == 1) li_20 = TRUE;
   else li_20 = FALSE;
   if (li_16 == TRUE || li_20 == TRUE) li_ret_12 = TRUE;
   else li_ret_12 = FALSE;
   return (li_ret_12);
}

double f0_1() {
   double ld_0;
   int count_8;
   double ld_12;
   int li_20;
   double ld_24;
   int li_32;
   double ld_36;
   int li_44;
   double ld_48 = 1;
   if (MultiLotPercent > 0.0 && AutoMM > 0.0) {
      ld_0 = 0;
      count_8 = 0;
      ld_12 = 0;
      li_20 = 0;
      ld_24 = 0;
      li_32 = 0;
      for (int pos_56 = OrdersHistoryTotal() - 1; pos_56 >= 0; pos_56--) {
         if (OrderSelect(pos_56, SELECT_BY_POS, MODE_HISTORY)) {
            if (OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber) {
               count_8++;
               ld_0 += OrderProfit();
               if (ld_0 > ld_24) {
                  ld_24 = ld_0;
                  li_32 = count_8;
               }
               if (ld_0 < ld_12) {
                  ld_12 = ld_0;
                  li_20 = count_8;
               }
               if (count_8 >= MaxAnalizCount) break;
            }
         }
      }
      if (li_32 <= li_20) ld_48 = MathPow(MultiLotPercent, li_20);
      else {
         ld_0 = ld_24;
         count_8 = li_32;
         ld_36 = ld_24;
         li_44 = li_32;
         for (pos_56 = OrdersHistoryTotal() - li_32 - 1; pos_56 >= 0; pos_56--) {
            if (OrderSelect(pos_56, SELECT_BY_POS, MODE_HISTORY)) {
               if (OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber) {
                  if (count_8 >= MaxAnalizCount) break;
                  count_8++;
                  ld_0 += OrderProfit();
                  if (ld_0 < ld_36) {
                     ld_36 = ld_0;
                     li_44 = count_8;
                  }
               }
            }
         }
         if (li_44 == li_32 || ld_36 == ld_24) ld_48 = MathPow(MultiLotPercent, li_20);
         else {
            if (MathAbs(ld_12 - ld_24) / MathAbs(ld_36 - ld_24) >= (Risk + 100.0) / 100.0) ld_48 = MathPow(MultiLotPercent, li_20);
            else ld_48 = MathPow(MultiLotPercent, li_44);
         }
      }
   }
   for (double ld_ret_60 = MathMax(g_minlot_492, MathMin(g_maxlot_500, MathCeil(MathMin(AutoMM_Max, ld_48 * AutoMM) / 100.0 * AccountFreeMargin() / g_lotstep_508 / (gi_516 / 100)) * g_lotstep_508)); ld_ret_60 >= 2.0 * g_minlot_492 &&
      1.05 * (ld_ret_60 * g_marginrequired_520) >= AccountFreeMargin(); ld_ret_60 -= g_minlot_492) {
   }
   return (ld_ret_60);
}

bool f0_0() {
   RefreshRates();
   if (NormalizeDouble(Ask - Bid, Digits) > gd_464) return (TRUE);
   return (FALSE);
}

int f0_3() {
   bool li_ret_0 = FALSE;
   int li_4 = OrdersTotal() - 1;
   for (int pos_8 = li_4; pos_8 >= 0; pos_8--) {
      if (OrderSelect(pos_8, SELECT_BY_POS, MODE_TRADES)) {
         if (OrderMagicNumber() == MagicNumber) {
            if (OrderSymbol() == gs_440)
               if (OrderType() <= OP_SELL) li_ret_0 = TRUE;
         }
      }
   }
   return (li_ret_0);
}

int f0_15(int a_cmd_0 = -1) {
   if (OneOrderInBarMode == FALSE) return (1);
   int timeframe_4 = Period();
   for (int hist_total_8 = OrdersHistoryTotal(); hist_total_8 >= 0; hist_total_8--) {
      if (OrderSelect(hist_total_8, SELECT_BY_POS, MODE_HISTORY)) {
         if (OrderSymbol() == gs_440 && OrderType() == a_cmd_0 && OrderMagicNumber() == MagicNumber)
            if (OrderCloseTime() > iTime(gs_440, timeframe_4, 0)) return (0);
      }
   }
   return (1);
}

int f0_16(int a_cmd_0) {
   int order_total_4 = OrdersTotal();
   for (int pos_8 = order_total_4 - 1; pos_8 >= 0; pos_8--) {
      if (OrderSelect(pos_8, SELECT_BY_POS) == TRUE)
         if (OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber && OrderType() == a_cmd_0) return (1);
   }
   return (0);
}

bool f0_14() {
   if (Optimization == FALSE) return (1);
   if (g_bars_460 < Bars) {
      g_bars_460 = Bars;
      return (FALSE);
   }
   return (TRUE);
}

void f0_8() {
   string ls_0 = "";
   int li_unused_8 = 1;
   ls_0 = ls_0 
      + "\n  Aladdin 7 FX Pro" 
      + "\n  " 
      + "\n  Account Number:  " + AccountNumber() + "" 
      //+ "\n  Demo-account, �������� �������� ��� ����� �� ����� �����" 
      + "\n -----------------------------------------------" 
      + "\n  TakeProfit = " + TakeProfit + " pips" 
      + "\n  StopLoss = " + StopLoss + " pips" 
      + "\n -----------------------------------------------" 
      + "\n  Broker Time:  " + TimeToStr(TimeCurrent()) + "" 
   + "\n  Spread = " + DoubleToStr((Ask - Bid) / gd_420, 1) + " pips";
   if (NormalizeDouble(Ask - Bid, Digits) > gd_464) ls_0 = ls_0 + " - �������";
   else ls_0 = ls_0 + " - ����������";
   ls_0 = ls_0 
   + "\n -----------------------------------------------";
   if (AutoMM > 0.0) {
      ls_0 = ls_0 
         + "\n  AutoMM - ������������" 
      + "\n  Risk = " + DoubleToStr(AutoMM, 1) + "%";
   }
   ls_0 = ls_0 
   + "\n  Lot = " + DoubleToStr(gd_536, 2);
   ls_0 = ls_0 
   + "\n -----------------------------------------------";
   if (UseStopLevels) {
      ls_0 = ls_0 
      + "\n  Stop Levels - ������������";
   } else {
      ls_0 = ls_0 
      + "\n  Stop Levels - �� ������������";
   }
   if (RecoveryMode) {
      ls_0 = ls_0 
      + "\n  Recovery Mode - ������������";
   } else {
      ls_0 = ls_0 
      + "\n  Recovery Mode - �� ������������";
   }
   ls_0 = ls_0 
   + "\n -----------------------------------------------";
   ls_0 = ls_0 
   + "\n   Copyright � 2011, Finans Plus Company";
   ls_0 = ls_0 
   + "\n   http://finans-plus.ru";
   Comment(ls_0);
}

string f0_10(int ai_0) {
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

string f0_13(int ai_0) {
   string ls_ret_4;
   switch (ai_0) {
   case 0:
   case 1:
      ls_ret_4 = "��� ������, �� ��������� ����������";
      break;
   case 2:
      ls_ret_4 = "����� ������";
      break;
   case 3:
      ls_ret_4 = "������������ ���������";
      break;
   case 4:
      ls_ret_4 = "�������� ������ �����";
      break;
   case 5:
      ls_ret_4 = "������ ������ ����������� ���������";
      break;
   case 6:
      ls_ret_4 = "��� ����� � �������� ��������";
      break;
   case 7:
      ls_ret_4 = "������������ ����";
      break;
   case 8:
      ls_ret_4 = "������� ������ �������";
      break;
   case 9:
      ls_ret_4 = "������������ �������� ���������� ���������������� �������";
      break;
   case 64:
      ls_ret_4 = "���� ������������";
      break;
   case 65:
      ls_ret_4 = "������������ ����� �����";
      break;
   case 128:
      ls_ret_4 = "����� ���� �������� ���������� ������";
      break;
   case 129:
      ls_ret_4 = "������������ ����";
      break;
   case 130:
      ls_ret_4 = "������������ �����";
      break;
   case 131:
      ls_ret_4 = "������������ �����";
      break;
   case 132:
      ls_ret_4 = "����� ������";
      break;
   case 133:
      ls_ret_4 = "�������� ���������";
      break;
   case 134:
      ls_ret_4 = "������������ ����� ��� ���������� ��������";
      break;
   case 135:
      ls_ret_4 = "���� ����������";
      break;
   case 136:
      ls_ret_4 = "��� ���";
      break;
   case 137:
      ls_ret_4 = "������ �����";
      break;
   case 138:
      ls_ret_4 = "����� ���� - ������";
      break;
   case 139:
      ls_ret_4 = "����� ������������ � ��� ��������������";
      break;
   case 140:
      ls_ret_4 = "��������� ������ �������";
      break;
   case 141:
      ls_ret_4 = "������� ����� ��������";
      break;
   case 145:
      ls_ret_4 = "����������� ���������, ��� ��� ����� ������� ������ � �����";
      break;
   case 146:
      ls_ret_4 = "���������� �������� ������";
      break;
   case 147:
      ls_ret_4 = "������������� ���� ��������� ������ ��������� ��������";
      break;
   case 148:
      ls_ret_4 = "���������� �������� � ���������� ������� �������� ������� ";
      break;
   case 4000:
      ls_ret_4 = "��� ������";
      break;
   case 4001:
      ls_ret_4 = "������������ ��������� �������";
      break;
   case 4002:
      ls_ret_4 = "������ ������� - ��� ���������";
      break;
   case 4003:
      ls_ret_4 = "��� ������ ��� ����� �������";
      break;
   case 4004:
      ls_ret_4 = "������������ ����� ����� ������������ ������";
      break;
   case 4005:
      ls_ret_4 = "�� ����� ��� ������ ��� �������� ����������";
      break;
   case 4006:
      ls_ret_4 = "��� ������ ��� ���������� ���������";
      break;
   case 4007:
      ls_ret_4 = "��� ������ ��� ��������� ������";
      break;
   case 4008:
      ls_ret_4 = "�������������������� ������";
      break;
   case 4009:
      ls_ret_4 = "�������������������� ������ � �������";
      break;
   case 4010:
      ls_ret_4 = "��� ������ ��� ���������� �������";
      break;
   case 4011:
      ls_ret_4 = "������� ������� ������";
      break;
   case 4012:
      ls_ret_4 = "������� �� ������� �� ����";
      break;
   case 4013:
      ls_ret_4 = "������� �� ����";
      break;
   case 4014:
      ls_ret_4 = "����������� �������";
      break;
   case 4015:
      ls_ret_4 = "������������ �������";
      break;
   case 4016:
      ls_ret_4 = "�������������������� ������";
      break;
   case 4017:
      ls_ret_4 = "������ DLL �� ���������";
      break;
   case 4018:
      ls_ret_4 = "���������� ��������� ����������";
      break;
   case 4019:
      ls_ret_4 = "���������� ������� �������";
      break;
   case 4020:
      ls_ret_4 = "������ ������� ������������ ������� �� ���������";
      break;
   case 4021:
      ls_ret_4 = "������������ ������ ��� ������, ������������ �� �������";
      break;
   case 4022:
      ls_ret_4 = "������� ������";
      break;
   case 4050:
      ls_ret_4 = "������������ ���������� ���������� �������";
      break;
   case 4051:
      ls_ret_4 = "������������ �������� ��������� �������";
      break;
   case 4052:
      ls_ret_4 = "���������� ������ ��������� �������";
      break;
   case 4053:
      ls_ret_4 = "������ �������";
      break;
   case 4054:
      ls_ret_4 = "������������ ������������� �������-���������";
      break;
   case 4055:
      ls_ret_4 = "������ ����������������� ����������";
      break;
   case 4056:
      ls_ret_4 = "������� ������������";
      break;
   case 4057:
      ls_ret_4 = "������ ��������� ����������� ����������";
      break;
   case 4058:
      ls_ret_4 = "���������� ���������� �� ����������";
      break;
   case 4059:
      ls_ret_4 = "������� �� ��������� � �������� ������";
      break;
   case 4060:
      ls_ret_4 = "������� �� ������������";
      break;
   case 4061:
      ls_ret_4 = "������ �������� �����";
      break;
   case 4062:
      ls_ret_4 = "��������� �������� ���� string";
      break;
   case 4063:
      ls_ret_4 = "��������� �������� ���� integer";
      break;
   case 4064:
      ls_ret_4 = "��������� �������� ���� double";
      break;
   case 4065:
      ls_ret_4 = "� �������� ��������� ��������� ������";
      break;
   case 4066:
      ls_ret_4 = "����������� ������������ ������ � ��������� ����������";
      break;
   case 4067:
      ls_ret_4 = "������ ��� ���������� �������� ��������";
      break;
   case 4099:
      ls_ret_4 = "����� �����";
      break;
   case 4100:
      ls_ret_4 = "������ ��� ������ � ������";
      break;
   case 4101:
      ls_ret_4 = "������������ ��� �����";
      break;
   case 4102:
      ls_ret_4 = "������� ����� �������� ������";
      break;
   case 4103:
      ls_ret_4 = "���������� ������� ����";
      break;
   case 4104:
      ls_ret_4 = "������������� ����� ������� � �����";
      break;
   case 4105:
      ls_ret_4 = "�� ���� ����� �� ������";
      break;
   case 4106:
      ls_ret_4 = "����������� ������";
      break;
   case 4107:
      ls_ret_4 = "������������ �������� ���� ��� �������� �������";
      break;
   case 4108:
      ls_ret_4 = "�������� ����� ������";
      break;
   case 4109:
      ls_ret_4 = "�������� �� ���������";
      break;
   case 4110:
      ls_ret_4 = "������� ������� �� ���������";
      break;
   case 4111:
      ls_ret_4 = "�������� ������� �� ���������";
      break;
   case 4200:
      ls_ret_4 = "������ ��� ����������";
      break;
   case 4201:
      ls_ret_4 = "��������� ����������� �������� �������";
      break;
   case 4202:
      ls_ret_4 = "������ �� ����������";
      break;
   case 4203:
      ls_ret_4 = "����������� ��� �������";
      break;
   case 4204:
      ls_ret_4 = "��� ����� �������";
      break;
   case 4205:
      ls_ret_4 = "������ ��������� �������";
      break;
   case 4206:
      ls_ret_4 = "�� ������� ��������� �������";
      break;
   case 4207:
      ls_ret_4 = "������ ��� ������ � ��������";
      break;
   default:
      ls_ret_4 = "����������� ������";
   }
   return (ls_ret_4);
}
        
