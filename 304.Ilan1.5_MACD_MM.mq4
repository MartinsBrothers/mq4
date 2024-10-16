//������������ ������ Ilan1.5 � ����������� Period_Switcher.
//�������� BTRVODKA
//BTRVODKA@gmail.com
#include <WinUser32.mqh>
//��������������������������������������������������������������������������������������������������������������������������
double Stoploss = 500.0;  // ���� ����
double TrailStart = 10.0; // ����
double TrailStop = 10.0;  // ����
//��������������������������������������������������������������������������������������������������������������������������
extern double LotExponent = 1.59;  // ��������� ����� � ����� �� ���������� ��� ������ � ���������. ������ ��� 0.1, �����: 0.15, 0.26, 0.43 ...
extern double Lots = 0.1;         // ������ ����� � ��������� 0.01 ��� ���� ���� ����� 0.1 �� ��������� ��� � ����� ����� 0.16
extern double Risk = 0;
extern int lotdecimal = 2;         // 2 - ��������� 0.01, 1 - ���� ���� 0.1, 0 - ���������� ���� 1.0
extern double TakeProfit = 10.0;   // ���� ������
double PipStep = 10.0;      // ��� ������
extern int MagicNumber = 12324;    // ���������� ����� 
extern double slip = 3.0;          // ���������������
extern int MaxTrades = 10;         // ���������� �����

extern int St_min=25;                  // �����.  ������� ����������
extern int St_max=75;                  // ������. ������� ����������
extern double Open_Level =12;           // ������� MACD ��� ����.(+/-)
double Close_Level=4;           // ������� MACD ��� ����.(+/-)
string BlockSwither = "---��������� switcher---";
bool       Using=FALSE;//������������, ��� ���?
int       M1=-1;
int       M5=-1;
int       M15=0;
int       M30=4;
int       H1=6;
int       H4=-1;
int       D1=-1;
int       W1=-1;
int       MN=-1;
bool UseEquityStop = FALSE;
double TotalEquityRisk = 20.0;
bool UseTrailingStop = FALSE;
bool UseTimeOut = FALSE;
double MaxTradeOpenHours = 48.0;
//��������������������������������������������������������������������������������������������������������������������������
double PriceTarget, StartEquity, BuyTarget, SellTarget ;
double AveragePrice, SellLimit, BuyLimit ;
double LastBuyPrice, LastSellPrice, Spread;
bool flag;
string EAName = "Ilan";
int timeprev = 0, expiration;
int NumOfTrades = 0;
double iLots;
int cnt = 0, total;
double Stopper = 0.0;
bool TradeNow = FALSE, LongTrade = FALSE, ShortTrade = FALSE;
int ticket;
bool NewOrdersPlaced = FALSE;
double AccountEquityHighAmt, PrevEquity;
//��������������������������������������������������������������������������������������������������������������������������
int init() {
   Spread = MarketInfo(Symbol(), MODE_SPREAD) * Point;
   return (0);
}

