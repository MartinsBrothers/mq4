
#property copyright "http://www.DuanFX.com"
#property link "http://www.duanfx.com"
#property version "2.0"
#property description "©2017, AutoBots® System™" 
#include <stdlib.mqh>

extern int Distance = 100;
extern int Step = 10;
extern bool New_BAR = TRUE;
extern double StartLot = 0.1;
extern int TipMartina = 1;
extern double MoneyClose = 30.0;
extern int ShagP = 2;
extern int Magic = 227;
extern int Plus = 70;
extern int Slip = 30;
extern int coment = 10;
extern double EXP = 1.44329;
int g_pos_144;
int gi_148 = -1;
double gd_152 = 0.0;
datetime g_time_160;

// E37F0136AA3FFAF149B351F6A4C948E9
int init() {
   if (IsTesting() || IsDemo()) f0_2("IsDemo");
   if ((!IsTesting()) && !IsDemo() && (!IsOptimization())) f0_2("IsReal");
   return (0);
}

// EA2B2676C28C0DB26D39331A336C6B92
int start() {
   color color_20;
   int count_32;
   int count_36;
   int count_40;
   double ld_44;
   double ld_52;
   double ld_60;
   double ld_68;
   double ld_76;
   double ld_84;
   double ld_92;
   double ld_100;
   double ld_108;
   double ld_116;
   double ld_124;
   double ld_132;
   double ld_140;
   double ld_148;
   double ld_156;
   double ld_164;
   double ld_172;
   double ld_180;
   double ld_188;
   double ld_196;
   int ticket_204;
   int ticket_208;
   int ticket_212;
   int ticket_216;
   int li_252;
   int li_256;
   double ld_0 = 0;
   int pos_8 = 0;
   for (pos_8 = 0; pos_8 < OrdersTotal(); pos_8++) {
      if (OrderSelect(pos_8, SELECT_BY_POS) == TRUE) {
         if (OrderSymbol() == Symbol())
            if (OrderMagicNumber() == Magic) ld_0 += OrderProfit() + OrderSwap() + OrderCommission();
      }
   }
   string str_concat_12 = "";
   for (pos_8 = 0; pos_8 < 4; pos_8++) {
      if (pos_8 == 0) {
         str_concat_12 = WindowExpertName();
         color_20 = Yellow;
      }
      if (pos_8 == 1) str_concat_12 = StringConcatenate("Time  ", "h ", TimeHour(TimeCurrent()), " : m ", TimeMinute(TimeCurrent()), " : s ", TimeSeconds(TimeCurrent()));
      if (pos_8 == 2) str_concat_12 = StringConcatenate("Balance = ", AccountBalance());
      if (pos_8 == 3) str_concat_12 = StringConcatenate("Profit = ", ld_0);
      ObjectCreate("n" + pos_8, OBJ_LABEL, 0, 0, 0, 0);
      ObjectSet("n" + pos_8, OBJPROP_CORNER, 0);
      ObjectSet("n" + pos_8, OBJPROP_XDISTANCE, 10);
      ObjectSet("n" + pos_8, OBJPROP_YDISTANCE, 17 * pos_8 + 15);
      ObjectSetText("n" + pos_8, str_concat_12, 22, "Times New Roman", color_20);
   }
   int y_24 = IsTesting() || IsDemo() || IsOptimization();
   int y_28 = (!IsTesting()) && !IsDemo() && (!IsOptimization());
   if (y_28 == 1 || y_24 == 1) {
      count_32 = 0;
      count_36 = 0;
      count_40 = 0;
      ld_44 = 0;
      ld_52 = 999999;
      ld_60 = 0;
      ld_68 = 999999;
      ld_76 = 0;
      ld_84 = 0;
      ld_92 = 0;
      ld_100 = 0;
      ld_108 = 0;
      ld_116 = 0;
      ld_124 = 0;
      ld_132 = 0;
      ld_140 = 0;
      ld_148 = 0;
      ld_156 = 0;
      ld_164 = 0;
      ld_172 = 0;
      ld_180 = 0;
      ld_188 = 0;
      ld_196 = 0;
      ticket_204 = -1;
      ticket_208 = -1;
      ticket_212 = -1;
      ticket_216 = -1;
      for (pos_8 = 0; pos_8 < OrdersTotal(); pos_8++) {
         if (OrderSelect(pos_8, SELECT_BY_POS) == TRUE && OrderSymbol() == Symbol() && OrderMagicNumber() == Magic) {
            count_32++;
            ld_156 += OrderLots();
            ld_196 += OrderProfit();
            if (OrderType() == OP_BUY) {
               count_36++;
               ld_140 += OrderProfit();
               if (OrderOpenPrice() > ld_44) {
                  ld_44 = NormalizeDouble(OrderOpenPrice(), Digits);
                  ld_108 = NormalizeDouble(OrderLots(), 2);
                  ticket_204 = OrderTicket();
               }
               if (OrderOpenPrice() < ld_52) {
                  ld_52 = NormalizeDouble(OrderOpenPrice(), Digits);
                  ld_116 = NormalizeDouble(OrderLots(), 2);
                  ticket_208 = OrderTicket();
               }
               ld_76 += NormalizeDouble(OrderOpenPrice(), Digits) * NormalizeDouble(OrderLots(), 2);
               ld_92 += NormalizeDouble(OrderLots(), 2);
            }
            if (OrderType() == OP_SELL) {
               count_40++;
               ld_148 += OrderProfit();
               if (OrderOpenPrice() > ld_60) {
                  ld_60 = NormalizeDouble(OrderOpenPrice(), Digits);
                  ld_124 = NormalizeDouble(OrderLots(), 2);
                  ticket_212 = OrderTicket();
               }
               if (OrderOpenPrice() < ld_68) {
                  ld_68 = NormalizeDouble(OrderOpenPrice(), Digits);
                  ld_132 = NormalizeDouble(OrderLots(), 2);
                  ticket_216 = OrderTicket();
               }
               ld_84 += NormalizeDouble(OrderOpenPrice(), Digits) * NormalizeDouble(OrderLots(), 2);
               ld_100 += NormalizeDouble(OrderLots(), 2);
            }
         }
      }
   }
   double ld_220 = NormalizeDouble(Plus * Point, Digits);
   if (count_36 >= 2 && Ask < ld_52) {
      ld_164 = NormalizeDouble((ld_44 * ld_108 + ld_52 * ld_116) / (ld_108 + ld_116) + ld_220, Digits);
      f0_0(OP_BUY, ticket_204, ticket_208, 0, ld_164);
   }
   if (count_40 >= 2 && Bid > ld_60) {
      ld_172 = NormalizeDouble((ld_60 * ld_124 + ld_68 * ld_132) / (ld_124 + ld_132) - ld_220, Digits);
      f0_0(OP_SELL, ticket_212, ticket_216, 0, ld_172);
   }
   if (count_36 >= 2 && Ask > ld_44) {
      ld_180 = NormalizeDouble(ld_76 / ld_92 + ld_220, Digits);
      f0_0(OP_BUY, -1, -1, ld_180, 0);
   }
   if (count_40 >= 2 && Bid < ld_68) {
      ld_188 = NormalizeDouble(ld_84 / ld_100 - ld_220, Digits);
      f0_0(OP_SELL, -1, -1, ld_188, 0);
   }
   double lots_228 = StartLot;
   double lots_236 = StartLot;
   if (TipMartina == 0) {
      lots_228 = StartLot;
      lots_236 = StartLot;
   }
   if (TipMartina == 1) {
      if (count_36 == 0) lots_228 = StartLot;
      else lots_228 = ld_116 * count_36;
      if (count_40 == 0) lots_236 = StartLot;
      else lots_236 = ld_124 * count_40;
   }
   if (TipMartina == 2) {
      if (count_36 == 0) lots_228 = StartLot;
      else lots_228 = EXP * ld_116;
      if (count_40 == 0) lots_236 = StartLot;
      else lots_236 = EXP * ld_124;
   }
   if (TipMartina == 3) {
      lots_228 = ld_116 + StartLot;
      lots_236 = ld_124 + StartLot;
   }
   double ld_244 = NormalizeDouble((Distance + Step * count_32) * Point, Digits);
   if (f0_1() == 1) gi_148 = 1;
   if (gi_148 == 1) {
      if (Bid < ld_52 - ld_244 || Ask > ld_44 + ld_244 / ShagP && Close[1] < Open[1]) {
         if (OrderSend(Symbol(), OP_BUY, lots_228, Ask, Slip, 0, 0, 0, Magic, 0, Blue) > 0) {
            gi_148 = -1;
            f0_2("OrderOpen Ok!");
         } else f0_2(f0_4(GetLastError()));
      }
      if (Ask > ld_60 + ld_244 || Bid < ld_68 - ld_244 / ShagP && Close[1] > Open[1]) {
         if (OrderSend(Symbol(), OP_SELL, lots_236, Bid, Slip, 0, 0, 0, Magic, 0, Blue) > 0) {
            gi_148 = -1;
            f0_2("OrderOpen Ok!");
         } else f0_2(f0_4(GetLastError()));
      }
   }
   if (ld_156 > gd_152) gd_152 = ld_156;
   Comment(gd_152);
   bool li_260 = FALSE;
   if (ld_196 > MoneyClose) li_260 = TRUE;
   if (li_260 == TRUE) f0_3();
   return (0);
}

