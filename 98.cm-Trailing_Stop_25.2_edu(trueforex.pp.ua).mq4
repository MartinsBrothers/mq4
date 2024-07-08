//+------------------------------------------------------------------+
//|                98.cm-Trailing_Stop_25.2_edu(trueforex.pp.ua).mq4 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright © 2012, cmillion@narod.ru"
#property link      "http://cmillion.narod.ru"
#property show_inputs
/*
#import "kernel32.dll"
   int _lopen(string a0, int a1);
   int _lclose(int a0);
#import
*/
extern bool BUY = TRUE;
extern bool SELL = TRUE;
extern string ______________________ = "";
extern string parametersopenorders = "0-off  1-Candle  2-Fractals  >2-ï";
extern int startOrders_First = 2;
extern int startOrders_Second = 1;
extern int TF_Open_First = 15;
extern int TF_Open_Second = 15;
extern int deltaOpen = 5;
extern string ____________________ = "";
extern int StepOrders_1 = 20;
extern int StepOrders_2 = 40;
extern int StepOrders_3 = 60;
extern int StepOrders_4 = 80;
extern int StepOrders_5 = 100;
extern int StepOrders_6 = 120;
extern int StepOrders_7 = 140;
extern int StepOrders_8 = 160;
extern int StepOrders_9 = 180;
extern int StepOrders_10 = 200;
extern int StepOrders_11 = 220;
extern int StepOrders_12 = 250;
extern string ___________________ = "òðàëë îäèíî÷íîãî îðäåðà";
extern string parameterssingletrailing = "0-off  1-Candle  2-Fractals  >2-ï";
extern int singletrailingStop = 1;
extern int singleTF_Tralling = 15;
extern int singledeltaTralling = 0;
extern int singleStepTralling = 2;
extern int singleDeltaProfit = 0;
extern bool TrallLoss = FALSE;
extern string __________________ = "Òðàëë ïî ïîðòôåëþ";
extern string parameterstrailing = "0-off  1-Candle  2-Fractals  >2-ï";
extern bool VirtualTS = FALSE;
extern int trailingStop = 2;
extern int TF_Tralling = 15;
extern int deltaTralling = 0;
extern int StepTralling = 1;
extern int DeltaProfit = 0;
extern string _________________ = "";
extern string parametersNoLoss = "0-off  1-Candle  2-Fractals  >2-ï";
extern int NoLoss = 1;
extern int TF_NoLoss = 15;
extern int deltaNoLoss = 5;
extern int ProfitNoLoss = 5;
extern string ________________ = "";
extern double StopLoss = 0.0;
extern int deltaStopLoss = 0;
extern string _______________ = "";
extern bool VirtualTP = TRUE;
extern double TakeProfit = 0.0;
extern double ProfitStop = 0.0;
extern double LossStop = 0.0;
extern double ProfitPercentStop = 10.0;
extern string ______________ = "";
extern double LineBalance1 = 1000.0;
extern double LineLot1 = 0.01;
extern double LineBalance2 = 10000.0;
extern double LineLot2 = 1.0;
extern double LineBalance3 = 100000.0;
extern double LineLot3 = 5.0;
extern double MultiplyLot = 1.5;
extern int OkrLot = 2;
extern string ____________ = "";
extern int TimeStart = 0;
extern int TimeEnd = 24;
extern string ___________ = "";
extern int StartCandle = 1;
extern int EndCandle = 5;
extern string __________ = "";
extern int MaxOrders = 100;
extern int slippage = 5;
extern int Magic = 777;
extern bool DrawInfo = TRUE;
extern bool DrawOrders = TRUE;
extern bool InfoLeft = TRUE;
extern color TextColor = Aqua;
extern color FonColor = DimGray;
extern color RedColor = Red;
extern color GreenColor = Lime;
extern string comment = "Trailing Stop 25";
//extern int Key = 182468;
extern bool íåÓâåë÷èâàòüËîò = TRUE;
int gi_516;
int gcount_520;
int gcount_524;
int gi_528 = 0;
string gs_dummy_532;
string gstr_concat_540;
int gi_548;
int gi_552;
int gi_556;
int gacc_number_560;
double gd_564;
double gd_572;
double gorder_lots_580;
double gorder_lots_588;
int gorder_total_596 = EMPTY_VALUE;
int gi_600 = 16122;
int gi_604 = 10;
bool gi_608;
bool gi_612;
bool gi_616;
bool gi_620;
int gdatetime_624;
int gdatetime_628;
int gdatetime_632;
int gdatetime_636;
int gdatetime_640;
int gdatetime_644;
double gprice_648;
double gprice_656;
double gd_664;
string gs_cm__672 = "cm-";

