// More information about this indicator can be found at:
// http://fxcodebase.com/code/viewtopic.php?f=38&t=64500 


//+------------------------------------------------------------------+
//|                               Copyright © 2020, Gehtsoft USA LLC | 
//|                                            http://fxcodebase.com |
//+------------------------------------------------------------------+
//|                                 Support our efforts by donating  | 
//|                                    Paypal: https://goo.gl/9Rj74e |
//+------------------------------------------------------------------+
//|                                      Developed by : Mario Jemic  |                    
//|                                          mario.jemic@gmail.com   |
//|                           https://AppliedMachineLearning.systems |
//|                                Patreon :  https://goo.gl/GdXWeN  |  
//+------------------------------------------------------------------+
#property version   "1.00"
#property strict

input ENUM_MA_METHOD Ma1Method = MODE_SMA; //First MA Method
input int Ma1Preiod = 100; //First MA Period
input int Ma1Shift =0 ; //First Ma Shift
input ENUM_APPLIED_PRICE Ma1Price = PRICE_CLOSE;//First MA Applied Price

input ENUM_MA_METHOD Ma2Method = MODE_SMA; //Second MA Method
input int Ma2Preiod = 30; //Second MA Period
input int Ma2Shift = 0; //Second Ma Shift
input ENUM_APPLIED_PRICE Ma2Price = PRICE_CLOSE;//Second MA Applied Price


input double LotValue=0.1;           // Order lot Value
input int    StopLoss=10;            // Stop Loss value in pt
input int    TakeProfit=10;          // Take Profit value in pt
input bool   UseTrailing=false;      // Disable/Enable halving trailing stop
input double DivisionRatio = 0.5;    // Division ratio
input bool   TrailingInLoss=false;   // Disable/Enable trailing stop in loss
input bool   UseBreakeven=false;     // Use Breakeven
input int    BreakevenValue=100;     // Transfer to breakeven when reaching value
input int    Slippage=5;             // Order opening slippage
input int    OrdersCount=1;          // A number of simultaneously open orders
input int    magicNumber = 41503;    //Magic number
input string comment= "MA Cross Expert";
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//---
   
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---
   
  }
  
  
  datetime time;
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
      Terminal();
  
    
      if(UseBreakeven)
         CheckMoveStopLoss();
      
      
      if(time != iTime(Symbol(),0,0))
      {
         if(UseTrailing)
         {
            TrallsCheck();
         }
         
        
            
          time = iTime(Symbol(),0,0);
          int signal = getSignal();
          if(signal == 1)
               PreCheck(OP_BUY);
            if(signal == 2)
                PreCheck(OP_SELL);
      }
      
          
      Terminal();
   
  }
//+------------------------------------------------------------------+




//0 - no signal
//1 - buy 
//2 - sell
int getSignal(int shift = 1)
{
   double ma1_1 = iMA(NULL, NULL, Ma1Preiod, Ma1Shift, Ma1Method, Ma1Price, shift);
   double ma1_2 = iMA(NULL, NULL, Ma1Preiod, Ma1Shift, Ma1Method, Ma1Price, shift+1);
   double ma2_1 = iMA(NULL, NULL, Ma2Preiod, Ma2Shift, Ma2Method, Ma2Price, shift);
   double ma2_2 = iMA(NULL, NULL, Ma2Preiod, Ma2Shift, Ma2Method, Ma2Price, shift+1);
   if (ma1_1 > ma2_1 && ma1_2 <= ma2_2) return 1;
   if (ma1_1 < ma2_1 && ma1_2 >= ma2_2) return 2;
                  
   
   return 0;
}




void TrallsCheck()
{
   if(KolvoMN() > 0)
   {
      for(int j=1;j<=Mas_Ord_New[0][0];j++)
      {                             
           if(Mas_Ord_New[j][7] == magicNumber )
           {
              HalfTrallSignal(Mas_Ord_New[j][4]);  
           }
                     
      }
    
   }
}

