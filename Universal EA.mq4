//+------------------------------------------------------------------+
//|                                                 Universal EA.mq4 |
//|                                                       MFOREX.PRO |
//|                                           https://www.mforex.pro |
//+------------------------------------------------------------------+
#property copyright "MFOREX.PRO"
#property link      "https://www.mforex.pro"
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//|========================= Параметры ==============================|                                                    
//+------------------------------------------------------------------+   
extern double    Risk             =0.01; 
extern int       ProfitPips       =10;
extern int       TimeFrame        =1;  
extern int       TimeStart        =3; 
extern int       TimeEnd          =23;
extern int       Step             =20;
extern int       HowBar           =20; 
extern double    ExpBar           =2;
extern int       MaxOrders        =200;
extern int       Magic            =2020;
extern int       SpeedEA          =50;
extern bool      Info             =true;  
extern color     TextColor        =White;   
extern color     InfoDataColor    =DodgerBlue; 
extern color     FonColor         =Black;   
extern int       FontSizeInfo     =7;      
//+------------------------------------------------------------------+
//|====================== Доп. Переменные ===========================|
//+------------------------------------------------------------------+
string           Commemt          ="www.mforex.pro";
int              D,o;
double           Lot              =0;
int              dig;
color            FonButtonBuy     =Blue;
color            FonButtonSell    =Red;
color            TextButtonBS     =White; 
color            ButtonBorder     =Blue;
color            ClickButton      =Black;
int              AccNumber        =0;
//+------------------------------------------------------------------+
//|====================== Инициализация =============================|
//+------------------------------------------------------------------+
int OnInit()
{
EventSetMillisecondTimer(SpeedEA);
D=1;
if (Digits==5 || Digits==3)
{D=10;}
return(INIT_SUCCEEDED);
}
//+------------------------------------------------------------------+
//|===================== ДеИнициализация ============================|
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
{
EventKillTimer();
ObjectsDeleteAll(0,OBJ_LABEL);
ObjectsDeleteAll(0,OBJ_RECTANGLE_LABEL);
}
//+------------------------------------------------------------------+
//|======================== Старт ===================================|
//+------------------------------------------------------------------+
void OnTick()
{
//============== Привязываем к номеру счета ========================
if(AccNumber>0 && AccountNumber()!=AccNumber) 
{
RectLabelCreate("ERROR_FON",850,100,300,120,FonColor,1);
PutLabelD("ERROR_TEXT1",780,110,"NOT A VALID ACCOUNT NUMBER!",1);
PutLabelT("ERROR_TEXT2",845,130,"Contact the author:",1);
PutLabelT("ERROR_TEXT3",845,150,"Skype:",1);
PutLabelD("ERROR_TEXT4",780,150,"live:mforex.pro",1);
PutLabelT("ERROR_TEXT5",845,170,"Telegram:",1);
PutLabelD("ERROR_TEXT6",780,170,"@mforexpro",1);
PutLabelT("ERROR_TEXT7",845,190,"E-Mail:",1);
PutLabelD("ERROR_TEXT8",780,190,"mforex.pro@gmail.com",1);
}
else
{
//======= Находим лот 
Lot=NormalizeDouble(AccountBalance()/100*Risk/(MarketInfo(Symbol(),MODE_TICKVALUE)*100*D),2);
if(Lot<MarketInfo(Symbol(),MODE_MINLOT)) {Lot=MarketInfo(Symbol(),MODE_MINLOT);} 
if(Lot>=MarketInfo(Symbol(),MODE_MAXLOT)) {Lot=MarketInfo(Symbol(),MODE_MAXLOT);}

if(MarketInfo(Symbol(),MODE_LOTSTEP)==0.01)     dig =2;
if(MarketInfo(Symbol(),MODE_LOTSTEP)==0.10)     dig =1;
if(MarketInfo(Symbol(),MODE_LOTSTEP)==1.00)     dig =0;
//======= Точка входа
bool GoBuy =false;
bool GoSell =false;

bool buy =false;
bool sell =false;

if(iOpen(Symbol(),TimeFrame,0)>iClose(Symbol(),TimeFrame,0) && AverageBar(HowBar)*ExpBar<(iOpen(Symbol(),TimeFrame,0)-iClose(Symbol(),TimeFrame,0))/Point)
{
buy=true;
}

if(iOpen(Symbol(),TimeFrame,0)<iClose(Symbol(),TimeFrame,0) && AverageBar(HowBar)*ExpBar<(iClose(Symbol(),TimeFrame,0)-iOpen(Symbol(),TimeFrame,0))/Point)
{
sell=true; 
}
  
if(TimeHour(TimeCurrent())>=TimeStart && TimeHour(TimeCurrent())<TimeEnd)
{    
if(buy) {GoBuy=true;}
if(sell) {GoSell=true;}    
} 
//======= Открываем ордера
if(CountHistBar(-1)==0)
{
if(Count(-1)==0 && GoSell && AccountFreeMarginCheck(Symbol(),OP_SELL,Lot)>0)
{o=OrderSend(Symbol(),OP_SELL,Lot,Bid,5,0,0,Commemt,Magic,0,Red);}

if(Count(-1)==0 && GoBuy && AccountFreeMarginCheck(Symbol(),OP_BUY,Lot)>0)
{o=OrderSend(Symbol(),OP_BUY,Lot,Ask,5,0,0,Commemt,Magic,0,Green);}    
//======= Сетки ордепров
if(CountAll(-1)<MaxOrders && (CountAll(-1)<AccountInfoInteger(ACCOUNT_LIMIT_ORDERS) || AccountInfoInteger(ACCOUNT_LIMIT_ORDERS)==0) && CountBar(-1)==0)
{
if(Count(OP_BUY)>0 && GoBuy)
{o=OrderSend(Symbol(),OP_BUY,Lot,Ask,10,0,0,Commemt,Magic,0,Green);}  

if(Count(OP_SELL)>0 && GoSell)
{o=OrderSend(Symbol(),OP_SELL,Lot,Bid,10,0,0,Commemt,Magic,0,Red);} 
}
}
//======= Закрываем ордера при достижении прибыли
double ProfProc=AllLots(-1)*ProfitPips;
if(ProfitAll(-1)>=ProfProc && ProfProc!=0)
{
ClosePos();
}
//======= Вывод информации на график
if(Info)
{
   RectLabelCreate3("INFO_fon",220,20,200,225,FonColor);
   
   PutLabel("INFO_LOGO",165,24,"WWW.MFOREX.PRO");
   PutLabel("INFO_Line",215,27,"___________________________");
   PutLabel_("INFO_txt1",215,45,"Account information");
   PutLabel("INFO_Line2",215,47,"___________________________");
   PutLabel("INFO_txt2",215,65,"Minimum stop:");
   PutLabel("INFO_txt3",215,80,"Average bar:");
   PutLabel("INFO_txt4",215,95,"Balanse:");
   PutLabel("INFO_txt5",215,110,"Equity:");
   PutLabel("INFO_Line3",215,112,"___________________________");
   PutLabel_("INFO_txt6",215,130,"Profit on account");
   PutLabel("INFO_Line4",215,132,"___________________________");
   PutLabel("INFO_txt7",215,150,"Profit on pair:");
   PutLabel("INFO_txt8",215,165,"Total profit:");
   PutLabel("INFO_txt9",215,180,"Profit for today:");
   PutLabel("INFO_txt10",215,195,"Profit for yesterday:");
   PutLabel("INFO_txt11",215,210,"Profit for week:");
   PutLabel("INFO_txt12",215,225,"Profit for month:");
   
   PutLabel_("INFO_txt13",85,65,DoubleToStr(MarketInfo(Symbol(),MODE_STOPLEVEL),0));
   PutLabel_("INFO_txt14",85,80,DoubleToStr(AverageBar(HowBar),0));
   PutLabel_("INFO_txt15",85,95,DoubleToStr(AccountBalance(),2));
   PutLabel_("INFO_txt16",85,110,DoubleToStr(AccountEquity(),2));
   PutLabel_("INFO_txt17",85,150,DoubleToStr(Profit(-1),2));
   PutLabel_("INFO_txt18",85,165,DoubleToStr(ProfitAll(-1),2));
   PutLabel_("INFO_txt19",85,180,DoubleToStr(ProfitDey(-1),2));
   PutLabel_("INFO_txt20",85,195,DoubleToStr(ProfitTuDey(-1),2));
   PutLabel_("INFO_txt21",85,210,DoubleToStr(ProfitWeek(-1),2));
   PutLabel_("INFO_txt22",85,225,DoubleToStr(ProfitMontag(-1),2));
   
   PutButtonBS("TRADEs_B",220,245,"BUY           " + DoubleToStr(Lot, dig),100,22,FonButtonBuy,TextButtonBS);
   PutButtonBS("TRADEs_S",118,245,"SELL           " + DoubleToStr(Lot, dig),100,22,FonButtonSell,TextButtonBS);
}
//======= Завершение
}
}
//+------------------------------------------------------------------+
//|   Кнопки                                                         |
//+------------------------------------------------------------------+
void OnChartEvent(const int id, const long &lparam, const double &dparam, const string &sparam)
{
//+------------------------------------------------------------------+
//   Изменяем цвет кнопок при нажатии
//+------------------------------------------------------------------+  
if(ObjectGetInteger(0,"TRADEs_B",OBJPROP_STATE))
 {ObjectSetInteger(0,"TRADEs_B",OBJPROP_BGCOLOR,ClickButton);}
else 
 {ObjectSetInteger(0,"TRADEs_B",OBJPROP_BGCOLOR,FonButtonBuy);}
//------------------ 
if(ObjectGetInteger(0,"TRADEs_S",OBJPROP_STATE))
 {ObjectSetInteger(0,"TRADEs_S",OBJPROP_BGCOLOR,ClickButton);}
else 
 {ObjectSetInteger(0,"TRADEs_S",OBJPROP_BGCOLOR,FonButtonSell);}
//------------------
//+------------------------------------------------------------------+
//    Проверим событие на нажатие кнопки мышки
//+------------------------------------------------------------------+
if(id==CHARTEVENT_OBJECT_CLICK)
{string clickedChartObject=sparam;

if(clickedChartObject=="TRADEs_B")
  {o=OrderSend(Symbol(),OP_BUY,Lot,Ask,10,0,0,Commemt,Magic,0,Green);       
   ObjectSetInteger(0,"TRADEs_B",OBJPROP_STATE,false);}
if(clickedChartObject=="TRADEs_S")
  {o=OrderSend(Symbol(),OP_SELL,Lot,Bid,10,0,0,Commemt,Magic,0,Red);
   ObjectSetInteger(0,"TRADEs_S",OBJPROP_STATE,false);}
//--- Принудительно перерисуем все объекты на графике

ChartRedraw();
}}
//+------------------------------------------------------------------+
//|========================== Функции ===============================|
//+------------------------------------------------------------------+
//======== Счетчик ордеров в истории на текущем баре ================
int CountHistBar(int type)
{
int count=0;
for(int i=OrdersHistoryTotal()-1;i>=0;i--)
 if(OrderSelect(i,SELECT_BY_POS,MODE_HISTORY))
  {
  if(Symbol()==OrderSymbol() && OrderMagicNumber()==Magic && OrderCloseTime()>=iTime(Symbol(),TimeFrame,0) && (type==-1 || OrderType()==type)) 
  {
  count++;
  }
  }
return(count);}
//======== Счетчик ордеров на текущем баре ================
int CountBar(int type)
{
int count=0;
for(int i=OrdersTotal()-1;i>=0;i--)
 if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
  {
  if(Symbol()==OrderSymbol() && OrderMagicNumber()==Magic && OrderOpenTime()>=iTime(Symbol(),TimeFrame,0) && (type==-1 || OrderType()==type)) 
  {
  count++;
  }
  }
return(count);}
//-- Закрытие ордеров (Закрыть все)

