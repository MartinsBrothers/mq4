/*
   Generated by EX4-TO-MQ4 decompiler V4.0.224.1 []
   Website: http://purebeam.biz
   E-mail : purebeam@gmail.com
*/
#property copyright "Meet Joe Black, Maidin, Zainudin"
#property link      "zdntaib@yahoo.com"

extern string Basic_Setting = "----------------- Basic Setting -----------------";
extern double Lot = 0.1;
extern int LayerDistance = 100;
extern bool UseTakeProfitByPip = TRUE;
extern int TakeProfit = 80;
extern bool UseTakeProfitByUSD = FALSE;
extern double TakeProfitInUSD = 100.0;
extern int MaximumLayer = 5;
extern string Pair_Setting = "----------------- Pairs Setting -----------------";
extern string Pair1 = "GBPUSD";
extern string Pair2 = "EURUSD";
extern string Note1 = "Couple 1: Buy Pair1 Sell Pair2";
extern string Note2 = "Couple 2: Sell Pair1 Buy Pair2";
extern bool TradeCouple1 = TRUE;
extern bool TradeCouple2 = FALSE;
extern string ADR_Setting = "------------------ ADR Setting ------------------";
extern int ADR_Day = 365;
extern bool UseManual_ADR_Ratio = TRUE;
extern double ADR_Ratio = 0.8;
extern int MagicNo = 90000;
int gi_196;

int init() {
   return (0);
}

int deinit() {
   Comment("");
   return (0);
}

