#property copyright "QUASMIDO"
#property link      "Black1239"

#include <WinUser32.mqh>
#include <stdlib.mqh>
#import "kernel32.dll"
int GetTimeZoneInformation(int& a0[]);
#import

#import "QUASMIDO.dll"
   int GetGmtOffset(int a0, int a1, int a2, double& a3[], int& a4[]);
   void Activate(string a0, int a1, double a2, string a3, int a4, string a5, int a6);
   int GetState();
   bool GetStateMessage(string a0, int a1, string a2, int a3);
   int GetStatus();
   int Increment(string a0);
   bool Decrement(int a0);
   bool IsTradeTime(int a0, int a1, int a2, int a3, int a4);
   bool s1_Buy(double a0, double a1, double a2, double a3, double a4, double a5, double a6, double a7, int a8, int a9);
   bool s1_Sell(double a0, double a1, double a2, double a3, double a4, double a5, double a6, double a7, int a8, int a9);
   bool s2_Buy(double a0, double a1, double a2, double a3, double a4, double a5, int a6, int a7);
   bool s2_Sell(double a0, double a1, double a2, double a3, double a4, double a5, int a6, int a7);
   bool s1_Init(int a0, double& a1[]);
   bool s2_Init(int a0, double& a1[]);
#import 
extern string comment= "Ver.1.37";
extern string _1 = "System Parameters";
extern bool Stealth = TRUE;
extern bool Aggressive = TRUE;
extern double GmtOffset = 0.0;
extern bool NFA = FALSE;
extern bool AutoLocalGmtOffset = FALSE;
extern bool AutoServerGmtOffset = TRUE;
extern int S1_Reference = 77777773;
extern int S2_Reference = 33333337;
//extern string ReceiptCode = "";
extern string _2 = "Comment Position";
extern int TopPadding = 30;
extern int LeftPadding = 20;
extern color TextColor1 = WhiteSmoke;
extern color TextColor2 = LightGray;
//extern string _3 = "Strategy Parameters";
bool RemoteSafetyMode = FALSE;
extern int Slippage = 3;
bool SendEmails = FALSE;
extern string OrderComments = "";
extern string _3 = "Order Management";
extern double LotSize = 0.01;
extern string _4 = "Ratio Order Management";
extern double RiskLevel = 0.05;
extern bool RecoveryMode = TRUE;
extern string _5="Time Filter";
extern int gmtshift=2;             // gmt offset of the broker
extern bool filter=false;          // enable time filter
//Definition of the Hour, this is necessary to have a drop down menu to input the hour
enum Enum_Hour{
   h00=0,      //00:00
   h01=1,      //01:00
   h02=2,      //02:00
   h03=3,      //03:00
   h04=4,      //04:00
   h05=5,      //05:00
   h06=6,      //06:00
   h07=7,      //07:00
   h08=8,      //08:00
   h09=9,      //09:00
   h10=10,     //10:00
   h11=11,     //11:00
   h12=12,     //12:00
   h13=13,     //13:00
   h14=14,     //14:00
   h15=15,     //15:00
   h16=16,     //16:00
   h17=17,     //17:00
   h18=18,     //18:00
   h19=19,     //19:00
   h20=20,     //20:00
   h21=21,     //21:00
   h22=22,     //22:00
   h23=23,     //23:00
   };
input Enum_Hour start=h02;        //Start opearation hour
input Enum_Hour end=h20;          //Last operation hour
input start=4;                    // start to trade after this hour
input end=23;                     // stop to trade after this hour
bool tradesunday=true;            // trade on sunday
extern bool fridayfilter=false;   // enable special time filter on friday
input Enum_Hour fridayend=h19;     // stop to trade after this hour
int istart,iend; 
//---------------------------------------
bool gi_224 = TRUE;
bool gi_228 = TRUE;
int gi_232 = 3;
bool gi_236 = TRUE;
int gi_240;
int g_datetime_244;
int gi_248;
double g_hour_252;
int gi_260;
int g_spread_264;
int g_spread_268;
int g_stoplevel_272;
double gd_276;
double gd_284;
bool gi_300 = TRUE;
int gi_304 = 0;
int gi_308 = 0;
int gi_312 = 0;
int gi_316;
int gi_unused_320 = 1;
bool g_global_var_324 = FALSE;
string gs_328 = "";
string gs_336 = "";
string gs_344;
string gs_352;
string gs_360;
int g_timeframe_368 = PERIOD_M15;
int gi_372 = 10;
int gi_376 = 50;
int gi_380 = 200;
int gi_384 = 20;
int gi_388 = 0;
int gi_392 = 16711680;
int gi_396 = 255;
int g_period_400 = 6;
int g_period_404 = 20;
int g_period_408 = 8;
double gd_412 = 70.0;
double gd_420 = 30.0;
double gd_428 = 64.0;
double gd_436 = 36.0;
bool gi_444 = TRUE;
bool gi_448 = TRUE;
bool gi_452 = TRUE;
int gi_456 = 12;
bool gi_460 = TRUE;
int gi_464 = 20;
bool gi_468 = TRUE;
bool gi_472 = FALSE;
double gd_476 = 1.0;
double gd_484 = 24.0;
bool gi_492 = TRUE;
double gd_496 = 1.0;
double gd_504 = 1.0;
bool gi_512 = FALSE;
int gi_516 = 0;
bool gi_520 = TRUE;
bool gi_524 = TRUE;
int gi_528 = 21;
int gi_532 = 1;
int gi_536 = 21;
int gi_540 = 0;
int g_timeframe_544 = PERIOD_M5;
int gi_548 = 35;
int gi_552 = 60;
int gi_556 = 200;
int gi_560 = 20;
double gd_564 = 1.0;
int gi_572 = 0;
int gi_576 = 16748574;
int gi_580 = 9639167;
int gi_584 = 36;
int g_period_588 = 168;
int g_period_592 = 275;
bool gi_596 = TRUE;
bool gi_600 = FALSE;
bool gi_604 = TRUE;
double gd_608 = 1.0;
double gd_616 = 12.0;
double gd_624 = 24.0;
bool gi_632 = FALSE;
bool gi_636 = FALSE;
int gi_640 = 0;
bool gi_644 = TRUE;
bool gi_648 = TRUE;
int gi_652 = 21;
int gi_656 = 4;
int gi_660 = 21;
int gi_664 = 0;
int gi_668 = 0;
int gi_672 = 0;
int gi_676 = 0;
int gi_680;
int gi_684;
int gi_688;
int gi_692;
double gd_696 = 0.0;
double gd_704 = 0.0;
bool gi_712 = FALSE;
bool gi_716;
bool gi_720;
int gi_724;
int g_count_728 = 0;
int g_ticket_732 = -2;
int g_ticket_736 = -2;
double g_ord_profit_740 = 0.0;
double g_ord_profit_748 = 0.0;
int g_ticket_756 = -2;
int g_ticket_760 = -2;
double g_ord_profit_764 = 0.0;
double g_ord_profit_772 = 0.0;
int gi_780 = 0;
int gi_784 = 0;
double gd_788 = 2.0;
int gi_796 = 0;
int gi_800 = 0;
double g_irsi_804;
double g_irsi_812;
double g_irsi_820;
double g_irsi_828;
double g_icci_836;
double g_icci_844;
double g_icci_852;
double g_ima_876;
bool gi_884 = TRUE;
bool gi_888 = TRUE;
double g_ihigh_892 = 0.0;
double g_ilow_900 = 0.0;
bool gi_908 = FALSE;
int gi_912 = 0;
int gi_916 = 0;
int gi_920 = 0;
int gi_924 = 0;
int gi_928;
int gi_932;
int gi_936 = 0;
int gi_940 = 0;
int gi_944;
int g_datetime_948 = 0;
int g_datetime_952 = 0;
int g_ticket_956 = 0;
int g_datetime_960 = 0;
int g_ticket_964 = 0;
int g_datetime_968 = 0;
bool gi_972 = TRUE;
int g_datetime_976 = 0;
int g_datetime_980 = 0;
int gi_984 = 0;
double g_icci_988;
double g_icci_996;
double g_ihigh_1004;
double g_ilow_1012;
double g_ihigh_1020;
double g_ilow_1028;
bool gi_1036 = FALSE;
int gi_1040 = 0;
int gi_1044 = 0;
int gi_1048 = 0;
int gi_1052 = 0;
int gi_1056;
int gi_1060;
int g_ticket_1064 = -1;
int gi_1068;
int gi_1072;
int g_datetime_1076;
int g_datetime_1080;
double g_ord_open_price_1084;
int g_ticket_1092 = -1;
int gi_1096;
int gi_1100;
int g_datetime_1104;
int g_datetime_1108;
double g_ord_open_price_1112;
bool gi_1120 = TRUE;
int g_datetime_1124 = 0;
int g_datetime_1128 = 0;
string gsa_1132[] = {".", "..", "...", "....", "....."};
string gs_1144 = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
bool gi_1164 = FALSE;

int S1_CheckSymbol() {
   double lda_0[21];
   if (s1_Init(gi_316, lda_0)) {
      gi_372 = lda_0[0];
      gi_380 = lda_0[1];
      gi_384 = lda_0[2];
      gi_388 = lda_0[3];
      g_period_400 = lda_0[4];
      g_period_404 = lda_0[5];
      g_period_408 = lda_0[6];
      gd_412 = lda_0[7];
      gd_420 = lda_0[8];
      gd_428 = lda_0[9];
      gd_436 = lda_0[10];
      gd_476 = lda_0[11];
      gd_484 = lda_0[12];
      gd_496 = lda_0[13];
      gd_504 = lda_0[14];
      gi_516 = lda_0[15];
      gi_528 = lda_0[16];
      gi_532 = lda_0[17];
      gi_536 = lda_0[18];
      gi_540 = lda_0[19];
      g_timeframe_368 = lda_0[20];
      return (1);
   }
   return (0);
}

