//====================================================================================================================================================//
#property copyright   "Copyright 2015-2017, Nikolaos Pantzos"
#property link        "https://www.mql5.com/en/users/pannik"
#property version     "1.42"
#property description "This Expert Advisor is a tool to help any trader to trade easily and quickly."
#property description "\nThis is not auto trade bot. Is a tool to help place and manage manualy orders."
//#property icon        "\\Images\\TT-Logo.ico";
#property strict
//====================================================================================================================================================//
extern string WarningMessage    = "ALL THE SETS ARE IN PIPS, NOT IN POINTS";
extern string PendingOrdersSet  = "||========= Pending/Market Orders Sets =========||";
extern bool   UseAutoLotSize    = false;
extern double RiskFactor        = 1.0;
extern double LotSizeOrders     = 0.01;
extern double DistanceOrders    = 50;
extern bool   DeleteOrphans     = true;
extern string AddSLTP           = "||========= Set stop loss and take profit =========||";
extern bool   PutStopLoss       = true;
extern double StopLossPips      = 20;
extern bool   PutTakeProfit     = true;
extern double TakeProfitPips    = 20;
extern string TrailingSL        = "||========= Set trailing stop loss and break even =========||";
extern bool   UseTrailingStop   = false;
extern double TrailingStop      = 20;
extern bool   UseBreakEven      = false;
extern double BreakEvenAfter    = 20;
extern double BreakEvenPips     = 10;
extern string DeleteSLTP        = "||========= Delete stop loss and take profit =========||";
extern bool   DeleteTakeProfit  = false;
extern bool   DeleteStopLoss    = false;
extern string GeneralSettings   = "||========= General Settings =========||";
extern int    MagicNumber       = 12345;
extern bool   SoundAlert        = true;
extern string ColorsSettings    = "||========= Panel Colors Sets =========||";
extern color  ColorBackground   = clrHoneydew;
extern color  ColorFontScreen   = clrBlack;
extern color  ColorOpenButton   = clrDodgerBlue;
extern color  ColorCloseButton  = clrFireBrick;
extern color  ColorPlaceButton  = clrMediumSeaGreen;
extern color  ColorDeleteButton = clrOrange;
extern color  ColorCallButton   = clrPowderBlue;
extern color  ColorFontButton   = clrBlack;
//====================================================================================================================================================//
string SoundModify="tick.wav";
string SoundOpen="alert.wav";
string SoundClose="alert2.wav";
string SoundDelete="stops.wav";
string ExpertName;
double DigitPoint;
double StopLevel;
int MultiplierPoint;
int IDorder;
int TotalOrders;
int CntBuy;
int CntSell;
int CntBuyStop;
int CntSellStop;
int ManageOrders=3;
int SymbolDigits;
color ColorFontDO;
color ColorFontSA;
color ColorFontSL;
color ColorFontTP;
color ColorFontTSL;
color ColorFontBE;
string TP;
string SL;
string TSL;
string MN;
string SA;
string BE;
string DO;
string Button1="ButtonOrdersPanel";
string Button2="ButtonOpenBuy";
string Button3="ButtonOpenSell";
string Button4="PlaceBuyStop";
string Button5="PlaceSellStop";
string Button6="ButtonPlace";
string Button7="ButtonCloseBuy";
string Button8="ButtonCloseSell";
string Button9="ButtonCloseAll";
string Button10="ButtonDeleteBS";
string Button11="ButtonDeleteSS";
string Button12="ButtonDeleteAll";
string Button13="CloseBuyOnPair";
string Button14="CloseBuyOnAcc";
string Button15="CloseSellOnPair";
string Button16="CloseSellOnAcc";
string Button17="DeleteBSonPair";
string Button18="DeleteBSonAcc";
string Button19="DeleteSSonPair";
string Button20="DeleteSSonAcc";
string Button21="ManageID";
string Button22="ManageAll";
string Button23="ManageManual";
string Button24="ManageOwn";
string Box1="LotSizeBox";
string Box2="DistanceBox";
string Box4="TakeProfitBox";
string Box3="StopLossBox";
string Box5="TrailingBox";
string Box6="BreakEvenBox";
bool CallPanel=false;
bool CheckOrphans=true;
double FinalLot;
double FinalDistance;
double FinalTakeProfit;
double FinalStopLoss;
double FinalTrailing;
double FinalBreakEven;
double GetLotFromPanel;
double GetDistanceFromPanel;
double GetTakeProfitFromPanel;
double GetStopLossFromPanel;
double GetTrailingFromPanel;
double GetBreakEvenFromPanel;
double SpreadPair;
double PriceAsk;
double PriceBid;
double OrderLotSize;
double SymbolPoints;
double PriceLastBuyStop;
double PriceLastSellStop;
color ColorButton21;
color ColorButton22;
color ColorButton23;
color ColorButton24;
//====================================================================================================================================================//
void init()
  {
//------------------------------------------------------
//Broker 4 or 5 digits
   DigitPoint=MarketInfo(Symbol(),MODE_POINT);
   MultiplierPoint=1;
   if(MarketInfo(Symbol(),MODE_DIGITS)==3 || MarketInfo(Symbol(),MODE_DIGITS)==5)
     {
      MultiplierPoint=10;
      DigitPoint*=MultiplierPoint;
     }
//------------------------------------------------------
//Set Orders ID
   ExpertName=WindowExpertName();
   IDorder=UniqueMagic();
//------------------------------------------------------
//Set manage orders
   if(ManageOrders==3) {ColorButton21=clrCrimson; ColorButton22=clrCrimson; ColorButton23=clrCrimson; ColorButton24=clrForestGreen;}
//------------------------------------------------------
//Minimum trailing, take profit, stop loss, break even
   StopLevel=MathMax(MarketInfo(Symbol(),MODE_FREEZELEVEL)/MultiplierPoint,MarketInfo(Symbol(),MODE_STOPLEVEL)/MultiplierPoint);
   if(DistanceOrders<StopLevel) DistanceOrders=StopLevel;
   if((TrailingStop>0) && (TrailingStop<StopLevel)) TrailingStop=StopLevel;
   if((TakeProfitPips>0) && (TakeProfitPips<StopLevel)) TakeProfitPips=StopLevel;
   if((StopLossPips>0) && (StopLossPips<StopLevel)) StopLossPips=StopLevel;
   if(BreakEvenAfter-BreakEvenPips<StopLevel) BreakEvenAfter=BreakEvenPips+StopLevel;
   if(MagicNumber<0) MagicNumber=0;
   if(LotSizeOrders<MarketInfo(Symbol(),MODE_MINLOT)) LotSizeOrders=MarketInfo(Symbol(),MODE_MINLOT);
   if(LotSizeOrders>MarketInfo(Symbol(),MODE_MAXLOT)) LotSizeOrders=MarketInfo(Symbol(),MODE_MAXLOT);
//------------------------------------------------------
//Reset switchs
   if(DeleteTakeProfit==true) PutTakeProfit=false;
   if(DeleteStopLoss==true)
     {
      PutStopLoss=false;
      UseTrailingStop=false;
      UseBreakEven=false;
     }
//------------------------------------------------------
   start();
//------------------------------------------------------
  }
//====================================================================================================================================================//
void deinit()
  {
//------------------------------------------------------
   ObjectDelete("Background1");
   ObjectDelete("Background2");
   ObjectDelete("Background3");
   ObjectDelete("Text1");
   ObjectDelete("Text2");
   ObjectDelete("Text3");
   ObjectDelete("Text4");
   ObjectDelete("Text5");
   ObjectDelete("Text6");
   ObjectDelete("Text7");
   ObjectDelete("Text8");
   ObjectDelete("Text9");
   ObjectDelete("Text10");
   ObjectDelete("Text11");
   ObjectDelete("Text12");
   ObjectDelete("Text13");
   ObjectDelete("Text14");
   ObjectDelete("Text15");
   ObjectDelete("Text16");
   ObjectDelete(Box1);
   ObjectDelete(Box2);
   ObjectDelete(Box4);
   ObjectDelete(Box3);
   ObjectDelete(Box5);
   ObjectDelete(Box6);
   ObjectDelete(Button1);
   ObjectDelete(Button2);
   ObjectDelete(Button3);
   ObjectDelete(Button4);
   ObjectDelete(Button5);
   ObjectDelete(Button6);
   ObjectDelete(Button7);
   ObjectDelete(Button8);
   ObjectDelete(Button9);
   ObjectDelete(Button10);
   ObjectDelete(Button11);
   ObjectDelete(Button12);
   ObjectDelete(Button13);
   ObjectDelete(Button14);
   ObjectDelete(Button15);
   ObjectDelete(Button16);
   ObjectDelete(Button17);
   ObjectDelete(Button18);
   ObjectDelete(Button19);
   ObjectDelete(Button20);
   ObjectDelete(Button21);
   ObjectDelete(Button22);
   ObjectDelete(Button23);
   ObjectDelete(Button24);
   Comment("");
//------------------------------------------------------
  }