int start() {
   int li_0;
   int li_4;
   int li_8;
   int li_12;
   int li_16;
   int li_20;
   int li_24;
   int li_28;
   int li_32;
   double ld_60;
   double ld_68;
   double ld_92;
   double ld_100;
   int li_116;
   int li_120;
   string ls_140;
   string ls_148;
   string ls_124 = "Couple 1";
   string ls_132 = "Couple 2";
   gi_196 = MagicNo + 987;
   for (int li_156 = 1; li_156 <= ADR_Day; li_156++) {
      ld_60 = (iHigh(Pair1, PERIOD_D1, li_156) - iLow(Pair1, PERIOD_D1, li_156)) / MarketInfo(Pair1, MODE_POINT);
      ld_92 = (iHigh(Pair2, PERIOD_D1, li_156) - iLow(Pair2, PERIOD_D1, li_156)) / MarketInfo(Pair2, MODE_POINT);
      ld_68 += ld_60;
      ld_100 += ld_92;
   }
   double ld_76 = ld_68 / ADR_Day;
   double ld_108 = ld_100 / ADR_Day;
   double ld_52 = ld_108 / ld_76;
   if (UseManual_ADR_Ratio == FALSE) ADR_Ratio = ld_52;
   double ld_36 = NormalizeDouble(Lot * ADR_Ratio, 2);
   double ld_44 = NormalizeDouble(Lot, 2);
   if (TradeCouple1 == TRUE) {
      if (GetTotalOpenBuy(Pair1, MagicNo) <= 0) li_0 = PostBuy(ls_124, Pair1, ld_36, 1, MagicNo);
      if (li_0 < 0) {
         Sleep(3000);
         li_0 = PostBuy(ls_124, Pair1, ld_36, 1, MagicNo);
      }
      if (GetTotalOpenBuy(Pair1, MagicNo) == 1 && GetTotalOpenSell(Pair2, MagicNo) <= 0) li_4 = PostSell(ls_124, Pair2, ld_44, 1, MagicNo);
      if (li_4 < 0) {
         Sleep(3000);
         li_4 = PostSell(ls_124, Pair2, ld_44, 1, MagicNo);
      }
      if (GetFloatingPip(1) <= (-LayerDistance) && GetTotalOpenBuy(Pair1, MagicNo) < MaximumLayer) {
         li_0 = GetLastTicketBuy(Pair1, MagicNo);
         li_8 = GetLastLayerBuy(Pair1, li_0, MagicNo);
         if (GetTotalOpenBuy(Pair1, MagicNo) <= li_8) li_0 = PostBuy(ls_124, Pair1, ld_36, li_8 + 1, MagicNo);
         if (li_0 < 0) {
            Sleep(3000);
            li_0 = PostBuy(ls_124, Pair1, ld_36, li_8 + 1, MagicNo);
         }
         if (li_0 < 0) {
            Sleep(3000);
            li_0 = PostBuy(ls_124, Pair1, ld_36, li_8 + 1, MagicNo);
         }
         if (GetTotalOpenBuy(Pair1, MagicNo) == li_8 + 1 && GetTotalOpenSell(Pair2, MagicNo) <= li_8) li_4 = PostSell(ls_124, Pair2, ld_44, li_8 + 1, MagicNo);
         if (li_4 < 0) {
            Sleep(3000);
            li_4 = PostSell(ls_124, Pair2, ld_44, li_8 + 1, MagicNo);
         }
         if (li_4 < 0) {
            Sleep(3000);
            li_4 = PostSell(ls_124, Pair2, ld_44, li_8 + 1, MagicNo);
         }
      }
      if (UseTakeProfitByPip == TRUE && GetFloatingPip(1) >= TakeProfit) {
         li_20 = GetLastTicketBuy(Pair1, MagicNo);
         li_24 = GetLastTicketSell(Pair2, MagicNo);
         if (li_20 > 0 && li_24 > 0) {
            li_116 = CloseLastBuy(li_20, Pair1);
            if (li_116 == 0) {
               Sleep(3000);
               li_116 = CloseLastBuy(li_20, Pair1);
            }
            if (li_116 == 0) {
               Sleep(3000);
               li_116 = CloseLastBuy(li_20, Pair1);
            }
            li_120 = CloseLastSell(li_24, Pair2);
            if (li_120 == 0) {
               Sleep(3000);
               li_120 = CloseLastSell(li_24, Pair2);
            }
            if (li_120 == 0) {
               Sleep(3000);
               li_120 = CloseLastSell(li_24, Pair2);
            }
         }
      }
      if (UseTakeProfitByUSD == TRUE && GetFloatingUSD(1) >= TakeProfitInUSD) {
         li_20 = GetLastTicketBuy(Pair1, MagicNo);
         li_24 = GetLastTicketSell(Pair2, MagicNo);
         if (li_20 > 0 && li_24 > 0) {
            li_116 = CloseLastBuy(li_20, Pair1);
            if (li_116 == 0) {
               Sleep(3000);
               li_116 = CloseLastBuy(li_20, Pair1);
            }
            if (li_116 == 0) {
               Sleep(3000);
               li_116 = CloseLastBuy(li_20, Pair1);
            }
            li_120 = CloseLastSell(li_24, Pair2);
            if (li_120 == 0) {
               Sleep(3000);
               li_120 = CloseLastSell(li_24, Pair2);
            }
            if (li_120 == 0) {
               Sleep(3000);
               li_120 = CloseLastSell(li_24, Pair2);
            }
         }
      }
   }
   if (TradeCouple2 == TRUE) {
      if (GetTotalOpenBuy(Pair2, gi_196) <= 0) li_0 = PostBuy(ls_132, Pair2, ld_44, 1, gi_196);
      if (li_0 < 0) {
         Sleep(3000);
         li_0 = PostBuy(ls_132, Pair2, ld_44, 1, gi_196);
      }
      if (GetTotalOpenBuy(Pair2, gi_196) == 1 && GetTotalOpenSell(Pair1, gi_196) <= 0) li_4 = PostSell(ls_132, Pair1, ld_36, 1, gi_196);
      if (li_4 < 0) {
         Sleep(3000);
         li_4 = PostSell(ls_132, Pair1, ld_36, 1, gi_196);
      }
      if (GetFloatingPip(2) <= (-LayerDistance) && GetTotalOpenBuy(Pair2, gi_196) < MaximumLayer) {
         li_0 = GetLastTicketBuy(Pair2, gi_196);
         li_8 = GetLastLayerBuy(Pair2, li_0, gi_196);
         if (GetTotalOpenBuy(Pair2, gi_196) <= li_8) li_0 = PostBuy(ls_132, Pair2, ld_44, li_8 + 1, gi_196);
         if (li_0 < 0) {
            Sleep(3000);
            PostBuy(ls_132, Pair2, ld_44, li_8 + 1, gi_196);
         }
         if (GetTotalOpenBuy(Pair2, gi_196) == li_8 + 1 && GetTotalOpenSell(Pair1, gi_196) <= li_8) li_4 = PostSell(ls_132, Pair1, ld_36, li_8 + 1, gi_196);
         if (li_4 < 0) {
            Sleep(3000);
            PostSell(ls_132, Pair1, ld_36, li_8 + 1, gi_196);
         }
         if (li_4 < 0) {
            Sleep(3000);
            PostSell(ls_132, Pair1, ld_36, li_8 + 1, gi_196);
         }
      }
      if (UseTakeProfitByPip == TRUE && GetFloatingPip(2) >= TakeProfit) {
         li_20 = GetLastTicketBuy(Pair2, gi_196);
         li_24 = GetLastTicketSell(Pair1, gi_196);
         if (li_20 > 0 && li_24 > 0) {
            li_116 = CloseLastBuy(li_20, Pair2);
            if (li_116 == 0) {
               Sleep(3000);
               li_116 = CloseLastBuy(li_20, Pair2);
            }
            if (li_116 == 0) {
               Sleep(3000);
               li_116 = CloseLastBuy(li_20, Pair2);
            }
            li_120 = CloseLastSell(li_24, Pair1);
            if (li_120 == 0) {
               Sleep(3000);
               li_120 = CloseLastSell(li_24, Pair1);
            }
            if (li_120 == 0) {
               Sleep(3000);
               li_120 = CloseLastSell(li_24, Pair1);
            }
         }
      }
      if (UseTakeProfitByUSD == TRUE && GetFloatingUSD(2) >= TakeProfitInUSD) {
         li_20 = GetLastTicketBuy(Pair2, gi_196);
         li_24 = GetLastTicketSell(Pair1, gi_196);
         if (li_20 > 0 && li_24 > 0) {
            li_116 = CloseLastBuy(li_20, Pair2);
            if (li_116 == 0) {
               Sleep(3000);
               li_116 = CloseLastBuy(li_20, Pair2);
            }
            if (li_116 == 0) {
               Sleep(3000);
               li_116 = CloseLastBuy(li_20, Pair2);
            }
            li_120 = CloseLastSell(li_24, Pair1);
            if (li_120 == 0) {
               Sleep(3000);
               li_120 = CloseLastSell(li_24, Pair1);
            }
            if (li_120 == 0) {
               Sleep(3000);
               li_120 = CloseLastSell(li_24, Pair1);
            }
         }
      }
   }
   if (TradeCouple1 == TRUE) {
      li_20 = GetLastTicketBuy(Pair1, MagicNo);
      li_12 = GetLastLayerBuy(Pair1, li_20, MagicNo);
      li_24 = GetLastTicketSell(Pair2, MagicNo);
      li_16 = GetLastLayerSell(Pair2, li_24, MagicNo);
      if (li_12 > li_16) {
         li_28 = GetFloatBuy(li_20, Pair1, MagicNo);
         if (li_28 > 0) {
            li_116 = CloseLastBuy(li_20, Pair1);
            if (li_116 == 0) {
               Sleep(3000);
               li_116 = CloseLastBuy(li_20, Pair1);
            }
            if (li_116 == 0) {
               Sleep(3000);
               li_116 = CloseLastBuy(li_20, Pair1);
            }
         } else {
            li_4 = PostSell(ls_124, Pair2, ld_44, li_12, MagicNo);
            if (li_4 < 0) {
               Sleep(3000);
               li_4 = PostSell(ls_124, Pair2, ld_44, li_12, MagicNo);
            }
            if (li_4 < 0) {
               Sleep(3000);
               li_4 = PostSell(ls_124, Pair2, ld_44, li_12, MagicNo);
            }
         }
      }
      if (li_16 > li_12) {
         li_32 = GetFloatSell(li_24, Pair2, MagicNo);
         if (li_32 > 0) {
            li_120 = CloseLastSell(li_24, Pair2);
            if (li_120 == 0) {
               Sleep(3000);
               li_120 = CloseLastSell(li_24, Pair2);
            }
            if (li_120 == 0) {
               Sleep(3000);
               li_120 = CloseLastSell(li_24, Pair2);
            }
         } else {
            li_0 = PostBuy(ls_124, Pair1, ld_36, li_16, MagicNo);
            if (li_0 < 0) {
               Sleep(3000);
               li_0 = PostBuy(ls_124, Pair1, ld_36, li_16, MagicNo);
            }
            if (li_0 < 0) {
               Sleep(3000);
               li_0 = PostBuy(ls_124, Pair1, ld_36, li_16, MagicNo);
            }
         }
      }
   }
   if (TradeCouple2 == TRUE) {
      li_20 = GetLastTicketBuy(Pair2, gi_196);
      li_12 = GetLastLayerBuy(Pair2, li_20, gi_196);
      li_24 = GetLastTicketSell(Pair1, gi_196);
      li_16 = GetLastLayerSell(Pair1, li_24, gi_196);
      if (li_12 > li_16) {
         li_28 = GetFloatBuy(li_20, Pair2, gi_196);
         if (li_28 > 0) {
            li_116 = CloseLastBuy(li_20, Pair2);
            if (li_116 == 0) {
               Sleep(3000);
               li_116 = CloseLastBuy(li_20, Pair2);
            }
            if (li_116 == 0) {
               Sleep(3000);
               li_116 = CloseLastBuy(li_20, Pair2);
            }
         } else {
            li_4 = PostSell(ls_132, Pair1, ld_36, li_12, gi_196);
            if (li_4 < 0) {
               Sleep(3000);
               li_4 = PostSell(ls_132, Pair1, ld_36, li_12, gi_196);
            }
            if (li_4 < 0) {
               Sleep(3000);
               li_4 = PostSell(ls_132, Pair1, ld_36, li_12, gi_196);
            }
         }
      }
      if (li_16 > li_12) {
         li_32 = GetFloatSell(li_24, Pair1, gi_196);
         if (li_32 > 0) {
            li_120 = CloseLastSell(li_24, Pair1);
            if (li_120 == 0) {
               Sleep(3000);
               li_120 = CloseLastSell(li_24, Pair1);
            }
            if (li_120 == 0) {
               Sleep(3000);
               li_120 = CloseLastSell(li_24, Pair1);
            }
         } else {
            li_0 = PostBuy(ls_132, Pair2, ld_44, li_16, gi_196);
            if (li_0 < 0) {
               Sleep(3000);
               li_0 = PostBuy(ls_132, Pair2, ld_44, li_16, gi_196);
            }
            if (li_0 < 0) {
               Sleep(3000);
               li_0 = PostBuy(ls_132, Pair2, ld_44, li_16, gi_196);
            }
         }
      }
   }
   if (TradeCouple1 == TRUE) ls_140 = "  ON";
   else ls_140 = "OFF";
   if (TradeCouple2 == TRUE) ls_148 = "  ON";
   else ls_148 = "OFF";
   Comment("\nAverage ADR ", Pair1, ": ", DoubleToStr(ld_76, 0), "  Average ADR ", Pair2, ": ", DoubleToStr(ld_108, 0), "   Ratio ADR: ", DoubleToStr(ld_52, 2), 
      "\n", "Lot ", Pair1, ": ", ld_36, "   Lot ", Pair2, ": ", ld_44, "  Take Profit: ", TakeProfit, "  Take Profit in USD: ", TakeProfitInUSD, "  Distance: ", LayerDistance, "  Maximum Layer: ", MaximumLayer, 
      "\n\n", "COUPLE 1>  ", ls_140, "  Last Floating pip: ", GetFloatingPip(1), "  Last Floating in USD: ", GetFloatingUSD(1), "  Total Buy: ", GetTotalLotBuy(Pair1, MagicNo), "  Total Sell: ", GetTotalLotSell(Pair2, MagicNo), 
   "\n", "COUPLE 2>  ", ls_148, "  Last Floating pip: ", GetFloatingPip(2), "  Last Floating in USD: ", GetFloatingUSD(2), "  Total Buy: ", GetTotalLotBuy(Pair2, gi_196), "  Total Sell: ", GetTotalLotSell(Pair1, gi_196));
   return (0);
}