int deinit() {
   return (0);
}
//��������������������������������������������������������������������������������������������������������������������������
int start() {
   double PrevCl;
   double CurrCl;
   if (Using==true)
   {Switcher();}
   if (UseTrailingStop) TrailingAlls(TrailStart, TrailStop, AveragePrice);
   if (UseTimeOut) {
      if (TimeCurrent() >= expiration) {
         CloseThisSymbolAll();
         Print("Closed All due to TimeOut");
      }
   }
   if (timeprev == Time[0]) return (0);
   timeprev = Time[0];
   double CurrentPairProfit = CalculateProfit();
   if (UseEquityStop) {
      if (CurrentPairProfit < 0.0 && MathAbs(CurrentPairProfit) > TotalEquityRisk / 100.0 * AccountEquityHigh()) {
         CloseThisSymbolAll();
         Print("Closed All due to Stop Out");
         NewOrdersPlaced = FALSE;
      }
   }
   total = CountTrades();
   if (total == 0) flag = FALSE;
   for (cnt = OrdersTotal() - 1; cnt >= 0; cnt--) {
      OrderSelect(cnt, SELECT_BY_POS, MODE_TRADES);
      if (OrderSymbol() != Symbol() || OrderMagicNumber() != MagicNumber) continue;
      if (OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber) {
         if (OrderType() == OP_BUY) {
            LongTrade = TRUE;
            ShortTrade = FALSE;
            break;
         }
      }
      if (OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber) {
         if (OrderType() == OP_SELL) {
            LongTrade = FALSE;
            ShortTrade = TRUE;
            break;
         }
      }
   }
   if (total > 0 && total <= MaxTrades) {
      RefreshRates();
      LastBuyPrice = FindLastBuyPrice();
      LastSellPrice = FindLastSellPrice();
      if (LongTrade && Criterion() == 10 && LastBuyPrice - NormalizeDouble(Ask,Digits) >= PipStep * Point) TradeNow = TRUE;
      if (ShortTrade && Criterion() == 20 && NormalizeDouble(Bid,Digits) - LastSellPrice >= PipStep * Point) TradeNow = TRUE;
   }
   if (total < 1) {
      ShortTrade = FALSE;
      LongTrade = FALSE;
      TradeNow = TRUE;
      StartEquity = AccountEquity();
   }
   if (TradeNow) {
      LastBuyPrice = FindLastBuyPrice();
      LastSellPrice = FindLastSellPrice();     
      if (ShortTrade) {
         NumOfTrades = total;
         LotExponent = LotExponent + NormalizeDouble((LastSellPrice-NormalizeDouble(Bid,Digits))/10,0);
        // Print("LotExponent: ", LotExponent);
         iLots = NormalizeDouble(GetLots() * MathPow(LotExponent, NumOfTrades), lotdecimal);
         RefreshRates();
         ticket = OpenPendingOrder(1, iLots, NormalizeDouble(Bid,Digits), slip, NormalizeDouble(Ask,Digits), 0, 0, EAName + "-" + NumOfTrades, MagicNumber, 0, HotPink);
         if (ticket < 0) {
            Print("Error: ", GetLastError());
            return (0);
         }
         LastSellPrice = FindLastSellPrice();
         TradeNow = FALSE;
         NewOrdersPlaced = TRUE;
      } else {
         if (LongTrade) {
            NumOfTrades = total;
            LotExponent = LotExponent + NormalizeDouble((LastBuyPrice-NormalizeDouble(Ask,Digits))/10,0);
          //  Print("LotExponent: ", LotExponent);
            iLots = NormalizeDouble(GetLots() * MathPow(LotExponent, NumOfTrades), lotdecimal);
            ticket = OpenPendingOrder(0, iLots, NormalizeDouble(Ask,Digits), slip, NormalizeDouble(Bid,Digits), 0, 0, EAName + "-" + NumOfTrades, MagicNumber, 0, Lime);
            if (ticket < 0) {
               Print("Error: ", GetLastError());
               return (0);
            }
            LastBuyPrice = FindLastBuyPrice();
            TradeNow = FALSE;
            NewOrdersPlaced = TRUE;
         }
      }
   }
   if (TradeNow && total < 1) {
      PrevCl = iClose(Symbol(), 0, 2);
      CurrCl = iClose(Symbol(), 0, 1);
      SellLimit = NormalizeDouble(Bid,Digits);
      BuyLimit = NormalizeDouble(Ask,Digits);
      if (!ShortTrade && !LongTrade) {
         NumOfTrades = total;
        // Print("LotExponent: ", LotExponent);
         iLots = NormalizeDouble(GetLots() * MathPow(LotExponent, NumOfTrades), lotdecimal);
         if (PrevCl > CurrCl) {
            if (Criterion() == 20) {
               ticket = OpenPendingOrder(1, iLots, SellLimit, slip, SellLimit, 0, 0, EAName + "-" + NumOfTrades, MagicNumber, 0, HotPink);
               if (ticket < 0) {
                  Print("Error: ", GetLastError());
                  return (0);
               }
               LastBuyPrice = FindLastBuyPrice();
               NewOrdersPlaced = TRUE;
            }
         } else {
            if (Criterion() == 10) {
               ticket = OpenPendingOrder(0, iLots, BuyLimit, slip, BuyLimit, 0, 0, EAName + "-" + NumOfTrades, MagicNumber, 0, Lime);
               if (ticket < 0) {
                  Print("Error: ", GetLastError());
                  return (0);
               }
               LastSellPrice = FindLastSellPrice();
               NewOrdersPlaced = TRUE;
            }
         }
         if (ticket > 0) expiration = TimeCurrent() + 60.0 * (60.0 * MaxTradeOpenHours);
         TradeNow = FALSE;
      }
   }
   total = CountTrades();
   AveragePrice = 0;
   double Count = 0;
   for (cnt = OrdersTotal() - 1; cnt >= 0; cnt--) {
      OrderSelect(cnt, SELECT_BY_POS, MODE_TRADES);
      if (OrderSymbol() != Symbol() || OrderMagicNumber() != MagicNumber) continue;
      if (OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber) {
         if (OrderType() == OP_BUY || OrderType() == OP_SELL) {
            AveragePrice += OrderOpenPrice() * OrderLots();
            Count += OrderLots();
         }
      }
   }
   if (total > 0) AveragePrice = NormalizeDouble(AveragePrice / Count, Digits);
   if (NewOrdersPlaced) {
      for (cnt = OrdersTotal() - 1; cnt >= 0; cnt--) {
         OrderSelect(cnt, SELECT_BY_POS, MODE_TRADES);
         if (OrderSymbol() != Symbol() || OrderMagicNumber() != MagicNumber) continue;
         if (OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber) {
            if (OrderType() == OP_BUY) {
               PriceTarget = AveragePrice + TakeProfit * Point;
               BuyTarget = PriceTarget;
               Stopper = AveragePrice - Stoploss * Point;
               flag = TRUE;
            }
         }
         if (OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber) {
            if (OrderType() == OP_SELL) {
               PriceTarget = AveragePrice - TakeProfit * Point;
               SellTarget = PriceTarget;
               Stopper = AveragePrice + Stoploss * Point;
               flag = TRUE;
            }
         }
      }
   }
   if (NewOrdersPlaced) {
      if (flag == TRUE) {
         for (cnt = OrdersTotal() - 1; cnt >= 0; cnt--) {
            OrderSelect(cnt, SELECT_BY_POS, MODE_TRADES);
            if (OrderSymbol() != Symbol() || OrderMagicNumber() != MagicNumber) continue;
            if (OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber) OrderModify(OrderTicket(), AveragePrice, OrderStopLoss(), PriceTarget, 0, Yellow);
            NewOrdersPlaced = FALSE;
         }
      }
   }
   return (0);
}
//��������������������������������������������������������������������������������������������������������������������������

