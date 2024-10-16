//+------------------------------------------------------------------+
//|         76.Championship_2010_v2avoitenko 22_1 ATR&Fractal_22.mq4 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
//+==============================================================================================+
//|                                                                     Championship_2010_v2.mq4 |
//|                                                                                    avoitenko |
//|                                                    https://login.mql5.com/ru/users/avoitenko |
//+==============================================================================================+
#property copyright  ""
#property link       "http://logicmanslaboratory.0pk.ru/"
#property link       "http://fxmts.net/files/"
#property link       "LogicMansLaboratory"
#import              "KillLoss.ex4" 
       void KillLoss(int iTicket, double dSpeedCoeff);   
#import
//+----------------------------------------------------------------------------------------------+
//|  ������� ���������                                                                           |
//+----------------------------------------------------------------------------------------------+
extern string  General            =    "=== �������� ��������� ===";
extern int     PERIOD             =    225; // (220)   ������ �������                           250, 280                   
extern int     STOP_LOSS          =    150; // (150)   ������� ���� �����                        80                     
extern int     TAKE_PROFIT        =    183; // (180)   ������� ���� �������                     150                  
extern int     INSIDE_LEVEL       =     45; // (45)    ������� �������� ������ ������            40           
extern int     TRAILING_STOP      =     25; // (25)    ������� �������� �����                    20                  
extern int     TRAILING_STEP      =      6; // (10)    ��� ����������� �������� �����            10          
extern int     ORDER_STEP         =      5; // (5)     ��� ����������� ����������� ������        10       
extern int     SLIPPAGE           =      6; // (2)     ���������������                            
extern int     �������            =      2; // (80)    ������ ������������� ����������� ������    5  
extern int     ����������         =      1; // (50)    ������ ����������� ������                 60               
//-----------
extern string  General_Lots       =    "=== ��������� �������� ===";
extern bool    UseMoneyManagement =   true; // (true)  ��������� ��������
extern double  Risk               =    2.0; // (2.0)   ���� (����� ������ �� ���)
extern double  Lots               =    0.1; // (0.1)   ���  (�������� ����)
extern double  LotsMin            =      0; // (0.1)   ���� ==0, ������ ������������� 
extern double  LotsMax            =      0; // (1.0)   ���� ==0, ������ ������������� 
extern int     MAGIC_NUMBER       =    867; // (867)
extern string  Additional         =    "=== �������������� ��������� ===";
extern bool    PRINT_REPORT       =  false; // (false) ����� � ������ �������� �������� ���������
extern bool    multi              =  false; // (false) false - ������ �� ������ ������ ��� � ����
//-----------
extern bool    kill_loss          =  false; // (false) ��������� ���������� ������������ ����� ��� ����������� ������������� ���� � �����.if(dStopPrice < (OrderStopLoss()-OrderOpenPrice())/1.1), ����� ����. 1.1 ������ ������ ����> 1.  
extern double  koef_kill          =    3.0; // (3.0)   ��� koef_kill>1 ����� ������� ����� � ��������� ����� ������� � ������� �����-  
                                            //         ���� ��������� �����, ��� koef_kill<1 - ��������, ����� � ��������� ���������
//-----------
extern bool    BezUbit            =  false; // (false) ������� � ���������
extern int     iProfit            =     18; // (18)    ��� ���������� ������� �������� � iProfit ������� �������� ����������� � ��������� + iZepoPlus ������� 
extern int     iZepoPlus          =      1; // (1)     ���� �� ������ ������ ������ �� ����� "������" ��������, �.�. ���� ����� �������� ��� ������� ������� � ���� - ��� �������� 
//-----------
extern string  General_ATR        =    "=== ��������� ����� ATR ===";
extern bool    Trail_ATR          =  false; // (false) true - ��������� ����� �� ATR,  
extern int     atr_timeframeATR   =     30; // (30)    15 ���������, �� �������� �������������� �������� ATR
extern int     atr1_periodATR     =      8; // (8)     4 ������ "���������" ATR,
extern int     atr1_shiftATR      =      1; // (1)     1 - ATR � �������� 5 ������� �� ���������� ���� (�1),
extern int     atr2_periodATR     =     20; // (20)    17,25 ������ "��������" ATR,
extern int     atr2_shiftATR      =      1; // (1)     1 - ������ ATR ����� ������������ �� ���������� ����,
extern double  coeffATR           =    1.2; // (1.2)   �����������, �� ������� ������ ATR - � ������ ������ �������� ����� ����������� �� ���������� � (1.1*ATR)
       bool    trlinlossATR       =  false; // (false) ��������� ����, ������� �� ������������ �������� �� �������� �������
