//+------------------------------------------------------------------+
//|                                     190.Forex Shocker 3.0_V2.mq4 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+

#property copyright "Copyright� 2011 FOREX Developers, LLC"
#property link      "http://www.forexshocker.com"

#import "shocker3.dll"
   int CheckCode(string a0, string a1, int a2);
   int BlackBoxOne(string a0, string a1, double a2, double a3, double a4, double a5, int a6, int a7);
   int BlackBoxTwo(string a0, string a1, double a2, double a3, double a4, double a5, int a6, int a7);
   int BlackBoxThree(string a0, string a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, int a10, int a11);
   int BlackBoxFour(string a0, string a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, int a10, int a11);
   int BlackBoxFive(string a0, string a1, double a2, double a3, double a4, double a5, int a6, int a7);
   int BlackBoxSix(string a0, string a1, double a2, double a3, double a4, double a5, double a6, int a7, int a8);
#import "kernel32.dll"
   int GetTimeZoneInformation(int& a0[]);
#import

datetime Date = D'18.01.2012'; 
bool gba_76[] = {1, 1, 0, 0, 0};
//string gsa_80[] = {"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"};
//string gsa_84[] = {"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"};
//string gsa_88[] = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9"};
//string gsa_92[] = {"\"", "@", "&", "$", ")", "(", ";", ":", "/", "-", "\'", "!", "?", ",", ".", "=", "+"};
string gsa_104[] = {"", "", "There was an error ", " the trade.Error is: ", ""};
double gda_108[] = {0.0, 0.0, 0.0, 0.0001, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0};
int gia_112[] = {0, 0, 0, 0, 0, 32, 15, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0};
extern string Version = "3.0";
extern string VerificationCode = "";
int Account=0;
extern string _A = "System Parameters";
extern bool MoneyManagement = FALSE;
extern bool Conservative = FALSE;
extern bool ModeratelyConservative = FALSE;
extern bool Moderate = FALSE;
extern bool ModeratelyAggressive = FALSE;
extern bool Aggressive = TRUE;
extern bool VeryAggressive = FALSE;
extern bool SuperAggressive = FALSE;
extern string _B = "If MM=0, Lots below will be used";
extern double Lots = 0.1;
extern double FakeTP = 10.0;
extern int MaximumTrades = 2;
extern bool NFA_Broker = FALSE;
extern double MaxSpread = 3.0;
extern int OpenSlippage = 0;
extern int CloseSlippage = 3;
extern string _C = "Platform Hours";
extern bool SetAutoGMT = TRUE;
extern int SetManualGMT = 0;
extern int StartHour = 22;
extern int StartMinute = 00;
extern int EndHour = 23;
extern int EndMinute = 00;
extern bool UseDST_GMTminus1 = FALSE;
extern string _D = "Pair Traded";
extern string _D1 = "EU=1 UCF=2 UCD=3 GU=4";
extern int Logic = 1;
extern string _E = "Magic Numbers";
extern int magic1 = 101;
extern int magic2 = 102;
extern int magic3 = 103;
extern int magic4 = 104;
extern int magic5 = 105;
extern int magic6 = 106;
extern string _F = "Comment Change";
extern string EAName = "Forex Shocker 3.0";
int i;

double f0_0(int ai_0, int ai_4) {
   int li_8 = MathAbs(ai_4 % 10);
   if (ai_4 > 0) {
      if (li_8 > ai_0) ai_4--;
      else
         if (li_8 < ai_0) ai_4++;
   } else {
      if (li_8 > ai_0) ai_4++;
      else
         if (li_8 < ai_0) ai_4--;
   }
   return (ai_4);
}

double f0_1(double ad_0) {
   return (ad_0);
}

int f0_2(double ad_0) {
   return (ad_0);
}

int init() {
   string lsa_0[] = {"", ""};
   if (Digits == 5) {
      CloseSlippage *= 10;
      OpenSlippage *= 10;
      MaxSpread *= 10;
      gia_112[15] = 10;
   }
   Print("" + "Min Lot Size = ", MarketInfo(Symbol(), MODE_MINLOT), 
   "\n");
   Print("" + "Min Lot Step = ", MarketInfo(Symbol(), MODE_LOTSTEP), 
   "\n");
   lsa_0[0] = "risk setting set. Maximum Trades = ";
   if (MoneyManagement) {
      if (Conservative && (!ModeratelyConservative) && (!Moderate) && (!ModeratelyAggressive) && (!Aggressive) && (!VeryAggressive) && (!SuperAggressive)) {
         Print("" + "Conservative" + " " + lsa_0[0] + "" + 1 + "");
      } else {
         if ((!Conservative) && ModeratelyConservative && (!Moderate) && (!ModeratelyAggressive) && (!Aggressive) && (!VeryAggressive) && (!SuperAggressive)) {
            Print("" + "Moderately Conservative" + " " + lsa_0[0] + "" + 1 + "");
         } else {
            if ((!Conservative) && !ModeratelyConservative && Moderate && (!ModeratelyAggressive) && (!Aggressive) && (!VeryAggressive) && (!SuperAggressive)) {
               Print("" + "Moderate" + " " + lsa_0[0] + "" + 1 + "");
            } else {
               if ((!Conservative) && !ModeratelyConservative && (!Moderate) && ModeratelyAggressive && (!Aggressive) && (!VeryAggressive) && (!SuperAggressive)) {
                  Print("" + "Moderately Aggressive" + " " + lsa_0[0] + "" + 1 + "");
               } else {
                  if ((!Conservative) && !ModeratelyConservative && (!Moderate) && (!ModeratelyAggressive) && Aggressive && (!VeryAggressive) && (!SuperAggressive)) {
                     Print("" + "Aggressive" + " " + lsa_0[0] + "" + 1 + "");
                  } else {
                     if ((!Conservative) && !ModeratelyConservative && (!Moderate) && (!ModeratelyAggressive) && (!Aggressive) && VeryAggressive && (!SuperAggressive) && (!NFA_Broker)) {
                        Print("" + "Very Aggressive" + " " + lsa_0[0] + "" + 2 + "");
                     } else {
                        if ((!Conservative) && !ModeratelyConservative && (!Moderate) && (!ModeratelyAggressive) && (!Aggressive) && (!VeryAggressive) && SuperAggressive && (!NFA_Broker)) {
                           Print("" + "Super Aggressive"+ " " + lsa_0[0] + "" + 2 + "");
                        }
                     }
                  }
               }
            }
         }
      }
   }
   return (0);
}

