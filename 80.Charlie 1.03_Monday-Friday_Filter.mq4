//+------------------------------------------------------------------+
//|                         80.Charlie 1.03_Monday-Friday_Filter.mq4 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                                                           BO.mq4 |
//|                        Copyright 2016, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2016, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict

#include <WinUser32.mqh>

extern string              TestParams     = "Параметры тестирования";
extern bool                WriteTestInfo = true;   //Создать файл тестирования
extern double              Loss = 1.0;
extern double              Profit = 0.85;
extern string              MMParams     = "Параметры манименеджмента";
extern double              Lot = 10;
extern double              Risk = 10;
extern string              ServiceParams     = "Сервисные параметры";
enum     BROVAR
{
BROVAR1=1,                            //  Grand
BROVAR2=2,                            //  WForex
};
input BROVAR               BrokerVariant =              1;
extern int                 Magic = 123;
extern int                 Expiration = 60;
input ENUM_TIMEFRAMES      WorkPeriod =                  PERIOD_M1;                      // Период работы советника
input ENUM_TIMEFRAMES      IndicatorPeriod =             PERIOD_H1;                      // Период индикаторов
input ENUM_TIMEFRAMES      FilterPeriod =                PERIOD_M1;                      // Период фильтра
//+------------------------------------------------------------------+
extern string              WPRParams     = "Параметры WPR";
extern int                 WPRPeriod     = 28;
extern double              WPREnterLevel = 8;
extern string              WPR15Params     = "Параметры фильтра WPR M15";
extern bool                UseWPR15Filter = true;
extern int                 WPR15Period     = 28;
extern double              WPR15EnterLevel = 8;
extern string              VolParams     = "Параметры волатильности";
extern double              MinVol =       0.2;
extern double              MaxVol =       4.0;
extern int                 ATRPer       = 14;
extern string              KCParams       = "Параметры Keltner Channel";
extern int                 KCPeriod      = 62;
extern double              KCPipDev       = 5;
extern double              KCDev         = 1.5;
input ENUM_MA_METHOD       KCMode        = MODE_SMA;
extern string              ADXParams     = "Параметры ADX";
extern int                 ADXPer = 14;
extern double              LevADX = 30;
extern string              Settings03 =                  "====Расписание====";
extern bool                UseTimeFilter =               true;
extern int                 GMTOffset      =              2;
extern bool                CalculateDST =                true;
enum DSTVAR
{
DSTVAR0=0,                            //  Европа
DSTVAR1=1,                            //  Америка
};
input DSTVAR               DSTVariant =                  1;
extern bool                UseRolloverRule =             true;
extern bool                MondayTrade =                 true;
extern bool                TuesdayTrade =                true;
extern bool                WednesdayTrade =              true;
extern bool                ThursdayTrade =               true;
extern bool                FridayTrade =                 true;
extern string              Settings04 =                  "====Понедельник-пятница====";
extern int                 TimeStart = 0;             // Время начала работаа в любой день
extern int                 TimeEnd = 24;               // Время окончания работы в любой день
extern int                 TimeStartMonday = 1;        // Время начала работы в понедельник 
extern int                 TimeEndFriday = 23;         // Время окончания работы в пятницу
extern string              Settings033 =                  "====Часы работы====";
extern bool                Hour0 = true;
extern bool                Hour1 = true;
extern bool                Hour2 = true;
extern bool                Hour3 = true;
extern bool                Hour4 = true;
extern bool                Hour5 = true;
extern bool                Hour6 = true;
extern bool                Hour7 = true;
extern bool                Hour8 = true;
extern bool                Hour9 = true;
extern bool                Hour10 = true;
extern bool                Hour11 = true;
extern bool                Hour12 = true;
extern bool                Hour13 = true;
extern bool                Hour14 = true;
extern bool                Hour15 = true;
extern bool                Hour16 = true;
extern bool                Hour17 = true;
extern bool                Hour18 = true;
extern bool                Hour19 = true;
extern bool                Hour20 = true;
extern bool                Hour21 = true;
extern bool                Hour22 = true;
extern bool                Hour23 = true;
string Comm="";
//+------------------------------------------------------------------+
int SignalOpen()
{
   double WPR1 = iWPR(_Symbol, IndicatorPeriod, WPRPeriod,0);
   double ATR = iATR(_Symbol, IndicatorPeriod, ATRPer, 1); 
   double WPRM15 = iWPR(_Symbol, FilterPeriod, WPR15Period,0);
   double KeltC1 = iMA(_Symbol, IndicatorPeriod, KCPeriod, 0, KCMode, PRICE_CLOSE,0);
   double KeltL1 = iMA(_Symbol, IndicatorPeriod, KCPeriod, 0, KCMode, PRICE_CLOSE,0) - KCDev * iATR(_Symbol,_Period,KCPeriod,0);
   double KeltH1 = iMA(_Symbol, IndicatorPeriod, KCPeriod, 0, KCMode, PRICE_CLOSE,0) + KCDev * iATR(_Symbol,_Period,KCPeriod,0);
   double ADX = iADX(_Symbol,IndicatorPeriod,ADXPer,PRICE_CLOSE,MODE_MAIN,0);
   double High1 = iHigh(_Symbol,IndicatorPeriod,1);
   double Low1 = iLow(_Symbol,IndicatorPeriod,1);
   if(MathAbs(High1-Low1)>MinVol*ATR && MathAbs(High1-Low1)<MaxVol*ATR)
   {
      if(ADX>LevADX&&Close[1]+KCPipDev*_Point<KeltL1&&WPR1<WPREnterLevel-100&&WPRM15<WPR15EnterLevel-100)
      {
         if((UseWPR15Filter&&WPRM15<WPR15EnterLevel-100)||!UseWPR15Filter) return(OP_BUY);
      }
      if(ADX>LevADX&&Close[1]-KCPipDev*_Point>KeltH1&&WPR1>-WPREnterLevel&&WPRM15>-WPR15EnterLevel)
      {
         if((UseWPR15Filter&&WPRM15>-WPR15EnterLevel)||!UseWPR15Filter) return(OP_SELL);
      }
   }
   return(-5);
}

