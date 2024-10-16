//+------------------------------------------------------------------+
//|                                                   Scalper_FX.mq4 |
//|              Copyright 2017, Killer_FX MetaQuotes Software Corp. |
//|                                                                  |
//+------------------------------------------------------------------+
#property copyright "Copyright 2017, Killer_FX MetaQuotes Software Corp."
#property link      ""
#property version   "1.00"
#import "stdlib.ex4"
   string ErrorDescription(int a0);
#import
extern bool UseMM = true;
extern double MinLots = 0.01;
extern double MaxLots = 1000.0;
extern double Risk = 10.0;
extern double FixedLots = 0.1;
extern int StopLoss = 300;
extern double MaxSpreadPlusCommission = 10.0;
extern int Limit = 20;
extern int Distance = 50;
extern int MAPeriod = 3;
extern int MAMethod = 3;
extern string TimeFilter = "----------Time Filter";
extern int StartHour = 0;
extern int StartMinute = 0;
extern int EndHour = 23;
extern int EndMinute = 59;
extern int Filter = 300;
extern int MagicNumber = 777;
extern string TradeComment = "Scalper_FX";
int Gi_180 = 0;
double G_pips_184 = 0.0;
int G_digits_192 = 0;
double G_point_196 = 0.0;
int Gi_204;
double Gd_208;
double Gd_216;
double Gd_224;
double Gd_232;
double Gd_240;
double Gd_248;
double Gd_256;
int G_slippage_264 = 3;
bool Gi_268;
double Gd_272;
double Gda_280[30];
int Gi_284 = 0;
string Gs_dummy_288;
string Gs_unused_316 = "";
string Gs_unused_324 = "";
double Gd_336;
double Gd_344;
int G_time_352;
int Gi_356;
int G_datetime_360;
string Gs_364 = "000,000,000";
string Gs_372 = "000,000,255";
int Gi_380;
int Gi_384;
int Gi_388;
int Gi_392 = 40;
double G_timeframe_396 = 240.0;
bool Gi_404 = TRUE;
color G_color_408 = DimGray;
string G_name_412 = "SpreadIndikatorObj";
double Gd_420;
color G_color_428 = Red;
color G_color_432 = DarkGray;
color G_color_436 = SpringGreen;
bool Gi_440 = TRUE;
double G_ihigh_444;
double G_ilow_452;
double Gd_460;
int G_datetime_468;

int init() {
   int timeframe_8;
   ArrayInitialize(Gda_280, 0);
   G_digits_192 = Digits;
   G_point_196 = Point;
   Print("Digits: " + G_digits_192 + " Point: " + DoubleToStr(G_point_196, G_digits_192));
   double lotstep_0 = MarketInfo(Symbol(), MODE_LOTSTEP);
   Gi_204 = MathLog(lotstep_0) / MathLog(0.1);
   Gd_208 = MathMax(MinLots, MarketInfo(Symbol(), MODE_MINLOT));
   Gd_216 = MathMin(MaxLots, MarketInfo(Symbol(), MODE_MAXLOT));
   Gd_224 = Risk / 100.0;
   Gd_232 = NormalizeDouble(MaxSpreadPlusCommission * G_point_196, G_digits_192 + 1);
   Gd_240 = NormalizeDouble(Limit * G_point_196, G_digits_192);
   Gd_248 = NormalizeDouble(Distance * G_point_196, G_digits_192);
   Gd_256 = NormalizeDouble(G_point_196 * Filter, G_digits_192);
   Gi_268 = FALSE;
   Gd_272 = NormalizeDouble(G_pips_184 * G_point_196, G_digits_192 + 1);
   if (!IsTesting()) {
      f0_8();
      if (Gi_404) {
         timeframe_8 = Period();
         switch (timeframe_8) {
         case PERIOD_M1:
            G_timeframe_396 = 5;
            break;
         case PERIOD_M5:
            G_timeframe_396 = 15;
            break;
         case PERIOD_M15:
            G_timeframe_396 = 30;
            break;
         case PERIOD_M30:
            G_timeframe_396 = 60;
            break;
         case PERIOD_H1:
            G_timeframe_396 = 240;
            break;
         case PERIOD_H4:
            G_timeframe_396 = 1440;
            break;
         case PERIOD_D1:
            G_timeframe_396 = 10080;
            break;
         case PERIOD_W1:
            G_timeframe_396 = 43200;
            break;
         case PERIOD_MN1:
            G_timeframe_396 = 43200;
         }
      }
      Gd_420 = 0.0001;
      f0_7();
      f0_2();
      f0_0();
      f0_3();
   }
   return (0);
}
	 	  	 			  	   	  	  	 				    	  	 					    	  	   	   	 	 	   	 	 		  		 					 			 		  	   				 		 		  	      			   			 	 	 	 					  	 			  	 
