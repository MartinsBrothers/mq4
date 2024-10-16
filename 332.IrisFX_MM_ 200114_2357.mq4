//+------------------------------------------------------------------+
//|                                             Irix 200114_2357.mq4 |
//|                        Copyright 2014, MetaQuotes Software Corp. |
//|                                        http://www.metaquotes.net |
//+------------------------------------------------------------------+
#property copyright "Copyright 2014, MetaQuotes Software Corp."
#property link      "http://www.metaquotes.net"

#import "IrisFx.dll"
   int InitDll(int a0);
   double Proc1(int a0, int a1, double a2, double a3, int a4, int a5, double a6, double a7, double a8, double a9);
   double Proc2(int a0, int a1, double a2, double a3, int a4, int a5, double a6, double a7, double a8, double a9);
   double Proc3(double a0, double a1, int a2, int a3, double a4, int a5, int a6, int a7, int a8, int a9, double a10, double a11, double a12, double a13);
   double Proc4(double a0, double a1, int a2, int a3, double a4, int a5, int a6, int a7, int a8, int a9, double a10, double a11, double a12, double a13);
#import

extern string Strategy1 = "EURUSD_H1";
extern string Strategy2 = "EURUSD_H1";
extern string Strategy3 = "EURUSD_H4";
extern int strategy = 1;
extern double lotpercent = 10.0;
extern double lotfixed = 0.01;
extern bool showorders = TRUE;
bool bool124 = FALSE;
datetime time128;
double ihigh132;
double ilow140;
double price148;
double price156;
double price164;
double price172;
double price180;
double price188;
double ticksize196;
double d204;
double lots212;
double lots220;
double marginrequired228;
double tickvalue236;
double d244;
double d252;
double d260;
double d268;
int spread276;
int i280;
int i284;
int iunused288;
int i292;
int iunused296;
double ihigh300;
double ilow308;
int datetime316;
int datetime320;
int i324;
int i328;
bool i332 = TRUE;
bool i336 = FALSE;
double d340;
int datetime348;
bool i352 = TRUE;
bool i356 = TRUE;
bool i360 = TRUE;
bool i364 = TRUE;
bool i368 = TRUE;
bool i372 = TRUE;
bool i376 = TRUE;
int ticket380;
int ticket384;
double ordopenprice388;
double ordopenprice396;
double bid404;
datetime time412;
double iao416;
double iao424;
double ialligator432;
double ialligator440;
double ialligator448;
double price456;
double price464;
double price472;
double price480;
double price488;
double price496;
double ticksize504;
double d512;
double lots520;
double lots528;
double marginrequired536;
double tickvalue544;
double high552;
double low560;
double high568;
double low576;
int spread584;
int i588;
int i592;
int iunused596;
int i600;
int iunused604;
int i608;
int i612;
int i616;
int i620;
datetime time624;
datetime time628;
bool i632 = TRUE;
bool i636 = FALSE;
double d640;
int datetime648;
bool i652 = TRUE;
bool i656 = TRUE;
bool i660 = TRUE;
bool i664 = TRUE;
bool i668 = TRUE;
int ticket672;
int ticket676;
datetime time680;
double iao684;
double iao692;
double ialligator700;
double ialligator708;
double ialligator716;
double price724;
double price732;
double price740;
double price748;
double price756;
double price764;
double ticksize772;
double d780;
double lots788;
double lots796;
double marginrequired804;
double tickvalue812;
double high820;
double low828;
double high836;
double low844;
int spread852;
int i856;
int i860;
int iunused864;
int i868;
int iunused872;
int i876;
int i880;
int i884;
int i888;
datetime time892;
datetime time896;
bool i900 = TRUE;
bool i904 = FALSE;
double d908;
int datetime916;
bool i920 = TRUE;
bool i924 = TRUE;
bool i928 = TRUE;
bool i932 = TRUE;
bool i936 = TRUE;
int ticket940;
int ticket944;
int LotDecimal = 1;

int init() {
   bool124 = InitDll(WindowHandle(Symbol(), Period())) == 1;
   //if (!gbool124) Alert("IrisFx can\'t run on this account#");
   if (MarketInfo(Symbol(),MODE_MINLOT)<0.1) LotDecimal=2;
   else if (MarketInfo(Symbol(),MODE_MINLOT)>=1.0) LotDecimal=0;
   return (0);
}

int start() {
   //if (!gbool124) return (0);
   if (strategy > 3 || strategy <= 0) Alert("Strategy should be = either 1, 2 or 3");
   if (strategy == 1) {
      func1();
      return/*(WARN)*/;
   }
   if (strategy == 2) {
      func2();
      return/*(WARN)*/;
   }
   if (strategy == 3) {
      func3();
      return/*(WARN)*/;
   }
}

