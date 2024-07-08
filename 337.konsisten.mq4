/*
   Generated by EX4-TO-MQ4 decompiler V4.0.427.4 [-]
   Website: https://purebeam.biz
   E-mail : purebeam@gmail.com
*/
#property copyright "mas_bagus"
#property link      "sury4_1980@yahoo.com"

extern bool use_daily_target = FALSE;
extern double daily_target = 30.0;

extern bool Trade_in_Monday  =true; 
extern bool Trade_in_Tuesday =true; 
extern bool Trade_in_Wednesday=true;
extern bool Trade_in_Thursday=true; 
extern bool Trade_in_Friday  =true;

extern int magic = 1;
extern double start_lot = 0.01;
extern double range = 10.0;
extern int level = 10;
extern bool lot_multiplier = TRUE;
extern double multiplier = 2.0;
extern double increament = 0.1;
extern bool use_sl_and_tp = FALSE;
extern double sl = 60.0;
extern double tp = 30.0;
extern double tp_in_money = 0.5;
extern bool stealth_mode = TRUE;
extern bool use_stoch = TRUE;
extern int k = 10;
extern int d = 3;
extern int slowing = 3;
extern int price_field = 0;
extern int stoch_shift = 0;
extern int lo_level = 30;
extern int up_level = 70;
extern int   TF_M                =  2; 
extern int   Sensitivity_M       =  40;  

extern int   TF_M2                =  2;     
extern int   Sensitivity_M2       =  20; 


extern string StartHour = "00:00"; 
extern string EndHour   = "23:59";  

double gd_200;
double g_minlot_208;
double g_stoplevel_216;
int gi_224 = 0;
int g_count_228 = 0;
int g_ticket_232 = 0;

int init() {
   if (Digits == 3 || Digits == 5) gd_200 = 10.0 * Point;
   else gd_200 = Point;
   g_minlot_208 = MarketInfo(Symbol(), MODE_MINLOT);
   g_stoplevel_216 = MarketInfo(Symbol(), MODE_STOPLEVEL);
   if (start_lot < g_minlot_208) Print("lotsize is to small.");
   if (sl < g_stoplevel_216) Print("stoploss is to tight.");
   if (tp < g_stoplevel_216) Print("takeprofit is to tight.");
   if (g_minlot_208 == 0.01) gi_224 = 2;
   if (g_minlot_208 == 0.1) gi_224 = 1;
   return (0);
}

int deinit() {
   return (0);
}

