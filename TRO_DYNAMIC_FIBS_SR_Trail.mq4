//+------------------------------------------------------------------+ 
//|   TRO_DYNAMIC_FIBS_SR_Trail                                      | 
//|                                                                  | 
//|   Copyright © 2009, Avery T. Horton, Jr. aka TheRumpledOne       |
//|                                                                  |
//|   PO BOX 43575, TUCSON, AZ 85733                                 |
//|                                                                  |
//|   GIFTS AND DONATIONS ACCEPTED                                   | 
//|   All my indicators should be considered donationware. That is   |
//|   you are free to use them for your personal use, and are        |
//|   under no obligation to pay for them. However, if you do find   |
//|   this or any of my other indicators help you with your trading  |
//|   then any Gift or Donation as a show of appreciation is         |
//|   gratefully accepted.                                           |
//|                                                                  |
//|   Gifts or Donations also keep me motivated in producing more    |
//|   great free indicators. :-)                                     |
//|                                                                  |
//|   PayPal - THERUMPLEDONE@GMAIL.COM                               |  
//+------------------------------------------------------------------+ 
//| Use http://therumpledone.mbtrading.com/fx/ as your forex broker  |  
//| ...tell them therumpledone sent you!                             |  
//+------------------------------------------------------------------+ 
#property  copyright "Copyright © 2009, Avery T. Horton, Jr. aka TRO" 
#property  link      "http://www.therumpledone.com/" 

#property indicator_chart_window 
#property indicator_buffers 5 
#property indicator_color1 Red 
#property indicator_color2 Blue 
#property indicator_color3 Indigo
#property indicator_color4 Magenta 
#property indicator_color5 Orange
 
//---- input parameters 

extern bool   TrainingWheels  = true ;
extern bool   IdiotMode       = false ;
extern int    myIdiotFontSize = 50 ;

extern bool   Show_Legend  = true ;
extern bool   Show_Gauge   = true ;
extern bool   Show_Target  = true ;

extern int myChartX   = 10 ;
extern int myChartY   = 80 ;  
 
extern int    myCorner   = 1 ;
extern string myFont     = "Courier New" ;
extern int    myFontSize = 12 ;

extern bool Sound_Alert         = false ;
extern bool Trigger_Lines       = false ;

extern bool Plot_Triggers       = true; 
extern bool bDrawBoxes          = true;
extern bool bResetOnNewDay      = false; 

extern int  max_bars        = 300; 
extern int  iPeriods        = 5; 
extern int  iThreshold      = 0; 
extern int  iPipsTrigger    = 5;
extern int  iBreakOutPips   = 20;

extern color colorHead    = SteelBlue ;
extern color iColorRes    = Red ;
extern color iColorSup    = Blue ;
extern color iColorBuy    = Indigo ;
extern color iColorShort  = Magenta ;
extern color colorUp      = Green ;
extern color colorEq      = Gold ;
extern color colorDn      = Red ;




extern int   iAlertLineStyle  = STYLE_DOT ;
extern int   myBoxWidth       = 3;
extern int   myWingDing       = 119 ;

//---- input parameters for regular doji

extern int       MinLengthOfUpTail=3;
extern int       MinLengthOfLoTail=3;

//---- input parameters for dragonfly doji

extern int       MaxLengthOfUpTail1=0;
extern int       MinLengthOfLoTail1=3;

//---- input parameters for gravestone doji

extern int       MinLengthOfUpTail2=3;
extern int       MaxLengthOfLoTail2=0;


//---- buffers 
double DynR[]; 
double DynS[]; 
double LgTrig[]; 
double ShTrig[]; 
double BOTarget[]; 
 
double xLgTrig; 
double xShTrig; 
 
string tTrigger = "TRigger" ;
string tRes0 = "Res_0" ;
string tSup0 = "Sup_0" ;
string tLgTrig = "LgTrig_0" ;
string tShTrig = "ShTrig_0" ;
 
string tAlertBuy   = "Buy_sr"  ; 
string tAlertShort = "Short_sr"; 

datetime Trigger ;

double    iAlertBuy, iAlertShort, xThreshold ; 
  
 

string symbol, tChartPeriod, shortName, ShortName ;  

int    digits2, digits, period, win ; 

