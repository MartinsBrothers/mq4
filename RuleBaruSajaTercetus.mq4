//+------------------------------------------------------------------+
//|                                                         OSOK.mq4 |
//|                      Copyright © 2008, MetaQuotes Software Corp. |
//|                                       http://www.metaquotes.net/ |
//+------------------------------------------------------------------+


#property version "1.0";
#property link "t.me/PradanaNovanRianto";
#property description "Awokwkwkwkwkwkwkw";
#property description "Do At Your Own Risk";

extern int     MagicNumber    = 19981101;
extern double  Lots           = 1;
extern string  str1           = "-------------SL TP-------------"; 
extern double  StopLoss       = 0;
extern double  TakeProfit     = 30;
extern string  str3           = "-------------Layering-------------";
extern int     Buy            = 2;// Jumlah Layering Buy
extern int     Sell           = 2;// Jumlah Layering Sell
extern string  str4           = "-------------Target Harian-------------";
extern bool    PakaiTarget    = True;
extern double  TargetProfit   = 30;
extern string  str6           = "-------------Slippage-------------";
extern int     Slippage       = 3;
string commentsell            = Symbol()+"HeheHahaHoho";
string commentbuy             = Symbol()+"HeheHahaHoho";

datetime openedtime;

int   JamBuy1     = 0,
      MenitBuy1   = 0,
      JamBuy2     = 5,
      MenitBuy2   = 14,
      JamBuy3     = 7,
      MenitBuy3   = 32,
      JamBuy4     = 15,
      MenitBuy4   = 3,
      JamBuy5     = 20,
      MenitBuy5   = 9;
            
int   JamSell1       = 2,
      MenitSell1     = 36,
      JamSell2       = 10,
      MenitSell2     = 6,
      JamSell3       = 12,
      MenitSell3     = 42,
      JamSell4       = 17,
      MenitSell4     = 36;      
           
double spread = MarketInfo(0,MODE_SPREAD);


double ProfitToday()
{
   double profit = 0;
   int i,hstTotal=OrdersHistoryTotal();
     for(i=0;i<hstTotal;i++)
         {
         if(OrderSelect(i,SELECT_BY_POS,MODE_HISTORY)==True)
         if(OrderSymbol()!=Symbol()) continue;
         if(OrderSymbol()==Symbol())
            if(OrderType() == OP_BUY || OrderType() == OP_SELL)
            {
             if(TimeToStr(TimeCurrent(),TIME_DATE) == TimeToStr(OrderCloseTime(),TIME_DATE))
              {
               profit += OrderProfit() + OrderSwap() + OrderCommission();
              }
            }
          }
   return(profit); 
}

int OrderBuy()
{
   double buy = 0;
   int i,total=OrdersTotal();
     for(i=0;i<total;i++)
         {
         if(OrderSelect(i,SELECT_BY_POS)==True)
         if(OrderSymbol()==Symbol())
            if(OrderType() == OP_BUY)
            {
               buy++;
            }
          }
   return(buy); 
}

int OrderSell()
{
   double sell = 0;
   int i,total=OrdersTotal();
     for(i=0;i<total;i++)
         {
         if(OrderSelect(i,SELECT_BY_POS)==True)
         if(OrderSymbol()==Symbol())
            if(OrderType() == OP_SELL)
            {
               sell++;
            }
          }
   return(sell); 
}
  