int deinit() {
   if (!IsTesting()) {
      for (int Li_0 = 1; Li_0 <= Gi_392; Li_0++) ObjectDelete("Padding_rect" + Li_0);
      for (int count_4 = 0; count_4 < 10; count_4++) {
         ObjectDelete("BD" + count_4);
         ObjectDelete("SD" + count_4);
      }
      ObjectDelete("time");
      ObjectDelete(G_name_412);
   }
   Comment("");
   ObjectDelete("B3LLogo");
   ObjectDelete("B3LCopy");
   ObjectDelete("FiboUp");
   ObjectDelete("FiboDn");
   ObjectDelete("FiboIn");
   return (0);
}
	 	 			  	    		   		  	 				 		   			   	  	  			  						 							 			 				  	    		    	 	 	    	 	    	 	 	 							 	  	 				 				 			  		  	 	
int start() {
   int error_8;
   string Ls_12;
   int ticket_20;
   double price_24;
   bool bool_32;
   double Ld_36;
   double Ld_44;
   double price_60;
   double Ld_112;
   int Li_180;
   int cmd_188;
   double Ld_196;
   double Ld_204;
   double ihigh_68 = iHigh(NULL, 0, 0);
   double ilow_76 = iLow(NULL, 0, 0);
   double ima_84 = iMA(NULL, 0, MAPeriod, Gi_180, MAMethod, PRICE_LOW, 0);
   double ima_92 = iMA(NULL, 0, MAPeriod, Gi_180, MAMethod, PRICE_HIGH, 0);
   double Ld_100 = ima_84 - ima_92;
   if (!Gi_268) {
      for (int pos_108 = OrdersHistoryTotal() - 1; pos_108 >= 0; pos_108--) {
         if (OrderSelect(pos_108, SELECT_BY_POS, MODE_HISTORY)) {
            if (OrderProfit() != 0.0) {
               if (OrderClosePrice() != OrderOpenPrice()) {
                  if (OrderSymbol() == Symbol()) {
                     Gi_268 = TRUE;
                     Ld_112 = MathAbs(OrderProfit() / (OrderClosePrice() - OrderOpenPrice()));
                     Gd_272 = (-OrderCommission()) / Ld_112;
                     break;
                  }
               }
            }
         }
      }
   }

   double Ld_120 = Ask - Bid;
   ArrayCopy(Gda_280, Gda_280, 0, 1, 29);
   Gda_280[29] = Ld_120;
   if (Gi_284 < 30) Gi_284++;
   double Ld_128 = 0;
   pos_108 = 29;
   for (int count_136 = 0; count_136 < Gi_284; count_136++) {
      Ld_128 += Gda_280[pos_108];
      pos_108--;
   }
   double Ld_140 = Ld_128 / Gi_284;
   double Ld_148 = NormalizeDouble(Ask + Gd_272, G_digits_192);
   double Ld_156 = NormalizeDouble(Bid - Gd_272, G_digits_192);
   double Ld_164 = NormalizeDouble(Ld_140 + Gd_272, G_digits_192 + 1);
   double Ld_172 = ihigh_68 - ilow_76;
   if (Ld_172 > Gd_256) {
      if (Bid < ima_84) Li_180 = 1;
      else
         if (Bid > ima_92) Li_180 = -1;
   }
   int count_184 = 0;
   for (pos_108 = 0; pos_108 < OrdersTotal(); pos_108++) {
      if (OrderSelect(pos_108, SELECT_BY_POS, MODE_TRADES)) {
         if (OrderMagicNumber() == MagicNumber) {
            cmd_188 = OrderType();
            if (cmd_188 == OP_BUYLIMIT || cmd_188 == OP_SELLLIMIT) continue;
            if (OrderSymbol() == Symbol()) {
               count_184++;
               switch (cmd_188) {
               case OP_BUY:
                  if (Distance < 0) break;
                  Ld_44 = NormalizeDouble(OrderStopLoss(), G_digits_192);
                  price_60 = NormalizeDouble(Bid - Gd_248, G_digits_192);
                  if (!((Ld_44 == 0.0 || price_60 > Ld_44))) break;
                  bool_32 = OrderModify(OrderTicket(), OrderOpenPrice(), price_60, OrderTakeProfit(), 0, Lime);
                  if (!(!bool_32)) break;
                  error_8 = GetLastError();
                  Ls_12 = ErrorDescription(error_8);
                  Print("BUY Modify Error Code: " + error_8 + " Message: " + Ls_12 + " OP: " + DoubleToStr(price_24, G_digits_192) + " SL: " + DoubleToStr(price_60, G_digits_192) +
                     " Bid: " + DoubleToStr(Bid, G_digits_192) + " Ask: " + DoubleToStr(Ask, G_digits_192));
                  break;
               case OP_SELL:
                  if (Distance < 0) break;
                  Ld_44 = NormalizeDouble(OrderStopLoss(), G_digits_192);
                  price_60 = NormalizeDouble(Ask + Gd_248, G_digits_192);
                  if (!((Ld_44 == 0.0 || price_60 < Ld_44))) break;
                  bool_32 = OrderModify(OrderTicket(), OrderOpenPrice(), price_60, OrderTakeProfit(), 0, Orange);
                  if (!(!bool_32)) break;
                  error_8 = GetLastError();
                  Ls_12 = ErrorDescription(error_8);
                  Print("SELL Modify Error Code: " + error_8 + " Message: " + Ls_12 + " OP: " + DoubleToStr(price_24, G_digits_192) + " SL: " + DoubleToStr(price_60, G_digits_192) +
                     " Bid: " + DoubleToStr(Bid, G_digits_192) + " Ask: " + DoubleToStr(Ask, G_digits_192));
                  break;
               case OP_BUYSTOP:
                  Ld_36 = NormalizeDouble(OrderOpenPrice(), G_digits_192);
                  price_24 = NormalizeDouble(Ask + Gd_240, G_digits_192);
                  if (!((price_24 < Ld_36))) break;
                  price_60 = NormalizeDouble(price_24 - StopLoss * Point, G_digits_192);
                  bool_32 = OrderModify(OrderTicket(), price_24, price_60, OrderTakeProfit(), 0, Lime);
                  if (!(!bool_32)) break;
                  error_8 = GetLastError();
                  Ls_12 = ErrorDescription(error_8);
                  Print("BUYSTOP Modify Error Code: " + error_8 + " Message: " + Ls_12 + " OP: " + DoubleToStr(price_24, G_digits_192) + " SL: " + DoubleToStr(price_60, G_digits_192) +
                     " Bid: " + DoubleToStr(Bid, G_digits_192) + " Ask: " + DoubleToStr(Ask, G_digits_192));
                  break;
               case OP_SELLSTOP:
                  Ld_36 = NormalizeDouble(OrderOpenPrice(), G_digits_192);
                  price_24 = NormalizeDouble(Bid - Gd_240, G_digits_192);
                  if (!((price_24 > Ld_36))) break;
                  price_60 = NormalizeDouble(price_24 + StopLoss * Point, G_digits_192);
                  bool_32 = OrderModify(OrderTicket(), price_24, price_60, OrderTakeProfit(), 0, Orange);
                  if (!(!bool_32)) break;
                  error_8 = GetLastError();
                  Ls_12 = ErrorDescription(error_8);
                  Print("SELLSTOP Modify Error Code: " + error_8 + " Message: " + Ls_12 + " OP: " + DoubleToStr(price_24, G_digits_192) + " SL: " + DoubleToStr(price_60, G_digits_192) +
                     " Bid: " + DoubleToStr(Bid, G_digits_192) + " Ask: " + DoubleToStr(Ask, G_digits_192));
               }
            }
         }
      }
   }
   if (count_184 == 0 && Li_180 != 0 && Ld_164 <= Gd_232 && f0_4()) {
      Ld_196 = AccountBalance() * AccountLeverage() * Gd_224;
      if (!UseMM) Ld_196 = FixedLots;
      Ld_204 = NormalizeDouble(Ld_196 / MarketInfo(Symbol(), MODE_LOTSIZE), Gi_204);
      Ld_204 = MathMax(Gd_208, Ld_204);
      Ld_204 = MathMin(Gd_216, Ld_204);
      if (Li_180 < 0) {
         price_24 = NormalizeDouble(Ask + Gd_240, G_digits_192);
         price_60 = NormalizeDouble(price_24 - StopLoss * Point, G_digits_192);
         ticket_20 = OrderSend(Symbol(), OP_BUYSTOP, Ld_204, price_24, G_slippage_264, price_60, 0, TradeComment, MagicNumber, 0, Lime);
         if (ticket_20 <= 0) {
            error_8 = GetLastError();
            Ls_12 = ErrorDescription(error_8);
            Print("BUYSTOP Send Error Code: " + error_8 + " Message: " + Ls_12 + " LT: " + DoubleToStr(Ld_204, Gi_204) + " OP: " + DoubleToStr(price_24, G_digits_192) + " SL: " +
               DoubleToStr(price_60, G_digits_192) + " Bid: " + DoubleToStr(Bid, G_digits_192) + " Ask: " + DoubleToStr(Ask, G_digits_192));
         }
      } else {
         price_24 = NormalizeDouble(Bid - Gd_240, G_digits_192);
         price_60 = NormalizeDouble(price_24 + StopLoss * Point, G_digits_192);
         ticket_20 = OrderSend(Symbol(), OP_SELLSTOP, Ld_204, price_24, G_slippage_264, price_60, 0, TradeComment, MagicNumber, 0, Orange);
         if (ticket_20 <= 0) {
            error_8 = GetLastError();
            Ls_12 = ErrorDescription(error_8);
            Print("BUYSELL Send Error Code: " + error_8 + " Message: " + Ls_12 + " LT: " + DoubleToStr(Ld_204, Gi_204) + " OP: " + DoubleToStr(price_24, G_digits_192) + " SL: " +
               DoubleToStr(price_60, G_digits_192) + " Bid: " + DoubleToStr(Bid, G_digits_192) + " Ask: " + DoubleToStr(Ask, G_digits_192));
         }
      }
   }
   string Ls_212 = "AvgSpread:" + DoubleToStr(Ld_140, G_digits_192) + "  Commission rate:" + DoubleToStr(Gd_272, G_digits_192 + 1) + "  Real avg. spread:" + DoubleToStr(Ld_164,
      G_digits_192 + 1);
   if (Ld_164 > Gd_232) {
      Ls_212 = Ls_212 
         + "\n" 
      + "The EA can not run with this spread ( " + DoubleToStr(Ld_164, G_digits_192 + 1) + " > " + DoubleToStr(Gd_232, G_digits_192 + 1) + " )";
   }
   if (count_184 != 0 || Li_180 != 0) {
   }
   if (!IsTesting()) {
      f0_2();
      f0_7();
      f0_0();
      f0_3();
      f0_8();
   }
   return (0);
}
			 	   	    	 			 						 				 			 		 	 	   				    	  	   		  	   		 		  	   	 				 		  		 			 	  	 		  		 		 	  				  	  		     		   					 	   