int start() {
   int cmd_4;
   double order_open_price_8;
   double order_lots_16;
   double order_stoploss_24;
   double order_takeprofit_32;
   if (use_daily_target && f0_0() >= daily_target) {
      Comment("\ndaily target achieved.");
      return (0);
   }
   
   if ( (DayOfWeek() == 5 || DayOfWeek() == 1) && f0_3() == 0) {
      Comment("\nstop trading in Friday.");
      return (0);
   }
   
  
   if(TimeFilter()){
     if(IsExpertEnabled()){

   if (f0_3() == 0 && g_count_228 == 0) {
      if (f0_1() == -2 && (M()==1 || M2()==1)) {
         if (stealth_mode) {
            if (use_sl_and_tp) g_ticket_232 = OrderSend(Symbol(), OP_BUY, start_lot, Ask, 3, Ask - sl * gd_200, Ask + tp * gd_200, "", magic, 0, Blue);
            else g_ticket_232 = OrderSend(Symbol(), OP_BUY, start_lot, Ask, 3, 0, 0, "", magic, 0, Blue);
         } else {
            if (use_sl_and_tp) {
               if (OrderSend(Symbol(), OP_BUY, start_lot, Ask, 3, Ask - sl * gd_200, Ask + tp * gd_200, "", magic, 0, Blue) > 0) {
                  for (int li_0 = 1; li_0 < level; li_0++) {
                     if (lot_multiplier) {
                        g_ticket_232 = OrderSend(Symbol(), OP_BUYLIMIT, NormalizeDouble(start_lot * MathPow(multiplier, li_0), gi_224), Ask - range * li_0 * gd_200, 3, Ask - range * li_0 * gd_200 - sl * gd_200,
                           Ask - range * li_0 * gd_200 + tp * gd_200, "", magic, 0, Blue);
                     } else {
                        g_ticket_232 = OrderSend(Symbol(), OP_BUYLIMIT, NormalizeDouble(start_lot + increament * li_0, gi_224), Ask - range * li_0 * gd_200, 3, Ask - range * li_0 * gd_200 - sl * gd_200,
                           Ask - range * li_0 * gd_200 + tp * gd_200, "", magic, 0, Blue);
                     }
                  }
               }
            } else {
               if (OrderSend(Symbol(), OP_BUY, start_lot, Ask, 3, 0, 0, "", magic, 0, Blue) > 0) {
                  for (li_0 = 1; li_0 < level; li_0++) {
                     if (lot_multiplier) {
                        g_ticket_232 = OrderSend(Symbol(), OP_BUYLIMIT, NormalizeDouble(start_lot * MathPow(multiplier, li_0), gi_224), Ask - range * li_0 * gd_200, 3, 0, 0, "", magic, 0,
                           Blue);
                     } else g_ticket_232 = OrderSend(Symbol(), OP_BUYLIMIT, NormalizeDouble(start_lot + increament * li_0, gi_224), Ask - range * li_0 * gd_200, 3, 0, 0, "", magic, 0, Blue);
                  }
               }
            }
         }
      }
      if (f0_1() == 2 && (M()==-1 || M2()==-1)) {
         if (stealth_mode) {
            if (use_sl_and_tp) g_ticket_232 = OrderSend(Symbol(), OP_SELL, start_lot, Bid, 3, Bid + sl * gd_200, Bid - tp * gd_200, "", magic, 0, Red);
            else g_ticket_232 = OrderSend(Symbol(), OP_SELL, start_lot, Bid, 3, 0, 0, "", magic, 0, Red);
         } else {
            if (use_sl_and_tp) {
               if (OrderSend(Symbol(), OP_SELL, start_lot, Bid, 3, Bid + sl * gd_200, Bid - tp * gd_200, "", magic, 0, Red) > 0) {
                  for (li_0 = 1; li_0 < level; li_0++) {
                     if (lot_multiplier) {
                        g_ticket_232 = OrderSend(Symbol(), OP_SELLLIMIT, NormalizeDouble(start_lot * MathPow(multiplier, li_0), gi_224), Bid + range * li_0 * gd_200, 3, Bid + range * li_0 * gd_200 +
                           sl * gd_200, Bid + range * li_0 * gd_200 - tp * gd_200, "", magic, 0, Red);
                     } else {
                        g_ticket_232 = OrderSend(Symbol(), OP_SELLLIMIT, NormalizeDouble(start_lot + increament * li_0, gi_224), Bid + range * li_0 * gd_200, 3, Bid + range * li_0 * gd_200 +
                           sl * gd_200, Bid + range * li_0 * gd_200 - tp * gd_200, "", magic, 0, Red);
                     }
                  }
               }
            } else {
               if (OrderSend(Symbol(), OP_SELL, start_lot, Bid, 3, 0, 0, "", magic, 0, Red) > 0) {
                  for (li_0 = 1; li_0 < level; li_0++) {
                     if (lot_multiplier) {
                        g_ticket_232 = OrderSend(Symbol(), OP_SELLLIMIT, NormalizeDouble(start_lot * MathPow(multiplier, li_0), gi_224), Bid + range * li_0 * gd_200, 3, 0, 0, "", magic,
                           0, Red);
                     } else g_ticket_232 = OrderSend(Symbol(), OP_SELLLIMIT, NormalizeDouble(start_lot + increament * li_0, gi_224), Bid + range * li_0 * gd_200, 3, 0, 0, "", magic, 0, Red);
                  }
               }
            }
         }
      }
   }
   if (stealth_mode && f0_3() > 0 && f0_3() < level) {
      for (li_0 = 0; li_0 < OrdersTotal(); li_0++) {
         OrderSelect(li_0, SELECT_BY_POS, MODE_TRADES);
         if (OrderSymbol() != Symbol() || OrderMagicNumber() != magic) continue;
         cmd_4 = OrderType();
         order_open_price_8 = OrderOpenPrice();
         order_lots_16 = OrderLots();
      }
      if (cmd_4 == OP_BUY && Ask <= order_open_price_8 - range * gd_200 && (M()==-1 || M2()==-1)) {
         if (use_sl_and_tp) {
            if (lot_multiplier) g_ticket_232 = OrderSend(Symbol(), OP_BUY, NormalizeDouble(order_lots_16 * multiplier, gi_224), Ask, 3, Ask - sl * gd_200, Ask + tp * gd_200, "", magic, 0, Blue);
            else g_ticket_232 = OrderSend(Symbol(), OP_BUY, NormalizeDouble(order_lots_16 + increament, gi_224), Ask, 3, Ask - sl * gd_200, Ask + tp * gd_200, "", magic, 0, Blue);
         } else {
            if (lot_multiplier) g_ticket_232 = OrderSend(Symbol(), OP_BUY, NormalizeDouble(order_lots_16 * multiplier, gi_224), Ask, 3, 0, 0, "", magic, 0, Blue);
            else g_ticket_232 = OrderSend(Symbol(), OP_BUY, NormalizeDouble(order_lots_16 + increament, gi_224), Ask, 3, 0, 0, "", magic, 0, Blue);
         }
      }
      if (cmd_4 == OP_SELL && Bid >= order_open_price_8 + range * gd_200 && (M()==-1 || M2()==-1)) {
         if (use_sl_and_tp) {
            if (lot_multiplier) g_ticket_232 = OrderSend(Symbol(), OP_SELL, NormalizeDouble(order_lots_16 * multiplier, gi_224), Bid, 3, Bid + sl * gd_200, Bid - tp * gd_200, "", magic, 0, Red);
            else g_ticket_232 = OrderSend(Symbol(), OP_SELL, NormalizeDouble(order_lots_16 + increament, gi_224), Bid, 3, Bid + sl * gd_200, Bid - tp * gd_200, "", magic, 0, Red);
         } else {
            if (lot_multiplier) g_ticket_232 = OrderSend(Symbol(), OP_SELL, NormalizeDouble(order_lots_16 * multiplier, gi_224), Bid, 3, 0, 0, "", magic, 0, Red);
            else g_ticket_232 = OrderSend(Symbol(), OP_SELL, NormalizeDouble(order_lots_16 + increament, gi_224), Bid, 3, 0, 0, "", magic, 0, Red);
         }
      }
   }
   if (use_sl_and_tp && f0_3() > 1) {
      for (li_0 = 0; li_0 < OrdersTotal(); li_0++) {
         OrderSelect(li_0, SELECT_BY_POS, MODE_TRADES);
         if (OrderSymbol() != Symbol() || OrderMagicNumber() != magic || OrderType() > OP_SELL) continue;
         cmd_4 = OrderType();
         order_stoploss_24 = OrderStopLoss();
         order_takeprofit_32 = OrderTakeProfit();
      }
      for (li_0 = OrdersTotal() - 1; li_0 >= 0; li_0--) {
         OrderSelect(li_0, SELECT_BY_POS, MODE_TRADES);
         if (OrderSymbol() != Symbol() || OrderMagicNumber() != magic || OrderType() > OP_SELL) continue;
         if (OrderType() == cmd_4)
            if (OrderStopLoss() != order_stoploss_24 || OrderTakeProfit() != order_takeprofit_32) OrderModify(OrderTicket(), OrderOpenPrice(), order_stoploss_24, order_takeprofit_32, 0, CLR_NONE);
      }
   }
   double ld_40 = 0;
   for (li_0 = 0; li_0 < OrdersTotal(); li_0++) {
      OrderSelect(li_0, SELECT_BY_POS, MODE_TRADES);
      if (OrderSymbol() != Symbol() || OrderMagicNumber() != magic || OrderType() > OP_SELL) continue;
      ld_40 += OrderProfit();
   }
    }
    }
   if (ld_40 >= tp_in_money || g_count_228 > 0) {
      f0_2();
      f0_2();
      f0_2();
      g_count_228++;
      if (f0_3() == 0) g_count_228 = 0;
   }
   if ((!stealth_mode) && use_sl_and_tp && f0_3() < level) f0_2();
   return (0);
  
}

