//+------------------------------------------------------------------+
//|                                 42.ArrZZx2-(trueforex.pp.ua).mq4 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
/*
   Generated by EX4-TO-MQ4 decompiler FREEWARE V4.0.451.1 [-]
   Website: http://www.metaquotes.net
   E-mail : support@metaquotes.net
*/
#property link      "http://www.forexter.land.ru/indicators.htm"

#property indicator_chart_window
#property indicator_buffers 8
#property indicator_color1 MediumBlue
#property indicator_color2 RoyalBlue
#property indicator_color3 Blue
#property indicator_color4 Blue
#property indicator_color5 DarkGreen
#property indicator_color6 Red
#property indicator_color7 DarkGreen
#property indicator_color8 Red

extern int SR = 3;
extern int SRZZ = 12;
extern int MainRZZ = 20;
extern int FP = 21;
extern int SMF = 3;
extern bool DrawZZ = FALSE;
extern int PriceConst = 0;
double g_ibuf_104[];
double g_ibuf_108[];
double gda_112[];
double gda_116[];
double g_ibuf_120[];
double g_ibuf_124[];
double g_ibuf_128[];
double g_ibuf_132[];
int gia_136[6] = {0, 0, 0, 0, 0, 0};
int gia_140[5] = {0, 0, 0, 0, 0};
int gi_144;
int gi_148;
int gi_152;
int gi_156;
int gi_160;
bool gi_164 = TRUE;
int g_bars_168 = 0;

void MainCalculation(int ai_0) {
   if (Bars - ai_0 > SR + 1) SACalc(ai_0);
   else gda_112[ai_0] = 0;
   if (Bars - ai_0 > FP + SR + 2) {
      SMCalc(ai_0);
      return;
   }
   gda_116[ai_0] = 0;
}

void SACalc(int ai_0) {
   int li_4;
   int count_8;
   int li_12;
   int li_16;
   double ld_24;
   switch (PriceConst) {
   case 0:
      gda_112[ai_0] = iMA(NULL, 0, SR + 1, 0, MODE_LWMA, PRICE_CLOSE, ai_0);
      break;
   case 1:
      gda_112[ai_0] = iMA(NULL, 0, SR + 1, 0, MODE_LWMA, PRICE_OPEN, ai_0);
      break;
   case 4:
      gda_112[ai_0] = iMA(NULL, 0, SR + 1, 0, MODE_LWMA, PRICE_MEDIAN, ai_0);
      break;
   case 5:
      gda_112[ai_0] = iMA(NULL, 0, SR + 1, 0, MODE_LWMA, PRICE_TYPICAL, ai_0);
      break;
   case 6:
      gda_112[ai_0] = iMA(NULL, 0, SR + 1, 0, MODE_LWMA, PRICE_WEIGHTED, ai_0);
      break;
   default:
      gda_112[ai_0] = iMA(NULL, 0, SR + 1, 0, MODE_LWMA, PRICE_OPEN, ai_0);
   }
   for (int li_20 = ai_0 + SR + 2; li_20 > ai_0; li_20--) {
      ld_24 = 0.0;
      li_4 = 0;
      count_8 = 0;
      li_12 = li_20 + SR;
      li_16 = li_20 - SR;
      if (li_16 < ai_0) li_16 = ai_0;
      while (li_12 >= li_20) {
         count_8++;
         ld_24 += count_8 * SnakePrice(li_12);
         li_4 += count_8;
         li_12--;
      }
      while (li_12 >= li_16) {
         count_8--;
         ld_24 += count_8 * SnakePrice(li_12);
         li_4 += count_8;
         li_12--;
      }
      gda_112[li_20] = ld_24 / li_4;
   }
}

double SnakePrice(int ai_0) {
   switch (PriceConst) {
   case 0:
      return (Close[ai_0]);
   case 1:
      return (Open[ai_0]);
   case 4:
      return ((High[ai_0] + Low[ai_0]) / 2.0);
   case 5:
      return ((Close[ai_0] + High[ai_0] + Low[ai_0]) / 3.0);
   case 6:
      return ((2.0 * Close[ai_0] + High[ai_0] + Low[ai_0]) / 4.0);
   }
   return (Open[ai_0]);
}

