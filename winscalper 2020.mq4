//+------------------------------------------------------------------+
//|                                                    winscalper.mq4 |
//|                        Copyright 2018, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright   "Winscalper-2019"                             
#property version     "2.00"                                                     
#property description "This Expert Advisor is the legend of EA."
#property description "Time Frame= M%"
//#property strict

#include <WinUser32.mqh>

#import "shell32.dll"
   int ShellExecuteA(int a0, string a1, string a2, string a3, string a4, int a5);
#import

 


extern double MinEquityStop = 50.0;
extern double MaxEquityStop = 0.0;
extern int TakeProfit = 40;
extern int StopLoss = 15;
extern int MagicNumber = 123456724;
extern int MaxOrders = 10;
extern int TrailingStop = 4;
 int слови = 3;
extern double Lots = 0.1;
extern bool UseRiskPercent = TRUE;
extern double RiskPercent = 2.0;
extern int jam_mulai = 9;
extern int jam_akhir = 22;


double каждо = 0.0;
double ункцию132[50];
int апретител[50];
bool опирующи140 = FALSE;
double перехо = 40.0;
int иланс = 3;
bool опирующи156 = TRUE;
int опирующи160 = -1;
int ременно;
string ескольким168 = "";
double роисходить;
bool опирующи184 = FALSE;
int ticket, обры;
double ибли;
string Text5, Text6;
int ыполнено = 6;
int init() 
{
 //  bool ультивалютны0;
 //  int mb_code_4;
   ременно = MarketInfo(Symbol(), MODE_STOPLEVEL);
   if (ременно > TrailingStop && TrailingStop != 0) TrailingStop = ременно;
   роисходить = крытие();
   return (0);
}



int deinit() 
{
   return (0);
}

int start() 
{

выполне("Text5","WINSCALPER-M5",18,"Arial Bold",Blue,6,300,0);
сполнител();





// Nomer Akun lock
int nomerAkun=1800014298;
//

if (Hour()>=jam_mulai && Hour()<jam_akhir)  {

// waktu trading
 
 }
 
 else     return(0);
 
 
 if (AccountNumber() !=nomerAkun)  {

Alert("Wrong Account, This EA not for this account");

return(0);
 
 
 }
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 

datetime expire_date = D'31.07.2020'; //<-- hard coded datetime

if (TimeCurrent() >= expire_date)
{
      Alert(" this forex robot was expired date");
      return(0);
   }  



if (AccountEquity()<=MinEquityStop )  {
 

   while(OrdersTotal()>0)
   {
      // close opened orders first
      ибли = OrdersTotal();
      for (обры = ибли-1; обры >=0 ; обры--)
      {
         if(OrderSelect(обры,SELECT_BY_POS,MODE_TRADES)) 
         {
            switch(OrderType())
            {
               case OP_BUY       :
                  ticket=OrderClose(OrderTicket(),OrderLots(),MarketInfo(OrderSymbol(),MODE_BID),3,Violet);break;
                   
               case OP_SELL      :
                  ticket=OrderClose(OrderTicket(),OrderLots(),MarketInfo(OrderSymbol(),MODE_ASK),3,Violet); break;
            }             
         }
      }
      // and close pending
      ибли = OrdersTotal();      
      for (обры = ибли-1; обры >=0 ; обры--)
      {
         if(OrderSelect(обры,SELECT_BY_POS,MODE_TRADES)) 
         {
            switch(OrderType())
            {
               case OP_BUYLIMIT  :ticket=OrderDelete(OrderTicket()); break;
               case OP_SELLLIMIT :ticket=OrderDelete(OrderTicket()); break;
               case OP_BUYSTOP   :ticket=OrderDelete(OrderTicket()); break;
               case OP_SELLSTOP  :ticket=OrderDelete(OrderTicket()); break;
            }
         }
      }
   }
   return(0);
 
 }
 
 
 
 
if (AccountEquity()>=MaxEquityStop &&  MinEquityStop < MaxEquityStop)  {
 

   while(OrdersTotal()>0)
   {
      // close opened orders first
      ибли = OrdersTotal();
      for (обры = ибли-1; обры >=0 ; обры--)
      {
         if(OrderSelect(обры,SELECT_BY_POS,MODE_TRADES)) 
         {
            switch(OrderType())
            {
               case OP_BUY       :
                  ticket=OrderClose(OrderTicket(),OrderLots(),MarketInfo(OrderSymbol(),MODE_BID),3,Violet);break;
                   
               case OP_SELL      :
                  ticket=OrderClose(OrderTicket(),OrderLots(),MarketInfo(OrderSymbol(),MODE_ASK),3,Violet); break;
            }             
         }
      }
      // and close pending
      ибли = OrdersTotal();      
      for (обры = ибли-1; обры >=0 ; обры--)
      {
         if(OrderSelect(обры,SELECT_BY_POS,MODE_TRADES)) 
         {
            switch(OrderType())
            {
               case OP_BUYLIMIT  :ticket=OrderDelete(OrderTicket()); break;
               case OP_SELLLIMIT :ticket=OrderDelete(OrderTicket()); break;
               case OP_BUYSTOP   :ticket=OrderDelete(OrderTicket()); break;
               case OP_SELLSTOP  :ticket=OrderDelete(OrderTicket()); break;
            }
         }
      }
   }
   return(0);
 
 }
 
 
 










   string едленну;
 //  int фициал;
   string афическ;
   string появлении;
   string совершени;

   оветник7(апретител);
   апретител[0] = TimeCurrent();
   оветник4(апретител);
   int ультивалютны36 = оветник9(апретител);
   ишнее(ункцию132);
   ункцию132[0] = Bid;
   if (TrailingStop != 0) озникнут();
   if (Ask - Bid > перехо * роисходить) return (0);
   if (крытие3() < MaxOrders) остройк(ункцию132, ыполнено, ультивалютны36);
   return (0);
}

