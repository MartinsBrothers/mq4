//+------------------------------------------------------------------+
//|                      193.Forex_Strength_Dashboard_Auto_Trade.mq4 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+

#property copyright "GVC"
#property link      "http://www.metaquotes.net"
#property version   "1.00"
#property strict
#include <stdlib.mqh>
#include <WinUser32.mqh>
#include <ChartObjects\ChartObjectsTxtControls.mqh>

#define BullColor Green
#define BearColor FireBrick

input string suffix           ="";
input int    Magic_Number     = 98765;
input double lot              = 0.01;
input int  Basket_Target      = 0; 
input int  Basket_StopLoss    = 0; 
input int   x_axis            =10;
input int   y_axis            =50;
input bool UseDefaultPairs    =true;


string button_close_basket_All = "btn_Close ALL"; 
string button_buy_basket_1 = "btn_buy_basket";  
string button_sell_basket_1 = "btn_sell_basket";
string button_close_basket_1 = "btn_Close Order";
string button_buy_basket_2 = "btn_buy_basket2";  
string button_sell_basket_2 = "btn_sell_basket2";
string button_close_basket_2 = "btn_Close Order2";
string button_buy_basket_3 = "btn_buy_basket3";  
string button_sell_basket_3 = "btn_sell_basket3";
string button_close_basket_3 = "btn_Close Order3";
string button_buy_basket_4 = "btn_buy_basket4";  
string button_sell_basket_4 = "btn_sell_basket4";
string button_close_basket_4 = "btn_Close Order4";
string button_buy_basket_5 = "btn_buy_basket5";  
string button_sell_basket_5 = "btn_sell_basket5";
string button_close_basket_5 = "btn_Close Order5";
string button_buy_basket_6 = "btn_buy_basket6";  
string button_sell_basket_6 = "btn_sell_basket6";
string button_close_basket_6 = "btn_Close Order6";
string button_buy_basket_7 = "btn_buy_basket7";  
string button_sell_basket_7 = "btn_sell_basket7";
string button_close_basket_7 = "btn_Close Order7";
string button_buy_basket_8 = "btn_buy_basket8";  
string button_sell_basket_8 = "btn_sell_basket8";
string button_close_basket_8 = "btn_Close Order8";
string button_buy_basket_9 = "btn_buy_basket9";  
string button_sell_basket_9 = "btn_sell_basket9";
string button_close_basket_9 = "btn_Close Order9";
string button_buy_basket_10 = "btn_buy_basket10";  
string button_sell_basket_10 = "btn_sell_basket10";
string button_close_basket_10 = "btn_Close Order10";
string button_buy_basket_11 = "btn_buy_basket11";  
string button_sell_basket_11 = "btn_sell_basket11";
string button_close_basket_11 = "btn_Close Order11";
string button_buy_basket_12 = "btn_buy_basket12";  
string button_sell_basket_12 = "btn_sell_basket12";
string button_close_basket_12 = "btn_Close Order12";
string button_buy_basket_13 = "btn_buy_basket13";  
string button_sell_basket_13 = "btn_sell_basket13";
string button_close_basket_13 = "btn_Close Order13";
string button_buy_basket_14 = "btn_buy_basket14";  
string button_sell_basket_14 = "btn_sell_basket14";
string button_close_basket_14 = "btn_Close Order14";
string button_buy_basket_15 = "btn_buy_basket15";  
string button_sell_basket_15 = "btn_sell_basket15";
string button_close_basket_15 = "btn_Close Order15";
string button_buy_basket_16 = "btn_buy_basket16";  
string button_sell_basket_16 = "btn_sell_basket16";
string button_close_basket_16 = "btn_Close Order16";
string button_buy_basket_17 = "btn_buy_basket17";  
string button_sell_basket_17 = "btn_sell_basket17";
string button_close_basket_17 = "btn_Close Order17";
string button_buy_basket_18 = "btn_buy_basket18";  
string button_sell_basket_18 = "btn_sell_basket18";
string button_close_basket_18 = "btn_Close Order18";
string button_buy_basket_19 = "btn_buy_basket19";  
string button_sell_basket_19 = "btn_sell_basket19";
string button_close_basket_19 = "btn_Close Order19";
string button_buy_basket_20 = "btn_buy_basket20";  
string button_sell_basket_20 = "btn_sell_basket20";
string button_close_basket_20 = "btn_Close Order20";
string button_buy_basket_21 = "btn_buy_basket21";  
string button_sell_basket_21 = "btn_sell_basket21";
string button_close_basket_21 = "btn_Close Order21";
string button_buy_basket_22 = "btn_buy_basket22";  
string button_sell_basket_22 = "btn_sell_basket22";
string button_close_basket_22 = "btn_Close Order22";
string button_buy_basket_23 = "btn_buy_basket23";  
string button_sell_basket_23 = "btn_sell_basket23";
string button_close_basket_23 = "btn_Close Order23";
string button_buy_basket_24 = "btn_buy_basket24";  
string button_sell_basket_24 = "btn_sell_basket24";
string button_close_basket_24 = "btn_Close Order24";
string button_buy_basket_25 = "btn_buy_basket25";  
string button_sell_basket_25 = "btn_sell_basket25";
string button_close_basket_25 = "btn_Close Order25";
string button_buy_basket_26 = "btn_buy_basket26";  
string button_sell_basket_26 = "btn_sell_basket26";
string button_close_basket_26 = "btn_Close Order26";
string button_buy_basket_27 = "btn_buy_basket27";  
string button_sell_basket_27 = "btn_sell_basket27";
string button_close_basket_27 = "btn_Close Order27";
string button_buy_basket_28 = "btn_buy_basket28";  
string button_sell_basket_28 = "btn_sell_basket28";
string button_close_basket_28 = "btn_Close Order28";
 
string   _font="Consolas";
double PairPip;
double Pips[28],Spread[28],Signalm1[28],Signalm5[28],Signalm15[28],Signalm30[28],Signalh1[28],Signalh4[28],Signald1[28],
       Signalw1[28],Signalmn[28],Signalhah4[28],Signalhad1[28],Signalhaw1[28];
color ProfitColor,ProfitColor1,ProfitColor2,ProfitColor3,PipsColor,Color,Color1,Color2,Color3,Color4,Color5,Color6,Color7,Color8,Color9,Color10,
      Color11,LotColor,LotColor1,OrdColor,OrdColor1;
color BackGrnCol =clrDarkGray;
color LineColor=clrBlack;
color TextColor=clrBlack;
double adr1[28],adr5[28],adr10[28],adr20[28],adr[28];
int ticket,pipsfactor;
int    orders  = 0;
double blots[28],slots[28],bprofit[28],sprofit[28],tprofit[28],bpos[28],spos[28];
bool CloseAll;
string TradePair[];
int SymbolCount=0;
string Defaultpairs[28]={ "AUDCAD.I","AUDCHF.I","AUDJPY.I","AUDNZD.I","AUDUSD.I","CADCHF.I","CADJPY.I",
                       "CHFJPY.I","EURAUD.I","EURCAD.I","EURCHF","EURGBP","EURJPY",
                       "EURNZD","EURUSD","GBPAUD","GBPCAD","GBPCHF",
                       "GBPJPY","GBPNZD","GBPUSD","NZDCAD",
                       "NZDCHF","NZDJPY","NZDUSD","USDCAD",
                       "USDCHF","USDJPY" };
double EUR,GBP,AUD,CHF,JPY,CAD,USD;
double Idx[],Idx1[],Idx2[],Idx3[],Idx4[],Idx5[],Idx6[];

int    Slipage          = 50;  

//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {   
   if (UseDefaultPairs == true) {
      ArrayCopy(TradePair,Defaultpairs);
      for(int i=0;i<28;i++)
         TradePair[i] = TradePair[i]+suffix;
  } else {
      CreateSymbolList();
  } 
   
//--- indicator buffers mapping
   EventSetTimer(10);
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//--- destroy timer
   EventKillTimer();
   ObjectsDeleteAll();
      
  }
//--------------------------------------------------------------------------------------------

string Currency[] =  {  "USD", "EUR", "GBP", "CHF", "JPY", "AUD", "CAD", "NZD"};
 string CreateSymbolList() {
   string allsyms;
    string TempSymbol;
   
  
   int Sym = ArrayRange(Currency, 0);
   for (int i = 0; i < Sym; i++) {
      for (int a = 0; a < Sym; a++) {
         TempSymbol = Currency[i] + Currency[a] + suffix;
         if (MarketInfo(TempSymbol, MODE_BID) > 0.0) {
            ArrayResize(TradePair, SymbolCount + 1);
            TradePair[SymbolCount] = TempSymbol;
            allsyms = allsyms + TempSymbol;            
            SymbolCount++;
         }
       
         }
}
   return (allsyms);
}  