//+------------------------------------------------------------------+
void OrderCloseFuncTest(int expiration)
{
      for(int i=OrdersTotal()-1; i>=0; i--)
      {
         if(OrderSelect(SELECT_BY_POS,MODE_TRADES))
         {
            if(OrderSymbol() == _Symbol && OrderMagicNumber() == Magic && TimeCurrent() - OrderOpenTime() >= expiration * 60)
            {
            if(OrderType() == OP_BUY)
               {
                  if(OrderClose(OrderTicket(), OrderLots(), Bid, 1))
                  {
                     Print("Order buy closed");
                  }
                  else Print("Order close Error");
               }
            if(OrderType() == OP_SELL)
               {
                  if(OrderClose(OrderTicket(), OrderLots(), Ask, 1))
                  {
                     Print("Order sell closed");
                  }
                  else Print("Order close Error");
               }
            }
         }
      }
   return;
}

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
{
   if(_Digits==5||_Digits==3) 
   {
   KCPipDev*=10;
   }
   return(INIT_SUCCEEDED);
}
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   switch (_UninitReason)
      {
      case REASON_ACCOUNT:
         Print(" EA stopped. Pair "+Symbol()+". Account changed."); 
         break;
      case REASON_CHARTCHANGE:
         Print(" EA stopped. Pair "+Symbol()+". Timeframe changed."); 
         break;
      case REASON_CHARTCLOSE:
         Print(" EA stopped. Pair "+Symbol()+". Chart closed."); 
         break;
      case REASON_PARAMETERS:
         Print(" EA stopped. Pair "+Symbol()+". EA parameters changed."); 
         break;
      case REASON_RECOMPILE:
         Print(" EA stopped. Pair "+Symbol()+". EA was decompiled."); 
         break;
      case REASON_REMOVE:
         Print(" EA stopped. Pair "+Symbol()+". EA was deleted from the chart."); 
         break;
      case REASON_TEMPLATE:
         Print(" EA stopped. Pair "+Symbol()+". New template is on the chart."); 
         break;
      default:
         Print(" EA stopped. Pair "+Symbol()); 
      }
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
{
   if(IsNewBar(0,WorkPeriod))
   {
      if(IsTesting())
      {
         OrderCloseFuncTest(Expiration);
      }
      if((!UseTimeFilter||(UseTimeFilter&&TimeFilter())) && CountSell() + CountBuy() == 0)
      {
         if(BrokerVariant==1) Comm=IntegerToString(Expiration);
         if(BrokerVariant==2) Comm="BO exp:"+IntegerToString(Expiration*60);
         if(SignalOpen() == OP_BUY)
         {
            if(OrderSend(_Symbol, OP_BUY,MM(AccountBalance()), Ask, 1, 0, 0,Comm, Magic, 0, Blue) > 0)
            {
               Print("Order buy opened");
            }
            else Print("Order Open Error");
         }
         if(SignalOpen() == OP_SELL)
         {
            if(OrderSend(_Symbol, OP_SELL,MM(AccountBalance()), Bid, 1, 0, 0,Comm, Magic, 0, Red) > 0)
            {
               Print("Order sell opened");
            }
            else Print("Order sell Error");
         }
      }
   }
}
//+------------------------------------------------------------------+

