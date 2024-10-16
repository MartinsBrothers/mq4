//------------------------------------------------------------------
#property copyright   "copyright© mladen"
#property description "Laguerre PPO"
#property description "made by mladen"
#property description "for more visit www.forex-station.com"
#property link        "www.forex-station.com"
//------------------------------------------------------------------
#property indicator_separate_window
#property indicator_buffers 8
#property indicator_color1  clrSilver
#property indicator_color2  clrSilver
#property indicator_color3  clrGreen
#property indicator_color4  clrLimeGreen
#property indicator_color5  clrOrangeRed
#property indicator_color6  clrSandyBrown
#property indicator_color7  clrDarkGray
#property indicator_color8  clrDarkGray
#property strict

//
//
//
//
//

extern ENUM_TIMEFRAMES TimeFrame = PERIOD_CURRENT; // Time frame
extern int    LookBack        = 200;          // Look back period
extern double GammaFast       = 0.4;          // Fast Laguerre gamma value
extern double GammaSlow       = 0.8;          // Slow Laguerre gamma value 
extern ENUM_APPLIED_PRICE Price = PRICE_MEDIAN; // Price
extern double Percent1        = 80;           // Lower percent to use
extern double Percent2        = 90;           // Higher percent to use
extern bool   alertsOn        = false;        // Turn alerts on?
extern bool   alertsOnCurrent = true;         // Alerts on current (still opened) bar?
extern bool   alertsMessage   = true;         // Alerts should show pop-up message?
extern bool   alertsSound     = false;        // Alerts should play alert sound?
extern bool   alertsPushNotif = false;        // Alerts should send push notification?
extern bool   alertsEmail     = false;        // Alerts should send email?
extern int    barsWidth       = 2;            // Bars width for display
extern bool   Interpolate     = true;         // Interpolate data in multi time frame mode?

double pctRankT[],pctRankB[],histnu[],histnd[],histd[],histdd[],histu[],histuu[],ppoT[],ppoB[],stateu[],stated[];
string indicatorFileName;
bool   returnBars;

//------------------------------------------------------------------
//
//------------------------------------------------------------------
//
//
//
//
//

int init() 
{
   for (int i=0; i<indicator_buffers; i++) SetIndexStyle(i,DRAW_LINE);
   IndicatorBuffers(12);
   SetIndexBuffer(0,histnu);
   SetIndexBuffer(1,histnd);
   SetIndexBuffer(2,histu);
   SetIndexBuffer(3,histuu);
   SetIndexBuffer(4,histdd);
   SetIndexBuffer(5,histd);
   SetIndexBuffer(6,pctRankT);
   SetIndexBuffer(7,pctRankB);
   SetIndexBuffer(8,ppoT);
   SetIndexBuffer(9,ppoB);
   SetIndexBuffer(10,stateu);
   SetIndexBuffer(11,stated);
      for (int i=0; i<6; i++) SetIndexStyle(i,DRAW_HISTOGRAM,EMPTY,barsWidth);
      SetLevelValue(0, Percent1/100);
      SetLevelValue(1, Percent2/100);
      SetLevelValue(2,-Percent2/100);
      SetLevelValue(3,-Percent1/100);
         indicatorFileName = WindowExpertName();
         returnBars        = TimeFrame==-99;
         TimeFrame         = MathMax(TimeFrame,_Period);
      IndicatorShortName(timeFrameToString(TimeFrame)+" Laguerre PPO ("+(string)LookBack+","+(string)GammaFast+","+(string)GammaSlow+")");
   return (0);
}

//------------------------------------------------------------------
//
//------------------------------------------------------------------
//
//
//
//
//

