//+------------------------------------------------------------------------------------------------------------------+
//+ [Knowledge of the ancients]                           \!/                              [!!!-MT4 X-DAILY TARGETS] +
//+                                                      (ò ó)                                     [Update-20190227] +
//+-------------------------------------------------o0o---(_)---o0o--------------------------------------------------+
#property copyright "Welcome to the World of Forex"
#property link "https://forexsystemsru.com/threads/indikatory-sobranie-sochinenij-tankk.86203/"  ////https://forexsystemsru.com/forums/indikatory-foreks.41/
#property description "Let light shine out of darkness and illuminate your world"
#property description "and with this freedom leave behind your cave of denial"
#property  indicator_chart_window
#define Version "DAILY TARGETS"
string ID;  /// = "Xard>";//req for object deletion
//+------------------------------------------------------------------------------------------------------------------+
extern string Indicator = Version;
extern string STR01                      = "<<<==== [01] Open Postion level Settings ====>>>";
  extern bool showOpenPoslevels          = true;
extern double OpenPosPercent             = 10.0;

       double OpenToday,CloseToday,ADR1,ADR5,ADR10,ADR20,ADRavg;
       
extern string STR02                      = "<<<==== [02] ADR% Target Settings ====>>>";
extern ENUM_TIMEFRAMES TimeFrame  =  PERIOD_D1;
  extern bool showTARGETS                = true;
  extern bool ShowPrevHiLo               = true;
  
extern double RET6185                    = 61.85,
              RET7645                    = 76.45,
              ADR100                     = 100.0,
              ADR138                     = 127.0,
              ADR161                     = 161.85,
              ADR200                     = 200.0;  
              
extern string STR03                      = "<<<==== [03] Levels & Text Settings ====>>>";  ///Yesterday HiLo
  
  extern color Previous  =  clrRoyalBlue;
  extern color OpenBUY  =  clrLime;
  extern color OpenSELL  =  clrDeepPink;
  extern ENUM_LINE_STYLE PrevOpenStyle  =  STYLE_DASH;
  extern int PrevOpenSize  =  4;
  
  extern color ADRColor  =  clrLightCyan;
  extern double RayLength  =  0;
  extern ENUM_LINE_STYLE ADRStyle  =  STYLE_DOT;
  extern int ADRSize  =  2;
  
  extern int TextSize  =  10;
  extern double TextShift  =  1.5;
//+------------------------------------------------------------------------------------------------------------------+
       ////string TimeFrame="Current time frame";  int timeFrame;
       int TimeStart,TimeFinish;  bool TX=false;
       //string FontType="Arial Black",SymbolPair="",indicatorFileName;   ///datetime LastBarOpenTime;
       //double data1;  int BarsCount=1000,Type,Type2,win,FontSize=15,FontSize2=12,pipsize;
//+----OnInit Function-----------------------------------------------------------------------------------------------+
   int OnInit(){int Buffers=0,Buf=-1;  IndicatorBuffers(Buffers);
   TimeFrame = fmax(TimeFrame,_Period);    ///if(TimeFrame==0 || TimeFrame<_Period) TimeFrame=_Period;  timeFrame=stringToTimeFrame(TimeFrame);
   if (RayLength==0) RayLength=1;  //RayLength = fmax(RayLength,1); 
   if (TextShift==0) TextShift=1;  //TextShift = fmax(TextShift,0); 
   ID = timeFrameToString(TimeFrame)+": Xard ["+(string)OpenPosPercent+"] ";   if (TextSize>4) TX=true;
   IndicatorDigits(Digits); IndicatorShortName(ID); //win=WindowFind(ID); 
   /*indicatorFileName = WindowExpertName();*/  return(INIT_SUCCEEDED);}//End OnInit
//+----deinit Function-----------------------------------------------------------------------------------------------+
   void deinit(){CleanUpIsle1();}//End deinit