int CountBuy()
{
   int count = 0;
   for (int i=0; i<OrdersTotal(); i++)
   {
      if(OrderSelect(i, SELECT_BY_POS, MODE_TRADES))
      {
         if(OrderSymbol() == _Symbol && 
            OrderMagicNumber() == Magic && 
            OrderType() == OP_BUY)
            count++;
      }
   }
   return(count);
}
//+------------------------------------------------------------------+
int CountSell()
{
   int count = 0;
   for (int i=0; i<OrdersTotal(); i++)
   {
      if(OrderSelect(i, SELECT_BY_POS, MODE_TRADES))
      {
         if(OrderSymbol() == _Symbol && 
            OrderMagicNumber() == Magic && 
            OrderType() == OP_SELL)
            count++;
      }
   }
   return(count);
}

double orderProfit()
{
   double profit = 0;
   for (int i=0; i<OrdersTotal(); i++)
   {
      if(OrderSelect(i, SELECT_BY_POS, MODE_TRADES))
      {
         if(OrderSymbol() == _Symbol && OrderMagicNumber() == Magic)
         { 
            if(OrderType()==OP_BUY) profit=Bid-OrderOpenPrice();
            if(OrderType()==OP_SELL) profit=OrderOpenPrice()-Ask;
         } 
      }
   }
   return(profit);
}

//+------------------------------------------------------------------+
//|  New bar function                                                |
//+------------------------------------------------------------------+
bool IsNewBar(int mode=0,int period=0)
   {
   //0 - при первом запуске возвращает true
   //1 - при первом запуске ожидает следующий бар
   static datetime tm[10];
   int t=tfA(period);
   if(tm[t]==0&&mode==1) tm[t]=iTime(_Symbol,period,0);
   if(tm[t]==iTime(_Symbol,period,0)) return (false);
   tm[t]=iTime(_Symbol,period,0);
   return (true);
   }
   
int tfA(int tf)
   {
   switch (tf)
      {
      case PERIOD_M1: return (0);
      case PERIOD_M5: return (1);
      case PERIOD_M15: return (2);
      case PERIOD_M30: return (3);
      case PERIOD_H1: return (4);
      case PERIOD_H4: return (5);
      case PERIOD_D1: return (6);
      case PERIOD_W1: return (7);
      case PERIOD_MN1: return (8);
      default: return (9);
      }
   }

int DST()
   {
   if(!CalculateDST) return(0);
   int month = Month();
   int day = Day();
   
   int day_of_week = DayOfWeek();
   if (day_of_week == 0) day_of_week = 7;
   
   if (month > 3 && month < 10) return(0);
   if (month > 10 || month < 3) return(1);
   if(DSTVariant==0)
   {
      if (month == 3 && 31 - day + day_of_week >= 7) return(1);
      if (month == 10 && 31 - day + day_of_week < 7) return(1);
   }
   if(DSTVariant==1)
   {
      if (month == 3 && 31 - day + day_of_week >= 21) return(1);
      if (month == 10 && 31 - day + day_of_week < 21) return(1);
   }
   return (0);
   }

int start() 
{
     if (TradeStatuse() > 0) return (0); //--- если нет то работаем дальше
     return (0);
}
int TradeStatuse()
{
   if ((!IsTesting()) && IsStopped()) return (1); //--- Если не тестовый режим и советник приостановлен (IsStopped).
   if ((!IsTesting()) && !IsTradeAllowed()) return (2); //--- Если не тестовый режим и торговля заблокирована (IsTradeAllowed).
   if ((!IsTesting()) && IsTradeContextBusy()) return (3); //--- Если не тестовый режим и поток для выполнения торговых операции занят (IsTradeContextBusy).
   if (Hour() < TimeStartMonday && DayOfWeek() == 1) return (4); //--- Проверка на торговое время в понедельник.
   if (Hour() >= TimeEndFriday && DayOfWeek() == 5) return (5); //--- Проверка на торговое время в пятницу.
   if (TimeEnd < TimeStart) 
      {  
      if(Hour() >= TimeEnd && Hour() < TimeStart) return (6);
      }
   else
      {
      if ((Hour() < TimeStart) || (Hour() >= TimeEnd)) return (6); //--- Проверка на торговое время.
      }
   if ((DayOfWeek() == 0) || (DayOfWeek() == 6)) return (7); //--- Выходные, некоторые брокеры как RVD торговля начинается в воскресение вечером
   //---
   return(0);
}