//+------------------------------------------------------------------+
//| Timer function                                                   |
//+------------------------------------------------------------------+
void OnTimer()
  {
   int labelcolor;
   Trades();
   TotalProfit();  
  
   for(int i=0;i<ArraySize(TradePair);i++)
     {
      
      if(Point==0.0001 || Point==0.01) 
        {
         PairPip=MarketInfo(TradePair[i],MODE_POINT);
         pipsfactor=1;
           } else if(Point==0.00001 || Point==0.001) {
         PairPip=MarketInfo(TradePair[i],MODE_POINT)*10;
         pipsfactor=10;
        }
     
           
      Spread[i]=MarketInfo(TradePair[i],MODE_SPREAD)/pipsfactor;  

      double Openm1    = iMA(TradePair[i], PERIOD_M1,3,0,MODE_SMA,PRICE_CLOSE,3);
      double Closem1   = iMA(TradePair[i], PERIOD_M1,3,0,MODE_SMA,PRICE_CLOSE,0);
      double Openm5    = iMA(TradePair[i], PERIOD_M5,3,0,MODE_SMA,PRICE_CLOSE,3);
      double Closem5   = iMA(TradePair[i], PERIOD_M5,3,0,MODE_SMA,PRICE_CLOSE,0);
      double Openm15   = iMA(TradePair[i], PERIOD_M15,3,0,MODE_SMA,PRICE_CLOSE,3);
      double Closem15  = iMA(TradePair[i], PERIOD_M15,3,0,MODE_SMA,PRICE_CLOSE,0);
      double Openm30   = iMA(TradePair[i], PERIOD_M30,3,0,MODE_SMA,PRICE_CLOSE,3);
      double Closem30  = iMA(TradePair[i], PERIOD_M30,3,0,MODE_SMA,PRICE_CLOSE,0);
      double Openh1    = iMA(TradePair[i], PERIOD_H1,3,0,MODE_SMA,PRICE_CLOSE,3);
      double Closeh1   = iMA(TradePair[i], PERIOD_H1,3,0,MODE_SMA,PRICE_CLOSE,0);
      double Open4     = iMA(TradePair[i], PERIOD_H4,3,0,MODE_SMA,PRICE_CLOSE,3);
      double Close4    = iMA(TradePair[i], PERIOD_H4,3,0,MODE_SMA,PRICE_CLOSE,0);      
      double Opend1    = iMA(TradePair[i], PERIOD_D1,3,0,MODE_SMA,PRICE_CLOSE,3);
      double Closed1   = iMA(TradePair[i], PERIOD_D1,3,0,MODE_SMA,PRICE_CLOSE,0);      
      double Openw     = iMA(TradePair[i], PERIOD_W1,3,0,MODE_SMA,PRICE_CLOSE,3);
      double Closew    = iMA(TradePair[i], PERIOD_W1,3,0,MODE_SMA,PRICE_CLOSE,0);
      double Openmn    = iMA(TradePair[i], PERIOD_MN1,3,0,MODE_SMA,PRICE_CLOSE,3);
      double Closemn   = iMA(TradePair[i], PERIOD_MN1,3,0,MODE_SMA,PRICE_CLOSE,0);

      Pips[i]=(iClose(TradePair[i],PERIOD_D1,0)-iOpen(TradePair[i], PERIOD_D1,0))/MarketInfo(TradePair[i],MODE_POINT)/pipsfactor;
      
       Signalm1[i] =(Closem1-Openm1)/Openm1*100;
      Signalm5[i] =(Closem5-Openm5)/Openm5*100;      
      Signalm15[i]=(Closem15-Openm15)/Openm15*100;      
      Signalm30[i]=(Closem30-Openm30)/Openm30*100;      
      Signalh1[i] =(Closeh1-Openh1)/Openh1*100;     
      Signalh4[i] =(Close4-Open4)/Open4*100;      
      Signald1[i] =(Closed1-Opend1)/Opend1*100;      
      Signalw1[i] =(Closew-Openw)/Openw*100;      
      Signalmn[i] =(Closemn-Openmn)/Openmn*100; 

      double s=0.0;
      int n=1;     
      for(int a=1;a<=20;a++)
        {
         s=s+(iHigh(TradePair[i],PERIOD_D1,n)-iLow(TradePair[i],PERIOD_D1,n))/PairPip;
         if(a==1) adr1[i]=MathRound(s);
         if(a==5) adr5[i]=MathRound(s/5);
         if(a==10) adr10[i]=MathRound(s/10);
         if(a==20) adr20[i]=MathRound(s/20);
         n++; 
        }
      adr[i]=MathRound((adr1[i]+adr5[i]+adr10[i]+adr20[i])/4.0);

      
      double BB1=iMA(TradePair[i],PERIOD_H4,12,0,MODE_SMA,PRICE_CLOSE,0);      
      double BB10 = iMA(TradePair[i], PERIOD_D1,12,0,MODE_SMA,PRICE_CLOSE,0);       
      
      if(Close4>BB1 )Signalhah4[i]=1;
      if(Close4<BB1 )Signalhah4[i]=-1;
      if(Closed1>BB10 )Signalhad1[i]=1;
      if(Closed1<BB10 )Signalhad1[i]=-1;
      
     }

//---   


    if(CloseAll)
      {
         close_basket();
         if(OrdersTotal()==0)
         {
            
            CloseAll=false;
         }
      }
      //- Target
      if(Basket_Target>0 && TotalProfit()>=Basket_Target) CloseAll=true;

      //- StopLoss
      if(Basket_StopLoss>0 && TotalProfit()<(0-Basket_StopLoss)) CloseAll=true; 
      
       
   for(int i=0;i<ArraySize(TradePair);i++)
   for(int b=0;b<9;b++)  
        {
       ObjectDelete("Pips"+IntegerToString(i)); ObjectDelete("TtlProf"+IntegerToString(i));ObjectDelete("bLots"+IntegerToString(i));        
       ObjectDelete("sLots"+IntegerToString(i));ObjectDelete("bPos"+IntegerToString(i));ObjectDelete("sPos"+IntegerToString(i));
       ObjectDelete("TProf"+IntegerToString(i));ObjectDelete("SProf"+IntegerToString(i));ObjectDelete("Sig"+IntegerToString(i));
       ObjectDelete("SGD"+IntegerToString(i));ObjectDelete("M1sig"+IntegerToString(i));ObjectDelete("M5sig"+IntegerToString(i));   
       ObjectDelete("M15sig"+IntegerToString(i));ObjectDelete("M30sig"+IntegerToString(i));ObjectDelete("H1sig"+IntegerToString(i));
       ObjectDelete("H4sig"+IntegerToString(i));ObjectDelete("D1sig"+IntegerToString(i));ObjectDelete("W1sig"+IntegerToString(i));
       ObjectDelete("Mnsig"+IntegerToString(i)); ObjectDelete("TotProf");
       
      
       
         if(blots[i]>0){LotColor =Orange;}        
         if(blots[i]==0){LotColor =clrWhite;}
         if(slots[i]>0){LotColor1 =Orange;}        
         if(slots[i]==0){LotColor1 =clrWhite;}
         if(bpos[i]>0){OrdColor =DodgerBlue;}        
         if(bpos[i]==0){OrdColor =clrWhite;}
         if(spos[i]>0){OrdColor1 =DodgerBlue;}        
         if(spos[i]==0){OrdColor1 =clrWhite;}
         if(bprofit[i]>0){ProfitColor =BullColor;}
         if(bprofit[i]<0){ProfitColor =BearColor;}
         if(bprofit[i]==0){ProfitColor =clrWhite;}
         if(sprofit[i]>0){ProfitColor2 =BullColor;}
         if(sprofit[i]<0){ProfitColor2 =BearColor;}
         if(sprofit[i]==0){ProfitColor2 =clrWhite;}
         if(tprofit[i]>0){ProfitColor3 =BullColor;}
         if(tprofit[i]<0){ProfitColor3 =BearColor;}
         if(tprofit[i]==0){ProfitColor3 =clrWhite;}
         if(TotalProfit()>0){ProfitColor1 =BullColor;}
         if(TotalProfit()<0){ProfitColor1 =BearColor;}
         if(TotalProfit()==0){ProfitColor1 =clrWhite;}         
         if(Pips[i]>0){PipsColor =BullColor;}
         if(Pips[i]<0){PipsColor =BearColor;} 
         if(Pips[i]==0){PipsColor =clrWhite;} 
               
         if(Signalm1[i]>0){Color=BullColor;}
         if(Signalm1[i]<0){Color=BearColor;}
         if(Signalm5[i]>0){Color1=BullColor;}         
         if(Signalm5[i]<0){Color1 =BearColor;}
         if(Signalm15[i]>0){Color2 =BullColor;}
         if(Signalm15[i]<0){Color2=BearColor;}
         if(Signalm30[i]>0){Color3=BullColor;}
         if(Signalm30[i]<0){Color3=BearColor;}
         if(Signalh1[i]>0){Color4=BullColor;}
         if(Signalh1[i]<0){Color4=BearColor;}
         if(Signalh4[i]>0){Color5=BullColor;}
         if(Signalh4[i]<0){Color5=BearColor;}
         if(Signald1[i]>0){Color6=BullColor;}
         if(Signald1[i]<0){Color6=BearColor;}
         if(Signalw1[i]>0){Color7=BullColor;}
         if(Signalw1[i]<0){Color7=BearColor;}
         if(Signalmn[i]>0){Color8=BullColor;}
         if(Signalmn[i]<0){Color8=BearColor;}
         
         
         bool buy_trade=false;
         bool sell_trade=false;
         string SMS_text="", temp_text="";
         
         if(Signalm5[i]>0.0&&Signalm15[i]>0.0&&Signalh1[i]>0.0){
            buy_trade=true;
            SetObjText("Sig"+IntegerToString(i),CharToStr(233),x_axis+464,(i*16)+y_axis,BullColor,9);
         }
         else if(Signalm5[i]<0.0&&Signalm15[i]<0.0&&Signalh1[i]<0.0){
            sell_trade=true;
            SetObjText("Sig"+IntegerToString(i),CharToStr(234),x_axis+464,(i*16)+y_axis+2,BearColor,9);
         }
         else {
               SetObjText("Sig"+IntegerToString(i),CharToStr(232),x_axis+464,(i*16)+y_axis,Orange,9);
              }
         if(Signalh1[i]>0.0&&Signalh4[i]>0.0&&Signald1[i]>0.0&&Signalw1[i]>0.0){
            buy_trade=true;
            SetObjText("SGD"+IntegerToString(i),CharToStr(233),x_axis+494,(i*16)+y_axis,BullColor,9);
            }
         else if(Signalh1[i]<0.0&&Signalh4[i]<0.0&&Signald1[i]<0.0&&Signalw1[i]<0.0){
            sell_trade=true;
            SetObjText("SGD"+IntegerToString(i),CharToStr(234),x_axis+494,(i*16)+y_axis+2,BearColor,9);
         }
         else {SetObjText("SGD"+IntegerToString(i),CharToStr(232),x_axis+494,(i*16)+y_axis,Orange,9);}
          
         if(buy_trade)
         { 
            if(!find_orders(Magic_Number,OP_BUY,TradePair[i]))
            {
               temp_text=open_positions(OP_BUY, lot, 0, 0, Magic_Number, 0.0, TradePair[i], "Forex Strength EA");
               
            }
            closeOpenOrders(TradePair[i], OP_SELL);
         }
         if(sell_trade)
         { 
            if(!find_orders(Magic_Number,OP_SELL,TradePair[i]))
            {
               temp_text=open_positions(OP_SELL, lot, 0, 0, Magic_Number, 0.0, TradePair[i], "Forex Strength EA");
               
            }
            closeOpenOrders(TradePair[i], OP_BUY);
         }
 
          
         if(OrdersTotal()==0){SetText("CTP","No Trades To Monitor",x_axis+300,y_axis-47,Yellow,8);}
         if(OrdersTotal()>0 ){SetText("CTP","Monitoring Trades",x_axis+303,y_axis-47,Yellow,8);}
         SetText("TPr","Basket TakeProfit =$ "+DoubleToStr(Basket_Target,0),x_axis+453,y_axis-47,Yellow,8);
         SetText("SL","Basket StopLoss =$ -"+DoubleToStr(Basket_StopLoss,0),x_axis+633,y_axis-47,Yellow,8);

         if (Signalm5[i]>0.0&&Signalm15[i]>0.0&&Signalh1[i]>0.0&&Signalh4[i]>0.0&&Signald1[i]>0.0&&Signalw1[i]>0.0)
            labelcolor = clrGreen;
    else if (Signalm5[i]<0.0&&Signalm15[i]<0.0&&Signalh1[i]<0.0&&Signalh4[i]<0.0&&Signald1[i]<0.0&&Signalw1[i]>0.0)
               labelcolor = clrRed;
             else
               labelcolor = BackGrnCol;
         
         SetPanel("Bar",0,x_axis,y_axis-30,980,27,Maroon,LineColor,1);        
         SetPanel("Panel"+IntegerToString(i),0,x_axis,(i*16)+y_axis,55,15,labelcolor,LineColor,1);
         SetPanel("Spread"+IntegerToString(i),0,x_axis+70,(i*16)+y_axis-2,25,17,Black,White,1);
         SetPanel("Pips"+IntegerToString(i),0,x_axis+100,(i*16)+y_axis-2,25,17,Black,White,1);
         SetPanel("Adr"+IntegerToString(i),0,x_axis+140,(i*16)+y_axis-2,25,17,Black,White,1);
         SetPanel("TFAll"+IntegerToString(i)+IntegerToString(b),0,(b*30)+x_axis+180,(i*16)+y_axis,29,15,Black,White,1);         
         SetPanel("ha4"+IntegerToString(i),0,x_axis+460,(i*16)+y_axis-2,20,17,Black,White,1);
         SetPanel("had1"+IntegerToString(i),0,x_axis+490,(i*16)+y_axis-2,20,17,Black,White,1);
         SetPanel("TP",0,x_axis+920,y_axis-27,55,20,Black,White,1);
         SetPanel("TP1",0,x_axis+300,y_axis-50,125,20,Black,White,1);
         SetPanel("TP2",0,x_axis+450,y_axis-50,160,20,Black,White,1);
         SetPanel("TP3",0,x_axis+630,y_axis-50,160,20,Black,White,1);


         SetText("Pair"+IntegerToString(i),TradePair[i],x_axis+2,(i*16)+y_axis+2,clrBlack,8);
         SetText("Symbol","Symbol      Spread   Pips     ADR",x_axis+4,y_axis-25,White,8);
         SetText("Direct","Candle Direction",x_axis+270,y_axis-30,White,8);
         SetText("Trend","M1     M5     M15    M30    H1      H4     D1     W1     MN",x_axis+183,y_axis-17,White,8);
         SetText("Signal","Intra    Daily",x_axis+458,y_axis-30,White,8);
         SetText("MA","Day    Bias",x_axis+458,y_axis-17,White,8);
         SetText("Trades","Buy       Sell      Buy   Sell       Buy       Sell",x_axis+710,y_axis-17,White,8);
         SetText("TTr","Lots              Orders",x_axis+730,y_axis-30,White,8);
         SetText("Tottrade","Profit",x_axis+860,y_axis-30,White,8);
         SetText("M1sig"+IntegerToString(i),DoubleToStr(MathAbs( Signalm1[i]),2),x_axis+182,(i*16)+y_axis,Color,8);
         SetText("M5sig"+IntegerToString(i),DoubleToStr(MathAbs( Signalm5[i]),2),x_axis+212,(i*16)+y_axis,Color1,8);
         SetText("M15sig"+IntegerToString(i),DoubleToStr(MathAbs(Signalm15[i]),2),x_axis+242,(i*16)+y_axis,Color2,8);
         SetText("M30sig"+IntegerToString(i),DoubleToStr(MathAbs(Signalm30[i]),2),x_axis+272,(i*16)+y_axis,Color3,8);
         SetText("H1sig"+IntegerToString(i),DoubleToStr(MathAbs(Signalh1[i]),2),x_axis+302,(i*16)+y_axis,Color4,8);
         SetText("H4sig"+IntegerToString(i),DoubleToStr(MathAbs(Signalh4[i]),2),x_axis+332,(i*16)+y_axis,Color5,8);
         SetText("D1sig"+IntegerToString(i),DoubleToStr(MathAbs(Signald1[i]),2),x_axis+362,(i*16)+y_axis,Color6,8);
         SetText("W1sig"+IntegerToString(i),DoubleToStr(MathAbs(Signalw1[i]),2),x_axis+392,(i*16)+y_axis,Color7,8);
         SetText("Mnsig"+IntegerToString(i),DoubleToStr(MathAbs(Signalmn[i]),2),x_axis+422,(i*16)+y_axis,Color8,8);
         SetText("Spr1"+IntegerToString(i),DoubleToStr(Spread[i],1),x_axis+72,(i*16)+y_axis,Orange,8);
         SetText("Pp1"+IntegerToString(i),DoubleToStr(MathAbs(Pips[i]),0),x_axis+103,(i*16)+y_axis,PipsColor,8);
         SetText("S1"+IntegerToString(i),DoubleToStr(adr[i],0),x_axis+143,(i*16)+y_axis,Yellow,8);
         SetText("bLots"+IntegerToString(i),DoubleToStr(blots[i],2),x_axis+710,(i*16)+y_axis,LotColor,8);
         SetText("sLots"+IntegerToString(i),DoubleToStr(slots[i],2),x_axis+750,(i*16)+y_axis,LotColor1,8);
         SetText("bPos"+IntegerToString(i),DoubleToStr(bpos[i],0),x_axis+790,(i*16)+y_axis,OrdColor,8);
         SetText("sPos"+IntegerToString(i),DoubleToStr(spos[i],0),x_axis+820,(i*16)+y_axis,OrdColor1,8);
         SetText("TProf"+IntegerToString(i),DoubleToStr(MathAbs(bprofit[i]),2),x_axis+850,(i*16)+y_axis,ProfitColor,8);
         SetText("SProf"+IntegerToString(i),DoubleToStr(MathAbs(sprofit[i]),2),x_axis+890,(i*16)+y_axis,ProfitColor2,8);
         SetText("TtlProf"+IntegerToString(i),DoubleToStr(MathAbs(tprofit[i]),2),x_axis+940,(i*16)+y_axis,ProfitColor3,8);
         SetText("TotProf",DoubleToStr(MathAbs(TotalProfit()),2),x_axis+925,y_axis-22,ProfitColor1,8);
         
       Create_Button(button_close_basket_All,"CLOSE ALL",90 ,18,x_axis+560 ,y_axis-25,clrDarkGray,clrRed);
       Create_Button(button_buy_basket_1,"BUY",50 ,15,x_axis+520,y_axis,clrRoyalBlue,clrWhite);           
       Create_Button(button_sell_basket_1,"SELL",50 ,15,x_axis+580 ,y_axis,clrGoldenrod,clrWhite);
       Create_Button(button_close_basket_1,"CLOSE",50 ,15,x_axis+640 ,y_axis,clrRed,clrWhite);
       Create_Button(button_buy_basket_2,"BUY",50 ,15,x_axis+520,y_axis+16,clrRoyalBlue,clrWhite);           
       Create_Button(button_sell_basket_2,"SELL",50 ,15,x_axis+580 ,y_axis+16,clrGoldenrod,clrWhite);
       Create_Button(button_close_basket_2,"CLOSE",50 ,15,x_axis+640 ,y_axis+16,clrRed,clrWhite);
       Create_Button(button_buy_basket_3,"BUY",50 ,15,x_axis+520,y_axis+32,clrRoyalBlue,clrWhite);           
       Create_Button(button_sell_basket_3,"SELL",50 ,15,x_axis+580 ,y_axis+32,clrGoldenrod,clrWhite);
       Create_Button(button_close_basket_3,"CLOSE",50 ,15,x_axis+640 ,y_axis+32,clrRed,clrWhite);
       Create_Button(button_buy_basket_4,"BUY",50 ,15,x_axis+520,y_axis+48,clrRoyalBlue,clrWhite);           
       Create_Button(button_sell_basket_4,"SELL",50 ,15,x_axis+580 ,y_axis+48,clrGoldenrod,clrWhite);
       Create_Button(button_close_basket_4,"CLOSE",50 ,15,x_axis+640 ,y_axis+48,clrRed,clrWhite);
       Create_Button(button_buy_basket_5,"BUY",50 ,15,x_axis+520,y_axis+64,clrRoyalBlue,clrWhite);           
       Create_Button(button_sell_basket_5,"SELL",50 ,15,x_axis+580 ,y_axis+64,clrGoldenrod,clrWhite);
       Create_Button(button_close_basket_5,"CLOSE",50 ,15,x_axis+640 ,y_axis+64,clrRed,clrWhite);
       Create_Button(button_buy_basket_6,"BUY",50 ,15,x_axis+520,y_axis+80,clrRoyalBlue,clrWhite);           
       Create_Button(button_sell_basket_6,"SELL",50 ,15,x_axis+580 ,y_axis+80,clrGoldenrod,clrWhite);
       Create_Button(button_close_basket_6,"CLOSE",50 ,15,x_axis+640 ,y_axis+80,clrRed,clrWhite);
       Create_Button(button_buy_basket_7,"BUY",50 ,15,x_axis+520,y_axis+96,clrRoyalBlue,clrWhite);           
       Create_Button(button_sell_basket_7,"SELL",50 ,15,x_axis+580 ,y_axis+96,clrGoldenrod,clrWhite);
       Create_Button(button_close_basket_7,"CLOSE",50 ,15,x_axis+640 ,y_axis+96,clrRed,clrWhite);
       Create_Button(button_buy_basket_8,"BUY",50 ,15,x_axis+520,y_axis+112,clrRoyalBlue,clrWhite);           
       Create_Button(button_sell_basket_8,"SELL",50 ,15,x_axis+580 ,y_axis+112,clrGoldenrod,clrWhite);
       Create_Button(button_close_basket_8,"CLOSE",50 ,15,x_axis+640 ,y_axis+112,clrRed,clrWhite);
       Create_Button(button_buy_basket_9,"BUY",50 ,15,x_axis+520,y_axis+128,clrRoyalBlue,clrWhite);           
       Create_Button(button_sell_basket_9,"SELL",50 ,15,x_axis+580 ,y_axis+128,clrGoldenrod,clrWhite);
       Create_Button(button_close_basket_9,"CLOSE",50 ,15,x_axis+640 ,y_axis+128,clrRed,clrWhite);
       Create_Button(button_buy_basket_10,"BUY",50 ,15,x_axis+520,y_axis+144,clrRoyalBlue,clrWhite);           
       Create_Button(button_sell_basket_10,"SELL",50 ,15,x_axis+580 ,y_axis+144,clrGoldenrod,clrWhite);
       Create_Button(button_close_basket_10,"CLOSE",50 ,15,x_axis+640 ,y_axis+144,clrRed,clrWhite);
       Create_Button(button_buy_basket_11,"BUY",50 ,15,x_axis+520,y_axis+160,clrRoyalBlue,clrWhite);           
       Create_Button(button_sell_basket_11,"SELL",50 ,15,x_axis+580 ,y_axis+160,clrGoldenrod,clrWhite);
       Create_Button(button_close_basket_11,"CLOSE",50 ,15,x_axis+640 ,y_axis+160,clrRed,clrWhite);
       Create_Button(button_buy_basket_12,"BUY",50 ,15,x_axis+520,y_axis+176,clrRoyalBlue,clrWhite);           
       Create_Button(button_sell_basket_12,"SELL",50 ,15,x_axis+580 ,y_axis+176,clrGoldenrod,clrWhite);
       Create_Button(button_close_basket_12,"CLOSE",50 ,15,x_axis+640 ,y_axis+176,clrRed,clrWhite);
       Create_Button(button_buy_basket_13,"BUY",50 ,15,x_axis+520,y_axis+192,clrRoyalBlue,clrWhite);           
       Create_Button(button_sell_basket_13,"SELL",50 ,15,x_axis+580 ,y_axis+192,clrGoldenrod,clrWhite);
       Create_Button(button_close_basket_13,"CLOSE",50 ,15,x_axis+640 ,y_axis+192,clrRed,clrWhite);
       Create_Button(button_buy_basket_14,"BUY",50 ,15,x_axis+520,y_axis+208,clrRoyalBlue,clrWhite);           
       Create_Button(button_sell_basket_14,"SELL",50 ,15,x_axis+580 ,y_axis+208,clrGoldenrod,clrWhite);
       Create_Button(button_close_basket_14,"CLOSE",50 ,15,x_axis+640 ,y_axis+208,clrRed,clrWhite);
       Create_Button(button_buy_basket_15,"BUY",50 ,15,x_axis+520,y_axis+224,clrRoyalBlue,clrWhite);           
       Create_Button(button_sell_basket_15,"SELL",50 ,15,x_axis+580 ,y_axis+224,clrGoldenrod,clrWhite);
       Create_Button(button_close_basket_15,"CLOSE",50 ,15,x_axis+640 ,y_axis+224,clrRed,clrWhite);
       Create_Button(button_buy_basket_16,"BUY",50 ,15,x_axis+520,y_axis+240,clrRoyalBlue,clrWhite);           
       Create_Button(button_sell_basket_16,"SELL",50 ,15,x_axis+580 ,y_axis+240,clrGoldenrod,clrWhite);
       Create_Button(button_close_basket_16,"CLOSE",50 ,15,x_axis+640 ,y_axis+240,clrRed,clrWhite);
       Create_Button(button_buy_basket_17,"BUY",50 ,15,x_axis+520,y_axis+256,clrRoyalBlue,clrWhite);           
       Create_Button(button_sell_basket_17,"SELL",50 ,15,x_axis+580 ,y_axis+256,clrGoldenrod,clrWhite);
       Create_Button(button_close_basket_17,"CLOSE",50 ,15,x_axis+640 ,y_axis+256,clrRed,clrWhite);
       Create_Button(button_buy_basket_18,"BUY",50 ,15,x_axis+520,y_axis+272,clrRoyalBlue,clrWhite);           
       Create_Button(button_sell_basket_18,"SELL",50 ,15,x_axis+580 ,y_axis+272,clrGoldenrod,clrWhite);
       Create_Button(button_close_basket_18,"CLOSE",50 ,15,x_axis+640 ,y_axis+272,clrRed,clrWhite);
       Create_Button(button_buy_basket_19,"BUY",50 ,15,x_axis+520,y_axis+288,clrRoyalBlue,clrWhite);           
       Create_Button(button_sell_basket_19,"SELL",50 ,15,x_axis+580 ,y_axis+288,clrGoldenrod,clrWhite);
       Create_Button(button_close_basket_19,"CLOSE",50 ,15,x_axis+640 ,y_axis+288,clrRed,clrWhite);
       Create_Button(button_buy_basket_20,"BUY",50 ,15,x_axis+520,y_axis+304,clrRoyalBlue,clrWhite);           
       Create_Button(button_sell_basket_20,"SELL",50 ,15,x_axis+580 ,y_axis+304,clrGoldenrod,clrWhite);
       Create_Button(button_close_basket_20,"CLOSE",50 ,15,x_axis+640 ,y_axis+304,clrRed,clrWhite);
       Create_Button(button_buy_basket_21,"BUY",50 ,15,x_axis+520,y_axis+320,clrRoyalBlue,clrWhite);           
       Create_Button(button_sell_basket_21,"SELL",50 ,15,x_axis+580 ,y_axis+320,clrGoldenrod,clrWhite);
       Create_Button(button_close_basket_21,"CLOSE",50 ,15,x_axis+640 ,y_axis+320,clrRed,clrWhite);
       Create_Button(button_buy_basket_22,"BUY",50 ,15,x_axis+520,y_axis+336,clrRoyalBlue,clrWhite);           
       Create_Button(button_sell_basket_22,"SELL",50 ,15,x_axis+580 ,y_axis+336,clrGoldenrod,clrWhite);
       Create_Button(button_close_basket_22,"CLOSE",50 ,15,x_axis+640 ,y_axis+336,clrRed,clrWhite);
       Create_Button(button_buy_basket_23,"BUY",50 ,15,x_axis+520,y_axis+352,clrRoyalBlue,clrWhite);           
       Create_Button(button_sell_basket_23,"SELL",50 ,15,x_axis+580 ,y_axis+352,clrGoldenrod,clrWhite);
       Create_Button(button_close_basket_23,"CLOSE",50 ,15,x_axis+640 ,y_axis+352,clrRed,clrWhite);
       Create_Button(button_buy_basket_24,"BUY",50 ,15,x_axis+520,y_axis+368,clrRoyalBlue,clrWhite);           
       Create_Button(button_sell_basket_24,"SELL",50 ,15,x_axis+580 ,y_axis+368,clrGoldenrod,clrWhite);
       Create_Button(button_close_basket_24,"CLOSE",50 ,15,x_axis+640 ,y_axis+368,clrRed,clrWhite);
       Create_Button(button_buy_basket_25,"BUY",50 ,15,x_axis+520,y_axis+384,clrRoyalBlue,clrWhite);           
       Create_Button(button_sell_basket_25,"SELL",50 ,15,x_axis+580 ,y_axis+384,clrGoldenrod,clrWhite);
       Create_Button(button_close_basket_25,"CLOSE",50 ,15,x_axis+640 ,y_axis+384,clrRed,clrWhite);
       Create_Button(button_buy_basket_26,"BUY",50 ,15,x_axis+520,y_axis+400,clrRoyalBlue,clrWhite);           
       Create_Button(button_sell_basket_26,"SELL",50 ,15,x_axis+580 ,y_axis+400,clrGoldenrod,clrWhite);
       Create_Button(button_close_basket_26,"CLOSE",50 ,15,x_axis+640 ,y_axis+400,clrRed,clrWhite);
       Create_Button(button_buy_basket_27,"BUY",50 ,15,x_axis+520,y_axis+416,clrRoyalBlue,clrWhite);           
       Create_Button(button_sell_basket_27,"SELL",50 ,15,x_axis+580 ,y_axis+416,clrGoldenrod,clrWhite);
       Create_Button(button_close_basket_27,"CLOSE",50 ,15,x_axis+640 ,y_axis+416,clrRed,clrWhite);
        Create_Button(button_buy_basket_28,"BUY",50 ,15,x_axis+520,y_axis+432,clrRoyalBlue,clrWhite);           
       Create_Button(button_sell_basket_28,"SELL",50 ,15,x_axis+580 ,y_axis+432,clrGoldenrod,clrWhite);
       Create_Button(button_close_basket_28,"CLOSE",50 ,15,x_axis+640 ,y_axis+432,clrRed,clrWhite);  
        }
  }
  