//====================================================================================================================================================//
void OnChartEvent(const int id,const long &lparam,const double &dparam,const string &sparam)
  {
//------------------------------------------------------
   bool selected=false;
   if(id==CHARTEVENT_OBJECT_CLICK)
     {
      string clickedChartObject=sparam;
      //------------------------------------------------------
      //ID orders
      if(clickedChartObject==Button21)
        {
         selected=ObjectGetInteger(0,Button21,OBJPROP_STATE);
         if((selected) && (ManageOrders!=0))
           {
            EventKillTimer();
            ColorButton21=clrForestGreen;
            ColorButton22=clrCrimson;
            ColorButton23=clrCrimson;
            ColorButton24=clrCrimson;
            ObjectDelete(Button2);
            ObjectDelete(Button3);
            ObjectDelete(Button4);
            ObjectDelete(Button5);
            ObjectDelete(Button6);
            ObjectDelete(Button7);
            ObjectDelete(Button8);
            ObjectDelete(Button9);
            ObjectDelete(Button10);
            ObjectDelete(Button11);
            ObjectDelete(Button12);
            ObjectDelete(Button13);
            ObjectDelete(Button14);
            ObjectDelete(Button15);
            ObjectDelete(Button16);
            ObjectDelete(Button17);
            ObjectDelete(Button18);
            ObjectDelete(Button19);
            ObjectDelete(Button20);
            ObjectDelete(Button21);
            ObjectDelete(Button22);
            ObjectDelete(Button23);
            ObjectDelete(Button24);
            ObjectDelete("Text15");
            clickedChartObject=Button1;
            ManageOrdersBox();
            ManageOrders=0;
            MN="With ID: "+StringSubstr(DoubleToStr(MagicNumber,0),0,10);
            if(ObjectFind("Text15")==-1) ChartText("Text15",StringConcatenate("Manage  ",MN),10,"Arial Black",ColorFontScreen,5,168);
            ObjectSetInteger(0,Button21,OBJPROP_STATE,FALSE);
           }
        }
      //------------------------------------------------------
      //All orders
      if(clickedChartObject==Button22)
        {
         selected=ObjectGetInteger(0,Button22,OBJPROP_STATE);
         if((selected) && (ManageOrders!=1))
           {
            EventKillTimer();
            ColorButton21=clrCrimson;
            ColorButton22=clrForestGreen;
            ColorButton23=clrCrimson;
            ColorButton24=clrCrimson;
            ObjectDelete(Button2);
            ObjectDelete(Button3);
            ObjectDelete(Button4);
            ObjectDelete(Button5);
            ObjectDelete(Button6);
            ObjectDelete(Button7);
            ObjectDelete(Button8);
            ObjectDelete(Button9);
            ObjectDelete(Button10);
            ObjectDelete(Button11);
            ObjectDelete(Button12);
            ObjectDelete(Button13);
            ObjectDelete(Button14);
            ObjectDelete(Button15);
            ObjectDelete(Button16);
            ObjectDelete(Button17);
            ObjectDelete(Button18);
            ObjectDelete(Button19);
            ObjectDelete(Button20);
            ObjectDelete(Button21);
            ObjectDelete(Button22);
            ObjectDelete(Button23);
            ObjectDelete(Button24);
            ObjectDelete("Text15");
            clickedChartObject=Button1;
            ManageOrdersBox();
            ManageOrders=1;
            MN="All Orders";
            if(ObjectFind("Text15")==-1) ChartText("Text15",StringConcatenate("Manage  ",MN),10,"Arial Black",ColorFontScreen,5,168);
            ObjectSetInteger(0,Button22,OBJPROP_STATE,FALSE);
           }
        }
      //------------------------------------------------------
      //Manual orders
      if(clickedChartObject==Button23)
        {
         selected=ObjectGetInteger(0,Button23,OBJPROP_STATE);
         if((selected) && (ManageOrders!=2))
           {
            EventKillTimer();
            ColorButton21=clrCrimson;
            ColorButton22=clrCrimson;
            ColorButton23=clrForestGreen;
            ColorButton24=clrCrimson;
            ObjectDelete(Button2);
            ObjectDelete(Button3);
            ObjectDelete(Button4);
            ObjectDelete(Button5);
            ObjectDelete(Button6);
            ObjectDelete(Button7);
            ObjectDelete(Button8);
            ObjectDelete(Button9);
            ObjectDelete(Button10);
            ObjectDelete(Button11);
            ObjectDelete(Button12);
            ObjectDelete(Button13);
            ObjectDelete(Button14);
            ObjectDelete(Button15);
            ObjectDelete(Button16);
            ObjectDelete(Button17);
            ObjectDelete(Button18);
            ObjectDelete(Button19);
            ObjectDelete(Button20);
            ObjectDelete(Button21);
            ObjectDelete(Button22);
            ObjectDelete(Button23);
            ObjectDelete(Button24);
            ObjectDelete("Text15");
            clickedChartObject=Button1;
            ManageOrdersBox();
            ManageOrders=2;
            MN="Manual Orders";
            if(ObjectFind("Text15")==-1) ChartText("Text15",StringConcatenate("Manage  ",MN),10,"Arial Black",ColorFontScreen,5,168);
            ObjectSetInteger(0,Button23,OBJPROP_STATE,FALSE);
           }
        }
      //------------------------------------------------------
      //Own orders
      if(clickedChartObject==Button24)
        {
         selected=ObjectGetInteger(0,Button24,OBJPROP_STATE);
         if((selected) && (ManageOrders!=3))
           {
            EventKillTimer();
            ColorButton21=clrCrimson;
            ColorButton22=clrCrimson;
            ColorButton23=clrCrimson;
            ColorButton24=clrForestGreen;
            ObjectDelete(Button2);
            ObjectDelete(Button3);
            ObjectDelete(Button4);
            ObjectDelete(Button5);
            ObjectDelete(Button6);
            ObjectDelete(Button7);
            ObjectDelete(Button8);
            ObjectDelete(Button9);
            ObjectDelete(Button10);
            ObjectDelete(Button11);
            ObjectDelete(Button12);
            ObjectDelete(Button13);
            ObjectDelete(Button14);
            ObjectDelete(Button15);
            ObjectDelete(Button16);
            ObjectDelete(Button17);
            ObjectDelete(Button18);
            ObjectDelete(Button19);
            ObjectDelete(Button20);
            ObjectDelete(Button21);
            ObjectDelete(Button22);
            ObjectDelete(Button23);
            ObjectDelete(Button24);
            ObjectDelete("Text15");
            clickedChartObject=Button1;
            ManageOrdersBox();
            ManageOrders=3;
            MN="Own Orders";
            if(ObjectFind("Text15")==-1) ChartText("Text15",StringConcatenate("Manage  ",MN),10,"Arial Black",ColorFontScreen,5,168);
            ObjectSetInteger(0,Button24,OBJPROP_STATE,FALSE);
           }
        }
      //------------------------------------------------------
      //Call orders panel
      if(clickedChartObject==Button1)
        {
         selected=ObjectGetInteger(0,Button1,OBJPROP_STATE);
         if(selected)
           {
            if(ManageOrders==3) FullOrdersPanel();
            if(ManageOrders!=3) LiteOrdersPanel();
           }
         else
           {
            ObjectDelete(Button2);
            ObjectDelete(Button3);
            ObjectDelete(Button4);
            ObjectDelete(Button5);
            ObjectDelete(Button6);
            ObjectDelete(Button7);
            ObjectDelete(Button8);
            ObjectDelete(Button9);
            ObjectDelete(Button10);
            ObjectDelete(Button11);
            ObjectDelete(Button12);
            ObjectDelete(Button13);
            ObjectDelete(Button14);
            ObjectDelete(Button15);
            ObjectDelete(Button16);
            ObjectDelete(Button17);
            ObjectDelete(Button18);
            ObjectDelete(Button19);
            ObjectDelete(Button20);
           }
        }
      //------------------------------------------------------
      //Send buy
      if(clickedChartObject==Button2)
        {
         selected=ObjectGetInteger(0,Button2,OBJPROP_STATE);
         if(selected)
           {
            EventKillTimer();
            OpenPosition(OP_BUY);
            ObjectSetInteger(0,Button2,OBJPROP_STATE,FALSE);
           }
        }
      //------------------------------------------------------
      //Open sell
      if(clickedChartObject==Button3)
        {
         selected=ObjectGetInteger(0,Button3,OBJPROP_STATE);
         if(selected)
           {
            EventKillTimer();
            OpenPosition(OP_SELL);
            ObjectSetInteger(0,Button3,OBJPROP_STATE,FALSE);
           }
        }
      //------------------------------------------------------
      //Open pending buy 
      if(clickedChartObject==Button4)
        {
         selected=ObjectGetInteger(0,Button4,OBJPROP_STATE);
         if(selected)
           {
            EventKillTimer();
            OpenOrders(1);
            ObjectSetInteger(0,Button4,OBJPROP_STATE,FALSE);
           }
        }
      //------------------------------------------------------
      //Open pending sell
      if(clickedChartObject==Button5)
        {
         selected=ObjectGetInteger(0,Button5,OBJPROP_STATE);
         if(selected)
           {
            EventKillTimer();
            OpenOrders(2);
            ObjectSetInteger(0,Button5,OBJPROP_STATE,FALSE);
           }
        }
      //------------------------------------------------------
      //Open pending buy and sell
      if(clickedChartObject==Button6)
        {
         selected=ObjectGetInteger(0,Button6,OBJPROP_STATE);
         if(selected)
           {
            EventKillTimer();
            OpenOrders(0);
            ObjectSetInteger(0,Button6,OBJPROP_STATE,FALSE);
           }
        }
      //------------------------------------------------------
      //Close buy
      if(clickedChartObject==Button7)
        {
         selected=ObjectGetInteger(0,Button7,OBJPROP_STATE);
         if(selected)
           {
            EventKillTimer();
            ClosePositions(1,1);
            ObjectSetInteger(0,Button7,OBJPROP_STATE,FALSE);
           }
        }
      //------------------------------------------------------
      //Close sell
      if(clickedChartObject==Button8)
        {
         selected=ObjectGetInteger(0,Button8,OBJPROP_STATE);
         if(selected)
           {
            EventKillTimer();
            ClosePositions(2,1);
            ObjectSetInteger(0,Button8,OBJPROP_STATE,FALSE);
           }
        }
      //------------------------------------------------------
      //Close all
      if(clickedChartObject==Button9)
        {
         selected=ObjectGetInteger(0,Button9,OBJPROP_STATE);
         if(selected)
           {
            EventKillTimer();
            ClosePositions(0,1);
            ObjectSetInteger(0,Button9,OBJPROP_STATE,FALSE);
           }
        }
      //------------------------------------------------------
      //Delete BS pending
      if(clickedChartObject==Button10)
        {
         selected=ObjectGetInteger(0,Button10,OBJPROP_STATE);
         if(selected)
           {
            EventKillTimer();
            DeleteOrders(1,1);
            ObjectSetInteger(0,Button10,OBJPROP_STATE,FALSE);
           }
        }
      //------------------------------------------------------
      //Delete SS pending
      if(clickedChartObject==Button11)
        {
         selected=ObjectGetInteger(0,Button11,OBJPROP_STATE);
         if(selected)
           {
            EventKillTimer();
            DeleteOrders(2,1);
            ObjectSetInteger(0,Button11,OBJPROP_STATE,FALSE);
           }
        }
      //------------------------------------------------------
      //Delete all pending
      if(clickedChartObject==Button12)
        {
         selected=ObjectGetInteger(0,Button12,OBJPROP_STATE);
         if(selected)
           {
            EventKillTimer();
            DeleteOrders(0,1);
            ObjectSetInteger(0,Button12,OBJPROP_STATE,FALSE);
           }
        }
      //------------------------------------------------------
      //Close buy on pair
      if(clickedChartObject==Button13)
        {
         selected=ObjectGetInteger(0,Button13,OBJPROP_STATE);
         if(selected)
           {
            EventKillTimer();
            ClosePositions(1,1);
            ObjectSetInteger(0,Button13,OBJPROP_STATE,FALSE);
           }
        }
      //------------------------------------------------------
      //Close buy on account
      if(clickedChartObject==Button14)
        {
         selected=ObjectGetInteger(0,Button14,OBJPROP_STATE);
         if(selected)
           {
            EventKillTimer();
            ClosePositions(1,0);
            ObjectSetInteger(0,Button14,OBJPROP_STATE,FALSE);
           }
        }
      //------------------------------------------------------
      //Close sell on pair
      if(clickedChartObject==Button15)
        {
         selected=ObjectGetInteger(0,Button15,OBJPROP_STATE);
         if(selected)
           {
            EventKillTimer();
            ClosePositions(2,1);
            ObjectSetInteger(0,Button15,OBJPROP_STATE,FALSE);
           }
        }
      //------------------------------------------------------
      //Close sell on account
      if(clickedChartObject==Button16)
        {
         selected=ObjectGetInteger(0,Button16,OBJPROP_STATE);
         if(selected)
           {
            EventKillTimer();
            ClosePositions(2,0);
            ObjectSetInteger(0,Button16,OBJPROP_STATE,FALSE);
           }
        }
      //------------------------------------------------------
      //Delete BS on pair
      if(clickedChartObject==Button17)
        {
         selected=ObjectGetInteger(0,Button17,OBJPROP_STATE);
         if(selected)
           {
            EventKillTimer();
            DeleteOrders(1,1);
            ObjectSetInteger(0,Button17,OBJPROP_STATE,FALSE);
           }
        }
      //------------------------------------------------------
      //Delete BS on account
      if(clickedChartObject==Button18)
        {
         selected=ObjectGetInteger(0,Button18,OBJPROP_STATE);
         if(selected)
           {
            EventKillTimer();
            DeleteOrders(1,1);
            ObjectSetInteger(0,Button18,OBJPROP_STATE,FALSE);
           }
        }
      //------------------------------------------------------
      //Delete SS on pair
      if(clickedChartObject==Button19)
        {
         selected=ObjectGetInteger(0,Button19,OBJPROP_STATE);
         if(selected)
           {
            EventKillTimer();
            DeleteOrders(2,1);
            ObjectSetInteger(0,Button19,OBJPROP_STATE,FALSE);
           }
        }
      //------------------------------------------------------
      //Delete SS on account
      if(clickedChartObject==Button20)
        {
         selected=ObjectGetInteger(0,Button20,OBJPROP_STATE);
         if(selected)
           {
            EventKillTimer();
            DeleteOrders(2,0);
            ObjectSetInteger(0,Button20,OBJPROP_STATE,FALSE);
           }
        }
      //------------------------------------------------------
      ChartRedraw();
     }
//------------------------------------------------------
  }
