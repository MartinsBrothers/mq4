/*------------------------------------------------------------------+
 |                                             True Range Bands.mq4 |
 |                                                 Copyright © 2010 |
 |                                             basisforex@gmail.com |
 +------------------------------------------------------------------*/
#property copyright "Copyright © 2010, basisforex@gmail.com"
#property link      "basisforex@gmail.com"
//----
#property indicator_chart_window
#property indicator_buffers 3
#property indicator_color1 White
#property indicator_color2 Yellow
#property indicator_color3 Yellow
//----
extern ENUM_TIMEFRAMES TimeFrame   = PERIOD_CURRENT;   // Time frame
extern int             nPeriod     = 13;
extern double          Deviation   = 1.618;
extern int             MaShift     = 0;
input bool             Interpolate = true;             // Interpolate in mtf mode
//----
double MaBuffer[];
double MaTUp[];
double MaTDn[],count[];
string indicatorFileName;
#define _mtfCall(_buff,_ind) iCustom(NULL,TimeFrame,indicatorFileName,PERIOD_CURRENT,nPeriod,Deviation,0,_buff,_ind)
//+------------------------------------------------------------------+
int init()
 {
   IndicatorBuffers(4);
   SetIndexShift(0, MaShift);
   SetIndexShift(1, MaShift);
   SetIndexShift(2, MaShift);
//----
   SetIndexBuffer(0, MaBuffer);
   SetIndexBuffer(1, MaTUp);
   SetIndexBuffer(2, MaTDn);
   SetIndexBuffer(3, count);
//----
   SetIndexStyle(0, DRAW_LINE, STYLE_DOT);
   SetIndexStyle(1, DRAW_LINE);
   SetIndexStyle(2, DRAW_LINE);
//----
   SetIndexLabel(0, "MA");
   SetIndexLabel(1, "MaUp");
   SetIndexLabel(1, "MaDn");
   
   indicatorFileName = WindowExpertName();
   TimeFrame         = fmax(TimeFrame,_Period);
   
   for (int i=0; i<7; i++) SetIndexShift(i,MaShift*TimeFrame/Period());
//----
   return(0);
 }
//+------------------------------------------------------------------+
int start()
 {
   int i,counted_bars=IndicatorCounted();
      if(counted_bars<0) return(-1);
      if(counted_bars>0) counted_bars--;
         int limit = fmin(Bars-counted_bars,Bars-1); count[0] = limit;
         if (TimeFrame != _Period)
         {
            limit = (int)fmax(limit,fmin(Bars-1,_mtfCall(3,0)*TimeFrame/_Period));
            for (i=limit;i>=0 && !_StopFlag; i--)
            {
                  int y = iBarShift(NULL,TimeFrame,Time[i]);
                     MaBuffer[i] = _mtfCall(0,y);
   	               MaTUp[i]    = _mtfCall(1,y);
   	               MaTDn[i]    = _mtfCall(2,y);
                     
                     //
                     //
                     //
                     //
                     //
                     
                      if (!Interpolate || (i>0 && y==iBarShift(NULL,TimeFrame,Time[i-1]))) continue;
                      #define _interpolate(buff) buff[i+k] = buff[i]+(buff[i+n]-buff[i])*k/n
                      int n,k; datetime dtime = iTime(NULL,TimeFrame,y);
                         for(n = 1; (i+n)<Bars && Time[i+n] >= dtime; n++) continue;	
                         for(k = 1; k<n && (i+n)<Bars && (i+k)<Bars; k++)
                         {
                            _interpolate(MaBuffer);
                            _interpolate(MaTUp); 
                            _interpolate(MaTDn);
                         }               
            }
   return(0);
   }

   double a;
   for(i = 0; i < limit; i++)
    {
      for(int j = 0; j < nPeriod; j++)
       {
         a = a + (iHigh(NULL, 0, i + j) + iLow(NULL, 0, i + j) + iClose(NULL, 0, i + j) * 2) / 4;
       }       
      MaBuffer[i]  =  a / nPeriod;
      a = 0;
      if(iClose(NULL, 0, i) > MaBuffer[i])
       {
         MaTUp[i] = MaBuffer[i] + iATR(NULL, 0, nPeriod, i) * Deviation;
         MaTDn[i] = MaBuffer[i] - iATR(NULL, 0, nPeriod, i);
       }  
      else if(iClose(NULL, 0, i) < MaBuffer[i])
       {
         MaTDn[i] = MaBuffer[i] - iATR(NULL, 0, nPeriod, i) * Deviation;
         MaTUp[i] = MaBuffer[i] + iATR(NULL, 0, nPeriod, i);
       } 
      else if(iClose(NULL, 0, i) == MaBuffer[i])
       {
         MaTDn[i] = MaBuffer[i] - iATR(NULL, 0, nPeriod, i) * Deviation;
         MaTUp[i] = MaBuffer[i] + iATR(NULL, 0, nPeriod, i) * Deviation;
       }  
    }  
   //-----
   return(0);
 }
//+------------------------------------------------------------------+

//
//
//
//

string sTfTable[] = {"M1","M5","M15","M30","H1","H4","D1","W1","MN"};
int    iTfTable[] = {1,5,15,30,60,240,1440,10080,43200};

string timeFrameToString(int tf)
{
   for (int i=ArraySize(iTfTable)-1; i>=0; i--) 
         if (tf==iTfTable[i]) return(sTfTable[i]);
                              return("");
}