// E37F0136AA3FFAF149B351F6A4C948E9
int init() {
   string str_concat_16;
   if (!InfoLeft) gi_528 = TRUE;
   if (IsTesting()) DrawOrders = FALSE;
   gstr_concat_540 = StringConcatenate(" ", AccountCurrency());
   //string str_concat_0 = StringConcatenate(TerminalPath(), CharToStr(92), "experts", CharToStr(92), WindowExpertName(), ".mq", DoubleToStr(4, 0));
   /*if (f0_8278()) {
      StepOrders_1 = FALSE;
      StepOrders_2 = FALSE;
      StepOrders_3 = FALSE;
      StepOrders_4 = FALSE;
      StepOrders_5 = FALSE;
      StepOrders_6 = FALSE;
      StepOrders_7 = FALSE;
      StepOrders_8 = FALSE;
      StepOrders_9 = FALSE;
      StepOrders_10 = FALSE;
      StepOrders_11 = FALSE;
      StepOrders_12 = FALSE;
   }*/
   gd_572 = NormalizeDouble(DeltaProfit * Point, Digits);
   TF_Tralling = f0_4334(TF_Tralling);
   TF_Open_Second = f0_4334(TF_Open_Second);
   TF_Open_First = f0_4334(TF_Open_First);
   gacc_number_560 = AccountNumber();
   double minlot_8 = MarketInfo(Symbol(), MODE_MINLOT);
   if (IsDemo() || IsTesting()) gi_612 = FALSE;
   else gi_612 = TRUE;
   f0_12336(StringConcatenate(gs_cm__672, "fon10"), gi_528, 1, 25, 150, "Webdings", FonColor, TRUE, "g");
   f0_12336(StringConcatenate(gs_cm__672, "fon00"), gi_528, 1, 225, 150, "Webdings", FonColor, FALSE, "g");
   f0_12336(StringConcatenate(gs_cm__672, "fon01"), gi_528, 1, 420, 150, "Webdings", FonColor, FALSE, "g");
   f0_12336(StringConcatenate(gs_cm__672, "fon02"), gi_528, 1, 620, 150, "Webdings", FonColor, FALSE, "g");
   int li_24 = 35;
   double ld_28 = 1.4;
   f0_12336(StringConcatenate(gs_cm__672, "sbalans"), gi_528, 10, li_24, gi_604, "Arial", TextColor, FALSE, "Balans");
   li_24 += gi_604 * ld_28;
   f0_12336(StringConcatenate(gs_cm__672, "FreeMa"), gi_528, 10, li_24, gi_604, "Arial", TextColor, FALSE, "FreeMargin");
   li_24 += gi_604 * ld_28;
   f0_12336(StringConcatenate(gs_cm__672, "sEquity"), gi_528, 10, li_24, gi_604, "Arial", TextColor, FALSE, "Equity");
   li_24 += 1.5 * (gi_604 * ld_28);
   f0_12336(StringConcatenate(gs_cm__672, "ProfitB"), gi_528, 10, li_24, gi_604, "Arial", TextColor, FALSE, "buy");
   li_24 += gi_604 * ld_28;
   f0_12336(StringConcatenate(gs_cm__672, "ProfitS"), gi_528, 10, li_24, gi_604, "Arial", TextColor, FALSE, "sell");
   li_24 += 1.5 * (gi_604 * ld_28);
   f0_12336(StringConcatenate(gs_cm__672, "sMaxLoss1"), gi_528, 10, li_24, gi_604, "Arial", TextColor, FALSE, "Ìàêñ.ïðîñàäêà");
   li_24 += gi_604 * ld_28;
   f0_12336(StringConcatenate(gs_cm__672, "sMaxLoss"), gi_528, 10, li_24, gi_604, "Arial", TextColor, FALSE, StringConcatenate("Ñòàðò ", TimeToStr(TimeCurrent(), TIME_DATE)));
   li_24 += 1.5 * (gi_604 * ld_28);
   f0_12336(StringConcatenate(gs_cm__672, "Âðåìÿ"), gi_528, 10, li_24, gi_604, "Arial", TextColor, FALSE, "Äåíü");
   li_24 += gi_604 * ld_28;
   f0_12336(StringConcatenate(gs_cm__672, "Âðåìÿ1"), gi_528, 10, li_24, gi_604, "Arial", TextColor, FALSE, "Âðåìÿ");
   li_24 += gi_604 * ld_28;
   f0_12336(StringConcatenate(gs_cm__672, "s--"), gi_528, 10, li_24, gi_604, "Arial", Silver, FALSE, "------------------------------------");
   li_24 += gi_604 * ld_28;
   f0_12336(StringConcatenate(gs_cm__672, "param"), gi_528, 10, li_24, gi_604, "Arial", White, FALSE, "Ïàðàìåòðû");
   li_24 += 1.5 * (gi_604 * ld_28);
   f0_12336(StringConcatenate(gs_cm__672, "start1"), gi_528, 10, li_24, gi_604, "Arial", TextColor, FALSE, "Ñòàðò ïåðâîãî îðäåðà");
   li_24 += gi_604 * ld_28;
   if (startOrders_First == 1) {
      str_concat_16 = StringConcatenate("ïî ñâå÷àì ", StartCandle, "-", EndCandle, " ", f0_9563(TF_Open_First));
      if (deltaOpen != 0) str_concat_16 = StringConcatenate(str_concat_16, " +- ", deltaOpen, " ï");
   }
   if (startOrders_First == 2) {
      str_concat_16 = StringConcatenate("ïî ôðàêòàëàì ", f0_9563(TF_Open_First));
      if (deltaOpen != 0) str_concat_16 = StringConcatenate(str_concat_16, " +- ", deltaOpen, " ï");
   }
   if (startOrders_First > 2) str_concat_16 = StringConcatenate(startOrders_First, " ï");
   f0_12336(StringConcatenate(gs_cm__672, "start2"), gi_528, 10, li_24, gi_604, "Arial", TextColor, FALSE, str_concat_16);
   li_24 += 1.5 * (gi_604 * ld_28);
   f0_12336(StringConcatenate(gs_cm__672, "second1"), gi_528, 10, li_24, gi_604, "Arial", TextColor, FALSE, "Ñòàðò âòîðîãî îðäåðà");
   li_24 += gi_604 * ld_28;
   if (startOrders_Second == 1) {
      str_concat_16 = StringConcatenate("ïî ñâå÷àì ", StartCandle, "-", EndCandle, " ", f0_9563(TF_Open_Second));
      if (deltaOpen != 0) str_concat_16 = StringConcatenate(str_concat_16, " +- ", deltaOpen, " ï");
   }
   if (startOrders_Second == 2) {
      str_concat_16 = StringConcatenate("ïî ôðàêòàëàì ", f0_9563(TF_Open_Second));
      if (deltaOpen != 0) str_concat_16 = StringConcatenate(str_concat_16, " +- ", deltaOpen, " ï");
   }
   if (startOrders_Second > 2) str_concat_16 = StringConcatenate(startOrders_Second, " ï");
   f0_12336(StringConcatenate(gs_cm__672, "second2"), gi_528, 10, li_24, gi_604, "Arial", TextColor, FALSE, str_concat_16);
   li_24 += 1.5 * (gi_604 * ld_28);
   str_concat_16 = StringConcatenate(StepOrders_1, " ", StepOrders_2, " ", StepOrders_3, " ", StepOrders_4, " ", StepOrders_5, " ", StepOrders_6);
   f0_12336(StringConcatenate(gs_cm__672, "steï2"), gi_528, 10, li_24, gi_604, "Arial", TextColor, FALSE, "Øàã " + str_concat_16);
   li_24 += gi_604 * ld_28;
   str_concat_16 = StringConcatenate(StepOrders_7, " ", StepOrders_8, " ", StepOrders_9, " ", StepOrders_10, " ", StepOrders_11, " ", StepOrders_12);
   f0_12336(StringConcatenate(gs_cm__672, "steï3"), gi_528, 10, li_24, gi_604, "Arial", TextColor, FALSE, str_concat_16);
   li_24 += gi_604 * ld_28;
   f0_12336(StringConcatenate(gs_cm__672, "s---"), gi_528, 10, li_24, gi_604, "Arial", Silver, FALSE, "------------------------------------");
   li_24 += gi_604 * ld_28;
   f0_12336(StringConcatenate(gs_cm__672, "singletrall1"), gi_528, 10, li_24, gi_604, "Arial", f0_11478(singletrailingStop == 0, 12632256, TextColor), FALSE, "Tðåéëèíãñòîï 1 îðäåðà");
   li_24 += gi_604 * ld_28;
   str_concat_16 = "îòêëþ÷åí";
   if (singletrailingStop == 1) {
      str_concat_16 = StringConcatenate("ïî ñâå÷àì ", StartCandle, "-", EndCandle, " ", f0_9563(singleTF_Tralling));
      if (singledeltaTralling != 0) str_concat_16 = StringConcatenate(str_concat_16, " +- ", singledeltaTralling, " ï");
   }
   if (singletrailingStop == 2) {
      str_concat_16 = StringConcatenate("ïî ôðàêòàëàì ", f0_9563(singleTF_Tralling));
      if (singledeltaTralling != 0) str_concat_16 = StringConcatenate(str_concat_16, " +- ", singledeltaTralling, " ï");
   }
   if (singletrailingStop > 2) str_concat_16 = StringConcatenate("ïî ", singletrailingStop, " ï");
   f0_12336(StringConcatenate(gs_cm__672, "singletrall2"), gi_528, 10, li_24, gi_604, "Arial", f0_11478(singletrailingStop == 0, 12632256, TextColor), FALSE, str_concat_16);
   li_24 += gi_604 * ld_28;
   if (singleStepTralling != 0) {
      f0_12336(StringConcatenate(gs_cm__672, "singleøàã"), gi_528, 10, li_24, gi_604, "Arial", f0_11478(singletrailingStop == 0, 12632256, TextColor), FALSE, StringConcatenate("øàã ",
         singleStepTralling, " ï"));
      li_24 += 1.5 * (gi_604 * ld_28);
   }
   if (VirtualTS) str_concat_16 = "Âèðòóàëüíûé òðåéëèíãñòîï";
   else str_concat_16 = "Tðåéëèíãñòîï";
   f0_12336(StringConcatenate(gs_cm__672, "strall1"), gi_528, 10, li_24, gi_604, "Arial", f0_11478(trailingStop == 0, 12632256, TextColor), FALSE, str_concat_16);
   li_24 += gi_604 * ld_28;
   str_concat_16 = "îòêëþ÷åí";
   if (trailingStop == 1) {
      str_concat_16 = StringConcatenate("ïî ñâå÷àì ", StartCandle, "-", EndCandle, " ", f0_9563(TF_Tralling));
      if (deltaTralling != 0) str_concat_16 = StringConcatenate(str_concat_16, " +- ", deltaTralling, " ï");
   }
   if (trailingStop == 2) {
      str_concat_16 = StringConcatenate("ïî ôðàêòàëàì ", f0_9563(TF_Tralling));
      if (deltaTralling != 0) str_concat_16 = StringConcatenate(str_concat_16, " +- ", deltaTralling, " ï");
   }
   if (trailingStop > 2) str_concat_16 = StringConcatenate("ïî ", trailingStop, " ï");
   f0_12336(StringConcatenate(gs_cm__672, "strall2"), gi_528, 10, li_24, gi_604, "Arial", f0_11478(trailingStop == 0, 12632256, TextColor), FALSE, str_concat_16);
   li_24 += gi_604 * ld_28;
   if (StepTralling != 0) {
      f0_12336(StringConcatenate(gs_cm__672, "øàã"), gi_528, 10, li_24, gi_604, "Arial", f0_11478(trailingStop == 0, 12632256, TextColor), FALSE, StringConcatenate("øàã ",
         StepTralling, " ï"));
      li_24 += 1.5 * (gi_604 * ld_28);
   }
   f0_12336(StringConcatenate(gs_cm__672, "sNoLoss1"), gi_528, 10, li_24, gi_604, "Arial", f0_11478(NoLoss == 0, 12632256, TextColor), FALSE, "Áåçóáûòîê");
   li_24 += gi_604 * ld_28;
   str_concat_16 = "îòêëþ÷åí";
   if (NoLoss == 1) {
      str_concat_16 = StringConcatenate("ïî ñâå÷àì ", StartCandle, "-", EndCandle, " ", f0_9563(TF_NoLoss));
      if (deltaNoLoss != 0) str_concat_16 = StringConcatenate(str_concat_16, " +- ", deltaNoLoss, " ï");
   }
   if (NoLoss == 2) {
      str_concat_16 = StringConcatenate("ïî ôðàêòàëàì ", f0_9563(TF_Tralling));
      if (deltaNoLoss != 0) str_concat_16 = StringConcatenate(str_concat_16, " +- ", deltaNoLoss, " ï");
   }
   if (NoLoss > 2) str_concat_16 = StringConcatenate("ïî ", NoLoss, " ï");
   f0_12336(StringConcatenate(gs_cm__672, "sNoLoss2"), gi_528, 10, li_24, gi_604, "Arial", f0_11478(NoLoss == 0, 12632256, TextColor), FALSE, str_concat_16);
   li_24 += gi_604 * ld_28;
   if (ProfitNoLoss != 0) {
      f0_12336(StringConcatenate(gs_cm__672, "sNoLoss3"), gi_528, 10, li_24, gi_604, "Arial", f0_11478(NoLoss == 0, 12632256, TextColor), FALSE, "Ìèí ïðîôèò " + ProfitNoLoss);
      li_24 += gi_604 * ld_28;
   }
   f0_12336(StringConcatenate(gs_cm__672, "s----"), gi_528, 10, li_24, gi_604, "Arial", Silver, FALSE, "------------------------------------");
   li_24 += gi_604 * ld_28;
   f0_12336(StringConcatenate(gs_cm__672, "ssl1"), gi_528, 10, li_24, gi_604, "Arial", f0_11478(StopLoss == 0.0, 12632256, TextColor), FALSE, "StopLoss");
   li_24 += gi_604 * ld_28;
   str_concat_16 = "îòêëþ÷åí";
   if (StopLoss == 1.0) {
      str_concat_16 = StringConcatenate("ïî ñâå÷àì ", StartCandle, "-", EndCandle, " ", f0_9563(TF_Tralling));
      if (deltaStopLoss != 0) str_concat_16 = StringConcatenate(str_concat_16, " +- ", deltaStopLoss, " ï");
   }
   if (StopLoss == 2.0) {
      str_concat_16 = StringConcatenate("ïî ôðàêòàëàì ", f0_9563(TF_Tralling));
      if (deltaStopLoss != 0) str_concat_16 = StringConcatenate(str_concat_16, " +- ", deltaStopLoss, " ï");
   }
   if (StopLoss > 2.0) str_concat_16 = StringConcatenate("ïî ", StopLoss, " ï");
   f0_12336(StringConcatenate(gs_cm__672, "ssl"), gi_528, 10, li_24, gi_604, "Arial", f0_11478(StopLoss == 0.0, 12632256, TextColor), FALSE, str_concat_16);
   li_24 += 1.5 * (gi_604 * ld_28);
   if (TakeProfit == 0.0) str_concat_16 = "TakeProfit íå óñòàíîâëåí";
   else {
      if (VirtualTP) str_concat_16 = StringConcatenate("Âèðòóàëüíûé TakeProfit ", TakeProfit, " ï");
      else str_concat_16 = StringConcatenate("TakeProfit ", TakeProfit, " ï");
   }
   f0_12336(StringConcatenate(gs_cm__672, "stp"), gi_528, 10, li_24, gi_604, "Arial", f0_11478(TakeProfit == 0.0, 12632256, TextColor), FALSE, str_concat_16);
   li_24 += 1.5 * (gi_604 * ld_28);
   f0_12336(StringConcatenate(gs_cm__672, "sMaxOrders"), gi_528, 10, li_24, gi_604, "Arial", TextColor, FALSE, StringConcatenate("Ìàêñèìóì îðäåðîâ ", MaxOrders));
   li_24 += 1.5 * (gi_604 * ld_28);
   f0_12336(StringConcatenate(gs_cm__672, "s-----"), gi_528, 10, li_24, gi_604, "Arial", Silver, FALSE, "------------------------------------");
   li_24 += gi_604 * ld_28;
   f0_12336(StringConcatenate(gs_cm__672, "slot0"), gi_528, 10, li_24, gi_604, "Arial", TextColor, FALSE, "Ëèíåéêà ëîòîâ");
   li_24 += gi_604 * ld_28;
   f0_12336(StringConcatenate(gs_cm__672, "slot1"), gi_528, 10, li_24, gi_604, "Arial", TextColor, FALSE, StringConcatenate(DoubleToStr(LineBalance1, 2), gstr_concat_540,
      "=", DoubleToStr(LineLot1, OkrLot)));
   li_24 += gi_604 * ld_28;
   f0_12336(StringConcatenate(gs_cm__672, "slot2"), gi_528, 10, li_24, gi_604, "Arial", TextColor, FALSE, StringConcatenate(DoubleToStr(LineBalance2, 2), gstr_concat_540,
      "=", DoubleToStr(LineLot2, OkrLot)));
   li_24 += gi_604 * ld_28;
   f0_12336(StringConcatenate(gs_cm__672, "slot3"), gi_528, 10, li_24, gi_604, "Arial", TextColor, FALSE, StringConcatenate(DoubleToStr(LineBalance3, 2), gstr_concat_540,
      "=", DoubleToStr(LineLot3, OkrLot)));
   li_24 += gi_604 * ld_28;
   if (MultiplyLot > 1.0) {
      f0_12336(StringConcatenate(gs_cm__672, "slot3"), gi_528, 10, li_24, gi_604, "Arial", TextColor, FALSE, StringConcatenate("óìíîæåíèå ëîòîâ õ ", DoubleToStr(MultiplyLot,
         2)));
      li_24 += gi_604 * ld_28;
   }
   f0_12336(StringConcatenate(gs_cm__672, "s------"), gi_528, 10, li_24, gi_604, "Arial", Silver, FALSE, "------------------------------------");
   li_24 += gi_604 * ld_28;
   if (ProfitStop != 0.0) str_concat_16 = StringConcatenate("Çàêðûòèå ïðè ïðèáûëè ", ProfitStop, gstr_concat_540);
   else str_concat_16 = "Çàêðûòèÿ ïî ïðèáûëè íåò";
   f0_12336(StringConcatenate(gs_cm__672, "sProfitStop"), gi_528, 10, li_24, gi_604, "Arial", f0_11478(ProfitStop == 0.0, 12632256, TextColor), FALSE, str_concat_16);
   li_24 += 1.5 * (gi_604 * ld_28);
   if (LossStop != 0.0) str_concat_16 = StringConcatenate("Çàêðûòèå ïðè óáûòêå ", LossStop, gstr_concat_540);
   else str_concat_16 = "Çàêðûòèÿ ïî óáûòêó íåò";
   f0_12336(StringConcatenate(gs_cm__672, "sLossStop"), gi_528, 10, li_24, gi_604, "Arial", f0_11478(LossStop == 0.0, 12632256, TextColor), FALSE, str_concat_16);
   li_24 += 1.5 * (gi_604 * ld_28);
   f0_12336(StringConcatenate(gs_cm__672, "stimiw"), gi_528, 10, li_24, gi_604, "Arial", TextColor, FALSE, StringConcatenate("Ðàáîòà ñ ", TimeStart, ":00 ïî ", TimeEnd,
      ":00"));
   li_24 += gi_604 * ld_28;
   return (0);
}