int deinit() {
   ObjectDelete("Authentication Message");
   ObjectDelete("Expert Advisor Name");
   return (0);
}

void f0_3() {
   if (Logic == 1) {
      gia_112[0] = 105;
      gia_112[1] = 115;
      gia_112[2] = 1;
      gia_112[3] = 1;
      gda_108[1] = 4;
      gda_108[0] = 27;
      return;
   }
   if (Logic == 2) {
      gia_112[0] = 140;
      gia_112[1] = 125;
      gia_112[2] = 4;
      gia_112[3] = 1;
      gda_108[1] = 5;
      gda_108[0] = 29;
      return;
   }
   if (Logic == 3) {
      gia_112[0] = 90;
      gia_112[1] = 75;
      gia_112[2] = -1;
      gia_112[3] = 3;
      gda_108[1] = 5;
      gda_108[0] = 33;
      return;
   }
   if (Logic == 4) {
      gia_112[0] = 100;
      gia_112[1] = 110;
      gia_112[2] = 3;
      gia_112[3] = 2;
      gda_108[1] = 6;
      gda_108[0] = 27;
   }
}

string string1[] = {"", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""};
double data1[] = {0, 0};
int data2[] = {0, 0, 0};

void f0_4() {
   for (i=0;i<=19;i++){
      string1[i]="";
   }
   for (i=0;i<=1;i++){
      data1[i]=0;
   }

   for (i=0;i<=2;i++){
      data2[i]=0;
   }
   
   gsa_104[0] = DoubleToStr(Account, 0);
   data2[1] = CheckCode(gsa_104[0], VerificationCode, gia_112[4]);
   string1[9] = "\n\n\nNOT AUTHENTICATED." + 
   "\nPlease contact support@forexshocker.com";
   if (data2[1] == -51) {
      Comment(string1[9]);
      Print("" + "Code error 0xcdnft" + "");
      return;
   }
   if (data2[1] == -52) {
      Comment(string1[9]);
      Print("" + "Code error 0xcdnmch"+ "");
      return;
   }
   if (data2[1] == 51) {
      if (SetAutoGMT) data2[0] = f0_6();
      else data2[0] = SetManualGMT;
      data1[0] = MarketInfo(Symbol(), MODE_SPREAD);
      string1[10] = DoubleToStr(data1[0] / gia_112[15], 2);
      string1[11] = DoubleToStr(MaxSpread / gia_112[15], 2);
      if (Logic == 1) {
         string1[5] = "EUR/USD";
      } else {
         if (Logic == 2) {
            string1[5] = "USD/CHF";
         } else {
            if (Logic == 3) {
               string1[5] = "UCD/CAD";
            } else {
               if (Logic == 4) {
                  string1[5] = "GBP/USD";
               }
            }
         }
      }
      if (f0_5() == TRUE) {
         string1[6] = "Trading Session Active";
      } else {
         string1[6] = "Trading Sessionn: Not active";
      }
      if (UseDST_GMTminus1) {
         string1[8] = "DST Active";
      } else {
         string1[8] = "DST Deactivated";
      }
      if (f0_15() ==TRUE) {
         string1[7] = "Shocker is monitoring open position(s)...";
      } else {
         string1[7] = "No open positions";
      }
      string1[12] = "Expert Advisor Name";
      string1[13] = "Forex Shocker V3.0 Copyright  � 2011 " + "EDU " + TimeToStr (Date, TIME_DATE);
      ObjectCreate(string1[12], OBJ_LABEL, 0, 0, 0, 0);
      ObjectSet(string1[12], OBJPROP_XDISTANCE, 5);
      ObjectSet(string1[12], OBJPROP_YDISTANCE, 30);
      ObjectSetText(string1[12], string1[13], 10, "Verdana" , Red);
      string1[14] = "\n \n \n";
      string1[15] = "-----------------------------------------"
      + "\n";
      string1[16] = " Account Number: "+ Account 
         + "\n " + "Server Time: " + TimeToStr(TimeCurrent(), TIME_SECONDS) 
         + "\n" 
         + " TIMEFRAME M15"
         + "\n" 
         + " Logic: " + string1[5] 
         + "\n" 
         + " MaxSpread: " + string1[11] 
         + "\n" 
         + " Spread: " + string1[10] 
         + "\n" 
         + " GMT Offset: " + data2[0] 
         + "\n" 
         + " " + string1[6] 
         + "\n" 
         + " " + string1[8] 
         + "\n" 
         + " Trade Lot: " + f0_14() //lot
         + "\n"
      + " " + string1[7];
      Comment(string1[14] + string1[15] + string1[0] + string1[4] + string1[3] + string1[16]);
      string1[17] = "Authentication Message";
      string1[18] = "AUTHENTICATED";
      ObjectCreate(string1[17], OBJ_LABEL, 0, 0, 0, 0);
      ObjectSet(string1[17], OBJPROP_XDISTANCE, 5);
      ObjectSet(string1[17], OBJPROP_YDISTANCE, 200);
      ObjectSetText(string1[17], string1[18], 10, "Agency FB", Red);
   }
}

bool string2[] = {0, 0, 0, 0, 0, 0, 0, 0};
double data3[] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
int data4[] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};

