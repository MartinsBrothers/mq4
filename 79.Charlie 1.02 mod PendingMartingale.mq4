//+------------------------------------------------------------------+
//|                        79.Charlie 1.02 mod PendingMartingale.mq4 |
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
extern bool                TestInForex = true;     //Тестируем на форекс счете
extern double              Loss = 1.0;
extern double              Profit = 0.85;
extern string              MMParams     = "Параметры манименеджмента";
extern double              Lot = 10;
extern double              Risk = 10;
extern int                 PendingMartingale = 4;
extern string              PendingDiscript     = "PendingMartingale 0 = 1";
extern bool                UseMartin = true;
extern bool                UseDoliv = true;
extern string              ServiceParams     = "Сервисные параметры";
enum     BROVAR
{
BROVAR1=1,                            //  Grand
BROVAR2=2,                            //  WForex
};
input BROVAR               BrokerVariant =              1;
extern int                 Magic = 123;
extern int                 Expiration = 60;
extern int                 Expiration2 = 20;
input ENUM_TIMEFRAMES      WorkPeriod =                  PERIOD_H1;                      // Период работы советника
//+------------------------------------------------------------------+
extern string              WPRParams     = "Параметры WPR";
extern int                 WPRPeriod     = 28;
extern double              WPREnterLevel = 8;
extern string              ADXParams     = "Параметры ADX";
extern int                 ADXPer = 14;
extern double              LevADX = 30;
extern string              VolParams     = "Параметры волатильности";
extern double              MinVol =       0.6;
extern double              MaxVol =       2.0;
extern int                 ATRPer       = 3;
extern string              KCParams       = "Параметры Keltner Channel";
extern int                 KCPeriod      = 62;
extern int                 KCShift      = 0;
extern double              KCDev         = 1.5;
extern int                 KCPipDev      = 10;
input ENUM_MA_METHOD       KCMode        = MODE_SMA;
extern bool                UseHedging = true;
extern double              HedgeLevel = 20;
extern string              Settings03 =                  "====Расписание====";
extern bool                UseTimeFilter =               true;
extern bool                CalculateDST =                true;
extern bool                MondayTrade =                 true;
extern bool                TuesdayTrade =                true;
extern bool                WednesdayTrade =              true;
extern bool                ThursdayTrade =               true;
extern bool                FridayTrade =                 true;
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