//+----OnCalculate Function------------------------------------------------------------------------------------------+
   int OnCalculate(const int rates_total,
                   const int prev_calculated,
                   const datetime &time[],
                   const double &open[],
                   const double &high[],
                   const double &low[],
                   const double &close[],
                   const long &tick_volume[],
                   const long &volume[],
                   const int &spread[]){
//+------------------------------------------------------------------------------------------------------------------+
   //int countedbars=IndicatorCounted(); int limit=Bars-countedbars; if(countedbars>0) limit++;
   OpenToday=iOpen(NULL,TimeFrame,0); //CloseToday=iClose(NULL,TimeFrame,0);
//+---ADR------------------------------------------------------------------------------------------------------------+
   ADR1=0; ADR5=0; ADR10=0; ADR20=0; ADRavg=0; int a,b,c; int ypos=0;
                             ADR1=(iHigh(NULL,TimeFrame,1)-iLow(NULL,TimeFrame,1));
   for(a=1;a<= 5;a++)  ADR5= ADR5+(iHigh(NULL,TimeFrame,a)-iLow(NULL,TimeFrame,a));
   for(b=1;b<=10;b++) ADR10=ADR10+(iHigh(NULL,TimeFrame,b)-iLow(NULL,TimeFrame,b));
   for(c=1;c<=20;c++) ADR20=ADR20+(iHigh(NULL,TimeFrame,c)-iLow(NULL,TimeFrame,c));
   ADR5=ADR5/5;  ADR10=ADR10/10;  ADR20=ADR20/20;
//+---Entry level Open Position--------------------------------------------------------------------------------------+
   string space="";   ///"                                    ";
   double OpenPosUP=OpenToday+(((ADR1+ADR5+ADR10+ADR20)/4)*(OpenPosPercent/100));
   double OpenPosDN=OpenToday-(((ADR1+ADR5+ADR10+ADR20)/4)*(OpenPosPercent/100));
   /*if(_Period<=PERIOD_H1){*/if(showOpenPoslevels){  //Current
   if(TX) iLabel(ID+"Xlabel1",StringConcatenate(space+"Open:",timeFrameToString(TimeFrame)),clrGold,OpenToday,0); iLine1(ID+"Xline1",clrGold,OpenToday);
   if(Close[0]>=OpenToday && OpenBUY!=clrNONE){color colUP=OpenBUY;   ///clrAqua;  //Pos UP
   if(TX) iLabel(ID+"Xlabel2",StringConcatenate(space+"order BUY"), colUP,OpenPosUP,0); iLine2(ID+"Xline2",colUP,OpenPosUP);}
   if(Close[0]<=OpenToday && OpenSELL!=clrNONE){color colDN=OpenSELL;   ///C'255,85,160';  //Pos DN
   if(TX) iLabel(ID+"Xlabel2",StringConcatenate(space+"order SELL"), colDN,OpenPosDN,0); iLine2(ID+"Xline2",colDN,OpenPosDN);}}//}
//+---Primary and Secondary Targets----------------------------------------------------------------------------------+
   double D1H=iHigh(NULL,TimeFrame,1);//yHigh 
   double D1L= iLow(NULL,TimeFrame,1);//yLow
   //double ADR62 =D1L+(D1H-D1L)*0.618;//y62%
   //double ADR38= D1L+(D1H-D1L)*0.382;//y38%
   double TU1=OpenToday+(((ADR1+ADR5+ADR10+ADR20)/4)*(RET6185/100)),
          TD1=OpenToday-(((ADR1+ADR5+ADR10+ADR20)/4)*(RET6185/100)),
          TU2=OpenToday+(((ADR1+ADR5+ADR10+ADR20)/4)*(ADR100/100)),
          TD2=OpenToday-(((ADR1+ADR5+ADR10+ADR20)/4)*(ADR100/100)),
          TU3=OpenToday+(((ADR1+ADR5+ADR10+ADR20)/4)*(ADR138/100)),
          TD3=OpenToday-(((ADR1+ADR5+ADR10+ADR20)/4)*(ADR138/100)),
          TU4=OpenToday+(((ADR1+ADR5+ADR10+ADR20)/4)*(ADR161/100)),
          TD4=OpenToday-(((ADR1+ADR5+ADR10+ADR20)/4)*(ADR161/100)),
          TU5=OpenToday+(((ADR1+ADR5+ADR10+ADR20)/4)*(ADR200/100)),
          TD5=OpenToday-(((ADR1+ADR5+ADR10+ADR20)/4)*(ADR200/100));    ///color colADR=clrSnow;
   if(showTARGETS && ADRColor!=clrNONE){/*if(_Period<=PERIOD_H1){*/if(Close[0]>=OpenToday){
   if(TX) iLabel(ID+"XLabel3",StringConcatenate(space+"61.85% ADR:",timeFrameToString(TimeFrame)),ADRColor,TU1,0); iLine2(ID+"XLine3",ADRColor,TU1);
   if(TX) iLabel(ID+"XLabel4",StringConcatenate(space+"100% ADR:",timeFrameToString(TimeFrame)),  ADRColor,TU2,0); iLine2(ID+"XLine4",ADRColor,TU2);
   if(TX) iLabel(ID+"XLabel5",StringConcatenate(space+"127% ADR:",timeFrameToString(TimeFrame)),  ADRColor,TU3,0); iLine2(ID+"XLine5",ADRColor,TU3);
   if(TX) iLabel(ID+"XLabel6",StringConcatenate(space+"161% ADR:",timeFrameToString(TimeFrame)),  ADRColor,TU4,0); iLine2(ID+"XLine6",ADRColor,TU4);
   if(TX) iLabel(ID+"XLabel7",StringConcatenate(space+"200% ADR:",timeFrameToString(TimeFrame)),  ADRColor,TU5,0); iLine2(ID+"XLine7",ADRColor,TU5);}
   if(Close[0]<=OpenToday){
   if(TX) iLabel(ID+"XLabel3",StringConcatenate(space+"61.85% ADR:",timeFrameToString(TimeFrame)),ADRColor,TD1,0); iLine2(ID+"XLine3",ADRColor,TD1);
   if(TX) iLabel(ID+"XLabel4",StringConcatenate(space+"100% ADR:",timeFrameToString(TimeFrame)),  ADRColor,TD2,0); iLine2(ID+"XLine4",ADRColor,TD2);
   if(TX) iLabel(ID+"XLabel5",StringConcatenate(space+"127% ADR:",timeFrameToString(TimeFrame)),  ADRColor,TD3,0); iLine2(ID+"XLine5",ADRColor,TD3);
   if(TX) iLabel(ID+"XLabel6",StringConcatenate(space+"161% ADR:",timeFrameToString(TimeFrame)),  ADRColor,TD4,0); iLine2(ID+"XLine6",ADRColor,TD4);
   if(TX) iLabel(ID+"XLabel7",StringConcatenate(space+"200% ADR:",timeFrameToString(TimeFrame)),  ADRColor,TD5,0); iLine2(ID+"XLine7",ADRColor,TD5);}}//}
   if(ShowPrevHiLo && Previous!=clrNONE){/*if(_Period<=PERIOD_H1){*/  ///color clrHL=clrDodgerBlue;
   if(TX) iLabel(ID+"Xlabel8",StringConcatenate(space+"preHigh"),Previous     ,D1H,0); iLine1(ID+"Xline8",Previous,D1H);
   if(TX) iLabel(ID+"Xlabel9",StringConcatenate(space+"preLow") ,Previous     ,D1L,0); iLine1(ID+"Xline9",Previous,D1L);}//}
//+------------------------------------------------------------------------------------------------------------------+
   return(rates_total);}//End OnCalculate