//====================================================================================================================================================//
void start()
  {
//------------------------------------------------------
   double LocalTakeProfit;
   double LocalStopLoss;
   bool WasOrderModified=false;
   OrderLotSize=CalculateLot();
//------------------------------------------------------
//Market close
   if(GetLastError()==132)
     {
      Print(ExpertName+": Could not run, market is closed!!!");
      Sleep(60000);
     }
//------------------------------------------------------
//Get spread
   SpreadPair=(Ask-Bid)/DigitPoint;
//------------------------------------------------------
//Manage buttons
   ManageOrdersBox();
//------------------------------------------------------
//Set manage orders
   if(ManageOrders==0) {ColorButton21=clrForestGreen; ColorButton22=clrCrimson; ColorButton23=clrCrimson; ColorButton24=clrCrimson;}
   if(ManageOrders==1) {ColorButton21=clrCrimson; ColorButton22=clrForestGreen; ColorButton23=clrCrimson; ColorButton24=clrCrimson;}
   if(ManageOrders==2) {ColorButton21=clrCrimson; ColorButton22=clrCrimson; ColorButton23=clrForestGreen; ColorButton24=clrCrimson;}
   if(ManageOrders==3) {ColorButton21=clrCrimson; ColorButton22=clrCrimson; ColorButton23=clrCrimson; ColorButton24=clrForestGreen;}
//------------------------------------------------------
//External comment
   if(PutStopLoss==true) {SL=DoubleToStr(StopLossPips,2); ColorFontSL=clrGreen;} else {SL="Disabled"; ColorFontSL=clrRed;}
   if(PutTakeProfit==true) {TP=DoubleToStr(TakeProfitPips,2); ColorFontTP=clrGreen;} else {TP="Disabled"; ColorFontTP=clrRed;}
   if(UseTrailingStop==true) {TSL=DoubleToStr(TrailingStop,2); ColorFontTSL=clrGreen;} else {TSL="Disabled"; ColorFontTSL=clrRed;}
   if(UseBreakEven==true) {BE=DoubleToStr(BreakEvenPips,2); ColorFontBE=clrGreen;} else {BE="Disabled"; ColorFontBE=clrRed;}
   if(SoundAlert==true) {SA="Enabled"; ColorFontSA=clrGreen;} else {SA="Disabled"; ColorFontSA=clrRed;}
   if(DeleteOrphans==true) {DO="Enabled"; ColorFontDO=clrGreen;} else {DO="Disabled"; ColorFontDO=clrRed;}
   if(ManageOrders==0) MN="With ID: "+StringSubstr(DoubleToStr(MagicNumber,0),0,10);
   if(ManageOrders==1) MN="All Orders";
   if(ManageOrders==2) MN="Manual Orders";
   if(ManageOrders==3) MN="Own Orders";
//------------------------------------------------------
//Set texts
   if(ObjectFind("Background1")==-1) ChartBackground("Background1",ColorBackground,0,14,200,150);
   if(ObjectFind("Background2")==-1) ChartBackground("Background2",ColorBackground,0,163,200,38);
//if(ObjectFind("Background3")==-1) ChartBackground("Background3",ColorBackground,0,190,200,40);
   if(ObjectFind("Text16")==-1) ChartText("Text16",StringConcatenate("WithID     All      Manual    Own"),10,"Tachoma",ColorFontScreen,5,185);
   if(ObjectFind("Text1")==-1) ChartText("Text1",StringConcatenate("Lot Size Orders"),10,"Arial Black",ColorFontScreen,5,40);
   if(ObjectFind("Text2")==-1) ChartText("Text2",StringConcatenate("Distance Orders"),10,"Arial Black",ColorFontScreen,5,55);
   if(ObjectFind("Text3")==-1) ChartText("Text3",StringConcatenate("Stop Loss Pips   :"),10,"Arial Black",ColorFontScreen,5,70);
   if(ObjectFind("Text4")==-1) ChartText("Text4",StringConcatenate(SL),10,"Arial Black",ColorFontSL,128,70);
   if(ObjectFind("Text5")==-1) ChartText("Text5",StringConcatenate("Take Profit Pips :"),10,"Arial Black",ColorFontScreen,5,85);
   if(ObjectFind("Text6")==-1) ChartText("Text6",StringConcatenate(TP),10,"Arial Black",ColorFontTP,128,85);
   if(ObjectFind("Text7")==-1) ChartText("Text7",StringConcatenate("Trailing SL Pips  :"),10,"Arial Black",ColorFontScreen,5,100);
   if(ObjectFind("Text8")==-1) ChartText("Text8",StringConcatenate(TSL),10,"Arial Black",ColorFontTSL,128,100);
   if(ObjectFind("Text9")==-1) ChartText("Text9",StringConcatenate("Break Even Pips:"),10,"Arial Black",ColorFontScreen,5,115);
   if(ObjectFind("Text10")==-1) ChartText("Text10",StringConcatenate(BE),10,"Arial Black",ColorFontBE,128,115);
   if(ObjectFind("Text11")==-1) ChartText("Text11",StringConcatenate("Delete Orphans : "),10,"Arial Black",ColorFontScreen,5,130);
   if(ObjectFind("Text12")==-1) ChartText("Text12",StringConcatenate(DO),10,"Arial Black",ColorFontDO,128,130);
   if(ObjectFind("Text13")==-1) ChartText("Text13",StringConcatenate("Sound Alert        : "),10,"Arial Black",ColorFontScreen,5,145);
   if(ObjectFind("Text14")==-1) ChartText("Text14",StringConcatenate(SA),10,"Arial Black",ColorFontSA,128,145);
   if(ObjectFind("Text15")==-1) ChartText("Text15",StringConcatenate("Manage  ",MN),10,"Arial Black",ColorFontScreen,5,168);
//------------------------------------------------------
//Panel button
   CallPanelButton();
//------------------------------------------------------
//Lot size set from panel
   LotSizeBox();
   GetLotFromPanel=StringToDouble(ObjectGetString(0,Box1,OBJPROP_TEXT,0));
   FinalLot=GetLotFromPanel;
   if(FinalLot<MarketInfo(Symbol(),MODE_MINLOT)) FinalLot=MarketInfo(Symbol(),MODE_MINLOT);
   if(FinalLot>MarketInfo(Symbol(),MODE_MAXLOT)) FinalLot=MarketInfo(Symbol(),MODE_MAXLOT);
//------------------------------------------------------
//Distance set from panel
   DistanceBox();
   GetDistanceFromPanel=StringToDouble(ObjectGetString(0,Box2,OBJPROP_TEXT,0));
   FinalDistance=GetDistanceFromPanel;
   if(FinalDistance<StopLevel) FinalDistance=StopLevel;
//------------------------------------------------------
//Stop loss set from panel
   if(PutStopLoss==true)
     {
      StopLossBox();
      GetStopLossFromPanel=StringToDouble(ObjectGetString(0,Box3,OBJPROP_TEXT,0));
      FinalStopLoss=GetStopLossFromPanel;
      if(FinalStopLoss<StopLevel) FinalStopLoss=StopLevel;
     }
//------------------------------------------------------
//Take profit set from panel
   if(PutTakeProfit==true)
     {
      TakeProfitBox();
      GetTakeProfitFromPanel=StringToDouble(ObjectGetString(0,Box4,OBJPROP_TEXT,0));
      FinalTakeProfit=GetTakeProfitFromPanel;
      if(FinalTakeProfit<StopLevel) FinalTakeProfit=StopLevel;
     }
//------------------------------------------------------
//Trailint stop loss set from panel
   if(UseTrailingStop==true)
     {
      TrailingBox();
      GetTrailingFromPanel=StringToDouble(ObjectGetString(0,Box5,OBJPROP_TEXT,0));
      FinalTrailing=GetTrailingFromPanel;
      if(FinalTrailing<StopLevel) FinalTrailing=StopLevel;
     }
//------------------------------------------------------
//Break even set from panel
   if(UseBreakEven==true)
     {
      BreakEvenBox();
      GetBreakEvenFromPanel=StringToDouble(ObjectGetString(0,Box6,OBJPROP_TEXT,0));
      FinalBreakEven=GetBreakEvenFromPanel;
      if(FinalBreakEven<StopLevel) FinalBreakEven=StopLevel;
     }
//------------------------------------------------------
//Delete Orphans order
   if(DeleteOrphans==true)
     {
      CountOrders();
      if((CntBuyStop==CntSellStop) && (CntBuyStop+CntSellStop>0)) CheckOrphans=true;
      //---For grid
      if((CntBuy+CntSell>0) && (CntBuyStop>0) && (CntSellStop>0) && (CheckOrphans==true))
        {
         if(CntBuyStop>CntSellStop) {DeleteOrders(1,1); CheckOrphans=false; return;}//Delete buy stop
         if(CntBuyStop<CntSellStop) {DeleteOrders(2,1); CheckOrphans=false; return;}//Delete sell stop
        }
      //---For single
      if((CntBuy+CntSell>0) && (((CntBuyStop==1) && (CntSellStop==0)) || ((CntBuyStop==0) && (CntSellStop==1))) && (CheckOrphans==true))
        {
         if(CntBuyStop>0) {DeleteOrders(1,1); CheckOrphans=false; return;}//Delete buy stop
         if(CntSellStop>0) {DeleteOrders(2,1); CheckOrphans=false; return;}//Delete sell stop
        }
     }
//------------------------------------------------------
//Select order
   for(int i=0; i<OrdersTotal(); i++)
     {
      if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES)==true)
        {
         if((ManageOrders==1) || ((OrderMagicNumber()==MagicNumber) && (ManageOrders==0)) || ((OrderMagicNumber()==0) && (ManageOrders==2)) || ((OrderMagicNumber()==IDorder) && (ManageOrders==3)))
           {
            //------------------------------------------------------
            //Delete stoploss and/or take profit
            if((DeleteTakeProfit==true) || (DeleteStopLoss==true))
              {
               LocalStopLoss=0;
               LocalTakeProfit=0;
               if(DeleteStopLoss==true) LocalStopLoss=-1;
               if(DeleteTakeProfit==true) LocalTakeProfit=-1;
               if((DeleteStopLoss==true)&&(OrderStopLoss()!=0)) LocalStopLoss=0;
               if((DeleteStopLoss==false)&&(OrderStopLoss()!=0)) LocalStopLoss=OrderStopLoss();
               if((DeleteTakeProfit==true)&&(OrderTakeProfit()!=0)) LocalTakeProfit=0;
               if((DeleteTakeProfit==false)&&(OrderTakeProfit()!=0)) LocalTakeProfit=OrderTakeProfit();
               //---
               if((LocalStopLoss==0) || (LocalTakeProfit==0)) WasOrderModified=OrderModify(OrderTicket(),OrderOpenPrice(),LocalStopLoss,LocalTakeProfit,0,clrNONE);
               if(WasOrderModified>0)
                 {
                  Print("Modify ticket: "+DoubleToStr(OrderTicket(),0));
                  if(SoundAlert==true) PlaySound(SoundModify);
                  continue;
                 }
              }
            //------------------------------------------------------
            //Check stop loss and take profit
            if((UseBreakEven==false) && (UseTrailingStop==false))
              {
               if((PutStopLoss==true)&&(OrderStopLoss()!=0)&&(PutTakeProfit==true)&&(OrderTakeProfit()!=0)) continue;
               if((PutStopLoss==true)&&(OrderStopLoss()!=0)&&(PutTakeProfit==false)) continue;
               if((PutStopLoss==false)&&(PutTakeProfit==true)&&(OrderTakeProfit()!=0)) continue;
              }
            //------------------------------------------------------
            //Get prices of ordres of any symbol
            PriceAsk=MarketInfo(OrderSymbol(),MODE_ASK);
            PriceBid=MarketInfo(OrderSymbol(),MODE_BID);
            SymbolPoints=MarketInfo(OrderSymbol(),MODE_POINT)*MultiplierPoint;
            SymbolDigits=(int)MarketInfo(OrderSymbol(),MODE_DIGITS);
            //------------------------------------------------------
            //Modify buy
            if(OrderType()==OP_BUY)
              {
               LocalStopLoss=0;
               LocalTakeProfit=0;
               WasOrderModified=false;
               //------------------------------------------------------
               //put stoploss and/or take profit
               if((UseTrailingStop==true) && (OrderStopLoss()==0)) LocalStopLoss=NormalizeDouble(PriceBid-FinalTrailing*SymbolPoints,SymbolDigits);
               if((PutStopLoss==true) && (OrderStopLoss()==0)) LocalStopLoss=NormalizeDouble(PriceBid-FinalStopLoss*SymbolPoints,SymbolDigits);
               if((PutTakeProfit==true) && (OrderTakeProfit()==0)) LocalTakeProfit=NormalizeDouble(PriceAsk+FinalTakeProfit*SymbolPoints,SymbolDigits); else LocalTakeProfit=OrderTakeProfit();
               //------------------------------------------------------
               //Trailing stop
               if((UseTrailingStop==true) && (LocalStopLoss==0) && (FinalTrailing>0) && (OrderStopLoss()!=0) && (NormalizeDouble(PriceBid-FinalTrailing*SymbolPoints,SymbolDigits)>OrderStopLoss()))
                  LocalStopLoss=NormalizeDouble(PriceBid-FinalTrailing*SymbolPoints,SymbolDigits);
               //------------------------------------------------------
               //Break even
               if((UseBreakEven==true) && (LocalStopLoss==0) && (BreakEvenPips>0) && (NormalizeDouble(PriceBid-BreakEvenAfter*SymbolPoints,SymbolDigits)>=OrderOpenPrice()) && 
                  ((NormalizeDouble(OrderOpenPrice()+BreakEvenPips*SymbolPoints,SymbolDigits)>OrderStopLoss()) || (OrderStopLoss()==0)))
                  LocalStopLoss=NormalizeDouble(OrderOpenPrice()+BreakEvenPips*SymbolPoints,SymbolDigits);
               //-----------------------
               //Modify
               if(((LocalStopLoss>0) && (LocalStopLoss!=NormalizeDouble(OrderStopLoss(),SymbolDigits)) && (OrderStopLoss()!=0)) || (((LocalStopLoss>0) && (OrderStopLoss()==0)) || ((LocalTakeProfit>0) && (OrderTakeProfit()==0))))
                  WasOrderModified=OrderModify(OrderTicket(),OrderOpenPrice(),LocalStopLoss,LocalTakeProfit,0,clrBlue);
               if(WasOrderModified>0)
                 {
                  Print("Modify buy ticket: "+DoubleToStr(OrderTicket(),0));
                  if(SoundAlert==true) PlaySound(SoundModify);
                 }
              }//End if(OrderType()
            //------------------------------------------------------
            //Modify sell
            if(OrderType()==OP_SELL)
              {
               LocalStopLoss=0;
               LocalTakeProfit=0;
               WasOrderModified=false;
               //------------------------------------------------------
               //put stoploss and/or take profit
               if((UseTrailingStop==true) && (OrderStopLoss()==0))
                  LocalStopLoss=NormalizeDouble(PriceAsk+FinalTrailing*SymbolPoints,SymbolDigits);
               if((PutStopLoss==true) && (OrderStopLoss()==0)) LocalStopLoss=NormalizeDouble(PriceAsk+FinalStopLoss*SymbolPoints,SymbolDigits);
               if((PutTakeProfit==true) && (OrderTakeProfit()==0)) LocalTakeProfit=NormalizeDouble(PriceBid-FinalTakeProfit*SymbolPoints,SymbolDigits); else LocalTakeProfit=OrderTakeProfit();
               //------------------------------------------------------
               //Trailing stop
               if((UseTrailingStop==true) && (LocalStopLoss==0) && (FinalTrailing>0) && (OrderStopLoss()!=0) && (NormalizeDouble(PriceAsk+FinalTrailing*SymbolPoints,SymbolDigits)<OrderStopLoss()))
                  LocalStopLoss=NormalizeDouble(PriceAsk+FinalTrailing*SymbolPoints,SymbolDigits);
               //------------------------------------------------------
               //Break even
               if((UseBreakEven==true) && (LocalStopLoss==0) && (BreakEvenPips>0) && (NormalizeDouble(PriceAsk+BreakEvenAfter*SymbolPoints,SymbolDigits)<=OrderOpenPrice()) && 
                  ((NormalizeDouble(OrderOpenPrice()-BreakEvenPips*SymbolPoints,SymbolDigits)<OrderStopLoss()) || (OrderStopLoss()==0)))
                  LocalStopLoss=NormalizeDouble(OrderOpenPrice()-BreakEvenPips*SymbolPoints,SymbolDigits);
               //-----------------------
               //Modify
               if(((LocalStopLoss>0) && (LocalStopLoss!=NormalizeDouble(OrderStopLoss(),SymbolDigits)) && (OrderStopLoss()!=0)) || (((LocalStopLoss>0) && (OrderStopLoss()==0)) || ((LocalTakeProfit>0) && (OrderTakeProfit()==0))))
                  WasOrderModified=OrderModify(OrderTicket(),OrderOpenPrice(),LocalStopLoss,LocalTakeProfit,0,clrRed);
               if(WasOrderModified>0)
                 {
                  Print("Modify sell ticket: "+DoubleToStr(OrderTicket(),0));
                  if(SoundAlert==true) PlaySound(SoundModify);
                 }
              }//End if(OrderType()
            //------------------------------------------------------
            //Closed Market
            if(GetLastError()==132)
              {
               Print(ExpertName+": Could not run, market is closed!!!");
               break;
              }
            //------------------------------------------------------
           }//End if((OrderMagicNumber()...
        }//End OrderSelect(...
     }//End for(...
