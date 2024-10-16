///+------------------------------------------------------------------+ 
// FXi 3 Semafor
//+------------------------------------------------------------------+
/*
    Ðèñóåò Ôèáî âååð ïî ïîñëåäíèì òî÷êàì çèãçàãà(Period2)
    SUN+FAN_0.1  ââîäèì  2 ðåæèìà - classic, modern
     Classic - îò ïîñëåäíåãî ÑÔÁ âïðàâî äî ÑÔÌ ñ öåëüþ â áóäóùåì íàéòè êîíåö îòêàòà 
     Modern  - êàê â âåòêå ÍÓÔÀ, ïî äâóì ïîñëåäíèì ÑÔÌ 
    SUN+FAN_0.3 äîáàâëÿåì çàëèâêó ìåæäó óðîâíÿìè 
    0.4 Âðåìÿ íàäî èçìåðÿòü ÁÀÐÀÌÈ èíà÷å íà âûõîäíûõ ñúåçæàåò
*/
#property indicator_chart_window
#property indicator_buffers 6
#property indicator_color1 clrBlue
#property indicator_color2 Maroon
#property indicator_color3 C'255,100,255'
#property indicator_color4 C'255,100,255'
#property indicator_color5 clrDodgerBlue
#property indicator_color6 clrRed



enum modes
{
    Êëàññè÷åñêèé  = 0,
    Íîâûé         = 1
};
//---- input parameters 
extern double     Period1           = 0; 
extern double     Period2           = 34; 
extern double     Period3           = 233;
extern int        Width1            = 3;
extern int        Width2            = 3;
extern int        Width3            = 5;
 
extern int        Symbol_1_Kod      = 158;
extern int        Symbol_2_Kod      = 159;
extern int        Symbol_3_Kod      = 111;
extern string     __                 = "--------- Ôèáî âååð  ---------";
extern bool       DrawFan           = true;           // Ðèñîâàòü âååð
extern double     FiboLevel1        = 13.0;           // Çíà÷åíèÿ óðîâíåé
extern double     FiboLevel2        = 23.0; 
extern double     FiboLevel3        = 38.0; 
extern double     FiboLevel4        = 50.0; 
extern double     FiboLevel5        = 61.8; 
extern double     FiboLevel6        = 76.4; 
extern color      FiboColor1        = clrLime;        //Öâåòà óðîâíåé
extern color      FiboColor2        = clrRed;
extern color      FiboColor3        = clrLime;
extern color      FiboColor4        = clrRoyalBlue;
extern color      FiboColor5        = clrGoldenrod;
extern color      FiboColor6        = clrDarkViolet;
extern bool       UseMonoColor      = false;          // Íå èñïëüçîâàòü ðàñêðàñó óðîâíåé
extern color      MonoColor         = clrBlue;           // Öâåò óðîâíåé ïðèîòñóòñòâèè ðàñêðàñêè
extern int        LevelsWidt        = 1;              // Òîëùèíà óðîâíåé
extern bool       Çàëèâêà           = false;
extern double     Îñâåòëåíèå_Çàëèâêè= 0.9;            // Çíà÷åíèÿ 0...1 ×åì áîëüøå, òåì ñâåòëåå çàëèâêà
extern modes      Ðåæèì_Âååðà       = Íîâûé;          // Ðåæèì èñïîëüçîâàíèÿ âååðà

int Stp=1;
int Dev=1;


extern int BarsCount = 3000;
//+----    mod of  TRO MODIFICATION ------------------------+ 
//extern string _____           ="       Îïîâåùåíèå";
//

//---- buffers 
double FP_BuferUp[], FP_BuferDn[], NP_BuferUp[], NP_BuferDn[], HP_BuferUp[], HP_BuferDn[]; 
double Levels[6];
color  Colors[6];
struct prt
{
   datetime time;
   double   price;
};

struct levProps
{
   double value;
   color  clr;
};

//levProps    FiboLevels[6];
double      FiboLevels[6][2];
prt         FiboPoints[2];
string      MyName = "Sun+Fan_";
int         UninitR;

