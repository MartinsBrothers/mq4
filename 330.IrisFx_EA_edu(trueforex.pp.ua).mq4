/*
#import "IrisFx.dll"
   int InitDll(int a0);
   double Proc1(int a0, int a1, double a2, double a3, int a4, int a5, double a6, double a7, double a8, double a9);
   double Proc2(int a0, int a1, double a2, double a3, int a4, int a5, double a6, double a7, double a8, double a9);
   double Proc3(double a0, double a1, int a2, int a3, double a4, int a5, int a6, int a7, int a8, int a9, double a10, double a11, double a12, double a13);
   double Proc4(double a0, double a1, int a2, int a3, double a4, int a5, int a6, int a7, int a8, int a9, double a10, double a11, double a12, double a13);
#import
*/


// IrisFX EA educated!!! No Dll!! Please share your best setting and modify code~~

double Proc3(double a0, double a1, int a2, int a3, double a4, int a5, int a6, int a7, int a8, int a9, double a10, double a11, double a12, double a13)
{
  double v17; // Spread Piont
  double result; 

  v17 = a3 * a4;

  if ( a5 == true && a0 <= a10 && a6 > a8 )
    result = v17 + a12;
  else
    result = v17 + a0;
  return (result);
}

double Proc4(double a0, double a1, int a2, int a3, double a4, int a5, int a6, int a7, int a8, int a9, double a10, double a11, double a12, double a13)
{
  double v17; // Spread Piont
  double v18; // g_high_552 - spread
  double result; 

  v17 = a3 * a4;
  v18 = a1 - v17;
  if ( a5 == true)
  {
    if ( a1 < a11 || a8 <= a10 )
      result = v18;
    else
      result = a13 - v17;
  }
  else
  {
    result = v18;
  }
  return (result);
}



extern string Strategy1 = "EURUSD_H1";
extern string Strategy2 = "EURUSD_H1";
extern string Strategy3 = "EURUSD_H4";
extern int strategy = 1;
extern double lot_percent = 10.0;
extern double lot_fixed = 0.0;
extern bool show_orders = TRUE;
extern int Magic1 = 777;
extern int Magic2 = 999;
extern int Magic3 = 8888;
extern bool    UseHourTrade1 = false;
extern int     FromHourTrade1 = 6,
               ToHourTrade1 = 18;
extern bool    UseHourTrade2 = false;
extern int     FromHourTrade2 = 6,
               ToHourTrade2 = 18;
bool g_bool_124 = FALSE;
datetime g_time_128;
double g_ihigh_132;
double g_ilow_140;
double g_price_148;
double g_price_156;
double g_price_164;
double g_price_172;
double g_price_180;
double g_price_188;
double g_ticksize_196;
double gd_204;
double g_lots_212;
double g_lots_220;
double g_marginrequired_228;
double g_tickvalue_236;
double gd_244;
double gd_252;
double gd_260;
double gd_268;
int g_spread_276;
int gi_280;
int gi_284;
int gi_unused_288;
int gi_292;
int gi_unused_296;
double g_ihigh_300;
double g_ilow_308;
int g_datetime_316;
int g_datetime_320;
int gi_324;
int gi_328;
bool gi_332 = TRUE;
bool gi_336 = FALSE;
double gd_340;
int g_datetime_348;
bool gi_352 = TRUE;
bool gi_356 = TRUE;
bool gi_360 = TRUE;
bool gi_364 = TRUE;
bool gi_368 = TRUE;
bool gi_372 = TRUE;
bool gi_376 = TRUE;
int g_ticket_380;
int g_ticket_384;
double g_ord_open_price_388;
double g_ord_open_price_396;
double g_bid_404;
datetime g_time_412;
double g_iao_416;
double g_iao_424;
double g_ialligator_432;
double g_ialligator_440;
double g_ialligator_448;
double g_price_456;
double g_price_464;
double g_price_472;
double g_price_480;
double g_price_488;
double g_price_496;
double g_ticksize_504;
double gd_512;
double g_lots_520;
double g_lots_528;
double g_marginrequired_536;
double g_tickvalue_544;
double g_high_552;
double g_low_560;
double g_high_568;
double g_low_576;
int g_spread_584;
int gi_588;
int gi_592;
int gi_unused_596;
int gi_600;
int gi_unused_604;
int gi_608;
int gi_612;
int gi_616;
int gi_620;
datetime g_time_624;
datetime g_time_628;
bool gi_632 = TRUE;
bool gi_636 = FALSE;
double gd_640;
int g_datetime_648;
bool gi_652 = TRUE;
bool gi_656 = TRUE;
bool gi_660 = TRUE;
bool gi_664 = TRUE;
bool gi_668 = TRUE;
int g_ticket_672;
int g_ticket_676;
datetime g_time_680;
double g_iao_684;
double g_iao_692;
double g_ialligator_700;
double g_ialligator_708;
double g_ialligator_716;
double g_price_724;
double g_price_732;
double g_price_740;
double g_price_748;
double g_price_756;
double g_price_764;
double g_ticksize_772;
double gd_780;
double g_lots_788;
double g_lots_796;
double g_marginrequired_804;
double g_tickvalue_812;
double g_high_820;
double g_low_828;
double g_high_836;
double g_low_844;
int g_spread_852;
int gi_856;
int gi_860;
int gi_unused_864;
int gi_868;
int gi_unused_872;
int gi_876;
int gi_880;
int gi_884;
int gi_888;
datetime g_time_892;
datetime g_time_896;
bool gi_900 = TRUE;
bool gi_904 = FALSE;
double gd_908;
int g_datetime_916;
bool gi_920 = TRUE;
bool gi_924 = TRUE;
bool gi_928 = TRUE;
bool gi_932 = TRUE;
bool gi_936 = TRUE;
int g_ticket_940;
int g_ticket_944;
int LotDecimal = 1;

int init() {
   //g_bool_124 = InitDll(WindowHandle(Symbol(), Period())) == 1;
   //if (!g_bool_124) Alert("IrisFx can\'t run on this account#");
   if (MarketInfo(Symbol(),MODE_MINLOT)<0.1) LotDecimal=2;
   else if (MarketInfo(Symbol(),MODE_MINLOT)>=1.0) LotDecimal=0;
   if (strategy > 3 || strategy <= 0) Alert("Strategy should be = either 1, 2 or 3");
   return (0);
}
bool IsTradeTime1() {
   if ((FromHourTrade1 < ToHourTrade1) && ((Hour() < FromHourTrade1) || (Hour() >= ToHourTrade1))) return (false);
   if (FromHourTrade1 > ToHourTrade1 && Hour() < FromHourTrade1 && Hour() >= ToHourTrade1) return (false);
   return (true);
}
bool IsTradeTime2() {
   if ((FromHourTrade2 < ToHourTrade2) && ((Hour() < FromHourTrade2) || (Hour() >= ToHourTrade2))) return (false);
   if (FromHourTrade2 > ToHourTrade2 && Hour() < FromHourTrade2 && Hour() >= ToHourTrade2) return (false);
   return (true);
}