void ClosePos()
{bool cl;
 for(int i=OrdersTotal()-1;i>=0;i--)
{if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
{if(OrderMagicNumber()==Magic)
{if(OrderType()==0)
{RefreshRates();
 cl=OrderClose(OrderTicket(),OrderLots(),NormalizeDouble(MarketInfo(OrderSymbol(),MODE_BID),Digits),10,White);}
if(OrderType()==1)
{RefreshRates();
 cl=OrderClose(OrderTicket(),OrderLots(),NormalizeDouble(MarketInfo(OrderSymbol(),MODE_ASK),Digits),10,White);}}}}}
//--- Сумма открытых лотов

double AllLots(int type) 
{double lot = 0;
   for (int cnt = OrdersTotal() - 1; cnt >= 0; cnt--) {
      if(OrderSelect(cnt, SELECT_BY_POS, MODE_TRADES))
      {if (OrderMagicNumber()==Magic && (OrderType() == type || type==-1)) lot += OrderLots();}}
       return (lot);}
//--- Счетчик всех ордеров на счете
int CountAll(int type)
{
int count=0;
for(int i=OrdersTotal()-1;i>=0;i--)
 if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
  {
  if(OrderMagicNumber()==Magic &&  (type==-1 || OrderType()==type)) 
  {
  count++;
  }
  }
return(count);}
//================ Находим цену последнего бай =======================
double BuyPric() {
   double oldorderopenprice=0;
   int oldticketnumber;
   double unused = 0;
   int ticketnumber = 0;
   for (int cnt = OrdersTotal() - 1; cnt >= 0; cnt--) {
      bool clos=OrderSelect(cnt, SELECT_BY_POS, MODE_TRADES);
      if (OrderSymbol() != Symbol() || OrderMagicNumber() != Magic) continue;
      if (OrderSymbol() == Symbol() && OrderMagicNumber() == Magic && OrderType() == OP_BUY) {
         oldticketnumber = OrderTicket();
         if (oldticketnumber > ticketnumber) {
            oldorderopenprice = OrderOpenPrice();
            unused = oldorderopenprice;
            ticketnumber = oldticketnumber;}}}
   return (oldorderopenprice);}