void CheckMoveStopLoss()
{
  for(int j=0;j<=Mas_Ord_New[0][0];j++)
  {    
      if(Mas_Ord_New[j][7] == magicNumber)                              
         MoveStopLossToProfitZone(Mas_Ord_New[j][4]);
  }

}

void HalfTrallSignal(int ticket)
   { 
   
     int iTicket = ticket; // unique number (ticket) of an open position
     int iTmFrme = Period (); // chart period, on which bars are pressed
     double dCoeff = DivisionRatio; // "compression ratio", in% from 0.01 to 1
     bool bTrlinloss = TrailingInLoss; // whether to trail in the area of losses (between the stop loss and the opening rate)
    
    

    OrderSelect(ticket,SELECT_BY_TICKET);
    
    double dBid = MarketInfo(Symbol(),MODE_BID);
    double dAsk = MarketInfo(Symbol(),MODE_ASK);
    double dNewSl;
    double dNexMove;     
      
      if (OrderType()==OP_BUY)
         {
         if ((bTrlinloss) && (OrderStopLoss()!=0))
            {
               dNexMove = NormalizeDouble(dCoeff*(dBid-OrderStopLoss()),Digits);
               dNewSl = NormalizeDouble(OrderStopLoss()+dNexMove,Digits);            
            }
         else
            {
            if (OrderOpenPrice()>OrderStopLoss())
               {
                  dNexMove = NormalizeDouble(dCoeff*(dBid-OrderOpenPrice()),Digits);   
                  dNewSl = NormalizeDouble(OrderOpenPrice()+dNexMove,Digits);
               }
         
            if (OrderStopLoss()>=OrderOpenPrice())
               {
                  dNexMove = NormalizeDouble(dCoeff*(dBid-OrderStopLoss()),Digits);
                  dNewSl = NormalizeDouble(OrderStopLoss()+dNexMove,Digits);
               }                                      
            }
            
         if ((dNewSl>OrderStopLoss()) && (dNexMove>0) && ((dNewSl<Bid- MarketInfo(Symbol(),MODE_STOPLEVEL)*Point)))
            {
               if (!OrderModify(OrderTicket(),OrderOpenPrice(),dNewSl,OrderTakeProfit(),OrderExpiration(),Red))
               Print("Failed to modify stop loss order №",OrderTicket(),". Error: ",GetLastError());
            }
         }       
      
      if (OrderType()==OP_SELL)
         {
            if ((bTrlinloss) && (OrderStopLoss()!=0))
               {
                  dNexMove = NormalizeDouble(dCoeff*(OrderStopLoss()-(dAsk)),Digits);
                  dNewSl = NormalizeDouble(OrderStopLoss()-dNexMove,Digits);            
               }
            else
               {         
               if (OrderOpenPrice()<OrderStopLoss())
                  {
                     dNexMove = NormalizeDouble(dCoeff*(OrderOpenPrice()-(dAsk)),Digits);                 
                     dNewSl = NormalizeDouble(OrderOpenPrice()-dNexMove,Digits);
                  }
            
               if (OrderStopLoss()<=OrderOpenPrice())
                  {
                     dNexMove = NormalizeDouble(dCoeff*(OrderStopLoss()-(dAsk)),Digits);
                     dNewSl = NormalizeDouble(OrderStopLoss()-dNexMove,Digits);
                  }                  
               }
            
            if ((dNewSl<OrderStopLoss()) && (dNexMove>0) && (dNewSl>Ask+MarketInfo(Symbol(),MODE_STOPLEVEL)*Point))
               {
                  if (!OrderModify(OrderTicket(),OrderOpenPrice(),dNewSl,OrderTakeProfit(),OrderExpiration(),Blue))
                  Print("Failed to modify stop loss order №",OrderTicket(),". Error: ",GetLastError());
               }
         } 

   }
   
   


