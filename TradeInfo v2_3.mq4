//+------------------------------------------------------------------+
//|                                           TradingInfoDisplay.mq4 |
//|                                        Copyright © 2011, tigpips |
//|                                                                  |
//+------------------------------------------------------------------+
#property copyright "Copyright © 2011, tigpips"
#property link      ""

#property description "edited2 by eevviill"
#property description "view,main settings"


extern string ma_set = "////////Main settings///////";
extern bool show_only_current_symbol = true;
extern bool show_only_current_magic = false;
extern int current_magic = 0;

extern string vi_set = "////////View settings///////";
extern string font_type = "Arial";
extern int size = 12;
extern int X_plus = 0;
extern int Y_plus = 0;

string sellsymbol;
double sellprice;
double selllots;
double sellpips;
double sellprofit;

string buysymbol;
double buyprice;
double buylots;
double buypips;
double buyprofit;

#property indicator_chart_window

int init()
  {
   ObjectCreate("Main_Info_Display", OBJ_LABEL, 0, 0, 0);
   ObjectSet("Main_Info_Display", OBJPROP_XDISTANCE,X_plus+ 10);
   ObjectSet("Main_Info_Display", OBJPROP_YDISTANCE,Y_plus+ 15);
   ObjectSetText("Main_Info_Display","Generating Data... please wait",size+4,font_type,Green);   
   
   ObjectCreate("lbl_Sell_Symbol", OBJ_LABEL, 0, 0, 0);
   ObjectSet("lbl_Sell_Symbol", OBJPROP_XDISTANCE,X_plus+ 10);
   ObjectSet("lbl_Sell_Symbol", OBJPROP_YDISTANCE,Y_plus+ 15);   
   ObjectSetText("lbl_Sell_Symbol","",size,font_type,Black);   
   
   ObjectCreate("lbl_Sell_Price", OBJ_LABEL, 0, 0, 0);
   ObjectSet("lbl_Sell_Price", OBJPROP_XDISTANCE,X_plus+ 150);
   ObjectSet("lbl_Sell_Price", OBJPROP_YDISTANCE,Y_plus+ 15);
   ObjectSetText("lbl_Sell_Price","",size,font_type,Black);

   ObjectCreate("lbl_Sell_Lots1", OBJ_LABEL, 0, 0, 0);
   ObjectSet("lbl_Sell_Lots1", OBJPROP_XDISTANCE,X_plus+ 10);
   ObjectSet("lbl_Sell_Lots1", OBJPROP_YDISTANCE,Y_plus+ 35);
   ObjectSetText("lbl_Sell_Lots1","",size,font_type,Black);
         
   ObjectCreate("lbl_Sell_Lots2", OBJ_LABEL, 0, 0, 0);
   ObjectSet("lbl_Sell_Lots2", OBJPROP_XDISTANCE,X_plus+ 50);
   ObjectSet("lbl_Sell_Lots2", OBJPROP_YDISTANCE,Y_plus+ 35);
   ObjectSetText("lbl_Sell_Lots2","",size,font_type,Black);
      
   ObjectCreate("lbl_Sell_Pips1", OBJ_LABEL, 0, 0, 0);
   ObjectSet("lbl_Sell_Pips1", OBJPROP_XDISTANCE,X_plus+ 10);
   ObjectSet("lbl_Sell_Pips1", OBJPROP_YDISTANCE,Y_plus+ 55);
   ObjectSetText("lbl_Sell_Pips1","",size,font_type,Black);
   
   ObjectCreate("lbl_Sell_Pips2", OBJ_LABEL, 0, 0, 0);  
   ObjectSet("lbl_Sell_Pips2", OBJPROP_XDISTANCE,X_plus+ 50);
   ObjectSet("lbl_Sell_Pips2", OBJPROP_YDISTANCE,Y_plus+ 55);
   ObjectSetText("lbl_Sell_Pips2","",size,font_type,Black);    
   
   ObjectCreate("lbl_Sell_Profit1", OBJ_LABEL, 0, 0, 0);
   ObjectSet("lbl_Sell_Profit1", OBJPROP_XDISTANCE,X_plus+ 10);
   ObjectSet("lbl_Sell_Profit1", OBJPROP_YDISTANCE,Y_plus+ 75);
   ObjectSetText("lbl_Sell_Profit1","",size,font_type,Black);  

   ObjectCreate("lbl_Sell_Profit2", OBJ_LABEL, 0, 0, 0);
   ObjectSet("lbl_Sell_Profit2", OBJPROP_XDISTANCE,X_plus+ 50);
   ObjectSet("lbl_Sell_Profit2", OBJPROP_YDISTANCE,Y_plus+ 75);
   ObjectSetText("lbl_Sell_Profit2","",size,font_type,Black);  
  
   ObjectCreate("lbl_Buy_Symbol", OBJ_LABEL, 0, 0, 0);
   ObjectSet("lbl_Buy_Symbol", OBJPROP_XDISTANCE,X_plus+ 10);
   ObjectSet("lbl_Buy_Symbol", OBJPROP_YDISTANCE,Y_plus+ 105);   
   ObjectSetText("lbl_Buy_Symbol","",size,font_type,Black);
      
   ObjectCreate("lbl_Buy_Price", OBJ_LABEL, 0, 0, 0);
   ObjectSet("lbl_Buy_Price", OBJPROP_XDISTANCE,X_plus+ 150);
   ObjectSet("lbl_Buy_Price", OBJPROP_YDISTANCE,Y_plus+ 105);
   ObjectSetText("lbl_Buy_Price","",size,font_type,Black);
      
   ObjectCreate("lbl_Buy_Lots1", OBJ_LABEL, 0, 0, 0);
   ObjectSet("lbl_Buy_Lots1", OBJPROP_XDISTANCE,X_plus+ 10);
   ObjectSet("lbl_Buy_Lots1", OBJPROP_YDISTANCE,Y_plus+ 125);
   ObjectSetText("lbl_Buy_Lots1","",size,font_type,Black);
         
   ObjectCreate("lbl_Buy_Lots2", OBJ_LABEL, 0, 0, 0);
   ObjectSet("lbl_Buy_Lots2", OBJPROP_XDISTANCE,X_plus+ 50);
   ObjectSet("lbl_Buy_Lots2", OBJPROP_YDISTANCE,Y_plus+ 125);
   ObjectSetText("lbl_Buy_Lots2","",size,font_type,Black);
   
   ObjectCreate("lbl_Buy_Pips1", OBJ_LABEL, 0, 0, 0);
   ObjectSet("lbl_Buy_Pips1", OBJPROP_XDISTANCE,X_plus+ 10);
   ObjectSet("lbl_Buy_Pips1", OBJPROP_YDISTANCE,Y_plus+ 145);
   ObjectSetText("lbl_Buy_Pips1","",size,font_type,Black);
   
   ObjectCreate("lbl_Buy_Pips2", OBJ_LABEL, 0, 0, 0);  
   ObjectSet("lbl_Buy_Pips2", OBJPROP_XDISTANCE,X_plus+ 50);
   ObjectSet("lbl_Buy_Pips2", OBJPROP_YDISTANCE,Y_plus+ 145);
   ObjectSetText("lbl_Buy_Pips2","",size,font_type,Black);    
   
   ObjectCreate("lbl_Buy_Profit1", OBJ_LABEL, 0, 0, 0);
   ObjectSet("lbl_Buy_Profit1", OBJPROP_XDISTANCE,X_plus+ 10);
   ObjectSet("lbl_Buy_Profit1", OBJPROP_YDISTANCE,Y_plus+ 165);
   ObjectSetText("lbl_Buy_Profit1","",size,font_type,Black);  

   ObjectCreate("lbl_Buy_Profit2", OBJ_LABEL, 0, 0, 0);
   ObjectSet("lbl_Buy_Profit2", OBJPROP_XDISTANCE,X_plus+ 50);
   ObjectSet("lbl_Buy_Profit2", OBJPROP_YDISTANCE,Y_plus+ 165);
   ObjectSetText("lbl_Buy_Profit2","",size,font_type,Black); 
   
   return(0);
  }

