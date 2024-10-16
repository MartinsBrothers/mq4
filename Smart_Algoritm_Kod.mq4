#property copyright "2012, Smart_Algoritm"
#property link      "http://Smart_Algoritm"
#property strict

input string   t0          = "Лоты 0 - постоянный, 1 - зависит от баланса";
input int      ModeLot     = 1;
input double   LotPost     = 1.0;
input double   LotProc     = 2.0;
input string   t3          = "Система выхода из просадок";
input int      Level       = 1;
input double   Max         = 0.5;
input double   STOPmax     = 2.0;
input string   t5          = "Настройки Трейлинг стопа";
input int      Tral        = 250;
input int      TralStep    = 0;
input string   t6          = "Настройки доливок";
input double   Lim         = 2.0;
input int      Step        = 500;
input string   t7          = "Настройки отложек";
input int      Modify      = 60;
input int      Dist        = 250;
input bool     Use_Modyfy  = TRUE;
input bool     Use_Limit   = TRUE;
input bool     Use_Stop    = FALSE;
input string   t8          = "Настройки пар";
input string   P1          = "EURUSD";
input string   P2          = "GBPUSD";
input string   P3          = "USDCHF";
input string   P4          = "EURGBP";
input string   P5          = "USDCAD";
input string   P6          = "GBPCHF";
input string   P7          = "NZDUSD";
input string   t9          = "Мелкие настройки";
input int      Slip        = 100;
input int      Magic       = 123;
input string   Name        = "Smart_Algoritm";
input bool     Info        = TRUE;

int      G_datetime_288;
int      G_datetime_292;
int      G_datetime_296;
int      G_datetime_300;
int      Gi_304;
double   Gd_308;
double   G_lots_316;
int      Li_8;
int      ticket;
bool     modtic, closetic, deltic;

int OnInit()
  {
   Gi_304 = 1;
   if (Digits == 5 || Digits == 3) Gi_304 = 10;
   return(INIT_SUCCEEDED);
  }