int start() {
   for (i=0;i<=7;i++){
      string2[i]=0;
   }
   for (i=0;i<=28;i++){
      data3[i]=0;
   }
   for (i=0;i<=46;i++){
      data4[i]=0;
   }

   data3[0] = -150;
   data3[1] = -120;
   data3[2] = -150;
   data3[3] = 150;
   data3[4] = 120;
   data3[5] = 120;
   data3[6] = 200;
   data4[0] = 15;
   data4[1] = 6;
   data4[2] = 1;
   data4[3] = 20;
   data4[4] = 15;
   data4[5] = 14;
   data4[6] = 5;
   data4[7] = 42;
   data4[8] = 1;
   data4[9] = 210;
   data4[10] = 1;
   data4[11] = 80;
   data4[12] = 5;
   data4[13] = 20;
   data4[14] = 2;
   data4[15] = 0;
   data4[16] = 5;
   data4[17] = 20;
   data4[18] = 2;
   data4[19] = 0;
   data4[20] = 0;
   data4[21] = 8;
   data4[22] = 0;
   data4[23] = 0;
   data4[24] = 8;
   data4[25] = 0;
   data4[26] = 5;
   data4[27] = 4;
   data4[28] = 5;
   data4[29] = 1;
   data4[30] = 0;
   data4[31] = 5;
   data4[32] = 1;
   data4[33] = 0;
   data4[34] = 5;
   data4[35] = 14;
   data4[36] = 0;
   data3[7] = iRSI(NULL, data4[0], data4[1], PRICE_CLOSE, 0);
   data3[8] = iRSI(NULL, data4[2], data4[3], PRICE_CLOSE, 0);
   data3[9] = iCCI(Symbol(), data4[4], data4[5], PRICE_CLOSE, 0);
   data3[10] = iCCI(Symbol(), data4[6], data4[7], PRICE_CLOSE, 0);
   data3[11] = iCCI(Symbol(), data4[8], data4[9], PRICE_CLOSE, 0);
   data3[12] = iCCI(Symbol(), data4[10], data4[11], PRICE_CLOSE, 0);
   data3[13] = iBands(Symbol(), data4[12], data4[13], data4[14], data4[15], PRICE_WEIGHTED, MODE_UPPER, 1);
   data3[14] = iBands(Symbol(), data4[12], data4[13], data4[14], data4[15], PRICE_WEIGHTED, MODE_LOWER, 1);
   data3[15] = NormalizeDouble(iMA(NULL, data4[20], data4[21], data4[22], MODE_SMA, PRICE_WEIGHTED, 1), 4);
   data3[16] = NormalizeDouble(iMA(NULL, data4[23], data4[24], data4[25], MODE_SMA, PRICE_WEIGHTED, 1), 4);
   data3[17] = iMomentum(Symbol(), data4[26], data4[27], PRICE_CLOSE, 0);
   data3[18] = iMA(Symbol(), data4[28], data4[29], data4[30], MODE_EMA, PRICE_HIGH, 0);
   data3[19] = iMA(Symbol(), data4[31], data4[32], data4[33], MODE_EMA, PRICE_LOW, 0);
   data3[20] = iWPR(Symbol(), data4[34], data4[35], data4[36]);
   if (IsExpertEnabled() == 0) {
      Alert("Please allow to run Exper Advisors");
      Sleep(4000);
      return (0);
   }
   if (Period() != 15) {
      Alert("Please attach the EA to the M15 Timeframe");
      Sleep(4000);
      return (0);
   }
   if (!IsDllsAllowed()) {
      Alert("Please allow to call DLL files");
      Sleep(4000);
      return (0);
   }
   if (!IsConnected()) {
      Alert("The connection of your MT4 with the Broker server was lost");
      Sleep(10000);
      return (0);
   }
   if (IsDemo()) gia_112[4] = -1;
   else gia_112[4] = 1;
   f0_4();
   f0_10();
   f0_11();
   f0_13();
   f0_3();
   if (NFA_Broker) MaximumTrades = 1;
   if (DayOfWeek() == 1 && Hour() >= 0 && Hour() <= 3) return (0);
   if (DayOfWeek() == 0) return (0);
   HideTestIndicators(1);
   string2[0] = f0_12(magic1);
   string2[1] = f0_12(magic2);
   string2[2] = f0_12(magic3);
   string2[3] = f0_12(magic4);
   string2[4] = f0_12(magic5);
   string2[5] = f0_12(magic6);
   for (data4[37] = 1; data4[37] < Bars; data4[37] = data4[37] + 1) {
      if (iFractals(NULL, PERIOD_M15, MODE_LOWER, data4[37]) != 0) {
         gda_108[6] = iFractals(NULL, PERIOD_M15, MODE_LOWER, data4[37]);
         gda_108[10] = Time[data4[37]];
         break;
      }
   }
   data4[38] = 1;
   while (data4[38] < Bars) {
      if (iFractals(NULL, PERIOD_M15, MODE_UPPER, data4[38]) != 0) {
         gda_108[5] = iFractals(NULL, PERIOD_M15, MODE_UPPER, data4[38]);
         gda_108[9] = Time[data4[38]];
         break;
      }
      data4[38] = data4[38] + 1;
   }
   data4[39] = 1;
   while (data4[39] < Bars) {
      if (iFractals(NULL, PERIOD_H1, MODE_LOWER, data4[39]) != 0) {
         gda_108[8] = iFractals(NULL, PERIOD_H1, MODE_LOWER, data4[39]);
         gda_108[11] = Time[data4[37]];
         break;
      }
      data4[39] = data4[39] + 1;
   }
   data4[40] = 1;
   while (data4[40] < Bars) {
      if (iFractals(NULL, PERIOD_H1, MODE_UPPER, data4[40]) != 0) {
         gda_108[7] = iFractals(NULL, PERIOD_H1, MODE_UPPER, data4[40]);
         gda_108[12] = Time[data4[40]];
         break;
      }
      data4[40] = data4[40] + 1;
   }
   gia_112[7] = MathRound((gda_108[5] - gda_108[6]) / gda_108[3]);
   gda_108[4] = 0;
   gda_108[4] = gda_108[5] - (gda_108[5] - gda_108[6]) / 2;
   gia_112[8] = MathRound(iATR(Symbol(), PERIOD_M15, 4, 0) / gda_108[3]);
   string2[6] = 0;
   if (Close[0] <= gda_108[7] && Close[0] >= gda_108[8]) string2[6] = 1;
   if (iOpen(Symbol(), PERIOD_M5, 0) < Ask + 0.001) {
      if (iOpen(Symbol(), PERIOD_M5, 0) > Bid - 0.001) {
         if (iOpen(Symbol(), PERIOD_M5, 1) < Ask + 0.001) {
            if (iOpen(Symbol(), PERIOD_M5, 1) > Bid - 0.001) {
               if (iOpen(Symbol(), PERIOD_M5, 2) < Ask + 0.0012) {
                  if (iOpen(Symbol(), PERIOD_M5, 2) > Bid - 0.0012) {
                     data3[21] = f0_14();
                     gsa_104[0] = DoubleToStr(Account, 0);
                     if (DayOfWeek() == 0 || DayOfWeek() == 5 && Hour() >= 14) return (0);

                     if (f0_5() ==TRUE) {
                        if (!IsTradeContextBusy()) {
                           if (string2[6]) {
                              data3[22] = Ask + 20 * gda_108[3];
                              if (!string2[0] && BlackBoxOne(gsa_104[0], VerificationCode, data3[7], data3[8], data3[15], data3[22], Logic, gia_112[4]) == 150) {
                                 data4[42] = OrdersTotal();
                                 for (data4[41] = data4[42] - 1; data4[41] >= 0; data4[41] = data4[41] - 1) {
                                    OrderSelect(data4[41], SELECT_BY_POS);
                                    if (OrderSymbol() == Symbol() && OrderType() == OP_SELL && OrderMagicNumber() == magic1 || OrderMagicNumber() == magic2 || OrderMagicNumber() == magic3 || OrderMagicNumber() == magic4 ||
                                       OrderMagicNumber() == magic5 || OrderMagicNumber() == magic6) return (0);
                                 }
                                 data4[43] = 0;
                                 data4[44] = OrdersTotal();
                                 data4[45] = data4[44] - 1;
                                 while (data4[45] >= 0) {
                                    OrderSelect(data4[45], SELECT_BY_POS);
                                    if (OrderSymbol() == Symbol() && OrderMagicNumber() == magic1 || OrderMagicNumber() == magic2 || OrderMagicNumber() == magic3 || OrderMagicNumber() == magic4 || OrderMagicNumber() == magic5 ||
                                       OrderMagicNumber() == magic6) {
                                       data4[43] = data4[43] + 1;
                                       if (data4[43] >= MaximumTrades) return (0);
                                    }
                                    data4[45] = data4[45] - 1;
                                 }
                                 if (f0_9()==TRUE) return;
                                 RefreshRates();
                                 gia_112[9] = OrderSend(Symbol(), OP_BUY, data3[21], Ask, OpenSlippage, 0, 0, EAName, magic1, 0, Green);
                                 if (gia_112[9] < 0) {
                                    Print("OrderSend Error ", GetLastError());
                                 }
                                 Print("Current Spread: " +
                                    " ", DoubleToStr(MarketInfo(Symbol(), MODE_SPREAD) / gia_112[15], 2));
                              }
                              data3[23] = Bid - 20 * gda_108[3];
                              if (!string2[1] && BlackBoxTwo(gsa_104[0], VerificationCode, data3[7], data3[8], data3[16], data3[23], Logic, gia_112[4]) == 250) {
                                 data4[42] = OrdersTotal();
                                 for (data4[41] = data4[42] - 1; data4[41] >= 0; data4[41] = data4[41] - 1) {
                                    OrderSelect(data4[41], SELECT_BY_POS);
                                    if (OrderSymbol() == Symbol() && OrderType() == OP_BUY && OrderMagicNumber() == magic1 || OrderMagicNumber() == magic2 || OrderMagicNumber() == magic3 || OrderMagicNumber() == magic4 ||
                                       OrderMagicNumber() == magic5 || OrderMagicNumber() == magic6) return (0);
                                 }
                                 data4[43] = 0;
                                 data4[44] = OrdersTotal();
                                 data4[45] = data4[44] - 1;
                                 while (data4[45] >= 0) {
                                    OrderSelect(data4[45], SELECT_BY_POS);
                                    if (OrderSymbol() == Symbol() && OrderMagicNumber() == magic1 || OrderMagicNumber() == magic2 || OrderMagicNumber() == magic3 || OrderMagicNumber() == magic4 || OrderMagicNumber() == magic5 ||
                                       OrderMagicNumber() == magic6) {
                                       data4[43] = data4[43] + 1;
                                       if (data4[43] >= MaximumTrades) return (0);
                                    }
                                    data4[45] = data4[45] - 1;
                                 }
                                 if (f0_9()==TRUE) return;
                                 RefreshRates();
                                 gia_112[9] = OrderSend(Symbol(), OP_SELL, data3[21], Bid, OpenSlippage, 0, 0, EAName, magic2, 0, Red);
                                 if (gia_112[9] < 0) {
                                    Print("OrderSend Error" +
                                       " ", GetLastError());
                                 }
                                 Print("Current Spread: " +
                                    " ", DoubleToStr(MarketInfo(Symbol(), MODE_SPREAD) / gia_112[15], 2));
                              }
                           }
                           if (gia_112[7] < gia_112[5] && gia_112[8] < gia_112[6] && string2[6]) {
                              data3[24] = gda_108[4] - 3 * gda_108[3];
                              if (!string2[2] && BlackBoxThree(gsa_104[0], VerificationCode, data3[10], data3[0], data3[11], data3[1], data3[9], data3[2], Bid, data3[24], Logic, gia_112[4]) == 350) {
                                 data4[42] = OrdersTotal();
                                 for (data4[41] = data4[42] - 1; data4[41] >= 0; data4[41] = data4[41] - 1) {
                                    OrderSelect(data4[41], SELECT_BY_POS);
                                    if (OrderSymbol() == Symbol() && OrderType() == OP_SELL && OrderMagicNumber() == magic1 || OrderMagicNumber() == magic2 || OrderMagicNumber() == magic3 || OrderMagicNumber() == magic4 ||
                                       OrderMagicNumber() == magic5 || OrderMagicNumber() == magic6) return (0);
                                 }
                                 data4[43] = 0;
                                 data4[44] = OrdersTotal();
                                 data4[45] = data4[44] - 1;
                                 while (data4[45] >= 0) {
                                    OrderSelect(data4[45], SELECT_BY_POS);
                                    if (OrderSymbol() == Symbol() && OrderMagicNumber() == magic1 || OrderMagicNumber() == magic2 || OrderMagicNumber() == magic3 || OrderMagicNumber() == magic4 || OrderMagicNumber() == magic5 ||
                                       OrderMagicNumber() == magic6) {
                                       data4[43] = data4[43] + 1;
                                       if (data4[43] >= MaximumTrades) return (0);
                                    }
                                    data4[45] = data4[45] - 1;
                                 }
                                 if (f0_9()==TRUE) return;
                                 RefreshRates();
                                 gia_112[9] = OrderSend(Symbol(), OP_BUY, data3[21], Ask, OpenSlippage, 0, 0, EAName, magic3, 0, Green);
                                 if (gia_112[9] < 0) {
                                    Print("OrderSend Error" +
                                       " ", GetLastError());
                                 }
                                 Print("Current Spread: " +
                                    " ", DoubleToStr(MarketInfo(Symbol(), MODE_SPREAD) / gia_112[15], 2));
                              }
                           }
                           data3[25] = gda_108[4] + 3 * gda_108[3];
                           if (!string2[3] && BlackBoxFour(gsa_104[0], VerificationCode, data3[10], data3[3], data3[11], data3[4], data3[9], data3[5], Ask, data3[25], Logic, gia_112[4]) == 450) {
                              data4[42] = OrdersTotal();
                              for (data4[41] = data4[42] - 1; data4[41] >= 0; data4[41] = data4[41] - 1) {
                                 OrderSelect(data4[41], SELECT_BY_POS);
                                 if (OrderSymbol() == Symbol() && OrderType() == OP_BUY && OrderMagicNumber() == magic1 || OrderMagicNumber() == magic2 || OrderMagicNumber() == magic3 || OrderMagicNumber() == magic4 ||
                                    OrderMagicNumber() == magic5 || OrderMagicNumber() == magic6) return (0);
                              }
                              data4[43] = 0;
                              data4[44] = OrdersTotal();
                              data4[45] = data4[44] - 1;
                              while (data4[45] >= 0) {
                                 OrderSelect(data4[45], SELECT_BY_POS);
                                 if (OrderSymbol() == Symbol() && OrderMagicNumber() == magic1 || OrderMagicNumber() == magic2 || OrderMagicNumber() == magic3 || OrderMagicNumber() == magic4 || OrderMagicNumber() == magic5 ||
                                    OrderMagicNumber() == magic6) {
                                    data4[43] = data4[43] + 1;
                                    if (data4[43] >= MaximumTrades) return (0);
                                 }
                                 data4[45] = data4[45] - 1;
                              }
                              if (f0_9()==TRUE) return;
                              RefreshRates();
                              gia_112[9] = OrderSend(Symbol(), OP_SELL, data3[21], Bid, OpenSlippage, 0, 0, EAName, magic4, 0, Red);
                              if (gia_112[9] < 0) {
                                 Print("OrderSend Error" +
                                    " ", GetLastError());
                              }
                              Print("Current Spread:"+
                                 " ", DoubleToStr(MarketInfo(Symbol(), MODE_SPREAD) / gia_112[15], 2));
                           }
                           data3[26] = gda_108[4] + 3 * gda_108[3];
                           if (!string2[4] && BlackBoxFive(gsa_104[0], VerificationCode, data3[17], data3[12], Ask, data3[26], Logic, gia_112[4]) == 550) {
                              data4[42] = OrdersTotal();
                              for (data4[41] = data4[42] - 1; data4[41] >= 0; data4[41] = data4[41] - 1) {
                                 OrderSelect(data4[41], SELECT_BY_POS);
                                 if (OrderSymbol() == Symbol() && OrderType() == OP_BUY && OrderMagicNumber() == magic1 || OrderMagicNumber() == magic2 || OrderMagicNumber() == magic3 || OrderMagicNumber() == magic4 ||
                                    OrderMagicNumber() == magic5 || OrderMagicNumber() == magic6) return (0);
                              }
                              data4[43] = 0;
                              data4[44] = OrdersTotal();
                              data4[45] = data4[44] - 1;
                              while (data4[45] >= 0) {
                                 OrderSelect(data4[45], SELECT_BY_POS);
                                 if (OrderSymbol() == Symbol() && OrderMagicNumber() == magic1 || OrderMagicNumber() == magic2 || OrderMagicNumber() == magic3 || OrderMagicNumber() == magic4 || OrderMagicNumber() == magic5 ||
                                    OrderMagicNumber() == magic6) {
                                    data4[43] = data4[43] + 1;
                                    if (data4[43] >= MaximumTrades) return (0);
                                 }
                                 data4[45] = data4[45] - 1;
                              }
                              if (f0_9()==TRUE) return;
                              RefreshRates();
                              gia_112[9] = OrderSend(Symbol(), OP_SELL, data3[21], Bid, OpenSlippage, 0, 0, EAName, magic5, 0, Red);
                              if (gia_112[9] < 0) {
                                 Print("OrderSend Error" +
                                    " ", GetLastError());
                              }
                              Print("Current Spread:" +
                                 " ", DoubleToStr(MarketInfo(Symbol(), MODE_SPREAD) / gia_112[15], 2));
                           }
                           if (DayOfWeek() == 0 || DayOfWeek() == 5 && Hour() >= 14) return (0);
                           data3[27] = gda_108[4] + 3 * gda_108[3];
                           if (!string2[5] && BlackBoxSix(gsa_104[0], VerificationCode, data3[20], data3[18], data3[13], Bid, data3[27], Logic, gia_112[4]) == 650) {
                              data4[42] = OrdersTotal();
                              for (data4[41] = data4[42] - 1; data4[41] >= 0; data4[41] = data4[41] - 1) {
                                 OrderSelect(data4[41], SELECT_BY_POS);
                                 if (OrderSymbol() == Symbol() && OrderType() == OP_BUY && OrderMagicNumber() == magic1 || OrderMagicNumber() == magic2 || OrderMagicNumber() == magic3 || OrderMagicNumber() == magic4 ||
                                    OrderMagicNumber() == magic5 || OrderMagicNumber() == magic6) return (0);
                              }
                              data4[43] = 0;
                              data4[44] = OrdersTotal();
                              data4[45] = data4[44] - 1;
                              while (data4[45] >= 0) {
                                 OrderSelect(data4[45], SELECT_BY_POS);
                                 if (OrderSymbol() == Symbol() && OrderMagicNumber() == magic1 || OrderMagicNumber() == magic2 || OrderMagicNumber() == magic3 || OrderMagicNumber() == magic4 || OrderMagicNumber() == magic5 ||
                                    OrderMagicNumber() == magic6) {
                                    data4[43] = data4[43] + 1;
                                    if (data4[43] >= MaximumTrades) return (0);
                                 }
                                 data4[45] = data4[45] - 1;
                              }
                              if (f0_9()==TRUE) return;
                              RefreshRates();
                              gia_112[9] = OrderSend(Symbol(), OP_SELL, data3[21], Bid, OpenSlippage, 0, 0, EAName, magic6, 0, Red);
                              if (gia_112[9] < 0) {
                                 Print("OrderSend Error"+
                                    " ", GetLastError());
                              }
                              Print("Current Spread:"+
                                 " ", DoubleToStr(MarketInfo(Symbol(), MODE_SPREAD) / gia_112[15], 2));
                           }
                        }
                     }
                  }
               }
            }
         }
      }
   }
   return (0);
}