int deinit()
  {
   ObjectsDeleteAll();

   return(0);
  }

int start()
  {
   int    counted_bars=IndicatorCounted();
   RefreshRates();
   sellsymbol = "";
   buysymbol = "";
   CheckTradeInfo();
   if(sellsymbol != "")
   {

      ObjectSetText("Main_Info_Display","",size+4,font_type,Black);  
      ObjectSetText("lbl_Sell_Symbol","Sell "+sellsymbol+" @ ",14,font_type,Black);  
      ObjectSetText("lbl_Sell_Price",DoubleToStr(sellprice,Digits),14,font_type,Black);      
      
      ObjectSetText("lbl_Sell_Lots1","Lots ",size,font_type,MediumBlue);       
      ObjectSetText("lbl_Sell_Lots2",DoubleToStr(selllots,2),size,font_type,Black);       

      ObjectSetText("lbl_Sell_Pips1","Pips ",size,font_type,MediumBlue);       
      if(sellpips > 0)
      {
         ObjectSetText("lbl_Sell_Pips2","+"+DoubleToStr(sellpips/10,1),size,font_type,Green);             
      }
      else if(sellpips < 0)
      {
         ObjectSetText("lbl_Sell_Pips2",DoubleToStr(sellpips/10,1),size,font_type,Red);
      }
      else
      {
         ObjectSetText("lbl_Sell_Pips2",DoubleToStr(sellpips/10,1),size,font_type,MediumBlue);
      }
      
      ObjectSetText("lbl_Sell_Profit1","Profit ",size,font_type,MediumBlue);       
      if(sellprofit > 0)
      {
         ObjectSetText("lbl_Sell_Profit2","+"+DoubleToStr(sellprofit,2),size,font_type,Green);             
      }
      else if(sellprofit < 0)
      {
         ObjectSetText("lbl_Sell_Profit2",DoubleToStr(sellprofit,2),size,font_type,Red);
      }
      else
      {
         ObjectSetText("lbl_Sell_Profit2",DoubleToStr(sellprofit,2),size,font_type,MediumBlue);
      }      
   }
   else if(sellsymbol == "")
   {
      ObjectSetText("lbl_Sell_Symbol","",size,font_type,Black);
      ObjectSetText("lbl_Sell_Price","",size,font_type,Black);
      ObjectSetText("lbl_Sell_Lots1","",size,font_type,Black);
      ObjectSetText("lbl_Sell_Lots2","",size,font_type,Black);
      ObjectSetText("lbl_Sell_Pips1","",size,font_type,Black);
      ObjectSetText("lbl_Sell_Pips2","",size,font_type,Black);
      ObjectSetText("lbl_Sell_Profit1","",size,font_type,Black);
      ObjectSetText("lbl_Sell_Profit2","",size,font_type,Black);
   }
   
   if(buysymbol != "")
   {
      ObjectSetText("Main_Info_Display","",size+4,font_type,Green);  
      ObjectSetText("lbl_Buy_Symbol","Buy "+buysymbol+" @ ",14,font_type,Green);  
      ObjectSetText("lbl_Buy_Price",DoubleToStr(buyprice,Digits),14,font_type,Black);      
      
      ObjectSetText("lbl_Buy_Lots1","Lots ",size,font_type,MediumBlue);       
      ObjectSetText("lbl_Buy_Lots2",DoubleToStr(buylots,2),size,font_type,Black);       

      ObjectSetText("lbl_Buy_Pips1","Pips ",size,font_type,MediumBlue);       
      if(buypips > 0)
      {
         ObjectSetText("lbl_Buy_Pips2","+"+DoubleToStr(buypips/10,1),size,font_type,Green);             
      }
      else if(buypips < 0)
      {
         ObjectSetText("lbl_Buy_Pips2",DoubleToStr(buypips/10,1),size,font_type,Red);
      }
      else
      {
         ObjectSetText("lbl_Buy_Pips2",DoubleToStr(buypips/10,1),size,font_type,MediumBlue);
      }
      
      ObjectSetText("lbl_Buy_Profit1","Profit ",size,font_type,MediumBlue);       
      if(buyprofit > 0)
      {
         ObjectSetText("lbl_Buy_Profit2","+"+DoubleToStr(buyprofit,2),size,font_type,Green);             
      }
      else if(buyprofit < 0)
      {
         ObjectSetText("lbl_Buy_Profit2",DoubleToStr(buyprofit,2),size,font_type,Red);
      }
      else
      {
         ObjectSetText("lbl_Buy_Profit2",DoubleToStr(buyprofit,2),size,font_type,MediumBlue);
      }        
   }
   else if(buysymbol == "")
   {
      ObjectSetText("lbl_Buy_Symbol","",size,font_type,Black);
      ObjectSetText("lbl_Buy_Price","",size,font_type,Black);
      ObjectSetText("lbl_Buy_Lots1","",size,font_type,Black);
      ObjectSetText("lbl_Buy_Lots2","",size,font_type,Black);
      ObjectSetText("lbl_Buy_Pips1","",size,font_type,Black);
      ObjectSetText("lbl_Buy_Pips2","",size,font_type,Black);
      ObjectSetText("lbl_Buy_Profit1","",size,font_type,Black);
      ObjectSetText("lbl_Buy_Profit2","",size,font_type,Black);
   }


   return(0);
  }
//+------------------------------------------------------------------+
void CheckTradeInfo()
{
   for (int cnt = OrdersTotal()-1 ; cnt >= 0; cnt--) 
   { 
      if(!OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES)) continue;
      if((show_only_current_symbol && OrderSymbol()!=Symbol()) || (show_only_current_magic && OrderMagicNumber()!=current_magic)) continue;
      if (OrderCloseTime()==0) 
      { 
            if(OrderType()==OP_SELL)  
            {
               sellsymbol = OrderSymbol();
               sellprice = OrderOpenPrice();
               selllots = OrderLots();
               sellpips = ( OrderProfit() - OrderCommission() ) / OrderLots() / MarketInfo( OrderSymbol(), MODE_TICKVALUE );
               sellprofit = OrderProfit()+OrderCommission()+OrderSwap();
            }
            else if(OrderType()==OP_BUY)
            {
               buysymbol = OrderSymbol();
               buyprice = OrderOpenPrice();
               buylots = OrderLots();
               buypips = ( OrderProfit() - OrderCommission() ) / OrderLots() / MarketInfo( OrderSymbol(), MODE_TICKVALUE );
               buyprofit = OrderProfit()+OrderCommission()+OrderSwap();
            }           
      } 
   } 
}