void OnTick()
  {
   double lots_0 = 0;
   if(ModeLot == 0) lots_0 = LotPost;
   if(ModeLot == 1) lots_0 = NormalizeDouble(AccountBalance() / 100.0 * LotProc / (100.0 * MarketInfo(Symbol(), MODE_TICKVALUE) * Gi_304), 2);
   if(lots_0 < MarketInfo(Symbol(), MODE_MINLOT)) lots_0 = MarketInfo(Symbol(), MODE_MINLOT);
   if(MarketInfo(Symbol(), MODE_LOTSTEP) == 0.01) Li_8 = 2;
   if(MarketInfo(Symbol(), MODE_LOTSTEP) == 0.1) Li_8 = 1;
   if(MarketInfo(Symbol(), MODE_LOTSTEP) == 1.0) Li_8 = 0;
   if(Info)
     {
      Comment(""
              + "\n" 
              + "Smart_Algoritm" 
              + "\n" 
              + "________________________________" 
              + "\n" 
              + "Брокер:         " + AccountCompany() 
              + "\n" 
              + "Время брокера:  " + TimeToStr(TimeCurrent(), TIME_DATE|TIME_SECONDS) 
              + "\n" 
              + "________________________________" 
              + "\n" 
              + "Счёт:             " + AccountName() 
              + "\n" 
              + "Номер счёт        " + (string)AccountNumber() 
              + "\n" 
              + "_______________________________" 
              + "\n" 
              + "Баланс:                       " + DoubleToStr(AccountBalance(), 2) 
              + "\n" 
              + "Свободные средства:   " + DoubleToStr(AccountEquity(), 2) 
              + "\n"
              +"_______________________________");
     }

   double Ld_12 = AccountBalance() / 100.0 * STOPmax;
   if(f0_2(-1) >= Ld_12 && Ld_12 != 0.0) f0_9(Magic, -1);
   Gd_308 = AccountBalance() / 100.0 * Max;
   f0_5();
   if(f0_8(-1)  == 1) f0_12(Magic, P1);
   if(f0_3(-1)  == 1) f0_12(Magic, P2);
   if(f0_10(-1) == 1) f0_12(Magic, P3);
   if(f0_6(-1)  == 1) f0_12(Magic, P4);
   if(f0_15(-1) == 1) f0_12(Magic, P5);
   if(f0_4(-1)  == 1) f0_12(Magic, P6);
   if(f0_0(-1)  == 1) f0_12(Magic, P7);
   if(f0_8(OP_BUY) > 0 && NormalizeDouble(MarketInfo(P1, MODE_ASK) + Step * MarketInfo(P1, MODE_POINT), Digits) <= f0_14(P1))
     {
      G_lots_316 = NormalizeDouble(MathPow(Lim, f0_8(OP_BUY)) * lots_0, Li_8);
      ticket = OrderSend(P1, OP_BUY, G_lots_316, NormalizeDouble(MarketInfo(P1, MODE_ASK), Digits), Slip, 0, 0, Name, Magic, 0, Green);
     }
   if(f0_8(OP_SELL) > 0 && NormalizeDouble(MarketInfo(P1, MODE_BID) - Step * MarketInfo(P1, MODE_POINT), Digits) >= f0_1(P1))
     {
      G_lots_316 = NormalizeDouble(MathPow(Lim, f0_8(OP_SELL)) * lots_0, Li_8);
      ticket = OrderSend(P1, OP_SELL, G_lots_316, NormalizeDouble(MarketInfo(P1, MODE_BID), Digits), Slip, 0, 0, Name, Magic, 0, Red);
     }
   if(f0_3(OP_BUY) > 0 && NormalizeDouble(MarketInfo(P2, MODE_ASK) + Step * MarketInfo(P2, MODE_POINT), Digits) <= f0_14(P2))
     {
      G_lots_316 = NormalizeDouble(MathPow(Lim, f0_3(OP_BUY)) * lots_0, Li_8);
      ticket = OrderSend(P2, OP_BUY, G_lots_316, NormalizeDouble(MarketInfo(P2, MODE_ASK), Digits), Slip, 0, 0, Name, Magic, 0, Green);
     }
   if(f0_3(OP_SELL) > 0 && NormalizeDouble(MarketInfo(P2, MODE_BID) - Step * MarketInfo(P2, MODE_POINT), Digits) >= f0_1(P2))
     {
      G_lots_316 = NormalizeDouble(MathPow(Lim, f0_3(OP_SELL)) * lots_0, Li_8);
      ticket = OrderSend(P2, OP_SELL, G_lots_316, NormalizeDouble(MarketInfo(P2, MODE_BID), Digits), Slip, 0, 0, Name, Magic, 0, Red);
     }
   if(f0_10(OP_BUY) > 0 && NormalizeDouble(MarketInfo(P3, MODE_ASK) + Step * MarketInfo(P3, MODE_POINT), Digits) <= f0_14(P3))
     {
      G_lots_316 = NormalizeDouble(MathPow(Lim, f0_10(OP_BUY)) * lots_0, Li_8);
      ticket = OrderSend(P3, OP_BUY, G_lots_316, NormalizeDouble(MarketInfo(P3, MODE_ASK), Digits), Slip, 0, 0, Name, Magic, 0, Green);
     }
   if(f0_10(OP_SELL) > 0 && NormalizeDouble(MarketInfo(P3, MODE_BID) - Step * MarketInfo(P3, MODE_POINT), Digits) >= f0_1(P3))
     {
      G_lots_316 = NormalizeDouble(MathPow(Lim, f0_10(OP_SELL)) * lots_0, Li_8);
      ticket = OrderSend(P3, OP_SELL, G_lots_316, NormalizeDouble(MarketInfo(P3, MODE_BID), Digits), Slip, 0, 0, Name, Magic, 0, Red);
     }
   if(f0_6(OP_BUY) > 0 && NormalizeDouble(MarketInfo(P4, MODE_ASK) + Step * MarketInfo(P4, MODE_POINT), Digits) <= f0_14(P4))
     {
      G_lots_316 = NormalizeDouble(MathPow(Lim, f0_6(OP_BUY)) * lots_0, Li_8);
      ticket = OrderSend(P4, OP_BUY, G_lots_316, NormalizeDouble(MarketInfo(P4, MODE_ASK), Digits), Slip, 0, 0, Name, Magic, 0, Green);
     }
   if(f0_6(OP_SELL) > 0 && NormalizeDouble(MarketInfo(P4, MODE_BID) - Step * MarketInfo(P4, MODE_POINT), Digits) >= f0_1(P4))
     {
      G_lots_316 = NormalizeDouble(MathPow(Lim, f0_6(OP_SELL)) * lots_0, Li_8);
      ticket = OrderSend(P4, OP_SELL, G_lots_316, NormalizeDouble(MarketInfo(P4, MODE_BID), Digits), Slip, 0, 0, Name, Magic, 0, Red);
     }
   if(f0_15(OP_BUY) > 0 && NormalizeDouble(MarketInfo(P5, MODE_ASK) + Step * MarketInfo(P5, MODE_POINT), Digits) <= f0_14(P5))
     {
      G_lots_316 = NormalizeDouble(MathPow(Lim, f0_15(OP_BUY)) * lots_0, Li_8);
      ticket = OrderSend(P5, OP_BUY, G_lots_316, NormalizeDouble(MarketInfo(P5, MODE_ASK), Digits), Slip, 0, 0, Name, Magic, 0, Green);
     }
   if(f0_15(OP_SELL) > 0 && NormalizeDouble(MarketInfo(P5, MODE_BID) - Step * MarketInfo(P5, MODE_POINT), Digits) >= f0_1(P5))
     {
      G_lots_316 = NormalizeDouble(MathPow(Lim, f0_15(OP_SELL)) * lots_0, Li_8);
      ticket = OrderSend(P5, OP_SELL, G_lots_316, NormalizeDouble(MarketInfo(P5, MODE_BID), Digits), Slip, 0, 0, Name, Magic, 0, Red);
     }
   if(f0_4(OP_BUY) > 0 && NormalizeDouble(MarketInfo(P6, MODE_ASK) + Step * MarketInfo(P6, MODE_POINT), Digits) <= f0_14(P6))
     {
      G_lots_316 = NormalizeDouble(MathPow(Lim, f0_4(OP_BUY)) * lots_0, Li_8);
      ticket = OrderSend(P6, OP_BUY, G_lots_316, NormalizeDouble(MarketInfo(P6, MODE_ASK), Digits), Slip, 0, 0, Name, Magic, 0, Green);
     }
   if(f0_4(OP_SELL) > 0 && NormalizeDouble(MarketInfo(P6, MODE_BID) - Step * MarketInfo(P6, MODE_POINT), Digits) >= f0_1(P6))
     {
      G_lots_316 = NormalizeDouble(MathPow(Lim, f0_4(OP_SELL)) * lots_0, Li_8);
      ticket = OrderSend(P6, OP_SELL, G_lots_316, NormalizeDouble(MarketInfo(P6, MODE_BID), Digits), Slip, 0, 0, Name, Magic, 0, Red);
     }
   if(f0_0(OP_BUY) > 0 && NormalizeDouble(MarketInfo(P7, MODE_ASK) + Step * MarketInfo(P7, MODE_POINT), Digits) <= f0_14(P7))
     {
      G_lots_316 = NormalizeDouble(MathPow(Lim, f0_0(OP_BUY)) * lots_0, Li_8);
      ticket = OrderSend(P7, OP_BUY, G_lots_316, NormalizeDouble(MarketInfo(P7, MODE_ASK), Digits), Slip, 0, 0, Name, Magic, 0, Green);
     }
   if(f0_0(OP_SELL) > 0 && NormalizeDouble(MarketInfo(P7, MODE_BID) - Step * MarketInfo(P7, MODE_POINT), Digits) >= f0_1(P7))
     {
      G_lots_316 = NormalizeDouble(MathPow(Lim, f0_0(OP_SELL)) * lots_0, Li_8);
      ticket = OrderSend(P7, OP_SELL, G_lots_316, NormalizeDouble(MarketInfo(P7, MODE_BID), Digits), Slip, 0, 0, Name, Magic, 0, Red);
     }
   if(f0_8(OP_BUY)   > 0) f0_13(Magic, P1);
   if(f0_8(OP_SELL)  > 0) f0_11(Magic, P1);
   if(f0_3(OP_BUY)   > 0) f0_13(Magic, P2);
   if(f0_3(OP_SELL)  > 0) f0_11(Magic, P2);
   if(f0_10(OP_BUY)  > 0) f0_13(Magic, P3);
   if(f0_10(OP_SELL) > 0) f0_11(Magic, P3);
   if(f0_6(OP_BUY)   > 0) f0_13(Magic, P4);
   if(f0_6(OP_SELL)  > 0) f0_11(Magic, P4);
   if(f0_15(OP_BUY)  > 0) f0_13(Magic, P5);
   if(f0_15(OP_SELL) > 0) f0_11(Magic, P5);
   if(f0_4(OP_BUY)   > 0) f0_13(Magic, P6);
   if(f0_4(OP_SELL)  > 0) f0_11(Magic, P6);
   if(f0_0(OP_BUY)   > 0) f0_13(Magic, P7);
   if(f0_0(OP_SELL)  > 0) f0_11(Magic, P7);
   if(Use_Modyfy && f0_8(OP_BUY)  == 0 && f0_8(OP_SELL)  == 0) f0_7(P1);
   if(Use_Modyfy && f0_3(OP_BUY)  == 0 && f0_3(OP_SELL)  == 0) f0_7(P2);
   if(Use_Modyfy && f0_10(OP_BUY) == 0 && f0_10(OP_SELL) == 0) f0_7(P3);
   if(Use_Modyfy && f0_6(OP_BUY)  == 0 && f0_6(OP_SELL)  == 0) f0_7(P4);
   if(Use_Modyfy && f0_15(OP_BUY) == 0 && f0_15(OP_SELL) == 0) f0_7(P5);
   if(Use_Modyfy && f0_4(OP_BUY)  == 0 && f0_4(OP_SELL)  == 0) f0_7(P6);
   if(Use_Modyfy && f0_0(OP_BUY)  == 0 && f0_0(OP_SELL)  == 0) f0_7(P7);
   if(Use_Limit) {
      if(f0_8(OP_BUY)   == 0 && f0_8(OP_SELL)  == 0 && f0_8(OP_BUYLIMIT)   == 0) ticket = OrderSend(P1, OP_BUYLIMIT,  lots_0, NormalizeDouble(MarketInfo(P1, MODE_ASK) - Dist * MarketInfo(P1, MODE_POINT), Digits), Slip, 0, 0, Name, Magic, 0, Green);
      if(f0_8(OP_SELL)  == 0 && f0_8(OP_BUY)   == 0 && f0_8(OP_SELLLIMIT)  == 0) ticket = OrderSend(P1, OP_SELLLIMIT, lots_0, NormalizeDouble(MarketInfo(P1, MODE_BID) + Dist * MarketInfo(P1, MODE_POINT), Digits), Slip, 0, 0, Name, Magic, 0, Red);
      if(f0_3(OP_BUY)   == 0 && f0_3(OP_SELL)  == 0 && f0_3(OP_BUYLIMIT)   == 0) ticket = OrderSend(P2, OP_BUYLIMIT,  lots_0, NormalizeDouble(MarketInfo(P2, MODE_ASK) - Dist * MarketInfo(P2, MODE_POINT), Digits), Slip, 0, 0, Name, Magic, 0, Green);
      if(f0_3(OP_SELL)  == 0 && f0_3(OP_BUY)   == 0 && f0_3(OP_SELLLIMIT)  == 0) ticket = OrderSend(P2, OP_SELLLIMIT, lots_0, NormalizeDouble(MarketInfo(P2, MODE_BID) + Dist * MarketInfo(P2, MODE_POINT), Digits), Slip, 0, 0, Name, Magic, 0, Red);
      if(f0_10(OP_BUY)  == 0 && f0_10(OP_SELL) == 0 && f0_10(OP_BUYLIMIT)  == 0) ticket = OrderSend(P3, OP_BUYLIMIT,  lots_0, NormalizeDouble(MarketInfo(P3, MODE_ASK) - Dist * MarketInfo(P3, MODE_POINT), Digits), Slip, 0, 0, Name, Magic, 0, Green);
      if(f0_10(OP_SELL) == 0 && f0_10(OP_BUY)  == 0 && f0_10(OP_SELLLIMIT) == 0) ticket = OrderSend(P3, OP_SELLLIMIT, lots_0, NormalizeDouble(MarketInfo(P3, MODE_BID) + Dist * MarketInfo(P3, MODE_POINT), Digits), Slip, 0, 0, Name, Magic, 0, Red);
      if(f0_6(OP_BUY)   == 0 && f0_6(OP_SELL)  == 0 && f0_6(OP_BUYLIMIT)   == 0) ticket = OrderSend(P4, OP_BUYLIMIT,  lots_0, NormalizeDouble(MarketInfo(P4, MODE_ASK) - Dist * MarketInfo(P4, MODE_POINT), Digits), Slip, 0, 0, Name, Magic, 0, Green);
      if(f0_6(OP_SELL)  == 0 && f0_6(OP_BUY)   == 0 && f0_6(OP_SELLLIMIT)  == 0) ticket = OrderSend(P4, OP_SELLLIMIT, lots_0, NormalizeDouble(MarketInfo(P4, MODE_BID) + Dist * MarketInfo(P4, MODE_POINT), Digits), Slip, 0, 0, Name, Magic, 0, Red);
      if(f0_15(OP_BUY)  == 0 && f0_15(OP_SELL) == 0 && f0_15(OP_BUYLIMIT)  == 0) ticket = OrderSend(P5, OP_BUYLIMIT,  lots_0, NormalizeDouble(MarketInfo(P5, MODE_ASK) - Dist * MarketInfo(P5, MODE_POINT), Digits), Slip, 0, 0, Name, Magic, 0, Green);
      if(f0_15(OP_SELL) == 0 && f0_15(OP_BUY)  == 0 && f0_15(OP_SELLLIMIT) == 0) ticket = OrderSend(P5, OP_SELLLIMIT, lots_0, NormalizeDouble(MarketInfo(P5, MODE_BID) + Dist * MarketInfo(P5, MODE_POINT), Digits), Slip, 0, 0, Name, Magic, 0, Red);
      if(f0_4(OP_BUY)   == 0 && f0_4(OP_SELL)  == 0 && f0_4(OP_BUYLIMIT)   == 0) ticket = OrderSend(P6, OP_BUYLIMIT,  lots_0, NormalizeDouble(MarketInfo(P6, MODE_ASK) - Dist * MarketInfo(P6, MODE_POINT), Digits), Slip, 0, 0, Name, Magic, 0, Green);
      if(f0_4(OP_SELL)  == 0 && f0_4(OP_BUY)   == 0 && f0_4(OP_SELLLIMIT)  == 0) ticket = OrderSend(P6, OP_SELLLIMIT, lots_0, NormalizeDouble(MarketInfo(P6, MODE_BID) + Dist * MarketInfo(P6, MODE_POINT), Digits), Slip, 0, 0, Name, Magic, 0, Red);
      if(f0_0(OP_BUY)   == 0 && f0_0(OP_SELL)  == 0 && f0_0(OP_BUYLIMIT)   == 0) ticket = OrderSend(P7, OP_BUYLIMIT,  lots_0, NormalizeDouble(MarketInfo(P7, MODE_ASK) - Dist * MarketInfo(P7, MODE_POINT), Digits), Slip, 0, 0, Name, Magic, 0, Green);
      if(f0_0(OP_SELL)  == 0 && f0_0(OP_BUY)   == 0 && f0_0(OP_SELLLIMIT)  == 0) ticket = OrderSend(P7, OP_SELLLIMIT, lots_0, NormalizeDouble(MarketInfo(P7, MODE_BID) + Dist * MarketInfo(P7, MODE_POINT), Digits), Slip, 0, 0, Name, Magic, 0, Red);
   }
   if(Use_Stop)
     {
      if(f0_8(OP_BUY)   == 0 && f0_8(OP_SELL)  == 0 && f0_8(OP_BUYSTOP)   == 0) ticket = OrderSend(P1, OP_BUYSTOP,  lots_0, NormalizeDouble(MarketInfo(P1, MODE_BID) + Dist * MarketInfo(P1, MODE_POINT), Digits), Slip, 0, 0, Name, Magic, 0, Green);
      if(f0_8(OP_SELL)  == 0 && f0_8(OP_BUY)   == 0 && f0_8(OP_SELLSTOP)  == 0) ticket = OrderSend(P1, OP_SELLSTOP, lots_0, NormalizeDouble(MarketInfo(P1, MODE_ASK) - Dist * MarketInfo(P1, MODE_POINT), Digits), Slip, 0, 0, Name, Magic, 0, Red);
      if(f0_3(OP_BUY)   == 0 && f0_3(OP_SELL)  == 0 && f0_3(OP_BUYSTOP)   == 0) ticket = OrderSend(P2, OP_BUYSTOP,  lots_0, NormalizeDouble(MarketInfo(P2, MODE_BID) + Dist * MarketInfo(P2, MODE_POINT), Digits), Slip, 0, 0, Name, Magic, 0, Green);
      if(f0_3(OP_SELL)  == 0 && f0_3(OP_BUY)   == 0 && f0_3(OP_SELLSTOP)  == 0) ticket = OrderSend(P2, OP_SELLSTOP, lots_0, NormalizeDouble(MarketInfo(P2, MODE_ASK) - Dist * MarketInfo(P2, MODE_POINT), Digits), Slip, 0, 0, Name, Magic, 0, Red);
      if(f0_10(OP_BUY)  == 0 && f0_10(OP_SELL) == 0 && f0_10(OP_BUYSTOP)  == 0) ticket = OrderSend(P3, OP_BUYSTOP,  lots_0, NormalizeDouble(MarketInfo(P3, MODE_BID) + Dist * MarketInfo(P3, MODE_POINT), Digits), Slip, 0, 0, Name, Magic, 0, Green);
      if(f0_10(OP_SELL) == 0 && f0_10(OP_BUY)  == 0 && f0_10(OP_SELLSTOP) == 0) ticket = OrderSend(P3, OP_SELLSTOP, lots_0, NormalizeDouble(MarketInfo(P3, MODE_ASK) - Dist * MarketInfo(P3, MODE_POINT), Digits), Slip, 0, 0, Name, Magic, 0, Red);
      if(f0_6(OP_BUY)   == 0 && f0_6(OP_SELL)  == 0 && f0_6(OP_BUYSTOP)   == 0) ticket = OrderSend(P4, OP_BUYSTOP,  lots_0, NormalizeDouble(MarketInfo(P4, MODE_BID) + Dist * MarketInfo(P4, MODE_POINT), Digits), Slip, 0, 0, Name, Magic, 0, Green);
      if(f0_6(OP_SELL)  == 0 && f0_6(OP_BUY)   == 0 && f0_6(OP_SELLSTOP)  == 0) ticket = OrderSend(P4, OP_SELLSTOP, lots_0, NormalizeDouble(MarketInfo(P4, MODE_ASK) - Dist * MarketInfo(P4, MODE_POINT), Digits), Slip, 0, 0, Name, Magic, 0, Red);
      if(f0_15(OP_BUY)  == 0 && f0_15(OP_SELL) == 0 && f0_15(OP_BUYSTOP)  == 0) ticket = OrderSend(P5, OP_BUYSTOP,  lots_0, NormalizeDouble(MarketInfo(P5, MODE_BID) + Dist * MarketInfo(P5, MODE_POINT), Digits), Slip, 0, 0, Name, Magic, 0, Green);
      if(f0_15(OP_SELL) == 0 && f0_15(OP_BUY)  == 0 && f0_15(OP_SELLSTOP) == 0) ticket = OrderSend(P5, OP_SELLSTOP, lots_0, NormalizeDouble(MarketInfo(P5, MODE_ASK) - Dist * MarketInfo(P5, MODE_POINT), Digits), Slip, 0, 0, Name, Magic, 0, Red);
      if(f0_4(OP_BUY)   == 0 && f0_4(OP_SELL)  == 0 && f0_4(OP_BUYSTOP)   == 0) ticket = OrderSend(P6, OP_BUYSTOP,  lots_0, NormalizeDouble(MarketInfo(P6, MODE_BID) + Dist * MarketInfo(P6, MODE_POINT), Digits), Slip, 0, 0, Name, Magic, 0, Green);
      if(f0_4(OP_SELL)  == 0 && f0_4(OP_BUY)   == 0 && f0_4(OP_SELLSTOP)  == 0) ticket = OrderSend(P6, OP_SELLSTOP, lots_0, NormalizeDouble(MarketInfo(P6, MODE_ASK) - Dist * MarketInfo(P6, MODE_POINT), Digits), Slip, 0, 0, Name, Magic, 0, Red);
      if(f0_0(OP_BUY)   == 0 && f0_0(OP_SELL)  == 0 && f0_0(OP_BUYSTOP)   == 0) ticket = OrderSend(P7, OP_BUYSTOP,  lots_0, NormalizeDouble(MarketInfo(P7, MODE_BID) + Dist * MarketInfo(P7, MODE_POINT), Digits), Slip, 0, 0, Name, Magic, 0, Green);
      if(f0_0(OP_SELL)  == 0 && f0_0(OP_BUY)   == 0 && f0_0(OP_SELLSTOP)  == 0) ticket = OrderSend(P7, OP_SELLSTOP, lots_0, NormalizeDouble(MarketInfo(P7, MODE_ASK) - Dist * MarketInfo(P7, MODE_POINT), Digits), Slip, 0, 0, Name, Magic, 0, Red);
     }
  }