// EA2B2676C28C0DB26D39331A336C6B92
int start() {
   int li_4;
   int li_8;
   double price_12;
   double price_20;
   double price_28;
   double order_lots_52;
   int cmd_76;
   int ticket_80;
   double price_156;
   double ld_unused_180;
   double ld_unused_188;
   double ld_196;
   double ld_204;
   double price_212;
   string ticket_220;
   double price_236;
   double price_244;
   int li_252;
   double price_256;
   int li_276;
   int li_280;
   double price_292;
   double price_300;
   if (!IsDllsAllowed()) {
      Comment("Âêëþ÷èòå ðàçðåøèòü èñïîëüçîâàíèå DLL");
      return;
   }
   if (!IsExpertEnabled()) {
      Comment("Âêëþ÷èòå ðàçðåøèòü çàïóñê ýêñïåðòîâ");
      return;
   }
   int hour_0 = Hour();
   if (TimeStart < TimeEnd && hour_0 >= TimeStart && hour_0 < TimeEnd) gi_608 = TRUE;
   else {
      if (TimeStart > TimeEnd && hour_0 >= TimeStart || hour_0 < TimeEnd) gi_608 = TRUE;
      else {
         gi_608 = FALSE;
         Comment("Òîðãîâëÿ çàïðåùåíà ïî âðåìåíè");
         f0_8371(0);
      }
   }
   ObjectSet(StringConcatenate(gs_cm__672, "stimiw"), OBJPROP_COLOR, f0_11478(gi_608, GreenColor, RedColor));
   gi_516 = MarketInfo(Symbol(), MODE_STOPLEVEL);
   if (gi_516 > 0 && DrawInfo) {
      ObjectDelete("STOPLEVEL-");
      ObjectCreate("STOPLEVEL-", OBJ_ARROW, 0, Time[0] + 60 * Period(), Bid - gi_516 * Point, 0, 0, 0, 0);
      ObjectSet("STOPLEVEL-", OBJPROP_ARROWCODE, 4);
      ObjectSet("STOPLEVEL-", OBJPROP_COLOR, RedColor);
      ObjectDelete("STOPLEVEL+");
      ObjectCreate("STOPLEVEL+", OBJ_ARROW, 0, Time[0] + 60 * Period(), Ask + gi_516 * Point, 0, 0, 0, 0);
      ObjectSet("STOPLEVEL+", OBJPROP_ARROWCODE, 4);
      ObjectSet("STOPLEVEL+", OBJPROP_COLOR, Blue);
   }
   /*if (gi_612 && Key != (gacc_number_560 - gi_600) * 2) {
      Comment("Äåìî âåðñèÿ,\nÄëÿ ïîëó÷åíèÿ êëþ÷à îáðàòèòåñü cmillion@narod.ru");
      return;
   }*/
   if (startOrders_First < gi_516 && startOrders_First > 2) gi_552 = gi_516;
   else gi_552 = startOrders_First;
   if (startOrders_Second < gi_516 && startOrders_Second > 2) gi_548 = gi_516;
   else gi_548 = startOrders_Second;
   gcount_520 = 0;
   gcount_524 = 0;
   double ld_36 = 0;
   double ld_44 = 0;
   double ld_60 = 0;
   double ld_68 = 0;
   int ticket_84 = 0;
   int ticket_88 = 0;
   int li_unused_92 = 0;
   int li_unused_96 = 0;
   double price_100 = 0;
   double price_108 = 0;
   double price_116 = 0;
   double price_124 = 0;
   double price_132 = 0;
   double price_140 = 0;
   double price_148 = 10000000;
   double ld_unused_164 = 0;
   double ld_unused_172 = 0;
   gorder_lots_580 = 0;
   gorder_lots_588 = 0;
   for (int pos_228 = 0; pos_228 < OrdersTotal(); pos_228++) {
      if (OrderSelect(pos_228, SELECT_BY_POS, MODE_TRADES)) {
         if (Magic == OrderMagicNumber() && OrderSymbol() == Symbol()) {
            price_12 = NormalizeDouble(OrderOpenPrice(), Digits);
            price_20 = NormalizeDouble(OrderStopLoss(), Digits);
            if (price_12 < 0.0) {
               Print("Îøèáêà OOP = ", price_12, "  OrderTicket ", OrderTicket());
               continue;
            }
            order_lots_52 = OrderLots();
            cmd_76 = OrderType();
            ticket_80 = OrderTicket();
            if (cmd_76 == OP_BUY) {
               ld_196 += OrderProfit() + OrderSwap() + OrderCommission();
               ld_36 += price_12 * order_lots_52;
               ld_68 += order_lots_52;
               gcount_520++;
               if (price_132 > price_12 || price_132 == 0.0) price_132 = price_12;
               if (price_156 < price_12) {
                  price_156 = price_12;
                  li_unused_96 = ticket_80;
                  ld_unused_188 = order_lots_52;
               }
               if (gorder_lots_580 < order_lots_52) gorder_lots_580 = order_lots_52;
               if (DrawOrders) {
                  ticket_220 = ticket_80;
                  ObjectDelete(ticket_220);
                  ObjectCreate(ticket_220, OBJ_TREND, 0, OrderOpenTime(), price_12, Time[0], Bid);
                  ObjectSet(ticket_220, OBJPROP_COLOR, Blue);
                  ObjectSet(ticket_220, OBJPROP_STYLE, STYLE_DOT);
                  ObjectSet(ticket_220, OBJPROP_RAY, FALSE);
               }
               if (!(StopLoss != 0.0 && price_20 == 0.0)) continue;
               price_212 = f0_824(1, Bid, StopLoss, TF_Open_First, deltaStopLoss, 0);
               if (!(price_212 != 0.0 && price_212 <= NormalizeDouble(Bid - gi_516 * Point, Digits))) continue;
               if (!(!OrderModify(ticket_80, price_12, price_212, NormalizeDouble(OrderTakeProfit(), Digits), 0, White))) continue;
               Print("===>  Error ", GetLastError(), " order ", ticket_80, " Modify SL Buy = ", price_212);
               continue;
            }
            if (cmd_76 == OP_SELL) {
               ld_204 += OrderProfit() + OrderSwap() + OrderCommission();
               ld_44 += price_12 * order_lots_52;
               ld_60 += order_lots_52;
               gcount_524++;
               if (price_140 < price_12) price_140 = price_12;
               if (price_148 > price_12) {
                  price_148 = price_12;
                  li_unused_92 = ticket_80;
                  ld_unused_180 = order_lots_52;
               }
               if (gorder_lots_588 < order_lots_52) gorder_lots_588 = order_lots_52;
               if (DrawOrders) {
                  ticket_220 = ticket_80;
                  ObjectDelete(ticket_220);
                  ObjectCreate(ticket_220, OBJ_TREND, 0, OrderOpenTime(), price_12, Time[0], Ask);
                  ObjectSet(ticket_220, OBJPROP_COLOR, RedColor);
                  ObjectSet(ticket_220, OBJPROP_STYLE, STYLE_DOT);
                  ObjectSet(ticket_220, OBJPROP_RAY, FALSE);
               }
               if (!(StopLoss != 0.0 && price_20 == 0.0)) continue;
               price_212 = f0_824(-1, Ask, StopLoss, TF_Open_First, deltaStopLoss, 0);
               if (!(price_212 != 0.0 && price_212 >= NormalizeDouble(Ask + gi_516 * Point, Digits))) continue;
               if (!(!OrderModify(ticket_80, price_12, price_212, NormalizeDouble(OrderTakeProfit(), Digits), 0, White))) continue;
               Print("===>  Error ", GetLastError(), " order ", ticket_80, " Modify SL Sell = ", price_212);
               continue;
            }
            if (cmd_76 == OP_BUYSTOP) {
               li_4++;
               ticket_84 = OrderTicket();
               price_116 = price_12;
               ld_unused_164 = order_lots_52;
               continue;
            }
            if (cmd_76 == OP_SELLSTOP) {
               li_8++;
               ticket_88 = OrderTicket();
               price_124 = price_12;
               ld_unused_172 = order_lots_52;
            }
         }
      }
   }
   if (gd_664 > ld_204 + ld_196) {
      gd_664 = ld_204 + ld_196;
      f0_12336(StringConcatenate(gs_cm__672, "sMaxLoss1"), gi_528, 0, 0, gi_604, "Arial", RedColor, FALSE, StringConcatenate("ïðîñàäêà ", DoubleToStr(gd_664, 2), gstr_concat_540));
   }
   if (ProfitStop != 0.0) {
      if (ProfitStop < ld_196 + ld_204) {
         f0_1910(OP_BUY);
         f0_1910(OP_SELL);
      }
   }
   if (ProfitPercentStop != 0.0 && ld_68 > 0.0 && ld_60 > 0.0) {
      if (ProfitPercentStop < 100.0 * ((ld_196 + ld_204) / AccountBalance())) {
         Print("=========> ProfitPercentStop > ", (ld_196 + ld_204) / AccountBalance());
         f0_1910(OP_BUY);
         f0_1910(OP_SELL);
      }
   }
   if (LossStop != 0.0) {
      if (LossStop < -1.0 * (ld_196 + ld_204)) {
         f0_1910(OP_BUY);
         f0_1910(OP_SELL);
      }
   }
   if (DrawInfo) {
      ObjectDelete("NoLoss Buy1");
      ObjectDelete("NoLoss Sell1");
      ObjectDelete("NoLossBuy");
      ObjectDelete("NoLossBuy_");
      ObjectDelete("NoLossSell");
      ObjectDelete("NoLossSell_");
   }
   int datetime_232 = Time[0] + 300 * Period();
   if (gcount_520 != 0) {
      price_100 = NormalizeDouble(ld_36 / ld_68, Digits);
      if (DrawInfo) {
         ObjectCreate("NoLossBuy", OBJ_ARROW, 0, datetime_232, price_100, 0, 0, 0, 0);
         ObjectSet("NoLossBuy", OBJPROP_ARROWCODE, SYMBOL_RIGHTPRICE);
         ObjectSet("NoLossBuy", OBJPROP_COLOR, Blue);
         ObjectCreate("NoLossBuy_", OBJ_ARROW, 0, datetime_232, price_100, 0, 0, 0, 0);
         ObjectSet("NoLossBuy_", OBJPROP_ARROWCODE, 236);
         ObjectSet("NoLossBuy_", OBJPROP_COLOR, Blue);
      }
   }
   if (gcount_524 != 0) {
      price_108 = NormalizeDouble(ld_44 / ld_60, Digits);
      if (DrawInfo) {
         ObjectCreate("NoLossSell", OBJ_ARROW, 0, datetime_232, price_108, 0, 0, 0, 0);
         ObjectSet("NoLossSell", OBJPROP_ARROWCODE, SYMBOL_RIGHTPRICE);
         ObjectSet("NoLossSell", OBJPROP_COLOR, RedColor);
         ObjectCreate("NoLossSell_", OBJ_ARROW, 0, datetime_232, price_108, 0, 0, 0, 0);
         ObjectSet("NoLossSell_", OBJPROP_ARROWCODE, 238);
         ObjectSet("NoLossSell_", OBJPROP_COLOR, RedColor);
      }
   }
   if (TakeProfit != 0.0 && VirtualTP) {
      if (DrawInfo) {
         ObjectDelete("TakeProfit Buy");
         ObjectDelete("TakeProfit Sell");
      }
      if (gcount_520 > 0) {
         if (Bid >= NormalizeDouble(price_100 + TakeProfit * Point, Digits)) f0_1910(OP_BUY);
         if (DrawInfo) {
            ObjectCreate("TakeProfit Buy", OBJ_ARROW, 0, Time[0], price_100 + TakeProfit * Point, 0, 0, 0, 0);
            ObjectSet("TakeProfit Buy", OBJPROP_ARROWCODE, SYMBOL_RIGHTPRICE);
            ObjectSet("TakeProfit Buy", OBJPROP_COLOR, Blue);
         }
      }
      if (gcount_524 > 0) {
         if (Ask <= NormalizeDouble(price_108 - TakeProfit * Point, Digits)) f0_1910(OP_SELL);
         if (DrawInfo) {
            ObjectCreate("TakeProfit Sell", OBJ_ARROW, 0, Time[0], price_108 - TakeProfit * Point, 0, 0, 0, 0);
            ObjectSet("TakeProfit Sell", OBJPROP_ARROWCODE, SYMBOL_RIGHTPRICE);
            ObjectSet("TakeProfit Sell", OBJPROP_COLOR, RedColor);
         }
      }
   }
   if (singletrailingStop > 0) {
      if (gcount_524 == 0) gi_620 = TRUE;
      if (gcount_520 == 0) gi_616 = TRUE;
      if (gi_620 || gi_616) {
         if (singletrailingStop < gi_516 && singletrailingStop > 2) gi_556 = gi_516;
         else gi_556 = trailingStop;
         price_236 = f0_824(1, Bid, gi_556, singleTF_Tralling, singledeltaTralling, 0);
         price_244 = f0_824(-1, Ask, gi_556, singleTF_Tralling, singledeltaTralling, 0);
         for (int order_total_264 = OrdersTotal(); order_total_264 >= 0; order_total_264--) {
            if (TimeCurrent() > li_252) {
               li_252 = TimeCurrent() + 1;
               RefreshRates();
            }
            if (IsTradeContextBusy()) Sleep(1000);
            else {
               if (OrderSelect(order_total_264, SELECT_BY_POS)) {
                  if (OrderSymbol() == Symbol() && OrderMagicNumber() == Magic) {
                     cmd_76 = OrderType();
                     price_20 = NormalizeDouble(OrderStopLoss(), Digits);
                     price_28 = NormalizeDouble(OrderTakeProfit(), Digits);
                     price_12 = NormalizeDouble(OrderOpenPrice(), Digits);
                     ticket_80 = OrderTicket();
                     if (cmd_76 == OP_BUY && gi_616) {
                        if (price_236 >= price_20 + singleStepTralling * Point && price_236 <= NormalizeDouble(Bid - gi_516 * Point, Digits) && price_236 >= price_12 || TrallLoss)
                           if (!OrderModify(ticket_80, price_12, price_236, price_28, 0, White)) Print("===>  Error order ", GetLastError(), "  ", ticket_80, " TrailingStop Buy  SL ", price_236);
                     }
                     if (cmd_76 == OP_SELL && gi_620) {
                        if (price_244 <= price_20 - singleStepTralling * Point || price_20 == 0.0 && price_244 >= NormalizeDouble(Ask + gi_516 * Point, Digits) && price_244 <= price_12 ||
                           TrallLoss)
                           if (!OrderModify(ticket_80, price_12, price_244, price_28, 0, White)) Print("===>  Error ", GetLastError(), " order ", ticket_80, " TrailingStop Sell   SL ", price_244);
                     }
                  }
               }
            }
         }
      }
   }
   if (trailingStop < gi_516 && trailingStop > 2) gi_556 = gi_516;
   else gi_556 = trailingStop;
   price_236 = f0_824(1, Bid, gi_556, TF_Tralling, deltaTralling, 0);
   price_244 = f0_824(-1, Ask, gi_556, TF_Tralling, deltaTralling, 0);
   if (VirtualTS) {
      if (DrawInfo) {
         ObjectDelete("StopLoss Buy");
         ObjectDelete("StopLoss Sell");
      }
      if (gcount_520 > 0) {
         if (price_236 > gprice_648 && price_236 > price_100) {
            gprice_648 = price_236;
            gi_616 = FALSE;
         }
         if (Bid <= gprice_648 && gprice_648 != 0.0) f0_1910(OP_BUY);
         if (DrawInfo) {
            ObjectCreate("StopLoss Buy", OBJ_ARROW, 0, Time[0], gprice_648, 0, 0, 0, 0);
            ObjectSet("StopLoss Buy", OBJPROP_ARROWCODE, SYMBOL_RIGHTPRICE);
            ObjectSet("StopLoss Buy", OBJPROP_COLOR, Blue);
         }
      } else gprice_648 = 0;
      if (gcount_524 > 0) {
         if (price_244 < gprice_656 || gprice_656 == 0.0 && price_244 < price_108) {
            gprice_656 = price_244;
            gi_620 = FALSE;
         }
         if (Ask >= gprice_656 && gprice_656 != 0.0) f0_1910(OP_SELL);
         if (DrawInfo) {
            ObjectCreate("StopLoss Sell", OBJ_ARROW, 0, Time[0], gprice_656, 0, 0, 0, 0);
            ObjectSet("StopLoss Sell", OBJPROP_ARROWCODE, SYMBOL_RIGHTPRICE);
            ObjectSet("StopLoss Sell", OBJPROP_COLOR, RedColor);
         }
      } else gprice_656 = 0;
   }
   for (order_total_264 = OrdersTotal(); order_total_264 >= 0; order_total_264--) {
      if (TimeCurrent() > li_252) {
         li_252 = TimeCurrent() + 1;
         RefreshRates();
      }
      if (IsTradeContextBusy()) Sleep(1000);
      else {
         if (OrderSelect(order_total_264, SELECT_BY_POS)) {
            if (OrderSymbol() == Symbol() && OrderMagicNumber() == Magic) {
               cmd_76 = OrderType();
               price_20 = NormalizeDouble(OrderStopLoss(), Digits);
               price_28 = NormalizeDouble(OrderTakeProfit(), Digits);
               price_12 = NormalizeDouble(OrderOpenPrice(), Digits);
               ticket_80 = OrderTicket();
               if (cmd_76 == OP_BUY) {
                  if (!VirtualTP && TakeProfit > 0.0) {
                     price_256 = NormalizeDouble(price_100 + TakeProfit * Point, Digits);
                     if (price_28 != price_256 && price_256 >= NormalizeDouble(Ask + gi_516 * Point, Digits)) {
                        if (!OrderModify(ticket_80, price_12, price_20, price_256, 0, White)) Print("===>  Error ", GetLastError(), " order ", ticket_80, " Modify TP Buy   TP ", price_256);
                        else price_28 = price_256;
                     }
                  }
                  if (!VirtualTS && price_236 >= price_20 + StepTralling * Point && price_236 <= NormalizeDouble(Bid - gi_516 * Point, Digits) && price_236 >= price_100) {
                     if (!OrderModify(ticket_80, price_12, price_236, price_28, 0, White)) Print("===>  Error order ", GetLastError(), "  ", ticket_80, " TrailingStop Buy  SL ", price_236);
                     else gi_616 = FALSE;
                  }
               }
               if (cmd_76 == OP_SELL) {
                  if (!VirtualTP && TakeProfit > 0.0) {
                     price_256 = NormalizeDouble(price_108 - TakeProfit * Point, Digits);
                     if (price_28 != price_256 && price_256 <= NormalizeDouble(Bid - gi_516 * Point, Digits)) {
                        if (!OrderModify(ticket_80, price_12, price_20, price_256, 0, White)) Print("===>  Error order ", GetLastError(), "  ", ticket_80, " Modify TP Sell  TP ", price_256);
                        else price_28 = price_256;
                     }
                  }
                  if (!VirtualTS && price_244 <= price_20 - StepTralling * Point || price_20 == 0.0 && price_244 >= NormalizeDouble(Ask + gi_516 * Point, Digits) && price_244 <= price_108) {
                     if (!OrderModify(ticket_80, price_12, price_244, price_28, 0, White)) {
                        Print("===>  Error ", GetLastError(), " order ", ticket_80, " TrailingStop Sell   SL ", price_244);
                        continue;
                     }
                     gi_620 = FALSE;
                  }
               }
            }
         }
      }
   }
   if (NoLoss > 0) {
      price_100 = NormalizeDouble(price_100 + ProfitNoLoss * Point, Digits);
      price_108 = NormalizeDouble(price_108 - ProfitNoLoss * Point, Digits);
      price_236 = f0_824(1, Bid, NoLoss, TF_NoLoss, deltaNoLoss, 0);
      price_244 = f0_824(-1, Ask, NoLoss, TF_NoLoss, deltaNoLoss, 0);
      for (order_total_264 = OrdersTotal(); order_total_264 >= 0; order_total_264--) {
         if (TimeCurrent() > li_252) {
            li_252 = TimeCurrent() + 1;
            RefreshRates();
         }
         if (IsTradeContextBusy()) Sleep(1000);
         else {
            if (OrderSelect(order_total_264, SELECT_BY_POS)) {
               if (OrderSymbol() == Symbol() && OrderMagicNumber() == Magic) {
                  cmd_76 = OrderType();
                  price_20 = NormalizeDouble(OrderStopLoss(), Digits);
                  price_28 = NormalizeDouble(OrderTakeProfit(), Digits);
                  price_12 = NormalizeDouble(OrderOpenPrice(), Digits);
                  ticket_80 = OrderTicket();
                  if (cmd_76 == OP_BUY) {
                     if (price_20 < price_100 && price_236 <= NormalizeDouble(Bid - gi_516 * Point, Digits) && price_236 >= price_100) {
                        if (!OrderModify(ticket_80, price_12, price_100, price_28, 0, White)) Print("===>  Error order ", GetLastError(), "  ", ticket_80, " NoLoss Buy  SL ", price_236);
                        else gi_616 = FALSE;
                     }
                  }
                  if (cmd_76 == OP_SELL) {
                     if (price_20 > price_108 || price_20 == 0.0 && price_244 >= NormalizeDouble(Ask + gi_516 * Point, Digits) && price_244 <= price_108) {
                        if (!OrderModify(ticket_80, price_12, price_108, price_28, 0, White)) {
                           Print("===>  Error ", GetLastError(), " order ", ticket_80, " NoLoss Sell   SL ", price_244);
                           continue;
                        }
                        gi_620 = FALSE;
                     }
                  }
               }
            }
         }
      }
   }
   double free_magrin_268 = AccountFreeMargin();
   f0_12336(StringConcatenate(gs_cm__672, "sbalans"), gi_528, 0, 0, gi_604, "Arial", TextColor, FALSE, StringConcatenate("Áàëàíñ = ", DoubleToStr(AccountBalance(), 2),
      gstr_concat_540));
   f0_12336(StringConcatenate(gs_cm__672, "FreeMa"), gi_528, 0, 0, gi_604, "Arial", TextColor, FALSE, StringConcatenate("Ñðåäñòâà = ", DoubleToStr(free_magrin_268, 2),
      gstr_concat_540));
   f0_12336(StringConcatenate(gs_cm__672, "sEquity"), gi_528, 0, 0, gi_604, "Arial", TextColor, FALSE, StringConcatenate("Ýêâèòè = ", DoubleToStr(AccountEquity(), 2),
      gstr_concat_540));
   f0_12336(StringConcatenate(gs_cm__672, "ProfitB"), gi_528, 0, 0, gi_604, "Arial", f0_11478(ld_196 > 0.0, GreenColor, f0_11478(ld_196 == 0.0, 12632256, RedColor)),
      FALSE, StringConcatenate(gcount_520, " Buy, lot ", DoubleToStr(ld_68, 2), "  ", DoubleToStr(ld_196, 2), gstr_concat_540));
   f0_12336(StringConcatenate(gs_cm__672, "ProfitS"), gi_528, 0, 0, gi_604, "Arial", f0_11478(ld_204 > 0.0, GreenColor, f0_11478(ld_204 == 0.0, 12632256, RedColor)),
      FALSE, StringConcatenate(gcount_524, " Sell, lot ", DoubleToStr(ld_60, 2), "  ", DoubleToStr(ld_204, 2), gstr_concat_540));
   f0_12336(StringConcatenate(gs_cm__672, "Âðåìÿ"), gi_528, 0, 0, gi_604, "Arial", TextColor, FALSE, StringConcatenate("Ñåãîäíÿ ", f0_3116(DayOfWeek())));
   f0_12336(StringConcatenate(gs_cm__672, "Âðåìÿ1"), gi_528, 0, 0, gi_604, "Arial", TextColor, FALSE, TimeToStr(TimeCurrent(), TIME_DATE|TIME_SECONDS));
   if (!gi_608 || IsTradeContextBusy()) return;
   switch (gcount_520) {
   case 1:
      li_276 = StepOrders_1;
      break;
   case 2:
      li_276 = StepOrders_2;
      break;
   case 3:
      li_276 = StepOrders_3;
      break;
   case 4:
      li_276 = StepOrders_4;
      break;
   case 5:
      li_276 = StepOrders_5;
      break;
   case 6:
      li_276 = StepOrders_6;
      break;
   case 7:
      li_276 = StepOrders_7;
      break;
   case 8:
      li_276 = StepOrders_8;
      break;
   case 9:
      li_276 = StepOrders_9;
      break;
   case 10:
      li_276 = StepOrders_10;
      break;
   case 11:
      li_276 = StepOrders_11;
      break;
   default:
      li_276 = StepOrders_12;
   }
   switch (gcount_524) {
   case 1:
      li_280 = StepOrders_1;
      break;
   case 2:
      li_280 = StepOrders_2;
      break;
   case 3:
      li_280 = StepOrders_3;
      break;
   case 4:
      li_280 = StepOrders_4;
      break;
   case 5:
      li_280 = StepOrders_5;
      break;
   case 6:
      li_280 = StepOrders_6;
      break;
   case 7:
      li_280 = StepOrders_7;
      break;
   case 8:
      li_280 = StepOrders_8;
      break;
   case 9:
      li_280 = StepOrders_9;
      break;
   case 10:
      li_280 = StepOrders_10;
      break;
   case 11:
      li_280 = StepOrders_11;
      break;
   default:
      li_280 = StepOrders_12;
   }
   if (gcount_520 == 0) price_292 = f0_824(-1, Ask, gi_552, TF_Open_First, deltaOpen, 1);
   else price_292 = f0_824(-1, Ask, gi_548, TF_Open_Second, deltaOpen, 1);
   if (gcount_524 == 0) price_300 = f0_824(1, Bid, gi_552, TF_Open_First, deltaOpen, 1);
   else price_300 = f0_824(1, Bid, gi_548, TF_Open_Second, deltaOpen, 1);
   if (BUY && li_4 == 0 && gcount_520 < MaxOrders && price_292 != 0.0 && gdatetime_624 != iTime(Symbol(), TF_Open_Second, 0)) {
      if (price_132 - li_276 * Point >= price_292 || price_132 == 0.0) {
         if (f0_6846(1, price_292)==true) {
            gdatetime_624 = iTime(Symbol(), TF_Open_Second, 0);
            if (startOrders_First == 2 || startOrders_Second == 2) gdatetime_636 = gdatetime_632;
         }
      }
   }
   if (SELL && li_8 == 0 && gcount_524 < MaxOrders && price_300 != 0.0 && gdatetime_628 != iTime(Symbol(), TF_Open_Second, 0)) {
      if (price_140 + li_280 * Point <= price_300) {
         if (f0_6846(-1, price_300)==true) {
            gdatetime_628 = iTime(Symbol(), TF_Open_Second, 0);
            if (startOrders_First == 2 || startOrders_Second == 2) gdatetime_644 = gdatetime_640;
         }
      }
   }
   if (price_132 - li_276 * Point >= price_292 || price_132 == 0.0 && price_116 > price_292 && price_292 >= Ask + gi_516 * Point && price_116 != 0.0) {
      if (!OrderModify(ticket_84, price_292, 0, 0, 0, Yellow)) Print("===>  Error ", GetLastError(), " order ", ticket_84, " OrderModify UP   PriceUP ", DoubleToStr(price_292, Digits));
      else
         if (startOrders_First == 2 || startOrders_Second == 2) gdatetime_636 = gdatetime_632;
   }
   if (price_140 + li_280 * Point <= price_300 && price_124 < price_300 && price_124 != 0.0 && price_300 <= Bid - gi_516 * Point && price_300 != 0.0) {
      if (!OrderModify(ticket_88, price_300, 0, 0, 0, Yellow)) Print("===>  Error ", GetLastError(), " order ", ticket_88, " OrderModify DN   PriceDN ", DoubleToStr(price_300, Digits));
      else
         if (startOrders_First == 2 || startOrders_Second == 2) gdatetime_644 = gdatetime_640;
   }
   return (0);
}

