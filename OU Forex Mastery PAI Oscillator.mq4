/*
   Generated by EX4-TO-MQ4 decompiler V4.0.224.1 []
   Website: http://purebeam.biz
   E-mail : purebeam@gmail.com
*/
#property copyright "Copyright ?2009, FlyRight Software Corp."
#property link      "http://www.flyrightsoftware.com"

#property indicator_separate_window
#property indicator_levelcolor Yellow
#property indicator_levelstyle 0
#property indicator_buffers 1
#property indicator_color1 Yellow
#property indicator_width1 3

#include "..\include\OU_Forex.mqh"
/*
#import "OU_Loader.dll"
   bool OU_called();
   bool LoadConsole();
   bool RunAllowed();
   bool VersionAllowed(string a0, string a1);
   bool PairAllowed(string a0, string a1);
   bool FeatureAllowed(string a0, string a1);
   int GetUserLevel(string a0);
*/
#import "user32.dll"
   int GetDC(int a0);
   int ReleaseDC(int a0, int a1);
#import "gdi32.dll"
   int GetPixel(int a0, int a1, int a2);
#import

string gs_76;
bool gi_unused_84 = FALSE;
string gs_88 = "2.00MT";
string gs_unused_96 = "2.00FT";
string gs_104 = "";
bool gi_unused_112 = FALSE;
string gsa_116[] = {"EURUSD", "GBPUSD", "USDCHF", "USDJPY", "USDCAD", "AUDUSD", "NZDUSD", "EURJPY", "EURGBP", "AUDJPY", "GBPJPY", "EURAUD", "EURCAD", "CHFJPY", "AUDCAD", "GBPCHF", "EURCHF", "NZDJPY", "CADJPY", "AUDNZD", "GBPAUD", "GBPCAD"};
int gi_120 = -1;
string gs_124 = "";
bool gi_132 = FALSE;
bool gi_136 = FALSE;
bool gi_140 = FALSE;
extern int PAI_Period = 14;
double g_ibuf_148[];
double g_ibuf_152[];
double g_ibuf_156[];
int gi_160;

bool OU_loader_call() {
   string ls_unused_0;
   if (!OU_called()) LoadConsole();
   return (OU_called());
}

int DrawAllowed(string &as_0, string as_8) {
   as_8 = BaseSymbol(as_8);
   if (!OU_loader_call()) {
      as_0 = "failure loading console.";
      return (0);
   }
   if (!RunAllowed()) {
      as_0 = "waiting for console.";
      return (0);
   }
   if (!VersionAllowed(gs_76, gs_104)) {
      as_0 = "version " + gs_104 + " outdated." + VersionAllowed(gs_76, gs_104) + 0 + 1;
      return (0);
   }
   if (as_8 == "Scanner.") return (1);
   if (!PairAllowed(gs_76, as_8)) {
      if (validpair(gs_76, as_8)) as_0 = "unsubscribed pair.";
      else as_0 = "unsupported pair.";
      return (0);
   }
   return (1);
}

int superuser() {
   return (GetUserLevel(gs_76) == 3 || GetUserLevel(gs_76) == 5);
}

int LTCAllowed() {
   return (FeatureAllowed(gs_76, "LTC") || superuser());
}

bool validpair(string as_0, string as_8) {
   string ls_16 = pairtype(as_8);
   if (ls_16 == "4" || ls_16 == "10") return (TRUE);
   if (as_0 == "OUFT" && ls_16 == "17" || ls_16 == "22") return (TRUE);
   return (FALSE);
}

string pairtype(string as_0) {
   string ls_8 = "USDIX,EURUSD,GBPUSD,USDCHF,USDJPY";
   string ls_16 = "EURUSD,GBPUSD,USDCHF,USDJPY,USDCAD,AUDUSD,NZDUSD,EURJPY,EURGBP,AUDJPY";
   string ls_24 = "EURUSD,GBPUSD,USDCHF,USDJPY,USDCAD,AUDUSD,NZDUSD,EURJPY,EURGBP,AUDJPY,GBPJPY,EURAUD,EURCAD,CHFJPY,AUDCAD,GBPCHF,EURCHF";
   string ls_32 = "EURUSD,GBPUSD,USDCHF,USDJPY,USDCAD,AUDUSD,NZDUSD,EURJPY,EURGBP,AUDJPY,GBPJPY,EURAUD,EURCAD,CHFJPY,AUDCAD,GBPCHF,EURCHF,NZDJPY,CADJPY,AUDNZD,GBPAUD,GBPCAD";
   as_0 = StringSubstr(as_0, 0, 6);
   if (StringFind(ls_8, as_0) > -1) as_0 = "4";
   else {
      if (StringFind(ls_16, as_0) > -1) as_0 = "10";
      else {
         if (StringFind(ls_24, as_0) > -1) as_0 = "17";
         else {
            if (StringFind(ls_32, as_0) > -1) as_0 = "22";
            else as_0 = "1000";
         }
      }
   }
   return (as_0);
}

