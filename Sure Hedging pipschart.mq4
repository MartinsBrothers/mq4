//+------------------------------------------------------------------+
//|                                    ____LuckyTrade_0_0.mq4 |
//|                                                   inside7 |
//|                                         lieinside7@gmail.com |
//+------------------------------------------------------------------+
#property copyright "inside7"
#property link      "lieinside7@gmail.com"


#include <stderror.mqh>


#define sec_wait_context 10
#define max_errors 30
#define wait_error 1000
#define busysleep 100
#define EB_NEXTTRY 0
#define EB_WAITTRY 1
#define EB_TERMINATE 2
#define StoplevelAdd 0


extern int initial_deal = 0 ; // Arah kesepakatan awal: 0 - kesepakatan beli, 1 - kesepakatan jual, nilai lain - pembukaan baru dinonaktifkan
extern double stoploss = 60 ; // Stoploss untuk semua transaksi
extern double takeprofit = 30 ; //ambil untung untuk semua transaksi
extern double fixed_lot = 0.1 ; // Jika > 0, kesepakatan awal akan dibuka dengan lot ini
extern double deposit_lot = 0 ; // Jika fixed_lot adalah 0 dan deposit_lot > 0, kesepakatan awal akan dibuka dengan Volume Saldo / lot deposit_lot
extern double martin_koeff1 = 3 ; // Pengganda lot untuk transaksi lindung nilai pertama
extern double martin_koeff2 = 2 ; // Pengganda lot untuk transaksi lindung nilai kedua, ketiga dan selanjutnya
extern int enable_daily_profit = 0 ; // Aktifkan opsi untuk menghentikan perdagangan jika keuntungan harian melebihi nilai berikut (ini mempertimbangkan keuntungan untuk SEMUA mata uang)
extern double daily_profit = 0 ; // Keuntungan harian dalam mata uang akun
extern double daily_profit_percent = 0 ; // Keuntungan harian sebagai persen ke Saldo awal hari
extern double distance0 = 30 ; // Jika > 0, jarak untuk menempatkan kesepakatan lindung nilai pertama
extern double distance1 = 0 ; // Jika > 0, jarak untuk menempatkan kesepakatan lindung nilai ke-2
extern double distance2 = 0 ; // Jika > 0, jarak untuk menempatkan kesepakatan lindung nilai ke-3
extern double distance3 = 0 ; // Jika > 0, jarak untuk menempatkan kesepakatan lindung nilai ke-4
extern double distance4 = 0 ; // Jika > 0, jarak untuk menempatkan kesepakatan lindung nilai ke-5
extern double distance5 = 0 ; // Jika > 0, jarak untuk menempatkan kesepakatan lindung nilai ke-6
extern double distance6 = 0 ; // Jika > 0, jarak untuk menempatkan kesepakatan lindung nilai ke-7
extern double distance7 = 0 ; // Jika > 0, jarak untuk menempatkan kesepakatan lindung nilai ke-8
extern double distance8 = 0 ; // Jika > 0, jarak untuk menempatkan kesepakatan lindung nilai ke-9
extern double distance9 = 0 ; // Jika > 0, jarak untuk menempatkan kesepakatan lindung nilai ke-10
extern double normal_spread = 0 ; // Nilai dalam pips ini dikurangi dari takeprofit SELL dan ditambahkan ke stoploss SELL untuk mempertimbangkan spread
extern string sep0 = " common EA settings " ;
extern int params_digits = 4 ; // Jika = 4, maka stoploss, takeprofit dan jarak ditentukan dalam poin 4 digit, jika = 5, maka dalam pips 5 digit
extern int initial_magic = 123000 ; // Angka ajaib awal untuk kesepakatan pertama. Transaksi lindung nilai menambahkan 1 ke nomor ini
extern int market_execution = 0 ; // Set ke 1 untuk akun ECN dan STP (stoploss dan takeprofit diubah hanya setelah pesanan dikirim)
extern int command_attempts = 5 ; // Jumlah upaya pengiriman permintaan broker secara simultan (jika terjadi kesalahan)
extern int max_slippage = 10 ; // Maximum slippage perbedaan antara harga yang diinginkan oleh trader saat melakukan order, dengan harga sesungguhnya dimana order dieksekusi


int go = true ;
double point, d_stoplevel, d_freezelevel, d_buystop, d_sellstop, d_buytake, d_selltake ;
int errors = 0 ;
int lotsdigits ;


double dist [10] ;


