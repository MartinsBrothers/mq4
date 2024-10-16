//+------------------------------------------------------------------+
//|                                              81.Charlie 1.09.mq4 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                                                      Charlie.mq4 |
//|                                      Copyright 2017, Silentspec. |
//|                                     https://www.tradelikeapro.ru |
//+------------------------------------------------------------------+
#property copyright "Copyright 2017, Silentspec"
#property link      "https://www.tradelikeapro.ru"
#property version   "1.08"
#property strict

#include <WinUser32.mqh>


#import "user32.dll"
// Считывает описатель оpгана упpавления, содеpжащийся в указанном блоке диалога. Возвpащаемое значение: идентификатоp оpгана упpавления; 0 - если указанный оpган упpавления не существует.
int      GetDlgItem(int hDlg,        // Блок диалога, содеpжащий оpган упpавления.
                     int nIDDlgItem); // Идентификатоp оpгана упpавления.
// Возвращает идентификатор hierarchyid, представляющий n-го предка данного элемента.
int      GetAncestor(int hWnd,      // Идентификатоp окна.
                      int gaFlags);  // Уровень окна от текущего окна (1, 2, 3...).
int      SendMessageA(int  hWnd,      // Окно, пpинимающее сообщение или $FFFF для посылки всем всплывающим окнам в системе.
                       int  Msg,       // Тип сообщения.
                       int  wParam,    // Дополнительная инфоpмация о сообщении.
                       int& lParam[]); // Дополнительная инфоpмация о сообщении.
int      PostMessageA (int hWnd, int Msg, int wParam, string lParam);    
#import

extern bool                UseTestTrade = false;   //Тестовая торговля с кнопок
extern int                 MyMagic = 0;
extern string              TestParams     = "Параметры тестирования";
extern string              EAName = "Charlie_108";
extern bool                UseVirtualTrade = false;   //Виртуальная торговля
extern bool                UseRealTrade = true;   //Реальная торговля
extern bool                WeekendVTradeFile = false;   //Закрывать файл виртуальной торговли на выходной
extern bool                WriteTestInfo = false;   //Создать файл тестирования
extern double              Loss = 1.0;
extern double              Profit = 0.85;
extern string              MMParams     = "Параметры манименеджмента";
enum     MMVAR
{
MMVAR1=1,                            //  Фикс лот
MMVAR2=2,                            //  Риск в % от депозита
MMVAR3=3,                            //  Ступенчатое повышение
};
input MMVAR                MMVariant =              2;
extern string              MM01     = "      - фикс лот";
extern double              Lot = 1;
extern string              MM02     = "      - риск в % от депо";
extern double              Risk = 3;
extern string              MM03     = "      - ступенчатое повышение лота";
extern double              StartDepo = 30;
extern double              Step = 0.5;
extern double              StepDelta = 10;
extern double              MaxRisk = 30;
extern double              MaxOrders = 10;
extern string              ServiceParams     = "Выбор брокера";
enum     BROVAR
{
BROVAR1=1,                            //  Grand
BROVAR2=2,                            //  WForex Anerica
BROVAR3=3,                            //  WForex Europe
BROVAR4=4,                            //  GDMFX
BROVAR5=5,                            //  Larson
BROVAR6=6,                            //  MikiForex
BROVAR7=7,                            //  NoaFX
BROVAR8=8,                            //  StarfishFX
BROVAR9=9,                            //  Clmforex
BROVAR10=10,                          //  RinkostMarkets
BROVAR11=11,                          //  GoMarkets
BROVAR12=12,                          //  DirectFX
};
input BROVAR               BrokerVariant =              1;
//+------------------------------------------------------------------+
extern string              Settings03 =                  "====Расписание====";
extern int                 GMTOffset      =              2;
extern bool                CalculateDST =                true;
enum DSTVAR
{
DSTVAR0=0,                            //  Европа
DSTVAR1=1,                            //  Америка
};
input DSTVAR               DSTVariant =                  1;
extern bool                UseWeekEndRollover =          true;
extern bool                MondayTrade =                 true;
extern bool                TuesdayTrade =                true;
extern bool                WednesdayTrade =              true;
extern bool                ThursdayTrade =               true;
extern bool                FridayTrade =                 true;
extern string              Settings04 =                  "====Сервисные настройки====";
extern bool                UseDebug =                    true;
extern int                 RetryAttempts =               30;
extern bool                MailSend =                    true;
extern bool                PushSend =                    true;
extern string              Settings08 =                  "====Торговые настройки====";
extern int Expiration = 60;
extern int WPRPeriod     = 4;
extern double WPREnterLevel = 20;
extern int KCPeriod      = 60;
extern double KCPipDev       = -10;
extern double KCDev         = 0.6;
extern int WPR2Period     = 4;
extern double WPR2EnterLevel = 18;
extern int KC2Period      = 30;
extern double KC2PipDev       = -5;
extern double KC2Dev         = 1.2;
extern int RSIPer =           2;
extern double RSIEnterLevel = 30;
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


int SleepTime = 3;
int SleepMaximum = 15;

datetime FirstOpenTime = 0;

double FirstOpenPrice=0;

string              MyPrefix = "";
string              MySuffix = "";
string Comm="";

