//+------------------------------------------------------------------+
//|                                                    36.ALLWIN.mq4 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                                                       ALLWIN.mq4 |
//|                        RODOLFO LEONARDO DE MORAIS                |
//|                                      rodolfo.leonardo@gmail.com  |
//+------------------------------------------------------------------+
#property copyright " RODOLFO LEONARDO DE MORAIS "
#property link      "rodolfo.leonardo@gmail.com "
#property version   "1.00"
#property description "ALL WIN -  13/02/2018"
#property description "================================================================"
#property description "Robo 100% FREE sem restrições"
#property description "rodolfo.leonardo@gmail.com"
#property strict
//--- input parameters
extern bool chartDisplay = TRUE; // Habilita informações na tela
extern color   background_color = Teal; // Cor de fundo das informações

input int      InpSize=3;           // Tamanho do Passo in Pips
input int      InpTake=3;           // Take Profit in Pips
input int      InpLots=0;           // Lot Percent [0 for Minimum Size]
input int      InpFactor=30;        // Lot Increment Percent [Exponent Factor]
input int      InpTarget=0;         // Daily Target in Money [0 means no Target]
int      InpEdge=0;           // Hedge After Level [0 means no Hedging]
input int      MaxSpread = 10;       // Max Spread p/ Abertura de Posição 

//---
int MagicNumber=8766;
int SlipPage=3;
int Spread=2.0;

//---

extern bool UseEquityStop = TRUE;        // Usar EquityStop?
extern double TotalEquityRisk = 20.0;     // Risco Total para EquityStop

/////////////////////////////////////////////////////
extern string FFCall = "Noticias FFCall";

extern int MinsBeforeNews = 60; // mins before an event to stay out of trading
extern int MinsAfterNews  = 20; // mins after  an event to stay out of trading
extern bool UseFFCall = true;
extern bool IncludeHigh = true;
bool NewsTime;


///////////////////////////////////////////////
extern string TimeFilter__ = "Filtro de Data e Hora";
extern bool UtilizeTimeFilter =true; 
extern bool Trade_in_Monday  =true; 
extern bool Trade_in_Tuesday =true; 
extern bool Trade_in_Wednesday=true;
extern bool Trade_in_Thursday=true; 
extern bool Trade_in_Friday  =true;

extern string StartHour = "00:00"; 
extern string EndHour   = "23:59";  

string m_symbol;
bool m_hedging,m_target_filter;
int m_direction,m_current_day,m_previous_day;
double m_factor,m_pip,m_size,m_take,m_spread;
double m_level,m_buyer,m_seller,m_target,m_profit;
int vSpread;
bool vInitPainel = true;
string vFiltrosAtivos ="";
int vTimeDayOfWeek = -1;

 // Function to check if it is news time
 void NewsHandling()
 {
     static int PrevMinute = -1;

     if (Minute() != PrevMinute)
     {
         PrevMinute = Minute();
    
     // Use this call to get ONLY impact of previous event
     int impactOfPrevEvent = 
            iCustom(NULL, 0, "FFCal", true, true, false, true, true, 2, 0);

     // Use this call to get ONLY impact of nexy event
     int impactOfNextEvent = 
            iCustom(NULL, 0, "FFCal", true, true, false, true, true, 2, 1);

         int minutesSincePrevEvent =
             iCustom(NULL, 0, "FFCal", true, true, false, true, false, 1, 0);
 
         int minutesUntilNextEvent =
             iCustom(NULL, 0, "FFCal", true, true, false, true, false, 1, 1);
 
         NewsTime = false;
         if ((minutesUntilNextEvent <= MinsBeforeNews) || 
             (minutesSincePrevEvent <= MinsAfterNews))
         {
             NewsTime = true;
         }
     }
 }//newshandling
 
 
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit() {
   //---
   m_symbol=Symbol();
   m_factor=1.0+InpFactor/100.0;
   m_pip=1.0/MathPow(10,Digits-1);
   m_size=InpSize*m_pip;
   m_take=InpTake*m_pip;
   m_hedging=false;
   m_target_filter=false;
   m_direction=0;
   if(InpEdge>0) {
      m_spread=Spread*m_pip;
   } else m_spread=0.0;
   //---
   printf("xBest - Grid Hedging Expert Advisor");
   return(INIT_SUCCEEDED);
}
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason) {
   //---
}