//------------------------------------------------------
  }
//====================================================================================================================================================//
void CountOrders()
  {
//------------------------------------------------------
   TotalOrders=0;
   CntBuy=0;
   CntSell=0;
   CntBuyStop=0;
   CntSellStop=0;
   PriceLastBuyStop=0;
   PriceLastSellStop=0;
//---
   if(OrdersTotal()>0)
     {
      for(int i=0; i<OrdersTotal(); i++)
        {
         if(OrderSelect(i,SELECT_BY_POS)==true)
           {
            if((OrderMagicNumber()==IDorder) && (OrderSymbol()==Symbol()))
              {
               TotalOrders++;
               if(OrderType()==OP_BUY) CntBuy++;
               if(OrderType()==OP_SELL) CntSell++;
               if(OrderType()==OP_BUYSTOP) {CntBuyStop++; PriceLastBuyStop=OrderOpenPrice();}
               if(OrderType()==OP_SELLSTOP) {CntSellStop++; PriceLastSellStop=OrderOpenPrice();}
              }
           }
        }
     }
//------------------------------------------------------
  }
//====================================================================================================================================================//
//open orders function
void OpenPosition(int PositionType)
  {
//------------------------------------------------------
   double StopLossOrder=0;
   double TakeProfitOrder=0;
   int OpenOrderTicket;
   double OpenPrice=0;
   color OpenColor=clrNONE;
   string TypeOfOrder;
   double LotSize=MathMin(MathMax((MathRound(FinalLot/MarketInfo(Symbol(),MODE_LOTSTEP))*MarketInfo(Symbol(),MODE_LOTSTEP)),MarketInfo(Symbol(),MODE_MINLOT)),MarketInfo(Symbol(),MODE_MAXLOT));
//------------------------------------------------------
//Buy stop loss and take profit in price
   if(PositionType==OP_BUY)
     {
      if(PutStopLoss==true) StopLossOrder=NormalizeDouble(Bid-FinalStopLoss*DigitPoint,Digits);
      if(PutTakeProfit==true)TakeProfitOrder=NormalizeDouble(Ask+FinalTakeProfit*DigitPoint,Digits);
      OpenPrice=NormalizeDouble(Ask,Digits);
      OpenColor=clrBlue;
      TypeOfOrder="Buy";
     }
//------------------------------------------------------
//Sell stop loss and take profit in price
   if(PositionType==OP_SELL)
     {
      if(PutStopLoss==true) StopLossOrder=NormalizeDouble(Ask+FinalStopLoss*DigitPoint,Digits);
      if(PutTakeProfit==true)TakeProfitOrder=NormalizeDouble(Bid-FinalTakeProfit*DigitPoint,Digits);
      OpenPrice=NormalizeDouble(Bid,Digits);
      OpenColor=clrRed;
      TypeOfOrder="Sell";
     }
//------------------------------------------------------
//Send orders
   OpenOrderTicket=OrderSend(Symbol(),PositionType,LotSize,OpenPrice,3,StopLossOrder,TakeProfitOrder,ExpertName,IDorder,0,OpenColor);
//---
   if(OpenOrderTicket>0) if(SoundAlert==true) PlaySound(SoundOpen);
//---Market is closed
   if(GetLastError()==132) Print(ExpertName+": Could not open order, market is closed");
//---Trade is disabled
   if(GetLastError()==133) Print(ExpertName+": Could not open order, trade is disabled");
//---Not enough money
   if(GetLastError()==134) Print(ExpertName+": Could not open order, not enough money");
//---Broker is busy
   if(GetLastError()==137) Print(ExpertName+": Could not open order, broker is busy");
//---The amount of open and pending orders has reached the limit set by the broker
   if(GetLastError()==148) Print(ExpertName+": Could not open order, too many orders");
//---Invalid ticket
   if(GetLastError()==4108) Print(ExpertName+": Could not open order, invalid ticket");
//---Trade is not allowed. Enable checkbox "Allow live trading" in the Expert Advisor properties
   if(GetLastError()==4109) Print(ExpertName+": Could not open order, trade is not allowed");
//------------------------------------------------------
  }
//====================================================================================================================================================//
double CalculateLot()
  {
//------------------------------------------------------
   double OrdrLot=0;
//---
   if(UseAutoLotSize==true) OrdrLot=(AccountBalance()/MarketInfo(Symbol(),MODE_LOTSIZE))*RiskFactor;
   if(UseAutoLotSize==false) OrdrLot=LotSizeOrders;
//---
   return(MathMin(MathMax((MathRound(OrdrLot/MarketInfo(Symbol(),MODE_LOTSTEP))*MarketInfo(Symbol(),MODE_LOTSTEP)),MarketInfo(Symbol(),MODE_MINLOT)),MarketInfo(Symbol(),MODE_MAXLOT)));
//------------------------------------------------------
  }
//====================================================================================================================================================//
void OpenOrders(int TypeOrdersOpen)
  {
//------------------------------------------------------
   int TicketBuyStop=0;
   int TicketSellStop=0;
//---------------------------------------------------------------------
//Set stop loss and take profit
   double SLbuy=0;
   double SLsell=0;
   double TPbuy=0;
   double TPsell=0;
   double PriceOpenBuyStop=0;
   double PriceOpenSellStop=0;
//------------------------------------------------------
//Count orders
   CountOrders();
//---------------------------------------------------------------------
//Set levels for buy stop
   if(CntBuyStop==0) PriceOpenBuyStop=NormalizeDouble(Ask+FinalDistance*DigitPoint,Digits);
   if(CntBuyStop>0) PriceOpenBuyStop=NormalizeDouble(PriceLastBuyStop+FinalDistance*DigitPoint,Digits);
//---
   if(PutStopLoss==true) SLbuy=NormalizeDouble(PriceOpenBuyStop-(FinalStopLoss*DigitPoint)-(SpreadPair*DigitPoint),Digits);
   if(PutTakeProfit==true) TPbuy=NormalizeDouble(PriceOpenBuyStop+(FinalTakeProfit*DigitPoint),Digits);
//---------------------------------------------------------------------
//Set levels for sell stop
   if(CntSellStop==0) PriceOpenSellStop=NormalizeDouble(Bid-FinalDistance*DigitPoint,Digits);
   if(CntSellStop>0) PriceOpenSellStop=NormalizeDouble(PriceLastSellStop-FinalDistance*DigitPoint,Digits);
//---
   if(PutStopLoss==true) SLsell=NormalizeDouble(PriceOpenSellStop+(FinalStopLoss*DigitPoint)+(SpreadPair*DigitPoint),Digits);
   if(PutTakeProfit==true) TPsell=NormalizeDouble(PriceOpenSellStop-(FinalTakeProfit*DigitPoint),Digits);
//---------------------------------------------------------------------
//---Send orders
//---Open buy and sell stop
   if(TypeOrdersOpen==0)
     {
      TicketBuyStop=OrderSend(Symbol(),OP_BUYSTOP,OrderLotSize,PriceOpenBuyStop,3,SLbuy,TPbuy,ExpertName,IDorder,0,clrBlue);
      TicketSellStop=OrderSend(Symbol(),OP_SELLSTOP,OrderLotSize,PriceOpenSellStop,3,SLsell,TPsell,ExpertName,IDorder,0,clrRed);
     }
//---Open buy stop
   if(TypeOrdersOpen==1)
     {
      TicketBuyStop=OrderSend(Symbol(),OP_BUYSTOP,OrderLotSize,PriceOpenBuyStop,3,SLbuy,TPbuy,ExpertName,IDorder,0,clrBlue);
     }
//---Open sell stop
   if(TypeOrdersOpen==2)
     {
      TicketSellStop=OrderSend(Symbol(),OP_SELLSTOP,OrderLotSize,PriceOpenSellStop,3,SLsell,TPsell,ExpertName,IDorder,0,clrRed);
     }
//---Play sound
   if(SoundAlert==true)
     {
      if(TicketBuyStop>0) PlaySound(SoundOpen);
      if(TicketSellStop>0) PlaySound(SoundOpen);
     }
//------------------------------------------------------
  }