//-----------
extern string  General_Fractal    =    "=== ��������� ����� Fractal ===";
extern bool    Trail_Fractals     =   true; // (true)  true- ��������� ����� �� Fractal
extern int     tmfrm_F            =     60; // (60)    ������ �������  , �� ��������� �������� ���������� "������������" (SL=150)
extern int     frktl_bars_F       =      5; // (5)     3 ���������� ����� � ������� ��������
extern int     indent_F           =      2; // (2)     ������ �� ����� (�������), �� ������� ����������� ��������.
       bool    trlinloss_F        =  false; // (false) trlinloss - ������� �� ������������� �������� �� �������� ������� (�� ��������� ��������� �� ����� ��������)
                                            //         false - �������� �������� "���������", ������ ����� �� "�����" ����� ��������, 
                                            //         true - ������ �� �����, ������� ���������� �������� �� ��� ���������� ��������� � ����� �������� 
                                            //         ("��������" ����), � ����� � �������. 
//+----------------------------------------------------------------------------------------------+
//|  ���������� ����������                                                                       |
//+----------------------------------------------------------------------------------------------+
int     stop_loss;           // ���� ����
int     take_profit;         // ���� ������
int     inside_level;        // �������� �������� ���� ������ ������
int     trailing_level;      // ������� �������� �����
int     trailing_step;       // ��� �������� �����
int     order_step;          // ��� ����������� ������
int     slippage;            // ���������������
double  lot;                 // ���
//---
bool    buy_open    = false; // ���� ������������� �������� ������� �� ������� (��� ������ ��������)
bool    sell_open   = false; // ���� ������������� �������� ������� �� ������� (��� ������ ��������)
double  CalcHigh;            // ������� �������������
double  CalcLow;             // ������� ���������
//---
double  order_open_price;    // ���� �������� ������
double  spread;              // �������� ������
int     stop_level;          // ����������� ������ �� ���� ��� ��������� ���� ����� / ���� �������
int     order_type;          // ��� ������
int     order_ticket;        // ����� ������ 
int     orders_total;
double  order_stop_loss;
double  sl;
double  tp;
double  target;
double  price;
string  err_msg;
bool    start;
bool    alert;
double  margin;
double  kanal;
bool    bez_ubit;
int     STOPLEVEL,n,DIGITS;
double  BID,ASK,POINT;
string  SymbolTral,TekSymbol;
static datetime  sdtPrevtime = 0;
//+----------------------------------------------------------------------------------------------+
//|  ������� ������������� ��������                                                              |
//+----------------------------------------------------------------------------------------------+
int init()
//+----------------------------------------------------------------------------------------------+
{
   start = true;
   alert = false; // ��������� ��������� ���������� (��� ������ ��������)
//--- �������� ������� �������
   if(PERIOD < 3)
   {
      err_msg = "������, ������� ����� �������� PERIOD = " + DoubleToStr(PERIOD,0) + " ���������� �������� >= 3";
      start = false;
   }
//--- �������� �������� ���� �����
   if(STOP_LOSS <= 0) 
   {
      err_msg = "������, ������� ����� �������� STOP_LOSS = " + DoubleToStr(STOP_LOSS,0) + " ���������� �������� > 0";
      start = false;
   }
//--- �������� �������� ���� �������
   if(TAKE_PROFIT<0)
   {
      err_msg = "������, ������� ����� �������� TAKE_PROFIT = " + DoubleToStr(TAKE_PROFIT,0) + " ���������� �������� >= 0";
      start = false;
   }
//--- �������� ������ �������� ������ ������
   if(INSIDE_LEVEL<1)
   {
      err_msg = "������, ������� ����� �������� INSIDE_LEVEL = " + DoubleToStr(INSIDE_LEVEL,0) + " ���������� �������� >= 1";
      start = false;
   }
//--- �������� ������ �������� �����
   if(TRAILING_STOP<0)
   {
      err_msg = "������, ������� ����� �������� TRAILING_STOP = " + DoubleToStr(TRAILING_STOP,0) + " ���������� �������� >= 0";
      start = false;
   }
//--- �������� ���� ����������� �������� �����   
   if(TRAILING_STEP < 0)
   {
      err_msg = "������, ������� ����� �������� TRAILING_STEP = " + DoubleToStr(TRAILING_STEP,0) + " ���������� �������� >= 0";
      start = false;
   }
//---   
   if(TRAILING_STEP > TRAILING_STOP)
   {
      err_msg = "������, ������� ����� �������� TRAILING_STEP = " + DoubleToStr(TRAILING_STEP,0) + " ���������� �������� < TRAILING_STOP";
      start = false;
   }
//--- �������� ���� ����������� ����������� ������
   if(ORDER_STEP<0)
   {
      err_msg = "������, ������� ����� �������� ORDER_STEP = " + DoubleToStr(ORDER_STEP,0) + " ���������� �������� >=0";
      start = false;
   }
//--- �������� ���������������
   if(SLIPPAGE<0)
   {
      err_msg = "������, ������� ����� �������� SLIPPAGE = " + DoubleToStr(SLIPPAGE,0) + " ���������� �������� >=0";
      start = false;
   }
//---
   stop_loss      =  STOP_LOSS;
   take_profit    =  TAKE_PROFIT;
   inside_level   =  INSIDE_LEVEL;
   trailing_level =  TRAILING_STOP;
   trailing_step  =  TRAILING_STEP;
   slippage       =  SLIPPAGE;
   order_step     =  ORDER_STEP;
   bez_ubit       =  BezUbit;
//--- ���� ���� ������� �� 3-x / 5-� ����
   if(Digits == 3 || Digits == 5)
   {
      stop_loss      = stop_loss      * 10;
      take_profit    = take_profit    * 10;
      inside_level   = inside_level   * 10;
      trailing_level = trailing_level * 10;
      trailing_step  = trailing_step  * 10;
      slippage       = slippage       * 10;
      order_step     = order_step     * 10;
      iProfit        = iProfit        * 10;    
      iZepoPlus      = iZepoPlus      * 10;  
      indent_F       = indent_F       * 10; // ��� ��������
   }
   start();
   return(0);
}
//+----------------------------------------------------------------------------------------------+
//|  ������� ��������������� ��������                                                            |
//+----------------------------------------------------------------------------------------------+
int deinit()
//+----------------------------------------------------------------------------------------------+
  {
   return(0);
  }