int CountTrades() {
   int count = 0;
   for (int trade = OrdersTotal() - 1; trade >= 0; trade--) {
      OrderSelect(trade, SELECT_BY_POS, MODE_TRADES);
      if (OrderSymbol() != Symbol() || OrderMagicNumber() != MagicNumber) continue;
      if (OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber)
         if (OrderType() == OP_SELL || OrderType() == OP_BUY) count++;
   }
   return (count);
}
//��������������������������������������������������������������������������������������������������������������������������

void CloseThisSymbolAll() {
   for (int trade = OrdersTotal() - 1; trade >= 0; trade--) {
      OrderSelect(trade, SELECT_BY_POS, MODE_TRADES);
      if (OrderSymbol() == Symbol()) {
         if (OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber) {
            if (OrderType() == OP_BUY) OrderClose(OrderTicket(), OrderLots(), Bid, slip, Blue);
            if (OrderType() == OP_SELL) OrderClose(OrderTicket(), OrderLots(), Ask, slip, Red);
         }
         Sleep(1000);
      }
   }
}

//��������������������������������������������������������������������������������������������������������������������������

int OpenPendingOrder(int pType, double pLots, double pPrice, int pSlippage, double ad_24, int ai_32, int ai_36, string a_comment_40, int a_magic_48, int a_datetime_52, color a_color_56) {
   int l_ticket_60 = 0;
   int l_error_64 = 0;
   int l_count_68 = 0;
   int li_72 = 100;
   switch (pType) {
   case 2:
      for (l_count_68 = 0; l_count_68 < li_72; l_count_68++) {
         l_ticket_60 = OrderSend(Symbol(), OP_BUYLIMIT, pLots, pPrice, pSlippage, StopLong(ad_24, ai_32), TakeLong(pPrice, ai_36), a_comment_40, a_magic_48, a_datetime_52, a_color_56);
         l_error_64 = GetLastError();
         if (l_error_64 == 0/* NO_ERROR */) break;
         if (!(l_error_64 == 4/* SERVER_BUSY */ || l_error_64 == 137/* BROKER_BUSY */ || l_error_64 == 146/* TRADE_CONTEXT_BUSY */ || l_error_64 == 136/* OFF_QUOTES */)) break;
         Sleep(1000);
      }
      break;
   case 4:
      for (l_count_68 = 0; l_count_68 < li_72; l_count_68++) {
         l_ticket_60 = OrderSend(Symbol(), OP_BUYSTOP, pLots, pPrice, pSlippage, StopLong(ad_24, ai_32), TakeLong(pPrice, ai_36), a_comment_40, a_magic_48, a_datetime_52, a_color_56);
         l_error_64 = GetLastError();
         if (l_error_64 == 0/* NO_ERROR */) break;
         if (!(l_error_64 == 4/* SERVER_BUSY */ || l_error_64 == 137/* BROKER_BUSY */ || l_error_64 == 146/* TRADE_CONTEXT_BUSY */ || l_error_64 == 136/* OFF_QUOTES */)) break;
         Sleep(5000);
      }
      break;
   case 0:
      for (l_count_68 = 0; l_count_68 < li_72; l_count_68++) {
         RefreshRates();
         l_ticket_60 = OrderSend(Symbol(), OP_BUY, pLots, NormalizeDouble(Ask,Digits), pSlippage, StopLong(Bid, ai_32), TakeLong(Ask, ai_36), a_comment_40, a_magic_48, a_datetime_52, a_color_56);
         l_error_64 = GetLastError();
         if (l_error_64 == 0/* NO_ERROR */) break;
         if (!(l_error_64 == 4/* SERVER_BUSY */ || l_error_64 == 137/* BROKER_BUSY */ || l_error_64 == 146/* TRADE_CONTEXT_BUSY */ || l_error_64 == 136/* OFF_QUOTES */)) break;
         Sleep(5000);
      }
      break;
   case 3:
      for (l_count_68 = 0; l_count_68 < li_72; l_count_68++) {
         l_ticket_60 = OrderSend(Symbol(), OP_SELLLIMIT, pLots, pPrice, pSlippage, StopShort(ad_24, ai_32), TakeShort(pPrice, ai_36), a_comment_40, a_magic_48, a_datetime_52, a_color_56);
         l_error_64 = GetLastError();
         if (l_error_64 == 0/* NO_ERROR */) break;
         if (!(l_error_64 == 4/* SERVER_BUSY */ || l_error_64 == 137/* BROKER_BUSY */ || l_error_64 == 146/* TRADE_CONTEXT_BUSY */ || l_error_64 == 136/* OFF_QUOTES */)) break;
         Sleep(5000);
      }
      break;
   case 5:
      for (l_count_68 = 0; l_count_68 < li_72; l_count_68++) {
         l_ticket_60 = OrderSend(Symbol(), OP_SELLSTOP, pLots, pPrice, pSlippage, StopShort(ad_24, ai_32), TakeShort(pPrice, ai_36), a_comment_40, a_magic_48, a_datetime_52, a_color_56);
         l_error_64 = GetLastError();
         if (l_error_64 == 0/* NO_ERROR */) break;
         if (!(l_error_64 == 4/* SERVER_BUSY */ || l_error_64 == 137/* BROKER_BUSY */ || l_error_64 == 146/* TRADE_CONTEXT_BUSY */ || l_error_64 == 136/* OFF_QUOTES */)) break;
         Sleep(5000);
      }
      break;
   case 1:
      for (l_count_68 = 0; l_count_68 < li_72; l_count_68++) {
         l_ticket_60 = OrderSend(Symbol(), OP_SELL, pLots, NormalizeDouble(Bid,Digits), pSlippage, StopShort(Ask, ai_32), TakeShort(Bid, ai_36), a_comment_40, a_magic_48, a_datetime_52, a_color_56);
         l_error_64 = GetLastError();
         if (l_error_64 == 0/* NO_ERROR */) break;
         if (!(l_error_64 == 4/* SERVER_BUSY */ || l_error_64 == 137/* BROKER_BUSY */ || l_error_64 == 146/* TRADE_CONTEXT_BUSY */ || l_error_64 == 136/* OFF_QUOTES */)) break;
         Sleep(5000);
      }
   }
   return (l_ticket_60);
}