// 52D46093050F38C27267BCE42543EF60
int deinit() {
   if (!IsTesting()) f0_119(gs_cm__672);
   return (0);
}

// 0E521811373FA5F0D1EE10BF0C823CF0
double f0_824(int ai_0, double ad_4, double a_pips_12, int a_timeframe_20, int ai_24, int ai_28) {
   double ifractals_32 = 0;
   if (a_pips_12 > 3.0) {
      if (ai_0 == 1) ifractals_32 = NormalizeDouble(ad_4 - a_pips_12 * Point, Digits);
      else ifractals_32 = NormalizeDouble(ad_4 + a_pips_12 * Point, Digits);
   } else {
      if (a_pips_12 == 2.0) {
         if (ai_0 == 1) {
            for (int li_44 = 3; li_44 < 100; li_44++) {
               gdatetime_640 = iTime(Symbol(), a_timeframe_20, li_44);
               if (gdatetime_640 <= gdatetime_644 && gdatetime_640 != 0 && ai_28) break;
               ifractals_32 = iFractals(Symbol(), a_timeframe_20, MODE_LOWER, li_44);
               if (ifractals_32 != 0.0) {
                  ifractals_32 = NormalizeDouble(ifractals_32 - ai_24 * Point, Digits);
                  break;
               }
            }
            if (DrawInfo) {
               ObjectDelete("FR Buy");
               ObjectCreate("FR Buy", OBJ_ARROW, 0, gdatetime_640, ifractals_32 + Point, 0, 0, 0, 0);
               ObjectSet("FR Buy", OBJPROP_ARROWCODE, 218);
               ObjectSet("FR Buy", OBJPROP_COLOR, RedColor);
            }
         }
         if (ai_0 == -1) {
            for (int li_40 = 3; li_40 < 100; li_40++) {
               gdatetime_632 = iTime(Symbol(), a_timeframe_20, li_40);
               if (gdatetime_632 <= gdatetime_636 && gdatetime_632 != 0 && ai_28) break;
               ifractals_32 = iFractals(Symbol(), a_timeframe_20, MODE_UPPER, li_40);
               if (ifractals_32 != 0.0) {
                  ifractals_32 = NormalizeDouble(ifractals_32 + ai_24 * Point, Digits);
                  break;
               }
            }
            if (DrawInfo) {
               ObjectDelete("FR Sell");
               ObjectCreate("FR Sell", OBJ_ARROW, 0, gdatetime_632, ifractals_32, 0, 0, 0, 0);
               ObjectSet("FR Sell", OBJPROP_ARROWCODE, 217);
               ObjectSet("FR Sell", OBJPROP_COLOR, Blue);
            }
         }
      }
      if (a_pips_12 == 1.0) {
         if (ai_0 == 1) {
            for (li_44 = StartCandle; li_44 <= EndCandle; li_44++) {
               ifractals_32 = NormalizeDouble(iLow(Symbol(), a_timeframe_20, li_44) - ai_24 * Point, Digits);
               if (ifractals_32 != 0.0) {
                  if (ad_4 - gi_516 * Point >= ifractals_32) break;
                  ifractals_32 = 0;
               }
            }
            if (DrawInfo) {
               ObjectDelete("FR Buy");
               ObjectCreate("FR Buy", OBJ_ARROW, 0, iTime(Symbol(), a_timeframe_20, li_44), ifractals_32, 0, 0, 0, 0);
               ObjectSet("FR Buy", OBJPROP_ARROWCODE, 159);
               ObjectSet("FR Buy", OBJPROP_COLOR, RedColor);
            }
         }
         if (ai_0 == -1) {
            for (li_40 = StartCandle; li_40 <= EndCandle; li_40++) {
               ifractals_32 = NormalizeDouble(iHigh(Symbol(), a_timeframe_20, li_40) + ai_24 * Point, Digits);
               if (ifractals_32 != 0.0) {
                  if (ad_4 + gi_516 * Point <= ifractals_32) break;
                  ifractals_32 = 0;
               }
            }
            if (DrawInfo) {
               ObjectDelete("FR Sell");
               ObjectCreate("FR Sell", OBJ_ARROW, 0, iTime(Symbol(), a_timeframe_20, li_40), ifractals_32 + Point, 0, 0, 0, 0);
               ObjectSet("FR Sell", OBJPROP_ARROWCODE, 159);
               ObjectSet("FR Sell", OBJPROP_COLOR, Blue);
            }
         }
      }
   }
   if (DrawInfo) {
      if (ai_0 == 1) {
         ObjectDelete("SL Buy" + ai_0);
         if (ifractals_32 != 0.0) {
            ObjectCreate("SL Buy" + ai_0, OBJ_ARROW, 0, Time[0] + 60 * Period(), ifractals_32, 0, 0, 0, 0);
            ObjectSet("SL Buy" + ai_0, OBJPROP_ARROWCODE, 4);
            ObjectSet("SL Buy" + ai_0, OBJPROP_COLOR, RedColor);
         }
      }
      if (ai_0 == -1) {
         ObjectDelete("SL Sell" + ai_0);
         if (ifractals_32 != 0.0) {
            ObjectCreate("SL Sell" + ai_0, OBJ_ARROW, 0, Time[0] + 60 * Period(), ifractals_32, 0, 0, 0, 0);
            ObjectSet("SL Sell" + ai_0, OBJPROP_ARROWCODE, 4);
            ObjectSet("SL Sell" + ai_0, OBJPROP_COLOR, Blue);
         }
      }
   }
   return (ifractals_32);
}