string      symbol;  
int         digits, period, key  ; 
color       tColor = Yellow ;

//============================================================================
//    init
//============================================================================
int OnInit()   
{ 
   Levels[0] = FiboLevel1/100; Levels[1] = FiboLevel2/100; Levels[2] = FiboLevel3/100; Levels[3] = FiboLevel4/100; Levels[4] = FiboLevel5/100; Levels[5] = FiboLevel6/100; 
   Colors[0] = FiboColor1; Colors[1] = FiboColor2; Colors[2] = FiboColor3; Colors[3] = FiboColor4; Colors[4] = FiboColor5; Colors[5] = FiboColor6;
   
   // v0.3
   FiboLevels[0][0] = FiboLevel1/100; FiboLevels[1][0] = FiboLevel2/100; FiboLevels[2][0] = FiboLevel3/100; 
   FiboLevels[3][0] = FiboLevel4/100; FiboLevels[4][0] = FiboLevel5/100; FiboLevels[5][0] = FiboLevel6/100; 
   
   FiboLevels[0][1] = FiboColor1; FiboLevels[1][1] = FiboColor2; FiboLevels[2][1] = FiboColor3; 
   FiboLevels[3][1] = FiboColor4; FiboLevels[4][1] = FiboColor5; FiboLevels[5][1] = FiboColor6; 
   
   ArraySort(FiboLevels,WHOLE_ARRAY, 0, MODE_DESCEND);
   
  // for( int i=0; i<=5; i++)
  // Print(" i = ", i, " FiboLevels[i].value = ", FiboLevels[i].value);
   
   
   DelMyObj(MyName); 
   
   period       = Period() ;     
   symbol       =  Symbol() ;
   digits       =  Digits ;  
   key=0; 
//+------------------------------------------------------------------+   
   if (Period1>0)   {
     SetIndexBuffer(0,FP_BuferUp);   SetIndexStyle(0,DRAW_ARROW,EMPTY,Width1);   SetIndexArrow(0,Symbol_1_Kod);   SetIndexEmptyValue(0,00);  SetIndexLabel(0,"FastUp");
     SetIndexBuffer(1,FP_BuferDn);   SetIndexStyle(1,DRAW_ARROW,EMPTY,Width1);   SetIndexArrow(1,Symbol_1_Kod);   SetIndexEmptyValue(1,00);  SetIndexLabel(1,"FastDn");
   }   
   if (Period2>0)   {
     SetIndexBuffer(2,NP_BuferUp);   SetIndexStyle(2,DRAW_ARROW,EMPTY,Width2);   SetIndexArrow(2,Symbol_2_Kod);   SetIndexEmptyValue(2,00);  SetIndexLabel(2,"MiddleUp");
     SetIndexBuffer(3,NP_BuferDn);   SetIndexStyle(3,DRAW_ARROW,EMPTY,Width2);   SetIndexArrow(3,Symbol_2_Kod);   SetIndexEmptyValue(3,00);  SetIndexLabel(3,"MiddleDn");
   }
   if (Period3>0)   {
     SetIndexBuffer(4,HP_BuferUp);   SetIndexStyle(4,DRAW_ARROW,EMPTY,Width3);   SetIndexArrow(4,Symbol_3_Kod);   SetIndexEmptyValue(4,00);  SetIndexLabel(4,"SlowUp");
     SetIndexBuffer(5,HP_BuferDn);   SetIndexStyle(5,DRAW_ARROW,EMPTY,Width3);   SetIndexArrow(5,Symbol_3_Kod);   SetIndexEmptyValue(5,00);  SetIndexLabel(5,"SlowDn");
   }
   return(0); 
  } 
//============================================================================
//    deinit
//============================================================================
int deinit()   
{   
   UninitR = UninitializeReason() ;
   DelMyObj(MyName); 
return(0);   
} 
//+------------------------------------------------------------------+ 
int start()   