// 0A744893951E0D1706FF74A7AFCCF561
void f0_0(int a_cmd_0, int ai_4, int ai_8, double ad_12, double ad_20) {
   double price_32;
   double price_40;
   if (ai_4 == -1 && ai_8 == -1) ad_20 = 0;
   else ad_12 = 0;
   for (int pos_28 = OrdersTotal() - 1; pos_28 >= 0; pos_28--) {
      if (OrderSelect(pos_28, SELECT_BY_POS)) {
         if (OrderSymbol() == Symbol() && OrderMagicNumber() == Magic) {
            if (ai_4 == OrderTicket() || ai_8 == OrderTicket() || ai_4 == -1 || ai_8 == -1) {
               price_32 = NormalizeDouble(OrderStopLoss(), Digits);
               price_40 = NormalizeDouble(OrderTakeProfit(), Digits);
               if (price_40 != NormalizeDouble(ad_20, Digits)) {
                  if (OrderType() == a_cmd_0) {
                     if (OrderModify(OrderTicket(), OrderOpenPrice(), price_32, NormalizeDouble(ad_20, Digits), 0, Gold) == TRUE) f0_2("Mod Ok!");
                     else f0_2(f0_4(GetLastError()));
                  }
               }
               if (price_32 != NormalizeDouble(ad_12, Digits)) {
                  if (OrderType() == a_cmd_0) {
                     if (OrderModify(OrderTicket(), OrderOpenPrice(), NormalizeDouble(ad_12, Digits), price_40, 0, Gold) == TRUE) {
                        f0_2("Mod Ok!");
                        continue;
                     }
                     f0_2(f0_4(GetLastError()));
                  }
               }
            }
         }
      }
   }
}