string lbl[15], lbl2[15];

string TAG = "dfsr" ;
string   ObjG001,ObjG002,ObjG003,ObjG004,ObjG005,ObjG006,ObjG007,ObjG008,ObjG009 ;  

int FillAmt = 11 , x001, x002, x003, x004, x005, x006, x007 ;  
int n, j, h, l ;

double close, open, diff, value, point ;
color pColor = Blue, colorTradeInfo = Blue, ColorH1Bias = Blue , ColorD1Bias = Blue ,ColorBias = Blue; 

bool GreenCandle,RedCandle, OKtoShort, OKtoLong, HorizontalRes, HorizontalSup, BreakOutRes, BreakOutSup ;
 
double  PipsTrigger    = 5, BreakOutTarget, BreakOutPips , BodySize, WickSize, TailSize, Top, Bottom, D1Diff, H1Diff;

string mTradeInfo, H1Bias, D1Bias  ;



string ArrowHeadRt =  "Ш" ; // 216 up arrow head
string ArrowHeadUp =  "Щ" ; // 217 up arrow head
string ArrowHeadDn =  "Ъ" ; // 218 up arrow head 
 

string ArrowN  = "с"; // NORTH
string ArrowNE = "ц";  // NORTHEAST
string ArrowE  = "р";  // EAST
string ArrowSE = "ш";  // SOUTHEAST
string ArrowS  = "т";  // SOUTH
 
string theArrow, D1Arrow, H1Arrow ; 
color  colorArrow ; 

bool StrongLWP , WeakLWP ;
string tLWP, tValue, tDoji, tIdiotMsg ;
color  colorLWP ;

double H=0.0, L=0.0, C=0.0, O=0.0;

//+------------------------------------------------------------------+ 
int init() 
  { 
//---- indicators 

   SetIndexStyle(0,DRAW_ARROW); 
   SetIndexArrow(0,myWingDing); 
   SetIndexBuffer(0,DynR); 
   SetIndexEmptyValue(0,0.0); 
   
   SetIndexStyle(1,DRAW_ARROW); 
   SetIndexArrow(1,myWingDing); 
   SetIndexBuffer(1,DynS); 
   SetIndexEmptyValue(1,0.0); 
   
   SetIndexStyle(2,DRAW_ARROW); 
   SetIndexArrow(2,myWingDing); 
   SetIndexBuffer(2,LgTrig); 
   SetIndexEmptyValue(2,0.0); 
   
   SetIndexStyle(3,DRAW_ARROW); 
   SetIndexArrow(3,myWingDing); 
   SetIndexBuffer(3,ShTrig); 
   SetIndexEmptyValue(3,0.0); 
 
   SetIndexStyle(4,DRAW_ARROW); 
   SetIndexArrow(4,myWingDing); 
   SetIndexBuffer(4,BOTarget); 
   SetIndexEmptyValue(4,0.0); 
      
   
   period = Period();  
   tChartPeriod =  TimeFrameToString(period) ;
   symbol       =  Symbol() ;   
   digits       =  Digits ;   
   Trigger      =  Time[0] ;  
   point        =  Point ;
   
   if(digits == 5 || digits == 3) { digits = digits - 1 ; point = point * 10 ; }  

   xThreshold  = iThreshold * point ;

   PipsTrigger = iPipsTrigger * point ;
   
   ShortName    =  TAG+symbol+iPeriods ;


if( myCorner == 0 || myCorner == 2 )
{  
   x001 = 0 ;
   x002 = 0 ;
   x003 = 90 ; 
   x004 = 150;
   x005 = 100 ;
   x006 = 10 ;  
   x007 = 0 ;
   FillAmt = 20 ;     
}
else
{
   x001 = 0 ;
   x002 = 10 ; //  
   x003 = 60 ;  // val  
   x004 = 0 ; //  dif
   x005 = 0 ;
   x006 = 10 ;  
   x007 = 220 ;  // arrow
   FillAmt = 23 ; 
}

   BreakOutPips = iBreakOutPips * point ;
     
   deinit() ;
  
   return(0); 
  } 

//+------------------------------------------------------------------+