int f0_4() {
   if ((Hour() > StartHour && Hour() < EndHour) || (Hour() == StartHour && Minute() >= StartMinute) || (Hour() == EndHour && Minute() < EndMinute)) return (1);
   return (0);
}
	  				  			  		  	 	  	 	  	 		  	 		   				  												 							 		 			 	 	          	  		    		     	  		 				  	 	  		 			 		   			      	 	
void f0_8() {
   Gd_336 = WindowPriceMax();
   Gd_344 = WindowPriceMin();
   G_time_352 = Time[WindowFirstVisibleBar()];
   Gi_356 = WindowFirstVisibleBar() - WindowBarsPerChart();
   if (Gi_356 < 0) Gi_356 = 0;
   G_datetime_360 = Time[Gi_356] + 60 * Period();
   for (int Li_0 = 1; Li_0 <= Gi_392; Li_0++) {
      if (ObjectFind("Padding_rect" + Li_0) == -1) ObjectCreate("Padding_rect" + Li_0, OBJ_RECTANGLE, 0, G_time_352, Gd_336 - (Gd_336 - Gd_344) / Gi_392 * (Li_0 - 1), G_datetime_360, Gd_336 - (Gd_336 - Gd_344) / Gi_392 * Li_0);
      ObjectSet("Padding_rect" + Li_0, OBJPROP_TIME1, G_time_352);
      ObjectSet("Padding_rect" + Li_0, OBJPROP_TIME2, G_datetime_360 - 1);
      ObjectSet("Padding_rect" + Li_0, OBJPROP_PRICE1, Gd_336 - (Gd_336 - Gd_344) / Gi_392 * (Li_0 - 1));
      ObjectSet("Padding_rect" + Li_0, OBJPROP_PRICE2, Gd_336 - (Gd_336 - Gd_344) / Gi_392 * Li_0);
      ObjectSet("Padding_rect" + Li_0, OBJPROP_BACK, TRUE);
      ObjectSet("Padding_rect" + Li_0, OBJPROP_COLOR, f0_9(Gs_364, Gs_372, Gi_392, Li_0));
   }
   WindowRedraw();
}
	 	 	 	  	   			   			 	 							   		    	  		 			  	 				 		 				 		  				       		 	  	 	 		   	 	 	  	 	 											  	 		 	 				  		  		 		 	