string string3[] = {"", "", "", "", "", ""};
int data5[] = {0, 0, 0, 0, 0, 0, 0};

int f0_5() {
   for (i=0;i<=5;i++){
      string3[i]="";
   }
   for (i=0;i<=6;i++){
      data5[i]=0;
   }

   if (SetAutoGMT) data5[0] = f0_6();
   else data5[0] = SetManualGMT;
   string3[0] = "must remain between ";
   string3[1] = "GMT UseDST is ";
   string3[2] = "so GMT is ";
   string3[3] = "displaced";
   string3[4] = ". Please change your input value.";
   if (!UseDST_GMTminus1) {
      if (StartHour >= 0 && StartHour <= 19 || StartHour >= 24 || StartHour < 0) {
         Print("StartHour "+ string3[0] + "20 - 23" + string3[1] + "OFF " + string3[2] + "not " +
            string3[3] + string3[4]);
         return (0);
      }
      if (EndHour >= 0 && EndHour <= 19 || EndHour >= 24 || EndHour < 0) {
         Print("EndHour "+ string3[0] + "20 - 23" + string3[1] +
            "OFF " + string3[2] + "not " + string3[3] + string3[4]);
         return (0);
      }
   } else {
      if (StartHour >= 0 && StartHour <= 19 || StartHour >= 24 || StartHour < 0) {
         Print("StartHour "+ string3[0] + "19 - 22" + string3[1] + "ON " + string3[2] + string3[3] + " " +
            "-1" + "" + string3[4]);
         return (0);
      }
      if (EndHour >= 0 && EndHour <= 19 || EndHour >= 24 || EndHour < 0) {
         Print("EndHour "+ string3[0] + "19 - 22" + string3[1] +
            "ON " + " " + string3[2] + string3[3] + " -1" +
            string3[4]);
         return (0);
      }
   }
   if (UseDST_GMTminus1) data5[3] = 1;
   else data5[3] = 0;
   data5[4] = StartHour - data5[3];
   data5[5] = EndHour - data5[3];
   if (Hour() >= 13) data5[1] = Hour();
   else {
      if (Hour() == 0) data5[1] = 24;
      else {
         if (Hour() == 1) data5[1] = 25;
         else {
            if (Hour() == 2) data5[1] = 26;
            else {
               if (Hour() == 3) data5[1] = 27;
               else {
                  if (Hour() == 4) data5[1] = 28;
                  else {
                     if (Hour() == 5) data5[1] = 29;
                     else
                        if (Hour() == 6) data5[1] = 30;
                  }
               }
            }
         }
      }
   }
   if (data5[4] < data5[5]) data5[2] = data5[5] - data5[4];
   else {
      if (data5[4] > data5[5]) {
         if (data5[4] != 0) data5[2] = 24 - data5[4] + data5[5];
         else
            if (data5[4] == 0) data5[2] = data5[5];
      }
   }
   if (data5[4] < data5[5]) {
      if (data5[2] == 1) {
         if (data5[1] - data5[0] >= data5[4] && Minute() >= StartMinute && data5[1] - data5[0] < data5[5]) return (1);
         if (data5[1] - data5[0] == data5[5] && Minute() < EndMinute && EndMinute != 0) return (1);
      } else {
         if (data5[2] == 2) {
            if (data5[1] - data5[0] >= data5[4] && Minute() >= StartMinute && data5[1] - data5[0] < data5[5]) return (1);
            if (data5[1] - data5[0] == data5[4] + 1 && Minute() < StartMinute) return (1);
            if (data5[1] - data5[0] == data5[5] && Minute() < EndMinute && EndMinute != 0) return (1);
         } else {
            if (data5[2] == 3) {
               if (data5[1] + data5[0] >= data5[4] && Minute() >= StartMinute && data5[1] - data5[0] < data5[5]) return (1);
               if (data5[1] - data5[0] == data5[4] + 1 && Minute() < StartMinute) return (1);
               if (data5[1] - data5[0] == data5[4] + 2 && Minute() < StartMinute) return (1);
               if (data5[1] - data5[0] == data5[5] && Minute() < EndMinute && EndMinute != 0) return (1);
            } else {
               if (data5[2] == 4) {
                  if (data5[1] - data5[0] >= data5[4] && Minute() >= StartMinute && data5[1] - data5[0] < data5[5]) return (1);
                  if (data5[1] - data5[0] == data5[4] + 1 && Minute() < StartMinute) return (1);
                  if (data5[1] - data5[0] == data5[4] + 2 && Minute() < StartMinute) return (1);
                  if (data5[1] - data5[0] == data5[4] + 3 && Minute() < StartMinute) return (1);
                  if (data5[1] - data5[0] == data5[5] && Minute() < EndMinute && EndMinute != 0) return (1);
               }
            }
         }
      }
   } else {
      if (data5[4] == data5[5]) {
         if (data5[1] - data5[0] == data5[4] && Minute() >= StartMinute && Minute() < EndMinute && StartMinute < EndMinute) return (1);
         if (StartMinute > EndMinute) {
            Print("There is an error in Time Setting: StartMinute cannot be larger than EndMinute");
            return (0);
         }
      }
   }
   return (0);
}