//+------------------------------------------------------------------+

void SetText(string name,string text,int x,int y,color colour,int fontsize=12)
  {
   if(ObjectCreate(0,name,OBJ_LABEL,0,0,0))
     {
      ObjectSetInteger(0,name,OBJPROP_XDISTANCE,x);
      ObjectSetInteger(0,name,OBJPROP_YDISTANCE,y);
      ObjectSetInteger(0,name,OBJPROP_COLOR,colour);
      ObjectSetInteger(0,name,OBJPROP_FONTSIZE,fontsize);
      ObjectSetInteger(0,name,OBJPROP_CORNER,CORNER_LEFT_UPPER);
     }
   ObjectSetString(0,name,OBJPROP_TEXT,text);
  }
//+------------------------------------------------------------------+

void SetObjText(string name,string CharToStr,int x,int y,color colour,int fontsize=12)
  {
   if(ObjectCreate(0,name,OBJ_LABEL,0,0,0))
     {
      ObjectSetInteger(0,name,OBJPROP_FONTSIZE,fontsize);
      ObjectSetInteger(0,name,OBJPROP_COLOR,colour);
      ObjectSetInteger(0,name,OBJPROP_BACK,false);
      ObjectSetInteger(0,name,OBJPROP_XDISTANCE,x);
      ObjectSetInteger(0,name,OBJPROP_YDISTANCE,y);
     }
  ObjectSetString(0,name,OBJPROP_TEXT,CharToStr);
  ObjectSetString(0,name,OBJPROP_FONT,"Wingdings");
  }  
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SetPanel(string name,int sub_window,int x,int y,int width,int height,color bg_color,color border_clr,int border_width)
  {
   if(ObjectCreate(0,name,OBJ_RECTANGLE_LABEL,sub_window,0,0))
     {
      ObjectSetInteger(0,name,OBJPROP_XDISTANCE,x);
      ObjectSetInteger(0,name,OBJPROP_YDISTANCE,y);
      ObjectSetInteger(0,name,OBJPROP_XSIZE,width);
      ObjectSetInteger(0,name,OBJPROP_YSIZE,height);
      ObjectSetInteger(0,name,OBJPROP_COLOR,border_clr);
      ObjectSetInteger(0,name,OBJPROP_BORDER_TYPE,BORDER_FLAT);
      ObjectSetInteger(0,name,OBJPROP_WIDTH,border_width);
      ObjectSetInteger(0,name,OBJPROP_CORNER,CORNER_LEFT_UPPER);
      ObjectSetInteger(0,name,OBJPROP_STYLE,STYLE_SOLID);
      ObjectSetInteger(0,name,OBJPROP_BACK,true);
      ObjectSetInteger(0,name,OBJPROP_SELECTABLE,0);
      ObjectSetInteger(0,name,OBJPROP_SELECTED,0);
      ObjectSetInteger(0,name,OBJPROP_HIDDEN,true);
      ObjectSetInteger(0,name,OBJPROP_ZORDER,0);
     }
   ObjectSetInteger(0,name,OBJPROP_BGCOLOR,bg_color);
  }