//+----------------------------------------------------------------------------------------------+
//|  �������� ������� ��������                                                                   |
//+----------------------------------------------------------------------------------------------+
int start()
//+----------------------------------------------------------------------------------------------+
  {
   if(!IsExpertEnabled() && !IsTesting())
   {
      err_msg = "��������������: ������ ��������� �� ���������. ����������, ������� ������ \"Expert Advisors\"";
      start=false;
   } 
//--- ���� ���� ������ � ��������� ������� ����������, ����� - �����
   if(!start)
   {
      if(!alert)
      {
         Alert("������ ������� ������ ���������","\n",err_msg);
         Print(err_msg);
         alert=true;
      }
      return(-1);
   }
//--- �������� ������� ������������ ������ ��� ���������� M5
   if(iBars(Symbol(), PERIOD_M5) < PERIOD)
   {
      Print("������������ ������������ ������ ��� ��������");
      return;
   }
//--- ��������� ������ �������� High � Low
   else
   {
//--- ���������� �������� � ���������
      CalcHigh = 0.0;
      CalcLow  = 0.0;
      
      int high_index = iHighest(Symbol(), PERIOD_M5, MODE_HIGH, PERIOD,0);
      int low_index = iLowest(Symbol(), PERIOD_M5, MODE_LOW, PERIOD,0);
      
      CalcHigh = iHigh(Symbol(), PERIOD_M5, high_index);
      CalcLow  =  iLow(Symbol(), PERIOD_M5, low_index);
      kanal=(CalcHigh-CalcLow)/Point;
   }

//--- �����, ���� CalcHigh � CalcLow �� ���������
   if(CalcHigh < Point || CalcLow < Point) return;

//--- ���������� ����������
   stop_level = MarketInfo(Symbol(),MODE_STOPLEVEL);
   spread =  NormalizeDouble(Ask - Bid,Digits  );
     
Comment("\n",
        " MAX CalcHigh =  ",CalcHigh,"\n",
        " MIN  CalcLow =  ",CalcLow , "\n",
        " ����� =  ",kanal , "\n",
        " spread  =  ", spread , "\n",
        " stop_level  =  ", stop_level  , "\n"
        );

//--- ������� �������� ������ ������
   if(Ask <= NormalizeDouble(CalcHigh - inside_level * Point, Digits)) buy_open  = true;
   if(Bid >= NormalizeDouble(CalcLow  + inside_level * Point, Digits)) sell_open = true;
//--- ��������� ����������� �������
     WorkOrders();

//--- ��������� ���������� �������
   WorkWithPendidngOrders();

//--- ����������� ������ ����������� ������ �� �������
   if(buy_open) OpenOrderBuyStop();

//--- ����������� ������ ����������� ������ �� �������
   if(sell_open) OpenOrderSellStop();

   return(0);
 }