int PostBuy(string as_0, string a_symbol_8, double a_lots_16, int ai_24, int a_magic_28) {
   string l_comment_44 = as_0 + " - Layer " + ai_24;
   RefreshRates();
   double l_price_36 = NormalizeDouble(MarketInfo(a_symbol_8, MODE_ASK), MarketInfo(a_symbol_8, MODE_DIGITS));
   int l_ticket_32 = OrderSend(a_symbol_8, OP_BUY, a_lots_16, l_price_36, 5, 0, 0, l_comment_44, a_magic_28, 0, Blue);
   if (l_ticket_32 > 0) {
      if (OrderSelect(l_ticket_32, SELECT_BY_TICKET, MODE_TRADES)) Print("BUY order #", OrderTicket(), " opened at ", OrderOpenPrice());
   } else Print("#1: Error opening BUY order; Error Code: ", GetLastError(), ": ", ErrorDescription(GetLastError()));
   return (l_ticket_32);
}

int PostSell(string as_0, string a_symbol_8, double a_lots_16, int ai_24, int a_magic_28) {
   string l_comment_44 = as_0 + " - Layer " + ai_24;
   RefreshRates();
   double l_price_36 = NormalizeDouble(MarketInfo(a_symbol_8, MODE_BID), MarketInfo(a_symbol_8, MODE_DIGITS));
   int l_ticket_32 = OrderSend(a_symbol_8, OP_SELL, a_lots_16, l_price_36, 5, 0, 0, l_comment_44, a_magic_28, 0, Red);
   if (l_ticket_32 > 0) {
      if (OrderSelect(l_ticket_32, SELECT_BY_TICKET, MODE_TRADES)) Print("SELL order #", OrderTicket(), " opened at ", OrderOpenPrice());
   } else Print("#2: Error opening SELL order, Error Code: ", GetLastError(), ": ", ErrorDescription(GetLastError()));
   return (l_ticket_32);
}