//+------------------------------------------------------------------+
void Create_Button(string but_name,string label,int xsize,int ysize,int xdist,int ydist,int bcolor,int fcolor)
{
   if(ObjectFind(0,but_name)<0)
   {
      if(!ObjectCreate(0,but_name,OBJ_BUTTON,0,0,0))
        {
         Print(__FUNCTION__,
               ": failed to create the button! Error code = ",GetLastError());
         return;
        }
      ObjectSetString(0,but_name,OBJPROP_TEXT,label);
      ObjectSetInteger(0,but_name,OBJPROP_XSIZE,xsize);
      ObjectSetInteger(0,but_name,OBJPROP_YSIZE,ysize);
      ObjectSetInteger(0,but_name,OBJPROP_CORNER,CORNER_LEFT_UPPER);     
      ObjectSetInteger(0,but_name,OBJPROP_XDISTANCE,xdist);      
      ObjectSetInteger(0,but_name,OBJPROP_YDISTANCE,ydist);         
      ObjectSetInteger(0,but_name,OBJPROP_BGCOLOR,bcolor);
      ObjectSetInteger(0,but_name,OBJPROP_COLOR,fcolor);
      ObjectSetInteger(0,but_name,OBJPROP_FONTSIZE,9);
      ObjectSetInteger(0,but_name,OBJPROP_HIDDEN,true);
      //ObjectSetInteger(0,but_name,OBJPROP_BORDER_COLOR,ChartGetInteger(0,CHART_COLOR_FOREGROUND));
      ObjectSetInteger(0,but_name,OBJPROP_BORDER_TYPE,BORDER_RAISED);
      
      ChartRedraw();      
   }

}
void OnChartEvent(const int id,  const long &lparam, const double &dparam,  const string &sparam)
  {
   if(id==CHARTEVENT_OBJECT_CLICK)
  ticket = OrderTicket();
  
      {
      if(sparam==button_close_basket_All)
        {
               ObjectSetString(0,button_close_basket_All,OBJPROP_TEXT,"Closing...");               
               close_basket();
               ObjectSetInteger(0,button_close_basket_All,OBJPROP_STATE,0);
               ObjectSetString(0,button_close_basket_All,OBJPROP_TEXT,"Close Basket"); 
               ObjectDelete(button_close_basket_All);        
        }
//-----------------------------------------------------------------------------------------------------------------     
     if(sparam==button_buy_basket_1)
        {
               ObjectSetString(0,button_buy_basket_1,OBJPROP_TEXT,"Buying...");
               ticket=OrderSend(TradePair[0],OP_BUY,lot,MarketInfo(TradePair[0],MODE_ASK),100,0,0,"OFF",Magic_Number,0,Blue);
               ObjectSetInteger(0,button_buy_basket_1,OBJPROP_STATE,0);
               ObjectSetString(0,button_buy_basket_1,OBJPROP_TEXT,"Buy Basket"); 
               ObjectDelete(button_buy_basket_1);        
        }
     if(sparam==button_sell_basket_1)
        {
               ObjectSetString(0,button_sell_basket_1,OBJPROP_TEXT,"Selling...");
               ticket=OrderSend(TradePair[0],OP_SELL,lot,MarketInfo(TradePair[0],MODE_BID),100,0,0,"OFF",Magic_Number,0,Red);
               ObjectSetInteger(0,button_sell_basket_1,OBJPROP_STATE,0);
               ObjectSetString(0,button_sell_basket_1,OBJPROP_TEXT,"Sell Basket");
               ObjectDelete(button_sell_basket_1);         
        }
     if(sparam==button_close_basket_1)
        {
               ObjectSetString(0,button_close_basket_1,OBJPROP_TEXT,"Closing...");               
               closeOpenOrders(TradePair[0], OP_SELL);
               closeOpenOrders(TradePair[0], OP_BUY);
               ObjectSetInteger(0,button_close_basket_1,OBJPROP_STATE,0);
               ObjectSetString(0,button_close_basket_1,OBJPROP_TEXT,"Close Basket");
               ObjectDelete(button_close_basket_1);         
        }
         
//----------------------------------------------------------------------------------------------------------------------
     if(sparam==button_buy_basket_2)
        {
               ObjectSetString(0,button_buy_basket_2,OBJPROP_TEXT,"Buying...");
               ticket=OrderSend(TradePair[1],OP_BUY,lot,MarketInfo(TradePair[1],MODE_ASK),100,0,0,"OFF",Magic_Number,0,Blue);
               ObjectSetInteger(0,button_buy_basket_2,OBJPROP_STATE,0);
               ObjectSetString(0,button_buy_basket_2,OBJPROP_TEXT,"Buy Basket");
               ObjectDelete(button_buy_basket_2);         
        }
     if(sparam==button_sell_basket_2)
        {
               ObjectSetString(0,button_sell_basket_2,OBJPROP_TEXT,"Selling...");
               ticket=OrderSend(TradePair[1],OP_SELL,lot,MarketInfo(TradePair[1],MODE_BID),100,0,0,"OFF",Magic_Number,0,Red);
               ObjectSetInteger(0,button_sell_basket_2,OBJPROP_STATE,0);
               ObjectSetString(0,button_sell_basket_2,OBJPROP_TEXT,"Sell Basket");
               ObjectDelete(button_sell_basket_2);         
        }
    if(sparam==button_close_basket_2)
        {
               ObjectSetString(0,button_close_basket_2,OBJPROP_TEXT,"Closing...");               
               closeOpenOrders(TradePair[1], OP_SELL);
               closeOpenOrders(TradePair[1], OP_BUY);
               ObjectSetInteger(0,button_close_basket_2,OBJPROP_STATE,0);
               ObjectSetString(0,button_close_basket_2,OBJPROP_TEXT,"Close Basket");
               ObjectDelete(button_close_basket_2);         
        }
//--------------------------------------------------------------------------------------------------------
     if(sparam==button_buy_basket_3)
        {
               ObjectSetString(0,button_buy_basket_3,OBJPROP_TEXT,"Buying...");
               ticket=OrderSend(TradePair[2],OP_BUY,lot,MarketInfo(TradePair[2],MODE_ASK),100,0,0,"OFF",Magic_Number,0,Blue);
               ObjectSetInteger(0,button_buy_basket_3,OBJPROP_STATE,0);
               ObjectSetString(0,button_buy_basket_3,OBJPROP_TEXT,"Buy Basket");
               ObjectDelete(button_buy_basket_3);        
        }
     if(sparam==button_sell_basket_3)
        {
               ObjectSetString(0,button_sell_basket_3,OBJPROP_TEXT,"Selling...");
               ticket=OrderSend(TradePair[2],OP_SELL,lot,MarketInfo(TradePair[2],MODE_BID),100,0,0,"OFF",Magic_Number,0,Red);
               ObjectSetInteger(0,button_sell_basket_3,OBJPROP_STATE,0);
               ObjectSetString(0,button_sell_basket_3,OBJPROP_TEXT,"Sell Basket");
               ObjectDelete(button_sell_basket_3);          
        }
    if(sparam==button_close_basket_3)
        {
               ObjectSetString(0,button_close_basket_3,OBJPROP_TEXT,"Closing...");               
                closeOpenOrders(TradePair[2], OP_SELL);
               closeOpenOrders(TradePair[2], OP_BUY);
               ObjectSetInteger(0,button_close_basket_3,OBJPROP_STATE,0);
               ObjectSetString(0,button_close_basket_3,OBJPROP_TEXT,"Close Basket");
               ObjectDelete(button_close_basket_3);       
        }
//--------------------------------------------------------------------------------------------------------
     if(sparam==button_buy_basket_4)
        {
               ObjectSetString(0,button_buy_basket_4,OBJPROP_TEXT,"Buying...");
               ticket=OrderSend(TradePair[3],OP_BUY,lot,MarketInfo(TradePair[3],MODE_ASK),100,0,0,"OFF",Magic_Number,0,Blue);
               ObjectSetInteger(0,button_buy_basket_4,OBJPROP_STATE,0);
               ObjectSetString(0,button_buy_basket_4,OBJPROP_TEXT,"Buy Basket"); 
               ObjectDelete(button_buy_basket_4);         
        }
     if(sparam==button_sell_basket_4)
        {
               ObjectSetString(0,button_sell_basket_4,OBJPROP_TEXT,"Selling...");
               ticket=OrderSend(TradePair[3],OP_SELL,lot,MarketInfo(TradePair[3],MODE_BID),100,0,0,"OFF",Magic_Number,0,Red);
               ObjectSetInteger(0,button_sell_basket_4,OBJPROP_STATE,0);
               ObjectSetString(0,button_sell_basket_4,OBJPROP_TEXT,"Sell Basket"); 
               ObjectDelete(button_sell_basket_4);        
        }
    if(sparam==button_close_basket_4)
        {
               ObjectSetString(0,button_close_basket_4,OBJPROP_TEXT,"Closing...");               
                closeOpenOrders(TradePair[3], OP_SELL);
               closeOpenOrders(TradePair[3], OP_BUY);
               ObjectSetInteger(0,button_close_basket_4,OBJPROP_STATE,0);
               ObjectSetString(0,button_close_basket_4,OBJPROP_TEXT,"Close Basket"); 
               ObjectDelete(button_close_basket_4);         
        }
//--------------------------------------------------------------------------------------------------------
     if(sparam==button_buy_basket_5)
        {
               ObjectSetString(0,button_buy_basket_5,OBJPROP_TEXT,"Buying...");
               ticket=OrderSend(TradePair[4],OP_BUY,lot,MarketInfo(TradePair[4],MODE_ASK),100,0,0,"OFF",Magic_Number,0,Blue);
               ObjectSetInteger(0,button_buy_basket_5,OBJPROP_STATE,0);
               ObjectSetString(0,button_buy_basket_5,OBJPROP_TEXT,"Buy Basket"); 
                ObjectDelete(button_buy_basket_5);       
        }
     if(sparam==button_sell_basket_5)
        {
               ObjectSetString(0,button_sell_basket_5,OBJPROP_TEXT,"Selling...");
               ticket=OrderSend(TradePair[4],OP_SELL,lot,MarketInfo(TradePair[4],MODE_BID),100,0,0,"OFF",Magic_Number,0,Red);
               ObjectSetInteger(0,button_sell_basket_5,OBJPROP_STATE,0);
               ObjectSetString(0,button_sell_basket_5,OBJPROP_TEXT,"Sell Basket");
               ObjectDelete(button_sell_basket_5);         
        }
    if(sparam==button_close_basket_5)
        {
               ObjectSetString(0,button_close_basket_5,OBJPROP_TEXT,"Closing...");               
                closeOpenOrders(TradePair[4], OP_SELL);
               closeOpenOrders(TradePair[4], OP_BUY);
               ObjectSetInteger(0,button_close_basket_5,OBJPROP_STATE,0);
               ObjectSetString(0,button_close_basket_5,OBJPROP_TEXT,"Close Basket");
               ObjectDelete(button_close_basket_5);         
        }
//--------------------------------------------------------------------------------------------------------
     if(sparam==button_buy_basket_6)
        {
               ObjectSetString(0,button_buy_basket_6,OBJPROP_TEXT,"Buying...");
               ticket=OrderSend(TradePair[5],OP_BUY,lot,MarketInfo(TradePair[5],MODE_ASK),100,0,0,"OFF",Magic_Number,0,Blue);
               ObjectSetInteger(0,button_buy_basket_6,OBJPROP_STATE,0);
               ObjectSetString(0,button_buy_basket_6,OBJPROP_TEXT,"Buy Basket"); 
               ObjectDelete(button_buy_basket_6);         
        }
     if(sparam==button_sell_basket_6)
        {
               ObjectSetString(0,button_sell_basket_6,OBJPROP_TEXT,"Selling...");
               ticket=OrderSend(TradePair[5],OP_SELL,lot,MarketInfo(TradePair[5],MODE_BID),100,0,0,"OFF",Magic_Number,0,Red);
               ObjectSetInteger(0,button_sell_basket_6,OBJPROP_STATE,0);
               ObjectSetString(0,button_sell_basket_6,OBJPROP_TEXT,"Sell Basket"); 
               ObjectDelete(button_sell_basket_6);       
        }
    if(sparam==button_close_basket_6)
        {
               ObjectSetString(0,button_close_basket_6,OBJPROP_TEXT,"Closing...");               
                closeOpenOrders(TradePair[5], OP_SELL);
               closeOpenOrders(TradePair[5], OP_BUY);
               ObjectSetInteger(0,button_close_basket_6,OBJPROP_STATE,0);
               ObjectSetString(0,button_close_basket_6,OBJPROP_TEXT,"Close Basket"); 
               ObjectDelete(button_close_basket_6);         
        }
//--------------------------------------------------------------------------------------------------------
     if(sparam==button_buy_basket_7)
        {
               ObjectSetString(0,button_buy_basket_7,OBJPROP_TEXT,"Buying...");
               ticket=OrderSend(TradePair[6],OP_BUY,lot,MarketInfo(TradePair[6],MODE_ASK),100,0,0,"OFF",Magic_Number,0,Blue);
               ObjectSetInteger(0,button_buy_basket_7,OBJPROP_STATE,0);
               ObjectSetString(0,button_buy_basket_7,OBJPROP_TEXT,"Buy Basket"); 
               ObjectDelete(button_buy_basket_7);        
        }
     if(sparam==button_sell_basket_7)
        {
               ObjectSetString(0,button_sell_basket_7,OBJPROP_TEXT,"Selling...");
               ticket=OrderSend(TradePair[6],OP_SELL,lot,MarketInfo(TradePair[6],MODE_BID),100,0,0,"OFF",Magic_Number,0,Red);
               ObjectSetInteger(0,button_sell_basket_7,OBJPROP_STATE,0);
               ObjectSetString(0,button_sell_basket_7,OBJPROP_TEXT,"Sell Basket"); 
               ObjectDelete(button_sell_basket_7);      
        }
    if(sparam==button_close_basket_7)
        {
               ObjectSetString(0,button_close_basket_7,OBJPROP_TEXT,"Closing...");               
                closeOpenOrders(TradePair[6], OP_SELL);
               closeOpenOrders(TradePair[6], OP_BUY);
               ObjectSetInteger(0,button_close_basket_7,OBJPROP_STATE,0);
               ObjectSetString(0,button_close_basket_7,OBJPROP_TEXT,"Close Basket");
               ObjectDelete(button_close_basket_7);           
        }
//--------------------------------------------------------------------------------------------------------
     if(sparam==button_buy_basket_8)
        {
               ObjectSetString(0,button_buy_basket_8,OBJPROP_TEXT,"Buying...");
               ticket=OrderSend(TradePair[7],OP_BUY,lot,MarketInfo(TradePair[7],MODE_ASK),100,0,0,"OFF",Magic_Number,0,Blue);
               ObjectSetInteger(0,button_buy_basket_8,OBJPROP_STATE,0);
               ObjectSetString(0,button_buy_basket_8,OBJPROP_TEXT,"Buy Basket");
               ObjectDelete(button_buy_basket_8);        
        }
     if(sparam==button_sell_basket_8)
        {
               ObjectSetString(0,button_sell_basket_8,OBJPROP_TEXT,"Selling...");
               ticket=OrderSend(TradePair[7],OP_SELL,lot,MarketInfo(TradePair[7],MODE_BID),100,0,0,"OFF",Magic_Number,0,Red);
               ObjectSetInteger(0,button_sell_basket_8,OBJPROP_STATE,0);
               ObjectSetString(0,button_sell_basket_8,OBJPROP_TEXT,"Sell Basket");
               ObjectDelete(button_sell_basket_8);         
        }
    if(sparam==button_close_basket_8)
        {
               ObjectSetString(0,button_close_basket_8,OBJPROP_TEXT,"Closing...");               
                closeOpenOrders(TradePair[7], OP_SELL);
               closeOpenOrders(TradePair[7], OP_BUY);
               ObjectSetInteger(0,button_close_basket_8,OBJPROP_STATE,0);
               ObjectSetString(0,button_close_basket_8,OBJPROP_TEXT,"Close Basket"); 
               ObjectDelete(button_close_basket_8);         
        }
//--------------------------------------------------------------------------------------------------------
     if(sparam==button_buy_basket_9)
        {
               ObjectSetString(0,button_buy_basket_9,OBJPROP_TEXT,"Buying...");
               ticket=OrderSend(TradePair[8],OP_BUY,lot,MarketInfo(TradePair[8],MODE_ASK),100,0,0,"OFF",Magic_Number,0,Blue);
               ObjectSetInteger(0,button_buy_basket_9,OBJPROP_STATE,0);
               ObjectSetString(0,button_buy_basket_9,OBJPROP_TEXT,"Buy Basket"); 
               ObjectDelete(button_buy_basket_9);      
        }
     if(sparam==button_sell_basket_9)
        {
               ObjectSetString(0,button_sell_basket_9,OBJPROP_TEXT,"Selling...");
               ticket=OrderSend(TradePair[8],OP_SELL,lot,MarketInfo(TradePair[8],MODE_BID),100,0,0,"OFF",Magic_Number,0,Red);
               ObjectSetInteger(0,button_sell_basket_9,OBJPROP_STATE,0);
               ObjectSetString(0,button_sell_basket_9,OBJPROP_TEXT,"Sell Basket"); 
               ObjectDelete(button_sell_basket_9);        
        }
    if(sparam==button_close_basket_9)
        {
               ObjectSetString(0,button_close_basket_9,OBJPROP_TEXT,"Closing...");               
                closeOpenOrders(TradePair[8], OP_SELL);
               closeOpenOrders(TradePair[8], OP_BUY);
               ObjectSetInteger(0,button_close_basket_9,OBJPROP_STATE,0);
               ObjectSetString(0,button_close_basket_9,OBJPROP_TEXT,"Close Basket");  
               ObjectDelete(button_close_basket_9);        
        }
//--------------------------------------------------------------------------------------------------------
     if(sparam==button_buy_basket_10)
        {
               ObjectSetString(0,button_buy_basket_10,OBJPROP_TEXT,"Buying...");
               ticket=OrderSend(TradePair[9],OP_BUY,lot,MarketInfo(TradePair[9],MODE_ASK),100,0,0,"OFF",Magic_Number,0,Blue);
               ObjectSetInteger(0,button_buy_basket_10,OBJPROP_STATE,0);
               ObjectSetString(0,button_buy_basket_10,OBJPROP_TEXT,"Buy Basket");
               ObjectDelete(button_buy_basket_10);         
        }
     if(sparam==button_sell_basket_10)
        {
               ObjectSetString(0,button_sell_basket_10,OBJPROP_TEXT,"Selling...");
               ticket=OrderSend(TradePair[9],OP_SELL,lot,MarketInfo(TradePair[9],MODE_BID),100,0,0,"OFF",Magic_Number,0,Red);
               ObjectSetInteger(0,button_sell_basket_10,OBJPROP_STATE,0);
               ObjectSetString(0,button_sell_basket_10,OBJPROP_TEXT,"Sell Basket"); 
               ObjectDelete(button_sell_basket_10);         
        }
    if(sparam==button_close_basket_10)
        {
               ObjectSetString(0,button_close_basket_10,OBJPROP_TEXT,"Closing...");               
                closeOpenOrders(TradePair[9], OP_SELL);
               closeOpenOrders(TradePair[9], OP_BUY);
               ObjectSetInteger(0,button_close_basket_10,OBJPROP_STATE,0);
               ObjectSetString(0,button_close_basket_10,OBJPROP_TEXT,"Close Basket");
               ObjectDelete(button_close_basket_10);         
        }
//--------------------------------------------------------------------------------------------------------
     if(sparam==button_buy_basket_11)
        {
               ObjectSetString(0,button_buy_basket_11,OBJPROP_TEXT,"Buying...");
               ticket=OrderSend(TradePair[10],OP_BUY,lot,MarketInfo(TradePair[10],MODE_ASK),100,0,0,"OFF",Magic_Number,0,Blue);
               ObjectSetInteger(0,button_buy_basket_11,OBJPROP_STATE,0);
               ObjectSetString(0,button_buy_basket_11,OBJPROP_TEXT,"Buy Basket");
               ObjectDelete(button_buy_basket_11);        
        }
     if(sparam==button_sell_basket_11)
        {
               ObjectSetString(0,button_sell_basket_11,OBJPROP_TEXT,"Selling...");
               ticket=OrderSend(TradePair[10],OP_SELL,lot,MarketInfo(TradePair[10],MODE_BID),100,0,0,"OFF",Magic_Number,0,Red);
               ObjectSetInteger(0,button_sell_basket_11,OBJPROP_STATE,0);
               ObjectSetString(0,button_sell_basket_11,OBJPROP_TEXT,"Sell Basket"); 
               ObjectDelete(button_sell_basket_11);        
        }
    if(sparam==button_close_basket_11)
        {
               ObjectSetString(0,button_close_basket_11,OBJPROP_TEXT,"Closing...");               
                closeOpenOrders(TradePair[10], OP_SELL);
               closeOpenOrders(TradePair[10], OP_BUY);
               ObjectSetInteger(0,button_close_basket_11,OBJPROP_STATE,0);
               ObjectSetString(0,button_close_basket_11,OBJPROP_TEXT,"Close Basket");
               ObjectDelete(button_close_basket_11);          
        }
//--------------------------------------------------------------------------------------------------------
     if(sparam==button_buy_basket_12)
        {
               ObjectSetString(0,button_buy_basket_12,OBJPROP_TEXT,"Buying...");
               ticket=OrderSend(TradePair[11],OP_BUY,lot,MarketInfo(TradePair[11],MODE_ASK),100,0,0,"OFF",Magic_Number,0,Blue);
               ObjectSetInteger(0,button_buy_basket_12,OBJPROP_STATE,0);
               ObjectSetString(0,button_buy_basket_12,OBJPROP_TEXT,"Buy Basket");
               ObjectDelete(button_buy_basket_12);        
        }
     if(sparam==button_sell_basket_12)
        {
               ObjectSetString(0,button_sell_basket_12,OBJPROP_TEXT,"Selling...");
               ticket=OrderSend(TradePair[11],OP_SELL,lot,MarketInfo(TradePair[11],MODE_BID),100,0,0,"OFF",Magic_Number,0,Red);
               ObjectSetInteger(0,button_sell_basket_12,OBJPROP_STATE,0);
               ObjectSetString(0,button_sell_basket_12,OBJPROP_TEXT,"Sell Basket");
               ObjectDelete(button_sell_basket_12);          
        }
    if(sparam==button_close_basket_12)
        {
               ObjectSetString(0,button_close_basket_12,OBJPROP_TEXT,"Closing...");               
                closeOpenOrders(TradePair[11], OP_SELL);
               closeOpenOrders(TradePair[11], OP_BUY);
               ObjectSetInteger(0,button_close_basket_12,OBJPROP_STATE,0);
               ObjectSetString(0,button_close_basket_12,OBJPROP_TEXT,"Close Basket"); 
               ObjectDelete(button_close_basket_12);        
        }
//--------------------------------------------------------------------------------------------------------
     if(sparam==button_buy_basket_13)
        {
               ObjectSetString(0,button_buy_basket_13,OBJPROP_TEXT,"Buying...");
               ticket=OrderSend(TradePair[12],OP_BUY,lot,MarketInfo(TradePair[12],MODE_ASK),100,0,0,"OFF",Magic_Number,0,Blue);
               ObjectSetInteger(0,button_buy_basket_13,OBJPROP_STATE,0);
               ObjectSetString(0,button_buy_basket_13,OBJPROP_TEXT,"Buy Basket");
               ObjectDelete(button_buy_basket_13);         
        }
     if(sparam==button_sell_basket_13)
        {
               ObjectSetString(0,button_sell_basket_13,OBJPROP_TEXT,"Selling...");
               ticket=OrderSend(TradePair[12],OP_SELL,lot,MarketInfo(TradePair[12],MODE_BID),100,0,0,"OFF",Magic_Number,0,Red);
               ObjectSetInteger(0,button_sell_basket_13,OBJPROP_STATE,0);
               ObjectSetString(0,button_sell_basket_13,OBJPROP_TEXT,"Sell Basket");
               ObjectDelete(button_sell_basket_13);         
        }
    if(sparam==button_close_basket_13)
        {
               ObjectSetString(0,button_close_basket_13,OBJPROP_TEXT,"Closing...");               
                closeOpenOrders(TradePair[12], OP_SELL);
               closeOpenOrders(TradePair[12], OP_BUY);
               ObjectSetInteger(0,button_close_basket_13,OBJPROP_STATE,0);
               ObjectSetString(0,button_close_basket_13,OBJPROP_TEXT,"Close Basket"); 
               ObjectDelete(button_close_basket_13);        
        }
//--------------------------------------------------------------------------------------------------------
     if(sparam==button_buy_basket_14)
        {
               ObjectSetString(0,button_buy_basket_14,OBJPROP_TEXT,"Buying...");
               ticket=OrderSend(TradePair[13],OP_BUY,lot,MarketInfo(TradePair[13],MODE_ASK),100,0,0,"OFF",Magic_Number,0,Blue);
               ObjectSetInteger(0,button_buy_basket_14,OBJPROP_STATE,0);
               ObjectSetString(0,button_buy_basket_14,OBJPROP_TEXT,"Buy Basket"); 
               ObjectDelete(button_buy_basket_14);       
        }
     if(sparam==button_sell_basket_14)
        {
               ObjectSetString(0,button_sell_basket_14,OBJPROP_TEXT,"Selling...");
               ticket=OrderSend(TradePair[13],OP_SELL,lot,MarketInfo(TradePair[13],MODE_BID),100,0,0,"OFF",Magic_Number,0,Red);
               ObjectSetInteger(0,button_sell_basket_14,OBJPROP_STATE,0);
               ObjectSetString(0,button_sell_basket_14,OBJPROP_TEXT,"Sell Basket"); 
               ObjectDelete(button_sell_basket_14);        
        }
    if(sparam==button_close_basket_14)
        {
               ObjectSetString(0,button_close_basket_14,OBJPROP_TEXT,"Closing...");               
                closeOpenOrders(TradePair[13], OP_SELL);
               closeOpenOrders(TradePair[13], OP_BUY);
               ObjectSetInteger(0,button_close_basket_14,OBJPROP_STATE,0);
               ObjectSetString(0,button_close_basket_14,OBJPROP_TEXT,"Close Basket");
               ObjectDelete(button_close_basket_14);          
        }
//--------------------------------------------------------------------------------------------------------
    if(sparam==button_buy_basket_15)
        {
               ObjectSetString(0,button_buy_basket_15,OBJPROP_TEXT,"Buying...");
               ticket=OrderSend(TradePair[14],OP_BUY,lot,MarketInfo(TradePair[14],MODE_ASK),100,0,0,"OFF",Magic_Number,0,Blue);
               ObjectSetInteger(0,button_buy_basket_15,OBJPROP_STATE,0);
               ObjectSetString(0,button_buy_basket_15,OBJPROP_TEXT,"Buy Basket");
               ObjectDelete(button_buy_basket_15);        
        }
     if(sparam==button_sell_basket_15)
        {
               ObjectSetString(0,button_sell_basket_15,OBJPROP_TEXT,"Selling...");
               ticket=OrderSend(TradePair[14],OP_SELL,lot,MarketInfo(TradePair[14],MODE_BID),100,0,0,"OFF",Magic_Number,0,Red);
               ObjectSetInteger(0,button_sell_basket_15,OBJPROP_STATE,0);
               ObjectSetString(0,button_sell_basket_15,OBJPROP_TEXT,"Sell Basket"); 
               ObjectDelete(button_sell_basket_15);        
        }
    if(sparam==button_close_basket_15)
        {
               ObjectSetString(0,button_close_basket_15,OBJPROP_TEXT,"Closing...");               
                closeOpenOrders(TradePair[14], OP_SELL);
               closeOpenOrders(TradePair[14], OP_BUY);
               ObjectSetInteger(0,button_close_basket_15,OBJPROP_STATE,0);
               ObjectSetString(0,button_close_basket_15,OBJPROP_TEXT,"Close Basket");
               ObjectDelete(button_close_basket_15);          
        }
//--------------------------------------------------------------------------------------------------------
    if(sparam==button_buy_basket_16)
        {
               ObjectSetString(0,button_buy_basket_16,OBJPROP_TEXT,"Buying...");
               ticket=OrderSend(TradePair[15],OP_BUY,lot,MarketInfo(TradePair[15],MODE_ASK),100,0,0,"OFF",Magic_Number,0,Blue);
               ObjectSetInteger(0,button_buy_basket_16,OBJPROP_STATE,0);
               ObjectSetString(0,button_buy_basket_16,OBJPROP_TEXT,"Buy Basket");
               ObjectDelete(button_buy_basket_16);        
        }
     if(sparam==button_sell_basket_16)
        {
               ObjectSetString(0,button_sell_basket_16,OBJPROP_TEXT,"Selling...");
               ticket=OrderSend(TradePair[15],OP_SELL,lot,MarketInfo(TradePair[15],MODE_BID),100,0,0,"OFF",Magic_Number,0,Red);
               ObjectSetInteger(0,button_sell_basket_16,OBJPROP_STATE,0);
               ObjectSetString(0,button_sell_basket_16,OBJPROP_TEXT,"Sell Basket");
               ObjectDelete(button_sell_basket_16);          
        }
    if(sparam==button_close_basket_16)
        {
               ObjectSetString(0,button_close_basket_16,OBJPROP_TEXT,"Closing...");               
                closeOpenOrders(TradePair[15], OP_SELL);
               closeOpenOrders(TradePair[15], OP_BUY);
               ObjectSetInteger(0,button_close_basket_16,OBJPROP_STATE,0);
               ObjectSetString(0,button_close_basket_16,OBJPROP_TEXT,"Close Basket"); 
               ObjectDelete(button_close_basket_16);       
        }
//--------------------------------------------------------------------------------------------------------
    if(sparam==button_buy_basket_17)
        {
               ObjectSetString(0,button_buy_basket_17,OBJPROP_TEXT,"Buying...");
               ticket=OrderSend(TradePair[16],OP_BUY,lot,MarketInfo(TradePair[16],MODE_ASK),100,0,0,"OFF",Magic_Number,0,Blue);
               ObjectSetInteger(0,button_buy_basket_17,OBJPROP_STATE,0);
               ObjectSetString(0,button_buy_basket_17,OBJPROP_TEXT,"Buy Basket");
                ObjectDelete(button_buy_basket_17);         
        }
     if(sparam==button_sell_basket_17)
        {
               ObjectSetString(0,button_sell_basket_17,OBJPROP_TEXT,"Selling...");
               ticket=OrderSend(TradePair[16],OP_SELL,lot,MarketInfo(TradePair[16],MODE_BID),100,0,0,"OFF",Magic_Number,0,Red);
               ObjectSetInteger(0,button_sell_basket_17,OBJPROP_STATE,0);
               ObjectSetString(0,button_sell_basket_17,OBJPROP_TEXT,"Sell Basket"); 
               ObjectDelete(button_sell_basket_17);      
        }
    if(sparam==button_close_basket_17)
        {
               ObjectSetString(0,button_close_basket_17,OBJPROP_TEXT,"Closing...");               
                closeOpenOrders(TradePair[16], OP_SELL);
               closeOpenOrders(TradePair[16], OP_BUY);
               ObjectSetInteger(0,button_close_basket_17,OBJPROP_STATE,0);
               ObjectSetString(0,button_close_basket_17,OBJPROP_TEXT,"Close Basket");
               ObjectDelete(button_close_basket_17);           
        }
//--------------------------------------------------------------------------------------------------------
    if(sparam==button_buy_basket_18)
        {
               ObjectSetString(0,button_buy_basket_18,OBJPROP_TEXT,"Buying...");
               ticket=OrderSend(TradePair[17],OP_BUY,lot,MarketInfo(TradePair[17],MODE_ASK),100,0,0,"OFF",Magic_Number,0,Blue);
               ObjectSetInteger(0,button_buy_basket_18,OBJPROP_STATE,0);
               ObjectSetString(0,button_buy_basket_18,OBJPROP_TEXT,"Buy Basket");
               ObjectDelete(button_buy_basket_18);        
        }
     if(sparam==button_sell_basket_18)
        {
               ObjectSetString(0,button_sell_basket_18,OBJPROP_TEXT,"Selling...");
               ticket=OrderSend(TradePair[17],OP_SELL,lot,MarketInfo(TradePair[17],MODE_BID),100,0,0,"OFF",Magic_Number,0,Red);
               ObjectSetInteger(0,button_sell_basket_18,OBJPROP_STATE,0);
               ObjectSetString(0,button_sell_basket_18,OBJPROP_TEXT,"Sell Basket"); 
                ObjectDelete(button_sell_basket_18);        
        }
    if(sparam==button_close_basket_18)
        {
               ObjectSetString(0,button_close_basket_18,OBJPROP_TEXT,"Closing...");               
                closeOpenOrders(TradePair[17], OP_SELL);
               closeOpenOrders(TradePair[17], OP_BUY);
               ObjectSetInteger(0,button_close_basket_18,OBJPROP_STATE,0);
               ObjectSetString(0,button_close_basket_18,OBJPROP_TEXT,"Close Basket");
               ObjectDelete(button_close_basket_18);         
        }
//--------------------------------------------------------------------------------------------------------
    if(sparam==button_buy_basket_19)
        {
               ObjectSetString(0,button_buy_basket_19,OBJPROP_TEXT,"Buying...");
               ticket=OrderSend(TradePair[18],OP_BUY,lot,MarketInfo(TradePair[18],MODE_ASK),100,0,0,"OFF",Magic_Number,0,Blue);
               ObjectSetInteger(0,button_buy_basket_19,OBJPROP_STATE,0);
               ObjectSetString(0,button_buy_basket_19,OBJPROP_TEXT,"Buy Basket");  
               ObjectDelete(button_buy_basket_19);      
        }
     if(sparam==button_sell_basket_19)
        {
               ObjectSetString(0,button_sell_basket_19,OBJPROP_TEXT,"Selling...");
               ticket=OrderSend(TradePair[18],OP_SELL,lot,MarketInfo(TradePair[18],MODE_BID),100,0,0,"OFF",Magic_Number,0,Red);
               ObjectSetInteger(0,button_sell_basket_19,OBJPROP_STATE,0);
               ObjectSetString(0,button_sell_basket_19,OBJPROP_TEXT,"Sell Basket");
               ObjectDelete(button_sell_basket_19);         
        }
    if(sparam==button_close_basket_19)
        {
               ObjectSetString(0,button_close_basket_19,OBJPROP_TEXT,"Closing...");               
                closeOpenOrders(TradePair[18], OP_SELL);
               closeOpenOrders(TradePair[18], OP_BUY);
               ObjectSetInteger(0,button_close_basket_19,OBJPROP_STATE,0);
               ObjectSetString(0,button_close_basket_19,OBJPROP_TEXT,"Close Basket"); 
               ObjectDelete(button_close_basket_19);       
        }
//--------------------------------------------------------------------------------------------------------
    if(sparam==button_buy_basket_20)
        {
               ObjectSetString(0,button_buy_basket_20,OBJPROP_TEXT,"Buying...");
               ticket=OrderSend(TradePair[19],OP_BUY,lot,MarketInfo(TradePair[19],MODE_ASK),100,0,0,"OFF",Magic_Number,0,Blue);
               ObjectSetInteger(0,button_buy_basket_20,OBJPROP_STATE,0);
               ObjectSetString(0,button_buy_basket_20,OBJPROP_TEXT,"Buy Basket");
               ObjectDelete(button_buy_basket_20);          
        }
     if(sparam==button_sell_basket_20)
        {
               ObjectSetString(0,button_sell_basket_20,OBJPROP_TEXT,"Selling...");
               ticket=OrderSend(TradePair[19],OP_SELL,lot,MarketInfo(TradePair[19],MODE_BID),100,0,0,"OFF",Magic_Number,0,Red);
               ObjectSetInteger(0,button_sell_basket_20,OBJPROP_STATE,0);
               ObjectSetString(0,button_sell_basket_20,OBJPROP_TEXT,"Sell Basket"); 
               ObjectDelete(button_sell_basket_20);        
        }
    if(sparam==button_close_basket_20)
        {
               ObjectSetString(0,button_close_basket_20,OBJPROP_TEXT,"Closing...");               
                closeOpenOrders(TradePair[19], OP_SELL);
               closeOpenOrders(TradePair[19], OP_BUY);
               ObjectSetInteger(0,button_close_basket_20,OBJPROP_STATE,0);
               ObjectSetString(0,button_close_basket_20,OBJPROP_TEXT,"Close Basket"); 
               ObjectDelete(button_close_basket_20);         
        }
//--------------------------------------------------------------------------------------------------------
    if(sparam==button_buy_basket_21)
        {
               ObjectSetString(0,button_buy_basket_21,OBJPROP_TEXT,"Buying...");
               ticket=OrderSend(TradePair[20],OP_BUY,lot,MarketInfo(TradePair[20],MODE_ASK),100,0,0,"OFF",Magic_Number,0,Blue);
               ObjectSetInteger(0,button_buy_basket_21,OBJPROP_STATE,0);
               ObjectSetString(0,button_buy_basket_21,OBJPROP_TEXT,"Buy Basket");
                ObjectDelete(button_buy_basket_21);        
        }
     if(sparam==button_sell_basket_21)
        {
               ObjectSetString(0,button_sell_basket_21,OBJPROP_TEXT,"Selling...");
               ticket=OrderSend(TradePair[20],OP_SELL,lot,MarketInfo(TradePair[20],MODE_BID),100,0,0,"OFF",Magic_Number,0,Red);
               ObjectSetInteger(0,button_sell_basket_21,OBJPROP_STATE,0);
               ObjectSetString(0,button_sell_basket_21,OBJPROP_TEXT,"Sell Basket");
               ObjectDelete(button_sell_basket_21);          
        }
    if(sparam==button_close_basket_21)
        {
               ObjectSetString(0,button_close_basket_21,OBJPROP_TEXT,"Closing...");               
                closeOpenOrders(TradePair[20], OP_SELL);
               closeOpenOrders(TradePair[20], OP_BUY);
               ObjectSetInteger(0,button_close_basket_21,OBJPROP_STATE,0);
               ObjectSetString(0,button_close_basket_21,OBJPROP_TEXT,"Close Basket");
               ObjectDelete(button_close_basket_21);        
        }
//--------------------------------------------------------------------------------------------------------
    if(sparam==button_buy_basket_22)
        {
               ObjectSetString(0,button_buy_basket_22,OBJPROP_TEXT,"Buying...");
               ticket=OrderSend(TradePair[21],OP_BUY,lot,MarketInfo(TradePair[21],MODE_ASK),100,0,0,"OFF",Magic_Number,0,Blue);
               ObjectSetInteger(0,button_buy_basket_22,OBJPROP_STATE,0);
               ObjectSetString(0,button_buy_basket_22,OBJPROP_TEXT,"Buy Basket");
               ObjectDelete(button_buy_basket_22);          
        }
     if(sparam==button_sell_basket_22)
        {
               ObjectSetString(0,button_sell_basket_22,OBJPROP_TEXT,"Selling...");
               ticket=OrderSend(TradePair[21],OP_SELL,lot,MarketInfo(TradePair[21],MODE_BID),100,0,0,"OFF",Magic_Number,0,Red);
               ObjectSetInteger(0,button_sell_basket_22,OBJPROP_STATE,0);
               ObjectSetString(0,button_sell_basket_22,OBJPROP_TEXT,"Sell Basket");  
               ObjectDelete(button_sell_basket_22);      
        }
    if(sparam==button_close_basket_22)
        {
               ObjectSetString(0,button_close_basket_22,OBJPROP_TEXT,"Closing...");               
                closeOpenOrders(TradePair[21], OP_SELL);
               closeOpenOrders(TradePair[21], OP_BUY);
               ObjectSetInteger(0,button_close_basket_22,OBJPROP_STATE,0);
               ObjectSetString(0,button_close_basket_22,OBJPROP_TEXT,"Close Basket"); 
               ObjectDelete(button_close_basket_22);        
        }
//--------------------------------------------------------------------------------------------------------
    if(sparam==button_buy_basket_23)
        {
               ObjectSetString(0,button_buy_basket_23,OBJPROP_TEXT,"Buying...");
               ticket=OrderSend(TradePair[22],OP_BUY,lot,MarketInfo(TradePair[22],MODE_ASK),100,0,0,"OFF",Magic_Number,0,Blue);
               ObjectSetInteger(0,button_buy_basket_23,OBJPROP_STATE,0);
               ObjectSetString(0,button_buy_basket_23,OBJPROP_TEXT,"Buy Basket"); 
               ObjectDelete(button_buy_basket_23);       
        }
     if(sparam==button_sell_basket_23)
        {
               ObjectSetString(0,button_sell_basket_23,OBJPROP_TEXT,"Selling...");
               ticket=OrderSend(TradePair[22],OP_SELL,lot,MarketInfo(TradePair[22],MODE_BID),100,0,0,"OFF",Magic_Number,0,Red);
               ObjectSetInteger(0,button_sell_basket_23,OBJPROP_STATE,0);
               ObjectSetString(0,button_sell_basket_23,OBJPROP_TEXT,"Sell Basket"); 
               ObjectDelete(button_sell_basket_23);      
        }
    if(sparam==button_close_basket_23)
        {
               ObjectSetString(0,button_close_basket_23,OBJPROP_TEXT,"Closing...");               
                closeOpenOrders(TradePair[22], OP_SELL);
               closeOpenOrders(TradePair[22], OP_BUY);
               ObjectSetInteger(0,button_close_basket_23,OBJPROP_STATE,0);
               ObjectSetString(0,button_close_basket_23,OBJPROP_TEXT,"Close Basket"); 
               ObjectDelete(button_close_basket_23);
        }
//--------------------------------------------------------------------------------------------------------
    if(sparam==button_buy_basket_24)
        {
               ObjectSetString(0,button_buy_basket_24,OBJPROP_TEXT,"Buying...");
               ticket=OrderSend(TradePair[23],OP_BUY,lot,MarketInfo(TradePair[23],MODE_ASK),100,0,0,"OFF",Magic_Number,0,Blue);
               ObjectSetInteger(0,button_buy_basket_24,OBJPROP_STATE,0);
               ObjectSetString(0,button_buy_basket_24,OBJPROP_TEXT,"Buy Basket"); 
               ObjectDelete(button_buy_basket_24);                 
        }
     if(sparam==button_sell_basket_24)
        {
               ObjectSetString(0,button_sell_basket_24,OBJPROP_TEXT,"Selling...");
               ticket=OrderSend(TradePair[23],OP_SELL,lot,MarketInfo(TradePair[23],MODE_BID),100,0,0,"OFF",Magic_Number,0,Red);
               ObjectSetInteger(0,button_sell_basket_24,OBJPROP_STATE,0);
               ObjectSetString(0,button_sell_basket_24,OBJPROP_TEXT,"Sell Basket"); 
               ObjectDelete(button_sell_basket_24);         
        }
    if(sparam==button_close_basket_24)
        {
               ObjectSetString(0,button_close_basket_24,OBJPROP_TEXT,"Closing...");               
                closeOpenOrders(TradePair[23], OP_SELL);
               closeOpenOrders(TradePair[23], OP_BUY);
               ObjectSetInteger(0,button_close_basket_24,OBJPROP_STATE,0);
               ObjectSetString(0,button_close_basket_24,OBJPROP_TEXT,"Close Basket"); 
               ObjectDelete(button_close_basket_24);        
        }
//--------------------------------------------------------------------------------------------------------
    if(sparam==button_buy_basket_25)
        {
               ObjectSetString(0,button_buy_basket_25,OBJPROP_TEXT,"Buying...");
               ticket=OrderSend(TradePair[24],OP_BUY,lot,MarketInfo(TradePair[24],MODE_ASK),100,0,0,"OFF",Magic_Number,0,Blue);
               ObjectSetInteger(0,button_buy_basket_25,OBJPROP_STATE,0);
               ObjectSetString(0,button_buy_basket_25,OBJPROP_TEXT,"Buy Basket"); 
               ObjectDelete(button_buy_basket_25);        
        }
     if(sparam==button_sell_basket_25)
        {
               ObjectSetString(0,button_sell_basket_25,OBJPROP_TEXT,"Selling...");
               ticket=OrderSend(TradePair[24],OP_SELL,lot,MarketInfo(TradePair[24],MODE_BID),100,0,0,"OFF",Magic_Number,0,Red);
               ObjectSetInteger(0,button_sell_basket_25,OBJPROP_STATE,0);
               ObjectSetString(0,button_sell_basket_25,OBJPROP_TEXT,"Sell Basket"); 
               ObjectDelete(button_sell_basket_25);      
        }
    if(sparam==button_close_basket_25)
        {
               ObjectSetString(0,button_close_basket_25,OBJPROP_TEXT,"Closing...");               
                closeOpenOrders(TradePair[24], OP_SELL);
               closeOpenOrders(TradePair[24], OP_BUY);
               ObjectSetInteger(0,button_close_basket_25,OBJPROP_STATE,0);
               ObjectSetString(0,button_close_basket_25,OBJPROP_TEXT,"Close Basket"); 
               ObjectDelete(button_close_basket_25);
        }
//--------------------------------------------------------------------------------------------------------
    if(sparam==button_buy_basket_26)
        {
               ObjectSetString(0,button_buy_basket_26,OBJPROP_TEXT,"Buying...");
               ticket=OrderSend(TradePair[25],OP_BUY,lot,MarketInfo(TradePair[25],MODE_ASK),100,0,0,"OFF",Magic_Number,0,Blue);
               ObjectSetInteger(0,button_buy_basket_26,OBJPROP_STATE,0);
               ObjectSetString(0,button_buy_basket_26,OBJPROP_TEXT,"Buy Basket"); 
               ObjectDelete(button_buy_basket_26);                 
        }
     if(sparam==button_sell_basket_26)
        {
               ObjectSetString(0,button_sell_basket_26,OBJPROP_TEXT,"Selling...");
               ticket=OrderSend(TradePair[25],OP_SELL,lot,MarketInfo(TradePair[25],MODE_BID),100,0,0,"OFF",Magic_Number,0,Red);
               ObjectSetInteger(0,button_sell_basket_26,OBJPROP_STATE,0);
               ObjectSetString(0,button_sell_basket_26,OBJPROP_TEXT,"Sell Basket");
                ObjectDelete(button_sell_basket_26);         
        }
    if(sparam==button_close_basket_26)
        {
               ObjectSetString(0,button_close_basket_26,OBJPROP_TEXT,"Closing...");               
                closeOpenOrders(TradePair[25], OP_SELL);
               closeOpenOrders(TradePair[25], OP_BUY);
               ObjectSetInteger(0,button_close_basket_26,OBJPROP_STATE,0);
               ObjectSetString(0,button_close_basket_26,OBJPROP_TEXT,"Close Basket");
               ObjectDelete(button_close_basket_26);          
        }
//--------------------------------------------------------------------------------------------------------
    if(sparam==button_buy_basket_27)
        {
               ObjectSetString(0,button_buy_basket_27,OBJPROP_TEXT,"Buying...");
               ticket=OrderSend(TradePair[26],OP_BUY,lot,MarketInfo(TradePair[26],MODE_ASK),100,0,0,"OFF",Magic_Number,0,Blue);
               ObjectSetInteger(0,button_buy_basket_27,OBJPROP_STATE,0);
               ObjectSetString(0,button_buy_basket_27,OBJPROP_TEXT,"Buy Basket");
                ObjectDelete(button_buy_basket_27);
         }       
     if(sparam==button_sell_basket_27)
        {
               ObjectSetString(0,button_sell_basket_27,OBJPROP_TEXT,"Selling...");
               ticket=OrderSend(TradePair[26],OP_SELL,lot,MarketInfo(TradePair[26],MODE_BID),100,0,0,"OFF",Magic_Number,0,Red);
               ObjectSetInteger(0,button_sell_basket_27,OBJPROP_STATE,0);
               ObjectSetString(0,button_sell_basket_27,OBJPROP_TEXT,"Sell Basket");
               ObjectDelete(button_sell_basket_27);         
        }
    if(sparam==button_close_basket_27)
        {
               ObjectSetString(0,button_close_basket_27,OBJPROP_TEXT,"Closing...");               
                closeOpenOrders(TradePair[26], OP_SELL);
               closeOpenOrders(TradePair[26], OP_BUY);
               ObjectSetInteger(0,button_close_basket_27,OBJPROP_STATE,0);
               ObjectSetString(0,button_close_basket_27,OBJPROP_TEXT,"Close Basket");
               ObjectDelete(button_close_basket_27);         
        }
//--------------------------------------------------------------------------------------------------------
     if(sparam==button_buy_basket_28)
        {
               ObjectSetString(0,button_buy_basket_28,OBJPROP_TEXT,"Buying...");
               ticket=OrderSend(TradePair[27],OP_BUY,lot,MarketInfo(TradePair[27],MODE_ASK),100,0,0,"OFF",Magic_Number,0,Blue);
               ObjectSetInteger(0,button_buy_basket_28,OBJPROP_STATE,0);
               ObjectSetString(0,button_buy_basket_28,OBJPROP_TEXT,"Buy Basket");
               ObjectDelete(button_buy_basket_28);         
        }
     if(sparam==button_sell_basket_28)
        {
               ObjectSetString(0,button_sell_basket_28,OBJPROP_TEXT,"Selling...");
               ticket=OrderSend(TradePair[27],OP_SELL,lot,MarketInfo(TradePair[27],MODE_BID),100,0,0,"OFF",Magic_Number,0,Red);
               ObjectSetInteger(0,button_sell_basket_28,OBJPROP_STATE,0);
               ObjectSetString(0,button_sell_basket_28,OBJPROP_TEXT,"Sell Basket"); 
                ObjectDelete(button_sell_basket_28);         
        }
    if(sparam==button_close_basket_28)
        {
               ObjectSetString(0,button_close_basket_28,OBJPROP_TEXT,"Closing...");               
                closeOpenOrders(TradePair[27], OP_SELL);
               closeOpenOrders(TradePair[27], OP_BUY);
               ObjectSetInteger(0,button_close_basket_28,OBJPROP_STATE,0);
               ObjectSetString(0,button_close_basket_28,OBJPROP_TEXT,"Close Basket"); 
               ObjectDelete(button_close_basket_28);        
        }
//--------------------------------------------------------------------------------------------------------
        
     }
    //--- re-draw property values
   ChartRedraw(); 
     }
