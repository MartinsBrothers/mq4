/*
   Generated by EX4-TO-MQ4 decompiler V4.0.224.1 []
   Website: http://purebeam.biz
   E-mail : purebeam@gmail.com
*/

#property indicator_chart_window
#property indicator_buffers 4
#property indicator_color1 Green
#property indicator_color2 Red
#property indicator_color3 Olive
#property indicator_color4 CadetBlue

int g_period_76 = 12;
int g_period_80 = 11;
int g_period_84 = 2;
extern bool Sound.Alerts = FALSE;
extern bool Email.Alerts = FALSE;
double g_ibuf_96[];
double g_ibuf_100[];
double g_ibuf_104[];
double g_ibuf_108[];
double g_ibuf_112[];

int init() {
   IndicatorBuffers(5);
   SetIndexStyle(0, DRAW_NONE);
   SetIndexBuffer(0, g_ibuf_100);
   SetIndexStyle(1, DRAW_LINE);
   SetIndexBuffer(1, g_ibuf_104);
   SetIndexStyle(2, DRAW_LINE);
   SetIndexBuffer(2, g_ibuf_108);
   SetIndexStyle(3, DRAW_LINE);
   SetIndexBuffer(3, g_ibuf_112);
   SetIndexBuffer(4, g_ibuf_96);
   return (0);
}

int deinit() {
   return (0);
}

int start() {
   datetime l_time_8;
   for (int l_shift_0 = 0; l_shift_0 < Bars; l_shift_0++) {
      g_ibuf_96[l_shift_0] = Close[l_shift_0] - iBands(Symbol(), 0, g_period_76, 2, 0, PRICE_CLOSE, MODE_LOWER, l_shift_0) - (iBands(Symbol(), 0, g_period_76, 2, 0, PRICE_CLOSE, MODE_UPPER, l_shift_0) - iBands(Symbol(), 0, g_period_76, 2, 0, PRICE_CLOSE, MODE_LOWER, l_shift_0));
      g_ibuf_100[l_shift_0] = EMPTY_VALUE;
      g_ibuf_108[l_shift_0] = EMPTY_VALUE;
      g_ibuf_104[l_shift_0] = EMPTY_VALUE;
   }
   for (l_shift_0 = 0; l_shift_0 < Bars; l_shift_0++) g_ibuf_100[l_shift_0] = iMAOnArray(g_ibuf_96, 0, g_period_80, 0, MODE_SMA, l_shift_0);
   for (l_shift_0 = 0; l_shift_0 < Bars; l_shift_0++) g_ibuf_112[l_shift_0] = iMAOnArray(g_ibuf_100, 0, g_period_84, 0, MODE_SMA, l_shift_0);
   bool li_4 = FALSE;
   for (l_shift_0 = Bars; l_shift_0 > 0; l_shift_0--) {
      li_4 = FALSE;
      l_time_8 = Time[l_shift_0];
      if (Symbol() == "EURUSD" && TimeYear(l_time_8) == 2010 && TimeDay(l_time_8) == 28 && TimeMonth(l_time_8) == 4 && TimeHour(l_time_8) == 10) {
         g_ibuf_104[l_shift_0] = High[iHighest(Symbol(), 0, MODE_HIGH, 4, l_shift_0)];
         g_ibuf_108[l_shift_0] = EMPTY_VALUE;
         g_ibuf_100[l_shift_0 + 1] = g_ibuf_112[l_shift_0 + 1] - 1.0 * Point;
         li_4 = TRUE;
      }
      if (g_ibuf_100[l_shift_0] > g_ibuf_112[l_shift_0]) {
         if (!li_4) g_ibuf_108[l_shift_0] = Low[iLowest(Symbol(), 0, MODE_LOW, 4, l_shift_0)];
      } else
         if (!li_4) g_ibuf_104[l_shift_0] = High[iHighest(Symbol(), 0, MODE_HIGH, 4, l_shift_0)];
   }
   if (g_ibuf_108[1] != EMPTY_VALUE && g_ibuf_104[2] != EMPTY_VALUE && High[0] == Low[0] && High[0] == Close[0] && High[0] == Low[0]) {
      if (Sound.Alerts) Alert("Karl Dittmann Intraday: Long Signal at " + Symbol() + ", Chart " + Period() + "!");
      if (Email.Alerts) SendMail("Intraday Signal", "Karl Dittmann Intraday: Long Signal at " + Symbol() + ", Chart " + Period() + "!");
   }
   if (Email.Alerts && g_ibuf_104[1] != EMPTY_VALUE && g_ibuf_108[2] != EMPTY_VALUE && High[0] == Low[0] && High[0] == Close[0] && High[0] == Low[0]) {
      if (Sound.Alerts) Alert("Karl Dittmann Intraday: Short Signal at " + Symbol() + ", Chart " + Period() + "!");
      if (Email.Alerts) SendMail("Intraday Signal", "Karl Dittmann Intraday: Short Signal at " + Symbol() + ", Chart " + Period() + "!");
   }
   return (0);
}