int GetLastLayerBuy(string a_symbol_0, int a_ticket_8, int a_magic_12) {
   string ls_16;
   int l_str2int_24;
   if (OrderSelect(a_ticket_8, SELECT_BY_TICKET) == TRUE) {
      if (OrderSymbol() == a_symbol_0 && OrderMagicNumber() == a_magic_12) {
         ls_16 = OrderComment();
         l_str2int_24 = StrToInteger(StringSubstr(ls_16, 17));
      }
   }
   return (l_str2int_24);
}

int GetLastLayerSell(string a_symbol_0, int a_ticket_8, int a_magic_12) {
   string ls_16;
   int l_str2int_24;
   if (OrderSelect(a_ticket_8, SELECT_BY_TICKET) == TRUE) {
      if (OrderSymbol() == a_symbol_0 && OrderMagicNumber() == a_magic_12) {
         ls_16 = OrderComment();
         l_str2int_24 = StrToInteger(StringSubstr(ls_16, 17));
      }
   }
   return (l_str2int_24);
}

int GetLastTicketBuy(string a_symbol_0, int a_magic_8) {
   int l_ticket_12;
   int l_ticket_16 = 0;
   for (int l_pos_20 = OrdersTotal() - 1; l_pos_20 >= 0; l_pos_20--) {
      OrderSelect(l_pos_20, SELECT_BY_POS, MODE_TRADES);
      if (OrderSymbol() != a_symbol_0 || OrderMagicNumber() != a_magic_8) continue;
      if (OrderSymbol() == a_symbol_0 && OrderMagicNumber() == a_magic_8 && OrderType() == OP_BUY) {
         l_ticket_12 = OrderTicket();
         if (l_ticket_12 > l_ticket_16) l_ticket_16 = l_ticket_12;
      }
   }
   return (l_ticket_16);
}