// 64E1E1CBE1CA8E88EF3A838A3E7B57D6
void f0_2(string as_0) {
   string lsa_8[];
   string text_36;
   ArrayResize(lsa_8, coment);
   string dbl2str_12 = DoubleToStr(Hour(), 0);
   if (StringLen(dbl2str_12) < 2) dbl2str_12 = "0" + dbl2str_12;
   string dbl2str_20 = DoubleToStr(Minute(), 0);
   if (StringLen(dbl2str_20) < 2) dbl2str_20 = "0" + dbl2str_20;
   string dbl2str_28 = DoubleToStr(Seconds(), 0);
   if (StringLen(dbl2str_28) < 2) dbl2str_28 = "0" + dbl2str_28;
   as_0 = dbl2str_12 + ":" + dbl2str_20 + ":" + dbl2str_28 + " - " + as_0;
   for (int li_44 = coment - 1; li_44 >= 1; li_44--) lsa_8[li_44] = lsa_8[li_44 - 1];
   lsa_8[0] = as_0;
   for (li_44 = coment - 1; li_44 >= 0; li_44--) {
      if (lsa_8[li_44] != "") {
         text_36 = lsa_8[li_44];
         ObjectCreate("txtw" + li_44, OBJ_LABEL, 0, 0, 0);
         ObjectSet("txtw" + li_44, OBJPROP_CORNER, 2);
         ObjectSet("txtw" + li_44, OBJPROP_XDISTANCE, 10);
         ObjectSet("txtw" + li_44, OBJPROP_YDISTANCE, 15 * li_44 + 10);
         ObjectSetText("txtw" + li_44, text_36, 10, "Times New Roman", Green);
      }
   }
}