double StopLong(double ad_0, int ai_8) {
   if (ai_8 == 0) return (0);
   else return (ad_0 - ai_8 * Point);
}

double StopShort(double ad_0, int ai_8) {
   if (ai_8 == 0) return (0);
   else return (ad_0 + ai_8 * Point);
}

double TakeLong(double ad_0, int ai_8) {
   if (ai_8 == 0) return (0);
   else return (ad_0 + ai_8 * Point);
}

double TakeShort(double ad_0, int ai_8) {
   if (ai_8 == 0) return (0);
   else return (ad_0 - ai_8 * Point);
}

double CalculateProfit() {
   double ld_ret_0 = 0;
   for (cnt = OrdersTotal() - 1; cnt >= 0; cnt--) {
      OrderSelect(cnt, SELECT_BY_POS, MODE_TRADES);
      if (OrderSymbol() != Symbol() || OrderMagicNumber() != MagicNumber) continue;
      if (OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber)
         if (OrderType() == OP_BUY || OrderType() == OP_SELL) ld_ret_0 += OrderProfit();
   }
   return (ld_ret_0);
}

void TrailingAlls(int pType, int ai_4, double a_price_8) {
   int l_ticket_16;
   double l_ord_stoploss_20;
   double l_price_28;
   if (ai_4 != 0) {
      for (int l_pos_36 = OrdersTotal() - 1; l_pos_36 >= 0; l_pos_36--) {
         if (OrderSelect(l_pos_36, SELECT_BY_POS, MODE_TRADES)) {
            if (OrderSymbol() != Symbol() || OrderMagicNumber() != MagicNumber) continue;
            if (OrderSymbol() == Symbol() || OrderMagicNumber() == MagicNumber) {
               if (OrderType() == OP_BUY) {
                  l_ticket_16 = NormalizeDouble((Bid - a_price_8) / Point, 0);
                  if (l_ticket_16 < pType) continue;
                  l_ord_stoploss_20 = OrderStopLoss();
                  l_price_28 = Bid - ai_4 * Point;
                  if (l_ord_stoploss_20 == 0.0 || (l_ord_stoploss_20 != 0.0 && l_price_28 > l_ord_stoploss_20)) OrderModify(OrderTicket(), a_price_8, l_price_28, OrderTakeProfit(), 0, Aqua);
               }
               if (OrderType() == OP_SELL) {
                  l_ticket_16 = NormalizeDouble((a_price_8 - Ask) / Point, 0);
                  if (l_ticket_16 < pType) continue;
                  l_ord_stoploss_20 = OrderStopLoss();
                  l_price_28 = Ask + ai_4 * Point;
                  if (l_ord_stoploss_20 == 0.0 || (l_ord_stoploss_20 != 0.0 && l_price_28 < l_ord_stoploss_20)) OrderModify(OrderTicket(), a_price_8, l_price_28, OrderTakeProfit(), 0, Red);
               }
            }
            Sleep(1000);
         }
      }
   }
}

