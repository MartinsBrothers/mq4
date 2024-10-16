//+------------------------------------------------------------------+
//|                                                   James Bond.mq4 |
//|                                                             Rosh |
//|                                    http://forexsystems.ru/phpBB/ |
//+------------------------------------------------------------------+
#property copyright "Rosh"
#property link      "http://forexsystems.ru/phpBB/"
#property show_inputs

extern int  jb_ExpertMagicNumber=0;
extern bool jb_ShowProfitLabels=true;
extern bool jb_ShowTrace=true;

int jb_UpOpenArrow=1;
int jb_DownOpenArrow=2;
int jb_CloseArrow=3;
color jb_UpOpenColor=Blue;
color jd_DownOpenColor=Red;
color jb_CloseColor=White;
color jb_ProfitClose=Lime;
color jb_LossClose=DeepPink;
color jb_lastCloseColor;
int jb_TraceLabel=159;
int jb_CloseLabel=108;
int jb_traceCounter;
int jb_closeLabelShift=30;
//+------------------------------------------------------------------+
//|  Set arrow                                                       |
//+------------------------------------------------------------------+
void SetArrow(datetime _time,double _price,string _Description ,int _arrowType, color _arrowColor)
   {
   ObjectCreate(_Description,OBJ_ARROW,0,_time,_price);
   ObjectSet(_Description,OBJPROP_ARROWCODE,_arrowType);
   ObjectSet(_Description,OBJPROP_COLOR,_arrowColor);
   //ObjectSetText(_Description,_Description);
   }

//+------------------------------------------------------------------+
//| Will trace the ticket                                            |
//+------------------------------------------------------------------+
void jb_TraceOrder(int _orderTicket)
   {
   double priceCloseLabel;
   string jb_openDescription;
   string jb_closeDescription;
   int jb_open_ArrowType;
   int jb_orderType=OrderType();
   color jb_orderColor;
   if (jb_orderType==OP_BUY ||jb_orderType==OP_SELL)
      {
      double jb_openPrice=OrderOpenPrice();
      double jb_closePrice=OrderClosePrice();
      if (jb_orderType==OP_BUY) jb_open_ArrowType=jb_UpOpenArrow; else jb_open_ArrowType=jb_DownOpenArrow;
      if (jb_orderType==OP_BUY) jb_orderColor=jb_UpOpenColor; else jb_orderColor=jd_DownOpenColor;
      datetime jb_timeClose=OrderCloseTime();
      datetime jb_timeOpen=OrderOpenTime();
      if (jb_orderType==OP_BUY) 
         {
         jb_openDescription="buy #"+_orderTicket;
         }
      else 
         {
         jb_openDescription="sell #"+_orderTicket;
         }
      jb_closeDescription="close "+jb_openDescription;
      SetArrow(jb_timeOpen,jb_openPrice,jb_openDescription,jb_open_ArrowType,jb_orderColor); // ������� ��������
      SetArrow(jb_timeClose,jb_closePrice,jb_closeDescription,jb_CloseArrow,jb_CloseColor); // ������� ��������
      if (jb_ShowTrace)
         {
         int jb_openShift=0;
         int jb_closeShift=0;
         while (Time[jb_openShift]>jb_timeOpen) jb_openShift++;
         //jb_openShift--;
         while (Time[jb_closeShift]>jb_timeClose) jb_closeShift++;
         //jb_closeShift--;
         if (jb_openShift-jb_closeShift>1)
            {
            for (int tr_shift=jb_openShift-1; tr_shift>jb_closeShift;tr_shift--) 
               {
               SetArrow(Time[tr_shift],jb_openPrice,jb_openDescription+" "+jb_traceCounter,jb_TraceLabel,jb_orderColor);
               jb_traceCounter++;
               }
            }
         if (jb_ShowProfitLabels)
            {
            if (OrderProfit()>0) jb_lastCloseColor=jb_ProfitClose; else jb_lastCloseColor=jb_LossClose;
            if (jb_orderType==OP_BUY) priceCloseLabel=High[jb_closeShift]+jb_closeLabelShift*Point ; else priceCloseLabel=Low[jb_closeShift]-jb_closeLabelShift*Point;
            SetArrow(Time[jb_closeShift],priceCloseLabel,jb_openDescription+" "+DoubleToStr(OrderProfit(),2),jb_CloseLabel,jb_lastCloseColor);
            }
         }
      }
   }
//+------------------------------------------------------------------+
//| Calculate trades on the Symbol and the MagicNumber               |
//+------------------------------------------------------------------+
int jb_SymbolTrades()
  {
   int jb_tradesOnSymbol=0;
   int jb_allTrades=HistoryTotal();
   int cnt;
   for (cnt=0;cnt<HistoryTotal();cnt++)
      {
      if(OrderSelect(cnt,SELECT_BY_POS,MODE_HISTORY)==false)
         {
         Print("Access error on History (",GetLastError(),")");
         break;
         }
      if ((OrderSymbol()==Symbol())&&(OrderType()==OP_BUY||OrderType()==OP_SELL)) jb_tradesOnSymbol++;
      } 
   return(jb_tradesOnSymbol);
  }
//+------------------------------------------------------------------+
//| script program start function                                    |
//+------------------------------------------------------------------+
int start()
  {
//---- 
   if (jb_SymbolTrades()==0)   Alert("No trades on ",Symbol());
   else
      {
      for (int cnt=0;cnt<HistoryTotal();cnt++)
         {
         if(OrderSelect(cnt,SELECT_BY_POS,MODE_HISTORY)==false)
            {
            Print("Access error on History (",GetLastError(),")");
            break;
            }
         if ((OrderSymbol()==Symbol())&&((OrderMagicNumber()==0)||((OrderMagicNumber()!=0)&&(OrderMagicNumber()==jb_ExpertMagicNumber))))  
            {
            //Print("Ticket=",OrderTicket());
            jb_TraceOrder(OrderTicket());
            }
         }
      }
//----
   return(0);
  }
//+------------------------------------------------------------------+
        