//====================================================================================================================================================//
void DeleteOrders(int TypeOrdersDelete,int PairOrdersDelete)
  {
//---------------------------------------------------------------------
   bool DeleteTicket=false;
   Print(TypeOrdersDelete);
//------------------------------------------------------
//Select order
   for(int i=OrdersTotal()-1; i>=0; i--)
     {
      if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES)==true)
        {
         if((ManageOrders==1) || ((OrderMagicNumber()==MagicNumber) && (ManageOrders==0)) || ((OrderMagicNumber()==0) && (ManageOrders==2)) || ((OrderMagicNumber()==IDorder) && (ManageOrders==3)))
           {
            if(((OrderSymbol()==Symbol()) && (PairOrdersDelete==1)) || (PairOrdersDelete==0))
              {
               //---Delete buy stop
               if((TypeOrdersDelete==1) && (OrderType()==OP_BUYSTOP))
                 {
                  DeleteTicket=OrderDelete(OrderTicket(),clrNONE);
                  if((DeleteTicket>0) && (SoundAlert==true)) PlaySound(SoundDelete);
                 }
               //---Delete sell stop
               if((TypeOrdersDelete==2) && (OrderType()==OP_SELLSTOP))
                 {
                  DeleteTicket=OrderDelete(OrderTicket(),clrNONE);
                  if((DeleteTicket>0) && (SoundAlert==true)) PlaySound(SoundDelete);
                 }
               //---Delete all
               if((TypeOrdersDelete==0) && ((OrderType()==OP_BUYSTOP) || (OrderType()==OP_SELLSTOP)))
                 {
                  DeleteTicket=OrderDelete(OrderTicket(),clrNONE);
                  if((DeleteTicket>0) && (SoundAlert==true)) PlaySound(SoundDelete);
                 }
              }
           }
        }
     }
//---------------------------------------------------------------------
  }
//====================================================================================================================================================//
void ClosePositions(int PositionType,int PairOrdersClose)
  {
//------------------------------------------------------
   int TryCnt=0;
   bool WasOrderClosed;
//------------------------------------------------------
   for(int i=OrdersTotal()-1; i>=0; i--)
     {
      if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES)==true)
        {
         if((ManageOrders==1) || ((OrderMagicNumber()==MagicNumber) && (ManageOrders==0)) || ((OrderMagicNumber()==0) && (ManageOrders==2)) || ((OrderMagicNumber()==IDorder) && (ManageOrders==3)))
           {
            if(((OrderSymbol()==Symbol()) && (PairOrdersClose==1)) || (PairOrdersClose==0))
              {
               //------------------------------------------------------
               //Close buy
               if((OrderType()==OP_BUY) && ((PositionType==1) || (PositionType==0)))
                 {
                  TryCnt=0;
                  WasOrderClosed=false;
                  while(true)
                    {
                     //---close order
                     WasOrderClosed=OrderClose(OrderTicket(),OrderLots(),NormalizeDouble(Bid,Digits),3,clrMediumAquamarine);
                     TryCnt++;
                     //---
                     if(WasOrderClosed>0)
                       {
                        if(SoundAlert==true) PlaySound(SoundClose);
                        break;
                       }
                     //---Errors
                     if((GetLastError()==1) || (GetLastError()==132) || (GetLastError()==133) || (GetLastError()==137) || (GetLastError()==4108) || (GetLastError()==4109)) break;
                     //---try 3 times to close
                     if(TryCnt==3)
                       {
                        Print(StringConcatenate("Error: ",GetLastError()," || ",ExpertName,": Could not close, ticket: ",OrderTicket()));
                        break;
                       }
                     else
                       {
                        Print(StringConcatenate("Error: ",GetLastError()," || ",ExpertName,": receives new data and try again close order - ",OrderTicket()));
                        RefreshRates();
                       }
                    }//End while(...
                 }//End if(OrderType()==OP_BUY)
               //------------------------------------------------------
               //Close sell
               if((OrderType()==OP_SELL) && ((PositionType==2) || (PositionType==0)))
                 {
                  TryCnt=0;
                  WasOrderClosed=false;
                  while(true)
                    {
                     //---close order
                     WasOrderClosed=OrderClose(OrderTicket(),OrderLots(),NormalizeDouble(Ask,Digits),3,clrDarkSalmon);
                     TryCnt++;
                     //---
                     if(WasOrderClosed>0)
                       {
                        if(SoundAlert==true) PlaySound(SoundClose);
                        break;
                       }
                     //---Errors
                     if((GetLastError()==1) || (GetLastError()==132) || (GetLastError()==133) || (GetLastError()==137) || (GetLastError()==4108) || (GetLastError()==4109)) break;
                     //---try 3 times to close
                     if(TryCnt==3)
                       {
                        Print(StringConcatenate("Error: ",GetLastError()," || ",ExpertName,": Could not close, ticket: ",OrderTicket()));
                        break;
                       }
                     else
                       {
                        Print(StringConcatenate("Error: ",GetLastError()," || ",ExpertName,": receives new data and try again close order - ",OrderTicket()));
                        RefreshRates();
                       }
                    }//End while(...
                 }//End if(OrderType()==OP_SELL)
               //------------------------------------------------------
              }//End if((OrderSymbol()...
           }//End OrderSelect(...
        }//End for(...
     }
//------------------------------------------------------
  }
//====================================================================================================================================================//
int UniqueMagic()
  {
//------------------------------------------------------
   int SymbolCharacter=StringLen(Symbol());
   int ExpertCharacter=StringLen(ExpertName);
   int ExpertID=0;
   int SymbolID=0;
   int cnt;
//---ID symbol
   for(cnt=0; cnt<SymbolCharacter; cnt++) SymbolID+=(StringGetChar(Symbol(),cnt-1)*(cnt+1));
//---ID expert
   for(cnt=0; cnt<ExpertCharacter; cnt++) ExpertID+=(StringGetChar(ExpertName,cnt-1)*(cnt+1));
//---
   return(SymbolID+ExpertID);
//------------------------------------------------------
  }
//====================================================================================================================================================//
void ChartText(string StringName,string Image,int FontSize,string TypeImage,color FontColor,int Xposition,int Yposition)
  {
//------------------------------------------------------
   if(ObjectFind(0,StringName)==-1)
     {
      ObjectCreate(StringName,OBJ_LABEL,0,0,0);
      ObjectSet(StringName,OBJPROP_CORNER,0);
      ObjectSet(StringName,OBJPROP_BACK,FALSE);
      ObjectSet(StringName,OBJPROP_XDISTANCE,Xposition);
      ObjectSet(StringName,OBJPROP_YDISTANCE,Yposition);
      ObjectSet(StringName,OBJPROP_HIDDEN,1);
      ObjectSetText(StringName,Image,FontSize,TypeImage,FontColor);
     }
//------------------------------------------------------
  }
//====================================================================================================================================================//
void ChartBackground(string StringName,color ImageColor,int Xposition,int Yposition,int Xsize,int Ysize)
  {
//------------------------------------------------------
   if(ObjectFind(0,StringName)==-1)
     {
      ObjectCreate(0,StringName,OBJ_RECTANGLE_LABEL,0,0,0,0,0);
      ObjectSetInteger(0,StringName,OBJPROP_XDISTANCE,Xposition);
      ObjectSetInteger(0,StringName,OBJPROP_YDISTANCE,Yposition);
      ObjectSetInteger(0,StringName,OBJPROP_XSIZE,Xsize);
      ObjectSetInteger(0,StringName,OBJPROP_YSIZE,Ysize);
      ObjectSetInteger(0,StringName,OBJPROP_BGCOLOR,ColorBackground);
      ObjectSetInteger(0,StringName,OBJPROP_BORDER_TYPE,BORDER_FLAT);
      ObjectSetInteger(0,StringName,OBJPROP_BORDER_COLOR,clrBlack);
      ObjectSetInteger(0,StringName,OBJPROP_BACK,false);
      ObjectSetInteger(0,StringName,OBJPROP_SELECTABLE,false);
      ObjectSetInteger(0,StringName,OBJPROP_SELECTED,false);
      ObjectSetInteger(0,StringName,OBJPROP_HIDDEN,true);
      ObjectSetInteger(0,StringName,OBJPROP_ZORDER,0);
     }
//------------------------------------------------------
  }
//====================================================================================================================================================//
void CallPanelButton()
  {
//------------------------------------------------------
   if(ObjectFind(0,Button1)==-1)
     {
      ObjectCreate(0,Button1,OBJ_BUTTON,0,0,0);
      ObjectSetInteger(0,Button1,OBJPROP_CORNER,0);
      ObjectSetInteger(0,Button1,OBJPROP_XDISTANCE,0);
      ObjectSetInteger(0,Button1,OBJPROP_YDISTANCE,14);
      ObjectSetInteger(0,Button1,OBJPROP_XSIZE,200);
      ObjectSetInteger(0,Button1,OBJPROP_YSIZE,25);
      ObjectSetInteger(0,Button1,OBJPROP_BGCOLOR,ColorCallButton);
      ObjectSetString(0,Button1,OBJPROP_FONT,"Arial Black");
      ObjectSetInteger(0,Button1,OBJPROP_FONTSIZE,10);
      ObjectSetInteger(0,Button1,OBJPROP_COLOR,ColorFontButton);
      ObjectSetInteger(0,Button1,OBJPROP_SELECTABLE,0);
      ObjectSetInteger(0,Button1,OBJPROP_HIDDEN,1);
      ObjectSetString(0,Button1,OBJPROP_TEXT,"CALL ORDERS PANEL");
     }
//------------------------------------------------------
  }
//====================================================================================================================================================//
void ManageOrdersBox()
  {
//------------------------------------------------------
//Manage ID
   if(ObjectFind(0,Button21)==-1)
     {
      ObjectCreate(0,Button21,OBJ_BUTTON,0,0,0);
      ObjectSetInteger(0,Button21,OBJPROP_CORNER,0);
      ObjectSetInteger(0,Button21,OBJPROP_XDISTANCE,0);
      ObjectSetInteger(0,Button21,OBJPROP_YDISTANCE,200);
      ObjectSetInteger(0,Button21,OBJPROP_XSIZE,50);
      ObjectSetInteger(0,Button21,OBJPROP_YSIZE,30);
      ObjectSetInteger(0,Button21,OBJPROP_BGCOLOR,ColorBackground);
      ObjectSetInteger(0,Button21,OBJPROP_BORDER_TYPE,BORDER_FLAT);
      ObjectSetInteger(0,Button21,OBJPROP_BORDER_COLOR,ColorButton21);
      ObjectSetInteger(0,Button21,OBJPROP_STATE,false);
      ObjectSetString(0,Button21,OBJPROP_FONT,"Webdings");
      ObjectSetInteger(0,Button21,OBJPROP_FONTSIZE,10);
      ObjectSetInteger(0,Button21,OBJPROP_COLOR,ColorButton21);
      ObjectSetInteger(0,Button21,OBJPROP_SELECTABLE,0);
      ObjectSetInteger(0,Button21,OBJPROP_HIDDEN,1);
      ObjectSetString(0,Button21,OBJPROP_TEXT,"n");
     }
//------------------------------------------------------
//Manage all
   if(ObjectFind(0,Button22)==-1)
     {
      ObjectCreate(0,Button22,OBJ_BUTTON,0,0,0);
      ObjectSetInteger(0,Button22,OBJPROP_CORNER,0);
      ObjectSetInteger(0,Button22,OBJPROP_XDISTANCE,50);
      ObjectSetInteger(0,Button22,OBJPROP_YDISTANCE,200);
      ObjectSetInteger(0,Button22,OBJPROP_XSIZE,50);
      ObjectSetInteger(0,Button22,OBJPROP_YSIZE,30);
      ObjectSetInteger(0,Button22,OBJPROP_BGCOLOR,ColorBackground);
      ObjectSetInteger(0,Button22,OBJPROP_BORDER_TYPE,BORDER_FLAT);
      ObjectSetInteger(0,Button22,OBJPROP_BORDER_COLOR,ColorButton22);
      ObjectSetInteger(0,Button22,OBJPROP_STATE,false);
      ObjectSetString(0,Button22,OBJPROP_FONT,"Webdings");
      ObjectSetInteger(0,Button22,OBJPROP_FONTSIZE,10);
      ObjectSetInteger(0,Button22,OBJPROP_COLOR,ColorButton22);
      ObjectSetInteger(0,Button22,OBJPROP_SELECTABLE,0);
      ObjectSetInteger(0,Button22,OBJPROP_HIDDEN,1);
      ObjectSetString(0,Button22,OBJPROP_TEXT,"n");
     }
//------------------------------------------------------
//Manage manual
   if(ObjectFind(0,Button23)==-1)
     {
      ObjectCreate(0,Button23,OBJ_BUTTON,0,0,0);
      ObjectSetInteger(0,Button23,OBJPROP_CORNER,0);
      ObjectSetInteger(0,Button23,OBJPROP_XDISTANCE,100);
      ObjectSetInteger(0,Button23,OBJPROP_YDISTANCE,200);
      ObjectSetInteger(0,Button23,OBJPROP_XSIZE,50);
      ObjectSetInteger(0,Button23,OBJPROP_YSIZE,30);
      ObjectSetInteger(0,Button23,OBJPROP_BGCOLOR,ColorBackground);
      ObjectSetInteger(0,Button23,OBJPROP_BORDER_TYPE,BORDER_FLAT);
      ObjectSetInteger(0,Button23,OBJPROP_BORDER_COLOR,ColorButton23);
      ObjectSetInteger(0,Button23,OBJPROP_STATE,false);
      ObjectSetString(0,Button23,OBJPROP_FONT,"Webdings");
      ObjectSetInteger(0,Button23,OBJPROP_FONTSIZE,10);
      ObjectSetInteger(0,Button23,OBJPROP_COLOR,ColorButton23);
      ObjectSetInteger(0,Button23,OBJPROP_SELECTABLE,0);
      ObjectSetInteger(0,Button23,OBJPROP_HIDDEN,1);
      ObjectSetString(0,Button23,OBJPROP_TEXT,"n");
     }
//------------------------------------------------------
//Manage own
   if(ObjectFind(0,Button24)==-1)
     {
      ObjectCreate(0,Button24,OBJ_BUTTON,0,0,0);
      ObjectSetInteger(0,Button24,OBJPROP_CORNER,0);
      ObjectSetInteger(0,Button24,OBJPROP_XDISTANCE,150);
      ObjectSetInteger(0,Button24,OBJPROP_YDISTANCE,200);
      ObjectSetInteger(0,Button24,OBJPROP_XSIZE,50);
      ObjectSetInteger(0,Button24,OBJPROP_YSIZE,30);
      ObjectSetInteger(0,Button24,OBJPROP_BGCOLOR,ColorBackground);
      ObjectSetInteger(0,Button24,OBJPROP_BORDER_TYPE,BORDER_FLAT);
      ObjectSetInteger(0,Button24,OBJPROP_BORDER_COLOR,ColorButton24);
      ObjectSetInteger(0,Button24,OBJPROP_STATE,false);
      ObjectSetString(0,Button24,OBJPROP_FONT,"Webdings");
      ObjectSetInteger(0,Button24,OBJPROP_FONTSIZE,10);
      ObjectSetInteger(0,Button24,OBJPROP_COLOR,ColorButton24);
      ObjectSetInteger(0,Button24,OBJPROP_SELECTABLE,0);
      ObjectSetInteger(0,Button24,OBJPROP_HIDDEN,1);
      ObjectSetString(0,Button24,OBJPROP_TEXT,"n");
     }
//------------------------------------------------------
  }