//+------------------------------------------------------------------+
//| closeOpenOrders                                                  |
//+------------------------------------------------------------------+
void closeOpenOrders(string currency,int orderType )
{
   
   double close;
   orders = OrdersTotal();
   for(int i=0;i<orders;i++) {
      if(OrderSelect(i, SELECT_BY_POS)==true) {
         if(OrderType() == orderType && OrderSymbol() == currency && orderType == OP_SELL && OrderMagicNumber()==Magic_Number) {
            double ask = MarketInfo(currency,MODE_ASK);
           close= OrderClose(OrderTicket(),OrderLots(),ask,3,Red);
         }
         if(OrderType() == orderType && OrderSymbol() == currency && orderType == OP_BUY && OrderMagicNumber()==Magic_Number) {
            double bid = MarketInfo(currency,MODE_BID);
           close= OrderClose(OrderTicket(),OrderLots(),bid,3,Green);
         }
      }
   }
}
void close_basket()
{ 
  
if (OrdersTotal()==0) return;
for (int i=OrdersTotal()-1; i>=0; i--)
      {//pozicio kivalasztasa
       if (OrderSelect(i, SELECT_BY_POS, MODE_TRADES)==true)//ha kivalasztas ok
            {
            //Print ("order ticket: ", OrderTicket(), "order magic: ", OrderMagicNumber());
            if (OrderType()==0 && OrderMagicNumber()==Magic_Number)
               {//ha long
               ticket=OrderClose(OrderTicket(),OrderLots(), MarketInfo(OrderSymbol(),MODE_BID), 3,Red);
               if (ticket==-1) Print ("Error: ",  GetLastError());
               
               }
            if (OrderType()==1 && OrderMagicNumber()==Magic_Number)
               {//ha short
               ticket=OrderClose(OrderTicket(),OrderLots(), MarketInfo(OrderSymbol(),MODE_ASK), 3,Red);
               if (ticket==-1) Print ("Error: ",  GetLastError());
               
               }  
            }
      }
  
//----
   return;
    
}
//+------------------------------------------------------------------+
void Trades ()
{
   int i, j;
   double totallots=0;
   for(i=0;i<ArraySize(TradePair);i++)
   {
      
      bpos[i]=0;
      spos[i]=0;       
      blots[i]=0;
      slots[i]=0;     
      bprofit[i]=0;
      sprofit[i]=0;
      tprofit[i]=0;
   }
	for(i=0;i<OrdersTotal();i++)
	{
      if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES)==false)
         continue;
         
      for(j=0;j<ArraySize(TradePair);j++)
      {	  
         if((TradePair[j]==OrderSymbol() || TradePair[j]=="") && OrderMagicNumber() == Magic_Number)
         {
            TradePair[j]=OrderSymbol();                       
            tprofit[j]=tprofit[j]+OrderProfit()+OrderSwap()+OrderCommission();
           if(OrderType()==0){ bprofit[j]+=OrderProfit()+OrderSwap()+OrderCommission(); } 
           if(OrderType()==1){ sprofit[j]+=OrderProfit()+OrderSwap()+OrderCommission(); } 
           if(OrderType()==0){ blots[j]+=OrderLots(); } 
           if(OrderType()==1){ slots[j]+=OrderLots(); }
           if(OrderType()==0){ bpos[j]+=+1; } 
           if(OrderType()==1){ spos[j]+=+1; } 
                                
            totallots=totallots+OrderLots();
            break;
	     }
	  }
   }
   }