// 797314ECE0644C9C521C7F3C70BB5011
int f0_6846(int ai_0, double a_price_4) {
   int ticket_12;
   int li_16;
   double maxlot_28;
   int error_36;
   if (OrdersTotal() >= gorder_total_596) {
      Print("OrdersTotal áîëüøå äîïóñòèìîãî");
      return;
   }
   int li_20 = gcount_524;
   int li_24 = gcount_520;
   if (íåÓâåë÷èâàòüËîò) {
      li_24 = 0;
      li_20 = 0;
   }
   gd_564 = MarketInfo(Symbol(), MODE_MAXLOT);
   while (true) {
      ticket_12 = 1;
      if (ai_0 == 1) {
         if ((a_price_4 - Ask) / Point >= gi_516) {
            if (MultiplyLot != 0.0 && gorder_lots_580 > 0.0) maxlot_28 = NormalizeDouble(gorder_lots_580 * MultiplyLot, OkrLot);
            else maxlot_28 = NormalizeDouble(f0_13526() * MathPow(MultiplyLot, li_20), OkrLot);
            if (maxlot_28 > gd_564) maxlot_28 = gd_564;
            ticket_12 = OrderSend(Symbol(), OP_BUYSTOP, maxlot_28, a_price_4, slippage, 0, 0, comment, Magic, 0, Blue);
         } else ticket_12 = 0;
      }
      if (ai_0 == -1) {
         if ((Bid - a_price_4) / Point >= gi_516) {
            if (MultiplyLot != 0.0 && gorder_lots_588 > 0.0) maxlot_28 = NormalizeDouble(gorder_lots_588 * MultiplyLot, OkrLot);
            else maxlot_28 = NormalizeDouble(f0_13526() * MathPow(MultiplyLot, li_24), OkrLot);
            if (maxlot_28 > gd_564) maxlot_28 = gd_564;
            ticket_12 = OrderSend(Symbol(), OP_SELLSTOP, maxlot_28, a_price_4, slippage, 0, 0, comment, Magic, 0, RedColor);
         } else ticket_12 = 0;
      }
      if (ticket_12 != -1) break;
      error_36 = GetLastError();
      if (error_36 == 148/* TRADE_TOO_MANY_ORDERS */) gorder_total_596 = OrdersTotal();
      Print("===>  Error OPENORDER ", error_36, "  price=", DoubleToStr(a_price_4, Digits), "  Lot=", DoubleToStr(maxlot_28, Digits));
      li_16++;
      if (li_16 > 10) return (0);
      Sleep(2000);
      RefreshRates();
   }
   return (1);
}