void Informacoes() {
   double Ld_0;
   double Ld_8;
   double Ld_16;
   double Ld_24;
   double Ld_32;
   double Ld_40;
   double Ld_48;
   double Ld_56;
   string Ls_64;
   string Ls_72;
   int Li_84;

   if ( !IsOptimization())
    {
     
      Ls_64 = "==========================\n";
      Ls_64 = Ls_64 + "               " + "ALL WIN v1" + "\n";
      Ls_64 = Ls_64 + "==========================\n";
      Ls_64 = Ls_64 + "  Corretora:           " + AccountCompany() + "\n" ;
      Ls_64 = Ls_64 + "  Horário da corretora:" + TimeToStr(TimeCurrent(), TIME_DATE|TIME_SECONDS) + "\n"; 
      Ls_64 = Ls_64 + "  Moeda: " + AccountCurrency()   + "\n" ;
      Ls_64 = Ls_64 + "==========================\n";
      Ls_64 = Ls_64 + "  Tamanho Passo : " + InpSize + " Pips \n";
      Ls_64 = Ls_64 + "  TakeProfit: " + InpTake + " Pips \n";
      Ls_64 = Ls_64 + "  Porcentagem Lot : " + InpLots + " % \n";
      Ls_64 = Ls_64 + "  Exponent Factor: " + InpFactor + " pips\n";
      Ls_64 = Ls_64 + "  Daily Target: " + InpTarget + "\n";
      Ls_64 = Ls_64 + "  Hedge After Level: " + InpEdge + " \n";
      Ls_64 = Ls_64 + "  MaxSpread: " +  MaxSpread  + " pips\n";
      Ls_64 = Ls_64 + "==========================\n";
      Ls_64 = Ls_64 + "  Ordens Abertas :   " + string(CountTrades() ) + " \n";
      Ls_64 = Ls_64 + "  Spread: " + MarketInfo(Symbol(), MODE_SPREAD) + " \n";
      Ls_64 = Ls_64 + "  Lucro/Perda: " + DoubleToStr(CalculateProfit(), 2) + " \n";
      Ls_64 = Ls_64 + "  Equidade:      " + DoubleToStr(AccountEquity(), 2) + " \n";
      Ls_64 = Ls_64 + " ==========================\n";
      Ls_64 = Ls_64 + " EquityStopFilter : "+ UseEquityStop + " \n";
      Ls_64 = Ls_64 + " TotalEquityRisk : "+  DoubleToStr(TotalEquityRisk, 2) + " \n";
      Ls_64 = Ls_64 + " NewsFilter : "+ UseFFCall + " \n";
      Ls_64 = Ls_64 + " TimeFilter : "+ UtilizeTimeFilter + " \n";
      Ls_64 = Ls_64 + " ==========================\n";
      Ls_64 = Ls_64 + vFiltrosAtivos;

      
      
      Comment(Ls_64);
      Li_84 = 14;
    
      if (vInitPainel || Seconds() % 5 == 0) {
         vInitPainel = FALSE;
         for (int count_88 = 0; count_88 < 9; count_88++) {
            for (int count_92 = 0; count_92 < Li_84; count_92++) {
               ObjectDelete("background" + count_88 + count_92);
               ObjectDelete("background" + count_88 + ((count_92 + 1)));
               ObjectDelete("background" + count_88 + ((count_92 + 2)));
               ObjectCreate("background" + count_88 + count_92, OBJ_LABEL, 0, 0, 0);
               ObjectSetText("background" + count_88 + count_92, "n", 30, "Wingdings", background_color);
               ObjectSet("background" + count_88 + count_92, OBJPROP_XDISTANCE, 20 * count_88);
               ObjectSet("background" + count_88 + count_92, OBJPROP_YDISTANCE, 23 * count_92 + 9);
            }
         }
      }
   }
}