void MoveStopLossToProfitZone(int ticket)
{
   double ord_sl = OrderStopLoss();
   double sl_op_diff = MathAbs(ord_sl - OrderOpenPrice());
   if(sl_op_diff == 0) return;
   double move_pt = NormalizeDouble(BreakevenValue*Point,Digits);
   int Ticket_c = -1;
   if (OrderType()==OP_BUY) 
      {       
         double diff = Bid - OrderOpenPrice(); 
         if(diff > 0 && diff > move_pt) 
          { 
          
            if(OrderOpenPrice() > OrderStopLoss())
            {
               Ticket_c = OrderModify(ticket,OrderOpenPrice(),OrderOpenPrice(), OrderTakeProfit(),0);
               if(Ticket_c == 0 && !IsTesting())
               {
                  Sleep(2000);
                  MoveStopLossToProfitZone(ticket);             
               }
            
            }
            
            
          }
      }
      if (OrderType()==OP_SELL) 
      {
      
      
         double diff = ord_sl - Ask - (ord_sl - OrderOpenPrice()); 
         if(diff > 0 && diff > move_pt) 
         {             
             
             if(OrderOpenPrice() < OrderStopLoss())
             {             
                Ticket_c =OrderModify(ticket,OrderOpenPrice(),OrderOpenPrice(), OrderTakeProfit(),0);
                // if(!IsTesting()){} 
                if(Ticket_c == 0 && !IsTesting())
                {
                   Sleep(2000);
                    MoveStopLossToProfitZone(ticket);             
                }
             }
           
               
          }
      
         
      } 

}



 double Mas_Ord_New [150][10];
 double Mas_Ord_Old[150][10];
 int Mas_Tip [6];
 
int his=0;

int Terminal()
  {
   int Qnt=0;                          // Счётчик количества ордеров
   if(IsTesting())
   {
   
      if(OrdersTotal() == Mas_Ord_New[0][0] && OrdersHistoryTotal() == his) 
      {
       
         return 0;
      }
      his = OrdersHistoryTotal();
      
   }
//--------------------------------------------------------------- 3 --
   ArrayCopy(Mas_Ord_Old, Mas_Ord_New);// Сохраняем предыдущую историю
   Qnt=0;                              // Обнуление счётчика ордеров
   ArrayInitialize(Mas_Ord_New,0);     // Обнуление массива
   ArrayInitialize(Mas_Tip,    0);     // Обнуление массива
//--------------------------------------------------------------- 4 --
   for(int i=0; i<OrdersTotal(); i++) // По рыночн. и отлож. ордерам
     {
      if((OrderSelect(i,SELECT_BY_POS)==true)     //Если есть следующ.
      && (OrderSymbol()==Symbol()))               //.. и наша вал.пара
        {
         //------------------------------------------------------ 5 --
         Qnt++;                                   // Колич. ордеров
         Mas_Ord_New[Qnt][1]=OrderOpenPrice();    // Курс открытия орд
         Mas_Ord_New[Qnt][2]=OrderStopLoss();     // Курс SL
         Mas_Ord_New[Qnt][3]=OrderTakeProfit();   // Курс ТР
         Mas_Ord_New[Qnt][4]=OrderTicket();       // Номер ордера
         Mas_Ord_New[Qnt][5]=OrderLots();         // Количество лотов
         Mas_Tip[OrderType()]++;                  // Кол. ордеров типа
         Mas_Ord_New[Qnt][6]=OrderType();         // Тип ордера
         Mas_Ord_New[Qnt][7]=OrderMagicNumber();  // Магическое число 
         if (OrderComment()=="")
            Mas_Ord_New[Qnt][8]=0;                // Если нет коммент
         else
            Mas_Ord_New[Qnt][8]=1;                // Если есть коммент
            
         //------------------------------------------------------ 6 --
        }
     }
   Mas_Ord_New[0][0]=Qnt;                         // Колич. ордеров
//--------------------------------------------------------------- 7 --
   return(0);
  }
  
  
 int KolvoMN()
 {
    int RR=0;
    for(int i=1; i<=Mas_Ord_New[0][0]; i++)
    { 
      if (Mas_Ord_New[i][7]==magicNumber) RR=RR+1;
    }
    
    return (RR);
 }
 
 