//+------------------------------------------------------------------+
double TotalProfit ()
{
   double totalprofit=0;
   for(int i=0;i<OrdersTotal();i++) 
   {
      if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES)==false)
         continue;
      if((OrderType()==OP_BUY || OrderType()==OP_SELL) && OrderMagicNumber() == Magic_Number)
          totalprofit=totalprofit+OrderProfit()+OrderCommission()+OrderSwap();
   }
   return (totalprofit);
}
//+------------------------------------------------------------------+   



string open_positions(int type, double lot1, double sl, double tp, int magic=0, double price=0.0, string symb="NONE", string comm="") {
  /* extern */ int Count_Of_Trade_Try=5, //5 ������� ������� �����
                   Pause_Of_Trade_Try=5; //0.5 ������� ����� ���������

  int    i   = 0; //���������� ��� �������� �����
  string text_out="";
  bool MF = MarketInfo(symb,MODE_DIGITS);
  if(symb=="NONE") symb=Symbol();
  if(type==0)
    price=NormalizeDouble(MarketInfo(symb,MODE_ASK),MF ); //���� �������� ��� �������
  if(type==1)
    price=NormalizeDouble(MarketInfo(symb,MODE_BID),MF); //���� �������� ��� ������

  while(i<=Count_Of_Trade_Try) {
    //���� ������ �������� ������ (����������). ��� �������� ���������� ��������� ��������� �� ������ ������:
    ticket = OrderSend(symb,                      //������
                           type,                          //��� ������
                           lot,                           //�����
                           NormalizeDouble(price,Digits), //���� ��������
                           Slipage,                       //������� ����������� �������
                           NormalizeDouble(sl,Digits),    //�������� Stop Loss
                           NormalizeDouble(tp,Digits),    //�������� Take Profit
                           comm,                          //����������� ������
                           magic,                         //���������� �����
                           0,                             //���� ��������� (������������ ��� ���������� �������)
                           CLR_NONE);                     //���� ������������ ������� �� ������� (CLR_NONE - ������� �� ��������)
    if(ticket!=-1) { //���� �������� ��������� �������, �� ������� �� �����
      text_out=StringConcatenate("Open OK: ",int_to_type(type),"; price: ",DoubleToStr(price,Digits),"; sl: ",DoubleToStr(sl,Digits),"; tp: ",DoubleToStr(tp,Digits),"; ");
      break;
     }  
    int err = GetLastError(); //��� ��������� ������  
    if(err!=0) {
      Print("������ ��������: "+Market_Err_To_Str(err),"; ���: ",type,"; Ask|Bid ",Ask,"|",Bid,"; price: ",price,"; sl: ",sl,"; tp: ",tp);
      text_out=StringConcatenate("Error: ",int_to_type(type)," : ",Market_Err_To_Str(err),"; ");
    }  
    i++;
    Sleep(Pause_Of_Trade_Try*100); //� ������ ������ ������ ����� ����� ����� ��������
  } //end while(i<=count)
  return(text_out);
} //end void open_positions(int signal, double lot, double price=0.0, string symb="NONE")