int start()
{
   if (Bars<=2) return(0);
   int counted_bars=IndicatorCounted();
      if(counted_bars<0) return(-1);
      if(counted_bars>0) counted_bars--;
         int limit = MathMin(Bars-counted_bars,Bars-1);
         if (returnBars) { histnu[0] = limit+1; return(0); }
         if (TimeFrame != _Period)
         {
            limit = (int)MathMax(limit,MathMin(Bars-1,iCustom(NULL,TimeFrame,indicatorFileName,-99,0,0)*TimeFrame/_Period));
            for (int i=limit; i>=0; i--)   
            {
               int y = iBarShift(NULL,TimeFrame,Time[i]);
               pctRankT[i] = iCustom(NULL,TimeFrame,indicatorFileName,PERIOD_CURRENT,LookBack,GammaFast,GammaSlow,Price,Percent1,Percent2,alertsOn,alertsOnCurrent,alertsMessage,alertsSound,alertsPushNotif,alertsEmail, 6,y);
               pctRankB[i] = iCustom(NULL,TimeFrame,indicatorFileName,PERIOD_CURRENT,LookBack,GammaFast,GammaSlow,Price,Percent1,Percent2,alertsOn,alertsOnCurrent,alertsMessage,alertsSound,alertsPushNotif,alertsEmail, 7,y);
               stateu[i]   = iCustom(NULL,TimeFrame,indicatorFileName,PERIOD_CURRENT,LookBack,GammaFast,GammaSlow,Price,Percent1,Percent2,alertsOn,alertsOnCurrent,alertsMessage,alertsSound,alertsPushNotif,alertsEmail,10,y);
               stated[i]   = iCustom(NULL,TimeFrame,indicatorFileName,PERIOD_CURRENT,LookBack,GammaFast,GammaSlow,Price,Percent1,Percent2,alertsOn,alertsOnCurrent,alertsMessage,alertsSound,alertsPushNotif,alertsEmail,11,y);
               histnd[i]   = EMPTY_VALUE;
               histnu[i]   = EMPTY_VALUE;
               histu[i]    = EMPTY_VALUE;
               histd[i]    = EMPTY_VALUE;
               histuu[i]   = EMPTY_VALUE;
               histdd[i]   = EMPTY_VALUE;
               if (!Interpolate || (i>0 && y==iBarShift(NULL,TimeFrame,Time[i-1]))) continue;
                  
               //
               //
               //
               //
               //
                  
               int n,j; datetime time = iTime(NULL,TimeFrame,y);
                  for(n = 1; (i+n)<Bars && Time[i+n] >= time; n++) continue;	
                  for(j = 1; j<n && (i+n)<Bars && (i+j)<Bars; j++)
                  {
                     pctRankT[i+j] = pctRankT[i] + (pctRankT[i+n] - pctRankT[i])*j/n;
                     pctRankB[i+j] = pctRankB[i] + (pctRankB[i+n] - pctRankB[i])*j/n;
                  }
            }
            for (int i=limit; i>=0; i--)   
            {
                  if (stateu[i]== 1) {  histd[i]  = pctRankT[i]; histnd[i] = pctRankB[i]; }
                  if (stateu[i]== 2) {  histdd[i] = pctRankT[i]; histnd[i] = pctRankB[i]; }
                  if (stated[i]==-1) {  histu[i]  = pctRankB[i]; histnd[i] = pctRankT[i]; }
                  if (stated[i]==-2) {  histuu[i] = pctRankB[i]; histnd[i] = pctRankT[i]; }
                  if (stateu[i]== 0) {  histnd[i] = pctRankT[i]; }
                  if (stated[i]== 0) {  histnu[i] = pctRankB[i]; }
            }
            return(0); 
         }
         
   //
   //
   //
   //
   //

   for (int i=limit; i>=0; i--)   
   {
      double price = iMA(NULL,0,1,0,MODE_SMA,Price,i);
         double lmas = iLaGuerreFilter(price, GammaFast, i, 0);
         double lmal = iLaGuerreFilter(price, GammaSlow, i, 1);
         if (lmal==0) continue;
            ppoT[i] = (lmas-lmal)/lmal*100.0;
            ppoB[i] = (lmal-lmas)/lmal*100.0;
            double topvalueMinus    = 0;
            double topvaluePlus     = 0;
            double bottomvalueMinus = 0;
            double bottomvaluePlus  = 0;
            for (int k = 0; k<LookBack && (i+k+1)<Bars; k++) 
            {
               if (ppoT[i+k+1]<ppoT[i]) 
                     topvalueMinus++;
               else  topvaluePlus++;
               if (ppoB[i+k+1]<ppoB[i]) 
                     bottomvalueMinus++;
               else  bottomvaluePlus++;
            }
            if (topvalueMinus+topvaluePlus!=0)       pctRankT[i] =   topvalueMinus   / (topvalueMinus+topvaluePlus);
            if (bottomvalueMinus+bottomvaluePlus!=0) pctRankB[i] = (bottomvalueMinus / (bottomvalueMinus+bottomvaluePlus)) *-1;
               histnd[i] = EMPTY_VALUE;
               histnu[i] = EMPTY_VALUE;
               histu[i]  = EMPTY_VALUE;
               histd[i]  = EMPTY_VALUE;
               histuu[i] = EMPTY_VALUE;
               histdd[i] = EMPTY_VALUE;
               stateu[i] = 0;
               stated[i] = 0;
                  if (pctRankT[i]> MathMax(Percent1,Percent2)/100                ) stateu[i]= 2;
                  if (pctRankT[i]> MathMin(Percent1,Percent2)/100 && stateu[i]==0) stateu[i]= 1;
                  if (pctRankB[i]<-MathMax(Percent1,Percent2)/100                ) stated[i]=-2;
                  if (pctRankB[i]<-MathMin(Percent1,Percent2)/100 && stated[i]==0) stated[i]=-1;
                  if (stateu[i]== 1) {  histd[i]  = pctRankT[i]; histnd[i] = pctRankB[i]; }
                  if (stateu[i]== 2) {  histdd[i] = pctRankT[i]; histnd[i] = pctRankB[i]; }
                  if (stated[i]==-1) {  histu[i]  = pctRankB[i]; histnd[i] = pctRankT[i]; }
                  if (stated[i]==-2) {  histuu[i] = pctRankB[i]; histnd[i] = pctRankT[i]; }
                  if (stateu[i]== 0) {  histnd[i] = pctRankT[i]; }
                  if (stated[i]== 0) {  histnu[i] = pctRankB[i]; }
   }
   manageAlerts();
   return (0);   
}