//================ Находим цену последнего селл ====================== 
double SellPric() {
   double oldorderopenprice=0;
   int oldticketnumber;
   double unused = 0;
   int ticketnumber = 0;
   for (int cnt = OrdersTotal() - 1; cnt >= 0; cnt--) {
      bool clos=OrderSelect(cnt, SELECT_BY_POS, MODE_TRADES);
      if (OrderSymbol() != Symbol() || OrderMagicNumber() != Magic) continue;
      if (OrderSymbol() == Symbol() && OrderMagicNumber() == Magic && OrderType() == OP_SELL) {
         oldticketnumber = OrderTicket();
         if (oldticketnumber > ticketnumber) {
            oldorderopenprice = OrderOpenPrice();
            unused = oldorderopenprice;
            ticketnumber = oldticketnumber;}}}
   return (oldorderopenprice);}
//======== Средняя величина бара в пипсах ================
double AverageBar(int countCandles)
{
double size=0;
double returnSize=0;
for(int i=1; i<=countCandles; i++) 
{
size+=(iHigh(Symbol(),TimeFrame,i)-iLow(Symbol(),TimeFrame,i))/Point;
}
returnSize=size/countCandles;
return(returnSize);
}
//======= Счетчик ордеров
int Count(int type)
{
int count=0;
for(int i=OrdersTotal()-1;i>=0;i--)
 if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
  {
  if(Symbol()==OrderSymbol() && Magic==OrderMagicNumber() && (type==-1 || OrderType()==type)) 
  {
  count++;
  }
  }
return(count);}
//======= Счетчик текущего профита по паре
double Profit(int type) 
{double Profit = 0;
 for (int cnt = OrdersTotal() - 1; cnt >= 0; cnt--) {
 if(OrderSelect(cnt, SELECT_BY_POS, MODE_TRADES))
{if (Symbol()==OrderSymbol() && OrderMagicNumber()==Magic && (OrderType() == type || type==-1)) Profit += OrderProfit()+OrderSwap()+OrderCommission();}}
return (Profit);}