void ObDeleteObjectsByPrefix(string Prefix)
  {
   int L = StringLen(Prefix);
   int i = 0; 
   while(i < ObjectsTotal())
     {
       string ObjName = ObjectName(i);
       if(StringSubstr(ObjName, 0, L) != Prefix) 
         { 
           i++; 
           continue;
         }
       ObjectDelete(ObjName);
     }
  }
    
//+------------------------------------------------------------------+
int deinit()
  {
   ObjectDelete(tTrigger); 
   ObjectDelete(tRes0); 
   ObjectDelete(tSup0); 
   ObjectDelete(tLgTrig);    
   ObjectDelete(tShTrig);
   ObjectDelete(tAlertBuy); 
   ObjectDelete(tAlertShort); 
        
   ObDeleteObjectsByPrefix(TAG);  
   
      TRO() ;
      
   return(0);
  }
    
 
//+------------------------------------------------------------------+ 
int start() 
  { 
   int    counted_bars=IndicatorCounted(); 
    if(counted_bars < 0) 
        return(-1); 
//---- 
   int limit=Bars-counted_bars; 
    
   DynR[0] = Close[0]; 
   DynS[0] = Close[0]; 

   double nHH, nLL; 
   double range; 

   int processBars=MathMin(limit, max_bars); 
   for(int i=processBars;i>=0;i--){ 
      if ((Period() < PERIOD_D1) && //if timeframe below day 
         (TimeDay(Time[i])!=TimeDay(Time[i+1])) && // new day 
         (bResetOnNewDay)) { // reset if different day 
         DynR[i] = High[i]; 
         DynS[i]= Low[i]; 
      } //end if 
      else 
      { 
      
         h   = Highest(NULL,0,MODE_HIGH,iPeriods,i) ;
         l   = Lowest(NULL,0,MODE_LOW,iPeriods,i) ;
         nHH = High[h]; 
         nLL = Low[l]; 

         DynR[i] =   nHH; 
         DynS[i] =   nLL; 
         if(Plot_Triggers) {LgTrig[i]  = Low[l] + PipsTrigger; ShTrig[i]  = High[h] - PipsTrigger; }
         
         if ((DynR[i] != High[i]) && (DynR[i] < DynR[i+1]) &&  ( DynR[i+1] != 0 ))     
         {   
            DynR[i] = DynR[i+1]; 
            if(Plot_Triggers) { ShTrig[i]  = ShTrig[i+1]; }
         }
         if (( DynS[i] != Low[i]) && (DynS[i] > DynS[i+1] ) && ( DynS[i+1] != 0 )) 
         {   
            DynS[i] = DynS[i+1]; 
            if(Plot_Triggers) { LgTrig[i]  = LgTrig[i+1]; }
         }
      } 

   
   } //end for 



iAlertBuy    = LgTrig[0] + xThreshold   ;
iAlertBuy    = NormalizeDouble( iAlertBuy , digits ) ; 
 
iAlertShort  = ShTrig[0] - xThreshold   ; 
iAlertShort  = NormalizeDouble( iAlertShort , digits ) ; 



GreenCandle  = Close[0] > Open[0] ;
RedCandle    = Open [0] > Close[0] ;


Top      = MathMax( Close[0], Open[0] ) ;
Bottom   = MathMin( Close[0], Open[0] ) ;

BodySize =  Top - Bottom ;

WickSize = High[0] - Top ;
TailSize = Bottom - Low[0] ;

/*
StrongLWP = false ;
WeakLWP   = false ;

tLWP = "";
*/


if( DynS[0] == Low[0] )
{
   tLWP      = "";
   StrongLWP = TailSize > BodySize && GreenCandle;
   WeakLWP   = TailSize > BodySize && RedCandle ;
}
 
if( DynR[0] == High[0] )
{
   tLWP      = "";
   StrongLWP = TailSize > BodySize && RedCandle ;
   WeakLWP   = TailSize > BodySize && GreenCandle;
}

if( StrongLWP ) { tLWP = "Strong LWP"; colorLWP = colorUp ; } else
if( WeakLWP   ) { tLWP = "Weak LWP  "; colorLWP = colorDn ; }

 

if( Trigger_Lines ) 
{

      ObjectDelete(tAlertBuy);
      ObjectCreate(tAlertBuy,OBJ_HLINE,0,0,0);
      ObjectSet(tAlertBuy,OBJPROP_COLOR,iColorBuy);
      ObjectSet(tAlertBuy,OBJPROP_STYLE,iAlertLineStyle);
 
      ObjectDelete(tAlertShort);
      ObjectCreate(tAlertShort,OBJ_HLINE,0,0,0);
      ObjectSet(tAlertShort,OBJPROP_COLOR,iColorShort);
      ObjectSet(tAlertShort,OBJPROP_STYLE,iAlertLineStyle);
   
      ObjectMove(tAlertBuy,0,Time[0],iAlertBuy);
      ObjectMove(tAlertShort,0,Time[0],iAlertShort);
            
}

close   = iClose(symbol,1440,0) ;
open    = iOpen(symbol,1440,0) ;
D1Diff   = close - open ;
DoD1Color(close, open) ;     
     
close   = iClose(symbol,60,0) ;
open    = iOpen(symbol,60,0) ;
H1Diff   = close - open ;
DoH1Color(close, open) ;
     
      if(Show_Gauge) { DoShowGauge(); }
 
      if(Show_Legend) { DoShowLegend(); }

      if( bDrawBoxes )  { DoDrawBoxes(); }       


      if ( Trigger != Time[0] &&  Sound_Alert ) 
      {
        if( Ask >= iAlertBuy   && Low[0]  <= iAlertBuy   && GreenCandle ) 
            { Trigger = Time[0] ; Alert(symbol,"  ", tChartPeriod, "  ", DoubleToStr(iAlertBuy ,digits), " DYN SR Buy  " ); }
        if( Bid <= iAlertShort && High[0] >= iAlertShort && RedCandle )   
            { Trigger = Time[0] ; Alert(symbol,"  ", tChartPeriod, "  ", DoubleToStr(iAlertShort ,digits), " DYN SR Short "); }     
      }

         
//---- 

   WindowRedraw() ;
   
   return(0); 
  } 

