//+------------------------------------------------------------------+
//|                                          ZeroLag Stochs_true.mq4 |
//|                      Copyright © 2004, MetaQuotes Software Corp. |
//|                                       http://www.metaquotes.net/ |
//+------------------------------------------------------------------+
#property copyright "Copyright © 2004, MetaQuotes Software Corp."
#property link      "http://www.metaquotes.net/"
//----
#property indicator_separate_window
#property indicator_buffers 4
#property indicator_color1  clrLimeGreen
#property indicator_color2  clrOrangeRed
#property indicator_color3  clrOrangeRed
#property indicator_color4  clrSilver
#property indicator_width1  1
#property indicator_width2  1
#property indicator_width3  1
#property indicator_level1  20
#property indicator_level2  80

//
//
//
//
//

enum enColorOn
{
   cc_slo, // Change color on slope change
   cc_sig  // Change color on signal cross
};

input int                 KPeriod         = 5; //21
input int                 DPeriod         = 3; //7
input int                 Slowing         = 3; //14
input enColorOn           ColorOn         = cc_slo;           // Color change on :  
input bool                alertsOn        = false;           // Turn alerts on?
input bool                alertsOnCurrent = false;          // Alerts on still opened bar?
input bool                alertsMessage   = false;           // Alerts should display message?
input bool                alertsSound     = false;          // Alerts should play a sound?
input bool                alertsNotify    = false;          // Alerts should send a notification?
input bool                alertsEmail     = false;          // Alerts should send an email?
input string              soundFile       = "alert2.wav";   // Sound file

//---- buffers
double sto[],stoda[],stodb[],sig[],wb1[],wb2[],wb3[],stoc[];

//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
{
   IndicatorBuffers(8);
   SetIndexBuffer(0,sto);   SetIndexStyle(0, DRAW_LINE); SetIndexLabel(0,"Zerolag Stoch");
   SetIndexBuffer(1,stoda); SetIndexStyle(1, DRAW_LINE); SetIndexLabel(0,"Zerolag Stoch");
   SetIndexBuffer(2,stodb); SetIndexStyle(2, DRAW_LINE); SetIndexLabel(0,"Zerolag Stoch");
   SetIndexBuffer(3,sig);   SetIndexStyle(3, DRAW_LINE); SetIndexLabel(1,"Signal");
   SetIndexBuffer(4,wb1);
   SetIndexBuffer(5,wb2);
   SetIndexBuffer(6,wb3);        
   SetIndexBuffer(7,stoc); 
   IndicatorShortName("ZeroLag Stoch(" + (string)KPeriod + "," + (string)DPeriod + "," + (string)Slowing + ")");
return(INIT_SUCCEEDED);
}
//+------------------------------------------------------------------+
//| Stochastic oscillator                                            |
//+------------------------------------------------------------------+

int  OnCalculate(const int rates_total,const int prev_calculated,const datetime &time[],
                const double &open[],
                const double &high[],
                const double &low[],
                const double &close[],
                const long &tick_volume[],
                const long &volume[],
                const int &spread[])
{
   int i,limit=fmin(rates_total-prev_calculated+1,rates_total-2); 
   if (stoc[limit]==-1) CleanPoint(limit,stoda,stodb);
   for (i=limit;i>=0; i--)
   { 
      double lo =  low[ArrayMinimum(low, KPeriod,i)];
      double hi = high[ArrayMaximum(high,KPeriod,i)];
             wb1[i] = (hi!=lo) ? 100*((close[i]-lo)/(hi-lo)) : 0;
   }
   for (i=limit;i>=0; i--) wb2[i] = iMAOnArray(wb1,0,Slowing,0,MODE_SMA,i);  
   for (i=limit;i>=0; i--)
   {
       double ema1   = iMAOnArray(wb2,0,Slowing,0,MODE_SMA, i);    
              sto[i] = wb2[i] + wb2[i] - ema1;         
   }
   for (i=limit;i>=0; i--) wb3[i] = iMAOnArray(sto,0,DPeriod,0,MODE_SMA,i);
   for (i=limit;i>=0; i--)
   {
       double ema2   = iMAOnArray(wb3,0,DPeriod,0,MODE_SMA,i);  
              sig[i] = wb3[i] + wb3[i] - ema2; 
              switch(ColorOn)
              {
                  case cc_sig: if (i<rates_total-1)  stoc[i] = (sto[i]>sig[i])   ? 1 : (sto[i]<sig[i])   ? -1 : stoc[i+1]; break;
                  default :    if (i<rates_total-1)  stoc[i] = (sto[i]>sto[i+1]) ? 1 : (sto[i]<sto[i+1]) ? -1 : stoc[i+1];
              }
              stoda[i] = stodb[i] = EMPTY_VALUE; if (stoc[i] == -1) PlotPoint(i,stoda,stodb,sto);           
   }
   if (alertsOn)
   {
      int whichBar = (alertsOnCurrent) ? 0 : 1;
      if (stoc[whichBar] != stoc[whichBar+1])
      if (stoc[whichBar] == 1)
            doAlert(" up");
      else  doAlert(" down");       
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

void CleanPoint(int i,double& first[],double& second[])
{
   if (i>=Bars-3) return;
   if ((second[i]  != EMPTY_VALUE) && (second[i+1] != EMPTY_VALUE))
        second[i+1] = EMPTY_VALUE;
   else
      if ((first[i] != EMPTY_VALUE) && (first[i+1] != EMPTY_VALUE) && (first[i+2] == EMPTY_VALUE))
          first[i+1] = EMPTY_VALUE;
}

void PlotPoint(int i,double& first[],double& second[],double& from[])
{
   if (i>=Bars-2) return;
   if (first[i+1] == EMPTY_VALUE)
      if (first[i+2] == EMPTY_VALUE) 
            { first[i]  = from[i]; first[i+1]  = from[i+1]; second[i] = EMPTY_VALUE; }
      else  { second[i] = from[i]; second[i+1] = from[i+1]; first[i]  = EMPTY_VALUE; }
   else     { first[i]  = from[i];                          second[i] = EMPTY_VALUE; }
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

          message = timeFrameToString(_Period)+" "+_Symbol+" at "+TimeToStr(TimeLocal(),TIME_SECONDS)+" ZeroLag Stoch "+doWhat;
             if (alertsMessage) Alert(message);
             if (alertsNotify)  SendNotification(message);
             if (alertsEmail)   SendMail(_Symbol+" ZeroLag Stoch ",message);
             if (alertsSound)   PlaySound(soundFile);
      }
}

//
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


