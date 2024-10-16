//+------------------------------------------------------------------+
//|                               me_SimpleTradingDashboard v1.0.mq4 |
//|                                       Copyright © 2017, qK Code. |
//|                                   http://www.facebook.com/qkcode |
//+------------------------------------------------------------------+
#property copyright "Copyright © 2017, qK Code. (www.facebook.com/qkcode)"
#property link      "http://www.facebook.com/qkcode"

extern int Corner = 0;
extern int Move_X = 0;
extern int Move_Y = 0;
extern string B00001 = "====================";
extern int Button_Width = 100;
extern string Font_Type = "Arial Bold";
extern int Font_Size = 10;
extern color Font_Color = White;

int OnInit()
  {
   CreateButtons();
   ToolTips_Text ("Lot_00000_btn");
   ToolTips_Text ("Buy_00000_btn");
   ToolTips_Text ("Sell_0000_btn");
   ToolTips_Text ("Close_Buy_btn");
   ToolTips_Text ("Close_Sel_btn");
   ToolTips_Text ("Close_All_btn");
   ObjectCreate ("Lot_Edit", OBJ_EDIT, ChartWindowFind(), 0, 0);
   ObjectSet ("Lot_Edit", OBJPROP_CORNER, Corner);
   ObjectSet ("Lot_Edit", OBJPROP_XSIZE, Button_Width - 040);
   ObjectSet ("Lot_Edit", OBJPROP_YSIZE, Font_Size*2.8);
   ObjectSet ("Lot_Edit", OBJPROP_XDISTANCE, 075);
   ObjectSet ("Lot_Edit", OBJPROP_YDISTANCE, 030);
   ObjectSetText ("Lot_Edit", "0.01" , 13, Font_Type, Font_Color);
   return(INIT_SUCCEEDED);
  }

void OnDeinit(const int reason)
  {
   DeleteButtons();
   ObjectDelete ("Lot_Edit");
  }

void OnChartEvent (const int id, const long &lparam, const double &dparam, const string &sparam)
    {
     ResetLastError();
     if (id == CHARTEVENT_OBJECT_CLICK) {if (ObjectType (sparam) == OBJ_BUTTON) {ButtonPressed (0, sparam);}}
    }
    
void CreateButtons()
    {
     int Button_Height = Font_Size*2.8;
     if (!ButtonCreate (0, "Lot_00000_btn", 0, 010 + 000 + Move_X, 020 + 010 + Move_Y, Button_Width - 040, Button_Height, Corner, "Lot   =", Font_Type, Font_Size , Font_Color, DodgerBlue, Black)) return;
     if (!ButtonCreate (0, "Buy_00000_btn", 0, 010 + 000 + Move_X, 020 + 040 + Move_Y, Button_Width - 040, Button_Height, Corner, "BUY", Font_Type, Font_Size, Black, Lime, Black)) return;
     if (!ButtonCreate (0, "Sell_0000_btn", 0, 010 + 065 + Move_X, 020 + 040 + Move_Y, Button_Width - 040, Button_Height, Corner, "SELL", Font_Type, Font_Size, Font_Color, Red, Black)) return;
     if (!ButtonCreate (0, "Close_Buy_btn", 0, 010 + 000 + Move_X, 020 + 080 + Move_Y, Button_Width + 025, Button_Height, Corner, "Close All Buy", Font_Type, Font_Size, Black, Lime, Black)) return;
     if (!ButtonCreate (0, "Close_Sel_btn", 0, 010 + 000 + Move_X, 020 + 110 + Move_Y, Button_Width + 025, Button_Height, Corner, "Close All Sell", Font_Type, Font_Size, Font_Color, Red, Black)) return;
     if (!ButtonCreate (0, "Close_All_btn", 0, 010 + 000 + Move_X, 020 + 140 + Move_Y, Button_Width + 025, Button_Height, Corner, "Close All Orders", Font_Type, Font_Size, Font_Color, Blue, Black)) return;
     ChartRedraw();
    }