void SMCalc(int ai_0) {
   double ld_4;
   double ld_12;
   for (int li_20 = ai_0 + SR + 2; li_20 >= ai_0; li_20--) {
      ld_4 = gda_112[ArrayMaximum(gda_112, FP, li_20)];
      ld_12 = gda_112[ArrayMinimum(gda_112, FP, li_20)];
      gda_116[li_20] = ((SMF + 2) * 2 * gda_112[li_20] - (ld_4 + ld_12)) / 2.0 / (SMF + 1);
   }
}

void LZZCalc(int ai_0) {
   int li_8;
   int li_12;
   int li_16;
   int index_20;
   int li_4 = ai_0 - 1;
   int li_24 = 0;
   int li_28 = 0;
   while (li_4 < gi_144 && li_16 == 0) {
      li_4++;
      g_ibuf_108[li_4] = 0;
      li_8 = li_4 - MainRZZ;
      if (li_8 < ai_0) li_8 = ai_0;
      li_12 = li_4 + MainRZZ;
      if (li_4 == ArrayMinimum(gda_116, li_12 - li_8 + 1, li_8)) {
         li_16 = -1;
         li_24 = li_4;
      }
      if (li_4 == ArrayMaximum(gda_116, li_12 - li_8 + 1, li_8)) {
         li_16 = 1;
         li_28 = li_4;
      }
   }
   if (li_16 != 0) {
      index_20 = 0;
      if (li_4 > ai_0) {
         if (gda_116[li_4] > gda_116[ai_0]) {
            if (li_16 == 1) {
               if (li_4 >= ai_0 + MainRZZ && index_20 < 5) {
                  index_20++;
                  gia_136[index_20] = li_4;
               }
               li_28 = li_4;
               g_ibuf_108[li_4] = gda_116[li_4];
            }
         } else {
            if (li_16 == -1) {
               if (li_4 >= ai_0 + MainRZZ && index_20 < 5) {
                  index_20++;
                  gia_136[index_20] = li_4;
               }
               li_24 = li_4;
               g_ibuf_108[li_4] = gda_116[li_4];
            }
         }
      }
      while (li_4 < gi_160 || index_20 < 5) {
         g_ibuf_108[li_4] = 0;
         li_8 = li_4 - MainRZZ;
         if (li_8 < ai_0) li_8 = ai_0;
         li_12 = li_4 + MainRZZ;
         if (li_4 == ArrayMinimum(gda_116, li_12 - li_8 + 1, li_8)) {
            if (li_16 == -1 && gda_116[li_4] < gda_116[li_24]) {
               if (li_4 >= ai_0 + MainRZZ && index_20 < 5) gia_136[index_20] = li_4;
               g_ibuf_108[li_24] = 0;
               g_ibuf_108[li_4] = gda_116[li_4];
               li_24 = li_4;
            }
            if (li_16 == 1) {
               if (li_4 >= ai_0 + MainRZZ && index_20 < 5) {
                  index_20++;
                  gia_136[index_20] = li_4;
               }
               g_ibuf_108[li_4] = gda_116[li_4];
               li_16 = -1;
               li_24 = li_4;
            }
         }
         if (li_4 == ArrayMaximum(gda_116, li_12 - li_8 + 1, li_8)) {
            if (li_16 == 1 && gda_116[li_4] > gda_116[li_28]) {
               if (li_4 >= ai_0 + MainRZZ && index_20 < 5) gia_136[index_20] = li_4;
               g_ibuf_108[li_28] = 0;
               g_ibuf_108[li_4] = gda_116[li_4];
               li_28 = li_4;
            }
            if (li_16 == -1) {
               if (li_4 >= ai_0 + MainRZZ && index_20 < 5) {
                  index_20++;
                  gia_136[index_20] = li_4;
               }
               g_ibuf_108[li_4] = gda_116[li_4];
               li_16 = 1;
               li_28 = li_4;
            }
         }
         li_4++;
         if (li_4 > gi_144) return;
      }
      gi_152 = Bars - gia_136[5];
      g_ibuf_108[ai_0] = gda_116[ai_0];
      return;
   }
}

