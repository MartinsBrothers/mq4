//+------------------------------------------------------------------+
//|                    89.cm_ea_Hedge3_30.07.13(trueforex.pp.ua).mq4 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+                 |
//|                              Copyright © 2013, Khlistov Vladimir |
//|                                         http://cmillion.narod.ru |
//+------------------------------------------------------------------+
#property copyright "Copyright © 2013, Khlistov Vladimir"
#property link      "http://cmillion.narod.ru"
#property strict
#property description "Advisor arbitragem  cm_ea_Hedge3 - exposes three orders for three currency pairs, if for all specified pairs there are no open positions. (Can be used as an Expert Advisor). Work: When starting, it checks to see if there are open positions for the pairs specified in the settings and if there is at least one that stops working. If there are no open positions, then it exposes them. The difference between the work of the script and the advisor is that the script will do it 1 time, and the adviser will constantly monitor the situation on open positions on every tick"

//+------------------------------------------------------------------+
extern string  SYMBOL1        = "GBPUSD"; //the first character, if not specified, is not set 
extern string  SYMBOL2        = "EURUSD"; //the second character, if it is not specified, it is not set 
extern string  SYMBOL3        = "EURGBP"; //the third character, if not specified, is not set 
extern double  LOT1           = 0.1;      //lot of the first tool 
extern double  LOT2           = 0.1;      //the lot of the second tool 
extern double  LOT3           = 0.1;      //the lot of the third tool 
extern int     TYPE1          = OP_BUY;   //the order type of the first tool 
extern int     TYPE2          = OP_SELL;  //the order type of the second tool 
extern int     TYPE3          = OP_SELL;  //type of the order of the third tool 
extern int     stoploss       = 10,       //level of the SL, if 0 , then SL is not set to 
               takeprofit     = 10;       //level of TP setting , if 0 , then TP is not set
