//+------------------------------------------------------------------+
//|                                                    Show Pips.mq4 |
//|                                    Copyright 2017, TPSproTrading |
//|                                    http://www.tpsprotrading.com/ |
//+------------------------------------------------------------------+
#property copyright "Copyright 2017, TPSproTrading"
#property link      "https://www.tpsprotrading.com"
#property version   "2.2"
#property strict
#property indicator_chart_window
//+------------------------------------------------------------------+
//| Parameters                                                       |
//+------------------------------------------------------------------+
enum ENUM_SHOW_TYPE
  {
   a = 0,   // Follow the price
   b = 1,   // As comment
   c = 2,   // In selected corner of the screen
  };
extern ENUM_SHOW_TYPE 
               show_type   =  0;                   // Type of appearance
extern ENUM_BASE_CORNER 
               corner      =  CORNER_RIGHT_LOWER;  // Graph corner for attachment
extern bool    show_profit =  false;               // Show profit?
extern bool    show_perc   =  false;               // Show profit in percents?
extern bool    show_spread =  true;                // Show spread?
extern bool    show_time   =  true;                // Show time to bar closure?
extern color   colortext   =  clrBlack;            // Text color
extern color   ecProfit    =  clrBlue;             // Profit color
extern color   ecLoss      =  clrRed;              // Loss color
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
enum ENUM_SEPARATOR
  {
   d = 124,    // |
   e =  47,    // /
   f =  46,    // .
   g =  92,    // \
   h =  35,    // #
  };
extern ENUM_SEPARATOR 
               separator   =  124;                 // Separator
extern int     coord_y     =  12;                  // Y coordinate
extern int     indent      =  5;                   // Indent in bars
extern int     text_size   =  8;                   // Font size
extern string  text_font   =  "Calibry";           // Font

string         name_1      =  "TPSpro_SMT";
string         text_1      =  "";
double         n           =  1.0;
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
   if(Digits==3 || Digits==5) n*=10;

//separator = 124;
//show_type = 0;

   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Custom indicator deinitialization function                       |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   Comment("");
   ObjectDelete(name_1);
  }
//+------------------------------------------------------------------+
//| Custom indicator iteration function                              |
//+------------------------------------------------------------------+
int OnCalculate(const int rates_total,
                const int prev_calculated,
                const datetime &time[],
                const double &open[],
                const double &high[],
                const double &low[],
                const double &close[],
                const long &tick_volume[],
                const long &volume[],
                const int &spread[])
  {

   double   tu =  0.0, tp = 0.0, tr = 0.0, 
            sp =  MarketInfo(Symbol(), MODE_SPREAD);
   string   _sp = "", _m = "", _s = "";
   string   sep = StringConcatenate(" ", CharToString(char(separator)), " ");
   
   if(AccountBalance() == 0.0)
   {
      text_1 = "";
   }
   else
   {
      tu =  GetProfitOpenPosInPoint();
      tp =  GetProfitOpenPos();
      tr =  tp * 100.0 / AccountBalance();
      
      text_1 =  StringConcatenate(DoubleToStr(tu,1) ," pips");

      if (show_profit) text_1 = StringConcatenate(text_1, sep, DoubleToStr(tp,2), " ", AccountCurrency());
      if (show_perc)   text_1 = StringConcatenate(text_1, sep, DoubleToStr(tr,1), "%");
   }
   

//--- Time to bar expiry
   int   m  =  int(Time[0] + Period()*60 - TimeCurrent());
   int   s  =  m%60;
   m  =  (m - s) / 60;
   if (m < 10)          _m    =  "0";
   if (s < 10)          _s    =  "0";
   if (sp < 10)         _sp   =  "..";
   else if (sp < 100)   _sp   =  ".";
   
   if (show_spread)
   {
      if (AccountBalance() == 0.0) 
         text_1 = StringConcatenate(text_1, DoubleToStr(sp,0), _sp);
      else
         text_1 = StringConcatenate(text_1, sep, DoubleToStr(sp,0), _sp);
   }
   if (show_time)
   {
      if (AccountBalance() == 0.0 && !show_spread) 
         text_1 = StringConcatenate(text_1, _m, DoubleToStr(m,0), ":", _s, DoubleToStr(s,0)); // Next bar in 
      else
         text_1 = StringConcatenate(text_1, sep, _m, DoubleToStr(m,0), ":", _s, DoubleToStr(s,0)); // Next bar in 
   }
   
   if (show_type == 0) 
      SetText(name_1, text_1, ColorOnSign(tp), TimeCurrent(), SymbolInfoDouble(Symbol(),SYMBOL_BID), text_size);
   if (show_type == 1)
      Comment(text_1);
   if (show_type == 2)
      SetLabel(name_1, text_1, ColorOnSign(tp), 3, coord_y, corner, text_size);

   return(rates_total);
  }
