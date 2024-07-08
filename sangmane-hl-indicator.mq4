/*
   Generated by EX4-TO-MQ4 decompiler V4.0.224.1 []
   Website: http://purebeam.biz
   E-mail : purebeam@gmail.com
*/
#property copyright ""
#property link      ""

#property indicator_chart_window
#property indicator_buffers 2
#property indicator_color1 Gray
#property indicator_color2 Gray

double g_ibuf_76[];
double g_ibuf_80[];

int init() {
   IndicatorBuffers(2);
   SetIndexBuffer(0, g_ibuf_76);
   SetIndexBuffer(1, g_ibuf_80);
   SetIndexStyle(0, DRAW_ARROW);
   SetIndexArrow(0, 217);
   SetIndexStyle(1, DRAW_ARROW);
   SetIndexArrow(1, 218);
   return (0);
}

int deinit() {
   string l_name_0;
   for (int li_8 = ObjectsTotal() - 1; li_8 >= 0; li_8--) {
      l_name_0 = ObjectName(li_8);
      if (StringFind(l_name_0, WindowExpertName()) >= 0) ObjectDelete(l_name_0);
   }
   return (0);
}

int start() {
   double ld_12;
   int l_ind_counted_0 = IndicatorCounted();
   if (l_ind_counted_0 < 0) {
      ArrayInitialize(g_ibuf_76, 0);
      ArrayInitialize(g_ibuf_80, 0);
   }
   int li_4 = Bars - l_ind_counted_0 - 1;
   for (int l_index_8 = 0; l_index_8 < li_4; l_index_8++) {
      g_ibuf_76[l_index_8 + 3] = iFractals(NULL, 0, MODE_UPPER, l_index_8 + 3);
      g_ibuf_80[l_index_8 + 3] = iFractals(NULL, 0, MODE_LOWER, l_index_8 + 3);
   }
   l_index_8 = 3;
   double ld_20 = 0;
   double ld_28 = 0;
   int li_36 = l_index_8;
   int li_40 = l_index_8;
   while (true) {
      if (g_ibuf_76[l_index_8] != 0.0 && g_ibuf_76[l_index_8] != EMPTY_VALUE) {
         if (ld_20 == 0.0) ld_20 = g_ibuf_76[l_index_8];
         else {
            ld_12 = 0.7 * iATR(NULL, 0, 5, li_36);
            if (ld_20 > g_ibuf_76[l_index_8]) Draw(Time[li_36], ld_20 + ld_12, "HH");
            else Draw(Time[li_36], ld_20 + ld_12, "LH");
            ld_20 = g_ibuf_76[l_index_8];
         }
         li_36 = l_index_8;
      }
      if (g_ibuf_80[l_index_8] != 0.0 && g_ibuf_80[l_index_8] != EMPTY_VALUE) {
         if (ld_28 == 0.0) ld_28 = g_ibuf_80[l_index_8];
         else {
            ld_12 = 0.3 * iATR(NULL, 0, 5, li_40);
            if (ld_28 < g_ibuf_80[l_index_8]) Draw(Time[li_40], ld_28 - ld_12, "LL");
            else Draw(Time[li_40], ld_28 - ld_12, "HL");
            ld_28 = g_ibuf_80[l_index_8];
         }
         li_40 = l_index_8;
      }
      l_index_8++;
      if (l_index_8 < Bars - 1) continue;
      break;
   }
   return (0);
}

void Draw(int a_datetime_0, double a_price_4, string as_12) {
   color l_color_28;
   string l_name_20 = WindowExpertName() + a_datetime_0;
   if (ObjectFind(l_name_20) < 0) {
      ObjectCreate(l_name_20, OBJ_TEXT, 0, a_datetime_0, a_price_4);
      if (StringSubstr(as_12, 0, 1) == "H") l_color_28 = Blue;
      else l_color_28 = Red;
      ObjectSetText(l_name_20, as_12, 9, "Tahoma", l_color_28);
   }
}