string BaseSymbol(string as_0) {
   if (gi_120 == -1) SetSymbolSuffixLength();
   if (as_0 == "Scanner.") return (as_0);
   if (gi_120 == 0 || StringSubstr(as_0, StringLen(as_0) - gi_120) != gs_124) return (as_0);
   return (StringSubstr(as_0, 0, StringLen(as_0) - gi_120));
}

void SetSymbolSuffixLength() {
   string lsa_0[1000];
   SymbolsList(lsa_0, 0);
   for (int l_index_4 = 0; StringSubstr(lsa_0[l_index_4], 0, 6) != "EURUSD" && l_index_4 < 1000; l_index_4++) {
   }
   gi_120 = StringLen(lsa_0[l_index_4]) - 6;
   gs_124 = StringSubstr(lsa_0[l_index_4], 6);
}

int SymbolsList(string &asa_0[1000], bool ai_4) {
   string l_name_8;
   int li_16;
   int li_ret_20;
   if (ai_4) l_name_8 = "symbols.sel";
   else l_name_8 = "symbols.raw";
   int l_file_24 = FileOpenHistory(l_name_8, FILE_BIN|FILE_READ);
   if (l_file_24 < 0) {
      Print("Symbol open failure.");
      return (-1);
   }
   if (ai_4) {
      li_ret_20 = (FileSize(l_file_24) - 4) / 128;
      li_16 = 116;
   } else {
      li_ret_20 = FileSize(l_file_24) / 1936;
      li_16 = 1924;
   }
   ArrayResize(asa_0, li_ret_20);
   if (ai_4) FileSeek(l_file_24, 4, SEEK_SET);
   for (int l_index_28 = 0; l_index_28 < li_ret_20; l_index_28++) {
      asa_0[l_index_28] = FileReadString(l_file_24, 12);
      FileSeek(l_file_24, li_16, SEEK_CUR);
   }
   FileClose(l_file_24);
   return (li_ret_20);
}

int init() {
   if (!IsDllsAllowed()) Alert("Enable Dlls under Tools/OPtions for OU_Forex_pricelines.");
   gs_76 = "OUFM";
   gs_104 = gs_88;
   OU_loader_call();
   IndicatorBuffers(3);
   SetIndexBuffer(0, g_ibuf_156);
   SetIndexBuffer(1, g_ibuf_148);
   SetIndexBuffer(2, g_ibuf_152);
   gi_160 = PAI_Period + MathFloor(MathSqrt(PAI_Period));
   SetIndexDrawBegin(0, gi_160);
   IndicatorDigits(MarketInfo(Symbol(), MODE_DIGITS) + 1.0);
   IndicatorShortName("OUFM PAI Oscillator");
   SetIndexLabel(0, "PAI Moving Average");
   return (0);
}

int start() {
   int li_8 = IndicatorCounted();
   if (li_8 < 0) return (-1);
   string ls_12 = "";
   if (!DrawAllowed(ls_12, Symbol())) {
      if (!gi_132) Print(ls_12);
      gi_132 = TRUE;
      gi_136 = FALSE;
      gi_140 = FALSE;
      return (-1);
   }
   if (!LTCAllowed()) {
      if (!gi_136) Alert("Sorry, PAI Oscillator is for class members only.");
      gi_136 = TRUE;
      return (-1);
   }
   if (!gi_140) {
      li_8 = 0;
      gi_140 = TRUE;
   }
   if (li_8 < 1) {
      for (int li_4 = 1; li_4 <= gi_160; li_4++) g_ibuf_148[Bars - li_4] = 0;
      for (li_4 = 1; li_4 <= PAI_Period; li_4++) g_ibuf_152[Bars - li_4] = 0;
   }
   if (li_8 > 0) li_8--;
   int li_0 = Bars - li_8;
   for (li_4 = 0; li_4 < li_0; li_4++) g_ibuf_152[li_4] = 2.0 * iMA(NULL, 0, MathFloor(PAI_Period / 2), 0, MODE_LWMA, PRICE_CLOSE, li_4) - iMA(NULL, 0, PAI_Period, 0, MODE_LWMA, PRICE_CLOSE, li_4);
   for (li_4 = 0; li_4 < li_0; li_4++) g_ibuf_148[li_4] = iMAOnArray(g_ibuf_152, 0, MathFloor(MathSqrt(PAI_Period)), 0, MODE_LWMA, li_4);
   for (li_4 = 0; li_4 < li_0; li_4++) g_ibuf_156[li_4] = g_ibuf_148[li_4] - (g_ibuf_148[li_4 + 2]);
   return (0);
}