extern int     Slippage       = 3;        //slippage 
extern int     Magic          = 777888;
//+------------------------------------------------------------------+
int start()
{
   string s;
   for (int i=0; i<OrdersTotal(); i++)
   {    
      if (OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
      { 
         s = OrderSymbol();
         if (s==SYMBOL1 || s==SYMBOL2 || s==SYMBOL3) return(0);
      }
   } 
   int    Digit=MarketInfo(SYMBOL1,MODE_DIGITS);
   double Poin=MarketInfo(SYMBOL1,MODE_POINT);
   double ASK=NormalizeDouble(MarketInfo(SYMBOL1,MODE_ASK),Digit);
   double BID=NormalizeDouble(MarketInfo(SYMBOL1,MODE_BID),Digit);
   double SL,TP;
   if (SYMBOL1!="")
   {
      if (TYPE1 == OP_BUY)  
      {
         if (stoploss!=0)   SL  = NormalizeDouble(BID - stoploss*Poin,Digit); else SL=0;     
         if (takeprofit!=0) TP  = NormalizeDouble(ASK + takeprofit*Poin,Digit); else TP=0;
         if (OrderSend(SYMBOL1,OP_BUY,LOT1,ASK,Slippage,SL,TP,"cm_script_Hedge",Magic,0,Blue)!=-1) 
            Alert("Îðäåð BUY  ëîò ",LOT1," ", SYMBOL1);
         else Alert(SYMBOL1," send order BAY error ",GetLastError(),"  ",MarketInfo(SYMBOL1,MODE_ASK),"  ",LOT1);
      }
      if (TYPE1 == OP_SELL)  
      {
         if (stoploss!=0)   SL  = NormalizeDouble(ASK + stoploss*Poin,Digit); else SL=0;     
         if (takeprofit!=0) TP  = NormalizeDouble(BID - takeprofit*Poin,Digit); else TP=0;
         if (OrderSend(SYMBOL1,OP_SELL,LOT1,BID,Slippage,SL,TP,"cm_script_Hedge",Magic,0,Blue)!=-1) 
            Alert("Îðäåð SELL  ëîò ",LOT1," ", SYMBOL1);
         else Alert(SYMBOL1," send order SELL error ",GetLastError(),"  ",MarketInfo(SYMBOL1,MODE_ASK),"  ",LOT1);
      }
   }
   if (SYMBOL2!="")
   {
      Digit=MarketInfo(SYMBOL2,MODE_DIGITS);
      Poin=MarketInfo(SYMBOL2,MODE_POINT);
      ASK=NormalizeDouble(MarketInfo(SYMBOL2,MODE_ASK),Digit);
      BID=NormalizeDouble(MarketInfo(SYMBOL2,MODE_BID),Digit);
      if (TYPE2 == OP_BUY)  
      {
         if (stoploss!=0)   SL  = NormalizeDouble(BID - stoploss*Poin,Digit); else SL=0;     
         if (takeprofit!=0) TP  = NormalizeDouble(ASK + takeprofit*Poin,Digit); else TP=0;
         if (OrderSend(SYMBOL2,OP_BUY,LOT2,ASK,Slippage,SL,TP,"cm_script_Hedge",Magic,0,Blue)!=-1) 
            Alert("Îðäåð BUY  ëîò ",LOT2," ", SYMBOL2);
         else Alert(SYMBOL2," send order BAY error ",GetLastError(),"  ",MarketInfo(SYMBOL2,MODE_ASK),"  ",LOT2);
      }
      if (TYPE2 == OP_SELL)  
      {
         if (stoploss!=0)   SL  = NormalizeDouble(ASK + stoploss*Poin,Digit); else SL=0;     
         if (takeprofit!=0) TP  = NormalizeDouble(BID - takeprofit*Poin,Digit); else TP=0;
         if (OrderSend(SYMBOL2,OP_SELL,LOT2,BID,Slippage,SL,TP,"cm_script_Hedge",Magic,0,Blue)!=-1) 
            Alert("Îðäåð SELL  ëîò ",LOT2," ", SYMBOL2);
         else Alert(SYMBOL2," send order SELL error ",GetLastError(),"  ",MarketInfo(SYMBOL2,MODE_ASK),"  ",LOT2);
      }
   }
   if (SYMBOL3!="")
   {
      Digit=MarketInfo(SYMBOL3,MODE_DIGITS);
      Poin=MarketInfo(SYMBOL3,MODE_POINT);
      ASK=NormalizeDouble(MarketInfo(SYMBOL3,MODE_ASK),Digit);
      BID=NormalizeDouble(MarketInfo(SYMBOL3,MODE_BID),Digit);
      if (TYPE3 == OP_BUY)  
      {
         if (stoploss!=0)   SL  = NormalizeDouble(BID - stoploss*Poin,Digit); else SL=0;     
         if (takeprofit!=0) TP  = NormalizeDouble(ASK + takeprofit*Poin,Digit); else TP=0;
         if (OrderSend(SYMBOL3,OP_BUY,LOT3,ASK,Slippage,SL,TP,"cm_script_Hedge",Magic,0,Blue)!=-1) 
            Alert("Îðäåð BUY  ëîò ",LOT3," ", SYMBOL3);
         else Alert(SYMBOL3," send order BAY error ",GetLastError(),"  ",MarketInfo(SYMBOL3,MODE_ASK),"  ",LOT3);
      }
      if (TYPE3 == OP_SELL)  
      {
         if (stoploss!=0)   SL  = NormalizeDouble(ASK + stoploss*Poin,Digit); else SL=0;     
         if (takeprofit!=0) TP  = NormalizeDouble(BID - takeprofit*Poin,Digit); else TP=0;
         if (OrderSend(SYMBOL3,OP_SELL,LOT3,BID,Slippage,SL,TP,"cm_script_Hedge",Magic,0,Blue)!=-1) 
            Alert("Îðäåð SELL  ëîò ",LOT3," ", SYMBOL3);
         else Alert(SYMBOL3," send order SELL error ",GetLastError(),"  ",MarketInfo(SYMBOL3,MODE_ASK),"  ",LOT3);
      }
   }
return(0);
} 
//--------------------------------------------------------------------


        