//====================================================================================================================================================//
void FullOrdersPanel()
  {
//------------------------------------------------------
//Open buy
   if(ObjectFind(0,Button2)==-1)
     {
      ObjectCreate(0,Button2,OBJ_BUTTON,0,0,0);
      ObjectSetInteger(0,Button2,OBJPROP_CORNER,2);
      ObjectSetInteger(0,Button2,OBJPROP_XDISTANCE,10);
      ObjectSetInteger(0,Button2,OBJPROP_YDISTANCE,330);
      ObjectSetInteger(0,Button2,OBJPROP_XSIZE,160);
      ObjectSetInteger(0,Button2,OBJPROP_YSIZE,25);
      ObjectSetInteger(0,Button2,OBJPROP_BGCOLOR,ColorOpenButton);
      ObjectSetInteger(0,Button2,OBJPROP_STATE,false);
      ObjectSetString(0,Button2,OBJPROP_FONT,"Tahoma");
      ObjectSetInteger(0,Button2,OBJPROP_FONTSIZE,10);
      ObjectSetInteger(0,Button2,OBJPROP_COLOR,ColorFontButton);
      ObjectSetInteger(0,Button2,OBJPROP_SELECTABLE,0);
      ObjectSetInteger(0,Button2,OBJPROP_HIDDEN,1);
      ObjectSetString(0,Button2,OBJPROP_TEXT,"Open Buy on "+StringSubstr(Symbol(),0,6));
     }
//------------------------------------------------------
//Open sell
   if(ObjectFind(0,Button3)==-1)
     {
      ObjectCreate(0,Button3,OBJ_BUTTON,0,0,0);
      ObjectSetInteger(0,Button3,OBJPROP_CORNER,2);
      ObjectSetInteger(0,Button3,OBJPROP_XDISTANCE,10);
      ObjectSetInteger(0,Button3,OBJPROP_YDISTANCE,300);
      ObjectSetInteger(0,Button3,OBJPROP_XSIZE,160);
      ObjectSetInteger(0,Button3,OBJPROP_YSIZE,25);
      ObjectSetInteger(0,Button3,OBJPROP_BGCOLOR,ColorOpenButton);
      ObjectSetInteger(0,Button3,OBJPROP_STATE,false);
      ObjectSetString(0,Button3,OBJPROP_FONT,"Tahoma");
      ObjectSetInteger(0,Button3,OBJPROP_FONTSIZE,10);
      ObjectSetInteger(0,Button3,OBJPROP_COLOR,ColorFontButton);
      ObjectSetInteger(0,Button3,OBJPROP_SELECTABLE,0);
      ObjectSetInteger(0,Button3,OBJPROP_HIDDEN,1);
      ObjectSetString(0,Button3,OBJPROP_TEXT,"Open Sell on "+StringSubstr(Symbol(),0,6));
     }
//------------------------------------------------------
//Place pending buy
   if(ObjectFind(0,Button4)==-1)
     {
      ObjectCreate(0,Button4,OBJ_BUTTON,0,0,0);
      ObjectSetInteger(0,Button4,OBJPROP_CORNER,2);
      ObjectSetInteger(0,Button4,OBJPROP_XDISTANCE,10);
      ObjectSetInteger(0,Button4,OBJPROP_YDISTANCE,270);
      ObjectSetInteger(0,Button4,OBJPROP_XSIZE,160);
      ObjectSetInteger(0,Button4,OBJPROP_YSIZE,25);
      ObjectSetInteger(0,Button4,OBJPROP_BGCOLOR,ColorPlaceButton);
      ObjectSetInteger(0,Button4,OBJPROP_STATE,false);
      ObjectSetString(0,Button4,OBJPROP_FONT,"Tahoma");
      ObjectSetInteger(0,Button4,OBJPROP_FONTSIZE,10);
      ObjectSetInteger(0,Button4,OBJPROP_COLOR,ColorFontButton);
      ObjectSetInteger(0,Button4,OBJPROP_SELECTABLE,0);
      ObjectSetInteger(0,Button4,OBJPROP_HIDDEN,1);
      ObjectSetString(0,Button4,OBJPROP_TEXT,"Place Buy Stop on "+StringSubstr(Symbol(),0,6));
     }
//------------------------------------------------------
//Place pending sell
   if(ObjectFind(0,Button5)==-1)
     {
      ObjectCreate(0,Button5,OBJ_BUTTON,0,0,0);
      ObjectSetInteger(0,Button5,OBJPROP_CORNER,2);
      ObjectSetInteger(0,Button5,OBJPROP_XDISTANCE,10);
      ObjectSetInteger(0,Button5,OBJPROP_YDISTANCE,240);
      ObjectSetInteger(0,Button5,OBJPROP_XSIZE,160);
      ObjectSetInteger(0,Button5,OBJPROP_YSIZE,25);
      ObjectSetInteger(0,Button5,OBJPROP_BGCOLOR,ColorPlaceButton);
      ObjectSetInteger(0,Button5,OBJPROP_STATE,false);
      ObjectSetString(0,Button5,OBJPROP_FONT,"Tahoma");
      ObjectSetInteger(0,Button5,OBJPROP_FONTSIZE,10);
      ObjectSetInteger(0,Button5,OBJPROP_COLOR,ColorFontButton);
      ObjectSetInteger(0,Button5,OBJPROP_SELECTABLE,0);
      ObjectSetInteger(0,Button5,OBJPROP_HIDDEN,1);
      ObjectSetString(0,Button5,OBJPROP_TEXT,"Place Sell Stop on "+StringSubstr(Symbol(),0,6));
     }
//------------------------------------------------------
//Place pending buy and sell
   if(ObjectFind(0,Button6)==-1)
     {
      ObjectCreate(0,Button6,OBJ_BUTTON,0,0,0);
      ObjectSetInteger(0,Button6,OBJPROP_CORNER,2);
      ObjectSetInteger(0,Button6,OBJPROP_XDISTANCE,10);
      ObjectSetInteger(0,Button6,OBJPROP_YDISTANCE,210);
      ObjectSetInteger(0,Button6,OBJPROP_XSIZE,160);
      ObjectSetInteger(0,Button6,OBJPROP_YSIZE,25);
      ObjectSetInteger(0,Button6,OBJPROP_BGCOLOR,ColorPlaceButton);
      ObjectSetInteger(0,Button6,OBJPROP_STATE,false);
      ObjectSetString(0,Button6,OBJPROP_FONT,"Tahoma");
      ObjectSetInteger(0,Button6,OBJPROP_FONTSIZE,10);
      ObjectSetInteger(0,Button6,OBJPROP_COLOR,ColorFontButton);
      ObjectSetInteger(0,Button6,OBJPROP_SELECTABLE,0);
      ObjectSetInteger(0,Button6,OBJPROP_HIDDEN,1);
      ObjectSetString(0,Button6,OBJPROP_TEXT,"Place B&S Stop on "+StringSubstr(Symbol(),0,6));
     }
//------------------------------------------------------
//Close buy
   if(ObjectFind(0,Button7)==-1)
     {
      ObjectCreate(0,Button7,OBJ_BUTTON,0,0,0);
      ObjectSetInteger(0,Button7,OBJPROP_CORNER,2);
      ObjectSetInteger(0,Button7,OBJPROP_XDISTANCE,10);
      ObjectSetInteger(0,Button7,OBJPROP_YDISTANCE,180);
      ObjectSetInteger(0,Button7,OBJPROP_XSIZE,160);
      ObjectSetInteger(0,Button7,OBJPROP_YSIZE,25);
      ObjectSetInteger(0,Button7,OBJPROP_BGCOLOR,ColorCloseButton);
      ObjectSetInteger(0,Button7,OBJPROP_STATE,false);
      ObjectSetString(0,Button7,OBJPROP_FONT,"Tahoma");
      ObjectSetInteger(0,Button7,OBJPROP_FONTSIZE,10);
      ObjectSetInteger(0,Button7,OBJPROP_COLOR,ColorFontButton);
      ObjectSetInteger(0,Button7,OBJPROP_SELECTABLE,0);
      ObjectSetInteger(0,Button7,OBJPROP_HIDDEN,1);
      ObjectSetString(0,Button7,OBJPROP_TEXT,"Close Buy on "+StringSubstr(Symbol(),0,6));
     }
//------------------------------------------------------
//Close sell
   if(ObjectFind(0,Button8)==-1)
     {
      ObjectCreate(0,Button8,OBJ_BUTTON,0,0,0);
      ObjectSetInteger(0,Button8,OBJPROP_CORNER,2);
      ObjectSetInteger(0,Button8,OBJPROP_XDISTANCE,10);
      ObjectSetInteger(0,Button8,OBJPROP_YDISTANCE,150);
      ObjectSetInteger(0,Button8,OBJPROP_XSIZE,160);
      ObjectSetInteger(0,Button8,OBJPROP_YSIZE,25);
      ObjectSetInteger(0,Button8,OBJPROP_BGCOLOR,ColorCloseButton);
      ObjectSetInteger(0,Button8,OBJPROP_STATE,false);
      ObjectSetString(0,Button8,OBJPROP_FONT,"Tahoma");
      ObjectSetInteger(0,Button8,OBJPROP_FONTSIZE,10);
      ObjectSetInteger(0,Button8,OBJPROP_COLOR,ColorFontButton);
      ObjectSetInteger(0,Button8,OBJPROP_SELECTABLE,0);
      ObjectSetInteger(0,Button8,OBJPROP_HIDDEN,1);
      ObjectSetString(0,Button8,OBJPROP_TEXT,"Close Sell on "+StringSubstr(Symbol(),0,6));
     }
//------------------------------------------------------
//Close all
   if(ObjectFind(0,Button9)==-1)
     {
      ObjectCreate(0,Button9,OBJ_BUTTON,0,0,0);
      ObjectSetInteger(0,Button9,OBJPROP_CORNER,2);
      ObjectSetInteger(0,Button9,OBJPROP_XDISTANCE,10);
      ObjectSetInteger(0,Button9,OBJPROP_YDISTANCE,120);
      ObjectSetInteger(0,Button9,OBJPROP_XSIZE,160);
      ObjectSetInteger(0,Button9,OBJPROP_YSIZE,25);
      ObjectSetInteger(0,Button9,OBJPROP_BGCOLOR,ColorCloseButton);
      ObjectSetInteger(0,Button9,OBJPROP_STATE,false);
      ObjectSetString(0,Button9,OBJPROP_FONT,"Tahoma");
      ObjectSetInteger(0,Button9,OBJPROP_FONTSIZE,10);
      ObjectSetInteger(0,Button9,OBJPROP_COLOR,ColorFontButton);
      ObjectSetInteger(0,Button9,OBJPROP_SELECTABLE,0);
      ObjectSetInteger(0,Button9,OBJPROP_HIDDEN,1);
      ObjectSetString(0,Button9,OBJPROP_TEXT,"Close All on "+StringSubstr(Symbol(),0,6));
     }
//------------------------------------------------------
//Delete buy stop pending
   if(ObjectFind(0,Button10)==-1)
     {
      ObjectCreate(0,Button10,OBJ_BUTTON,0,0,0);
      ObjectSetInteger(0,Button10,OBJPROP_CORNER,2);
      ObjectSetInteger(0,Button10,OBJPROP_XDISTANCE,10);
      ObjectSetInteger(0,Button10,OBJPROP_YDISTANCE,90);
      ObjectSetInteger(0,Button10,OBJPROP_XSIZE,160);
      ObjectSetInteger(0,Button10,OBJPROP_YSIZE,25);
      ObjectSetInteger(0,Button10,OBJPROP_BGCOLOR,ColorDeleteButton);
      ObjectSetInteger(0,Button10,OBJPROP_STATE,false);
      ObjectSetString(0,Button10,OBJPROP_FONT,"Tahoma");
      ObjectSetInteger(0,Button10,OBJPROP_FONTSIZE,10);
      ObjectSetInteger(0,Button10,OBJPROP_COLOR,ColorFontButton);
      ObjectSetInteger(0,Button10,OBJPROP_SELECTABLE,0);
      ObjectSetInteger(0,Button10,OBJPROP_HIDDEN,1);
      ObjectSetString(0,Button10,OBJPROP_TEXT,"Delete BuyStop on "+StringSubstr(Symbol(),0,6));
     }
//------------------------------------------------------
//Delete sell stop pending
   if(ObjectFind(0,Button11)==-1)
     {
      ObjectCreate(0,Button11,OBJ_BUTTON,0,0,0);
      ObjectSetInteger(0,Button11,OBJPROP_CORNER,2);
      ObjectSetInteger(0,Button11,OBJPROP_XDISTANCE,10);
      ObjectSetInteger(0,Button11,OBJPROP_YDISTANCE,60);
      ObjectSetInteger(0,Button11,OBJPROP_XSIZE,160);
      ObjectSetInteger(0,Button11,OBJPROP_YSIZE,25);
      ObjectSetInteger(0,Button11,OBJPROP_BGCOLOR,ColorDeleteButton);
      ObjectSetInteger(0,Button11,OBJPROP_STATE,false);
      ObjectSetString(0,Button11,OBJPROP_FONT,"Tahoma");
      ObjectSetInteger(0,Button11,OBJPROP_FONTSIZE,10);
      ObjectSetInteger(0,Button11,OBJPROP_COLOR,ColorFontButton);
      ObjectSetInteger(0,Button11,OBJPROP_SELECTABLE,0);
      ObjectSetInteger(0,Button11,OBJPROP_HIDDEN,1);
      ObjectSetString(0,Button11,OBJPROP_TEXT,"Delete SellStop on "+StringSubstr(Symbol(),0,6));
     }
//------------------------------------------------------
//Delete all pending
   if(ObjectFind(0,Button12)==-1)
     {
      ObjectCreate(0,Button12,OBJ_BUTTON,0,0,0);
      ObjectSetInteger(0,Button12,OBJPROP_CORNER,2);
      ObjectSetInteger(0,Button12,OBJPROP_XDISTANCE,10);
      ObjectSetInteger(0,Button12,OBJPROP_YDISTANCE,30);
      ObjectSetInteger(0,Button12,OBJPROP_XSIZE,160);
      ObjectSetInteger(0,Button12,OBJPROP_YSIZE,25);
      ObjectSetInteger(0,Button12,OBJPROP_BGCOLOR,ColorDeleteButton);
      ObjectSetInteger(0,Button12,OBJPROP_STATE,false);
      ObjectSetString(0,Button12,OBJPROP_FONT,"Tahoma");
      ObjectSetInteger(0,Button12,OBJPROP_FONTSIZE,10);
      ObjectSetInteger(0,Button12,OBJPROP_COLOR,ColorFontButton);
      ObjectSetInteger(0,Button12,OBJPROP_SELECTABLE,0);
      ObjectSetInteger(0,Button12,OBJPROP_HIDDEN,1);
      ObjectSetString(0,Button12,OBJPROP_TEXT,"Delete All on "+StringSubstr(Symbol(),0,6));
     }
//------------------------------------------------------
  }