int S2_CheckSymbol() {
   double lda_0[17];
   if (s2_Init(gi_316, lda_0)) {
      gi_548 = lda_0[0];
      gi_556 = lda_0[1];
      gi_560 = lda_0[2];
      gd_564 = lda_0[3];
      gi_572 = lda_0[4];
      gi_584 = lda_0[5];
      g_period_588 = lda_0[6];
      g_period_592 = lda_0[7];
      gd_608 = lda_0[8];
      gd_616 = lda_0[9];
      gd_624 = lda_0[10];
      gi_640 = lda_0[11];
      gi_652 = lda_0[12];
      gi_656 = lda_0[13];
      gi_660 = lda_0[14];
      gi_664 = lda_0[15];
      g_timeframe_544 = lda_0[16];
      return (1);
   }
   return (0);
}

int init() {
   double l_global_var_4;
   double ld_12;
   if (gi_236) gi_240 = 0;
   else gi_240 = 1;
   gi_316 = Increment(Symbol());
   gi_684 = LeftPadding;
   gi_680 = TopPadding;
   if (gi_688 != LeftPadding || gi_692 != TopPadding) {
      gi_688 = LeftPadding;
      gi_692 = TopPadding;
   } else GetPos(0, gi_684, gi_680);
   gi_672 = 0;
   gi_668 = 0;
   gs_344 = "QUSMIDO" + " ver: " + "1.37" + " Symbol: " + Symbol();
   PrintLN(gs_344, TextColor2);
   PrintSep();
   ObjectsRedraw();
   /*for (int l_count_0 = 0; !IsStopped() && StringLen(AccountName()) <= 0; l_count_0++) {
      PrintLN("Waiting for connection" + PPrint(l_count_0), TextColor1, 2, 2);
      ObjectsRedraw();
      Sleep(150);
   }
   PrintLN("Authentication...", TextColor1, 2, 2);
   ObjectsRedraw();
   gi_308 = 0;
   ReceiptCode = StringTrimLeft(StringTrimRight(ReceiptCode));
   if (StringLen(ReceiptCode) <= 0) {
      if (GlobalVariableCheck("GV_MegaDroid_REC")) {
         l_global_var_4 = GlobalVariableGet("GV_MegaDroid_REC");
         ReceiptCode = Base36Encode(l_global_var_4);
      } else gi_308 |= 32;
   } else {
      ld_12 = Base36Decode(ReceiptCode);
      if (GlobalVariableSet("GV_MegaDroid_REC", ld_12) == 0) gi_308 |= 64;
   }
   Activate("1.37", AccountNumber(), AccountBalance(), AccountCompany(), IsDemo(), StringTrimLeft(StringTrimRight(ReceiptCode)), 1);
   gi_304 = GetState();
   if (!IsTesting() && gi_304 & 65536 > 0) GetStMessage();
   gi_304 |= gi_308;
   PrintResponse(gi_304, 2, 2);
   PrintSep();*/
   ObjectsRedraw();
   bool li_20 = FALSE;
   bool li_24 = FALSE;
   li_20 = S1_CheckSymbol();
   li_24 = S2_CheckSymbol();
   if (li_20) {
      gi_224 = FALSE;
      if (Aggressive) gi_228 = li_24;
      else gi_228 = TRUE;
   } else {
      if (li_24) {
         gi_224 = TRUE;
         gi_228 = TRUE;
      } else {
         gi_228 = TRUE;
         gi_224 = TRUE;
      }
   }
   if (!gi_224 && !gi_228) {
      gs_352 = "Error:";
      gs_360 = "This currency is not supported!";
   } else {
      gs_352 = "Aggressive:";
      gs_360 = BPrint(gi_224 && gi_228);
      if (Aggressive && !(gi_224 && gi_228)) gs_360 = gs_360 + " (not supported)";
   }
   PrintLN(gs_352);
   PrintLN(gs_360, TextColor2, gi_672, gi_668 - 1, 5 * (StringLen(gs_352) + 1));
   int l_str_len_28 = StringLen(gs_328);
   int l_str_len_32 = StringLen(gs_336);
   if (l_str_len_28 > 0) PrintLN(gs_328);
   if (l_str_len_32 > 0) PrintText(gs_336, TextColor2, gi_672, gi_668 - 1, 5 * (l_str_len_28 + 1));
   PrintSep();
   ObjectsRedraw();
   if (!gi_224 && !gi_228) MessageBox("You have selected the wrong currency pair!", gs_344 + ": Warning", MB_ICONEXCLAMATION);
   gi_312 = 0;
   if (IsTesting()) gi_300 = FALSE;
   g_global_var_324 = FALSE;
   if (!IsTesting())
      if (GlobalVariableCheck("GV_MegaDroid_MKT")) g_global_var_324 = GlobalVariableGet("GV_MegaDroid_MKT");
   return (0);
}

/*void GetStMessage() {
   string ls_0 = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx";
   string ls_8 = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa";
   if (GetStateMessage(ls_0, 60, ls_8, 255)) {
      gs_328 = StringConcatenate(ls_0, ":");
      gs_336 = ls_8;
      return;
   }
   gs_328 = "";
   gs_336 = "";
}*/

int deinit() {
   Decrement(gi_316);
   if (IsTesting()) {
      if (!IsVisualMode()) {
         PrintLN("GmtOffset:");
         PrintLN(DoubleToStr(GmtOffset, 1), TextColor2, gi_672, gi_668 - 1, 55);
         PrintSep();
         PrintLN("Digits:");
         PrintLN(Digits, TextColor2, gi_672, gi_668 - 1, 35);
         PrintLN("Spread:");
         PrintLN(StringConcatenate(DoubleToStr(g_spread_264 / gd_276, 1), " (", g_spread_264, " pips)"), TextColor2, gi_672, gi_668 - 1, 40);
         PrintSep();
      }
      return (0);
   }
   GlobalVariableSet("GV_MegaDroid_MKT", g_global_var_324);
   switch (UninitializeReason()) {
   case REASON_CHARTCLOSE:
   case REASON_REMOVE:
      Deleteobjects(0, gi_676);
      gi_676 = 0;
      break;
   case REASON_RECOMPILE:
   case REASON_CHARTCHANGE:
   case REASON_PARAMETERS:
   case REASON_ACCOUNT:
      Deleteobjects(1, gi_676);
      gi_676 = 1;
   }
   return (0);
}

int waitForContext() {
   for (int l_count_0 = 0; IsTradeContextBusy() && l_count_0 < 10; l_count_0++) Sleep(15);
   if (l_count_0 >= 10) Print("Trade context is buisy more than ", DoubleToStr(15 * l_count_0 / 1000, 2), " seconds");
   else
      if (l_count_0 > 0) Print("Trade context was buisy ", DoubleToStr(15 * l_count_0 / 1000, 2), " seconds");
   return (l_count_0);
}

int openOrder(int a_cmd_0, double a_lots_4, double a_price_12, double a_price_20, double a_price_28, int a_magic_36, color a_color_40, bool ai_44 = FALSE) {
   double l_price_48;
   double l_price_56;
   int l_error_68;
   double l_price_76;
   int l_ticket_64 = -1;
   int l_count_72 = 0;
   bool li_84 = FALSE;
   double ld_88 = gd_788 * gd_276 * Point;
   while (!li_84) {
      if (!ai_44) {
         l_price_48 = a_price_20;
         l_price_56 = a_price_28;
      } else {
         l_price_48 = 0;
         l_price_56 = 0;
      }
      
   istart=start+(gmtshift);if(istart>23)istart=istart-24;
   iend=end+(gmtshift);if(iend>23)iend=iend-24;

   if((tradesunday==false && DayOfWeek()==0) || (filter && DayOfWeek()>0 && ((istart<=iend && !(Hour()>=(istart) && Hour()<=(iend)))
   || (istart>iend && !((Hour()>=(istart) && Hour()<=23) || (Hour()>=0 && Hour()<=(iend)))))) || (fridayfilter && DayOfWeek()==5 && !(Hour()<(fridayend+(gmtshift))))){return(0);}

   
      if (a_cmd_0 == OP_BUY) l_price_76 = MarketInfo(Symbol(), MODE_ASK);
      else
         if (a_cmd_0 == OP_SELL) l_price_76 = MarketInfo(Symbol(), MODE_BID);
      if (l_count_72 > 0 && MathAbs(l_price_76 - a_price_12) > ld_88) {
         Print("Price is too far");
         break;
      }
      waitForContext();
      l_ticket_64 = OrderSend(Symbol(), a_cmd_0, a_lots_4, a_price_12, Slippage * gd_276, l_price_56, l_price_48, OrderComments, a_magic_36, 0, a_color_40);
      if (l_ticket_64 >= 0) break;
      l_count_72++;
      l_error_68 = GetLastError();
      switch (l_error_68) {
      case 130/* INVALID_STOPS */:
         if (!ai_44) g_global_var_324 = TRUE;
      case 0/* NO_ERROR */:
         if (!ai_44) ai_44 = TRUE;
         else li_84 = TRUE;
         break;
      case 4/* SERVER_BUSY */: break;
      case 6/* NO_CONNECTION */: break;
      case 129/* INVALID_PRICE */: break;
      case 136/* OFF_QUOTES */: break;
      case 137/* BROKER_BUSY */: break;
      case 146/* TRADE_CONTEXT_BUSY */: break;
      case 135/* PRICE_CHANGED */:
      case 138/* REQUOTE */:
         RefreshRates();
         break;
      default:
         li_84 = TRUE;
      }
      if (l_count_72 > 10) break;
   }
   if (l_ticket_64 >= 0) {
      if (ai_44) {
         if (OrderSelect(l_ticket_64, SELECT_BY_TICKET)) {
            Sleep(1000);
            waitForContext();
            OrderModify(l_ticket_64, OrderOpenPrice(), a_price_28, a_price_20, 0, a_color_40);
         }
      }
      if (l_count_72 > 5) Print(OpPrint(a_cmd_0) + " operation attempts: ", l_count_72);
      if (SendEmails) SendMail(gs_344, "Open " + OpPrint(a_cmd_0) + ": [" + Symbol() + "] " + NormalizeDouble(a_price_12, Digits));
   } else Print(OpPrint(a_cmd_0) + " operation failed - error(", l_error_68, "): ", ErrorDescription(l_error_68), " attempts: ", l_count_72);
   return (l_ticket_64);
}

