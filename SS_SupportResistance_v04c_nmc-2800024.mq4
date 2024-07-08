//+------------------------------------------------------------------+
//|                                         SS_SupportResistance.mq4 |
//|                                  Copyright � 2012, Andrew Sumner |
//|                                                                  |
//| You are allowed to copy and distribute this file as you see fit, |
//| and modify it to suit your purposes on the following condition:- |
//|                                                                  |
//| 1. You must charge no money for this indicator or any derivative |
//|    that you create from it.  It was released freely, please keep |
//|    it free.                                                      |
//|                                                                  |
//| 2. If you make alterations, please don't release a new version   |
//|    using the name "SS_SupportResistance".  Either release it     |
//|    using a new name, or contact me about getting your changes    |
//|    included in my indicator (andrewsumner@yahoo.com).            |
//|                                                                  |
//| 3. If you make a killer EA based on this indicator, please do me |
//|    a favour and send me a copy :)                                |
//|                                                                  |
//| My thanks to Enrico "brax64" Carpita for his help in completing  |
//| the zone.show.info text positioning code.                        |
//|                                                                  |
//| 08/07/2012 v04c: added email capability - brax64 at forex-tsd    |
//+------------------------------------------------------------------+


#property copyright "Copyright � 2012 Andrew Sumner"
#property link      ""

#property indicator_chart_window
#property indicator_buffers 4
#property indicator_color1 Red
#property indicator_color2 Red
#property indicator_color3 DodgerBlue
#property indicator_color4 DodgerBlue

extern int BackLimit   = 300;
extern int TimeFrame   = 0;
extern string TimeString  = "0=Current, 60=H1, 240=H4, 1440=Day, 10080=Week, 43200=Month";

extern color color_support_weak     = DarkSlateGray;
extern color color_support_untested = SeaGreen;
extern color color_support_verified = Green;
extern color color_support_proven   = LimeGreen;
extern color color_support_turncoat = OliveDrab;
extern color color_resist_weak      = Indigo;
extern color color_resist_untested  = Orchid;
extern color color_resist_verified  = Crimson;
extern color color_resist_proven    = Red;
extern color color_resist_turncoat  = DarkOrange;

extern bool zone_show_weak  = true;
extern double zone_fuzzfactor = 0.25;
extern bool zone_solid = true;
extern int zone_linewidth = 1;
extern int zone_style = 0;
extern bool zone_show_info    = true;
extern int zone_label_shift  = 5;
extern bool zone_show_alerts  = false;
extern bool zone_alert_popups = true;
extern bool zone_alert_sounds = true;
extern bool send_email        = false;
extern int zone_alert_waitseconds = 300; 
extern bool zone_merge = true;
extern bool zone_extend = true;

extern bool fractals_show = false;
extern double fractal_fast_factor = 3.0;
extern double fractal_slow_factor = 6.0;
extern bool SetGlobals = true;

double FastDnPts[], FastUpPts[];
double SlowDnPts[], SlowUpPts[];

double zone_hi[1000], zone_lo[1000];
int    zone_start[1000], zone_hits[1000], zone_type[1000], zone_strength[1000], zone_count = 0;
bool   zone_turn[1000];

#define ZONE_SUPPORT 1
#define ZONE_RESIST  2

#define ZONE_WEAK      0
#define ZONE_TURNCOAT  1
#define ZONE_UNTESTED  2
#define ZONE_VERIFIED  3
#define ZONE_PROVEN    4

#define UP_POINT 1
#define DN_POINT -1

int time_offset = 0;