int start() {
   //if (!g_bool_124) return (0);
   if ((UseHourTrade1 && !IsTradeTime1()) || (UseHourTrade2 && !IsTradeTime2())) {
      Comment("Outside trading time");
      DeletePOs(strategy);
      return;
      }
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
   int li_184;
   int li_188;
   double l_price_252;
   double l_price_260;
   double ld_0 = lot_percent / 10000.0;
   double ld_8 = lot_fixed;
   double ld_16 = 12;
   double ld_24 = 20;
   double ld_32 = 75;
   bool li_40 = TRUE;
   bool li_44 = TRUE;
   bool li_48 = TRUE;
   bool li_52 = FALSE;
   bool li_56 = FALSE;
   int li_60 = 75;
   bool li_64 = TRUE;
   int li_68 = 45;
   bool li_72 = TRUE;
   bool li_76 = TRUE;
   bool li_80 = TRUE;
   bool li_84 = FALSE;
   int li_88 = 20;
   int li_92 = 180;
   double ld_96 = 1;
   double l_pips_104 = 1;
   int li_112 = 2;
   int li_116 = 0;
   int li_120 = 0;
   bool li_124 = FALSE;
   bool li_128 = true;
   bool li_132 = FALSE;
   int li_140 = 1;
   if (ld_16 < 1.0 || ld_32 < 1.0) {
      Print("stop level below the requested soluble");
      return;
   }
   bool li_144 = FALSE;
   if (g_time_128 == 0) g_time_128 = Time[0];
   if (g_time_128 != Time[0]) {
      li_144 = TRUE;
      g_time_128 = Time[0];
   }
   g_ihigh_300 = iHigh(NULL, PERIOD_D1, 1);
   g_ilow_308 = iLow(NULL, PERIOD_D1, 1);
   if (DayOfWeek() == 1) {
      if (li_144) Print("Today is Monday");
      for (int li_148 = 1; li_148 < 7; li_148++) {
         if (TimeDayOfWeek(iTime(NULL, PERIOD_D1, li_148)) == 5) {
            g_ihigh_300 = iHigh(NULL, PERIOD_D1, li_148);
            g_ilow_308 = iLow(NULL, PERIOD_D1, li_148);
            if (!(li_144)) break;
            Print("Maximum price on Friday is ", DoubleToStr(g_ihigh_300, Digits));
            Print("Minimum price on Friday is ", DoubleToStr(g_ilow_308, Digits));
            break;
         }
      }
   }
   bool li_152 = TRUE;
   bool li_156 = TRUE;
   g_ihigh_132 = iHigh(NULL, PERIOD_D1, 0);
   g_ilow_140 = iLow(NULL, PERIOD_D1, 0);
   if (g_ihigh_132 - g_ihigh_300 >= li_88 * Point || g_ihigh_132 < g_ihigh_300 || li_84 == FALSE) li_152 = FALSE;
   if (g_ilow_308 - g_ilow_140 >= li_88 * Point || g_ilow_140 > g_ilow_308 || li_84 == FALSE) li_156 = FALSE;
   int l_stoplevel_160 = MarketInfo(Symbol(), MODE_STOPLEVEL);
   if (l_stoplevel_160 < 20 && Digits == 5) l_stoplevel_160 = 20;
   if (l_stoplevel_160 < 2 && Digits == 4) l_stoplevel_160 = 2;
   if (li_152 || li_156 || li_144 || g_ihigh_132 == 0.0 || g_ilow_140 == 0.0 || g_lots_212 == 0.0 || g_lots_220 == 0.0 || g_price_148 == 0.0 || g_price_156 == 0.0 || g_price_164 == 0.0 ||
      g_price_172 == 0.0 || g_price_180 == 0.0 || g_price_188 == 0.0 || g_ticksize_196 == 0.0 || gd_204 == 0.0) {
      g_spread_276 = MarketInfo(Symbol(), MODE_SPREAD);
      if (li_128) Print("spread = ", g_spread_276, " ", Symbol());
      g_ticksize_196 = MarketInfo(Symbol(), MODE_TICKSIZE);
      g_tickvalue_236 = MarketInfo(Symbol(), MODE_TICKVALUE);
      g_marginrequired_228 = MarketInfo(Symbol(), MODE_MARGINREQUIRED);
      if (Digits == 5) {
         gd_204 = 10.0 * g_ticksize_196;
         gi_280 = 4;
      } else gd_204 = g_ticksize_196;
      for (int li_164 = 3; li_164 < 100; li_164++) {
         if (High[li_164] >= High[li_164 + 1] && High[li_164] > High[li_164 + 2] && High[li_164] >= High[li_164 - 1] && High[li_164] > High[li_164 - 2]) {
            gd_244 = NormalizeDouble(High[li_164], Digits);
            gi_284 = li_164;
            break;
         }
      }
      for (li_164 = gi_284 + 1; li_164 < 100; li_164++) {
         if (High[li_164] >= High[li_164 + 1] && High[li_164] > High[li_164 + 2] && High[li_164] >= High[li_164 - 1] && High[li_164] > High[li_164 - 2]) {
            gd_260 = NormalizeDouble(High[li_164], Digits);
            gi_unused_288 = li_164;
            break;
         }
      }
      for (li_164 = 3; li_164 < 100; li_164++) {
         if (Low[li_164] <= Low[li_164 + 1] && Low[li_164] < Low[li_164 + 2] && Low[li_164] <= Low[li_164 - 1] && Low[li_164] < Low[li_164 - 2]) {
            gd_252 = NormalizeDouble(Low[li_164], Digits);
            gi_292 = li_164;
            break;
         }
      }
      for (li_164 = gi_292 + 1; li_164 < 100; li_164++) {
         if (Low[li_164] <= Low[li_164 + 1] && Low[li_164] < Low[li_164 + 2] && Low[li_164] <= Low[li_164 - 1] && Low[li_164] < Low[li_164 - 2]) {
            gd_268 = NormalizeDouble(Low[li_164], Digits);
            gi_unused_296 = li_164;
            break;
         }
      }
      for (int li_168 = 1; li_168 < 150; li_168++) {
         if (NormalizeDouble(iHigh(NULL, PERIOD_H1, li_168), gi_280) == NormalizeDouble(g_ihigh_300, gi_280) && DayOfWeek() != TimeDayOfWeek(iTime(NULL, PERIOD_H1, li_168))) {
            g_datetime_316 = iTime(NULL, PERIOD_H1, li_168);
            gi_324 = li_168;
            break;
         }
      }
      for (li_168 = 1; li_168 < 150; li_168++) {
         if (NormalizeDouble(iLow(NULL, PERIOD_H1, li_168), gi_280) == NormalizeDouble(g_ilow_308, gi_280) && DayOfWeek() != TimeDayOfWeek(iTime(NULL, PERIOD_H1, li_168))) {
            g_datetime_320 = iTime(NULL, PERIOD_H1, li_168);
            gi_328 = li_168;
            break;
         }
      }
      if (li_128) Print("time_high = ", TimeHour(g_datetime_316), " time_low= ", TimeHour(g_datetime_320));
      if (li_128) Print("bar_high = ", gi_324, " bar_low= ", gi_328);
      if (li_128) Print("high_yesterday = ", DoubleToStr(g_ihigh_300, Digits), " low_yesterday= ", DoubleToStr(g_ilow_308, Digits));
      if (li_152) g_price_148=NormalizeDouble((g_spread_276+li_140)*Point+g_ihigh_132,Digits);
      else g_price_148=NormalizeDouble((g_spread_276+li_140)*Point+g_ihigh_300,Digits);
      //g_price_148 = NormalizeDouble(Proc1(li_152, li_156, g_ihigh_300, g_ihigh_132, g_spread_276, li_140, Point, ld_16, g_ilow_308, g_ilow_140), Digits);
      if (li_128) Print("PRICE_BUY = ", g_price_148, " high_day= ", DoubleToStr(g_ihigh_132, Digits), " ", Symbol());
      if (li_112 == 1) {
         g_price_180 = NormalizeDouble(g_price_148 - ld_16 * l_stoplevel_160 * Point, Digits);
         if (li_128) Print("SL_BUY = ", g_price_180, " ", Symbol());
      }
      if (li_112 == 2) {
         g_price_180 = NormalizeDouble(Low[iLowest(NULL, 0, MODE_LOW, 2, 0)] - gd_204, Digits);
         if ((g_price_148 - g_price_180) / Point > ld_24 * l_stoplevel_160) g_price_180 = NormalizeDouble(g_price_148 - ld_24 * l_stoplevel_160 * Point, Digits);
      }
      if (li_112 == 3) {
         g_price_180 = NormalizeDouble(MathMin(gd_268, gd_252) - gd_204, Digits);
         if ((g_price_148 - g_price_180) / Point > ld_24 * l_stoplevel_160) g_price_180 = NormalizeDouble(g_price_148 - ld_24 * l_stoplevel_160 * Point, Digits);
      }
      if (li_128) Print("SL_BUY = ", g_price_180, " ", Symbol());
      g_price_164 = NormalizeDouble(g_price_148 + ld_32 * l_stoplevel_160 * Point, Digits);
      if (li_128) Print("TP_BUY = ", g_price_164, " ", Symbol());
      if (li_156) g_price_156=NormalizeDouble(g_ilow_140-(g_spread_276)*Point,Digits);
      else g_price_156=NormalizeDouble(g_ilow_308-(g_spread_276)*Point,Digits);
      //g_price_156 = NormalizeDouble(Proc2(li_152, li_156, g_ihigh_300, g_ihigh_132, g_spread_276, li_140, Point, ld_16, g_ilow_308, g_ilow_140), Digits);
      if (li_128) Print("PRICE_SELL = ", g_price_156, " low_day= ", DoubleToStr(g_ilow_140, Digits), " ", Symbol());
      if (li_112 == 1) g_price_188 = NormalizeDouble(g_price_156 + (ld_16 * l_stoplevel_160 + g_spread_276) * Point, Digits);
      if (li_112 == 2) {
         g_price_188 = NormalizeDouble(High[iHighest(NULL, 0, MODE_HIGH, 2, 0)] + g_spread_276 * Point + gd_204, Digits);
         if ((g_price_188 - g_price_156) / Point > ld_24 * l_stoplevel_160) g_price_188 = NormalizeDouble(g_price_156 + (ld_24 * l_stoplevel_160 + g_spread_276) * Point, Digits);
      }
      if (li_112 == 3) {
         g_price_188 = NormalizeDouble(MathMax(gd_244, gd_260) + g_spread_276 * Point + gd_204, Digits);
         if ((g_price_188 - g_price_156) / Point > ld_24 * l_stoplevel_160) g_price_188 = NormalizeDouble(g_price_156 + (ld_24 * l_stoplevel_160 + g_spread_276) * Point, Digits);
      }
      if (li_128) Print("SL_SELL = ", g_price_188, " ", Symbol());
      g_price_172 = NormalizeDouble(g_price_156 - ld_32 * l_stoplevel_160 * Point, Digits);
      if (li_128) Print("TP_SELL = ", g_price_172, " ", Symbol());
      g_lots_220 = 0.1;
      g_lots_212 = 0.1;
      if (AccountBalance() > 500.0) {
         g_lots_220 = NormalizeDouble(AccountBalance() * ld_0, LotDecimal);
         g_lots_212 = NormalizeDouble(AccountBalance() * ld_0, LotDecimal);
         for (li_148 = OrdersHistoryTotal() - 1; li_148 >= 0; li_148--) {
            if (OrderSelect(li_148, SELECT_BY_POS, MODE_HISTORY) == FALSE) break;
            if (OrderSymbol() == Symbol() && OrderMagicNumber() == Magic1) {
               if (OrderLots() <= NormalizeDouble(AccountBalance() * ld_0,LotDecimal)) {
                  g_lots_220 = NormalizeDouble(AccountBalance() * ld_0, LotDecimal);
                  g_lots_212 = NormalizeDouble(AccountBalance() * ld_0, LotDecimal);
                  break;
               }
               g_lots_220 = NormalizeDouble(OrderLots(), LotDecimal);
               g_lots_212 = NormalizeDouble(OrderLots(), LotDecimal);
               break;
            }
         }
      }
      if (ld_8 > 0.0) {
         g_lots_220 = NormalizeDouble(ld_8, LotDecimal);
         g_lots_212 = NormalizeDouble(ld_8, LotDecimal);
      }
      if (g_lots_220 > NormalizeDouble(AccountFreeMargin() / (1.05 * g_marginrequired_228), LotDecimal) || g_lots_212 > NormalizeDouble(AccountFreeMargin() / (1.05 * g_marginrequired_228), LotDecimal)) {
         g_lots_220 = NormalizeDouble(AccountFreeMargin() / (1.05 * g_marginrequired_228), LotDecimal);
         g_lots_212 = NormalizeDouble(AccountFreeMargin() / (1.05 * g_marginrequired_228), LotDecimal);
      }
   }
   bool li_172 = TRUE;
   if (AccountFreeMargin() < MarketInfo(Symbol(), MODE_MARGINREQUIRED) / 10.0) {
      li_172 = FALSE;
      Print("No money");
   }
   int li_176 = 15;
   if (li_144) gi_352 = TRUE;
   if (MathAbs((gd_340 - Close[0]) / Point) > li_60 && gd_340 != 0.0 && li_56) {
      gi_336 = TRUE;
      g_datetime_348 = TimeCurrent();
      if (gi_352 == TRUE) {
         if (li_128) Print("The price shock for ", (gd_340 - Close[0]) / Point, " pips.", Symbol());
         if (li_128) Print("last_price ", DoubleToStr(gd_340, Digits), ", curent_price ", DoubleToStr(Close[0], Digits));
         gi_352 = FALSE;
      }
   }
   gd_340 = Close[0];
   bool li_180 = TRUE;
   if (li_116 != 0) {
      li_184 = 60 * li_116 + li_120;
      li_188 = 60 * TimeHour(TimeCurrent()) + TimeMinute(TimeCurrent());
      if (li_184 - li_188 <= 20 && li_188 - li_184 <= 15) li_180 = FALSE;
   }
   if (li_144) gi_356 = TRUE;
   if (li_180 == TRUE) {
      if (DayOfWeek() == 5 && TimeCurrent() - iTime(NULL, PERIOD_D1, 0) > 79200) {
         li_180 = FALSE;
         if (gi_356 == TRUE) {
            if (li_128) Print("Friday, ending trading.");
            gi_356 = FALSE;
         }
      }
   }
   if (li_144) gi_360 = TRUE;
   if (li_180 == TRUE) {
      if (DayOfWeek() == 1 && TimeCurrent() - iTime(NULL, PERIOD_D1, 0) < 3900) {
         li_180 = FALSE;
         if (gi_360 == TRUE) {
            if (li_128) Print("Monday, prior to 1-00 in the morning do not trade. Or off.");
            gi_360 = FALSE;
         }
      }
   }
   if (li_144) gi_364 = TRUE;
   bool li_192 = TRUE;
   if ((TimeHour(TimeCurrent()) <= 2 && gi_324 <= 8) || TimeHour(g_datetime_316) == 0) {
      li_192 = FALSE;
      if (gi_364 == TRUE) {
         if (li_128) Print("��� 8 ����� �� ����������. �� �������.");
         gi_364 = FALSE;
      }
   }
   if (li_144) gi_368 = TRUE;
   bool li_196 = TRUE;
   if ((TimeHour(TimeCurrent()) <= 2 && gi_328 <= 8) || TimeHour(g_datetime_320) == 0) {
      li_196 = FALSE;
      if (gi_368 == TRUE) {
         if (li_128) Print("��� 8 ����� �� ����������. �� �������.");
         gi_368 = FALSE;
      }
   }
   if (li_144) gi_372 = TRUE;
   bool li_200 = TRUE;
   if (l_stoplevel_160 > 50) {
      li_200 = FALSE;
      if (gi_372 == TRUE) {
         if (li_128) Print("Stop > 50. Stop trade.");
         gi_372 = FALSE;
      }
   }
   if (li_144) gi_376 = TRUE;
   bool li_204 = TRUE;
   if (li_132 && g_spread_276 > 20 && Symbol() == "EURUSD") {
      li_204 = FALSE;
      if (gi_376 == TRUE) {
         if (li_128) Print("Spread > 20. Stop trade.");
         gi_376 = FALSE;
      }
   }
   bool li_208 = TRUE;
   bool li_212 = TRUE;
   bool li_216 = TRUE;
   bool li_220 = TRUE;
   for (li_148 = 0; li_148 < OrdersTotal(); li_148++) {
      if (OrderSelect(li_148, SELECT_BY_POS, MODE_TRADES) == FALSE) break;
      if (OrderType() == OP_BUY && OrderSymbol() == Symbol() && OrderMagicNumber() == Magic1) {
         if (OrderTicket() == g_ticket_380 && li_124) {
            PlaySound("alert.wav");
            g_ticket_380 = 0;
         }
         if (OrderOpenTime() >= Time[0]) {
            li_208 = FALSE;
            continue;
         }
      }
      if (OrderType() == OP_BUYSTOP && OrderSymbol() == Symbol() && OrderMagicNumber() == Magic1) {
         li_216 = FALSE;
         g_ord_open_price_388 = OrderOpenPrice();
         g_ticket_380 = OrderTicket();
         if (li_200 == FALSE) {
            OrderDelete(OrderTicket());
            if (!(li_128)) continue;
            Print("Delete order  ", OrderTicket(), " GOOD_STOP=false");
            continue;
         }
         if (gi_336 && OrderOpenPrice() - Ask < l_stoplevel_160 << 2 * Point) {
            OrderDelete(OrderTicket());
            gi_332 = FALSE;
            if (!(li_128)) continue;
            Print("Delete order  ", OrderTicket(), " due to the price shock");
            continue;
         }
         if (li_180 == FALSE || li_192 == FALSE) {
            OrderDelete(OrderTicket());
            if (!(li_128)) continue;
            Print("Delete order ", OrderTicket(), "PERMIS_TRADE=", li_180, " PERMIS_BUY1=", li_192);
            continue;
         }
         if (show_orders == FALSE && OrderOpenPrice() - Close[0] > 300.0 * Point) {
            OrderDelete(OrderTicket());
            if (!(li_128)) continue;
            Print("Order ", OrderTicket(), " delited because price far");
            continue;
         }
         if (OrderOpenPrice() - g_price_148 >= 50.0 * Point || g_price_148 - OrderOpenPrice() >= 50.0 * Point && Ask <= OrderOpenPrice() - l_stoplevel_160 * Point) OrderModify(OrderTicket(), g_price_148, g_price_180, g_price_164, 0, Blue);
         else
            if (OrderOpenPrice() - g_price_148 < 50.0 * Point || g_price_148 - OrderOpenPrice() < 50.0 * Point && Ask <= OrderOpenPrice() - l_stoplevel_160 * Point && NormalizeDouble(OrderOpenPrice(), gi_280) != NormalizeDouble(g_price_148, gi_280)) OrderModify(OrderTicket(), g_price_148, g_price_180, g_price_164, 0, CLR_NONE);
         if (NormalizeDouble(OrderStopLoss(), gi_280) != NormalizeDouble(g_price_180, gi_280)) {
            if (li_128) Print("modify StopLoss, order ", OrderTicket(), " from ", OrderStopLoss(), " to ", g_price_180);
            OrderModify(OrderTicket(), OrderOpenPrice(), g_price_180, OrderTakeProfit(), 0, CLR_NONE);
         }
         if (NormalizeDouble(OrderLots(), LotDecimal) != NormalizeDouble(g_lots_220, LotDecimal)) {
            if (li_128) Print("modify lots, order ", OrderTicket(), " from ", OrderLots(), " to ", g_lots_220);
            OrderDelete(OrderTicket());
         }
      }
      if (OrderType() == OP_SELL && OrderSymbol() == Symbol() && OrderMagicNumber() == Magic1) {
         if (OrderTicket() == g_ticket_384 && li_124) {
            PlaySound("alert.wav");
            g_ticket_384 = 0;
         }
         if (OrderOpenTime() >= Time[0]) {
            li_212 = FALSE;
            continue;
         }
      }
      if (OrderType() == OP_SELLSTOP && OrderSymbol() == Symbol() && OrderMagicNumber() == Magic1) {
         li_220 = FALSE;
         g_ord_open_price_396 = OrderOpenPrice();
         g_ticket_384 = OrderTicket();
         if (li_200 == FALSE) {
            OrderDelete(OrderTicket());
            if (!(li_128)) continue;
            Print("Delete order  ", OrderTicket(), " GOOD_STOP=false");
            continue;
         }
         if (gi_336 && Bid - OrderOpenPrice() < l_stoplevel_160 << 2 * Point) {
            OrderDelete(OrderTicket());
            gi_332 = FALSE;
            if (!(li_128)) continue;
            Print("Delete order ", OrderTicket(), " due to the price shock");
            continue;
         }
         if (li_180 == FALSE || li_196 == FALSE) {
            OrderDelete(OrderTicket());
            if (!(li_128)) continue;
            Print("Delete order ", OrderTicket(), "PERMIS_TRADE=", li_180, " PERMIS_SELL1=", li_196);
            continue;
         }
         if (show_orders == FALSE && Close[0] - OrderOpenPrice() > 300.0 * Point) {
            OrderDelete(OrderTicket());
            if (!(li_128)) continue;
            Print("Order ", OrderTicket(), " delited because price far");
            continue;
         }
         if (OrderOpenPrice() - g_price_156 >= 50.0 * Point || g_price_156 - OrderOpenPrice() >= 50.0 * Point && Bid >= OrderOpenPrice() + l_stoplevel_160 * Point) OrderModify(OrderTicket(), g_price_156, g_price_188, g_price_172, 0, Red);
         else
            if (OrderOpenPrice() - g_price_156 < 50.0 * Point || g_price_156 - OrderOpenPrice() < 50.0 * Point && Bid >= OrderOpenPrice() + l_stoplevel_160 * Point && NormalizeDouble(OrderOpenPrice(), gi_280) != NormalizeDouble(g_price_156, gi_280)) OrderModify(OrderTicket(), g_price_156, g_price_188, g_price_172, 0, CLR_NONE);
         if (NormalizeDouble(OrderStopLoss(), gi_280) != NormalizeDouble(g_price_188, gi_280)) {
            if (li_128) Print("modify StopLoss, order  ", OrderTicket(), " from ", OrderStopLoss(), " to ", g_price_188);
            OrderModify(OrderTicket(), OrderOpenPrice(), g_price_188, OrderTakeProfit(), 0, CLR_NONE);
         }
         if (NormalizeDouble(OrderLots(), LotDecimal) != NormalizeDouble(g_lots_212, LotDecimal)) {
            if (li_128) Print("modify lots, order ", OrderTicket(), " from ", OrderLots(), " to ", g_lots_212);
            OrderDelete(OrderTicket());
         }
      }
      RefreshRates();
   }
   if ((TimeCurrent() - g_datetime_348) / 60 > li_176) {
      gi_332 = TRUE;
      gi_336 = FALSE;
   }
   bool li_224 = TRUE;
   bool li_228 = TRUE;
   if (iHigh(NULL, PERIOD_D1, 0) + (g_spread_276 + li_140) * Point > g_price_148) li_224 = FALSE;
   if (iLow(NULL, PERIOD_D1, 0) - li_140 * Point < g_price_156) li_228 = FALSE;
   bool li_232 = TRUE;
   bool li_236 = TRUE;
   if (show_orders == FALSE) {
      if (g_price_148 - Close[0] > 150.0 * Point) li_232 = FALSE;
      if (Close[0] - g_price_156 > 150.0 * Point) li_236 = FALSE;
   }
   if (li_200 && li_204 && li_232 && li_172 && gi_332 && li_180 && li_224 && li_192 && li_208 && li_216)
      if (Ask <= g_price_148 - l_stoplevel_160 * Point) OrderSend(Symbol(), OP_BUYSTOP, g_lots_220, g_price_148, 0, NormalizeDouble(g_price_180,Digits), NormalizeDouble(g_price_164,Digits), "Day Extremum", Magic1, 0, Blue);
   if (li_200 && li_204 && li_236 && li_172 && gi_332 && li_180 && li_228 && li_196 && li_212 && li_220)
      if (Bid >= g_price_156 + l_stoplevel_160 * Point) OrderSend(Symbol(), OP_SELLSTOP, g_lots_212, g_price_156, 0, NormalizeDouble(g_price_188,Digits), NormalizeDouble(g_price_172,Digits), "Day Extremum", Magic1, 0, Red);
   if (g_bid_404 == 0.0) g_bid_404 = Bid;
   double ld_240 = ld_96;
   if (ld_96 < 1.0) ld_240 = 1;
   int li_248 = MarketInfo(Symbol(), MODE_STOPLEVEL);
   if (li_112 == 1) {
      l_price_252 = NormalizeDouble(Bid - ld_16 * l_stoplevel_160 * Point, Digits);
      l_price_260 = NormalizeDouble(Ask + ld_16 * l_stoplevel_160 * Point, Digits);
   }
   if (li_112 == 2) {
      l_price_252 = NormalizeDouble(Low[iLowest(NULL, 0, MODE_LOW, 2, 1)] - gd_204, Digits);
      l_price_260 = NormalizeDouble(High[iHighest(NULL, 0, MODE_HIGH, 2, 1)] + gd_204 + g_spread_276 * Point, Digits);
   }
   if (li_112 == 3) {
      l_price_252 = NormalizeDouble(MathMin(gd_268, gd_252) - gd_204, Digits);
      l_price_260 = NormalizeDouble(MathMax(gd_260, gd_244) + gd_204 + g_spread_276 * Point, Digits);
   }
   for (li_148 = 0; li_148 <= OrdersTotal(); li_148++) {
      if (OrderSelect(li_148, SELECT_BY_POS, MODE_TRADES) == FALSE) break;
      if (OrderType() == OP_BUY && OrderSymbol() == Symbol() && OrderMagicNumber() == Magic1) {
         if (li_80 && Close[0] < iLow(NULL, PERIOD_H1, 1)) {
            OrderClose(OrderTicket(), OrderLots(), Bid, 3, CLR_NONE);
            RefreshRates();
            if (!(li_128)) continue;
            Print("Close Order ", OrderTicket(), " Close H1");
            continue;
         }
         if (li_200 == FALSE && OrderStopLoss() < OrderOpenPrice() && OrderProfit() > 0.0) {
            OrderClose(OrderTicket(), OrderLots(), Bid, 3, CLR_NONE);
            RefreshRates();
            if (!(li_128)) continue;
            Print("Close Order ", OrderTicket(), " ---> stop>50");
            continue;
         }
         if ((TimeCurrent() - OrderOpenTime() > 60 * li_92 && OrderStopLoss() < OrderOpenPrice() && Bid >= OrderOpenPrice()) || (li_52 == TRUE && OrderProfit() > 0.0)) {
            OrderClose(OrderTicket(), OrderLots(), Bid, 3, CLR_NONE);
            RefreshRates();
            if (!(li_128)) continue;
            Print("Close Order ", OrderTicket(), " ---> time_of_close");
            continue;
         }
         if (li_56 && MathAbs((OrderOpenPrice() - g_ord_open_price_388) / Point) > li_60 && OrderProfit() > 0.0) {
            OrderClose(OrderTicket(), OrderLots(), Bid, 10, Yellow);
            RefreshRates();
            if (li_128) Print("Close Order ", OrderTicket(), " due to the price shock ", MathAbs((OrderOpenPrice() - g_ord_open_price_388) / Digits), " pips");
            if (!(li_128)) continue;
            Print("OrderOpenPrise ", DoubleToStr(OrderOpenPrice(), Digits), ", PRICE_BUY1 ", DoubleToStr(g_ord_open_price_388, Digits));
            continue;
         }
         if (li_64 && g_ihigh_132 - OrderOpenPrice() >= li_68 * Point && Bid - OrderOpenPrice() < 5.0 * Point && Bid - OrderOpenPrice() >= 0.0 && Bid < g_bid_404) {
            OrderClose(OrderTicket(), OrderLots(), Bid, 3, CLR_NONE);
            RefreshRates();
            Print("�������� ����� BUY ", OrderTicket(), ", ", (Bid - OrderOpenPrice()) / Point, " ������� � �������, �������� ���� ", DoubleToStr(Bid - g_bid_404, Digits));
            Print("������� ���� ", DoubleToStr(Bid, Digits), "  ���������� ���� ", DoubleToStr(g_bid_404, Digits));
            continue;
         }
         if (li_72 == TRUE && OrderProfit() >= 0.0 && iClose(NULL, PERIOD_M1, 0) < iOpen(NULL, PERIOD_M1, 0) && Close[0] < iLow(NULL, PERIOD_M1, 1) && iClose(NULL, PERIOD_M1, 1) < iOpen(NULL, PERIOD_M1, 1) ||
            iClose(NULL, PERIOD_M1, 1) < iLow(NULL, PERIOD_M1, 1) + (iHigh(NULL, PERIOD_M1, 1) - iLow(NULL, PERIOD_M1, 1)) / 3.0) {
            OrderClose(OrderTicket(), OrderLots(), Bid, 3, Yellow);
            RefreshRates();
            if (!(li_128)) continue;
            Print("Close Order ", OrderTicket(), " ---> minimum_risk_M1");
            continue;
         }
         if (li_76 == TRUE && OrderProfit() >= 0.0 && iClose(NULL, PERIOD_M5, 0) < iOpen(NULL, PERIOD_M5, 0) && Close[0] < iLow(NULL, PERIOD_M5, 1) && iClose(NULL, PERIOD_M5, 1) < iOpen(NULL, PERIOD_M5, 1) ||
            iClose(NULL, PERIOD_M5, 1) < iLow(NULL, PERIOD_M5, 1) + (iHigh(NULL, PERIOD_M5, 1) - iLow(NULL, PERIOD_M5, 1)) / 3.0) {
            OrderClose(OrderTicket(), OrderLots(), Bid, 3, Yellow);
            RefreshRates();
            if (!(li_128)) continue;
            Print("Close Order ", OrderTicket(), " ---> minimum_risk_M5");
            continue;
         }
         if (OrderStopLoss() < OrderOpenPrice()) {
            if (li_248 < 50) {
               if (li_44 == TRUE && Bid - OrderOpenPrice() >= MathCeil(l_stoplevel_160 * ld_96) * Point && Bid - OrderStopLoss() > MathCeil(l_stoplevel_160 * ld_96) * Point) {
                  OrderModify(OrderTicket(), OrderOpenPrice(), NormalizeDouble(Bid - MathCeil(l_stoplevel_160 * ld_240) * Point, Digits), OrderTakeProfit(), 0, LightGreen);
                  Print("������ � ���� BUY ����� ", OrderTicket());
                  RefreshRates();
                  continue;
               }
            } else {
               if (li_44 == TRUE && Bid - OrderOpenPrice() >= MathCeil(l_stoplevel_160 * ld_96) * Point && Bid - OrderStopLoss() > MathCeil(l_stoplevel_160 * ld_96) * Point && OrderStopLoss() < NormalizeDouble(Bid - MathCeil(l_stoplevel_160 * ld_240 +
                  l_stoplevel_160 / 10.0) * Point, Digits)) {
                  OrderModify(OrderTicket(), OrderOpenPrice(), NormalizeDouble(Bid - MathCeil(l_stoplevel_160 * ld_240 + l_stoplevel_160 / 10.0) * Point, Digits), OrderTakeProfit(), 0, LightGreen);
                  Print("������ � ���� BUY ����� ", OrderTicket());
                  RefreshRates();
                  continue;
               }
            }
            if (li_48 == TRUE && OrderStopLoss() < l_price_252 && Bid - l_price_252 >= l_stoplevel_160 * Point) {
               if (li_128) Print("Reduce losses OP_BUY order ", OrderTicket(), " moved S/L from ", DoubleToStr(OrderStopLoss(), Digits), " to ", DoubleToStr(l_price_252, Digits), ". Methot S/L=", li_112);
               OrderModify(OrderTicket(), OrderOpenPrice(), l_price_252, OrderTakeProfit(), 0, LightGreen);
               RefreshRates();
               continue;
            }
         }
         if (OrderStopLoss() >= OrderOpenPrice() && li_40 == TRUE) {
            if (Bid - OrderStopLoss() > Point * l_pips_104 * l_stoplevel_160) {
               OrderModify(OrderTicket(), OrderOpenPrice(), NormalizeDouble(Bid - l_pips_104 * l_stoplevel_160 * Point, Digits), OrderTakeProfit(), 0, LightGreen);
               RefreshRates();
               continue;
            }
         }
         if (OrderStopLoss() >= OrderOpenPrice() && li_48 == TRUE && l_price_252 > OrderStopLoss() && Bid - l_price_252 >= l_stoplevel_160 * Point) {
            if (li_128) Print("Moving_S_L=true, Methot S/L=", li_112, ". Increase Profit OP_BUY order ", OrderTicket(), " from ", DoubleToStr(OrderStopLoss(), Digits), " to ", DoubleToStr(l_price_252, Digits));
            OrderModify(OrderTicket(), OrderOpenPrice(), l_price_252, OrderTakeProfit(), 0, LightGreen);
            RefreshRates();
            continue;
         }
      }
      if (OrderType() == OP_SELL && OrderSymbol() == Symbol() && OrderMagicNumber() == Magic1) {
         if (li_80 && Close[0] > iHigh(NULL, PERIOD_H1, 1)) {
            OrderClose(OrderTicket(), OrderLots(), Ask, 3, CLR_NONE);
            RefreshRates();
            if (li_128) Print("Close Order ", OrderTicket(), " Close H1");
         } else {
            if (li_200 == FALSE && OrderStopLoss() > OrderOpenPrice() && OrderProfit() > 0.0) {
               OrderClose(OrderTicket(), OrderLots(), Ask, 3, CLR_NONE);
               RefreshRates();
               if (li_128) Print("Close Order ", OrderTicket(), " ---> stop>50");
            } else {
               if ((TimeCurrent() - OrderOpenTime() > 60 * li_92 && OrderStopLoss() > OrderOpenPrice() && Ask <= OrderOpenPrice()) || (li_52 == TRUE && OrderProfit() > 0.0)) {
                  OrderClose(OrderTicket(), OrderLots(), Ask, 3, CLR_NONE);
                  RefreshRates();
               } else {
                  if (li_56 && MathAbs((g_ord_open_price_396 - OrderOpenPrice()) / Point) > li_60 && OrderProfit() > 0.0) {
                     OrderClose(OrderTicket(), OrderLots(), Ask, 10, Yellow);
                     RefreshRates();
                     if (li_128) Print("Close Order ", OrderTicket(), " due to the price shock ", MathAbs((OrderOpenPrice() - g_ord_open_price_396) / Digits), " pips");
                     if (li_128) Print("OrderOpenPrise ", DoubleToStr(OrderOpenPrice(), Digits), ", PRICE_SELL1 ", DoubleToStr(g_ord_open_price_396, Digits));
                  } else {
                     if (li_64 && OrderOpenPrice() - g_spread_276 * Point - g_ilow_140 >= li_68 * Point && OrderOpenPrice() - Ask < 5.0 * Point && OrderOpenPrice() - Ask >= 0.0 && Bid > g_bid_404) {
                        OrderClose(OrderTicket(), OrderLots(), Ask, 3, CLR_NONE);
                        RefreshRates();
                        Print("�������� ����� SELL ", OrderTicket(), ", ", (OrderOpenPrice() - Ask) / Point, " ������� � �������, �������� ����� ", DoubleToStr(Bid - g_bid_404, Digits));
                     } else {
                        if (li_72 == TRUE && OrderProfit() >= 0.0 && iClose(NULL, PERIOD_M1, 0) > iOpen(NULL, PERIOD_M1, 0) && Close[0] > iHigh(NULL, PERIOD_M1, 1) && iClose(NULL, PERIOD_M1, 1) > iOpen(NULL, PERIOD_M1, 1) ||
                           iClose(NULL, PERIOD_M1, 1) > iHigh(NULL, PERIOD_M1, 1) - (iHigh(NULL, PERIOD_M1, 1) - iLow(NULL, PERIOD_M1, 1)) / 3.0) {
                           OrderClose(OrderTicket(), OrderLots(), Ask, 3, Yellow);
                           RefreshRates();
                           if (li_128) Print("Close Order ", OrderTicket(), " ---> minimum_risk_M1");
                        } else {
                           if (li_76 == TRUE && OrderProfit() >= 0.0 && iClose(NULL, PERIOD_M5, 0) > iOpen(NULL, PERIOD_M5, 0) && Close[0] > iHigh(NULL, PERIOD_M5, 1) && iClose(NULL, PERIOD_M5, 1) > iOpen(NULL, PERIOD_M5, 1) ||
                              iClose(NULL, PERIOD_M5, 1) > iHigh(NULL, PERIOD_M5, 1) - (iHigh(NULL, PERIOD_M5, 1) - iLow(NULL, PERIOD_M5, 1)) / 3.0) {
                              OrderClose(OrderTicket(), OrderLots(), Ask, 3, Yellow);
                              RefreshRates();
                              if (li_128) Print("Close Order ", OrderTicket(), " ---> minimum_risk_M5");
                           } else {
                              if (OrderStopLoss() > OrderOpenPrice()) {
                                 if (li_248 < 50) {
                                    if (li_44 == TRUE && OrderOpenPrice() - Ask >= Point * MathCeil(l_stoplevel_160 * ld_96) && OrderStopLoss() - Ask > MathCeil(l_stoplevel_160 * ld_96) * Point) {
                                       OrderModify(OrderTicket(), OrderOpenPrice(), NormalizeDouble(Ask + MathCeil(l_stoplevel_160 * ld_240) * Point, Digits), OrderTakeProfit(), 0, Pink);
                                       RefreshRates();
                                       Print("������ � ���� SELL ����� ", OrderTicket());
                                       continue;
                                    }
                                 } else {
                                    if (li_44 == TRUE && OrderOpenPrice() - Ask >= Point * MathCeil(l_stoplevel_160 * ld_96) && OrderStopLoss() - Ask > MathCeil(l_stoplevel_160 * ld_96) * Point && OrderStopLoss() > NormalizeDouble(Ask +
                                       MathCeil(l_stoplevel_160 * ld_240 + l_stoplevel_160 / 10.0) * Point, Digits)) {
                                       OrderModify(OrderTicket(), OrderOpenPrice(), NormalizeDouble(Ask + MathCeil(l_stoplevel_160 * ld_240 + l_stoplevel_160 / 10.0) * Point, Digits), OrderTakeProfit(), 0, Pink);
                                       RefreshRates();
                                       Print("������ � ���� SELL ����� ", OrderTicket());
                                       continue;
                                    }
                                 }
                                 if (li_48 == TRUE && OrderStopLoss() > l_price_260 && l_price_260 - Ask >= l_stoplevel_160 * Point) {
                                    if (li_128) Print("Reduce losses OP_SELL order ", OrderTicket(), " moved S/L from", DoubleToStr(OrderStopLoss(), Digits), " to ", DoubleToStr(l_price_260, Digits), ". Methot S/L=", li_112);
                                    OrderModify(OrderTicket(), OrderOpenPrice(), l_price_260, OrderTakeProfit(), 0, LightGreen);
                                    RefreshRates();
                                    continue;
                                 }
                              }
                              if (OrderStopLoss() <= OrderOpenPrice() && li_40 == TRUE) {
                                 if (OrderStopLoss() - Ask > Point * l_pips_104 * l_stoplevel_160) {
                                    OrderModify(OrderTicket(), OrderOpenPrice(), NormalizeDouble(Ask + l_pips_104 * l_stoplevel_160 * Point, Digits), OrderTakeProfit(), 0, Pink);
                                    RefreshRates();
                                    continue;
                                 }
                              }
                              if (OrderStopLoss() <= OrderOpenPrice() && li_48 == TRUE && l_price_260 < OrderStopLoss() && l_price_260 - Ask >= l_stoplevel_160 * Point) {
                                 if (li_128) Print("Tr.stop = false. Methot S/L=", li_112, ". Increase Profit OP_SELL order ", OrderTicket(), " from ", DoubleToStr(OrderStopLoss(), Digits), " to ", DoubleToStr(l_price_260, Digits));
                                 OrderModify(OrderTicket(), OrderOpenPrice(), l_price_260, OrderTakeProfit(), 0, LightGreen);
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
   g_bid_404 = Bid;
}

void func2() {
   double l_ifractals_144;
   double l_ifractals_152;
   int li_176;
   int li_180;
   double l_price_256;
   double l_price_264;
   double ld_0 = lot_percent / 10000.0;
   double ld_8 = lot_fixed;
   double ld_16 = 12;
   double ld_24 = 22;
   double ld_32 = 75;
   int li_40 = 20;
   bool li_44 = false;
   bool li_48 = TRUE;
   bool li_52 = TRUE;
   bool li_56 = TRUE;
   bool li_60 = FALSE;
   bool li_64 = TRUE;
   int li_68 = 75;
   bool li_72 = TRUE;
   bool li_76 = TRUE;
   int li_80 = 180;
   double ld_84 = 1;
   double l_pips_92 = 1;
   int li_100 = 2;
   int li_104 = 0;
   int li_108 = 0;
   bool li_112 = FALSE;
   bool li_116 = FALSE;
   bool li_124 = TRUE;
   bool li_128 = TRUE;
   if (ld_16 < 1.0 || ld_32 < 1.0) {
      Print("stop level below the requested soluble");
      return;
   }
   bool li_132 = FALSE;
   if (g_time_412 == 0) g_time_412 = Time[0];
   if (g_time_412 != Time[0]) {
      li_132 = TRUE;
      g_time_412 = Time[0];
   }
   int l_stoplevel_136 = MarketInfo(Symbol(), MODE_STOPLEVEL);
   if (l_stoplevel_136 < li_40 && Digits == 5) l_stoplevel_136 = li_40;
   if (l_stoplevel_136 < 2 && Digits == 4) l_stoplevel_136 = 2;
   if (li_132 || g_lots_520 == 0.0 || g_lots_528 == 0.0 || g_price_456 == 0.0 || g_price_464 == 0.0 || g_price_472 == 0.0 || g_price_480 == 0.0 || g_price_488 == 0.0 ||
      g_price_496 == 0.0 || g_ticksize_504 == 0.0 || gd_512 == 0.0) {
      g_spread_584 = MarketInfo(Symbol(), MODE_SPREAD);
      if (li_116) Print("spread = ", g_spread_584, " ", Symbol());
      g_ticksize_504 = MarketInfo(Symbol(), MODE_TICKSIZE);
      g_tickvalue_544 = MarketInfo(Symbol(), MODE_TICKVALUE);
      g_marginrequired_536 = MarketInfo(Symbol(), MODE_MARGINREQUIRED);
      if (Digits == 5) {
         gd_512 = 10.0 * g_ticksize_504;
         gi_588 = 4;
      } else gd_512 = g_ticksize_504;
      for (int li_140 = 3; li_140 < 100; li_140++) {
         if (High[li_140] >= High[li_140 + 1] && High[li_140] > High[li_140 + 2] && High[li_140] >= High[li_140 - 1] && High[li_140] > High[li_140 - 2]) {
            g_high_552 = High[li_140];
            gi_592 = li_140;
            g_time_624 = Time[li_140];
            break;
         }
      }
      for (li_140 = gi_592 + 1; li_140 < 100; li_140++) {
         if (High[li_140] >= High[li_140 + 1] && High[li_140] > High[li_140 + 2] && High[li_140] >= High[li_140 - 1] && High[li_140] > High[li_140 - 2]) {
            g_high_568 = High[li_140];
            gi_unused_596 = li_140;
            break;
         }
      }
      for (li_140 = 3; li_140 < 100; li_140++) {
         if (Low[li_140] <= Low[li_140 + 1] && Low[li_140] < Low[li_140 + 2] && Low[li_140] <= Low[li_140 - 1] && Low[li_140] < Low[li_140 - 2]) {
            g_low_560 = Low[li_140];
            gi_600 = li_140;
            g_time_628 = Time[li_140];
            break;
         }
      }
      for (li_140 = gi_600 + 1; li_140 < 100; li_140++) {
         if (Low[li_140] <= Low[li_140 + 1] && Low[li_140] < Low[li_140 + 2] && Low[li_140] <= Low[li_140 - 1] && Low[li_140] < Low[li_140 - 2]) {
            g_low_576 = Low[li_140];
            gi_unused_604 = li_140;
            break;
         }
      }
      l_ifractals_144 = iFractals(NULL, 0, MODE_UPPER, 0);
      l_ifractals_152 = iFractals(NULL, 0, MODE_LOWER, 0);
      g_ialligator_432 = iAlligator(NULL, 0, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORLIPS, 0);
      g_ialligator_440 = iAlligator(NULL, 0, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORTEETH, 0);
      g_ialligator_448 = iAlligator(NULL, 0, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORJAW, 0);
      g_iao_416 = iAO(NULL, 0, 1);
      g_iao_424 = iAO(NULL, 0, 2);
      for (int li_160 = 1; li_160 <= 1000; li_160++) {
         if ((iAO(NULL, 0, li_160 + 1) > 0.0 && iAO(NULL, 0, li_160) > iAO(NULL, 0, li_160 + 1) && iAO(NULL, 0, li_160 + 1) < iAO(NULL, 0, li_160 + 2)) || (iAO(NULL, 0, li_160) > 0.0 &&
            iAO(NULL, 0, li_160 + 1) < 0.0)) {
            gi_608 = li_160;
            gi_616 = Time[li_160];
            break;
         }
      }
      for (li_160 = 1; li_160 <= 1000; li_160++) {
         if ((iAO(NULL, 0, li_160 + 1) < 0.0 && iAO(NULL, 0, li_160) < iAO(NULL, 0, li_160 + 1) && iAO(NULL, 0, li_160 + 1) > iAO(NULL, 0, li_160 + 2)) || (iAO(NULL, 0, li_160) < 0.0 &&
            iAO(NULL, 0, li_160 + 1) > 0.0)) {
            gi_612 = li_160;
            gi_620 = Time[li_160];
            break;
         }
      }
      if (li_116) Print("shift_ao_buy=", gi_608, ", shift_ao_sell=", gi_612);
      //if (li_124 && g_high_552<=High[iHighest(NULL, 0, MODE_HIGH, gi_592 - 1, 1)] && ) g_price_456=NormalizeDouble(High[gi_608]+(g_spread_276+1)*Point,Digits);
      //else g_price_456=NormalizeDouble(g_high_552+(g_spread_276+1)*Point,Digits);
      g_price_456 = NormalizeDouble(Proc3(g_high_552, g_low_560, li_128, g_spread_584, Point, li_124, gi_616, gi_620, g_time_624, g_time_628, High[iHighest(NULL, 0, MODE_HIGH, gi_592 - 1, 1)], Low[iLowest(NULL, 0, MODE_LOW, gi_600 - 1, 1)], High[gi_608], Low[gi_612]), Digits);
      if (li_100 == 1) g_price_488 = NormalizeDouble(g_price_456 - ld_16 * l_stoplevel_136 * Point, Digits);
      if (li_100 == 2) {
         g_price_488 = NormalizeDouble(Low[iLowest(NULL, 0, MODE_LOW, 2, 0)] - gd_512, Digits);
         if ((g_price_456 - g_price_488) / Point > ld_24 * l_stoplevel_136) g_price_488 = NormalizeDouble(g_price_456 - ld_24 * l_stoplevel_136 * Point, Digits);
      }
      if (li_100 == 3) {
         g_price_488 = NormalizeDouble(MathMin(g_low_576, g_low_560) - gd_512, Digits);
         if ((g_price_456 - g_price_488) / Point > ld_24 * l_stoplevel_136) g_price_488 = NormalizeDouble(g_price_456 - ld_24 * l_stoplevel_136 * Point, Digits);
      }
      if (li_116) Print("SL_BUY = ", g_price_488, " ", Symbol());
      g_price_472 = NormalizeDouble(g_price_456 + ld_32 * l_stoplevel_136 * Point, Digits);
      if (li_116) Print("TP_BUY = ", g_price_472, " ", Symbol());
      g_price_464 = NormalizeDouble(Proc4(g_high_552, g_low_560, li_128, g_spread_584, Point, li_124, gi_616, gi_620, g_time_624, g_time_628, High[iHighest(NULL, 0, MODE_HIGH, gi_592 - 1, 1)], Low[iLowest(NULL, 0, MODE_LOW, gi_600 - 1, 1)], High[gi_608], Low[gi_612]), Digits);
      if (li_100 == 1) g_price_496 = NormalizeDouble(g_price_464 + (ld_16 * l_stoplevel_136 + g_spread_584) * Point, Digits);
      if (li_100 == 2) {
         g_price_496 = NormalizeDouble(High[iHighest(NULL, 0, MODE_HIGH, 2, 0)] + g_spread_584 * Point + gd_512, Digits);
         if ((g_price_496 - g_price_464) / Point > ld_24 * l_stoplevel_136) g_price_496 = NormalizeDouble(g_price_464 + (ld_24 * l_stoplevel_136 + g_spread_584) * Point, Digits);
      }
      if (li_100 == 3) {
         g_price_496 = NormalizeDouble(MathMax(g_high_552, g_high_568) + g_spread_584 * Point + gd_512, Digits);
         if ((g_price_496 - g_price_464) / Point > ld_24 * l_stoplevel_136) g_price_496 = NormalizeDouble(g_price_464 + (ld_24 * l_stoplevel_136 + g_spread_584) * Point, Digits);
      }
      if (li_116) Print("SL_SELL = ", g_price_496, " ", Symbol());
      g_price_480 = NormalizeDouble(g_price_464 - ld_32 * l_stoplevel_136 * Point, Digits);
      if (li_116) Print("TP_SELL = ", g_price_480, " ", Symbol());
      g_lots_528 = 0.1;
      g_lots_520 = 0.1;
      if (AccountBalance() > 500.0) {
         g_lots_528 = NormalizeDouble(AccountBalance() * ld_0, LotDecimal);
         g_lots_520 = NormalizeDouble(AccountBalance() * ld_0, LotDecimal);
         for (li_160 = OrdersHistoryTotal() - 1; li_160 >= 0; li_160--) {
            if (OrderSelect(li_160, SELECT_BY_POS, MODE_HISTORY) == FALSE) break;
            if (OrderSymbol() == Symbol() && OrderMagicNumber() == Magic2) {
               if (OrderLots() <= NormalizeDouble(AccountBalance() * ld_0, LotDecimal)) {
                  g_lots_528 = NormalizeDouble(AccountBalance() * ld_0, LotDecimal);
                  g_lots_520 = NormalizeDouble(AccountBalance() * ld_0, LotDecimal);
                  break;
               }
               g_lots_528 = NormalizeDouble(OrderLots(), LotDecimal);
               g_lots_520 = NormalizeDouble(OrderLots(), LotDecimal);
               break;
            }
         }
      }
      if (ld_8 > 0.0) {
         g_lots_528 = NormalizeDouble(ld_8, LotDecimal);
         g_lots_520 = NormalizeDouble(ld_8, LotDecimal);
      }
      if (g_lots_528 > NormalizeDouble(AccountFreeMargin() / (1.05 * g_marginrequired_536), LotDecimal) || g_lots_520 > NormalizeDouble(AccountFreeMargin() / (1.05 * g_marginrequired_536), LotDecimal)) {
         g_lots_528 = NormalizeDouble(AccountFreeMargin() / (1.05 * g_marginrequired_536), LotDecimal);
         g_lots_520 = NormalizeDouble(AccountFreeMargin() / (1.05 * g_marginrequired_536), LotDecimal);
      }
   }
   bool li_164 = TRUE;
   if (AccountFreeMargin() < MarketInfo(Symbol(), MODE_MARGINREQUIRED) / 10.0) {
      li_164 = FALSE;
      Print("No money");
   }
   int li_168 = 15;
   if (li_132) gi_652 = TRUE;
   if (MathAbs((gd_640 - Close[0]) / Point) > li_68 && gd_640 != 0.0 && li_64) {
      gi_636 = TRUE;
      g_datetime_648 = TimeCurrent();
      if (gi_652 == TRUE) {
         if (li_116) Print("The price shock for ", (gd_640 - Close[0]) / Point, " pips.", Symbol());
         if (li_116) Print("last_price ", DoubleToStr(gd_640, Digits), ", curent_price ", DoubleToStr(Close[0], Digits));
         gi_652 = FALSE;
      }
   }
   gd_640 = Close[0];
   bool li_172 = TRUE;
   if (li_104 != 0) {
      li_176 = 60 * li_104 + li_108;
      li_180 = 60 * TimeHour(TimeCurrent()) + TimeMinute(TimeCurrent());
      if (li_176 - li_180 <= 20 && li_180 - li_176 <= 15) li_172 = FALSE;
   }
   if (li_132) gi_656 = TRUE;
   if (li_172 == TRUE) {
      if (DayOfWeek() == 5 && TimeCurrent() - iTime(NULL, PERIOD_D1, 0) > 79200) {
         li_172 = FALSE;
         if (gi_656 == TRUE) {
            if (li_116) Print("Friday, ending trading.");
            gi_656 = FALSE;
         }
      }
   }
   if (li_132) gi_660 = TRUE;
   if (li_172 == TRUE) {
      if ((DayOfWeek() == 1 && TimeCurrent() - iTime(NULL, PERIOD_D1, 0) < 3900) || DayOfWeek() == 6 || DayOfWeek() == 7) {
         li_172 = FALSE;
         if (gi_660 == TRUE) {
            if (li_116) Print("Monday, prior to 1-00 in the morning do not trade. Or off.");
            gi_660 = FALSE;
         }
      }
   }
   double l_ord_open_price_184 = 0;
   double l_ord_open_price_192 = 0;
   for (li_160 = 0; li_160 < OrdersTotal(); li_160++) {
      if (OrderSelect(li_160, SELECT_BY_POS, MODE_TRADES) == FALSE) break;
      if (OrderType() == OP_BUYSTOP && OrderSymbol() == Symbol() && OrderMagicNumber() == Magic2) l_ord_open_price_184 = OrderOpenPrice();
      if (OrderType() == OP_SELLSTOP && OrderSymbol() == Symbol() && OrderMagicNumber() == Magic2) l_ord_open_price_192 = OrderOpenPrice();
   }
   bool li_200 = TRUE;
   bool li_204 = TRUE;
   int l_count_208 = 0;
   int l_count_212 = 0;
   if (li_132) {
      gi_664 = TRUE;
      gi_668 = TRUE;
   }
   for (li_160 = 0; li_160 < OrdersTotal(); li_160++) {
      if (OrderSelect(li_160, SELECT_BY_POS, MODE_TRADES) == FALSE) break;
      if (OrderType() == OP_BUY && OrderSymbol() == Symbol() && OrderMagicNumber() == Magic2) {
         if (OrderTicket() == g_ticket_672 && li_112) {
            PlaySound("alert.wav");
            g_ticket_672 = 0;
         }
         if (OrderOpenTime() >= Time[0]) {
            gi_664 = FALSE;
            continue;
         }
      }
      if (OrderType() == OP_BUYSTOP && OrderSymbol() == Symbol() && OrderMagicNumber() == Magic2) {
         li_200 = FALSE;
         g_ticket_672 = OrderTicket();
         l_count_208++;
         if (l_count_208 > 1) {
            OrderDelete(OrderTicket());
            continue;
         }
         if (gi_636 && OrderOpenPrice() - Ask < l_stoplevel_136 << 2 * Point) {
            OrderDelete(OrderTicket());
            gi_632 = FALSE;
            Print("Delete order ", OrderTicket(), " due to the price shock");
            continue;
         }
         if (li_172 == FALSE) {
            OrderDelete(OrderTicket());
            if (!(li_116)) continue;
            Print("Delete order ", OrderTicket(), "PERMIS_TRADE=", li_172);
            continue;
         }
         if (li_44 && MathAbs(OrderOpenPrice() - l_ord_open_price_184) / Point < l_stoplevel_136) {
            OrderDelete(OrderTicket());
            if (!(li_116)) continue;
            Print("Order ", OrderTicket(), " deleted because of the similarity with a Day Extremum");
            continue;
         }
         if (show_orders == FALSE && OrderOpenPrice() - Close[0] > 300.0 * Point) {
            OrderDelete(OrderTicket());
            if (!(li_116)) continue;
            Print("Order ", OrderTicket(), " deleted because price far");
            continue;
         }
         if (OrderOpenPrice() - g_price_456 >= 50.0 * Point || g_price_456 - OrderOpenPrice() >= 50.0 * Point && Ask <= OrderOpenPrice() - l_stoplevel_136 * Point) OrderModify(OrderTicket(), g_price_456, g_price_488, g_price_472, 0, Blue);
         else
            if (OrderOpenPrice() - g_price_456 < 50.0 * Point || g_price_456 - OrderOpenPrice() < 50.0 * Point && Ask <= OrderOpenPrice() - l_stoplevel_136 * Point && NormalizeDouble(OrderOpenPrice(), gi_588) != NormalizeDouble(g_price_456, gi_588)) OrderModify(OrderTicket(), g_price_456, g_price_488, g_price_472, 0, CLR_NONE);
         if (NormalizeDouble(OrderStopLoss(), gi_588) != NormalizeDouble(g_price_488, gi_588)) {
            if (li_116) Print("modify StopLoss, order ", OrderTicket(), " from ", OrderStopLoss(), " to ", g_price_488);
            OrderModify(OrderTicket(), OrderOpenPrice(), g_price_488, OrderTakeProfit(), 0, CLR_NONE);
         }
         if (NormalizeDouble(OrderLots(), LotDecimal) != NormalizeDouble(g_lots_528, LotDecimal)) {
            if (li_116) Print("modify lots, order ", OrderTicket(), " from ", OrderLots(), " to ", g_lots_528);
            OrderDelete(OrderTicket());
         }
      }
      if (OrderType() == OP_SELL && OrderSymbol() == Symbol() && OrderMagicNumber() == Magic2) {
         if (OrderTicket() == g_ticket_676 && li_112) {
            PlaySound("alert.wav");
            g_ticket_676 = 0;
         }
         if (OrderOpenTime() >= Time[0]) {
            gi_668 = FALSE;
            continue;
         }
      }
      if (OrderType() == OP_SELLSTOP && OrderSymbol() == Symbol() && OrderMagicNumber() == Magic2) {
         li_204 = FALSE;
         g_ticket_676 = OrderTicket();
         l_count_212++;
         if (l_count_212 > 1) OrderDelete(OrderTicket());
         else {
            if (gi_636 && Bid - OrderOpenPrice() < l_stoplevel_136 << 2 * Point) {
               OrderDelete(OrderTicket());
               gi_632 = FALSE;
               if (li_116) Print("Delete order ", OrderTicket(), " due to the price shock");
            } else {
               if (li_172 == FALSE) OrderDelete(OrderTicket());
               else {
                  if (li_44 && MathAbs(OrderOpenPrice() - l_ord_open_price_192) / Point < l_stoplevel_136) {
                     OrderDelete(OrderTicket());
                     if (li_116) Print("Order ", OrderTicket(), " closed because of the similarity with a Day Extremum");
                  } else {
                     if (show_orders == FALSE && Close[0] - OrderOpenPrice() > 300.0 * Point) {
                        OrderDelete(OrderTicket());
                        if (li_116) Print("Order ", OrderTicket(), " delited because price far");
                     } else {
                        if (OrderOpenPrice() - g_price_464 >= 50.0 * Point || g_price_464 - OrderOpenPrice() >= 50.0 * Point && Bid >= OrderOpenPrice() + l_stoplevel_136 * Point) OrderModify(OrderTicket(), g_price_464, g_price_496, g_price_480, 0, Red);
                        else
                           if (OrderOpenPrice() - g_price_464 < 50.0 * Point || g_price_464 - OrderOpenPrice() < 50.0 * Point && Bid >= OrderOpenPrice() + l_stoplevel_136 * Point && NormalizeDouble(OrderOpenPrice(), gi_588) != NormalizeDouble(g_price_464, gi_588)) OrderModify(OrderTicket(), g_price_464, g_price_496, g_price_480, 0, CLR_NONE);
                        if (NormalizeDouble(OrderStopLoss(), gi_588) != NormalizeDouble(g_price_496, gi_588)) OrderModify(OrderTicket(), OrderOpenPrice(), g_price_496, OrderTakeProfit(), 0, CLR_NONE);
                        if (NormalizeDouble(OrderLots(), LotDecimal) != NormalizeDouble(g_lots_520, LotDecimal)) OrderDelete(OrderTicket());
                     }
                  }
               }
            }
         }
      }
   }
   if ((TimeCurrent() - g_datetime_648) / 60 > li_168) {
      gi_632 = TRUE;
      gi_636 = FALSE;
   }
   bool li_216 = TRUE;
   bool li_220 = TRUE;
   if (High[iHighest(NULL, 0, MODE_HIGH, gi_592 - 1, 0)] >= High[gi_592]) li_216 = FALSE;
   if (Low[iLowest(NULL, 0, MODE_LOW, gi_600 - 1, 0)] <= Low[gi_600]) li_220 = FALSE;
   bool li_224 = TRUE;
   bool li_228 = TRUE;
   if (li_124 == FALSE || li_216 || gi_616 < g_time_624 || High[iHighest(NULL, 0, MODE_HIGH, gi_608, 0)] >= High[gi_608]) li_224 = FALSE;
   if (li_124 == FALSE || li_220 || gi_620 < g_time_628 || Low[iLowest(NULL, 0, MODE_LOW, gi_612, 0)] <= Low[gi_612]) li_228 = FALSE;
   bool li_232 = TRUE;
   bool li_236 = TRUE;
   if (li_44 && MathAbs(g_price_456 - l_ord_open_price_184) / Point < l_stoplevel_136) li_232 = FALSE;
   if (li_44 && MathAbs(g_price_464 - l_ord_open_price_192) / Point < l_stoplevel_136) li_236 = FALSE;
   bool li_240 = TRUE;
   bool li_244 = TRUE;
   if (show_orders == FALSE) {
      if (g_price_456 - Close[0] > 150.0 * Point) li_240 = FALSE;
      if (Close[0] - g_price_464 > 150.0 * Point) li_244 = FALSE;
   }
   if ((li_240 && li_232 && li_164 && gi_632 && li_172 && li_216 && gi_664 && li_200 && Ask <= g_price_456 - l_stoplevel_136 * Point) || (li_240 && li_232 && li_164 &&
      gi_632 && li_172 && li_224 && gi_664 && li_200 && Ask <= g_price_456 - l_stoplevel_136 * Point)) OrderSend(Symbol(), OP_BUYSTOP, g_lots_528, g_price_456, 0, NormalizeDouble(g_price_488,Digits), NormalizeDouble(g_price_472,Digits), "Fractals_H1", Magic2, 0, Blue);
   if ((li_244 && li_236 && li_164 && gi_632 && li_172 && li_220 && gi_668 && li_204 && Bid >= g_price_464 + l_stoplevel_136 * Point) || (li_244 && li_236 && li_164 &&
      gi_632 && li_172 && li_228 && gi_668 && li_204 && Bid >= g_price_464 + l_stoplevel_136 * Point)) OrderSend(Symbol(), OP_SELLSTOP, g_lots_520, g_price_464, 0, NormalizeDouble(g_price_496,Digits), NormalizeDouble(g_price_480,Digits), "Fractals_H1", Magic2, 0, Red);
   double ld_248 = ld_84;
   if (ld_84 < 1.0) ld_248 = 1;
   if (li_100 == 1) {
      l_price_256 = NormalizeDouble(Bid - ld_16 * l_stoplevel_136 * Point, Digits);
      l_price_264 = NormalizeDouble(Ask + ld_16 * l_stoplevel_136 * Point, Digits);
   }
   if (li_100 == 2) {
      l_price_256 = NormalizeDouble(Low[iLowest(NULL, 0, MODE_LOW, 2, 1)] - gd_512, Digits);
      l_price_264 = NormalizeDouble(High[iHighest(NULL, 0, MODE_HIGH, 2, 1)] + gd_512 + g_spread_584 * Point, Digits);
   }
   if (li_100 == 3) {
      l_price_256 = NormalizeDouble(MathMin(g_low_576, g_low_560) - gd_512, Digits);
      l_price_264 = NormalizeDouble(MathMax(g_high_568, g_high_552) + gd_512 + g_spread_584 * Point, Digits);
   }
   for (li_160 = 0; li_160 <= OrdersTotal(); li_160++) {
      if (OrderSelect(li_160, SELECT_BY_POS, MODE_TRADES) == FALSE) break;
      if (OrderType() == OP_BUY && OrderSymbol() == Symbol() && OrderMagicNumber() == Magic2) {
         if (l_stoplevel_136 > li_40 && OrderStopLoss() < OrderOpenPrice() && OrderProfit() > 0.0 && (iHigh(NULL, PERIOD_H4, 0) - Close[0]) / Point >= li_40) {
            OrderClose(OrderTicket(), OrderLots(), Bid, 3, CLR_NONE);
            RefreshRates();
            if (!(li_116)) continue;
            Print("Close Order ", OrderTicket(), " ---> stop>min_stop");
            continue;
         }
         if ((TimeCurrent() - OrderOpenTime() > 60 * li_80 && OrderStopLoss() < OrderOpenPrice() && Bid >= OrderOpenPrice()) || (li_60 == TRUE && OrderProfit() > 0.0)) {
            OrderClose(OrderTicket(), OrderLots(), Bid, 3, CLR_NONE);
            if (!(li_116)) continue;
            Print("Close Order ", OrderTicket(), " ---> time_of_close");
            continue;
         }
         if (li_64 && MathAbs((OrderOpenPrice() - g_price_456) / Point) > li_68 && OrderProfit() > 0.0) {
            OrderClose(OrderTicket(), OrderLots(), Bid, 5, Yellow);
            if (li_116) Print("Close Order ", OrderTicket(), " due to the price shock ", MathAbs((OrderOpenPrice() - g_price_456) / Digits), " pips");
            if (!(li_116)) continue;
            Print("OrderOpenPrise ", DoubleToStr(OrderOpenPrice(), Digits), ", PRICE_BUY ", DoubleToStr(g_price_456, Digits));
            continue;
         }
         if (li_72 == TRUE && OrderProfit() >= 0.0 && iClose(NULL, PERIOD_M1, 0) < iOpen(NULL, PERIOD_M1, 0) && Close[0] < iLow(NULL, PERIOD_M1, 1) && iClose(NULL, PERIOD_M1, 1) < iOpen(NULL, PERIOD_M1, 1) ||
            iClose(NULL, PERIOD_M1, 1) < iLow(NULL, PERIOD_M1, 1) + (iHigh(NULL, PERIOD_M1, 1) - iLow(NULL, PERIOD_M1, 1)) / 3.0) {
            OrderClose(OrderTicket(), OrderLots(), Bid, 3, Yellow);
            if (!(li_116)) continue;
            Print("Close Order ", OrderTicket(), " ---> minimum_risk_M1");
            continue;
         }
         if (li_76 == TRUE && OrderProfit() >= 0.0 && iClose(NULL, PERIOD_M5, 0) < iOpen(NULL, PERIOD_M5, 0) && Close[0] < iLow(NULL, PERIOD_M5, 1) && iClose(NULL, PERIOD_M5, 1) < iOpen(NULL, PERIOD_M5, 1) ||
            iClose(NULL, PERIOD_M5, 1) < iLow(NULL, PERIOD_M5, 1) + (iHigh(NULL, PERIOD_M5, 1) - iLow(NULL, PERIOD_M5, 1)) / 3.0) {
            OrderClose(OrderTicket(), OrderLots(), Bid, 3, Yellow);
            if (!(li_116)) continue;
            Print("Close Order ", OrderTicket(), " ---> minimum_risk_M5");
            continue;
         }
         if (OrderStopLoss() < OrderOpenPrice()) {
            if (li_52 == TRUE && Bid - OrderOpenPrice() >= MathCeil(l_stoplevel_136 * ld_84) * Point && Bid - OrderStopLoss() > MathCeil(l_stoplevel_136 * ld_84) * Point) {
               OrderModify(OrderTicket(), OrderOpenPrice(), NormalizeDouble(Bid - MathCeil(l_stoplevel_136 * ld_248) * Point, Digits), OrderTakeProfit(), 0, LightGreen);
               Print("������ � ���� BUY ����� ", OrderTicket());
               continue;
            }
            if (li_52 == TRUE && Bid - OrderOpenPrice() >= MathCeil(l_stoplevel_136 * ld_84) * Point && Bid - OrderStopLoss() > MathCeil(l_stoplevel_136 * ld_84) * Point && OrderStopLoss() < NormalizeDouble(Bid - MathCeil(l_stoplevel_136 * ld_248 +
               l_stoplevel_136 / 10.0) * Point, Digits)) {
               OrderModify(OrderTicket(), OrderOpenPrice(), NormalizeDouble(Bid - MathCeil(l_stoplevel_136 * ld_248 + l_stoplevel_136 / 10.0) * Point, Digits), OrderTakeProfit(), 0, LightGreen);
               Print("������ � ���� BUY ����� ", OrderTicket());
               continue;
            }
            if (li_56 == TRUE && OrderStopLoss() < l_price_256 && Bid - l_price_256 >= l_stoplevel_136 * Point) {
               if (li_116) Print("Reduce losses OP_BUY order ", OrderTicket(), " moved S/L from ", DoubleToStr(OrderStopLoss(), Digits), " to ", DoubleToStr(l_price_256, Digits), ". Methot S/L=", li_100);
               OrderModify(OrderTicket(), OrderOpenPrice(), l_price_256, OrderTakeProfit(), 0, LightGreen);
               continue;
            }
         }
         if (OrderStopLoss() >= OrderOpenPrice() && li_48 == TRUE) {
            if (Bid - OrderStopLoss() > Point * l_pips_92 * l_stoplevel_136) {
               OrderModify(OrderTicket(), OrderOpenPrice(), NormalizeDouble(Bid - l_pips_92 * l_stoplevel_136 * Point, Digits), OrderTakeProfit(), 0, LightGreen);
               continue;
            }
         }
         if (OrderStopLoss() >= OrderOpenPrice() && li_56 == TRUE && l_price_256 > OrderStopLoss() && Bid - l_price_256 >= l_stoplevel_136 * Point) {
            if (li_116) Print("Moving_S_L=true, Methot S/L=", li_100, ". Increase Profit OP_BUY order ", OrderTicket(), " from ", DoubleToStr(OrderStopLoss(), Digits), " to ", DoubleToStr(l_price_256, Digits));
            OrderModify(OrderTicket(), OrderOpenPrice(), l_price_256, OrderTakeProfit(), 0, LightGreen);
            continue;
         }
      }
      if (OrderType() == OP_SELL && OrderSymbol() == Symbol() && OrderMagicNumber() == Magic2) {
         if (l_stoplevel_136 > li_40 && OrderStopLoss() > OrderOpenPrice() && OrderProfit() > 0.0 && (Close[0] - iLow(NULL, PERIOD_H4, 0)) / Point >= li_40) {
            OrderClose(OrderTicket(), OrderLots(), Ask, 3, CLR_NONE);
            RefreshRates();
            if (li_116) Print("Close Order ", OrderTicket(), " ---> stop>min_stop");
         } else {
            if ((TimeCurrent() - OrderOpenTime() > 60 * li_80 && OrderStopLoss() > OrderOpenPrice() && Ask <= OrderOpenPrice()) || (li_60 == TRUE && OrderProfit() > 0.0)) OrderClose(OrderTicket(), OrderLots(), Ask, 3, CLR_NONE);
            else {
               if (li_64 && MathAbs((g_price_464 - OrderOpenPrice()) / Point) > li_68 && OrderProfit() > 0.0) {
                  OrderClose(OrderTicket(), OrderLots(), Ask, 5, Yellow);
                  if (li_116) Print("Close Order ", OrderTicket(), " due to the price shock ", MathAbs((OrderOpenPrice() - g_price_464) / Digits), " pips");
                  if (li_116) Print("OrderOpenPrise ", DoubleToStr(OrderOpenPrice(), Digits), ", PRICE_SELL ", DoubleToStr(g_price_464, Digits));
               } else {
                  if (li_72 == TRUE && OrderProfit() >= 0.0 && iClose(NULL, PERIOD_M1, 0) > iOpen(NULL, PERIOD_M1, 0) && Close[0] > iHigh(NULL, PERIOD_M1, 1) && iClose(NULL, PERIOD_M1, 1) > iOpen(NULL, PERIOD_M1, 1) ||
                     iClose(NULL, PERIOD_M1, 1) > iHigh(NULL, PERIOD_M1, 1) - (iHigh(NULL, PERIOD_M1, 1) - iLow(NULL, PERIOD_M1, 1)) / 3.0) {
                     OrderClose(OrderTicket(), OrderLots(), Ask, 3, Yellow);
                     if (li_116) Print("Close Order ", OrderTicket(), " ---> minimum_risk_M1");
                  } else {
                     if (li_76 == TRUE && OrderProfit() >= 0.0 && iClose(NULL, PERIOD_M5, 0) > iOpen(NULL, PERIOD_M5, 0) && Close[0] > iHigh(NULL, PERIOD_M5, 1) && iClose(NULL, PERIOD_M5, 1) > iOpen(NULL, PERIOD_M5, 1) ||
                        iClose(NULL, PERIOD_M5, 1) > iHigh(NULL, PERIOD_M5, 1) - (iHigh(NULL, PERIOD_M5, 1) - iLow(NULL, PERIOD_M5, 1)) / 3.0) {
                        OrderClose(OrderTicket(), OrderLots(), Ask, 3, Yellow);
                        if (li_116) Print("Close Order ", OrderTicket(), " ---> minimum_risk_M5");
                     } else {
                        if (OrderStopLoss() > OrderOpenPrice()) {
                           if (li_52 == TRUE && OrderOpenPrice() - Ask >= Point * MathCeil(l_stoplevel_136 * ld_84) && OrderStopLoss() - Ask > MathCeil(l_stoplevel_136 * ld_84) * Point) {
                              OrderModify(OrderTicket(), OrderOpenPrice(), NormalizeDouble(Ask + MathCeil(l_stoplevel_136 * ld_248) * Point, Digits), OrderTakeProfit(), 0, Pink);
                              Print("������ � ���� SELL ����� ", OrderTicket());
                              continue;
                           }
                           if (li_52 == TRUE && OrderOpenPrice() - Ask >= Point * MathCeil(l_stoplevel_136 * ld_84) && OrderStopLoss() - Ask > MathCeil(l_stoplevel_136 * ld_84) * Point && OrderStopLoss() > NormalizeDouble(Ask +
                              MathCeil(l_stoplevel_136 * ld_248 + l_stoplevel_136 / 10.0) * Point, Digits)) {
                              OrderModify(OrderTicket(), OrderOpenPrice(), NormalizeDouble(Ask + MathCeil(l_stoplevel_136 * ld_248 + l_stoplevel_136 / 10.0) * Point, Digits), OrderTakeProfit(), 0, Pink);
                              Print("������ � ���� SELL ����� ", OrderTicket());
                              continue;
                           }
                           if (li_56 == TRUE && OrderStopLoss() > l_price_264 && l_price_264 - Ask >= l_stoplevel_136 * Point) {
                              if (li_116) Print("Reduce losses OP_SELL order ", OrderTicket(), " moved S/L from", DoubleToStr(OrderStopLoss(), Digits), " to ", DoubleToStr(l_price_264, Digits), ". Methot S/L=", li_100);
                              OrderModify(OrderTicket(), OrderOpenPrice(), l_price_264, OrderTakeProfit(), 0, LightGreen);
                              continue;
                           }
                        }
                        if (OrderStopLoss() <= OrderOpenPrice() && li_48 == TRUE) {
                           if (OrderStopLoss() - Ask > Point * l_pips_92 * l_stoplevel_136) {
                              OrderModify(OrderTicket(), OrderOpenPrice(), NormalizeDouble(Ask + l_pips_92 * l_stoplevel_136 * Point, Digits), OrderTakeProfit(), 0, Pink);
                              continue;
                           }
                        }
                        if (OrderStopLoss() <= OrderOpenPrice() && li_56 == TRUE && l_price_264 < OrderStopLoss() && l_price_264 - Ask >= l_stoplevel_136 * Point) {
                           if (li_116) Print("Tr.stop = false. Methot S/L=", li_100, ". Increase Profit OP_SELL order ", OrderTicket(), " from ", DoubleToStr(OrderStopLoss(), Digits), " to ", DoubleToStr(l_price_264, Digits));
                           OrderModify(OrderTicket(), OrderOpenPrice(), l_price_264, OrderTakeProfit(), 0, LightGreen);
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
   int li_176;
   int li_180;
   double l_price_256;
   double l_price_264;
   double ld_0 = lot_percent / 10000.0;
   double ld_8 = lot_fixed;
   double ld_16 = 12;
   double ld_24 = 20;
   double ld_32 = 75;
   int li_40 = 20;
   bool li_44 = false;
   bool li_48 = TRUE;
   bool li_52 = TRUE;
   bool li_56 = TRUE;
   bool li_60 = FALSE;
   bool li_64 = TRUE;
   int li_68 = 75;
   bool li_72 = TRUE;
   bool li_76 = TRUE;
   int li_80 = 180;
   double ld_84 = 1;
   double l_pips_92 = 1;
   int li_100 = 2;
   int li_104 = 0;
   int li_108 = 0;
   bool li_112 = FALSE;
   bool li_116 = FALSE;
   bool li_124 = TRUE;
   bool li_128 = TRUE;
   if (ld_16 < 1.0 || ld_32 < 1.0) {
      Print("stop level below the requested soluble");
      return;
   }
   bool li_132 = FALSE;
   if (g_time_680 == 0) g_time_680 = Time[0];
   if (g_time_680 != Time[0]) {
      li_132 = TRUE;
      g_time_680 = Time[0];
   }
   int l_stoplevel_136 = MarketInfo(Symbol(), MODE_STOPLEVEL);
   if (l_stoplevel_136 < li_40 && Digits == 5) l_stoplevel_136 = li_40;
   if (l_stoplevel_136 < 2 && Digits == 4) l_stoplevel_136 = 2;
   if (li_132 || g_lots_788 == 0.0 || g_lots_796 == 0.0 || g_price_724 == 0.0 || g_price_732 == 0.0 || g_price_740 == 0.0 || g_price_748 == 0.0 || g_price_756 == 0.0 ||
      g_price_764 == 0.0 || g_ticksize_772 == 0.0 || gd_780 == 0.0) {
      g_spread_852 = MarketInfo(Symbol(), MODE_SPREAD);
      if (li_116) Print("spread = ", g_spread_852, " ", Symbol());
      g_ticksize_772 = MarketInfo(Symbol(), MODE_TICKSIZE);
      g_tickvalue_812 = MarketInfo(Symbol(), MODE_TICKVALUE);
      g_marginrequired_804 = MarketInfo(Symbol(), MODE_MARGINREQUIRED);
      if (Digits == 5) {
         gd_780 = 10.0 * g_ticksize_772;
         gi_856 = 4;
      } else gd_780 = g_ticksize_772;
      for (int li_140 = 3; li_140 < 100; li_140++) {
         if (High[li_140] >= High[li_140 + 1] && High[li_140] > High[li_140 + 2] && High[li_140] >= High[li_140 - 1] && High[li_140] > High[li_140 - 2]) {
            g_high_820 = High[li_140];
            gi_860 = li_140;
            g_time_892 = Time[li_140];
            break;
         }
      }
      for (li_140 = gi_860 + 1; li_140 < 100; li_140++) {
         if (High[li_140] >= High[li_140 + 1] && High[li_140] > High[li_140 + 2] && High[li_140] >= High[li_140 - 1] && High[li_140] > High[li_140 - 2]) {
            g_high_836 = High[li_140];
            gi_unused_864 = li_140;
            break;
         }
      }
      for (li_140 = 3; li_140 < 100; li_140++) {
         if (Low[li_140] <= Low[li_140 + 1] && Low[li_140] < Low[li_140 + 2] && Low[li_140] <= Low[li_140 - 1] && Low[li_140] < Low[li_140 - 2]) {
            g_low_828 = Low[li_140];
            gi_868 = li_140;
            g_time_896 = Time[li_140];
            break;
         }
      }
      for (li_140 = gi_868 + 1; li_140 < 100; li_140++) {
         if (Low[li_140] <= Low[li_140 + 1] && Low[li_140] < Low[li_140 + 2] && Low[li_140] <= Low[li_140 - 1] && Low[li_140] < Low[li_140 - 2]) {
            g_low_844 = Low[li_140];
            gi_unused_872 = li_140;
            break;
         }
      }
      l_ifractals_144 = iFractals(NULL, 0, MODE_UPPER, 0);
      l_ifractals_152 = iFractals(NULL, 0, MODE_LOWER, 0);
      g_ialligator_700 = iAlligator(NULL, 0, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORLIPS, 0);
      g_ialligator_708 = iAlligator(NULL, 0, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORTEETH, 0);
      g_ialligator_716 = iAlligator(NULL, 0, 13, 8, 8, 5, 5, 3, MODE_SMMA, PRICE_MEDIAN, MODE_GATORJAW, 0);
      g_iao_684 = iAO(NULL, 0, 1);
      g_iao_692 = iAO(NULL, 0, 2);
      for (int li_160 = 1; li_160 <= 1000; li_160++) {
         if ((iAO(NULL, 0, li_160 + 1) > 0.0 && iAO(NULL, 0, li_160) > iAO(NULL, 0, li_160 + 1) && iAO(NULL, 0, li_160 + 1) < iAO(NULL, 0, li_160 + 2)) || (iAO(NULL, 0, li_160) > 0.0 &&
            iAO(NULL, 0, li_160 + 1) < 0.0)) {
            gi_876 = li_160;
            gi_884 = Time[li_160];
            break;
         }
      }
      for (li_160 = 1; li_160 <= 1000; li_160++) {
         if ((iAO(NULL, 0, li_160 + 1) < 0.0 && iAO(NULL, 0, li_160) < iAO(NULL, 0, li_160 + 1) && iAO(NULL, 0, li_160 + 1) > iAO(NULL, 0, li_160 + 2)) || (iAO(NULL, 0, li_160) < 0.0 &&
            iAO(NULL, 0, li_160 + 1) > 0.0)) {
            gi_880 = li_160;
            gi_888 = Time[li_160];
            break;
         }
      }
      if (li_116) Print("shift_ao_buy=", gi_876, ", shift_ao_sell=", gi_880);
      g_price_724 = NormalizeDouble(Proc3(g_high_820, g_low_828, li_128, g_spread_852, Point, li_124, gi_884, gi_888, g_time_892, g_time_896, High[iHighest(NULL, 0, MODE_HIGH, gi_860 - 1, 1)], Low[iLowest(NULL, 0, MODE_LOW, gi_868 - 1, 1)], High[gi_876], Low[gi_880]), Digits);
      if (li_100 == 1) g_price_756 = NormalizeDouble(g_price_724 - ld_16 * l_stoplevel_136 * Point, Digits);
      if (li_100 == 2) {
         g_price_756 = NormalizeDouble(Low[iLowest(NULL, 0, MODE_LOW, 2, 0)] - gd_780, Digits);
         if ((g_price_724 - g_price_756) / Point > ld_24 * l_stoplevel_136) g_price_756 = NormalizeDouble(g_price_724 - ld_24 * l_stoplevel_136 * Point, Digits);
      }
      if (li_100 == 3) {
         g_price_756 = NormalizeDouble(MathMin(g_low_844, g_low_828) - gd_780, Digits);
         if ((g_price_724 - g_price_756) / Point > ld_24 * l_stoplevel_136) g_price_756 = NormalizeDouble(g_price_724 - ld_24 * l_stoplevel_136 * Point, Digits);
      }
      if (li_116) Print("SL_BUY = ", g_price_756, " ", Symbol());
      g_price_740 = NormalizeDouble(g_price_724 + ld_32 * l_stoplevel_136 * Point, Digits);
      if (li_116) Print("TP_BUY = ", g_price_740, " ", Symbol());
      g_price_732 = NormalizeDouble(Proc4(g_high_820, g_low_828, li_128, g_spread_852, Point, li_124, gi_884, gi_888, g_time_892, g_time_896, High[iHighest(NULL, 0, MODE_HIGH, gi_860 - 1, 1)], Low[iLowest(NULL, 0, MODE_LOW, gi_868 - 1, 1)], High[gi_876], Low[gi_880]), Digits);
      if (li_100 == 1) g_price_764 = NormalizeDouble(g_price_732 + (ld_16 * l_stoplevel_136 + g_spread_852) * Point, Digits);
      if (li_100 == 2) {
         g_price_764 = NormalizeDouble(High[iHighest(NULL, 0, MODE_HIGH, 2, 0)] + g_spread_852 * Point + gd_780, Digits);
         if ((g_price_764 - g_price_732) / Point > ld_24 * l_stoplevel_136) g_price_764 = NormalizeDouble(g_price_732 + (ld_24 * l_stoplevel_136 + g_spread_852) * Point, Digits);
      }
      if (li_100 == 3) {
         g_price_764 = NormalizeDouble(MathMax(g_high_820, g_high_836) + g_spread_852 * Point + gd_780, Digits);
         if ((g_price_764 - g_price_732) / Point > ld_24 * l_stoplevel_136) g_price_764 = NormalizeDouble(g_price_732 + (ld_24 * l_stoplevel_136 + g_spread_852) * Point, Digits);
      }
      if (li_116) Print("SL_SELL = ", g_price_764, " ", Symbol());
      g_price_748 = NormalizeDouble(g_price_732 - ld_32 * l_stoplevel_136 * Point, Digits);
      if (li_116) Print("TP_SELL = ", g_price_748, " ", Symbol());
      g_lots_796 = 0.1;
      g_lots_788 = 0.1;
      if (AccountBalance() > 500.0) {
         g_lots_796 = NormalizeDouble(AccountBalance() * ld_0, LotDecimal);
         g_lots_788 = NormalizeDouble(AccountBalance() * ld_0, LotDecimal);
         for (li_160 = OrdersHistoryTotal() - 1; li_160 >= 0; li_160--) {
            if (OrderSelect(li_160, SELECT_BY_POS, MODE_HISTORY) == FALSE) break;
            if (OrderSymbol() == Symbol() && OrderMagicNumber() == Magic3) {
               if (OrderLots() <= NormalizeDouble(AccountBalance() * ld_0, LotDecimal)) {
                  g_lots_796 = NormalizeDouble(AccountBalance() * ld_0, LotDecimal);
                  g_lots_788 = NormalizeDouble(AccountBalance() * ld_0, LotDecimal);
                  break;
               }
               g_lots_796 = NormalizeDouble(OrderLots(), LotDecimal);
               g_lots_788 = NormalizeDouble(OrderLots(), LotDecimal);
               break;
            }
         }
      }
      if (ld_8 > 0.0) {
         g_lots_796 = NormalizeDouble(ld_8, LotDecimal);
         g_lots_788 = NormalizeDouble(ld_8, LotDecimal);
      }
      if (g_lots_796 > NormalizeDouble(AccountFreeMargin() / (1.05 * g_marginrequired_804), LotDecimal) || g_lots_788 > NormalizeDouble(AccountFreeMargin() / (1.05 * g_marginrequired_804), LotDecimal)) {
         g_lots_796 = NormalizeDouble(AccountFreeMargin() / (1.05 * g_marginrequired_804), LotDecimal);
         g_lots_788 = NormalizeDouble(AccountFreeMargin() / (1.05 * g_marginrequired_804), LotDecimal);
      }
   }
   bool li_164 = TRUE;
   if (AccountFreeMargin() < MarketInfo(Symbol(), MODE_MARGINREQUIRED) / 10.0) {
      li_164 = FALSE;
      Print("No money");
   }
   int li_168 = 15;
   if (li_132) gi_920 = TRUE;
   if (MathAbs((gd_908 - Close[0]) / Point) > li_68 && gd_908 != 0.0 && li_64) {
      gi_904 = TRUE;
      g_datetime_916 = TimeCurrent();
      if (gi_920 == TRUE) {
         if (li_116) Print("The price shock for ", (gd_908 - Close[0]) / Point, " pips.", Symbol());
         if (li_116) Print("last_price ", DoubleToStr(gd_908, Digits), ", curent_price ", DoubleToStr(Close[0], Digits));
         gi_920 = FALSE;
      }
   }
   gd_908 = Close[0];
   bool li_172 = TRUE;
   if (li_104 != 0) {
      li_176 = 60 * li_104 + li_108;
      li_180 = 60 * TimeHour(TimeCurrent()) + TimeMinute(TimeCurrent());
      if (li_176 - li_180 <= 20 && li_180 - li_176 <= 15) li_172 = FALSE;
   }
   if (li_132) gi_924 = TRUE;
   if (li_172 == TRUE) {
      if (DayOfWeek() == 5 && TimeCurrent() - iTime(NULL, PERIOD_D1, 0) > 79200) {
         li_172 = FALSE;
         if (gi_924 == TRUE) {
            if (li_116) Print("Friday, ending trading.");
            gi_924 = FALSE;
         }
      }
   }
   if (li_132) gi_928 = TRUE;
   if (li_172 == TRUE) {
      if ((DayOfWeek() == 1 && TimeCurrent() - iTime(NULL, PERIOD_D1, 0) < 3900) || DayOfWeek() == 6 || DayOfWeek() == 7) {
         li_172 = FALSE;
         if (gi_928 == TRUE) {
            if (li_116) Print("Monday, prior to 1-00 in the morning do not trade. Or off.");
            gi_928 = FALSE;
         }
      }
   }
   double l_ord_open_price_184 = 0;
   double l_ord_open_price_192 = 0;
   for (li_160 = 0; li_160 < OrdersTotal(); li_160++) {
      if (OrderSelect(li_160, SELECT_BY_POS, MODE_TRADES) == FALSE) break;
      if (OrderType() == OP_BUYSTOP && OrderSymbol() == Symbol() && OrderMagicNumber() == Magic3) l_ord_open_price_184 = OrderOpenPrice();
      if (OrderType() == OP_SELLSTOP && OrderSymbol() == Symbol() && OrderMagicNumber() == Magic3) l_ord_open_price_192 = OrderOpenPrice();
   }
   bool li_200 = TRUE;
   bool li_204 = TRUE;
   int l_count_208 = 0;
   int l_count_212 = 0;
   if (li_132) {
      gi_932 = TRUE;
      gi_936 = TRUE;
   }
   for (li_160 = 0; li_160 < OrdersTotal(); li_160++) {
      if (OrderSelect(li_160, SELECT_BY_POS, MODE_TRADES) == FALSE) break;
      if (OrderType() == OP_BUY && OrderSymbol() == Symbol() && OrderMagicNumber() == Magic3) {
         if (OrderTicket() == g_ticket_940 && li_112) {
            PlaySound("alert.wav");
            g_ticket_940 = 0;
         }
         if (OrderOpenTime() >= Time[0]) {
            gi_932 = FALSE;
            continue;
         }
      }
      if (OrderType() == OP_BUYSTOP && OrderSymbol() == Symbol() && OrderMagicNumber() == Magic3) {
         li_200 = FALSE;
         g_ticket_940 = OrderTicket();
         l_count_208++;
         if (l_count_208 > 1) {
            OrderDelete(OrderTicket());
            continue;
         }
         if (gi_904 && OrderOpenPrice() - Ask < l_stoplevel_136 << 2 * Point) {
            OrderDelete(OrderTicket());
            gi_900 = FALSE;
            Print("Delete order ", OrderTicket(), " due to the price shock");
            continue;
         }
         if (li_172 == FALSE) {
            OrderDelete(OrderTicket());
            if (!(li_116)) continue;
            Print("Delete order ", OrderTicket(), "PERMIS_TRADE=", li_172);
            continue;
         }
         if (li_44 && MathAbs(OrderOpenPrice() - l_ord_open_price_184) / Point < l_stoplevel_136) {
            OrderDelete(OrderTicket());
            if (!(li_116)) continue;
            Print("Order ", OrderTicket(), " deleted because of the similarity with a Day Extremum");
            continue;
         }
         if (show_orders == FALSE && OrderOpenPrice() - Close[0] > 300.0 * Point) {
            OrderDelete(OrderTicket());
            if (!(li_116)) continue;
            Print("Order ", OrderTicket(), " deleted because price far");
            continue;
         }
         if (OrderOpenPrice() - g_price_724 >= 50.0 * Point || g_price_724 - OrderOpenPrice() >= 50.0 * Point && Ask <= OrderOpenPrice() - l_stoplevel_136 * Point) OrderModify(OrderTicket(), g_price_724, g_price_756, g_price_740, 0, Blue);
         else
            if (OrderOpenPrice() - g_price_724 < 50.0 * Point || g_price_724 - OrderOpenPrice() < 50.0 * Point && Ask <= OrderOpenPrice() - l_stoplevel_136 * Point && NormalizeDouble(OrderOpenPrice(), gi_856) != NormalizeDouble(g_price_724, gi_856)) OrderModify(OrderTicket(), g_price_724, g_price_756, g_price_740, 0, CLR_NONE);
         if (NormalizeDouble(OrderStopLoss(), gi_856) != NormalizeDouble(g_price_756, gi_856)) {
            if (li_116) Print("modify StopLoss, order ", OrderTicket(), " from ", OrderStopLoss(), " to ", g_price_756);
            OrderModify(OrderTicket(), OrderOpenPrice(), g_price_756, OrderTakeProfit(), 0, CLR_NONE);
         }
         if (NormalizeDouble(OrderLots(), LotDecimal) != NormalizeDouble(g_lots_796, LotDecimal)) {
            if (li_116) Print("modify lots, order ", OrderTicket(), " from ", OrderLots(), " to ", g_lots_796);
            OrderDelete(OrderTicket());
         }
      }
      if (OrderType() == OP_SELL && OrderSymbol() == Symbol() && OrderMagicNumber() == Magic3) {
         if (OrderTicket() == g_ticket_944 && li_112) {
            PlaySound("alert.wav");
            g_ticket_944 = 0;
         }
         if (OrderOpenTime() >= Time[0]) {
            gi_936 = FALSE;
            continue;
         }
      }
      if (OrderType() == OP_SELLSTOP && OrderSymbol() == Symbol() && OrderMagicNumber() == Magic3) {
         li_204 = FALSE;
         g_ticket_944 = OrderTicket();
         l_count_212++;
         if (l_count_212 > 1) OrderDelete(OrderTicket());
         else {
            if (gi_904 && Bid - OrderOpenPrice() < l_stoplevel_136 << 2 * Point) {
               OrderDelete(OrderTicket());
               gi_900 = FALSE;
               if (li_116) Print("Delete order ", OrderTicket(), " due to the price shock");
            } else {
               if (li_172 == FALSE) OrderDelete(OrderTicket());
               else {
                  if (li_44 && MathAbs(OrderOpenPrice() - l_ord_open_price_192) / Point < l_stoplevel_136) {
                     OrderDelete(OrderTicket());
                     if (li_116) Print("Order ", OrderTicket(), " closed because of the similarity with a Day Extremum");
                  } else {
                     if (show_orders == FALSE && Close[0] - OrderOpenPrice() > 300.0 * Point) {
                        OrderDelete(OrderTicket());
                        if (li_116) Print("Order ", OrderTicket(), " delited because price far");
                     } else {
                        if (OrderOpenPrice() - g_price_732 >= 50.0 * Point || g_price_732 - OrderOpenPrice() >= 50.0 * Point && Bid >= OrderOpenPrice() + l_stoplevel_136 * Point) OrderModify(OrderTicket(), g_price_732, g_price_764, g_price_748, 0, Red);
                        else
                           if (OrderOpenPrice() - g_price_732 < 50.0 * Point || g_price_732 - OrderOpenPrice() < 50.0 * Point && Bid >= OrderOpenPrice() + l_stoplevel_136 * Point && NormalizeDouble(OrderOpenPrice(), gi_856) != NormalizeDouble(g_price_732, gi_856)) OrderModify(OrderTicket(), g_price_732, g_price_764, g_price_748, 0, CLR_NONE);
                        if (NormalizeDouble(OrderStopLoss(), gi_856) != NormalizeDouble(g_price_764, gi_856)) OrderModify(OrderTicket(), OrderOpenPrice(), g_price_764, OrderTakeProfit(), 0, CLR_NONE);
                        if (NormalizeDouble(OrderLots(), LotDecimal) != NormalizeDouble(g_lots_788, LotDecimal)) OrderDelete(OrderTicket());
                     }
                  }
               }
            }
         }
      }
   }
   if ((TimeCurrent() - g_datetime_916) / 60 > li_168) {
      gi_900 = TRUE;
      gi_904 = FALSE;
   }
   bool li_216 = TRUE;
   bool li_220 = TRUE;
   if (High[iHighest(NULL, 0, MODE_HIGH, gi_860 - 1, 0)] >= High[gi_860]) li_216 = FALSE;
   if (Low[iLowest(NULL, 0, MODE_LOW, gi_868 - 1, 0)] <= Low[gi_868]) li_220 = FALSE;
   bool li_224 = TRUE;
   bool li_228 = TRUE;
   if (li_124 == FALSE || li_216 || gi_884 < g_time_892 || High[iHighest(NULL, 0, MODE_HIGH, gi_876, 0)] >= High[gi_876]) li_224 = FALSE;
   if (li_124 == FALSE || li_220 || gi_888 < g_time_896 || Low[iLowest(NULL, 0, MODE_LOW, gi_880, 0)] <= Low[gi_880]) li_228 = FALSE;
   bool li_232 = TRUE;
   bool li_236 = TRUE;
   if (li_44 && MathAbs(g_price_724 - l_ord_open_price_184) / Point < l_stoplevel_136) li_232 = FALSE;
   if (li_44 && MathAbs(g_price_732 - l_ord_open_price_192) / Point < l_stoplevel_136) li_236 = FALSE;
   bool li_240 = TRUE;
   bool li_244 = TRUE;
   if (show_orders == FALSE) {
      if (g_price_724 - Close[0] > 150.0 * Point) li_240 = FALSE;
      if (Close[0] - g_price_732 > 150.0 * Point) li_244 = FALSE;
   }
   if ((li_240 && li_232 && li_164 && gi_900 && li_172 && li_216 && gi_932 && li_200 && Ask <= g_price_724 - l_stoplevel_136 * Point) || (li_240 && li_232 && li_164 &&
      gi_900 && li_172 && li_224 && gi_932 && li_200 && Ask <= g_price_724 - l_stoplevel_136 * Point)) OrderSend(Symbol(), OP_BUYSTOP, g_lots_796, g_price_724, 0, NormalizeDouble(g_price_756,Digits), NormalizeDouble(g_price_740,Digits), "Fractals", Magic3, 0, Blue);
   if ((li_244 && li_236 && li_164 && gi_900 && li_172 && li_220 && gi_936 && li_204 && Bid >= g_price_732 + l_stoplevel_136 * Point) || (li_244 && li_236 && li_164 &&
      gi_900 && li_172 && li_228 && gi_936 && li_204 && Bid >= g_price_732 + l_stoplevel_136 * Point)) OrderSend(Symbol(), OP_SELLSTOP, g_lots_788, g_price_732, 0, NormalizeDouble(g_price_764,Digits), NormalizeDouble(g_price_748,Digits), "Fractals", Magic3, 0, Red);
   double ld_248 = ld_84;
   if (ld_84 < 1.0) ld_248 = 1;
   if (li_100 == 1) {
      l_price_256 = NormalizeDouble(Bid - ld_16 * l_stoplevel_136 * Point, Digits);
      l_price_264 = NormalizeDouble(Ask + ld_16 * l_stoplevel_136 * Point, Digits);
   }
   if (li_100 == 2) {
      l_price_256 = NormalizeDouble(Low[iLowest(NULL, 0, MODE_LOW, 2, 1)] - gd_780, Digits);
      l_price_264 = NormalizeDouble(High[iHighest(NULL, 0, MODE_HIGH, 2, 1)] + gd_780 + g_spread_852 * Point, Digits);
   }
   if (li_100 == 3) {
      l_price_256 = NormalizeDouble(MathMin(g_low_844, g_low_828) - gd_780, Digits);
      l_price_264 = NormalizeDouble(MathMax(g_high_836, g_high_820) + gd_780 + g_spread_852 * Point, Digits);
   }
   for (li_160 = 0; li_160 <= OrdersTotal(); li_160++) {
      if (OrderSelect(li_160, SELECT_BY_POS, MODE_TRADES) == FALSE) break;
      if (OrderType() == OP_BUY && OrderSymbol() == Symbol() && OrderMagicNumber() == Magic3) {
         if (l_stoplevel_136 > li_40 && OrderStopLoss() < OrderOpenPrice() && OrderProfit() > 0.0 && (iHigh(NULL, PERIOD_H4, 0) - Close[0]) / Point >= li_40) {
            OrderClose(OrderTicket(), OrderLots(), Bid, 3, CLR_NONE);
            RefreshRates();
            if (!(li_116)) continue;
            Print("Close Order ", OrderTicket(), " ---> stop>min_stop");
            continue;
         }
         if ((TimeCurrent() - OrderOpenTime() > 60 * li_80 && OrderStopLoss() < OrderOpenPrice() && Bid >= OrderOpenPrice()) || (li_60 == TRUE && OrderProfit() > 0.0)) {
            OrderClose(OrderTicket(), OrderLots(), Bid, 3, CLR_NONE);
            if (!(li_116)) continue;
            Print("Close Order ", OrderTicket(), " ---> time_of_close");
            continue;
         }
         if (li_64 && MathAbs((OrderOpenPrice() - g_price_724) / Point) > li_68 && OrderProfit() > 0.0) {
            OrderClose(OrderTicket(), OrderLots(), Bid, 5, Yellow);
            if (li_116) Print("Close Order ", OrderTicket(), " due to the price shock ", MathAbs((OrderOpenPrice() - g_price_724) / Digits), " pips");
            if (!(li_116)) continue;
            Print("OrderOpenPrise ", DoubleToStr(OrderOpenPrice(), Digits), ", PRICE_BUY ", DoubleToStr(g_price_724, Digits));
            continue;
         }
         if (li_72 == TRUE && OrderProfit() >= 0.0 && iClose(NULL, PERIOD_M1, 0) < iOpen(NULL, PERIOD_M1, 0) && Close[0] < iLow(NULL, PERIOD_M1, 1) && iClose(NULL, PERIOD_M1, 1) < iOpen(NULL, PERIOD_M1, 1) ||
            iClose(NULL, PERIOD_M1, 1) < iLow(NULL, PERIOD_M1, 1) + (iHigh(NULL, PERIOD_M1, 1) - iLow(NULL, PERIOD_M1, 1)) / 3.0) {
            OrderClose(OrderTicket(), OrderLots(), Bid, 3, Yellow);
            if (!(li_116)) continue;
            Print("Close Order ", OrderTicket(), " ---> minimum_risk_M1");
            continue;
         }
         if (li_76 == TRUE && OrderProfit() >= 0.0 && iClose(NULL, PERIOD_M5, 0) < iOpen(NULL, PERIOD_M5, 0) && Close[0] < iLow(NULL, PERIOD_M5, 1) && iClose(NULL, PERIOD_M5, 1) < iOpen(NULL, PERIOD_M5, 1) ||
            iClose(NULL, PERIOD_M5, 1) < iLow(NULL, PERIOD_M5, 1) + (iHigh(NULL, PERIOD_M5, 1) - iLow(NULL, PERIOD_M5, 1)) / 3.0) {
            OrderClose(OrderTicket(), OrderLots(), Bid, 3, Yellow);
            if (!(li_116)) continue;
            Print("Close Order ", OrderTicket(), " ---> minimum_risk_M5");
            continue;
         }
         if (OrderStopLoss() < OrderOpenPrice()) {
            if (li_52 == TRUE && Bid - OrderOpenPrice() >= MathCeil(l_stoplevel_136 * ld_84) * Point && Bid - OrderStopLoss() > MathCeil(l_stoplevel_136 * ld_84) * Point) {
               OrderModify(OrderTicket(), OrderOpenPrice(), NormalizeDouble(Bid - MathCeil(l_stoplevel_136 * ld_248) * Point, Digits), OrderTakeProfit(), 0, LightGreen);
               Print("������ � ���� BUY ����� ", OrderTicket());
               continue;
            }
            if (li_52 == TRUE && Bid - OrderOpenPrice() >= MathCeil(l_stoplevel_136 * ld_84) * Point && Bid - OrderStopLoss() > MathCeil(l_stoplevel_136 * ld_84) * Point && OrderStopLoss() < NormalizeDouble(Bid - MathCeil(l_stoplevel_136 * ld_248 +
               l_stoplevel_136 / 10.0) * Point, Digits)) {
               OrderModify(OrderTicket(), OrderOpenPrice(), NormalizeDouble(Bid - MathCeil(l_stoplevel_136 * ld_248 + l_stoplevel_136 / 10.0) * Point, Digits), OrderTakeProfit(), 0, LightGreen);
               Print("������ � ���� BUY ����� ", OrderTicket());
               continue;
            }
            if (li_56 == TRUE && OrderStopLoss() < l_price_256 && Bid - l_price_256 >= l_stoplevel_136 * Point) {
               if (li_116) Print("Reduce losses OP_BUY order ", OrderTicket(), " moved S/L from ", DoubleToStr(OrderStopLoss(), Digits), " to ", DoubleToStr(l_price_256, Digits), ". Methot S/L=", li_100);
               OrderModify(OrderTicket(), OrderOpenPrice(), l_price_256, OrderTakeProfit(), 0, LightGreen);
               continue;
            }
         }
         if (OrderStopLoss() >= OrderOpenPrice() && li_48 == TRUE) {
            if (Bid - OrderStopLoss() > Point * l_pips_92 * l_stoplevel_136) {
               OrderModify(OrderTicket(), OrderOpenPrice(), NormalizeDouble(Bid - l_pips_92 * l_stoplevel_136 * Point, Digits), OrderTakeProfit(), 0, LightGreen);
               continue;
            }
         }
         if (OrderStopLoss() >= OrderOpenPrice() && li_56 == TRUE && l_price_256 > OrderStopLoss() && Bid - l_price_256 >= l_stoplevel_136 * Point) {
            if (li_116) Print("Moving_S_L=true, Methot S/L=", li_100, ". Increase Profit OP_BUY order ", OrderTicket(), " from ", DoubleToStr(OrderStopLoss(), Digits), " to ", DoubleToStr(l_price_256, Digits));
            OrderModify(OrderTicket(), OrderOpenPrice(), l_price_256, OrderTakeProfit(), 0, LightGreen);
            continue;
         }
      }
      if (OrderType() == OP_SELL && OrderSymbol() == Symbol() && OrderMagicNumber() == Magic3) {
         if (l_stoplevel_136 > li_40 && OrderStopLoss() > OrderOpenPrice() && OrderProfit() > 0.0 && (Close[0] - iLow(NULL, PERIOD_H4, 0)) / Point >= li_40) {
            OrderClose(OrderTicket(), OrderLots(), Ask, 3, CLR_NONE);
            RefreshRates();
            if (li_116) Print("Close Order ", OrderTicket(), " ---> stop>min_stop");
         } else {
            if ((TimeCurrent() - OrderOpenTime() > 60 * li_80 && OrderStopLoss() > OrderOpenPrice() && Ask <= OrderOpenPrice()) || (li_60 == TRUE && OrderProfit() > 0.0)) OrderClose(OrderTicket(), OrderLots(), Ask, 3, CLR_NONE);
            else {
               if (li_64 && MathAbs((g_price_732 - OrderOpenPrice()) / Point) > li_68 && OrderProfit() > 0.0) {
                  OrderClose(OrderTicket(), OrderLots(), Ask, 5, Yellow);
                  if (li_116) Print("Close Order ", OrderTicket(), " due to the price shock ", MathAbs((OrderOpenPrice() - g_price_732) / Digits), " pips");
                  if (li_116) Print("OrderOpenPrise ", DoubleToStr(OrderOpenPrice(), Digits), ", PRICE_SELL ", DoubleToStr(g_price_732, Digits));
               } else {
                  if (li_72 == TRUE && OrderProfit() >= 0.0 && iClose(NULL, PERIOD_M1, 0) > iOpen(NULL, PERIOD_M1, 0) && Close[0] > iHigh(NULL, PERIOD_M1, 1) && iClose(NULL, PERIOD_M1, 1) > iOpen(NULL, PERIOD_M1, 1) ||
                     iClose(NULL, PERIOD_M1, 1) > iHigh(NULL, PERIOD_M1, 1) - (iHigh(NULL, PERIOD_M1, 1) - iLow(NULL, PERIOD_M1, 1)) / 3.0) {
                     OrderClose(OrderTicket(), OrderLots(), Ask, 3, Yellow);
                     if (li_116) Print("Close Order ", OrderTicket(), " ---> minimum_risk_M1");
                  } else {
                     if (li_76 == TRUE && OrderProfit() >= 0.0 && iClose(NULL, PERIOD_M5, 0) > iOpen(NULL, PERIOD_M5, 0) && Close[0] > iHigh(NULL, PERIOD_M5, 1) && iClose(NULL, PERIOD_M5, 1) > iOpen(NULL, PERIOD_M5, 1) ||
                        iClose(NULL, PERIOD_M5, 1) > iHigh(NULL, PERIOD_M5, 1) - (iHigh(NULL, PERIOD_M5, 1) - iLow(NULL, PERIOD_M5, 1)) / 3.0) {
                        OrderClose(OrderTicket(), OrderLots(), Ask, 3, Yellow);
                        if (li_116) Print("Close Order ", OrderTicket(), " ---> minimum_risk_M5");
                     } else {
                        if (OrderStopLoss() > OrderOpenPrice()) {
                           if (li_52 == TRUE && OrderOpenPrice() - Ask >= Point * MathCeil(l_stoplevel_136 * ld_84) && OrderStopLoss() - Ask > MathCeil(l_stoplevel_136 * ld_84) * Point) {
                              OrderModify(OrderTicket(), OrderOpenPrice(), NormalizeDouble(Ask + MathCeil(l_stoplevel_136 * ld_248) * Point, Digits), OrderTakeProfit(), 0, Pink);
                              Print("������ � ���� SELL ����� ", OrderTicket());
                              continue;
                           }
                           if (li_52 == TRUE && OrderOpenPrice() - Ask >= Point * MathCeil(l_stoplevel_136 * ld_84) && OrderStopLoss() - Ask > MathCeil(l_stoplevel_136 * ld_84) * Point && OrderStopLoss() > NormalizeDouble(Ask +
                              MathCeil(l_stoplevel_136 * ld_248 + l_stoplevel_136 / 10.0) * Point, Digits)) {
                              OrderModify(OrderTicket(), OrderOpenPrice(), NormalizeDouble(Ask + MathCeil(l_stoplevel_136 * ld_248 + l_stoplevel_136 / 10.0) * Point, Digits), OrderTakeProfit(), 0, Pink);
                              Print("������ � ���� SELL ����� ", OrderTicket());
                              continue;
                           }
                           if (li_56 == TRUE && OrderStopLoss() > l_price_264 && l_price_264 - Ask >= l_stoplevel_136 * Point) {
                              if (li_116) Print("Reduce losses OP_SELL order ", OrderTicket(), " moved S/L from", DoubleToStr(OrderStopLoss(), Digits), " to ", DoubleToStr(l_price_264, Digits), ". Methot S/L=", li_100);
                              OrderModify(OrderTicket(), OrderOpenPrice(), l_price_264, OrderTakeProfit(), 0, LightGreen);
                              continue;
                           }
                        }
                        if (OrderStopLoss() <= OrderOpenPrice() && li_48 == TRUE) {
                           if (OrderStopLoss() - Ask > Point * l_pips_92 * l_stoplevel_136) {
                              OrderModify(OrderTicket(), OrderOpenPrice(), NormalizeDouble(Ask + l_pips_92 * l_stoplevel_136 * Point, Digits), OrderTakeProfit(), 0, Pink);
                              continue;
                           }
                        }
                        if (OrderStopLoss() <= OrderOpenPrice() && li_56 == TRUE && l_price_264 < OrderStopLoss() && l_price_264 - Ask >= l_stoplevel_136 * Point) {
                           if (li_116) Print("Tr.stop = false. Methot S/L=", li_100, ". Increase Profit OP_SELL order ", OrderTicket(), " from ", DoubleToStr(OrderStopLoss(), Digits), " to ", DoubleToStr(l_price_264, Digits));
                           OrderModify(OrderTicket(), OrderOpenPrice(), l_price_264, OrderTakeProfit(), 0, LightGreen);
                        }
                     }
                  }
               }
            }
         }
      }
   }
}
void DeletePOs(int strat) {
   int ct;
   bool err,found;
   for (int cnt=OrdersTotal()-1; cnt>=0 ; cnt--) {
      if (!OrderSelect(cnt, SELECT_BY_POS,MODE_TRADES)) continue;
      if (OrderType()<2 || OrderSymbol()!=Symbol()) continue;
      found=false;
      switch(strat) {
         case 1: if (OrderMagicNumber()==Magic1) found=true;
         case 2: if (OrderMagicNumber()==Magic2) found=true;
         case 3: if (OrderMagicNumber()==Magic3) found=true;
         default: found=false;
         }
      if (found) {   
         ct=0;
         err=false;
         while (!err && ct<50) {
            err=OrderDelete(OrderTicket());
            ct++;
            }
         if (!err) Print("Delete unsuccessful - ticket #",OrderTicket()," - error ",GetLastError());
         }
      }
   return(true);
}


        