int f0_9(string As_0, string As_8, int Ai_16, int Ai_20) {
   int str2int_24 = StrToInteger(StringSubstr(As_0, 0, 3));
   int str2int_28 = StrToInteger(StringSubstr(As_0, 4, 3));
   int str2int_32 = StrToInteger(StringSubstr(As_0, 8, 3));
   int str2int_36 = StrToInteger(StringSubstr(As_8, 0, 3));
   int str2int_40 = StrToInteger(StringSubstr(As_8, 4, 3));
   int str2int_44 = StrToInteger(StringSubstr(As_8, 8, 3));
   if (str2int_24 > str2int_36) Gi_380 = str2int_24 + (str2int_36 - str2int_24) / Ai_16 * Ai_20;
   if (str2int_24 < str2int_36) Gi_380 = str2int_24 - (str2int_24 - str2int_36) / Ai_16 * Ai_20;
   if (str2int_28 > str2int_40) Gi_384 = str2int_28 + (str2int_40 - str2int_28) / Ai_16 * Ai_20;
   if (str2int_28 < str2int_40) Gi_384 = str2int_28 - (str2int_28 - str2int_40) / Ai_16 * Ai_20;
   if (str2int_32 > str2int_44) Gi_388 = str2int_32 + (str2int_44 - str2int_32) / Ai_16 * Ai_20;
   if (str2int_32 < str2int_44) Gi_388 = str2int_32 - (str2int_32 - str2int_44) / Ai_16 * Ai_20;
   Gi_384 *= 256;
   Gi_388 <<= 16;
   return (Gi_380 + Gi_384 + Gi_388);
}
			 			       		 	 		  	  			 		 	 			      	  		   					  						  			 		 	  	   			    			 	      	    			 	 			 			 	    				 	 		 			 			  	 	