datetime VOrderOpenTime = 0;
double VOrderOpenPrice = 0;
double VOrderOpenLots = 0;

string FileNameVT=_Symbol+"_"+EAName+"_VirtualTrades.csv";
int HandleVT=0;
bool VOrderBuy = false;
bool VOrderSell = false;

int Magic=0;

//+------------------------------------------------------------------+
void OrderCloseFuncTest(int expiration)
{
   int ticket=0,n=0,i=0, err;
   for(i=OrdersTotal()-1; i>=0; i--)
   {
      if(OrderSelect(SELECT_BY_POS,MODE_TRADES))
      {
         if(OrderSymbol() == _Symbol && OrderMagicNumber() == Magic && TimeCurrent() - OrderOpenTime() >= expiration*60)
         {
            if(OrderType() == OP_BUY)
            {
               RefreshRates();
               ticket=OrderClose(OrderTicket(), OrderLots(), Bid, 1, Green);
               err = GetLastError();
               if(err>0) Print("Ошибка : ",0);
               else if(UseDebug) Print("Ордер закрыт.");
            }
            if(OrderType() == OP_SELL)
            {
               RefreshRates();
               ticket=OrderClose(OrderTicket(), OrderLots(), Ask, 1, Green);
               err = GetLastError();
               if(err>0) Print("Ошибка : ",0);
               else if(UseDebug) Print("Ордер закрыт.");
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
   if(UseDebug) Print("Начинаем инициализацию. Ожидайте...");
   Sleep(5000);
   int err;
  
   if (_Digits==3||_Digits==5)
   {
      KCPipDev*=10;
      KC2PipDev*=10;
   }
   SetPrefSuff();
   if(UseDebug) Print("Префиксы и суффиксы определены: Префикс = ", MyPrefix, ", Суффикс = " + MySuffix);
   if(UseVirtualTrade) 
      {
         HandleVT=FileOpen(FileNameVT, FILE_WRITE, ";");
         err = GetLastError();
         if(err>0) Print("Файл виртуальной торговли не создан. Ошибка: ",0);
      }
   if(MyMagic==0) Magic = makeMagicNumber(WindowExpertName() + Symbol() + IntegerToString(Period()));   // Генерация мэджика
   if(MyMagic!=0) Magic = MyMagic;
   if(Magic == 0 && UseDebug) Print("Ошибка! Magic равен нулю! Функция makeMagicNumber почему то не сработала!");
   if(UseDebug) Print("Массивы настроек заполнены. Начинаем работу.");
   PrintAccParams();
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
         Print(" Советник остановлен. Пара "+Symbol()+". Аккаунт сменен."); 
         break;
      case REASON_CHARTCHANGE:
         Print(" Советник остановлен Пара "+Symbol()+". Смена таймфрейма."); 
         break;
      case REASON_CHARTCLOSE:
         Print(" Советник остановлен. Пара "+Symbol()+". График закрыт."); 
         break;
      case REASON_PARAMETERS:
         Print(" Советник остановлен. Пара "+Symbol()+". Параметры советника изменены."); 
         break;
      case REASON_RECOMPILE:
         Print(" Советник остановлен. Пара "+Symbol()+". Перекомпиляция советника."); 
         break;
      case REASON_REMOVE:
         Print(" Советник остановлен. Пара "+Symbol()+". Советник был удален с графика."); 
         break;
      case REASON_TEMPLATE:
         Print(" Советник остановлен. Пара "+Symbol()+". Новый шаблон загружен на график."); 
         break;
      default:
         Print(" Советник остановлен. Пара "+Symbol()); 
      }
   if(UseVirtualTrade) 
   {
      FileClose(HandleVT);
      if(UseDebug) Print("Файл виртуальной торговли закрыт.");
   }
   //clearChart();
}
  
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
{

   if(IsNewBar(1,PERIOD_M1))
   {
      if(!CheckStatus()) 
      {
         Print("Критическая ошибка! Останавливаем советник.");
         if(MailSend) SendMail("Критическая ошибка","Советник Charlie на паре "+_Symbol+" остановлен! Брокер:"+AccountInfoString(ACCOUNT_COMPANY));
         if(PushSend) SendNotification("Советник Charlie на паре "+_Symbol+" остановлен! Брокер:"+AccountInfoString(ACCOUNT_COMPANY));
         ExpertRemove();
      }
      if(UseVirtualTrade&&WeekendVTradeFile)
      {
         if(DayOfWeek()==5&&Hour()==23&&Minute()==45) 
         {
            FileClose(HandleVT);
            if(UseDebug) Print("Файл виртуальной торговли закрыт.");
         }
         if(DayOfWeek()==1&&Hour()==0&&Minute()==5) 
         {
            int err=0;
            HandleVT=FileOpen(FileNameVT, FILE_WRITE, ";");
            err = GetLastError();
            if(err>0) Print("Файл виртуальной торговли не создан. Ошибка: ",0);
         }
      }
      if(UseVirtualTrade&&(VOrderBuy||VOrderSell)) 
      {
         VOrderClose(Expiration);
      }
      if(IsTesting())
      {
         OrderCloseFuncTest(Expiration);
      }
      if(TimeFilter()&&UseRealTrade&&CountSell() + CountBuy() == 0)
      {
         if(SignalOpen() == OP_BUY) 
         {
            if(UseDebug) Print("Пробуем послать ордер в покупку");
            if(UseRealTrade) OpenOrder(OP_BUY);
         }
         if(SignalOpen() == OP_SELL) 
         {
            if(UseDebug) Print("Пробуем послать ордер в продажу");
            if(UseRealTrade) OpenOrder(OP_SELL);
         }
      }
      if(UseVirtualTrade&&!VOrderBuy&&!VOrderSell)
      {
         if(SignalOpen() == OP_BUY) 
         {
            if(UseDebug) Print("Шлем виртуальный ордер в покупку");
            if(UseVirtualTrade)  VOpenOrder(OP_BUY);
         }
         if(SignalOpen() == OP_SELL) 
         {
            if(UseDebug) Print("Шлем виртуальный ордер в продажу");
            if(UseVirtualTrade)  VOpenOrder(OP_SELL);
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
   if(!CalculateDST) 
   {
      if(UseDebug) Print("DST=0, авто перевод отключен");
      return(0);
   }
   int month = Month();
   int day = Day();
   
   int day_of_week = DayOfWeek();
   if (day_of_week == 0) day_of_week = 7;
   
   if (month > 3 && month < 10) 
   {
      return(0); // Лето
   }
   if (month > 10 || month < 3) 
   {
      return(1); // Зима
   }
   if(DSTVariant==0)
   {
      if (month == 3 && 31 - day + day_of_week >= 7) 
      {
         return(1);
      }
      if (month == 10 && 31 - day + day_of_week < 7)
      {
         return(1);
      }
   }
   if(DSTVariant==1)
   {
      if (month == 3 && 31 - day + day_of_week >= 21)
      {
         return(1);
      }
      if (month == 10 && 31 - day + day_of_week < 21)
      {
         return(1);
      }
   }
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
   int NNN = GMTOffset+DST();
   if(Year()<2011||(Year()==2011&&Month()<5)) NNN=GMTOffset-1+DST();
   if(UseWeekEndRollover&&((((Hour()==22&&Minute()>=45)||Hour()>22)&&DayOfWeek()==5)||(Hour()==0&&Minute()<=15&&DayOfWeek()==1))) return(false);
   int MyHour = NNN;
   if(MyHour<0) MyHour=MyHour+24;
   if(MyHour>23) MyHour=MyHour-24;
   if(Hour0&&TimeHour(TimeCurrent())==MyHour) return(true);
   MyHour=NNN+1;
   if(MyHour<0) MyHour=MyHour+24;
   if(MyHour>23) MyHour=MyHour-24;
   if(Hour1&&TimeHour(TimeCurrent())==MyHour) return(true);
   MyHour=NNN+2;
   if(MyHour<0) MyHour=MyHour+24;
   if(MyHour>23) MyHour=MyHour-24;
   if(Hour2&&TimeHour(TimeCurrent())==MyHour) return(true);
   MyHour=NNN+3;
   if(MyHour<0) MyHour=MyHour+24;
   if(MyHour>23) MyHour=MyHour-24;
   if(Hour3&&TimeHour(TimeCurrent())==MyHour) return(true);
   MyHour=NNN+4;
   if(MyHour<0) MyHour=MyHour+24;
   if(MyHour>23) MyHour=MyHour-24;
   if(Hour4&&TimeHour(TimeCurrent())==MyHour) return(true);
   MyHour=NNN+5;
   if(MyHour<0) MyHour=MyHour+24;
   if(MyHour>23) MyHour=MyHour-24;
   if(Hour5&&TimeHour(TimeCurrent())==MyHour) return(true);
   MyHour=NNN+6;
   if(MyHour<0) MyHour=MyHour+24;
   if(MyHour>23) MyHour=MyHour-24;
   if(Hour6&&TimeHour(TimeCurrent())==MyHour) return(true);
   MyHour=NNN+7;
   if(MyHour<0) MyHour=MyHour+24;
   if(MyHour>23) MyHour=MyHour-24;
   if(Hour7&&TimeHour(TimeCurrent())==MyHour) return(true);
   MyHour=NNN+8;
   if(MyHour<0) MyHour=MyHour+24;
   if(MyHour>23) MyHour=MyHour-24;
   if(Hour8&&TimeHour(TimeCurrent())==MyHour) return(true);
   MyHour=NNN+9;
   if(MyHour<0) MyHour=MyHour+24;
   if(MyHour>23) MyHour=MyHour-24;
   if(Hour9&&TimeHour(TimeCurrent())==MyHour) return(true);
   MyHour=NNN+10;
   if(MyHour<0) MyHour=MyHour+24;
   if(MyHour>23) MyHour=MyHour-24;
   if(Hour10&&TimeHour(TimeCurrent())==MyHour) return(true);
   MyHour=NNN+11;
   if(MyHour<0) MyHour=MyHour+24;
   if(MyHour>23) MyHour=MyHour-24;
   if(Hour11&&TimeHour(TimeCurrent())==MyHour) return(true);
   MyHour=NNN+12;
   if(MyHour<0) MyHour=MyHour+24;
   if(MyHour>23) MyHour=MyHour-24;
   if(Hour12&&TimeHour(TimeCurrent())==MyHour) return(true);
   MyHour=NNN+13;
   if(MyHour<0) MyHour=MyHour+24;
   if(MyHour>23) MyHour=MyHour-24;
   if(Hour13&&TimeHour(TimeCurrent())==MyHour) return(true);
   MyHour=NNN+14;
   if(MyHour<0) MyHour=MyHour+24;
   if(MyHour>23) MyHour=MyHour-24;
   if(Hour14&&TimeHour(TimeCurrent())==MyHour) return(true);
   MyHour=NNN+15;
   if(MyHour<0) MyHour=MyHour+24;
   if(MyHour>23) MyHour=MyHour-24;
   if(Hour15&&TimeHour(TimeCurrent())==MyHour) return(true);
   MyHour=NNN+16;
   if(MyHour<0) MyHour=MyHour+24;
   if(MyHour>23) MyHour=MyHour-24;
   if(Hour16&&TimeHour(TimeCurrent())==MyHour) return(true);
   MyHour=NNN+17;
   if(MyHour<0) MyHour=MyHour+24;
   if(MyHour>23) MyHour=MyHour-24;
   if(Hour17&&TimeHour(TimeCurrent())==MyHour) return(true);
   MyHour=NNN+18;
   if(MyHour<0) MyHour=MyHour+24;
   if(MyHour>23) MyHour=MyHour-24;
   if(Hour18&&TimeHour(TimeCurrent())==MyHour) return(true);
   MyHour=NNN+19;
   if(MyHour<0) MyHour=MyHour+24;
   if(MyHour>23) MyHour=MyHour-24;
   if(Hour19&&TimeHour(TimeCurrent())==MyHour) return(true);
   MyHour=NNN+20;
   if(MyHour<0) MyHour=MyHour+24;
   if(MyHour>23) MyHour=MyHour-24;
   if(Hour20&&TimeHour(TimeCurrent())==MyHour) return(true);
   MyHour=NNN+21;
   if(MyHour<0) MyHour=MyHour+24;
   if(MyHour>23) MyHour=MyHour-24;
   if(Hour21&&TimeHour(TimeCurrent())==MyHour) return(true);
   MyHour=NNN+22;
   if(MyHour<0) MyHour=MyHour+24;
   if(MyHour>23) MyHour=MyHour-24;
   if(Hour22&&TimeHour(TimeCurrent())==MyHour) return(true);
   MyHour=NNN+23;
   if(MyHour<0) MyHour=MyHour+24;
   if(MyHour>23) MyHour=MyHour-24;
   if(Hour23&&TimeHour(TimeCurrent())==MyHour) return(true);
   
   NNN=0;
   MyHour=0;
   return(false);
}
   
void SetPrefSuff()
{
   if(IsTesting()) 
   {
      if(MyPrefix == "") MyPrefix = "";
      if(MySuffix == "") MySuffix = "";
      return;
   }
   switch(BrokerVariant)
   {
      case 1: //  Grand
      {
         if(MyPrefix == "") MyPrefix = "";
         if(MySuffix == "") MySuffix = "_OP";
         if(UseDebug) Print("Применены настройки для брокера GrandCapital");
         break;
      }
      case 2: //  WForex America
      {
         if(MyPrefix == "") MyPrefix = "";
         if(MySuffix == "") MySuffix = "ab";
         if(UseDebug) Print("Применены настройки для брокера WForex America");
         break;
      }
      case 3: //  WForex Europe
      {
         if(MyPrefix == "") MyPrefix = "";
         if(MySuffix == "") MySuffix = "b";
         if(UseDebug) Print("Применены настройки для брокера WForex Europe");
         break;
      }
      case 4: //  GDMFX
      {
         if(MyPrefix == "") MyPrefix = "";
         if(MySuffix == "") MySuffix = "bo";
         if(UseDebug) Print("Применены настройки для брокера GDMFX");
         break;
      }
      case 5: //  Larson
      {
         if(MyPrefix == "") MyPrefix = "";
         if(MySuffix == "") MySuffix = "_bo";
         if(UseDebug) Print("Применены настройки для брокера Larson");
         break;
      }
      case 6: //  MikiForex
      {
         if(MyPrefix == "") MyPrefix = "";
         if(MySuffix == "") MySuffix = "bo";
         if(UseDebug) Print("Применены настройки для брокера MikiForex");
         break;
      }
      case 7: //  NoaFX
      {
         if(MyPrefix == "") MyPrefix = "";
         if(MySuffix == "") MySuffix = "bo";
         if(UseDebug) Print("Применены настройки для брокера NoaFX");
         break;
      }
      case 8: //  StarfishFX
      {
         if(MyPrefix == "") MyPrefix = "";
         if(MySuffix == "") MySuffix = "bo";
         if(UseDebug) Print("Применены настройки для брокера StarfishFX");
         break;
      }
      case 9: //  Clmforex
      {
         if(MyPrefix == "") MyPrefix = "";
         if(MySuffix == "") MySuffix = "bo";
         if(UseDebug) Print("Применены настройки для брокера Clmforex");
         break;
      }
      case 10: //  RinkostMarkets
      {
         if(MyPrefix == "") MyPrefix = "";
         if(MySuffix == "") MySuffix = "bo";
         if(UseDebug) Print("Применены настройки для брокера RinkostMarkets");
         break;
      }
      case 11: //  GoMarkets
      {
         if(MyPrefix == "") MyPrefix = "";
         if(MySuffix == "") MySuffix = ".bo";
         if(UseDebug) Print("Применены настройки для брокера GoMarkets");
         break;
      }
      case 12: //  DirectFX
      {
         if(MyPrefix == "") MyPrefix = "";
         if(MySuffix == "") MySuffix = "bo";
         if(UseDebug) Print("Применены настройки для брокера DirectFX");
         break;
      }
   }
   return;
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

//+------------------------------------------------------------------+
//| Открытие ордера                                                  |
//+------------------------------------------------------------------+
void OpenOrder (int direction)
{
   int ticket=0,i=0,err=0;
   double Lots=MM(AccountBalance());
   color Color=Black;
   double OpenPrice=0;

   if(BrokerVariant == 1 || BrokerVariant == 8) Comm=IntegerToString(Expiration);
   else Comm="BO exp:"+IntegerToString(Expiration*60);
   if(direction==OP_BUY) 
   {
      Color=Blue;
      OpenPrice=Ask;
   }
   if(direction==OP_SELL) 
   {
      Color=Red;
      OpenPrice=Bid;
   }
   for (i = 1; i <= MathMax(1, RetryAttempts); i++)
   {
      ticket=0;
      RefreshRates();
      if(UseDebug) Print("Сов шлет ордер по символу ",_Symbol,", направление=",direction,", Lots=",Lots,", OpenPrice=",OpenPrice,", Comm=",Comm);
      ticket=OrderSend(_Symbol, direction,Lots, OpenPrice, 0, 0, 0,Comm, Magic, 0, Color);
      if(ticket>0)
      {
         if(UseDebug) Print("Ордер ушел, все ок!");
         if(MailSend) SendMail("Новый ордер от Charlie по паре "+_Symbol,"Новый ордер от Charlie по паре "+_Symbol+" Брокер:"+AccountInfoString(ACCOUNT_COMPANY));
         if(PushSend) SendNotification("Новый ордер от Charlie по паре "+_Symbol+" Брокер:"+AccountInfoString(ACCOUNT_COMPANY));
         return;
      }
      if(ticket<=0&&i < MathMax(1, RetryAttempts)) 
      {
         if(UseDebug) Print("Ордер не выставлен, пробуем снова через 5 секунд! Попытка №", IntegerToString(i));
         err = GetLastError();
         if(err>0) Print("Ошибка : ",0);
         SleepRandomTime();
         continue;
      }
      if(ticket<=0&&i == MathMax(2, RetryAttempts)) 
      {
         if(UseDebug) Print("Ордер не выставлен!");
         err = GetLastError();
         if(err>0) 
            {
            Print("Ошибка : ",0);
            if(MailSend) SendMail("Ордер от Charlie по паре "+_Symbol,"Новый ордер от Charlie по паре "+_Symbol+" не выставлен! Брокер:"+AccountInfoString(ACCOUNT_COMPANY)+", Ошибка:"+0);
            if(PushSend) SendNotification("Новый ордер от Charlie по паре "+_Symbol+" не выставлен! Брокер:"+AccountInfoString(ACCOUNT_COMPANY)+", Ошибка:"+0);
            }
         return;
      }
   }
return;
}


double MM(double Deposit)
{
   double Lots = 0;
   double MinLots = MarketInfo(_Symbol,MODE_MINLOT);
   double MaxLots = MarketInfo(_Symbol,MODE_MAXLOT);
   double LotStep = MarketInfo(_Symbol,MODE_LOTSTEP);
   switch(MMVariant)
   {
      case 1:
         Lots = Lot;
         if(UseDebug) Print("FixLot=",Lot);
         break;
      case 2:
         Lots = Deposit*Risk/100;
         if(UseDebug) Print("%Lot Risk=",Risk,", Deposit=",Deposit);
         break;
      case 3:
      {
         if(Deposit<=StartDepo) Lots = MinLots;
         if(Deposit>StartDepo) Lots = MinLots + MinLots*((Deposit-StartDepo)/StepDelta)*Step;
         if(UseDebug) Print("StepLot=",Lots);
         break;
      }
   }
   if(BrokerVariant==4) Lots = Lots/1000;
   if(BrokerVariant==5) Lots = Lots/1000;
   if (Lots<MinLots) Lots = MinLots;
   if (Lots>MaxLots) Lots = MaxLots;
   if (BrokerVariant==4&&Lots>1) Lots = 1.0;
   if(LotStep == 1) Lots = NormalizeDouble(Lots,0);
   if(LotStep == 0.1) Lots = NormalizeDouble(Lots,1);
   if(LotStep == 0.01) Lots = NormalizeDouble(Lots,2);
   if(LotStep == 0.001) Lots = NormalizeDouble(Lots,3);
   return(Lots);
}

bool AllOrders()
{
   if(MaxOrders == 0 && MaxRisk == 0) return(true);
   int count = 0;
   double countLots = 0;
   for (int i=0; i<OrdersTotal(); i++)
   {
      if(OrderSelect(i, SELECT_BY_POS, MODE_TRADES)) 
      {
         if(OrderType()==OP_BUY||OrderType()==OP_SELL)
         {
            count++;
            countLots = countLots + OrderLots();
         }
      }
   }
   if(MaxOrders != 0 && count >= MaxOrders)
   {
      if(UseDebug) Print("Превышено максимальное количество открытых ордеров");
      return(false);
   }
   if(countLots>0 && MaxRisk != 0 && (countLots/AccountBalance())*100 >=MaxRisk) 
   {
      if(UseDebug) Print("Превышен максимальный риск по депозиту");
      return(false);
   }
   
   return(true);
}

void VOrderClose(int expiration)
{
   bool VProfit=false;
   if(TimeCurrent() - VOrderOpenTime >= expiration * 60)
   {
      if(VOrderBuy)    
      {
         FileWrite(HandleVT,_Symbol,TimeToStr(VOrderOpenTime),"Buy", DoubleToStr(VOrderOpenLots,2),DoubleToStr(VOrderOpenPrice,_Digits),IntegerToString(Magic),TimeToStr(TimeCurrent()),DoubleToStr(Bid,_Digits),DoubleToStr((Bid-VOrderOpenPrice)/_Point,2));
         if(VOrderOpenPrice<Bid) VProfit=true;
      }
      if(VOrderSell)   
      {
         FileWrite(HandleVT,_Symbol,TimeToStr(VOrderOpenTime),"Sell",DoubleToStr(VOrderOpenLots,2),DoubleToStr(VOrderOpenPrice,_Digits),IntegerToString(Magic),TimeToStr(TimeCurrent()),DoubleToStr(Ask,_Digits),DoubleToStr((VOrderOpenPrice-Ask)/_Point,2));
         if(VOrderOpenPrice>Ask) VProfit=true;
      }
      VOrderBuy = false;
      VOrderSell = false;
      VOrderOpenTime = 0;
      
      if(UseDebug&&VProfit) Print("Виртуальный ордер закрыт в прибыль, все ок!");
      if(UseDebug&&!VProfit) Print("Виртуальный ордер закрыт в убыток, так бывает!");
      VProfit=false;
   }
   return;
}


void VOpenOrder (int direction)
{
   double OpenPrice=0;
   double Lots=MM(AccountBalance());
   if(direction==OP_BUY) 
   {
      OpenPrice=Ask;
      VOrderBuy = true;
      if(UseDebug) Print("Выставлен виртуальный ордер бай");
   }
   if(direction==OP_SELL) 
   {
      OpenPrice=Bid;
      VOrderSell = true;
      if(UseDebug) Print("Выставлен виртуальный ордер селл");
   }
   VOrderOpenTime = TimeCurrent();
   VOrderOpenPrice = OpenPrice;
   VOrderOpenLots = Lots;
   return;
}

int SignalOpen()
{
   if(!AllOrders()) return(-5);
   double Close1 = iClose(_Symbol,PERIOD_H1,1);
   double Close2 = iClose(_Symbol,PERIOD_M15,1);
   double Close3 = iClose(_Symbol,PERIOD_M5,2);
   double KeltL1 = iMA(_Symbol, PERIOD_H1, KCPeriod, 0, MODE_SMMA, PRICE_CLOSE,1) - KCDev * iATR(_Symbol,PERIOD_H1,KCPeriod,1);
   double KeltH1 = iMA(_Symbol, PERIOD_H1, KCPeriod, 0, MODE_SMMA, PRICE_CLOSE,1) + KCDev * iATR(_Symbol,PERIOD_H1,KCPeriod,1);
      
      if(Close1+KCPipDev*_Point<KeltL1)
      {
         double WPR1 = iWPR(_Symbol,PERIOD_M15,WPRPeriod,0);
         if(WPR1<WPREnterLevel-100)
         {
            double RSI = iRSI(_Symbol,PERIOD_H1,RSIPer,PRICE_CLOSE,0);
            if(RSI<RSIEnterLevel)
            {
               double KeltL15 = iMA(_Symbol, PERIOD_M1, KC2Period, 0, MODE_EMA, PRICE_CLOSE,1) - KC2Dev * iATR(_Symbol,PERIOD_M1,KC2Period,1);
               double KeltL151 = iMA(_Symbol, PERIOD_M1, KC2Period, 0, MODE_EMA, PRICE_CLOSE,2) - KC2Dev * iATR(_Symbol,PERIOD_M1,KC2Period,2);
               if(Close2+KC2PipDev*_Point<KeltL15&&Close3+KC2PipDev*_Point<KeltL151)
               {
                  double WPRM15 = iWPR(_Symbol,PERIOD_M1,WPR2Period,0);
                  if(WPRM15<WPR2EnterLevel-100) 
                  {
                     if(UseDebug&&CountBuy()==0) Print("Получен сигнал на покупку на следующих настройках: Expiration = ",Expiration,", WPRPeriod = ",WPRPeriod,
                                       ", WPREnterLevel = ",WPREnterLevel);
                     if(UseDebug&&CountBuy()==0) Print(", KCPeriod = ",KCPeriod,", KCPipDev = ",KCPipDev,", KCDev = ",KCDev,
                                       ", WPR2Period = ",WPR2Period,", WPR2EnterLevel = ",WPR2EnterLevel,", KC2Period = ",KC2Period,", KC2PipDev = ",KC2PipDev,
                                       ", KC2Dev = ",KC2Dev,", RSIPer = ",RSIPer,", RSIEnterLevel = ",RSIEnterLevel);
                     FirstOpenPrice=Ask;
                     FirstOpenTime = TimeCurrent();
                     return(OP_BUY);
                  }
               }
            }
         }
      }
      if(Close1-KCPipDev*_Point>KeltH1)
      {
         double WPR1 = iWPR(_Symbol,PERIOD_M15,WPRPeriod,0);
         if(WPR1>-WPREnterLevel)
         {
            double RSI = iRSI(_Symbol,PERIOD_H1,RSIPer,PRICE_CLOSE,0);
            if(RSI>100-RSIEnterLevel)
            {
               double KeltH15 = iMA(_Symbol, PERIOD_M1, KC2Period, 0, MODE_EMA, PRICE_CLOSE,1) + KC2Dev * iATR(_Symbol,PERIOD_M1,KC2Period,1);
               double KeltH151 = iMA(_Symbol, PERIOD_M1, KC2Period, 0, MODE_EMA, PRICE_CLOSE,2) + KC2Dev * iATR(_Symbol,PERIOD_M1,KC2Period,2);
               if(Close2-KC2PipDev*_Point>KeltH15&&Close3-KC2PipDev*_Point>KeltH151)
               {
                  double WPRM15 = iWPR(_Symbol,PERIOD_M1,WPR2Period,0);
                  if(WPRM15>-WPR2EnterLevel) 
                  {
                     if(UseDebug&&CountSell()==0) Print("Получен сигнал на продажу на следующих настройках: Expiration = ",Expiration,", WPRPeriod = ",WPRPeriod,
                                       ", WPREnterLevel = ",WPREnterLevel);
                     if(UseDebug&&CountSell()==0) Print(", KCPeriod = ",KCPeriod,", KCPipDev = ",KCPipDev,", KCDev = ",KCDev,
                                       ", WPR2Period = ",WPR2Period,", WPR2EnterLevel = ",WPR2EnterLevel,", KC2Period = ",KC2Period,", KC2PipDev = ",KC2PipDev,
                                       ", KC2Dev = ",KC2Dev,", RSIPer = ",RSIPer,", RSIEnterLevel = ",RSIEnterLevel);
                     FirstOpenPrice=Bid;
                     FirstOpenTime = TimeCurrent();
                     return(OP_SELL);
                  }
               }
            }
         }
      }
   return(-5);
}

//+------------------------------------------------------------------+
//| Magic generation                                                 |
//+------------------------------------------------------------------+
int makeMagicNumber(string key)
{
int i,n;
int h = 0;
if (IsTesting()) 
   {
   key = "_" + key;
   }
for (i = 0; i < StringLen(key); i++) 
   {
   n = StringGetChar(key, i);
   h = h + n;
   h = bitRotate(h, 5);
   }
for (i = 0; i < StringLen(key); i++) 
   {
   n = StringGetChar(key, i);
   h = h + n;
   h = bitRotate(h, n & 0x0000000F);
   }
for (i = StringLen(key); i > 0; i--) 
   {
   n = StringGetChar(key, i - 1);
   h = h + n;
   h = bitRotate(h, h & 0x0000000F);
   }
return(h & 0x7fffffff);
}

int bitRotate(int value, int count) 
   {
   int tmp, mask;
   mask = (0x00000001 << count) - 1;
   tmp = value & mask;
   value = value >> count;
   value = value | (tmp << (32 - count));
   return(value);
   }
   
// Функция включения/отключения эксперта.
void ExpertEnabled (bool Switch) // TRUE - включить эксперт, FALSE - отключить эксперт.
{
  int HandlWindow = WindowHandle (Symbol(), Period()); // Системный дескриптор окна.
  int HandlMT4;        // Системный дескриптор окна МТ4.
  int HandlToolbar;    // Системный дескриптор окна инструментов.

  int    ArIntTemp[1]; // Временный массив.
  //----
  if ((Switch && !IsExpertEnabled()) || (!Switch && IsExpertEnabled()) )  {
     HandlMT4 = GetAncestor (HandlWindow, 2); 
     HandlToolbar = GetDlgItem (HandlMT4, 0x63);
     ArIntTemp[0] = HandlToolbar;
     SendMessageA (HandlMT4, WM_COMMAND, 33020, ArIntTemp);
  }
}

bool CheckStatus()
{
   if (!TerminalInfoInteger(TERMINAL_TRADE_ALLOWED)) 
   {
      ExpertEnabled (true);
      Print("Кнопка автоторговли была отжата. Мы ее нажали обратно, но не делайте так больше!");
   }
   if(!MQLInfoInteger(MQL_TRADE_ALLOWED))
      Print("Автоматическая торговля запрещена в свойствах советника! F7-вкладка Общие");
   //Проверка разрешения на торговлю любым экспертам/скриптам для данного счета
   if(!AccountInfoInteger(ACCOUNT_TRADE_EXPERT))
   {
      Print("Нигадяй брокер отключил торговлю советниками у себя на сервере!");
      return(false);
   }
   if(!AccountInfoInteger(ACCOUNT_TRADE_ALLOWED))
      Print("Торговля не разрешена!");
   if(!IsConnected())
   {
      Print("Связь потеряна, щас будем восстанавливать добровольно-принудительно!!");
      if(!ReConnect())
      {
         Print("Связь ушла, но обещала вернуться. Повисим на графике, пока все не уляжется :(");
      }
   }  
   return(true);
}

void PrintAccParams()
{
   string str = "";
   Print("Номер счета: ", AccountInfoInteger(ACCOUNT_LOGIN));
   Print("Имя клиента: ", AccountInfoString(ACCOUNT_NAME));
   Print("Имя компании, обслуживающей счет: ", AccountInfoString(ACCOUNT_COMPANY));
   Print("Имя торгового сервера: ", AccountInfoString(ACCOUNT_SERVER));
   Print("Валюта депозита: ", AccountInfoString(ACCOUNT_CURRENCY));
   
   switch((int)AccountInfoInteger(ACCOUNT_TRADE_MODE))
   {
      case ACCOUNT_TRADE_MODE_DEMO:
      {
         str = "Демонстрационный торговый счет";
         break;
      }
      case ACCOUNT_TRADE_MODE_CONTEST:
      {
         str = "Конкурсный торговый счет";
         break;
      }
      case ACCOUNT_TRADE_MODE_REAL:
      {
         str = "Реальный торговый счет";
         break;
      }
   }
   Print("Тип торгового счета: ", str);
   Print("Размер предоставленного плеча: ", AccountInfoInteger(ACCOUNT_LEVERAGE));
   Print("Максимально допустимое количество действующих отложенных ордеров (0-ограничений нет): ", AccountInfoInteger(ACCOUNT_LIMIT_ORDERS));
   switch((int)AccountInfoInteger(ACCOUNT_MARGIN_SO_MODE))
   {
      case ACCOUNT_STOPOUT_MODE_PERCENT:
      {
         str = "Уровень задается в процентах";
         break;
      }
      case ACCOUNT_STOPOUT_MODE_MONEY:
      {
         str = "Уровень задается в деньгах";
         break;
      }
   }
   Print("Режим задания минимально допустимого уровня залоговых средств: ", str);
   Print("Баланс счета в валюте депозита: ", AccountInfoDouble(ACCOUNT_BALANCE));
   Print("Уровень Margin Call: ", AccountInfoDouble(ACCOUNT_MARGIN_SO_CALL));
   Print("Уровень Stop Out: ", AccountInfoDouble(ACCOUNT_MARGIN_SO_SO));
}

void SleepRandomTime()
   {
   if (IsTesting()||IsOptimization()) return;

   double tenths = MathCeil(SleepTime / 0.1);
   if (tenths <= 0) return; 
    
   double maxtenths = MathRound(SleepMaximum/0.1); 
   double p = 1.0 - 1.0/tenths; 
     
   Sleep(1000);
   for(int i=0; i<maxtenths; i++)  {
      if (MathRand() > p*32768) break;
      Sleep(1000); 
   }
}

//+------------------------------------------------------------------+
//|  Сканирование серверов и реконнект при обрыве связи              |
//+------------------------------------------------------------------+
// Функция выполняет сканирование серверов брокера и реконнект в
// случае обрыва связи
bool ReConnect()
{
   if((!IsTesting() && !IsOptimization()&&!IsConnected()&&!IsStopped())||GetLastError()==6) 
   {
      Print("Щас будем сканировать сервера!");
      for (int q = 1; q <= RetryAttempts; q++) 
      {
         ReScanServers();
         if(IsConnected()) break;
         SleepRandomTime();
         RefreshRates();
      }
      if(IsConnected()) 
      {
         Print("Соединение восстановлено!");
         return (true);
      }
      else 
      {
         Print("Пересканирование не помогло, перезайдем на счет!");
         ReLoginAccount();
      }
      Print("Соединение не восстановлено! Баста!");
      return (false);
   }
   return (true);
}
   
int ReScanServers()
   {
   int hwindow=GetAncestor(WindowHandle(Symbol(),Period()),2);    // получаем хендл главного окна
   Print("Пересканирование! Пересканируем Серверы...");    // выведем сообщение
   if(hwindow!=0) 
      {                                               // нашли главное окно
      // посылаем сообщение "пересканировать серверы" 
      return(PostMessageA(hwindow,WM_COMMAND,37400,0)); 
      }
   return(-1);
   }
   
void ReLoginAccount()
   {
   int hwnd=GetAncestor(WindowHandle(Symbol(),Period()),2);           // получаем хендл главного окна
   PostMessageA(hwnd,WM_COMMAND,35429,0);  // открыли окно ввода Логина и Пароля.
   SleepRandomTime();                                                  // делаем паузу, ждем
   hwnd=GetActiveWindow();                                        // нашли хэндл окна ввода Логина и Пароля
   hwnd=GetDlgItem(hwnd,0x1);                                     // нашли хэндл кнопки ЛОГИН
   SleepRandomTime();                                                  // делаем паузу, ждем
   SendMessageA(hwnd,WM_COMMAND,0,0);                               // нажали кнопку ЛОГИН 
   return;
   }
   
        