void DeleteButtons()
    {
     ButtonDelete (0, "Buy_00000_btn");
     ButtonDelete (0, "Sell_0000_btn");
     ButtonDelete (0, "Close_Buy_btn");
     ButtonDelete (0, "Close_Sel_btn");
     ButtonDelete (0, "Close_All_btn");
     ButtonDelete (0, "Lot_00000_btn");
    }

void ButtonPressed (const long chartID, const string sparam)
    {
     if (sparam == "Buy_00000_btn") Buy_00000_Button (sparam);
     if (sparam == "Sell_0000_btn") Sell_0000_Button (sparam);
     if (sparam == "Close_Buy_btn") Close_Buy_Button (sparam);
     if (sparam == "Close_Sel_btn") Close_Sel_Button (sparam);
     if (sparam == "Close_All_btn") Close_All_Button (sparam);
     if (sparam == "Lot_00000_btn") Lot_00000_Button (sparam);
     Sleep (10);
    }
    
void ToolTips_Text(const string sparam)
  {
   if (sparam == "Lot_00000_btn") {ObjectSetString (0, sparam, OBJPROP_TOOLTIP, "Lot To Be Used");}
   if (sparam == "Buy_00000_btn") {ObjectSetString (0, sparam, OBJPROP_TOOLTIP, "Open BUY Order");}
   if (sparam == "Sell_0000_btn") {ObjectSetString (0, sparam, OBJPROP_TOOLTIP, "Open SELL Order");}
   if (sparam == "Close_Buy_btn") {ObjectSetString (0, sparam, OBJPROP_TOOLTIP, "Close All BUY Orders");}
   if (sparam == "Close_Sel_btn") {ObjectSetString (0, sparam, OBJPROP_TOOLTIP, "Close All SELL Orders");}
   if (sparam == "Close_All_btn") {ObjectSetString (0, sparam, OBJPROP_TOOLTIP, "Close All Open Orders");}
  }

int Lot_00000_Button (const string sparam)
  {
   return(0);
  }

int Close_Buy_Button (const string sparam)
  {   
   int ticket;
   if (OrdersTotal() == 0) return(0);
   for (int i = OrdersTotal() - 1; i >= 0; i--)
      {
       if (OrderSelect (i, SELECT_BY_POS, MODE_TRADES) == true)
         {
          if (OrderType() == 0 && OrderSymbol() == Symbol())
            {
             ticket = OrderClose (OrderTicket(), OrderLots(), Bid, 3, CLR_NONE);
             if (ticket == -1) Print ("Error: ", GetLastError());
             if (ticket >   0) Print ("Position ", OrderTicket() ," closed");
            }
         }
      }
   return(0);
  }

int Close_Sel_Button (const string sparam)
  {   
   int ticket;
   if (OrdersTotal() == 0) return(0);
   for (int i = OrdersTotal() - 1; i >= 0; i--)
      {
       if (OrderSelect (i, SELECT_BY_POS, MODE_TRADES) == true)
         {
          if (OrderType() == 1 && OrderSymbol() == Symbol())
            {
             ticket = OrderClose (OrderTicket(), OrderLots(), Ask, 3, CLR_NONE);
             if (ticket == -1) Print ("Error: ",  GetLastError());
             if (ticket >   0) Print ("Position ", OrderTicket() ," closed");
            }   
         }
      }
   return(0);
  }

