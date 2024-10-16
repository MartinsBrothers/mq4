//+------------------------------------------------------------------+
//|                                    Pipsometer Cash+Infolines.mq4 |
//+------------------------------------------------------------------+
#property copyright   "© Indalico 03/07/2020"
#property link        "http://www.mql4.com"
#property description "Free software, can be freely used, copied or modified."
#property description "Software libre, puede ser usado, copiado o modificado libremente."
#property description "-----------------------------------------------------------------------------------------------------------------------"
#property description "El indicador cuenta las ganancias/pérdidas en pips, las ganancias/pérdidas"
#property description "flotantes y cerradas en cash, y además también muestra unas líneas con el precio"
#property description "de entrada, stoploss y takeprofit junto a una etiqueta de texto con lotes y pips."
#property indicator_chart_window

extern bool   DisplayInfoLines   = true;
extern bool   DisplayCashProfit  = true;
extern color  BuyOpenLineColor   = clrLime;
extern color  SellOpenLineColor  = clrRed;
extern color  ProfitLineColor    = clrNavy;
extern color  StopLineColor      = clrDeepPink;

extern string IndicatorPosition  = "----- Where to locate the indicator options -----";
extern int    WhereToDisplay     = 0;
extern ENUM_BASE_CORNER Corner   = CORNER_RIGHT_LOWER;
extern int    Yposition          = 10;
extern int    Xposition          = 5;
extern int    Ystep              = 18;
extern int    CounterFontSize    = 10;
extern int    LineTextFontSize   = 10;
extern double VerticalTextGap    = 1;
extern int    HorizontalTextGap  = 14;

double k,cen,pips,cash,done,BuyPrice,SelPrice,stop,take;
int    i,OpenBuys,OpenSels,OpenTrades;
datetime TextTime;

//-------------------------------------------------------------------

int deinit()
{
   DeleteAll();
   ObjectDelete("ShwMagic"); ObjectDelete("Pips");
   ObjectDelete("Float");    ObjectDelete("Done");
   return(0);
}
   
//-------------------------------------------------------------------

int init()
{
   if(Digits==5) k=0.0001; if(Digits==4) k=0.001; if(Digits==3) k=0.01; if(Digits==2) k=0.1; if(Digits==1 || Digits==0 ) k=1;
   
   if(DisplayCashProfit)
      {
         DisplayLabel("Done",0,CounterFontSize,"Arial",clrLime,"Closed: "+DoubleToStr(done,2));
         DisplayLabel("Float",Ystep,CounterFontSize,"Arial",clrLime,"Floating: "+DoubleToStr(cash,2));
         DisplayLabel("Pips",Ystep*2,CounterFontSize,"Arial",clrLime,"0.0");
      }
   else {DisplayLabel("Pips",0,CounterFontSize,"Arial",0,"");}
   return(0);
}

//------------------------------------------------------------------------------