//+------------------------------------------------------------------+


void DoDrawBoxes()   
{

  if (ObjectFind(tRes0) != 0)
      {
          ObjectCreate(tRes0,OBJ_ARROW,0,Time[0],DynR[0]);
          ObjectSet(tRes0,OBJPROP_ARROWCODE,SYMBOL_RIGHTPRICE);
          ObjectSet(tRes0,OBJPROP_COLOR,Red);  
          ObjectSet(tRes0,OBJPROP_WIDTH,myBoxWidth);             
      } 
      else
      {
         ObjectMove(tRes0,0,Time[0],DynR[0]);
      }

  if (ObjectFind(tSup0) != 0)
      {
          ObjectCreate(tSup0,OBJ_ARROW,0,Time[0],DynS[0]);
          ObjectSet(tSup0,OBJPROP_ARROWCODE,SYMBOL_RIGHTPRICE);
          ObjectSet(tSup0,OBJPROP_COLOR,Blue);  
          ObjectSet(tSup0,OBJPROP_WIDTH,myBoxWidth);           
      } 
      else
      {
         ObjectMove(tSup0,0,Time[0],DynS[0]);
      }
      
      

   ObjectDelete(tLgTrig);    
   
  if (ObjectFind(tLgTrig) != 0)
      {
          ObjectCreate(tLgTrig,OBJ_ARROW,0,Time[0],iAlertBuy);
          ObjectSet(tLgTrig,OBJPROP_ARROWCODE,SYMBOL_RIGHTPRICE);
          ObjectSet(tLgTrig,OBJPROP_COLOR,iColorBuy); 
          ObjectSet(tLgTrig,OBJPROP_WIDTH,myBoxWidth);             
      } 
      else
      {
         ObjectMove(tLgTrig,0,Time[0],iAlertBuy);
      }
      
  if (ObjectFind(tShTrig) != 0)
      {
          ObjectCreate(tShTrig,OBJ_ARROW,0,Time[0],iAlertShort);
          ObjectSet(tShTrig,OBJPROP_ARROWCODE,SYMBOL_RIGHTPRICE);
          ObjectSet(tShTrig,OBJPROP_COLOR,iColorShort);  
          ObjectSet(tShTrig,OBJPROP_WIDTH,myBoxWidth);            
      } 
      else
      {
         ObjectMove(tShTrig,0,Time[0],iAlertShort);
      }     
 
   ObjectDelete(tTrigger);  
     
  if (ObjectFind(tTrigger) != 0)
      {
          ObjectCreate(tTrigger,OBJ_ARROW,0,Time[0],BOTarget[0]);
          ObjectSet(tTrigger,OBJPROP_ARROWCODE,SYMBOL_RIGHTPRICE);
          ObjectSet(tTrigger,OBJPROP_COLOR,Orange);  
          ObjectSet(tTrigger,OBJPROP_WIDTH,myBoxWidth);             
      } 
      else
      {
         ObjectMove(tTrigger,0,Time[0],BOTarget[0]);
      }  

} 