int init()
{
   if (takeprofit <= 0)
   {
      go = false ;
      return ;
   }
   if (distance0 <= 0)
   {
      distance0 = takeprofit ;
   }
   point = MathPow (0.1, params_digits) ;   
   d_freezelevel = MarketInfo (Symbol (), MODE_FREEZELEVEL) * Point ;
   d_buystop = NormalizeDouble (stoploss * point, Digits) ;
   d_selltake = NormalizeDouble ((takeprofit - normal_spread) * point, Digits) ;
   d_sellstop = NormalizeDouble ((stoploss + normal_spread) * point, Digits) ;
   d_buytake = NormalizeDouble (takeprofit * point, Digits) ;

   dist [0] = NormalizeDouble (distance0 * point, Digits) ;
   if (distance1 > 0) { dist [1] = NormalizeDouble (distance1 * point, Digits) ; } else { dist [1] = NormalizeDouble (distance0 * point, Digits) ; }
   if (distance2 > 0) { dist [2] = NormalizeDouble (distance2 * point, Digits) ; } else { dist [2] = NormalizeDouble (distance0 * point, Digits) ; }
   if (distance3 > 0) { dist [3] = NormalizeDouble (distance3 * point, Digits) ; } else { dist [3] = NormalizeDouble (distance0 * point, Digits) ; }
   if (distance4 > 0) { dist [4] = NormalizeDouble (distance4 * point, Digits) ; } else { dist [4] = NormalizeDouble (distance0 * point, Digits) ; }
   if (distance5 > 0) { dist [5] = NormalizeDouble (distance5 * point, Digits) ; } else { dist [5] = NormalizeDouble (distance0 * point, Digits) ; }
   if (distance6 > 0) { dist [6] = NormalizeDouble (distance6 * point, Digits) ; } else { dist [6] = NormalizeDouble (distance0 * point, Digits) ; }
   if (distance7 > 0) { dist [7] = NormalizeDouble (distance7 * point, Digits) ; } else { dist [7] = NormalizeDouble (distance0 * point, Digits) ; }
   if (distance8 > 0) { dist [8] = NormalizeDouble (distance8 * point, Digits) ; } else { dist [8] = NormalizeDouble (distance0 * point, Digits) ; }
   if (distance9 > 0) { dist [9] = NormalizeDouble (distance9 * point, Digits) ; } else { dist [9] = NormalizeDouble (distance0 * point, Digits) ; }
   
   lotsdigits = 0 ;
   
   if (MarketInfo (Symbol (), MODE_LOTSTEP) == 0.1)
   {
      lotsdigits = 1 ;
   }
   if (MarketInfo (Symbol (), MODE_LOTSTEP) == 0.01)
   {
      lotsdigits = 2 ;
   }
   if (MarketInfo (Symbol (), MODE_LOTSTEP) == 0.001)
   {
      lotsdigits = 3 ;
   }
}


int start()
{
   if (! go)
   {
      return ;
   }
   if (errors >= max_errors)
   {
      Comment (
         "Exceeded maximum count of rejects from broker" + "\n" + 
         "See experts tab for the information" + "\n" +
         "Expert should be restarted to continue") ;
      return ;
   }
   if (_IsNotTradeContextBusy () < 0)
   {
      return ;
   }   
   if (! IsTradeAllowed ())
   {
      Comment ("Trade by experts is prohibited") ;
      return ;
   }
   if (! IsConnected () && ! IsTesting () && ! IsOptimization ())
   {
      Comment ("No connection with the trade server") ;
      return ;
   }/*   
   if (stoplevel_is_spread)
   {
      d_stoplevel = NormalizeDouble (Ask - Bid + StoplevelAdd * point, Digits) ;
   }
   else*/
   {
      d_stoplevel = NormalizeDouble (MarketInfo (Symbol (), MODE_STOPLEVEL) * Point + StoplevelAdd * point, Digits) ;
   }

   for (int i = OrdersTotal () - 1; i >= 0; i --)
   {
      if (OrderSelect (i, SELECT_BY_POS) && OrderSymbol () == Symbol () && OrderMagicNumber () >= initial_magic && OrderMagicNumber () <= initial_magic + 100)
      {
         switch (OrderType ())
         {
            case OP_BUYSTOP:
            case OP_SELLSTOP:
               int tick = OrderTicket () ;
            
               if (OrderSelect (StrToDouble (OrderComment ()), SELECT_BY_TICKET) && OrderCloseTime () > 0)
               {
                  PendingRemove (tick) ;
               }               
               break ;
         }
      }
   }
   if (MyOrders () == 0 && ! ProfitReached ()) // Open a new
   {
      switch (LastProfitDir ())
      {
         case 0:
            MarketSend (OP_BUY, Lots (), d_buystop, d_buytake, initial_magic) ;
            
            break ;
         case 1:
            MarketSend (OP_SELL, Lots (), d_sellstop, d_selltake, initial_magic) ;
      }       
   }
   for (i = OrdersTotal () - 1; i >= 0; i --)
   {
      if (OrderSelect (i, SELECT_BY_POS) && OrderSymbol () == Symbol () && OrderMagicNumber () >= initial_magic && OrderMagicNumber () <= initial_magic + 100)
      {
         switch (OrderType ())
         {
            case OP_BUY:
               if (! HedgeIsSet (OrderMagicNumber () + 1))
               {
                  PendingSend (OP_SELLSTOP, Lots (OrderMagicNumber () - initial_magic + 1), OrderOpenPrice () - dist [(OrderMagicNumber () - initial_magic) % 10], d_sellstop, d_selltake, OrderMagicNumber () + 1, DoubleToStr (OrderTicket (), 0)) ;
               }
               break ;
               
            case OP_SELL:
               if (! HedgeIsSet (OrderMagicNumber () + 1))
               {
                  PendingSend (OP_BUYSTOP, Lots (OrderMagicNumber () - initial_magic + 1), OrderOpenPrice () + dist [(OrderMagicNumber () - initial_magic) % 10], d_buystop, d_buytake, OrderMagicNumber () + 1, DoubleToStr (OrderTicket (), 0)) ;
               }
               break ;
         }
      }
   }
}