int init()
{
   IndicatorBuffers(4);

   SetIndexBuffer(0, SlowDnPts);
   SetIndexBuffer(1, SlowUpPts);
   SetIndexBuffer(2, FastDnPts);
   SetIndexBuffer(3, FastUpPts);

   if (fractals_show == true)
   {
      SetIndexStyle(0, DRAW_ARROW, 0, 3);
      SetIndexStyle(1, DRAW_ARROW, 0, 3);
      SetIndexStyle(2, DRAW_ARROW, 0, 1);
      SetIndexStyle(3, DRAW_ARROW, 0, 1);
      SetIndexArrow(0, 218);
      SetIndexArrow(1, 217);
      SetIndexArrow(2, 218);
      SetIndexArrow(3, 217);
   }
   else
   {
      SetIndexStyle(0, DRAW_NONE);
      SetIndexStyle(1, DRAW_NONE);
      SetIndexStyle(2, DRAW_NONE);
      SetIndexStyle(3, DRAW_NONE);
   }

   if (TimeFrame != 1 && TimeFrame != 5 && TimeFrame != 15 &&
       TimeFrame != 60 && TimeFrame != 240 && TimeFrame != 1440 &&
       TimeFrame != 10080 && TimeFrame != 43200)
      TimeFrame = 0;

   if (TimeFrame < Period())
      TimeFrame = Period();

   return(0);
}

int deinit()
{
   DeleteZones();
   DeleteGlobalVars();
   return(0);
}

int start()
{
   if (NewBar() == true)
   {
      int old_zone_count = zone_count;

      FastFractals();
      SlowFractals();
      DeleteZones();
      FindZones();
      DrawZones();
      if (zone_count < old_zone_count)
         DeleteOldGlobalVars(old_zone_count);
   }

   if (zone_show_info == true)
   {
      for (int i=0; i<zone_count; i++)
      {
         string lbl;
         if (zone_strength[i] == ZONE_PROVEN)
            lbl = "����������";
         else if (zone_strength[i] == ZONE_VERIFIED)
            lbl = "�����������";
         else if (zone_strength[i] == ZONE_UNTESTED)
            lbl = "�� �������������";
         else if (zone_strength[i] == ZONE_TURNCOAT)
            lbl = "�����������";
         else
            lbl = "������";

         if (zone_type[i] == ZONE_SUPPORT)
            lbl = lbl + " Support";
         else
            lbl = lbl + " Resistance";

         if (zone_hits[i] > 0 && zone_strength[i] > ZONE_UNTESTED)
         {
            if (zone_hits[i] == 1)
               lbl = lbl + ", Test Count=" + zone_hits[i];
            else
               lbl = lbl + ", Test Count=" + zone_hits[i];
         }

         int adjust_hpos;
         int wbpc = WindowBarsPerChart();
         int k;
         
         k = Period() * 60 + (20 + StringLen(lbl));
         
         if (wbpc < 80)  
            adjust_hpos = Time[0] + k * 4;
         else if (wbpc < 125)  
            adjust_hpos = Time[0] + k * 8;
         else if (wbpc < 250)
            adjust_hpos = Time[0] + k * 15;
         else if (wbpc < 480)
            adjust_hpos = Time[0] + k * 29;
         else if (wbpc < 950)
            adjust_hpos = Time[0] + k * 58;
         else
            adjust_hpos = Time[0] + k * 115;
         
         //

         int shift = k * zone_label_shift;
         double vpos = zone_hi[i] - (zone_hi[i] - zone_lo[i]) / 2;

         string s = "SSSR#"+i+"LBL";
         ObjectCreate(s, OBJ_TEXT, 0, 0, 0);
         ObjectSet(s, OBJPROP_TIME1, adjust_hpos + shift);
         ObjectSet(s, OBJPROP_PRICE1, vpos);
         ObjectSetText(s, StringRightPad(lbl, 36, " "), 8, "Courier New",clrBlack);
      }
   }

   CheckAlerts();

   return(0);
}

void CheckAlerts()
{
   static int lastalert = 0;

   if (zone_show_alerts == false)
      return;

   if (Time[0] - lastalert > zone_alert_waitseconds)
      if (CheckEntryAlerts() == true)
         lastalert = Time[0];
}