double AccountEquityHigh() {
   if (CountTrades() == 0) AccountEquityHighAmt = AccountEquity();
   if (AccountEquityHighAmt < PrevEquity) AccountEquityHighAmt = PrevEquity;
   else AccountEquityHighAmt = AccountEquity();
   PrevEquity = AccountEquity();
   return (AccountEquityHighAmt);
}

double FindLastBuyPrice() {
   double l_ord_open_price_8;
   int l_ticket_24;
   double ld_unused_0 = 0;
   int l_ticket_20 = 0;
   for (int l_pos_16 = OrdersTotal() - 1; l_pos_16 >= 0; l_pos_16--) {
      OrderSelect(l_pos_16, SELECT_BY_POS, MODE_TRADES);
      if (OrderSymbol() != Symbol() || OrderMagicNumber() != MagicNumber) continue;
      if (OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber && OrderType() == OP_BUY) {
         l_ticket_24 = OrderTicket();
         if (l_ticket_24 > l_ticket_20) {
            l_ord_open_price_8 = OrderOpenPrice();
            ld_unused_0 = l_ord_open_price_8;
            l_ticket_20 = l_ticket_24;
         }
      }
   }
   return (NormalizeDouble(l_ord_open_price_8,Digits));
}

double FindLastSellPrice() {
   double l_ord_open_price_8;
   int l_ticket_24;
   double ld_unused_0 = 0;
   int l_ticket_20 = 0;
   for (int l_pos_16 = OrdersTotal() - 1; l_pos_16 >= 0; l_pos_16--) {
      OrderSelect(l_pos_16, SELECT_BY_POS, MODE_TRADES);
      if (OrderSymbol() != Symbol() || OrderMagicNumber() != MagicNumber) continue;
      if (OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber && OrderType() == OP_SELL) {
         l_ticket_24 = OrderTicket();
         if (l_ticket_24 > l_ticket_20) {
            l_ord_open_price_8 = OrderOpenPrice();
            ld_unused_0 = l_ord_open_price_8;
            l_ticket_20 = l_ticket_24;
         }
      }
   }
   return (NormalizeDouble(l_ord_open_price_8,Digits));
}