int ErrorBlock (int err, int ms)
{
   string str = "" ;
   int res = EB_TERMINATE ;

   switch (err)
   {
      case ERR_NO_ERROR:
         str = "No error" ;
         
         break ;
      case ERR_NO_RESULT:
         str = "Unknown result" ;
         
         break ;
      case ERR_COMMON_ERROR:
         str = "Common error. Probably the signal was rejected by user or trade direction is denied in expert settings" ;
         
         
         break ;
      case ERR_INVALID_TRADE_PARAMETERS:
         str = "Wrong trade function parameters" ;
         
         break ;
      case ERR_SERVER_BUSY:
         str = "Server is busy. Waiting..." ;
         res = EB_WAITTRY ;
         
         break ;
      case ERR_OLD_VERSION:
         str = "Old version of client terminal" ;
         
         break ;
      case ERR_NO_CONNECTION:
         str = "No connection with trade server. Waiting..." ;
         res = EB_WAITTRY ;
      
         break ;
      case ERR_NOT_ENOUGH_RIGHTS:
         str = "Not enough rights" ;
         
         break ;   
      case ERR_TOO_MANY_REQUESTS:
      case ERR_TOO_FREQUENT_REQUESTS:
         str = "To many requests" ;
         
         break ;
      case ERR_MALFUNCTIONAL_TRADE:
         str = "Malfunctional trade" ;
         
         break ;
      case ERR_ACCOUNT_DISABLED:
         str = "The account is blocked" ;
         
         break ;
      case ERR_INVALID_ACCOUNT:
         str = "Invalid account" ;
         
         break ;
      case ERR_TRADE_TIMEOUT:
         str = "Trade timeout exceeded" ;
         res = EB_NEXTTRY ;
         
         break ;
      case ERR_INVALID_PRICE:
         str = "Wrong price" ;
         res = EB_NEXTTRY ;
         
         break ;
      case ERR_INVALID_STOPS:
         str = "Invalid stops" ;

         break ;
      case ERR_INVALID_TRADE_VOLUME:
         str = "Invalid trade volume" ;
         
         break ;
      case ERR_MARKET_CLOSED:
         str = "The market is closed" ;
         
         break ;
      case ERR_TRADE_DISABLED:
         str = "Trade is disabled" ;
         
         break ;
      case ERR_NOT_ENOUGH_MONEY:
         str = "Not enough money to complete operation" ;
         
         break ;
      case ERR_PRICE_CHANGED:
         str = "The price has changed, trying again" ;
         res = EB_NEXTTRY ;
         
         break ;
      case ERR_OFF_QUOTES:
         str = "The broker sent offquotes. Trying again" ;
         res = EB_NEXTTRY ;
         
         break ;
      case ERR_BROKER_BUSY:
         str = "The broker is budy. Waiting..." ;
         res = EB_WAITTRY ;
         
         break ;
      case ERR_REQUOTE:
         str = "The broker sent requote. Trying again" ;
         res = EB_WAITTRY ;
         
         break ;
      case ERR_ORDER_LOCKED:
         str = "The order is already processing" ;
         
         break ;
      case ERR_LONG_POSITIONS_ONLY_ALLOWED:
         str = "Only long positions allowed" ;
         
         break ;
      case ERR_TRADE_MODIFY_DENIED:
         str = "Modification is denied because the order is too close to the price" ;
         res = EB_WAITTRY ;
         
         break ;
      case ERR_TRADE_CONTEXT_BUSY: 
         if (_IsNotTradeContextBusy () >= 0)
         {
            res = EB_NEXTTRY ;
         }
         return (res) ;
         
      case ERR_TRADE_EXPIRATION_DENIED:
         str = "Expiration date usage is denied by the broker" ;
         
         break ;
      case ERR_TRADE_TOO_MANY_ORDERS:
         str = "Too many orders" ;
         
         break ;
      case ERR_TRADE_HEDGE_PROHIBITED:
         str = "Hedging is denied by broker" ;
         
         break ;
      case ERR_TRADE_PROHIBITED_BY_FIFO:
         str = "Cannot close a deal because FIFO order is violated" ;
         
         break ;
      case 4107:
         str = "Wrong price for OrderSend function" ;
         
         break ;      
      case 4051:
         str = "Wrong takeprofit for OrderModify function" ;
      default:
      
         str = "Unknown error ¹" + DoubleToStr (err, 0) ;
   }  
   str = StringConcatenate (str, " (the request is processed by broker in ", DoubleToStr (GetTickCount () - ms, 0), " ms)") ;
   
   Print (str) ;
   return (res) ;
}