int Close_All_Button (const string sparam)
  {   
   int ticket;
   if (OrdersTotal() == 0) return(0);
   for (int i = OrdersTotal() - 1; i >= 0; i--)
      {
       if (OrderSelect (i, SELECT_BY_POS, MODE_TRADES) == true)
         {
          if (OrderType() == 0 && OrderSymbol() == Symbol())
            {
             ticket = OrderClose (OrderTicket(), OrderLots(), Bid, 3, CLR_NONE);
             if (ticket == -1) Print ("Error: ", GetLastError());
             if (ticket >   0) Print ("Position ", OrderTicket() ," closed");
            }
          if (OrderType() == 1 && OrderSymbol() == Symbol())
            {
             ticket = OrderClose (OrderTicket(), OrderLots(), Ask, 3, CLR_NONE);
             if (ticket == -1) Print ("Error: ",  GetLastError());
             if (ticket >   0) Print ("Position ", OrderTicket() ," closed");
            }   
         }
      }
   return(0);
  }

int Buy_00000_Button (const string sparam)
  {
   double Lot_Extract = StrToDouble (ObjectGetString (0, "Lot_Edit", OBJPROP_TEXT, 0));
   OrderSend (Symbol(), OP_BUY, Lot_Extract, Ask, 0, 0, 0, "BUY", 12345601, 0, CLR_NONE);
   return(0);
  }

int Sell_0000_Button (const string sparam)
  {
   double Lot_Extract = StrToDouble (ObjectGetString (0, "Lot_Edit", OBJPROP_TEXT, 0));
   OrderSend (Symbol(), OP_SELL, Lot_Extract, Bid, 0, 0, 0, "SELL", 12345602, 0, CLR_NONE);
   return(0);
  }
 
bool ButtonCreate (const long chart_ID=0, const string name="Button", const int sub_window=0, const int x=0, const int y=0, const int width=500,
                   const int height=18, int corner=0, const string text="Button", const string font="Arial Bold",
                   const int font_size=10, const color clr=clrBlack, const color back_clr=C'170,170,170', const color border_clr=clrNONE,
                   const bool state=false, const bool back=false, const bool selection=false, const bool hidden=true, const long z_order=0)
  {
   ResetLastError();
   if (!ObjectCreate (chart_ID,name, OBJ_BUTTON, sub_window, 0, 0))
     {
      Print (__FUNCTION__, ": failed to create the button! Error code = ", GetLastError());
      return(false);
     }
   ObjectSetInteger (chart_ID, name, OBJPROP_XDISTANCE, x);
   ObjectSetInteger (chart_ID, name, OBJPROP_YDISTANCE, y);
   ObjectSetInteger (chart_ID, name, OBJPROP_XSIZE, width);
   ObjectSetInteger (chart_ID, name, OBJPROP_YSIZE, height);
   ObjectSetInteger (chart_ID, name, OBJPROP_CORNER, corner);
   ObjectSetInteger (chart_ID, name, OBJPROP_FONTSIZE, font_size);
   ObjectSetInteger (chart_ID, name, OBJPROP_COLOR, clr);
   ObjectSetInteger (chart_ID, name, OBJPROP_BGCOLOR, back_clr);
   ObjectSetInteger (chart_ID, name, OBJPROP_BORDER_COLOR, border_clr);
   ObjectSetInteger (chart_ID, name, OBJPROP_BACK, back);
   ObjectSetInteger (chart_ID, name, OBJPROP_STATE, state);
   ObjectSetInteger (chart_ID, name, OBJPROP_SELECTABLE, selection);
   ObjectSetInteger (chart_ID, name, OBJPROP_SELECTED, selection);
   ObjectSetInteger (chart_ID, name, OBJPROP_HIDDEN, hidden);
   ObjectSetInteger (chart_ID, name, OBJPROP_ZORDER,z_order);
   ObjectSetString  (chart_ID, name, OBJPROP_TEXT, text);
   ObjectSetString  (chart_ID, name, OBJPROP_FONT, font);
   return(true);
  }
  
bool ButtonDelete (const long chart_ID=0, const string name="Button")
  {
   ResetLastError();
   if (!ObjectDelete (chart_ID,name))
     {
      Print (__FUNCTION__, ": Failed to delete the button! Error code = ", GetLastError());
      return(false);
     }
   return(true);
  }