//======================== MM ======================
double GetLots() 
{
double minlot = MarketInfo(Symbol(), MODE_MINLOT);

if(Risk!=0)
 {
   double lot = NormalizeDouble(AccountEquity() * Risk/100 / 1000.0, 2);
   if(lot < minlot) lot = minlot;
  }
  else lot=Lots; 
   return(lot);
} 

//--------------------------------------------------

void Switcher()
{int TF;
 int TFe;
 int hwnd;
 int ot;
 TF=0; TFe=0;
 ot=OrdersTotal();
if (MagicNumber!=0)
{
ot=0;
     for(int i=1; i<=OrdersTotal(); i++)                
    {
             if (OrderSelect(i-1,SELECT_BY_POS)==true)       
        {                                            
                if (OrderMagicNumber() == MagicNumber) 
            {
            ot=ot+1;    
            }
        }
    }   
}

 if ((ot>=MN) && (MN>-1)) {TF=33334; TFe=PERIOD_MN1;} 
 else if (ot>=W1 && (W1>-1)) {TF=33141; TFe=PERIOD_W1;} 
 else if (ot>=D1 && (D1>-1)) {TF=33134; TFe=PERIOD_D1;} 
 else if (ot>=H4 && (H4>-1)) {TF=33136; TFe=PERIOD_H4;}
 else if (ot>=H1 && (H1>-1)) {TF=35400; TFe=PERIOD_H1;} 
 else if (ot>=M30 && (M30>-1)) {TF=33140; TFe=PERIOD_M30;} 
 else if (ot>=M15 && (M15>-1)) {TF=33139; TFe=PERIOD_M15;} 
 else if (ot>=M5 && (M5>-1)) {TF=33138; TFe=PERIOD_M5;} 
 else if (ot>=M1 && (M1>-1)) {TF=33137; TFe=PERIOD_M1;} else {TF=0;}
 if (TF!=0 && TFe!=Period())
 {hwnd=WindowHandle(Symbol(),Period());
  PostMessageA(hwnd,WM_COMMAND,TF,0); 
  Sleep(500);}
}