//+------------------------------------------------------------------+
//| Фильтр по дате и дню недели                                      |
//+------------------------------------------------------------------+
bool TimeFilter()
   {
   if(!MondayTrade&&DayOfWeek()==1) return(false);
   if(!TuesdayTrade&&DayOfWeek()==2) return(false);
   if(!WednesdayTrade&&DayOfWeek()==3) return(false);
   if(!ThursdayTrade&&DayOfWeek()==4) return(false);
   if(!FridayTrade&&DayOfWeek()==5) return(false);
   int NNN = 0;
   if(Year()<2011||(Year()==2011&&Month()<5)) NNN=-1;
   
   if(UseRolloverRule&&((Hour()==22&&Minute()>=45)||(Hour()==0&&Minute()<=15))) return(false);

         if(DST()==0&&NNN==0&&Hour0&&TimeHour(TimeCurrent())==23) return(true);
         if(DST()==0&&NNN!=0&&Hour0&&TimeHour(TimeCurrent())==22) return(true);
         if(DST()==1&&NNN==0&&Hour0&&TimeHour(TimeCurrent())==0) return(true);
         if(DST()==1&&NNN!=0&&Hour0&&TimeHour(TimeCurrent())==23) return(true);
         
         if(DST()==0&&NNN==0&&Hour1&&TimeHour(TimeCurrent())==0) return(true);
         if(DST()!=0&&NNN==0&&Hour1&&TimeHour(TimeCurrent())==1) return(true);   
         if(DST()==0&&NNN!=0&&Hour1&&TimeHour(TimeCurrent())==23) return(true);
         if(DST()!=0&&NNN!=0&&Hour1&&TimeHour(TimeCurrent())==0) return(true);   
         
         if(Hour2&&TimeHour(TimeCurrent())==1+DST()+NNN) return(true);
         if(Hour3&&TimeHour(TimeCurrent())==2+DST()+NNN) return(true);
         if(Hour4&&TimeHour(TimeCurrent())==3+DST()+NNN) return(true);
         if(Hour5&&TimeHour(TimeCurrent())==4+DST()+NNN) return(true);
         if(Hour6&&TimeHour(TimeCurrent())==5+DST()+NNN) return(true);
         if(Hour7&&TimeHour(TimeCurrent())==6+DST()+NNN) return(true);
         if(Hour8&&TimeHour(TimeCurrent())==7+DST()+NNN) return(true);
         if(Hour9&&TimeHour(TimeCurrent())==8+DST()+NNN) return(true);
         if(Hour10&&TimeHour(TimeCurrent())==9+DST()+NNN) return(true);
         if(Hour11&&TimeHour(TimeCurrent())==10+DST()+NNN) return(true);
         if(Hour12&&TimeHour(TimeCurrent())==11+DST()+NNN) return(true);
         if(Hour13&&TimeHour(TimeCurrent())==12+DST()+NNN) return(true);
         if(Hour14&&TimeHour(TimeCurrent())==13+DST()+NNN) return(true);
         if(Hour15&&TimeHour(TimeCurrent())==14+DST()+NNN) return(true);
         if(Hour16&&TimeHour(TimeCurrent())==15+DST()+NNN) return(true);
         if(Hour17&&TimeHour(TimeCurrent())==16+DST()+NNN) return(true);
         if(Hour18&&TimeHour(TimeCurrent())==17+DST()+NNN) return(true);
         if(Hour19&&TimeHour(TimeCurrent())==18+DST()+NNN) return(true);
         if(Hour20&&TimeHour(TimeCurrent())==19+DST()+NNN) return(true);
         if(Hour21&&TimeHour(TimeCurrent())==20+DST()+NNN) return(true);
         if(Hour22&&TimeHour(TimeCurrent())==21+DST()+NNN) return(true);
         if(Hour23&&TimeHour(TimeCurrent())==22+DST()+NNN) return(true);
   return(false);
   }
   