double крытие(string раметро = "0") 
{
   if (раметро == "0") раметро = Symbol();
   int тране8 = MarketInfo(раметро, MODE_DIGITS);
   double ивалютный = 0.0;
   double исполнени20 = MarketInfo(раметро, MODE_POINT);
   if (тране8 == 5 || тране8 == 3) ивалютный = 10.0 * исполнени20;
   else ивалютный = исполнени20;
   return (ивалютный);
}

void озникнут() 
{
   double зменения;
   int фициал = TrailingStop;
   for (int различных = 0; различных < OrdersTotal(); различных++) 
   {
      if (OrderSelect(различных, SELECT_BY_POS) != FALSE) 
      {
         if (OrderSymbol() == Symbol()) 
         {
            if (OrderMagicNumber() >= MagicNumber && OrderMagicNumber() <= MagicNumber) 
            {
               if (OrderType() == OP_BUY) 
               {
                  зменения = Bid - роисходить * фициал;
                  if (!(OrderStopLoss() < зменения && OrderOpenPrice() < Bid - фициал * роисходить)) continue;
                  ыстрая(зменения, OrderTicket());
                  continue;
               }
               зменения = Ask + роисходить * фициал;
               if (OrderStopLoss() > зменения && OrderOpenPrice() > Ask + фициал * роисходить) ыстрая(зменения, OrderTicket());
            }
         }
      }
   }
}

void ыстрая(double a_аказа0, int акже8) 
{
   ременно = MarketInfo(Symbol(), MODE_STOPLEVEL);
   if (OrderModify(акже8, OrderOpenPrice(), a_аказа0, OrderTakeProfit(), 0, Red) == -1)
      if (опирующи156) сделка();
}

void оветник4(int &еличины[50]) 
{
   int дентификац = ArraySize(еличины);
   int фициал = TimeCurrent() - (еличины[оветник9(еличины) - 1]);
   while (фициал > слови) 
   {
      еличины[оветник9(еличины) - 1] = 0;
      фициал = TimeCurrent() - (еличины[оветник9(еличины) - 1]);
      if (оветник9(еличины) < 2) break;
   }
}