void f0_2() {
   double Lda_0[10];
   double Lda_4[10];
   double Lda_8[10];
   double Lda_12[10];
   int Li_16;
   int Li_20;
   int Li_24;
   int Li_32;
   if (Period() < G_timeframe_396) {
      ArrayCopySeries(Lda_0, 2, Symbol(), G_timeframe_396);
      ArrayCopySeries(Lda_4, 1, Symbol(), G_timeframe_396);
      ArrayCopySeries(Lda_8, 0, Symbol(), G_timeframe_396);
      ArrayCopySeries(Lda_12, 3, Symbol(), G_timeframe_396);
      Li_32 = 3;
      for (int Li_28 = 2; Li_28 >= 0; Li_28--) {
         Li_20 = Time[0] + Period() * (90 * Li_32);
         Li_24 = Time[0] + 90 * (Period() * (Li_32 + 1));
         if (ObjectFind("BD" + Li_28) == -1) {
            if (Lda_8[Li_28] > Lda_12[Li_28]) Li_16 = 170;
            else Li_16 = 43520;
            f0_6("D" + Li_28, Li_20, Li_24, Lda_8[Li_28], Lda_12[Li_28], Lda_4[Li_28], Lda_0[Li_28], Li_16);
         } else {
            if (Lda_8[Li_28] > Lda_12[Li_28]) Li_16 = 170;
            else Li_16 = 43520;
            f0_5("D" + Li_28, Li_20, Li_24, Lda_8[Li_28], Lda_12[Li_28], Lda_4[Li_28], Lda_0[Li_28], Li_16);
         }
         Li_32++;
         Li_32++;
      }
   }
}
			  	  	   	  			 	  			 		   			 	 		 	     		     	 	   	 	 	   	 			  	 			 					 	  		   	 	  		 	  		    	  		    	  	 	    				 						    
void f0_6(string As_0, int A_datetime_8, int A_datetime_12, double A_price_16, double A_price_24, double A_price_32, double A_price_40, color A_color_48) {
   if (A_price_16 == A_price_24) A_color_48 = Gray;
   ObjectCreate("B" + As_0, OBJ_RECTANGLE, 0, A_datetime_8, A_price_16, A_datetime_12, A_price_24);
   ObjectSet("B" + As_0, OBJPROP_STYLE, STYLE_SOLID);
   ObjectSet("B" + As_0, OBJPROP_COLOR, A_color_48);
   ObjectSet("B" + As_0, OBJPROP_BACK, TRUE);
   int datetime_52 = A_datetime_8 + (A_datetime_12 - A_datetime_8) / 2;
   ObjectCreate("S" + As_0, OBJ_TREND, 0, datetime_52, A_price_32, datetime_52, A_price_40);
   ObjectSet("S" + As_0, OBJPROP_COLOR, A_color_48);
   ObjectSet("S" + As_0, OBJPROP_BACK, TRUE);
   ObjectSet("S" + As_0, OBJPROP_RAY, FALSE);
   ObjectSet("S" + As_0, OBJPROP_WIDTH, 2);
}
		   	    	 	  	 			  		   	   	 			 		   	   			 	  	 		 		 	 		 		 				   			  	 		 	 		    	   			 	 		     		  	      		 	  	  			 	 	 		   	