int _IsNotTradeContextBusy()
  {
// ïðîâåðÿåì, ñâîáîäåí ëè òîðãîâûé ïîòîê
	  if(IsTradeContextBusy())
	    {
		     int StartWaitingTime = GetTickCount();
		     Print("Trade context is busy. Waiting...");
		     // áåñêîíå÷íûé öèêë
		     while(true)
		       {
			        // åñëè îæèäàíèå äëèòñÿ äîëüøå âðåìåíè, óêàçàííîãî â ïåðåìåííîé 
			        // MaxWaiting_sec, òîæå ïðåêðàùàåì ðàáîòó
			        if(GetTickCount() - StartWaitingTime > sec_wait_context * 1000)
			          {
				           Print("Waiting limit exceeded (" + sec_wait_context + " sec.)!");
				           return(-2);
			          }
			        // åñëè òîðãîâûé ïîòîê îñâîáîäèëñÿ,
			        if(!IsTradeContextBusy())
			          {
				           //Print("òîðãîâûé ïîòîê îñâîáîäèëñÿ");
				           return(0);
			          }
			        // åñëè íè îäíî èç óñëîâèé îñòàíîâêè öèêëà íå ñðàáîòàëî, 
			        // "æä¸ì" 0,1 ñåêóíäû è íà÷èíàåì ïðîâåðêó ñíà÷àëà
			        Sleep( busysleep );
		       }
	    }
	  else
	    {
		     //Print("Òîðãîâûé ïîòîê ñâîáîäåí!");
		     return(1);
	    }
  }



int MarketModify (int tick, double stop, double take)
{
   if (! OrderSelect (tick, SELECT_BY_TICKET) || OrderType () >= 2 || OrderCloseTime () > 0)
   {
      Print ("Wrong ticket for MarketModify function") ;
      return (-3) ;  
   }
   double use_sl = 0, use_tp = 0 ;
   
   if (stop > 0)
   {
      if (OrderType () == OP_BUY)
      {
         use_sl = OrderOpenPrice () - stop ;
      }
      else
      {
         use_sl = OrderOpenPrice () + stop ;
      }
   }
   if (stop < 0)
   {
      use_sl = -stop ;
   }
   if (take > 0)
   {
      if (OrderType () == OP_BUY)
      {
         use_tp = OrderOpenPrice () + take ;
      }
      else
      {
         use_tp = OrderOpenPrice () - take ;
      }
   }
   if (take < 0)
   {
      use_tp = -take ;
   }
   if (MathAbs (OrderStopLoss () - use_sl) < Point && MathAbs (use_tp - OrderTakeProfit ()) < Point)
   {
      Print ("There was an attempt to modify market order without changes to TP and SL") ;
      return (-3) ;
   }

   int attempt = 1 ;
   bool result = false ;
   
   while (attempt <= command_attempts && ! result)
   {/*
      if ((OrderType () == OP_BUY && (MarketInfo (OrderSymbol (), MODE_BID) - use_sl < d_stoplevel || use_tp - MarketInfo (OrderSymbol (), MODE_BID) < d_stoplevel)) || 
          (OrderType () == OP_SELL && (use_sl - MarketInfo (OrderSymbol (), MODE_ASK) < d_stoplevel || MarketInfo (OrderSymbol (), MODE_ASK) - use_tp < d_stoplevel)))
      {
         Print ("Couldn''t modify order ", tick, " because of broker stops level") ;
         return (-2) ;
      }
      if ((OrderType () == OP_BUY && (MarketInfo (OrderSymbol (), MODE_BID) - use_sl < d_freezelevel || use_tp - MarketInfo (OrderSymbol (), MODE_BID) < d_freezelevel)) || 
          (OrderType () == OP_SELL && (use_sl - MarketInfo (OrderSymbol (), MODE_ASK) < d_freezelevel || MarketInfo (OrderSymbol (), MODE_ASK) - use_tp < d_freezelevel)))
      {
         Print ("Couldn''t modify order ", tick, " because its level is too close to the price") ;
         return (-2) ;
      }*/

      int ms = GetTickCount () ;
      
      Print ("Attempt #", attempt, " to modify market order ", tick, " to stoploss ", DoubleToStr (use_sl, Digits), " and takeprofit ", DoubleToStr (use_tp, Digits)) ;
      result = OrderModify (tick, OrderOpenPrice (), use_sl, use_tp, 0) ;
      
      if (! result)
      {
         errors ++ ;
      
         int err = GetLastError () ;
         
         switch (ErrorBlock (err, ms))
         {
            case 0: // continue
            
               break ;
            case 1: // wait and continue
               Sleep (wait_error) ;
               
               break ;
            case 2: // terminate
               return (-1) ;
         }
      }
      else
      {
         errors = 0 ;
         Print ("Order successfully modified in ", GetTickCount () - ms, " ms") ;
      }
      if (errors > max_errors)
      {
         Print ("Exceeded maximum errors count while trying to send trading command.") ;
         Print ("To continue you should restart terminal or the EA") ; 
         return (-1) ;
      }
      attempt ++ ;
      
      if (attempt > command_attempts && ! result)
      {
         return (-1) ;
      }      
   }      
   return (1) ;
}