//+------------------------------------------------------------------+
//|                        S T A R T                                 |
//+------------------------------------------------------------------+
int start()
  {
   ObjectCreate("ObjLabel6", OBJ_LABEL, 0, 0, 0);
   ObjectSet("ObjLabel6", OBJPROP_CORNER, 1);
   ObjectSet("ObjLabel6", OBJPROP_XDISTANCE, 10);
   ObjectSet("ObjLabel6", OBJPROP_YDISTANCE, 30);
   ObjectSetText("ObjLabel6", "One Shot, One Crot - v1.4", 8, "Arial", White);
   
   ObjectCreate("ObjLabel7", OBJ_LABEL, 0, 0, 0);
   ObjectSet("ObjLabel7", OBJPROP_CORNER, 1);
   ObjectSet("ObjLabel7", OBJPROP_XDISTANCE, 10);
   ObjectSet("ObjLabel7", OBJPROP_YDISTANCE, 50);
   ObjectSetText("ObjLabel7", "Mlebune Kenceng, Metune Lemes", 12, "Arial", Yellow);

   ObjectCreate("ObjLabel1", OBJ_LABEL, 0, 0, 0);
   ObjectSet("ObjLabel1", OBJPROP_CORNER, 1);
   ObjectSet("ObjLabel1", OBJPROP_XDISTANCE, 10);
   ObjectSet("ObjLabel1", OBJPROP_YDISTANCE, 70);
   ObjectSetText("ObjLabel1", AccountName(), 20, "Arial", Red);
   
   ObjectCreate("ObjLabel2", OBJ_LABEL, 0, 0, 0);
   ObjectSet("ObjLabel2", OBJPROP_CORNER, 1);
   ObjectSet("ObjLabel2", OBJPROP_XDISTANCE, 10);
   ObjectSet("ObjLabel2", OBJPROP_YDISTANCE, 100);
   ObjectSetText("ObjLabel2", DoubleToStr(AccountNumber(),0), 15, "Arial", Yellow);
   
   ObjectCreate("ObjLabel8", OBJ_LABEL, 0, 0, 0);
   ObjectSet("ObjLabel8", OBJPROP_CORNER, 1);
   ObjectSet("ObjLabel8", OBJPROP_XDISTANCE, 10);
   ObjectSet("ObjLabel8", OBJPROP_YDISTANCE, 130);
   ObjectSetText("ObjLabel8", "Server Time : "+Hour()+" : "+Minute()+" : "+Seconds(), 15, "Arial", Yellow);
   
   ObjectCreate("ObjLabel9", OBJ_LABEL, 0, 0, 0);
   ObjectSet("ObjLabel9", OBJPROP_CORNER, 1);
   ObjectSet("ObjLabel9", OBJPROP_XDISTANCE, 10);
   ObjectSet("ObjLabel9", OBJPROP_YDISTANCE, 200);
   ObjectSetText("ObjLabel9", "Spread : "+spread, 10, "Arial", Yellow);
   
   ObjectCreate("ObjLabel3", OBJ_LABEL, 0, 0, 0);
   ObjectSet("ObjLabel3", OBJPROP_CORNER, 4);
   ObjectSet("ObjLabel3", OBJPROP_XDISTANCE, 10);
   ObjectSet("ObjLabel3", OBJPROP_YDISTANCE, 60);
   ObjectSetText("ObjLabel3", "Balance : "+DoubleToString(AccountBalance(),2), 15, "Arial", Yellow);
   
   ObjectCreate("ObjLabel4", OBJ_LABEL, 0, 0, 0);
   ObjectSet("ObjLabel4", OBJPROP_CORNER, 4);
   ObjectSet("ObjLabel4", OBJPROP_XDISTANCE, 10);
   ObjectSet("ObjLabel4", OBJPROP_YDISTANCE, 85);
   ObjectSetText("ObjLabel4", "Equity : "+DoubleToString(AccountEquity(),2), 15, "Arial", White);

   ObjectCreate("ObjLabel11", OBJ_LABEL, 0, 0, 0);
   ObjectSet("ObjLabel11", OBJPROP_CORNER, 4);
   ObjectSet("ObjLabel11", OBJPROP_XDISTANCE, 10);
   ObjectSet("ObjLabel11", OBJPROP_YDISTANCE, 110);
   ObjectSetText("ObjLabel11", "Buy : "+DoubleToString(OrderBuy(),2), 15, "Arial", White);
   
   ObjectCreate("ObjLabel12", OBJ_LABEL, 0, 0, 0);
   ObjectSet("ObjLabel12", OBJPROP_CORNER, 4);
   ObjectSet("ObjLabel12", OBJPROP_XDISTANCE, 10);
   ObjectSet("ObjLabel12", OBJPROP_YDISTANCE, 135);
   ObjectSetText("ObjLabel12", "Sell : "+DoubleToString(OrderSell(),2), 15, "Arial", White);
      
   ObjectCreate("ObjLabel10", OBJ_LABEL, 0, 0, 0);
   ObjectSet("ObjLabel10", OBJPROP_CORNER, 4);
   ObjectSet("ObjLabel10", OBJPROP_XDISTANCE, 10);
   ObjectSet("ObjLabel10", OBJPROP_YDISTANCE, 160);
   ObjectSetText("ObjLabel10", "Profit Hari Ini : "+DoubleToString(ProfitToday(),2), 15, "Arial", Red);
   
   int ticket, total, cnt;
//-------------------------------------+
if(TakeProfit<10)
  {
    Print("TakeProfit less than 10");
    return(0);  // check TakeProfit
  }
//-------------------------------------+
double SLsell = 0;
   if(StopLoss > 0)
    SLsell = Ask+StopLoss*Point;
//-------------------------------------+    
double SLbuy = 0;
   if(StopLoss > 0)
    SLbuy = Bid-StopLoss*Point;
//-------------------------------------+
              
//-------------------------------------+
      // no opened orders identified
      total = OrdersTotal();

      if(AccountFreeMargin()<(100*Lots))
        {
         Print("Saldo Kurang. Margin Bebas = ", AccountFreeMargin());
         return(0);  
        }
      
      if(PakaiTarget)
        {  
      if(ProfitToday() >= TargetProfit)
        {
         Print("Target Harian Tercapai");
         return(0);
        }
        }   
      // check for long position (BUY) possibility
      if(openedtime!=iTime(Symbol(),0,1) &&
         ((Hour() == JamBuy1 && Minute() == MenitBuy1) || 
         (Hour() == JamBuy2 && Minute() == MenitBuy2) || 
         (Hour() == JamBuy3 && Minute() == MenitBuy3) ||
         (Hour() == JamBuy4 && Minute() == MenitBuy4) ||
         (Hour() == JamBuy5 && Minute() == MenitBuy5)))
        {
         for(cnt = 0; cnt < Buy; cnt++)
           ticket=OrderSend(Symbol(),OP_BUY,Lots,Ask,Slippage,SLbuy,Ask+TakeProfit*Point,commentbuy,MagicNumber,0,Blue);
           openedtime=iTime(Symbol(),0,1);
           if(ticket>0)
           {
            if(OrderSelect(ticket,SELECT_BY_TICKET,MODE_TRADES)) Print("Order BUY Terbuka di : ",OrderOpenPrice());
           }
           else Print("Gagal Membuka Order BUY : ",GetLastError()); 
         return(0); 
        }
        
      // check for short position (SELL) possibility
      if(openedtime!=iTime(Symbol(),0,1) &&
         ((Hour() == JamSell1 && Minute() == MenitSell1) || 
         (Hour() == JamSell2 && Minute() == MenitSell2) || 
         (Hour() == JamSell3 && Minute() == MenitSell3) ||
         (Hour() == JamSell4 && Minute() == MenitSell4)))
      //if(ct == StartHour && Low[1]>Open[0] && OpenSell)
        {
         for(cnt = 0; cnt < Sell; cnt++)
         {
           ticket=OrderSend(Symbol(),OP_SELL,Lots,Bid,Slippage,SLsell,Bid-TakeProfit*Point,commentsell,MagicNumber,0,Red);
           openedtime=iTime(Symbol(),0,1);
           if(ticket>0)
           {
            if(OrderSelect(ticket,SELECT_BY_TICKET,MODE_TRADES)) Print("Order SELL Terbuka di : ",OrderOpenPrice());
           }
           else Print("Gagal Membuka Order SELL : ",GetLastError());
           }
         return(0); 
        }
        
    return(0);      
  }
  
  
// the end.