int closeOrder(int ai_0, color a_color_4, bool ai_8 = FALSE) {
   double l_price_12;
   double l_ord_takeprofit_20;
   double l_ord_stoploss_28;
   int l_error_40;
   if (ai_8) {
      waitForContext();
      l_ord_takeprofit_20 = OrderTakeProfit();
      l_ord_stoploss_28 = OrderStopLoss();
      OrderModify(OrderTicket(), OrderOpenPrice(), 0, 0, 0, a_color_4);
   }
   for (int l_count_36 = 0; l_count_36 < 10; l_count_36++) {
      if (waitForContext() > 5) RefreshRates();
      if (ai_0 == 0) l_price_12 = Bid;
      else l_price_12 = Ask;
      if (OrderClose(OrderTicket(), OrderLots(), l_price_12, Slippage * gd_276, a_color_4)) return (-1);
      l_error_40 = GetLastError();
      Print("Order close operation failed - error(", l_error_40, "): ", ErrorDescription(l_error_40));
      RefreshRates();
   }
   if (ai_8) {
      waitForContext();
      OrderModify(OrderTicket(), OrderOpenPrice(), l_ord_stoploss_28, l_ord_takeprofit_20, 0, a_color_4);
   }
   Print("Order close operation failed");
   return (OrderTicket());
}

double MMLots(double ad_0, double ad_8, int &ai_16) {
   if (AccountLeverage() < 100) return (NormalizeLots(ad_0 * ad_8 / MarketInfo(Symbol(), MODE_MARGINREQUIRED), ai_16));
   return (NormalizeLots(ad_0 * ad_8 / MarketInfo(Symbol(), MODE_MARGINREQUIRED) / (AccountLeverage() / 100.0), ai_16));
}

double NormalizeLots(double ad_0, int &ai_8) {
   double l_lotstep_20 = MarketInfo(Symbol(), MODE_LOTSTEP);
   double l_minlot_28 = MarketInfo(Symbol(), MODE_MINLOT);
   double l_maxlot_36 = MarketInfo(Symbol(), MODE_MAXLOT);
   double ld_ret_12 = MathCeil(ad_0 / l_lotstep_20) * l_lotstep_20;
   ai_8 = 0;
   if (ld_ret_12 < l_minlot_28) {
      ld_ret_12 = l_minlot_28;
      ai_8 = -1;
   }
   if (ld_ret_12 > l_maxlot_36) {
      ld_ret_12 = l_maxlot_36;
      ai_8 = 1;
   }
   return (ld_ret_12);
}

void CountBalance(double ad_0) {
   gd_696 += ad_0;
   if (gd_704 < gd_696) gd_704 = gd_696;
}

double RecoveryLot(double ad_0) {
   int li_8;
   if (gd_704 > gd_696 && gi_780 > gi_796) return (NormalizeLots(1.6 * ad_0, li_8));
   gi_796 = gi_780;
   return (ad_0);
}

int RecoverTrades() {
   int l_count_0 = 0;
   gd_696 = 0;
   gd_704 = 0;
   for (int l_pos_4 = OrdersHistoryTotal() - 1; l_pos_4 >= 0; l_pos_4--) {
      if (OrderSelect(l_pos_4, SELECT_BY_POS, MODE_HISTORY)) {
         if (OrderMagicNumber() != S1_Reference && OrderMagicNumber() != S2_Reference) continue;
         CountBalance(OrderProfit());
         l_count_0++;
      }
   }
   return (l_count_0);
}

int Recover(int a_magic_0, int a_cmd_4) {
   for (int l_pos_8 = OrdersTotal() - 1; l_pos_8 >= 0; l_pos_8--) {
      if (OrderSelect(l_pos_8, SELECT_BY_POS)) {
         if (OrderMagicNumber() == a_magic_0) {
            if (OrderSymbol() == Symbol())
               if (OrderType() == a_cmd_4) return (OrderTicket());
         }
      }
   }
   return (-1);
}

void RefreshOrders() {
   g_count_728 = 0;
   for (int l_pos_0 = OrdersTotal() - 1; l_pos_0 >= 0; l_pos_0--) {
      if (OrderSelect(l_pos_0, SELECT_BY_POS)) {
         if (OrderSymbol() == Symbol())
            if (OrderMagicNumber() != S1_Reference && OrderMagicNumber() != S2_Reference) g_count_728++;
      }
   }
}

int FIFOrule() {
   return (g_count_728 <= 0 && g_ticket_732 < 0 && g_ticket_736 < 0 && g_ticket_756 < 0 && g_ticket_760 < 0);
}

int s1_direction() {
   if (g_icci_836 >= 0.0 || g_irsi_804 >= 50.0) g_datetime_952 = g_datetime_244;
   if (g_icci_836 <= 0.0 || g_irsi_804 <= 50.0) g_datetime_948 = g_datetime_244;
   if (g_datetime_952 > 0 && g_datetime_244 - g_datetime_952 > 3600.0 * gd_496) return (2);
   if (g_datetime_948 > 0 && g_datetime_244 - g_datetime_948 > 3600.0 * gd_496) return (3);
   if (g_datetime_952 == 0 || g_datetime_948 == 0) return (0);
   return (1);
}

void s1_dayRange() {
   int l_shift_0;
   if (g_datetime_244 - gi_260 < 3600.0 * gi_456) l_shift_0 = iBarShift(NULL, g_timeframe_368, gi_260 - 86400);
   else l_shift_0 = iBarShift(NULL, g_timeframe_368, gi_260);
   g_ihigh_892 = iHigh(NULL, g_timeframe_368, iHighest(NULL, g_timeframe_368, MODE_HIGH, l_shift_0 - gi_240, gi_240));
   g_ilow_900 = iLow(NULL, g_timeframe_368, iLowest(NULL, g_timeframe_368, MODE_LOW, l_shift_0 - gi_240, gi_240));
}

void s1_setRules() {
   int li_0;
   HideTestIndicators(TRUE);
   g_irsi_804 = iRSI(NULL, g_timeframe_368, g_period_400, PRICE_CLOSE, gi_240);
   g_irsi_812 = iRSI(NULL, g_timeframe_368, g_period_400, PRICE_CLOSE, gi_240 + 1);
   g_irsi_820 = iRSI(NULL, g_timeframe_368, g_period_400, PRICE_CLOSE, gi_240 + 2);
   if (gi_444) g_irsi_828 = iRSI(NULL, PERIOD_M1, g_period_404, PRICE_CLOSE, gi_240);
   g_icci_836 = iCCI(NULL, g_timeframe_368, g_period_408, PRICE_TYPICAL, gi_240);
   g_icci_844 = iCCI(NULL, g_timeframe_368, g_period_408, PRICE_TYPICAL, gi_240 + 1);
   g_icci_852 = iCCI(NULL, g_timeframe_368, g_period_408, PRICE_TYPICAL, gi_240 + 2);
   g_ima_876 = iMA(NULL, g_timeframe_368, g_period_408, 0, MODE_SMA, PRICE_MEDIAN, gi_240);
   if (gi_460) {
      if (g_irsi_804 >= 50 - gi_464 / 2 && g_irsi_804 <= gi_464 / 2 + 50) {
         gi_884 = TRUE;
         gi_888 = TRUE;
      }
   }
   if (gi_452) s1_dayRange();
   if (gi_492) {
      li_0 = gi_936;
      gi_936 = s1_direction();
      if (li_0 != gi_936) {
         gi_940 = li_0;
         if (gi_936 == 1) gi_944 = g_datetime_244 + 3600.0 * gd_504;
      }
   }
   if (gi_516 > 0) {
      if (g_spread_264 > gi_516 * gd_276) {
         if (g_spread_268 < g_spread_264) {
            Print("Strategy1: Safe spread limit exceeded: spread = ", g_spread_264);
            if (gi_520) Print("Strategy1: Using DayDirection filter");
         }
         gi_908 = TRUE;
      } else {
         if (g_spread_268 > gi_516 * gd_276) Print("Strategy1: Safe spread limit normalized: spread = ", g_spread_264);
         gi_908 = FALSE;
      }
   }
   HideTestIndicators(FALSE);
   if (gi_908) {
      gi_928 = gi_536;
      gi_932 = gi_540;
      return;
   }
   gi_928 = gi_528;
   gi_932 = gi_532;
}