double f0_6() {
   return (f0_7());
}

double string5[] = {0, 0};
int data6[] = {0, 0, 0};

double f0_7() {
   for (i=0;i<=1;i++){
      string5[i]=0;
   }
   for (i=0;i<=2;i++){
      data6[i]=0;
   }
   
   data6[0] = (TimeCurrent() - TimeLocal()) / 60;
   data6[1] = MathRound(data6[0] / 30);
   data6[0] = 30 * data6[1];
   string5[0] = f0_8() + data6[0] / 60;
   return (string5[0]);
}

double f0_8() {
   int lia_0[43];
   switch (GetTimeZoneInformation(lia_0)) {
   case 0:
      return (lia_0[0] / (-60));
   case 1:
      return (lia_0[0] / (-60));
   case 2:
      return ((lia_0[0] + lia_0[42]) / (-60));
   }
   
   return (0);
}

int f0_9() {
   RefreshRates();
   if (MarketInfo(Symbol(), MODE_SPREAD) > MaxSpread) {
      Print("Current Spread: ", DoubleToStr(MarketInfo(Symbol(), MODE_SPREAD) / gia_112[15], 2), " pips is too high.", "MaxSpread allowed: ", DoubleToStr(MaxSpread / gia_112[15], 2), " pips. Possible trade is rejected.");
      return (0);
   }
   return (0);
}

