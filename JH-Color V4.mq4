//+------------------------------------------------------------------+
//|                          JH-Color V4.mq4                         |
//|               Copyright 2018, Javad.Heydarzadeh                  |
//+------------------------------------------------------------------+
#property description "Copyright 2018 , By Javad Heydarzadeh"
#property version   "4.00"
#property strict
#property indicator_chart_window
//+------------------------------------------------------------------+
//| Custom indicator Parameters                                      |
//+------------------------------------------------------------------+
extern ENUM_BASE_CORNER InpCorner   =  CORNER_RIGHT_UPPER;   // سمîë مًàôèêà نëے ïًèâےçêè
extern color            panl_0_cl   =  clrGainsboro;        // ضâهٍ ïàيهëè èيًٌٍَىهيٍîâ
extern bool             panl_0_st   =  False;                // خٍîلًàوàٍü ïàيهëü?
extern color            rect_1_cl   =  clrDarkSlateGray;       // 1. ضâهٍ مًàيèِû
extern ENUM_LINE_STYLE  rect_1_st   =  STYLE_SOLID;         // 1. رٍèëü مًàيèِû
extern int              rect_1_wd   =  2;                   // 1. زîëùèيà مًàيèِû
extern color            rect_2_cl   =  clrMaroon;        // 2. ضâهٍ مًàيèِû
extern ENUM_LINE_STYLE  rect_2_st   =  STYLE_SOLID;         // 2. رٍèëü مًàيèِû
extern int              rect_2_wd   =  2;                   // 2. زîëùèيà مًàيèِû
extern color            rect_3_cl   =  clrDarkSlateGray;             // 3. ضâهٍ ïًےىîَمîëüيèêà
extern color            rect_4_cl   =  clrMaroon;              // 4. ضâهٍ ïًےىîَمîëüيèêà
extern color            rect_5_cl   =  clrGray;         // 5. ضâهٍ ïًےىîَمîëüيèêà
extern color            line_1_cl   =  clrDarkSlateGray;       // 6. ضâهٍ ëèيèè
extern ENUM_LINE_STYLE  line_1_st   =  STYLE_SOLID;         // 6. رٍèëü ëèيèè
extern int              line_1_wd   =  2;                   // 6. زîëùèيà ëèيèè
extern color            line_2_cl   =  clrMaroon;        // 7. ضâهٍ ëèيèè
extern ENUM_LINE_STYLE  line_2_st   =  STYLE_SOLID;         // 7. رٍèëü ëèيèè
extern int              line_2_wd   =  2;                   // 7. زîëùèيà ëèيèè

// ؤëے êيîïîê
bool              InpSelection      =  false;               // آûنهëèٍü نëے ïهًهىهùهيèé
bool              InpHidden         =  true;                // رêًûٍ â ٌïèٌêه îلْهêٍîâ
bool              InpHidden_OBJ     =  false;               // رêًûٍ â ٌïèٌêه îلْهêٍîâ
bool              InpBackRect       =  false;               // خلْهêٍ يà çàنيهى ïëàيه

// تîîًنèيàٍû
extern int x_coor = 0;    // رنâèم ïî îٌè X
extern int y_coor = 12;    // رنâèم ïî îٌè Y
int x_size = 112;
int y_size = 30;
int x_step = 5;
int y_panl = 20;
int x_rect = 12;
int y_rect = 12;
int y_line = 6;