//+----------------------------------------------------------------------------------------------+
//|  ��������� ����������� �������                                                               |
//+----------------------------------------------------------------------------------------------+
void WorkOrders(){
//--- ��������� �������� �������  
   double dBid1 = MarketInfo(OrderSymbol(),MODE_BID);
   double dAsk1 = MarketInfo(OrderSymbol(),MODE_ASK);  
   for (int i=0;i<OrdersTotal();i++)
    {
         if (!OrderSelect(i,SELECT_BY_POS,MODE_TRADES)) break;
         if (OrderMagicNumber()!=MAGIC_NUMBER || OrderSymbol()!=Symbol()) continue;
         if (OrderType()==OP_BUY||OrderType()==OP_SELL)     
         { 
           if(Trail_ATR)TrailingByATR(OrderTicket() ,atr_timeframeATR,atr1_periodATR,atr1_shiftATR,atr2_periodATR,atr2_shiftATR,coeffATR,trlinlossATR);else  
              WorkWithPositions(); 
            if(bez_ubit)SL2BreakevenIf(OrderTicket());
            if(Trail_Fractals) TrailingByFractals(OrderTicket(),tmfrm_F ,frktl_bars_F ,indent_F ,trlinloss_F ); else WorkWithPositions(); 
         }
      if(kill_loss) 
   {    
   // ������� ���������� ����� ������ � ����������
   if (OrderType()==OP_BUY) {double dStopPrice = dBid1 - OrderStopLoss();if( dStopPrice < (OrderOpenPrice()-OrderStopLoss())/1.1) KillLoss( OrderTicket(),0.5);}
   if (OrderType()==OP_SELL){dStopPrice = (OrderStopLoss() + MarketInfo(OrderSymbol(),MODE_SPREAD)*MarketInfo(OrderSymbol(),MODE_POINT)) - dAsk1;      
                                if(dStopPrice < (OrderStopLoss()-OrderOpenPrice())/1.1) KillLoss( OrderTicket(),koef_kill);} // koef_kill ����.��������� �����������
    } // if (kill_loss) 
       } // for 
}
//+----------------------------------------------------------------------------------------------+
//|  ����������� ���� �������� �������                                                           |
//+----------------------------------------------------------------------------------------------+
void WorkWithPositions()
//+----------------------------------------------------------------------------------------------+
{
            order_open_price = OrderOpenPrice();
            order_type       = OrderType();
            order_stop_loss  = OrderStopLoss();
            order_ticket     = OrderTicket();
            
            if(order_type == OP_BUY)
            {
               if(!multi)buy_open = false;   

               //--- �������� ����
               if(order_stop_loss == 0 || trailing_level == 0 || trailing_step == 0) return(0); // �������, ��� ������� �������� ���� �� ��������
   
               target = NormalizeDouble(MathMax(order_open_price, order_stop_loss) + trailing_level*Point, Digits);
 
               if(Bid > target)
               {
                  sl = MathMax(order_open_price, order_stop_loss) + trailing_step * Point;
     
                  if(OrderModify(order_ticket, order_open_price, sl, OrderTakeProfit(), 0, Blue))
                     if(PRINT_REPORT)Print("������� ���� ����� ������ Buy # ", order_ticket);  
                  else
                     if(PRINT_REPORT)Print("������ �������� ���� ����� ������ Buy #", order_ticket);
                  
                  Sleep(2000);
                  RefreshRates(); 
               }
            } // end OP_BUY

            else if(order_type == OP_SELL)
            {
               if(!multi) sell_open = false;

               //--- �������� ����
               if(order_stop_loss == 0 || trailing_level == 0 || trailing_step == 0) return(0);

               target = NormalizeDouble(MathMin(order_open_price, order_stop_loss) - trailing_level*Point, Digits);

               if(Ask < target)
               {
   
                  sl = MathMin(order_open_price, order_stop_loss) - trailing_step * Point;

                  if(OrderModify(order_ticket, order_open_price, sl, OrderTakeProfit(),0,Blue))
                     if(PRINT_REPORT)Print("������� ���� ����� Sell # ",order_ticket);
                  else
                     if(PRINT_REPORT)Print("������ �������� ���� ����� ������ Sell #",order_ticket);
                     
                  Sleep(2000);
                  RefreshRates(); 
               }
            } // end OP_SELL
}
//+----------------------------------------------------------------------------------------------+
//|  ������ � ����������� ��������                                                               |
//+----------------------------------------------------------------------------------------------+
void WorkWithPendidngOrders()
//+----------------------------------------------------------------------------------------------+
{
   //--- ��������� ���������� �������
   for(int pos=0; pos < OrdersTotal(); pos++)
   {
      if(OrderSelect(pos,SELECT_BY_POS,MODE_TRADES))
      {

         if( OrderSymbol() != Symbol() || OrderMagicNumber() != MAGIC_NUMBER) continue;
         
         order_ticket = OrderTicket();
         order_type = OrderType();
         order_open_price = OrderOpenPrice();
         
         if(order_type == OP_BUYSTOP)
         {
            buy_open = false;
            
            //--- ������� ��� ����������� ����������� ������
            if(( NormalizeDouble(CalcHigh - order_step *�������* Point + spread, Digits) < NormalizeDouble(order_open_price - order_step * Point + spread, Digits)) && 
               ( NormalizeDouble(CalcHigh - order_step *�������* Point + spread, Digits) > Ask + stop_level * Point))
            {

               price = NormalizeDouble(CalcHigh - order_step *�������* Point + spread, Digits);

               if(stop_loss == 0) sl = 0;
               else sl = NormalizeDouble(CalcHigh - order_step * Point - MathMax(stop_loss, stop_level) * Point, Digits);

               if(take_profit == 0) tp = 0;
               else tp = NormalizeDouble(CalcHigh - order_step * Point + MathMax(take_profit, stop_level) * Point, Digits);
               
               if (OrderModify(order_ticket, price, sl, tp, 0))
                  if(PRINT_REPORT)Print("������������� ����� BuyStop # ",order_ticket);
               else
                  if(PRINT_REPORT)Print("������ ����������� ������ BuyStop # ",order_ticket);

               Sleep(2000);
               RefreshRates(); 
            }
         } // end ORDER_TYPE_BUY_STOP  

         else if(order_type == OP_SELLSTOP)
           {
            sell_open = false;
            
            //--- ������� ��� ����������� ����������� ������
            if(( NormalizeDouble(CalcLow + order_step *�������* Point, Digits) > order_open_price + order_step * Point)&& 
               ( NormalizeDouble(CalcLow + order_step *�������* Point, Digits) < Bid - stop_level * Point))
              {
               price = NormalizeDouble(CalcLow + order_step *�������* Point, Digits);

               if(stop_loss == 0) sl = 0;
               else sl = NormalizeDouble(price + MathMax(stop_loss * Point, stop_level * Point) + spread, Digits);

               if(take_profit == 0) tp = 0;
               else tp = NormalizeDouble(price - MathMax(take_profit * Point, stop_level * Point) + spread, Digits);

               if (OrderModify(OrderTicket(), price, sl, tp, 0))
                  if(PRINT_REPORT)Print("������������� ����� SellStop # ",order_ticket);
               else
                  if(PRINT_REPORT)Print("������ ����������� ������ SellStop # ",GetLastError());
              
               Sleep(2000);
               RefreshRates(); 
              }
           } // end ORDER_TYPE_SELL_STOP   
        } // end order_ticket
     } // end for
  }