//+------------------------------------------------------------------+
double CountAll()
{
   double count = 0;
   for (int i=0; i<OrdersHistoryTotal(); i++)
   {
      if(OrderSelect(i, SELECT_BY_POS, MODE_HISTORY))
      {
         if(OrderSymbol() == _Symbol && 
            OrderMagicNumber() == Magic && OrderProfit()!=0)
            count = count + 1.0;
      }
   }
   if(count==0) return(1);
   return(count);
}
//+------------------------------------------------------------------+
double CountProfitPerc()
{
   double count = 0;
   for (int i=0; i<OrdersHistoryTotal(); i++)
   {
      if(OrderSelect(i, SELECT_BY_POS, MODE_HISTORY))
      {
         if(OrderSymbol() == _Symbol && 
            OrderMagicNumber() == Magic && 
            OrderProfit()>0)
            count = count + 1.0;
      }
   }
   if(count==0) return(1);
   return(count);
}
//+------------------------------------------------------------------+

double OnTester()
   {
   double ret=100*CountProfitPerc()/CountAll();
   CountRealProfit();
   return(NormalizeDouble(ret,2));
   }
   
void CountRealProfit()
{
   double OrderResult = 0;
   double RealOrderProfit = 0;
   int Handle=0;
   int OrderCount = 0;
   string File_Name=_Symbol+"Test.csv";
   if(WriteTestInfo) Handle=FileOpen(File_Name, FILE_WRITE, ";");
   for (int i=0; i<OrdersHistoryTotal(); i++)
   {
      if(OrderSelect(i, SELECT_BY_POS, MODE_HISTORY))
      {
         if(OrderSymbol() == _Symbol && 
            OrderMagicNumber() == Magic)
            {
               if(OrderType()==OP_BUY) RealOrderProfit=OrderClosePrice()-OrderOpenPrice();
               if(OrderType()==OP_SELL) RealOrderProfit=OrderOpenPrice()-OrderClosePrice();
               if(RealOrderProfit>0) OrderResult = 0.85;
               if(RealOrderProfit==0) OrderResult = 0;
               if(RealOrderProfit<0) OrderResult = - 1;
               if(WriteTestInfo)
               {
                  FileWrite(Handle,_Symbol,TimeToStr(OrderOpenTime()),IntegerToString(TimeYear(OrderOpenTime())),IntegerToString(TimeMonth(OrderOpenTime())),
                  IntegerToString(TimeDay(OrderOpenTime())),IntegerToString(TimeHour(OrderOpenTime())),DoubleToStr(OrderResult,3));
               }
            }
      }
   }
   if(WriteTestInfo) FileClose(Handle);
   return;
}
//+------------------------------------------------------------------+

double MM(double Deposit)
{
double Lots = NormalizeDouble(Deposit*Risk/100,2);
if(Risk==0) Lots = Lot;
if (Lots<1) Lots = 1.0;
if (Lots>1000) Lots = 1000.0;
return(NormalizeDouble(Lots,2));
}

int CountLastOrderProfit()
{
   int i,j;
   datetime OrdTime;
   for (i=OrdersHistoryTotal()-1;i>=0;i--)
      {
      if (!OrderSelect(i,SELECT_BY_POS,MODE_HISTORY)) continue;
      if (OrderSymbol()!=_Symbol||OrderMagicNumber()!=Magic) continue;
      if (OrdTime<OrderCloseTime())
         {
         OrdTime=OrderCloseTime();
         j=i;
         }
      }
   if (OrderSelect(j,SELECT_BY_POS,MODE_HISTORY))
      {
      if(OrderProfit()<=0) return(-1);
      if(OrderProfit()>0) return(1);
      }
   return(0);
}

double CountLastOrderLot()
{
   int i,j;
   datetime OrdTime;
   for (i=OrdersHistoryTotal()-1;i>=0;i--)
      {
      if (!OrderSelect(i,SELECT_BY_POS,MODE_HISTORY)) continue;
      if (OrderSymbol()!=_Symbol||OrderMagicNumber()!=Magic) continue;
      if (OrdTime<OrderCloseTime())
         {
         OrdTime=OrderCloseTime();
         j=i;
         }
      }
   if (OrderSelect(j,SELECT_BY_POS,MODE_HISTORY)) return(OrderLots());
   return(0);
}
        