bool CheckEntryAlerts()
{
   // check for entries
   for (int i=0; i<zone_count; i++)
   {
      if (Close[0] >= zone_lo[i] && Close[0] < zone_hi[i])
      {
         if (zone_show_alerts == true)
         {
            if (zone_alert_popups == true)
            {
               if (zone_type[i] == ZONE_SUPPORT)
                  Alert(Symbol() + TimeFrameToString(TimeFrame) + ": Support Zone Entered");
               else
                  Alert(Symbol() + TimeFrameToString(TimeFrame) + ": Resistance Zone Entered");
            }

            if (zone_alert_sounds == true)
               PlaySound("alert.wav");
         }
         
         if (send_email == true)
         {
            string dir = "";
            string msg = StringConcatenate(Symbol(), "-", TimeFrameToString(TimeFrame), " at ", TimeToStr(Time[0], TIME_DATE|TIME_SECONDS),
                                           " ", dir, " Zone Entered");
            if (zone_type[i] == ZONE_SUPPORT)
            {
               dir = "Support";
               SendMail("SS_SupRes_v04c alert", msg);
            }
            else
            {
               dir = "Resistance";
               SendMail("SS_SupRes_v04c alert", msg);
            }
         }
         return(true);
      }
   }

   return(false);
}

void DeleteGlobalVars()
{
   if (SetGlobals == false)
      return;

   GlobalVariableDel("SSSR_Count_"+Symbol()+TimeFrame);
   GlobalVariableDel("SSSR_Updated_"+Symbol()+TimeFrame);

   int old_count = zone_count;
   zone_count = 0;
   DeleteOldGlobalVars(old_count);
}

void DeleteOldGlobalVars(int old_count)
{
   if (SetGlobals == false)
      return;

   for (int i=zone_count; i<old_count; i++)
   {
      GlobalVariableDel("SSSR_HI_"+Symbol()+TimeFrame+i);
      GlobalVariableDel("SSSR_LO_"+Symbol()+TimeFrame+i);
      GlobalVariableDel("SSSR_HITS_"+Symbol()+TimeFrame+i);
      GlobalVariableDel("SSSR_STRENGTH_"+Symbol()+TimeFrame+i);
      GlobalVariableDel("SSSR_AGE_"+Symbol()+TimeFrame+i);
   }
}

