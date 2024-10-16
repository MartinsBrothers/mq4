//+++======================================================================+++
//+++               2ich Disparity Oscillator TT [Ichimoku]                +++
//+++======================================================================+++
#property copyright   "©   Tankk,   22 July 2016,   http://forexsystems.ru/" 
#property link        "https://forexsystemsru.com/threads/indikatory-sobranie-sochinenij-tankk.86203/"  ////https://forexsystemsru.com/forums/indikatory-foreks.41/
#property description "Copyright © 2014,  Gehtsoft USA LLC,  http://fxcodebase.com/" 
#property description "   "
#property description "Ichimoku Kinko Hyo предназначен для определения рыночного тренда," 
#property description "уровней поддержки и сопротивления, а также для генерации сигналов покупки и продажи."
#property description "Лучше всего индикатор работает на недельных и дневных графиках."
#property description "   "
#property description "Добавлены: одновременный реверс всех линий, и сдвиг линий отдельно для каждой."
#property description " "   ///^^^^   ^^^   ^^^   ^^^   ^^^^"   ////   ^^^   ^^^   ^^^   ^^^   ^^^^"
#property description "Почта:  tualatine@mail.ru" 
#property version  "2.15"  
//---
#property indicator_separate_window
#property indicator_buffers 3
//---
#property indicator_color1  clrLimeGreen   //Green
#property indicator_color2  clrRed
#property indicator_color3  clrRoyalBlue   //Blue
//---
#property indicator_width1  2
#property indicator_width2  2
#property indicator_width3  2
//---
#property indicator_style1  STYLE_SOLID  
#property indicator_style2  STYLE_DASH
#property indicator_style3  STYLE_DOT
//**************************************************************************//
//***                   Custom indicator ENUM settings                     ***
//**************************************************************************//
enum disCOMP { Tenkan, Kijun, ChinkouSpan, SenkouSpanAA, SenkouSpanBB };
//+++======================================================================+++
//+++                 Custom indicator input parameters                    +++
//+++======================================================================+++

extern int               History  =  4444;  //288=D1/M5 //576=D2/M5; //864=D3/M5; //1152=D4/M5;  //1440=D5/M5;
extern int             TenkanSen  =  9,
                        KijunSen  =  26,
                     SenkouSpanB  =  52;
extern bool              Reverse  =  false;

extern int             Disp1Fast  =  15;
extern int             Disp1Slow  =  15;
extern disCOMP     Disp1CompFast  =  Tenkan;     //0 - TL  //1 - KL  //2 - CS  //3 - SA   //4 - SB
extern disCOMP     Disp1CompSlow  =  Kijun;  
extern ENUM_MA_METHOD Disp1ModeF  =  MODE_SMA;     
extern ENUM_MA_METHOD Disp1ModeS  =  MODE_SMA;   
  
extern int             Disp2Fast  =  15;
extern int             Disp2Slow  =  15;
extern disCOMP     Disp2CompFast  =  Tenkan;  
extern disCOMP     Disp2CompSlow  =  ChinkouSpan; 
extern ENUM_MA_METHOD Disp2ModeF  =  MODE_SMA;     
extern ENUM_MA_METHOD Disp2ModeS  =  MODE_SMA; 
    
extern int             Disp3Fast  =  15;
extern int             Disp3Slow  =  15;
extern disCOMP     Disp3CompFast  =  SenkouSpanAA;  
extern disCOMP     Disp3CompSlow  =  SenkouSpanBB;  
extern ENUM_MA_METHOD Disp3ModeF  =  MODE_SMA;     
extern ENUM_MA_METHOD Disp3ModeS  =  MODE_SMA;    

extern int            Disp1Shift  =  0,
                      Disp2Shift  =  0,
                      Disp3Shift  =  0;