//+------------------------------------------------------------------+


void DoShowGauge()
{
n       = 10;
j       = 0 ;

close   = iClose(symbol,period,0) ;
open    = iOpen(symbol,period,0) ;
diff    = close - open ;

tValue  = tChartPeriod + " DFSR(" + iPeriods + ")"  ;



lbl[j]  = ShortName+j;
lbl2[j] = fFill(tValue  , FillAmt) ;
DoShow(j, colorHead);


j       = j + 1;
lbl[j]  = ShortName+j;
value   = DynR[0] ;
diff    = (close - value) / point ;
DoColor(diff, 0) ;
lbl2[j] = fFill("Dyn Res "  , FillAmt) ;
DoShow(j, pColor);


j       = j + 1;
lbl[j]  = ShortName+j;
value   = DynS[0] ;
diff    = (close - value) / point ;
DoColor(diff, 0) ;
lbl2[j] = fFill("Dyn Sup "  , FillAmt) ;
DoShow(j, pColor);



j       = j + 1;
lbl[j]  = ShortName+j;
value   = (DynR[0] - DynS[0]) / point  ;
diff    = 100 * ( close - DynS[0]) /  (DynR[0] - DynS[0]) ;
DoColor(diff, 50) ;
lbl2[j] = fFill("Range| %"  , FillAmt) ;
DoShow(j, pColor);


j       = j + 1;
lbl[j]  = ShortName+j;
lbl2[j] = fFill("  H1 Bias: " + H1Bias , FillAmt) ;
theArrow = H1Arrow ;
DoShowTrade(j, ColorH1Bias);


j       = j + 1;
lbl[j]  = ShortName+j;
lbl2[j] = fFill("  D1 Bias: " + D1Bias , FillAmt) ;
theArrow = D1Arrow ;
DoShowTrade(j, ColorD1Bias);



j       = j + 1;
DoTrade();
lbl[j]  = ShortName+j;
lbl2[j] = mTradeInfo ;
DoShowTrade(j, colorTradeInfo);


j       = j + 1;
lbl[j]  = ShortName+j;
lbl2[j] = fFill(tLWP, FillAmt) ;
DoShowHead(j, colorLWP);


   j       = j + 1;
   DoDoji() ;
   lbl[j]  = ShortName+j;
   lbl2[j] = fFill(tDoji, FillAmt) ;
   DoShowHead(j, colorHead);
 

if(TrainingWheels) 
{
   tValue = "Training Wheels ON" ; 
   j       = j + 1;
   lbl[j]  = ShortName+j;
   lbl2[j] = fFill(tValue, FillAmt) ;
   DoShowHead(j, colorHead);

} // if

 
   tValue = tIdiotMsg ; 
   j       = j + 1;
   lbl[j]  = ShortName+j;
   lbl2[j] = fFill(tValue, FillAmt) ;
   DoShowHead(j, Red );

 

} // void


//+------------------------------------------------------------------+