//+----------------------------------------------------------------------------------------------+
//|  ��������� ����������� ������ �� �������                                                     |
//+----------------------------------------------------------------------------------------------+
void OpenOrderBuyStop()
//+----------------------------------------------------------------------------------------------+
{
   lot =   GetLots();

   price = NormalizeDouble(CalcHigh - order_step *����������* Point, Digits);

   //--- ���� ��������� �������� ���� �������� ������ ����������� ������ � �������� ����, ����� ������������ ���� �������� ������
   if(NormalizeDouble(Ask + stop_level *����������* Point, Digits) > price) return(0); // price = NormalizeDouble(Ask + stop_level * Point, Digits);
  
   //--- ������ ���� �����
   if(stop_loss == 0) sl = 0;
   else sl = NormalizeDouble(price - MathMax(stop_loss, stop_level) * Point - spread, Digits);
   
   //--- ������ ���� �������
   if(take_profit == 0) tp = 0;
   else tp = NormalizeDouble(price + MathMax(take_profit, stop_level) * Point - spread, Digits);

   if(OrderSend(Symbol(), OP_BUYSTOP, lot, price, 0, sl, tp, "2010avoitenko", MAGIC_NUMBER, 0, Blue) >= 0)
   {
      buy_open = false;
      if(PRINT_REPORT)Print("������ ����� BuyStop #" + DoubleToStr(OrderTicket(),0));
   }
   else 
   {
      if(PRINT_REPORT)Print("������ �������� ������ BuyStop, ��� ������:" + GetLastError());
   }
   
   Sleep(2000);
   RefreshRates();
}
//+----------------------------------------------------------------------------------------------+
//|  ��������� ����������� ������ �� �������                                                     |
//+----------------------------------------------------------------------------------------------+
void OpenOrderSellStop()
//+----------------------------------------------------------------------------------------------+
  {
   lot =  GetLots();

   price = NormalizeDouble(CalcLow + order_step *����������* Point, Digits);
   
   //--- ���� ��������� �������� ���� �������� ������ ����������� ������ � �������� ����, ����� ������������ ���� �������� ������
   if(NormalizeDouble(Bid - stop_level *����������* Point, Digits) < price) return(0); // price = NormalizeDouble(Bid - stop_level * Point, Digits);
   
   //--- ������ ���� �����
   if(stop_loss == 0) sl = 0;
   else sl = NormalizeDouble(price + MathMax(stop_loss, stop_level)* Point + spread, Digits);
   
   //--- ������ ���� �������
   if(take_profit == 0) tp = 0;
   else tp = NormalizeDouble(price - MathMax(take_profit, stop_level) * Point + spread, Digits);

   if(OrderSend( Symbol(), OP_SELLSTOP, lot, price, 0, sl, tp, "2010avoitenko",MAGIC_NUMBER, 0, Blue)>=0)
   {
      sell_open = false;
      if(PRINT_REPORT)Print("������ ����� SellStop #" + DoubleToStr(OrderTicket(),0));
   }
   else 
   {
      if(PRINT_REPORT)Print("������ �������� ������ SellStop, ��� ������:" + GetLastError());
   }
   
   Sleep(2000);
   RefreshRates();
}
//+----------------------------------------------------------------------------------------------+
//|  ������ ����                                                                                 |
//+----------------------------------------------------------------------------------------------+
double GetLots() {
   double ld_ret_0;
   double ld_8;
   double l_lotstep_32;
   double l_marginrequired_40;
   if (UseMoneyManagement) {
      l_lotstep_32 = MarketInfo(Symbol(), MODE_LOTSTEP);
      l_marginrequired_40 = MarketInfo(Symbol(), MODE_MARGINREQUIRED);
      ld_ret_0 = AccountBalance() * Risk / 100.0 / l_marginrequired_40;
      ld_8 = MathMod(ld_ret_0, l_lotstep_32);
      if (ld_8 != 0.0) ld_ret_0 -= ld_8;
   } else ld_ret_0 = Lots;
   double l_minlot_16 =LotsMin;  if(LotsMin==0)  l_minlot_16 =  MarketInfo(Symbol(), MODE_MINLOT);
   double l_maxlot_24 =LotsMax;  if(LotsMax==0)  l_maxlot_24 =  MarketInfo(Symbol(), MODE_MAXLOT);
   if (ld_ret_0 < l_minlot_16) ld_ret_0 = l_minlot_16;
   if (ld_ret_0 > l_maxlot_24) ld_ret_0 = l_maxlot_24;
  /*if(AccountBalance()>2000)ld_ret_0 = 0.2;
  if(AccountBalance()>3000)ld_ret_0 = 0.3;
  if(AccountBalance()>4000)ld_ret_0 = 0.4; 
   */
   return (ld_ret_0);
}
//+----------------------------------------------------------------------------------------------+
//|  �������� �� ATR (Average True Range, ������� �������� ��������)                             |
//|  ������� ��������� ����� �������, ������ ��R � �����������, ��                              |
//|  ������� ���������� ATR. �.�. �������� "�������" �� ����������                               |
//|  ATR � N �� �������� �����; ������� - �� ����� ���� (�.�. �� ����                            |
//|  �������� ���������� ����)                                                                   |
//+----------------------------------------------------------------------------------------------+
void TrailingByATR(int ticket,int atr_timeframe,int atr1_period,int atr1_shift,int atr2_period,int atr2_shift,double coeff,bool trlinloss)
   {      
   // ��������� ���������� ��������
   // Print("ticket: ",ticket,", atr1_period: ",atr1_period,", atr2_period: ",atr2_period,", coeff: ",coeff,", OrderSelect(ticket,SELECT_BY_TICKET): ",OrderSelect(ticket,SELECT_BY_TICKET),", atr_timeframe: ",atr_timeframe,", atr1_shift: ",atr1_shift,", atr2_shift: ",atr2_shift);
   if ((ticket==0) || (atr1_period<1) || (atr2_period<1) || (coeff<=0) || (!OrderSelect(ticket,SELECT_BY_TICKET)) || 
   ((atr_timeframe!=1) && (atr_timeframe!=5) && (atr_timeframe!=15) && (atr_timeframe!=30) && (atr_timeframe!=60) && 
   (atr_timeframe!=240) && (atr_timeframe!=1440) && (atr_timeframe!=10080) && (atr_timeframe!=43200)) || (atr1_shift<0) || (atr2_shift<0))
      {
      Print("�������� �������� TrailingByATR() ���������� ��-�� �������������� �������� ���������� �� ����������.");
      return(0);
      }
   
   double curr_atr1; // ������� �������� ATR - 1
   double curr_atr2; // ������� �������� ATR - 2
   double best_atr;  // ������� �� �������� ATR
   double atrXcoeff; // ��������� ��������� �������� �� ATR �� �����������
   double newstop;   // ����� ��������
   
   // ������� �������� ATR-1, ATR-2
   curr_atr1 = iATR(Symbol(),atr_timeframe,atr1_period,atr1_shift);
   curr_atr2 = iATR(Symbol(),atr_timeframe,atr2_period,atr2_shift);
   
   // ������� �� ��������
   best_atr = MathMax(curr_atr1,curr_atr2);
   
   // ����� ��������� �� �����������
   atrXcoeff = best_atr * coeff;
              
   // ���� ������� ������� (OP_BUY)
   if (OrderType()==OP_BUY)
      {if(!multi)buy_open = false;  
      // ����������� �� �������� ����� (����� ��������)
      newstop = Bid - atrXcoeff;
      
      // ���� trlinloss==true (�.�. ������� ������� � ���� ������), ��
      if (trlinloss==true)
         {
         // ���������, �������� �� �� ����� �������� ���������, ���� ��, �� ��������� ������������
         if (newstop>OrderStopLoss())
         OrderModify(ticket,OrderOpenPrice(),newstop,OrderTakeProfit(),OrderExpiration());      
         }
      else
         {
         Print("Bid: ",Bid,", atrXcoeff: ",atrXcoeff,", newstop: ",newstop);
         // ����� ������� �������� ������ �����, ����� �������� ����� ����� �������� (� �������)
         if ((newstop>OrderStopLoss()) && (newstop>OrderOpenPrice()))
         OrderModify(ticket,OrderOpenPrice(),newstop,OrderTakeProfit(),OrderExpiration());         
         }
      }
      
   // ���� �������� ������� (OP_SELL)
   if (OrderType()==OP_SELL)
      {if(!multi) sell_open = false;
      // ����������� �� �������� ����� (����� ��������)
      newstop = Ask + (atrXcoeff + MarketInfo(Symbol(),MODE_SPREAD)*Point);
      
      // ���� trlinloss==true (�.�. ������� ������� � ���� ������), ��
      if (trlinloss==true)      
         {
         // ���� �������� �����������, �� ������ � ����� ������
         if (OrderStopLoss()==0)
         OrderModify(ticket,OrderOpenPrice(),newstop,OrderTakeProfit(),OrderExpiration()); 
         // ���� �������� � ������ ��� � �������, ������ ������ ���� ����� ���� ����� �������
         else
            {
            if (newstop<OrderStopLoss())
            OrderModify(ticket,OrderOpenPrice(),newstop,OrderTakeProfit(),OrderExpiration()); 
            }
         }
      else
         {
         // ���� �������� �����������, �� ������, ���� ���� ����� ��������
         if ((OrderStopLoss()==0) && (newstop<OrderOpenPrice()-MarketInfo(Symbol(),MODE_STOPLEVEL)*Point))
         OrderModify(ticket,OrderOpenPrice(),newstop,OrderTakeProfit(),OrderExpiration()); 
         // ���� ���� �� ����� 0, �� ������ ���, ���� �� ����� ����������� � ����� ��������
         else
            {
            if ((newstop<OrderStopLoss()) && (newstop<OrderOpenPrice()-MarketInfo(Symbol(),MODE_STOPLEVEL)*Point))
            OrderModify(ticket,OrderOpenPrice(),newstop,OrderTakeProfit(),OrderExpiration()); 
            }
         }
      }      
   }
