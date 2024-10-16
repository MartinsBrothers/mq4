/*
   Generated by EX4-TO-MQ4 decompiler V4.0.224.1 []
   Website: http://purebeam.biz
   E-mail : purebeam@gmail.com
*/
#property copyright "Copyright � 2008-2009, Eracash.com."
#property link      "http://www.eracash.com"

extern double lTakeProfit = 31.0;
extern double sTakeProfit = 35.0;
extern double lTrailingStop = 22.0;
extern double sTrailingStop = 19.0;
extern color clOpenBuy = Blue;
extern color clCloseBuy = Aqua;
extern color clOpenSell = Red;
extern color clCloseSell = Violet;
extern color clModiBuy = Blue;
extern color clModiSell = Red;
extern string Name_Expert = "Robot Forex 2009 Profesional";
extern int Slippage = 2;
extern bool UseSound = FALSE;
extern string NameFileSound = "alert.wav";
extern double Lots = 1.0;

int init() {
   if (IsTesting() == TRUE) Display_Info();
   if (IsTesting() == FALSE) Display_Info();
   return (0);
}

int deinit() {
   return (0);
}

int start() {
   bool l_bool_0 = IsDemo();
   if (!l_bool_0) {
      Alert("You can not use the program with a real account!");
      return (0);
   }
   if (Bars < 100) {
      Print("bars less than 100");
      return (0);
   }
   if (lTakeProfit < 10.0) {
      Print("TakeProfit less than 10");
      return (0);
   }
   if (sTakeProfit < 10.0) {
      Print("TakeProfit less than 10");
      return (0);
   }
   double l_iclose_4 = iClose(NULL, PERIOD_M5, 0);
   double l_ima_12 = iMA(NULL, PERIOD_M5, 7, 0, MODE_SMA, PRICE_OPEN, 0);
   double l_iclose_20 = iClose(NULL, PERIOD_M5, 0);
   double l_ima_28 = iMA(NULL, PERIOD_M5, 6, 0, MODE_SMA, PRICE_OPEN, 0);
   if (AccountFreeMargin() < 1000.0 * Lots) {
      Print("We have no money. Free Margin = ", AccountFreeMargin());
      return (0);
   }
   if (!ExistPositions()) {
      if (l_iclose_4 < l_ima_12) {
         OpenBuy();
         return (0);
      }
      if (l_iclose_20 > l_ima_28) {
         OpenSell();
         return (0);
      }
   }
   TrailingPositionsBuy(lTrailingStop);
   TrailingPositionsSell(sTrailingStop);
   return (0);
}

bool ExistPositions() {
   for (int l_pos_0 = 0; l_pos_0 < OrdersTotal(); l_pos_0++) {
      if (OrderSelect(l_pos_0, SELECT_BY_POS, MODE_TRADES))
         if (OrderSymbol() == Symbol()) return (TRUE);
   }
   return (FALSE);
}

void TrailingPositionsBuy(int ai_0) {
   for (int l_pos_4 = 0; l_pos_4 < OrdersTotal(); l_pos_4++) {
      if (OrderSelect(l_pos_4, SELECT_BY_POS, MODE_TRADES)) {
         if (OrderSymbol() == Symbol()) {
            if (OrderType() == OP_BUY) {
               if (Bid - OrderOpenPrice() > ai_0 * Point)
                  if (OrderStopLoss() < Bid - ai_0 * Point) ModifyStopLoss(Bid - ai_0 * Point);
            }
         }
      }
   }
}

void TrailingPositionsSell(int ai_0) {
   for (int l_pos_4 = 0; l_pos_4 < OrdersTotal(); l_pos_4++) {
      if (OrderSelect(l_pos_4, SELECT_BY_POS, MODE_TRADES)) {
         if (OrderSymbol() == Symbol()) {
            if (OrderType() == OP_SELL) {
               if (OrderOpenPrice() - Ask > ai_0 * Point)
                  if (OrderStopLoss() > Ask + ai_0 * Point || OrderStopLoss() == 0.0) ModifyStopLoss(Ask + ai_0 * Point);
            }
         }
      }
   }
}

void ModifyStopLoss(double a_price_0) {
   int l_bool_8 = OrderModify(OrderTicket(), OrderOpenPrice(), a_price_0, OrderTakeProfit(), 0, CLR_NONE);
   if (l_bool_8 && UseSound) PlaySound(NameFileSound);
}

void OpenBuy() {
   double l_lots_0 = GetSizeLot();
   double l_price_8 = 0;
   double l_price_16 = GetTakeProfitBuy();
   string l_comment_24 = GetCommentForOrder();
   OrderSend(Symbol(), OP_BUY, l_lots_0, Ask, Slippage, l_price_8, l_price_16, l_comment_24, 0, 0, clOpenBuy);
   if (UseSound) PlaySound(NameFileSound);
}

void OpenSell() {
   double l_lots_0 = GetSizeLot();
   double l_price_8 = 0;
   double l_price_16 = GetTakeProfitSell();
   string l_comment_24 = GetCommentForOrder();
   OrderSend(Symbol(), OP_SELL, l_lots_0, Bid, Slippage, l_price_8, l_price_16, l_comment_24, 0, 0, clOpenSell);
   if (UseSound) PlaySound(NameFileSound);
}

string GetCommentForOrder() {
   return (Name_Expert);
}

double GetSizeLot() {
   return (Lots);
}

double GetTakeProfitBuy() {
   return (Ask + lTakeProfit * Point);
}

double GetTakeProfitSell() {
   return (Bid - sTakeProfit * Point);
}

void Display_Info() {
   Comment("Robot Forex 2009 Profesional Demo\n", "Copyright � 2009, Eracash.com\n", "Visit: www.eracash.com\n", "This system not for sale or Share\n", "Forex Account Server:", AccountServer(), 
      "\n", "Lots:  ", Lots, 
      "\n", "Symbol: ", Symbol(), 
      "\n", "Price:  ", NormalizeDouble(Bid, 4), 
      "\n", "Date: ", Month(), "-", Day(), "-", Year(), " Server Time: ", Hour(), ":", Minute(), ":", Seconds(), 
   "\n");
}