int PreCheck(int OrdType)
{
   if(KolvoMN() >= OrdersCount) return 0;
   int ret = 0;
   int stoploss = 0;
   int takeprofit=0;
   double volume=0;
   double price=0;
   int slippage;
   stoploss = StopLoss;
   takeprofit = TakeProfit;
   volume = GetVolume(stoploss);
   if(OrdType == OP_BUY) price = Ask;
   if(OrdType == OP_SELL) price = Bid;
   if(stoploss > 0)
   {
      double sl = 0;
      double tp = 0;
      if(OrdType == OP_BUY)  
      {
         Print(" stoploss "+stoploss + " takeprofit "+takeprofit );
         if(stoploss != 0) sl = NormalizeDouble(Bid - stoploss * Point, Digits);
         if(takeprofit != 0)tp = NormalizeDouble(Bid + takeprofit * Point, Digits);
      }
      if(OrdType == OP_SELL)  
      {
        
         if(stoploss != 0) sl = NormalizeDouble(Ask + stoploss * Point, Digits);
         if(takeprofit != 0) tp = NormalizeDouble(Ask - takeprofit * Point, Digits);
      }
      
      int result = OrderOpenF(NULL,OrdType,volume,price,Slippage,sl,tp,comment + " "+magicNumber,magicNumber,NULL,NULL);
      return result;
   }
   else ret = -1;

   return ret;
}


double GetVolume(int stoploss)
{
   double volume=0;   
   double Free =AccountFreeMargin();
   double Balance =AccountBalance();
   double LotVal  =MarketInfo(Symbol(),MODE_TICKVALUE);
   double Min_Lot =MarketInfo(Symbol(),MODE_MINLOT);
   double Max_Lot =MarketInfo(Symbol(),MODE_MAXLOT);
   double Step    =MarketInfo(Symbol(),MODE_LOTSTEP);
   double One_Lot=MarketInfo(Symbol(),MODE_MARGINREQUIRED);      
      
      
   volume = MathFloor(Free*LotValue/100/One_Lot/Step)*Step;

   if (volume<Min_Lot){
      Alert("Current lot volume "+volume+" less than minimum "+Min_Lot);return (-1);
   }

   if (volume>Max_Lot){
      Alert("Current lot volume"+volume+" more than maximum "+Max_Lot);return (-1);
   }                               
       
   return volume;
}