//======= Счетчик текущего профита по счету
double ProfitAll(int type) 
{double Profit = 0;
   for (int cnt = OrdersTotal() - 1; cnt >= 0; cnt--) {
      if(OrderSelect(cnt, SELECT_BY_POS, MODE_TRADES))
      {if (OrderMagicNumber()==Magic && (OrderType() == type || type==-1)) Profit += OrderProfit()+OrderSwap()+OrderCommission();}}
       return (Profit);}
       
//======= Счетчик зафиксированой прибыли за сегодня 
double ProfitDey(int type) 
{double Profit = 0;
   for (int cnt = OrdersHistoryTotal() - 1; cnt >= 0; cnt--) {
      if(OrderSelect(cnt, SELECT_BY_POS, MODE_HISTORY))
      {if (OrderMagicNumber()==Magic && OrderCloseTime()>=iTime(Symbol(),1440,0) && (OrderType() == type || type==-1)) Profit += OrderProfit()+OrderSwap()+OrderCommission();}}
       return (Profit);}
       
//======= Счетчик зафиксированой прибыли за вчера     
double ProfitTuDey(int type) 
{double Profit = 0;
   for (int cnt = OrdersHistoryTotal() - 1; cnt >= 0; cnt--) {
      if(OrderSelect(cnt, SELECT_BY_POS, MODE_HISTORY))
      {if (OrderMagicNumber()==Magic && OrderCloseTime()>=iTime(Symbol(),1440,1) && OrderCloseTime()<iTime(Symbol(),1440,0) && (OrderType() == type || type==-1)) Profit += OrderProfit()+OrderSwap()+OrderCommission();}}
       return (Profit);}
       