string obj_name[8] = {"name_1","name_2","name_3","name_4","name_5","name_6","name_7","name_8"};
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
{
   return(INIT_SUCCEEDED);
}
//+------------------------------------------------------------------+
//| Custom indicator deinitialization function                       |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
{
   Comment("");
   RectLabelDelete(0,obj_name[0]);
   RectLabelDelete(0,obj_name[1]);
   RectLabelDelete(0,obj_name[2]);
   RectLabelDelete(0,obj_name[3]);
   RectLabelDelete(0,obj_name[4]);
   RectLabelDelete(0,obj_name[5]);
   RectLabelDelete(0,obj_name[6]);
   RectLabelDelete(0,obj_name[7]);
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
   CreatePanel();
   CreateRect();

   return(rates_total);
}
//+------------------------------------------------------------------+
//| ChartEvent function                                              |
//+------------------------------------------------------------------+
void OnChartEvent(const int id,
                  const long &lparam,
                  const double &dparam,
                  const string &sparam)
{
   datetime dt_1     = 0;
   double   price_1  = 0;
   datetime dt_2     = 0;
   double   price_2  = 0;
   int      window   = 0;
   int      x        = 0;
   int      y        = 0;
   
   // حàوàٍèه يà ïهًâûé ïًےىîَمîëüيèê
   if (id == CHARTEVENT_OBJECT_CLICK) {
      string clickedChartObject = sparam;
      if (clickedChartObject == obj_name[1]) {
         string name = "name_" + IntegerToString(MathRand() + 100,0,' ');
         
         y = y_coor + y_rect + 2*x_step;
         ChartXYToTimePrice(0,150+ x_coor + x_step, y, window, dt_1, price_1);
         
         y = y_coor + 2*y_rect + 3*x_step;
         ChartXYToTimePrice(0, x_coor + x_size, y, window, dt_2, price_2);
         
         RectangleCreate(0,name,0,dt_1,price_1,dt_2,price_2,rect_1_cl,rect_1_st,rect_1_wd,false,false,true,InpHidden_OBJ,0);
      }
   }
   // حàوàٍèه يà âٍîًîé ïًےىîَمîëüيèê
   if (id == CHARTEVENT_OBJECT_CLICK) {
      string clickedChartObject = sparam;
      if (clickedChartObject == obj_name[2]) {
         string name = "name_" + IntegerToString(MathRand() + 100,0,' ');
         
         y = y_coor + 2*y_rect + 3*x_step;
         ChartXYToTimePrice(0,150+ x_coor + x_step, y, window, dt_1, price_1);
         
         y = y_coor + 3*y_rect + 4*x_step;
         ChartXYToTimePrice(0, x_coor + x_size, y, window, dt_2, price_2);         
         
         RectangleCreate(0,name,0,dt_1,price_1,dt_2,price_2,rect_2_cl,rect_2_st,rect_2_wd,false,false,true,InpHidden_OBJ,0);
      }
   }   
   // حàوàٍèه يà ًٍهٍèé ïًےىîَمîëüيèê
   if (id == CHARTEVENT_OBJECT_CLICK) {
      string clickedChartObject = sparam;
      if (clickedChartObject == obj_name[3]) {
         string name = "name_" + IntegerToString(MathRand() + 100,0,' ');

         y = y_coor + 3*y_rect + 4*x_step;
         ChartXYToTimePrice(0, 150+x_coor + x_step, y, window, dt_1, price_1);
         
         y = y_coor + 4*y_rect + 5*x_step;
         ChartXYToTimePrice(0, x_coor + x_size, y, window, dt_2, price_2);   
         
         RectangleCreate(0,name,0,dt_1,price_1,dt_2,price_2,rect_3_cl,STYLE_SOLID,0,true,false,true,InpHidden_OBJ,0);
      }
   }
   // حàوàٍèه يà ÷هٍâ¸ًٍûé ïًےىîَمîëüيèê
   if (id == CHARTEVENT_OBJECT_CLICK) {
      string clickedChartObject = sparam;
      if (clickedChartObject == obj_name[4]) {
         string name = "name_" + IntegerToString(MathRand() + 100,0,' ');

         y = y_coor + 4*y_rect + 5*x_step;
         ChartXYToTimePrice(0, 150+x_coor + x_step, y, window, dt_1, price_1);
         
         y = y_coor + 5*y_rect + 6*x_step;
         ChartXYToTimePrice(0, x_coor + x_size, y, window, dt_2, price_2);
         
         RectangleCreate(0,name,0,dt_1,price_1,dt_2,price_2,rect_4_cl,STYLE_SOLID,0,true,false,true,InpHidden_OBJ,0);
      }
   }
   // حàوàٍèه يà ïےٍûé ïًےىîَمîëüيèê
   if (id == CHARTEVENT_OBJECT_CLICK) {
      string clickedChartObject = sparam;
      if (clickedChartObject == obj_name[5]) {
         string name = "name_" + IntegerToString(MathRand() + 100,0,' ');

         y = y_coor + 5*y_rect + 6*x_step;
         ChartXYToTimePrice(0, 150+x_coor + x_step, y, window, dt_1, price_1);
         
         y = y_coor + 6*y_rect + 7*x_step;
         ChartXYToTimePrice(0, x_coor + x_size, y, window, dt_2, price_2);
         
         RectangleCreate(0,name,0,dt_1,price_1,dt_2,price_2,rect_5_cl,STYLE_SOLID,0,true,false,true,InpHidden_OBJ,0);
      }
   }
   // حàوàٍèه يà ïهًâَ‏ ëèيè‏
   if (id == CHARTEVENT_OBJECT_CLICK) {
      string clickedChartObject = sparam;
      if (clickedChartObject == obj_name[6]) {
         string name = "name_" + IntegerToString(MathRand() + 100,0,' ');
         
         y = y_coor + 6*y_rect + 8*x_step;
         ChartXYToTimePrice(0, 150+x_coor + x_step, y, window, dt_1, price_1);
         ChartXYToTimePrice(0, x_coor + x_size, y, window, dt_2, price_2);         
         
         TrendCreate(0,name,0,dt_1,price_1,dt_2,price_2,line_1_cl,line_1_st,line_1_wd,InpBackRect,true,false,false,InpHidden_OBJ,0);
      }
   }
   // حàوàٍèه يà âٍîًَ‏ ëèيè‏
   if (id == CHARTEVENT_OBJECT_CLICK) {
      string clickedChartObject = sparam;
      if (clickedChartObject == obj_name[7]) {
         string name = "name_" + IntegerToString(MathRand() + 100,0,' ');
         
         y = y_coor + 6*y_rect +x_step;
         ChartXYToTimePrice(0, 150+x_coor + x_step, y, window, dt_1, price_1);
         ChartXYToTimePrice(0, x_coor + x_size, y, window, dt_2, price_2);         
         
         TrendCreate(0,name,0,dt_1,price_1,dt_2,price_2,line_2_cl,line_2_st,line_2_wd,InpBackRect,true,false,false,InpHidden_OBJ,0);
      }
   }
}