void func1() {
   int li184;
   int li188;
   double lprice252;
   double lprice260;
   double ld_0 = lotpercent / 10000.0;
   double ld_8 = lotfixed;
   double ld_16 = 12;
   double ld_24 = 20;
   double ld_32 = 75;
   bool li40 = TRUE;
   bool li44 = TRUE;
   bool li48 = TRUE;
   bool li52 = FALSE;
   bool li56 = FALSE;
   int li60 = 75;
   bool li64 = TRUE;
   int li68 = 45;
   bool li72 = TRUE;
   bool li76 = TRUE;
   bool li80 = TRUE;
   bool li84 = FALSE;
   int li88 = 20;
   int li92 = 180;
   double ld_96 = 1;
   double l_pips_104 = 1;
   int li112 = 2;
   int li116 = 0;
   int li120 = 0;
   bool li124 = FALSE;
   bool li128 = true;
   bool li132 = FALSE;
   int l_magic_136 = 777;
   int li140 = 1;
   if (ld_16 < 1.0 || ld_32 < 1.0) {
      Print("stop level below the requested soluble");
      return;
   }
   bool li144 = FALSE;
   if (time128 == 0) time128 = Time[0];
   if (time128 != Time[0]) {
      li144 = TRUE;
      time128 = Time[0];
   }
   ihigh300 = iHigh(NULL, PERIOD_D1, 1);
   ilow308 = iLow(NULL, PERIOD_D1, 1);
   if (DayOfWeek() == 1) {
      if (li144) Print("Today is Monday");
      for (int li148 = 1; li148 < 7; li148++) {
         if (TimeDayOfWeek(iTime(NULL, PERIOD_D1, li148)) == 5) {
            ihigh300 = iHigh(NULL, PERIOD_D1, li148);
            ilow308 = iLow(NULL, PERIOD_D1, li148);
            if (!(li144)) break;
            Print("Maximum price on Friday is ", DoubleToStr(ihigh300, Digits));
            Print("Minimum price on Friday is ", DoubleToStr(ilow308, Digits));
            break;
         }
      }
   }
   bool li152 = TRUE;
   bool li156 = TRUE;
   ihigh132 = iHigh(NULL, PERIOD_D1, 0);
   ilow140 = iLow(NULL, PERIOD_D1, 0);
   if (ihigh132 - ihigh300 >= li88 * Point || ihigh132 < ihigh300 || li84 == FALSE) li152 = FALSE;
   if (ilow308 - ilow140 >= li88 * Point || ilow140 > ilow308 || li84 == FALSE) li156 = FALSE;
   int l_stoplevel_160 = MarketInfo(Symbol(), MODE_STOPLEVEL);
   if (l_stoplevel_160 < 20 && Digits == 5) l_stoplevel_160 = 20;
   if (l_stoplevel_160 < 2 && Digits == 4) l_stoplevel_160 = 2;
   if (li152 || li156 || li144 || ihigh132 == 0.0 || ilow140 == 0.0 || lots212 == 0.0 || lots220 == 0.0 || price148 == 0.0 || price156 == 0.0 || price164 == 0.0 ||
      price172 == 0.0 || price180 == 0.0 || price188 == 0.0 || ticksize196 == 0.0 || d204 == 0.0) {
      spread276 = MarketInfo(Symbol(), MODE_SPREAD);
      if (li128) Print("spread = ", spread276, " ", Symbol());
      ticksize196 = MarketInfo(Symbol(), MODE_TICKSIZE);
      tickvalue236 = MarketInfo(Symbol(), MODE_TICKVALUE);
      marginrequired228 = MarketInfo(Symbol(), MODE_MARGINREQUIRED);
      if (Digits == 5) {
         d204 = 10.0 * ticksize196;
         i280 = 4;
      } else d204 = ticksize196;
      for (int li164 = 3; li164 < 100; li164++) {
         if (High[li164] >= High[li164 + 1] && High[li164] > High[li164 + 2] && High[li164] >= High[li164 - 1] && High[li164] > High[li164 - 2]) {
            d244 = NormalizeDouble(High[li164], Digits);
            i284 = li164;
            break;
         }
      }
      for (li164 = i284 + 1; li164 < 100; li164++) {
         if (High[li164] >= High[li164 + 1] && High[li164] > High[li164 + 2] && High[li164] >= High[li164 - 1] && High[li164] > High[li164 - 2]) {
            d260 = NormalizeDouble(High[li164], Digits);
            iunused288 = li164;
            break;
         }
      }
      for (li164 = 3; li164 < 100; li164++) {
         if (Low[li164] <= Low[li164 + 1] && Low[li164] < Low[li164 + 2] && Low[li164] <= Low[li164 - 1] && Low[li164] < Low[li164 - 2]) {
            d252 = NormalizeDouble(Low[li164], Digits);
            i292 = li164;
            break;
         }
      }
      for (li164 = i292 + 1; li164 < 100; li164++) {
         if (Low[li164] <= Low[li164 + 1] && Low[li164] < Low[li164 + 2] && Low[li164] <= Low[li164 - 1] && Low[li164] < Low[li164 - 2]) {
            d268 = NormalizeDouble(Low[li164], Digits);
            iunused296 = li164;
            break;
         }
      }
      for (int li168 = 1; li168 < 150; li168++) {
         if (NormalizeDouble(iHigh(NULL, PERIOD_H1, li168), i280) == NormalizeDouble(ihigh300, i280) && DayOfWeek() != TimeDayOfWeek(iTime(NULL, PERIOD_H1, li168))) {
            datetime316 = iTime(NULL, PERIOD_H1, li168);
            i324 = li168;
            break;
         }
      }
      for (li168 = 1; li168 < 150; li168++) {
         if (NormalizeDouble(iLow(NULL, PERIOD_H1, li168), i280) == NormalizeDouble(ilow308, i280) && DayOfWeek() != TimeDayOfWeek(iTime(NULL, PERIOD_H1, li168))) {
            datetime320 = iTime(NULL, PERIOD_H1, li168);
            i328 = li168;
            break;
         }
      }
      if (li128) Print("time_high = ", TimeHour(datetime316), " time_low= ", TimeHour(datetime320));
      if (li128) Print("bar_high = ", i324, " bar_low= ", i328);
      if (li128) Print("high_yesterday = ", DoubleToStr(ihigh300, Digits), " low_yesterday= ", DoubleToStr(ilow308, Digits));
      if (li152) price148=NormalizeDouble((spread276+li140)*Point+ihigh132,Digits);
      else price148=NormalizeDouble((spread276+li140)*Point+ihigh300,Digits);
      //gprice148 = NormalizeDouble(Proc1(li152, li156, ihigh300, ihigh132, spread276, li140, Point, ld_16, ilow308, ilow140), Digits);
      if (li128) Print("PRICE_BUY = ", price148, " high_day= ", DoubleToStr(ihigh132, Digits), " ", Symbol());
      if (li112 == 1) {
         price180 = NormalizeDouble(price148 - ld_16 * l_stoplevel_160 * Point, Digits);
         if (li128) Print("SL_BUY = ", price180, " ", Symbol());
      }
      if (li112 == 2) {
         price180 = NormalizeDouble(Low[iLowest(NULL, 0, MODE_LOW, 2, 0)] - d204, Digits);
         if ((price148 - price180) / Point > ld_24 * l_stoplevel_160) price180 = NormalizeDouble(price148 - ld_24 * l_stoplevel_160 * Point, Digits);
      }
      if (li112 == 3) {
         price180 = NormalizeDouble(MathMin(d268, d252) - d204, Digits);
         if ((price148 - price180) / Point > ld_24 * l_stoplevel_160) price180 = NormalizeDouble(price148 - ld_24 * l_stoplevel_160 * Point, Digits);
      }
      if (li128) Print("SL_BUY = ", price180, " ", Symbol());
      price164 = NormalizeDouble(price148 + ld_32 * l_stoplevel_160 * Point, Digits);
      if (li128) Print("TP_BUY = ", price164, " ", Symbol());
      if (li156) price156=NormalizeDouble(ilow140-(spread276)*Point,Digits);
      else price156=NormalizeDouble(ilow308-(spread276)*Point,Digits);
      //gprice156 = NormalizeDouble(Proc2(li152, li156, ihigh300, ihigh132, spread276, li140, Point, ld_16, ilow308, ilow140), Digits);
      if (li128) Print("PRICE_SELL = ", price156, " low_day= ", DoubleToStr(ilow140, Digits), " ", Symbol());
      if (li112 == 1) price188 = NormalizeDouble(price156 + (ld_16 * l_stoplevel_160 + spread276) * Point, Digits);
      if (li112 == 2) {
         price188 = NormalizeDouble(High[iHighest(NULL, 0, MODE_HIGH, 2, 0)] + spread276 * Point + d204, Digits);
         if ((price188 - price156) / Point > ld_24 * l_stoplevel_160) price188 = NormalizeDouble(price156 + (ld_24 * l_stoplevel_160 + spread276) * Point, Digits);
      }
      if (li112 == 3) {
         price188 = NormalizeDouble(MathMax(d244, d260) + spread276 * Point + d204, Digits);
         if ((price188 - price156) / Point > ld_24 * l_stoplevel_160) price188 = NormalizeDouble(price156 + (ld_24 * l_stoplevel_160 + spread276) * Point, Digits);
      }
      if (li128) Print("SL_SELL = ", price188, " ", Symbol());
      price172 = NormalizeDouble(price156 - ld_32 * l_stoplevel_160 * Point, Digits);
      if (li128) Print("TP_SELL = ", price172, " ", Symbol());
      lots220 = GetLots( price148,price180);//0.1;
      lots212 = GetLots( price156,price188);//0.1;
      /*if (AccountBalance() > 500.0) {
         lots220 = NormalizeDouble(AccountBalance() * ld_0, LotDecimal);
         lots212 = NormalizeDouble(AccountBalance() * ld_0, LotDecimal);
         for (li148 = OrdersHistoryTotal() - 1; li148 >= 0; li148--) {
            if (OrderSelect(li148, SELECT_BY_POS, MODE_HISTORY) == FALSE) break;
            if (OrderSymbol() == Symbol() && OrderMagicNumber() == l_magic_136) {
               if (OrderLots() <= NormalizeDouble(AccountBalance() * ld_0,LotDecimal)) {
                  lots220 = NormalizeDouble(AccountBalance() * ld_0, LotDecimal);
                  lots212 = NormalizeDouble(AccountBalance() * ld_0, LotDecimal);
                  break;
               }
               lots220 = NormalizeDouble(OrderLots(), LotDecimal);
               lots212 = NormalizeDouble(OrderLots(), LotDecimal);
               break;
            }
         }
      }
      if (ld_8 > 0.0) {
         lots220 = NormalizeDouble(ld_8, LotDecimal);
         lots212 = NormalizeDouble(ld_8, LotDecimal);
      }
      if (lots220 > NormalizeDouble(AccountFreeMargin() / (1.05 * marginrequired228), LotDecimal) || lots212 > NormalizeDouble(AccountFreeMargin() / (1.05 * marginrequired228), LotDecimal)) {
         lots220 = NormalizeDouble(AccountFreeMargin() / (1.05 * marginrequired228), LotDecimal);
         lots212 = NormalizeDouble(AccountFreeMargin() / (1.05 * marginrequired228), LotDecimal);
      }*/
   }
   bool li172 = TRUE;
   /*if (AccountFreeMargin() < MarketInfo(Symbol(), MODE_MARGINREQUIRED) / 10.0) {
      li172 = FALSE;
      Print("No money");
   }*/
   int li176 = 15;
   if (li144) i352 = TRUE;
   if (MathAbs((d340 - Close[0]) / Point) > li60 && d340 != 0.0 && li56) {
      i336 = TRUE;
      datetime348 = TimeCurrent();
      if (i352 == TRUE) {
         if (li128) Print("The price shock for ", (d340 - Close[0]) / Point, " pips.", Symbol());
         if (li128) Print("last_price ", DoubleToStr(d340, Digits), ", curent_price ", DoubleToStr(Close[0], Digits));
         i352 = FALSE;
      }
   }
   d340 = Close[0];
   bool li180 = TRUE;
   if (li116 != 0) {
      li184 = 60 * li116 + li120;
      li188 = 60 * TimeHour(TimeCurrent()) + TimeMinute(TimeCurrent());
      if (li184 - li188 <= 20 && li188 - li184 <= 15) li180 = FALSE;
   }
   if (li144) i356 = TRUE;
   if (li180 == TRUE) {
      if (DayOfWeek() == 5 && TimeCurrent() - iTime(NULL, PERIOD_D1, 0) > 79200) {
         li180 = FALSE;
         if (i356 == TRUE) {
            if (li128) Print("Friday, ending trading.");
            i356 = FALSE;
         }
      }
   }
   if (li144) i360 = TRUE;
   if (li180 == TRUE) {
      if (DayOfWeek() == 1 && TimeCurrent() - iTime(NULL, PERIOD_D1, 0) < 3900) {
         li180 = FALSE;
         if (i360 == TRUE) {
            if (li128) Print("Monday, prior to 1-00 in the morning do not trade. Or off.");
            i360 = FALSE;
         }
      }
   }
   if (li144) i364 = TRUE;
   bool li192 = TRUE;
   if ((TimeHour(TimeCurrent()) <= 2 && i324 <= 8) || TimeHour(datetime316) == 0) {
      li192 = FALSE;
      if (i364 == TRUE) {
         if (li128) Print("��� 8 ����� �� ����������. �� �������.");
         i364 = FALSE;
      }
   }
   if (li144) i368 = TRUE;
   bool li196 = TRUE;
   if ((TimeHour(TimeCurrent()) <= 2 && i328 <= 8) || TimeHour(datetime320) == 0) {
      li196 = FALSE;
      if (i368 == TRUE) {
         if (li128) Print("��� 8 ����� �� ����������. �� �������.");
         i368 = FALSE;
      }
   }
   if (li144) i372 = TRUE;
   bool li200 = TRUE;
   if (l_stoplevel_160 > 50) {
      li200 = FALSE;
      if (i372 == TRUE) {
         if (li128) Print("Stop > 50. Stop trade.");
         i372 = FALSE;
      }
   }
   if (li144) i376 = TRUE;
   bool li204 = TRUE;
   if (li132 && spread276 > 20 && Symbol() == "EURUSD") {
      li204 = FALSE;
      if (i376 == TRUE) {
         if (li128) Print("Spread > 20. Stop trade.");
         i376 = FALSE;
      }
   }
   bool li208 = TRUE;
   bool li212 = TRUE;
   bool li216 = TRUE;
   bool li220 = TRUE;
   for (li148 = 0; li148 < OrdersTotal(); li148++) {
      if (OrderSelect(li148, SELECT_BY_POS, MODE_TRADES) == FALSE) break;
      if (OrderType() == OP_BUY && OrderSymbol() == Symbol() && OrderMagicNumber() == l_magic_136) {
         if (OrderTicket() == ticket380 && li124) {
            PlaySound("alert.wav");
            ticket380 = 0;
         }
         if (OrderOpenTime() >= Time[0]) {
            li208 = FALSE;
            continue;
         }
      }
      if (OrderType() == OP_BUYSTOP && OrderSymbol() == Symbol() && OrderMagicNumber() == l_magic_136) {
         li216 = FALSE;
         ordopenprice388 = OrderOpenPrice();
         ticket380 = OrderTicket();
         if (li200 == FALSE) {
            OrderDelete(OrderTicket());
            if (!(li128)) continue;
            Print("Delete order  ", OrderTicket(), " GOOD_STOP=false");
            continue;
         }
         if (i336 && OrderOpenPrice() - Ask < l_stoplevel_160 < 2 * Point) {
            OrderDelete(OrderTicket());
            i332 = FALSE;
            if (!(li128)) continue;
            Print("Delete order  ", OrderTicket(), " due to the price shock");
            continue;
         }
         if (li180 == FALSE || li192 == FALSE) {
            OrderDelete(OrderTicket());
            if (!(li128)) continue;
            Print("Delete order ", OrderTicket(), "PERMIS_TRADE=", li180, " PERMIS_BUY1=", li192);
            continue;
         }
         if (showorders == FALSE && OrderOpenPrice() - Close[0] > 300.0 * Point) {
            OrderDelete(OrderTicket());
            if (!(li128)) continue;
            Print("Order ", OrderTicket(), " delited because price far");
            continue;
         }
         if (OrderOpenPrice() - price148 >= 50.0 * Point || price148 - OrderOpenPrice() >= 50.0 * Point && Ask <= OrderOpenPrice() - l_stoplevel_160 * Point) OrderModify(OrderTicket(), price148, price180, price164, 0, Blue);
         else
            if (OrderOpenPrice() - price148 < 50.0 * Point || price148 - OrderOpenPrice() < 50.0 * Point && Ask <= OrderOpenPrice() - l_stoplevel_160 * Point && NormalizeDouble(OrderOpenPrice(), i280) != NormalizeDouble(price148, i280)) OrderModify(OrderTicket(), price148, price180, price164, 0, CLR_NONE);
         if (NormalizeDouble(OrderStopLoss(), i280) != NormalizeDouble(price180, i280)) {
            if (li128) Print("modify StopLoss, order ", OrderTicket(), " from ", OrderStopLoss(), " to ", price180);
            OrderModify(OrderTicket(), OrderOpenPrice(), price180, OrderTakeProfit(), 0, CLR_NONE);
         }
         if (NormalizeDouble(OrderLots(), LotDecimal) != NormalizeDouble(lots220, LotDecimal)) {
            if (li128) Print("modify lots, order ", OrderTicket(), " from ", OrderLots(), " to ", lots220);
            OrderDelete(OrderTicket());
         }
      }
      if (OrderType() == OP_SELL && OrderSymbol() == Symbol() && OrderMagicNumber() == l_magic_136) {
         if (OrderTicket() == ticket384 && li124) {
            PlaySound("alert.wav");
            ticket384 = 0;
         }
         if (OrderOpenTime() >= Time[0]) {
            li212 = FALSE;
            continue;
         }
      }
      if (OrderType() == OP_SELLSTOP && OrderSymbol() == Symbol() && OrderMagicNumber() == l_magic_136) {
         li220 = FALSE;
         ordopenprice396 = OrderOpenPrice();
         ticket384 = OrderTicket();
         if (li200 == FALSE) {
            OrderDelete(OrderTicket());
            if (!(li128)) continue;
            Print("Delete order  ", OrderTicket(), " GOOD_STOP=false");
            continue;
         }
         if (i336 && Bid - OrderOpenPrice() < l_stoplevel_160 < 2 * Point) {
            OrderDelete(OrderTicket());
            i332 = FALSE;
            if (!(li128)) continue;
            Print("Delete order ", OrderTicket(), " due to the price shock");
            continue;
         }
         if (li180 == FALSE || li196 == FALSE) {
            OrderDelete(OrderTicket());
            if (!(li128)) continue;
            Print("Delete order ", OrderTicket(), "PERMIS_TRADE=", li180, " PERMIS_SELL1=", li196);
            continue;
         }
         if (showorders == FALSE && Close[0] - OrderOpenPrice() > 300.0 * Point) {
            OrderDelete(OrderTicket());
            if (!(li128)) continue;
            Print("Order ", OrderTicket(), " delited because price far");
            continue;
         }
         if (OrderOpenPrice() - price156 >= 50.0 * Point || price156 - OrderOpenPrice() >= 50.0 * Point && Bid >= OrderOpenPrice() + l_stoplevel_160 * Point) OrderModify(OrderTicket(), price156, price188, price172, 0, Red);
         else
            if (OrderOpenPrice() - price156 < 50.0 * Point || price156 - OrderOpenPrice() < 50.0 * Point && Bid >= OrderOpenPrice() + l_stoplevel_160 * Point && NormalizeDouble(OrderOpenPrice(), i280) != NormalizeDouble(price156, i280)) OrderModify(OrderTicket(), price156, price188, price172, 0, CLR_NONE);
         if (NormalizeDouble(OrderStopLoss(), i280) != NormalizeDouble(price188, i280)) {
            if (li128) Print("modify StopLoss, order  ", OrderTicket(), " from ", OrderStopLoss(), " to ", price188);
            OrderModify(OrderTicket(), OrderOpenPrice(), price188, OrderTakeProfit(), 0, CLR_NONE);
         }
         if (NormalizeDouble(OrderLots(), LotDecimal) != NormalizeDouble(lots212, LotDecimal)) {
            if (li128) Print("modify lots, order ", OrderTicket(), " from ", OrderLots(), " to ", lots212);
            OrderDelete(OrderTicket());
         }
      }
      RefreshRates();
   }
   if ((TimeCurrent() - datetime348) / 60 > li176) {
      i332 = TRUE;
      i336 = FALSE;
   }
   bool li224 = TRUE;
   bool li228 = TRUE;
   if (iHigh(NULL, PERIOD_D1, 0) + (spread276 + li140) * Point > price148) li224 = FALSE;
   if (iLow(NULL, PERIOD_D1, 0) - li140 * Point < price156) li228 = FALSE;
   bool li232 = TRUE;
   bool li236 = TRUE;
   if (showorders == FALSE) {
      if (price148 - Close[0] > 150.0 * Point) li232 = FALSE;
      if (Close[0] - price156 > 150.0 * Point) li236 = FALSE;
   }
   if (li200 && li204 && li232 && li172 && i332 && li180 && li224 && li192 && li208 && li216)
      if (Ask <= price148 - l_stoplevel_160 * Point) OrderSend(Symbol(), OP_BUYSTOP, lots220, price148, 0, NormalizeDouble(price180,Digits), NormalizeDouble(price164,Digits), "Day Extremum", l_magic_136, 0, Blue);
   if (li200 && li204 && li236 && li172 && i332 && li180 && li228 && li196 && li212 && li220)
      if (Bid >= price156 + l_stoplevel_160 * Point) OrderSend(Symbol(), OP_SELLSTOP, lots212, price156, 0, NormalizeDouble(price188,Digits), NormalizeDouble(price172,Digits), "Day Extremum", l_magic_136, 0, Red);
   if (bid404 == 0.0) bid404 = Bid;
   double ld_240 = ld_96;
   if (ld_96 < 1.0) ld_240 = 1;
   int li248 = MarketInfo(Symbol(), MODE_STOPLEVEL);
   if (li112 == 1) {
      lprice252 = NormalizeDouble(Bid - ld_16 * l_stoplevel_160 * Point, Digits);
      lprice260 = NormalizeDouble(Ask + ld_16 * l_stoplevel_160 * Point, Digits);
   }
   if (li112 == 2) {
      lprice252 = NormalizeDouble(Low[iLowest(NULL, 0, MODE_LOW, 2, 1)] - d204, Digits);
      lprice260 = NormalizeDouble(High[iHighest(NULL, 0, MODE_HIGH, 2, 1)] + d204 + spread276 * Point, Digits);
   }
   if (li112 == 3) {
      lprice252 = NormalizeDouble(MathMin(d268, d252) - d204, Digits);
      lprice260 = NormalizeDouble(MathMax(d260, d244) + d204 + spread276 * Point, Digits);
   }
   for (li148 = 0; li148 <= OrdersTotal(); li148++) {
      if (OrderSelect(li148, SELECT_BY_POS, MODE_TRADES) == FALSE) break;
      if (OrderType() == OP_BUY && OrderSymbol() == Symbol() && OrderMagicNumber() == l_magic_136) {
         if (li80 && Close[0] < iLow(NULL, PERIOD_H1, 1)) {
            OrderClose(OrderTicket(), OrderLots(), Bid, 3, CLR_NONE);
            RefreshRates();
            if (!(li128)) continue;
            Print("Close Order ", OrderTicket(), " Close H1");
            continue;
         }
         if (li200 == FALSE && OrderStopLoss() < OrderOpenPrice() && OrderProfit() > 0.0) {
            OrderClose(OrderTicket(), OrderLots(), Bid, 3, CLR_NONE);
            RefreshRates();
            if (!(li128)) continue;
            Print("Close Order ", OrderTicket(), " ---> stop>50");
            continue;
         }
         if ((TimeCurrent() - OrderOpenTime() > 60 * li92 && OrderStopLoss() < OrderOpenPrice() && Bid >= OrderOpenPrice()) || (li52 == TRUE && OrderProfit() > 0.0)) {
            OrderClose(OrderTicket(), OrderLots(), Bid, 3, CLR_NONE);
            RefreshRates();
            if (!(li128)) continue;
            Print("Close Order ", OrderTicket(), " ---> time_of_close");
            continue;
         }
         if (li56 && MathAbs((OrderOpenPrice() - ordopenprice388) / Point) > li60 && OrderProfit() > 0.0) {
            OrderClose(OrderTicket(), OrderLots(), Bid, 10, Yellow);
            RefreshRates();
            if (li128) Print("Close Order ", OrderTicket(), " due to the price shock ", MathAbs((OrderOpenPrice() - ordopenprice388) / Digits), " pips");
            if (!(li128)) continue;
            Print("OrderOpenPrise ", DoubleToStr(OrderOpenPrice(), Digits), ", PRICE_BUY1 ", DoubleToStr(ordopenprice388, Digits));
            continue;
         }
         if (li64 && ihigh132 - OrderOpenPrice() >= li68 * Point && Bid - OrderOpenPrice() < 5.0 * Point && Bid - OrderOpenPrice() >= 0.0 && Bid < bid404) {
            OrderClose(OrderTicket(), OrderLots(), Bid, 3, CLR_NONE);
            RefreshRates();
            Print("�������� ����� BUY ", OrderTicket(), ", ", (Bid - OrderOpenPrice()) / Point, " ������� � �������, �������� ���� ", DoubleToStr(Bid - bid404, Digits));
            Print("������� ���� ", DoubleToStr(Bid, Digits), "  ���������� ���� ", DoubleToStr(bid404, Digits));
            continue;
         }
         if (li72 == TRUE && OrderProfit() >= 0.0 && iClose(NULL, PERIOD_M1, 0) < iOpen(NULL, PERIOD_M1, 0) && Close[0] < iLow(NULL, PERIOD_M1, 1) && iClose(NULL, PERIOD_M1, 1) < iOpen(NULL, PERIOD_M1, 1) ||
            iClose(NULL, PERIOD_M1, 1) < iLow(NULL, PERIOD_M1, 1) + (iHigh(NULL, PERIOD_M1, 1) - iLow(NULL, PERIOD_M1, 1)) / 3.0) {
            OrderClose(OrderTicket(), OrderLots(), Bid, 3, Yellow);
            RefreshRates();
            if (!(li128)) continue;
            Print("Close Order ", OrderTicket(), " ---> minimum_risk_M1");
            continue;
         }
         if (li76 == TRUE && OrderProfit() >= 0.0 && iClose(NULL, PERIOD_M5, 0) < iOpen(NULL, PERIOD_M5, 0) && Close[0] < iLow(NULL, PERIOD_M5, 1) && iClose(NULL, PERIOD_M5, 1) < iOpen(NULL, PERIOD_M5, 1) ||
            iClose(NULL, PERIOD_M5, 1) < iLow(NULL, PERIOD_M5, 1) + (iHigh(NULL, PERIOD_M5, 1) - iLow(NULL, PERIOD_M5, 1)) / 3.0) {
            OrderClose(OrderTicket(), OrderLots(), Bid, 3, Yellow);
            RefreshRates();
            if (!(li128)) continue;
            Print("Close Order ", OrderTicket(), " ---> minimum_risk_M5");
            continue;
         }
         if (OrderStopLoss() < OrderOpenPrice()) {
            if (li248 < 50) {
               if (li44 == TRUE && Bid - OrderOpenPrice() >= MathCeil(l_stoplevel_160 * ld_96) * Point && Bid - OrderStopLoss() > MathCeil(l_stoplevel_160 * ld_96) * Point) {
                  OrderModify(OrderTicket(), OrderOpenPrice(), NormalizeDouble(Bid - MathCeil(l_stoplevel_160 * ld_240) * Point, Digits), OrderTakeProfit(), 0, LightGreen);
                  Print("������ � ���� BUY ����� ", OrderTicket());
                  RefreshRates();
                  continue;
               }
            } else {
               if (li44 == TRUE && Bid - OrderOpenPrice() >= MathCeil(l_stoplevel_160 * ld_96) * Point && Bid - OrderStopLoss() > MathCeil(l_stoplevel_160 * ld_96) * Point && OrderStopLoss() < NormalizeDouble(Bid - MathCeil(l_stoplevel_160 * ld_240 +
                  l_stoplevel_160 / 10.0) * Point, Digits)) {
                  OrderModify(OrderTicket(), OrderOpenPrice(), NormalizeDouble(Bid - MathCeil(l_stoplevel_160 * ld_240 + l_stoplevel_160 / 10.0) * Point, Digits), OrderTakeProfit(), 0, LightGreen);
                  Print("������ � ���� BUY ����� ", OrderTicket());
                  RefreshRates();
                  continue;
               }
            }
            if (li48 == TRUE && OrderStopLoss() < lprice252 && Bid - lprice252 >= l_stoplevel_160 * Point) {
               if (li128) Print("Reduce losses OP_BUY order ", OrderTicket(), " moved S/L from ", DoubleToStr(OrderStopLoss(), Digits), " to ", DoubleToStr(lprice252, Digits), ". Methot S/L=", li112);
               OrderModify(OrderTicket(), OrderOpenPrice(), lprice252, OrderTakeProfit(), 0, LightGreen);
               RefreshRates();
               continue;
            }
         }
         if (OrderStopLoss() >= OrderOpenPrice() && li40 == TRUE) {
            if (Bid - OrderStopLoss() > Point * l_pips_104 * l_stoplevel_160) {
               OrderModify(OrderTicket(), OrderOpenPrice(), NormalizeDouble(Bid - l_pips_104 * l_stoplevel_160 * Point, Digits), OrderTakeProfit(), 0, LightGreen);
               RefreshRates();
               continue;
            }
         }
         if (OrderStopLoss() >= OrderOpenPrice() && li48 == TRUE && lprice252 > OrderStopLoss() && Bid - lprice252 >= l_stoplevel_160 * Point) {
            if (li128) Print("MovingS_L=true, Methot S/L=", li112, ". Increase Profit OP_BUY order ", OrderTicket(), " from ", DoubleToStr(OrderStopLoss(), Digits), " to ", DoubleToStr(lprice252, Digits));
            OrderModify(OrderTicket(), OrderOpenPrice(), lprice252, OrderTakeProfit(), 0, LightGreen);
            RefreshRates();
            continue;
         }
      }
      if (OrderType() == OP_SELL && OrderSymbol() == Symbol() && OrderMagicNumber() == l_magic_136) {
         if (li80 && Close[0] > iHigh(NULL, PERIOD_H1, 1)) {
            OrderClose(OrderTicket(), OrderLots(), Ask, 3, CLR_NONE);
            RefreshRates();
            if (li128) Print("Close Order ", OrderTicket(), " Close H1");
         } else {
            if (li200 == FALSE && OrderStopLoss() > OrderOpenPrice() && OrderProfit() > 0.0) {
               OrderClose(OrderTicket(), OrderLots(), Ask, 3, CLR_NONE);
               RefreshRates();
               if (li128) Print("Close Order ", OrderTicket(), " ---> stop>50");
            } else {
               if ((TimeCurrent() - OrderOpenTime() > 60 * li92 && OrderStopLoss() > OrderOpenPrice() && Ask <= OrderOpenPrice()) || (li52 == TRUE && OrderProfit() > 0.0)) {
                  OrderClose(OrderTicket(), OrderLots(), Ask, 3, CLR_NONE);
                  RefreshRates();
               } else {
                  if (li56 && MathAbs((ordopenprice396 - OrderOpenPrice()) / Point) > li60 && OrderProfit() > 0.0) {
                     OrderClose(OrderTicket(), OrderLots(), Ask, 10, Yellow);
                     RefreshRates();
                     if (li128) Print("Close Order ", OrderTicket(), " due to the price shock ", MathAbs((OrderOpenPrice() - ordopenprice396) / Digits), " pips");
                     if (li128) Print("OrderOpenPrise ", DoubleToStr(OrderOpenPrice(), Digits), ", PRICE_SELL1 ", DoubleToStr(ordopenprice396, Digits));
                  } else {
                     if (li64 && OrderOpenPrice() - spread276 * Point - ilow140 >= li68 * Point && OrderOpenPrice() - Ask < 5.0 * Point && OrderOpenPrice() - Ask >= 0.0 && Bid > bid404) {
                        OrderClose(OrderTicket(), OrderLots(), Ask, 3, CLR_NONE);
                        RefreshRates();
                        Print("�������� ����� SELL ", OrderTicket(), ", ", (OrderOpenPrice() - Ask) / Point, " ������� � �������, �������� ����� ", DoubleToStr(Bid - bid404, Digits));
                     } else {
                        if (li72 == TRUE && OrderProfit() >= 0.0 && iClose(NULL, PERIOD_M1, 0) > iOpen(NULL, PERIOD_M1, 0) && Close[0] > iHigh(NULL, PERIOD_M1, 1) && iClose(NULL, PERIOD_M1, 1) > iOpen(NULL, PERIOD_M1, 1) ||
                           iClose(NULL, PERIOD_M1, 1) > iHigh(NULL, PERIOD_M1, 1) - (iHigh(NULL, PERIOD_M1, 1) - iLow(NULL, PERIOD_M1, 1)) / 3.0) {
                           OrderClose(OrderTicket(), OrderLots(), Ask, 3, Yellow);
                           RefreshRates();
                           if (li128) Print("Close Order ", OrderTicket(), " ---> minimum_risk_M1");
                        } else {
                           if (li76 == TRUE && OrderProfit() >= 0.0 && iClose(NULL, PERIOD_M5, 0) > iOpen(NULL, PERIOD_M5, 0) && Close[0] > iHigh(NULL, PERIOD_M5, 1) && iClose(NULL, PERIOD_M5, 1) > iOpen(NULL, PERIOD_M5, 1) ||
                              iClose(NULL, PERIOD_M5, 1) > iHigh(NULL, PERIOD_M5, 1) - (iHigh(NULL, PERIOD_M5, 1) - iLow(NULL, PERIOD_M5, 1)) / 3.0) {
                              OrderClose(OrderTicket(), OrderLots(), Ask, 3, Yellow);
                              RefreshRates();
                              if (li128) Print("Close Order ", OrderTicket(), " ---> minimum_risk_M5");
                           } else {
                              if (OrderStopLoss() > OrderOpenPrice()) {
                                 if (li248 < 50) {
                                    if (li44 == TRUE && OrderOpenPrice() - Ask >= Point * MathCeil(l_stoplevel_160 * ld_96) && OrderStopLoss() - Ask > MathCeil(l_stoplevel_160 * ld_96) * Point) {
                                       OrderModify(OrderTicket(), OrderOpenPrice(), NormalizeDouble(Ask + MathCeil(l_stoplevel_160 * ld_240) * Point, Digits), OrderTakeProfit(), 0, Pink);
                                       RefreshRates();
                                       Print("������ � ���� SELL ����� ", OrderTicket());
                                       continue;
                                    }
                                 } else {
                                    if (li44 == TRUE && OrderOpenPrice() - Ask >= Point * MathCeil(l_stoplevel_160 * ld_96) && OrderStopLoss() - Ask > MathCeil(l_stoplevel_160 * ld_96) * Point && OrderStopLoss() > NormalizeDouble(Ask +
                                       MathCeil(l_stoplevel_160 * ld_240 + l_stoplevel_160 / 10.0) * Point, Digits)) {
                                       OrderModify(OrderTicket(), OrderOpenPrice(), NormalizeDouble(Ask + MathCeil(l_stoplevel_160 * ld_240 + l_stoplevel_160 / 10.0) * Point, Digits), OrderTakeProfit(), 0, Pink);
                                       RefreshRates();
                                       Print("������ � ���� SELL ����� ", OrderTicket());
                                       continue;
                                    }
                                 }
                                 if (li48 == TRUE && OrderStopLoss() > lprice260 && lprice260 - Ask >= l_stoplevel_160 * Point) {
                                    if (li128) Print("Reduce losses OP_SELL order ", OrderTicket(), " moved S/L from", DoubleToStr(OrderStopLoss(), Digits), " to ", DoubleToStr(lprice260, Digits), ". Methot S/L=", li112);
                                    OrderModify(OrderTicket(), OrderOpenPrice(), lprice260, OrderTakeProfit(), 0, LightGreen);
                                    RefreshRates();
                                    continue;
                                 }
                              }
                              if (OrderStopLoss() <= OrderOpenPrice() && li40 == TRUE) {
                                 if (OrderStopLoss() - Ask > Point * l_pips_104 * l_stoplevel_160) {
                                    OrderModify(OrderTicket(), OrderOpenPrice(), NormalizeDouble(Ask + l_pips_104 * l_stoplevel_160 * Point, Digits), OrderTakeProfit(), 0, Pink);
                                    RefreshRates();
                                    continue;
                                 }
                              }
                              if (OrderStopLoss() <= OrderOpenPrice() && li48 == TRUE && lprice260 < OrderStopLoss() && lprice260 - Ask >= l_stoplevel_160 * Point) {
                                 if (li128) Print("Tr.stop = false. Methot S/L=", li112, ". Increase Profit OP_SELL order ", OrderTicket(), " from ", DoubleToStr(OrderStopLoss(), Digits), " to ", DoubleToStr(lprice260, Digits));
                                 OrderModify(OrderTicket(), OrderOpenPrice(), lprice260, OrderTakeProfit(), 0, LightGreen);
                                 RefreshRates();
                              }
                           }
                        }
                     }
                  }
               }
            }
         }
      }
   }
   RefreshRates();
   bid404 = Bid;
}

