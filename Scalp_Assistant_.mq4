/*
   Generated by EX4-TO-MQ4 decompiler V4.0.224.1 []
   Website: http://purebeam.biz
   E-mail : purebeam@gmail.com
*/
#property copyright "Copyright � 2010, stratman, pipware.com"
#property link      "http://www.pipware.com"

#property indicator_separate_window
#property indicator_minimum -60.0
#property indicator_maximum 60.0
#property indicator_levelcolor MidnightBlue
#property indicator_buffers 6
#property indicator_color1 Indigo
#property indicator_color2 DarkOrange
#property indicator_color3 FireBrick
#property indicator_color4 Red
#property indicator_color5 Blue
#property indicator_color6 DodgerBlue
#property indicator_width1 3
#property indicator_level1 -40.0
#property indicator_width2 1
#property indicator_level2 40.0
#property indicator_width3 2
#property indicator_width4 2
#property indicator_width5 2
#property indicator_width6 2
#property indicator_level3 20.0
#property indicator_level4 -20.0

extern int KPeriod = 56;
extern int DPeriod = 23;
extern int Slowing = 34;
extern int Slope = 2;
double g_ibuf_108[];
double g_ibuf_112[];
double g_ibuf_116[];
double g_ibuf_120[];
double g_ibuf_124[];
double g_ibuf_128[];
bool gi_132 = TRUE;
bool gi_136 = TRUE;

int init() {
   IndicatorBuffers(6);
   SetIndexStyle(0, DRAW_LINE);
   SetIndexStyle(1, DRAW_LINE);
   SetIndexStyle(2, DRAW_LINE);
   SetIndexStyle(3, DRAW_LINE);
   SetIndexStyle(4, DRAW_LINE);
   SetIndexStyle(5, DRAW_LINE);
   SetIndexBuffer(0, g_ibuf_108);
   SetIndexBuffer(1, g_ibuf_112);
   SetIndexBuffer(2, g_ibuf_116);
   SetIndexBuffer(3, g_ibuf_120);
   SetIndexBuffer(4, g_ibuf_124);
   SetIndexBuffer(5, g_ibuf_128);
   SetIndexLabel(0, "Signal");
   SetIndexLabel(1, "Stochastics");
   SetIndexLabel(2, "TradeOKUP1");
   SetIndexLabel(3, "TradeOKUP2");
   SetIndexLabel(4, "TradeOKDN1");
   SetIndexLabel(5, "TradeOKDN2");
   IndicatorShortName("Scalping_Assistant");
   return (0);
}

int deinit() {
   return (0);
}

int start() {
   int l_shift_0 = pw.system.GetShift();
   if (l_shift_0 < 0) return (-1);
   while (l_shift_0 >= 0) {
      if (l_shift_0 < 500) {
         g_ibuf_112[l_shift_0] = iStochastic(NULL, 0, KPeriod, DPeriod, Slope, MODE_SMA, 0, MODE_MAIN, l_shift_0) - 50.0;
         g_ibuf_108[l_shift_0] = iStochastic(NULL, 0, KPeriod, DPeriod, Slope, MODE_SMA, 0, MODE_SIGNAL, l_shift_0) - 50.0;
         UpdateBuffers(l_shift_0, g_ibuf_112, g_ibuf_116, g_ibuf_120, g_ibuf_124, g_ibuf_128);
      }
      l_shift_0--;
   }
   return (0);
}

void UpdateBuffers(int ai_0, double ada_4[], double &ada_8[], double &ada_12[], double &ada_16[], double &ada_20[]) {
   ada_8[ai_0] = EMPTY_VALUE;
   ada_12[ai_0] = EMPTY_VALUE;
   ada_16[ai_0] = EMPTY_VALUE;
   ada_20[ai_0] = EMPTY_VALUE;
   double ld_24 = ada_4[ai_0 + 1] - ada_4[ai_0];
   if (MathAbs(ld_24) > Slope) {
      if (gi_136) {
         if (gi_132) gi_132 = FALSE;
         else gi_132 = TRUE;
      }
      if (gi_132) {
         if (ld_24 > 0.0) {
            ada_8[ai_0] = ada_4[ai_0];
            ada_8[ai_0 + 1] = ada_4[ai_0 + 1];
         } else {
            ada_16[ai_0] = ada_4[ai_0];
            ada_16[ai_0 + 1] = ada_4[ai_0 + 1];
         }
      } else {
         if (ld_24 > 0.0) {
            ada_12[ai_0] = ada_4[ai_0];
            ada_12[ai_0 + 1] = ada_4[ai_0 + 1];
         } else {
            ada_20[ai_0] = ada_4[ai_0];
            ada_20[ai_0 + 1] = ada_4[ai_0 + 1];
         }
      }
      gi_136 = FALSE;
      return;
   }
   gi_136 = TRUE;
}

int pw.system.GetShift(int ai_0 = 0) {
   int l_ind_counted_4 = IndicatorCounted();
   if (l_ind_counted_4 < 0) return (-1);
   int li_ret_8 = Bars - (l_ind_counted_4 + 1);
   if (ai_0 != 0 && ai_0 < li_ret_8) return (ai_0);
   return (li_ret_8);
}