//+------------------------------------------------------------------+
void CreatePanel()
{
   // دàيهëü èيًٌٍَىهيٍîâ
   
   if (panl_0_st) {
   
      int x_pn = x_coor, y_pn = y_coor;
      if (InpCorner == 1)  x_pn = x_coor + x_size + x_step;
      if (InpCorner == 2)  y_pn = y_coor + y_rect + x_step;
      if (InpCorner == 3) {x_pn = x_coor + x_size + x_step; y_pn = y_coor + y_rect + x_step;}
   
      if (!RectLabelCreate(0,obj_name[0],0,x_pn,y_pn,x_size,y_size,panl_0_cl,BORDER_SUNKEN,InpCorner,
           clrBlack,STYLE_SOLID,2,true,InpSelection,true,0)) {
         return;
      }   
   } else {
      panl_0_cl = ChartBackColorGet(0);
   }
}
//+------------------------------------------------------------------+
void CreateRect()
{
   // دهًâûé ïًےىîَمîëüيèê
   int x_pn = x_coor + x_step+14, y_pn = y_coor + x_step;
   if (InpCorner == 1)  x_pn = x_coor + x_size - 3*x_step - 3*x_rect;
   if (InpCorner == 2)  y_pn = y_coor + y_rect;
   if (InpCorner == 3) {x_pn = x_coor + x_size - 3*x_step - 3*x_rect; y_pn = y_coor + y_rect;}
   
   if (!RectLabelCreate(0,obj_name[1],0,x_pn,y_pn,x_rect,y_rect,panl_0_cl,BORDER_FLAT,InpCorner,
        rect_1_cl,rect_1_st,rect_1_wd,InpBackRect,InpSelection,InpHidden,0)) {
      return;
   }   

   // آٍîًîé ïًےىîَمîëüيèê
   x_pn = x_coor + x_rect + 2*x_step+13; y_pn = y_coor + x_step;
   if (InpCorner == 1)  x_pn = x_coor + x_size - 4*x_step -4* x_rect;
   if (InpCorner == 2)  y_pn = y_coor + y_rect;
   if (InpCorner == 3) {x_pn = x_coor + x_size -4* x_step -4* x_rect; y_pn = y_coor + y_rect;}
   
   if (!RectLabelCreate(0,obj_name[2],0,x_pn,y_pn,x_rect,y_rect,panl_0_cl,BORDER_FLAT,InpCorner,
        rect_2_cl,rect_2_st,rect_2_wd,InpBackRect,InpSelection,InpHidden,0)) {
      return;
   }  

   // زًهٍèé ïًےىîَمîëüيèê
   x_pn = x_coor + 2*x_rect + 3*x_step+10; y_pn = y_coor + x_step;
   if (InpCorner == 1)  x_pn = x_coor + x_size - 2*x_step - 2*x_rect;
   if (InpCorner == 2)  y_pn = y_coor + y_rect;
   if (InpCorner == 3) {x_pn = x_coor + x_size - 2*x_step - 2*x_rect; y_pn = y_coor + y_rect;}
   
   if (!RectLabelCreate(0,obj_name[3],0,x_pn,y_pn,x_rect,y_rect,rect_3_cl,BORDER_FLAT,InpCorner,
        rect_3_cl,STYLE_SOLID,0,InpBackRect,InpSelection,InpHidden,0)) {
      return;
   }  

   // ×هٍâ¸ًٍûé ïًےىîَمîëüيèê
   x_pn = x_coor + 3*x_rect + 4*x_step+7; y_pn = y_coor + x_step;
   if (InpCorner == 1)  x_pn = x_coor + x_size;
   if (InpCorner == 2)  y_pn = y_coor + y_rect;
   if (InpCorner == 3) {x_pn = x_coor + x_size; y_pn = y_coor + y_rect;}
   
   if (!RectLabelCreate(0,obj_name[4],0,x_pn,y_pn,x_rect,y_rect,rect_4_cl,BORDER_FLAT,InpCorner,
        rect_4_cl,STYLE_SOLID,0,InpBackRect,InpSelection,InpHidden,0)) {
      return;
   }

   // دےٍûé ïًےىîَمîëüيèê
   x_pn = x_coor + 4*x_rect + 5*x_step+4; y_pn = y_coor + x_step;
   if (InpCorner == 1)  x_pn = x_coor + x_size - x_step - x_rect;
   if (InpCorner == 2)  y_pn = y_coor + y_rect;
   if (InpCorner == 3) {x_pn = x_coor + x_size - x_step - x_rect; y_pn = y_coor + y_rect;}
   
   if (!RectLabelCreate(0,obj_name[5],0,x_pn,y_pn,x_rect,y_rect,rect_5_cl,BORDER_FLAT,InpCorner,
        rect_5_cl,STYLE_SOLID,0,InpBackRect,InpSelection,InpHidden,0)) {
      return;
   }
   
   // دهًâàے ëèيèے
   x_pn = x_coor + x_rect-12 + x_step; y_pn = y_coor + x_step;
   if (InpCorner == 1)  x_pn = x_coor + x_size - 5*x_step - 5*x_rect;
   if (InpCorner == 2)  y_pn = y_coor + y_rect;
   if (InpCorner == 3) {x_pn = x_coor + x_size - 5*x_step - 5*x_rect; y_pn = y_coor + y_rect;}
   
   if (!RectLabelCreate(0,obj_name[6],0,x_pn,y_pn,x_rect,y_line,line_1_cl,BORDER_FLAT,InpCorner,
        line_1_cl,STYLE_SOLID,0,InpBackRect,InpSelection,InpHidden,0)) {
      return;
   }

   // آٍîًàے ëèيèے
   x_pn = x_coor + x_rect-12 + x_step; y_pn = y_coor + y_rect;
   if (InpCorner == 1)  x_pn = x_coor + x_size - 5*x_step - 5*x_rect;
   if (InpCorner == 2)  y_pn = y_coor + x_step;
   if (InpCorner == 3) {x_pn = x_coor + x_size - 5*x_step - 5*x_rect; y_pn = y_coor + x_step;}
   
   if (!RectLabelCreate(0,obj_name[7],0,x_pn,y_pn,x_rect,y_line,line_2_cl,BORDER_FLAT,InpCorner,
        line_2_cl,STYLE_SOLID,0,InpBackRect,InpSelection,InpHidden,0)) {
      return;
   }
}
//+------------------------------------------------------------------+
//| رîçنàهٍ ïًےىîَمîëüيَ‏ ىهٍêَ                                      |
//+------------------------------------------------------------------+
bool RectLabelCreate(const long             chart_ID=0,               // ID مًàôèêà
                     const string           name="RectLabel",         // èىے ىهٍêè
                     const int              sub_window=0,             // يîىهً ïîنîêيà
                     const int              x=0,                      // êîîًنèيàٍà ïî îٌè X
                     const int              y=0,                      // êîîًنèيàٍà ïî îٌè Y
                     const int              width=50,                 // ّèًèيà
                     const int              height=18,                // âûٌîٍà
                     const color            back_clr=C'236,233,216',  // ِâهٍ ôîيà
                     const ENUM_BORDER_TYPE border=BORDER_SUNKEN,     // ٍèï مًàيèِû
                     const ENUM_BASE_CORNER corner=CORNER_RIGHT_LOWER, // َمîë مًàôèêà نëے ïًèâےçêè
                     const color            clr=clrRed,               // ِâهٍ ïëîٌêîé مًàيèِû (Flat)
                     const ENUM_LINE_STYLE  style=STYLE_SOLID,        // ٌٍèëü ïëîٌêîé مًàيèِû
                     const int              line_width=1,             // ٍîëùèيà ïëîٌêîé مًàيèِû
                     const bool             back=false,               // يà çàنيهى ïëàيه
                     const bool             selection=false,          // âûنهëèٍü نëے ïهًهىهùهيèé
                     const bool             hidden=true,              // ٌêًûٍ â ٌïèٌêه îلْهêٍîâ
                     const long             z_order=0)                // ïًèîًèٍهٍ يà يàوàٍèه ىûّü‏
{
   //--- ٌلًîٌèى çيà÷هيèه îّèلêè
   ResetLastError();
   //--- ٌîçنàنèى ïًےىîَمîëüيَ‏ ىهٍêَ
   if (ObjectFind(name) == -1)
      ObjectCreate(chart_ID,name,OBJ_RECTANGLE_LABEL,sub_window,0,0);

   ObjectSetInteger(chart_ID,name,OBJPROP_XDISTANCE,x);              // ٌٍَàيîâèى êîîًنèيàٍû ىهٍêè
   ObjectSetInteger(chart_ID,name,OBJPROP_YDISTANCE,y);
   ObjectSetInteger(chart_ID,name,OBJPROP_XSIZE,width);              // ٌٍَàيîâèى ًàçىهًû ىهٍêè
   ObjectSetInteger(chart_ID,name,OBJPROP_YSIZE,height);
   ObjectSetInteger(chart_ID,name,OBJPROP_BGCOLOR,back_clr);         // ٌٍَàيîâèى ِâهٍ ôîيà
   ObjectSetInteger(chart_ID,name,OBJPROP_BORDER_TYPE,border);       // ٌٍَàيîâèى ٍèï مًàيèِû
   ObjectSetInteger(chart_ID,name,OBJPROP_CORNER,corner);            // ٌٍَàيîâèى َمîë مًàôèêà, îٍيîٌèٍهëüيî êîٍîًîمî لَنٍَ îïًهنهëےٍüٌے êîîًنèيàٍû ٍî÷êè
   ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);                // ٌٍَàيîâèى ِâهٍ ïëîٌêîé ًàىêè (â ًهوèىه Flat)
   ObjectSetInteger(chart_ID,name,OBJPROP_STYLE,style);              // ٌٍَàيîâèى ٌٍèëü ëèيèè ïëîٌêîé ًàىêè
   ObjectSetInteger(chart_ID,name,OBJPROP_WIDTH,line_width);         // ٌٍَàيîâèى ٍîëùèيَ ïëîٌêîé مًàيèِû
   ObjectSetInteger(chart_ID,name,OBJPROP_BACK,back);                // îٍîلًàçèى يà ïهًهنيهى (false) èëè çàنيهى (true) ïëàيه
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTABLE,selection);     // âêë‏÷èى (true) èëè îٍêë‏÷èى (false) ًهوèى ïهًهىهùهيèے ىهٍêè ىûّü‏
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTED,selection);
   ObjectSetInteger(chart_ID,name,OBJPROP_HIDDEN,hidden);            // ٌêًîهى (true) èëè îٍîلًàçèى (false) èىے مًàôè÷هٌêîمî îلْهêٍà â ٌïèٌêه îلْهêٍîâ
   ObjectSetInteger(chart_ID,name,OBJPROP_ZORDER,z_order);           // ٌٍَàيîâèى ïًèîًèٍهٍ يà ïîëَ÷هيèه ٌîلûٍèے يàوàٍèے ىûّè يà مًàôèêه
   
   return(true);
}
//+------------------------------------------------------------------+
//| سنàëےهٍ ïًےىîَمîëüيَ‏ ىهٍêَ                                      |
//+------------------------------------------------------------------+
bool RectLabelDelete(const long   chart_ID=0,       // ID مًàôèêà
                     const string name="RectLabel") // èىے ىهٍêè
{
   //--- ٌلًîٌèى çيà÷هيèه îّèلêè
   ResetLastError();
   //--- َنàëèى ىهٍêَ
   if (ObjectFind(chart_ID,name) >= 0) 
      ObjectDelete(chart_ID,name);
   //--- ٌَïهّيîه âûïîëيهيèه
   return(true);
}
//+------------------------------------------------------------------+
//| شَيêِèے ïîëَ÷àهٍ ِâهٍ ôîيà مًàôèêà.                              |
//+------------------------------------------------------------------+
color ChartBackColorGet(const long chart_ID=0)
  {
//--- ïîنمîٍîâèى ïهًهىهييَ‏ نëے ïîëَ÷هيèے ِâهٍà
   long result=clrNONE;
//--- ٌلًîٌèى çيà÷هيèه îّèلêè
   ResetLastError();
//--- ïîëَ÷èى ِâهٍ ôîيà مًàôèêà
   if(!ChartGetInteger(chart_ID,CHART_COLOR_BACKGROUND,0,result))
     {
      //--- âûâهنهى ٌîîلùهيèه îل îّèلêه â وًَيàë "فêٌïهًٍû"
      Print(__FUNCTION__+", Error Code = ",GetLastError());
     }
//--- âهًيهى çيà÷هيèه ٌâîéٌٍâà مًàôèêà
   return((color)result);
  }
  
  