void FindZones()
{
   int i, j, shift, bustcount=0, testcount = 0;
   double hival, loval;
   bool turned = false, hasturned = false;

   double temp_hi[1000], temp_lo[1000];
   int    temp_start[1000], temp_hits[1000], temp_strength[1000], temp_count = 0;
   bool   temp_turn[1000], temp_merge[1000];
   int merge1[1000], merge2[1000], merge_count = 0;

   // iterate through zones from oldest to youngest (ignore recent 5 bars),
   // finding those that have survived through to the present...
   for (shift=MathMin(iBars(NULL, TimeFrame)-1, BackLimit); shift>5; shift--)
   {
      double atr = iATR(NULL, TimeFrame, 7, shift);
      double fu = atr/2 * zone_fuzzfactor;
      bool isWeak;
      bool touchOk = false;
      bool isBust = false;
      double close = iClose(NULL, TimeFrame, shift);
      double high  = iHigh(NULL, TimeFrame, shift);
      double low   = iLow(NULL, TimeFrame, shift);
      double hi_i;
      double lo_i;

      if (FastUpPts[shift] > 0.001)
      {
         // a zigzag high point
         isWeak = true;
         if (SlowUpPts[shift] > 0.001)
            isWeak = false;

         hival = high;
         if (zone_extend == true)
            hival += fu;

         loval = MathMax(MathMin(close, high-fu), high-fu*2);
         turned = false;
         hasturned = false;
         isBust = false;

         bustcount = 0;
         testcount = 0;

         for (i=shift-1; i>=0; i--)
         {
            hi_i = iHigh(NULL, TimeFrame, i);
            lo_i = iLow(NULL, TimeFrame, i);

            if ((turned == false && FastUpPts[i] >= loval && FastUpPts[i] <= hival) ||
                (turned == true && FastDnPts[i] <= hival && FastDnPts[i] >= loval))
            {
               // Potential touch, just make sure its been 10+candles since the prev one
               touchOk = true;
               for (j=i+1; j<i+11; j++)
               {
                  if ((turned == false && FastUpPts[j] >= loval && FastUpPts[j] <= hival) ||
                      (turned == true && FastDnPts[j] <= hival && FastDnPts[j] >= loval))
                  {
                     touchOk = false;
                     break;
                  }
               }

               if (touchOk == true)
               {
                  // we have a touch.  If its been busted once, remove bustcount
                  // as we know this level is still valid & has just switched sides
                  bustcount = 0;
                  testcount++;
               }
            }

            if ((turned == false && hi_i > hival) ||
                (turned == true && lo_i < loval))
            {
               // this level has been busted at least once
               bustcount++;

               if (bustcount > 1 || isWeak == true)
               {
                  // busted twice or more
                  isBust = true;
                  break;
               }

               if (turned == true)
                  turned = false;
               else if (turned == false)
                  turned = true;

               hasturned = true;

               // forget previous hits
               testcount = 0;
            }
         }

         if (isBust == false)
         {
            // level is still valid, add to our list
            temp_hi[temp_count] = hival;
            temp_lo[temp_count] = loval;
            temp_turn[temp_count] = hasturned;
            temp_hits[temp_count] = testcount;
            temp_start[temp_count] = shift;
            temp_merge[temp_count] = false;
            
            if (testcount > 3)
               temp_strength[temp_count] = ZONE_PROVEN;
            else if (testcount > 0)
               temp_strength[temp_count] = ZONE_VERIFIED;
            else if (hasturned == true)
               temp_strength[temp_count] = ZONE_TURNCOAT;
            else if (isWeak == false)
               temp_strength[temp_count] = ZONE_UNTESTED;
            else
               temp_strength[temp_count] = ZONE_WEAK;

            temp_count++;
         }
      }
      else if (FastDnPts[shift] > 0.001)
      {
         // a zigzag low point
         isWeak = true;
         if (SlowDnPts[shift] > 0.001)
            isWeak = false;

         loval = low;
         if (zone_extend == true)
            loval -= fu;

         hival = MathMin(MathMax(close, low+fu), low+fu*2);
         turned = false;
         hasturned = false;

         bustcount = 0;
         testcount = 0;
         isBust = false;

         for (i=shift-1; i>=0; i--)
         {
            hi_i = iHigh(NULL, TimeFrame, i);
            lo_i = iLow(NULL, TimeFrame, i);

            if ((turned == true && FastUpPts[i] >= loval && FastUpPts[i] <= hival) ||
                (turned == false && FastDnPts[i] <= hival && FastDnPts[i] >= loval))
            {
               // Potential touch, just make sure its been 10+candles since the prev one
               touchOk = true;
               for (j=i+1; j<i+11; j++)
               {
                  if ((turned == true && FastUpPts[j] >= loval && FastUpPts[j] <= hival) ||
                      (turned == false && FastDnPts[j] <= hival && FastDnPts[j] >= loval))
                  {
                     touchOk = false;
                     break;
                  }
               }

               if (touchOk == true)
               {
                  // we have a touch.  If its been busted once, remove bustcount
                  // as we know this level is still valid & has just switched sides
                  bustcount = 0;
                  testcount++;
               }
            }

            if ((turned == true && hi_i > hival) ||
                (turned == false && lo_i < loval))
            {
               // this level has been busted at least once
               bustcount++;

               if (bustcount > 1 || isWeak == true)
               {
                  // busted twice or more
                  isBust = true;
                  break;
               }

               if (turned == true)
                  turned = false;
               else if (turned == false)
                  turned = true;

               hasturned = true;

               // forget previous hits
               testcount = 0;
            }
         }

         if (isBust == false)
         {
            // level is still valid, add to our list
            temp_hi[temp_count] = hival;
            temp_lo[temp_count] = loval;
            temp_turn[temp_count] = hasturned;
            temp_hits[temp_count] = testcount;
            temp_start[temp_count] = shift;
            temp_merge[temp_count] = false;

            if (testcount > 3)
               temp_strength[temp_count] = ZONE_PROVEN;
            else if (testcount > 0)
               temp_strength[temp_count] = ZONE_VERIFIED;
            else if (hasturned == true)
               temp_strength[temp_count] = ZONE_TURNCOAT;
            else if (isWeak == false)
               temp_strength[temp_count] = ZONE_UNTESTED;
            else
               temp_strength[temp_count] = ZONE_WEAK;

            temp_count++;
         }
      }
   }

   // look for overlapping zones...
   if (zone_merge == true)
   {
      merge_count = 1;
      int iterations = 0;
      while (merge_count > 0 && iterations < 3)
      {
         merge_count = 0;
         iterations++;

         for (i = 0; i < temp_count; i++)
            temp_merge[i] = false;

         for (i = 0; i < temp_count-1; i++)
         {
            if (temp_hits[i] == -1 || temp_merge[j] == true)
               continue;

            for (j = i+1; j < temp_count; j++)
            {
               if (temp_hits[j] == -1 || temp_merge[j] == true)
                  continue;

               if ((temp_hi[i] >= temp_lo[j] && temp_hi[i] <= temp_hi[j]) ||
                   (temp_lo[i] <= temp_hi[j] && temp_lo[i] >= temp_lo[j]) ||
                   (temp_hi[j] >= temp_lo[i] && temp_hi[j] <= temp_hi[i]) ||
                   (temp_lo[j] <= temp_hi[i] && temp_lo[j] >= temp_lo[i]))
               {
                  merge1[merge_count] = i;
                  merge2[merge_count] = j;
                  temp_merge[i] = true;
                  temp_merge[j] = true;
                  merge_count++;
               }
            }
         }

         // ... and merge them ...
         for (i=0; i<merge_count; i++)
         {
            int target = merge1[i];
            int source = merge2[i];

            temp_hi[target] = MathMax(temp_hi[target], temp_hi[source]);
            temp_lo[target] = MathMin(temp_lo[target], temp_lo[source]);
            temp_hits[target] += temp_hits[source];
            temp_start[target] = MathMax(temp_start[target], temp_start[source]);
            temp_strength[target] = MathMax(temp_strength[target], temp_strength[source]);
            if (temp_hits[target] > 3)
               temp_strength[target] = ZONE_PROVEN;

            if (temp_hits[target] == 0 && temp_turn[target] == false)
            {
               temp_hits[target] = 1;
               if (temp_strength[target] < ZONE_VERIFIED)
                  temp_strength[target] = ZONE_VERIFIED;
            }

            if (temp_turn[target] == false || temp_turn[source] == false)
               temp_turn[target] = false;
            if (temp_turn[target] == true)
               temp_hits[target] = 0;

            temp_hits[source] = -1;
         }
      }
   }

   // copy the remaining list into our official zones arrays
   zone_count = 0;
   for (i=0; i<temp_count; i++)
   {
      if (temp_hits[i] >= 0 && zone_count < 1000)
      {
         zone_hi[zone_count]       = temp_hi[i];
         zone_lo[zone_count]       = temp_lo[i];
         zone_hits[zone_count]     = temp_hits[i];
         zone_turn[zone_count]     = temp_turn[i];
         zone_start[zone_count]    = temp_start[i];
         zone_strength[zone_count] = temp_strength[i];
         
         if (zone_hi[zone_count] < Close[4])
            zone_type[zone_count] = ZONE_SUPPORT;
         else if (zone_lo[zone_count] > Close[4])
            zone_type[zone_count] = ZONE_RESIST;
         else
         {
            for (j=5; j<1000; j++)
            {
               if (iClose(NULL, TimeFrame, j) < zone_lo[zone_count])
               {
                  zone_type[zone_count] = ZONE_RESIST;
                  break;
               }
               else if (iClose(NULL, TimeFrame, j) > zone_hi[zone_count])
               {
                  zone_type[zone_count] = ZONE_SUPPORT;
                  break;
               }
            }

            if (j == 1000)
               zone_type[zone_count] = ZONE_SUPPORT;
         }

         zone_count++;
      }
   }
}