//------------------------------------------------------------------
//                                                                  
//------------------------------------------------------------------
//
//
//
//
//

#define laguerreInstances 2
double workLagFil[][laguerreInstances*4];
double iLaGuerreFilter(double price, double gamma, int i, int instanceNo=0)
{
   if (ArrayRange(workLagFil,0)!=Bars) ArrayResize(workLagFil,Bars); i=Bars-i-1; instanceNo*=4;
   if (gamma<=0) return(price);

   //
   //
   //
   //
   //

   if (i<1) { for (int k=0; k<4; k++) workLagFil[i][instanceNo+k] = price; }
   else
   {
      workLagFil[i][instanceNo+0] = (1.0 - gamma)*price                                                + gamma*workLagFil[i-1][instanceNo+0];
	   workLagFil[i][instanceNo+1] = -gamma*workLagFil[i][instanceNo+0] + workLagFil[i-1][instanceNo+0] + gamma*workLagFil[i-1][instanceNo+1];
	   workLagFil[i][instanceNo+2] = -gamma*workLagFil[i][instanceNo+1] + workLagFil[i-1][instanceNo+1] + gamma*workLagFil[i-1][instanceNo+2];
	   workLagFil[i][instanceNo+3] = -gamma*workLagFil[i][instanceNo+2] + workLagFil[i-1][instanceNo+2] + gamma*workLagFil[i-1][instanceNo+3];
   }
   return((workLagFil[i][instanceNo+0]+2.0*workLagFil[i][instanceNo+1]+2.0*workLagFil[i][instanceNo+2]+workLagFil[i][instanceNo+3])/6.0);
}

//-------------------------------------------------------------------
//                                                                  
//-------------------------------------------------------------------
//
//
//
//
//

void manageAlerts()
{
   if (alertsOn)
   {
      int whichBar = 1; if (alertsOnCurrent) whichBar = 0;
      static datetime prevTime1  = 0;
      static string   prevAlert1 = "";
         if (stateu[whichBar] != stateu[whichBar+1])
         {
            if (stateu[whichBar]==1 && stateu[whichBar+1]==0) doAlert(prevAlert1,prevTime1,"down");
            if (stateu[whichBar]==2                         ) doAlert(prevAlert1,prevTime1,"strong down");
         }            
      static datetime prevTime2  = 0;
      static string   prevAlert2 = "";
         if (stated[whichBar] != stated[whichBar+1])
         {
            if (stated[whichBar]==-1 && stated[whichBar+1]==0) doAlert(prevAlert2,prevTime2,"up");
            if (stated[whichBar]==-2                         ) doAlert(prevAlert2,prevTime2,"strong up");
         }            
   }
}

//
//
//
//
//

void doAlert(string& previousAlert, datetime& previousTime, string doWhat)
{
   string message;
   if (previousAlert != doWhat || previousTime != Time[0]) {
       previousAlert  = doWhat;
       previousTime   = Time[0];

       //
       //
       //
       //
       //

       message = Symbol()+" at "+TimeToStr(TimeLocal(),TIME_SECONDS)+" Laguerre PPO signal "+doWhat;
          if (alertsMessage)   Alert(message);
          if (alertsEmail)     SendMail(Symbol()+" Laguerre PPO",message);
          if (alertsPushNotif) SendNotification(message);
          if (alertsSound)     PlaySound("alert2.wav");
   }
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

string timeFrameToString(int tf)
{
   for (int i=ArraySize(iTfTable)-1; i>=0; i--) 
         if (tf==iTfTable[i]) return(sTfTable[i]);
                              return("");
}