int оветник9(int &еличины[50]) 
{
   int дентификац = ArraySize(еличины);
   for (int дач = 0; дач < дентификац; дач++)
      if (!(еличины[дач] > 0)) return (дач);
   return (дентификац - 1);
}

void ишнее(double &овым[50]) 
{
   int ультивалютны4 = ArraySize(овым);
   for (int фициал = ультивалютны4; фициал > 0; фициал--) овым[фициал] = овым[фициал - 1];
   овым[0] = 0;
}

void оветник7(int &еличины[50]) 
{
   int ультивалютны4 = ArraySize(еличины);
   for (int фициал = ультивалютны4; фициал > 0; фициал--) еличины[фициал] = еличины[фициал - 1];
   еличины[0] = 0;
}

void остройк(double &овым[50], int иже4, int оторый) 
{
   double торного;
   double исполнени20 = овым[ArrayMaximum(овым, оторый)] - овым[ArrayMinimum(овым, оторый)];
   if (исполнени20 > иже4 * роисходить) {
      if (UseRiskPercent) торного = оветник3();
      else торного = Lots;
      if (Bid == овым[ArrayMaximum(овым, оторый)]) даже(TakeProfit, StopLoss, торного, OP_BUY);
      if (Bid == овым[ArrayMinimum(овым, оторый)]) даже(TakeProfit, StopLoss, торного, OP_SELL);
   }
}

int крытие3() 
{
   int ультивалютныret_0;
   for (int ржинальны4 = 0; ржинальны4 < OrdersTotal(); ржинальны4++) 
   {
      if (OrderSelect(ржинальны4, SELECT_BY_POS) != FALSE) 
      {
         if (OrderSymbol() == Symbol())
            if (OrderMagicNumber() >= MagicNumber && OrderMagicNumber() <= MagicNumber) ультивалютныret_0++;
      }
   }
   return (ультивалютныret_0);
}

int даже(int иже0, int иже4, double изуаль8, int акрывае16, int иже20 = 0) 
{
   int ультивалютны24;
   double аказа28;
   double аказа36;
   double аказа44;
   color color_52;
   string ls_56 = "Scalper TF M5";
   if (акрывае16 % 2 == 0) 
   {
      if (акрывае16 == OP_BUYLIMIT) аказа28 = Ask + ультивалютны24 * роисходить;
      else аказа28 = Ask + ультивалютны24 * роисходить;
      if (иже4 != 0) аказа36 = аказа28 - (иже4 + ультивалютны24) * роисходить;
      if (иже0 != 0) аказа44 = аказа28 + (иже0 + ультивалютны24) * роисходить;
      color_52 = CLR_NONE;
   }
   if (акрывае16 % 2 == 1) 
   {
      if (акрывае16 == OP_SELLLIMIT) аказа28 = Bid + ультивалютны24 * роисходить;
      else аказа28 = Bid + ультивалютны24 * роисходить;
      if (иже4 != 0) аказа36 = аказа28 - ((-иже4) - ультивалютны24) * роисходить;
      if (иже0 != 0) аказа44 = аказа28 - (иже0 - ультивалютны24) * роисходить;
      color_52 = CLR_NONE;
   }
   double аказа64 = аказа36;
   double аказа72 = аказа44;
   if (опирующи140) аказа36 = 0;
   if (опирующи140) аказа44 = 0;
   int кстремум80 = OrderSend(Symbol(), акрывае16, изуаль8, аказа28, иланс, аказа36, аказа44, ls_56 + "-" + Symbol() + "-" + StringConcatenate (MagicNumber), MagicNumber + иже20, 0, color_52);
   bool остоверност = OrderSelect(кстремум80, SELECT_BY_TICKET);
   if (остоверност == TRUE) OrderModify(OrderTicket(), OrderOpenPrice(), аказа64, аказа72, 0, Blue);
   return (0);
}