double f0_0() {
   int day_0 = Day();
   double ld_ret_4 = 0;
   for (int pos_12 = 0; pos_12 < OrdersHistoryTotal(); pos_12++) {
      OrderSelect(pos_12, SELECT_BY_POS, MODE_HISTORY);
      if (OrderSymbol() != Symbol() || OrderMagicNumber() != magic) continue;
      if (TimeDay(OrderOpenTime()) == day_0) ld_ret_4 += OrderProfit();
   }
   return (ld_ret_4);
}

int f0_3() {
   int count_0 = 0;
   for (int pos_4 = 0; pos_4 < OrdersTotal(); pos_4++) {
      OrderSelect(pos_4, SELECT_BY_POS, MODE_TRADES);
      if (OrderSymbol() != Symbol() || OrderMagicNumber() != magic) continue;
      count_0++;
   }
   return (count_0);
}

int f0_1() {
   double istochastic_0 = iStochastic(Symbol(), 0, k, d, slowing, MODE_SMA, price_field, MODE_SIGNAL, stoch_shift);
   if (use_stoch) {
      if (istochastic_0 > up_level) return (2);
      if (istochastic_0 < lo_level) return (-2);
   }
   return (0);
}

void f0_2() {
   for (int pos_0 = OrdersTotal() - 1; pos_0 >= 0; pos_0--) {
      OrderSelect(pos_0, SELECT_BY_POS, MODE_TRADES);
      if (OrderSymbol() != Symbol() || OrderMagicNumber() != magic) continue;
      if (OrderType() > OP_SELL) OrderDelete(OrderTicket());
      else {
         if (OrderType() == OP_BUY) OrderClose(OrderTicket(), OrderLots(), Bid, 3, CLR_NONE);
         else OrderClose(OrderTicket(), OrderLots(), Ask, 3, CLR_NONE);
      }
   }
}
int  mper[10]={0,1,5,15,30,60,240,1440,10080,43200};
int M(){ 
   int MTSSignal=0;
   int MTSstart=0;
   double MTS_Green1=iCustom(Symbol(),mper[TF_M],"medium",Sensitivity_M,1,0);
   double MTS_Red1=iCustom(Symbol(),mper[TF_M],"medium",Sensitivity_M,2,0);
   double MTS_Green2=iCustom(Symbol(),mper[TF_M],"medium",Sensitivity_M,1,1);
   double MTS_Red2=iCustom(Symbol(),mper[TF_M],"medium",Sensitivity_M,2,1);
   if((MTS_Green1!=EMPTY_VALUE)&&(MTS_Green2!=EMPTY_VALUE)) MTSstart=1;
   if((MTS_Red1!=EMPTY_VALUE)&&(MTS_Red2!=EMPTY_VALUE)) MTSstart=-1;
   if(MTSstart<0) MTSSignal= -1;                                         //������ Sell 
   if(MTSstart>0) MTSSignal = 1;                                         // ������ Buy
   return(MTSSignal);
}