void f0_12(int A_magic_0, string A_symbol_4)
  {
   double bid_12;
   double ask_20;
   double point_28;
   if(Tral != 0)
     {
      for(int pos_36 = 0; pos_36 < OrdersTotal(); pos_36++)
        {
         if(OrderSelect(pos_36, SELECT_BY_POS) && OrderSymbol() == A_symbol_4 && OrderMagicNumber() == A_magic_0)
           {
            point_28 = MarketInfo(OrderSymbol(), MODE_POINT);
            if(OrderType() == OP_BUY)
              {
               bid_12 = MarketInfo(OrderSymbol(), MODE_BID);
               if(bid_12 > MathMax(OrderOpenPrice(), OrderStopLoss()) + (Tral + TralStep) * point_28) modtic = OrderModify(OrderTicket(), OrderOpenPrice(), bid_12 - Tral * point_28, OrderTakeProfit(), 0);
              }
            if(OrderType() == OP_SELL)
              {
               ask_20 = MarketInfo(OrderSymbol(), MODE_ASK);
               if((ask_20 < MathMin(OrderOpenPrice(), OrderStopLoss()) - (Tral + TralStep) * point_28 && OrderStopLoss() != 0.0) || (ask_20 < OrderOpenPrice() - (Tral + TralStep) * point_28 &&
                  OrderStopLoss() == 0.0)) modtic = OrderModify(OrderTicket(), OrderOpenPrice(), ask_20 + Tral * point_28, OrderTakeProfit(), 0);
              }
           }
        }
     }
  }