//+------------------------------------------------------------------+
double GetProfitOpenPos(int mn=-1)
  {
   int i,k=OrdersTotal();
   double pr=0.0;

   for(i=0; i<k; i++) 
     {
      if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES)) 
        {
         if(OrderSymbol()==Symbol()) 
           {
            if(mn<0 || OrderMagicNumber()==mn) 
              {
               pr+=OrderProfit()+OrderCommission()+OrderSwap();
              }
           }
        }
     }
   return (pr);
  }
//+----------------------------------------------------------------------------+
//|  Author      : Ким Игорь В. aka KimIV,  http://www.kimiv.ru                |
//+----------------------------------------------------------------------------+
//|  Version     : 01.08.2008                                                  |
//|  Description : Returns the total profit of open items in points            |
//+----------------------------------------------------------------------------+
//| Parameters:                                                                |
//| sy     - name of the tool   (""   - any character,                         |
//|                              NULL - the current character)                 |
//| op     - operation          (-1   - any position)                          |
//| mn     - MagicNumber        (-1   - any magic)                             |
//+----------------------------------------------------------------------------+
double GetProfitOpenPosInPoint(int op=-1,int mn=-1)
  {
   double pr=0.0;
//Comment(MarketInfo(Symbol(),MODE_TICKVALUE) / MarketInfo(Symbol(),MODE_TICKSIZE) / MarketInfo(Symbol(),MODE_POINT));

   for(int i=0; i<OrdersTotal(); i++) 
     {
      if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES)) 
        {
         if((OrderSymbol()==Symbol()) && (op<0 || OrderType()==op)) 
           {
            if(mn<0 || OrderMagicNumber()==mn) 
              {
               if(OrderType()==OP_BUY) 
                 {
                  pr+=(OrderProfit()/OrderLots()/MarketInfo(OrderSymbol(),MODE_TICKVALUE))/n;
                 }
               if(OrderType()==OP_SELL) 
                 {
                  pr+=(OrderProfit()/OrderLots()/MarketInfo(OrderSymbol(),MODE_TICKVALUE))/n;
                 }
              }
           }
        }
     }
   return (pr);
  }
//+------------------------------------------------------------------+
//| Set text                                                         |
//+------------------------------------------------------------------+
bool SetText(string nm,string tx,color cl,datetime time,double price,int fs)
  {
   time += indent * Period() * 60;
   ResetLastError();
//--- Create object "Text"
   if (ObjectFind(nm) < 0) 
      ObjectCreate(0, nm, OBJ_TEXT, 0, time, price);

   ObjectMove(0, nm, 0, time, price);
   ObjectSetString( 0, nm, OBJPROP_TEXT,     tx);
   ObjectSetString( 0, nm, OBJPROP_FONT,     text_font);
   ObjectSetInteger(0, nm, OBJPROP_FONTSIZE, fs);
   ObjectSetDouble( 0, nm, OBJPROP_ANGLE,    0.0);
   ObjectSetInteger(0, nm, OBJPROP_ANCHOR,   ANCHOR_LEFT_LOWER);
   ObjectSetInteger(0, nm, OBJPROP_COLOR,    cl);
   ObjectSetInteger(0, nm, OBJPROP_BACK,     false);
   ObjectSetInteger(0, nm, OBJPROP_SELECTABLE,false);
   ObjectSetInteger(0, nm, OBJPROP_SELECTED, false);
   ObjectSetInteger(0, nm, OBJPROP_HIDDEN,   true);

   return (true);
  }
//+------------------------------------------------------------------+
//| Set label                                                        |
//+------------------------------------------------------------------+
void SetLabel(string nm,string tx,color cl,int xd,int yd,int cr,int fs)
  {
   ResetLastError();
//--- Create object "Label"   
   if (ObjectFind(nm) < 0)
      ObjectCreate(nm, OBJ_LABEL, 0, 0, 0);

   ObjectSetText   (   nm, tx, fs);
   ObjectSetInteger(0, nm, OBJPROP_COLOR,     cl);
   ObjectSetInteger(0, nm, OBJPROP_XDISTANCE, xd);
   ObjectSetInteger(0, nm, OBJPROP_YDISTANCE, yd);
   ObjectSetInteger(0, nm, OBJPROP_CORNER,    cr);
   ObjectSetInteger(0, nm, OBJPROP_FONTSIZE,  fs);
   ObjectSetInteger(0, nm, OBJPROP_HIDDEN,    true);
   
   if (cr == CORNER_RIGHT_UPPER || cr == CORNER_RIGHT_LOWER)
      ObjectSetInteger(0, nm, OBJPROP_ANCHOR, ANCHOR_RIGHT);
  }
//+------------------------------------------------------------------+
//| Returns the color by the sign of a number                        |
//+------------------------------------------------------------------+
color ColorOnSign(double nu)
  {
   color lcColor = colortext;

   if (nu > 0) lcColor = ecProfit;
   if (nu < 0) lcColor = ecLoss;

   return(lcColor);
  }
//+------------------------------------------------------------------+