{ 
   ArraySort(FiboLevels,WHOLE_ARRAY, 0, MODE_DESCEND);
   ArraySort(Levels,WHOLE_ARRAY, 0, MODE_DESCEND);
   //for( int i=0; i<=5; i++)
   //Print(" i = ", i, " FiboLevels[i].value = ", FiboLevels[i][0]);
  
   
   if (Period1>0) CountZZ(FP_BuferUp,FP_BuferDn,Period1,Dev,Stp);
   if (Period2>0) CountZZ(NP_BuferUp,NP_BuferDn,Period2,Dev,Stp);
   if (Period3>0) CountZZ(HP_BuferUp,HP_BuferDn,Period3,Dev,Stp);

   /*
   if ( ShowAlert  )    
   {     
     if(key!=Time[0])
     {
           if( HP_BuferUp[0] != 0 )   Alert(" Íèæíåå Ñîëíûøêî íà  " + symbol+"   "+ Period()+ "   íà öåíå  "+ DoubleToStr(Close[0] ,digits));
           if( HP_BuferDn[0] != 0 )   Alert(" Âåðõíåå Ñîëíûøêî íà  "+ symbol+"   "+ Period()+ "   íà öåíå  "+ DoubleToStr(Close[0] ,digits));
           if(Period2>=34)  
           {
             if( NP_BuferUp[0] != 0 && HP_BuferUp[0] == 0)   Alert(" Íèæíÿÿ Òî÷êà íà  " + symbol+"   "+ Period()+ "   íà öåíå  "+ DoubleToStr(Close[0] ,digits));
             if( NP_BuferDn[0] != 0 && HP_BuferDn[0] == 0)   Alert(" Âåðõíÿÿ Òî÷êà íà  "+ symbol+"   "+ Period()+ "   íà öåíå  "+ DoubleToStr(Close[0] ,digits));
           }
      }
   }
   */
   if(DrawFan) FiboFan();
   key=Time[0];   
 
   return(0);
}
//============================================================================
//    FiboFan
//============================================================================
void FiboFan()
{
   int i, cnt;
   int iBig = -1;
   int iMid = -1;
   double prMid, prBig;
   FiboPoints[0].price = 0; FiboPoints[1].price = 0;
   i = 0;
   cnt = 0;
   
   if(Ðåæèì_Âååðà == Íîâûé)
   {
         while(true)
         {
            if(NP_BuferUp[i] !=0 || NP_BuferDn[i] !=0)
            {
               FiboPoints[cnt].time = Time[i]; 
               if(NP_BuferUp[i] !=0)
                  FiboPoints[cnt].price = NP_BuferUp[i]; 
               if(NP_BuferDn[i] !=0)
                  FiboPoints[cnt].price = NP_BuferDn[i]; 
               cnt++;
            }
            if(cnt > 1) break;
            
            i++;
            if (i>=Bars-1 || i>=BarsCount) break;
         }
   }
   
   if(Ðåæèì_Âååðà == Êëàññè÷åñêèé)
   {
         while(true)
         {
            if(HP_BuferUp[i] !=0 || HP_BuferDn[i] !=0) 
            { 
                  iBig = i; 
                 
                  if(HP_BuferUp[i] !=0) prBig = HP_BuferUp[i];
                  if(HP_BuferDn[i] !=0) prBig = HP_BuferDn[i];
                   break; 
            }
                          
            if(NP_BuferUp[i] !=0 || NP_BuferDn[i] !=0)
            {
               iMid = i;
               if(NP_BuferUp[i] !=0) prMid = NP_BuferUp[i];
               if(NP_BuferDn[i] !=0) prMid = NP_BuferDn[i]; 
               
            }
            i++;
            if (i>=Bars-1 || i>=BarsCount) break;
         }
         if( iMid!= -1 && iBig != -1 && iBig > iMid)
         {
           FiboPoints[1].time = Time[iBig];
           FiboPoints[1].price = prBig;
           
           FiboPoints[0].time = Time[iMid];
           FiboPoints[0].price = prMid;
         
         }
         
         
   }
  // Print(" price0 = ", FiboPoints[0].price, "   ",  " price1 = ", FiboPoints[1].price, "   ",  " time0 = ",TimeToString(FiboPoints[0].time), "   ",  " time1 = ", TimeToString(FiboPoints[1].time), "   "); 
   
   if(FiboPoints[0].price != 0 && FiboPoints[1].price != 0)
      DrawFan(FiboPoints[0],FiboPoints[1]);
   else
      DelMyObj(MyName + "FiboFan_");

}
//============================================================================
//    DrawFan
//============================================================================
void DrawFan(prt& point0, prt& point1)
{
   string name; 
   int levelsCnt, i;
    DelMyObj(MyName + "FiboFan_");
    
    int  widths[6];
    ENUM_LINE_STYLE  styles[6];
    
    levelsCnt = ArraySize(Levels);
    long current_chart_id=ChartID();

      for(i = 0; i<levelsCnt; i++)
      {
         name = MyName + "FiboFan_" + IntegerToString(i)+ "_" + TimeToString( point1.time);  // Òî÷êà [0] ïðàâåå, ÷åì [1]
         ObjectCreate(name,OBJ_FIBOFAN, 0, point1.time, point1.price, point0.time, point0.price);
         ObjectSetInteger(0,name,OBJPROP_SELECTABLE,false);

         ObjectSet(name, OBJPROP_FIBOLEVELS, 1);
         ObjectSetDouble(0,name,OBJPROP_LEVELVALUE,0,FiboLevels[i][0]);
         if(!UseMonoColor)
            ObjectSetInteger(0,name,OBJPROP_LEVELCOLOR,0,FiboLevels[i][1]);
         else
            ObjectSetInteger(0,name,OBJPROP_LEVELCOLOR,0,MonoColor);
         ObjectSetInteger(0,name,OBJPROP_LEVELWIDTH,0,LevelsWidt);
         ObjectSetString(0,name,OBJPROP_LEVELTEXT,0,DoubleToString(100*FiboLevels[i][0],1));
      }
   
      if(Çàëèâêà && !UseMonoColor) Triangles(FiboPoints[0],FiboPoints[1]);
   
   
   ChartRedraw();
   Sleep(100);

  

}