int f0_8(int A_cmd_0)
  {
   int count_4 = 0;
   for(int pos_8 = OrdersTotal() - 1; pos_8 >= 0; pos_8--)
     {
      if(OrderSelect(pos_8, SELECT_BY_POS, MODE_TRADES)) if(P1 == OrderSymbol() && OrderMagicNumber() == Magic && (A_cmd_0 == -1 || OrderType() == A_cmd_0)) count_4++;
     }
   return (count_4);
  }

int f0_3(int A_cmd_0)
  {
   int count_4 = 0;
   for(int pos_8 = OrdersTotal() - 1; pos_8 >= 0; pos_8--)
     {
      if(OrderSelect(pos_8, SELECT_BY_POS, MODE_TRADES)) if(P2 == OrderSymbol() && OrderMagicNumber() == Magic && (A_cmd_0 == -1 || OrderType() == A_cmd_0)) count_4++;
     }
   return (count_4);
  }

int f0_10(int A_cmd_0)
  {
   int count_4 = 0;
   for(int pos_8 = OrdersTotal() - 1; pos_8 >= 0; pos_8--)
     {
      if(OrderSelect(pos_8, SELECT_BY_POS, MODE_TRADES)) if(P3 == OrderSymbol() && OrderMagicNumber() == Magic && (A_cmd_0 == -1 || OrderType() == A_cmd_0)) count_4++;
     }
   return (count_4);
  }

