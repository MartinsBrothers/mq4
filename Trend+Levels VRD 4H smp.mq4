//+------------------------------------------------------------------+
//|                                                 Trend+Levels.mq4 |
//|                                        Copyright 2020, Vladradon |
//|                                                fxradon@gmail.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2020, Vladradon + Tankk"
#property link      "fxradon@gmail.com"
#property version   "1.83"  //из "3.45"
#property strict
//---
#property indicator_chart_window   //separate_window  //
#property indicator_buffers 8
//---
//#property indicator_color1  clrDarkGray
//#property indicator_color2  clrRed
//#property indicator_color3  clrYellow
//#property indicator_color4  clrLime
//#property indicator_color5  clrAqua
//#property indicator_color6  clrYellow
//#property indicator_color7  clrLime
//#property indicator_color8  clrAqua
//---
//#property indicator_width1  0
//#property indicator_width2  2
//#property indicator_width3  0
//#property indicator_width4  0
//#property indicator_width5  0
//#property indicator_width6  0
//#property indicator_width7  0
//#property indicator_width8  0
//---
//#property indicator_style1  STYLE_SOLID
//#property indicator_style2  STYLE_DASH
//#property indicator_style3  STYLE_DOT
//#property indicator_style4  STYLE_DOT
//#property indicator_style5  STYLE_DOT
//#property indicator_style6  STYLE_DOT
//#property indicator_style7  STYLE_DOT
//#property indicator_style8  STYLE_DOT
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+  //288=D1/M5 //576=D2/M5; //864=D3/M5; //1152=D4/M5;  //1440=D5/M5;

extern int                History      =  4334;  
extern ENUM_TIMEFRAMES    TimeFrame    =  PERIOD_CURRENT;
extern int                PeriodMA     =  21;
extern ENUM_MA_METHOD     ModeMA       =  MODE_SMA;
extern ENUM_APPLIED_PRICE PriceMA      =  PRICE_CLOSE;

extern int                PointLevel1  =  50;
extern int                PointLevel2  =  65;
extern int                PointLevel3  =  80;
extern color              ColorMA      =  clrRed;
extern color              ColorLevel1  =  clrYellow;
extern color              ColorLevel2  =  clrLime;
extern color              ColorLevel3  =  clrAqua;
extern ENUM_LINE_STYLE    StyleMA      =  STYLE_SOLID;
extern ENUM_LINE_STYLE    StyleLevel1  =  STYLE_SOLID;
extern ENUM_LINE_STYLE    StyleLevel2  =  STYLE_SOLID;
extern ENUM_LINE_STYLE    StyleLevel3  =  STYLE_SOLID;
extern int                WidthMA      =  2;
extern int                WidthLevel1  =  0;
extern int                WidthLevel2  =  0;
extern int                WidthLevel3  =  0;

extern color              ColorClose   =  clrNONE;
extern ENUM_LINE_STYLE    StyleClose   =  STYLE_SOLID;
extern int                WidthClose   =  0;