void DrawZones()
{
   if (SetGlobals == true)
   {
      GlobalVariableSet("SSSR_Count_"+Symbol()+TimeFrame, zone_count);
      GlobalVariableSet("SSSR_Updated_"+Symbol()+TimeFrame, TimeCurrent());
   }

   for (int i=0; i<zone_count; i++)
   {
      if (zone_strength[i] == ZONE_WEAK && zone_show_weak == false)
         continue;

      string s = "SSSR#"+i+" Strength=";
      if (zone_strength[i] == ZONE_PROVEN)
         s = s + "Proven, Test Count=" + zone_hits[i];
      else if (zone_strength[i] == ZONE_VERIFIED)
         s = s + "Verified, Test Count=" + zone_hits[i];
      else if (zone_strength[i] == ZONE_UNTESTED)
         s = s + "Untested";
      else if (zone_strength[i] == ZONE_TURNCOAT)
         s = s + "Turncoat";
      else
         s = s + "Weak";

      ObjectCreate(s, OBJ_RECTANGLE, 0, 0, 0, 0, 0);
      ObjectSet(s, OBJPROP_TIME1, iTime(NULL, TimeFrame, zone_start[i]));
      ObjectSet(s, OBJPROP_TIME2, TimeCurrent());
      ObjectSet(s, OBJPROP_PRICE1, zone_hi[i]);
      ObjectSet(s, OBJPROP_PRICE2, zone_lo[i]);
      ObjectSet(s, OBJPROP_BACK, zone_solid);
      ObjectSet(s, OBJPROP_WIDTH, zone_linewidth);
      ObjectSet(s, OBJPROP_STYLE, zone_style);

      if (zone_type[i] == ZONE_SUPPORT)
      {
         // support zone
         if (zone_strength[i] == ZONE_TURNCOAT)
            ObjectSet(s, OBJPROP_COLOR, color_support_turncoat);
         else if (zone_strength[i] == ZONE_PROVEN)
            ObjectSet(s, OBJPROP_COLOR, color_support_proven);
         else if (zone_strength[i] == ZONE_VERIFIED)
            ObjectSet(s, OBJPROP_COLOR, color_support_verified);
         else if (zone_strength[i] == ZONE_UNTESTED)
            ObjectSet(s, OBJPROP_COLOR, color_support_untested);
         else
            ObjectSet(s, OBJPROP_COLOR, color_support_weak);
      }
      else
      {
         // resistance zone
         if (zone_strength[i] == ZONE_TURNCOAT)
            ObjectSet(s, OBJPROP_COLOR, color_resist_turncoat);
         else if (zone_strength[i] == ZONE_PROVEN)
            ObjectSet(s, OBJPROP_COLOR, color_resist_proven);
         else if (zone_strength[i] == ZONE_VERIFIED)
            ObjectSet(s, OBJPROP_COLOR, color_resist_verified);
         else if (zone_strength[i] == ZONE_UNTESTED)
            ObjectSet(s, OBJPROP_COLOR, color_resist_untested);
         else
            ObjectSet(s, OBJPROP_COLOR, color_resist_weak);
      }



      if (SetGlobals == true)
      {
         GlobalVariableSet("SSSR_HI_"+Symbol()+TimeFrame+i, zone_hi[i]);
         GlobalVariableSet("SSSR_LO_"+Symbol()+TimeFrame+i, zone_lo[i]);
         GlobalVariableSet("SSSR_HITS_"+Symbol()+TimeFrame+i, zone_hits[i]);
         GlobalVariableSet("SSSR_STRENGTH_"+Symbol()+TimeFrame+i, zone_strength[i]);
         GlobalVariableSet("SSSR_AGE_"+Symbol()+TimeFrame+i, zone_start[i]);
      }
   }
}