bool string6[] = {0, 0};
int data7[] = {0, 0, 0};

void f0_10() {
   for (i=0;i<=1;i++){
      string6[i]=0;
   }
   for (i=0;i<=2;i++){
      data7[i]=0;
   }

   data7[0] = OrdersTotal();
   for (data7[1] = data7[0] - 1; data7[1] >= 0; data7[1] = data7[1] - 1) {
      OrderSelect(data7[1], SELECT_BY_POS, MODE_TRADES);
      if (OrderType() == OP_BUY) {
         if (OrderMagicNumber() == magic1 || OrderMagicNumber() == magic3 && OrderSymbol() == Symbol()) {
            if (Bid >= OrderOpenPrice() + gda_108[1] * gda_108[3]) {
               RefreshRates();
               string6[0] = OrderClose(OrderTicket(), OrderLots(), Bid, CloseSlippage, Orange);
               if (!string6[0]) {
                  Print(gsa_104[2] + "closing" + gsa_104[3], GetLastError());
                  return;
               }
            }
         }
      }
      if (OrderType() == OP_SELL) {
         if (OrderMagicNumber() == magic2 || OrderMagicNumber() == magic4 || OrderMagicNumber() == magic5 || OrderMagicNumber() == magic6 && OrderSymbol() == Symbol()) {
            if (Ask <= OrderOpenPrice() - gda_108[1] * gda_108[3]) {
               RefreshRates();
               string6[0] = OrderClose(OrderTicket(), OrderLots(), Ask, CloseSlippage, Orange);
               if (!string6[0]) {
                  Print(gsa_104[2] + "closing" + gsa_104[3], GetLastError());
                  return;
               }
            }
         }
      }
   }
}