void func2() {
   double l_ifractals_144;
   double l_ifractals_152;
   int li176;
   int li180;
   double lprice256;
   double lprice264;
   double ld_0 = lotpercent / 10000.0;
   double ld_8 = lotfixed;
   double ld_16 = 12;
   double ld_24 = 22;
   double ld_32 = 75;
   int li40 = 20;
   bool li44 = TRUE;
   bool li48 = TRUE;
   bool li52 = TRUE;
   bool li56 = TRUE;
   bool li60 = FALSE;
   bool li64 = TRUE;
   int li68 = 75;
   bool li72 = TRUE;
   bool li76 = TRUE;
   int li80 = 180;
   double ld_84 = 1;
   double l_pips_92 = 1;
   int li100 = 2;
   int li104 = 0;
   int li108 = 0;
   bool li112 = FALSE;
   bool li116 = FALSE;
   int l_magic_120 = 999;
   bool li124 = TRUE;
   bool li128 = TRUE;
   if (ld_16 < 1.0 || ld_32 < 1.0) {
      Print("stop level below the requested soluble");
      return;
   }
   bool li132 = FALSE;
   if (time412 == 0) time412 = Time[0];
   if (time412 != Time[0]) {
      li132 = TRUE;
      time412 = Time[0];
   }
   int l_stoplevel_136 = MarketInfo(Symbol(), MODE_STOPLEVEL);
   if (l_stoplevel_136 < li40 && Digits == 5) l_stoplevel_136 = li40;
   if (l_stoplevel_136 < 2 && Digits == 4) l_stoplevel_136 = 2;
   if (li132 || lots520 == 0.0 || lots528 == 0.0 || price456 == 0.0 || price464 == 0.0 || price472 == 0.0 || price480 == 0.0 || price488 == 0.0 ||
      price496 == 0.0 || ticksize504 == 0.0 || d512 == 0.0) {
      spread584 = MarketInfo(Symbol(), MODE_SPREAD);
      if (li116) Print("spread = ", spread584, " ", Symbol());
      ticksize504 = MarketInfo(Symbol(), MODE_TICKSIZE);
      tickvalue544 = MarketInfo(Symbol(), MODE_TICKVALUE);
      marginrequired536 = MarketInfo(Symbol(), MODE_MARGINREQUIRED);
      if (Digits == 5) {
         d512 = 10.0 * ticksize504;
         i588 = 4;
      } else d512 = ticksize504;
      for (int li140 = 3; li140 < 100; li140++) {
         if (High[li140] >= High[li140 + 1] && High[li140] > High[li140 + 2] && High[li140] >= High[li140 - 1] && High[li140] > High[li140 - 2]) {
            high552 = High[li140];
            i592 = li140;
            time624 = Time[li140];
            break;
         }
      }
      for (li140 = i592 + 1; li140 < 100; li140++) {
         if (High[li140] >= High[li140 + 1] && High[li140] > High[li140 + 2] && High[li140] >= High[li140 - 1] && High[li140] > High[li140 - 2]) {
            high568 = High[li140];
            iunused596 = li140;
            break;
         }
      }
      for (li140 = 3; li140 < 100; li140++) {
         if (Low[li140] <= Low[li140 + 1] && Low[li140] < Low[li140 + 2] && Low[li140] <= Low[li140 - 1] && Low[li140] < Low[li140 - 2]) {
            low560 = Low[li140];
            i600 = li140;
            time628 = Time[li140];
            break;
         }
      }
      for (li140 = i600 + 1; li140 < 100; li140++) {
         if (Low[li140] <= Low[li140 + 1] && Low[li140] < Low[li140 + 2] && Low[li140] <= Low[li140 - 1] && Low[li140] < Low[li140 - 2]) {
            low576 = Low[li140];
            iunused604 = li140;
            break;
         }
      }
      l_ifractals_144 = iFractals(NULL, 0, MODE_UPPER, 0);
      l_ifractals_152 = iFractals(NULL, 0, MODE_LOWER, 0);
      ialligator432 = iAlligator(NULL, 0, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORLIPS, 0);
      ialligator440 = iAlligator(NULL, 0, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORTEETH, 0);
      ialligator448 = iAlligator(NULL, 0, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORJAW, 0);
      iao416 = iAO(NULL, 0, 1);
      iao424 = iAO(NULL, 0, 2);
      for (int li160 = 1; li160 <= 1000; li160++) {
         if ((iAO(NULL, 0, li160 + 1) > 0.0 && iAO(NULL, 0, li160) > iAO(NULL, 0, li160 + 1) && iAO(NULL, 0, li160 + 1) < iAO(NULL, 0, li160 + 2)) || (iAO(NULL, 0, li160) > 0.0 &&
            iAO(NULL, 0, li160 + 1) < 0.0)) {
            i608 = li160;
            i616 = Time[li160];
            break;
         }
      }
      for (li160 = 1; li160 <= 1000; li160++) {
         if ((iAO(NULL, 0, li160 + 1) < 0.0 && iAO(NULL, 0, li160) < iAO(NULL, 0, li160 + 1) && iAO(NULL, 0, li160 + 1) > iAO(NULL, 0, li160 + 2)) || (iAO(NULL, 0, li160) < 0.0 &&
            iAO(NULL, 0, li160 + 1) > 0.0)) {
            i612 = li160;
            i620 = Time[li160];
            break;
         }
      }
      if (li116) Print("shift_ao_buy=", i608, ", shift_ao_sell=", i612);
      //if (li124 && high552<=High[iHighest(NULL, 0, MODE_HIGH, i592 - 1, 1)] && ) price456=NormalizeDouble(High[gi608]+(spread276+1)*Point,Digits);
      //else price456=NormalizeDouble(high552+(spread276+1)*Point,Digits);
      price456 = NormalizeDouble(Proc3(high552, low560, li128, spread584, Point, li124, i616, i620, time624, time628, High[iHighest(NULL, 0, MODE_HIGH, i592 - 1, 1)], Low[iLowest(NULL, 0, MODE_LOW, i600 - 1, 1)], High[i608], Low[i612]), Digits);
      if (li100 == 1) price488 = NormalizeDouble(price456 - ld_16 * l_stoplevel_136 * Point, Digits);
      if (li100 == 2) {
         price488 = NormalizeDouble(Low[iLowest(NULL, 0, MODE_LOW, 2, 0)] - d512, Digits);
         if ((price456 - price488) / Point > ld_24 * l_stoplevel_136) price488 = NormalizeDouble(price456 - ld_24 * l_stoplevel_136 * Point, Digits);
      }
      if (li100 == 3) {
         price488 = NormalizeDouble(MathMin(low576, low560) - d512, Digits);
         if ((price456 - price488) / Point > ld_24 * l_stoplevel_136) price488 = NormalizeDouble(price456 - ld_24 * l_stoplevel_136 * Point, Digits);
      }
      if (li116) Print("SL_BUY = ", price488, " ", Symbol());
      price472 = NormalizeDouble(price456 + ld_32 * l_stoplevel_136 * Point, Digits);
      if (li116) Print("TP_BUY = ", price472, " ", Symbol());
      price464 = NormalizeDouble(Proc4(high552, low560, li128, spread584, Point, li124, i616, i620, time624, time628, High[iHighest(NULL, 0, MODE_HIGH, i592 - 1, 1)], Low[iLowest(NULL, 0, MODE_LOW, i600 - 1, 1)], High[i608], Low[i612]), Digits);
      if (li100 == 1) price496 = NormalizeDouble(price464 + (ld_16 * l_stoplevel_136 + spread584) * Point, Digits);
      if (li100 == 2) {
         price496 = NormalizeDouble(High[iHighest(NULL, 0, MODE_HIGH, 2, 0)] + spread584 * Point + d512, Digits);
         if ((price496 - price464) / Point > ld_24 * l_stoplevel_136) price496 = NormalizeDouble(price464 + (ld_24 * l_stoplevel_136 + spread584) * Point, Digits);
      }
      if (li100 == 3) {
         price496 = NormalizeDouble(MathMax(high552, high568) + spread584 * Point + d512, Digits);
         if ((price496 - price464) / Point > ld_24 * l_stoplevel_136) price496 = NormalizeDouble(price464 + (ld_24 * l_stoplevel_136 + spread584) * Point, Digits);
      }
      if (li116) Print("SL_SELL = ", price496, " ", Symbol());
      price480 = NormalizeDouble(price464 - ld_32 * l_stoplevel_136 * Point, Digits);
      if (li116) Print("TP_SELL = ", price480, " ", Symbol());
      lots528 = GetLots( price456, price488);//0.1;
      lots520 = GetLots( price464, price496);//0.1;
      /*if (AccountBalance() > 500.0) {
         lots528 = NormalizeDouble(AccountBalance() * ld_0, LotDecimal);
         lots520 = NormalizeDouble(AccountBalance() * ld_0, LotDecimal);
         for (li160 = OrdersHistoryTotal() - 1; li160 >= 0; li160--) {
            if (OrderSelect(li160, SELECT_BY_POS, MODE_HISTORY) == FALSE) break;
            if (OrderSymbol() == Symbol() && OrderMagicNumber() == l_magic_120) {
               if (OrderLots() <= NormalizeDouble(AccountBalance() * ld_0, LotDecimal)) {
                  lots528 = NormalizeDouble(AccountBalance() * ld_0, LotDecimal);
                  lots520 = NormalizeDouble(AccountBalance() * ld_0, LotDecimal);
                  break;
               }
               lots528 = NormalizeDouble(OrderLots(), LotDecimal);
               lots520 = NormalizeDouble(OrderLots(), LotDecimal);
               break;
            }
         }
      }
      if (ld_8 > 0.0) {
         lots528 = NormalizeDouble(ld_8, LotDecimal);
         lots520 = NormalizeDouble(ld_8, LotDecimal);
      }
      if (lots528 > NormalizeDouble(AccountFreeMargin() / (1.05 * marginrequired536), LotDecimal) || lots520 > NormalizeDouble(AccountFreeMargin() / (1.05 * marginrequired536), LotDecimal)) {
         lots528 = NormalizeDouble(AccountFreeMargin() / (1.05 * marginrequired536), LotDecimal);
         lots520 = NormalizeDouble(AccountFreeMargin() / (1.05 * marginrequired536), LotDecimal);
      }*/
   }
   bool li164 = TRUE;
   /*if (AccountFreeMargin() < MarketInfo(Symbol(), MODE_MARGINREQUIRED) / 10.0) {
      li164 = FALSE;
      Print("No money");
   }*/
   int li168 = 15;
   if (li132) i652 = TRUE;
   if (MathAbs((d640 - Close[0]) / Point) > li68 && d640 != 0.0 && li64) {
      i636 = TRUE;
      datetime648 = TimeCurrent();
      if (i652 == TRUE) {
         if (li116) Print("The price shock for ", (d640 - Close[0]) / Point, " pips.", Symbol());
         if (li116) Print("last_price ", DoubleToStr(d640, Digits), ", curent_price ", DoubleToStr(Close[0], Digits));
         i652 = FALSE;
      }
   }
   d640 = Close[0];
   bool li172 = TRUE;
   if (li104 != 0) {
      li176 = 60 * li104 + li108;
      li180 = 60 * TimeHour(TimeCurrent()) + TimeMinute(TimeCurrent());
      if (li176 - li180 <= 20 && li180 - li176 <= 15) li172 = FALSE;
   }
   if (li132) i656 = TRUE;
   if (li172 == TRUE) {
      if (DayOfWeek() == 5 && TimeCurrent() - iTime(NULL, PERIOD_D1, 0) > 79200) {
         li172 = FALSE;
         if (i656 == TRUE) {
            if (li116) Print("Friday, ending trading.");
            i656 = FALSE;
         }
      }
   }
   if (li132) i660 = TRUE;
   if (li172 == TRUE) {
      if ((DayOfWeek() == 1 && TimeCurrent() - iTime(NULL, PERIOD_D1, 0) < 3900) || DayOfWeek() == 6 || DayOfWeek() == 7) {
         li172 = FALSE;
         if (i660 == TRUE) {
            if (li116) Print("Monday, prior to 1-00 in the morning do not trade. Or off.");
            i660 = FALSE;
         }
      }
   }
   double l_ord_open_price_184 = 0;
   double l_ord_open_price_192 = 0;
   for (li160 = 0; li160 < OrdersTotal(); li160++) {
      if (OrderSelect(li160, SELECT_BY_POS, MODE_TRADES) == FALSE) break;
      if (OrderType() == OP_BUYSTOP && OrderSymbol() == Symbol() && OrderMagicNumber() == 777) l_ord_open_price_184 = OrderOpenPrice();
      if (OrderType() == OP_SELLSTOP && OrderSymbol() == Symbol() && OrderMagicNumber() == 777) l_ord_open_price_192 = OrderOpenPrice();
   }
   bool li200 = TRUE;
   bool li204 = TRUE;
   int l_count_208 = 0;
   int l_count_212 = 0;
   if (li132) {
      i664 = TRUE;
      i668 = TRUE;
   }
   for (li160 = 0; li160 < OrdersTotal(); li160++) {
      if (OrderSelect(li160, SELECT_BY_POS, MODE_TRADES) == FALSE) break;
      if (OrderType() == OP_BUY && OrderSymbol() == Symbol() && OrderMagicNumber() == l_magic_120) {
         if (OrderTicket() == ticket672 && li112) {
            PlaySound("alert.wav");
            ticket672 = 0;
         }
         if (OrderOpenTime() >= Time[0]) {
            i664 = FALSE;
            continue;
         }
      }
      if (OrderType() == OP_BUYSTOP && OrderSymbol() == Symbol() && OrderMagicNumber() == l_magic_120) {
         li200 = FALSE;
         ticket672 = OrderTicket();
         l_count_208++;
         if (l_count_208 > 1) {
            OrderDelete(OrderTicket());
            continue;
         }
         if (i636 && OrderOpenPrice() - Ask < l_stoplevel_136 < 2 * Point) {
            OrderDelete(OrderTicket());
            i632 = FALSE;
            Print("Delete order ", OrderTicket(), " due to the price shock");
            continue;
         }
         if (li172 == FALSE) {
            OrderDelete(OrderTicket());
            if (!(li116)) continue;
            Print("Delete order ", OrderTicket(), "PERMIS_TRADE=", li172);
            continue;
         }
         if (li44 && MathAbs(OrderOpenPrice() - l_ord_open_price_184) / Point < l_stoplevel_136) {
            OrderDelete(OrderTicket());
            if (!(li116)) continue;
            Print("Order ", OrderTicket(), " deleted because of the similarity with a Day Extremum");
            continue;
         }
         if (showorders == FALSE && OrderOpenPrice() - Close[0] > 300.0 * Point) {
            OrderDelete(OrderTicket());
            if (!(li116)) continue;
            Print("Order ", OrderTicket(), " deleted because price far");
            continue;
         }
         if (OrderOpenPrice() - price456 >= 50.0 * Point || price456 - OrderOpenPrice() >= 50.0 * Point && Ask <= OrderOpenPrice() - l_stoplevel_136 * Point) OrderModify(OrderTicket(), price456, price488, price472, 0, Blue);
         else
            if (OrderOpenPrice() - price456 < 50.0 * Point || price456 - OrderOpenPrice() < 50.0 * Point && Ask <= OrderOpenPrice() - l_stoplevel_136 * Point && NormalizeDouble(OrderOpenPrice(), i588) != NormalizeDouble(price456, i588)) OrderModify(OrderTicket(), price456, price488, price472, 0, CLR_NONE);
         if (NormalizeDouble(OrderStopLoss(), i588) != NormalizeDouble( price488, i588)) {
            if (li116) Print("modify StopLoss, order ", OrderTicket(), " from ", OrderStopLoss(), " to ", price488);
            OrderModify(OrderTicket(), OrderOpenPrice(), price488, OrderTakeProfit(), 0, CLR_NONE);
         }
         if (NormalizeDouble(OrderLots(), LotDecimal) != NormalizeDouble(lots528, LotDecimal)) {
            if (li116) Print("modify lots, order ", OrderTicket(), " from ", OrderLots(), " to ", lots528);
            OrderDelete(OrderTicket());
         }
      }
      if (OrderType() == OP_SELL && OrderSymbol() == Symbol() && OrderMagicNumber() == l_magic_120) {
         if (OrderTicket() == ticket676 && li112) {
            PlaySound("alert.wav");
            ticket676 = 0;
         }
         if (OrderOpenTime() >= Time[0]) {
            i668 = FALSE;
            continue;
         }
      }
      if (OrderType() == OP_SELLSTOP && OrderSymbol() == Symbol() && OrderMagicNumber() == l_magic_120) {
         li204 = FALSE;
         ticket676 = OrderTicket();
         l_count_212++;
         if (l_count_212 > 1) OrderDelete(OrderTicket());
         else {
            if (i636 && Bid - OrderOpenPrice() < l_stoplevel_136 < 2 * Point) {
               OrderDelete(OrderTicket());
               i632 = FALSE;
               if (li116) Print("Delete order ", OrderTicket(), " due to the price shock");
            } else {
               if (li172 == FALSE) OrderDelete(OrderTicket());
               else {
                  if (li44 && MathAbs(OrderOpenPrice() - l_ord_open_price_192) / Point < l_stoplevel_136) {
                     OrderDelete(OrderTicket());
                     if (li116) Print("Order ", OrderTicket(), " closed because of the similarity with a Day Extremum");
                  } else {
                     if (showorders == FALSE && Close[0] - OrderOpenPrice() > 300.0 * Point) {
                        OrderDelete(OrderTicket());
                        if (li116) Print("Order ", OrderTicket(), " delited because price far");
                     } else {
                        if (OrderOpenPrice() - price464 >= 50.0 * Point || price464 - OrderOpenPrice() >= 50.0 * Point && Bid >= OrderOpenPrice() + l_stoplevel_136 * Point) OrderModify(OrderTicket(), price464, price496, price480, 0, Red);
                        else
                           if (OrderOpenPrice() - price464 < 50.0 * Point || price464 - OrderOpenPrice() < 50.0 * Point && Bid >= OrderOpenPrice() + l_stoplevel_136 * Point && NormalizeDouble(OrderOpenPrice(), i588) != NormalizeDouble(price464, i588)) OrderModify(OrderTicket(), price464, price496, price480, 0, CLR_NONE);
                        if (NormalizeDouble(OrderStopLoss(), i588) != NormalizeDouble(price496, i588)) OrderModify(OrderTicket(), OrderOpenPrice(), price496, OrderTakeProfit(), 0, CLR_NONE);
                        if (NormalizeDouble(OrderLots(), LotDecimal) != NormalizeDouble(lots520, LotDecimal)) OrderDelete(OrderTicket());
                     }
                  }
               }
            }
         }
      }
   }
   if ((TimeCurrent() - datetime648) / 60 > li168) {
      i632 = TRUE;
      i636 = FALSE;
   }
   bool li216 = TRUE;
   bool li220 = TRUE;
   if (High[iHighest(NULL, 0, MODE_HIGH, i592 - 1, 0)] >= High[i592]) li216 = FALSE;
   if (Low[iLowest(NULL, 0, MODE_LOW, i600 - 1, 0)] <= Low[i600]) li220 = FALSE;
   bool li224 = TRUE;
   bool li228 = TRUE;
   if (li124 == FALSE || li216 || i616 < time624 || High[iHighest(NULL, 0, MODE_HIGH, i608, 0)] >= High[i608]) li224 = FALSE;
   if (li124 == FALSE || li220 || i620 < time628 || Low[iLowest(NULL, 0, MODE_LOW, i612, 0)] <= Low[i612]) li228 = FALSE;
   bool li232 = TRUE;
   bool li236 = TRUE;
   if (li44 && MathAbs(price456 - l_ord_open_price_184) / Point < l_stoplevel_136) li232 = FALSE;
   if (li44 && MathAbs(price464 - l_ord_open_price_192) / Point < l_stoplevel_136) li236 = FALSE;
   bool li240 = TRUE;
   bool li244 = TRUE;
   if (showorders == FALSE) {
      if ( price456 - Close[0] > 150.0 * Point) li240 = FALSE;
      if (Close[0] - price464 > 150.0 * Point) li244 = FALSE;
   }
   if ((li240 && li232 && li164 && i632 && li172 && li216 && i664 && li200 && Ask <= price456 - l_stoplevel_136 * Point) || (li240 && li232 && li164 &&
      i632 && li172 && li224 && i664 && li200 && Ask <= price456 - l_stoplevel_136 * Point)) OrderSend(Symbol(), OP_BUYSTOP, lots528, price456, 0, NormalizeDouble(price488,Digits), NormalizeDouble(price472,Digits), "Fractals_H1", l_magic_120, 0, Blue);
   if ((li244 && li236 && li164 && i632 && li172 && li220 && i668 && li204 && Bid >= price464 + l_stoplevel_136 * Point) || (li244 && li236 && li164 &&
      i632 && li172 && li228 && i668 && li204 && Bid >= price464 + l_stoplevel_136 * Point)) OrderSend(Symbol(), OP_SELLSTOP, lots520, price464, 0, NormalizeDouble(price496,Digits), NormalizeDouble(price480,Digits), "Fractals_H1", l_magic_120, 0, Red);
   double ld_248 = ld_84;
   if (ld_84 < 1.0) ld_248 = 1;
   if (li100 == 1) {
      lprice256 = NormalizeDouble(Bid - ld_16 * l_stoplevel_136 * Point, Digits);
      lprice264 = NormalizeDouble(Ask + ld_16 * l_stoplevel_136 * Point, Digits);
   }
   if (li100 == 2) {
      lprice256 = NormalizeDouble(Low[iLowest(NULL, 0, MODE_LOW, 2, 1)] - d512, Digits);
      lprice264 = NormalizeDouble(High[iHighest(NULL, 0, MODE_HIGH, 2, 1)] + d512 + spread584 * Point, Digits);
   }
   if (li100 == 3) {
      lprice256 = NormalizeDouble(MathMin(low576, low560) - d512, Digits);
      lprice264 = NormalizeDouble(MathMax(high568, high552) + d512 + spread584 * Point, Digits);
   }
   for (li160 = 0; li160 <= OrdersTotal(); li160++) {
      if (OrderSelect(li160, SELECT_BY_POS, MODE_TRADES) == FALSE) break;
      if (OrderType() == OP_BUY && OrderSymbol() == Symbol() && OrderMagicNumber() == l_magic_120) {
         if (l_stoplevel_136 > li40 && OrderStopLoss() < OrderOpenPrice() && OrderProfit() > 0.0 && (iHigh(NULL, PERIOD_H4, 0) - Close[0]) / Point >= li40) {
            OrderClose(OrderTicket(), OrderLots(), Bid, 3, CLR_NONE);
            RefreshRates();
            if (!(li116)) continue;
            Print("Close Order ", OrderTicket(), " ---> stop>min_stop");
            continue;
         }
         if ((TimeCurrent() - OrderOpenTime() > 60 * li80 && OrderStopLoss() < OrderOpenPrice() && Bid >= OrderOpenPrice()) || (li60 == TRUE && OrderProfit() > 0.0)) {
            OrderClose(OrderTicket(), OrderLots(), Bid, 3, CLR_NONE);
            if (!(li116)) continue;
            Print("Close Order ", OrderTicket(), " ---> time_of_close");
            continue;
         }
         if (li64 && MathAbs((OrderOpenPrice() - price456) / Point) > li68 && OrderProfit() > 0.0) {
            OrderClose(OrderTicket(), OrderLots(), Bid, 5, Yellow);
            if (li116) Print("Close Order ", OrderTicket(), " due to the price shock ", MathAbs((OrderOpenPrice() - price456) / Digits), " pips");
            if (!(li116)) continue;
            Print("OrderOpenPrise ", DoubleToStr(OrderOpenPrice(), Digits), ", PRICE_BUY ", DoubleToStr(price456, Digits));
            continue;
         }
         if (li72 == TRUE && OrderProfit() >= 0.0 && iClose(NULL, PERIOD_M1, 0) < iOpen(NULL, PERIOD_M1, 0) && Close[0] < iLow(NULL, PERIOD_M1, 1) && iClose(NULL, PERIOD_M1, 1) < iOpen(NULL, PERIOD_M1, 1) ||
            iClose(NULL, PERIOD_M1, 1) < iLow(NULL, PERIOD_M1, 1) + (iHigh(NULL, PERIOD_M1, 1) - iLow(NULL, PERIOD_M1, 1)) / 3.0) {
            OrderClose(OrderTicket(), OrderLots(), Bid, 3, Yellow);
            if (!(li116)) continue;
            Print("Close Order ", OrderTicket(), " ---> minimum_risk_M1");
            continue;
         }
         if (li76 == TRUE && OrderProfit() >= 0.0 && iClose(NULL, PERIOD_M5, 0) < iOpen(NULL, PERIOD_M5, 0) && Close[0] < iLow(NULL, PERIOD_M5, 1) && iClose(NULL, PERIOD_M5, 1) < iOpen(NULL, PERIOD_M5, 1) ||
            iClose(NULL, PERIOD_M5, 1) < iLow(NULL, PERIOD_M5, 1) + (iHigh(NULL, PERIOD_M5, 1) - iLow(NULL, PERIOD_M5, 1)) / 3.0) {
            OrderClose(OrderTicket(), OrderLots(), Bid, 3, Yellow);
            if (!(li116)) continue;
            Print("Close Order ", OrderTicket(), " ---> minimum_risk_M5");
            continue;
         }
         if (OrderStopLoss() < OrderOpenPrice()) {
            if (li52 == TRUE && Bid - OrderOpenPrice() >= MathCeil(l_stoplevel_136 * ld_84) * Point && Bid - OrderStopLoss() > MathCeil(l_stoplevel_136 * ld_84) * Point) {
               OrderModify(OrderTicket(), OrderOpenPrice(), NormalizeDouble(Bid - MathCeil(l_stoplevel_136 * ld_248) * Point, Digits), OrderTakeProfit(), 0, LightGreen);
               Print("������ � ���� BUY ����� ", OrderTicket());
               continue;
            }
            if (li52 == TRUE && Bid - OrderOpenPrice() >= MathCeil(l_stoplevel_136 * ld_84) * Point && Bid - OrderStopLoss() > MathCeil(l_stoplevel_136 * ld_84) * Point && OrderStopLoss() < NormalizeDouble(Bid - MathCeil(l_stoplevel_136 * ld_248 +
               l_stoplevel_136 / 10.0) * Point, Digits)) {
               OrderModify(OrderTicket(), OrderOpenPrice(), NormalizeDouble(Bid - MathCeil(l_stoplevel_136 * ld_248 + l_stoplevel_136 / 10.0) * Point, Digits), OrderTakeProfit(), 0, LightGreen);
               Print("������ � ���� BUY ����� ", OrderTicket());
               continue;
            }
            if (li56 == TRUE && OrderStopLoss() < lprice256 && Bid - lprice256 >= l_stoplevel_136 * Point) {
               if (li116) Print("Reduce losses OP_BUY order ", OrderTicket(), " moved S/L from ", DoubleToStr(OrderStopLoss(), Digits), " to ", DoubleToStr(lprice256, Digits), ". Methot S/L=", li100);
               OrderModify(OrderTicket(), OrderOpenPrice(), lprice256, OrderTakeProfit(), 0, LightGreen);
               continue;
            }
         }
         if (OrderStopLoss() >= OrderOpenPrice() && li48 == TRUE) {
            if (Bid - OrderStopLoss() > Point * l_pips_92 * l_stoplevel_136) {
               OrderModify(OrderTicket(), OrderOpenPrice(), NormalizeDouble(Bid - l_pips_92 * l_stoplevel_136 * Point, Digits), OrderTakeProfit(), 0, LightGreen);
               continue;
            }
         }
         if (OrderStopLoss() >= OrderOpenPrice() && li56 == TRUE && lprice256 > OrderStopLoss() && Bid - lprice256 >= l_stoplevel_136 * Point) {
            if (li116) Print("MovingS_L=true, Methot S/L=", li100, ". Increase Profit OP_BUY order ", OrderTicket(), " from ", DoubleToStr(OrderStopLoss(), Digits), " to ", DoubleToStr(lprice256, Digits));
            OrderModify(OrderTicket(), OrderOpenPrice(), lprice256, OrderTakeProfit(), 0, LightGreen);
            continue;
         }
      }
      if (OrderType() == OP_SELL && OrderSymbol() == Symbol() && OrderMagicNumber() == l_magic_120) {
         if (l_stoplevel_136 > li40 && OrderStopLoss() > OrderOpenPrice() && OrderProfit() > 0.0 && (Close[0] - iLow(NULL, PERIOD_H4, 0)) / Point >= li40) {
            OrderClose(OrderTicket(), OrderLots(), Ask, 3, CLR_NONE);
            RefreshRates();
            if (li116) Print("Close Order ", OrderTicket(), " ---> stop>min_stop");
         } else {
            if ((TimeCurrent() - OrderOpenTime() > 60 * li80 && OrderStopLoss() > OrderOpenPrice() && Ask <= OrderOpenPrice()) || (li60 == TRUE && OrderProfit() > 0.0)) OrderClose(OrderTicket(), OrderLots(), Ask, 3, CLR_NONE);
            else {
               if (li64 && MathAbs((price464 - OrderOpenPrice()) / Point) > li68 && OrderProfit() > 0.0) {
                  OrderClose(OrderTicket(), OrderLots(), Ask, 5, Yellow);
                  if (li116) Print("Close Order ", OrderTicket(), " due to the price shock ", MathAbs((OrderOpenPrice() - price464) / Digits), " pips");
                  if (li116) Print("OrderOpenPrise ", DoubleToStr(OrderOpenPrice(), Digits), ", PRICE_SELL ", DoubleToStr(price464, Digits));
               } else {
                  if (li72 == TRUE && OrderProfit() >= 0.0 && iClose(NULL, PERIOD_M1, 0) > iOpen(NULL, PERIOD_M1, 0) && Close[0] > iHigh(NULL, PERIOD_M1, 1) && iClose(NULL, PERIOD_M1, 1) > iOpen(NULL, PERIOD_M1, 1) ||
                     iClose(NULL, PERIOD_M1, 1) > iHigh(NULL, PERIOD_M1, 1) - (iHigh(NULL, PERIOD_M1, 1) - iLow(NULL, PERIOD_M1, 1)) / 3.0) {
                     OrderClose(OrderTicket(), OrderLots(), Ask, 3, Yellow);
                     if (li116) Print("Close Order ", OrderTicket(), " ---> minimum_risk_M1");
                  } else {
                     if (li76 == TRUE && OrderProfit() >= 0.0 && iClose(NULL, PERIOD_M5, 0) > iOpen(NULL, PERIOD_M5, 0) && Close[0] > iHigh(NULL, PERIOD_M5, 1) && iClose(NULL, PERIOD_M5, 1) > iOpen(NULL, PERIOD_M5, 1) ||
                        iClose(NULL, PERIOD_M5, 1) > iHigh(NULL, PERIOD_M5, 1) - (iHigh(NULL, PERIOD_M5, 1) - iLow(NULL, PERIOD_M5, 1)) / 3.0) {
                        OrderClose(OrderTicket(), OrderLots(), Ask, 3, Yellow);
                        if (li116) Print("Close Order ", OrderTicket(), " ---> minimum_risk_M5");
                     } else {
                        if (OrderStopLoss() > OrderOpenPrice()) {
                           if (li52 == TRUE && OrderOpenPrice() - Ask >= Point * MathCeil(l_stoplevel_136 * ld_84) && OrderStopLoss() - Ask > MathCeil(l_stoplevel_136 * ld_84) * Point) {
                              OrderModify(OrderTicket(), OrderOpenPrice(), NormalizeDouble(Ask + MathCeil(l_stoplevel_136 * ld_248) * Point, Digits), OrderTakeProfit(), 0, Pink);
                              Print("������ � ���� SELL ����� ", OrderTicket());
                              continue;
                           }
                           if (li52 == TRUE && OrderOpenPrice() - Ask >= Point * MathCeil(l_stoplevel_136 * ld_84) && OrderStopLoss() - Ask > MathCeil(l_stoplevel_136 * ld_84) * Point && OrderStopLoss() > NormalizeDouble(Ask +
                              MathCeil(l_stoplevel_136 * ld_248 + l_stoplevel_136 / 10.0) * Point, Digits)) {
                              OrderModify(OrderTicket(), OrderOpenPrice(), NormalizeDouble(Ask + MathCeil(l_stoplevel_136 * ld_248 + l_stoplevel_136 / 10.0) * Point, Digits), OrderTakeProfit(), 0, Pink);
                              Print("������ � ���� SELL ����� ", OrderTicket());
                              continue;
                           }
                           if (li56 == TRUE && OrderStopLoss() > lprice264 && lprice264 - Ask >= l_stoplevel_136 * Point) {
                              if (li116) Print("Reduce losses OP_SELL order ", OrderTicket(), " moved S/L from", DoubleToStr(OrderStopLoss(), Digits), " to ", DoubleToStr(lprice264, Digits), ". Methot S/L=", li100);
                              OrderModify(OrderTicket(), OrderOpenPrice(), lprice264, OrderTakeProfit(), 0, LightGreen);
                              continue;
                           }
                        }
                        if (OrderStopLoss() <= OrderOpenPrice() && li48 == TRUE) {
                           if (OrderStopLoss() - Ask > Point * l_pips_92 * l_stoplevel_136) {
                              OrderModify(OrderTicket(), OrderOpenPrice(), NormalizeDouble(Ask + l_pips_92 * l_stoplevel_136 * Point, Digits), OrderTakeProfit(), 0, Pink);
                              continue;
                           }
                        }
                        if (OrderStopLoss() <= OrderOpenPrice() && li56 == TRUE && lprice264 < OrderStopLoss() && lprice264 - Ask >= l_stoplevel_136 * Point) {
                           if (li116) Print("Tr.stop = false. Methot S/L=", li100, ". Increase Profit OP_SELL order ", OrderTicket(), " from ", DoubleToStr(OrderStopLoss(), Digits), " to ", DoubleToStr(lprice264, Digits));
                           OrderModify(OrderTicket(), OrderOpenPrice(), lprice264, OrderTakeProfit(), 0, LightGreen);
                        }
                     }
                  }
               }
            }
         }
      }
   }
}