int s1_openBuyRule() {
   double l_iclose_0;
   double l_iclose_8;
   int l_shift_16;
   int l_shift_20;
   if (!gi_884) return (0);
   if (gi_908 && !gi_520) return (0);
   if (gi_492) {
      if (gi_936 == 2) return (0);
      if (g_datetime_244 <= gi_944)
         if (gi_940 == 2) return (0);
   }
   if (gi_512 || gi_908) {
      if (g_datetime_244 - gi_260 < 43200.0) {
         l_shift_16 = iBarShift(NULL, g_timeframe_368, gi_260 - 86400);
         l_shift_20 = iBarShift(NULL, g_timeframe_368, gi_260);
      } else {
         l_shift_16 = iBarShift(NULL, g_timeframe_368, gi_260);
         l_shift_20 = gi_240;
      }
      l_iclose_8 = iClose(NULL, g_timeframe_368, l_shift_16);
      l_iclose_0 = iClose(NULL, g_timeframe_368, l_shift_20);
      if (l_iclose_0 < l_iclose_8) return (0);
   }
   return (s1_Buy(Ask, g_icci_836, g_irsi_804, g_irsi_828, g_ima_876, gd_420, gd_436, gi_372 * gd_276 * Point, gi_448, gi_444));
}

int s1_openSellRule() {
   double l_iclose_0;
   double l_iclose_8;
   int l_shift_16;
   int l_shift_20;
   if (!gi_888) return (0);
   if (gi_908 && !gi_520) return (0);
   if (gi_492) {
      if (gi_936 == 3) return (0);
      if (g_datetime_244 <= gi_944)
         if (gi_940 == 3) return (0);
   }
   if (gi_512 || gi_908) {
      if (g_datetime_244 - gi_260 < 43200.0) {
         l_shift_16 = iBarShift(NULL, g_timeframe_368, gi_260 - 86400);
         l_shift_20 = iBarShift(NULL, g_timeframe_368, gi_260);
      } else {
         l_shift_16 = iBarShift(NULL, g_timeframe_368, gi_260);
         l_shift_20 = gi_240;
      }
      l_iclose_8 = iClose(NULL, g_timeframe_368, l_shift_16);
      l_iclose_0 = iClose(NULL, g_timeframe_368, l_shift_20);
      if (l_iclose_0 > l_iclose_8) return (0);
   }
   return (s1_Sell(Bid, g_icci_836, g_irsi_804, g_irsi_828, g_ima_876, gd_412, gd_428, gi_372 * gd_276 * Point, gi_448, gi_444));
}

bool s1_closeBuyRule() {
   if (Stealth || OrderTakeProfit() == 0.0) {
      if (gi_372 > 0)
         if (NormalizeDouble(Bid - OrderOpenPrice(), Digits) >= NormalizeDouble(gi_372 * Point * gd_276, Digits)) return (TRUE);
   }
   if (OrderStopLoss() == 0.0) {
      if (gi_916 > 0)
         if (NormalizeDouble(OrderOpenPrice() - Ask, Digits) >= NormalizeDouble(gi_916 * Point * gd_276, Digits)) return (TRUE);
   }
   if (gi_472) {
      if (g_ticket_956 != OrderTicket()) {
         g_datetime_960 = OrderOpenTime();
         g_ticket_956 = OrderTicket();
      }
      if (g_icci_836 >= 0.0 || g_irsi_804 >= 50.0) g_datetime_960 = g_datetime_244;
      if (g_icci_852 < g_icci_844 && g_irsi_820 < g_irsi_812) g_datetime_960 = iTime(NULL, g_timeframe_368, gi_240);
      if (g_datetime_244 - g_datetime_960 > 3600.0 * gd_476 && OrderProfit() < 0.0) return (TRUE);
   }
   if (gi_468) {
      if (g_datetime_244 - OrderOpenTime() > 3600.0 * gd_476) {
         if (g_icci_836 > 0.0 && g_irsi_804 > 50.0 && OrderProfit() > 0.0) return (TRUE);
         if (g_datetime_244 - OrderOpenTime() > 3600.0 * gd_484) return (TRUE);
      }
   }
   return (FALSE);
}

bool s1_closeSellRule() {
   if (Stealth || OrderTakeProfit() == 0.0) {
      if (gi_372 > 0)
         if (NormalizeDouble(OrderOpenPrice() - Ask, Digits) >= NormalizeDouble(gi_372 * Point * gd_276, Digits)) return (TRUE);
   }
   if (OrderStopLoss() == 0.0) {
      if (gi_924 > 0)
         if (NormalizeDouble(Bid - OrderOpenPrice(), Digits) >= NormalizeDouble(gi_924 * Point * gd_276, Digits)) return (TRUE);
   }
   if (gi_472) {
      if (g_ticket_964 != OrderTicket()) {
         g_datetime_968 = OrderOpenTime();
         g_ticket_964 = OrderTicket();
      }
      if (g_icci_836 <= 0.0 || g_irsi_804 <= 50.0) g_datetime_968 = g_datetime_244;
      if (g_icci_852 > g_icci_844 && g_irsi_820 > g_irsi_812) g_datetime_968 = iTime(NULL, g_timeframe_368, gi_240);
      if (g_datetime_244 - g_datetime_968 > 3600.0 * gd_476 && OrderProfit() < 0.0) return (TRUE);
   }
   if (gi_468) {
      if (g_datetime_244 - OrderOpenTime() > 3600.0 * gd_476) {
         if (g_icci_836 < 0.0 && g_irsi_804 < 50.0 && OrderProfit() > 0.0) return (TRUE);
         if (g_datetime_244 - OrderOpenTime() > 3600.0 * gd_484) return (TRUE);
      }
   }
   return (FALSE);
}

int s1_openBuy() {
   double ld_0 = 0;
   double ld_8 = 0;
   if (g_ilow_900 > 0.0) {
      gi_916 = (Bid - g_ilow_900 + Point * gd_276) / Point;
      if (gi_380 > 0 && gi_916 > gi_380 * gd_276) gi_916 = gi_380 * gd_276;
      if (gi_916 < gi_384 * gd_276) gi_916 = gi_384 * gd_276;
   } else gi_916 = gi_384 * gd_276;
   if (gi_916 < g_stoplevel_272) gi_916 = g_stoplevel_272;
   if (Stealth) gi_912 = gi_376 * gd_276;
   else gi_912 = gi_372 * gd_276;
   if (gi_912 < g_stoplevel_272) gi_912 = g_stoplevel_272;
   ld_8 = NormalizeDouble(Bid - gi_916 * Point, Digits);
   ld_0 = NormalizeDouble(Ask + gi_912 * Point, Digits);
   return (openOrder(OP_BUY, gd_284, Ask, ld_0, ld_8, S1_Reference, gi_392, g_global_var_324));
}

int s1_openSell() {
   double ld_0 = 0;
   double ld_8 = 0;
   if (g_ihigh_892 > 0.0) {
      gi_924 = (g_ihigh_892 - Ask + Point * gd_276) / Point;
      if (gi_380 > 0 && gi_924 > gi_380 * gd_276) gi_924 = gi_380 * gd_276;
      if (gi_924 < gi_384 * gd_276) gi_924 = gi_384 * gd_276;
   } else gi_924 = gi_384 * gd_276;
   if (gi_924 < g_stoplevel_272) gi_924 = g_stoplevel_272;
   if (Stealth) gi_920 = gi_376 * gd_276;
   else gi_920 = gi_372 * gd_276;
   if (gi_920 < g_stoplevel_272) gi_920 = g_stoplevel_272;
   ld_8 = NormalizeDouble(Ask + gi_924 * Point, Digits);
   ld_0 = NormalizeDouble(Bid - gi_920 * Point, Digits);
   return (openOrder(OP_SELL, gd_284, Bid, ld_0, ld_8, S1_Reference, gi_396, g_global_var_324));
}

int s1_buyControl() {
   int li_ret_16;
   double l_ord_takeprofit_0 = OrderTakeProfit();
   double l_ord_stoploss_8 = OrderStopLoss();
   if (l_ord_takeprofit_0 == 0.0 || l_ord_stoploss_8 == 0.0) {
      if (l_ord_takeprofit_0 == 0.0) {
         if (gi_912 < g_stoplevel_272) gi_912 = g_stoplevel_272;
         l_ord_takeprofit_0 = NormalizeDouble(Ask + gi_912 * Point, Digits);
      }
      if (l_ord_stoploss_8 == 0.0) {
         if (gi_916 < g_stoplevel_272) gi_916 = g_stoplevel_272;
         l_ord_stoploss_8 = NormalizeDouble(Bid - gi_916 * Point, Digits);
      }
      waitForContext();
      OrderModify(OrderTicket(), OrderOpenPrice(), l_ord_stoploss_8, l_ord_takeprofit_0, 0, Green);
   }
   if (s1_closeBuyRule()) {
      li_ret_16 = closeOrder(0, Violet, g_global_var_324);
      if (li_ret_16 < 0) return (li_ret_16);
   }
   if (gi_388 > 0) {
      if (Bid - OrderOpenPrice() > Point * gd_276 * gi_388) {
         if (OrderStopLoss() < Bid - Point * gd_276 * gi_388 || OrderStopLoss() == 0.0) {
            waitForContext();
            OrderModify(OrderTicket(), OrderOpenPrice(), NormalizeDouble(Bid - Point * gd_276 * gi_388, Digits), OrderTakeProfit(), 0, Green);
         }
      }
   }
   return (OrderTicket());
}

int s1_sellControl() {
   int li_ret_16;
   double l_ord_takeprofit_0 = OrderTakeProfit();
   double l_ord_stoploss_8 = OrderStopLoss();
   if (l_ord_takeprofit_0 == 0.0 || l_ord_stoploss_8 == 0.0) {
      if (l_ord_takeprofit_0 == 0.0) {
         if (gi_920 < g_stoplevel_272) gi_920 = g_stoplevel_272;
         l_ord_takeprofit_0 = NormalizeDouble(Bid - gi_920 * Point, Digits);
      }
      if (l_ord_stoploss_8 == 0.0) {
         if (gi_924 < g_stoplevel_272) gi_924 = g_stoplevel_272;
         l_ord_stoploss_8 = NormalizeDouble(Ask + gi_924 * Point, Digits);
      }
      waitForContext();
      OrderModify(OrderTicket(), OrderOpenPrice(), l_ord_stoploss_8, l_ord_takeprofit_0, 0, Red);
   }
   if (s1_closeSellRule()) {
      li_ret_16 = closeOrder(1, Violet, g_global_var_324);
      if (li_ret_16 < 0) return (li_ret_16);
   }
   if (gi_388 > 0) {
      if (OrderOpenPrice() - Ask > Point * gd_276 * gi_388) {
         if (OrderStopLoss() > Ask + Point * gd_276 * gi_388 || OrderStopLoss() == 0.0) {
            waitForContext();
            OrderModify(OrderTicket(), OrderOpenPrice(), NormalizeDouble(Ask + Point * gd_276 * gi_388, Digits), OrderTakeProfit(), 0, Red);
         }
      }
   }
   return (OrderTicket());
}