void SZZCalc(int ai_0) {
   int li_8;
   int li_12;
   int li_16;
   int index_20;
   int li_4 = ai_0 - 1;
   int li_24 = 0;
   int li_28 = 0;
   while (li_4 <= gi_160 && li_16 == 0) {
      li_4++;
      g_ibuf_132[li_4] = 0;
      g_ibuf_128[li_4] = 0;
      g_ibuf_124[li_4] = 0;
      g_ibuf_120[li_4] = 0;
      g_ibuf_104[li_4] = 0;
      li_8 = li_4 - SRZZ;
      if (li_8 < ai_0) li_8 = ai_0;
      li_12 = li_4 + SRZZ;
      if (li_4 == ArrayMinimum(gda_116, li_12 - li_8 + 1, li_8)) {
         li_16 = -1;
         li_24 = li_4;
      }
      if (li_4 == ArrayMaximum(gda_116, li_12 - li_8 + 1, li_8)) {
         li_16 = 1;
         li_28 = li_4;
      }
   }
   if (li_16 != 0) {
      index_20 = 0;
      if (li_4 > ai_0) {
         if (gda_116[li_4] > gda_116[ai_0]) {
            if (li_16 == 1) {
               if (li_4 >= ai_0 + SRZZ && index_20 < 4) {
                  index_20++;
                  gia_140[index_20] = li_4;
               }
               li_28 = li_4;
               g_ibuf_124[li_4 - 1] = Open[li_4 - 1];
            }
         } else {
            if (li_16 == -1) {
               if (li_4 >= ai_0 + SRZZ && index_20 < 4) {
                  index_20++;
                  gia_140[index_20] = li_4;
               }
               li_24 = li_4;
               g_ibuf_120[li_4 - 1] = Open[li_4 - 1];
            }
         }
      }
      while (li_4 <= gi_160 || index_20 < 4) {
         g_ibuf_132[li_4] = 0;
         g_ibuf_128[li_4] = 0;
         g_ibuf_124[li_4] = 0;
         g_ibuf_120[li_4] = 0;
         g_ibuf_104[li_4] = 0;
         li_8 = li_4 - SRZZ;
         if (li_8 < ai_0) li_8 = ai_0;
         li_12 = li_4 + SRZZ;
         if (li_4 == ArrayMinimum(gda_116, li_12 - li_8 + 1, li_8)) {
            if (li_16 == -1 && gda_116[li_4] < gda_116[li_24]) {
               if (li_4 >= ai_0 + SRZZ && index_20 < 4) gia_140[index_20] = li_4;
               g_ibuf_120[li_24 - 1] = 0;
               g_ibuf_120[li_4 - 1] = Open[li_4 - 1];
               li_24 = li_4;
            }
            if (li_16 == 1) {
               if (li_4 >= ai_0 + SRZZ && index_20 < 4) {
                  index_20++;
                  gia_140[index_20] = li_4;
               }
               g_ibuf_120[li_4 - 1] = Open[li_4 - 1];
               li_16 = -1;
               li_24 = li_4;
            }
         }
         if (li_4 == ArrayMaximum(gda_116, li_12 - li_8 + 1, li_8)) {
            if (li_16 == 1 && gda_116[li_4] > gda_116[li_28]) {
               if (li_4 >= ai_0 + SRZZ && index_20 < 4) gia_140[index_20] = li_4;
               g_ibuf_124[li_28 - 1] = 0;
               g_ibuf_124[li_4 - 1] = Open[li_4 - 1];
               li_28 = li_4;
            }
            if (li_16 == -1) {
               if (li_4 >= ai_0 + SRZZ && index_20 < 4) {
                  index_20++;
                  gia_140[index_20] = li_4;
               }
               g_ibuf_124[li_4 - 1] = Open[li_4 - 1];
               li_16 = 1;
               li_28 = li_4;
            }
         }
         li_4++;
         if (li_4 > gi_160) return;
      }
      gi_148 = Bars - gia_140[4];
      return;
   }
}