//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick() {
  
   //--- Variable Declaration
   int index,orders_total,order_ticket,order_type,ticket,hour;
   double volume_min,volume_max,volume_step,lots;
   double account_balance,margin_required,risk_balance;
   double order_open_price,order_lots;
   
   //--- Variable Initialization
   int buy_ticket=0,sell_ticket=0;
   int buyer_counter=0,seller_counter=0;
   bool was_trade=false, close_filter=false;
   bool long_condition=false,short_condition=false;
   double orders_profit=0.0,level=0.0;
   double buyer_lots=0.0,seller_lots=0.0;
   double buyer_sum=0.0,seller_sum=0.0;
   double buy_price=0.0,sell_price=0.0;
   double bid_price=Bid,ask_price=Ask;
   datetime time_current=TimeCurrent();

    if(chartDisplay)
       Informacoes();
 
   RefreshRates();
   vFiltrosAtivos ="";
   
    //FILTRO SPREAD
    vSpread = MarketInfo(Symbol(), MODE_SPREAD);
    if (vSpread > MaxSpread) {
        vFiltrosAtivos += "Filtro MaxSpread ATIVO \n";
        return  ;
     
     }
    
    
   //FILTRO NOTICIAS
    NewsHandling();
    if(NewsTime && UseFFCall) {
       vFiltrosAtivos += "Filtro Noticias ATIVO \n";
       return;
    
    }
    
    if(UtilizeTimeFilter && !TimeFilter()){
      vFiltrosAtivos += "Filtro TimeFilter ATIVO \n";
    }
    
  if(vTimeDayOfWeek == TimeDayOfWeek(Time[0])){
       vFiltrosAtivos += "DIA Rebaixamento ATIVO \n";
       return;
    
    }
 
   
   //--- Base Lot Size
   account_balance=AccountBalance();
   volume_min=SymbolInfoDouble(m_symbol,SYMBOL_VOLUME_MIN);
   volume_max=SymbolInfoDouble(m_symbol,SYMBOL_VOLUME_MAX);
   volume_step=SymbolInfoDouble(m_symbol,SYMBOL_VOLUME_STEP);
   if(InpLots>0) {
      risk_balance=InpLots*AccountBalance()/100.0;
      margin_required=MarketInfo(m_symbol,MODE_MARGINREQUIRED);
      lots=MathRound(risk_balance/margin_required,volume_step);
      if(lots<volume_min) lots=volume_min;
      if(lots>volume_max) lots=volume_max;
   } else lots=volume_min;
   
   //--- Daily Calc
   m_current_day=TimeDayOfWeek(time_current);
   if(m_current_day!=m_previous_day) {
      m_target_filter=false;
      m_target=0.0;
   }
   m_previous_day=m_current_day;
   
   //--- Calculation Loop
   orders_total=OrdersTotal();
   for(index=orders_total-1;index>=0;index--) {
      if(!OrderSelect(index,SELECT_BY_POS,MODE_TRADES)) continue;
      if(OrderMagicNumber()!=MagicNumber||OrderSymbol()!=m_symbol) continue;
      order_open_price=OrderOpenPrice(); order_ticket=OrderTicket();
      order_type=OrderType(); order_lots=OrderLots(); 
      //---
      if(order_type==OP_BUY) {
         //--- Set Last Buy Order
         if(order_ticket>buy_ticket) {
            buy_price=order_open_price;
            buy_ticket=order_ticket;
         }
         buyer_sum+=(order_open_price+m_spread)*order_lots;
         buyer_lots+=order_lots;
         buyer_counter++;
      }
      //---
      if(order_type==OP_SELL) {
         //--- Set Last Sell Order
         if(order_ticket>sell_ticket) {
            sell_price=order_open_price;
            sell_ticket=order_ticket;
         }
         seller_sum+=(order_open_price-m_spread)*order_lots;
         seller_lots+=order_lots;
         seller_counter++;
      }
      //---
      orders_profit+=OrderProfit();
   }
   
   //--- Daily Calc
   if(orders_total==0) {
      m_target+=m_profit;
      m_hedging=false;
   }
   m_profit=orders_profit;
   
   //--- Close Conditions
   if(InpTarget>0&&m_target+orders_profit>=InpTarget) m_target_filter=true;
   //--- This ensure that buy and sell positions close at the same time when hedging is enabled
   if(m_hedging&&((m_direction>0&&bid_price>=m_level)||(m_direction<0&&ask_price<=m_level))) close_filter=true;
   
   //--- Close All Orders on Conditions
   if(m_target_filter||close_filter) {
      orders_total=OrdersTotal();
      for(index=orders_total-1;index>=0;index--) {
         if(!OrderSelect(index,SELECT_BY_POS,MODE_TRADES)) continue;
         if(OrderMagicNumber()!=MagicNumber||OrderSymbol()!=m_symbol) continue;
         order_type=OrderType();
         if(order_type==OP_BUY) OrderClose(OrderTicket(),OrderLots(),bid_price,SlipPage);
         if(order_type==OP_SELL) OrderClose(OrderTicket(),OrderLots(),ask_price,SlipPage);
      }
      return;
   }
   
   //--- Open Trade Conditions
   if(!m_hedging) {
      if(orders_total>0) {
         if (buyer_counter>0&&buy_price-ask_price>=m_size) long_condition = true;
         if (seller_counter>0&&bid_price-sell_price>=m_size) short_condition = true;
      } else {
         hour=TimeHour(time_current);
         //////////////////////////////////////////////////
         if(!UtilizeTimeFilter || (UtilizeTimeFilter &&  TimeFilter())) {
            if (iOpen(NULL,0,0)>iMA(NULL,0,3,0,MODE_EMA,PRICE_OPEN,0)) long_condition=true;
            if (iOpen(NULL,0,0)<iMA(NULL,0,3,0,MODE_EMA,PRICE_OPEN,0)) short_condition=true;
         }
      }
   } else {
      if(m_direction>0&&bid_price<=m_seller) short_condition=true;
      if(m_direction<0&&ask_price>=m_buyer) long_condition=true;
   }
   
     //FILTRO DE REBAIXAMENTO
    double vProfit = CalculateProfit();
    
    if (UseEquityStop) {
      if (vProfit < 0.0 && MathAbs(vProfit) > TotalEquityRisk / 100.0 * AccountEquity()) {
      
         vFiltrosAtivos += "Filtro EquityStop ATIVO \n";
        vTimeDayOfWeek = TimeDayOfWeek(Time[0]);
      //  if(!m_hedging){
      //    if(long_condition){
      //     m_seller=bid_price;
      //   m_hedging=true;
      //      return;
      //      }
      //    if(short_condition)  {
      //   m_buyer=ask_price;
      //   m_hedging=true;
      //   return;
      //}}
           
         //return;
      }else{vTimeDayOfWeek = -1;}
   }
   //--- Hedging
   if(InpEdge>0&&!m_hedging) {
      if(long_condition&&buyer_counter==InpEdge) {
         m_seller=bid_price;
         m_hedging=true;
         return;
      }
      if(short_condition&&seller_counter==InpEdge) {
         m_buyer=ask_price;
         m_hedging=true;
         return;
      }
   }
   
   //--- Lot Size
   lots=MathRound(lots*MathPow(m_factor,orders_total),volume_step);
   if(m_hedging) {
      if(long_condition) lots=MathRound(seller_lots*m_factor,volume_step)-buyer_lots;
      if(short_condition) lots=MathRound(buyer_lots*m_factor,volume_step)-seller_lots;
   }
   if(lots<volume_min) lots=volume_min;
   if(lots>volume_max) lots=volume_max;
   
   //--- Open Trades Based on Conditions
   if(long_condition) {
      if(buyer_lots+lots==seller_lots) lots=seller_lots+volume_min;
      ticket=OpenTrade(OP_BUY,lots,ask_price);
      if(ticket>0) {
         OrderSelect(ticket,SELECT_BY_TICKET);
         order_open_price=OrderOpenPrice(); buyer_sum+=order_open_price*lots; buyer_lots+=lots;
         m_level=NormalizeDouble((buyer_sum-seller_sum)/(buyer_lots-seller_lots),Digits)+m_take;
         if(!m_hedging) level=m_level; else level=m_level+m_take;
         if(buyer_counter==0) m_buyer=order_open_price;
         m_direction=1; was_trade=true;
      }
   }
   if(short_condition) {
      if(seller_lots+lots==buyer_lots) lots=buyer_lots+volume_min;
      ticket=OpenTrade(OP_SELL,lots,bid_price);
      if(ticket>0) {
         OrderSelect(ticket,SELECT_BY_TICKET);
         order_open_price=OrderOpenPrice(); seller_sum+=order_open_price*lots; seller_lots+=lots;
         m_level=NormalizeDouble((seller_sum-buyer_sum)/(seller_lots-buyer_lots),Digits)-m_take;
         if(!m_hedging) level=m_level; else level=m_level-m_take;
         if(seller_counter==0) m_seller=order_open_price;
         m_direction=-1; was_trade=true;
      }
   }
   
   //--- Setup Global Take Profit
   if(was_trade) {
      orders_total=OrdersTotal();
      for(index=orders_total-1;index>=0;index--) {
         if(!OrderSelect(index,SELECT_BY_POS,MODE_TRADES)) continue;
         if(OrderMagicNumber()!=MagicNumber||OrderSymbol()!=m_symbol) continue;
         order_type=OrderType();
         if(m_direction>0) {
            if(order_type==OP_BUY) OrderModify(OrderTicket(),OrderOpenPrice(),0.0,level,0);
            if(order_type==OP_SELL) OrderModify(OrderTicket(),OrderOpenPrice(),level,0.0,0);
         }
         if(m_direction<0) {
            if(order_type==OP_BUY) OrderModify(OrderTicket(),OrderOpenPrice(),level,0.0,0);
            if(order_type==OP_SELL) OrderModify(OrderTicket(),OrderOpenPrice(),0.0,level,0);
         }      
      }
   }
}
//+------------------------------------------------------------------+
int OpenTrade(int cmd, double volume, double price, double stop=0.0, double take=0.0) {
   return OrderSend(m_symbol,cmd,volume,price,SlipPage,stop,take,NULL,MagicNumber,0);
}
double MathRound(double x, double m) { return m*MathRound(x/m); }
double MathFloor(double x, double m) { return m*MathFloor(x/m); }
double MathCeil (double x, double m) { return m*MathCeil (x/m); }


int CountTrades() {
   int l_count_0 = 0;
   for (int l_pos_4 = OrdersTotal() - 1; l_pos_4 >= 0; l_pos_4--) {
      if( !OrderSelect(l_pos_4, SELECT_BY_POS, MODE_TRADES) ){ continue; }
      if (OrderSymbol() != Symbol() || OrderMagicNumber() != MagicNumber) continue;
      if (OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber)
         if (OrderType() == OP_SELL || OrderType() == OP_BUY) l_count_0++;
   }
   return (l_count_0);
}

double CalculateProfit() {
   double ld_ret_0 = 0;
   for (int g_pos_344 = OrdersTotal() - 1; g_pos_344 >= 0; g_pos_344--) {
      if( !OrderSelect(g_pos_344, SELECT_BY_POS, MODE_TRADES) ){ continue; }
      if (OrderSymbol() != Symbol() || OrderMagicNumber() != MagicNumber) continue;
      if (OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber)
         if (OrderType() == OP_BUY || OrderType() == OP_SELL) ld_ret_0 += OrderProfit();
   }
   return (ld_ret_0);
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


        