int PendingSend (int type, double lots, double price, double stop, double take, int magic_number, string comm)
{
   if (type < 2 || type > 5)
   {
      Print ("Error in type of pending order!") ;
      return (-3) ;
   }
   bool price_err = false, sltp_err = false ;
   
   RefreshRates () ;
   double use_sl = 0, use_tp = 0 ;
   
   if (stop > 0 && stop < d_stoplevel)
   {
      Print ("Stoploss for sending pending order is lesser that stops level!") ;
      return (-3) ;
   }
   if (take > 0 && take < d_stoplevel)
   {
      Print ("Takeprofit for sending pending order is lesser that stops level!") ;
      return (-3) ;
   }
   switch (type)
   {
      case OP_BUYLIMIT:
         if (Ask - price < d_stoplevel)
         {
            price_err = true ;
         }
         if (stop != 0)
         {
            if (stop > 0)
            {
               use_sl = price - stop ;
            }           
            else
            {
               use_sl = -stop ;
            
               if (price - use_sl < d_stoplevel)
               {
                  Print ("Stoploss for sending pending order is lesser that stops level!") ;
                  return (-3) ;
               }
            }
         }
         if (take != 0)
         {
            if (take > 0)
            {
               use_tp = price + take ;
            }           
            else
            {
               use_tp = -take ;
            
               if (use_tp - price < d_stoplevel)
               {
                  Print ("Takeprofit for sending pending order is lesser that stops level!") ;
                  return (-3) ;
               }
            }
         }
         break ;
         
      case OP_SELLLIMIT:
         if (price - Bid < d_stoplevel)
         {
            price_err = true ;
         }
         if (stop != 0)
         {
            if (stop > 0)
            {
               use_sl = price + stop ;
            }           
            else
            {
               use_sl = -stop ;
            
               if (use_sl - price < d_stoplevel)
               {
                  Print ("Stoploss for sending pending order is lesser that stops level!") ;
                  return (-3) ;
               }
            }
         }
         if (take != 0)
         {
            if (take > 0)
            {
               use_tp = price - take ;
            }           
            else
            {
               use_tp = -take ;
            
               if (price - use_tp < d_stoplevel)
               {
                  Print ("Takeprofit for sending pending order is lesser that stops level!") ;
                  return (-3) ;
               }
            }
         }
         break ;
         
      case OP_BUYSTOP:
         if (price - Ask < d_stoplevel)
         {
            price_err = true ;
         }
         if (stop != 0)
         {
            if (stop > 0)
            {
               use_sl = price - stop ;
            }           
            else
            {
               use_sl = -stop ;
            
               if (price - use_sl < d_stoplevel)
               {
                  Print ("Stoploss for sending pending order is lesser that stops level!") ;
                  return (-3) ;
               }
            }
         }
         if (take != 0)
         {
            if (take > 0)
            {
               use_tp = price + take ;
            }           
            else
            {
               use_tp = -take ;
            
               if (use_tp - price < d_stoplevel)
               {
                  Print ("Takeprofit for sending pending order is lesser that stops level!") ;
                  return (-3) ;
               }
            }
         }
         break ;
         
      case OP_SELLSTOP:
         if (Bid - price < d_stoplevel)
         {
            price_err = true ;
         }
         if (stop != 0)
         {
            if (stop > 0)
            {
               use_sl = price + stop ;
            }           
            else
            {
               use_sl = -stop ;
            
               if (use_sl - price < d_stoplevel)
               {
                  Print ("Stoploss for sending pending order is lesser that stops level!") ;
                  return (-3) ;
               }
            }
         }
         if (take != 0)
         {
            if (take > 0)
            {
               use_tp = price - take ;
            }           
            else
            {
               use_tp = -take ;
            
               if (price - use_tp < d_stoplevel)
               {
                  Print ("Takeprofit for sending pending order is lesser that stops level!") ;
                  return (-3) ;
               }
            }
         }
         break ;
   }
   int attempt = 1 ;
   int tick = -1 ;
   
   while (attempt <= command_attempts && tick < 0)
   {
      RefreshRates () ;

      if ((type == OP_BUYLIMIT && Ask - price < d_stoplevel) ||
         (type == OP_SELLLIMIT && price - Bid < d_stoplevel) ||
         (type == OP_BUYSTOP && price - Ask < d_stoplevel) ||
         (type == OP_SELLSTOP && Bid - price < d_stoplevel))
      {
         Print ("Cannot set a pending orders due to minimal broker stops&limits level (", DoubleToStr (type, 0), " ", DoubleToStr (price, Digits), " ", 
            DoubleToStr (use_sl, Digits), " ", DoubleToStr (use_tp, Digits), ") (", DoubleToStr (Ask, Digits), " ", DoubleToStr (Bid, Digits), ")") ;
         return (-2) ;
      }
      string str = StringConcatenate ("Attempt ", DoubleToStr (attempt, 0), " to set an order ") ;
      
      switch (type)
      {
         case OP_BUYLIMIT: str = StringConcatenate (str, "Buy Limit") ; break ;
         case OP_SELLLIMIT: str = StringConcatenate (str, "Sell Limit") ; break ;
         case OP_BUYSTOP: str = StringConcatenate (str, "Buy Stop") ; break ;
         case OP_SELLSTOP: str = StringConcatenate (str, "Sell Stop") ;
      }
      str = StringConcatenate (str, " at price ", DoubleToStr (price, Digits), " stop ", DoubleToStr (use_sl, Digits), " take ", DoubleToStr (use_tp, Digits)) ;
      Print (str) ;
      
      int ms = GetTickCount () ;
      tick = OrderSend (Symbol (), type, lots, price, 0, use_sl, use_tp, comm, magic_number) ;
      
      if (tick < 0)
      {
         errors ++ ;
      
         int err = GetLastError () ;
         
         switch (ErrorBlock (err, ms))
         {
            case 0: // continue
            
               break ;
            case 1: // wait and continue
               Sleep (wait_error) ;
               
               break ;
            case 2: // terminate
               return (-1) ;
         }
      }
      else
      {
         errors = 0 ;
         Print ("Order is set in ", GetTickCount () - ms, " ms") ;
      }
      if (errors > max_errors)
      {
         Print ("Exceeded maximum errors count while trying to send trading command.") ;
         Print ("To continue you should restart terminal or the EA") ; 
         return (-1) ;
      }
      attempt ++ ;
      
      if (attempt > command_attempts && tick < 0)
      {
         Print ("Exeeded maximum number of simultaneous attempts of setting an order") ;
         return (-1) ;
      }
   }
   return (tick) ;
}