void ArrCalc() {
   int li_8;
   int li_16 = 0;
   for (int li_0 = gi_160; g_ibuf_108[li_0] == 0.0; li_0--) {
   }
   int li_4 = li_0;
   double ld_20 = g_ibuf_108[li_0];
   for (li_0--; g_ibuf_108[li_0] == 0.0; li_0--) {
   }
   if (g_ibuf_108[li_0] > ld_20) li_16 = 1;
   if (g_ibuf_108[li_0] > 0.0 && g_ibuf_108[li_0] < ld_20) li_16 = -1;
   ld_20 = g_ibuf_108[li_4];
   for (li_0 = li_4 - 1; li_0 > 0; li_0--) {
      if (g_ibuf_108[li_0] > ld_20) {
         li_16 = -1;
         ld_20 = g_ibuf_108[li_0];
      }
      if (g_ibuf_108[li_0] > 0.0 && g_ibuf_108[li_0] < ld_20) {
         li_16 = 1;
         ld_20 = g_ibuf_108[li_0];
      }
      if (li_16 > 0 && g_ibuf_124[li_0] > 0.0) {
         g_ibuf_104[li_0] = Open[li_0];
         g_ibuf_124[li_0] = 0;
      }
      if (li_16 < 0 && g_ibuf_120[li_0] > 0.0) {
         g_ibuf_104[li_0] = Open[li_0];
         g_ibuf_120[li_0] = 0;
      }
      if (li_16 > 0 && g_ibuf_120[li_0] > 0.0) {
         if (li_0 > 1) {
            li_4 = li_0 - 1;
            li_8 = li_4 - SRZZ + 1;
            if (li_8 < 0) li_8 = 0;
            for (int li_12 = li_4; li_12 >= li_8 && g_ibuf_124[li_12] == 0.0; li_12--) {
               g_ibuf_128[li_12] = g_ibuf_120[li_0];
               g_ibuf_132[li_12] = 0;
            }
         }
         if (li_0 == 1) g_ibuf_128[0] = g_ibuf_120[li_0];
      }
      if (li_16 < 0 && g_ibuf_124[li_0] > 0.0) {
         if (li_0 > 1) {
            li_4 = li_0 - 1;
            li_8 = li_4 - SRZZ + 1;
            if (li_8 < 0) li_8 = 0;
            for (li_12 = li_4; li_12 >= li_8 && g_ibuf_120[li_12] == 0.0; li_12--) {
               g_ibuf_132[li_12] = g_ibuf_124[li_0];
               g_ibuf_128[li_12] = 0;
            }
         }
         if (li_0 == 1) g_ibuf_132[0] = g_ibuf_124[li_0];
      }
   }
}

void deinit() {
}

int init() {
   IndicatorBuffers(8);
   SetIndexBuffer(0, g_ibuf_104);
   SetIndexStyle(0, DRAW_ARROW, EMPTY, 2);
   SetIndexArrow(0, SYMBOL_STOPSIGN);
   SetIndexEmptyValue(0, 0.0);
   SetIndexBuffer(1, g_ibuf_108);
   if (DrawZZ) {
      SetIndexStyle(1, DRAW_SECTION, EMPTY, 2);
      SetIndexEmptyValue(1, 0.0);
   } else SetIndexStyle(1, DRAW_NONE);
   SetIndexBuffer(2, gda_112);
   SetIndexStyle(2, DRAW_NONE);
   SetIndexBuffer(3, gda_116);
   SetIndexStyle(3, DRAW_NONE);
   SetIndexBuffer(4, g_ibuf_120);
   SetIndexStyle(4, DRAW_ARROW, EMPTY, 1);
   SetIndexArrow(4, 233);
   SetIndexEmptyValue(4, 0.0);
   SetIndexBuffer(5, g_ibuf_124);
   SetIndexStyle(5, DRAW_ARROW, EMPTY, 1);
   SetIndexArrow(5, 234);
   SetIndexEmptyValue(5, 0.0);
   SetIndexBuffer(6, g_ibuf_128);
   SetIndexStyle(6, DRAW_ARROW);
   SetIndexArrow(6, 217);
   SetIndexEmptyValue(6, 0.0);
   SetIndexBuffer(7, g_ibuf_132);
   SetIndexStyle(7, DRAW_ARROW);
   SetIndexArrow(7, 218);
   SetIndexEmptyValue(7, 0.0);
   return (0);
}

int start() {
   int li_0 = IndicatorCounted();
   if (li_0 < 0) return (-1);
   if (li_0 > 0) li_0--;
   if (gi_164 == TRUE) {
      if (SR < 2) SR = 2;
      if (Bars <= (MainRZZ + FP + SR + 2) * 2) return (-1);
      if (SRZZ <= SR) SRZZ = SR + 1;
      gi_144 = Bars - (MainRZZ + FP + SR + 2);
      gi_160 = gi_144;
      gi_156 = gi_160;
      g_bars_168 = Bars;
      gi_164 = FALSE;
   }
   int li_4 = Bars - li_0;
   for (int li_8 = li_4; li_8 >= 0; li_8--) MainCalculation(li_8);
   if (g_bars_168 != Bars) {
      gi_156 = Bars - gi_148;
      gi_160 = Bars - gi_152;
      g_bars_168 = Bars;
   }
   SZZCalc(0);
   LZZCalc(0);
   ArrCalc();
   return (0);
}

        