//======= Счетчик зафиксированой прибыли за позавчера       
double ProfitEsTuDey(int type) 
{double Profit = 0;
   for (int cnt = OrdersHistoryTotal() - 1; cnt >= 0; cnt--) {
      if(OrderSelect(cnt, SELECT_BY_POS, MODE_HISTORY))
      {if (OrderMagicNumber()==Magic && OrderCloseTime()>=iTime(Symbol(),1440,2) && OrderCloseTime()<iTime(Symbol(),1440,1) && (OrderType() == type || type==-1)) Profit += OrderProfit()+OrderSwap()+OrderCommission();}}
       return (Profit);}
       
//======= Счетчик зафиксированой прибыли за неделю  
double ProfitWeek(int type) 
{double Profit = 0;
   for (int cnt = OrdersHistoryTotal() - 1; cnt >= 0; cnt--) {
      if(OrderSelect(cnt, SELECT_BY_POS, MODE_HISTORY))
      {if (OrderMagicNumber()==Magic && OrderCloseTime()>=iTime(Symbol(),10080,0) && (OrderType() == type || type==-1)) Profit += OrderProfit()+OrderSwap()+OrderCommission();}}
       return (Profit);}
       
//======= Счетчик зафиксированой прибыли за месяц          
double ProfitMontag(int type) 
{double Profit = 0;
   for (int cnt = OrdersHistoryTotal() - 1; cnt >= 0; cnt--) {
      if(OrderSelect(cnt, SELECT_BY_POS, MODE_HISTORY))
      {if (OrderMagicNumber()==Magic && OrderCloseTime()>=iTime(Symbol(),43200,0) && (OrderType() == type || type==-1)) Profit += OrderProfit()+OrderSwap()+OrderCommission();}}
       return (Profit);}
       
//======= Создаем текстовую метку 
void PutLabel(string name,int x,int y,string text)
  {ObjectCreate(0,name,OBJ_LABEL,0,0,0);
//--- установим координаты метки
   ObjectSetInteger(0,name,OBJPROP_XDISTANCE,x);
   ObjectSetInteger(0,name,OBJPROP_YDISTANCE,y);
//--- установим угол графика, относительно которого будут определяться координаты точки
   ObjectSetInteger(0,name,OBJPROP_CORNER,1);
//--- установим текст
   ObjectSetString(0,name,OBJPROP_TEXT,text);
//--- установим шрифт текста
   ObjectSetString(0,name,OBJPROP_FONT,"Arial");
//--- установим размер шрифта
   ObjectSetInteger(0,name,OBJPROP_FONTSIZE,FontSizeInfo);
//--- установим цвет
   ObjectSetInteger(0,name,OBJPROP_COLOR,TextColor);
//--- скроем (true) или отобразим (false) имя графического объекта в списке объектов
   ObjectSetInteger(0,name,OBJPROP_HIDDEN,false);
//--- отобразим на переднем (false) или заднем (true) плане
   ObjectSetInteger(0,name,OBJPROP_BACK,false);}
   
