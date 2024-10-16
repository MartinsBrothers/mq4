//+++======================================================================+++
//+++                       True Fractals New TT                           +++
//+++======================================================================+++
#property copyright   "http://tradexperts.ru  +++  ©  Tankk,  10  December  2016,  http://forexsystems.ru/" 
#property link        "http://forexsystemsru.com/indikatory-foreks-f41/" 
#property description "Фракталы (Fractals) — это один из пяти индикаторов торговой системы Билла Вильямса, позволяющий обнаруживать впадину или вершину графика цены." 
#property description "Фрактал вверх технически описывается как серия из, как минимум, пяти последовательных баров, в которой непосредственно перед самым высоким максимумом и сразу же после него находятся по два бара с более низкими максимумами."
#property description "Противоположная конфигурация соответствует фракталу вниз."
//#property version "3.0"
//#property strict
#property indicator_chart_window
#property indicator_buffers 2

//+++======================================================================+++
//+++                 Custom indicator input parameters                    +++
//+++======================================================================+++

extern int       HowBars  =  18;   //5; = оригинальный Fractals Вильямса...
extern bool  ShowFractal  =  true;  
extern color     FRUpper  =  Red,    //Magenta;   //FireBrick,   //Orange
                 FRLower  =  Lime;   //White,     //LightCyan,   //Lavender,  //DarkGreen;      
extern int         FRGap  =  1,            //Дистанция от High/Low свечи (4-значные пипсы)     
                 FRCodUP  =  217,   //233,   //225  //241
                 FRCodLO  =  218,   //234,   //226  //242
                  FRSize  =  0;  
             
//+++======================================================================+++
//+++                     Custom indicator buffers                         +++
//+++======================================================================+++
double FracUP[], FracLO[];
//+++======================================================================+++
//+++              Custom indicator initialization function                +++
//+++======================================================================+++
int init()
{
//---- additional buffers are used for counting
   IndicatorBuffers(2);
//---- 3 indicator buffers mapping
   SetIndexBuffer(0,FracUP);
   SetIndexBuffer(1,FracLO);
//---- drawing settings
   int FRT=DRAW_NONE;   if (ShowFractal) FRT=DRAW_ARROW; 
   SetIndexStyle(0,FRT,0,FRSize,FRUpper);   SetIndexArrow(0,FRCodUP);
   SetIndexStyle(1,FRT,0,FRSize,FRLower);   SetIndexArrow(1,FRCodLO);
//---- labels setup 
   SetIndexLabel(0,"Fractal Upper");
  	SetIndexLabel(1,"Fractal Lower");
//--- name for DataWindow and indicator subwindow label
   IndicatorShortName("True Fractals TT ["+IntegerToString(HowBars)+"]");

//---- initialization done
return(0);
}
//+++======================================================================+++
//+++              Custom indicator deinitialization function              +++
//+++======================================================================+++
int deinit() { return(0); }
//+++======================================================================+++
//+++                 Custom indicator iteration function                  +++
//+++======================================================================+++

int start()
{
   int i, limit;
   int counted_bars=IndicatorCounted();
//---- check for possible errors
   if (counted_bars<0) return(-1);
//---- last counted bar will be recounted
   if (counted_bars>0) counted_bars--;
   limit=Bars-counted_bars;
   
//---- main loop
   double GapFR=FRGap*Point;   if (Digits==3 || Digits==5) GapFR=FRGap*10*Point;

   for (i=0; i<limit; i++)
    {
     FracUP[i]=EMPTY_VALUE;
     FracLO[i]=EMPTY_VALUE;
     
     if (iHighest(NULL,0,MODE_HIGH,HowBars,i-HowBars/2) == i)  FracUP[i]=High[i] +GapFR;
     if (iLowest (NULL,0,MODE_LOW, HowBars,i-HowBars/2) == i)  FracLO[i]=Low[i]  -GapFR;
    }
   
//---- iteration done
return(0);
}
//+++======================================================================+++
//+++                       True Fractals New TT                           +++
//+++======================================================================+++