//+----------------------------------------------------------------------------------------------+
//|  ����������� ��������� � ���������  ��� ������� iProfit � � �.                               |
//|                                                                                              |
//|  ���������� c������� � ��������� + iZepoPlus �������                                         |
//+----------------------------------------------------------------------------------------------+
void SL2BreakevenIf(int iTicket )
   {  
   if(iProfit<stop_level+ spread/Point) {Print("iProfit<stop_level ������������ iProfit");  iProfit = stop_level+ 2* spread/Point; }
   
   int i; // counter
   double dBid, dAsk;
     
   // ��������� ���������� ��������
   if ((iZepoPlus<0) || (iProfit-iZepoPlus<MarketInfo(Symbol(),MODE_STOPLEVEL)) || (!OrderSelect(iTicket,SELECT_BY_TICKET)))
      {
      Print("��������� ��������� �������� SL2BreakevenIf () ���������� ��-�� �������������� �������� ���������� �� ����������.");
      return(0);
      } 
   
   if (OrderType()==OP_BUY)
      {
      dBid = MarketInfo(Symbol(),MODE_BID);
      
      if (dBid-OrderOpenPrice()>=iProfit*Point)
      if (OrderStopLoss()<OrderOpenPrice()+iZepoPlus*Point)
      
      if(OrderModify(iTicket,OrderOpenPrice(),OrderOpenPrice()+iZepoPlus*Point,OrderTakeProfit(),OrderExpiration(),Red))
       {Comment( "������� � ��������� BYU # ",order_ticket);
          Print("������� � ��������� BYU # ",order_ticket);    // bez_ubit=false;
         }          else
                      Print("������ �������a � ��������� BYU # ",order_ticket);
        }
      
   if (OrderType()==OP_SELL)
      {
      dAsk = MarketInfo(Symbol(),MODE_ASK);
      
      if (OrderOpenPrice()-dAsk>=iProfit*Point)
      if ((OrderStopLoss()==0) || (OrderStopLoss()>OrderOpenPrice()-iZepoPlus*Point))
      
      if(OrderModify(iTicket,OrderOpenPrice(),OrderOpenPrice()-iZepoPlus*Point,OrderTakeProfit(),OrderExpiration(),Blue))
       {Comment( "������� � ��������� SELL # ",order_ticket);
        Print("������� � ���������  SELL  # ",order_ticket);     
         }          else
                      Print("������ �������a � ��������� SELL # ",order_ticket);
      }      
   }