int GetLastTicketSell(string a_symbol_0, int a_magic_8) {
   int l_ticket_12;
   int l_ticket_16 = 0;
   for (int l_pos_20 = OrdersTotal() - 1; l_pos_20 >= 0; l_pos_20--) {
      OrderSelect(l_pos_20, SELECT_BY_POS, MODE_TRADES);
      if (OrderSymbol() != a_symbol_0 || OrderMagicNumber() != a_magic_8) continue;
      if (OrderSymbol() == a_symbol_0 && OrderMagicNumber() == a_magic_8 && OrderType() == OP_SELL) {
         l_ticket_12 = OrderTicket();
         if (l_ticket_12 > l_ticket_16) l_ticket_16 = l_ticket_12;
      }
   }
   return (l_ticket_16);
}

int GetTotalOpenBuy(string a_symbol_0, int a_magic_8) {
   int l_count_12 = 0;
   for (int l_ord_total_16 = OrdersTotal(); l_ord_total_16 >= 0; l_ord_total_16--) {
      if (OrderSelect(l_ord_total_16, SELECT_BY_POS) == TRUE) {
         if (OrderSymbol() != a_symbol_0 || OrderMagicNumber() != a_magic_8) continue;
         if (OrderSymbol() == a_symbol_0 && OrderMagicNumber() == a_magic_8 && OrderType() == OP_BUY) l_count_12++;
      }
   }
   return (l_count_12);
}

int GetTotalOpenSell(string a_symbol_0, int a_magic_8) {
   int l_count_12 = 0;
   for (int l_ord_total_16 = OrdersTotal(); l_ord_total_16 >= 0; l_ord_total_16--) {
      if (OrderSelect(l_ord_total_16, SELECT_BY_POS) == TRUE) {
         if (OrderSymbol() != a_symbol_0 || OrderMagicNumber() != a_magic_8) continue;
         if (OrderSymbol() == a_symbol_0 && OrderMagicNumber() == a_magic_8 && OrderType() == OP_SELL) l_count_12++;
      }
   }
   return (l_count_12);
}