//+++======================================================================+++
//+++                     Custom indicator buffers                         +++
//+++======================================================================+++
double Disparity1[], Disparity2[], Disparity3[];   int MAX;
double Tenkansen[], Kijunsen[], Senkouspana[], Senkouspanb[], Chinkouspan[];
//+++======================================================================+++
//+++              Custom indicator initialization function                +++
//+++======================================================================+++
int init()
{
   TenkanSen   = fmax(TenkanSen,1);    
   KijunSen    = fmax(KijunSen,1);    
   SenkouSpanB = fmax(SenkouSpanB,1);    
   //---
   Disp1Fast = fmax(Disp1Fast,1);    
   Disp1Slow = fmax(Disp1Slow,1);    if (Disp1CompFast==Disp1CompSlow && Disp1Fast==Disp1Slow) Disp1Slow+=1;
   //---
   Disp2Fast = fmax(Disp2Fast,1);    
   Disp2Slow = fmax(Disp2Slow,1);    if (Disp2CompFast==Disp2CompSlow && Disp2Fast==Disp2Slow) Disp2Slow+=1;
   //---
   Disp3Fast = fmax(Disp3Fast,1);    
   Disp3Slow = fmax(Disp3Slow,1);    if (Disp3CompFast==Disp3CompSlow && Disp3Fast==Disp3Slow) Disp3Slow+=1;
   //---
   MAX = fmax(TenkanSen,fmax(KijunSen,SenkouSpanB)) + fmax(fmax(Disp1Fast,Disp1Slow),fmax(fmax(Disp2Fast,Disp2Slow),fmax(Disp3Fast,Disp3Slow))) + fmax(Disp1Shift,fmax(Disp2Shift,Disp3Shift));
//------
  	IndicatorBuffers(8);   IndicatorDigits(0);  //Digits);   //if (Digits==3 || Digits==5) IndicatorDigits(Digits-1);  
   //---
   SetIndexBuffer(0,Disparity1);
   SetIndexBuffer(1,Disparity2);
   SetIndexBuffer(2,Disparity3);
   //---
   SetIndexBuffer(3,Tenkansen);
   SetIndexBuffer(4,Kijunsen);
   SetIndexBuffer(5,Senkouspana);
   SetIndexBuffer(6,Senkouspanb);
   SetIndexBuffer(7,Chinkouspan);  //+"'"+EnumToString(Disp1CompSlow)
   //---
   SetIndexStyle(0,DRAW_LINE);
   SetIndexStyle(1,DRAW_LINE);
   SetIndexStyle(2,DRAW_LINE);
   //---
   SetIndexStyle(3,DRAW_NONE);   
   SetIndexStyle(4,DRAW_NONE);   
   SetIndexStyle(5,DRAW_NONE);
   SetIndexStyle(6,DRAW_NONE);
   SetIndexStyle(7,DRAW_NONE);
   //---
   SetIndexLabel(0,(string)Disp1Fast+"'"+EnumToString(Disp1CompFast)+"-"+(string)Disp1Slow+"'"+EnumToString(Disp1CompSlow));
   SetIndexLabel(1,(string)Disp2Fast+"'"+EnumToString(Disp2CompFast)+"-"+(string)Disp2Slow+"'"+EnumToString(Disp2CompSlow));
   SetIndexLabel(2,(string)Disp3Fast+"'"+EnumToString(Disp3CompFast)+"-"+(string)Disp3Slow+"'"+EnumToString(Disp3CompSlow));
   //---
   SetIndexShift(0,Disp1Shift);     
   SetIndexShift(1,Disp2Shift);     
   SetIndexShift(2,Disp3Shift);   
////---
//   SetIndexDrawBegin(0,Disp1Shift+Disp1Fast);     
//   SetIndexDrawBegin(1,Disp2Shift+Disp2Fast);     
//   SetIndexDrawBegin(2,Disp3Shift+Disp3Fast);
   
   IndicatorShortName("2ich Disparity TT ["+(string)TenkanSen+"+"+(string)KijunSen+"+"+(string)SenkouSpanB+"] ");
//------
return(0);
}
//+++======================================================================+++
//+++              Custom indicator deinitialization function              +++
//+++======================================================================+++
int deinit()  { Comment("");  return(0); }
//+++======================================================================+++
//+++                 Custom indicator double calculation                  +++
//+++======================================================================+++
double GetMA(int IchIndex, int Length, int Mode, int i)
{
   if (IchIndex==0)  return (iMAOnArray(Tenkansen,0,Length,0,Mode,i));
   if (IchIndex==1)  return (iMAOnArray(Kijunsen,0,Length,0,Mode,i));
   //---
   if (IchIndex==2) { if (i>=KijunSen)  return (iMAOnArray(Chinkouspan,0,Length,0,Mode,i));   else  return (0); }
   //---
   if (IchIndex==3)  return (iMAOnArray(Senkouspana,0,Length,0,Mode,i));
   if (IchIndex==4)  return (iMAOnArray(Senkouspanb,0,Length,0,Mode,i));
//------
return(0);
}
//+++======================================================================+++
//+++                 Custom indicator iteration function                  +++
//+++======================================================================+++
int start()
{
   int i, CountedBars=IndicatorCounted();   
   if (CountedBars<0) return(-1);       //Стандарт+Tankk-Вариант!!!
   if (CountedBars>0) CountedBars--;
   int limit=fmin(Bars-2,Bars-2-MAX);  //fmin(Bars-CountedBars,Bars-2);  //+MAX*10*TFK
   if (History>MAX) limit=fmin(History,Bars-2);  //ZZLabels_DELETE(); }    //limit+=MAX;   Comment(limit);   
   //---
   for (i=0; i<8; i++) { 
        SetIndexEmptyValue(i,0.0);                         //--- значение 0 отображаться не будет 
        if (History>MAX)  SetIndexDrawBegin(i,Bars-History); //--- пропуск отрисовки первых баров
        if (History<=MAX) SetIndexDrawBegin(i,MAX*3); }        //--- пропуск отрисовки первых баров           
   //---
   double C11=0, C12=0, C21=0, C22=0, C31=0, C32=0;
//+++======================================================================+++
//+++               2ich Disparity Oscillator TT [Ichimoku]                +++
//+++======================================================================+++
   //i=limit;
//------
   for (i=limit; i>=0; i--)  //while (i>=0)  //
    {
     Tenkansen[i]=Kijunsen[i]=Senkouspana[i]=Senkouspanb[i]=Chinkouspan[i]=0;
     //---
     Tenkansen[i]   = iIchimoku(NULL,0,TenkanSen,KijunSen,SenkouSpanB,MODE_TENKANSEN,i);
     Kijunsen[i]    = iIchimoku(NULL,0,TenkanSen,KijunSen,SenkouSpanB,MODE_KIJUNSEN,i);
     Senkouspana[i] = iIchimoku(NULL,0,TenkanSen,KijunSen,SenkouSpanB,MODE_SENKOUSPANA,i);
     Senkouspanb[i] = iIchimoku(NULL,0,TenkanSen,KijunSen,SenkouSpanB,MODE_SENKOUSPANB,i);
     Chinkouspan[i] = iIchimoku(NULL,0,TenkanSen,KijunSen,SenkouSpanB,MODE_CHIKOUSPAN,i);
     //i--;
    } 
//+++======================================================================+++
//+++======================================================================+++
   //i=limit;
//------
   for (i=limit; i>=0; i--)  //while (i>=0)  //
    {
     Disparity1[i]=Disparity2[i]=Disparity3[i]=0;
     //---
     C11=GetMA(Disp1CompFast,Disp1Fast,Disp1ModeF,i);
     C12=GetMA(Disp1CompSlow,Disp1Slow,Disp1ModeS,i);
     //---
     if (C11!=0 && C12!=0)  if (!Reverse) Disparity1[i]=(C11-C12)/_Point;   else Disparity1[i]= -1* ((C11-C12)/_Point);
   //+++======================================================================+++
     C21=GetMA(Disp2CompFast,Disp2Fast,Disp2ModeF,i);
     C22=GetMA(Disp2CompSlow,Disp2Slow,Disp2ModeS,i);
     //---
     if (C21!=0 && C22!=0)  if (!Reverse) Disparity2[i]=(C21-C22)/_Point;   else Disparity2[i]= -1* ((C21-C22)/_Point);
   //+++======================================================================+++
     C31=GetMA(Disp3CompFast,Disp3Fast,Disp3ModeF,i);
     C32=GetMA(Disp3CompSlow,Disp3Slow,Disp3ModeS,i);
     //---
     if (C31!=0 && C32!=0)  if (!Reverse) Disparity3[i]=(C31-C32)/_Point;   else Disparity3[i]= -1* ((C31-C32)/_Point);
   //+++======================================================================+++
     //i--;
    }
//------
return(0);
}
//+++======================================================================+++
//+++               2ich Disparity Oscillator TT [Ichimoku]                +++
//+++======================================================================+++