int MarketSend (int dir, double lots, double stop, double take, int magic_number)
{
   if (dir != OP_BUY && dir != OP_SELL)
   {
      Print ("Wrong order direction for function MarketSend") ;
      return (-3) ;
   }
   RefreshRates () ;

   double init_ask = Ask ;
   double init_bid = Bid ;

   if ((stop > 0 && stop < d_stoplevel) || (stop < 0 && ((dir == OP_BUY && Ask + stop < d_stoplevel) || (dir == OP_SELL && -stop - Bid < d_stoplevel))))
   {
      Print ("Wrong stoploss value for function MarketSend. Sending w/o stop") ;
      return (-3) ;
   }
   if ((take > 0 && take < d_stoplevel) || (take < 0 && ((dir == OP_BUY && -take - Ask < d_stoplevel) || (dir == OP_SELL && Bid + take < d_stoplevel))))
   {
      Print ("Wrong takeprofit value for function MarketSend. Sending w/o take") ;
      return (-3) ;
   }
   double use_sl, use_tp, price ;
   int attempt = 1, tick = -1 ;
      
   while (attempt <= command_attempts && tick < 0)
   {
      double _slp ;
      int use_slp ;
      
      if (dir == OP_BUY)
      {
         _slp = (Ask - init_ask) / Point ;
         use_slp = max_slippage - _slp ;
      }
      else
      {
         _slp = (init_bid - Bid) / Point ;
         use_slp = max_slippage - _slp ;
      }
      if (use_slp < 0)
      {
         Print ("Maximal slippage exceeded while trying to open market order") ;
         return (-2) ;
      }
      if (dir == OP_BUY)
      {
         price = Ask ;
      }
      else
      {
         price = Bid ;
      }
      use_sl = 0 ;
      use_tp = 0 ;
      
      if (market_execution == 0)
      {
         if (stop > 0)
         {
            if (dir == OP_BUY)
            {
               use_sl = Ask - stop ;
            }
            else
            {
               use_sl = Bid + stop ;
            }
         }
         if (stop < 0)
         {
            if (dir == OP_BUY)
            {
               if (Ask + stop < d_stoplevel)
               {
                  Print ("Stoploss is under broker stop levels while sending BUY") ;
                  return (-2) ;
               }
               else
               {
                  use_sl = -stop ;
               }
            }
            else
            {
               if (-stop - Bid < d_stoplevel)
               {
                  Print ("Stoploss is under broker stop levels while sending SELL") ;
                  return (-2) ;
               }
               else
               {
                  use_sl = -stop ;
               }
            }
         }
         if (take > 0)
         {
            if (dir == OP_BUY)
            {
               use_tp = Ask + take ;
            }
            else
            {
               use_tp = Bid - take ;
            }
         }
         if (take < 0)
         {
            if (dir == OP_BUY)
            {
               if (-take - Ask < d_stoplevel)
               {
                  Print ("Takeprofit is under broker stop levels while sending BUY") ;
                  return (-2) ;
               }
               else
               {
                  use_tp = -take ;
               }
            }
            else
            {
               if (Bid + take < d_stoplevel)
               {
                  Print ("Takeprofit is under broker stop levels while sending SELL") ;
                  return (-2) ;
               }
               else
               {
                  use_tp = -take ;
               }
            }
         }
      }
      string str = StringConcatenate ("Attempt ", DoubleToStr (attempt, 0), " of sending order") ;
      
      if (dir == OP_BUY)
      {
         str = StringConcatenate (str, " BUY ") ;
      }
      else
      {
         str = StringConcatenate (str, " SELL ") ;
      }
      str = StringConcatenate (str, "at price ", DoubleToStr (price, Digits), " stop ", DoubleToStr (use_sl, Digits), " take ", DoubleToStr (use_tp, Digits)) ;
      Print (str) ;
      
      int ms = GetTickCount () ;
      tick = OrderSend (Symbol (), dir, lots, price, use_slp, use_sl, use_tp, "", magic_number) ;
      
      if (tick < 0)
      {
         errors ++ ;
      
         int err = GetLastError () ;
         
         if (err == ERR_INVALID_STOPS)
         {
            if (market_execution == 0)
            {
               if (stop != 0 || take != 0)
               {
                  Print ("Incorrect stops. Maybe broker increased stop levels") ;
                  return (-2) ;
               }
               else
               {
                  Print ("Incorrect stops while stop and take = 0. Error in expert logic") ;
                  return (-3) ;
               }
            }
            else
            {
               Print ("Incorrect stops with Market Execution. Error in expert logic") ;
               return (-3) ;
            }
         }
         else
         {         
            switch (ErrorBlock (err, ms))
            {
               case 0: // continue
               
                  break ;
               case 1: // wait and continue
                  Sleep (wait_error) ;
                  
                  break ;
               case 2: // terminate
                  return (-1) ;
            }
         }
      }
      else
      {
         errors = 0 ;
         OrderSelect (tick, SELECT_BY_TICKET) ;
         
         str = StringConcatenate ("Order was opened in ", DoubleToStr (GetTickCount () - ms, 0), " ms") ;
         double r_slp ;
         
         if (MathAbs (OrderOpenPrice () - price) >= Point)
         {
            if (OrderType () == OP_BUY)
            {
               r_slp = (OrderOpenPrice () - price) / Point ;
            }
            else
            {
               r_slp = (price - OrderOpenPrice ()) / Point ;
            }
            str = StringConcatenate (str, " with slippage ", DoubleToStr (MathAbs (r_slp), 0), " pips") ;
            
            if (r_slp < 0)
            {
               str = StringConcatenate (str, " in our benefit") ;
            }
         }
         Print (str) ;
         
         if (market_execution == 1 && (stop != 0 || take != 0))
         {
            MarketModify (OrderTicket (), stop, take) ;              
         }
      }
      if (errors > max_errors)
      {
         Print ("Exceeded maximum errors count while trying to send trading command.") ;
         Print ("To continue you should restart terminal or the EA") ; 
         return (-1) ;
      }
      attempt ++ ;
      
      if (attempt > command_attempts && tick < 0)
      {
         Print ("Exeeded maximum number of simultaneous attempts of setting an order") ;
         return (-1) ;
      }
      RefreshRates () ;
   }
   return (tick) ;
}