void run_Strategy1() {
   int l_day_of_week_8;
   gi_716 = TRUE;
   if (g_ticket_732 == -2) {
      g_ticket_732 = Recover(S1_Reference, OP_BUY);
      if (g_ticket_732 >= 0) {
         OrderSelect(g_ticket_732, SELECT_BY_TICKET);
         OrderPrint();
         Print("Strategy1: Order found:");
      }
   }
   if (g_ticket_736 == -2) {
      g_ticket_736 = Recover(S1_Reference, OP_SELL);
      if (g_ticket_736 >= 0) {
         OrderSelect(g_ticket_736, SELECT_BY_TICKET);
         OrderPrint();
         Print("Strategy1: Order found:");
      }
   }
   s1_setRules();
   if ((gi_928 < gi_932 && (g_hour_252 >= gi_928 && g_hour_252 <= gi_932 - 1)) || (gi_928 >= gi_932 && g_hour_252 >= gi_928 || g_hour_252 <= gi_932 - 1)) gi_716 = TRUE;
   else gi_716 = FALSE;
   if (gi_716 && gi_524) {
      l_day_of_week_8 = TimeDayOfWeek(gi_248);
      if ((l_day_of_week_8 == 5 && g_hour_252 >= gi_928) || (l_day_of_week_8 == 1 && gi_928 >= gi_932 && g_hour_252 <= gi_932 - 1)) gi_716 = FALSE;
      else
         if (l_day_of_week_8 > 5 || l_day_of_week_8 < 1) gi_716 = FALSE;
   }
   if (gi_972 != gi_716) {
      if (gi_716) gi_780++;
      gi_972 = gi_716;
   }
   if (g_ticket_732 >= 0) {
      if (OrderSelect(g_ticket_732, SELECT_BY_TICKET)) {
         if (OrderCloseTime() == 0) g_ticket_732 = s1_buyControl();
         else g_ticket_732 = -1;
         g_ord_profit_740 = OrderProfit();
         if (g_ticket_732 < 0) CountBalance(g_ord_profit_740);
      } else {
         g_ticket_732 = -2;
         g_ord_profit_740 = 0;
      }
   }
   if (g_ticket_736 >= 0) {
      if (OrderSelect(g_ticket_736, SELECT_BY_TICKET)) {
         if (OrderCloseTime() == 0) g_ticket_736 = s1_sellControl();
         else g_ticket_736 = -1;
         g_ord_profit_748 = OrderProfit();
         if (g_ticket_736 < 0) CountBalance(g_ord_profit_748);
      } else {
         g_ticket_736 = -2;
         g_ord_profit_748 = 0;
      }
   }
   int li_0 = s1_openBuyRule();
   int li_4 = s1_openSellRule();
   if (!gi_716 || !gi_724 || gi_712) return;
   if (NFA && !FIFOrule()) return;
   if (g_datetime_976 != iTime(NULL, g_timeframe_368, gi_240) && li_0 && g_ticket_732 < 0) {
      g_ticket_732 = s1_openBuy();
      if (g_ticket_732 < 0) return;
      g_datetime_976 = iTime(NULL, g_timeframe_368, gi_240);
      if (gi_460) {
         gi_884 = FALSE;
         gi_888 = TRUE;
      }
      gi_800++;
      return;
   }
   if (g_datetime_980 != iTime(NULL, g_timeframe_368, gi_240) && li_4 && g_ticket_736 < 0) {
      g_ticket_736 = s1_openSell();
      if (g_ticket_736 >= 0) {
         g_datetime_980 = iTime(NULL, g_timeframe_368, gi_240);
         if (gi_460) {
            gi_884 = TRUE;
            gi_888 = FALSE;
         }
         gi_800++;
      }
   }
}

void s2_setRules() {
   HideTestIndicators(TRUE);
   if (gi_596 || gi_604) g_icci_988 = iCCI(NULL, g_timeframe_544, g_period_588, PRICE_TYPICAL, gi_240);
   if (gi_600) g_icci_996 = iCCI(NULL, g_timeframe_544, g_period_592, PRICE_TYPICAL, gi_240);
   g_ihigh_1004 = iHigh(NULL, g_timeframe_544, iHighest(NULL, g_timeframe_544, MODE_HIGH, gi_584, 1));
   g_ilow_1012 = iLow(NULL, g_timeframe_544, iLowest(NULL, g_timeframe_544, MODE_LOW, gi_584, 1));
   if (gi_640 > 0) {
      if (g_spread_264 > gi_640 * gd_276) {
         if (g_spread_268 < g_spread_264) {
            Print("Strategy2: Safe spread limit exceeded: spread = ", g_spread_264);
            if (gi_644) Print("Strategy2: Using DayDirection filter");
         }
         gi_1036 = TRUE;
      } else {
         if (g_spread_268 > gi_640 * gd_276) Print("Strategy2: Safe spread limit normalized: spread = ", g_spread_264);
         gi_1036 = FALSE;
      }
   }
   HideTestIndicators(TRUE);
   if (gi_1036) {
      gi_1056 = gi_660;
      gi_1060 = gi_664;
      return;
   }
   gi_1056 = gi_652;
   gi_1060 = gi_656;
}

int s2_openBuyRule() {
   double l_iclose_0;
   double l_iclose_8;
   int l_shift_16;
   int l_shift_20;
   if (gi_1036 && !gi_644) return (0);
   if (gi_636 || gi_1036) {
      if (g_datetime_244 - gi_260 < 43200.0) {
         l_shift_16 = iBarShift(NULL, g_timeframe_544, gi_260 - 86400);
         l_shift_20 = iBarShift(NULL, g_timeframe_544, gi_260);
      } else {
         l_shift_16 = iBarShift(NULL, g_timeframe_544, gi_260);
         l_shift_20 = gi_240;
      }
      l_iclose_8 = iClose(NULL, g_timeframe_544, l_shift_16);
      l_iclose_0 = iClose(NULL, g_timeframe_544, l_shift_20);
      if (l_iclose_0 < l_iclose_8) return (0);
   }
   return (s2_Buy(Ask, Bid, g_icci_988, g_icci_996, g_ilow_1012, g_ihigh_1004, gi_596, gi_600));
}

int s2_openSellRule() {
   double l_iclose_0;
   double l_iclose_8;
   int l_shift_16;
   int l_shift_20;
   if (gi_1036 && !gi_644) return (0);
   if (gi_636 || gi_1036) {
      if (g_datetime_244 - gi_260 < 43200.0) {
         l_shift_16 = iBarShift(NULL, g_timeframe_544, gi_260 - 86400);
         l_shift_20 = iBarShift(NULL, g_timeframe_544, gi_260);
      } else {
         l_shift_16 = iBarShift(NULL, g_timeframe_544, gi_260);
         l_shift_20 = gi_240;
      }
      l_iclose_8 = iClose(NULL, g_timeframe_544, l_shift_16);
      l_iclose_0 = iClose(NULL, g_timeframe_544, l_shift_20);
      if (l_iclose_0 > l_iclose_8) return (0);
   }
   return (s2_Sell(Ask, Bid, g_icci_988, g_icci_996, g_ilow_1012, g_ihigh_1004, gi_596, gi_600));
}

bool s2_closeBuyRule() {
   double l_ord_profit_0;
   if (Stealth || OrderTakeProfit() == 0.0) {
      if (gi_548 > 0)
         if (NormalizeDouble(Bid - OrderOpenPrice(), Digits) >= NormalizeDouble(gi_548 * Point * gd_276, Digits)) return (TRUE);
   }
   if (OrderStopLoss() == 0.0) {
      if (gi_1044 > 0)
         if (NormalizeDouble(OrderOpenPrice() - Ask, Digits) >= NormalizeDouble(gi_1044 * Point * gd_276, Digits)) return (TRUE);
   }
   if (gi_604) {
      if (g_ticket_1064 != OrderTicket()) {
         gi_1068 = 0;
         gi_1072 = 0;
         g_datetime_1080 = OrderOpenTime();
         g_datetime_1076 = g_datetime_1080;
         g_ticket_1064 = OrderTicket();
         g_ord_open_price_1084 = OrderOpenPrice();
      }
      l_ord_profit_0 = OrderProfit();
      if (Ask > g_ord_open_price_1084) {
         gi_1068 += g_datetime_244 - g_datetime_1076;
         g_datetime_1076 = g_datetime_244;
      } else {
         gi_1072 += g_datetime_244 - g_datetime_1076;
         g_datetime_1076 = g_datetime_244;
      }
      if (g_datetime_244 - g_datetime_1080 > 3600.0 * gd_608) {
         if (g_icci_988 > 0.0 && l_ord_profit_0 > 0.0 && gi_1068 < gi_1072) return (TRUE);
         if (g_icci_988 > 100.0 && l_ord_profit_0 > 0.0) return (TRUE);
         if (g_datetime_244 - g_datetime_1080 > 3600.0 * gd_616 && l_ord_profit_0 > 0.0) return (TRUE);
         if (g_datetime_244 - g_datetime_1080 > 3600.0 * gd_624) return (TRUE);
      }
   }
   if (gi_632) return (Bid >= g_ihigh_1004);
   return (Bid >= g_ihigh_1020);
}