// 95478FA2C2D43ED20554C07BFA8D1CE9
void f0_8371(int ai_0) {
   bool is_deleted_4;
   int li_12;
   int cmd_16;
   int li_unused_8 = 1;
   while (true) {
      is_deleted_4 = TRUE;
      for (int pos_20 = OrdersTotal() - 1; pos_20 >= 0; pos_20--) {
         if (OrderSelect(pos_20, SELECT_BY_POS, MODE_TRADES)) {
            if (OrderSymbol() == Symbol() && OrderMagicNumber() == Magic) {
               cmd_16 = OrderType();
               if (cmd_16 == OP_BUYSTOP && ai_0 > -1) is_deleted_4 = OrderDelete(OrderTicket());
               if (cmd_16 == OP_SELLSTOP && ai_0 < 1) is_deleted_4 = OrderDelete(OrderTicket());
            }
         }
      }
      if (!is_deleted_4) {
         li_12++;
         Print("===>  Deleteorder Error ", GetLastError());
         Sleep(2000);
         RefreshRates();
      }
      if (is_deleted_4 || li_12 > 10) break;
   }
}

// 4CEF47202C318359E58492821436342B
int f0_4334(int ai_0) {
   if (ai_0 > 43200) return (0);
   if (ai_0 > 10080) return (43200);
   if (ai_0 > 1440) return (10080);
   if (ai_0 > 240) return (1440);
   if (ai_0 > 60) return (240);
   if (ai_0 > 30) return (60);
   if (ai_0 > 15) return (30);
   if (ai_0 > 5) return (15);
   if (ai_0 > 1) return (5);
   if (ai_0 == 1) return (1);
   if (ai_0 == 0) return (Period());
   return (0);
}