int MyOrders ()
{
   int num = 0 ;
   
   for (int i = OrdersTotal () - 1; i >= 0; i --)
   {
      if (OrderSelect (i, SELECT_BY_POS) && OrderSymbol () == Symbol () && OrderMagicNumber () >= initial_magic && OrderMagicNumber () < initial_magic + 100)
      {
         num ++ ;
      }
   }  
   return (num) ;
}

bool ProfitReached ()
{
   if (enable_daily_profit <= 0)
   {
      return (false) ;
   }
   double sum = 0 ;
   int pos = OrdersHistoryTotal () - 1 ;
   
   while (pos >= 0)
   {
      if (OrderSelect (pos, SELECT_BY_POS, MODE_HISTORY) && OrderMagicNumber () >= initial_magic && OrderMagicNumber () < initial_magic + 100 && OrderType () < 2)
      {
         if (OrderOpenTime () < TimeCurrent () - TimeCurrent () % 86400)
         {
            break ;
         }
         sum += OrderProfit () + OrderSwap () + OrderCommission () ;
      }
      pos -- ;
   }
   if (daily_profit > 0 && sum >= daily_profit)
   {
      return (true) ;
   }
   if (daily_profit_percent > 0 && sum / AccountBalance () * 100 >= daily_profit_percent)
   {
      return (true) ;
   }
}