int f0_6(int A_cmd_0)
  {
   int count_4 = 0;
   for(int pos_8 = OrdersTotal() - 1; pos_8 >= 0; pos_8--)
     {
      if(OrderSelect(pos_8, SELECT_BY_POS, MODE_TRADES)) if(P4 == OrderSymbol() && OrderMagicNumber() == Magic && (A_cmd_0 == -1 || OrderType() == A_cmd_0)) count_4++;
     }
   return (count_4);
  }

int f0_15(int A_cmd_0)
  {
   int count_4 = 0;
   for(int pos_8 = OrdersTotal() - 1; pos_8 >= 0; pos_8--)
     {
      if(OrderSelect(pos_8, SELECT_BY_POS, MODE_TRADES)) if(P5 == OrderSymbol() && OrderMagicNumber() == Magic && (A_cmd_0 == -1 || OrderType() == A_cmd_0)) count_4++;
     }
   return (count_4);
  }

int f0_4(int A_cmd_0)
  {
   int count_4 = 0;
   for(int pos_8 = OrdersTotal() - 1; pos_8 >= 0; pos_8--)
     {
      if(OrderSelect(pos_8, SELECT_BY_POS, MODE_TRADES)) if(P6 == OrderSymbol() && OrderMagicNumber() == Magic && (A_cmd_0 == -1 || OrderType() == A_cmd_0)) count_4++;        
     }
   return (count_4);
  }

