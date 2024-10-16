//**************************************************************************//
//                     Solar Wind Joy DS RP ZAA MTF TT                      //
//**************************************************************************//
#property copyright   "©  Tankk,  28  августа  2018,  http://forexsystems.ru/" 
#property link        "https://forexsystemsru.com/indikatory-foreks/86203-indikatory-sobranie-sochinenii-tankk.html"  ////"http://forexsystemsru.com/indikatory-foreks-f41/" 
#property description "Индикатор перерисовывается!!!"
#property description "В основе индикатора математические расчеты, построенные на соотношениях текущего" 
#property description "ценового минимума и максимума с экстремумами цен предыдущих периодов." 
#property description "^^^^"   ///^^^   ^^^   ^^^   ^^^   ^^^   ^^^   ^^^   ^^^   ^^^   ^^^^"    ///"*****************************************************************************************************"
#property description "Трендовый осциллятор в виде гистограммы с Сигнальной МА и Bollinger Bands."
#property description "Смена цвета гистограмы и Стрелки указывают на пересечение Индексом его Сигнальной."
#property description "^^^^"   ///^^^   ^^^   ^^^^"  ///^^^   ^^^   ^^^^"   ////   ^^^   ^^^   ^^^   ^^^   ^^^^"   ///" * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * "
#property description "Почта:  tualatine@mail.ru" 
#property version "6.6"
//#property strict
#property indicator_separate_window
#property indicator_buffers 6
//------
#property indicator_color1  clrLimeGreen  //LightSteelBlue   //Blue
#property indicator_color2  clrOrangeRed  //Crimson   //
#property indicator_color3  clrGold  //Aqua //Black
#property indicator_color4  clrLightCyan  //DeepSkyBlue  //Magenta  //Black
#property indicator_color5  clrDodgerBlue   //Yellow
#property indicator_color6  clrMagenta  //DarkOrange   //Yellow
//------
#property indicator_width1  2
#property indicator_width2  2
#property indicator_width3  1
#property indicator_width4  0
#property indicator_width5  0
#property indicator_width6  0
//------
#property indicator_style4  STYLE_DOT
#property indicator_style5  STYLE_SOLID
#property indicator_style6  STYLE_SOLID
//**************************************************************************//
//***                   Custom indicator ENUM settings                     ***
//**************************************************************************//
enum showMTD { LINE, HISTO, LINEHISTO };
enum showARR { HideArrows, aINSIDE, aCENTER, aOUTSIDE };  //enum showAR { aDoNotCALC, HideArrows, aOnCHART, aOnINDIK };  
//**************************************************************************//
//***                Custom indicator input parameters                     *** 
//**************************************************************************//

extern int               History  =  5555;  //1234;       
extern ENUM_TIMEFRAMES TimeFrame  =  PERIOD_CURRENT;       
extern int                  HiLo  =  21;  //45;  //84;
extern double           FiboKoef  =  0.66;
extern int                Smooth  =  7;  //3;  //1;
extern ENUM_APPLIED_PRICE  Price  =  PRICE_MEDIAN;
extern int                 SigMA  =  21;  //20;
extern ENUM_MA_METHOD  SigMAMode  =  MODE_LWMA;  //MODE_SMA;
extern int                BBands  =  45;
extern double          Deviation  =  0.66;

extern showMTD          ShowMAIN  =  HISTO;  //LINEHISTO;
extern int           StrongScale  =  1;
extern bool            ShowSigMA  =  true;
extern bool           ShowBBands  =  true;
extern int             LabelSize  =  24;

extern showARR        ShowArrows  =  aOUTSIDE;   //IN     
extern int              ARROWBAR  =  0;        //На каком баре рисовать Стрелку: =0 - рисовать на текущем (до закрытия - может исчезнуть)
extern string   ArrowsIdentifier  =  "";  ///"TMA Index True x15 TT——>";
extern int                ArrGap  =  3;   //Дистанция от High/Low свечи  
extern color              ArrBUY  =  clrLime,  //White,   //DarkTurquoise,    //FireBrick,   //Magenta,   
                         ArrSELL  =  clrRed;   //HotPink;  //Orange;   //SlateBlue;   //DodgerBlue;   //LightCyan;   //Lavender;
extern int                CodBUY  =  233,
                         CodSELL  =  234,
                         ArrSize  =  1;     
                           