void DoShow( int u, color dsColor )
{

ObjectCreate(lbl[u],23,0,Time[0],PRICE_CLOSE);
ObjectSet(lbl[u], OBJPROP_CORNER, myCorner );
ObjectSet(lbl[u],OBJPROP_XDISTANCE, x002+myChartX);
ObjectSet(lbl[u],OBJPROP_YDISTANCE,n+myChartY);
ObjectSetText(lbl[u],lbl2[u],myFontSize,myFont,dsColor);

if(u > 0)
{
string Obj001 = lbl[u] + "val" ;
string sVal = fFill(DoubleToStr(value,digits), 7)    ;
ObjectCreate(Obj001,23,0,Time[0],PRICE_CLOSE);
ObjectSet(Obj001, OBJPROP_CORNER, myCorner );
ObjectSet(Obj001,OBJPROP_XDISTANCE, x003+myChartX);
ObjectSet(Obj001,OBJPROP_YDISTANCE,n+myChartY);
ObjectSetText(Obj001,sVal,myFontSize,myFont,dsColor);


string Obj002 = lbl[u] + "dif" ;
string sDif =  rtadjust( DoubleToStr(diff,0) ) ;
ObjectCreate(Obj002,23,0,Time[0],PRICE_CLOSE);
ObjectSet(Obj002, OBJPROP_CORNER, myCorner );
ObjectSet(Obj002,OBJPROP_XDISTANCE, x004+myChartX);
ObjectSet(Obj002,OBJPROP_YDISTANCE,n+myChartY);
ObjectSetText(Obj002,sDif,myFontSize,myFont,dsColor);
}

n = n+20;

return(0);
}

//+------------------------------------------------------------------+

void DoShowTrade(int u, color dstColor )
{

string     Lname = lbl[u]+"arrow" ;
   ObjectDelete(Lname);
   ObjectCreate(Lname, 23,0,Time[0],PRICE_CLOSE);
   ObjectSetText(Lname, theArrow, 12, "WingDings", dstColor );
   ObjectSet(Lname, OBJPROP_CORNER, myCorner);
   ObjectSet(Lname, OBJPROP_XDISTANCE, x007+myChartX );
   ObjectSet(Lname, OBJPROP_YDISTANCE, n+myChartY);   


ObjectCreate(lbl[u],23,0,Time[0],PRICE_CLOSE);
ObjectSet(lbl[u], OBJPROP_CORNER, myCorner );
ObjectSet(lbl[u],OBJPROP_XDISTANCE, x006+myChartX);
ObjectSet(lbl[u],OBJPROP_YDISTANCE,n+myChartY);
ObjectSetText(lbl[u],lbl2[u],myFontSize,myFont,dstColor);


n = n+20;

}

//+------------------------------------------------------------------+

void DoShowHead(int u, color dstColor )
{

ObjectCreate(lbl[u],23,0,Time[0],PRICE_CLOSE);
ObjectSet(lbl[u], OBJPROP_CORNER, myCorner );
ObjectSet(lbl[u],OBJPROP_XDISTANCE, x002+myChartX);
ObjectSet(lbl[u],OBJPROP_YDISTANCE,n+myChartY);
ObjectSetText(lbl[u],lbl2[u],myFontSize,myFont,dstColor);


n = n+20;

}
//+------------------------------------------------------------------+
  
void DoTrade()
{

HorizontalRes = DynR[0] == DynR[1] ;
HorizontalSup = DynS[0] == DynS[1] ;

BreakOutRes   = DynR[0] > DynR[1] ;
BreakOutSup   = DynS[0] < DynS[1] ;

if(TrainingWheels)
{
   if(HorizontalSup && H1Diff >= 0) {OKtoLong  = !BreakOutSup && HorizontalSup && Ask <= LgTrig[0] && ShTrig[0] > LgTrig[0] ;}
   if(HorizontalRes && H1Diff <  0) {OKtoShort = !BreakOutRes && HorizontalRes && Bid >= ShTrig[0] && ShTrig[0] > LgTrig[0] ;}   
}
else
{
   OKtoShort     = !BreakOutRes && HorizontalRes && Bid >= ShTrig[0] && ShTrig[0] > LgTrig[0] ;
   OKtoLong      = !BreakOutSup && HorizontalSup && Ask <= LgTrig[0] && ShTrig[0] > LgTrig[0] ;
}


while(true)
{
   if(OKtoShort)   { theArrow = ArrowSE ; colorTradeInfo = iColorShort ; mTradeInfo = "  OK to Short"         ; BreakOutTarget = 0 ; break ; }
   if(OKtoLong )   { theArrow = ArrowNE ; colorTradeInfo = iColorBuy   ; mTradeInfo = "  OK to Buy  "         ; BreakOutTarget = 0 ; break ; } 
   if(BreakOutRes) { theArrow = ArrowN  ; colorTradeInfo = colorUp     ; mTradeInfo = "  Resistance Breakout" ; BreakOutTarget = DynR[1] + BreakOutPips ; break ; } 
   if(BreakOutSup) { theArrow = ArrowS  ; colorTradeInfo = colorDn     ; mTradeInfo = "  Support Breakout   " ; BreakOutTarget = DynS[1] - BreakOutPips ;break ; }    
                     theArrow = ArrowE  ; colorTradeInfo = colorEq     ; mTradeInfo = "  Wait"                ; BreakOutTarget = BOTarget[1] ;
   break;
} // while


mTradeInfo = fFill(mTradeInfo, FillAmt) ;

BOTarget[0] = BreakOutTarget ;

if( BreakOutRes || BreakOutSup ) 
{  
   tIdiotMsg = "DO NOT REVERSE  " ;
}
else 
{
   tIdiotMsg = " ";  
}


if(IdiotMode && ( BreakOutRes || BreakOutSup) ) 
{   
   
   setObject(TAG+"IDIOT1",tIdiotMsg   ,100,200, Red, "Impact", myIdiotFontSize, -45 ); 
   setObject(TAG+"IDIOT2",CharToStr(78),150,10,Red,"Wingdings", 300);
}
else 
{
   ObDeleteObjectsByPrefix(TAG+"IDIOT");  
}


}