void f0_5(string As_0, int A_datetime_8, int A_datetime_12, double Ad_16, double Ad_24, double Ad_32, double Ad_40, color A_color_48) {
   if (Ad_16 == Ad_24) A_color_48 = Gray;
   ObjectSet("B" + As_0, OBJPROP_TIME1, A_datetime_8);
   ObjectSet("B" + As_0, OBJPROP_PRICE1, Ad_16);
   ObjectSet("B" + As_0, OBJPROP_TIME2, A_datetime_12);
   ObjectSet("B" + As_0, OBJPROP_PRICE2, Ad_24);
   ObjectSet("B" + As_0, OBJPROP_BACK, TRUE);
   ObjectSet("B" + As_0, OBJPROP_COLOR, A_color_48);
   int datetime_52 = A_datetime_8 + (A_datetime_12 - A_datetime_8) / 2;
   ObjectSet("S" + As_0, OBJPROP_TIME1, datetime_52);
   ObjectSet("S" + As_0, OBJPROP_PRICE1, Ad_32);
   ObjectSet("S" + As_0, OBJPROP_TIME2, datetime_52);
   ObjectSet("S" + As_0, OBJPROP_PRICE2, Ad_40);
   ObjectSet("S" + As_0, OBJPROP_BACK, TRUE);
   ObjectSet("S" + As_0, OBJPROP_WIDTH, 2);
   ObjectSet("S" + As_0, OBJPROP_COLOR, A_color_48);
}
		 	 				 			 	 			     	     	 			  	 		 		      		 		   	  		   	  	     			 			  	  	 	 	   		 	 	  	 	 	  	       			 	  			    			 		  	 		 
void f0_7() {
   double Ld_0 = (Ask - Bid) / Gd_420;
   string text_8 = "Spread: " + DoubleToStr(Ld_0, 1) + " pips";
   if (ObjectFind(G_name_412) < 0) {
      ObjectCreate(G_name_412, OBJ_LABEL, 0, 0, 0);
      ObjectSet(G_name_412, OBJPROP_CORNER, 1);
      ObjectSet(G_name_412, OBJPROP_YDISTANCE, 260);
      ObjectSet(G_name_412, OBJPROP_XDISTANCE, 10);
      ObjectSetText(G_name_412, text_8, 13, "Arial", G_color_408);
   }
   ObjectSetText(G_name_412, text_8);
   WindowRedraw();
}
	 					  	 	  		    	  	 		 	 		    		   	 		  			 							  						  		 					 	    	     	 			    	      	 			 					 	 	  	  			 			  			  	   	 	
void f0_3() {
   int Li_8 = Time[0] + 60 * Period() - TimeCurrent();
   double Ld_0 = Li_8 / 60.0;
   int Li_12 = Li_8 % 60;
   Li_8 = (Li_8 - Li_8 % 60) / 60;
   Comment(Li_8 + " minutes " + Li_12 + " seconds left to bar end");
   ObjectDelete("time");
   if (ObjectFind("time") != 0) {
      ObjectCreate("time", OBJ_TEXT, 0, Time[0], Close[0] + 0.0005);
      ObjectSetText("time", "                                 <--" + Li_8 + ":" + Li_12, 13, "Verdana", Yellow);
      return;
   }
   ObjectMove("time", 0, Time[0], Close[0] + 0.0005);
}
	 			   		 	 	 		   							 		 		   	 	 		 					 	 		  	 	  	  	 	  	 		 			  	 	 	  		   					 		   		   				 	 		 		  		  	    		    		 	  	   
void f0_0() {
   int Li_0 = iBarShift(NULL, PERIOD_D1, Time[0]) + 1;
   G_ihigh_444 = iHigh(NULL, PERIOD_D1, Li_0);
   G_ilow_452 = iLow(NULL, PERIOD_D1, Li_0);
   G_datetime_468 = iTime(NULL, PERIOD_D1, Li_0);
   if (TimeDayOfWeek(G_datetime_468) == 0) {
      G_ihigh_444 = MathMax(G_ihigh_444, iHigh(NULL, PERIOD_D1, Li_0 + 1));
      G_ilow_452 = MathMin(G_ilow_452, iLow(NULL, PERIOD_D1, Li_0 + 1));
   }
   Gd_460 = G_ihigh_444 - G_ilow_452;
   f0_1();
}
	 	 			  	    		   		  	 				 		   			   	  	  			  						 							 			 				  	    		    	 	 	    	 	    	 	 	 							 	  	 				 				 			  		  	 	