bool string7[] = {0, 0};
int data8[] = {0, 0, 0, 0};

void f0_11() {
   for (i=0;i<=1;i++){
      string7[i]=0;
   }
   for (i=0;i<=3;i++){
      data8[i]=0;
   }

   if (Digits == 4) data8[0] = 1;
   else
      if (Digits == 5) data8[0] = 10;
   data8[1] = OrdersTotal();
   for (data8[2] = data8[1] - 1; data8[2] >= 0; data8[2] = data8[2] - 1) {
      OrderSelect(data8[2], SELECT_BY_POS, MODE_TRADES);
      if (OrderType() == OP_BUY && OrderSymbol() == Symbol() && OrderMagicNumber() == magic1 || OrderMagicNumber() == magic3) {
         if (TimeCurrent() - OrderOpenTime() >= 60 * gia_112[0] && Bid >= OrderOpenPrice() + gia_112[2] * gda_108[3]) {
            RefreshRates();
            string7[0] = OrderClose(OrderTicket(), OrderLots(), Bid, CloseSlippage, Orange);
            if (!string7[0]) {
               Print(gsa_104[2] + "closing" + gsa_104[3], GetLastError());
               return;
            }
         }
         if (DayOfWeek() == 5 && Hour() >= 19) {
            RefreshRates();
            string7[0] = OrderClose(OrderTicket(), OrderLots(), Bid, CloseSlippage, Orange);
         }
      }
      if (OrderType() == OP_SELL && OrderSymbol() == Symbol() && OrderMagicNumber() == magic2 || OrderMagicNumber() == magic4 || OrderMagicNumber() == magic5 || OrderMagicNumber() == magic6) {
         if (TimeCurrent() - OrderOpenTime() >= 60 * gia_112[1] && Ask <= OrderOpenPrice() - gia_112[3] * gda_108[3]) {
            RefreshRates();
            string7[0] = OrderClose(OrderTicket(), OrderLots(), Ask, CloseSlippage, Orange);
            if (!string7[0]) {
               Print(gsa_104[2] + "closing"+ gsa_104[3], GetLastError());
               return;
            }
         }
         if (DayOfWeek() == 5 && Hour() >= 19) {
            RefreshRates();
            string7[0] = OrderClose(OrderTicket(), OrderLots(), Ask, CloseSlippage, Orange);
         }
      }
   }
}

int data9[] = {0, 0, 0};

int f0_12(int a_magic_0) {
   for (i=0;i<=2;i++){
      data9[i]=0;
   }

   data9[0] = OrdersTotal();
   data9[1] = data9[0] - 1;
   while (data9[1] >= 0) {
      if (OrderSelect(data9[1], SELECT_BY_POS) == 1)
         if (OrderSymbol() == Symbol() && OrderMagicNumber() == a_magic_0) return (1);
      data9[1] = data9[1] - 1;
   }
   return (0);
}

bool string10[] = {0, 0};
int data10[] = {0, 0, 0, 0};

