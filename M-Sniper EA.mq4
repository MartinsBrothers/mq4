//+------------------------------------------------------------------+
//|                                                  M-Sniper EA.mq4 |
//|                                                       MFOREX.PRO |
//|                                           https://www.mforex.pro |
//+------------------------------------------------------------------+
#property copyright "MFOREX.PRO"
#property link      "https://www.mforex.pro"
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//|   Выбор языка                                                   
//+------------------------------------------------------------------+
enum Lang{
     r=0,  //RU
     e=1,  //EN
     };
//+------------------------------------------------------------------+
//|   Переменные                                                   
//+------------------------------------------------------------------+
input Lang   Languale          =1;
input bool   UseLotManual      =false;
input double ManualLot         =0.01;
input double Risk              =1;
input double StopLossProcent   =0;
input int    TimeFrame         =1; 
input double PipsStep          =30;
input double MinPips           =30;
input int    ProfitPips        =25;
input string pEURUSD           ="EURUSD";
input int    pEURUSD_Step      =80;
input string pGBPUSD           ="GBPUSD";
input int    pGBPUSD_Step      =100;
input string pAUDUSD           ="AUDUSD";
input int    pAUDUSD_Step      =70;
input string pNZDUSD           ="NZDUSD";
input int    pNZDUSD_Step      =70;
input string pUSDJPY           ="USDJPY";
input int    pUSDJPY_Step      =60;
input string pUSDCAD           ="USDCAD";
input int    pUSDCAD_Step      =120;
input string pUSDCHF           ="USDCHF";
input int    pUSDCHF_Step      =120;
input string pEURJPY           ="EURJPY";
input int    pEURJPY_Step      =110;
input string pGBPJPY           ="GBPJPY";
input int    pGBPJPY_Step      =150;
input int    MaxOrders         =100;
input double TimeStart         =3;  
input double TimeEnd           =23; 
input string MobClosPair       ="EURAUD"; 
input color  FonColor          =Black;
input int    FontSize          =7;
input int    FontSizeInfo      =7;
input int    SpeedEA           =100;
input color  TXTButton         =Red;     
input color  ClickButton       =Black;
input color  FonButtonInfo     =White;
input color  FonButtonBuy      =Blue;
input color  FonButtonSell     =Red;
input color  TextButtonBS      =White;
input color  FonButton         =White;
input color  TextColor         =White;  
input color  ButtonBorder      =Blue;
input color  InfoDataColor     =Red;  
input color  InfoDataColorText =Red;  
input color  EditColor         =Black;   
input int    Magic             =888; 
input int    Id0               =0; 
//+------------------------------------------------------------------+
//|   Дополнительные переменные                                                    
//+------------------------------------------------------------------+
string comment = "www.mforex.pro";
int BWidth   = 60;
int BHeigh   = 20; 
int DeyLimit =0;
int o;
double Lot_1          =0;
double Lot_2          =0;
double Lot_3          =0;
double Lot_4          =0;
double Lot_5          =0;
double Lot_6          =0;
double Lot_7          =0;
double Lot_8          =0;
double Lot_9          =0;
int D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9;
int dig_1,dig_2,dig_3,dig_4,dig_5,dig_6,dig_7,dig_8,dig_9;
static double TimeClose =0;
string PairName;
string TextOn;
string TextOff;
//+------------------------------------------------------------------+
//|==================== Переменные лицензии =========================|
//+------------------------------------------------------------------+
bool   Demo             =false;
bool   LimitLicense     =true;
int    DeyLicense       =7;
int    AccNumber        =0;
//+------------------------------------------------------------------+
//|   Инициализация                                                    
//+------------------------------------------------------------------+
int OnInit()
  {
   EventSetMillisecondTimer(SpeedEA);
   
D_1=1;
if (MarketInfo(pEURUSD,MODE_DIGITS)==5 || MarketInfo(pEURUSD,MODE_DIGITS)==3)
{D_1=10;}

D_2=1;
if (MarketInfo(pGBPUSD,MODE_DIGITS)==5 || MarketInfo(pGBPUSD,MODE_DIGITS)==3)
{D_2=10;}

D_3=1;
if (MarketInfo(pAUDUSD,MODE_DIGITS)==5 || MarketInfo(pAUDUSD,MODE_DIGITS)==3)
{D_3=10;}

D_4=1;
if (MarketInfo(pNZDUSD,MODE_DIGITS)==5 || MarketInfo(pNZDUSD,MODE_DIGITS)==3)
{D_4=10;}

D_5=1;
if (MarketInfo(pUSDJPY,MODE_DIGITS)==5 || MarketInfo(pUSDJPY,MODE_DIGITS)==3)
{D_5=10;}

D_6=1;
if (MarketInfo(pUSDCAD,MODE_DIGITS)==5 || MarketInfo(pUSDCAD,MODE_DIGITS)==3)
{D_6=10;}

D_7=1;
if (MarketInfo(pUSDCHF,MODE_DIGITS)==5 || MarketInfo(pUSDCHF,MODE_DIGITS)==3)
{D_7=10;}

D_8=1;
if (MarketInfo(pEURJPY,MODE_DIGITS)==5 || MarketInfo(pEURJPY,MODE_DIGITS)==3)
{D_8=10;}

D_9=1;
if (MarketInfo(pGBPJPY,MODE_DIGITS)==5 || MarketInfo(pGBPJPY,MODE_DIGITS)==3)
{D_9=10;}

   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//|   ДеИнициализация                                                      
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   ObjectsDeleteAll(0,OBJ_LABEL);
   EventKillTimer();
   ObjectsDeleteAll(0,OBJ_BUTTON);
   ObjectsDeleteAll(0,OBJ_EDIT);
   ObjectsDeleteAll(0,OBJ_RECTANGLE_LABEL);
   
  }