// 766B4914A2CF28A7523E9CA66B126DDB
void f0_3() {
   for (g_pos_144 = OrdersTotal() - 1; g_pos_144 >= 0; g_pos_144--) {
      if (OrderSelect(g_pos_144, SELECT_BY_POS)) {
         if (OrderSymbol() == Symbol() && OrderMagicNumber() == Magic) {
            if (OrderType() == OP_BUY) {
               if (OrderClose(OrderTicket(), OrderLots(), Bid, Slip, Red) == 1) f0_2("OrderClose Ok!");
               else f0_2(f0_4(GetLastError()));
            }
            if (OrderType() == OP_SELL) {
               if (OrderClose(OrderTicket(), OrderLots(), Ask, Slip, Red) == 1) {
                  f0_2("OrderClose Ok!");
                  continue;
               }
               f0_2(f0_4(GetLastError()));
            }
         }
      }
   }
}

// 3DAC72783F355EB5F7204A16E28581AA
int f0_1() {
   if (New_BAR == TRUE) {
      if (Time[0] != g_time_160) {
         g_time_160 = Time[0];
         return (1);
      }
   }
   if (New_BAR == FALSE) return (1);
   return (0);
}

// 902B0D55FDDEF6F8D651FE1035B7D4BD
string f0_4(int ai_0) {
   string ls_ret_4;
   switch (ai_0) {
   case 0:
      ls_ret_4 = "No error returned.";
      break;
   case 1:
      ls_ret_4 = "No error returned, but the result is unknown.";
      break;
   case 2:
      ls_ret_4 = "Common error.";
      break;
   case 3:
      ls_ret_4 = "Invalid trade parameters.";
      break;
   case 4:
      ls_ret_4 = "Trade server is busy.";
      break;
   case 5:
      ls_ret_4 = "Old version of the client terminal.";
      break;
   case 6:
      ls_ret_4 = "No connection with trade server.";
      break;
   case 7:
      ls_ret_4 = "Not enough rights.";
      break;
   case 8:
      ls_ret_4 = "Too frequent requests.";
      break;
   case 9:
      ls_ret_4 = "Malfunctional trade operation.";
      break;
   case 64:
      ls_ret_4 = "Account disabled.";
      break;
   case 65:
      ls_ret_4 = "Invalid account.";
      break;
   case 128:
      ls_ret_4 = "Trade timeout.";
      break;
   case 129:
      ls_ret_4 = "Invalid price.";
      break;
   case 130:
      ls_ret_4 = "Invalid stops.";
      break;
   case 131:
      ls_ret_4 = "Invalid trade volume.";
      break;
   case 132:
      ls_ret_4 = "Market is closed.";
      break;
   case 133:
      ls_ret_4 = "Trade is disabled.";
      break;
   case 134:
      ls_ret_4 = "Not enough money.";
      break;
   case 135:
      ls_ret_4 = "Price changed.";
      break;
   case 136:
      ls_ret_4 = "Off quotes.";
      break;
   case 137:
      ls_ret_4 = "Broker is busy.";
      break;
   case 138:
      ls_ret_4 = "Requote.";
      break;
   case 139:
      ls_ret_4 = "Order is locked.";
      break;
   case 140:
      ls_ret_4 = "Long positions only allowed.";
      break;
   case 141:
      ls_ret_4 = "Too many requests.";
      break;
   case 145:
      ls_ret_4 = "Modification denied because an order is too close to market.";
      break;
   case 146:
      ls_ret_4 = "Trade context is busy.";
      break;
   case 147:
      ls_ret_4 = "Expirations are denied by broker.";
      break;
   case 148:
      ls_ret_4 = "The amount of opened and pending orders has reached the limit set by a broker.";
      break;
   case 4000:
      ls_ret_4 = "No error.";
      break;
   case 4001:
      ls_ret_4 = "Wrong function pointer.";
      break;
   case 4002:
      ls_ret_4 = "Array index is out of range.";
      break;
   case 4003:
      ls_ret_4 = "No memory for function call stack.";
      break;
   case 4004:
      ls_ret_4 = "Recursive stack overflow.";
      break;
   case 4005:
      ls_ret_4 = "Not enough stack for parameter.";
      break;
   case 4006:
      ls_ret_4 = "No memory for parameter string.";
      break;
   case 4007:
      ls_ret_4 = "No memory for temp string.";
      break;
   case 4008:
      ls_ret_4 = "Not initialized string.";
      break;
   case 4009:
      ls_ret_4 = "Not initialized string in an array.";
      break;
   case 4010:
      ls_ret_4 = "No memory for an array string.";
      break;
   case 4011:
      ls_ret_4 = "Too long string.";
      break;
   case 4012:
      ls_ret_4 = "Remainder from zero divide.";
      break;
   case 4013:
      ls_ret_4 = "Zero divide.";
      break;
   case 4014:
      ls_ret_4 = "Unknown command.";
      break;
   case 4015:
      ls_ret_4 = "Wrong jump.";
      break;
   case 4016:
      ls_ret_4 = "Not initialized array.";
      break;
   case 4017:
      ls_ret_4 = "DLL calls are not allowed.";
      break;
   case 4018:
      ls_ret_4 = "Cannot load library.";
      break;
   case 4019:
      ls_ret_4 = "Cannot call function.";
      break;
   case 4020:
      ls_ret_4 = "EA function calls are not allowed.";
      break;
   case 4021:
      ls_ret_4 = "Not enough memory for a string returned from a function.";
      break;
   case 4022:
      ls_ret_4 = "System is busy.";
      break;
   case 4050:
      ls_ret_4 = "Invalid function parameters count.";
      break;
   case 4051:
      ls_ret_4 = "Invalid function parameter value.";
      break;
   case 4052:
      ls_ret_4 = "String function internal error.";
      break;
   case 4053:
      ls_ret_4 = "Some array error.";
      break;
   case 4054:
      ls_ret_4 = "Incorrect series array using.";
      break;
   case 4055:
      ls_ret_4 = "Custom indicator error.";
      break;
   case 4056:
      ls_ret_4 = "Arrays are incompatible.";
      break;
   case 4057:
      ls_ret_4 = "Global variables processing error.";
      break;
   case 4058:
      ls_ret_4 = "Global variable not found.";
      break;
   case 4059:
      ls_ret_4 = "Function is not allowed in testing mode.";
      break;
   case 4060:
      ls_ret_4 = "Function is not confirmed.";
      break;
   case 4061:
      ls_ret_4 = "Mail sending error.";
      break;
   case 4062:
      ls_ret_4 = "String parameter expected.";
      break;
   case 4063:
      ls_ret_4 = "Integer parameter expected.";
      break;
   case 4064:
      ls_ret_4 = "Double parameter expected.";
      break;
   case 4065:
      ls_ret_4 = "Array as parameter expected.";
      break;
   case 4066:
      ls_ret_4 = "Requested history data in updating state.";
      break;
   case 4067:
      ls_ret_4 = "Some error in trade operation execution.";
      break;
   case 4099:
      ls_ret_4 = "End of a file.";
      break;
   case 4100:
      ls_ret_4 = "Some file error.";
      break;
   case 4101:
      ls_ret_4 = "Wrong file name.";
      break;
   case 4102:
      ls_ret_4 = "Too many opened files.";
      break;
   case 4103:
      ls_ret_4 = "Cannot open file.";
      break;
   case 4104:
      ls_ret_4 = "Incompatible access to a file.";
      break;
   case 4105:
      ls_ret_4 = "No order selected.";
      break;
   case 4106:
      ls_ret_4 = "Unknown symbol.";
      break;
   case 4107:
      ls_ret_4 = "Invalid price.";
      break;
   case 4108:
      ls_ret_4 = "Invalid ticket.";
      break;
   case 4109:
      ls_ret_4 = "Trade is not allowed.";
      break;
   case 4110:
      ls_ret_4 = "Longs are not allowed.";
      break;
   case 4111:
      ls_ret_4 = "Shorts are not allowed.";
      break;
   case 4200:
      ls_ret_4 = "Object already exists.";
      break;
   case 4201:
      ls_ret_4 = "Unknown object property.";
      break;
   case 4202:
      ls_ret_4 = "Object does not exist.";
      break;
   case 4203:
      ls_ret_4 = "Unknown object type.";
      break;
   case 4204:
      ls_ret_4 = "No object name.";
      break;
   case 4205:
      ls_ret_4 = "Object coordinates error.";
      break;
   case 4206:
      ls_ret_4 = "No specified subwindow.";
      break;
   default:
      ls_ret_4 = "Some error in object operation.";
   }
   return (ls_ret_4);
}