//--------------------------------------------------------------- 3 --
int Criterion()                        // ���������������� �������
  {
   string Sym="EURUSD";
   if (Sym!=Symbol())                  // ���� �� ��� ���. ����������
     {
      Inform(16);                      // ���������..
      return(-1);                      // .. � �����
     }
   double
   M_0, M_1,                           // �������� MAIN �� 0 � 1 �����
   S_0, S_1,                           // �������� SIGNAL �� 0 � 1 ���
   St_M_0, St_M_1,                     // �������� MAIN �� 0 � 1 �����
   St_S_0, St_S_1;                     // �������� SIGNAL �� 0 � 1 ���
   double Opn=Open_Level*Point;        // ������� ����. MACD (�������)
   double Cls=Close_Level*Point;       // ������� ����. MACD (�������)
//--------------------------------------------------------------- 4 --
   // ��������� ������. �������:
   M_0=iMACD(Sym,Period(),5,34,5,PRICE_CLOSE,MODE_MAIN,0); // 0 ���
   M_1=iMACD(Sym,Period(),5,34,5,PRICE_CLOSE,MODE_MAIN,1); // 1 ���
   S_0=iMACD(Sym,Period(),5,34,5,PRICE_CLOSE,MODE_SIGNAL,0);//0 ���
   S_1=iMACD(Sym,Period(),5,34,5,PRICE_CLOSE,MODE_SIGNAL,1);//1 ���
 
   St_M_0=iStochastic(Sym,Period(),5,3,5,MODE_SMA,0,MODE_MAIN,  0);
   St_M_1=iStochastic(Sym,Period(),5,3,5,MODE_SMA,0,MODE_MAIN,  1);
   St_S_0=iStochastic(Sym,Period(),5,3,5,MODE_SMA,0,MODE_SIGNAL,0);
   St_S_1=iStochastic(Sym,Period(),5,3,5,MODE_SMA,0,MODE_SIGNAL,1);
//--------------------------------------------------------------- 5 --
   // ���������� �������� ���������
   if(M_0>S_0 && -M_0>Opn && St_M_0>St_S_0 && St_S_0<St_min)
      return(10);                      // �������� Buy    
   if(M_0<S_0 &&  M_0>Opn && St_M_0<St_S_0 && St_S_0>St_max)
      return(20);                      // �������� Sell 
   if(M_0<S_0 &&  M_0>Cls && St_M_0<St_S_0 && St_S_0>St_max)
      return(11);                      // �������� Buy    
   if(M_0>S_0 && -M_0>Cls && St_M_0>St_S_0 && St_S_0<St_min)
      return(21);                      // �������� Sell         
//--------------------------------------------------------------- 6 --
   return(0);                          // ����� �� �������. �������
  }
  
  
  int Inform(int Mess_Number, int Number=0, double Value=0.0)
  {
   // int    Mess_Number               // ����� ���������  
   // int    Number                    // ������������ ����� ��������
   // double Value                     // ������������ ��������. ����.
   int    Win_ind;                     // ����� ���� ����������
   string Graf_Text;                   // ������ ���������
   color  Color_GT;                    // ���� ������ ���������
   static int    Time_Mess;            // ����� ��������� ���������� �����.
   static int    Nom_Mess_Graf;        // ������� ����������� ���������
   static string Name_Grf_Txt[30];     // ������ ��� ������. ���������
//--------------------------------------------------------------- 3 --
   Win_ind= WindowFind("inform");      // ���� ����� ���� ����������
   if (Win_ind<0)return;               // ���� ������ ���� ���, ������
//--------------------------------------------------------------- 4 --
   if (Mess_Number==0)                 // ��� ���������� � ������ ����
     {
      if (Time_Mess==0) return;        // ���� ��� ������� �����
      if (GetTickCount()-Time_Mess>15000)// �� 15 ��� ���� �������
        {
         for(int i=0;i<=29; i++)       // ������ c����� �����
            ObjectSet( Name_Grf_Txt[i], OBJPROP_COLOR, Gray);
         Time_Mess=0;                  // ������: ��� ������ �����
         WindowRedraw();               // �������������� �������
        }
      return;                          // ����� �� �������
     }
//--------------------------------------------------------------- 5 --
   if (Mess_Number==-1)                // ��� ���������� ��� deinit()
     {
      for(i=0; i<=29; i++)             // �� �������� ��������
         ObjectDelete(Name_Grf_Txt[i]);// �������� �������
      return;                          // ����� �� �������
     }
//--------------------------------------------------------------- 6 --
   Nom_Mess_Graf++;                    // ������� ����������� �����.
   Time_Mess=GetTickCount();           // ����� ��������� ���������� 
   Color_GT=Lime;
//--------------------------------------------------------------- 7 --
   switch(Mess_Number)                 // ������� �� ���������
     {
      case 1:
         Graf_Text="������ ����� Buy "+ Number;
         PlaySound("Close_order.wav");                         break;
      case 2:
         Graf_Text="������ ����� Sell "+ Number;
         PlaySound("Close_order.wav");                         break;
      case 3:
         Graf_Text="����� ���������� ����� "+ Number;
         PlaySound("Close_order.wav");                         break;
      case 4:
         Graf_Text="������ ����� Buy "+ Number;
         PlaySound("Ok.wav");                                  break;
      case 5:
         Graf_Text="������ ����� Sell "+ Number;
         PlaySound("Ok.wav");                                  break;
      case 6:
         Graf_Text="���������� ���������� ����� "+ Number;
         PlaySound("Ok.wav");                                  break;
      case 7:
         Graf_Text="����� "+Number+" �������������� � ��������";
         PlaySound("Transform.wav");                           break;
      case 8:
         Graf_Text="���������� ����� "+ Number;                break;
         PlaySound("Bulk.wav");
      case 9:
         Graf_Text="�������� ������ ����� "+ Number;
         PlaySound("Close_order.wav");                         break;
      case 10:
         Graf_Text="����� ����������� ���������: "+ Number;
         PlaySound("Inform.wav");                              break;
      case 11:
         Graf_Text=" �� ������� ����� �� "+
         DoubleToStr(Value,2) + " �����";
         Color_GT=Red;
         PlaySound("Oops.wav");                                break;
      case 12:
         Graf_Text="������� ������� ����� "+ Number;
         PlaySound("expert.wav");                              break;
      case 13:
         if (Number>0)
            Graf_Text="������� ������� ����� Sell..";
         else
            Graf_Text="������� ������� ����� Buy..";
         PlaySound("expert.wav");                              break;
      case 14:
         Graf_Text="������������ ������. ������� �� ��������.";
         Color_GT=Red;
         PlaySound("Oops.wav");                                break;
      case 15:
         switch(Number)                 // ������� �� ����� ������
           {
            case 2:   Graf_Text="����� ������.";             break;
            case 129: Graf_Text="������������ ����. ";       break;
            case 135: Graf_Text="���� ����������. ";         break;
            case 136: Graf_Text="��� ���. ��� ����� ���.."; break;
            case 146: Graf_Text="���������� �������� ������";break;
            case 5 :  Graf_Text="������ ������ ���������.";  break;
            case 64:  Graf_Text="���� ������������.";        break;
            case 133: Graf_Text="�������� ���������";        break;
            default:  Graf_Text="�������� ������ " + Number;//������
           }
         Color_GT=Red;
         PlaySound("Error.wav");                               break;
      case 16:
         Graf_Text="������� �������� ������ �� EURUSD";
         Color_GT=Red;
         PlaySound("Oops.wav");                                break;
      default:
         Graf_Text="default "+ Mess_Number;
         Color_GT=Red;
         PlaySound("Bzrrr.wav");
     }
//--------------------------------------------------------------- 8 --
   ObjectDelete(Name_Grf_Txt[29]);      // 29�(�������) ������ �������
   for(i=29; i>=1; i--)                 // ���� �� �������� ������� ..
     {                                 // .. ����������� ��������
      Name_Grf_Txt[i]=Name_Grf_Txt[i-1];// ��������� �������:
      ObjectSet( Name_Grf_Txt[i], OBJPROP_YDISTANCE, 2+15*i);
     }
   Name_Grf_Txt[0]="Inform_"+Nom_Mess_Graf+"_"+Symbol(); // ��� ������
   ObjectCreate (Name_Grf_Txt[0],OBJ_LABEL, Win_ind,0,0);// ������
   ObjectSet    (Name_Grf_Txt[0],OBJPROP_CORNER, 3   );  // ����
   ObjectSet    (Name_Grf_Txt[0],OBJPROP_XDISTANCE, 450);// �����. �
   ObjectSet    (Name_Grf_Txt[0],OBJPROP_YDISTANCE, 2);  // �����. Y
   // ��������� �������� �������
   ObjectSetText(Name_Grf_Txt[0],Graf_Text,10,"Courier New",Color_GT);
   WindowRedraw();                      // �������������� ��� �������
   return;
  }
        