bool Fractal(int M, int P, int shift)
{
   if (TimeFrame > P)
      P = TimeFrame;
   
   P = P / TimeFrame*2 + MathCeil(P / TimeFrame / 2);
   
   if (shift < P)
      return(false);

   if (shift > iBars(Symbol(), TimeFrame)-P)
      return(false); 
   
   for (int i=1; i<=P; i++)
   {
      if (M == UP_POINT)
      {
         if (iHigh(NULL, TimeFrame, shift+i) > iHigh(NULL, TimeFrame, shift))
            return(false);
         if (iHigh(NULL, TimeFrame, shift-i) >= iHigh(NULL, TimeFrame, shift))
            return(false);     
      }
      if (M == DN_POINT)
      {
         if (iLow(NULL, TimeFrame, shift+i) < iLow(NULL, TimeFrame, shift))
            return(false);
         if (iLow(NULL, TimeFrame, shift-i) <= iLow(NULL, TimeFrame, shift))
            return(false);
      }        
   }
   return(true);   
}  

void FastFractals()
{
   int shift;
   int limit = MathMin(Bars-1, BackLimit);
   int P = TimeFrame * fractal_fast_factor;

   FastUpPts[0] = 0.0; FastUpPts[1] = 0.0;
   FastDnPts[0] = 0.0; FastDnPts[1] = 0.0;

   for (shift=limit; shift>1; shift--)
   {
      if (Fractal(UP_POINT, P, shift) == true)
         FastUpPts[shift] = iHigh(NULL, TimeFrame, shift);
      else
         FastUpPts[shift] = 0.0;

      if (Fractal(DN_POINT, P, shift) == true)
         FastDnPts[shift] = iLow(NULL, TimeFrame, shift);
      else
         FastDnPts[shift] = 0.0;
   }
}

