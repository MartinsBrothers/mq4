//+------------------------------------------------------------------+
//|                                             RubicBox.mq4         |
//|                                Copyright © 2020, Mr Civil        |
//+------------------------------------------------------------------+
#property copyright "Copyright © 2020, Mr Civil"
#property version  "1.00"

#include <stdlib.mqh>

#property indicator_chart_window


//---- input parameters

extern string              UniqueName           =     "RubicBox";
extern int                 MinBars            =           3;
extern color               BoxColor             =       Blue;
extern int                 BoxWidth             =           2; 
extern ENUM_LINE_STYLE     BoxStyle =       STYLE_DASH; 
extern bool    AlertsMessage  =  true;
extern bool    AlertsSound  =  true;
extern string  AlertsSoundFile  =  "news.wav";   ///"stops.wav"   //"alert2.wav"   //"expert.wav";
extern bool    AlertsMobile  =  true;

int TimeBar = 0;
datetime insideTimeStart;
datetime insideTimeEnd;
datetime insideTimeBox;
int insideShift = 0;
int insideCount = 0;   
double insideHight = 0;
double insideLow = 0;

//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int init()
{

   IndicatorDigits(Digits); 
   return(0);
}
//+------------------------------------------------------------------+
//| Custom indicator deinitialization function                       |
//+------------------------------------------------------------------+
int deinit()
  {
//----
   DeleteObj(UniqueName);

//----
   return(0);
  }
//+------------------------------------------------------------------+
//| RubicBox_v1                                                   |
//+------------------------------------------------------------------+
int start()
{
   int  counted_bars=IndicatorCounted();
    	
   if ( counted_bars > 0 )  int limit = Bars-counted_bars-1;
   if ( counted_bars < 0 )  return(0);
   if ( counted_bars ==0 )  limit = Bars-MinBars; 
   
   
	
	RubicBox(limit);
   
   
return(0);
}

void RubicBox(int limit)
{
   
   for(int shift=limit;shift>=1;shift--) 
   {	
      double shiftLow = (Close[shift]<Open[shift]?Close[shift]:Close[shift]);
      double shiftHigh = (Close[shift]>Open[shift]?Close[shift]:Close[shift]);
      
      if( shiftLow >= Low[shift+1] && shiftHigh <= High[shift+1]) //InsideBar
      {
         if( insideShift == 0)
         {            
            insideShift = shift+1;
            insideTimeStart = Time[shift];
            insideLow = Close[shift];
            insideHight = Close[shift];          
         }
         insideLow = (Close[shift]<insideLow?Close[shift]:insideLow);
         insideHight = (Close[shift]>insideHight?Close[shift]:insideHight);
         insideTimeEnd = Time[shift];
         insideCount++;         
         
         if( insideCount >= MinBars && insideTimeBox!=insideTimeEnd)
         {
               
               string name = UniqueName + " " + TimeToStr(insideTimeStart);
               DeleteBox(name);               
               PlotBox(name,insideTimeStart,insideLow,insideTimeEnd,insideHight,BoxStyle,BoxColor,BoxWidth,0);
               PlotBox(name,insideTimeStart,insideLow,insideTimeEnd,insideHight,BoxStyle,BoxColor,BoxWidth,1);
               insideTimeBox =  Time[shift];
         }
      }
      else
      {
         if ( insideCount >= MinBars && (AlertsMessage || AlertsMobile || AlertsSound) )
         {
                  if (TimeBar!=Time[1] && shift==1) 
                  {  
                     string msg = UniqueName+" - "+Symbol()+", "+ StringMTF(PERIOD_CURRENT)+" breakout!";
                     if (AlertsMessage) Alert(msg);
                     if (AlertsMobile)  SendNotification(msg); 
                     if (AlertsSound)   PlaySound(AlertsSoundFile);
                     TimeBar=Time[1]; 
                  }
         }    
         insideShift = 0;
         insideCount = 0;
      }     
	}
}

string StringMTF(int perMTF)
{  
   if (perMTF==0)      perMTF=Period();
   if (perMTF==1)      return("M1");
   if (perMTF==5)      return("M5");
   if (perMTF==15)     return("M15");
   if (perMTF==30)     return("M30");
   if (perMTF==60)     return("H1");
   if (perMTF==240)    return("H4");
   if (perMTF==1440)   return("D1");
   if (perMTF==10080)  return("W1");
   if (perMTF==43200)  return("MN1");
  return("M"+IntegerToString(Period()));

}

//+------------------------------------------------------------------+

void PlotBox(string tname,datetime time1,double value1, datetime time2,double value2,ENUM_LINE_STYLE style,color clr,double width,int mode)
{   

   
   if(mode == 0)
   {

   ObjectCreate(tname+" 1H",OBJ_TREND,0,time1,value1,time2,value1);
   ObjectSet(tname+" 1H",OBJPROP_COLOR,clr);
   ObjectSet(tname+" 1H",OBJPROP_STYLE,style);
   ObjectSet(tname+" 1H",OBJPROP_RAY,false);
   ObjectSet(tname+" 1H",OBJPROP_BACK,false);
   ObjectSet(tname+" 1H",OBJPROP_WIDTH,width);

  
   ObjectCreate(tname+" 2H",OBJ_TREND,0,time1,value2,time2,value2);
   ObjectSet(tname+" 2H",OBJPROP_COLOR,clr);
   ObjectSet(tname+" 2H",OBJPROP_STYLE,style);
   ObjectSet(tname+" 2H",OBJPROP_RAY,false);
   ObjectSet(tname+" 2H",OBJPROP_BACK,false);
   ObjectSet(tname+" 2H",OBJPROP_WIDTH,width);
   }
  

   }
  
void DeleteBox(string tname)
{
   ObjectDelete(tname+" 1H"); 
   ObjectDelete(tname+" 2H");

}

bool DeleteObj(string tname)
{
   bool result = false;
   
   int length = StringLen(tname);
   for(int i=ObjectsTotal()-1; i>=0; i--)
   {
   string objName = ObjectName(i); 
   if(StringSubstr(objName,0,length) == tname) {ObjectDelete(objName); result = true;}
   }
   
   return(result);
}