//============================================================================
//    Triangles
//============================================================================
void Triangles(prt& point0, prt& point1)
{
   int levelsCnt, i;
    string name; 
    DelMyObj(MyName + "FiboTriangle_");
   double Dbase, Tbase, K, D, T;
   double k[6], p[6];
   double dir;
   datetime timL;
   int bar0, bar1;
   int TimeR;
   color clr;
   levelsCnt = ArraySize(Levels);
   if (point0.price > point1.price) dir = 1;
   if (point0.price < point1.price) dir = -1;
   
   bar0 = iBarShift(NULL, 0, point0.time, true);
   bar1 = iBarShift(NULL, 0, point1.time, true);
   
   Dbase = MathAbs(point0.price - point1.price);
   Tbase = bar1 - bar0;;
   K = Dbase/Tbase;
   timL = Time[0] + Period()*60*10;
   TimeR = (Time[0] - point1.time) + Period()*60*10;  // òðåóãîëüíèêè òÿíåì íà 10 áàðîâ ëåâåå íóëåâîãî áàðà
   T = bar1 + 10;
   D = T*K;
    for(i = 0; i<levelsCnt; i++)
    {
        if(FiboLevels[i][0] != 0)
        {
            k[i] = (Dbase - Dbase*FiboLevels[i][0])/Tbase; 
            p[i] = point1.price + k[i]*T*dir;                   // ïðàâûå òî÷êè òðåóãîëüíèêîâ
        }    
    }
    for(i = 0; i<levelsCnt; i++)
    {
        name = MyName + "FiboTriangle_" + IntegerToString(i)+ "_" + TimeToString( point1.time); 
        
        if(p[i] != 0 && p[i+1] !=0)
        ObjectCreate(name,OBJ_TRIANGLE, 0, point1.time, point1.price, point1.time+TimeR, p[i] , point1.time+TimeR, p[i+1]  );
        ObjectSetInteger(0,name,OBJPROP_SELECTABLE,false);
        clr = ModColor( FiboLevels[i][1]);
        //ObjectSetInteger(0,name,OBJPROP_COLOR,FiboLevels[i][1]);
        ObjectSetInteger(0,name,OBJPROP_COLOR,clr);
    }
    //Print(" T = ", TimeToString(T));
         
}
//============================================================================
//    ModColor
//============================================================================
color ModColor(double clr)
{
   double k = 0.9;
   uchar alfa=0x80;
   string strClr = ColorToString(clr);
   string strRed,strGreen, strBlue;
   string strRed2,strGreen2, strBlue2;
   int pos;
   int cRed, cGreen, cBlue;
   color val;
   //Print( " strClr = ",  strClr );
   
   //return(ColorToARGB(clr,alfa));
   
   if(Îñâåòëåíèå_Çàëèâêè < 0 || Îñâåòëåíèå_Çàëèâêè>1)
      k = 0.9; 
   else
      k = Îñâåòëåíèå_Çàëèâêè;
   
   pos = StringFind(strClr, ",", 0);
   strRed = StringSubstr(strClr, 0, pos);
   strClr = StringSubstr(strClr, pos+1);
   pos = StringFind(strClr, ",", 0);
   strGreen = StringSubstr(strClr, 0, pos);
   strClr = StringSubstr(strClr, pos+1);
   strBlue = strClr;
   cRed      = StrToInteger(strRed);
   cGreen    = StrToInteger(strGreen);
   cBlue     = StrToInteger(strBlue);  
   
   cRed = cRed + (255-cRed)*k;
   cGreen = cGreen + (255-cGreen)*k;
   cBlue = cBlue + (255-cBlue)*k;
   
   strRed2     = IntegerToString(cRed);
   strGreen2   = IntegerToString(cGreen);
   strBlue2    = IntegerToString(cBlue);
   
   val = StringToColor(strRed2 + "," + strGreen2 + "," + strBlue2);
   return(val);
   //Print( " strRed = ",  strRed, " strGreen = ",  strGreen, " strBlue = ",  strBlue );
   
   
}
//+------------------------------------------------------------------+
//| Çàäàåò êîëè÷åñòâî óðîâíåé è èõ ïàðàìåòðû                         |
//+------------------------------------------------------------------+
bool FiboFanLevelsSet(int             levels,         // êîëè÷åñòâî ëèíèé óðîâíÿ
                      double          &values[],      // çíà÷åíèÿ ëèíèé óðîâíÿ
                      color           &colors[],      // öâåò ëèíèé óðîâíÿ
                      ENUM_LINE_STYLE &styles[],      // ñòèëü ëèíèé óðîâíÿ
                      int             &widths[],      // òîëùèíà ëèíèé óðîâíÿ
                      const long      chart_ID=0,     // ID ãðàôèêà
                      const string    name="FiboFan") // èìÿ âååðà
  {
//--- ïðîâåðèì ðàçìåðû ìàññèâîâ
   if(levels!=ArraySize(colors) || levels!=ArraySize(styles) ||
      levels!=ArraySize(widths) || levels!=ArraySize(widths))
     {
      Print(__FUNCTION__,": äëèíà ìàññèâà íå ñîîòâåòñòâóåò êîëè÷åñòâó óðîâíåé, îøèáêà!");
      return(false);
     }
//--- óñòàíîâèì êîëè÷åñòâî óðîâíåé
   ObjectSetInteger(chart_ID,name,OBJPROP_LEVELS,levels);
//--- óñòàíîâèì ñâîéñòâà óðîâíåé â öèêëå
   for(int i=0;i<levels;i++)
     {
      //--- çíà÷åíèå óðîâíÿ
      ObjectSetDouble(chart_ID,name,OBJPROP_LEVELVALUE,i,values[i]);
      //--- öâåò óðîâíÿ
      ObjectSetInteger(chart_ID,name,OBJPROP_LEVELCOLOR,i,colors[i]);
      //--- ñòèëü óðîâíÿ
      ObjectSetInteger(chart_ID,name,OBJPROP_LEVELSTYLE,i,styles[i]);
      //--- òîëùèíà óðîâíÿ
      ObjectSetInteger(chart_ID,name,OBJPROP_LEVELWIDTH,i,widths[i]);
      //--- îïèñàíèå óðîâíÿ
      ObjectSetString(chart_ID,name,OBJPROP_LEVELTEXT,i,DoubleToString(100*values[i],1));
     }
//--- óñïåøíîå âûïîëíåíèå
   return(true);
  }