//+----iLine1 Function------------------------------------------------------------------------------------------------+
   void iLine1(string tls1, color a_color_8, double ad_12){
   // TimeStart=StrToTime(TimeToStr(TimeCurrent(),TIME_DATE)+" 00:00");
   //TimeFinish=StrToTime(TimeToStr(TimeCurrent(),TIME_DATE)+" 23:00");
          if(ObjectFind(tls1)!=0) ObjectDelete(tls1); ObjectCreate(tls1,OBJ_TREND,0,iTime(NULL,TimeFrame,0),ad_12,iTime(NULL,TimeFrame,0) +60*TimeFrame*RayLength,ad_12);
              ObjectSet(tls1,OBJPROP_WIDTH,PrevOpenSize);
              ObjectSet(tls1,OBJPROP_STYLE,PrevOpenStyle);  
              ObjectSet(tls1,OBJPROP_COLOR,a_color_8);
              //ObjectSet(tls1,OBJPROP_TIME1,TimeStart);
              //ObjectSet(tls1,OBJPROP_TIME2,TimeFinish);
              //ObjectSet(tls1,OBJPROP_PRICE1,ad_12);
              //ObjectSet(tls1,OBJPROP_PRICE2,ad_12);
              ObjectSet(tls1,OBJPROP_SELECTABLE,FALSE);
              ObjectSet(tls1,OBJPROP_RAY,FALSE);
              ObjectSet(tls1,OBJPROP_BACK,TRUE);}