//+------------------------------------------------------------------+
  
void DoDoji(  )
{

H=High[0]; 
L=Low[0]; 
C=Close[0]; 
O=Open[0];

while(true)
{ 
if(H-C>=MinLengthOfUpTail*Point  && C-L>=MinLengthOfLoTail*Point  && C==O) { tDoji = "Doji" ; break ;}
if(H-C<=MaxLengthOfUpTail1*Point && C-L>=MinLengthOfLoTail1*Point && C==O) { tDoji = "DragonFly Doji" ; break ;}
if(H-C>=MinLengthOfUpTail2*Point && C-L<=MaxLengthOfLoTail2*Point && C==O) { tDoji = "Gravestone Doji" ; break ;}

tDoji = " " ; break ;

} // while
}

//+------------------------------------------------------------------+
  
void DoH1Color( double c1, double c2 )
{


if(c1 > c2 ) { H1Arrow = ArrowN  ; ColorH1Bias = colorUp ; H1Bias = "LONG" ; } else {
if(c1 < c2 ) { H1Arrow = ArrowS  ; ColorH1Bias = colorDn ; H1Bias = "SHORT" ; } 
        else { H1Arrow = ArrowE  ; ColorH1Bias = colorEq ; H1Bias = "FLAT" ;} } 

}  
  

//+------------------------------------------------------------------+
  
void DoD1Color( double c1, double c2 )
{


if(c1 > c2 ) { D1Arrow = ArrowN  ; ColorD1Bias = colorUp ; D1Bias = "LONG" ; } else {
if(c1 < c2 ) { D1Arrow = ArrowS  ; ColorD1Bias = colorDn ; D1Bias = "SHORT" ; } 
        else { D1Arrow = ArrowE  ; ColorD1Bias = colorEq ; D1Bias = "FLAT" ;} } 

}  
  


//+------------------------------------------------------------------+
  
void DoColor( double c1, double c2 )
{

if(c1 > c2 ) { pColor = colorUp ;  } else {
if(c1 < c2 ) { pColor = colorDn ;  } else { pColor = colorEq ; } } 

}  
   
//+------------------------------------------------------------------+

string TimeFrameToString(int tf)
{
   string tfs;
   switch(tf) {
      case PERIOD_M1:  tfs="M1"  ; break;
      case PERIOD_M5:  tfs="M5"  ; break;
      case PERIOD_M15: tfs="M15" ; break;
      case PERIOD_M30: tfs="M30" ; break;
      case PERIOD_H1:  tfs="H1"  ; break;
      case PERIOD_H4:  tfs="H4"  ; break;
      case PERIOD_D1:  tfs="D1"  ; break;
      case PERIOD_W1:  tfs="W1"  ; break;
      case PERIOD_MN1: tfs="MN";
   }
   return(tfs);
}

 


//+------------------------------------------------------------------+

string fFill(string filled, int f ) 
{
   string FILLED ;
   
   FILLED = StringSubstr(filled + "                                         ",0,f) ;
   
return(FILLED);
}