bool s2_closeSellRule() {
   double l_ord_profit_0;
   if (Stealth || OrderTakeProfit() == 0.0) {
      if (gi_548 > 0)
         if (NormalizeDouble(OrderOpenPrice() - Ask, Digits) >= NormalizeDouble(gi_548 * Point * gd_276, Digits)) return (TRUE);
   }
   if (OrderStopLoss() == 0.0) {
      if (gi_1052 > 0)
         if (NormalizeDouble(Bid - OrderOpenPrice(), Digits) >= NormalizeDouble(gi_1052 * Point * gd_276, Digits)) return (TRUE);
   }
   if (gi_604) {
      if (g_ticket_1092 != OrderTicket()) {
         gi_1096 = 0;
         gi_1100 = 0;
         g_datetime_1108 = OrderOpenTime();
         g_datetime_1104 = g_datetime_1108;
         g_ticket_1092 = OrderTicket();
         g_ord_open_price_1112 = OrderOpenPrice();
      }
      l_ord_profit_0 = OrderProfit();
      if (Bid < g_ord_open_price_1112) {
         gi_1096 += g_datetime_244 - g_datetime_1104;
         g_datetime_1104 = g_datetime_244;
      } else {
         gi_1100 += g_datetime_244 - g_datetime_1104;
         g_datetime_1104 = g_datetime_244;
      }
      if (g_datetime_244 - g_datetime_1108 > 3600.0 * gd_608) {
         if (g_icci_988 < 0.0 && l_ord_profit_0 > 0.0 && gi_1096 < gi_1100) return (TRUE);
         if (g_icci_988 < -100.0 && l_ord_profit_0 > 0.0) return (TRUE);
         if (g_datetime_244 - g_datetime_1108 > 3600.0 * gd_616 && l_ord_profit_0 > 0.0) return (TRUE);
         if (g_datetime_244 - g_datetime_1108 > 3600.0 * gd_624) return (TRUE);
      }
   }
   if (gi_632) return (Ask <= g_ilow_1012);
   return (Ask <= g_ilow_1028);
}

int s2_openBuy() {
   double ld_0 = 0;
   double ld_8 = 0;
   if (gd_564 > 0.0) {
      gi_1044 = gd_564 * (g_ihigh_1004 - g_ilow_1012) / Point;
      if (gi_556 > 0 && gi_1044 > gi_556 * gd_276) gi_1044 = gi_556 * gd_276;
      if (gi_1044 < gi_560 * gd_276) gi_1044 = gi_560 * gd_276;
   } else gi_1044 = gi_560 * gd_276;
   if (gi_1044 < g_stoplevel_272) gi_1044 = g_stoplevel_272;
   if (Stealth) gi_1040 = gi_552 * gd_276;
   else gi_1040 = gi_548 * gd_276;
   if (gi_1040 < g_stoplevel_272) gi_1040 = g_stoplevel_272;
   ld_8 = NormalizeDouble(Bid - gi_1044 * Point, Digits);
   ld_0 = NormalizeDouble(Ask + gi_1040 * Point, Digits);
   return (openOrder(OP_BUY, gd_284, Ask, ld_0, ld_8, S2_Reference, gi_576, g_global_var_324));
}

int s2_openSell() {
   double ld_0 = 0;
   double ld_8 = 0;
   if (gd_564 > 0.0) {
      gi_1052 = gd_564 * (g_ihigh_1004 - g_ilow_1012) / Point;
      if (gi_556 > 0 && gi_1052 > gi_556 * gd_276) gi_1052 = gi_556 * gd_276;
      if (gi_1052 < gi_560 * gd_276) gi_1052 = gi_560 * gd_276;
   } else gi_1052 = gi_560 * gd_276;
   if (gi_1052 < g_stoplevel_272) gi_1052 = g_stoplevel_272;
   if (Stealth) gi_1048 = gi_552 * gd_276;
   else gi_1048 = gi_548 * gd_276;
   if (gi_1048 < g_stoplevel_272) gi_1048 = g_stoplevel_272;
   ld_8 = NormalizeDouble(Ask + gi_1052 * Point, Digits);
   ld_0 = NormalizeDouble(Bid - gi_1048 * Point, Digits);
   return (openOrder(OP_SELL, gd_284, Bid, ld_0, ld_8, S2_Reference, gi_580, g_global_var_324));
}

int s2_buyControl() {
   int li_ret_16;
   double l_ord_takeprofit_0 = OrderTakeProfit();
   double l_ord_stoploss_8 = OrderStopLoss();
   if (l_ord_takeprofit_0 == 0.0 || l_ord_stoploss_8 == 0.0) {
      if (l_ord_takeprofit_0 == 0.0) {
         if (gi_1040 < g_stoplevel_272) gi_1040 = g_stoplevel_272;
         l_ord_takeprofit_0 = NormalizeDouble(Ask + gi_1040 * Point, Digits);
      }
      if (l_ord_stoploss_8 == 0.0) {
         if (gi_1044 < g_stoplevel_272) gi_1044 = g_stoplevel_272;
         l_ord_stoploss_8 = NormalizeDouble(Bid - gi_1044 * Point, Digits);
      }
      waitForContext();
      OrderModify(OrderTicket(), OrderOpenPrice(), l_ord_stoploss_8, l_ord_takeprofit_0, 0, Green);
   }
   if (s2_closeBuyRule()) {
      li_ret_16 = closeOrder(0, Violet, g_global_var_324);
      if (li_ret_16 < 0) return (li_ret_16);
   }
   if (gi_572 > 0) {
      if (Bid - OrderOpenPrice() > Point * gd_276 * gi_572) {
         if (OrderStopLoss() < Bid - Point * gd_276 * gi_572 || OrderStopLoss() == 0.0) {
            waitForContext();
            OrderModify(OrderTicket(), OrderOpenPrice(), NormalizeDouble(Bid - Point * gd_276 * gi_572, Digits), OrderTakeProfit(), 0, Green);
         }
      }
   }
   return (OrderTicket());
}

int s2_sellControl() {
   int li_ret_16;
   double l_ord_takeprofit_0 = OrderTakeProfit();
   double l_ord_stoploss_8 = OrderStopLoss();
   if (l_ord_takeprofit_0 == 0.0 || l_ord_stoploss_8 == 0.0) {
      if (l_ord_takeprofit_0 == 0.0) {
         if (gi_1048 < g_stoplevel_272) gi_1048 = g_stoplevel_272;
         l_ord_takeprofit_0 = NormalizeDouble(Bid - gi_1048 * Point, Digits);
      }
      if (l_ord_stoploss_8 == 0.0) {
         if (gi_1052 < g_stoplevel_272) gi_1052 = g_stoplevel_272;
         l_ord_stoploss_8 = NormalizeDouble(Ask + gi_1052 * Point, Digits);
      }
      waitForContext();
      OrderModify(OrderTicket(), OrderOpenPrice(), l_ord_stoploss_8, l_ord_takeprofit_0, 0, Red);
   }
   if (s2_closeSellRule()) {
      li_ret_16 = closeOrder(1, Violet, g_global_var_324);
      if (li_ret_16 < 0) return (li_ret_16);
   }
   if (gi_572 > 0) {
      if (OrderOpenPrice() - Ask > Point * gd_276 * gi_572) {
         if (OrderStopLoss() > Ask + Point * gd_276 * gi_572 || OrderStopLoss() == 0.0) {
            waitForContext();
            OrderModify(OrderTicket(), OrderOpenPrice(), NormalizeDouble(Ask + Point * gd_276 * gi_572, Digits), OrderTakeProfit(), 0, Red);
         }
      }
   }
   return (OrderTicket());
}