int GetFloatingPip(int ai_0) {
   int li_ret_4;
   int li_8;
   int li_12;
   int li_16;
   int li_20;
   if (ai_0 == 1) {
      li_16 = GetLastTicketBuy(Pair1, MagicNo);
      li_8 = GetFloatBuy(li_16, Pair1, MagicNo);
      li_20 = GetLastTicketSell(Pair2, MagicNo);
      li_12 = GetFloatSell(li_20, Pair2, MagicNo);
      li_ret_4 = li_8 + li_12;
   }
   if (ai_0 == 2) {
      li_16 = GetLastTicketBuy(Pair2, gi_196);
      li_8 = GetFloatBuy(li_16, Pair2, gi_196);
      li_20 = GetLastTicketSell(Pair1, gi_196);
      li_12 = GetFloatSell(li_20, Pair1, gi_196);
      li_ret_4 = li_8 + li_12;
   }
   return (li_ret_4);
}

double GetFloatingUSD(int ai_0) {
   double ld_ret_4;
   double ld_12;
   double ld_20;
   int li_28;
   int li_32;
   if (ai_0 == 1) {
      li_28 = GetLastTicketBuy(Pair1, MagicNo);
      ld_12 = GetFloatBuyUSD(li_28, Pair1, MagicNo);
      li_32 = GetLastTicketSell(Pair2, MagicNo);
      ld_20 = GetFloatSellUSD(li_32, Pair2, MagicNo);
      ld_ret_4 = ld_12 + ld_20;
   }
   if (ai_0 == 2) {
      li_28 = GetLastTicketBuy(Pair2, gi_196);
      ld_12 = GetFloatBuyUSD(li_28, Pair2, gi_196);
      li_32 = GetLastTicketSell(Pair1, gi_196);
      ld_20 = GetFloatSellUSD(li_32, Pair1, gi_196);
      ld_ret_4 = ld_12 + ld_20;
   }
   return (ld_ret_4);
}

int GetFloatBuy(int a_ticket_0, string a_symbol_4, int a_magic_12) {
   int li_ret_16;
   if (a_ticket_0 != 0) {
      if (OrderSelect(a_ticket_0, SELECT_BY_TICKET) == TRUE) {
         if (OrderSymbol() == a_symbol_4 && OrderMagicNumber() == a_magic_12) li_ret_16 = (MarketInfo(a_symbol_4, MODE_BID) - OrderOpenPrice()) / MarketInfo(a_symbol_4, MODE_POINT);
      } else Print("#3: Error Select Buy Open Order no ", a_ticket_0, ": ", "  Error Code: ", GetLastError(), ": ", ErrorDescription(GetLastError()));
   }
   return (li_ret_16);
}

int GetFloatSell(int a_ticket_0, string a_symbol_4, int a_magic_12) {
   int li_ret_16;
   if (a_ticket_0 != 0) {
      if (OrderSelect(a_ticket_0, SELECT_BY_TICKET) == TRUE) {
         if (OrderSymbol() == a_symbol_4 && OrderMagicNumber() == a_magic_12) li_ret_16 = (OrderOpenPrice() - MarketInfo(a_symbol_4, MODE_ASK)) / MarketInfo(a_symbol_4, MODE_POINT);
      } else Print("#4 Error Select Sell Open Order no ", a_ticket_0, ": ", "  Error Code: ", GetLastError(), ": ", ErrorDescription(GetLastError()));
   }
   return (li_ret_16);
}

double GetFloatBuyUSD(int a_ticket_0, string a_symbol_4, int a_magic_12) {
   double ld_ret_16;
   if (a_ticket_0 != 0) {
      if (OrderSelect(a_ticket_0, SELECT_BY_TICKET) == TRUE) {
         if (OrderSymbol() == a_symbol_4 && OrderMagicNumber() == a_magic_12) ld_ret_16 = OrderProfit() + OrderSwap() + OrderCommission();
      } else Print("#5: Error Select Buy Open Order no ", a_ticket_0, ": ", "  Error Code: ", GetLastError(), ": ", ErrorDescription(GetLastError()));
   }
   return (ld_ret_16);
}

double GetFloatSellUSD(int a_ticket_0, string a_symbol_4, int a_magic_12) {
   double ld_ret_16;
   if (a_ticket_0 != 0) {
      if (OrderSelect(a_ticket_0, SELECT_BY_TICKET) == TRUE) {
         if (OrderSymbol() == a_symbol_4 && OrderMagicNumber() == a_magic_12) ld_ret_16 = OrderProfit() + OrderSwap() + OrderCommission();
      } else Print("#6: Error Select Sell Open Order no ", a_ticket_0, ": ", "  Error Code: ", GetLastError(), ": ", ErrorDescription(GetLastError()));
   }
   return (ld_ret_16);
}