extern string          SoundFile  =  "alert2.wav";   //"stops.wav"   //"news.wav"   //"expert.wav"  //"Trumpet.wav";  //
extern int             SIGNALBAR  =  1;
extern bool        AlertsMessage  =  true,   //false,    
                     AlertsSound  =  true,   //false,
                     AlertsEmail  =  false,
                    AlertsMobile  =  false;
                        
//**************************************************************************//
//***                     Custom indicator buffers                         ***  
//**************************************************************************//
double TRNUP[], TRNDN[], TREND[];   double TemP[], SMOO1[], SMOO2[];
double SIGMA[], BNDHI[], BNDLO[];   string PREF, ShortName, TEXT;  color CLR; 
int MAX, ARB, SGB;  string  messageUP, messageDN;  datetime TimeBar=0, BarTime=0;   
//**************************************************************************//
//***               Custom indicator initialization function               ***
//**************************************************************************//
int init() 
{
   TimeFrame = fmax(TimeFrame,_Period);  
   HiLo = fmax(HiLo,1);
   FiboKoef = fmax(FiboKoef,0.01);
   Smooth = fmax(Smooth,1);
   MAX = fmax(fmax(HiLo,Smooth),fmax(SigMA,BBands));
   ARB=ARROWBAR;   SGB=SIGNALBAR;
//------
//------
  	IndicatorBuffers(6);   IndicatorDigits(Digits);   //if (Digits==3 || Digits==5) IndicatorDigits(Digits-1);
//------ 2 распределенных буфера индикатора 
   SetIndexBuffer(0,TRNUP);
   SetIndexBuffer(1,TRNDN);
   SetIndexBuffer(2,TREND);
   SetIndexBuffer(3,SIGMA);
   SetIndexBuffer(4,BNDLO);
   SetIndexBuffer(5,BNDHI);
   
//------ настройка параметров отрисовки
   int HST = (ShowMAIN==1 || ShowMAIN==2) ? DRAW_HISTOGRAM : DRAW_NONE;   
   SetIndexStyle(0,HST);
   SetIndexStyle(1,HST);
   int MNT = (ShowMAIN==0 || ShowMAIN==2) ? DRAW_LINE : DRAW_NONE;   
   SetIndexStyle(2,MNT);
   int SGT = (ShowSigMA) ? DRAW_LINE : DRAW_NONE;   
   SetIndexStyle(3,SGT);
   int BBT = (ShowBBands) ? DRAW_LINE : DRAW_NONE;   
   SetIndexStyle(4,BBT);
   SetIndexStyle(5,BBT);
//------
//------
   for (int i=0; i<7; i++) {
        //SetIndexStyle(i,DRAW_ARROW,EMPTY,MXSize,MXClrUP);  //--- настройка параметров отрисовки
        SetIndexEmptyValue(i,0.0);                            //--- значение 0 отображаться не будет 
        //SetIndexShift(11,SlowShift);                           //--- установка сдвига линий при отрисовке  
        if (History > MAX)  SetIndexDrawBegin(i,Bars-History); //--- пропуск отрисовки первых баров 
        if (History <= MAX) SetIndexDrawBegin(i,MAX); }   

//------ отображение в DataWindow 
   SetIndexLabel(0,stringMTF(TimeFrame)+": SolarUP");
   SetIndexLabel(1,stringMTF(TimeFrame)+": SolarDN");
   SetIndexLabel(2,"SOLAR ["+(string)HiLo+"*"+(string)Smooth+"]");
   SetIndexLabel(3,"SigMA  ["+(string)SigMA+"]");
   SetIndexLabel(4,"BBandLO ["+(string)BBands+"*"+DoubleToStr(Deviation,2)+"]");
   SetIndexLabel(5,"BBandUP ["+(string)BBands+"*"+DoubleToStr(Deviation,2)+"]");
   
//------ "короткое имя" для DataWindow и подокна индикатора + и/или "уникальное имя индикатора"
   if (ArrowsIdentifier!="") PREF = ArrowsIdentifier;
   else PREF = stringMTF(TimeFrame)+": SLWJ ["+(string)HiLo+"*"+(string)Smooth+"->"+(string)SigMA+"w"+(string)BBands+"*"+DoubleToStr(Deviation,2)+"]";
   //------
   ShortName = stringMTF(TimeFrame)+": SOLAR DS TT ["+(string)HiLo+"*"+(string)Smooth+"->"+(string)SigMA+"w"+(string)BBands+"*"+DoubleToStr(Deviation,2)+"]"; 
   IndicatorShortName(ShortName);
//**************************************************************************//
//**************************************************************************//
//------
return (0);
}
//**************************************************************************//
//                 Custom indicator deinitialization function               //
//**************************************************************************//
////void OnDeinit(const int reason)  { ObjectsDeleteAll(0,PREF,-1,-1); }     
int deinit() { ALL_OBJ_DELETE();  Comment("");  return (0); }  
//**************************************************************************//
void ALL_OBJ_DELETE()
{
   string name;
   for (int s=ObjectsTotal()-1; s>=0; s--) {
        name=ObjectName(s);
        if (StringSubstr(name,0,StringLen(PREF))==PREF) ObjectDelete(name); }
}
//**************************************************************************//
//                   Custom indicator iteration function                    //
//**************************************************************************//
int start() 
{
   int  i, y, k, CountedBars=IndicatorCounted();   
   int nwtf=BoolNewTF();
   if (CountedBars>0) CountedBars--;
   int limit=fmin(Bars-2,Bars-CountedBars);
   if (limit<MAX) limit=MAX;  //35
   if (nwtf && limit<MAX+5) { limit=MAX*5;  ALL_OBJ_DELETE(); }   //pow(MAX,2);  //300;
   if (History>MAX) { limit=fmin(Bars-2,History);  ALL_OBJ_DELETE(); }    //Comment(limit+"  ::  "+nwtf); 
   //------
   ArraySetAsSeries(TemP,true);  ArraySetAsSeries(SMOO1,true);  ArraySetAsSeries(SMOO2,true);
   if (ArraySize(TemP)<Bars) { ArrayResize(TemP,Bars);  ArrayResize(SMOO1,Bars);  ArrayResize(SMOO2,Bars); }
   //------
   double price=0,  MinMax=0;
   double Value=0,  Fish=0;
   double lowest=0, highest=0;        double weight, sum, sumw;
//**************************************************************************//
//                     Solar Wind Joy DS RP ZAA MTF TT                      //
//**************************************************************************//
   
   for (i=0; i<limit; i++) 
    {
     y = iBarShift(NULL,TimeFrame,Time[i],false);     
     //------
     TemP[i]=0;   SMOO1[i]=0;
     price=(iOpen(NULL,TimeFrame,y)+iClose(NULL,TimeFrame,y)+iLow(NULL,TimeFrame,y)+iHigh(NULL,TimeFrame,y))/4;    ////iMA(NULL,0,Smooth,0,MODE_LWMA,Price,i);   //
     //------
     lowest=iLow(NULL,TimeFrame,iLowest(NULL,TimeFrame,MODE_LOW,HiLo,y));
     highest=iHigh(NULL,TimeFrame,iHighest(NULL,TimeFrame,MODE_HIGH,HiLo,y));
     //------ ///FiboKoef=0.66 [в оригинале]
     MinMax=FiboKoef *((price-lowest)/(highest-lowest)-0.5) +0.67 *Value;  //+0.67
     MinMax=MathMin(MathMax(MinMax,-0.999),0.999);
     TemP[i]=MathLog((MinMax+1)/(1-MinMax)) /2 +Fish /2;
     //------
     Value=MinMax;  Fish=TemP[i];
     SMOO1[i]=TemP[i];
     //------
     if (StrongScale>1) { 
         if (TemP[i]>0) SMOO1[i]=StrongScale;
         if (TemP[i]<0) SMOO1[i]=-StrongScale; }
   }
//**************************************************************************//
//                     Solar Wind Joy DS RP ZAA MTF TT                      //
//**************************************************************************//
   
   for (i=limit; i>=0; i--)
    {  
     SMOO2[i]=0;  sum=0;  sumw=0;
   //------
     for (k=0; k<Smooth && (i+k)<Bars; k++)
      {
       weight = Smooth-k;
       sumw  += weight;
       sum   += weight*SMOO1[i+k];  
      }     
   //------
     if (sumw!=0) SMOO2[i] = sum/sumw;
     else         SMOO2[i] = 0;
    }  
//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
//%%%                 Solar Wind Joy +smFish +CCI MTF TT™                  %%%
//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

   for (i=0; i<=limit; i++)
    {
     TREND[i]=0;  sum=0;  sumw=0;
   //------
     for (k=0; k<Smooth && (i-k)>=0; k++)
      {
       weight = Smooth-k;
       sumw  += weight;
       sum   += weight*SMOO2[i-k];
      }             
   //------
     if (sumw!=0) TREND[i] = sum/sumw;
     else         TREND[i] = 0;
    }  
//**************************************************************************//
//                     Solar Wind Joy DS RP ZAA MTF TT                      //
//**************************************************************************//
   
   for (i=0; i<limit; i++) 
    {
     if (SigMA>1) SIGMA[i]=iMAOnArray(TREND,0,SigMA,0,SigMAMode,i);  else SIGMA[i]=0; 
     //------
     if (BBands>1) {   
         BNDLO[i]=iBandsOnArray(TREND,0,BBands,Deviation,0,MODE_LOWER,i); 
         BNDHI[i]=iBandsOnArray(TREND,0,BBands,Deviation,0,MODE_UPPER,i); }
     else { BNDLO[i]=0;  BNDHI[i]=0; }   
    }
//**************************************************************************//
//                     Solar Wind Joy DS RP ZAA MTF TT                      //
//**************************************************************************//
   
   for (i=limit; i >= 0; i--) 
    {
     double GDE = (BNDHI[i]!=0) ? BNDHI[i+BBands] : TREND[i+HiLo];
     //------
     if (TREND[i] > 0) { TRNUP[i]=TREND[i];  TRNDN[i]=0;  TEXT="LONG";   CLR=clrWhite; }
     if (TREND[i] < 0) { TRNDN[i]=TREND[i];  TRNUP[i]=0;  TEXT="SHORT";  CLR=clrRed;   }
     //------
     if (ShowArrows!=0) {  
         if (TREND[i+ARB] > 0 && TREND[i+ARB+1] <= 0) DrawARROW(false,"ArrUP",i);
         if (TREND[i+ARB] < 0 && TREND[i+ARB+1] >= 0) DrawARROW(true,"ArrDN",i); }
    }
//**************************************************************************//
//**************************************************************************//

   if (LabelSize>4) DrawTEXT(PREF+"txt", GDE, TEXT, LabelSize, CLR);   WindowRedraw();
//**************************************************************************//
//                     Solar Wind Joy DS RP ZAA MTF TT                      //
//**************************************************************************//

   if (AlertsMessage || AlertsEmail || AlertsMobile || AlertsSound) 
    {        ////WindowExpertName()+ 
     messageUP = "SOLAR:  " +_Symbol+", "+stringMTF(_Period)+"  >>  cross  Zero  UP  >>  BUY";
     messageDN = "SOLAR:  " +_Symbol+", "+stringMTF(_Period)+"  <<  cross  Zero  DN  <<  SELL"; 
   //------
     if (TimeBar!=Time[0] &&  (TREND[SGB] > 0 && TREND[SGB+1] <= 0)) {   
         if (AlertsMessage) Alert(messageUP);  
         if (AlertsEmail)   SendMail(_Symbol,messageUP);  
         if (AlertsMobile)  SendNotification(messageUP);  
         if (AlertsSound)   PlaySound(SoundFile);   //"stops.wav"   //"news.wav"   //"alert2.wav"  //"expert.wav"  
         TimeBar=Time[0]; } //return(0);
   //------
     else 
     if (TimeBar!=Time[0] && (TREND[SGB] < 0 && TREND[SGB+1] >= 0)) {   
         if (AlertsMessage) Alert(messageDN);  
         if (AlertsEmail)   SendMail(_Symbol,messageDN);  
         if (AlertsMobile)  SendNotification(messageDN);  
         if (AlertsSound)   PlaySound(SoundFile);   //"stops.wav"   //"news.wav"   //"alert2.wav"  //"expert.wav"                
         TimeBar=Time[0]; } //return(0); 
    } //*конец* Алертов
//**************************************************************************//
//**************************************************************************//
//------
return (0);
}
//**************************************************************************//
//***                      ZZ NRP X4 SW AA LB TT [MK]                      ***
//**************************************************************************//
void DrawTEXT(string Name, double gde, string text, int fontsize, color Color) 
{
   ObjectDelete(Name);
   if (ObjectFind(Name)==-1) 
   ObjectCreate(Name,OBJ_TEXT,WindowFind(ShortName), Time[0] +60*_Period*LabelSize*0.8, gde);
   ObjectSetText(Name, text, fontsize, "Arial Black", Color);
   ObjectSet(Name,OBJPROP_SELECTABLE, false);
   ObjectSet(Name,OBJPROP_BACK, false);
   ObjectSet(Name,OBJPROP_HIDDEN, false);  
   ObjectSet(Name,OBJPROP_ANCHOR, ANCHOR_CENTER);
}
//**************************************************************************//
//***                      ZZ NRP X4 SW AA LB TT [MK]                      ***
//**************************************************************************//
int BoolNewTF() 
{
   datetime BarOpenTime=iTime(NULL,PERIOD_M1,0);
   if (BarTime==0) BarTime=BarOpenTime;
   if (BarTime!=BarOpenTime) {
       BarTime=BarOpenTime;
       return(1); }
   else 
       return(0);
}
//**************************************************************************//
//***                      ZZ NRP X4 SW AA LB TT [MK]                      ***
//**************************************************************************//
void DrawARROW(bool DOWN, string Name, int z)  ///, int ARRSIZE, int ARRCOD)  //double gap, int ARRCOD, color ARRCOLOR)
{
   //int DGTS = Digits;  if (Digits==3 || Digits==5) DGTS-=1;
   string objName = PREF+"*"+Name+"*"+(string)z+"_"+TimeToStr(Time[z],TIME_MINUTES);  ///+"_"+DoubleToStr(Close[z],DGTS);
   //double Gap = 2.0*iATR(NULL,0,20,z)/4.0;
   double GAP=ArrGap*_Point;   if (Digits==3 || Digits==5) GAP*=10;
//------
   ObjectDelete(objName);
   ObjectCreate(objName,OBJ_ARROW, 0, Time[z], 0);
   //ObjectSetText(objName, TEXT, Size, "Verdana", Color);
   //ObjectSet(objName,OBJPROP_ARROWCODE, ARRCOD);
   ObjectSet(objName,OBJPROP_WIDTH, ArrSize);  //ARRSIZE);  //
   //ObjectSet(objName,OBJPROP_COLOR, ARRCOLOR);  
   ObjectSet(objName,OBJPROP_SELECTABLE, false);
   ObjectSet(objName,OBJPROP_BACK, false);
   ObjectSet(objName,OBJPROP_HIDDEN, false);  
   //ObjectSet(objName,OBJPROP_ANCHOR, ANCHOR_CENTER);  //ANCHOR_LEFT);
   //------   enum showAR { HideArrows, aINSIDE, aCENTER, aOUTSIDE };
   double HIGH=High[z]+GAP;  if (ShowArrows==2) HIGH=(High[z]+Low[z])/2;  if (ShowArrows==1) HIGH=Low[z] -GAP;
   double LOW =Low[z] -GAP;  if (ShowArrows==2) LOW =(High[z]+Low[z])/2;  if (ShowArrows==1) LOW =High[z]+GAP;
//------
   if (DOWN) {
              ObjectSetText(objName, "SOLAR cross SigMA down << SELL", 10, "Verdana", clrRed);
              ObjectSet(objName,OBJPROP_COLOR, ArrSELL);  
              ObjectSet(objName,OBJPROP_ARROWCODE, CodSELL);
              ObjectSet(objName,OBJPROP_PRICE1, HIGH); 
              ObjectSet(objName,OBJPROP_ANCHOR, ANCHOR_BOTTOM); }
//------
   if (!DOWN) {
               ObjectSetText(objName, "SOLAR cross SigMA up >> BUY", 10, "Verdana", clrWhite);
               ObjectSet(objName,OBJPROP_COLOR, ArrBUY);  
               ObjectSet(objName,OBJPROP_ARROWCODE, CodBUY);
               ObjectSet(objName,OBJPROP_PRICE1, LOW); 
               ObjectSet(objName,OBJPROP_ANCHOR, ANCHOR_TOP); } 
}
//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
//%%%                  Stochastic Different AA TT™ [x4]                    %%%
//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
string stringMTF(int perMTF)
{  
   if (perMTF==0)      perMTF=_Period;
   if (perMTF==1)      return("M1");
   if (perMTF==5)      return("M5");
   if (perMTF==15)     return("M15");
   if (perMTF==30)     return("M30");
   if (perMTF==60)     return("H1");
   if (perMTF==240)    return("H4");
   if (perMTF==1440)   return("D1");
   if (perMTF==10080)  return("W1");
   if (perMTF==43200)  return("MN1");
   if (perMTF== 2 || 3  || 4  || 6  || 7  || 8  || 9 ||       /// нестандартные периоды для грфиков Renko
               10 || 11 || 12 || 13 || 14 || 16 || 17 || 18)  return("M"+(string)_Period);
//------
   return("Ошибка периода");
}
//**************************************************************************//
//                     Solar Wind Joy DS RP ZAA MTF TT                      //
//**************************************************************************//