//+----iLine2 Function------------------------------------------------------------------------------------------------+
   void iLine2(string tls2, color a_color_8, double ad_12){
   // TimeStart=StrToTime(TimeToStr(TimeCurrent(),TIME_DATE)+" 00:00");
   //TimeFinish=StrToTime(TimeToStr(TimeCurrent(),TIME_DATE)+" 23:00");
          if(ObjectFind(tls2)!=0) ObjectDelete(tls2); ObjectCreate(tls2,OBJ_TREND,0,iTime(NULL,TimeFrame,0),ad_12,iTime(NULL,TimeFrame,0) +60*TimeFrame*RayLength,ad_12);
              ObjectSet(tls2,OBJPROP_WIDTH,ADRSize);
              ObjectSet(tls2,OBJPROP_STYLE,ADRStyle);  
              ObjectSet(tls2,OBJPROP_COLOR,a_color_8);
              //ObjectSet(tls2,OBJPROP_TIME1,TimeStart);
              //ObjectSet(tls2,OBJPROP_TIME2,TimeFinish);
              //ObjectSet(tls2,OBJPROP_PRICE1,ad_12);
              //ObjectSet(tls2,OBJPROP_PRICE2,ad_12);
              ObjectSet(tls2,OBJPROP_SELECTABLE,FALSE);
              ObjectSet(tls2,OBJPROP_RAY,FALSE);
              ObjectSet(tls2,OBJPROP_BACK,TRUE);}
//+----iLabel Function-----------------------------------------------------------------------------------------------+
   void iLabel(string name="Labelx",string text=" ",color bcolor=0,double xdist=0,int ydist=0){
        if(ObjectFind(name)!=0) ObjectDelete(name); ObjectCreate(name,OBJ_TEXT,0,iTime(NULL,TimeFrame,0) +60*(TimeFrame/2.0)*TextShift,xdist);
           //ObjectMove(name,0,Time[0+24], xdist + ydist + (Point*1.));
        ObjectSetText(name,text,TextSize,"Consolas Bold",bcolor);
            //ObjectSet(name,OBJPROP_ANCHOR, ANCHOR_LEFT_UPPER);
            ObjectSet(name,OBJPROP_SELECTABLE,FALSE);
            ObjectSet(name,OBJPROP_BACK,FALSE);}
//+---Timeframe Function---------------------------------------------------------------------------------------------+
   string sTfTable[]= {"M1","M5","M15","M30","H1","H4","D1","W1","MN"};
   int    iTfTable[]= {1,5,15,30,60,240,1440,10080,43200};
//+------------------------------------------------------------------------------------------------------------------+
   int stringToTimeFrame(string tfs){ tfs=stringUpperCase(tfs);  for(int i=ArraySize(iTfTable)-1; i>=0; i--)
   if(tfs==sTfTable[i] || tfs==""+iTfTable[i]) return(MathMax(iTfTable[i],_Period));  return(_Period);}
//+------------------------------------------------------------------------------------------------------------------+
   string timeFrameToString(int tf){
   for(int i=ArraySize(iTfTable)-1;i>=0;i--)  if(tf==iTfTable[i]) return(sTfTable[i]); return("");}
//+------------------------------------------------------------------------------------------------------------------+
   string stringUpperCase(string str){ string s=str; for(int length=StringLen(str)-1; length>=0; length--){
   int tchar=StringGetChar(s,length); if((tchar>96 && tchar<123) || (tchar>223 && tchar<256))
   s=StringSetChar(s,length,tchar-32); else if(tchar>-33 && tchar<0) s=StringSetChar(s,length,tchar+224);} return(s);}
//+----Clean Chart Function------------------------------------------------------------------------------------------+
   void CleanUpIsle1(){string name; for(int s=ObjectsTotal()-1; s>=0; s--){name=ObjectName(s);
   if(StringSubstr(name,0,StringLen(ID))==ID) {ObjectDelete(name);}}}
//+------------------------------------------------------------------------------------------------------------------+