//+------------------------------------------------------------------+
string rtadjust( string rString )
{
 
 int sl = StringLen(rString) ;
 
 while(true)
 {
 
   if( sl == 5) { break ; } 
   if( sl == 4) { rString = " " + rString ; break ; }    
   if( sl == 3) { rString = "  " + rString ; break ; } 
   if( sl == 2) { rString = "   " + rString ; break ; } 
   if( sl == 1) { rString = "    " + rString ; break ; } 
    
   break ;
 }

return(rString) ;
}       

//+------------------------------------------------------------------+  
void DoShowLegend()
{ 
   setObject(TAG+"gz","SHORT TRIGGER " + DoubleToStr(ShTrig[0], digits) ,30,20,iColorShort); setObject(TAG+"gz1","l",10,21,iColorShort     ,"Wingdings");
     
   setObject(TAG+"gl","LONG TRIGGER  "+ DoubleToStr(LgTrig[0], digits)   ,30,33,iColorBuy); setObject(TAG+"gl1","l",11,34,iColorBuy     ,"Wingdings");

   setObject(TAG+"biH","H1 BIAS "+ H1Bias  ,30,46,ColorH1Bias); setObject(TAG+"biD1","l",11,46,ColorH1Bias,"Wingdings");
  
   setObject(TAG+"biD","D1 BIAS "+ D1Bias  ,30,59,ColorD1Bias); setObject(TAG+"biH1","l",11,59,ColorD1Bias,"Wingdings");
  
   setObject(TAG+"idiotmsg", tIdiotMsg  ,30,72,Red);  setObject(TAG+"idiotLeg",CharToStr(78),11,72,Red,"Wingdings");
      
}

//+------------------------------------------------------------------+  

void setObject(string labelName,string text,int x,int y,color theColor, string font = "Courier New",int size=10,int angle=0)
{
 
      
      if (ObjectFind(labelName) == -1)
          {
             ObjectCreate(labelName,OBJ_LABEL,0,0,0);
             ObjectSet(labelName,OBJPROP_CORNER,0);
             if (angle != 0)
                  ObjectSet(labelName,OBJPROP_ANGLE,angle);
          }               
       ObjectSet(labelName,OBJPROP_XDISTANCE,x);
       ObjectSet(labelName,OBJPROP_YDISTANCE,y);
       ObjectSetText(labelName,text,size,font,theColor);
}

//+------------------------------------------------------------------+
void TRO()
{   
   
   string tObjName03    = "TROTAG"  ;  
   ObjectCreate(tObjName03, OBJ_LABEL, 0, 0, 0);//HiLow LABEL
   ObjectSetText(tObjName03, CharToStr(78) , 12 ,  "Wingdings",  DimGray );
   ObjectSet(tObjName03, OBJPROP_CORNER, 3);
   ObjectSet(tObjName03, OBJPROP_XDISTANCE, 5 );
   ObjectSet(tObjName03, OBJPROP_YDISTANCE, 5 );  
}
//+--------- TRO MODIFICATION ---------------------------------------+   

/*


Comment(
" ",    "\n",
" ",    "\n",
" ",    "\n",
" ",    "\n",

"H1 close= ",    DoubleToStr(close ,digits) , "\n",
"H1 open= ",    DoubleToStr(open ,digits) , "\n",
"diff= ",    DoubleToStr(diff ,digits) , "\n",
" ",    "\n",
 


"") ; 


Alert(  DoubleToStr(iAlertShort ,digits), " DYN SR Short ");

Comment(


"High[0]= ",    DoubleToStr(High[0] ,digits) , "\n",
"iAlertShort= ",    DoubleToStr(iAlertShort ,digits) , "\n",
"Bid= ",    DoubleToStr(Bid ,digits) , "\n",
"Low[0]= ",    DoubleToStr(Low[0] ,digits) , "\n",
" ",    "\n",

"High[0]= ",    DoubleToStr(High[0] ,digits) , "\n",
"Ask= ",    DoubleToStr(Ask ,digits) , "\n",
"iAlertBuy= ",    DoubleToStr(iAlertBuy ,digits) , "\n",
"Low[0]= ",    DoubleToStr(Low[0] ,digits) , "\n",


"") ; 

*/