void func3() {
   double l_ifractals_144;
   double l_ifractals_152;
   int li176;
   int li180;
   double lprice256;
   double lprice264;
   double ld_0 = lotpercent / 10000.0;
   double ld_8 = lotfixed;
   double ld_16 = 12;
   double ld_24 = 20;
   double ld_32 = 75;
   int li40 = 20;
   bool li44 = TRUE;
   bool li48 = TRUE;
   bool li52 = TRUE;
   bool li56 = TRUE;
   bool li60 = FALSE;
   bool li64 = TRUE;
   int li68 = 75;
   bool li72 = TRUE;
   bool li76 = TRUE;
   int li80 = 180;
   double ld_84 = 1;
   double l_pips_92 = 1;
   int li100 = 2;
   int li104 = 0;
   int li108 = 0;
   bool li112 = FALSE;
   bool li116 = FALSE;
   int l_magic_120 = 8888;
   bool li124 = TRUE;
   bool li128 = TRUE;
   if (ld_16 < 1.0 || ld_32 < 1.0) {
      Print("stop level below the requested soluble");
      return;
   }
   bool li132 = FALSE;
   if (time680 == 0) time680 = Time[0];
   if (time680 != Time[0]) {
      li132 = TRUE;
      time680 = Time[0];
   }
   int l_stoplevel_136 = MarketInfo(Symbol(), MODE_STOPLEVEL);
   if (l_stoplevel_136 < li40 && Digits == 5) l_stoplevel_136 = li40;
   if (l_stoplevel_136 < 2 && Digits == 4) l_stoplevel_136 = 2;
   if (li132 || lots788 == 0.0 || lots796 == 0.0 || price724 == 0.0 || price732 == 0.0 || price740 == 0.0 || price748 == 0.0 || price756 == 0.0 ||
      price764 == 0.0 || ticksize772 == 0.0 || d780 == 0.0) {
      spread852 = MarketInfo(Symbol(), MODE_SPREAD);
      if (li116) Print("spread = ", spread852, " ", Symbol());
      ticksize772 = MarketInfo(Symbol(), MODE_TICKSIZE);
      tickvalue812 = MarketInfo(Symbol(), MODE_TICKVALUE);
      marginrequired804 = MarketInfo(Symbol(), MODE_MARGINREQUIRED);
      if (Digits == 5) {
         d780 = 10.0 * ticksize772;
         i856 = 4;
      } else d780 = ticksize772;
      for (int li140 = 3; li140 < 100; li140++) {
         if (High[li140] >= High[li140 + 1] && High[li140] > High[li140 + 2] && High[li140] >= High[li140 - 1] && High[li140] > High[li140 - 2]) {
            high820 = High[li140];
            i860 = li140;
            time892 = Time[li140];
            break;
         }
      }
      for (li140 = i860 + 1; li140 < 100; li140++) {
         if (High[li140] >= High[li140 + 1] && High[li140] > High[li140 + 2] && High[li140] >= High[li140 - 1] && High[li140] > High[li140 - 2]) {
            high836 = High[li140];
            iunused864 = li140;
            break;
         }
      }
      for (li140 = 3; li140 < 100; li140++) {
         if (Low[li140] <= Low[li140 + 1] && Low[li140] < Low[li140 + 2] && Low[li140] <= Low[li140 - 1] && Low[li140] < Low[li140 - 2]) {
            low828 = Low[li140];
            i868 = li140;
            time896 = Time[li140];
            break;
         }
      }
      for (li140 = i868 + 1; li140 < 100; li140++) {
         if (Low[li140] <= Low[li140 + 1] && Low[li140] < Low[li140 + 2] && Low[li140] <= Low[li140 - 1] && Low[li140] < Low[li140 - 2]) {
            low844 = Low[li140];
            iunused872 = li140;
            break;
         }
      }
      l_ifractals_144 = iFractals(NULL, 0, MODE_UPPER, 0);
      l_ifractals_152 = iFractals(NULL, 0, MODE_LOWER, 0);
      ialligator700 = iAlligator(NULL, 0, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORLIPS, 0);
      ialligator708 = iAlligator(NULL, 0, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORTEETH, 0);
      ialligator716 = iAlligator(NULL, 0, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORJAW, 0);
      iao684 = iAO(NULL, 0, 1);
      iao692 = iAO(NULL, 0, 2);
      for (int li160 = 1; li160 <= 1000; li160++) {
         if ((iAO(NULL, 0, li160 + 1) > 0.0 && iAO(NULL, 0, li160) > iAO(NULL, 0, li160 + 1) && iAO(NULL, 0, li160 + 1) < iAO(NULL, 0, li160 + 2)) || (iAO(NULL, 0, li160) > 0.0 &&
            iAO(NULL, 0, li160 + 1) < 0.0)) {
            i876 = li160;
            i884 = Time[li160];
            break;
         }
      }
      for (li160 = 1; li160 <= 1000; li160++) {
         if ((iAO(NULL, 0, li160 + 1) < 0.0 && iAO(NULL, 0, li160) < iAO(NULL, 0, li160 + 1) && iAO(NULL, 0, li160 + 1) > iAO(NULL, 0, li160 + 2)) || (iAO(NULL, 0, li160) < 0.0 &&
            iAO(NULL, 0, li160 + 1) > 0.0)) {
            i880 = li160;
            i888 = Time[li160];
            break;
         }
      }
      if (li116) Print("shift_ao_buy=", i876, ", shift_ao_sell=", i880);
      price724 = NormalizeDouble(Proc3(high820, low828, li128, spread852, Point, li124, i884, i888, time892, time896, High[iHighest(NULL, 0, MODE_HIGH, i860 - 1, 1)], Low[iLowest(NULL, 0, MODE_LOW, i868 - 1, 1)], High[i876], Low[i880]), Digits);
      if (li100 == 1) price756 = NormalizeDouble(price724 - ld_16 * l_stoplevel_136 * Point, Digits);
      if (li100 == 2) {
         price756 = NormalizeDouble(Low[iLowest(NULL, 0, MODE_LOW, 2, 0)] - d780, Digits);
         if ((price724 - price756) / Point > ld_24 * l_stoplevel_136) price756 = NormalizeDouble(price724 - ld_24 * l_stoplevel_136 * Point, Digits);
      }
      if (li100 == 3) {
         price756 = NormalizeDouble(MathMin( low844, low828) - d780, Digits);
         if (( price724 - price756) / Point > ld_24 * l_stoplevel_136) price756 = NormalizeDouble(price724 - ld_24 * l_stoplevel_136 * Point, Digits);
      }
      if (li116) Print("SL_BUY = ", price756, " ", Symbol());
      price740 = NormalizeDouble(price724 + ld_32 * l_stoplevel_136 * Point, Digits);
      if (li116) Print("TP_BUY = ", price740, " ", Symbol());
      price732 = NormalizeDouble(Proc4(high820, low828, li128, spread852, Point, li124, i884, i888, time892, time896, High[iHighest(NULL, 0, MODE_HIGH, i860 - 1, 1)], Low[iLowest(NULL, 0, MODE_LOW, i868 - 1, 1)], High[i876], Low[i880]), Digits);
      if (li100 == 1) price764 = NormalizeDouble(price732 + (ld_16 * l_stoplevel_136 + spread852) * Point, Digits);
      if (li100 == 2) {
         price764 = NormalizeDouble(High[iHighest(NULL, 0, MODE_HIGH, 2, 0)] + spread852 * Point + d780, Digits);
         if ((price764 - price732) / Point > ld_24 * l_stoplevel_136) price764 = NormalizeDouble(price732 + (ld_24 * l_stoplevel_136 + spread852) * Point, Digits);
      }
      if (li100 == 3) {
         price764 = NormalizeDouble(MathMax(high820, high836) + spread852 * Point + d780, Digits);
         if ((price764 - price732) / Point > ld_24 * l_stoplevel_136) price764 = NormalizeDouble(price732 + (ld_24 * l_stoplevel_136 + spread852) * Point, Digits);
      }
      if (li116) Print("SL_SELL = ", price764, " ", Symbol());
      price748 = NormalizeDouble(price732 - ld_32 * l_stoplevel_136 * Point, Digits);
      if (li116) Print("TP_SELL = ", price748, " ", Symbol());
      lots796 = GetLots(price724,price756);//0.1;
      lots788 = GetLots(price732,price764);//0.1;
      /*if (AccountBalance() > 500.0) {
         lots796 = NormalizeDouble(AccountBalance() * ld_0, LotDecimal);
         lots788 = NormalizeDouble(AccountBalance() * ld_0, LotDecimal);
         for (li160 = OrdersHistoryTotal() - 1; li160 >= 0; li160--) {
            if (OrderSelect(li160, SELECT_BY_POS, MODE_HISTORY) == FALSE) break;
            if (OrderSymbol() == Symbol() && OrderMagicNumber() == l_magic_120) {
               if (OrderLots() <= NormalizeDouble(AccountBalance() * ld_0, LotDecimal)) {
                  lots796 = NormalizeDouble(AccountBalance() * ld_0, LotDecimal);
                  lots788 = NormalizeDouble(AccountBalance() * ld_0, LotDecimal);
                  break;
               }
               lots796 = NormalizeDouble(OrderLots(), LotDecimal);
               lots788 = NormalizeDouble(OrderLots(), LotDecimal);
               break;
            }
         }
      }
      if (ld_8 > 0.0) {
         lots796 = NormalizeDouble(ld_8, LotDecimal);
         lots788 = NormalizeDouble(ld_8, LotDecimal);
      }
      if (lots796 > NormalizeDouble(AccountFreeMargin() / (1.05 * marginrequired804), LotDecimal) || lots788 > NormalizeDouble(AccountFreeMargin() / (1.05 * marginrequired804), LotDecimal)) {
         lots796 = NormalizeDouble(AccountFreeMargin() / (1.05 * marginrequired804), LotDecimal);
         lots788 = NormalizeDouble(AccountFreeMargin() / (1.05 * marginrequired804), LotDecimal);
      }*/
   }
   bool li164 = TRUE;
   /*if (AccountFreeMargin() < MarketInfo(Symbol(), MODE_MARGINREQUIRED) / 10.0) {
      li164 = FALSE;
      Print("No money");
   }*/
   int li168 = 15;
   if (li132) i920 = TRUE;
   if (MathAbs((d908 - Close[0]) / Point) > li68 && d908 != 0.0 && li64) {
      i904 = TRUE;
      datetime916 = TimeCurrent();
      if (i920 == TRUE) {
         if (li116) Print("The price shock for ", (d908 - Close[0]) / Point, " pips.", Symbol());
         if (li116) Print("last_price ", DoubleToStr(d908, Digits), ", curent_price ", DoubleToStr(Close[0], Digits));
         i920 = FALSE;
      }
   }
   d908 = Close[0];
   bool li172 = TRUE;
   if (li104 != 0) {
      li176 = 60 * li104 + li108;
      li180 = 60 * TimeHour(TimeCurrent()) + TimeMinute(TimeCurrent());
      if (li176 - li180 <= 20 && li180 - li176 <= 15) li172 = FALSE;
   }
   if (li132) i924 = TRUE;
   if (li172 == TRUE) {
      if (DayOfWeek() == 5 && TimeCurrent() - iTime(NULL, PERIOD_D1, 0) > 79200) {
         li172 = FALSE;
         if (i924 == TRUE) {
            if (li116) Print("Friday, ending trading.");
            i924 = FALSE;
         }
      }
   }
   if (li132) i928 = TRUE;
   if (li172 == TRUE) {
      if ((DayOfWeek() == 1 && TimeCurrent() - iTime(NULL, PERIOD_D1, 0) < 3900) || DayOfWeek() == 6 || DayOfWeek() == 7) {
         li172 = FALSE;
         if (i928 == TRUE) {
            if (li116) Print("Monday, prior to 1-00 in the morning do not trade. Or off.");
            i928 = FALSE;
         }
      }
   }
   double l_ord_open_price_184 = 0;
   double l_ord_open_price_192 = 0;
   for (li160 = 0; li160 < OrdersTotal(); li160++) {
      if (OrderSelect(li160, SELECT_BY_POS, MODE_TRADES) == FALSE) break;
      if (OrderType() == OP_BUYSTOP && OrderSymbol() == Symbol() && OrderMagicNumber() == 777) l_ord_open_price_184 = OrderOpenPrice();
      if (OrderType() == OP_SELLSTOP && OrderSymbol() == Symbol() && OrderMagicNumber() == 777) l_ord_open_price_192 = OrderOpenPrice();
   }
   bool li200 = TRUE;
   bool li204 = TRUE;
   int l_count_208 = 0;
   int l_count_212 = 0;
   if (li132) {
      i932 = TRUE;
      i936 = TRUE;
   }
   for (li160 = 0; li160 < OrdersTotal(); li160++) {
      if (OrderSelect(li160, SELECT_BY_POS, MODE_TRADES) == FALSE) break;
      if (OrderType() == OP_BUY && OrderSymbol() == Symbol() && OrderMagicNumber() == l_magic_120) {
         if (OrderTicket() == ticket940 && li112) {
            PlaySound("alert.wav");
            ticket940 = 0;
         }
         if (OrderOpenTime() >= Time[0]) {
            i932 = FALSE;
            continue;
         }
      }
      if (OrderType() == OP_BUYSTOP && OrderSymbol() == Symbol() && OrderMagicNumber() == l_magic_120) {
         li200 = FALSE;
         ticket940 = OrderTicket();
         l_count_208++;
         if (l_count_208 > 1) {
            OrderDelete(OrderTicket());
            continue;
         }
         if (i904 && OrderOpenPrice() - Ask < l_stoplevel_136 << 2 * Point) {
            OrderDelete(OrderTicket());
            i900 = FALSE;
            Print("Delete order ", OrderTicket(), " due to the price shock");
            continue;
         }
         if (li172 == FALSE) {
            OrderDelete(OrderTicket());
            if (!(li116)) continue;
            Print("Delete order ", OrderTicket(), "PERMIS_TRADE=", li172);
            continue;
         }
         if (li44 && MathAbs(OrderOpenPrice() - l_ord_open_price_184) / Point < l_stoplevel_136) {
            OrderDelete(OrderTicket());
            if (!(li116)) continue;
            Print("Order ", OrderTicket(), " deleted because of the similarity with a Day Extremum");
            continue;
         }
         if (showorders == FALSE && OrderOpenPrice() - Close[0] > 300.0 * Point) {
            OrderDelete(OrderTicket());
            if (!(li116)) continue;
            Print("Order ", OrderTicket(), " deleted because price far");
            continue;
         }
         if (OrderOpenPrice() - price724 >= 50.0 * Point || price724 - OrderOpenPrice() >= 50.0 * Point && Ask <= OrderOpenPrice() - l_stoplevel_136 * Point) OrderModify(OrderTicket(), price724, price756, price740, 0, Blue);
         else
            if (OrderOpenPrice() - price724 < 50.0 * Point || price724 - OrderOpenPrice() < 50.0 * Point && Ask <= OrderOpenPrice() - l_stoplevel_136 * Point && NormalizeDouble(OrderOpenPrice(), i856) != NormalizeDouble(price724, i856)) OrderModify(OrderTicket(), price724, price756, price740, 0, CLR_NONE);
         if (NormalizeDouble(OrderStopLoss(), i856) != NormalizeDouble(price756, i856)) {
            if (li116) Print("modify StopLoss, order ", OrderTicket(), " from ", OrderStopLoss(), " to ", price756);
            OrderModify(OrderTicket(), OrderOpenPrice(), price756, OrderTakeProfit(), 0, CLR_NONE);
         }
         if (NormalizeDouble(OrderLots(), LotDecimal) != NormalizeDouble(lots796, LotDecimal)) {
            if (li116) Print("modify lots, order ", OrderTicket(), " from ", OrderLots(), " to ", lots796);
            OrderDelete(OrderTicket());
         }
      }
      if (OrderType() == OP_SELL && OrderSymbol() == Symbol() && OrderMagicNumber() == l_magic_120) {
         if (OrderTicket() == ticket944 && li112) {
            PlaySound("alert.wav");
            ticket944 = 0;
         }
         if (OrderOpenTime() >= Time[0]) {
            i936 = FALSE;
            continue;
         }
      }
      if (OrderType() == OP_SELLSTOP && OrderSymbol() == Symbol() && OrderMagicNumber() == l_magic_120) {
         li204 = FALSE;
         ticket944 = OrderTicket();
         l_count_212++;
         if (l_count_212 > 1) OrderDelete(OrderTicket());
         else {
            if (i904 && Bid - OrderOpenPrice() < l_stoplevel_136 << 2 * Point) {
               OrderDelete(OrderTicket());
               i900 = FALSE;
               if (li116) Print("Delete order ", OrderTicket(), " due to the price shock");
            } else {
               if (li172 == FALSE) OrderDelete(OrderTicket());
               else {
                  if (li44 && MathAbs(OrderOpenPrice() - l_ord_open_price_192) / Point < l_stoplevel_136) {
                     OrderDelete(OrderTicket());
                     if (li116) Print("Order ", OrderTicket(), " closed because of the similarity with a Day Extremum");
                  } else {
                     if (showorders == FALSE && Close[0] - OrderOpenPrice() > 300.0 * Point) {
                        OrderDelete(OrderTicket());
                        if (li116) Print("Order ", OrderTicket(), " delited because price far");
                     } else {
                        if (OrderOpenPrice() - price732 >= 50.0 * Point || price732 - OrderOpenPrice() >= 50.0 * Point && Bid >= OrderOpenPrice() + l_stoplevel_136 * Point) OrderModify(OrderTicket(), price732, price764, price748, 0, Red);
                        else
                           if (OrderOpenPrice() - price732 < 50.0 * Point || price732 - OrderOpenPrice() < 50.0 * Point && Bid >= OrderOpenPrice() + l_stoplevel_136 * Point && NormalizeDouble(OrderOpenPrice(), i856) != NormalizeDouble(price732, i856)) OrderModify(OrderTicket(), price732, price764, price748, 0, CLR_NONE);
                        if (NormalizeDouble(OrderStopLoss(), i856) != NormalizeDouble(price764, i856)) OrderModify(OrderTicket(), OrderOpenPrice(), price764, OrderTakeProfit(), 0, CLR_NONE);
                        if (NormalizeDouble(OrderLots(), LotDecimal) != NormalizeDouble(lots788, LotDecimal)) OrderDelete(OrderTicket());
                     }
                  }
               }
            }
         }
      }
   }
   if ((TimeCurrent() - datetime916) / 60 > li168) {
      i900 = TRUE;
      i904 = FALSE;
   }
   bool li216 = TRUE;
   bool li220 = TRUE;
   if (High[iHighest(NULL, 0, MODE_HIGH, i860 - 1, 0)] >= High[i860]) li216 = FALSE;
   if (Low[iLowest(NULL, 0, MODE_LOW, i868 - 1, 0)] <= Low[i868]) li220 = FALSE;
   bool li224 = TRUE;
   bool li228 = TRUE;
   if (li124 == FALSE || li216 || i884 < time892 || High[iHighest(NULL, 0, MODE_HIGH, i876, 0)] >= High[i876]) li224 = FALSE;
   if (li124 == FALSE || li220 || i888 < time896 || Low[iLowest(NULL, 0, MODE_LOW, i880, 0)] <= Low[i880]) li228 = FALSE;
   bool li232 = TRUE;
   bool li236 = TRUE;
   if (li44 && MathAbs(price724 - l_ord_open_price_184) / Point < l_stoplevel_136) li232 = FALSE;
   if (li44 && MathAbs(price732 - l_ord_open_price_192) / Point < l_stoplevel_136) li236 = FALSE;
   bool li240 = TRUE;
   bool li244 = TRUE;
   if (showorders == FALSE) {
      if (price724 - Close[0] > 150.0 * Point) li240 = FALSE;
      if (Close[0] - price732 > 150.0 * Point) li244 = FALSE;
   }
   if ((li240 && li232 && li164 && i900 && li172 && li216 && i932 && li200 && Ask <= price724 - l_stoplevel_136 * Point) || (li240 && li232 && li164 &&
      i900 && li172 && li224 && i932 && li200 && Ask <= price724 - l_stoplevel_136 * Point)) OrderSend(Symbol(), OP_BUYSTOP, lots796, price724, 0, NormalizeDouble(price756,Digits), NormalizeDouble(price740,Digits), "Fractals", l_magic_120, 0, Blue);
   if ((li244 && li236 && li164 && i900 && li172 && li220 && i936 && li204 && Bid >= price732 + l_stoplevel_136 * Point) || (li244 && li236 && li164 &&
      i900 && li172 && li228 && i936 && li204 && Bid >= price732 + l_stoplevel_136 * Point)) OrderSend(Symbol(), OP_SELLSTOP, lots788, price732, 0, NormalizeDouble(price764,Digits), NormalizeDouble(price748,Digits), "Fractals", l_magic_120, 0, Red);
   double ld_248 = ld_84;
   if (ld_84 < 1.0) ld_248 = 1;
   if (li100 == 1) {
      lprice256 = NormalizeDouble(Bid - ld_16 * l_stoplevel_136 * Point, Digits);
      lprice264 = NormalizeDouble(Ask + ld_16 * l_stoplevel_136 * Point, Digits);
   }
   if (li100 == 2) {
      lprice256 = NormalizeDouble(Low[iLowest(NULL, 0, MODE_LOW, 2, 1)] - d780, Digits);
      lprice264 = NormalizeDouble(High[iHighest(NULL, 0, MODE_HIGH, 2, 1)] + d780 + spread852 * Point, Digits);
   }
   if (li100 == 3) {
      lprice256 = NormalizeDouble(MathMin(low844, low828) - d780, Digits);
      lprice264 = NormalizeDouble(MathMax(high836, high820) + d780 + spread852 * Point, Digits);
   }
   for (li160 = 0; li160 <= OrdersTotal(); li160++) {
      if (OrderSelect(li160, SELECT_BY_POS, MODE_TRADES) == FALSE) break;
      if (OrderType() == OP_BUY && OrderSymbol() == Symbol() && OrderMagicNumber() == l_magic_120) {
         if (l_stoplevel_136 > li40 && OrderStopLoss() < OrderOpenPrice() && OrderProfit() > 0.0 && (iHigh(NULL, PERIOD_H4, 0) - Close[0]) / Point >= li40) {
            OrderClose(OrderTicket(), OrderLots(), Bid, 3, CLR_NONE);
            RefreshRates();
            if (!(li116)) continue;
            Print("Close Order ", OrderTicket(), " ---> stop>min_stop");
            continue;
         }
         if ((TimeCurrent() - OrderOpenTime() > 60 * li80 && OrderStopLoss() < OrderOpenPrice() && Bid >= OrderOpenPrice()) || (li60 == TRUE && OrderProfit() > 0.0)) {
            OrderClose(OrderTicket(), OrderLots(), Bid, 3, CLR_NONE);
            if (!(li116)) continue;
            Print("Close Order ", OrderTicket(), " ---> time_of_close");
            continue;
         }
         if (li64 && MathAbs((OrderOpenPrice() - price724) / Point) > li68 && OrderProfit() > 0.0) {
            OrderClose(OrderTicket(), OrderLots(), Bid, 5, Yellow);
            if (li116) Print("Close Order ", OrderTicket(), " due to the price shock ", MathAbs((OrderOpenPrice() - price724) / Digits), " pips");
            if (!(li116)) continue;
            Print("OrderOpenPrise ", DoubleToStr(OrderOpenPrice(), Digits), ", PRICE_BUY ", DoubleToStr(price724, Digits));
            continue;
         }
         if (li72 == TRUE && OrderProfit() >= 0.0 && iClose(NULL, PERIOD_M1, 0) < iOpen(NULL, PERIOD_M1, 0) && Close[0] < iLow(NULL, PERIOD_M1, 1) && iClose(NULL, PERIOD_M1, 1) < iOpen(NULL, PERIOD_M1, 1) ||
            iClose(NULL, PERIOD_M1, 1) < iLow(NULL, PERIOD_M1, 1) + (iHigh(NULL, PERIOD_M1, 1) - iLow(NULL, PERIOD_M1, 1)) / 3.0) {
            OrderClose(OrderTicket(), OrderLots(), Bid, 3, Yellow);
            if (!(li116)) continue;
            Print("Close Order ", OrderTicket(), " ---> minimum_risk_M1");
            continue;
         }
         if (li76 == TRUE && OrderProfit() >= 0.0 && iClose(NULL, PERIOD_M5, 0) < iOpen(NULL, PERIOD_M5, 0) && Close[0] < iLow(NULL, PERIOD_M5, 1) && iClose(NULL, PERIOD_M5, 1) < iOpen(NULL, PERIOD_M5, 1) ||
            iClose(NULL, PERIOD_M5, 1) < iLow(NULL, PERIOD_M5, 1) + (iHigh(NULL, PERIOD_M5, 1) - iLow(NULL, PERIOD_M5, 1)) / 3.0) {
            OrderClose(OrderTicket(), OrderLots(), Bid, 3, Yellow);
            if (!(li116)) continue;
            Print("Close Order ", OrderTicket(), " ---> minimum_risk_M5");
            continue;
         }
         if (OrderStopLoss() < OrderOpenPrice()) {
            if (li52 == TRUE && Bid - OrderOpenPrice() >= MathCeil(l_stoplevel_136 * ld_84) * Point && Bid - OrderStopLoss() > MathCeil(l_stoplevel_136 * ld_84) * Point) {
               OrderModify(OrderTicket(), OrderOpenPrice(), NormalizeDouble(Bid - MathCeil(l_stoplevel_136 * ld_248) * Point, Digits), OrderTakeProfit(), 0, LightGreen);
               Print("������ � ���� BUY ����� ", OrderTicket());
               continue;
            }
            if (li52 == TRUE && Bid - OrderOpenPrice() >= MathCeil(l_stoplevel_136 * ld_84) * Point && Bid - OrderStopLoss() > MathCeil(l_stoplevel_136 * ld_84) * Point && OrderStopLoss() < NormalizeDouble(Bid - MathCeil(l_stoplevel_136 * ld_248 +
               l_stoplevel_136 / 10.0) * Point, Digits)) {
               OrderModify(OrderTicket(), OrderOpenPrice(), NormalizeDouble(Bid - MathCeil(l_stoplevel_136 * ld_248 + l_stoplevel_136 / 10.0) * Point, Digits), OrderTakeProfit(), 0, LightGreen);
               Print("������ � ���� BUY ����� ", OrderTicket());
               continue;
            }
            if (li56 == TRUE && OrderStopLoss() < lprice256 && Bid - lprice256 >= l_stoplevel_136 * Point) {
               if (li116) Print("Reduce losses OP_BUY order ", OrderTicket(), " moved S/L from ", DoubleToStr(OrderStopLoss(), Digits), " to ", DoubleToStr(lprice256, Digits), ". Methot S/L=", li100);
               OrderModify(OrderTicket(), OrderOpenPrice(), lprice256, OrderTakeProfit(), 0, LightGreen);
               continue;
            }
         }
         if (OrderStopLoss() >= OrderOpenPrice() && li48 == TRUE) {
            if (Bid - OrderStopLoss() > Point * l_pips_92 * l_stoplevel_136) {
               OrderModify(OrderTicket(), OrderOpenPrice(), NormalizeDouble(Bid - l_pips_92 * l_stoplevel_136 * Point, Digits), OrderTakeProfit(), 0, LightGreen);
               continue;
            }
         }
         if (OrderStopLoss() >= OrderOpenPrice() && li56 == TRUE && lprice256 > OrderStopLoss() && Bid - lprice256 >= l_stoplevel_136 * Point) {
            if (li116) Print("MovingS_L=true, Methot S/L=", li100, ". Increase Profit OP_BUY order ", OrderTicket(), " from ", DoubleToStr(OrderStopLoss(), Digits), " to ", DoubleToStr(lprice256, Digits));
            OrderModify(OrderTicket(), OrderOpenPrice(), lprice256, OrderTakeProfit(), 0, LightGreen);
            continue;
         }
      }
      if (OrderType() == OP_SELL && OrderSymbol() == Symbol() && OrderMagicNumber() == l_magic_120) {
         if (l_stoplevel_136 > li40 && OrderStopLoss() > OrderOpenPrice() && OrderProfit() > 0.0 && (Close[0] - iLow(NULL, PERIOD_H4, 0)) / Point >= li40) {
            OrderClose(OrderTicket(), OrderLots(), Ask, 3, CLR_NONE);
            RefreshRates();
            if (li116) Print("Close Order ", OrderTicket(), " ---> stop>min_stop");
         } else {
            if ((TimeCurrent() - OrderOpenTime() > 60 * li80 && OrderStopLoss() > OrderOpenPrice() && Ask <= OrderOpenPrice()) || (li60 == TRUE && OrderProfit() > 0.0)) OrderClose(OrderTicket(), OrderLots(), Ask, 3, CLR_NONE);
            else {
               if (li64 && MathAbs((price732 - OrderOpenPrice()) / Point) > li68 && OrderProfit() > 0.0) {
                  OrderClose(OrderTicket(), OrderLots(), Ask, 5, Yellow);
                  if (li116) Print("Close Order ", OrderTicket(), " due to the price shock ", MathAbs((OrderOpenPrice() - price732) / Digits), " pips");
                  if (li116) Print("OrderOpenPrise ", DoubleToStr(OrderOpenPrice(), Digits), ", PRICE_SELL ", DoubleToStr(price732, Digits));
               } else {
                  if (li72 == TRUE && OrderProfit() >= 0.0 && iClose(NULL, PERIOD_M1, 0) > iOpen(NULL, PERIOD_M1, 0) && Close[0] > iHigh(NULL, PERIOD_M1, 1) && iClose(NULL, PERIOD_M1, 1) > iOpen(NULL, PERIOD_M1, 1) ||
                     iClose(NULL, PERIOD_M1, 1) > iHigh(NULL, PERIOD_M1, 1) - (iHigh(NULL, PERIOD_M1, 1) - iLow(NULL, PERIOD_M1, 1)) / 3.0) {
                     OrderClose(OrderTicket(), OrderLots(), Ask, 3, Yellow);
                     if (li116) Print("Close Order ", OrderTicket(), " ---> minimum_risk_M1");
                  } else {
                     if (li76 == TRUE && OrderProfit() >= 0.0 && iClose(NULL, PERIOD_M5, 0) > iOpen(NULL, PERIOD_M5, 0) && Close[0] > iHigh(NULL, PERIOD_M5, 1) && iClose(NULL, PERIOD_M5, 1) > iOpen(NULL, PERIOD_M5, 1) ||
                        iClose(NULL, PERIOD_M5, 1) > iHigh(NULL, PERIOD_M5, 1) - (iHigh(NULL, PERIOD_M5, 1) - iLow(NULL, PERIOD_M5, 1)) / 3.0) {
                        OrderClose(OrderTicket(), OrderLots(), Ask, 3, Yellow);
                        if (li116) Print("Close Order ", OrderTicket(), " ---> minimum_risk_M5");
                     } else {
                        if (OrderStopLoss() > OrderOpenPrice()) {
                           if (li52 == TRUE && OrderOpenPrice() - Ask >= Point * MathCeil(l_stoplevel_136 * ld_84) && OrderStopLoss() - Ask > MathCeil(l_stoplevel_136 * ld_84) * Point) {
                              OrderModify(OrderTicket(), OrderOpenPrice(), NormalizeDouble(Ask + MathCeil(l_stoplevel_136 * ld_248) * Point, Digits), OrderTakeProfit(), 0, Pink);
                              Print("������ � ���� SELL ����� ", OrderTicket());
                              continue;
                           }
                           if (li52 == TRUE && OrderOpenPrice() - Ask >= Point * MathCeil(l_stoplevel_136 * ld_84) && OrderStopLoss() - Ask > MathCeil(l_stoplevel_136 * ld_84) * Point && OrderStopLoss() > NormalizeDouble(Ask +
                              MathCeil(l_stoplevel_136 * ld_248 + l_stoplevel_136 / 10.0) * Point, Digits)) {
                              OrderModify(OrderTicket(), OrderOpenPrice(), NormalizeDouble(Ask + MathCeil(l_stoplevel_136 * ld_248 + l_stoplevel_136 / 10.0) * Point, Digits), OrderTakeProfit(), 0, Pink);
                              Print("������ � ���� SELL ����� ", OrderTicket());
                              continue;
                           }
                           if (li56 == TRUE && OrderStopLoss() > lprice264 && lprice264 - Ask >= l_stoplevel_136 * Point) {
                              if (li116) Print("Reduce losses OP_SELL order ", OrderTicket(), " moved S/L from", DoubleToStr(OrderStopLoss(), Digits), " to ", DoubleToStr(lprice264, Digits), ". Methot S/L=", li100);
                              OrderModify(OrderTicket(), OrderOpenPrice(), lprice264, OrderTakeProfit(), 0, LightGreen);
                              continue;
                           }
                        }
                        if (OrderStopLoss() <= OrderOpenPrice() && li48 == TRUE) {
                           if (OrderStopLoss() - Ask > Point * l_pips_92 * l_stoplevel_136) {
                              OrderModify(OrderTicket(), OrderOpenPrice(), NormalizeDouble(Ask + l_pips_92 * l_stoplevel_136 * Point, Digits), OrderTakeProfit(), 0, Pink);
                              continue;
                           }
                        }
                        if (OrderStopLoss() <= OrderOpenPrice() && li56 == TRUE && lprice264 < OrderStopLoss() && lprice264 - Ask >= l_stoplevel_136 * Point) {
                           if (li116) Print("Tr.stop = false. Methot S/L=", li100, ". Increase Profit OP_SELL order ", OrderTicket(), " from ", DoubleToStr(OrderStopLoss(), Digits), " to ", DoubleToStr(lprice264, Digits));
                           OrderModify(OrderTicket(), OrderOpenPrice(), lprice264, OrderTakeProfit(), 0, LightGreen);
                        }
                     }
                  }
               }
            }
         }
      }
   }
}
double GetLots(double Price, double Stop) {
   double LotsToRisk,Lots;
   if (lotfixed>0) return(lotfixed);
   if (Digits==5||Digits==3) int X=10;
   else X=1;
   double Pt=X*Point;
   int StopLossInPips = MathAbs(Price-Stop)/Pt;
   int    Decimals = 0;
   double LotStep = MarketInfo(Symbol(), MODE_LOTSTEP);
   double LotSize = MarketInfo(Symbol(), MODE_LOTSIZE);
   double LotTickValue = MarketInfo(Symbol(), MODE_TICKVALUE)*X;
   double MIN_lots = MarketInfo(Symbol(),MODE_MINLOT);
   double MAX_lots = MarketInfo(Symbol(),MODE_MAXLOT);

   if(LotStep == 0.01)
      Decimals = 2;
   if(LotStep == 0.1)
      Decimals = 1;
   if (StopLossInPips==0) StopLossInPips = 100;
   LotsToRisk = ((AccountFreeMargin()*lotpercent)/100)/StopLossInPips;
   Lots = StrToDouble(DoubleToStr(LotsToRisk/LotTickValue,Decimals));
   if (Lots < MIN_lots) Lots = MIN_lots;
   if (Lots > MAX_lots) Lots = MAX_lots;
   return(NormalizeDouble(Lots,Decimals));    
}


        