void run_Strategy2() {
   int l_day_of_week_8;
   gi_720 = TRUE;
   if (g_ticket_756 == -2) {
      g_ticket_756 = Recover(S2_Reference, OP_BUY);
      if (g_ticket_756 >= 0) {
         OrderSelect(g_ticket_756, SELECT_BY_TICKET);
         OrderPrint();
         Print("Strategy2: Order found:");
      }
   }
   if (g_ticket_760 == -2) {
      g_ticket_760 = Recover(S2_Reference, OP_SELL);
      if (g_ticket_760 >= 0) {
         OrderSelect(g_ticket_760, SELECT_BY_TICKET);
         OrderPrint();
         Print("Strategy2: Order found:");
      }
   }
   s2_setRules();
   if ((gi_1056 < gi_1060 && (g_hour_252 >= gi_1056 && g_hour_252 <= gi_1060 - 1)) || (gi_1056 >= gi_1060 && g_hour_252 >= gi_1056 || g_hour_252 <= gi_1060 - 1)) gi_720 = TRUE;
   else gi_720 = FALSE;
   if (gi_720 && gi_648) {
      l_day_of_week_8 = TimeDayOfWeek(gi_248);
      if ((l_day_of_week_8 == 5 && g_hour_252 >= gi_1056) || (l_day_of_week_8 == 1 && gi_1056 >= gi_1060 && g_hour_252 <= gi_1060 - 1)) gi_720 = FALSE;
      else
         if (l_day_of_week_8 > 5 || l_day_of_week_8 < 1) gi_720 = FALSE;
   }
   if (gi_1120 != gi_720) {
      if (gi_720) {
         g_ord_profit_764 = 0;
         g_ord_profit_772 = 0;
         gi_784++;
      }
      gi_1120 = gi_720;
   }
   if (g_ticket_756 >= 0) {
      if (OrderSelect(g_ticket_756, SELECT_BY_TICKET)) {
         if (OrderCloseTime() == 0) g_ticket_756 = s2_buyControl();
         else g_ticket_756 = -1;
         g_ord_profit_764 = OrderProfit();
         if (g_ticket_756 < 0) CountBalance(g_ord_profit_764);
      } else {
         g_ticket_756 = -2;
         g_ord_profit_764 = 0;
      }
   }
   if (g_ticket_760 >= 0) {
      if (OrderSelect(g_ticket_760, SELECT_BY_TICKET)) {
         if (OrderCloseTime() == 0) g_ticket_760 = s2_sellControl();
         else g_ticket_760 = -1;
         g_ord_profit_772 = OrderProfit();
         if (g_ticket_760 < 0) CountBalance(g_ord_profit_772);
      } else {
         g_ticket_760 = -2;
         g_ord_profit_772 = 0;
      }
   }
   int li_0 = s2_openBuyRule();
   int li_4 = s2_openSellRule();
   if (!gi_720 || !gi_724 || gi_712) return;
   if (NFA && !FIFOrule()) return;
   if (g_datetime_1124 != iTime(NULL, g_timeframe_544, gi_240) && li_0 && g_ticket_756 < 0 && g_ord_profit_764 >= 0.0) {
      g_ticket_756 = s2_openBuy();
      if (g_ticket_756 < 0) return;
      g_datetime_1124 = iTime(NULL, g_timeframe_544, gi_240);
      g_ihigh_1020 = g_ihigh_1004;
      g_ilow_1028 = g_ilow_1012;
      g_ord_profit_772 = 0;
      gi_984++;
      return;
   }
   if (g_datetime_1128 != iTime(NULL, g_timeframe_544, gi_240) && li_4 && g_ticket_760 < 0 && g_ord_profit_772 >= 0.0) {
      g_ticket_760 = s2_openSell();
      if (g_ticket_760 >= 0) {
         g_datetime_1128 = iTime(NULL, g_timeframe_544, gi_240);
         g_ihigh_1020 = g_ihigh_1004;
         g_ilow_1028 = g_ilow_1012;
         g_ord_profit_764 = 0;
         gi_984++;
      }
   }
}

void Refresh(bool ai_0) {
   double lda_4[1];
   int lia_8[4];
   if (ai_0) RefreshRates();
   g_datetime_244 = TimeCurrent();
   if (!IsTesting() && AutoServerGmtOffset || AutoLocalGmtOffset) {
      gi_312 = GetGmtOffset(gi_316, g_datetime_244, AutoServerGmtOffset, lda_4, lia_8);
      if (gi_312 == 4 && !AutoLocalGmtOffset) gi_312 = 0;
      else GmtOffset = lda_4[0];
      gi_528 = lia_8[0];
      gi_532 = lia_8[1];
      gi_652 = lia_8[2];
      gi_656 = lia_8[3];
   }
   gi_248 = g_datetime_244 - 3600.0 * GmtOffset;
   g_hour_252 = TimeHour(gi_248);
   gi_260 = g_datetime_244 - 3600.0 * g_hour_252 - 60 * TimeMinute(gi_248) - TimeSeconds(gi_248);
   g_spread_264 = MarketInfo(Symbol(), MODE_SPREAD);
   g_stoplevel_272 = MarketInfo(Symbol(), MODE_STOPLEVEL);
   gd_276 = 0.0001 / Point;
   if (Digits < 4) gd_276 = 100.0 * gd_276;
}

string BPrint(bool ai_0) {
   if (ai_0) return ("True");
   return ("False");
}

string CPrint(bool ai_0, string as_4, string as_12 = "") {
   if (ai_0) return (as_4);
   return (as_12);
}

string OpPrint(int ai_0) {
   switch (ai_0) {
   case 0:
      return ("Buy");
   case 1:
      return ("Sell");
   }
   return ("Order");
}

string GMPrint(int ai_0) {
   switch (ai_0) {
   case 1:
      return ("automatic: server");
   case 2:
      return ("automatic: server");
   case 4:
      return ("automatic: local");
   }
   return ("manual");
}

string DPrint(int ai_0) {
   switch (ai_0) {
   case 1:
      return ("Correction");
   case 3:
      return ("Upward Impulse");
   case 2:
      return ("Downward Impulse");
   }
   return ("");
}

string PPrint(int ai_0) {
   int li_4 = MathMod(ai_0, 5);
   return (gsa_1132[li_4]);
}

string PrintStatus(int ai_0) {
   switch (ai_0) {
   case 1:
      return ("Assessing market volume");
   case 2:
      return ("Checking volatility");
   case 3:
      return ("Monitoring spread");
   case 4:
      return ("Determining direction");
   case 5:
      return ("Reviewing price range");
   case 6:
      return ("Calculating probability");
   }
   return ("");
}

/*void PrintResponse(int ai_0, int ai_4 = -1, int ai_8 = -1) {
   if (ai_4 == -1) ai_4 = gi_672;
   if (ai_8 == -1) ai_8 = gi_668;
   gi_672 = ai_4;
   gi_668 = ai_8;
   if (ai_0 & 16384 > 0) PrintLN("Authenticated", TextColor1);
   else PrintLN("Authentication failed - error(" + ai_0 + ")", TextColor1);
   if (ai_0 & 512 > 0) PrintLN("Attention: Upgrade available", TextColor1);
   if (ai_0 & 1024 > 0) PrintLN("Error: Upgrade required", TextColor1);
   if (ai_0 & 1 > 0) PrintLN("Error: Internet initialization failed", TextColor1);
   if (ai_0 & 2 > 0) PrintLN("Error: Internet connection failed", TextColor1);
   if (ai_0 & 4 > 0) PrintLN("Error: Invalid account number", TextColor1);
   if (ai_0 & 8 > 0) PrintLN("Error: Invalid account status", TextColor1);
   if (ai_0 & 16 > 0) PrintLN("Error: Dll and Expert versions mismatch", TextColor1);
   if (ai_0 & 128 > 0) PrintLN("Error: Unable to retrieve authentication code", TextColor1);
   if (ai_0 & 256 > 0) PrintLN("Error: Server response failure", TextColor1);
   if (ai_0 & 2048 > 0) PrintLN("Error: Invalid authorisation details", TextColor1);
   if (ai_0 & 4096 > 0) PrintLN("Error: Authorisation declined", TextColor1);
}*/

string GetObjName(int ai_0) {
   return (StringConcatenate("MegaDroid", " lb: ", ai_0));
}

void GetPos(int ai_0, int &ai_4, int &ai_8) {
   string l_name_12 = GetObjName(ai_0);
   if (ObjectFind(l_name_12) == 0) {
      ai_4 = ObjectGet(l_name_12, OBJPROP_XDISTANCE);
      ai_8 = ObjectGet(l_name_12, OBJPROP_YDISTANCE);
   }
}

void PrintLN(string a_text_0, color a_color_8 = -1, int ai_12 = -1, double ad_16 = -1.0, int ai_24 = 0) {
   if (a_color_8 == CLR_NONE) a_color_8 = TextColor1;
   if (ai_12 == -1) ai_12 = gi_672;
   if (ad_16 == -1.0) ad_16 = gi_668;
   string l_name_28 = GetObjName(ai_12);
   if (ObjectFind(l_name_28) != 0) {
      ObjectCreate(l_name_28, OBJ_LABEL, 0, 0, 0);
      ObjectSet(l_name_28, OBJPROP_CORNER, 0);
   }
   ObjectSetText(l_name_28, a_text_0, 8, "Tahoma", a_color_8);
   ObjectSet(l_name_28, OBJPROP_XDISTANCE, gi_684 + ai_24);
   ObjectSet(l_name_28, OBJPROP_YDISTANCE, gi_680 + 14.0 * ad_16);
   if (gi_668 < ad_16 + 1.0) gi_668 = ad_16 + 1.0;
   if (gi_672 < ai_12 + 1) gi_672 = ai_12 + 1;
   if (gi_676 < ai_12) gi_676 = ai_12;
}

void PrintSep(int ai_0 = -1, double ad_4 = -1.0, int ai_12 = 0) {
   if (ai_0 == -1) ai_0 = gi_672;
   if (ad_4 == -1.0) ad_4 = gi_668;
   PrintLN("_______", TextColor2, ai_0, ad_4 - 0.3, ai_12);
   if (gi_668 < ad_4 + 1.0) gi_668 = ad_4 + 1.0;
}

int PrintText(string as_0, int ai_8 = -1, int ai_12 = -1, double ad_16 = -1.0, int ai_24 = 0) {
   string ls_36;
   int li_28 = 0;
   int li_32 = 0;
   if (ai_12 == -1) ai_12 = gi_672;
   if (ad_16 == -1.0) ad_16 = gi_668;
   int l_str_len_44 = StringLen(as_0);
   int li_48 = 0;
   while (li_32 < l_str_len_44) {
      li_48 = 0;
      li_32 = StringFind(as_0, 
      "\n", li_28);
      if (li_32 == -1) li_32 = l_str_len_44;
      else li_48 = 1;
      if (li_32 - li_28 > 60) li_32 = li_28 + 60;
      ls_36 = StringSubstr(as_0, li_28, li_32 - li_28);
      if (ls_36 == "0") PrintSep(ai_12, ad_16, ai_24);
      else PrintLN(ls_36, ai_8, ai_12, ad_16, ai_24);
      li_28 = li_32 + li_48;
      ai_12++;
      ad_16++;
   }
   return (ai_12);
}

void Deleteobjects(int ai_0, int ai_4) {
   for (int li_8 = ai_0; li_8 <= ai_4; li_8++) ObjectDelete(GetObjName(li_8));
}