int start()
{
   TextTime=TimeCurrent()+HorizontalTextGap*Period()*60;
   pips=0; cash=0; OpenTrades=0; OpenBuys=0; OpenSels=0;
   
   for(i=0; i < OrdersTotal(); i++)
      {
         if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES)==false) break;
         if(OrderSymbol() != Symbol()) continue;
         if(OrderType()==OP_BUY) {pips += Bid-OrderOpenPrice(); cash += OrderProfit()+OrderCommission(); OpenTrades++;}
         if(OrderType()==OP_SELL){pips += OrderOpenPrice()-Ask; cash += OrderProfit()+OrderCommission(); OpenTrades++;}
      }

   if(pips>0) ObjectSetText("Pips", DoubleToStr(pips/k,1),CounterFontSize*2,"Arial Bold",clrLime);
   else       ObjectSetText("Pips", DoubleToStr(pips/k,1),CounterFontSize*2,"Calibri Bold",clrRed);
   
   if(DisplayCashProfit)
      {
         if(cash>0) ObjectSetText("Float","Floating: "+DoubleToStr(cash,2),CounterFontSize,"Arial",clrLime);
         else       ObjectSetText("Float","Floating: "+DoubleToStr(cash,2),CounterFontSize,"Arial",clrRed);
      }

   //------------------ Draw info lines and text for open positions ------------------------------
   
   if(DisplayInfoLines) 
      {
         if(OpenTrades != 0)
            {
               for(i=0; i < OrdersTotal(); i++)
                  {
                     if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES)==false) break;
                     if(OrderSymbol() != Symbol()) continue;
         
                     //------------------ Draw lines on longs ---------------------------------------
                      
                     if(OrderType() == OP_BUY)
                        {
                           OpenBuys++; BuyPrice=OrderOpenPrice();
                           if(OpenBuys==2) BuyPrice=BuyPrice-VerticalTextGap; else if(OpenBuys==3) BuyPrice=BuyPrice-(2*VerticalTextGap);
                           else if(OpenBuys==4) BuyPrice=BuyPrice-(3*VerticalTextGap); else if(OpenBuys==5) BuyPrice=BuyPrice-(4*VerticalTextGap);
                            
                           ObjectCreate("OpenLine"+i,OBJ_HLINE,0,0,OrderOpenPrice());
                           ObjectSet   ("OpenLine"+i,OBJPROP_COLOR,BuyOpenLineColor);
                           
                           ObjectCreate ("OpenText"+i,OBJ_TEXT,0,TextTime,BuyPrice);
                           ObjectSetText("OpenText"+i,"Buy: "+DoubleToStr(OrderLots(),2)+" Lots",LineTextFontSize,"Arial",BuyOpenLineColor);
         
                           if(OrderTakeProfit()>0)
                              {
                                 ObjectCreate("TakeLine"+i,OBJ_HLINE,0,0,OrderTakeProfit());
                                 ObjectSet   ("TakeLine"+i,OBJPROP_COLOR,ProfitLineColor);
                                 take=(OrderTakeProfit()-OrderOpenPrice())/k;
                                 ObjectCreate ("TakeText"+i,OBJ_TEXT,0,TextTime,OrderTakeProfit());
                                 ObjectSetText("TakeText"+i,"TakeProfit: "+DoubleToStr(take,1)+" Pips",LineTextFontSize,"Arial",ProfitLineColor);
                                 if(ObjectGet("TakeLine"+i,OBJPROP_PRICE)!=OrderTakeProfit()) {ObjectMove("TakeLine"+i,0,TextTime,OrderTakeProfit()); ObjectMove("TakeText"+i,0,TextTime,OrderTakeProfit());}
                              }
                           else if(ObjectFind("TakeText"+i)==0) {ObjectDelete("TakeText"+i); ObjectDelete("TakeLine"+i);}
                           
                           if(OrderStopLoss()>0)
                              {
                                 ObjectCreate("StopLine"+i,OBJ_HLINE,0,0,OrderStopLoss());
                                 ObjectSet   ("StopLine"+i,OBJPROP_COLOR,StopLineColor);
                                 stop=(OrderOpenPrice()-OrderStopLoss())/k;
                                 ObjectCreate ("StopText"+i,OBJ_TEXT,0,TextTime,OrderStopLoss());
                                 ObjectSetText("StopText"+i,"StopLoss: "+DoubleToStr(stop,1)+" Pips",LineTextFontSize,"Arial", StopLineColor);
                                 if(ObjectGet("StopLine"+i,OBJPROP_PRICE)!=OrderStopLoss()) {ObjectMove("StopLine"+i,0,TextTime,OrderStopLoss()); ObjectMove("StopText"+i,0,TextTime,OrderStopLoss());}
                              }
                           else if(ObjectFind("StopText"+i)==0) {ObjectDelete("StopText"+i); ObjectDelete("StopLine"+i);}
                        } 
                        
                     //------------------ Draw lines on shorts ----------------------------------------
                     
                     if(OrderType() == OP_SELL)
                        {
                           OpenSels++; SelPrice=OrderOpenPrice();
                           if(OpenSels==2) SelPrice=SelPrice-VerticalTextGap; else if(OpenSels==3) SelPrice=SelPrice-(2*VerticalTextGap);
                           else if(OpenSels==4) SelPrice=SelPrice-(3*VerticalTextGap); else if(OpenSels==5) SelPrice=SelPrice-(4*VerticalTextGap);
                           
                           ObjectCreate("OpenLine"+i,OBJ_HLINE,0,0,OrderOpenPrice());
                           ObjectSet   ("OpenLine"+i,OBJPROP_COLOR,SellOpenLineColor);
                                              
                           ObjectCreate ("OpenText"+i,OBJ_TEXT,0,TextTime,SelPrice);
                           ObjectSetText("OpenText"+i,"Sell: "+DoubleToStr(OrderLots(),2)+" Lots",LineTextFontSize,"Arial",SellOpenLineColor);
                              
                           if(OrderTakeProfit()>0)
                              {
                                 ObjectCreate("TakeLine"+i,OBJ_HLINE,0,0,OrderTakeProfit());
                                 ObjectSet   ("TakeLine"+i,OBJPROP_COLOR,ProfitLineColor); 
                                 take=(OrderOpenPrice()-OrderTakeProfit())/k;
                                 ObjectCreate ("TakeText"+i,OBJ_TEXT,0,TextTime,OrderTakeProfit());
                                 ObjectSetText("TakeText"+i,"TakeProfit: "+DoubleToStr(take,1)+" Pips",LineTextFontSize,"Arial",ProfitLineColor);
                                 if(ObjectGet("TakeLine"+i,OBJPROP_PRICE)!=OrderTakeProfit()) {ObjectMove("TakeLine"+i,0,TextTime,OrderTakeProfit()); ObjectMove("TakeText"+i,0,TextTime,OrderTakeProfit());}
                              }
                           else if (ObjectFind("TakeText"+i)==0) {ObjectDelete("TakeText"+i); ObjectDelete("TakeLine"+i);}
                              
                           if(OrderStopLoss()>0)
                              {
                                 ObjectCreate("StopLine"+i,OBJ_HLINE,0,0,OrderStopLoss());
                                 ObjectSet   ("StopLine"+i,OBJPROP_COLOR,StopLineColor);
                                 stop=(OrderStopLoss()-OrderOpenPrice())/k;
                                 ObjectCreate ("StopText"+i,OBJ_TEXT,0,TextTime,OrderStopLoss());
                                 ObjectSetText("StopText"+i,"StopLoss: "+DoubleToStr(stop,1)+" Pips",LineTextFontSize,"Arial",StopLineColor);
                                 if(ObjectGet("StopLine"+i,OBJPROP_PRICE)!=OrderStopLoss()) {ObjectMove("StopLine"+i,0,TextTime,OrderStopLoss()); ObjectMove("StopText"+i,0,TextTime,OrderStopLoss());}
                              }
                           else if(ObjectFind("StopText"+i)==0) {ObjectDelete("StopText"+i); ObjectDelete("StopLine"+i);}
                        }
                  }
            }
         
         //-------------- Calculate history cash done--------------------------------------------
               
         done=0;   
         for(i=0; i < OrdersHistoryTotal(); i++) 
            {
               if(OrderSelect(i,SELECT_BY_POS,MODE_HISTORY)==false) break;
               if(OrderCloseTime()<StrToTime("00:00")) continue; done += OrderProfit(); 
            }
                  
         if(done>0) ObjectSetText("Done","Closed: "+DoubleToStr(done,2),CounterFontSize,"Arial",clrLime);
         else       ObjectSetText("Done","Closed: "+DoubleToStr(done,2),CounterFontSize,"Arial",clrRed);
      }

   if(OpenTrades==0 && ObjectFind(0,"OpenText_"+(string)0)==0) {DeleteAll();}
   
   return(0);
}

//----------------------------------------------------------------------------------------------

void DisplayLabel(string name,int y,int fsize,string font,color clr,string text)
{
   if(ObjectFind(name)>=0) ObjectDelete(name);
   ObjectCreate(name,OBJ_LABEL,WhereToDisplay,0,0);
   ObjectSet(name,OBJPROP_CORNER,Corner);
   ObjectSet(name,OBJPROP_XDISTANCE,Xposition);
   ObjectSet(name,OBJPROP_YDISTANCE,Yposition+y);
   ObjectSet(name,OBJPROP_HIDDEN,true);
   ObjectSetText(name,text,fsize,font,clr);
}

//+-----------------------------------------------------------------------------------

void DeleteAll()
{ 
   for(i=0; i < 10; i++)
      {
         ObjectDelete("OpenLine"+i); ObjectDelete("OpenText"+i);
         ObjectDelete("TakeLine"+i); ObjectDelete("TakeText"+i);
         ObjectDelete("StopLine"+i); ObjectDelete("StopText"+i);
      }      
}

//------------------------------------------------------------------------------------