int f0_1() {
   if (ObjectFind("FiboUp") == -1) ObjectCreate("FiboUp", OBJ_FIBO, 0, G_datetime_468, G_ihigh_444 + Gd_460, G_datetime_468, G_ihigh_444);
   else {
      ObjectSet("FiboUp", OBJPROP_TIME2, G_datetime_468);
      ObjectSet("FiboUp", OBJPROP_TIME1, G_datetime_468);
      ObjectSet("FiboUp", OBJPROP_PRICE1, G_ihigh_444 + Gd_460);
      ObjectSet("FiboUp", OBJPROP_PRICE2, G_ihigh_444);
   }
   ObjectSet("FiboUp", OBJPROP_LEVELCOLOR, G_color_428);
   ObjectSet("FiboUp", OBJPROP_FIBOLEVELS, 13);
   ObjectSet("FiboUp", OBJPROP_FIRSTLEVEL, 0.0);
   ObjectSetFiboDescription("FiboUp", 0, "(100.0%) -  %$");
   ObjectSet("FiboUp", 211, 0.236);
   ObjectSetFiboDescription("FiboUp", 1, "(123.6%) -  %$");
   ObjectSet("FiboUp", 212, 0.382);
   ObjectSetFiboDescription("FiboUp", 2, "(138.2%) -  %$");
   ObjectSet("FiboUp", 213, 0.5);
   ObjectSetFiboDescription("FiboUp", 3, "(150.0%) -  %$");
   ObjectSet("FiboUp", 214, 0.618);
   ObjectSetFiboDescription("FiboUp", 4, "(161.8%) -  %$");
   ObjectSet("FiboUp", 215, 0.764);
   ObjectSetFiboDescription("FiboUp", 5, "(176.4%) -  %$");
   ObjectSet("FiboUp", 216, 1.0);
   ObjectSetFiboDescription("FiboUp", 6, "(200.0%) -  %$");
   ObjectSet("FiboUp", 217, 1.236);
   ObjectSetFiboDescription("FiboUp", 7, "(223.6%) -  %$");
   ObjectSet("FiboUp", 218, 1.5);
   ObjectSetFiboDescription("FiboUp", 8, "(250.0%) -  %$");
   ObjectSet("FiboUp", 219, 1.618);
   ObjectSetFiboDescription("FiboUp", 9, "(261.8%) -  %$");
   ObjectSet("FiboUp", 220, 2.0);
   ObjectSetFiboDescription("FiboUp", 10, "(300.0%) -  %$");
   ObjectSet("FiboUp", 221, 2.5);
   ObjectSetFiboDescription("FiboUp", 11, "(350.0%) -  %$");
   ObjectSet("FiboUp", 222, 3.0);
   ObjectSetFiboDescription("FiboUp", 12, "(400.0%) -  %$");
   ObjectSet("FiboUp", 223, 3.5);
   ObjectSetFiboDescription("FiboUp", 13, "(450.0%) -  %$");
   ObjectSet("FiboUp", 224, 4.0);
   ObjectSetFiboDescription("FiboUp", 14, "(500.0%) -  %$");
   ObjectSet("FiboUp", OBJPROP_RAY, TRUE);
   ObjectSet("FiboUp", OBJPROP_BACK, TRUE);
   if (ObjectFind("FiboDn") == -1) ObjectCreate("FiboDn", OBJ_FIBO, 0, G_datetime_468, G_ilow_452 - Gd_460, G_datetime_468, G_ilow_452);
   else {
      ObjectSet("FiboDn", OBJPROP_TIME2, G_datetime_468);
      ObjectSet("FiboDn", OBJPROP_TIME1, G_datetime_468);
      ObjectSet("FiboDn", OBJPROP_PRICE1, G_ilow_452 - Gd_460);
      ObjectSet("FiboDn", OBJPROP_PRICE2, G_ilow_452);
   }
   ObjectSet("FiboDn", OBJPROP_LEVELCOLOR, G_color_436);
   ObjectSet("FiboDn", OBJPROP_FIBOLEVELS, 19);
   ObjectSet("FiboDn", OBJPROP_FIRSTLEVEL, 0.0);
   ObjectSetFiboDescription("FiboDn", 0, "(0.0%) -  %$");
   ObjectSet("FiboDn", 211, 0.236);
   ObjectSetFiboDescription("FiboDn", 1, "(-23.6%) -  %$");
   ObjectSet("FiboDn", 212, 0.382);
   ObjectSetFiboDescription("FiboDn", 2, "(-38.2%) -  %$");
   ObjectSet("FiboDn", 213, 0.5);
   ObjectSetFiboDescription("FiboDn", 3, "(-50.0%) -  %$");
   ObjectSet("FiboDn", 214, 0.618);
   ObjectSetFiboDescription("FiboDn", 4, "(-61.8%) -  %$");
   ObjectSet("FiboDn", 215, 0.764);
   ObjectSetFiboDescription("FiboDn", 5, "(-76.4%) -  %$");
   ObjectSet("FiboDn", 216, 1.0);
   ObjectSetFiboDescription("FiboDn", 6, "(-100.0%) -  %$");
   ObjectSet("FiboDn", 217, 1.236);
   ObjectSetFiboDescription("FiboDn", 7, "(-123.6%) -  %$");
   ObjectSet("FiboDn", 218, 1.382);
   ObjectSetFiboDescription("FiboDn", 8, "(-138.2%) -  %$");
   ObjectSet("FiboDn", 219, 1.5);
   ObjectSetFiboDescription("FiboDn", 9, "(-150.0%) -  %$");
   ObjectSet("FiboDn", 220, 1.618);
   ObjectSetFiboDescription("FiboDn", 10, "(-161.8%) -  %$");
   ObjectSet("FiboDn", 221, 1.764);
   ObjectSetFiboDescription("FiboDn", 11, "(-176.4%) -  %$");
   ObjectSet("FiboDn", 222, 2.0);
   ObjectSetFiboDescription("FiboDn", 12, "(-200.0%) -  %$");
   ObjectSet("FiboDn", 223, 2.5);
   ObjectSetFiboDescription("FiboDn", 13, "(-250.0%) -  %$");
   ObjectSet("FiboDn", 224, 3.0);
   ObjectSetFiboDescription("FiboDn", 14, "(-300.0%) -  %$");
   ObjectSet("FiboDn", 225, 3.5);
   ObjectSetFiboDescription("FiboDn", 15, "(-350.0%) -  %$");
   ObjectSet("FiboDn", 226, 4.0);
   ObjectSetFiboDescription("FiboDn", 16, "(-400.0%) -  %$");
   ObjectSet("FiboDn", 227, 4.5);
   ObjectSetFiboDescription("FiboDn", 17, "(-450.0%) -  %$");
   ObjectSet("FiboDn", 228, 5.0);
   ObjectSetFiboDescription("FiboDn", 18, "(-500.0%) -  %$");
   ObjectSet("FiboDn", OBJPROP_RAY, TRUE);
   ObjectSet("FiboDn", OBJPROP_BACK, TRUE);
   if (Gi_440) {
      if (ObjectFind("FiboIn") == -1) ObjectCreate("FiboIn", OBJ_FIBO, 0, G_datetime_468, G_ihigh_444, G_datetime_468 + 86400, G_ilow_452);
      else {
         ObjectSet("FiboIn", OBJPROP_TIME2, G_datetime_468);
         ObjectSet("FiboIn", OBJPROP_TIME1, G_datetime_468 + 86400);
         ObjectSet("FiboIn", OBJPROP_PRICE1, G_ihigh_444);
         ObjectSet("FiboIn", OBJPROP_PRICE2, G_ilow_452);
      }
      ObjectSet("FiboIn", OBJPROP_LEVELCOLOR, G_color_432);
      ObjectSet("FiboIn", OBJPROP_FIBOLEVELS, 7);
      ObjectSet("FiboIn", OBJPROP_FIRSTLEVEL, 0.0);
      ObjectSetFiboDescription("FiboIn", 0, "Daily LOW (0.0) -  %$");
      ObjectSet("FiboIn", 211, 0.236);
      ObjectSetFiboDescription("FiboIn", 1, "(23.6) -  %$");
      ObjectSet("FiboIn", 212, 0.382);
      ObjectSetFiboDescription("FiboIn", 2, "(38.2) -  %$");
      ObjectSet("FiboIn", 213, 0.5);
      ObjectSetFiboDescription("FiboIn", 3, "(50.0) -  %$");
      ObjectSet("FiboIn", 214, 0.618);
      ObjectSetFiboDescription("FiboIn", 4, "(61.8) -  %$");
      ObjectSet("FiboIn", 215, 0.764);
      ObjectSetFiboDescription("FiboIn", 5, "(76.4) -  %$");
      ObjectSet("FiboIn", 216, 1.0);
      ObjectSetFiboDescription("FiboIn", 6, "Daily HIGH (100.0) -  %$");
      ObjectSet("FiboIn", OBJPROP_RAY, TRUE);
      ObjectSet("FiboIn", OBJPROP_BACK, TRUE);
   } else ObjectDelete("FiboIn");
   return (0);
}