//+------------------------------------------------------------------+
//|   Старт                                                      
//+------------------------------------------------------------------+
void OnTick()
{
string P_1,P_2,P_3,P_4,P_5,P_6,P_7,P_8,P_9;

if(IsTesting())
{P_1=Symbol();
 P_2=Symbol();
 P_3=Symbol();
 P_4=Symbol();
 P_5=Symbol();
 P_6=Symbol();
 P_7=Symbol();
 P_8=Symbol();
 P_9=Symbol();}
else
{P_1=pEURUSD;
 P_2=pGBPUSD;
 P_3=pAUDUSD;
 P_4=pNZDUSD;
 P_5=pUSDJPY;
 P_6=pUSDCAD;
 P_7=pUSDCHF;
 P_8=pEURJPY;
 P_9=pGBPJPY;}
//============== Привязываем к номеру счета ========================
if(AccNumber>0 && AccountNumber()!=AccNumber) 
{
if(Languale==0)
{
RectLabelCreate("ERROR_FON",850,100,300,120,FonColor,1);
PutLabelD("ERROR_TEXT1",780,110,"НЕ ВЕРНЫЙ НОМЕР СЧЕТА!",1);
PutLabelT("ERROR_TEXT2",845,130,"Обратитесь к автору:",1);
PutLabelT("ERROR_TEXT3",845,150,"Скайп:",1);
PutLabelD("ERROR_TEXT4",780,150,"live:mforex.pro",1);
PutLabelT("ERROR_TEXT5",845,170,"Телеграм:",1);
PutLabelD("ERROR_TEXT6",780,170,"@mforexpro",1);
PutLabelT("ERROR_TEXT7",845,190,"Почта:",1);
PutLabelD("ERROR_TEXT8",780,190,"mforex.pro@gmail.com",1);
}
if(Languale==1)
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
}
else
{
//---------Ограничения на демо-------
if(Demo && IsDemo()==false)
{
if(Languale==0)
{
RectLabelCreate("ERROR_FON",850,100,320,120,FonColor,1);
PutLabelD("ERROR_TEXT1",845,110,"ВАША ВЕРСИЯ РАБОТАЕТ ТОЛЬКО НА ДЕМО СЧЕТЕ!",1);
PutLabelT("ERROR_TEXT2",845,130,"Обратитесь к автору:",1);
PutLabelT("ERROR_TEXT3",845,150,"Скайп:",1);
PutLabelD("ERROR_TEXT4",780,150,"live:mforex.pro",1);
PutLabelT("ERROR_TEXT5",845,170,"Телеграм:",1);
PutLabelD("ERROR_TEXT6",780,170,"@mforexpro",1);
PutLabelT("ERROR_TEXT7",845,190,"Почта:",1);
PutLabelD("ERROR_TEXT8",780,190,"mforex.pro@gmail.com",1);
}
if(Languale==1)
{
RectLabelCreate("ERROR_FON",850,100,320,120,FonColor,1);
PutLabelD("ERROR_TEXT1",845,110,"YOUR VERSION ONLY WORKS ON DEMO ACCOUNT!",1);
PutLabelT("ERROR_TEXT2",845,130,"Contact the author:",1);
PutLabelT("ERROR_TEXT3",845,150,"Skype:",1);
PutLabelD("ERROR_TEXT4",780,150,"live:mforex.pro",1);
PutLabelT("ERROR_TEXT5",845,170,"Telegram:",1);
PutLabelD("ERROR_TEXT6",780,170,"@mforexpro",1);
PutLabelT("ERROR_TEXT7",845,190,"E-Mail:",1);
PutLabelD("ERROR_TEXT8",780,190,"mforex.pro@gmail.com",1);
}
}
//============ Если ограничений нет или счет демо ==================
if(!Demo || (Demo && IsDemo()==true))
{
//+------------------------------------------------------------------+
//|   Торговый Алгоритм                                                     
//+------------------------------------------------------------------+
//======= Находим лот 
if(UseLotManual)
{
 Lot_1=ManualLot;
 Lot_2=ManualLot;
 Lot_3=ManualLot;
 Lot_4=ManualLot;
 Lot_5=ManualLot;
 Lot_6=ManualLot;
 Lot_7=ManualLot;
 Lot_8=ManualLot;
 Lot_9=ManualLot;
 }
else
{
//--- 1
if(MarketInfo(P_1,MODE_LOTSTEP)==0.01)     dig_1 =2;
if(MarketInfo(P_1,MODE_LOTSTEP)==0.10)     dig_1 =1;
if(MarketInfo(P_1,MODE_LOTSTEP)==1.00)     dig_1 =0;

Lot_1=NormalizeDouble(AccountBalance()/100*Risk/(MarketInfo(P_1,MODE_TICKVALUE)*100*D_1),dig_1);
if(Lot_1<MarketInfo(P_1,MODE_MINLOT)) {Lot_1=MarketInfo(P_1,MODE_MINLOT);} 
if(Lot_1>=MarketInfo(P_1,MODE_MAXLOT)) {Lot_1=MarketInfo(P_1,MODE_MAXLOT);}
//--- 2
if(MarketInfo(P_2,MODE_LOTSTEP)==0.01)     dig_2 =2;
if(MarketInfo(P_2,MODE_LOTSTEP)==0.10)     dig_2 =1;
if(MarketInfo(P_2,MODE_LOTSTEP)==1.00)     dig_2 =0;

Lot_2=NormalizeDouble(AccountBalance()/100*Risk/(MarketInfo(P_2,MODE_TICKVALUE)*100*D_2),dig_2);
if(Lot_2<MarketInfo(P_2,MODE_MINLOT)) {Lot_2=MarketInfo(P_2,MODE_MINLOT);} 
if(Lot_2>=MarketInfo(P_2,MODE_MAXLOT)) {Lot_2=MarketInfo(P_2,MODE_MAXLOT);}
//--- 3
if(MarketInfo(P_3,MODE_LOTSTEP)==0.01)     dig_3 =2;
if(MarketInfo(P_3,MODE_LOTSTEP)==0.10)     dig_3 =1;
if(MarketInfo(P_3,MODE_LOTSTEP)==1.00)     dig_3 =0;

Lot_3=NormalizeDouble(AccountBalance()/100*Risk/(MarketInfo(P_3,MODE_TICKVALUE)*100*D_3),dig_3);
if(Lot_3<MarketInfo(P_3,MODE_MINLOT)) {Lot_3=MarketInfo(P_3,MODE_MINLOT);} 
if(Lot_3>=MarketInfo(P_3,MODE_MAXLOT)) {Lot_3=MarketInfo(P_3,MODE_MAXLOT);}
//--- 4
if(MarketInfo(P_4,MODE_LOTSTEP)==0.01)     dig_4 =2;
if(MarketInfo(P_4,MODE_LOTSTEP)==0.10)     dig_4 =1;
if(MarketInfo(P_4,MODE_LOTSTEP)==1.00)     dig_4 =0;

Lot_4=NormalizeDouble(AccountBalance()/100*Risk/(MarketInfo(P_4,MODE_TICKVALUE)*100*D_4),dig_4);
if(Lot_4<MarketInfo(P_4,MODE_MINLOT)) {Lot_4=MarketInfo(P_4,MODE_MINLOT);} 
if(Lot_4>=MarketInfo(P_4,MODE_MAXLOT)) {Lot_4=MarketInfo(P_4,MODE_MAXLOT);}
//--- 5
if(MarketInfo(P_5,MODE_LOTSTEP)==0.01)     dig_5 =2;
if(MarketInfo(P_5,MODE_LOTSTEP)==0.10)     dig_5 =1;
if(MarketInfo(P_5,MODE_LOTSTEP)==1.00)     dig_5 =0;

Lot_5=NormalizeDouble(AccountBalance()/100*Risk/(MarketInfo(P_5,MODE_TICKVALUE)*100*D_5),dig_5);
if(Lot_5<MarketInfo(P_5,MODE_MINLOT)) {Lot_5=MarketInfo(P_5,MODE_MINLOT);} 
if(Lot_5>=MarketInfo(P_5,MODE_MAXLOT)) {Lot_5=MarketInfo(P_5,MODE_MAXLOT);}
//--- 6
if(MarketInfo(P_6,MODE_LOTSTEP)==0.01)     dig_6 =2;
if(MarketInfo(P_6,MODE_LOTSTEP)==0.10)     dig_6 =1;
if(MarketInfo(P_6,MODE_LOTSTEP)==1.00)     dig_6 =0;

Lot_6=NormalizeDouble(AccountBalance()/100*Risk/(MarketInfo(P_6,MODE_TICKVALUE)*100*D_6),dig_6);
if(Lot_6<MarketInfo(P_6,MODE_MINLOT)) {Lot_6=MarketInfo(P_6,MODE_MINLOT);} 
if(Lot_6>=MarketInfo(P_6,MODE_MAXLOT)) {Lot_6=MarketInfo(P_6,MODE_MAXLOT);}
//--- 7
if(MarketInfo(P_7,MODE_LOTSTEP)==0.01)     dig_7 =2;
if(MarketInfo(P_7,MODE_LOTSTEP)==0.10)     dig_7 =1;
if(MarketInfo(P_7,MODE_LOTSTEP)==1.00)     dig_7 =0;

Lot_7=NormalizeDouble(AccountBalance()/100*Risk/(MarketInfo(P_7,MODE_TICKVALUE)*100*D_7),dig_7);
if(Lot_7<MarketInfo(P_7,MODE_MINLOT)) {Lot_7=MarketInfo(P_7,MODE_MINLOT);} 
if(Lot_7>=MarketInfo(P_7,MODE_MAXLOT)) {Lot_7=MarketInfo(P_7,MODE_MAXLOT);}
//--- 8
if(MarketInfo(P_8,MODE_LOTSTEP)==0.01)     dig_8 =2;
if(MarketInfo(P_8,MODE_LOTSTEP)==0.10)     dig_8 =1;
if(MarketInfo(P_8,MODE_LOTSTEP)==1.00)     dig_8 =0;

Lot_8=NormalizeDouble(AccountBalance()/100*Risk/(MarketInfo(P_8,MODE_TICKVALUE)*100*D_8),dig_8);
if(Lot_8<MarketInfo(P_8,MODE_MINLOT)) {Lot_8=MarketInfo(P_8,MODE_MINLOT);} 
if(Lot_8>=MarketInfo(P_8,MODE_MAXLOT)) {Lot_8=MarketInfo(P_8,MODE_MAXLOT);}
//--- 9
if(MarketInfo(P_9,MODE_LOTSTEP)==0.01)     dig_9 =2;
if(MarketInfo(P_9,MODE_LOTSTEP)==0.10)     dig_9 =1;
if(MarketInfo(P_9,MODE_LOTSTEP)==1.00)     dig_9 =0;

Lot_9=NormalizeDouble(AccountBalance()/100*Risk/(MarketInfo(P_9,MODE_TICKVALUE)*100*D_9),dig_9);
if(Lot_9<MarketInfo(P_9,MODE_MINLOT)) {Lot_9=MarketInfo(P_9,MODE_MINLOT);} 
if(Lot_9>=MarketInfo(P_9,MODE_MAXLOT)) {Lot_9=MarketInfo(P_9,MODE_MAXLOT);}
}
//======= Точка входа
//--- 1
bool GoBuy_1 =false;
bool GoSell_1 =false;

if (iOpen(P_1,TimeFrame,1)>iClose(P_1,TimeFrame,1) && (iOpen(P_1,TimeFrame,1)-iClose(P_1,TimeFrame,1))/Point>=MinPips &&
          (iOpen(P_1,TimeFrame,1)-iClose(P_1,TimeFrame,1))/Point>=(iHigh(P_1,TimeFrame,2)-iLow(P_1,TimeFrame,2))/Point*PipsStep)
   {GoSell_1=true;}
if (iOpen(P_1,TimeFrame,1)<iClose(P_1,TimeFrame,1) && (iClose(P_1,TimeFrame,1)-iOpen(P_1,TimeFrame,1))/Point>=MinPips &&
          (iClose(P_1,TimeFrame,1)-iOpen(P_1,TimeFrame,1))/Point>=(iHigh(P_1,TimeFrame,2)-iLow(P_1,TimeFrame,2))/Point*PipsStep)
   {GoBuy_1=true;}
//--- 2
bool GoBuy_2 =false;
bool GoSell_2 =false;

if (iOpen(P_2,TimeFrame,1)>iClose(P_2,TimeFrame,1) && (iOpen(P_2,TimeFrame,1)-iClose(P_2,TimeFrame,1))/Point>=MinPips &&
          (iOpen(P_2,TimeFrame,1)-iClose(P_2,TimeFrame,1))/Point>=(iHigh(P_2,TimeFrame,2)-iLow(P_2,TimeFrame,2))/Point*PipsStep)
   {GoSell_2=true;}
if (iOpen(P_2,TimeFrame,1)<iClose(P_2,TimeFrame,1) && (iClose(P_2,TimeFrame,1)-iOpen(P_2,TimeFrame,1))/Point>=MinPips &&
          (iClose(P_2,TimeFrame,1)-iOpen(P_2,TimeFrame,1))/Point>=(iHigh(P_2,TimeFrame,2)-iLow(P_2,TimeFrame,2))/Point*PipsStep)
   {GoBuy_2=true;}
//--- 3
bool GoBuy_3 =false;
bool GoSell_3 =false;

if (iOpen(P_3,TimeFrame,1)>iClose(P_3,TimeFrame,1) && (iOpen(P_3,TimeFrame,1)-iClose(P_3,TimeFrame,1))/Point>=MinPips &&
          (iOpen(P_3,TimeFrame,1)-iClose(P_3,TimeFrame,1))/Point>=(iHigh(P_3,TimeFrame,2)-iLow(P_3,TimeFrame,2))/Point*PipsStep)
   {GoSell_3=true;}
if (iOpen(P_3,TimeFrame,1)<iClose(P_3,TimeFrame,1) && (iClose(P_3,TimeFrame,1)-iOpen(P_3,TimeFrame,1))/Point>=MinPips &&
          (iClose(P_3,TimeFrame,1)-iOpen(P_3,TimeFrame,1))/Point>=(iHigh(P_3,TimeFrame,2)-iLow(P_3,TimeFrame,2))/Point*PipsStep)
   {GoBuy_3=true;}
//--- 4
bool GoBuy_4 =false;
bool GoSell_4 =false;

if (iOpen(P_4,TimeFrame,1)>iClose(P_4,TimeFrame,1) && (iOpen(P_4,TimeFrame,1)-iClose(P_4,TimeFrame,1))/Point>=MinPips &&
          (iOpen(P_4,TimeFrame,1)-iClose(P_4,TimeFrame,1))/Point>=(iHigh(P_4,TimeFrame,2)-iLow(P_4,TimeFrame,2))/Point*PipsStep)
   {GoSell_4=true;}
if (iOpen(P_4,TimeFrame,1)<iClose(P_4,TimeFrame,1) && (iClose(P_4,TimeFrame,1)-iOpen(P_4,TimeFrame,1))/Point>=MinPips &&
          (iClose(P_4,TimeFrame,1)-iOpen(P_4,TimeFrame,1))/Point>=(iHigh(P_4,TimeFrame,2)-iLow(P_4,TimeFrame,2))/Point*PipsStep)
   {GoBuy_4=true;}
//--- 5
bool GoBuy_5 =false;
bool GoSell_5 =false;

if (iOpen(P_5,TimeFrame,1)>iClose(P_5,TimeFrame,1) && (iOpen(P_5,TimeFrame,1)-iClose(P_5,TimeFrame,1))/Point>=MinPips &&
          (iOpen(P_5,TimeFrame,1)-iClose(P_5,TimeFrame,1))/Point>=(iHigh(P_5,TimeFrame,2)-iLow(P_5,TimeFrame,2))/Point*PipsStep)
   {GoSell_5=true;}
if (iOpen(P_5,TimeFrame,1)<iClose(P_5,TimeFrame,1) && (iClose(P_5,TimeFrame,1)-iOpen(P_5,TimeFrame,1))/Point>=MinPips &&
          (iClose(P_5,TimeFrame,1)-iOpen(P_5,TimeFrame,1))/Point>=(iHigh(P_5,TimeFrame,2)-iLow(P_5,TimeFrame,2))/Point*PipsStep)
   {GoBuy_5=true;}
//--- 6
bool GoBuy_6 =false;
bool GoSell_6 =false;

if (iOpen(P_6,TimeFrame,1)>iClose(P_6,TimeFrame,1) && (iOpen(P_6,TimeFrame,1)-iClose(P_6,TimeFrame,1))/Point>=MinPips &&
          (iOpen(P_6,TimeFrame,1)-iClose(P_6,TimeFrame,1))/Point>=(iHigh(P_6,TimeFrame,2)-iLow(P_6,TimeFrame,2))/Point*PipsStep)
   {GoSell_6=true;}
if (iOpen(P_6,TimeFrame,1)<iClose(P_6,TimeFrame,1) && (iClose(P_6,TimeFrame,1)-iOpen(P_6,TimeFrame,1))/Point>=MinPips &&
          (iClose(P_6,TimeFrame,1)-iOpen(P_6,TimeFrame,1))/Point>=(iHigh(P_6,TimeFrame,2)-iLow(P_6,TimeFrame,2))/Point*PipsStep)
   {GoBuy_6=true;}
//--- 7
bool GoBuy_7 =false;
bool GoSell_7 =false;

if (iOpen(P_7,TimeFrame,1)>iClose(P_7,TimeFrame,1) && (iOpen(P_7,TimeFrame,1)-iClose(P_7,TimeFrame,1))/Point>=MinPips &&
          (iOpen(P_7,TimeFrame,1)-iClose(P_7,TimeFrame,1))/Point>=(iHigh(P_7,TimeFrame,2)-iLow(P_7,TimeFrame,2))/Point*PipsStep)
   {GoSell_7=true;}
if (iOpen(P_7,TimeFrame,1)<iClose(P_7,TimeFrame,1) && (iClose(P_7,TimeFrame,1)-iOpen(P_7,TimeFrame,1))/Point>=MinPips &&
          (iClose(P_7,TimeFrame,1)-iOpen(P_7,TimeFrame,1))/Point>=(iHigh(P_7,TimeFrame,2)-iLow(P_7,TimeFrame,2))/Point*PipsStep)
   {GoBuy_7=true;}
//--- 8
bool GoBuy_8 =false;
bool GoSell_8 =false;

if (iOpen(P_8,TimeFrame,1)>iClose(P_8,TimeFrame,1) && (iOpen(P_8,TimeFrame,1)-iClose(P_8,TimeFrame,1))/Point>=MinPips &&
          (iOpen(P_8,TimeFrame,1)-iClose(P_8,TimeFrame,1))/Point>=(iHigh(P_8,TimeFrame,2)-iLow(P_8,TimeFrame,2))/Point*PipsStep)
   {GoSell_8=true;}
if (iOpen(P_8,TimeFrame,1)<iClose(P_8,TimeFrame,1) && (iClose(P_8,TimeFrame,1)-iOpen(P_8,TimeFrame,1))/Point>=MinPips &&
          (iClose(P_8,TimeFrame,1)-iOpen(P_8,TimeFrame,1))/Point>=(iHigh(P_8,TimeFrame,2)-iLow(P_8,TimeFrame,2))/Point*PipsStep)
   {GoBuy_8=true;}
//--- 9
bool GoBuy_9 =false;
bool GoSell_9 =false;

if (iOpen(P_9,TimeFrame,1)>iClose(P_9,TimeFrame,1) && (iOpen(P_9,TimeFrame,1)-iClose(P_9,TimeFrame,1))/Point>=MinPips &&
          (iOpen(P_9,TimeFrame,1)-iClose(P_9,TimeFrame,1))/Point>=(iHigh(P_9,TimeFrame,2)-iLow(P_9,TimeFrame,2))/Point*PipsStep)
   {GoSell_9=true;}
if (iOpen(P_9,TimeFrame,1)<iClose(P_9,TimeFrame,1) && (iClose(P_9,TimeFrame,1)-iOpen(P_9,TimeFrame,1))/Point>=MinPips &&
          (iClose(P_9,TimeFrame,1)-iOpen(P_9,TimeFrame,1))/Point>=(iHigh(P_9,TimeFrame,2)-iLow(P_9,TimeFrame,2))/Point*PipsStep)
   {GoBuy_9=true;}
//--- Если автоторговля включена (кнопка отжата, но текст включено)
if(!ObjectGetInteger(0,"TRADEs_AU",OBJPROP_STATE) && TimeHour(TimeCurrent())>=TimeStart && TimeHour(TimeCurrent())<TimeEnd)
{

//--- Открываем ордера

//--- Если сигнал бай

if(CountBar(-1,P_1)==0 && CountBarHist(-1,P_1)==0 &&
CountPair(-1,P_1,Magic)==0 && AccountFreeMarginCheck(P_1,OP_BUY,Lot_1)>0 && GoBuy_1)
{o=OrderSend(P_1,OP_BUY,Lot_1,MarketInfo(P_1,MODE_ASK),10,0,0,comment,Magic,0,Green);}

if(CountBar(-1,P_2)==0 && CountBarHist(-1,P_2)==0 &&
CountPair(-1,P_2,Magic)==0 && AccountFreeMarginCheck(P_2,OP_BUY,Lot_2)>0 && GoBuy_2)
{o=OrderSend(P_2,OP_BUY,Lot_2,MarketInfo(P_2,MODE_ASK),10,0,0,comment,Magic,0,Green);}

if(CountBar(-1,P_3)==0 && CountBarHist(-1,P_3)==0 &&
CountPair(-1,P_3,Magic)==0 && AccountFreeMarginCheck(P_3,OP_BUY,Lot_3)>0 && GoBuy_3)
{o=OrderSend(P_3,OP_BUY,Lot_3,MarketInfo(P_3,MODE_ASK),10,0,0,comment,Magic,0,Green);}

if(CountBar(-1,P_4)==0 && CountBarHist(-1,P_4)==0 &&
CountPair(-1,P_4,Magic)==0 && AccountFreeMarginCheck(P_4,OP_BUY,Lot_4)>0 && GoBuy_4)
{o=OrderSend(P_4,OP_BUY,Lot_4,MarketInfo(P_4,MODE_ASK),10,0,0,comment,Magic,0,Green);}

if(CountBar(-1,P_5)==0 && CountBarHist(-1,P_5)==0 &&
CountPair(-1,P_5,Magic)==0 && AccountFreeMarginCheck(P_5,OP_BUY,Lot_5)>0 && GoBuy_5)
{o=OrderSend(P_5,OP_BUY,Lot_5,MarketInfo(P_5,MODE_ASK),10,0,0,comment,Magic,0,Green);}

if(CountBar(-1,P_6)==0 && CountBarHist(-1,P_6)==0 &&
CountPair(-1,P_6,Magic)==0 && AccountFreeMarginCheck(P_6,OP_BUY,Lot_6)>0 && GoBuy_6)
{o=OrderSend(P_6,OP_BUY,Lot_6,MarketInfo(P_6,MODE_ASK),10,0,0,comment,Magic,0,Green);}

if(CountBar(-1,P_7)==0 && CountBarHist(-1,P_7)==0 &&
CountPair(-1,P_7,Magic)==0 && AccountFreeMarginCheck(P_7,OP_BUY,Lot_7)>0 && GoBuy_7)
{o=OrderSend(P_7,OP_BUY,Lot_7,MarketInfo(P_7,MODE_ASK),10,0,0,comment,Magic,0,Green);}

if(CountBar(-1,P_8)==0 && CountBarHist(-1,P_8)==0 &&
CountPair(-1,P_8,Magic)==0 && AccountFreeMarginCheck(P_8,OP_BUY,Lot_8)>0 && GoBuy_8)
{o=OrderSend(P_8,OP_BUY,Lot_8,MarketInfo(P_8,MODE_ASK),10,0,0,comment,Magic,0,Green);}

if(CountBar(-1,P_9)==0 && CountBarHist(-1,P_9)==0 &&
CountPair(-1,P_9,Magic)==0 && AccountFreeMarginCheck(P_9,OP_BUY,Lot_9)>0 && GoBuy_9)
{o=OrderSend(P_9,OP_BUY,Lot_9,MarketInfo(P_9,MODE_ASK),10,0,0,comment,Magic,0,Green);}


//--- Если сигнал селл

if(CountBar(-1,P_1)==0 && CountBarHist(-1,P_1)==0 &&
CountPair(-1,P_1,Magic)==0 && AccountFreeMarginCheck(P_1,OP_SELL,Lot_1)>0 && GoSell_1)
{o=OrderSend(P_1,OP_SELL,Lot_1,MarketInfo(P_1,MODE_BID),10,0,0,comment,Magic,0,Red);}

if(CountBar(-1,P_2)==0 && CountBarHist(-1,P_2)==0 &&
CountPair(-1,P_2,Magic)==0 && AccountFreeMarginCheck(P_2,OP_SELL,Lot_2)>0 && GoSell_2)
{o=OrderSend(P_2,OP_SELL,Lot_2,MarketInfo(P_2,MODE_BID),10,0,0,comment,Magic,0,Red);}

if(CountBar(-1,P_3)==0 && CountBarHist(-1,P_3)==0 &&
CountPair(-1,P_3,Magic)==0 && AccountFreeMarginCheck(P_3,OP_SELL,Lot_3)>0 && GoSell_3)
{o=OrderSend(P_3,OP_SELL,Lot_3,MarketInfo(P_3,MODE_BID),10,0,0,comment,Magic,0,Red);}

if(CountBar(-1,P_4)==0 && CountBarHist(-1,P_4)==0 &&
CountPair(-1,P_4,Magic)==0 && AccountFreeMarginCheck(P_4,OP_SELL,Lot_4)>0 && GoSell_4)
{o=OrderSend(P_4,OP_SELL,Lot_4,MarketInfo(P_4,MODE_BID),10,0,0,comment,Magic,0,Red);}

if(CountBar(-1,P_5)==0 && CountBarHist(-1,P_5)==0 &&
CountPair(-1,P_5,Magic)==0 && AccountFreeMarginCheck(P_5,OP_SELL,Lot_5)>0 && GoSell_5)
{o=OrderSend(P_5,OP_SELL,Lot_5,MarketInfo(P_5,MODE_BID),10,0,0,comment,Magic,0,Red);}

if(CountBar(-1,P_6)==0 && CountBarHist(-1,P_6)==0 &&
CountPair(-1,P_6,Magic)==0 && AccountFreeMarginCheck(P_6,OP_SELL,Lot_6)>0 && GoSell_6)
{o=OrderSend(P_6,OP_SELL,Lot_6,MarketInfo(P_6,MODE_BID),10,0,0,comment,Magic,0,Red);}

if(CountBar(-1,P_7)==0 && CountBarHist(-1,P_7)==0 &&
CountPair(-1,P_7,Magic)==0 && AccountFreeMarginCheck(P_7,OP_SELL,Lot_7)>0 && GoSell_7)
{o=OrderSend(P_7,OP_SELL,Lot_7,MarketInfo(P_7,MODE_BID),10,0,0,comment,Magic,0,Red);}

if(CountBar(-1,P_8)==0 && CountBarHist(-1,P_8)==0 &&
CountPair(-1,P_8,Magic)==0 && AccountFreeMarginCheck(P_8,OP_SELL,Lot_8)>0 && GoSell_8)
{o=OrderSend(P_8,OP_SELL,Lot_8,MarketInfo(P_8,MODE_BID),10,0,0,comment,Magic,0,Red);}

if(CountBar(-1,P_9)==0 && CountBarHist(-1,P_9)==0 &&
CountPair(-1,P_9,Magic)==0 && AccountFreeMarginCheck(P_9,OP_SELL,Lot_9)>0 && GoSell_9)
{o=OrderSend(P_9,OP_SELL,Lot_9,MarketInfo(P_9,MODE_BID),10,0,0,comment,Magic,0,Red);}

//---
}

//--- Сетки
if(CountAll(-1)<MaxOrders && TimeHour(TimeCurrent())>=TimeStart && TimeHour(TimeCurrent())<TimeEnd)
{
//---Сетка в минус
if(!ObjectGetInteger(0,"TRADEs_SM",OBJPROP_STATE))
{
if(CountBar(-1,P_1)==0 && CountBarHist(-1,P_1)==0 &&
CountPair(OP_BUY,P_1,Magic)>0 && AccountFreeMarginCheck(P_1,OP_BUY,Lot_1)>0 && GoBuy_1)
{if(CountPairPlus(OP_BUY,P_1,Magic)==0)
{if(MarketInfo(P_1,MODE_ASK)+pEURUSD_Step*MarketInfo(P_1,MODE_POINT)<=OldPricB(P_1,Magic))
{o=OrderSend(P_1,OP_BUY,Lot_1,MarketInfo(P_1,MODE_ASK),10,0,0,comment,Magic,0,Green);}  
}
}
if(CountBar(-1,P_1)==0 && CountBarHist(-1,P_1)==0 &&
CountPair(OP_SELL,P_1,Magic)>0 && AccountFreeMarginCheck(P_1,OP_SELL,Lot_1)>0 && GoSell_1)
{if(CountPairPlus(OP_SELL,P_1,Magic)==0)
{if(MarketInfo(P_1,MODE_BID)-pEURUSD_Step*MarketInfo(P_1,MODE_POINT)>=OldPricS(P_1,Magic))
{o=OrderSend(P_1,OP_SELL,Lot_1,MarketInfo(P_1,MODE_BID),10,0,0,comment,Magic,0,Red);}  
}
}
//-----------
if(CountBar(-1,P_2)==0 && CountBarHist(-1,P_2)==0 &&
CountPair(OP_BUY,P_2,Magic)>0 && AccountFreeMarginCheck(P_2,OP_BUY,Lot_2)>0 && GoBuy_2)
{if(CountPairPlus(OP_BUY,P_2,Magic)==0)
{if(MarketInfo(P_2,MODE_ASK)+pGBPUSD_Step*MarketInfo(P_2,MODE_POINT)<=OldPricB(P_2,Magic))
{o=OrderSend(P_2,OP_BUY,Lot_2,MarketInfo(P_2,MODE_ASK),10,0,0,comment,Magic,0,Green);}  
}
}
if(CountBar(-1,P_2)==0 && CountBarHist(-1,P_2)==0 &&
CountPair(OP_SELL,P_2,Magic)>0 && AccountFreeMarginCheck(P_2,OP_SELL,Lot_2)>0 && GoSell_2)
{if(CountPairPlus(OP_SELL,P_2,Magic)==0)
{if(MarketInfo(P_2,MODE_BID)-pGBPUSD_Step*MarketInfo(P_2,MODE_POINT)>=OldPricS(P_2,Magic))
{o=OrderSend(P_2,OP_SELL,Lot_2,MarketInfo(P_2,MODE_BID),10,0,0,comment,Magic,0,Red);}  
}
}
//-----------
if(CountBar(-1,P_3)==0 && CountBarHist(-1,P_3)==0 &&
CountPair(OP_BUY,P_3,Magic)>0 && AccountFreeMarginCheck(P_3,OP_BUY,Lot_3)>0 && GoBuy_3)
{if(CountPairPlus(OP_BUY,P_3,Magic)==0)
{if(MarketInfo(P_3,MODE_ASK)+pAUDUSD_Step*MarketInfo(P_3,MODE_POINT)<=OldPricB(P_3,Magic))
{o=OrderSend(P_3,OP_BUY,Lot_3,MarketInfo(P_3,MODE_ASK),10,0,0,comment,Magic,0,Green);}  
}
}
if(CountBar(-1,P_3)==0 && CountBarHist(-1,P_3)==0 &&
CountPair(OP_SELL,P_3,Magic)>0 && AccountFreeMarginCheck(P_3,OP_SELL,Lot_3)>0 && GoSell_3)
{if(CountPairPlus(OP_SELL,P_3,Magic)==0)
{if(MarketInfo(P_3,MODE_BID)-pAUDUSD_Step*MarketInfo(P_3,MODE_POINT)>=OldPricS(P_3,Magic))
{o=OrderSend(P_3,OP_SELL,Lot_3,MarketInfo(P_3,MODE_BID),10,0,0,comment,Magic,0,Red);}  
}
}
//-----------
if(CountBar(-1,P_4)==0 && CountBarHist(-1,P_4)==0 &&
CountPair(OP_BUY,P_4,Magic)>0 && AccountFreeMarginCheck(P_4,OP_BUY,Lot_4)>0 && GoBuy_4)
{if(CountPairPlus(OP_BUY,P_4,Magic)==0)
{if(MarketInfo(P_4,MODE_ASK)+pNZDUSD_Step*MarketInfo(P_4,MODE_POINT)<=OldPricB(P_4,Magic))
{o=OrderSend(P_4,OP_BUY,Lot_4,MarketInfo(P_4,MODE_ASK),10,0,0,comment,Magic,0,Green);}  
}
}
if(CountBar(-1,P_4)==0 && CountBarHist(-1,P_4)==0 &&
CountPair(OP_SELL,P_4,Magic)>0 && AccountFreeMarginCheck(P_4,OP_SELL,Lot_4)>0 && GoSell_4)
{if(CountPairPlus(OP_SELL,P_4,Magic)==0)
{if(MarketInfo(P_4,MODE_BID)-pNZDUSD_Step*MarketInfo(P_4,MODE_POINT)>=OldPricS(P_4,Magic))
{o=OrderSend(P_4,OP_SELL,Lot_4,MarketInfo(P_4,MODE_BID),10,0,0,comment,Magic,0,Red);}  
}
}
//-----------
if(CountBar(-1,P_5)==0 && CountBarHist(-1,P_5)==0 &&
CountPair(OP_BUY,P_5,Magic)>0 && AccountFreeMarginCheck(P_5,OP_BUY,Lot_5)>0 && GoBuy_5)
{if(CountPairPlus(OP_BUY,P_5,Magic)==0)
{if(MarketInfo(P_5,MODE_ASK)+pUSDJPY_Step*MarketInfo(P_5,MODE_POINT)<=OldPricB(P_5,Magic))
{o=OrderSend(P_5,OP_BUY,Lot_5,MarketInfo(P_5,MODE_ASK),10,0,0,comment,Magic,0,Green);}  
}
}
if(CountBar(-1,P_5)==0 && CountBarHist(-1,P_5)==0 &&
CountPair(OP_SELL,P_5,Magic)>0 && AccountFreeMarginCheck(P_5,OP_SELL,Lot_5)>0 && GoSell_5)
{if(CountPairPlus(OP_SELL,P_5,Magic)==0)
{if(MarketInfo(P_5,MODE_BID)-pUSDJPY_Step*MarketInfo(P_5,MODE_POINT)>=OldPricS(P_5,Magic))
{o=OrderSend(P_5,OP_SELL,Lot_5,MarketInfo(P_5,MODE_BID),10,0,0,comment,Magic,0,Red);}  
}
}
//-----------
if(CountBar(-1,P_6)==0 && CountBarHist(-1,P_6)==0 &&
CountPair(OP_BUY,P_6,Magic)>0 && AccountFreeMarginCheck(P_6,OP_BUY,Lot_6)>0 && GoBuy_6)
{if(CountPairPlus(OP_BUY,P_6,Magic)==0)
{if(MarketInfo(P_6,MODE_ASK)+pUSDCAD_Step*MarketInfo(P_6,MODE_POINT)<=OldPricB(P_6,Magic))
{o=OrderSend(P_6,OP_BUY,Lot_6,MarketInfo(P_6,MODE_ASK),10,0,0,comment,Magic,0,Green);}  
}
}
if(CountBar(-1,P_6)==0 && CountBarHist(-1,P_6)==0 &&
CountPair(OP_SELL,P_6,Magic)>0 && AccountFreeMarginCheck(P_6,OP_SELL,Lot_6)>0 && GoSell_6)
{if(CountPairPlus(OP_SELL,P_6,Magic)==0)
{if(MarketInfo(P_6,MODE_BID)-pUSDCAD_Step*MarketInfo(P_6,MODE_POINT)>=OldPricS(P_6,Magic))
{o=OrderSend(P_6,OP_SELL,Lot_6,MarketInfo(P_6,MODE_BID),10,0,0,comment,Magic,0,Red);}  
}
}
//-----------
if(CountBar(-1,P_7)==0 && CountBarHist(-1,P_7)==0 &&
CountPair(OP_BUY,P_7,Magic)>0 && AccountFreeMarginCheck(P_7,OP_BUY,Lot_7)>0 && GoBuy_7)
{if(CountPairPlus(OP_BUY,P_7,Magic)==0)
{if(MarketInfo(P_7,MODE_ASK)+pUSDCHF_Step*MarketInfo(P_7,MODE_POINT)<=OldPricB(P_7,Magic))
{o=OrderSend(P_7,OP_BUY,Lot_7,MarketInfo(P_7,MODE_ASK),10,0,0,comment,Magic,0,Green);}  
}
}
if(CountBar(-1,P_7)==0 && CountBarHist(-1,P_7)==0 &&
CountPair(OP_SELL,P_7,Magic)>0 && AccountFreeMarginCheck(P_7,OP_SELL,Lot_7)>0 && GoSell_7)
{if(CountPairPlus(OP_SELL,P_7,Magic)==0)
{if(MarketInfo(P_7,MODE_BID)-pUSDCHF_Step*MarketInfo(P_7,MODE_POINT)>=OldPricS(P_7,Magic))
{o=OrderSend(P_7,OP_SELL,Lot_7,MarketInfo(P_7,MODE_BID),10,0,0,comment,Magic,0,Red);}  
}
}
//-----------
if(CountBar(-1,P_8)==0 && CountBarHist(-1,P_8)==0 &&
CountPair(OP_BUY,P_8,Magic)>0 && AccountFreeMarginCheck(P_8,OP_BUY,Lot_8)>0 && GoBuy_8)
{if(CountPairPlus(OP_BUY,P_8,Magic)==0)
{if(MarketInfo(P_8,MODE_ASK)+pEURJPY_Step*MarketInfo(P_8,MODE_POINT)<=OldPricB(P_8,Magic))
{o=OrderSend(P_8,OP_BUY,Lot_8,MarketInfo(P_8,MODE_ASK),10,0,0,comment,Magic,0,Green);}  
}
}
if(CountBar(-1,P_8)==0 && CountBarHist(-1,P_8)==0 &&
CountPair(OP_SELL,P_8,Magic)>0 && AccountFreeMarginCheck(P_8,OP_SELL,Lot_8)>0 && GoSell_8)
{if(CountPairPlus(OP_SELL,P_8,Magic)==0)
{if(MarketInfo(P_8,MODE_BID)-pEURJPY_Step*MarketInfo(P_8,MODE_POINT)>=OldPricS(P_8,Magic))
{o=OrderSend(P_8,OP_SELL,Lot_8,MarketInfo(P_8,MODE_BID),10,0,0,comment,Magic,0,Red);}  
}
}
//-----------
if(CountBar(-1,P_9)==0 && CountBarHist(-1,P_9)==0 &&
CountPair(OP_BUY,P_9,Magic)>0 && AccountFreeMarginCheck(P_9,OP_BUY,Lot_9)>0 && GoBuy_9)
{if(CountPairPlus(OP_BUY,P_9,Magic)==0)
{if(MarketInfo(P_9,MODE_ASK)+pGBPJPY_Step*MarketInfo(P_9,MODE_POINT)<=OldPricB(P_9,Magic))
{o=OrderSend(P_9,OP_BUY,Lot_9,MarketInfo(P_9,MODE_ASK),10,0,0,comment,Magic,0,Green);}  
}
}
if(CountBar(-1,P_9)==0 && CountBarHist(-1,P_9)==0 &&
CountPair(OP_SELL,P_9,Magic)>0 && AccountFreeMarginCheck(P_9,OP_SELL,Lot_9)>0 && GoSell_9)
{if(CountPairPlus(OP_SELL,P_9,Magic)==0)
{if(MarketInfo(P_9,MODE_BID)-pGBPJPY_Step*MarketInfo(P_9,MODE_POINT)>=OldPricS(P_9,Magic))
{o=OrderSend(P_9,OP_SELL,Lot_9,MarketInfo(P_9,MODE_BID),10,0,0,comment,Magic,0,Red);}  
}
}
//-----------
}
//--- Сетка в плюс
if(!ObjectGetInteger(0,"TRADEs_SP",OBJPROP_STATE))
{
if(CountBar(-1,P_1)==0 && CountBarHist(-1,P_1)==0 &&
CountPair(OP_BUY,P_1,Magic)>0 && AccountFreeMarginCheck(P_1,OP_BUY,Lot_1)>0 && GoBuy_1)
{if(MarketInfo(P_1,MODE_ASK)-pEURUSD_Step*MarketInfo(P_1,MODE_POINT)>=OldPricB(P_1,Magic))
{o=OrderSend(P_1,OP_BUY,Lot_1,MarketInfo(P_1,MODE_ASK),10,0,0,comment,Magic,0,Green);}  
}
if(CountBar(-1,P_1)==0 && CountBarHist(-1,P_1)==0 &&
CountPair(OP_SELL,P_1,Magic)>0 && AccountFreeMarginCheck(P_1,OP_SELL,Lot_1)>0 && GoSell_1)
{if(MarketInfo(P_1,MODE_BID)+pEURUSD_Step*MarketInfo(P_1,MODE_POINT)<=OldPricS(P_1,Magic))
{o=OrderSend(P_1,OP_SELL,Lot_1,MarketInfo(P_1,MODE_BID),10,0,0,comment,Magic,0,Red);}  
}
//-----------
if(CountBar(-1,P_2)==0 && CountBarHist(-1,P_2)==0 &&
CountPair(OP_BUY,P_2,Magic)>0 && AccountFreeMarginCheck(P_2,OP_BUY,Lot_2)>0 && GoBuy_2)
{if(MarketInfo(P_2,MODE_ASK)-pGBPUSD_Step*MarketInfo(P_2,MODE_POINT)>=OldPricB(P_2,Magic))
{o=OrderSend(P_2,OP_BUY,Lot_2,MarketInfo(P_2,MODE_ASK),10,0,0,comment,Magic,0,Green);}  
}
if(CountBar(-1,P_2)==0 && CountBarHist(-1,P_2)==0 &&
CountPair(OP_SELL,P_2,Magic)>0 && AccountFreeMarginCheck(P_2,OP_SELL,Lot_2)>0 && GoSell_2)
{if(MarketInfo(P_2,MODE_BID)+pGBPUSD_Step*MarketInfo(P_2,MODE_POINT)<=OldPricS(P_2,Magic))
{o=OrderSend(P_2,OP_SELL,Lot_2,MarketInfo(P_2,MODE_BID),10,0,0,comment,Magic,0,Red);}  
}
//-----------
if(CountBar(-1,P_3)==0 && CountBarHist(-1,P_3)==0 &&
CountPair(OP_BUY,P_3,Magic)>0 && AccountFreeMarginCheck(P_3,OP_BUY,Lot_3)>0 && GoBuy_3)
{if(MarketInfo(P_3,MODE_ASK)-pAUDUSD_Step*MarketInfo(P_3,MODE_POINT)>=OldPricB(P_3,Magic))
{o=OrderSend(P_3,OP_BUY,Lot_3,MarketInfo(P_3,MODE_ASK),10,0,0,comment,Magic,0,Green);}  
}
if(CountBar(-1,P_3)==0 && CountBarHist(-1,P_3)==0 &&
CountPair(OP_SELL,P_3,Magic)>0 && AccountFreeMarginCheck(P_3,OP_SELL,Lot_3)>0 && GoSell_3)
{if(MarketInfo(P_3,MODE_BID)+pAUDUSD_Step*MarketInfo(P_3,MODE_POINT)<=OldPricS(P_3,Magic))
{o=OrderSend(P_3,OP_SELL,Lot_3,MarketInfo(P_3,MODE_BID),10,0,0,comment,Magic,0,Red);}  
}
//-----------
if(CountBar(-1,P_4)==0 && CountBarHist(-1,P_4)==0 &&
CountPair(OP_BUY,P_4,Magic)>0 && AccountFreeMarginCheck(P_4,OP_BUY,Lot_4)>0 && GoBuy_4)
{if(MarketInfo(P_4,MODE_ASK)-pNZDUSD_Step*MarketInfo(P_4,MODE_POINT)>=OldPricB(P_4,Magic))
{o=OrderSend(P_4,OP_BUY,Lot_4,MarketInfo(P_4,MODE_ASK),10,0,0,comment,Magic,0,Green);}  
}
if(CountBar(-1,P_4)==0 && CountBarHist(-1,P_4)==0 &&
CountPair(OP_SELL,P_4,Magic)>0 && AccountFreeMarginCheck(P_4,OP_SELL,Lot_4)>0 && GoSell_4)
{if(MarketInfo(P_4,MODE_BID)+pNZDUSD_Step*MarketInfo(P_4,MODE_POINT)<=OldPricS(P_4,Magic))
{o=OrderSend(P_4,OP_SELL,Lot_4,MarketInfo(P_4,MODE_BID),10,0,0,comment,Magic,0,Red);}  
}
//-----------
if(CountBar(-1,P_5)==0 && CountBarHist(-1,P_5)==0 &&
CountPair(OP_BUY,P_5,Magic)>0 && AccountFreeMarginCheck(P_5,OP_BUY,Lot_5)>0 && GoBuy_5)
{if(MarketInfo(P_5,MODE_ASK)-pUSDJPY_Step*MarketInfo(P_5,MODE_POINT)>=OldPricB(P_5,Magic))
{o=OrderSend(P_5,OP_BUY,Lot_5,MarketInfo(P_5,MODE_ASK),10,0,0,comment,Magic,0,Green);}  
}
if(CountBar(-1,P_5)==0 && CountBarHist(-1,P_5)==0 &&
CountPair(OP_SELL,P_5,Magic)>0 && AccountFreeMarginCheck(P_5,OP_SELL,Lot_5)>0 && GoSell_5)
{if(MarketInfo(P_5,MODE_BID)+pUSDJPY_Step*MarketInfo(P_5,MODE_POINT)<=OldPricS(P_5,Magic))
{o=OrderSend(P_5,OP_SELL,Lot_5,MarketInfo(P_5,MODE_BID),10,0,0,comment,Magic,0,Red);}  
}
//-----------
if(CountBar(-1,P_6)==0 && CountBarHist(-1,P_6)==0 &&
CountPair(OP_BUY,P_6,Magic)>0 && AccountFreeMarginCheck(P_6,OP_BUY,Lot_6)>0 && GoBuy_6)
{if(MarketInfo(P_6,MODE_ASK)-pUSDCAD_Step*MarketInfo(P_6,MODE_POINT)>=OldPricB(P_6,Magic))
{o=OrderSend(P_6,OP_BUY,Lot_6,MarketInfo(P_6,MODE_ASK),10,0,0,comment,Magic,0,Green);}  
}
if(CountBar(-1,P_6)==0 && CountBarHist(-1,P_6)==0 &&
CountPair(OP_SELL,P_6,Magic)>0 && AccountFreeMarginCheck(P_6,OP_SELL,Lot_6)>0 && GoSell_6)
{if(MarketInfo(P_6,MODE_BID)+pUSDCAD_Step*MarketInfo(P_6,MODE_POINT)<=OldPricS(P_6,Magic))
{o=OrderSend(P_6,OP_SELL,Lot_6,MarketInfo(P_6,MODE_BID),10,0,0,comment,Magic,0,Red);}  
}
//-----------
if(CountBar(-1,P_7)==0 && CountBarHist(-1,P_7)==0 &&
CountPair(OP_BUY,P_7,Magic)>0 && AccountFreeMarginCheck(P_7,OP_BUY,Lot_7)>0 && GoBuy_7)
{if(MarketInfo(P_7,MODE_ASK)-pUSDCHF_Step*MarketInfo(P_7,MODE_POINT)>=OldPricB(P_7,Magic))
{o=OrderSend(P_7,OP_BUY,Lot_7,MarketInfo(P_7,MODE_ASK),10,0,0,comment,Magic,0,Green);}  
}
if(CountBar(-1,P_7)==0 && CountBarHist(-1,P_7)==0 &&
CountPair(OP_SELL,P_7,Magic)>0 && AccountFreeMarginCheck(P_7,OP_SELL,Lot_7)>0 && GoSell_7)
{if(MarketInfo(P_7,MODE_BID)+pUSDCHF_Step*MarketInfo(P_7,MODE_POINT)<=OldPricS(P_7,Magic))
{o=OrderSend(P_7,OP_SELL,Lot_7,MarketInfo(P_7,MODE_BID),10,0,0,comment,Magic,0,Red);}  
}
//-----------
if(CountBar(-1,P_8)==0 && CountBarHist(-1,P_8)==0 &&
CountPair(OP_BUY,P_8,Magic)>0 && AccountFreeMarginCheck(P_8,OP_BUY,Lot_8)>0 && GoBuy_8)
{if(MarketInfo(P_8,MODE_ASK)-pEURJPY_Step*MarketInfo(P_8,MODE_POINT)>=OldPricB(P_8,Magic))
{o=OrderSend(P_8,OP_BUY,Lot_8,MarketInfo(P_8,MODE_ASK),10,0,0,comment,Magic,0,Green);}  
}
if(CountBar(-1,P_8)==0 && CountBarHist(-1,P_8)==0 &&
CountPair(OP_SELL,P_8,Magic)>0 && AccountFreeMarginCheck(P_8,OP_SELL,Lot_8)>0 && GoSell_8)
{if(MarketInfo(P_8,MODE_BID)+pEURJPY_Step*MarketInfo(P_8,MODE_POINT)<=OldPricS(P_8,Magic))
{o=OrderSend(P_8,OP_SELL,Lot_8,MarketInfo(P_8,MODE_BID),10,0,0,comment,Magic,0,Red);}  
}
//-----------
if(CountBar(-1,P_9)==0 && CountBarHist(-1,P_9)==0 &&
CountPair(OP_BUY,P_9,Magic)>0 && AccountFreeMarginCheck(P_9,OP_BUY,Lot_9)>0 && GoBuy_9)
{if(MarketInfo(P_9,MODE_ASK)-pGBPJPY_Step*MarketInfo(P_9,MODE_POINT)>=OldPricB(P_9,Magic))
{o=OrderSend(P_9,OP_BUY,Lot_9,MarketInfo(P_9,MODE_ASK),10,0,0,comment,Magic,0,Green);}  
}
if(CountBar(-1,P_9)==0 && CountBarHist(-1,P_9)==0 &&
CountPair(OP_SELL,P_9,Magic)>0 && AccountFreeMarginCheck(P_9,OP_SELL,Lot_9)>0 && GoSell_9)
{if(MarketInfo(P_9,MODE_BID)+pGBPJPY_Step*MarketInfo(P_9,MODE_POINT)<=OldPricS(P_9,Magic))
{o=OrderSend(P_9,OP_SELL,Lot_9,MarketInfo(P_9,MODE_BID),10,0,0,comment,Magic,0,Red);}  
}
//-----------
}
}
//---
//--- Счетчик количества пар
int op_1=0;
int op_2=0;
int op_3=0;
int op_4=0;
int op_5=0;
int op_6=0;
int op_7=0;
int op_8=0;
int op_9=0;

if(CountPair(-1,P_1,Magic)>0) {op_1=1;}
if(CountPair(-1,P_2,Magic)>0) {op_2=1;}
if(CountPair(-1,P_3,Magic)>0) {op_3=1;}
if(CountPair(-1,P_4,Magic)>0) {op_4=1;}
if(CountPair(-1,P_5,Magic)>0) {op_5=1;}
if(CountPair(-1,P_6,Magic)>0) {op_6=1;}
if(CountPair(-1,P_7,Magic)>0) {op_7=1;}
if(CountPair(-1,P_8,Magic)>0) {op_8=1;}
if(CountPair(-1,P_9,Magic)>0) {op_9=1;}
//---
//--- Если автоторговля включена (кнопка отжата, но текст включено)
if(!ObjectGetInteger(0,"TRADEs_AU",OBJPROP_STATE))
{
//--- Закрываем ордера при достижении прибыли
double ProfProc=AllLots(-1)*ProfitPips;
if(ProfitAll(-1)>=ProfProc && ProfProc!=0)
{
ClosePos();
ObjectsDeleteAll(0,OBJ_ARROW);
ObjectsDeleteAll(0,OBJ_TREND);
}
}
//--- Разгрузка на ночь

//--- Если разгрузка на ночь включена 
if(ObjectGetInteger(0,"TRADEs_CN",OBJPROP_STATE))
{
if(TimeClose==0 && TimeHour(TimeCurrent())==TimeEnd)
{ClosePlusPair(P_1);
 ClosePlusPair(P_2);
 ClosePlusPair(P_3);
 ClosePlusPair(P_4);
 ClosePlusPair(P_5);
 ClosePlusPair(P_6);
 ClosePlusPair(P_7);
 ClosePlusPair(P_8);
 ClosePlusPair(P_9);
 TimeClose=1;}
 
if(TimeClose==1 && TimeHour(TimeCurrent())>=TimeStart && TimeHour(TimeCurrent())<TimeEnd)
{TimeClose=0;}
}

//--- Торговля мобильным

//--- Если кнопка включена
if(ObjectGetInteger(0,"TRADEs_MO",OBJPROP_STATE))
{
//--- Открыть ордер
if(CountPair(-1,P_1,Magic)==0 && CountPair(OP_BUY,P_1,0)>0)
{o=OrderSend(P_1,OP_BUY,Lot_1,MarketInfo(P_1,MODE_ASK),10,0,0,comment,Magic,0,Green);}
if(CountPair(-1,P_1,Magic)==0 && CountPair(OP_SELL,P_1,0)>0)
{o=OrderSend(P_1,OP_SELL,Lot_1,MarketInfo(P_1,MODE_BID),10,0,0,comment,Magic,0,Green);}

if(CountPair(-1,P_2,Magic)==0 && CountPair(OP_BUY,P_2,0)>0)
{o=OrderSend(P_2,OP_BUY,Lot_1,MarketInfo(P_2,MODE_ASK),10,0,0,comment,Magic,0,Green);}
if(CountPair(-1,P_2,Magic)==0 && CountPair(OP_SELL,P_2,0)>0)
{o=OrderSend(P_2,OP_SELL,Lot_1,MarketInfo(P_2,MODE_BID),10,0,0,comment,Magic,0,Green);}

if(CountPair(-1,P_3,Magic)==0 && CountPair(OP_BUY,P_3,0)>0)
{o=OrderSend(P_3,OP_BUY,Lot_1,MarketInfo(P_3,MODE_ASK),10,0,0,comment,Magic,0,Green);}
if(CountPair(-1,P_3,Magic)==0 && CountPair(OP_SELL,P_3,0)>0)
{o=OrderSend(P_3,OP_SELL,Lot_1,MarketInfo(P_3,MODE_BID),10,0,0,comment,Magic,0,Green);}

if(CountPair(-1,P_4,Magic)==0 && CountPair(OP_BUY,P_4,0)>0)
{o=OrderSend(P_4,OP_BUY,Lot_1,MarketInfo(P_4,MODE_ASK),10,0,0,comment,Magic,0,Green);}
if(CountPair(-1,P_4,Magic)==0 && CountPair(OP_SELL,P_4,0)>0)
{o=OrderSend(P_4,OP_SELL,Lot_1,MarketInfo(P_4,MODE_BID),10,0,0,comment,Magic,0,Green);}

if(CountPair(-1,P_5,Magic)==0 && CountPair(OP_BUY,P_5,0)>0)
{o=OrderSend(P_5,OP_BUY,Lot_1,MarketInfo(P_5,MODE_ASK),10,0,0,comment,Magic,0,Green);}
if(CountPair(-1,P_5,Magic)==0 && CountPair(OP_SELL,P_5,0)>0)
{o=OrderSend(P_5,OP_SELL,Lot_1,MarketInfo(P_5,MODE_BID),10,0,0,comment,Magic,0,Green);}

if(CountPair(-1,P_6,Magic)==0 && CountPair(OP_BUY,P_6,0)>0)
{o=OrderSend(P_6,OP_BUY,Lot_1,MarketInfo(P_6,MODE_ASK),10,0,0,comment,Magic,0,Green);}
if(CountPair(-1,P_6,Magic)==0 && CountPair(OP_SELL,P_6,0)>0)
{o=OrderSend(P_6,OP_SELL,Lot_1,MarketInfo(P_6,MODE_BID),10,0,0,comment,Magic,0,Green);}

if(CountPair(-1,P_7,Magic)==0 && CountPair(OP_BUY,P_7,0)>0)
{o=OrderSend(P_7,OP_BUY,Lot_1,MarketInfo(P_7,MODE_ASK),10,0,0,comment,Magic,0,Green);}
if(CountPair(-1,P_7,Magic)==0 && CountPair(OP_SELL,P_7,0)>0)
{o=OrderSend(P_7,OP_SELL,Lot_1,MarketInfo(P_7,MODE_BID),10,0,0,comment,Magic,0,Green);}

if(CountPair(-1,P_8,Magic)==0 && CountPair(OP_BUY,P_8,0)>0)
{o=OrderSend(P_8,OP_BUY,Lot_1,MarketInfo(P_8,MODE_ASK),10,0,0,comment,Magic,0,Green);}
if(CountPair(-1,P_8,Magic)==0 && CountPair(OP_SELL,P_8,0)>0)
{o=OrderSend(P_8,OP_SELL,Lot_1,MarketInfo(P_8,MODE_BID),10,0,0,comment,Magic,0,Green);}

if(CountPair(-1,P_9,Magic)==0 && CountPair(OP_BUY,P_9,0)>0)
{o=OrderSend(P_9,OP_BUY,Lot_1,MarketInfo(P_9,MODE_ASK),10,0,0,comment,Magic,0,Green);}
if(CountPair(-1,P_9,Magic)==0 && CountPair(OP_SELL,P_9,0)>0)
{o=OrderSend(P_9,OP_SELL,Lot_1,MarketInfo(P_9,MODE_BID),10,0,0,comment,Magic,0,Green);}

//--- Закрыть по паре
if((CountPair(OP_BUY,P_1,Magic)>0 && CountPair(OP_SELL,P_1,0)>0) || (CountPair(OP_SELL,P_1,Magic)>0 && CountPair(OP_BUY,P_1,0)>0))
{ClosePosPair(P_1,Magic);
 ClosePosPair(P_1,0);}

if((CountPair(OP_BUY,P_2,Magic)>0 && CountPair(OP_SELL,P_2,0)>0) || (CountPair(OP_SELL,P_2,Magic)>0 && CountPair(OP_BUY,P_2,0)>0))
{ClosePosPair(P_2,Magic);
 ClosePosPair(P_2,0);}

if((CountPair(OP_BUY,P_3,Magic)>0 && CountPair(OP_SELL,P_3,0)>0) || (CountPair(OP_SELL,P_3,Magic)>0 && CountPair(OP_BUY,P_3,0)>0))
{ClosePosPair(P_3,Magic);
 ClosePosPair(P_3,0);}

if((CountPair(OP_BUY,P_4,Magic)>0 && CountPair(OP_SELL,P_4,0)>0) || (CountPair(OP_SELL,P_4,Magic)>0 && CountPair(OP_BUY,P_4,0)>0))
{ClosePosPair(P_4,Magic);
 ClosePosPair(P_4,0);}

if((CountPair(OP_BUY,P_5,Magic)>0 && CountPair(OP_SELL,P_5,0)>0) || (CountPair(OP_SELL,P_5,Magic)>0 && CountPair(OP_BUY,P_5,0)>0))
{ClosePosPair(P_5,Magic);
 ClosePosPair(P_5,0);}

if((CountPair(OP_BUY,P_6,Magic)>0 && CountPair(OP_SELL,P_6,0)>0) || (CountPair(OP_SELL,P_6,Magic)>0 && CountPair(OP_BUY,P_6,0)>0))
{ClosePosPair(P_6,Magic);
 ClosePosPair(P_6,0);}

if((CountPair(OP_BUY,P_7,Magic)>0 && CountPair(OP_SELL,P_7,0)>0) || (CountPair(OP_SELL,P_7,Magic)>0 && CountPair(OP_BUY,P_7,0)>0))
{ClosePosPair(P_7,Magic);
 ClosePosPair(P_7,0);}

if((CountPair(OP_BUY,P_8,Magic)>0 && CountPair(OP_SELL,P_8,0)>0) || (CountPair(OP_SELL,P_8,Magic)>0 && CountPair(OP_BUY,P_8,0)>0))
{ClosePosPair(P_8,Magic);
 ClosePosPair(P_8,0);}

if((CountPair(OP_BUY,P_9,Magic)>0 && CountPair(OP_SELL,P_9,0)>0) || (CountPair(OP_SELL,P_9,Magic)>0 && CountPair(OP_BUY,P_9,0)>0))
{ClosePosPair(P_9,Magic);
 ClosePosPair(P_9,0);}

//--- Закрыть все ордера
if(CountPair(-1,MobClosPair,0)>0)
{ClosePos(Magic);
 ClosePosPair(MobClosPair,0);}
}

//--- Стоп в процентах
double LossProc=(AccountBalance()/100)*StopLossProcent*(-1);
if(ProfitAll(-1)<LossProc && LossProc!=0)
{
ClosePos(Magic);
ObjectsDeleteAll(0,OBJ_ARROW);
ObjectsDeleteAll(0,OBJ_TREND);
}
//+------------------------------------------------------------------+

//--- Определяем пару по номеру с торговой панели

if(!ObjectGetInteger(0,"TRADEs_P1",OBJPROP_STATE) &&
    !ObjectGetInteger(0,"TRADEs_P2",OBJPROP_STATE) &&
    !ObjectGetInteger(0,"TRADEs_P3",OBJPROP_STATE) &&
    !ObjectGetInteger(0,"TRADEs_P4",OBJPROP_STATE) &&
    !ObjectGetInteger(0,"TRADEs_P5",OBJPROP_STATE) &&
    !ObjectGetInteger(0,"TRADEs_P6",OBJPROP_STATE) &&
    !ObjectGetInteger(0,"TRADEs_P7",OBJPROP_STATE) &&
    !ObjectGetInteger(0,"TRADEs_P8",OBJPROP_STATE) &&
    !ObjectGetInteger(0,"TRADEs_P9",OBJPROP_STATE))
  {PairName=Symbol();}
if(ObjectGetInteger(0,"TRADEs_P1",OBJPROP_STATE))
  {PairName=P_1;}
if(ObjectGetInteger(0,"TRADEs_P2",OBJPROP_STATE))
  {PairName=P_2;}
if(ObjectGetInteger(0,"TRADEs_P3",OBJPROP_STATE))
  {PairName=P_3;}
if(ObjectGetInteger(0,"TRADEs_P4",OBJPROP_STATE))
  {PairName=P_4;}
if(ObjectGetInteger(0,"TRADEs_P5",OBJPROP_STATE))
  {PairName=P_5;}
if(ObjectGetInteger(0,"TRADEs_P6",OBJPROP_STATE))
  {PairName=P_6;}
if(ObjectGetInteger(0,"TRADEs_P7",OBJPROP_STATE))
  {PairName=P_7;}
if(ObjectGetInteger(0,"TRADEs_P8",OBJPROP_STATE))
  {PairName=P_8;}
if(ObjectGetInteger(0,"TRADEs_P9",OBJPROP_STATE))
  {PairName=P_9;}
//+------------------------------------------------------------------+
//   Вывод информации
//+------------------------------------------------------------------+
//--- Текст кнопок включателей
//--- если язык русский 
if(Languale==0)
  {TextOn="Вкл";
   TextOff="Выкл";}
//--- если язык Английский 
if(Languale==1)
  {TextOn="On";
   TextOff="Off";}
   
//--- Инфопанель

if(!ObjectGetInteger(0,"INFO_Button",OBJPROP_STATE))
{ 
//--- если язык русский 
if(Languale==0)
  {
   RectLabelCreate("INFO_fon",240,20,220,385,FonColor,1);
   
   PutButton("INFO_Button",70,15,"INFO",1);
   
   PutLabelT("INFO_LOGO",235,24,"WWW.MFOREX.PRO",1);
   PutLabelT("INFO_Line",235,27,"______________________________",1);
   PutLabelDt("INFO_txt1",235,45,"Информация о счете",1);
   PutLabelT("INFO_Line2",235,47,"______________________________",1);
   PutLabelT("INFO_txt2",235,65,"Баланс:",1);
   PutLabelT("INFO_txt3",235,80,"Средства:",1);
   PutLabelT("INFO_txt4",235,95,"Маржа:",1);
   PutLabelT("INFO_txt5",235,110,"Свободная маржа:",1);
   PutLabelT("INFO_txt7",235,125,"Открыто ордеров:",1);
   PutLabelT("INFO_Line3",235,128,"______________________________",1);
   PutLabelDt("INFO_txt6",235,145,"Прибыль по счету",1);
   PutLabelT("INFO_Line4",235,148,"______________________________",1);

   PutLabelT("INFO_txt8",235,165,"Общий профит:",1);
   PutLabelT("INFO_txt9",235,180,"Профит за сегодня:",1);
   PutLabelT("INFO_txt10",235,195,"Профит за вчера:",1);
   PutLabelT("INFO_txt11",235,210,"Профит за неделю:",1);
   PutLabelT("INFO_txt12",235,225,"Профит за месяц:",1);
   
   PutLabelD("INFO_txt13",85,65,DoubleToStr(AccountBalance(), 2),1);
   PutLabelD("INFO_txt14",85,80,DoubleToStr(AccountEquity(), 2),1);
   PutLabelD("INFO_txt15",85,95,DoubleToStr(AccountMargin(), 2),1);
   PutLabelD("INFO_txt16",85,110,DoubleToStr(AccountFreeMargin(), 2),1);
   PutLabelD("INFO_txt17",85,125,DoubleToStr(CountAll(-1), 0),1);
   PutLabelD("INFO_txt18",85,165,DoubleToStr(ProfitAll(-1), 2),1);
   PutLabelD("INFO_txt19",85,180,DoubleToStr(ProfitDey(-1), 2),1);
   PutLabelD("INFO_txt20",85,195,DoubleToStr(ProfitTuDey(-1), 2),1);
   PutLabelD("INFO_txt21",85,210,DoubleToStr(ProfitWeek(-1), 2),1);
   PutLabelD("INFO_txt22",85,225,DoubleToStr(ProfitMontag(-1), 2),1);
   
   PutLabelT("INFO_Line5",235,227,"______________________________",1);
   PutLabelDt("INFO_txt23",235,243,"Прибыль по каждой паре",1);
   PutLabelT("INFO_Line6",235,247,"______________________________",1);
   
   PutLabelDt("INFO_txt24",235,263,"1. ",1);
   PutLabelT("INFO_txt25",220,263,"Профит по " + P_1 +":",1);
   PutLabelD("INFO_txt26",85,263,DoubleToStr(Profit(-1,P_1), 2),1);
   
   PutLabelDt("INFO_txt27",235,278,"2. ",1);
   PutLabelT("INFO_txt28",220,278,"Профит по " + P_2 +":",1);
   PutLabelD("INFO_txt29",85,278,DoubleToStr(Profit(-1,P_2), 2),1);
   
   PutLabelDt("INFO_txt30",235,293,"3. ",1);
   PutLabelT("INFO_txt31",220,293,"Профит по " + P_3 +":",1);
   PutLabelD("INFO_txt32",85,293,DoubleToStr(Profit(-1,P_3), 2),1);
   
   PutLabelDt("INFO_txt33",235,308,"4. ",1);
   PutLabelT("INFO_txt34",220,308,"Профит по " + P_4 +":",1);
   PutLabelD("INFO_txt35",85,308,DoubleToStr(Profit(-1,P_4), 2),1);
   
   PutLabelDt("INFO_txt36",235,323,"5. ",1);
   PutLabelT("INFO_txt37",220,323,"Профит по " + P_5 +":",1);
   PutLabelD("INFO_txt38",85,323,DoubleToStr(Profit(-1,P_5), 2),1);
   
   PutLabelDt("INFO_txt39",235,338,"6. ",1);
   PutLabelT("INFO_txt40",220,338,"Профит по " + P_6 +":",1);
   PutLabelD("INFO_txt41",85,338,DoubleToStr(Profit(-1,P_6), 2),1);
   
   PutLabelDt("INFO_txt42",235,353,"7. ",1);
   PutLabelT("INFO_txt43",220,353,"Профит по " + P_7 +":",1);
   PutLabelD("INFO_txt44",85,353,DoubleToStr(Profit(-1,P_7), 2),1);
   
   PutLabelDt("INFO_txt45",235,368,"8. ",1);
   PutLabelT("INFO_txt46",220,368,"Профит по " + P_8 +":",1);
   PutLabelD("INFO_txt47",85,368,DoubleToStr(Profit(-1,P_8), 2),1);
   
   PutLabelDt("INFO_txt48",235,383,"9. ",1);
   PutLabelT("INFO_txt49",220,383,"Профит по " + P_9 +":",1);
   PutLabelD("INFO_txt50",85,383,DoubleToStr(Profit(-1,P_9), 2),1);
   
   }
//--- если язык английский
if(Languale==1)
  {
   RectLabelCreate("INFO_fon",240,20,220,385,FonColor,1);
   
   PutButton("INFO_Button",70,15,"INFO",1);
   
   PutLabelT("INFO_LOGO",235,24,"WWW.MFOREX.PRO",1);
   PutLabelT("INFO_Line",235,27,"______________________________",1);
   PutLabelDt("INFO_txt1",235,45,"Account information",1);
   PutLabelT("INFO_Line2",235,47,"______________________________",1);
   PutLabelT("INFO_txt2",235,65,"Balanse:",1);
   PutLabelT("INFO_txt3",235,80,"Equity:",1);
   PutLabelT("INFO_txt4",235,95,"Margin:",1);
   PutLabelT("INFO_txt5",235,110,"Free margin:",1);
   PutLabelT("INFO_txt7",235,125,"Open orders:",1);
   PutLabelT("INFO_Line3",235,128,"______________________________",1);
   PutLabelDt("INFO_txt6",235,145,"Profit on account",1);
   PutLabelT("INFO_Line4",235,148,"______________________________",1);

   PutLabelT("INFO_txt8",235,165,"Total profit:",1);
   PutLabelT("INFO_txt9",235,180,"Profit for today:",1);
   PutLabelT("INFO_txt10",235,195,"Profit for yesterday:",1);
   PutLabelT("INFO_txt11",235,210,"Profit for week:",1);
   PutLabelT("INFO_txt12",235,225,"Profit for month:",1);
   
   PutLabelD("INFO_txt13",85,65,DoubleToStr(AccountBalance(), 2),1);
   PutLabelD("INFO_txt14",85,80,DoubleToStr(AccountEquity(), 2),1);
   PutLabelD("INFO_txt15",85,95,DoubleToStr(AccountMargin(), 2),1);
   PutLabelD("INFO_txt16",85,110,DoubleToStr(AccountFreeMargin(), 2),1);
   PutLabelD("INFO_txt17",85,125,DoubleToStr(CountAll(-1), 0),1);
   PutLabelD("INFO_txt18",85,165,DoubleToStr(ProfitAll(-1), 2),1);
   PutLabelD("INFO_txt19",85,180,DoubleToStr(ProfitDey(-1), 2),1);
   PutLabelD("INFO_txt20",85,195,DoubleToStr(ProfitTuDey(-1), 2),1);
   PutLabelD("INFO_txt21",85,210,DoubleToStr(ProfitWeek(-1), 2),1);
   PutLabelD("INFO_txt22",85,225,DoubleToStr(ProfitMontag(-1), 2),1);
   
   PutLabelT("INFO_Line5",235,227,"______________________________",1);
   PutLabelDt("INFO_txt23",235,243,"Profit for each pair",1);
   PutLabelT("INFO_Line6",235,247,"______________________________",1);
   
   PutLabelDt("INFO_txt24",235,263,"1. ",1);
   PutLabelT("INFO_txt25",220,263,"Profit for " + P_1 +":",1);
   PutLabelD("INFO_txt26",85,263,DoubleToStr(Profit(-1,P_1), 2),1);
   
   PutLabelDt("INFO_txt27",235,278,"2. ",1);
   PutLabelT("INFO_txt28",220,278,"Profit for " + P_2 +":",1);
   PutLabelD("INFO_txt29",85,278,DoubleToStr(Profit(-1,P_2), 2),1);
   
   PutLabelDt("INFO_txt30",235,293,"3. ",1);
   PutLabelT("INFO_txt31",220,293,"Profit for " + P_3 +":",1);
   PutLabelD("INFO_txt32",85,293,DoubleToStr(Profit(-1,P_3), 2),1);
   
   PutLabelDt("INFO_txt33",235,308,"4. ",1);
   PutLabelT("INFO_txt34",220,308,"Profit for " + P_4 +":",1);
   PutLabelD("INFO_txt35",85,308,DoubleToStr(Profit(-1,P_4), 2),1);
   
   PutLabelDt("INFO_txt36",235,323,"5. ",1);
   PutLabelT("INFO_txt37",220,323,"Profit for " + P_5 +":",1);
   PutLabelD("INFO_txt38",85,323,DoubleToStr(Profit(-1,P_5), 2),1);
   
   PutLabelDt("INFO_txt39",235,338,"6. ",1);
   PutLabelT("INFO_txt40",220,338,"Profit for " + P_6 +":",1);
   PutLabelD("INFO_txt41",85,338,DoubleToStr(Profit(-1,P_6), 2),1);
   
   PutLabelDt("INFO_txt42",235,353,"7. ",1);
   PutLabelT("INFO_txt43",220,353,"Profit for " + P_7 +":",1);
   PutLabelD("INFO_txt44",85,353,DoubleToStr(Profit(-1,P_7), 2),1);
   
   PutLabelDt("INFO_txt45",235,368,"8. ",1);
   PutLabelT("INFO_txt46",220,368,"Profit for " + P_8 +":",1);
   PutLabelD("INFO_txt47",85,368,DoubleToStr(Profit(-1,P_8), 2),1);
   
   PutLabelDt("INFO_txt48",235,383,"9. ",1);
   PutLabelT("INFO_txt49",220,383,"Profit for " + P_9 +":",1);
   PutLabelD("INFO_txt50",85,383,DoubleToStr(Profit(-1,P_9), 2),1);
   }
}
//+------------------------------------------------------------------+
//   Торговая панель 
//+------------------------------------------------------------------+
if(!ObjectGetInteger(0,"TRADE_Button",OBJPROP_STATE))
{
//--- Если язык русский
if(Languale==0)
  {
   RectLabelCreate("TRADE_fon",15,20,200,295,FonColor,0);
   PutButton("TRADE_Button",5,15,"TRADE",0);
   PutLabelT("TRADE_LOGO",95,25,"WWW.MFOREX.PRO",0);
   PutLabelT("TRADE_Line",20,28,"___________________________",0);
   PutLabelT("TRADE_Line2",20,66,"___________________________",0);
   PutLabelT("TRADE_Line3",20,126,"___________________________",0);
   PutLabelT("TRADE_Line4",20,146,"___________________________",0);
   PutLabelT("TRADE_Line5",20,168,"___________________________",0);
   PutLabelT("TRADE_Line6",20,188,"___________________________",0);
   PutLabelT("TRADE_Line7",20,286,"___________________________",0);
   PutLabelDt("TRADE_txt",20,44,"Работаем с парой ",0);
   PutLabelT("TRADE_txt1",156,44,PairName,0);
   
   PutButtonPair("TRADEs_P1",21,60,"1",20,17);
   PutButtonPair("TRADEs_P2",42,60,"2",20,17);
   PutButtonPair("TRADEs_P3",63,60,"3",20,17);
   PutButtonPair("TRADEs_P4",84,60,"4",20,17);
   PutButtonPair("TRADEs_P5",105,60,"5",20,17);
   PutButtonPair("TRADEs_P6",126,60,"6",20,17);
   PutButtonPair("TRADEs_P7",147,60,"7",20,17);
   PutButtonPair("TRADEs_P8",168,60,"8",20,17);
   PutButtonPair("TRADEs_P9",189,60,"9",20,17);
   
   PutLabelT("TRADE_txt2",20,82,"Закрыть Плюс: ",0);
   PutButtonER("TRADEs_CP",160,82,"",50,17);
   PutLabelT("TRADE_txt3",20,101,"Закрыть Минус: ",0);
   PutButtonER("TRADEs_CM",160,101,"",50,17);
   PutLabelT("TRADE_txt4",20,120,"Закрыть все по паре: ",0);
   PutButtonER("TRADEs_CA",160,120,"",50,17);
   
   PutLabelDt("TRADE_txt5",20,142,"Работа с общей прибылью",0);
   
   PutLabelT("TRADE_txt6",20,162,"Закрыть все ордера: ",0);
   PutButtonER("TRADEs_CO",160,162,"",50,17);
   PutLabelDt("TRADE_txt7",20,184,"Торговые настройки",0);
   PutLabelT("TRADE_txt8",20,205,"Авто Торговля: ",0);
   PutButtonER("TRADEs_AU",160,204,"",50,17);
   PutLabelT("TRADE_txt9",20,223,"Сетка в Плюс: ",0);
   PutButtonER("TRADEs_SP",160,223,"",50,17);
   PutLabelT("TRADE_txt10",20,242,"Сетка в Минус: ",0);
   PutButtonER("TRADEs_SM",160,242,"",50,17);
   
   PutLabelT("TRADE_txt11",20,261,"Торговля Мобильным: ",0);
   PutButtonER("TRADEs_MO",160,261,"",50,17);
   PutLabelT("TRADE_txt12",20,280,"Разгрузить на ночь: ",0);
   PutButtonER("TRADEs_CN",160,280,"",50,17);
   
   PutButtonBS("TRADEs_B",13,302,"BUY           " + DoubleToStr(Lot_1, dig_1),100,22,FonButtonBuy,TextButtonBS);
   PutButtonBS("TRADEs_S",118,302,"SELL           " + DoubleToStr(Lot_1, dig_1),100,22,FonButtonSell,TextButtonBS);
}  
//--- Если язык английский
if(Languale==1)
  {
   RectLabelCreate("TRADE_fon",15,20,200,295,FonColor,0);
   PutButton("TRADE_Button",5,15,"TRADE",0);
   PutLabelT("TRADE_LOGO",95,25,"WWW.MFOREX.PRO",0);
   PutLabelT("TRADE_Line",20,28,"___________________________",0);
   PutLabelT("TRADE_Line2",20,66,"___________________________",0);
   PutLabelT("TRADE_Line3",20,126,"___________________________",0);
   PutLabelT("TRADE_Line4",20,146,"___________________________",0);
   PutLabelT("TRADE_Line5",20,168,"___________________________",0);
   PutLabelT("TRADE_Line6",20,188,"___________________________",0);
   PutLabelT("TRADE_Line7",20,286,"___________________________",0);
   PutLabelDt("TRADE_txt",20,44,"Work with a pair ",0);
   PutLabelT("TRADE_txt1",156,44,PairName,0);
   
   PutButtonPair("TRADEs_P1",21,60,"1",20,17);
   PutButtonPair("TRADEs_P2",42,60,"2",20,17);
   PutButtonPair("TRADEs_P3",63,60,"3",20,17);
   PutButtonPair("TRADEs_P4",84,60,"4",20,17);
   PutButtonPair("TRADEs_P5",105,60,"5",20,17);
   PutButtonPair("TRADEs_P6",126,60,"6",20,17);
   PutButtonPair("TRADEs_P7",147,60,"7",20,17);
   PutButtonPair("TRADEs_P8",168,60,"8",20,17);
   PutButtonPair("TRADEs_P9",189,60,"9",20,17);
   
   PutLabelT("TRADE_txt2",20,82,"Close Profit: ",0);
   PutButtonER("TRADEs_CP",160,82,"",50,17);
   PutLabelT("TRADE_txt3",20,101,"Close Loss: ",0);
   PutButtonER("TRADEs_CM",160,101,"",50,17);
   PutLabelT("TRADE_txt4",20,120,"Close all by pair: ",0);
   PutButtonER("TRADEs_CA",160,120,"",50,17);
   
   PutLabelDt("TRADE_txt5",20,142,"Work with total profit",0);
   
   PutLabelT("TRADE_txt6",20,162,"Close all orders: ",0);
   PutButtonER("TRADEs_CO",160,162,"",50,17);
   PutLabelDt("TRADE_txt7",20,184,"Trading settings",0);
   PutLabelT("TRADE_txt8",20,205,"Auto Trade: ",0);
   PutButtonER("TRADEs_AU",160,204,"",50,17);
   PutLabelT("TRADE_txt9",20,223,"Grid in Profit: ",0);
   PutButtonER("TRADEs_SP",160,223,"",50,17);
   PutLabelT("TRADE_txt10",20,242,"Grid to Loss: ",0);
   PutButtonER("TRADEs_SM",160,242,"",50,17);
   
   PutLabelT("TRADE_txt11",20,261,"Mobile Trading: ",0);
   PutButtonER("TRADEs_MO",160,261,"",50,17);
   PutLabelT("TRADE_txt12",20,280,"Unload at night: ",0);
   PutButtonER("TRADEs_CN",160,280,"",50,17);
   
   PutButtonBS("TRADEs_B",13,302,"BUY           " + DoubleToStr(Lot_1, dig_1),100,22,FonButtonBuy,TextButtonBS);
   PutButtonBS("TRADEs_S",118,302,"SELL           " + DoubleToStr(Lot_1, dig_1),100,22,FonButtonSell,TextButtonBS);
}  
   
//--- Меняем текст кнопок при нажатии

if(!ObjectGetInteger(0,"TRADEs_CP",OBJPROP_STATE))
{ObjectSetString(0,"TRADEs_CP",OBJPROP_TEXT,TextOff);}
else
{ObjectSetString(0,"TRADEs_CP",OBJPROP_TEXT,TextOn);}
//------------------
if(!ObjectGetInteger(0,"TRADEs_CM",OBJPROP_STATE))
{ObjectSetString(0,"TRADEs_CM",OBJPROP_TEXT,TextOff);}
else
{ObjectSetString(0,"TRADEs_CM",OBJPROP_TEXT,TextOn);}
//------------------
if(!ObjectGetInteger(0,"TRADEs_CA",OBJPROP_STATE))
{ObjectSetString(0,"TRADEs_CA",OBJPROP_TEXT,TextOff);}
else
{ObjectSetString(0,"TRADEs_CA",OBJPROP_TEXT,TextOn);}
//------------------
if(!ObjectGetInteger(0,"TRADEs_CO",OBJPROP_STATE))
{ObjectSetString(0,"TRADEs_CO",OBJPROP_TEXT,TextOff);}
else
{ObjectSetString(0,"TRADEs_CO",OBJPROP_TEXT,TextOn);}
//------------------
if(!ObjectGetInteger(0,"TRADEs_AU",OBJPROP_STATE))
{ObjectSetString(0,"TRADEs_AU",OBJPROP_TEXT,TextOn);
 ObjectSetInteger(0,"TRADEs_AU",OBJPROP_BGCOLOR,ClickButton);}
else
{ObjectSetString(0,"TRADEs_AU",OBJPROP_TEXT,TextOff);
 ObjectSetInteger(0,"TRADEs_AU",OBJPROP_BGCOLOR,FonButton);}
//------------------
if(!ObjectGetInteger(0,"TRADEs_SP",OBJPROP_STATE))
{ObjectSetString(0,"TRADEs_SP",OBJPROP_TEXT,TextOn);
 ObjectSetInteger(0,"TRADEs_SP",OBJPROP_BGCOLOR,ClickButton);}
else
{ObjectSetString(0,"TRADEs_SP",OBJPROP_TEXT,TextOff);
 ObjectSetInteger(0,"TRADEs_SP",OBJPROP_BGCOLOR,FonButton);}
//------------------
if(!ObjectGetInteger(0,"TRADEs_SM",OBJPROP_STATE))
{ObjectSetString(0,"TRADEs_SM",OBJPROP_TEXT,TextOn);
 ObjectSetInteger(0,"TRADEs_SM",OBJPROP_BGCOLOR,ClickButton);}
else
{ObjectSetString(0,"TRADEs_SM",OBJPROP_TEXT,TextOff);
 ObjectSetInteger(0,"TRADEs_SM",OBJPROP_BGCOLOR,FonButton);}
//------------------
if(!ObjectGetInteger(0,"TRADEs_MO",OBJPROP_STATE))
{ObjectSetString(0,"TRADEs_MO",OBJPROP_TEXT,TextOff);
 ObjectSetInteger(0,"TRADEs_MO",OBJPROP_BGCOLOR,FonButton);}
else
{ObjectSetString(0,"TRADEs_MO",OBJPROP_TEXT,TextOn);
 ObjectSetInteger(0,"TRADEs_MO",OBJPROP_BGCOLOR,ClickButton);}
//------------------
if(!ObjectGetInteger(0,"TRADEs_CN",OBJPROP_STATE))
{ObjectSetString(0,"TRADEs_CN",OBJPROP_TEXT,TextOff);
 ObjectSetInteger(0,"TRADEs_CN",OBJPROP_BGCOLOR,FonButton);}
else
{ObjectSetString(0,"TRADEs_CN",OBJPROP_TEXT,TextOn);
 ObjectSetInteger(0,"TRADEs_CN",OBJPROP_BGCOLOR,ClickButton);}
//---

//--- Меняем цвет кнопок выбора пары
//------------------
if(ObjectGetInteger(0,"TRADEs_P1",OBJPROP_STATE))
 {ObjectSetInteger(0,"TRADEs_P1",OBJPROP_BGCOLOR,ClickButton);}
else 
 {ObjectSetInteger(0,"TRADEs_P1",OBJPROP_BGCOLOR,FonButton);}
//------------------
if(ObjectGetInteger(0,"TRADEs_P2",OBJPROP_STATE))
 {ObjectSetInteger(0,"TRADEs_P2",OBJPROP_BGCOLOR,ClickButton);}
else 
 {ObjectSetInteger(0,"TRADEs_P2",OBJPROP_BGCOLOR,FonButton);}
//------------------
if(ObjectGetInteger(0,"TRADEs_P3",OBJPROP_STATE))
 {ObjectSetInteger(0,"TRADEs_P3",OBJPROP_BGCOLOR,ClickButton);}
else 
 {ObjectSetInteger(0,"TRADEs_P3",OBJPROP_BGCOLOR,FonButton);}
//------------------
if(ObjectGetInteger(0,"TRADEs_P4",OBJPROP_STATE))
 {ObjectSetInteger(0,"TRADEs_P4",OBJPROP_BGCOLOR,ClickButton);}
else 
 {ObjectSetInteger(0,"TRADEs_P4",OBJPROP_BGCOLOR,FonButton);}
//------------------
if(ObjectGetInteger(0,"TRADEs_P5",OBJPROP_STATE))
 {ObjectSetInteger(0,"TRADEs_P5",OBJPROP_BGCOLOR,ClickButton);}
else 
 {ObjectSetInteger(0,"TRADEs_P5",OBJPROP_BGCOLOR,FonButton);}
//------------------
if(ObjectGetInteger(0,"TRADEs_P6",OBJPROP_STATE))
 {ObjectSetInteger(0,"TRADEs_P6",OBJPROP_BGCOLOR,ClickButton);}
else 
 {ObjectSetInteger(0,"TRADEs_P6",OBJPROP_BGCOLOR,FonButton);}
//------------------
if(ObjectGetInteger(0,"TRADEs_P7",OBJPROP_STATE))
 {ObjectSetInteger(0,"TRADEs_P7",OBJPROP_BGCOLOR,ClickButton);}
else 
 {ObjectSetInteger(0,"TRADEs_P7",OBJPROP_BGCOLOR,FonButton);}
//------------------
if(ObjectGetInteger(0,"TRADEs_P8",OBJPROP_STATE))
 {ObjectSetInteger(0,"TRADEs_P8",OBJPROP_BGCOLOR,ClickButton);}
else 
 {ObjectSetInteger(0,"TRADEs_P8",OBJPROP_BGCOLOR,FonButton);}
//------------------
if(ObjectGetInteger(0,"TRADEs_P9",OBJPROP_STATE))
 {ObjectSetInteger(0,"TRADEs_P9",OBJPROP_BGCOLOR,ClickButton);}
else 
 {ObjectSetInteger(0,"TRADEs_P9",OBJPROP_BGCOLOR,FonButton);}

} 
//---
}
}
}
//+------------------------------------------------------------------+
//|   Кнопки                                                         |
//+------------------------------------------------------------------+
void OnChartEvent(const int id, const long &lparam, const double &dparam, const string &sparam)
{

//---Кнопка INFO (Свернуть/развернуть панель)
if(ObjectGetInteger(0,"INFO_Button",OBJPROP_STATE))
{ObjectsDeleteAll(0,"INFO_",EMPTY,OBJ_RECTANGLE_LABEL);
   ObjectsDeleteAll(0,"INFO_",EMPTY,OBJ_LABEL);
   PutButtonInfo("SVERNUT_",70,15,"INFO",1);}

if(ObjectGetInteger(0,"SVERNUT_",OBJPROP_STATE))
{ObjectsDeleteAll(0,"INFO_",EMPTY,OBJ_BUTTON);
ObjectsDeleteAll(0,"SVERNUT_",EMPTY,OBJ_BUTTON);}

//---Кнопка TRADE (Свернуть/развернуть панель)
if(ObjectGetInteger(0,"TRADE_Button",OBJPROP_STATE))
{ObjectsDeleteAll(0,"TRADE_",EMPTY,OBJ_RECTANGLE_LABEL);
 ObjectsDeleteAll(0,"TRADEs_",EMPTY,OBJ_BUTTON);
   ObjectsDeleteAll(0,"TRADE_",EMPTY,OBJ_LABEL);
   ObjectsDeleteAll(0,"TRADE_",EMPTY,OBJ_EDIT);
   PutButtonInfo("SVERNUTt_",5,15,"TRADE",0);}

if(ObjectGetInteger(0,"SVERNUTt_",OBJPROP_STATE))
{ObjectsDeleteAll(0,"TRADE_",EMPTY,OBJ_BUTTON);
ObjectsDeleteAll(0,"SVERNUTt_",EMPTY,OBJ_BUTTON);}

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
if(ObjectGetInteger(0,"TRADEs_CP",OBJPROP_STATE))
 {ObjectSetInteger(0,"TRADEs_CP",OBJPROP_BGCOLOR,ClickButton);}
else 
 {ObjectSetInteger(0,"TRADEs_CP",OBJPROP_BGCOLOR,FonButton);}
//------------------
if(ObjectGetInteger(0,"TRADEs_CM",OBJPROP_STATE))
 {ObjectSetInteger(0,"TRADEs_CM",OBJPROP_BGCOLOR,ClickButton);}
else 
 {ObjectSetInteger(0,"TRADEs_CM",OBJPROP_BGCOLOR,FonButton);}
//------------------
if(ObjectGetInteger(0,"TRADEs_CA",OBJPROP_STATE))
 {ObjectSetInteger(0,"TRADEs_CA",OBJPROP_BGCOLOR,ClickButton);}
else 
 {ObjectSetInteger(0,"TRADEs_CA",OBJPROP_BGCOLOR,FonButton);}
//------------------
if(ObjectGetInteger(0,"TRADEs_CO",OBJPROP_STATE))
 {ObjectSetInteger(0,"TRADEs_CO",OBJPROP_BGCOLOR,ClickButton);}
else 
 {ObjectSetInteger(0,"TRADEs_CO",OBJPROP_BGCOLOR,FonButton);}   
//+------------------------------------------------------------------+
//    Проверим событие на нажатие кнопки мышки
//+------------------------------------------------------------------+
if(id==CHARTEVENT_OBJECT_CLICK)
{string clickedChartObject=sparam;

if(clickedChartObject=="TRADEs_B")
  {o=OrderSend(PairName,OP_BUY,Lot_1,MarketInfo(PairName,MODE_ASK),10,0,0,comment,Magic,0,Green);       
   ObjectSetInteger(0,"TRADEs_B",OBJPROP_STATE,false);}
if(clickedChartObject=="TRADEs_S")
  {o=OrderSend(PairName,OP_SELL,Lot_1,MarketInfo(PairName,MODE_BID),10,0,0,comment,Magic,0,Red);
   ObjectSetInteger(0,"TRADEs_S",OBJPROP_STATE,false);}

if(clickedChartObject=="TRADEs_CP")
  {ObjectSetString(0,"TRADEs_CP",OBJPROP_TEXT,TextOn);
   ClosePlusPair(PairName);
   ObjectsDeleteAll(0,OBJ_ARROW);
   ObjectsDeleteAll(0,OBJ_TREND);
   ObjectSetInteger(0,"TRADEs_CP",OBJPROP_STATE,false);}
   
if(clickedChartObject=="TRADEs_CM")
  {ObjectSetString(0,"TRADEs_CM",OBJPROP_TEXT,TextOn);
   CloseMinusPair(PairName);
   ObjectsDeleteAll(0,OBJ_ARROW);
   ObjectsDeleteAll(0,OBJ_TREND);
   ObjectSetInteger(0,"TRADEs_CM",OBJPROP_STATE,false);}

if(clickedChartObject=="TRADEs_CA")
  {ObjectSetString(0,"TRADEs_CA",OBJPROP_TEXT,TextOn);
   ClosePosPair(PairName);
   ObjectsDeleteAll(0,OBJ_ARROW);
   ObjectsDeleteAll(0,OBJ_TREND);
   ObjectSetInteger(0,"TRADEs_CA",OBJPROP_STATE,false);}
   
if(clickedChartObject=="TRADEs_CO")
  {ObjectSetString(0,"TRADEs_CO",OBJPROP_TEXT,TextOn);
   ClosePos();
   ObjectsDeleteAll(0,OBJ_ARROW);
   ObjectsDeleteAll(0,OBJ_TREND);
   ObjectSetInteger(0,"TRADEs_CO",OBJPROP_STATE,false);}

//---------------Отжатие противоположных кнопок---------
if(clickedChartObject=="TRADEs_P1")
  {ObjectSetInteger(0,"TRADEs_P2",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P3",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P4",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P5",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P6",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P7",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P8",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P9",OBJPROP_STATE,false);}
//-----------------   
if(clickedChartObject=="TRADEs_P2")
  {ObjectSetInteger(0,"TRADEs_P1",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P3",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P4",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P5",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P6",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P7",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P8",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P9",OBJPROP_STATE,false);}
//-----------------   
if(clickedChartObject=="TRADEs_P3")
  {ObjectSetInteger(0,"TRADEs_P2",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P1",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P4",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P5",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P6",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P7",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P8",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P9",OBJPROP_STATE,false);}
//-----------------   
if(clickedChartObject=="TRADEs_P4")
  {ObjectSetInteger(0,"TRADEs_P2",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P3",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P1",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P5",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P6",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P7",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P8",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P9",OBJPROP_STATE,false);}
//-----------------   
if(clickedChartObject=="TRADEs_P5")
  {ObjectSetInteger(0,"TRADEs_P2",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P3",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P4",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P1",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P6",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P7",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P8",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P9",OBJPROP_STATE,false);}
//-----------------   
if(clickedChartObject=="TRADEs_P6")
  {ObjectSetInteger(0,"TRADEs_P2",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P3",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P4",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P5",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P1",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P7",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P8",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P9",OBJPROP_STATE,false);}
//-----------------   
if(clickedChartObject=="TRADEs_P7")
  {ObjectSetInteger(0,"TRADEs_P2",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P3",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P4",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P5",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P6",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P1",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P8",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P9",OBJPROP_STATE,false);}
//-----------------   
if(clickedChartObject=="TRADEs_P8")
  {ObjectSetInteger(0,"TRADEs_P2",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P3",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P4",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P5",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P6",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P7",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P1",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P9",OBJPROP_STATE,false);}
//-----------------   
if(clickedChartObject=="TRADEs_P9")
  {ObjectSetInteger(0,"TRADEs_P2",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P3",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P4",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P5",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P6",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P7",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P8",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P1",OBJPROP_STATE,false);}
//-----------------   


//--- Принудительно перерисуем все объекты на графике

ChartRedraw();
}}
//+------------------------------------------------------------------+
//|   Графические метки                                                     
//+------------------------------------------------------------------+

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

//--- Создаем кнопку

void PutButton(string name,int x,int y,string text, int space)
  {ObjectCreate(0,name,OBJ_BUTTON,0,0,0);
//--- установим координаты кнопки
   ObjectSetInteger(0,name,OBJPROP_XDISTANCE,x);
   ObjectSetInteger(0,name,OBJPROP_YDISTANCE,y);
//--- установим размер кнопки
   ObjectSetInteger(0,name,OBJPROP_XSIZE,BWidth);
   ObjectSetInteger(0,name,OBJPROP_YSIZE,BHeigh);
//--- установим угол графика, относительно которого будут определяться координаты точки
   ObjectSetInteger(0,name,OBJPROP_CORNER,space);
//--- установим текст
   ObjectSetString(0,name,OBJPROP_TEXT,text);
//--- установим шрифт текста
   ObjectSetString(0,name,OBJPROP_FONT,"Arial");
//--- установим размер шрифта
   ObjectSetInteger(0,name,OBJPROP_FONTSIZE,FontSizeInfo);
//--- установим цвет текста
   ObjectSetInteger(0,name,OBJPROP_COLOR,TXTButton);
//--- установим цвет фона
   ObjectSetInteger(0,name,OBJPROP_BGCOLOR,ClickButton);
//--- установим цвет границы
   ObjectSetInteger(0,name,OBJPROP_BORDER_COLOR,ButtonBorder);
//--- скроем (true) или отобразим (false) имя графического объекта в списке объектов
   ObjectSetInteger(0,name,OBJPROP_HIDDEN,false);
//--- отобразим на переднем (false) или заднем (true) плане
   ObjectSetInteger(0,name,OBJPROP_BACK,false);}
   
//--- Цвет текста

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
   
//--- Цвет текста разделителей, лого

void PutLabelDt(string name,int x,int y,string text,int space)
  {ObjectCreate(0,name,OBJ_LABEL,0,0,0);
//--- установим координаты метки
   ObjectSetInteger(0,name,OBJPROP_XDISTANCE,x);
   ObjectSetInteger(0,name,OBJPROP_YDISTANCE,y);
//--- установим угол графика, относительно которого будут определяться координаты точки
   ObjectSetInteger(0,name,OBJPROP_CORNER,space);
//--- установим текст
   ObjectSetString(0,name,OBJPROP_TEXT,text);
//--- установим шрифт текста
   ObjectSetString(0,name,OBJPROP_FONT,"Arial");
//--- установим размер шрифта
   ObjectSetInteger(0,name,OBJPROP_FONTSIZE,FontSizeInfo);
//--- установим цвет
   ObjectSetInteger(0,name,OBJPROP_COLOR,InfoDataColorText);
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

//--- Кнопка для инфопанели
  
void PutButtonInfo(string name,int x,int y,string text, int space)
  {ObjectCreate(0,name,OBJ_BUTTON,0,0,0);
//--- установим координаты кнопки
   ObjectSetInteger(0,name,OBJPROP_XDISTANCE,x);
   ObjectSetInteger(0,name,OBJPROP_YDISTANCE,y);
//--- установим размер кнопки
   ObjectSetInteger(0,name,OBJPROP_XSIZE,BWidth);
   ObjectSetInteger(0,name,OBJPROP_YSIZE,BHeigh);
//--- установим угол графика, относительно которого будут определяться координаты точки
   ObjectSetInteger(0,name,OBJPROP_CORNER,space);
//--- установим текст
   ObjectSetString(0,name,OBJPROP_TEXT,text);
//--- установим шрифт текста
   ObjectSetString(0,name,OBJPROP_FONT,"Arial");
//--- установим размер шрифта
   ObjectSetInteger(0,name,OBJPROP_FONTSIZE,FontSizeInfo);
//--- установим цвет текста
   ObjectSetInteger(0,name,OBJPROP_COLOR,TXTButton);
//--- установим цвет фона
   ObjectSetInteger(0,name,OBJPROP_BGCOLOR,FonButtonInfo);
//--- установим цвет границы
   ObjectSetInteger(0,name,OBJPROP_BORDER_COLOR,ButtonBorder);
//--- скроем (true) или отобразим (false) имя графического объекта в списке объектов
   ObjectSetInteger(0,name,OBJPROP_HIDDEN,false);
//--- отобразим на переднем (false) или заднем (true) плане
   ObjectSetInteger(0,name,OBJPROP_BACK,false);}
   
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
   ObjectSetInteger(0,name,OBJPROP_CORNER,0);
//--- установим текст
   ObjectSetString(0,name,OBJPROP_TEXT,text);
//--- установим шрифт текста
   ObjectSetString(0,name,OBJPROP_FONT,"Arial");
//--- установим размер шрифта
   ObjectSetInteger(0,name,OBJPROP_FONTSIZE,FontSize);
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
  
//--- Обычные кнопки с размером

void PutButtonER(string name,int x,int y,string text,int BWidth2,int BHeigh2)
  {ObjectCreate(0,name,OBJ_BUTTON,0,0,0);
//--- установим координаты кнопки
   ObjectSetInteger(0,name,OBJPROP_XDISTANCE,x);
   ObjectSetInteger(0,name,OBJPROP_YDISTANCE,y);
//--- установим размер кнопки
   ObjectSetInteger(0,name,OBJPROP_XSIZE,BWidth2);
   ObjectSetInteger(0,name,OBJPROP_YSIZE,BHeigh2);
//--- установим угол графика, относительно которого будут определяться координаты точки
   ObjectSetInteger(0,name,OBJPROP_CORNER,0);
//--- установим текст
   ObjectSetString(0,name,OBJPROP_TEXT,text);
//--- установим шрифт текста
   ObjectSetString(0,name,OBJPROP_FONT,"Arial");
//--- установим размер шрифта
   ObjectSetInteger(0,name,OBJPROP_FONTSIZE,FontSize);
//--- установим цвет текста
   ObjectSetInteger(0,name,OBJPROP_COLOR,TXTButton);
//--- установим цвет фона
   ObjectSetInteger(0,name,OBJPROP_BGCOLOR,FonButton);
//--- установим цвет границы
   ObjectSetInteger(0,name,OBJPROP_BORDER_COLOR,ButtonBorder);
//--- скроем (true) или отобразим (false) имя графического объекта в списке объектов
   ObjectSetInteger(0,name,OBJPROP_HIDDEN,false);
//--- отобразим на переднем (false) или заднем (true) плане
   ObjectSetInteger(0,name,OBJPROP_BACK,false);
  }

//--- Кнопка выбора пары

void PutButtonPair(string name,int x,int y,string text,int BWidth2,int BHeigh2)
  {ObjectCreate(0,name,OBJ_BUTTON,0,0,0);
//--- установим координаты кнопки
   ObjectSetInteger(0,name,OBJPROP_XDISTANCE,x);
   ObjectSetInteger(0,name,OBJPROP_YDISTANCE,y);
//--- установим размер кнопки
   ObjectSetInteger(0,name,OBJPROP_XSIZE,BWidth2);
   ObjectSetInteger(0,name,OBJPROP_YSIZE,BHeigh2);
//--- установим угол графика, относительно которого будут определяться координаты точки
   ObjectSetInteger(0,name,OBJPROP_CORNER,0);
//--- установим текст
   ObjectSetString(0,name,OBJPROP_TEXT,text);
//--- установим шрифт текста
   ObjectSetString(0,name,OBJPROP_FONT,"Arial");
//--- установим размер шрифта
   ObjectSetInteger(0,name,OBJPROP_FONTSIZE,FontSize);
//--- установим цвет текста
   ObjectSetInteger(0,name,OBJPROP_COLOR,TXTButton);
//--- установим цвет фона
   ObjectSetInteger(0,name,OBJPROP_BGCOLOR,FonButton);
//--- установим цвет границы
   ObjectSetInteger(0,name,OBJPROP_BORDER_COLOR,ButtonBorder);
//--- скроем (true) или отобразим (false) имя графического объекта в списке объектов
   ObjectSetInteger(0,name,OBJPROP_HIDDEN,false);
//--- отобразим на переднем (false) или заднем (true) плане
   ObjectSetInteger(0,name,OBJPROP_BACK,false);
  }
//--- Поле ввода (выбор номера пары)
void PutEdit(string name,int x,int y,string text, int width, int heigh)
{ObjectCreate(0,name,OBJ_EDIT,0,0,0);
//--- установим координаты
ObjectSetInteger(0,name,OBJPROP_XDISTANCE,x);
   ObjectSetInteger(0,name,OBJPROP_YDISTANCE,y);
//--- установим размеры объекта
   ObjectSetInteger(0,name,OBJPROP_XSIZE,width);
   ObjectSetInteger(0,name,OBJPROP_YSIZE,heigh);
//--- установим текст
   ObjectSetString(0,name,OBJPROP_TEXT,text);
//--- установим шрифт текста
   ObjectSetString(0,name,OBJPROP_FONT,"Arial");
//--- установим размер шрифта
   ObjectSetInteger(0,name,OBJPROP_FONTSIZE,FontSize);
//--- установим способ выравнивания текста в объекте
   ObjectSetInteger(0,name,OBJPROP_ALIGN,ALIGN_CENTER);
//--- установим (true) или отменим (false) режим только для чтения
   ObjectSetInteger(0,name,OBJPROP_READONLY,false);
//--- установим угол графика, относительно которого будут определяться координаты объекта
   ObjectSetInteger(0,name,OBJPROP_CORNER,0);
//--- установим цвет текста
   ObjectSetInteger(0,name,OBJPROP_COLOR,TXTButton);
//--- установим цвет фона
   ObjectSetInteger(0,name,OBJPROP_BGCOLOR,EditColor);
//--- установим цвет границы
   ObjectSetInteger(0,name,OBJPROP_BORDER_COLOR,ButtonBorder);
//--- скроем (true) или отобразим (false) имя графического объекта в списке объектов
   ObjectSetInteger(0,name,OBJPROP_HIDDEN,false);
//--- отобразим на переднем (false) или заднем (true) плане
   ObjectSetInteger(0,name,OBJPROP_BACK,false);}
//+------------------------------------------------------------------+
//|   Функции                                                      
//+------------------------------------------------------------------+
//--- Сумма открытых лотов

double AllLots(int type) 
{double lot = 0;
   for (int cnt = OrdersTotal() - 1; cnt >= 0; cnt--) {
      if(OrderSelect(cnt, SELECT_BY_POS, MODE_TRADES))
      {if (OrderMagicNumber()==Magic && (OrderType() == type || type==-1)) lot += OrderLots();}}
       return (lot);}
//--- Текущий профит по паре

double Profit(int type, string symb="") 
{double Profit = 0;
 for (int cnt = OrdersTotal() - 1; cnt >= 0; cnt--) {
 if(OrderSelect(cnt, SELECT_BY_POS, MODE_TRADES))
{if (symb==OrderSymbol() && OrderMagicNumber()==Magic && (OrderType() == type || type==-1)) Profit += OrderProfit()+OrderSwap()+OrderCommission();}}
return (Profit);} 

//--- Профит на всем счете

double ProfitAll(int type) 
{double Profit = 0;
   for (int cnt = OrdersTotal() - 1; cnt >= 0; cnt--) {
      if(OrderSelect(cnt, SELECT_BY_POS, MODE_TRADES))
      {if (OrderMagicNumber()==Magic && (OrderType() == type || type==-1)) Profit += OrderProfit()+OrderSwap()+OrderCommission();}}
       return (Profit);}

//--- Счетчик зафиксированой прибыли за сегодня         

double ProfitDey(int type) 
{double Profit = 0;
   for (int cnt = OrdersHistoryTotal() - 1; cnt >= 0; cnt--) {
      if(OrderSelect(cnt, SELECT_BY_POS, MODE_HISTORY))
      {if (OrderMagicNumber()==Magic && OrderCloseTime()>=iTime(Symbol(),1440,0) && (OrderType() == type || type==-1)) Profit += OrderProfit()+OrderSwap()+OrderCommission();}}
       return (Profit);}

//--- Счетчик зафиксированой прибыли за вчера                        

double ProfitTuDey(int type) 
{double Profit = 0;
   for (int cnt = OrdersHistoryTotal() - 1; cnt >= 0; cnt--) {
      if(OrderSelect(cnt, SELECT_BY_POS, MODE_HISTORY))
      {if (OrderMagicNumber()==Magic && OrderCloseTime()>=iTime(Symbol(),1440,1) && OrderCloseTime()<iTime(Symbol(),1440,0) && (OrderType() == type || type==-1)) Profit += OrderProfit()+OrderSwap()+OrderCommission();}}
       return (Profit);}

//--- Счетчик зафиксированой прибыли за позавчера         

double ProfitEsTuDey(int type) 
{double Profit = 0;
   for (int cnt = OrdersHistoryTotal() - 1; cnt >= 0; cnt--) {
      if(OrderSelect(cnt, SELECT_BY_POS, MODE_HISTORY))
      {if (OrderMagicNumber()==Magic && OrderCloseTime()>=iTime(Symbol(),1440,2) && OrderCloseTime()<iTime(Symbol(),1440,1) && (OrderType() == type || type==-1)) Profit += OrderProfit()+OrderSwap()+OrderCommission();}}
       return (Profit);}

//--- Счетчик зафиксированой прибыли за неделю                      

double ProfitWeek(int type) 
{double Profit = 0;
   for (int cnt = OrdersHistoryTotal() - 1; cnt >= 0; cnt--) {
      if(OrderSelect(cnt, SELECT_BY_POS, MODE_HISTORY))
      {if (OrderMagicNumber()==Magic && OrderCloseTime()>=iTime(Symbol(),10080,0) && (OrderType() == type || type==-1)) Profit += OrderProfit()+OrderSwap()+OrderCommission();}}
       return (Profit);}

//--- Счетчик зафиксированой прибыли за месяц             

double ProfitMontag(int type) 
{double Profit = 0;
   for (int cnt = OrdersHistoryTotal() - 1; cnt >= 0; cnt--) {
      if(OrderSelect(cnt, SELECT_BY_POS, MODE_HISTORY))
      {if (OrderMagicNumber()==Magic && OrderCloseTime()>=iTime(Symbol(),43200,0) && (OrderType() == type || type==-1)) Profit += OrderProfit()+OrderSwap()+OrderCommission();}}
       return (Profit);}

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
 
//--- Счетчик ордеров по паре

int CountPair(int type, string sym, int key)
{
int count=0;
for(int i=OrdersTotal()-1;i>=0;i--)
 if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
  {
  if(OrderSymbol()==sym && key==OrderMagicNumber() && (type==-1 || OrderType()==type)) 
  {
  count++;
  }
  }
return(count);} 

//--- Счетчик ордеров по паре в плюс

int CountPairPlus(int type, string sym, int key)
{
int count=0;
for(int i=OrdersTotal()-1;i>=0;i--)
 if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
  {
  if(OrderSymbol()==sym && key==OrderMagicNumber() && OrderProfit()+OrderSwap()+OrderCommission()>0 && (type==-1 || OrderType()==type)) 
  {
  count++;
  }
  }
return(count);} 

//--- Счетчик ордеров по паре в минус

int CountPairMinus(int type, string sym, int key)
{
int count=0;
for(int i=OrdersTotal()-1;i>=0;i--)
 if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
  {
  if(OrderSymbol()==sym && key==OrderMagicNumber() && OrderProfit()+OrderSwap()+OrderCommission()<0 && (type==-1 || OrderType()==type)) 
  {
  count++;
  }
  }
return(count);} 
//======== Счетчик ордеров на текущем баре ================
int CountBar(int type, string sym)
{
int count=0;
for(int i=OrdersTotal()-1;i>=0;i--)
 if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
  {
  if(OrderSymbol()==sym &&  OrderMagicNumber()==Magic && OrderOpenTime()>=iTime(sym,TimeFrame,0) && (type==-1 || OrderType()==type)) 
  {
  count++;
  }
  }
return(count);}
//======== Счетчик ордеров на текущем баре в истории ================
int CountBarHist(int type, string sym)
{
int count=0;
for(int i=OrdersHistoryTotal()-1;i>=0;i--)
 if(OrderSelect(i,SELECT_BY_POS,MODE_HISTORY))
  {
  if(OrderSymbol()==sym &&  OrderMagicNumber()==Magic && OrderOpenTime()>=iTime(sym,TimeFrame,0) && OrderCloseTime()>=iTime(sym,TimeFrame,0) && (type==-1 || OrderType()==type)) 
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

//-- Закрытие ордеров (Закрыть все по паре)

void ClosePosPair(string sym, int key)
{bool cl;
 for(int i=OrdersTotal()-1;i>=0;i--)
{if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
{if(OrderSymbol()==sym && OrderMagicNumber()==key)
{if(OrderType()==0)
{RefreshRates();
 cl=OrderClose(OrderTicket(),OrderLots(),NormalizeDouble(MarketInfo(sym,MODE_BID),Digits),10,White);}
if(OrderType()==1)
{RefreshRates();
 cl=OrderClose(OrderTicket(),OrderLots(),NormalizeDouble(MarketInfo(sym,MODE_ASK),Digits),10,White);}}}}}
 
//-- Закрытие ордеров (Закрыть все)

void ClosePos(int key)
{bool cl;
 for(int i=OrdersTotal()-1;i>=0;i--)
{if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
{if(OrderMagicNumber()==key)
{if(OrderType()==0)
{RefreshRates();
 cl=OrderClose(OrderTicket(),OrderLots(),NormalizeDouble(MarketInfo(OrderSymbol(),MODE_BID),Digits),10,White);}
if(OrderType()==1)
{RefreshRates();
 cl=OrderClose(OrderTicket(),OrderLots(),NormalizeDouble(MarketInfo(OrderSymbol(),MODE_ASK),Digits),10,White);}}}}}

//-- Закрытие ордеров (Закрыть все по паре)

void ClosePosPair(string sym)
{bool cl;
 for(int i=OrdersTotal()-1;i>=0;i--)
{if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
{if(OrderSymbol()==sym && OrderMagicNumber()==Magic)
{if(OrderType()==0)
{RefreshRates();
 cl=OrderClose(OrderTicket(),OrderLots(),NormalizeDouble(MarketInfo(sym,MODE_BID),Digits),10,White);}
if(OrderType()==1)
{RefreshRates();
 cl=OrderClose(OrderTicket(),OrderLots(),NormalizeDouble(MarketInfo(sym,MODE_ASK),Digits),10,White);}}}}}
 
//-- Закрытие ордеров (Закрыть профит по паре)

void ClosePlusPair(string sym)
{bool cl;
 for(int i=OrdersTotal()-1;i>=0;i--)
{if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
{if(OrderSymbol()==sym && OrderMagicNumber()==Magic && OrderProfit()+OrderCommission()+OrderSwap()>0)
{if(OrderType()==0)
{RefreshRates();
 cl=OrderClose(OrderTicket(),OrderLots(),NormalizeDouble(MarketInfo(sym,MODE_BID),Digits),10,White);}
if(OrderType()==1)
{RefreshRates();
 cl=OrderClose(OrderTicket(),OrderLots(),NormalizeDouble(MarketInfo(sym,MODE_ASK),Digits),10,White);}}}}}
 
//-- Закрытие ордеров (Закрыть минус по паре) 
 
void CloseMinusPair(string sym)
{bool cl;
 for(int i=OrdersTotal()-1;i>=0;i--)
{if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
{if(OrderSymbol()==sym && OrderMagicNumber()==Magic && OrderProfit()+OrderCommission()+OrderSwap()<0)
{if(OrderType()==0)
{RefreshRates();
 cl=OrderClose(OrderTicket(),OrderLots(),NormalizeDouble(MarketInfo(sym,MODE_BID),Digits),10,White);}
if(OrderType()==1)
{RefreshRates();
 cl=OrderClose(OrderTicket(),OrderLots(),NormalizeDouble(MarketInfo(sym,MODE_ASK),Digits),10,White);}}}}} 

//--- Находим цены последних ордеров в рынке
//--- Бай
double OldPricB(string sy, int key) 
{double oldorderopenpriceB=0;
   int oldticketnumberB;
   double unusedB = 0;
   int ticketnumberB = 0;
for (int cnt = OrdersTotal() - 1; cnt >= 0; cnt--) 
   {if(OrderSelect(cnt, SELECT_BY_POS, MODE_TRADES))
       {if (OrderSymbol() == sy && OrderMagicNumber() == key && OrderType() == OP_BUY) 
         {oldticketnumberB = OrderTicket();
         if(oldticketnumberB > ticketnumberB) 
           {ticketnumberB = oldticketnumberB;
            oldorderopenpriceB = OrderOpenPrice();
            unusedB = oldorderopenpriceB;}}}}                          
return (oldorderopenpriceB);}

//--- Селл

double OldPricS(string sy, int key) 
{double oldorderopenpriceS=0;
   int oldticketnumberS;
   double unusedS = 0;
   int ticketnumberS = 0;
for (int cnt = OrdersTotal() - 1; cnt >= 0; cnt--) 
   {if(OrderSelect(cnt, SELECT_BY_POS, MODE_TRADES))
       {if (OrderSymbol() == sy && OrderMagicNumber() == key && OrderType() == OP_SELL) 
         {oldticketnumberS = OrderTicket();
         if(oldticketnumberS > ticketnumberS) 
           {ticketnumberS = oldticketnumberS;
            oldorderopenpriceS = OrderOpenPrice();
            unusedS = oldorderopenpriceS;}}}}                                
return (oldorderopenpriceS);}

//--------Находим первый ордер в истории
datetime FirstOrderTime()
{
datetime time=0;
int tic=0;
for(int i=OrdersHistoryTotal()-1;i>=0;i--)
 if(OrderSelect(i,SELECT_BY_POS,MODE_HISTORY))
  {
  if(OrderComment()==comment && (OrderTicket()<tic || tic==0))  
  {
  time=OrderOpenTime();
  }
  }
return(time);}
    
//--- Таймер

void OnTimer()
  {
   RefreshRates();
   OnTick();
  }