double GetTotalLotBuy(string a_symbol_0, int a_magic_8) {
   double ld_ret_12 = 0;
   for (int l_ord_total_20 = OrdersTotal(); l_ord_total_20 >= 0; l_ord_total_20--) {
      if (OrderSelect(l_ord_total_20, SELECT_BY_POS) == TRUE) {
         if (OrderSymbol() != a_symbol_0 || OrderMagicNumber() != a_magic_8) continue;
         if (OrderSymbol() == a_symbol_0 && OrderMagicNumber() == a_magic_8 && OrderType() == OP_BUY) ld_ret_12 += OrderLots();
      }
   }
   return (ld_ret_12);
}

double GetTotalLotSell(string a_symbol_0, int a_magic_8) {
   double ld_ret_12 = 0;
   for (int l_ord_total_20 = OrdersTotal(); l_ord_total_20 >= 0; l_ord_total_20--) {
      if (OrderSelect(l_ord_total_20, SELECT_BY_POS) == TRUE) {
         if (OrderSymbol() != a_symbol_0 || OrderMagicNumber() != a_magic_8) continue;
         if (OrderSymbol() == a_symbol_0 && OrderMagicNumber() == a_magic_8 && OrderType() == OP_SELL) ld_ret_12 += OrderLots();
      }
   }
   return (ld_ret_12);
}

int CloseLastBuy(int a_ticket_0, string a_symbol_4) {
   int l_ord_close_12;
   if (OrderSelect(a_ticket_0, SELECT_BY_TICKET) == TRUE) {
      l_ord_close_12 = OrderClose(OrderTicket(), OrderLots(), NormalizeDouble(MarketInfo(a_symbol_4, MODE_BID), 12), 5, MediumBlue);
      if (l_ord_close_12 == 1) Print("The Last Buy order is closed");
      else Print("#7: Error when close the Last Buy orders; Error Code: ", GetLastError(), ": ", ErrorDescription(GetLastError()));
   }
   return (l_ord_close_12);
}

int CloseLastSell(int a_ticket_0, string a_symbol_4) {
   int l_ord_close_12;
   if (OrderSelect(a_ticket_0, SELECT_BY_TICKET) == TRUE) {
      l_ord_close_12 = OrderClose(OrderTicket(), OrderLots(), NormalizeDouble(MarketInfo(a_symbol_4, MODE_ASK), 12), 5, Pink);
      if (l_ord_close_12 == 1) Print("The Last Sell order is closed");
      else Print("#8: Error when close the Last Sell order; Error Code: ", GetLastError(), ": ", ErrorDescription(GetLastError()));
   }
   return (l_ord_close_12);
}