// A9E80DEDFA897CFD8F98BAD01077E0A7
string f0_9563(int ai_0) {
   if (ai_0 == 1) return ("M1");
   if (ai_0 == 5) return ("M5");
   if (ai_0 == 15) return ("M15");
   if (ai_0 == 30) return ("M30");
   if (ai_0 == 60) return ("H1");
   if (ai_0 == 240) return ("H4");
   if (ai_0 == 1440) return ("D1");
   if (ai_0 == 10080) return ("W1");
   if (ai_0 == 43200) return ("MN1");
   return ("îøèáêà ïåðèîäà " + ai_0);
}

// 2208AB04CCD91A8303FE0D7679EA198F
int f0_1910(int a_cmd_0) {
   int error_8;
   int li_12;
   int cmd_16;
   int count_24;
   bool is_closed_4 = TRUE;
   if ( 2 > 1 ) {
      while ( 2 > 1 ) { //educated by 4WORDS (WWI)
         for (int pos_20 = OrdersTotal() - 1; pos_20 >= 0; pos_20--) {
            if (OrderSelect(pos_20, SELECT_BY_POS)) {
               if (OrderSymbol() == Symbol() && OrderMagicNumber() == Magic) {
                  cmd_16 = OrderType();
                  if (cmd_16 == OP_BUY && a_cmd_0 == cmd_16) {
                     is_closed_4 = OrderClose(OrderTicket(), OrderLots(), NormalizeDouble(Bid, Digits), 3, Blue);
                     if (is_closed_4) Comment("Çàêðûò îðäåð N ", OrderTicket(), "  ïðèáûëü ", OrderProfit(), "     ", TimeToStr(TimeCurrent(), TIME_SECONDS));
                  }
                  if (cmd_16 == OP_SELL && a_cmd_0 == cmd_16) {
                     is_closed_4 = OrderClose(OrderTicket(), OrderLots(), NormalizeDouble(Ask, Digits), 3, RedColor);
                     if (is_closed_4) Comment("Çàêðûò îðäåð N ", OrderTicket(), "  ïðèáûëü ", OrderProfit(), "     ", TimeToStr(TimeCurrent(), TIME_SECONDS));
                  }
                  if (!is_closed_4) {
                     error_8 = GetLastError();
                     if (error_8 >= 2/* COMMON_ERROR */) {
                        if (error_8 == 129/* INVALID_PRICE */) {
                           Comment("Íåïðàâèëüíàÿ öåíà ", TimeToStr(TimeCurrent(), TIME_SECONDS));
                           RefreshRates();
                           continue;
                        }
                        if (error_8 == 146/* TRADE_CONTEXT_BUSY */) {
                           if (!(IsTradeContextBusy())) continue;
                           Sleep(2000);
                           continue;
                        }
                        Comment("Îøèáêà ", error_8, " çàêðûòèÿ îðäåðà N ", OrderTicket(), "     ", TimeToStr(TimeCurrent(), TIME_SECONDS));
                     }
                  }
               }
            }
         }
         count_24 = 0;
         for (pos_20 = 0; pos_20 < OrdersTotal(); pos_20++) {
            if (OrderSelect(pos_20, SELECT_BY_POS)) {
               if (OrderSymbol() == Symbol() && OrderMagicNumber() == Magic) {
                  cmd_16 = OrderType();
                  if (cmd_16 == OP_BUY || cmd_16 == OP_SELL && a_cmd_0 == cmd_16) count_24++;
               }
            }
         }
         if (count_24 == 0) break;
         li_12++;
         if (li_12 > 10) {
            Alert(Symbol(), " Íå óäàëîñü çàêðûòü âñå ñäåëêè, îñòàëîñü åùå ", count_24);
            return (0);
         }
         Sleep(1000);
         RefreshRates();
      }
   }
   return (1);
}