void f0_13() {
   for (i=0;i<=1;i++){
      string10[i]=0;
   }
   for (i=0;i<=3;i++){
      data10[i]=0;
   }

   data10[1] = OrdersTotal();
   if (Digits == 4) data10[0] = 1;
   else
      if (Digits == 5) data10[0] = 10;
   if (FakeTP < 10) {
      Print("Fake TP cannot be less of 10 pips");
      return;
   }
   data10[2] = data10[1] - 1;
   while (data10[2] >= 0) {
      if (OrderSelect(data10[2], SELECT_BY_POS) == 1) {
         if (OrderSymbol() == Symbol() && OrderStopLoss() == 0 && OrderMagicNumber() == magic1 || OrderMagicNumber() == magic2 || OrderMagicNumber() == magic3 ||
            OrderMagicNumber() == magic4 || OrderMagicNumber() == magic5 || OrderMagicNumber() == magic6) {
            if (OrderType() == OP_SELL) {
               string10[0] = OrderModify(OrderTicket(), OrderOpenPrice(), OrderOpenPrice() + gda_108[0] * gda_108[3], OrderOpenPrice() - FakeTP * gda_108[3], 0, Green);
               if (!string10[0]) {
                  Print(gsa_104[2] + "modifying" + gsa_104[3], GetLastError());
                  return;
               }
            } else {
               if (OrderType() == OP_BUY) {
                  string10[0] = OrderModify(OrderTicket(), OrderOpenPrice(), OrderOpenPrice() - gda_108[0] * gda_108[3], OrderOpenPrice() + FakeTP * gda_108[3], 0, Green);
                  if (!string10[0]) {
                     Print(gsa_104[2] + "modifying" + gsa_104[3], GetLastError());
                     return;
                  }
               }
            }
         }
      } else {
         Print("There was an error selecting the trade Error is ", GetLastError());
      }
      data10[2] = data10[2] - 1;
   }
}

string string11[] = {"", "", "", "", ""};
double data11[] = {0, 0, 0, 0, 0, 0, 0, 0};

double f0_14() {
   for (i=0;i<=4;i++){
      string11[i]=0;
   }
   for (i=0;i<=7;i++){
      data11[i]=0;
   }

   data11[3] = MarketInfo(Symbol(), MODE_MAXLOT);
   data11[4] = MarketInfo(Symbol(), MODE_MINLOT);
   data11[5] = MarketInfo(Symbol(), MODE_LOTSTEP);
   string11[0] = "NFA Broker is " + 1 + " ";
   string11[1] = "risk setting uses MaximumTrades 2 but it cannot be 2. Please change your risk setting";
   string11[2] = "All Money Management risk setting are ";
   string11[3] = ". Please choose just ONE risk setting. Actual one is Conservative by rdefault.";
   if (MoneyManagement) {
      if (Conservative && (!ModeratelyConservative) && (!Moderate) && (!ModeratelyAggressive) && (!Aggressive) && (!VeryAggressive) && (!SuperAggressive)) {
         data11[6] = 0.1;
         MaximumTrades = 1;
      } else {
         if ((!Conservative) && ModeratelyConservative && (!Moderate) && (!ModeratelyAggressive) && (!Aggressive) && (!VeryAggressive) && (!SuperAggressive)) {
            data11[6] = 0.2;
            MaximumTrades = 1;
         } else {
            if ((!Conservative) && !ModeratelyConservative && Moderate && (!ModeratelyAggressive) && (!Aggressive) && (!VeryAggressive) && (!SuperAggressive)) {
               data11[6] = 0.3;
               MaximumTrades = 1;
            } else {
               if ((!Conservative) && !ModeratelyConservative && (!Moderate) && ModeratelyAggressive && (!Aggressive) && (!VeryAggressive) && (!SuperAggressive)) {
                  data11[6] = 0.5;
                  MaximumTrades = 1;
               } else {
                  if ((!Conservative) && !ModeratelyConservative && (!Moderate) && (!ModeratelyAggressive) && Aggressive && (!VeryAggressive) && (!SuperAggressive)) {
                     data11[6] = 1;
                     MaximumTrades = 1;
                  } else {
                     if ((!Conservative) && !ModeratelyConservative && (!Moderate) && (!ModeratelyAggressive) && (!Aggressive) && VeryAggressive && (!SuperAggressive)) {
                        data11[6] = 1;
                        MaximumTrades = 2;
                        if (NFA_Broker) {
                           Print(string11[0] + "Very" + string11[1]);
                           MaximumTrades = 1;
                        }
                     } else {
                        if ((!Conservative) && !ModeratelyConservative && (!Moderate) && (!ModeratelyAggressive) && (!Aggressive) && (!VeryAggressive) && SuperAggressive) {
                           data11[6] = 2;
                           MaximumTrades = 2;
                           if (NFA_Broker) {
                              Print(string11[0] + "Super" + string11[1]);
                              MaximumTrades = 1;
                           }
                        } else {
                           if ((!Conservative) && !ModeratelyConservative && (!Moderate) && (!ModeratelyAggressive) && (!Aggressive) && (!VeryAggressive) && (!SuperAggressive)) {
                              data11[6] = 0.1;
                              MaximumTrades = 1;
                              Print(string11[2] + "False" + string11[3]);
                           } else {
                              if (Conservative && ModeratelyConservative && Moderate && ModeratelyAggressive && Aggressive && VeryAggressive && SuperAggressive) {
                                 data11[6] = 0.1;
                                 MaximumTrades = 1;
                                 Print(string11[2] + "True" + string11[3]);
                              }
                           }
                        }
                     }
                  }
               }
            }
         }
      }
      data11[1] = AccountFreeMargin() / 10000 * data11[6];
      if (data11[5] == 0.01) data11[0] = NormalizeDouble(data11[1], 2);
      else data11[0] = NormalizeDouble(data11[1], 1);
      if (data11[0] > data11[3]) data11[0] = data11[3];
   
      return (data11[0]);
   }

   return (Lots);
}

int data12[] = {0, 0};

int f0_15() {
   for (i=0;i<=1;i++){
      data12[i]=0;
   }

   data12[0] = OrdersTotal() - 1;
   while (data12[0] >= 0) {
      if (OrderSelect(data12[0], SELECT_BY_POS) == 1) {
         if (OrderSymbol() == Symbol() && OrderType() == OP_BUY || OrderType() == OP_SELL && OrderMagicNumber() == magic1 || OrderMagicNumber() == magic2 || OrderMagicNumber() == magic3 ||
            OrderMagicNumber() == magic4 || OrderMagicNumber() == magic5 || OrderMagicNumber() == magic6) return (1);
         return (0);
      }
      data12[0] = data12[0] - 1;
   }
   return (0);
}



        