string ErrorDescription(int ai_0) {
   string ls_ret_4;
   switch (ai_0) {
   case 0:
      ls_ret_4 = "no error";
   case 1:
      ls_ret_4 = "no error";
      break;
   case 2:
      ls_ret_4 = "common error";
      break;
   case 3:
      ls_ret_4 = "invalid trade parameters";
      break;
   case 4:
      ls_ret_4 = "trade server is busy";
      break;
   case 5:
      ls_ret_4 = "old version of the client terminal";
      break;
   case 6:
      ls_ret_4 = "no connection with trade server";
      break;
   case 7:
      ls_ret_4 = "not enough rights";
      break;
   case 8:
      ls_ret_4 = "too frequent requests";
      break;
   case 9:
      ls_ret_4 = "malfunctional trade operation";
      break;
   case 64:
      ls_ret_4 = "account disabled";
      break;
   case 65:
      ls_ret_4 = "invalid account";
      break;
   case 128:
      ls_ret_4 = "trade timeout";
      break;
   case 129:
      ls_ret_4 = "invalid price";
      break;
   case 130:
      ls_ret_4 = "invalid stops";
      break;
   case 131:
      ls_ret_4 = "invalid trade volume";
      break;
   case 132:
      ls_ret_4 = "market is closed";
      break;
   case 133:
      ls_ret_4 = "trade is disabled";
      break;
   case 134:
      ls_ret_4 = "not enough money";
      break;
   case 135:
      ls_ret_4 = "price changed";
      break;
   case 136:
      ls_ret_4 = "off quotes";
      break;
   case 137:
      ls_ret_4 = "broker is busy";
      break;
   case 138:
      ls_ret_4 = "requote";
      break;
   case 139:
      ls_ret_4 = "order is locked";
      break;
   case 140:
      ls_ret_4 = "long positions only allowed";
      break;
   case 141:
      ls_ret_4 = "too many requests";
      break;
   case 145:
      ls_ret_4 = "modification denied because order too close to market";
      break;
   case 146:
      ls_ret_4 = "trade context is busy";
      break;
   case 4000:
      ls_ret_4 = "no error";
      break;
   case 4001:
      ls_ret_4 = "wrong function pointer";
      break;
   case 4002:
      ls_ret_4 = "array index is out of range";
      break;
   case 4003:
      ls_ret_4 = "no memory for function call stack";
      break;
   case 4004:
      ls_ret_4 = "recursive stack overflow";
      break;
   case 4005:
      ls_ret_4 = "not enough stack for parameter";
      break;
   case 4006:
      ls_ret_4 = "no memory for parameter string";
      break;
   case 4007:
      ls_ret_4 = "no memory for temp string";
      break;
   case 4008:
      ls_ret_4 = "not initialized string";
      break;
   case 4009:
      ls_ret_4 = "not initialized string in array";
      break;
   case 4010:
      ls_ret_4 = "no memory for array\' string";
      break;
   case 4011:
      ls_ret_4 = "too long string";
      break;
   case 4012:
      ls_ret_4 = "remainder from zero divide";
      break;
   case 4013:
      ls_ret_4 = "zero divide";
      break;
   case 4014:
      ls_ret_4 = "unknown command";
      break;
   case 4015:
      ls_ret_4 = "wrong jump (never generated error)";
      break;
   case 4016:
      ls_ret_4 = "not initialized array";
      break;
   case 4017:
      ls_ret_4 = "dll calls are not allowed";
      break;
   case 4018:
      ls_ret_4 = "cannot load library";
      break;
   case 4019:
      ls_ret_4 = "cannot call function";
      break;
   case 4020:
      ls_ret_4 = "expert function calls are not allowed";
      break;
   case 4021:
      ls_ret_4 = "not enough memory for temp string returned from function";
      break;
   case 4022:
      ls_ret_4 = "system is busy (never generated error)";
      break;
   case 4050:
      ls_ret_4 = "invalid function parameters count";
      break;
   case 4051:
      ls_ret_4 = "invalid function parameter value";
      break;
   case 4052:
      ls_ret_4 = "string function internal error";
      break;
   case 4053:
      ls_ret_4 = "some array error";
      break;
   case 4054:
      ls_ret_4 = "incorrect series array using";
      break;
   case 4055:
      ls_ret_4 = "custom indicator error";
      break;
   case 4056:
      ls_ret_4 = "arrays are incompatible";
      break;
   case 4057:
      ls_ret_4 = "global variables processing error";
      break;
   case 4058:
      ls_ret_4 = "global variable not found";
      break;
   case 4059:
      ls_ret_4 = "function is not allowed in testing mode";
      break;
   case 4060:
      ls_ret_4 = "function is not confirmed";
      break;
   case 4061:
      ls_ret_4 = "send mail error";
      break;
   case 4062:
      ls_ret_4 = "string parameter expected";
      break;
   case 4063:
      ls_ret_4 = "integer parameter expected";
      break;
   case 4064:
      ls_ret_4 = "double parameter expected";
      break;
   case 4065:
      ls_ret_4 = "array as parameter expected";
      break;
   case 4066:
      ls_ret_4 = "requested history data in update state";
      break;
   case 4099:
      ls_ret_4 = "end of file";
      break;
   case 4100:
      ls_ret_4 = "some file error";
      break;
   case 4101:
      ls_ret_4 = "wrong file name";
      break;
   case 4102:
      ls_ret_4 = "too many opened files";
      break;
   case 4103:
      ls_ret_4 = "cannot open file";
      break;
   case 4104:
      ls_ret_4 = "incompatible access to a file";
      break;
   case 4105:
      ls_ret_4 = "no order selected";
      break;
   case 4106:
      ls_ret_4 = "unknown symbol";
      break;
   case 4107:
      ls_ret_4 = "invalid price parameter for trade function";
      break;
   case 4108:
      ls_ret_4 = "invalid ticket";
      break;
   case 4109:
      ls_ret_4 = "trade is not allowed";
      break;
   case 4110:
      ls_ret_4 = "longs are not allowed";
      break;
   case 4111:
      ls_ret_4 = "shorts are not allowed";
      break;
   case 4200:
      ls_ret_4 = "object is already exist";
      break;
   case 4201:
      ls_ret_4 = "unknown object property";
      break;
   case 4202:
      ls_ret_4 = "object is not exist";
      break;
   case 4203:
      ls_ret_4 = "unknown object type";
      break;
   case 4204:
      ls_ret_4 = "no object name";
      break;
   case 4205:
      ls_ret_4 = "object coordinates error";
      break;
   case 4206:
      ls_ret_4 = "no specified subwindow";
      break;
   default:
      ls_ret_4 = "unknown error";
   }
   return (ls_ret_4);
}