//+-------------------------------------------------------------------------------------------------------------------+
string int_to_type(int type) 
{
  switch(type) {
    case 0: return("BUY");
    case 1: return("SELL");
    case 2: return("BUY LIMIT");
    case 3: return("SELL LIMIT");
    case 4: return("BUY STOP");
    case 5: return("SELL STOP");
  }
  return("BUY");
}
//+-------------------------------------------------------------------------------------------------------+

string Market_Err_To_Str(int err) {
   string error_string;
//----
   switch(err)
     {
      //---- codes returned from trade server
      case 0:
      case 1:   error_string="no error";                                                  break;
      case 2:   error_string="common error";                                              break;
      case 3:   error_string="invalid trade parameters";                                  break;
      case 4:   error_string="trade server is busy";                                      break;
      case 5:   error_string="old version of the client terminal";                        break;
      case 6:   error_string="no connection with trade server";                           break;
      case 7:   error_string="not enough rights";                                         break;
      case 8:   error_string="too frequent requests";                                     break;
      case 9:   error_string="malfunctional trade operation (never returned error)";      break;
      case 64:  error_string="account disabled";                                          break;
      case 65:  error_string="invalid account";                                           break;
      case 128: error_string="trade timeout";                                             break;
      case 129: error_string="invalid price";                                             break;
      case 130: error_string="invalid stops";                                             break;
      case 131: error_string="invalid trade volume";                                      break;
      case 132: error_string="market is closed";                                          break;
      case 133: error_string="trade is disabled";                                         break;
      case 134: error_string="not enough money";                                          break;
      case 135: error_string="price changed";                                             break;
      case 136: error_string="off quotes";                                                break;
      case 137: error_string="broker is busy (never returned error)";                     break;
      case 138: error_string="requote";                                                   break;
      case 139: error_string="order is locked";                                           break;
      case 140: error_string="long positions only allowed";                               break;
      case 141: error_string="too many requests";                                         break;
      case 145: error_string="modification denied because order too close to market";     break;
      case 146: error_string="trade context is busy";                                     break;
      case 147: error_string="expirations are denied by broker";                          break;
      case 148: error_string="amount of open and pending orders has reached the limit";   break;
      case 149: error_string="hedging is prohibited";                                     break;
      case 150: error_string="prohibited by FIFO rules";                                  break;
      //---- mql4 errors
      case 4000: error_string="no error (never generated code)";                          break;
      case 4001: error_string="wrong function pointer";                                   break;
      case 4002: error_string="array index is out of range";                              break;
      case 4003: error_string="no memory for function call stack";                        break;
      case 4004: error_string="recursive stack overflow";                                 break;
      case 4005: error_string="not enough stack for parameter";                           break;
      case 4006: error_string="no memory for parameter string";                           break;
      case 4007: error_string="no memory for temp string";                                break;
      case 4008: error_string="not initialized string";                                   break;
      case 4009: error_string="not initialized string in array";                          break;
      case 4010: error_string="no memory for array\' string";                             break;
      case 4011: error_string="too long string";                                          break;
      case 4012: error_string="remainder from zero divide";                               break;
      case 4013: error_string="zero divide";                                              break;
      case 4014: error_string="unknown command";                                          break;
      case 4015: error_string="wrong jump (never generated error)";                       break;
      case 4016: error_string="not initialized array";                                    break;
      case 4017: error_string="dll calls are not allowed";                                break;
      case 4018: error_string="cannot load library";                                      break;
      case 4019: error_string="cannot call function";                                     break;
      case 4020: error_string="expert function calls are not allowed";                    break;
      case 4021: error_string="not enough memory for temp string returned from function"; break;
      case 4022: error_string="system is busy (never generated error)";                   break;
      case 4050: error_string="invalid function parameters count";                        break;
      case 4051: error_string="invalid function parameter value";                         break;
      case 4052: error_string="string function internal error";                           break;
      case 4053: error_string="some array error";                                         break;
      case 4054: error_string="incorrect series array using";                             break;
      case 4055: error_string="custom indicator error";                                   break;
      case 4056: error_string="arrays are incompatible";                                  break;
      case 4057: error_string="global variables processing error";                        break;
      case 4058: error_string="global variable not found";                                break;
      case 4059: error_string="function is not allowed in testing mode";                  break;
      case 4060: error_string="function is not confirmed";                                break;
      case 4061: error_string="send mail error";                                          break;
      case 4062: error_string="string parameter expected";                                break;
      case 4063: error_string="integer parameter expected";                               break;
      case 4064: error_string="double parameter expected";                                break;
      case 4065: error_string="array as parameter expected";                              break;
      case 4066: error_string="requested history data in update state";                   break;
      case 4099: error_string="end of file";                                              break;
      case 4100: error_string="some file error";                                          break;
      case 4101: error_string="wrong file name";                                          break;
      case 4102: error_string="too many opened files";                                    break;
      case 4103: error_string="cannot open file";                                         break;
      case 4104: error_string="incompatible access to a file";                            break;
      case 4105: error_string="no order selected";                                        break;
      case 4106: error_string="unknown symbol";                                           break;
      case 4107: error_string="invalid price parameter for trade function";               break;
      case 4108: error_string="invalid ticket";                                           break;
      case 4109: error_string="trade is not allowed in the expert properties";            break;
      case 4110: error_string="longs are not allowed in the expert properties";           break;
      case 4111: error_string="shorts are not allowed in the expert properties";          break;
      case 4200: error_string="object is already exist";                                  break;
      case 4201: error_string="unknown object property";                                  break;
      case 4202: error_string="object is not exist";                                      break;
      case 4203: error_string="unknown object type";                                      break;
      case 4204: error_string="no object name";                                           break;
      case 4205: error_string="object coordinates error";                                 break;
      case 4206: error_string="no specified subwindow";                                   break;
      default:   error_string="unknown error";
     }
//----
   return(error_string);
} //end string Err_To_Str(int err)


//+-------------------------------------------------------------------------------------------------------------------+
//|                                        ������� ������ ������� ������� ����                                        |
bool find_orders(int magic=-1, int type=-1, string symb="NULL") {
  /* ���������� ������, ���� ������ ���� �� ���� ����� ������� ���� � ������ ���������� ������� �� ������� ������� */
  for (int i=OrdersTotal()-1; i>=0; i--) {
    if(!OrderSelect(i,SELECT_BY_POS,MODE_TRADES)) continue;
    if(((OrderType()==type) || (type==-1))
       && ((OrderMagicNumber()==magic) || (magic==-1))
       && ((OrderSymbol()==symb || (symb=="NONE")))) {
      return(true);
      break;
    } //end if((OrderType()==type) && (OrderMagicNumber()==magic) && (OrderSymbol()==Symbol()))
  } //end for (int i2=OrdersTotal()-1; i2>=0; i2--)

  return(false); //���������� false
} //end bool find_orders(int magic, int type)
//|                                        ������� ������ ������� ������� ����                                        |
//+-------------------------------------------------------------------------------------------------------------------+
        