int CountZZ( double& ExtMapBuffer[], double& ExtMapBuffer2[], int ExtDepth, int ExtDeviation, int ExtBackstep )
  {
   int    shift, back,lasthighpos,lastlowpos, limit;
   double val,res;
   double curlow,curhigh,lasthigh,lastlow;
   limit=Bars-ExtDepth;
   if(limit>BarsCount) limit=BarsCount;   
   for(shift=limit; shift>=0; shift--)
     {
      val=Low[Lowest(NULL,0,MODE_LOW,ExtDepth,shift)];
      if(val==lastlow) val=00;
      else 
        { 
         lastlow=val; 
         if((Low[shift]-val)>(ExtDeviation*Point)) val=00;
         else
           {
            for(back=1; back<=ExtBackstep; back++)
              {
               res=ExtMapBuffer[shift+back];
               if((res!=0)&&(res>val)) ExtMapBuffer[shift+back]=00; 
              }
           }
        } 
        
          ExtMapBuffer[shift]=val;
      //--- high
      val=High[Highest(NULL,0,MODE_HIGH,ExtDepth,shift)];
      if(val==lasthigh) val=00;
      else 
        {
         lasthigh=val;
         if((val-High[shift])>(ExtDeviation*Point)) val=00;
         else
           {
            for(back=1; back<=ExtBackstep; back++)
              {
               res=ExtMapBuffer2[shift+back];
               if((res!=0)&&(res<val)) ExtMapBuffer2[shift+back]=00; 
              } 
           }
        }
      ExtMapBuffer2[shift]=val;
     }
   // final cutting 
   lasthigh=-1; lasthighpos=-1;
   lastlow=-1;  lastlowpos=-1;

   for(shift=limit; shift>=0; shift--)
     {
      curlow=ExtMapBuffer[shift];
      curhigh=ExtMapBuffer2[shift];
      if((curlow==0)&&(curhigh==0)) continue;
      //---
      if(curhigh!=0)
        {
         if(lasthigh>0) 
           {
            if(lasthigh<curhigh) ExtMapBuffer2[lasthighpos]=0;
            else ExtMapBuffer2[shift]=0;
           }
         //---
         if(lasthigh<curhigh || lasthigh<0)
           {
            lasthigh=curhigh;
            lasthighpos=shift;
           }
         lastlow=-1;
        }
      //----
      if(curlow!=0)
        {
         if(lastlow>0)
           {
            if(lastlow>curlow) ExtMapBuffer[lastlowpos]=0;
            else ExtMapBuffer[shift]=0;
           }
         //---
         if((curlow<lastlow)||(lastlow<0))
           {
            lastlow=curlow;
            lastlowpos=shift;
           } 
         lasthigh=-1;
        }
     }
  
   for(shift=limit; shift>=0; shift--)
     {
      if(shift>=limit) ExtMapBuffer[shift]=00;
      else
        {
         res=ExtMapBuffer2[shift];
         if(res!=00) ExtMapBuffer2[shift]=res;
        }
     }
   return(0);
 }
//+------------------------------------------------------------------+   

//===============================================================================
//   Ôóíêöèÿ óäàëÿåò îáúåêòû, ñîçäàííûå â ýòîì èíäþêå
//   àðãóìåíò- íà÷àëî èìåíè
//===============================================================================
void DelMyObj(string myName)
{
int pos;
string objName;
int    obj_total=ObjectsTotal();
         
      for(int i=obj_total-1;i>=0; i--)
      {
         objName = ObjectName(i);
         pos = StringFind(objName, myName, 0);
         if(pos!=-1) 
         {
            ObjectDelete(objName);
         }
      }
//return(0);
}