//====================================================================================================================================================//
void LotSizeBox()
  {
//------------------------------------------------------
   if(ObjectFind(0,Box1)==-1)
     {
      ObjectCreate(0,Box1,OBJ_EDIT,0,0,0);
      ObjectSetInteger(0,Box1,OBJPROP_CORNER,0);
      ObjectSetInteger(0,Box1,OBJPROP_XDISTANCE,122);
      ObjectSetInteger(0,Box1,OBJPROP_YDISTANCE,43);
      ObjectSetInteger(0,Box1,OBJPROP_XSIZE,75);
      ObjectSetInteger(0,Box1,OBJPROP_YSIZE,15);
      ObjectSetInteger(0,Box1,OBJPROP_BGCOLOR,clrWhite);
      ObjectSetInteger(0,Box1,OBJPROP_BORDER_COLOR,clrGray);
      ObjectSetInteger(0,Box1,OBJPROP_BACK,false);
      ObjectSetInteger(0,Box1,OBJPROP_STATE,false);
      ObjectSetString(0,Box1,OBJPROP_FONT,"Arial Black");
      ObjectSetInteger(0,Box1,OBJPROP_FONTSIZE,10);
      ObjectSetInteger(0,Box1,OBJPROP_COLOR,ColorFontButton);
      ObjectSetInteger(0,Box1,OBJPROP_SELECTABLE,0);
      ObjectSetInteger(0,Box1,OBJPROP_HIDDEN,1);
      ObjectSetString(0,Box1,OBJPROP_TEXT,DoubleToString(OrderLotSize,2));
     }
//------------------------------------------------------
  }
//====================================================================================================================================================//
void DistanceBox()
  {
//------------------------------------------------------
   if(ObjectFind(0,Box2)==-1)
     {
      ObjectCreate(0,Box2,OBJ_EDIT,0,0,0);
      ObjectSetInteger(0,Box2,OBJPROP_CORNER,0);
      ObjectSetInteger(0,Box2,OBJPROP_XDISTANCE,122);
      ObjectSetInteger(0,Box2,OBJPROP_YDISTANCE,58);
      ObjectSetInteger(0,Box2,OBJPROP_XSIZE,75);
      ObjectSetInteger(0,Box2,OBJPROP_YSIZE,15);
      ObjectSetInteger(0,Box2,OBJPROP_BGCOLOR,clrWhite);
      ObjectSetInteger(0,Box2,OBJPROP_BORDER_COLOR,clrGray);
      ObjectSetInteger(0,Box2,OBJPROP_BACK,false);
      ObjectSetInteger(0,Box2,OBJPROP_STATE,false);
      ObjectSetString(0,Box2,OBJPROP_FONT,"Arial Black");
      ObjectSetInteger(0,Box2,OBJPROP_FONTSIZE,10);
      ObjectSetInteger(0,Box2,OBJPROP_COLOR,ColorFontButton);
      ObjectSetInteger(0,Box2,OBJPROP_SELECTABLE,0);
      ObjectSetInteger(0,Box2,OBJPROP_HIDDEN,1);
      ObjectSetString(0,Box2,OBJPROP_TEXT,DoubleToString(DistanceOrders,2));
     }
//------------------------------------------------------
  }
//====================================================================================================================================================//
void StopLossBox()
  {
//------------------------------------------------------
   if(ObjectFind(0,Box3)==-1)
     {
      ObjectCreate(0,Box3,OBJ_EDIT,0,0,0);
      ObjectSetInteger(0,Box3,OBJPROP_CORNER,0);
      ObjectSetInteger(0,Box3,OBJPROP_XDISTANCE,122);
      ObjectSetInteger(0,Box3,OBJPROP_YDISTANCE,73);
      ObjectSetInteger(0,Box3,OBJPROP_XSIZE,75);
      ObjectSetInteger(0,Box3,OBJPROP_YSIZE,15);
      ObjectSetInteger(0,Box3,OBJPROP_BGCOLOR,clrWhite);
      ObjectSetInteger(0,Box3,OBJPROP_BORDER_COLOR,clrGray);
      ObjectSetInteger(0,Box3,OBJPROP_BACK,false);
      ObjectSetInteger(0,Box3,OBJPROP_STATE,false);
      ObjectSetString(0,Box3,OBJPROP_FONT,"Arial Black");
      ObjectSetInteger(0,Box3,OBJPROP_FONTSIZE,10);
      ObjectSetInteger(0,Box3,OBJPROP_COLOR,ColorFontButton);
      ObjectSetInteger(0,Box3,OBJPROP_SELECTABLE,0);
      ObjectSetInteger(0,Box3,OBJPROP_HIDDEN,1);
      ObjectSetString(0,Box3,OBJPROP_TEXT,DoubleToString(StopLossPips,2));
     }
//------------------------------------------------------
  }
//====================================================================================================================================================//
void TakeProfitBox()
  {
//------------------------------------------------------
   if(ObjectFind(0,Box4)==-1)
     {
      ObjectCreate(0,Box4,OBJ_EDIT,0,0,0);
      ObjectSetInteger(0,Box4,OBJPROP_CORNER,0);
      ObjectSetInteger(0,Box4,OBJPROP_XDISTANCE,122);
      ObjectSetInteger(0,Box4,OBJPROP_YDISTANCE,88);
      ObjectSetInteger(0,Box4,OBJPROP_XSIZE,75);
      ObjectSetInteger(0,Box4,OBJPROP_YSIZE,15);
      ObjectSetInteger(0,Box4,OBJPROP_BGCOLOR,clrWhite);
      ObjectSetInteger(0,Box4,OBJPROP_BORDER_COLOR,clrGray);
      ObjectSetInteger(0,Box4,OBJPROP_BACK,false);
      ObjectSetInteger(0,Box4,OBJPROP_STATE,false);
      ObjectSetString(0,Box4,OBJPROP_FONT,"Arial Black");
      ObjectSetInteger(0,Box4,OBJPROP_FONTSIZE,10);
      ObjectSetInteger(0,Box4,OBJPROP_COLOR,ColorFontButton);
      ObjectSetInteger(0,Box4,OBJPROP_SELECTABLE,0);
      ObjectSetInteger(0,Box4,OBJPROP_HIDDEN,1);
      ObjectSetString(0,Box4,OBJPROP_TEXT,DoubleToString(TakeProfitPips,2));
     }
//------------------------------------------------------
  }
//====================================================================================================================================================//
void TrailingBox()
  {
//------------------------------------------------------
   if(ObjectFind(0,Box5)==-1)
     {
      ObjectCreate(0,Box5,OBJ_EDIT,0,0,0);
      ObjectSetInteger(0,Box5,OBJPROP_CORNER,0);
      ObjectSetInteger(0,Box5,OBJPROP_XDISTANCE,122);
      ObjectSetInteger(0,Box5,OBJPROP_YDISTANCE,103);
      ObjectSetInteger(0,Box5,OBJPROP_XSIZE,75);
      ObjectSetInteger(0,Box5,OBJPROP_YSIZE,15);
      ObjectSetInteger(0,Box5,OBJPROP_BGCOLOR,clrWhite);
      ObjectSetInteger(0,Box5,OBJPROP_BORDER_COLOR,clrGray);
      ObjectSetInteger(0,Box5,OBJPROP_BACK,false);
      ObjectSetInteger(0,Box5,OBJPROP_STATE,false);
      ObjectSetString(0,Box5,OBJPROP_FONT,"Arial Black");
      ObjectSetInteger(0,Box5,OBJPROP_FONTSIZE,10);
      ObjectSetInteger(0,Box5,OBJPROP_COLOR,ColorFontButton);
      ObjectSetInteger(0,Box5,OBJPROP_SELECTABLE,0);
      ObjectSetInteger(0,Box5,OBJPROP_HIDDEN,1);
      ObjectSetString(0,Box5,OBJPROP_TEXT,DoubleToString(TrailingStop,2));
     }
//------------------------------------------------------
  }