int GMTOffset;
int LostPos=0;
int LostPosTest=0;
double LastDeposit = 0;
int Order2Candle=0;
bool Order2Open = false;
string Comm="";
//+------------------------------------------------------------------+
int SignalOpen()
{
   double WPR1 = iWPR(_Symbol, WorkPeriod, WPRPeriod,0);
   double ATR = iATR(_Symbol, WorkPeriod, ATRPer, 1); 
   double KeltC1 = iMA(_Symbol, WorkPeriod, KCPeriod, KCShift, KCMode, PRICE_CLOSE,1);
   double KeltL1 = iMA(_Symbol, WorkPeriod, KCPeriod, KCShift, KCMode, PRICE_CLOSE,1) - KCDev * iATR(_Symbol,_Period,KCPeriod,1);
   double KeltH1 = iMA(_Symbol, WorkPeriod, KCPeriod, KCShift, KCMode, PRICE_CLOSE,1) + KCDev * iATR(_Symbol,_Period,KCPeriod,1);
   double ADX = iADX(_Symbol,WorkPeriod,ADXPer,PRICE_CLOSE,MODE_MAIN,1);
   double High1 = iHigh(_Symbol,WorkPeriod,1);
   double Low1 = iLow(_Symbol,WorkPeriod,1);
   if(MathAbs(High1-Low1)>MinVol*ATR && MathAbs(High1-Low1)<MaxVol*ATR)
      {
      if(ADX>LevADX&&Close[1]+KCPipDev*_Point<KeltL1&&WPR1<WPREnterLevel-100) return(OP_BUY);
      if(ADX>LevADX&&Close[1]-KCPipDev*_Point>KeltH1&&WPR1>-WPREnterLevel) return(OP_SELL);
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
      HedgeLevel*=10;
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
   if(UseDoliv&&IsNewBar(0,PERIOD_M5))
   {
      if(CountSell() > 0) Order2Candle++;
      if(CountBuy() > 0) Order2Candle++;
      if(CountSell() + CountBuy() == 0) 
      {
         Order2Candle=0;
         Order2Open = false;
      }
      double CandleOpen1 = iOpen(_Symbol,_Period,3);
      double CandleOpen2 = iOpen(_Symbol,_Period,2);
      double CandleOpen3 = iOpen(_Symbol,_Period,1);
      double CandleClose1 = iClose(_Symbol,_Period,3);
      double CandleClose2 = iClose(_Symbol,_Period,2);
      double CandleClose3 = iClose(_Symbol,_Period,1);
      double WPR1 = iWPR(_Symbol, _Period, WPRPeriod,0);
      int signalDoliv = 0;
      if(!Order2Open&&Order2Candle==9&&CountSell()==1)
      {
         if(CandleOpen1>CandleClose1&&CandleOpen2<CandleClose2&&CandleClose2<CandleOpen1&&CandleOpen3<CandleClose3&&CandleClose3<CandleOpen1) signalDoliv = -1;
         if(CandleOpen1>CandleClose1&&CandleOpen2<CandleClose2&&CandleClose2>CandleOpen1&&CandleOpen3>CandleClose3&&CandleClose3>CandleOpen1) signalDoliv = 1;
         if(CandleOpen1>CandleClose1&&CandleOpen2<CandleClose2&&CandleClose2>CandleOpen1&&CandleOpen3>CandleClose3&&CandleClose3<CandleOpen1&&CandleClose3>CandleClose1) signalDoliv = 1;
         if(CandleOpen1<CandleClose1&&CandleOpen2>CandleClose2&&CandleClose2>CandleOpen1&&CandleOpen3>CandleClose3&&CandleClose3>CandleOpen1) signalDoliv = -1;
         if(CandleOpen1<CandleClose1&&CandleOpen2>CandleClose2&&CandleClose2<CandleOpen1&&CandleOpen3<CandleClose3&&CandleClose3>CandleOpen1&&CandleClose3>CandleClose1) signalDoliv = 1;
         if(CandleOpen1<CandleClose1&&CandleOpen2>CandleClose2&&CandleClose2<CandleOpen1&&CandleOpen3>CandleClose3) signalDoliv = -1;
         if(BrokerVariant==1) Comm=IntegerToString(Expiration2);
         if(BrokerVariant==2) Comm="BO exp:"+IntegerToString(Expiration2*60);
         if(signalDoliv>0&&OrderSend(_Symbol, OP_BUY,MM(AccountBalance()), Ask, 1, 0, 0,Comm, Magic, 0, Blue) > 0)
         {
            Print("Order buy opened");
            Order2Open = true;
         }
         if(signalDoliv<0&&OrderSend(_Symbol, OP_SELL,MM(AccountBalance()), Bid, 1, 0, 0,Comm, Magic, 0, Blue) > 0)
         {
            Print("Order buy opened");
            Order2Open = true;
         }
      }
      if(!Order2Open&&Order2Candle==9&&CountBuy()==1)
      {
         if(CandleOpen1>CandleClose1&&CandleOpen2<CandleClose2&&CandleClose2<CandleOpen1&&CandleOpen3<CandleClose3&&CandleClose3<CandleOpen1) signalDoliv = 1;
         if(CandleOpen1>CandleClose1&&CandleOpen2<CandleClose2&&CandleClose2>CandleOpen1&&CandleOpen3>CandleClose3&&CandleClose3>CandleOpen1) signalDoliv = -1;
         if(CandleOpen1>CandleClose1&&CandleOpen2<CandleClose2&&CandleClose2>CandleOpen1&&CandleOpen3>CandleClose3&&CandleClose3<CandleOpen1&&CandleClose3>CandleClose1) signalDoliv = -1;
         if(CandleOpen1<CandleClose1&&CandleOpen2>CandleClose2&&CandleClose2>CandleOpen1&&CandleOpen3>CandleClose3&&CandleClose3>CandleOpen1) signalDoliv = 1;
         if(CandleOpen1<CandleClose1&&CandleOpen2>CandleClose2&&CandleClose2<CandleOpen1&&CandleOpen3<CandleClose3&&CandleClose3>CandleOpen1&&CandleClose3>CandleClose1) signalDoliv = -1;
         if(CandleOpen1<CandleClose1&&CandleOpen2>CandleClose2&&CandleClose2<CandleOpen1&&CandleOpen3>CandleClose3) signalDoliv = 1;
         if(BrokerVariant==1) Comm=IntegerToString(Expiration2);
         if(BrokerVariant==2) Comm="BO exp:"+IntegerToString(Expiration2*60);
         if(signalDoliv<0&&OrderSend(_Symbol, OP_SELL,MM(AccountBalance()), Bid, 1, 0, 0,Comm, Magic, 0, Red) > 0)
         {
            Print("Order sell opened");
            Order2Open = true;
         }
         if(signalDoliv>0&&OrderSend(_Symbol, OP_BUY,MM(AccountBalance()), Ask, 1, 0, 0,Comm, Magic, 0, Red) > 0)
         {
            Print("Order sell opened");
            Order2Open = true;
         }
      }
      if(Order2Open)
      {
         OrderCloseFuncTest(Expiration2);
      }
   }
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
   int month_0 = Month();
   int day_4 = Day();
   int day_of_week_8 = DayOfWeek();
   if (day_of_week_8 == 0) day_of_week_8 = 7;
   if (month_0 > 3 && month_0 < 10) return(0);
   if (month_0 > 10 || month_0 < 3) return(1);
   if (month_0 == 3 && 31 - day_4 + day_of_week_8 >= 7) return(1);
   if (month_0 == 10 && 31 - day_4 + day_of_week_8 < 7) return(1);
   return (0);
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
   bool control = false;
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
               if(PendingMartingale == 0) PendingMartingale = 1;
               if(OrderType()==OP_BUY) RealOrderProfit=OrderClosePrice()-OrderOpenPrice();
               if(OrderType()==OP_SELL) RealOrderProfit=OrderOpenPrice()-OrderClosePrice();
               OrderCount++;
               if(UseMartin&&!control&&RealOrderProfit>0&&LostPosTest+1>=PendingMartingale) 
               {
                  OrderResult = 0.85*MathPow(2*(Loss/Profit),LostPosTest-PendingMartingale+1);
                  LostPosTest = 0;
                  control = true;
               }
               if(UseMartin&&!control&&RealOrderProfit>0&&LostPosTest==0) 
               {
                  OrderResult = 0.85;
                  LostPosTest = 0;
                  control = true;
               }
               if(UseMartin&&!control&&RealOrderProfit==0) OrderResult = 0;
               if(UseMartin&&!control&&RealOrderProfit<0&&LostPosTest==0) 
               {
                  OrderResult = - 1;
                  LostPosTest++;
                  control = true;
               }
               if(UseMartin&&!control&&RealOrderProfit<0&&LostPosTest+1>=PendingMartingale)
               {
                  OrderResult=-1*MathPow(2*(Loss/Profit),LostPosTest-PendingMartingale+1);
                  LostPosTest++;
                  control = true;
               }
               control = false;
               if(!UseMartin&&RealOrderProfit>0) OrderResult = 0.85;
               if(!UseMartin&&RealOrderProfit==0) OrderResult = 0;
               if(!UseMartin&&RealOrderProfit<0) OrderResult = - 1;
               if(UseDoliv&&MathMod(OrderCount,2)==0)
               {
                  OrderResult*=2;
               }
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

double Lots = NormalizeDouble(Deposit*Risk/100,0);
if(Risk==0) Lots = Lot;
if(IsTesting()&&!TestInForex) return(NormalizeDouble(100,0));
Lots = MathCeil(Lots);
if (Lots<0.01) Lots = 0.01;
if (Lots>1000) Lots = 1000.0;
if(IsTesting()&&TestInForex) Lots=NormalizeDouble(0.1,1);

if(UseMartin&&CountLastOrderProfit()<0)
{
   if(LostPos==0) LastDeposit=Deposit;
   LostPos++;
   if(PendingMartingale == 0) PendingMartingale = 1;
   if(LostPos+1>=PendingMartingale)
   {
      if(Risk==0) Lots=Lots*MathPow(2*(Loss/Profit),LostPos-PendingMartingale+1);
      if(Risk!=0) Lots=NormalizeDouble(LastDeposit*Risk/100,2)*MathPow(2*(Loss/Profit),LostPos-PendingMartingale+1);
   }
}
if(UseMartin&&CountLastOrderProfit()>=0) LostPos=0;

if(CountSell() + CountBuy() > 0) Lots*=2;

return(NormalizeDouble(Lots,1));
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
        