int f0_0(int A_cmd_0)
  {
   int count_4 = 0;
   for(int pos_8 = OrdersTotal() - 1; pos_8 >= 0; pos_8--)
     {
      if(OrderSelect(pos_8, SELECT_BY_POS, MODE_TRADES)) if(P7 == OrderSymbol() && OrderMagicNumber() == Magic && (A_cmd_0 == -1 || OrderType() == A_cmd_0)) count_4++;
     }
   return (count_4);
  }

double f0_14(string A_symbol_0)
  {
   double order_open_price_8 = 0.0;
   int ticket_16;
   double Ld_unused_20 = 0;
   int ticket_28 = 0;
   for(int pos_32 = OrdersTotal() - 1; pos_32 >= 0; pos_32--)
     {
      if(OrderSelect(pos_32, SELECT_BY_POS, MODE_TRADES))
        {
         if(OrderSymbol() == A_symbol_0 && OrderMagicNumber() == Magic && OrderType() == OP_BUY)
           {
            ticket_16 = OrderTicket();
            if(ticket_16 > ticket_28)
              {
               ticket_28 = ticket_16;
               order_open_price_8 = OrderOpenPrice();
               Ld_unused_20 = order_open_price_8;
              }
           }
        }
     }
   return (order_open_price_8);
  }