double оветник3() 
{
   double зменения = Lots;
   if (UseRiskPercent) зменения = ультивалютны(MathAbs(RiskPercent));
   if (зменения > каждо && каждо != 0.0) зменения = каждо;
   зменения = оветник6(зменения);
   return (зменения);
}

double ультивалютны(double копировать0) 
{
   bool фициал = TRUE;
   double одержат = MarketInfo(Symbol(), MODE_MINLOT);
   double исполнени20 = MarketInfo(Symbol(), MODE_LOTSIZE) / AccountLeverage();
   double исполнени28 = копировать0 / 100.0 * AccountBalance() / исполнени20;
   double исполнениret_36 = MathFloor(исполнени28);
   while (фициал) 
   {
      исполнениret_36 += одержат;
      if (исполнениret_36 > исполнени28) 
      {
         фициал = FALSE;
         исполнениret_36 -= одержат;
      }
   }
   return (исполнениret_36);
}

double оветник6(double копировать0) 
{
   if (копировать0 > MarketInfo(Symbol(), MODE_MAXLOT)) копировать0 = MarketInfo(Symbol(), MODE_MAXLOT);
   else
      if (копировать0 < MarketInfo(Symbol(), MODE_MINLOT)) копировать0 = MarketInfo(Symbol(), MODE_MINLOT);
   return (копировать0);
}

void сделка() 
{
   string ls_0;
   if (опирующи156) 
   {
      if (опирующи160 > 0) 
      {
         ls_0 = "Error:" + StringConcatenate (GetLastError()) + " OrderType:" + StringConcatenate (OrderType()) + " Ticket:" + StringConcatenate (OrderTicket());
         ls_0 = TimeToStr(TimeCurrent(), TIME_DATE|TIME_MINUTES|TIME_SECONDS) + " " + ls_0;
         FileWrite(опирующи160, ls_0);
      }
   }
}

void сполнител()
{
   string редыдущаяt   = "";
   string sp         = "---------------------------------------------\n";
   string sp2        = "--Expire Date : 31-07-2020--\n";
   string NL         = "\n";

  
   редыдущаяt = sp;
   редыдущаяt = редыдущаяt + NL;
   редыдущаяt = редыдущаяt + "EA Winscalper-M5 Licensed For " + AccountName() + NL;
   редыдущаяt = редыдущаяt + "Balance  =  " + StringConcatenate (NormalizeDouble(AccountBalance(),2)) + NL ;
   редыдущаяt = редыдущаяt + "Min Equity Stop <= " + StringConcatenate (MinEquityStop) + NL;
   редыдущаяt = редыдущаяt + "Max Equity Stop >= " + StringConcatenate (MaxEquityStop) + NL;
   редыдущаяt = редыдущаяt + sp;
   редыдущаяt = редыдущаяt +  "Server Time = " + TimeToStr(CurTime(),TIME_MINUTES)+ NL ;
   редыдущаяt = редыдущаяt +  "Equity = " + StringConcatenate (NormalizeDouble(AccountEquity(),2))+ NL ;
   редыдущаяt = редыдущаяt + "Profit = " + StringConcatenate (NormalizeDouble(AccountProfit(),2))+ NL ;
   редыдущаяt = редыдущаяt + sp2;
  Comment(редыдущаяt);
}


//+------------------------------------------------------------------+

void выполне(string оментальн,string рдер,int Size,string Font,int олнени,int corner,int x,int y)
  {
   ObjectCreate(оментальн,OBJ_LABEL,0,0,0);
   ObjectSetText(оментальн,рдер,Size,Font,олнени);
   ObjectSet(оментальн,OBJPROP_CORNER,corner);
   ObjectSet(оментальн,OBJPROP_XDISTANCE,x);
   ObjectSet(оментальн,OBJPROP_YDISTANCE,y);
  }
//+------------------------------------------------------------------+