/*double Base36Decode(string as_0) {
   int li_24;
   as_0 = StringUpper(as_0);
   int l_str_len_8 = StringLen(as_0);
   double ld_ret_12 = 0;
   for (int li_20 = 0; li_20 < l_str_len_8; li_20++) {
      li_24 = StringFind(gs_1144, StringSubstr(as_0, l_str_len_8 - li_20 - 1, 1));
      ld_ret_12 += li_24 * MathPow(36, li_20);
   }
   return (ld_ret_12);
}

string Base36Encode(double ad_0) {
   string l_str_concat_8 = "";
   for (ad_0 = MathAbs(ad_0); ad_0 >= 1.0; ad_0 = MathFloor(ad_0 / 36.0)) l_str_concat_8 = StringConcatenate(StringSubstr(gs_1144, MathMod(ad_0, 36), 1), l_str_concat_8);
   return (l_str_concat_8);
}

string StringUpper(string as_0) {
   int li_8;
   int li_20;
   int l_str_len_16 = StringLen(as_0);
   for (int li_12 = 0; li_12 < l_str_len_16; li_12++) {
      li_20 = 0;
      li_8 = StringGetChar(as_0, li_12);
      if (li_8 > '`' && li_8 < '{') li_20 = li_8 - 32;
      if (li_8 > 'ß' && li_8 < 256) li_20 = li_8 - 32;
      if (li_8 == '¸') li_20 = 168;
      if (li_20 > 0) as_0 = StringSetChar(as_0, li_12, li_20);
   }
   return (as_0);
}*/

int CountLot() {
   int li_ret_0;
   if (RiskLevel > 0.0) {
      gd_284 = MMLots(RiskLevel, AccountFreeMargin(), li_ret_0);
      if (RecoveryMode) gd_284 = RecoveryLot(gd_284);
   } else gd_284 = NormalizeLots(LotSize, li_ret_0);
   return (li_ret_0);
}

int start() {
   int li_0;
   if (!gi_224 && !gi_228) return (0);
   //if(CheckActiveHours()) Print("Time for trade has not come else!");
   //gi_304 = GetState();
   if (Bars < 100) {
      Print("Bars less than 100");
      return (0);
   }
   //if (!IsTesting() && gi_304 & 65536 > 0) GetStMessage();
   if (gi_300) {
      gi_300 = FALSE;
      li_0 = RecoverTrades();
      Print("Orders in history: ", li_0, " profit made: ", DoubleToStr(gd_696, 2));
   }
   int li_4 = CountLot();
   double ld_8 = NormalizeDouble(MarketInfo(Symbol(), MODE_MARGINREQUIRED) * gd_284, 8);
   g_spread_268 = g_spread_264;
   Refresh(0);
   gi_712 = NormalizeDouble(AccountFreeMargin(), 8) < ld_8;
   gi_724 = IsTradeTime(gi_316, TimeYear(gi_248), TimeMonth(gi_248), TimeDay(gi_248), gi_232);
   if (RemoteSafetyMode && !IsTesting() /*&& gi_304 & 262144 > 0*/) gi_724 = 0;
   if (NFA) RefreshOrders();
   if (gi_224) run_Strategy1();
   Refresh(1);
   li_4 = CountLot();
   gi_712 = NormalizeDouble(AccountFreeMargin(), 8) < ld_8;
   if (gi_228) run_Strategy2();
   if (IsTesting() && !IsVisualMode()) return (0);
   GetPos(0, gi_684, gi_680);
   gi_672 = 0;
   gi_668 = 0;
   PrintLN(gs_344, TextColor2);
   PrintSep();
   /*PrintResponse(gi_304 | gi_308);
   PrintSep();*/
   PrintLN(gs_352);
   PrintLN(gs_360, TextColor2, gi_672, gi_668 - 1, 5 * (StringLen(gs_352) + 1));
   int l_str_len_16 = StringLen(gs_328);
   int l_str_len_20 = StringLen(gs_336);
   if (l_str_len_16 > 0) PrintLN(gs_328);
   if (l_str_len_20 > 0) PrintText(gs_336, TextColor2, gi_672, gi_668 - 1, 5 * (l_str_len_16 + 1));
   PrintSep();
   string ls_24 = DoubleToStr(GmtOffset, 1);
   if (!IsTesting()) ls_24 = StringConcatenate(ls_24, " (", GMPrint(gi_312), ")");
   PrintLN("ServerTime:");
   PrintLN(TimeToStr(g_datetime_244), TextColor2, gi_672, gi_668 - 1, 60);
   PrintLN("UtcTime:");
   PrintLN(TimeToStr(gi_248), TextColor2, gi_672, gi_668 - 1, 45);
   PrintLN("GmtOffset:");
   PrintLN(ls_24, TextColor2, gi_672, gi_668 - 1, 55);
   PrintSep();
   PrintLN("Digits:");
   PrintLN(Digits, TextColor2, gi_672, gi_668 - 1, 35);
   PrintLN("Spread:");
   PrintLN(StringConcatenate(DoubleToStr(g_spread_264 / gd_276, 1), " (", g_spread_264, " pips)"), TextColor2, gi_672, gi_668 - 1, 40);
   PrintSep();
   PrintLN("Lot:");
   PrintLN(DoubleToStr(gd_284, 2), TextColor2, gi_672, gi_668 - 1, 25);
   switch (li_4) {
   case 1:
      PrintLN("Maximum Lot size exeeded!");
      break;
   case -1:
      PrintLN("Minimum Lot size exeeded!");
   }
   PrintLN("Leverage:");
   PrintLN(AccountLeverage() + ":1", TextColor2, gi_672, gi_668 - 1, 50);
   if (AccountLeverage() < 100) {
      PrintLN("Warning:");
      PrintLN("Your account leverage is lower than 1:100,", TextColor2, gi_672, gi_668 - 1, 45);
      PrintLN("the lot size will be reduced to prevent a loss.", TextColor2, gi_672, gi_668, 45);
   }
   if (gi_1164 != gi_712) {
      if (gi_712) Print("Not enough money! Available margin = ", DoubleToStr(AccountFreeMargin(), 2), ", Required margin = ", DoubleToStr(ld_8, 2));
      gi_1164 = gi_712;
   }
   if (gi_712) {
      PrintSep();
      PrintLN("Not enough money!");
      PrintLN("Available margin =");
      PrintLN(DoubleToStr(AccountFreeMargin(), 2), TextColor2, gi_672, gi_668 - 1, 90);
      PrintLN("Required margin =");
      PrintLN(DoubleToStr(ld_8, 2), TextColor2, gi_672, gi_668 - 1, 90);
   }
   PrintSep();
   if (IsTesting()) PrintLN("Backtesting");
   else PrintLN(PrintStatus(GetStatus()));
   PrintSep();
   if (gi_224 && gi_492) {
      if (gi_936 == 0) PrintLN("Analyzing market");
      else PrintLN(DPrint(gi_936) + " detected");
      if (g_datetime_244 <= gi_944 && gi_936 != gi_940 && gi_940 != 0) PrintLN(DPrint(gi_940) + " fading: " + TimeToStr(gi_944 - g_datetime_244, TIME_SECONDS));
   } else PrintLN(CPrint(gi_716 || gi_720, "Running", "Collecting Data"));
   if (NFA && g_count_728 > 0) {
      PrintSep();
      PrintLN("Waiting for trades to close: ");
      PrintLN(g_count_728, TextColor2, gi_672, gi_668 - 1, 125);
   }
   if (g_ticket_732 >= 0 || g_ticket_736 >= 0 || g_ticket_756 >= 0 || g_ticket_736 >= 0) {
      PrintSep();
      if (g_ticket_732 >= 0) PrintLN("Strategy1: Long position open");
      if (g_ticket_736 >= 0) PrintLN("Strategy1: Short position open");
      if (g_ticket_756 >= 0) PrintLN("Strategy2: Long position open");
      if (g_ticket_760 >= 0) PrintLN("Strategy2: Short position open");
   }
   Deleteobjects(gi_672, gi_676);
   gi_676 = gi_672 - 1;
   ObjectsRedraw();
   return (0);
}
bool s1_Buy(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, bool a9, bool a10) {
  return (a2<0.0 && (!a9 || a5-a1>=a8) && (a6>a3 || a10 && a7>a4 && a3<50.0));
}
bool s2_Buy(double a1, double a2, double a3, double a4, double a5, double a6, bool a7, bool a8) {
  return (a5>=a1 && (!a7 || a3<0.0) && (!a8 || a4>=0.0) && a1-a2<a6-a5);
}
bool s2_Sell(double a1, double a2, double a3, double a4, double a5, double a6, bool a7, bool a8) {
  return (a6<=a2 && (!a7 || a3>0.0) && (!a8 || a4<=0.0) && a1-a2<a6-a5);
}
bool s1_Sell(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, bool a9, bool a10) {
  return (a2>0.0 && (!a9 || a1-a5>=a8) && (a6<a3 || a10 && a7<a4 && a3>50.0));
}
bool IsTradeTime(int a1, int a2, int a3, int a4, int a5) {
  return (a4<=31-a5);
}
double TimeZoneLocal() {
   int lia_0[43];
   switch (GetTimeZoneInformation(lia_0)) {
   case 0:
      return (lia_0[0] / (-60.0));
   case 1:
      return (lia_0[0] / (-60.0));
   case 2:
      return ((lia_0[0] + lia_0[42]) / (-60.0));
   }
   return (0);
}
double GetGmtOffset() {
   int li_0 = (TimeCurrent() - TimeLocal()) / 60;
   int li_4 = MathRound(li_0 / 30.0);
   li_0 = 30 * li_4;
   double ld_ret_8 = TimeZoneLocal() + li_0 / 60.0;
   return (ld_ret_8);
}