int LastProfitDir ()
{
   int dir = initial_deal, pos = OrdersHistoryTotal () - 1, i = 0 ;
     
   while (i < 100 && pos >= 0)
   {
      if (OrderSelect (pos, SELECT_BY_POS, MODE_HISTORY) && OrderMagicNumber () >= initial_magic && OrderMagicNumber () < initial_magic + 100 && OrderType () < 2)
      {
         if (OrderOpenTime () < TimeCurrent () - TimeCurrent () % 86400)
         {
            break ;
         }
         if (OrderProfit () > 0 && TimeCurrent () - OrderCloseTime () < 300)
         {
            switch (OrderType ())
            {
               case OP_BUY:
                  dir = 0 ;
                  
                  break ;
               case OP_SELL:
                  dir = 1 ;
                  
                  break ;           
            }      
            break ;
         }
      }
      i ++ ;
      pos -- ;
   }
   return (dir) ;
}

int PendingRemove (int tick)
{
   if (! OrderSelect (tick, SELECT_BY_TICKET) || OrderType () < 2 || OrderType () > 5 || OrderCloseTime () > 0)
   {
      Print ("Wrong ticket for function PendingRemove") ;
      return (-3) ;  
   }
   
   int attempt = 1 ;
   bool result = false ;
   
   while (attempt <= command_attempts && ! result)
   {
      switch (OrderType ())
      {
         case OP_BUYLIMIT:
            if (Ask - OrderOpenPrice () < d_freezelevel)
            {
               Print ("Unable to delete order ", tick, " because it is too close to the market") ;
               return (-2) ;
            }
            break ;
            
         case OP_BUYSTOP:
            if (OrderOpenPrice () - Ask < d_freezelevel)
            {
               Print ("Unable to delete order ", tick, " because it is too close to the market") ;
               return (-2) ;
            }
            break ;
            
         case OP_SELLLIMIT:
            if (OrderOpenPrice () - Bid < d_freezelevel)
            {
               Print ("Unable to delete order ", tick, " because it is too close to the market") ;
               return (-2) ;
            }
            break ;
            
         case OP_SELLSTOP:
            if (Bid - OrderOpenPrice () < d_freezelevel)
            {
               Print ("Unable to delete order ", tick, " because it is too close to the market") ;
               return (-2) ;
            }
            break ;
      }
      int ms = GetTickCount () ;
      
      Print ("Attempt ", attempt, " to remove pending order ", tick) ;
      result = OrderDelete (tick) ;
      
      if (! result)
      {
         errors ++ ;
      
         int err = GetLastError () ;
         
         switch (ErrorBlock (err, ms))
         {
            case 0: // continue
            
               break ;
            case 1: // wait and continue
               Sleep (wait_error) ;
               
               break ;
            case 2: // terminate
               return (-1) ;
         }
      }
      else
      {
         errors = 0 ;
         Print ("Order was removed in ", GetTickCount () - ms, " ms") ;
      }
      if (errors > max_errors)
      {
         Print ("Exceeded maximum errors count while trying to send trading command.") ;
         Print ("To continue you should restart terminal or the EA") ; 
         return (-1) ;
      }
      attempt ++ ;
      
      if (attempt > command_attempts && tick < 0)
      {
         Print ("Exeeded maximum number of simultaneous attempts of setting an order") ;
         return (-1) ;
      }      
   }
   return (1) ;
}

double Lots (int leg = 0)
{
   double lot = 0 ;

   if (fixed_lot > 0)
   {
      lot = fixed_lot ;
   }
   else
   {
      if (deposit_lot > 0)
      {
         lot = AccountBalance () / deposit_lot ;
      }
   }
   for (int i = 1; i <= leg; i ++)
   {
      if (i == 1)
      {
         lot *= martin_koeff1 ;
      }
      else
      {
         lot *= martin_koeff2 ;
      }
   }
   return (NormalizeDouble (MathMax (MathMin (MarketInfo (Symbol (), MODE_MAXLOT), lot), MarketInfo (Symbol (), MODE_MINLOT)), lotsdigits)) ;
}

bool HedgeIsSet (int magic)
{
   int tick = OrderTicket () ;
   
   for (int i = OrdersTotal () - 1; i >= 0; i --)
   {
      if (OrderSelect (i, SELECT_BY_POS) && OrderSymbol () == Symbol () && OrderMagicNumber () == magic)
      {
         return (true) ;
      }
   }
   OrderSelect (tick, SELECT_BY_TICKET) ;
   
   return (false) ;
}