// + ----------------------------------------------- -------------------------------------------------- -------------------- +
// | The function opens or places an order |
// | symbol - The name of the financial instrument with which a trading operation is performed. |
// | cmd - Trade operation. Can be any of the values ​​of trade operations. |
// | volume - The number of lots. |
// | price - Opening price. |
// | slippage - Maximum allowable price deviation for market orders (buy or sell orders). |
// | stoploss - Position closing price when the loss level is reached (0 if there is no loss level). |
// | takeprofit - Position closing price when the profitability level is reached (0 if there is no profitability level). |
// | comment - The text of the order comment. The last part of the comment can be changed by the trade server. |
// | magic - The magic number of the order. Can be used as a user-defined identifier. |
// | expiration - The expiration date of the pending order. |
// | arrow_color - Color of the opening arrow on the chart. If the parameter is absent or its value is CLR_NONE, |
// | then the opening arrow is not displayed on the chart. |
// + ----------------------------------------------- -------------------------------------------------- -------------------- +
int OrderOpenF(string     OO_symbol,
               int        OO_cmd,
               double     OO_volume,
               double     OO_price,
               int        OO_slippage,
               double     OO_stoploss,
               double     OO_takeprofit,
               string     OO_comment,
               int        OO_magic,
               datetime   OO_expiration,
               color      OO_arrow_color)
  {
   int result = -1; // result of opening an order
   int Error = 0; // error when opening an order.
   int attempt = 0; // number of attempts made
   int attemptMax = 3; // maximum number of attempts
   bool exit_loop = false; // exit the loop
   string lang = TerminalInfoString (TERMINAL_LANGUAGE); // language of the trading terminal, to determine the message language
   double stopllvl = NormalizeDouble (MarketInfo (OO_symbol, MODE_STOPLEVEL) * MarketInfo (OO_symbol, MODE_POINT), Digits); // minimum allowable stop loss / take profit level in points
                                                                                                                      // the module provides safe opening of orders.
// --- check stop orders of buy orders
   if(OO_cmd==OP_BUY || OO_cmd==OP_BUYLIMIT || OO_cmd==OP_BUYSTOP)
     {
      double tp = (OO_takeprofit - OO_price)/MarketInfo(OO_symbol, MODE_POINT);
      double sl = (OO_price - OO_stoploss)/MarketInfo(OO_symbol, MODE_POINT);
      if(tp>0 && tp<=stopllvl)
        {
         OO_takeprofit=OO_price+stopllvl+2*MarketInfo(OO_symbol,MODE_POINT);
        }
      if(sl>0 && sl<=stopllvl)
        {
         OO_stoploss=OO_price -(stopllvl+2*MarketInfo(OO_symbol,MODE_POINT));
        }
     }
//--- check stop orders of sell orders
   if(OO_cmd==OP_SELL || OO_cmd==OP_SELLLIMIT || OO_cmd==OP_SELLSTOP)
     {
      double tp = (OO_price - OO_takeprofit)/MarketInfo(OO_symbol, MODE_POINT);
      double sl = (OO_stoploss - OO_price)/MarketInfo(OO_symbol, MODE_POINT);
      if(tp>0 && tp<=stopllvl)
        {
         OO_takeprofit=OO_price -(stopllvl+2*MarketInfo(OO_symbol,MODE_POINT));
        }
      if(sl>0 && sl<=stopllvl)
        {
         OO_stoploss=OO_price+stopllvl+2*MarketInfo(OO_symbol,MODE_POINT);
        }
     }
//--- cycle while
   while(!exit_loop)
     {
     
     
      result = OrderSend (OO_symbol, OO_cmd, OO_volume, OO_price, OO_slippage, OO_stoploss, OO_takeprofit, OO_comment, OO_magic, OO_expiration, OO_arrow_color); // attempt to open an order by the specified parameters
      return result;
      // --- condition if an error occurred when opening an order
      if (result <0)
        {
         Error = GetLastError (); // assign the code to the error
         switch (Error) // enumeration of errors
           {// enumeration of errors of order closing and an attempt to fix them
            case 2:
               if (attempt <attemptMax)
                 {
                  attempt = attempt + 1; // indicate one more attempt
                  Sleep (3000); // delay of 3 seconds
                  RefreshRates ();
                  break; // exit switch
                 }
               if (attempt == attemptMax)
                 {
                  attempt = 0; // zero the number of attempts
                  exit_loop = true; // exit while
                  break; // exit switch
                 }
            case 3:
               RefreshRates ();
               exit_loop = true; // exit while
               break; // exit switch
            case 4:
               if (attempt <attemptMax)
                 {
                  attempt = attempt + 1; // indicate one more attempt
                  Sleep (3000); // delay of 3 seconds
                  RefreshRates ();
                  break; // exit switch
                 }
               if (attempt == attemptMax)
                 {
                  attempt = 0; // zero the number of attempts
                  exit_loop = true; // exit while
                  break; // exit switch
                 }
            case 5:
               exit_loop = true; // exit while
               break; // exit switch
            case 6:
               if (attempt <attemptMax)
                 {
                  attempt = attempt + 1; // indicate one more attempt
                  Sleep (5000); // delay of 3 seconds
                  break; // exit switch
                 }
               if (attempt == attemptMax)
                 {
                  attempt = 0; // zero the number of attempts
                  exit_loop = true; // exit while
                  break; // exit switch
                 }
            case 8:
               if (attempt <attemptMax)
                 {
                  attempt = attempt + 1; // indicate one more attempt
                  Sleep (7000); // delay of 3 seconds
                  break; // exit switch
                 }
               if (attempt == attemptMax)
                 {
                  attempt = 0; // zero the number of attempts
                  exit_loop = true; // exit while
                  break; // exit switch
                 }
            case 64:
               exit_loop = true; // exit while
               break; // exit switch
            case 65:
               exit_loop = true; // exit while
               break; // exit switch
            case 128:
               Sleep (3000);
               RefreshRates ();
               continue; // exit switch
        case 129:
               if (attempt <attemptMax)
                 {
                  attempt = attempt + 1; // indicate one more attempt
                  Sleep (3000); // delay of 3 seconds
                  RefreshRates ();
                  break; // exit switch
                 }
               if (attempt == attemptMax)
                 {
                  attempt = 0; // zero the number of attempts
                  exit_loop = true; // exit while
                  break; // exit switch
                 }
            case 130:
               exit_loop = true; // exit while
               break;
            case 131:
               exit_loop = true; // exit while
               break; // exit switch
            case 132:
               Sleep (10000); // fall asleep for 10 sec.
               RefreshRates (); // update data
                                                                     // exit_loop = true; // exit while
               break; // exit switch
            case 133:
               exit_loop = true; // exit while
               break; // exit switch
            case 134:
               exit_loop = true; // exit while
               break; // exit switch
            case 135:
               if (attempt <attemptMax)
                 {
                  attempt = attempt + 1; // indicate one more attempt
                  RefreshRates ();
                  break; // exit switch
                 }
               if (attempt == attemptMax)
                 {
                  attempt = 0; // zero the number of attempts
                  exit_loop = true; // exit while
                  break; // exit switch
                 }
            case 136:
               if (attempt <attemptMax)
                 {
                  attempt = attempt + 1; // indicate one more attempt
                  RefreshRates ();
                  break; // exit switch
                 }
               if (attempt == attemptMax)
                 {
                  attempt = 0; // zero the number of attempts
                  exit_loop = true; // exit while
                  break; // exit switch
                 }
            case 137:
               if (attempt <attemptMax)
                 {
                  attempt = attempt + 1;
                  Sleep (2000);
                  RefreshRates ();
                  break;
                 }
               if (attempt == attemptMax)
                 {
                  attempt = 0;
                  exit_loop = true;
                  break;
                 }
            case 138:
               if (attempt <attemptMax)
                 {
                  attempt = attempt + 1;
                  Sleep (1000);
                  RefreshRates ();
                  break;
                 }
               if (attempt == attemptMax)
                 {
                  attempt = 0;
                  exit_loop = true;
                  break;
                 }
            case 139:
               exit_loop = true;
               break;
            case 141:
               Sleep (5000);
               exit_loop = true;
               break;
            case 145:
               exit_loop = true;
               break;
            case 146:
               if (attempt <attemptMax)
                 {
                  attempt = attempt + 1;
                  Sleep (2000);
                  RefreshRates ();
                  break;
                 }
               if (attempt == attemptMax)
                 {
                  attempt = 0;
                  exit_loop = true;
                  break;
                 }
            case 147:
               if (attempt <attemptMax)
                 {
                  attempt = attempt + 1;
                  OO_expiration = 0;
                  break;
                 }
               if (attempt == attemptMax)
                 {
                  attempt = 0;
                  exit_loop = true;
                  break;
                 }
            case 148:
               exit_loop = true;
               break;
            default:
               Print ("Error:", Error);
               exit_loop = true; // exit while
               break; //other options
           }
        }
      // --- condition if there are no errors
      else
        {
         Print ("The order is successfully opened.", result);
         Error = 0; // reset the error code
         break; // exit while
         // errorCount = 0; // zero the number of attempts
        }
     }
   return (result);
  }
  