int M2(){ 
   int MTSSignal2=0;
   int MTSstart2=0;
   double MTS_Green1=iCustom(Symbol(),mper[TF_M2],"medium",Sensitivity_M2,1,0);
   double MTS_Red1=iCustom(Symbol(),mper[TF_M2],"medium",Sensitivity_M2,2,0);
   double MTS_Green2=iCustom(Symbol(),mper[TF_M2],"medium",Sensitivity_M2,1,1);
   double MTS_Red2=iCustom(Symbol(),mper[TF_M2],"medium",Sensitivity_M2,2,1);
   if((MTS_Green1!=EMPTY_VALUE)&&(MTS_Green2!=EMPTY_VALUE)) MTSstart2=1;
   if((MTS_Red1!=EMPTY_VALUE)&&(MTS_Red2!=EMPTY_VALUE)) MTSstart2=-1;
   if(MTSstart2<0) MTSSignal2= -1;                                         //������ Sell 
   if(MTSstart2>0) MTSSignal2 = 1;                                         // ������ Buy
   return(MTSSignal2);
}

bool TimeFilter(){

 bool _res = false;
   datetime _time_curent = TimeCurrent();
   datetime _time_start = StrToTime(DoubleToStr(Year(),0)+"."+DoubleToStr(Month(),0)+"."+DoubleToStr(Day(),0)+" "+StartHour);
   datetime _time_stop = StrToTime(DoubleToStr(Year(),0)+"."+DoubleToStr(Month(),0)+"."+DoubleToStr(Day(),0)+" "+EndHour);
   if(((Trade_in_Monday==true) && (TimeDayOfWeek(Time[0]) == 1)) ||
   ((Trade_in_Tuesday==true) && (TimeDayOfWeek(Time[0]) == 2)) ||
   ((Trade_in_Wednesday==true) && (TimeDayOfWeek(Time[0]) == 3)) ||
   ((Trade_in_Thursday==true) && (TimeDayOfWeek(Time[0]) == 4)) ||
   ((Trade_in_Friday==true) && (TimeDayOfWeek(Time[0]) == 5)))
   
   
   if(_time_start > _time_stop){
      if(_time_curent >= _time_start || _time_curent <= _time_stop) _res = true;
   }else   
      if(_time_curent >= _time_start && _time_curent <= _time_stop) _res = true;
      
      return(_res); 
  
 }    
        