double f0_1(string A_symbol_0)
  {
   double order_open_price_8 = 0.0;
   int ticket_16;
   double Ld_unused_20 = 0;
   int ticket_28 = 0;
   for(int pos_32 = OrdersTotal() - 1; pos_32 >= 0; pos_32--)
     {
      if(OrderSelect(pos_32, SELECT_BY_POS, MODE_TRADES))
        {
         if(OrderSymbol() == A_symbol_0 && OrderMagicNumber() == Magic && OrderType() == OP_SELL)
           {
            ticket_16 = OrderTicket();
            if(ticket_16 > ticket_28)
              {
               ticket_28 = ticket_16;
               order_open_price_8 = OrderOpenPrice();
               Ld_unused_20 = order_open_price_8;
              }
           }
        }
     }
   return (order_open_price_8);
  }

double f0_2(int A_cmd_0)
  {
   double Ld_ret_4 = 0;
   for(int pos_12 = OrdersTotal() - 1; pos_12 >= 0; pos_12--)
     {
      if(OrderSelect(pos_12, SELECT_BY_POS, MODE_TRADES)) if(OrderMagicNumber() == Magic && (OrderType() == A_cmd_0 || A_cmd_0 == -1)) Ld_ret_4 += OrderProfit() + OrderSwap() + OrderCommission();
     }
   return (Ld_ret_4);
  }

void f0_9(int Ai_unused_0, int Ai_unused_4)
  {
   double price_8;
   double price_16;
   for(int pos_24 = OrdersTotal() - 1; pos_24 >= 0; pos_24--)
     {
      if(OrderSelect(pos_24, SELECT_BY_POS, MODE_TRADES) && OrderMagicNumber() == Magic)
        {
         if(OrderType() == OP_BUY)
           {
            price_8 = NormalizeDouble(MarketInfo(OrderSymbol(), MODE_BID), Digits);
            closetic = OrderClose(OrderTicket(), OrderLots(), price_8, Slip, Black);
           }
         if(OrderType() == OP_SELL)
           {
            price_16 = NormalizeDouble(MarketInfo(OrderSymbol(), MODE_ASK), Digits);
            closetic = OrderClose(OrderTicket(), OrderLots(), price_16, Slip, Black);
           }
         if(OrderType() == -1) deltic = OrderDelete(OrderTicket());
        }
     }
  }