/*// 93ADA40DA341D3F06C6B5392C2A501C5
int f0_8278() {
   string str_concat_0 = StringConcatenate(TerminalPath(), CharToStr(92), "experts", CharToStr(92), WindowExpertName(), ".mq", DoubleToStr(4, 0));
   if (_lopen(str_concat_0, 4) >= 0) {
      _lclose(str_concat_0);
      return (1);
   }
   return (0);
}*/


// DABC5DBF75D151A587AD2276CD6849E6
void f0_12336(string a_name_0, int a_corner_8, int a_x_12, int a_y_16, int a_fontsize_20, string a_fontname_24, color a_color_32, int a_bool_36, string a_name_40) {
   if (ObjectFind(a_name_0) == -1) {
      ObjectCreate(a_name_0, OBJ_LABEL, 0, 0, 0);
      ObjectSet(a_name_0, OBJPROP_CORNER, a_corner_8);
      ObjectSet(a_name_40, OBJPROP_COLOR, a_color_32);
      ObjectSet(a_name_40, OBJPROP_BACK, a_bool_36);
      ObjectSet(a_name_0, OBJPROP_XDISTANCE, a_x_12);
      ObjectSet(a_name_0, OBJPROP_YDISTANCE, a_y_16);
   }
   ObjectSetText(a_name_0, a_name_40, a_fontsize_20, a_fontname_24, a_color_32);
}

// 01FDFC7FC92C3F23C8A326305AA47634
int f0_119(string as_0) {
   string name_12;
   string ls_20;
   for (int li_8 = ObjectsTotal() - 1; li_8 >= 0; li_8--) {
      name_12 = ObjectName(li_8);
      ls_20 = StringSubstr(name_12, 0, StringLen(as_0));
      if (ls_20 == as_0) ObjectDelete(name_12);
   }
   Comment("");
   return (0);
}

// CB5FEB1B7314637725A2E73BDC9F7295
int f0_11478(bool ai_0, int ai_4, int ai_8) {
   if (ai_0) return (ai_4);
   return (ai_8);
}

// 37885B5C7DAAC23877458921DFA83EED
string f0_3116(int ai_0) {
   switch (ai_0) {
   case 1:
      return ("Ïîíåäåëüíèê");
   case 2:
      return ("Âòîðíèê");
   case 3:
      return ("Ñðåäà");
   case 4:
      return ("×åòâåðã");
   case 5:
      return ("Ïÿòíèöà");
   }
   return ("Îøèáêà");
}

// EEEC6C7A9D2B475C23650B202208B892
double f0_13526() {
   double ld_ret_0;
   if (ld_ret_0 < LineBalance2) ld_ret_0 = NormalizeDouble(LineLot1 + (LineLot2 - LineLot1) * (AccountBalance() - LineBalance1) / (LineBalance2 - LineBalance1), OkrLot);
   else ld_ret_0 = NormalizeDouble(LineLot2 + (LineLot3 - LineLot2) * (AccountBalance() - LineBalance2) / (LineBalance3 - LineBalance2), OkrLot);
   if (gd_564 > NormalizeDouble(AccountFreeMargin() / MarketInfo(Symbol(), MODE_MARGINREQUIRED), OkrLot)) gd_564 = NormalizeDouble(AccountFreeMargin() / MarketInfo(Symbol(), MODE_MARGINREQUIRED), OkrLot);
   if (ld_ret_0 > gd_564 && gd_564 != 0.0) ld_ret_0 = gd_564;
   if (ld_ret_0 < MarketInfo(Symbol(), MODE_MINLOT)) ld_ret_0 = MarketInfo(Symbol(), MODE_MINLOT);
   string ls_8 = DoubleToStr(ld_ret_0, 2);
   if (MultiplyLot > 1.0) ls_8 = StringConcatenate(ls_8, " õ ", DoubleToStr(MultiplyLot, 2));
   f0_12336(StringConcatenate(gs_cm__672, "slot3"), 0, 10, 0, gi_604, "Arial", TextColor, FALSE, ls_8);
   return (ld_ret_0);
}
        