//======= Создаем вторую текстовую метку
void PutLabel_(string name,int x,int y,string text)
  {ObjectCreate(0,name,OBJ_LABEL,0,0,0);
//--- установим координаты метки
   ObjectSetInteger(0,name,OBJPROP_XDISTANCE,x);
   ObjectSetInteger(0,name,OBJPROP_YDISTANCE,y);
//--- установим угол графика, относительно которого будут определяться координаты точки
   ObjectSetInteger(0,name,OBJPROP_CORNER,1);
//--- установим текст
   ObjectSetString(0,name,OBJPROP_TEXT,text);
//--- установим шрифт текста
   ObjectSetString(0,name,OBJPROP_FONT,"Arial");
//--- установим размер шрифта
   ObjectSetInteger(0,name,OBJPROP_FONTSIZE,FontSizeInfo);
//--- установим цвет
   ObjectSetInteger(0,name,OBJPROP_COLOR,InfoDataColor);
//--- скроем (true) или отобразим (false) имя графического объекта в списке объектов
   ObjectSetInteger(0,name,OBJPROP_HIDDEN,false);
//--- отобразим на переднем (false) или заднем (true) плане
   ObjectSetInteger(0,name,OBJPROP_BACK,false);}
   
//======= Создаем прямоугольник
bool RectLabelCreate3(string  name, int x,int y, int width, int height, color back_clr)
  {ResetLastError(); 
//--- создадим прямоугольную метку 
if(!ObjectCreate(0,name,OBJ_RECTANGLE_LABEL,0,0,0)) 
  {return(false);} 
//--- установим координаты метки 
   ObjectSetInteger(0,name,OBJPROP_XDISTANCE,x); 
   ObjectSetInteger(0,name,OBJPROP_YDISTANCE,y); 
//--- установим размеры метки 
   ObjectSetInteger(0,name,OBJPROP_XSIZE,width); 
   ObjectSetInteger(0,name,OBJPROP_YSIZE,height); 
//--- установим цвет фона 
   ObjectSetInteger(0,name,OBJPROP_BGCOLOR,back_clr); 
//--- установим тип границы 
   ObjectSetInteger(0,name,OBJPROP_BORDER_TYPE,BORDER_SUNKEN); 
//--- установим угол графика, относительно которого будут определяться координаты точки 
   ObjectSetInteger(0,name,OBJPROP_CORNER,1); 
//--- установим цвет плоской рамки (в режиме Flat) 
   ObjectSetInteger(0,name,OBJPROP_COLOR,Blue); 
//--- установим толщину плоской границы 
   ObjectSetInteger(0,name,OBJPROP_WIDTH,1); 
//--- отобразим на переднем (false) или заднем (true) плане 
   ObjectSetInteger(0,name,OBJPROP_BACK,false); 
//--- скроем (true) или отобразим (false) имя графического объекта в списке объектов 
   ObjectSetInteger(0,name,OBJPROP_HIDDEN,false); 
//--- успешное выполнение 
return(true);} 
//--- Кнопки торговой панели (Бай/Селл)

void PutButtonBS(string name,int x,int y,string text,int BWidth2,int BHeigh2,color FonButtonBS,color TXTButtonBS)
  {ObjectCreate(0,name,OBJ_BUTTON,0,0,0);
//--- установим координаты кнопки
   ObjectSetInteger(0,name,OBJPROP_XDISTANCE,x);
   ObjectSetInteger(0,name,OBJPROP_YDISTANCE,y);
//--- установим размер кнопки
   ObjectSetInteger(0,name,OBJPROP_XSIZE,BWidth2);
   ObjectSetInteger(0,name,OBJPROP_YSIZE,BHeigh2);
//--- установим угол графика, относительно которого будут определяться координаты точки
   ObjectSetInteger(0,name,OBJPROP_CORNER,1);
//--- установим текст
   ObjectSetString(0,name,OBJPROP_TEXT,text);
//--- установим шрифт текста
   ObjectSetString(0,name,OBJPROP_FONT,"Arial");
//--- установим размер шрифта
   ObjectSetInteger(0,name,OBJPROP_FONTSIZE,FontSizeInfo);
//--- установим цвет текста
   ObjectSetInteger(0,name,OBJPROP_COLOR,TXTButtonBS);
//--- установим цвет фона
   ObjectSetInteger(0,name,OBJPROP_BGCOLOR,FonButtonBS);
//--- установим цвет границы
   ObjectSetInteger(0,name,OBJPROP_BORDER_COLOR,ButtonBorder);
//--- скроем (true) или отобразим (false) имя графического объекта в списке объектов
   ObjectSetInteger(0,name,OBJPROP_HIDDEN,false);
//--- отобразим на переднем (false) или заднем (true) плане
   ObjectSetInteger(0,name,OBJPROP_BACK,false);
  }
  