//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
double CLOSE[], Center[], PONT; 
double Upper1[], Upper2[], Upper3[], Lower1[], Lower2[], Lower3[];
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
{
   TimeFrame = fmax(TimeFrame,_Period);    
   //---
   PeriodMA = fmax(PeriodMA,1);     
   //---
   PONT = _Point*pow(10,Digits%2);
//---
//------
   IndicatorBuffers(8);   IndicatorDigits(Digits-Digits%2);   //if (Digits%2==1) IndicatorDigits(Digits-1);
//--- indicator buffers mapping
   SetIndexBuffer(0,CLOSE);
   SetIndexBuffer(1,Center);
   SetIndexBuffer(2,Upper1);
   SetIndexBuffer(3,Upper2);
   SetIndexBuffer(4,Upper3);
   SetIndexBuffer(5,Lower1);
   SetIndexBuffer(6,Lower2);
   SetIndexBuffer(7,Lower3);
   //---
   int PRT = (ColorClose!=clrNONE) ? DRAW_LINE : DRAW_NONE;
   SetIndexStyle(0,PRT,StyleClose,WidthClose,ColorClose);
   SetIndexStyle(1,DRAW_LINE,StyleMA,WidthMA,ColorMA);
   //---
   SetIndexStyle(2,DRAW_LINE,StyleLevel1,WidthLevel1,ColorLevel1);
   SetIndexStyle(3,DRAW_LINE,StyleLevel2,WidthLevel2,ColorLevel2);
   SetIndexStyle(4,DRAW_LINE,StyleLevel3,WidthLevel3,ColorLevel3);
   SetIndexStyle(5,DRAW_LINE,StyleLevel1,WidthLevel1,ColorLevel1);
   SetIndexStyle(6,DRAW_LINE,StyleLevel2,WidthLevel2,ColorLevel2);
   SetIndexStyle(7,DRAW_LINE,StyleLevel3,WidthLevel3,ColorLevel3);
   
//------ отображение в DataWindow 
   SetIndexLabel(0,StringSubstr(EnumToString(TimeFrame),7)+": CLOSE");
   SetIndexLabel(1,StringSubstr(EnumToString(TimeFrame),7)+": Center "+StringSubstr(EnumToString(ModeMA),5)+","+(string)PeriodMA+"±"+(string)PointLevel1+"±"+(string)PointLevel2+"±"+(string)PointLevel3);
   //---
   SetIndexLabel(2,"Upper1 +"+(string)PointLevel1+" pips");
   SetIndexLabel(3,"Upper2 +"+(string)PointLevel2+" pips");
   SetIndexLabel(4,"Upper3 +"+(string)PointLevel3+" pips");
   SetIndexLabel(5,"Lower1  -"+(string)PointLevel1+" pips");
   SetIndexLabel(6,"Lower2  -"+(string)PointLevel2+" pips");
   SetIndexLabel(7,"Lower3  -"+(string)PointLevel3+" pips");
   
//------ "короткое имя" для DataWindow и подокна индикатора + и/или "уникальное имя индикатора"     //+DoubleToStr(Deviations,1)+
   IndicatorShortName(StringSubstr(EnumToString(TimeFrame),7)+": Trend+Levels VRD: "+StringSubstr(EnumToString(ModeMA),5)+","+(string)PeriodMA+"±"+(string)PointLevel1+"±"+(string)PointLevel2+"±"+(string)PointLevel3+":  ");
//------
return(INIT_SUCCEEDED);
}
//+------------------------------------------------------------------+
//| Custom indicator deinitialization function                       |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
{
   Comment("");
   //ObjectsDeleteAll(0,PREF,window,-1);  //(0,"TL");
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
//---
   if (rates_total<=PeriodMA) return(0);   
   //---
   int limit=fmin(rates_total-prev_calculated-1,rates_total-3-PeriodMA);  //+MAX*10*TFK
   if (limit>0) {
       ArrayInitialize(CLOSE,EMPTY_VALUE);
       ArrayInitialize(Center,EMPTY_VALUE);
       limit=rates_total-3-PeriodMA; }
   //---
   if (History>PeriodMA) limit=fmin(History+PeriodMA*1,rates_total-3-PeriodMA);  //Comment(limit);   //
   //------
   for (int i=0; i<8; i++) { 
        SetIndexEmptyValue(i,EMPTY_VALUE);                      //--- значение 0 отображаться не будет 
        if (History>PeriodMA)  SetIndexDrawBegin(i,Bars-History); //--- пропуск отрисовки первых баров
        if (History<=PeriodMA) SetIndexDrawBegin(i,PeriodMA*1); }   //--- пропуск отрисовки первых баров        
   //---
   //---
   for (int i=limit; i>=0; i--)   //i>=1440/_Period
    {
     int y = iBarShift(NULL,TimeFrame,Time[i],false);
     //---
     CLOSE[i]=EMPTY_VALUE;    CLOSE[i]  = ColorClose!=clrNONE ? iMA(NULL,TimeFrame,1,0,MODE_SMA,PRICE_CLOSE,y) : EMPTY_VALUE;
     Center[i]=EMPTY_VALUE;   Center[i] = iMA(NULL,TimeFrame,PeriodMA,0,ModeMA,PriceMA,y);
     //---
     Upper1[i]=EMPTY_VALUE;  Lower1[i]=EMPTY_VALUE; 
     Upper2[i]=EMPTY_VALUE;  Lower2[i]=EMPTY_VALUE; 
     Upper3[i]=EMPTY_VALUE;  Lower3[i]=EMPTY_VALUE; 
     //---
     if (PointLevel1!=0 && ColorLevel1!=clrNONE)  Upper1[i] = Center[i]+PointLevel1*PONT;   Lower1[i] = Center[i]-PointLevel1*PONT;
     if (PointLevel2!=0 && ColorLevel2!=clrNONE)  Upper2[i] = Center[i]+PointLevel2*PONT;   Lower2[i] = Center[i]-PointLevel2*PONT;
     if (PointLevel3!=0 && ColorLevel3!=clrNONE)  Upper3[i] = Center[i]+PointLevel3*PONT;   Lower3[i] = Center[i]-PointLevel3*PONT;
    } //*конец цикла*
//---
//------ return value of prev_calculated for next call
return(rates_total);
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+