//+------------------------------------------------------------------+
//| Cîçنàهٍ ïًےىîَمîëüيèê ïî çàنàييûى êîîًنèيàٍàى                    |
//+------------------------------------------------------------------+
bool RectangleCreate(const long            chart_ID=0,        // ID مًàôèêà
                     const string          name="Rectangle",  // èىے ïًےىîَمîëüيèêà
                     const int             sub_window=0,      // يîىهً ïîنîêيà 
                     datetime              time1=0,           // âًهىے ïهًâîé ٍî÷êè
                     double                price1=0,          // ِهيà ïهًâîé ٍî÷êè
                     datetime              time2=0,           // âًهىے âٍîًîé ٍî÷êè
                     double                price2=0,          // ِهيà âٍîًîé ٍî÷êè
                     const color           clr=clrRed,        // ِâهٍ ïًےىîَمîëüيèêà
                     const ENUM_LINE_STYLE style=STYLE_SOLID, // ٌٍèëü ëèيèé ïًےىîَمîëüيèêà
                     const int             width=1,           // ٍîëùèيà ëèيèé ïًےىîَمîëüيèêà
                     const bool            fill=false,        // çàëèâêà ïًےىîَمîëüيèêà ِâهٍîى
                     const bool            back=false,        // يà çàنيهى ïëàيه
                     const bool            selection=true,    // âûنهëèٍü نëے ïهًهىهùهيèé
                     const bool            hidden=true,       // ٌêًûٍ â ٌïèٌêه îلْهêٍîâ
                     const long            z_order=0)         // ïًèîًèٍهٍ يà يàوàٍèه ىûّü‏
{
   //--- ٌلًîٌèى çيà÷هيèه îّèلêè
   ResetLastError();
   //--- ٌîçنàنèى ïًےىîَمîëüيèê ïî çàنàييûى êîîًنèيàٍàى
   if (ObjectFind(name) == -1)
      ObjectCreate(chart_ID,name,OBJ_RECTANGLE,sub_window,time1,price1,time2,price2);

   ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);             //--- ٌٍَàيîâèى ِâهٍ ïًےىîَمîëüيèêà
   ObjectSetInteger(chart_ID,name,OBJPROP_STYLE,style);           //--- ٌٍَàيîâèى ٌٍèëü ëèيèé ïًےىîَمîëüيèêà
   ObjectSetInteger(chart_ID,name,OBJPROP_WIDTH,width);           //--- ٌٍَàيîâèى ٍîëùèيَ ëèيèé ïًےىîَمîëüيèêà
   ObjectSetInteger(chart_ID,name,OBJPROP_FILL,fill);             //--- âêë‏÷èى (true) èëè îٍêë‏÷èى (false) ًهوèى çàëèâêè ïًےىîَمîëüيèêà
   ObjectSetInteger(chart_ID,name,OBJPROP_BACK,back);             //--- îٍîلًàçèى يà ïهًهنيهى (false) èëè çàنيهى (true) ïëàيه 
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTABLE,selection);  //--- âêë‏÷èى (true) èëè îٍêë‏÷èى (false) ًهوèى âûنهëهيèے ïًےىîَمîëüيèêà نëے ïهًهىهùهيèé
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTED,selection);    //--- ïًè ٌîçنàيèè مًàôè÷هٌêîمî îلْهêٍà ôَيêِèهé ObjectCreate, ïî َىîë÷àيè‏ îلْهêٍ
                                                                  //--- يهëüçے âûنهëèٍü è ïهًهىهùàٍü. آيًٍَè وه ‎ٍîمî ىهٍîنà ïàًàىهًٍ selection
                                                                  //--- ïî َىîë÷àيè‏ ًàâهي true, ÷ٍî ïîçâîëےهٍ âûنهëےٍü è ïهًهىهùàٍü ‎ٍîٍ îلْهêٍ
   ObjectSetInteger(chart_ID,name,OBJPROP_HIDDEN,hidden);         //--- ٌêًîهى (true) èëè îٍîلًàçèى (false) èىے مًàôè÷هٌêîمî îلْهêٍà â ٌïèٌêه îلْهêٍîâ
   ObjectSetInteger(chart_ID,name,OBJPROP_ZORDER,z_order);        //--- ٌٍَàيîâèى ïًèîًèٍهٍ يà ïîëَ÷هيèه ٌîلûٍèے يàوàٍèے ىûّè يà مًàôèêه

   return(true);
}
//+------------------------------------------------------------------+
//| سنàëےهٍ ïًےىîَمîëüيèê                                            |
//+------------------------------------------------------------------+
bool RectangleDelete(const long   chart_ID=0,       // ID مًàôèêà
                     const string name="Rectangle") // èىے ïًےىîَمîëüيèêà
{
   //--- ٌلًîٌèى çيà÷هيèه îّèلêè
   ResetLastError();
   //--- َنàëèى ïًےىîَمîëüيèê
   if (ObjectFind(chart_ID,name) >= 0) 
      ObjectDelete(chart_ID,name);

   return(true);
}
//+------------------------------------------------------------------+
//| رîçنàهٍ ëèيè‏ ًٍهينà ïî çàنàييûى êîîًنèيàٍàى                     |
//+------------------------------------------------------------------+
bool TrendCreate(const long            chart_ID=0,        // ID مًàôèêà
                 const string          name="TrendLine",  // èىے ëèيèè
                 const int             sub_window=0,      // يîىهً ïîنîêيà
                 datetime              time1=0,           // âًهىے ïهًâîé ٍî÷êè
                 double                price1=0,          // ِهيà ïهًâîé ٍî÷êè
                 datetime              time2=0,           // âًهىے âٍîًîé ٍî÷êè
                 double                price2=0,          // ِهيà âٍîًîé ٍî÷êè
                 const color           clr=clrRed,        // ِâهٍ ëèيèè
                 const ENUM_LINE_STYLE style=STYLE_SOLID, // ٌٍèëü ëèيèè
                 const int             width=1,           // ٍîëùèيà ëèيèè
                 const bool            back=false,        // يà çàنيهى ïëàيه
                 const bool            selection=true,    // âûنهëèٍü نëے ïهًهىهùهيèé
                 const bool            ray_left=false,    // ïًîنîëوهيèه ëèيèè âëهâî
                 const bool            ray_right=false,   // ïًîنîëوهيèه ëèيèè âïًàâî
                 const bool            hidden=true,       // ٌêًûٍ â ٌïèٌêه îلْهêٍîâ
                 const long            z_order=0)         // ïًèîًèٍهٍ يà يàوàٍèه ىûّü‏
{
   //--- ٌلًîٌèى çيà÷هيèه îّèلêè
   ResetLastError();
   //--- ٌîçنàنèى ًٍهينîâَ‏ ëèيè‏ ïî çàنàييûى êîîًنèيàٍàى
   if (ObjectFind(name) == -1)
      ObjectCreate(chart_ID,name,OBJ_TREND,sub_window,time1,price1,time2,price2);
   
   ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);             //--- ٌٍَàيîâèى ِâهٍ ëèيèè
   ObjectSetInteger(chart_ID,name,OBJPROP_STYLE,style);           //--- ٌٍَàيîâèى ٌٍèëü îٍîلًàوهيèے ëèيèè
   ObjectSetInteger(chart_ID,name,OBJPROP_WIDTH,width);           //--- ٌٍَàيîâèى ٍîëùèيَ ëèيèè
   ObjectSetInteger(chart_ID,name,OBJPROP_BACK,back);             //--- îٍîلًàçèى يà ïهًهنيهى (false) èëè çàنيهى (true) ïëàيه
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTABLE,selection);  //--- âêë‏÷èى (true) èëè îٍêë‏÷èى (false) ًهوèى ïهًهىهùهيèے ëèيèè ىûّü‏
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTED,selection);    //--- ïًè ٌîçنàيèè مًàôè÷هٌêîمî îلْهêٍà ôَيêِèهé ObjectCreate, ïî َىîë÷àيè‏ îلْهêٍ
                                                                  //--- يهëüçے âûنهëèٍü è ïهًهىهùàٍü. آيًٍَè وه ‎ٍîمî ىهٍîنà ïàًàىهًٍ selection
                                                                  //--- ïî َىîë÷àيè‏ ًàâهي true, ÷ٍî ïîçâîëےهٍ âûنهëےٍü è ïهًهىهùàٍü ‎ٍîٍ îلْهêٍ
   ObjectSetInteger(chart_ID,name,OBJPROP_RAY_LEFT,ray_left);     //--- âêë‏÷èى (true) èëè îٍêë‏÷èى (false) ًهوèى ïًîنîëوهيèے îٍîلًàوهيèے ëèيèè âëهâî
   ObjectSetInteger(chart_ID,name,OBJPROP_RAY_RIGHT,ray_right);   //--- âêë‏÷èى (true) èëè îٍêë‏÷èى (false) ًهوèى ïًîنîëوهيèے îٍîلًàوهيèے ëèيèè âïًàâî
   ObjectSetInteger(chart_ID,name,OBJPROP_HIDDEN,hidden);         //--- ٌêًîهى (true) èëè îٍîلًàçèى (false) èىے مًàôè÷هٌêîمî îلْهêٍà â ٌïèٌêه îلْهêٍîâ
   ObjectSetInteger(chart_ID,name,OBJPROP_ZORDER,z_order);        //--- ٌٍَàيîâèى ïًèîًèٍهٍ يà ïîëَ÷هيèه ٌîلûٍèے يàوàٍèے ىûّè يà مًàôèêه

   return(true);
}
//+------------------------------------------------------------------+
//| شَيêِèے َنàëےهٍ ëèيè‏ ًٍهينà ٌ مًàôèêà.                          |
//+------------------------------------------------------------------+
bool TrendDelete(const long   chart_ID=0,       // ID مًàôèêà
                 const string name="TrendLine") // èىے ëèيèè
{
   //--- ٌلًîٌèى çيà÷هيèه îّèلêè
   ResetLastError();
   //--- َنàëèى ëèيè‏ ًٍهينà
   if (!ObjectDelete(chart_ID,name))
   {
      Print(__FUNCTION__,
            ": يه َنàëîٌü َنàëèٍü ëèيè‏ ًٍهينà! تîن îّèلêè = ",GetLastError());
      return(false);
   }
   //--- ٌَïهّيîه âûïîëيهيèه
   return(true);
}