//+----------------------------------------------------------------------------------------------+
//|  �������� �� ���������                                                                       |
//|  ������� ��������� ����� �������, ���������� ����� � ��������,                              |
//|  � ������ (�������) - ���������� �� ����. (���.) �����, ��                                   |
//|  ������� ����������� �������� (�� 0), trlinloss - ������� �� �                               |
//|  ���� �������                                                                                |
//+----------------------------------------------------------------------------------------------+
 void TrailingByFractals(int ticket,int tmfrm,int frktl_bars,int indent,bool trlinloss)
   {

   int i, z;                    // counters
   int extr_n;                  // ����� ���������� ���������� frktl_bars-������� �������� 
   double temp;                 // ��������� ����������
   int after_x, be4_x;          // ������ ����� � �� ���� ��������������
   int ok_be4, ok_after;        // ����� ������������ ������� (1 - �����������, 0 - ���������)
   int sell_peak_n, buy_peak_n; // ������ ����������� ��������� ��������� �� ������� (��� �������� ��.���.) � ������� �������������   
   
   // ��������� ���������� ��������
   if ((frktl_bars<=3) || (indent<0) || (ticket==0) || ((tmfrm!=1) && (tmfrm!=5) && (tmfrm!=15) && (tmfrm!=30) && (tmfrm!=60) && (tmfrm!=240) && (tmfrm!=1440) && (tmfrm!=10080) && (tmfrm!=43200)) || (!OrderSelect(ticket,SELECT_BY_TICKET)))
      {
      Print("�������� �������� TrailingByFractals() ���������� ��-�� �������������� �������� ���������� �� ����������.");
      return(0);
      } 
   
   temp = frktl_bars;
      
   if (MathMod(frktl_bars,2)==0)
   extr_n = temp/2;
   else                
   extr_n = MathRound(temp/2);
      
   // ����� �� � ����� ���������� ��������
   after_x = frktl_bars - extr_n;
   if (MathMod(frktl_bars,2)!=0)
   be4_x = frktl_bars - extr_n;
   else
   be4_x = frktl_bars - extr_n - 1;    
   
   // ���� ������� ������� (OP_BUY), ������� ��������� ������� �� ������� (�.�. ��������� "����")
   if (OrderType()==OP_BUY)
      {if(!multi) sell_open = false;
      // ������� ��������� ������� �� �������
      for (i=extr_n;i<iBars(Symbol(),tmfrm);i++)
         {
         ok_be4 = 0; ok_after = 0;
         
         for (z=1;z<=be4_x;z++)
            {
            if (iLow(Symbol(),tmfrm,i)>=iLow(Symbol(),tmfrm,i-z)) 
               {
               ok_be4 = 1;
               break;
               }
            }
            
         for (z=1;z<=after_x;z++)
            {
            if (iLow(Symbol(),tmfrm,i)>iLow(Symbol(),tmfrm,i+z)) 
               {
               ok_after = 1;
               break;
               }
            }            
         
         if ((ok_be4==0) && (ok_after==0))                
            {
            sell_peak_n = i; 
            break;
            }
         }
     
      // ���� ������� � ������
      if (trlinloss==true)
         {
         // ���� ����� �������� ����� ���������� (� �.�. ���� �������� == 0, �� ���������)
         if (iLow(Symbol(),tmfrm,sell_peak_n)-indent*Point>OrderStopLoss())
         OrderModify(ticket,OrderOpenPrice(),iLow(Symbol(),tmfrm,sell_peak_n)-indent*Point,OrderTakeProfit(),OrderExpiration());
         }
      // ���� ������� ������ � �������, ��
      else
      // ���� ����� �������� ����� ���������� � ����� ��������
      if ((iLow(Symbol(),tmfrm,sell_peak_n)-indent*Point>OrderStopLoss()) && (iLow(Symbol(),tmfrm,sell_peak_n)-indent*Point>OrderOpenPrice()))
      OrderModify(ticket,OrderOpenPrice(),iLow(Symbol(),tmfrm,sell_peak_n)-indent*Point,OrderTakeProfit(),OrderExpiration());         
      }
      
   // ���� �������� ������� (OP_SELL), ������� ��������� ������� �� ������� (�.�. ��������� "�����")
   if (OrderType()==OP_SELL)
      {if(!multi) sell_open = false;
      // ������� ��������� ������� �� �������
      for (i=extr_n;i<iBars(Symbol(),tmfrm);i++)
         {
         ok_be4 = 0; ok_after = 0;
         
         for (z=1;z<=be4_x;z++)
            {
            if (iHigh(Symbol(),tmfrm,i)<=iHigh(Symbol(),tmfrm,i-z)) 
               {
               ok_be4 = 1;
               break;
               }
            }
            
         for (z=1;z<=after_x;z++)
            {
            if (iHigh(Symbol(),tmfrm,i)<iHigh(Symbol(),tmfrm,i+z)) 
               {
               ok_after = 1;
               break;
               }
            }            
         
         if ((ok_be4==0) && (ok_after==0))                
            {
            buy_peak_n = i;
            break;
            }
         }        
      
      // ���� ������� � ������
      if (trlinloss==true)
         {
         if ((iHigh(Symbol(),tmfrm,buy_peak_n)+(indent+MarketInfo(Symbol(),MODE_SPREAD))*Point<OrderStopLoss()) || (OrderStopLoss()==0))
         OrderModify(ticket,OrderOpenPrice(),iHigh(Symbol(),tmfrm,buy_peak_n)+(indent+MarketInfo(Symbol(),MODE_SPREAD))*Point,OrderTakeProfit(),OrderExpiration());
         }      
      // ���� ������� ������ � �������, ��
      else
         {
         // ���� ����� �������� ����� ���������� � ����� ��������
         if ((((iHigh(Symbol(),tmfrm,buy_peak_n)+(indent+MarketInfo(Symbol(),MODE_SPREAD))*Point<OrderStopLoss()) || (OrderStopLoss()==0))) && (iHigh(Symbol(),tmfrm,buy_peak_n)+(indent+MarketInfo(Symbol(),MODE_SPREAD))*Point<OrderOpenPrice()))
         OrderModify(ticket,OrderOpenPrice(),iHigh(Symbol(),tmfrm,buy_peak_n)+(indent+MarketInfo(Symbol(),MODE_SPREAD))*Point,OrderTakeProfit(),OrderExpiration());
         }
      }      
   }
//+==============================================================================================+
//+==============================================================================================+                                                                                                                                                                                                                                                                                                                                                                                                      // LogicMansLaboratory
                  
        