void SlowFractals()
{
   int shift;
   int limit = MathMin(iBars(Symbol(), TimeFrame) - 1, BackLimit);
   int P = TimeFrame * fractal_slow_factor;

   SlowUpPts[0] = 0.0; SlowUpPts[1] = 0.0;
   SlowDnPts[0] = 0.0; SlowDnPts[1] = 0.0;

   for (shift=limit; shift>1; shift--)
   {
      if (Fractal(UP_POINT, P, shift) == true)
         SlowUpPts[shift] = iHigh(NULL, TimeFrame, shift);
      else
         SlowUpPts[shift] = 0.0;

      if (Fractal(DN_POINT, P, shift) == true)
         SlowDnPts[shift] = iLow(NULL, TimeFrame, shift);
      else
         SlowDnPts[shift] = 0.0;
   }
}

bool NewBar()
{
   static datetime LastTime = 0;
   if (iTime(NULL, TimeFrame, 0) != LastTime)
   {
      LastTime = iTime(NULL, TimeFrame, 0)+time_offset;
      return (true);
   }
   else
      return (false);
}

void DeleteZones()
{
   int len = 5;
   int i;

   while (i < ObjectsTotal())
   {
      string objName = ObjectName(i);
      if (StringSubstr(objName, 0, len) != "SSSR#")
      {
         i++;
         continue;
      }
      ObjectDelete(objName);
   }
}

string TimeFrameToString(int tf) //code by TRO
{
   string tfs;

   switch(tf)
   {
      case PERIOD_M1:
         tfs = "M1"  ;
         break;
      case PERIOD_M5:
         tfs = "M5"  ;
         break;
      case PERIOD_M15:
         tfs = "M15" ;
         break;
      case PERIOD_M30:
         tfs = "M30" ;
         break;
      case PERIOD_H1:
         tfs = "H1"  ;
         break;
      case PERIOD_H4:
         tfs = "H4"  ;
         break;
      case PERIOD_D1:
         tfs = "D1"  ;
         break;
      case PERIOD_W1:
         tfs = "W1"  ;
         break;
      case PERIOD_MN1:
         tfs = "MN";
   }

   return(tfs);
}

string StringRepeat(string str, int n = 1)
{
  string outstr = "";
  for(int i = 0; i < n; i++) outstr = outstr + str;
  return(outstr);
}

string StringRightPad(string str, int n=1, string str2=" ")
{
  return(str + StringRepeat(str2,n-StringLen(str)));
}