void PutLabelT(string name,int x,int y,string text, int space)
  {ObjectCreate(0,name,OBJ_LABEL,0,0,0);
//--- установим координаты метки
   ObjectSetInteger(0,name,OBJPROP_XDISTANCE,x);
   ObjectSetInteger(0,name,OBJPROP_YDISTANCE,y);
//--- установим угол графика, относительно которого будут определяться координаты точки
   ObjectSetInteger(0,name,OBJPROP_CORNER, space);
//--- установим текст
   ObjectSetString(0,name,OBJPROP_TEXT,text);
//--- установим шрифт текста
   ObjectSetString(0,name,OBJPROP_FONT,"Arial");
//--- установим размер шрифта
   ObjectSetInteger(0,name,OBJPROP_FONTSIZE,FontSizeInfo);
//--- установим цвет
   ObjectSetInteger(0,name,OBJPROP_COLOR,TextColor);
//--- скроем (true) или отобразим (false) имя графического объекта в списке объектов
   ObjectSetInteger(0,name,OBJPROP_HIDDEN,false);
//--- отобразим на переднем (false) или заднем (true) плане
   ObjectSetInteger(0,name,OBJPROP_BACK,false);}
   
   
//--- Цвет текста данных

void PutLabelD(string name,int x,int y,string data,int space)
  {ObjectCreate(0,name,OBJ_LABEL,0,0,0);
//--- установим координаты метки
   ObjectSetInteger(0,name,OBJPROP_XDISTANCE,x);
   ObjectSetInteger(0,name,OBJPROP_YDISTANCE,y);
//--- установим угол графика, относительно которого будут определяться координаты точки
   ObjectSetInteger(0,name,OBJPROP_CORNER,space);
//--- установим текст
   ObjectSetString(0,name,OBJPROP_TEXT,data);
//--- установим шрифт текста
   ObjectSetString(0,name,OBJPROP_FONT,"Arial");
//--- установим размер шрифта
   ObjectSetInteger(0,name,OBJPROP_FONTSIZE,FontSizeInfo);
//--- установим цвет
   ObjectSetInteger(0,name,OBJPROP_COLOR,InfoDataColor);
//--- скроем (true) или отобразим (false) имя графического объекта в списке объектов
   ObjectSetInteger(0,name,OBJPROP_HIDDEN,false);
//--- отобразим на переднем (false) или заднем (true) плане
   ObjectSetInteger(0,name,OBJPROP_BACK,false);}

//--- Создаем прямоугольную метку (фон)

bool RectLabelCreate(string  name, int x,int y, int width, int height, color back_clr, int space)
  {ResetLastError(); 
//--- создадим прямоугольную метку 
if(!ObjectCreate(0,name,OBJ_RECTANGLE_LABEL,0,0,0)) 
  {return(false);} 
//--- установим координаты метки 
   ObjectSetInteger(0,name,OBJPROP_XDISTANCE,x); 
   ObjectSetInteger(0,name,OBJPROP_YDISTANCE,y); 
//--- установим размеры метки 
   ObjectSetInteger(0,name,OBJPROP_XSIZE,width); 
   ObjectSetInteger(0,name,OBJPROP_YSIZE,height); 
//--- установим цвет фона 
   ObjectSetInteger(0,name,OBJPROP_BGCOLOR,back_clr); 
//--- установим тип границы 
   ObjectSetInteger(0,name,OBJPROP_BORDER_TYPE,BORDER_SUNKEN); 
//--- установим угол графика, относительно которого будут определяться координаты точки 
   ObjectSetInteger(0,name,OBJPROP_CORNER,space); 
//--- установим цвет плоской рамки (в режиме Flat) 
   ObjectSetInteger(0,name,OBJPROP_COLOR,Blue); 
//--- установим толщину плоской границы 
   ObjectSetInteger(0,name,OBJPROP_WIDTH,1); 
//--- отобразим на переднем (false) или заднем (true) плане 
   ObjectSetInteger(0,name,OBJPROP_BACK,false); 
//--- скроем (true) или отобразим (false) имя графического объекта в списке объектов 
   ObjectSetInteger(0,name,OBJPROP_HIDDEN,false); 
//--- успешное выполнение 
return(true);} 

//--- Таймер

void OnTimer()
  {
   RefreshRates();
   OnTick();
  }