void f0_5()
  {
   int Li_4 = 0;
   int ticket_12 = 0;
   double Ld_32;
   double Ld_40 = 0;
   double Lda_48[][2];
   string symbol_52;
   double Ld_16 = 0;
   double Ld_unused_24 = 0;
   int pos_0;
   ArrayResize(Lda_48, 0);
   for(pos_0 = OrdersTotal() - 1; pos_0 >= 0; pos_0--)
     {
      if(OrderSelect(pos_0, SELECT_BY_POS, MODE_TRADES))
        {
         if(OrderType() == OP_SELL || OrderType() == OP_BUY)
           {
            Ld_32 = NormalizeDouble(OrderProfit() + OrderSwap() + OrderCommission(), 2);
            if(Ld_16 > Ld_32)
              {
               Ld_16 = Ld_32;
               ticket_12 = OrderTicket();
               symbol_52 = OrderSymbol();
              }
            if(Ld_32 > 0.0)
              {
               Li_4++;
               ArrayResize(Lda_48, Li_4);
               Lda_48[Li_4 - 1][0] = Ld_32;
               Lda_48[Li_4 - 1][1] = OrderTicket();
              }
           }
        }
     }
   if(ArrayRange(Lda_48,0) > 0) ArraySort(Lda_48, WHOLE_ARRAY, 0, MODE_DESCEND);
   for(pos_0 = 1; pos_0 < Level; pos_0++) Ld_40 += Lda_48[pos_0][0];
   if(Ld_16 < 0.0 && Ld_40 + Ld_16 >= Gd_308)
     {
      for(pos_0 = 0; pos_0 < Level; pos_0++)
        {
         if(OrderSelect((int)Lda_48[pos_0][1], SELECT_BY_TICKET, MODE_TRADES))
           {
            if(OrderType() == OP_BUY)  closetic = OrderClose(OrderTicket(), OrderLots(), MarketInfo(OrderSymbol(), MODE_BID), Slip, CLR_NONE);
            if(OrderType() == OP_SELL) closetic = OrderClose(OrderTicket(), OrderLots(), MarketInfo(OrderSymbol(), MODE_ASK), Slip, CLR_NONE);
           }
        }
      if(OrderSelect(ticket_12, SELECT_BY_TICKET, MODE_TRADES))
        {
         if(OrderType() == OP_BUY)  closetic = OrderClose(ticket_12, OrderLots(), MarketInfo(OrderSymbol(), MODE_BID), Slip, CLR_NONE);
         if(OrderType() == OP_SELL) closetic = OrderClose(ticket_12, OrderLots(), MarketInfo(OrderSymbol(), MODE_ASK), Slip, CLR_NONE);
        }
     }
  }

void f0_13(int Ai_unused_0, string A_symbol_4)
  {
   for(int pos_12 = OrdersTotal() - 1; pos_12 >= 0; pos_12--)
     {
      if(OrderSelect(pos_12, SELECT_BY_POS, MODE_TRADES) && OrderSymbol() == A_symbol_4 && OrderMagicNumber() == Magic)
        {
         if(OrderType() == OP_SELLLIMIT) deltic = OrderDelete(OrderTicket());
         if(OrderType() == OP_SELLSTOP)  deltic = OrderDelete(OrderTicket());
        }
     }
  }

void f0_11(int Ai_unused_0, string A_symbol_4)
  {
   for(int pos_12 = OrdersTotal() - 1; pos_12 >= 0; pos_12--)
     {
      if(OrderSelect(pos_12, SELECT_BY_POS, MODE_TRADES) && OrderSymbol() == A_symbol_4 && OrderMagicNumber() == Magic)
        {
         if(OrderType() == OP_BUYLIMIT) deltic = OrderDelete(OrderTicket());
         if(OrderType() == OP_BUYSTOP)  deltic = OrderDelete(OrderTicket());
        }
     }
  }

void f0_7(string A_symbol_0)
  {
   for(int pos_8 = OrdersTotal() - 1; pos_8 >= 0; pos_8--)
     {
      if(OrderSelect(pos_8, SELECT_BY_POS, MODE_TRADES))
        {
         if(OrderSymbol() == A_symbol_0 && OrderMagicNumber() == Magic)
           {
            if(OrderType() == OP_BUYLIMIT && G_datetime_288 + 60 * Modify < TimeCurrent())
              {
               modtic = OrderModify(OrderTicket(), NormalizeDouble(MarketInfo(A_symbol_0, MODE_ASK) - Dist * MarketInfo(A_symbol_0, MODE_POINT), Digits), 0, 0, 0, Black);
               G_datetime_288 = (int)TimeCurrent();
              }
            if(OrderType() == OP_SELLLIMIT && G_datetime_292 + 60 * Modify < TimeCurrent())
              {
               modtic = OrderModify(OrderTicket(), NormalizeDouble(MarketInfo(A_symbol_0, MODE_BID) + Dist * MarketInfo(A_symbol_0, MODE_POINT), Digits), 0, 0, 0, Black);
               G_datetime_292 = (int)TimeCurrent();
              }
            if(OrderType() == OP_SELLSTOP && G_datetime_300 + 60 * Modify < TimeCurrent())
              {
               modtic = OrderModify(OrderTicket(), NormalizeDouble(MarketInfo(A_symbol_0, MODE_ASK) - Dist * MarketInfo(A_symbol_0, MODE_POINT), Digits), 0, 0, 0, Black);
               G_datetime_300 = (int)TimeCurrent();
              }
            if(OrderType() == OP_BUYSTOP && G_datetime_296 + 60 * Modify < TimeCurrent())
              {
               modtic = OrderModify(OrderTicket(), NormalizeDouble(MarketInfo(A_symbol_0, MODE_BID) + Dist * MarketInfo(A_symbol_0, MODE_POINT), Digits), 0, 0, 0, Black);
               G_datetime_296 = (int)TimeCurrent();
              }
           }
        }
     }
  }