//====================================================================================================================================================//
void BreakEvenBox()
  {
//------------------------------------------------------
   if(ObjectFind(0,Box6)==-1)
     {
      ObjectCreate(0,Box6,OBJ_EDIT,0,0,0);
      ObjectSetInteger(0,Box6,OBJPROP_CORNER,0);
      ObjectSetInteger(0,Box6,OBJPROP_XDISTANCE,122);
      ObjectSetInteger(0,Box6,OBJPROP_YDISTANCE,118);
      ObjectSetInteger(0,Box6,OBJPROP_XSIZE,75);
      ObjectSetInteger(0,Box6,OBJPROP_YSIZE,15);
      ObjectSetInteger(0,Box6,OBJPROP_BGCOLOR,clrWhite);
      ObjectSetInteger(0,Box6,OBJPROP_BORDER_COLOR,clrGray);
      ObjectSetInteger(0,Box6,OBJPROP_BACK,false);
      ObjectSetInteger(0,Box6,OBJPROP_STATE,false);
      ObjectSetString(0,Box6,OBJPROP_FONT,"Arial Black");
      ObjectSetInteger(0,Box6,OBJPROP_FONTSIZE,10);
      ObjectSetInteger(0,Box6,OBJPROP_COLOR,ColorFontButton);
      ObjectSetInteger(0,Box6,OBJPROP_SELECTABLE,0);
      ObjectSetInteger(0,Box6,OBJPROP_HIDDEN,1);
      ObjectSetString(0,Box6,OBJPROP_TEXT,DoubleToString(BreakEvenPips,2));
     }
//------------------------------------------------------
  }
//====================================================================================================================================================//
void LiteOrdersPanel()
  {
//------------------------------------------------------
//Close buy on pair
   if(ObjectFind(0,Button13)==-1)
     {
      ObjectCreate(0,Button13,OBJ_BUTTON,0,0,0);
      ObjectSetInteger(0,Button13,OBJPROP_CORNER,2);
      ObjectSetInteger(0,Button13,OBJPROP_XDISTANCE,10);
      ObjectSetInteger(0,Button13,OBJPROP_YDISTANCE,240);
      ObjectSetInteger(0,Button13,OBJPROP_XSIZE,160);
      ObjectSetInteger(0,Button13,OBJPROP_YSIZE,25);
      ObjectSetInteger(0,Button13,OBJPROP_BGCOLOR,ColorCloseButton);
      ObjectSetInteger(0,Button13,OBJPROP_STATE,false);
      ObjectSetString(0,Button13,OBJPROP_FONT,"Tahoma");
      ObjectSetInteger(0,Button13,OBJPROP_FONTSIZE,10);
      ObjectSetInteger(0,Button13,OBJPROP_COLOR,ColorFontButton);
      ObjectSetInteger(0,Button13,OBJPROP_SELECTABLE,0);
      ObjectSetInteger(0,Button13,OBJPROP_HIDDEN,1);
      ObjectSetString(0,Button13,OBJPROP_TEXT,"Close Buy on "+StringSubstr(Symbol(),0,6));
     }
//------------------------------------------------------
//Close buy on account
   if(ObjectFind(0,Button14)==-1)
     {
      ObjectCreate(0,Button14,OBJ_BUTTON,0,0,0);
      ObjectSetInteger(0,Button14,OBJPROP_CORNER,2);
      ObjectSetInteger(0,Button14,OBJPROP_XDISTANCE,10);
      ObjectSetInteger(0,Button14,OBJPROP_YDISTANCE,210);
      ObjectSetInteger(0,Button14,OBJPROP_XSIZE,160);
      ObjectSetInteger(0,Button14,OBJPROP_YSIZE,25);
      ObjectSetInteger(0,Button14,OBJPROP_BGCOLOR,ColorCloseButton);
      ObjectSetInteger(0,Button14,OBJPROP_STATE,false);
      ObjectSetString(0,Button14,OBJPROP_FONT,"Tahoma");
      ObjectSetInteger(0,Button14,OBJPROP_FONTSIZE,10);
      ObjectSetInteger(0,Button14,OBJPROP_COLOR,ColorFontButton);
      ObjectSetInteger(0,Button14,OBJPROP_SELECTABLE,0);
      ObjectSetInteger(0,Button14,OBJPROP_HIDDEN,1);
      ObjectSetString(0,Button14,OBJPROP_TEXT,"Close Buy on All Pairs");
     }
//------------------------------------------------------
//Close sell on pair
   if(ObjectFind(0,Button15)==-1)
     {
      ObjectCreate(0,Button15,OBJ_BUTTON,0,0,0);
      ObjectSetInteger(0,Button15,OBJPROP_CORNER,2);
      ObjectSetInteger(0,Button15,OBJPROP_XDISTANCE,10);
      ObjectSetInteger(0,Button15,OBJPROP_YDISTANCE,180);
      ObjectSetInteger(0,Button15,OBJPROP_XSIZE,160);
      ObjectSetInteger(0,Button15,OBJPROP_YSIZE,25);
      ObjectSetInteger(0,Button15,OBJPROP_BGCOLOR,ColorCloseButton);
      ObjectSetInteger(0,Button15,OBJPROP_STATE,false);
      ObjectSetString(0,Button15,OBJPROP_FONT,"Tahoma");
      ObjectSetInteger(0,Button15,OBJPROP_FONTSIZE,10);
      ObjectSetInteger(0,Button15,OBJPROP_COLOR,ColorFontButton);
      ObjectSetInteger(0,Button15,OBJPROP_SELECTABLE,0);
      ObjectSetInteger(0,Button15,OBJPROP_HIDDEN,1);
      ObjectSetString(0,Button15,OBJPROP_TEXT,"Close Sell on "+StringSubstr(Symbol(),0,6));
     }
//------------------------------------------------------
//Close sell on account
   if(ObjectFind(0,Button16)==-1)
     {
      ObjectCreate(0,Button16,OBJ_BUTTON,0,0,0);
      ObjectSetInteger(0,Button16,OBJPROP_CORNER,2);
      ObjectSetInteger(0,Button16,OBJPROP_XDISTANCE,10);
      ObjectSetInteger(0,Button16,OBJPROP_YDISTANCE,150);
      ObjectSetInteger(0,Button16,OBJPROP_XSIZE,160);
      ObjectSetInteger(0,Button16,OBJPROP_YSIZE,25);
      ObjectSetInteger(0,Button16,OBJPROP_BGCOLOR,ColorCloseButton);
      ObjectSetInteger(0,Button16,OBJPROP_STATE,false);
      ObjectSetString(0,Button16,OBJPROP_FONT,"Tahoma");
      ObjectSetInteger(0,Button16,OBJPROP_FONTSIZE,10);
      ObjectSetInteger(0,Button16,OBJPROP_COLOR,ColorFontButton);
      ObjectSetInteger(0,Button16,OBJPROP_SELECTABLE,0);
      ObjectSetInteger(0,Button16,OBJPROP_HIDDEN,1);
      ObjectSetString(0,Button16,OBJPROP_TEXT,"Close Sell on All Pairs");
     }
//------------------------------------------------------
//Delete pending buy on pair
   if(ObjectFind(0,Button17)==-1)
     {
      ObjectCreate(0,Button17,OBJ_BUTTON,0,0,0);
      ObjectSetInteger(0,Button17,OBJPROP_CORNER,2);
      ObjectSetInteger(0,Button17,OBJPROP_XDISTANCE,10);
      ObjectSetInteger(0,Button17,OBJPROP_YDISTANCE,120);
      ObjectSetInteger(0,Button17,OBJPROP_XSIZE,160);
      ObjectSetInteger(0,Button17,OBJPROP_YSIZE,25);
      ObjectSetInteger(0,Button17,OBJPROP_BGCOLOR,ColorDeleteButton);
      ObjectSetInteger(0,Button17,OBJPROP_STATE,false);
      ObjectSetString(0,Button17,OBJPROP_FONT,"Tahoma");
      ObjectSetInteger(0,Button17,OBJPROP_FONTSIZE,10);
      ObjectSetInteger(0,Button17,OBJPROP_COLOR,ColorFontButton);
      ObjectSetInteger(0,Button17,OBJPROP_SELECTABLE,0);
      ObjectSetInteger(0,Button17,OBJPROP_HIDDEN,1);
      ObjectSetString(0,Button17,OBJPROP_TEXT,"Delete BuyStop on "+StringSubstr(Symbol(),0,6));
     }
//------------------------------------------------------
//Delete pending buy on account
   if(ObjectFind(0,Button18)==-1)
     {
      ObjectCreate(0,Button18,OBJ_BUTTON,0,0,0);
      ObjectSetInteger(0,Button18,OBJPROP_CORNER,2);
      ObjectSetInteger(0,Button18,OBJPROP_XDISTANCE,10);
      ObjectSetInteger(0,Button18,OBJPROP_YDISTANCE,90);
      ObjectSetInteger(0,Button18,OBJPROP_XSIZE,160);
      ObjectSetInteger(0,Button18,OBJPROP_YSIZE,25);
      ObjectSetInteger(0,Button18,OBJPROP_BGCOLOR,ColorDeleteButton);
      ObjectSetInteger(0,Button18,OBJPROP_STATE,false);
      ObjectSetString(0,Button18,OBJPROP_FONT,"Tahoma");
      ObjectSetInteger(0,Button18,OBJPROP_FONTSIZE,10);
      ObjectSetInteger(0,Button18,OBJPROP_COLOR,ColorFontButton);
      ObjectSetInteger(0,Button18,OBJPROP_SELECTABLE,0);
      ObjectSetInteger(0,Button18,OBJPROP_HIDDEN,1);
      ObjectSetString(0,Button18,OBJPROP_TEXT,"Delete BuyStop on All Pairs");
     }
//------------------------------------------------------
//Delete pending sell on pair
   if(ObjectFind(0,Button19)==-1)
     {
      ObjectCreate(0,Button19,OBJ_BUTTON,0,0,0);
      ObjectSetInteger(0,Button19,OBJPROP_CORNER,2);
      ObjectSetInteger(0,Button19,OBJPROP_XDISTANCE,10);
      ObjectSetInteger(0,Button19,OBJPROP_YDISTANCE,60);
      ObjectSetInteger(0,Button19,OBJPROP_XSIZE,160);
      ObjectSetInteger(0,Button19,OBJPROP_YSIZE,25);
      ObjectSetInteger(0,Button19,OBJPROP_BGCOLOR,ColorDeleteButton);
      ObjectSetInteger(0,Button19,OBJPROP_STATE,false);
      ObjectSetString(0,Button19,OBJPROP_FONT,"Tahoma");
      ObjectSetInteger(0,Button19,OBJPROP_FONTSIZE,10);
      ObjectSetInteger(0,Button19,OBJPROP_COLOR,ColorFontButton);
      ObjectSetInteger(0,Button19,OBJPROP_SELECTABLE,0);
      ObjectSetInteger(0,Button19,OBJPROP_HIDDEN,1);
      ObjectSetString(0,Button19,OBJPROP_TEXT,"Delete SellStop on "+StringSubstr(Symbol(),0,6));
     }
//------------------------------------------------------
//Delete pending sell on account
   if(ObjectFind(0,Button20)==-1)
     {
      ObjectCreate(0,Button20,OBJ_BUTTON,0,0,0);
      ObjectSetInteger(0,Button20,OBJPROP_CORNER,2);
      ObjectSetInteger(0,Button20,OBJPROP_XDISTANCE,10);
      ObjectSetInteger(0,Button20,OBJPROP_YDISTANCE,30);
      ObjectSetInteger(0,Button20,OBJPROP_XSIZE,160);
      ObjectSetInteger(0,Button20,OBJPROP_YSIZE,25);
      ObjectSetInteger(0,Button20,OBJPROP_BGCOLOR,ColorDeleteButton);
      ObjectSetInteger(0,Button20,OBJPROP_STATE,false);
      ObjectSetString(0,Button20,OBJPROP_FONT,"Tahoma");
      ObjectSetInteger(0,Button20,OBJPROP_FONTSIZE,10);
      ObjectSetInteger(0,Button20,OBJPROP_COLOR,ColorFontButton);
      ObjectSetInteger(0,Button20,OBJPROP_SELECTABLE,0);
      ObjectSetInteger(0,Button20,OBJPROP_HIDDEN,1);
      ObjectSetString(0,Button20,OBJPROP_TEXT,"Delete SellStop on All Pairs");
     }
//------------------------------------------------------
  }
//====================================================================================================================================================//
