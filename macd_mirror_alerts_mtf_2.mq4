
//+------------------------------------------------------------------+
//|                                                  MACD_Mirror.mq4 |
//|                           Copyright © 2010, Andy Tjatur Pramono. |
//|                                            andy.tjatur@gmail.com |
//+------------------------------------------------------------------+
#property  copyright "Copyright © 2014, Hoosain Harneker"

//---- indicator settings
#property indicator_separate_window
#property indicator_buffers    3
#property indicator_color1     Blue
#property indicator_color2     Red
#property indicator_color3     Black
#property indicator_width1     2
#property indicator_width2     2
#property indicator_width3     0
#property indicator_level1     0
#property indicator_levelcolor Yellow

//
//
//
//
//

extern ENUM_TIMEFRAMES TimeFrame       = PERIOD_CURRENT;  
extern int             PeriodeEMA      = 288;
extern int             SignalSMA       = 256;
extern bool            alertsOn        = true;
extern bool            alertsOnCurrent = false;
extern bool            alertsMessage   = true;
extern bool            alertsSound     = false;
extern bool            alertsNotify    = true;
extern bool            alertsEmail     = true;
extern string          soundFile       = "alert2.wav"; 

//
//
//
//
//

double     MacdBuffer[];
double     Macd2Buffer[];
double     SignalBuffer[];
double     trend[];

string indicatorFileName;
bool   returnBars;

//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int init()
  {
   IndicatorBuffers(4);
   SetIndexBuffer(0,MacdBuffer);
   SetIndexBuffer(1,Macd2Buffer);
   SetIndexBuffer(2,SignalBuffer);
   SetIndexBuffer(3,trend);
   indicatorFileName = WindowExpertName();
   returnBars        = TimeFrame == -99;
   TimeFrame         = MathMax(TimeFrame,_Period);
   IndicatorShortName(timeFrameToString(TimeFrame)+" NxGnScalper("+PeriodeEMA+","+SignalSMA+")");
   SetIndexLabel(0,"MACD");
   SetIndexLabel(1,"MACD2");
   SetIndexLabel(2,"Signal");
return(0);
}

//
//
//
//
//

int start()
{ 
   int counted_bars=IndicatorCounted();
      if(counted_bars<0) return(-1);
      if(counted_bars>0) counted_bars--;
           int limit=MathMin(Bars-counted_bars,Bars-1);
           if (returnBars) { MacdBuffer[0] = limit+1; return(0); }
   
            if (TimeFrame!=Period())
            {
               limit = MathMax(limit,MathMin(Bars-1,iCustom(NULL,TimeFrame,indicatorFileName,-99,0,0)*TimeFrame/Period()));
               for (int i=limit; i>=0; i--)
               {
                  int y = iBarShift(NULL,TimeFrame,Time[i]);              
                     MacdBuffer[i]   = iCustom(NULL,TimeFrame,indicatorFileName,PERIOD_CURRENT,PeriodeEMA,SignalSMA,alertsOn,alertsOnCurrent,alertsMessage,alertsSound,alertsNotify,alertsEmail,soundFile,0,y);
                     Macd2Buffer[i]  = iCustom(NULL,TimeFrame,indicatorFileName,PERIOD_CURRENT,PeriodeEMA,SignalSMA,alertsOn,alertsOnCurrent,alertsMessage,alertsSound,alertsNotify,alertsEmail,soundFile,1,y);
                     SignalBuffer[i] = iCustom(NULL,TimeFrame,indicatorFileName,PERIOD_CURRENT,PeriodeEMA,SignalSMA,alertsOn,alertsOnCurrent,alertsMessage,alertsSound,alertsNotify,alertsEmail,soundFile,2,y);
               }
               return(0);
            }
   
   //
   //
   //
   //
   //
   
   for(i=limit; i>=0; i--) MacdBuffer[i]  = iMA(NULL,0,PeriodeEMA,0,MODE_EMA,PRICE_CLOSE,i)-iMA(NULL,0,PeriodeEMA,0,MODE_EMA,PRICE_OPEN,i);
   for(i=limit; i>=0; i--) Macd2Buffer[i] = iMA(NULL,0,PeriodeEMA,0,MODE_EMA,PRICE_OPEN,i) -iMA(NULL,0,PeriodeEMA,0,MODE_EMA,PRICE_CLOSE,i);      
   for(i=limit; i>=0; i--)
   {
      SignalBuffer[i] = iMAOnArray(MacdBuffer,0,SignalSMA,0,MODE_SMA,i);
      trend[i] = trend[i+1];
      if (MacdBuffer[i]>Macd2Buffer[i]) trend[i] = 1;
      if (MacdBuffer[i]<Macd2Buffer[i]) trend[i] =-1;
   }
   
   //
   //
   //
   //
   //
   
   if (alertsOn)
   {
     if (alertsOnCurrent)
          int whichBar = 0;
     else     whichBar = 1; whichBar = iBarShift(NULL,0,iTime(NULL,TimeFrame,whichBar)); 
     if (trend[whichBar] != trend[whichBar+1])
     if (trend[whichBar] == 1)
           doAlert("up");
     else  doAlert("down");        
   }
return(0);
}

//-------------------------------------------------------------------
//
//-------------------------------------------------------------------
//
//
//
//
//

string sTfTable[] = {"M1","M5","M15","M30","H1","H4","D1","W1","MN"};
int    iTfTable[] = {1,5,15,30,60,240,1440,10080,43200};

//
//
//
//
//

int stringToTimeFrame(string tfs)
{
   tfs = stringUpperCase(tfs);
   for (int i=ArraySize(iTfTable)-1; i>=0; i--)
         if (tfs==sTfTable[i] || tfs==""+iTfTable[i]) return(MathMax(iTfTable[i],Period()));
                                                      return(Period());
}
string timeFrameToString(int tf)
{
   for (int i=ArraySize(iTfTable)-1; i>=0; i--) 
         if (tf==iTfTable[i]) return(sTfTable[i]);
                              return("");
}

//
//
//
//
//

string stringUpperCase(string str)
{
   string   s = str;

   for (int length=StringLen(str)-1; length>=0; length--)
   {
      int tchar = StringGetChar(s, length);
         if((tchar > 96 && tchar < 123) || (tchar > 223 && tchar < 256))
                     s = StringSetChar(s, length, tchar - 32);
         else if(tchar > -33 && tchar < 0)
                     s = StringSetChar(s, length, tchar + 224);
   }
   return(s);
}

//------------------------------------------------------------------
//
//------------------------------------------------------------------
//
//
//
//
//

void doAlert(string doWhat)
{
   static string   previousAlert="nothing";
   static datetime previousTime;
   string message;
   
      if (previousAlert != doWhat || previousTime != Time[0]) {
          previousAlert  = doWhat;
          previousTime   = Time[0];

          //
          //
          //
          //
          //

          message =  StringConcatenate(timeFrameToString(TimeFrame)," ",Symbol()," at ",TimeToStr(TimeLocal(),TIME_SECONDS)," MACD_Mirror trend changed to ",doWhat);
             if (alertsMessage) Alert(message);
             if (alertsNotify)  SendNotification(message);
             if (alertsEmail)   SendMail(StringConcatenate(Symbol()," MACD_Mirror "),message);
             if (alertsSound)   PlaySound(soundFile);
      }
}
