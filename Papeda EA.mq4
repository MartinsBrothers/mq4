//EA交易     =>  ...\MT4\MQL4\Experts

#property  copyright "EX4 Unlock service: @ebfe90"
#property  link      "https://t.me/ebfe90"
#property version    "1.00"
#property strict
#property description  "RISK WARNING – Trading on the forex market involves significant risks, including complete possible loss of funds. Trading is not suitable for all investors and traders.\nDISCLAIMER – By using Papeda EA, You acknowledge that You are familiar with these risks and that You are solely responsible for the outcomes of your decisions. We accept no liability whatsoever for any direct or consequential loss arising from the use of this product."

  enum CN      {e = 0,d = 1  };
  enum OR      {Reverse = 2,Follow = 1  };
  enum FL      {L = 0,M = 1  };
  enum MTP      {Simultan = 1,Parsial = 0  };


//------------------
extern int   Magic=356  ;    //Magic Number
extern string Set1="---- Licensed to 5185319 - expire on 31/12/3000 ----"  ;   //=====================================
extern bool MM=false ;    //Auto Lot
extern double Risk=0.01  ;    //Lot Risk (% Balance)
extern int   Ketahanan=10000  ;   
extern double Lots=0.01  ;    //Base Lot
extern double TPmf=10  ;    //Target Profit Money [0=false]
extern double TP=0  ;    //Target Profit Pips [0=false]
extern double SLQf=0  ;    //Maximum Loss % Equity [0=false]
extern bool Close_Profit=false ;    //Close % Profit
extern double TPQf=0  ;    //Profit % Equity
  bool      总_1_bo_0 = true;
  int       总_2_in_4 = 5185319;
  bool      总_3_bo_8 = false;
  string    总_4_st_10 = "Muhamad Adi Sujai";
  long      总_5_lo_20 = 32535129600;
  string    总_6_st_28 = "---- Licensed to - Exp 31/12/3000 ----";
  string    总_7_st_38 = "---- Default setting for EURUSD TF H1 balance 100k ----";
  string    总_8_st_48 = "---- Open Order Setting ----";
  int       总_9_in_54 = 2;
  string    总_10_st_58 = "---- Filter ----";
  int       总_11_in_64 = 0;
  bool      总_12_bo_68 = false;
  int       总_13_in_6C = 9;
  int       总_14_in_70 = 26;
  int       总_15_in_74 = 52;
  string    总_16_st_78 = "---- Close Order Setting ----";
  int       总_17_in_84 = 1;
  double    总_18_do_88 = 0.0;
  double    总_19_do_90 = 0.0;
  string    总_20_st_98 = "---- Setting Trailing Stop ----";
  double    总_21_do_A8 = 0.0;
  double    总_22_do_B0 = 0.0;
  string    总_23_st_B8 = "---- Averaging Setting ----";
  int       总_24_in_C4 = 1;
  double    总_25_do_C8 = 1.4;
  double    总_26_do_D0 = 0.02;
  double    总_27_do_D8 = 1.0;
  int       总_28_in_E0 = 200;
  int       总_29_in_E4 = 1;
  string    总_30_st_E8 = "---- Trading Time Setting ----";
  int       总_31_in_F4 = 1;
  string    总_32_st_F8 = "00:30";
  string    总_33_st_108 = "23:30";
  int       总_34_in_114 = 6;
  int       总_35_in_118 = 5;
  int       总_36_in_11C = 3;
  string    总_37_st_120 = "Papeda EA - t.me/su741";
  int       总_38_in_12C = 3;
  bool      总_39_bo_130 = false;
  int       总_40_in_134 = 0;
  int       总_41_in_138 = 0;
  string    总_42_st_140 = "cash-register-05.wav";
  bool      总_43_bo_14C = true;
  bool      总_44_bo_14D = false;
  uint      总_45_ui_150 = Aqua;
  int       总_46_in_154 = 0;
  double    总_47_do_158 = 0.0;
  double    总_48_do_160 = 0.0;
  double    总_49_do_168 = 0.0;
  double    总_50_do_170 = 0.0;
  double    总_51_do_178 = 1.0;
  double    总_52_do_180 = 0.0;
  double    总_53_do_188 = 0.0;
  double    总_54_do_190 = 0.0;
  double    总_55_do_198 = 0.0;
  double    总_56_do_1A0 = 0.0;
  double    总_57_do_1A8 = 0.0;
  double    总_58_do_1B0 = 0.0;
  double    总_59_do_1B8 = 0.0;
  double    总_60_do_1C0 = 0.0;
  double    总_61_do_1C8 = 0.0;
  int       总_62_in_1D0 = 0;
  int       总_63_in_1D4 = 0;
  int       总_64_in_1D8 = 0;

#import     

 int OnInit()
 {
  int       子_2_in;
//----- -----

 总_51_do_178 = 1.0 ;
 if ( ( Digits == 3 || Digits == 5 ) )
 {
   总_47_do_158 = Point * 10.0 ;
   总_51_do_178 = 10.0 ;
 }
 if ( ( Digits == 2 || Digits == 4 ) )
 {
   总_47_do_158 = Point ;
 }
 ChartSetInteger(0,17,0,0); 
 ChartSetInteger(0,16,0,1); 
 ChartSetInteger(0,0,1); 
 总_48_do_160 = MarketInfo(Symbol(),MODE_MINLOT) ;
 总_49_do_168 = MarketInfo(Symbol(),MODE_MAXLOT) ;
 子_2_in = 50 ;
 ObjectCreate(0,"Close All",OBJ_BUTTON,0,0,0.0); 
 ObjectSetInteger(0,"Close All",OBJPROP_XSIZE,110); 
 ObjectSetInteger(0,"Close All",OBJPROP_YSIZE,30); 
 ObjectSetInteger(0,"Close All",OBJPROP_BORDER_COLOR,12632256); 
 ObjectSetInteger(0,"Close All",OBJPROP_XDISTANCE,50); 
 ObjectSetInteger(0,"Close All",OBJPROP_YDISTANCE,35); 
 ObjectSetString(0,"Close All",OBJPROP_TEXT,"Close All"); 
 ObjectSetInteger(0,"Close All",OBJPROP_CORNER,2); 
 ObjectSetInteger(0,"Close All",OBJPROP_BGCOLOR,255); 
 ObjectSetString(0,"Close All",OBJPROP_FONT,"Arial Bold"); 
 ObjectSetInteger(0,"Close All",OBJPROP_FONTSIZE,9); 
 ObjectSetInteger(0,"Close All",OBJPROP_COLOR,16777215); 
 ObjectSetInteger(0,"Close All",OBJPROP_BACK,0); 
 子_2_in=50 + 120;
 ObjectCreate(0,"Close Buy",OBJ_BUTTON,0,0,0.0); 
 ObjectSetInteger(0,"Close Buy",OBJPROP_XSIZE,110); 
 ObjectSetInteger(0,"Close Buy",OBJPROP_YSIZE,30); 
 ObjectSetInteger(0,"Close Buy",OBJPROP_BORDER_COLOR,12632256); 
 ObjectSetInteger(0,"Close Buy",OBJPROP_XDISTANCE,子_2_in); 
 ObjectSetInteger(0,"Close Buy",OBJPROP_YDISTANCE,35); 
 ObjectSetString(0,"Close Buy",OBJPROP_TEXT,"Close Buy"); 
 ObjectSetInteger(0,"Close Buy",OBJPROP_CORNER,2); 
 ObjectSetInteger(0,"Close Buy",OBJPROP_BGCOLOR,0); 
 ObjectSetString(0,"Close Buy",OBJPROP_FONT,"Arial Bold"); 
 ObjectSetInteger(0,"Close Buy",OBJPROP_FONTSIZE,9); 
 ObjectSetInteger(0,"Close Buy",OBJPROP_COLOR,16777215); 
 ObjectSetInteger(0,"Close Buy",OBJPROP_BACK,0); 
 子_2_in +=120;
 ObjectCreate(0,"Close Sell",OBJ_BUTTON,0,0,0.0); 
 ObjectSetInteger(0,"Close Sell",OBJPROP_XSIZE,110); 
 ObjectSetInteger(0,"Close Sell",OBJPROP_YSIZE,30); 
 ObjectSetInteger(0,"Close Sell",OBJPROP_BORDER_COLOR,12632256); 
 ObjectSetInteger(0,"Close Sell",OBJPROP_XDISTANCE,子_2_in); 
 ObjectSetInteger(0,"Close Sell",OBJPROP_YDISTANCE,35); 
 ObjectSetString(0,"Close Sell",OBJPROP_TEXT,"Close Sell"); 
 ObjectSetInteger(0,"Close Sell",OBJPROP_CORNER,2); 
 ObjectSetInteger(0,"Close Sell",OBJPROP_BGCOLOR,14822282); 
 ObjectSetString(0,"Close Sell",OBJPROP_FONT,"Arial Bold"); 
 ObjectSetInteger(0,"Close Sell",OBJPROP_FONTSIZE,9); 
 ObjectSetInteger(0,"Close Sell",OBJPROP_COLOR,16777215); 
 ObjectSetInteger(0,"Close Sell",OBJPROP_BACK,0); 
 子_2_in +=120;
 ObjectCreate(0,"Close All Order",OBJ_BUTTON,0,0,0.0); 
 ObjectSetInteger(0,"Close All Order",OBJPROP_XSIZE,110); 
 ObjectSetInteger(0,"Close All Order",OBJPROP_YSIZE,30); 
 ObjectSetInteger(0,"Close All Order",OBJPROP_BORDER_COLOR,12632256); 
 ObjectSetInteger(0,"Close All Order",OBJPROP_XDISTANCE,子_2_in); 
 ObjectSetInteger(0,"Close All Order",OBJPROP_YDISTANCE,35); 
 ObjectSetString(0,"Close All Order",OBJPROP_TEXT,"Close All Order"); 
 ObjectSetInteger(0,"Close All Order",OBJPROP_CORNER,2); 
 ObjectSetInteger(0,"Close All Order",OBJPROP_BGCOLOR,255); 
 ObjectSetString(0,"Close All Order",OBJPROP_FONT,"Arial Bold"); 
 ObjectSetInteger(0,"Close All Order",OBJPROP_FONTSIZE,9); 
 ObjectSetInteger(0,"Close All Order",OBJPROP_COLOR,16777215); 
 ObjectSetInteger(0,"Close All Order",OBJPROP_BACK,0); 
 子_2_in +=120;
 HideTestIndicators(true); 
 if ( !(IsTesting()) )
 {
   if ( !(IsExpertEnabled()) )
   {
     Alert("Robot belum aktif, klik tombol akivasi robot"); 
   }
   if ( !(IsTradeAllowed()) )
   {
     Alert("Robot belum aktif, centang kolom allow live trading"); 
   }
 }
 return(0); 
 }
//OnInit <<==--------   --------
 int start()
 {
  string    子_2_st_si256[256]={};
  int       子_3_in;
  int       子_4_in;
  bool      子_5_bo;
  string    子_6_st;
  string    子_7_st;
  int       子_8_in;
  int       子_9_in;
  int       子_10_in;
  int       子_11_in;
  int       子_12_in;
  int       子_13_in;
  double    子_14_do;
  double    子_15_do;
  double    子_16_do;
  double    子_17_do;
  double    子_18_do;
  double    子_19_do;
  double    子_20_do;
  long      子_21_lo;
  long      子_22_lo;
  string    子_23_st;
  double    子_24_do;
  double    子_25_do;
  double    子_26_do;
  double    子_27_do;
  double    子_28_do;
  double    子_29_do;
  double    子_30_do;
  double    子_31_do;
  double    子_32_do;
  double    子_33_do;
  double    子_34_do;
  double    子_35_do;
  double    子_36_do;
  double    子_37_do;
  double    子_38_do;
  bool      子_39_bo;
  bool      子_40_bo;
  bool      子_41_bo;
  bool      子_42_bo;
  double    子_43_do;
  double    子_44_do;
  double    子_45_do;
  double    子_46_do;
  uint      子_47_ui;
  uint      子_48_ui;
  uint      子_49_ui;
  uint      子_50_ui;
  uint      子_51_ui;
  uint      子_52_ui;
  double    子_53_do;
  uint      子_54_ui;
  double    子_55_do;
  double    子_56_do;
//----- -----
 int        临_in_1;
 double     临_do_2;
 int        临_in_3;
 double     临_do_4;
 double     临_do_5;
 double     临_do_6;
 double     临_do_7;
 double     临_do_8;
 int        临_in_9;
 int        临_in_10;
 double     临_do_11;
 int        临_in_12;
 double     临_do_13;
 double     临_do_14;
 double     临_do_15;
 double     临_do_16;
 double     临_do_17;
 int        临_in_18;
 int        临_in_19;
 double     临_do_20;
 int        临_in_21;
 double     临_do_22;
 double     临_do_23;
 double     临_do_24;
 double     临_do_25;
 double     临_do_26;
 int        临_in_27;
 int        临_in_28;
 double     临_do_29;
 int        临_in_30;
 double     临_do_31;
 double     临_do_32;
 double     临_do_33;
 double     临_do_34;
 double     临_do_35;
 int        临_in_36;
 int        临_in_37;
 uint       临_ui_38;
 int        临_in_39;
 int        临_in_40;
 int        临_in_41;
 string     临_st_42;
 int        临_in_43;
 uint       临_ui_44;
 int        临_in_45;
 int        临_in_46;
 int        临_in_47;
 string     临_st_48;
 int        临_in_49;
 uint       临_ui_50;
 int        临_in_51;
 int        临_in_52;
 int        临_in_53;
 string     临_st_54;
 int        临_in_55;
 uint       临_ui_56;
 int        临_in_57;
 int        临_in_58;
 int        临_in_59;
 string     临_st_60;
 int        临_in_61;
 uint       临_ui_62;
 int        临_in_63;
 int        临_in_64;
 int        临_in_65;
 string     临_st_66;
 int        临_in_67;
 uint       临_ui_68;
 int        临_in_69;
 int        临_in_70;
 int        临_in_71;
 string     临_st_72;
 int        临_in_73;
 uint       临_ui_74;
 int        临_in_75;
 int        临_in_76;
 int        临_in_77;
 string     临_st_78;
 int        临_in_79;
 uint       临_ui_80;
 int        临_in_81;
 int        临_in_82;
 int        临_in_83;
 string     临_st_84;
 int        临_in_85;
 uint       临_ui_86;
 int        临_in_87;
 int        临_in_88;
 int        临_in_89;
 string     临_st_90;
 int        临_in_91;
 uint       临_ui_92;
 int        临_in_93;
 int        临_in_94;
 int        临_in_95;
 string     临_st_96;
 int        临_in_97;
 uint       临_ui_98;
 int        临_in_99;
 int        临_in_100;
 int        临_in_101;
 string     临_st_102;
 int        临_in_103;
 uint       临_ui_104;
 int        临_in_105;
 int        临_in_106;
 int        临_in_107;
 string     临_st_108;
 int        临_in_109;
 uint       临_ui_110;
 int        临_in_111;
 int        临_in_112;
 int        临_in_113;
 string     临_st_114;
 int        临_in_115;
 uint       临_ui_116;
 int        临_in_117;
 int        临_in_118;
 int        临_in_119;
 string     临_st_120;
 int        临_in_121;
 uint       临_ui_122;
 int        临_in_123;
 int        临_in_124;
 int        临_in_125;
 string     临_st_126;
 int        临_in_127;
 uint       临_ui_128;
 int        临_in_129;
 int        临_in_130;
 int        临_in_131;
 string     临_st_132;
 int        临_in_133;
 uint       临_ui_134;
 int        临_in_135;
 int        临_in_136;
 int        临_in_137;
 string     临_st_138;
 int        临_in_139;
 uint       临_ui_140;
 int        临_in_141;
 int        临_in_142;
 int        临_in_143;
 string     临_st_144;
 int        临_in_145;
 uint       临_ui_146;
 int        临_in_147;
 int        临_in_148;
 int        临_in_149;
 string     临_st_150;
 uint       临_ui_151;
 int        临_in_152;
 int        临_in_153;
 int        临_in_154;
 string     临_st_155;
 uint       临_ui_156;
 int        临_in_157;
 int        临_in_158;
 int        临_in_159;
 string     临_st_160;




 for (子_3_in = 0 ; 子_3_in < 256 ; 子_3_in ++)
 {
   子_2_st_si256[子_3_in] = CharToString(子_3_in);
 }
 子_4_in = StringToTime(子_2_st_si256[50] + 子_2_st_si256[48] + 子_2_st_si256[48] + 子_2_st_si256[57] + 子_2_st_si256[46] + 子_2_st_si256[48] + 子_2_st_si256[57] + 子_2_st_si256[46] + 子_2_st_si256[49] + 子_2_st_si256[49] + 子_2_st_si256[32] + 子_2_st_si256[50] + 子_2_st_si256[51] + 子_2_st_si256[58] + 子_2_st_si256[53] + 子_2_st_si256[57] + 子_2_st_si256[58] + 子_2_st_si256[48] + 子_2_st_si256[48]) ;
 if ( TimeCurrent() == 238 )
 {
   ObjectCreate("M6",OBJ_LABEL,0,0,0.0,0,0.0,0,0.0); 
   ObjectSetText("M6","Your expert advisor has expired,",9,"Thoma",Yellow); 
   ObjectSet("M6",OBJPROP_CORNER,0.0); 
   ObjectSet("M6",OBJPROP_XDISTANCE,0.0); 
   ObjectSet("M6",OBJPROP_YDISTANCE,20.0); 
   ObjectCreate("M7",OBJ_LABEL,0,0,0.0,0,0.0,0,0.0); 
   ObjectSetText("M7","or you do not have a license to use it.",9,"Thoma",Yellow); 
   ObjectSet("M7",OBJPROP_CORNER,0.0); 
   ObjectSet("M7",OBJPROP_XDISTANCE,0.0); 
   ObjectSet("M7",OBJPROP_YDISTANCE,40.0); 
   ObjectCreate("M8",OBJ_LABEL,0,0,0.0,0,0.0,0,0.0); 
   ObjectSetText("M8","Please contact bung.jai@gmail.com.",8,"Thoma",Yellow); 
   ObjectSet("M8",OBJPROP_CORNER,0.0); 
   ObjectSet("M8",OBJPROP_XDISTANCE,0.0); 
   ObjectSet("M8",OBJPROP_YDISTANCE,60.0); 
   return(0); 
 }
 if ( 总_1_bo_0 && AccountNumber() == 238 )
 {
   ObjectCreate("M6",OBJ_LABEL,0,0,0.0,0,0.0,0,0.0); 
   ObjectSetText("M6","Your expert advisor has expired,",9,"Thoma",Yellow); 
   ObjectSet("M6",OBJPROP_CORNER,0.0); 
   ObjectSet("M6",OBJPROP_XDISTANCE,0.0); 
   ObjectSet("M6",OBJPROP_YDISTANCE,20.0); 
   ObjectCreate("M7",OBJ_LABEL,0,0,0.0,0,0.0,0,0.0); 
   ObjectSetText("M7","or you do not have a license to use it.",9,"Thoma",Yellow); 
   ObjectSet("M7",OBJPROP_CORNER,0.0); 
   ObjectSet("M7",OBJPROP_XDISTANCE,0.0); 
   ObjectSet("M7",OBJPROP_YDISTANCE,40.0); 
   ObjectCreate("M8",OBJ_LABEL,0,0,0.0,0,0.0,0,0.0); 
   ObjectSetText("M8","Please contact bung.jai@gmail.com.",8,"Thoma",Yellow); 
   ObjectSet("M8",OBJPROP_CORNER,0.0); 
   ObjectSet("M8",OBJPROP_XDISTANCE,0.0); 
   ObjectSet("M8",OBJPROP_YDISTANCE,60.0); 
   return(0); 
 }
 if ( 总_3_bo_8 )
 {
   AccountName(); 
   if ( AccountNumber() == 238 )
   {
     ObjectCreate("M6",OBJ_LABEL,0,0,0.0,0,0.0,0,0.0); 
     ObjectSetText("M6","Your expert advisor has expired,",9,"Thoma",Yellow); 
     ObjectSet("M6",OBJPROP_CORNER,0.0); 
     ObjectSet("M6",OBJPROP_XDISTANCE,0.0); 
     ObjectSet("M6",OBJPROP_YDISTANCE,20.0); 
     ObjectCreate("M7",OBJ_LABEL,0,0,0.0,0,0.0,0,0.0); 
     ObjectSetText("M7","or you do not have a license to use it.",9,"Thoma",Yellow); 
     ObjectSet("M7",OBJPROP_CORNER,0.0); 
     ObjectSet("M7",OBJPROP_XDISTANCE,0.0); 
     ObjectSet("M7",OBJPROP_YDISTANCE,40.0); 
     ObjectCreate("M8",OBJ_LABEL,0,0,0.0,0,0.0,0,0.0); 
     ObjectSetText("M8","Please contact bung.jai@gmail.com.",8,"Thoma",Yellow); 
     ObjectSet("M8",OBJPROP_CORNER,0.0); 
     ObjectSet("M8",OBJPROP_XDISTANCE,0.0); 
     ObjectSet("M8",OBJPROP_YDISTANCE,60.0); 
     return(0); 
   }
 }
 子_5_bo = false ;
 if ( 总_31_in_F4 == 1 )
 {
   子_6_st = TimeToString(TimeCurrent(),1) + " " + 总_32_st_F8 ;
   子_7_st = TimeToString(TimeCurrent(),1) + " " + 总_33_st_108 ;
   if ( TimeCurrent() >= StringToTime(子_6_st) && TimeCurrent() <  StringToTime(子_7_st) )
   {
     子_5_bo = true ;
   }
 }
 else
 {
   子_5_bo = true ;
 }
 子_8_in = 0 ;
 子_9_in = 0 ;
 子_10_in = 0 ;
 子_11_in = 0 ;
 子_12_in = 0 ;
 子_13_in = 0 ;
 子_14_do = 0.0 ;
 子_15_do = 0.0 ;
 子_16_do = 0.0 ;
 子_17_do = 0.0 ;
 子_18_do = 0.0 ;
 子_19_do = 0.0 ;
 子_20_do = 0.0 ;
 子_21_lo = 0 ;
 子_22_lo = 0 ;
 子_23_st = "" ;
 总_56_do_1A0 = 0.0 ;
 总_57_do_1A8 = 0.0 ;
 for (子_13_in = 0 ; 子_13_in < OrdersTotal() ; 子_13_in ++)
 {
   总_63_in_1D4 = OrderSelect(子_13_in,0,0) ;
   if ( ( OrderSymbol() != Symbol() && OrderMagicNumber() != Magic ) )   continue;
   
   if ( OrderType() == 0 )
   {
     子_9_in ++;
     子_8_in ++;
     子_14_do = 子_14_do + OrderProfit() + OrderCommission() + OrderSwap() ;
     子_16_do = 子_16_do + OrderLots() ;
     总_56_do_1A0 = OrderStopLoss() ;
   }
   if ( OrderType() == 1 )
   {
     子_10_in ++;
     子_8_in ++;
     子_15_do = 子_15_do + OrderProfit() + OrderCommission() + OrderSwap() ;
     子_17_do = 子_17_do + OrderLots() ;
     总_57_do_1A8 = OrderStopLoss() ;
   }
   if ( OrderType() == 4 )
   {
     子_12_in ++;
     子_18_do = OrderOpenPrice() ;
     子_8_in ++;
   }
   if ( OrderType() != 5 )   continue;
   子_11_in ++;
   子_19_do = OrderOpenPrice() ;
   子_8_in ++;
   
 }
 总_50_do_170 = Lots ;
 if ( MM )
 {
   总_50_do_170 = AccountEquity() * Risk / Ketahanan ;
 }
 if ( 总_17_in_84 == 0 )
 {
   if ( TPmf>0.0 && 子_9_in >  0 && 子_14_do>=TPmf )
   {
     lizong_9(0); 
   }
   if ( TPmf>0.0 && 子_10_in >  0 && 子_15_do>=TPmf )
   {
     lizong_9(1); 
   }
 }
 if ( 总_17_in_84 == 1 )
 {
   if ( TPmf>0.0 && 子_9_in >  0 && 子_10_in == 0 && 子_14_do>=TPmf )
   {
     lizong_9(0); 
   }
   if ( TPmf>0.0 && 子_10_in >  0 && 子_9_in == 0 && 子_15_do>=TPmf )
   {
     lizong_9(1); 
   }
   if ( TPmf>0.0 && 子_9_in >  0 && 子_10_in >  0 && 子_14_do + 子_15_do>=TPmf )
   {
     lizong_9(-1); 
   }
 }
 if ( OrdersTotal() >  0 && 总_18_do_88>0.0 && AccountProfit()>0.0 && AccountProfit()>总_18_do_88 )
 {
   lizong_9(-1); 
 }
 子_24_do = 0.0 ;
 if ( AccountProfit()!=0.0 )
 {
   子_24_do = AccountProfit() / AccountBalance() * 100.0 ;
 }
 if ( 子_24_do<0.0 )
 {
   子_25_do = 0.0 ;
   子_25_do = 0.0 - 子_24_do ;
   if ( 子_25_do>总_53_do_188 )
   {
     总_53_do_188 = 子_25_do ;
   }
 }
 if ( SLQf>0.0 && 子_24_do<0.0 )
 {
   子_26_do = 0.0 ;
   子_26_do = 0.0 - 子_24_do ;
   if ( 子_26_do>=SLQf )
   {
     lizong_9(-1); 
   }
 }
 子_27_do = AccountBalance() ;
 子_28_do = AccountEquity() ;
 子_29_do = 子_28_do - 子_27_do ;
 子_30_do = 子_29_do / 子_28_do * 100.0 ;
 if ( Close_Profit && 子_30_do>=TPQf )
 {
   lizong_9(-1); 
 }
 HideTestIndicators(true); 
 子_31_do = iCustom(Symbol(),0,"ZigZag",总_34_in_114,总_35_in_118,总_36_in_11C,1,1) ;
 子_32_do = iCustom(Symbol(),0,"ZigZag",总_34_in_114,总_35_in_118,总_36_in_11C,2,1) ;
 子_33_do = iIchimoku(Symbol(),总_11_in_64,总_13_in_6C,总_14_in_70,总_15_in_74,3,1) ;
 子_34_do = iIchimoku(Symbol(),总_11_in_64,总_13_in_6C,总_14_in_70,总_15_in_74,4,1) ;
 子_35_do = iClose(Symbol(),总_11_in_64,1) ;
 子_36_do = iHigh(Symbol(),总_11_in_64,1) ;
 子_37_do = iLow(Symbol(),总_11_in_64,1) ;
 子_38_do = iOpen(Symbol(),总_11_in_64,1) ;
 子_39_bo = 子_31_do>0.0 && 子_32_do==0.0 &&  (子_35_do>子_33_do && 子_35_do>子_34_do) ;
 子_40_bo = 子_31_do==0.0 && 子_32_do>0.0 &&  (子_35_do<子_34_do && 子_35_do<子_33_do) ;
 if ( 总_9_in_54 == 1 && Volume[0] <  15 && 子_5_bo )
 {
   if ( 子_9_in == 0 && 子_31_do>0.0 && 子_32_do==0.0 && 子_35_do>子_33_do && 子_35_do>子_34_do )
   {
     lizong_7(); 
   }
   if ( 子_10_in == 0 && 子_31_do==0.0 && 子_32_do>0.0 && 子_35_do<子_34_do && 子_35_do<子_33_do )
   {
     lizong_8(); 
   }
 }
 else
 {
   if ( 总_9_in_54 == 2 && Volume[0] <  15 && 子_5_bo )
   {
     if ( 子_10_in == 0 && 子_31_do>0.0 && 子_32_do==0.0 && 子_35_do<子_34_do && 子_35_do<子_33_do )
     {
       lizong_8(); 
     }
     if ( 子_9_in == 0 && 子_31_do==0.0 && 子_32_do>0.0 && 子_35_do>子_33_do && 子_35_do>子_34_do )
     {
       lizong_7(); 
     }
   }
 }
 if ( 子_8_in >  0 )
 {
   lizong_10(); 
 }
 子_41_bo = 子_35_do<子_34_do && 子_35_do<子_33_do ;
 子_42_bo = 子_35_do>子_33_do && 子_35_do>子_34_do ;
 if ( 总_12_bo_68 )
 {
   if ( 子_9_in >  0 && 子_41_bo )
   {
     lizong_9(0); 
   }
   if ( 子_10_in >  0 && 子_42_bo )
   {
     lizong_9(1); 
   }
 }
 if ( 总_21_do_A8>0.0 && 总_22_do_B0>0.0 && 总_17_in_84 == 0 )
 {
   if ( 子_9_in >  0 )
   {
     临_in_1 = 0;
     临_do_2 = 0.0;
     for (临_in_3 = 0 ; 临_in_3 < OrdersTotal() ; 临_in_3=临_in_3 + 1)
     {
       if ( !(OrderSelect(临_in_3,0,0)) || OrderSymbol() != Symbol() || OrderType() != 临_in_1 || OrderMagicNumber() != Magic )   continue;
       临_do_2 = OrderOpenPrice() * OrderLots() + 临_do_2;
       
     }
     总_54_do_190 = (临_do_2) / 子_16_do ;
     临_do_4 = 总_54_do_190;
     临_do_5 = 总_22_do_B0;
     临_do_6 = 总_21_do_A8;
     临_do_7 = 0.0;
     临_do_8 = 0.0;
     if ( 总_22_do_B0>0.0 )
     {
       for (临_in_9 = OrdersTotal() - 1 ; 临_in_9 >= 0 ; 临_in_9=临_in_9 - 1)
       {
         if ( !(OrderSelect(临_in_9,0,0)) )   continue;
         
         if ( ( OrderType() != 0 && OrderSymbol() != Symbol() && OrderMagicNumber() != Magic ) )   continue;
         
         if ( OrderType() == 0 && OrderSymbol() == Symbol() && OrderMagicNumber() == Magic && (Bid - 临_do_4) / 总_47_do_158>=临_do_6 )
         {
           临_do_7 = OrderStopLoss();
           临_do_8 = NormalizeDouble(Bid - 临_do_5 * 总_47_do_158,Digits);
           if ( ( 临_do_7==0.0 || (临_do_7!=0.0 && 临_do_8>临_do_7) ) )
           {
             总_64_in_1D8 = OrderModify(OrderTicket(),临_do_4,临_do_8,OrderTakeProfit(),0,Blue) ;
           }
         }
         Sleep(1000); 
         
       }
     }
   }
   if ( 子_10_in >  0 )
   {
     临_in_10 = 1;
     临_do_11 = 0.0;
     for (临_in_12 = 0 ; 临_in_12 < OrdersTotal() ; 临_in_12=临_in_12 + 1)
     {
       if ( !(OrderSelect(临_in_12,0,0)) || OrderSymbol() != Symbol() || OrderType() != 临_in_10 || OrderMagicNumber() != Magic )   continue;
       临_do_11 = OrderOpenPrice() * OrderLots() + 临_do_11;
       
     }
     总_55_do_198 = (临_do_11) / 子_17_do ;
     临_do_13 = 总_55_do_198;
     临_do_14 = 总_22_do_B0;
     临_do_15 = 总_21_do_A8;
     临_do_16 = 0.0;
     临_do_17 = 0.0;
     if ( 总_22_do_B0>0.0 )
     {
       for (临_in_18 = OrdersTotal() - 1 ; 临_in_18 >= 0 ; 临_in_18=临_in_18 - 1)
       {
         if ( !(OrderSelect(临_in_18,0,0)) )   continue;
         
         if ( ( OrderType() != 1 && OrderSymbol() != Symbol() && OrderMagicNumber() != Magic ) )   continue;
         
         if ( OrderType() == 1 && OrderSymbol() == Symbol() && OrderMagicNumber() == Magic && (临_do_13 - Ask) / 总_47_do_158>=临_do_15 )
         {
           临_do_16 = OrderStopLoss();
           临_do_17 = NormalizeDouble(临_do_14 * 总_47_do_158 + Ask,Digits);
           if ( ( 临_do_16==0.0 || (临_do_16!=0.0 && 临_do_17<临_do_16) ) )
           {
             总_64_in_1D8 = OrderModify(OrderTicket(),临_do_13,临_do_17,OrderTakeProfit(),0,Red) ;
           }
         }
         Sleep(1000); 
         
       }
     }
   }
 }
 if ( 总_21_do_A8>0.0 && 总_22_do_B0>0.0 && 总_17_in_84 == 1 )
 {
   if ( 子_9_in >  0 && 子_10_in == 0 )
   {
     临_in_19 = 0;
     临_do_20 = 0.0;
     for (临_in_21 = 0 ; 临_in_21 < OrdersTotal() ; 临_in_21=临_in_21 + 1)
     {
       if ( !(OrderSelect(临_in_21,0,0)) || OrderSymbol() != Symbol() || OrderType() != 临_in_19 || OrderMagicNumber() != Magic )   continue;
       临_do_20 = OrderOpenPrice() * OrderLots() + 临_do_20;
       
     }
     总_54_do_190 = (临_do_20) / 子_16_do ;
     临_do_22 = 总_54_do_190;
     临_do_23 = 总_22_do_B0;
     临_do_24 = 总_21_do_A8;
     临_do_25 = 0.0;
     临_do_26 = 0.0;
     if ( 总_22_do_B0>0.0 )
     {
       for (临_in_27 = OrdersTotal() - 1 ; 临_in_27 >= 0 ; 临_in_27=临_in_27 - 1)
       {
         if ( !(OrderSelect(临_in_27,0,0)) )   continue;
         
         if ( ( OrderType() != 0 && OrderSymbol() != Symbol() && OrderMagicNumber() != Magic ) )   continue;
         
         if ( OrderType() == 0 && OrderSymbol() == Symbol() && OrderMagicNumber() == Magic && (Bid - 临_do_22) / 总_47_do_158>=临_do_24 )
         {
           临_do_25 = OrderStopLoss();
           临_do_26 = NormalizeDouble(Bid - 临_do_23 * 总_47_do_158,Digits);
           if ( ( 临_do_25==0.0 || (临_do_25!=0.0 && 临_do_26>临_do_25) ) )
           {
             总_64_in_1D8 = OrderModify(OrderTicket(),临_do_22,临_do_26,OrderTakeProfit(),0,Blue) ;
           }
         }
         Sleep(1000); 
         
       }
     }
   }
   if ( 子_10_in >  0 && 子_9_in == 0 )
   {
     临_in_28 = 1;
     临_do_29 = 0.0;
     for (临_in_30 = 0 ; 临_in_30 < OrdersTotal() ; 临_in_30=临_in_30 + 1)
     {
       if ( !(OrderSelect(临_in_30,0,0)) || OrderSymbol() != Symbol() || OrderType() != 临_in_28 || OrderMagicNumber() != Magic )   continue;
       临_do_29 = OrderOpenPrice() * OrderLots() + 临_do_29;
       
     }
     总_55_do_198 = (临_do_29) / 子_17_do ;
     临_do_31 = 总_55_do_198;
     临_do_32 = 总_22_do_B0;
     临_do_33 = 总_21_do_A8;
     临_do_34 = 0.0;
     临_do_35 = 0.0;
     if ( 总_22_do_B0>0.0 )
     {
       for (临_in_36 = OrdersTotal() - 1 ; 临_in_36 >= 0 ; 临_in_36=临_in_36 - 1)
       {
         if ( !(OrderSelect(临_in_36,0,0)) )   continue;
         
         if ( ( OrderType() != 1 && OrderSymbol() != Symbol() && OrderMagicNumber() != Magic ) )   continue;
         
         if ( OrderType() == 1 && OrderSymbol() == Symbol() && OrderMagicNumber() == Magic && (临_do_31 - Ask) / 总_47_do_158>=临_do_33 )
         {
           临_do_34 = OrderStopLoss();
           临_do_35 = NormalizeDouble(临_do_32 * 总_47_do_158 + Ask,Digits);
           if ( ( 临_do_34==0.0 || (临_do_34!=0.0 && 临_do_35<临_do_34) ) )
           {
             总_64_in_1D8 = OrderModify(OrderTicket(),临_do_31,临_do_35,OrderTakeProfit(),0,Red) ;
           }
         }
         Sleep(1000); 
         
       }
     }
   }
 }
 if ( 总_43_bo_14C )
 {
   子_43_do = NormalizeDouble(MarketInfo(Symbol(),MODE_SPREAD),2) ;
   子_44_do = 子_14_do ;
   子_45_do = 子_15_do ;
   子_46_do = AccountProfit() ;
   子_47_ui = LightGray ;
   子_48_ui = LightGray ;
   子_49_ui = LightGray ;
   子_50_ui = LightGray ;
   子_51_ui = LightGray ;
   子_52_ui = 0 ;
   if ( 子_46_do>0.0 )
   {
     子_48_ui = Lime ;
   }
   if ( 子_46_do<0.0 )
   {
     子_48_ui = Red ;
   }
   if ( 子_44_do>0.0 )
   {
     子_49_ui = Lime ;
   }
   if ( 子_44_do<0.0 )
   {
     子_49_ui = Red ;
   }
   if ( 子_45_do>0.0 )
   {
     子_50_ui = Lime ;
   }
   if ( 子_45_do<0.0 )
   {
     子_50_ui = Red ;
   }
   子_53_do = AccountFreeMargin() ;
   子_54_ui = White ;
   if ( 子_53_do>0.0 )
   {
     子_54_ui = GreenYellow ;
   }
   if ( 子_53_do<0.0 )
   {
     子_54_ui = Red ;
   }
   if ( 子_53_do==0.0 )
   {
     子_54_ui = Yellow ;
   }
   临_in_37 = 1;
   临_ui_38 = DodgerBlue;
   临_in_39 = 18;
   临_in_40 = 10;
   临_in_41 = 9;
   临_st_42 = WindowExpertName();
   if ( ObjectFind("ea") <  0 )
   {
     ObjectCreate("ea",OBJ_LABEL,0,0,0.0,0,0.0,0,0.0); 
   }
   ObjectSet("ea",OBJPROP_CORNER,临_in_37); 
   ObjectSet("ea",OBJPROP_XDISTANCE,临_in_40); 
   ObjectSet("ea",OBJPROP_YDISTANCE,临_in_39); 
   ObjectSetText("ea",临_st_42,临_in_41,"Arial bold",临_ui_38); 
   临_in_43 = 1;
   临_ui_44 = Red;
   临_in_45 = 33;
   临_in_46 = 10;
   临_in_47 = 8;
   临_st_48 = "Magic  " + DoubleToString(Magic,0);
   if ( ObjectFind("magic") <  0 )
   {
     ObjectCreate("magic",OBJ_LABEL,0,0,0.0,0,0.0,0,0.0); 
   }
   ObjectSet("magic",OBJPROP_CORNER,临_in_43); 
   ObjectSet("magic",OBJPROP_XDISTANCE,临_in_46); 
   ObjectSet("magic",OBJPROP_YDISTANCE,临_in_45); 
   ObjectSetText("magic",临_st_48,临_in_47,"Arial bold",临_ui_44); 
   临_in_49 = 1;
   临_ui_50 = 总_45_ui_150;
   临_in_51 = 60;
   临_in_52 = 10;
   临_in_53 = 8;
   临_st_54 = "ACCOUNT : " + DoubleToString(AccountNumber(),0);
   if ( ObjectFind("xnomer") <  0 )
   {
     ObjectCreate("xnomer",OBJ_LABEL,0,0,0.0,0,0.0,0,0.0); 
   }
   ObjectSet("xnomer",OBJPROP_CORNER,临_in_49); 
   ObjectSet("xnomer",OBJPROP_XDISTANCE,临_in_52); 
   ObjectSet("xnomer",OBJPROP_YDISTANCE,临_in_51); 
   ObjectSetText("xnomer",临_st_54,临_in_53,"Arial bold",临_ui_50); 
   临_in_55 = 1;
   临_ui_56 = 总_45_ui_150;
   临_in_57 = 75;
   临_in_58 = 10;
   临_in_59 = 8;
   临_st_60 = "NAMA : " + AccountName();
   if ( ObjectFind("xnama") <  0 )
   {
     ObjectCreate("xnama",OBJ_LABEL,0,0,0.0,0,0.0,0,0.0); 
   }
   ObjectSet("xnama",OBJPROP_CORNER,临_in_55); 
   ObjectSet("xnama",OBJPROP_XDISTANCE,临_in_58); 
   ObjectSet("xnama",OBJPROP_YDISTANCE,临_in_57); 
   ObjectSetText("xnama",临_st_60,临_in_59,"Arial bold",临_ui_56); 
   临_in_61 = 1;
   临_ui_62 = DimGray;
   临_in_63 = 90;
   临_in_64 = 10;
   临_in_65 = 8;
   临_st_66 = "==============================";
   if ( ObjectFind("line1") <  0 )
   {
     ObjectCreate("line1",OBJ_LABEL,0,0,0.0,0,0.0,0,0.0); 
   }
   ObjectSet("line1",OBJPROP_CORNER,临_in_61); 
   ObjectSet("line1",OBJPROP_XDISTANCE,临_in_64); 
   ObjectSet("line1",OBJPROP_YDISTANCE,临_in_63); 
   ObjectSetText("line1",临_st_66,临_in_65,"Arial bold",临_ui_62); 
   临_in_67 = 1;
   临_ui_68 = 总_45_ui_150;
   临_in_69 = 105;
   临_in_70 = 10;
   临_in_71 = 8;
   临_st_72 = "Leverage  1:" + DoubleToString(AccountLeverage(),0) + "      Spread   " + DoubleToString(子_43_do,0);
   if ( ObjectFind("leverage") <  0 )
   {
     ObjectCreate("leverage",OBJ_LABEL,0,0,0.0,0,0.0,0,0.0); 
   }
   ObjectSet("leverage",OBJPROP_CORNER,临_in_67); 
   ObjectSet("leverage",OBJPROP_XDISTANCE,临_in_70); 
   ObjectSet("leverage",OBJPROP_YDISTANCE,临_in_69); 
   ObjectSetText("leverage",临_st_72,临_in_71,"Arial bold",临_ui_68); 
   临_in_73 = 1;
   临_ui_74 = GreenYellow;
   临_in_75 = 125;
   临_in_76 = 100;
   临_in_77 = 8;
   临_st_78 = "BALANCE";
   if ( ObjectFind("balance") <  0 )
   {
     ObjectCreate("balance",OBJ_LABEL,0,0,0.0,0,0.0,0,0.0); 
   }
   ObjectSet("balance",OBJPROP_CORNER,临_in_73); 
   ObjectSet("balance",OBJPROP_XDISTANCE,临_in_76); 
   ObjectSet("balance",OBJPROP_YDISTANCE,临_in_75); 
   ObjectSetText("balance",临_st_78,临_in_77,"Arial bold",临_ui_74); 
   临_in_79 = 1;
   临_ui_80 = GreenYellow;
   临_in_81 = 125;
   临_in_82 = 10;
   临_in_83 = 8;
   临_st_84 = "EQUITY";
   if ( ObjectFind("equity") <  0 )
   {
     ObjectCreate("equity",OBJ_LABEL,0,0,0.0,0,0.0,0,0.0); 
   }
   ObjectSet("equity",OBJPROP_CORNER,临_in_79); 
   ObjectSet("equity",OBJPROP_XDISTANCE,临_in_82); 
   ObjectSet("equity",OBJPROP_YDISTANCE,临_in_81); 
   ObjectSetText("equity",临_st_84,临_in_83,"Arial bold",临_ui_80); 
   临_in_85 = 1;
   临_ui_86 = GreenYellow;
   临_in_87 = 140;
   临_in_88 = 100;
   临_in_89 = 8;
   临_st_90 = "$ " + DoubleToString(AccountBalance(),2);
   if ( ObjectFind("nilaibalance") <  0 )
   {
     ObjectCreate("nilaibalance",OBJ_LABEL,0,0,0.0,0,0.0,0,0.0); 
   }
   ObjectSet("nilaibalance",OBJPROP_CORNER,临_in_85); 
   ObjectSet("nilaibalance",OBJPROP_XDISTANCE,临_in_88); 
   ObjectSet("nilaibalance",OBJPROP_YDISTANCE,临_in_87); 
   ObjectSetText("nilaibalance",临_st_90,临_in_89,"Arial bold",临_ui_86); 
   临_in_91 = 1;
   临_ui_92 = GreenYellow;
   临_in_93 = 140;
   临_in_94 = 10;
   临_in_95 = 8;
   临_st_96 = "$ " + DoubleToString(AccountEquity(),2);
   if ( ObjectFind("nilaiequity") <  0 )
   {
     ObjectCreate("nilaiequity",OBJ_LABEL,0,0,0.0,0,0.0,0,0.0); 
   }
   ObjectSet("nilaiequity",OBJPROP_CORNER,临_in_91); 
   ObjectSet("nilaiequity",OBJPROP_XDISTANCE,临_in_94); 
   ObjectSet("nilaiequity",OBJPROP_YDISTANCE,临_in_93); 
   ObjectSetText("nilaiequity",临_st_96,临_in_95,"Arial bold",临_ui_92); 
   临_in_97 = 1;
   临_ui_98 = 子_54_ui;
   临_in_99 = 170;
   临_in_100 = 100;
   临_in_101 = 8;
   临_st_102 = "F-Margin";
   if ( ObjectFind("fmargin") <  0 )
   {
     ObjectCreate("fmargin",OBJ_LABEL,0,0,0.0,0,0.0,0,0.0); 
   }
   ObjectSet("fmargin",OBJPROP_CORNER,临_in_97); 
   ObjectSet("fmargin",OBJPROP_XDISTANCE,临_in_100); 
   ObjectSet("fmargin",OBJPROP_YDISTANCE,临_in_99); 
   ObjectSetText("fmargin",临_st_102,临_in_101,"Arial bold",临_ui_98); 
   临_in_103 = 1;
   临_ui_104 = 子_54_ui;
   临_in_105 = 170;
   临_in_106 = 10;
   临_in_107 = 8;
   临_st_108 = "Margin";
   if ( ObjectFind("margin") <  0 )
   {
     ObjectCreate("margin",OBJ_LABEL,0,0,0.0,0,0.0,0,0.0); 
   }
   ObjectSet("margin",OBJPROP_CORNER,临_in_103); 
   ObjectSet("margin",OBJPROP_XDISTANCE,临_in_106); 
   ObjectSet("margin",OBJPROP_YDISTANCE,临_in_105); 
   ObjectSetText("margin",临_st_108,临_in_107,"Arial bold",临_ui_104); 
   临_in_109 = 1;
   临_ui_110 = 子_54_ui;
   临_in_111 = 185;
   临_in_112 = 100;
   临_in_113 = 8;
   临_st_114 = "$ " + DoubleToString(AccountFreeMargin(),2);
   if ( ObjectFind("nilaifmargin") <  0 )
   {
     ObjectCreate("nilaifmargin",OBJ_LABEL,0,0,0.0,0,0.0,0,0.0); 
   }
   ObjectSet("nilaifmargin",OBJPROP_CORNER,临_in_109); 
   ObjectSet("nilaifmargin",OBJPROP_XDISTANCE,临_in_112); 
   ObjectSet("nilaifmargin",OBJPROP_YDISTANCE,临_in_111); 
   ObjectSetText("nilaifmargin",临_st_114,临_in_113,"Arial bold",临_ui_110); 
   临_in_115 = 1;
   临_ui_116 = 子_54_ui;
   临_in_117 = 185;
   临_in_118 = 10;
   临_in_119 = 8;
   临_st_120 = "$ " + DoubleToString(AccountMargin(),2);
   if ( ObjectFind("nilaimargin") <  0 )
   {
     ObjectCreate("nilaimargin",OBJ_LABEL,0,0,0.0,0,0.0,0,0.0); 
   }
   ObjectSet("nilaimargin",OBJPROP_CORNER,临_in_115); 
   ObjectSet("nilaimargin",OBJPROP_XDISTANCE,临_in_118); 
   ObjectSet("nilaimargin",OBJPROP_YDISTANCE,临_in_117); 
   ObjectSetText("nilaimargin",临_st_120,临_in_119,"Arial bold",临_ui_116); 
   子_55_do = 子_9_in ;
   子_56_do = 子_10_in ;
   if ( ( 子_56_do>0.0 || 子_55_do>0.0 ) )
   {
     子_51_ui = YellowGreen ;
   }
   临_in_121 = 1;
   临_ui_122 = 子_49_ui;
   临_in_123 = 215;
   临_in_124 = 10;
   临_in_125 = 8;
   临_st_126 = "Buy   " + DoubleToString(子_55_do,0) + "  |  Lot " + DoubleToString(子_16_do,2) + "  |  Profit $ " + DoubleToString(子_44_do,2);
   if ( ObjectFind("buy") <  0 )
   {
     ObjectCreate("buy",OBJ_LABEL,0,0,0.0,0,0.0,0,0.0); 
   }
   ObjectSet("buy",OBJPROP_CORNER,临_in_121); 
   ObjectSet("buy",OBJPROP_XDISTANCE,临_in_124); 
   ObjectSet("buy",OBJPROP_YDISTANCE,临_in_123); 
   ObjectSetText("buy",临_st_126,临_in_125,"Arial bold",临_ui_122); 
   临_in_127 = 1;
   临_ui_128 = 子_50_ui;
   临_in_129 = 230;
   临_in_130 = 10;
   临_in_131 = 8;
   临_st_132 = "Sell   " + DoubleToString(子_56_do,0) + "  |  Lot " + DoubleToString(子_17_do,2) + "  |  Profit $ " + DoubleToString(子_45_do,2);
   if ( ObjectFind("sell") <  0 )
   {
     ObjectCreate("sell",OBJ_LABEL,0,0,0.0,0,0.0,0,0.0); 
   }
   ObjectSet("sell",OBJPROP_CORNER,临_in_127); 
   ObjectSet("sell",OBJPROP_XDISTANCE,临_in_130); 
   ObjectSet("sell",OBJPROP_YDISTANCE,临_in_129); 
   ObjectSetText("sell",临_st_132,临_in_131,"Arial bold",临_ui_128); 
   临_in_133 = 1;
   临_ui_134 = 子_48_ui;
   临_in_135 = 245;
   临_in_136 = 10;
   临_in_137 = 8;
   临_st_138 = "Profit All " + DoubleToString(子_46_do,1) + " ~ " + DoubleToString(子_24_do,1) + " %";
   if ( ObjectFind("ALL") <  0 )
   {
     ObjectCreate("ALL",OBJ_LABEL,0,0,0.0,0,0.0,0,0.0); 
   }
   ObjectSet("ALL",OBJPROP_CORNER,临_in_133); 
   ObjectSet("ALL",OBJPROP_XDISTANCE,临_in_136); 
   ObjectSet("ALL",OBJPROP_YDISTANCE,临_in_135); 
   ObjectSetText("ALL",临_st_138,临_in_137,"Arial bold",临_ui_134); 
   临_in_139 = 1;
   临_ui_140 = DimGray;
   临_in_141 = 255;
   临_in_142 = 10;
   临_in_143 = 8;
   临_st_144 = "==============================";
   if ( ObjectFind("line2") <  0 )
   {
     ObjectCreate("line2",OBJ_LABEL,0,0,0.0,0,0.0,0,0.0); 
   }
   ObjectSet("line2",OBJPROP_CORNER,临_in_139); 
   ObjectSet("line2",OBJPROP_XDISTANCE,临_in_142); 
   ObjectSet("line2",OBJPROP_YDISTANCE,临_in_141); 
   ObjectSetText("line2",临_st_144,临_in_143,"Arial bold",临_ui_140); 
   临_in_145 = 1;
   临_ui_146 = Goldenrod;
   临_in_147 = 1;
   临_in_148 = 550;
   临_in_149 = 8;
   临_st_150 = "[TimeServer | " + TimeToString(TimeCurrent(),5) + "]";
   if ( ObjectFind("Time") <  0 )
   {
     ObjectCreate("Time",OBJ_LABEL,0,0,0.0,0,0.0,0,0.0); 
   }
   ObjectSet("Time",OBJPROP_CORNER,临_in_145); 
   ObjectSet("Time",OBJPROP_XDISTANCE,临_in_148); 
   ObjectSet("Time",OBJPROP_YDISTANCE,临_in_147); 
   ObjectSetText("Time",临_st_150,临_in_149,"Arial bold",临_ui_146); 
   临_ui_151 = Goldenrod;
   临_in_152 = 10;
   临_in_153 = 10;
   临_in_154 = 7;
   临_st_155 = "Copyright @ 2020 bung.jai@gmail.com";
   if ( ObjectFind("and") <  0 )
   {
     ObjectCreate("and",OBJ_LABEL,0,0,0.0,0,0.0,0,0.0); 
   }
   ObjectSet("and",OBJPROP_CORNER,3.0); 
   ObjectSet("and",OBJPROP_XDISTANCE,临_in_153); 
   ObjectSet("and",OBJPROP_YDISTANCE,临_in_152); 
   ObjectSetText("and",临_st_155,临_in_154,"Arial bold",临_ui_151); 
   临_ui_156 = WhiteSmoke;
   临_in_157 = 5;
   临_in_158 = 300;
   临_in_159 = 10;
   临_st_160 = "DD " + DoubleToString(总_53_do_188,1) + " %";
   if ( ObjectFind("dd") <  0 )
   {
     ObjectCreate("dd",OBJ_LABEL,0,0,0.0,0,0.0,0,0.0); 
   }
   ObjectSet("dd",OBJPROP_CORNER,3.0); 
   ObjectSet("dd",OBJPROP_XDISTANCE,临_in_158); 
   ObjectSet("dd",OBJPROP_YDISTANCE,临_in_157); 
   ObjectSetText("dd",临_st_160,临_in_159,"Arial bold",临_ui_156); 
 }
 return(0); 
 }
//start <<==--------   --------
 void OnChartEvent( const int 木_0_in,const long & 木_1_lo,const double & 木_2_do,const string & 木_3_st)
 {
  string    子_1_st;
  int       子_2_in;
  string    子_3_st;
  int       子_4_in;
  string    子_5_st;
  int       子_6_in;
  string    子_7_st;
  int       子_8_in;
//----- -----

 if ( 木_3_st == "Close All" )
 {
   子_1_st = "Do you want close all order pair " + Symbol() + "?" ;
   PlaySound("alert.wav"); 
   子_2_in = MessageBox(子_1_st,"Close ALL",4) ;
   if ( 子_2_in == 6 )
   {
     lizong_9(1); 
     lizong_9(0); 
   }
   ObjectSetInteger(0,"Close All",OBJPROP_STATE,0); 
   return;
 }
 if ( 木_3_st == "Close Buy" )
 {
   子_3_st = "Do you want close all order Buy pair " + Symbol() + "?" ;
   PlaySound("alert.wav"); 
   子_4_in = MessageBox(子_3_st,"Close Order Buy",4) ;
   if ( 子_4_in == 6 )
   {
     lizong_9(0); 
   }
   ObjectSetInteger(0,"Close Buy",OBJPROP_STATE,0); 
   return;
 }
 if ( 木_3_st == "Close Sell" )
 {
   子_5_st = "Do you want close all order Sell pair " + Symbol() + "?" ;
   PlaySound("alert.wav"); 
   子_6_in = MessageBox(子_5_st,"Close Order Sell",4) ;
   if ( 子_6_in == 6 )
   {
     lizong_9(1); 
   }
   ObjectSetInteger(0,"Close Sell",OBJPROP_STATE,0); 
   return;
 }
 if ( 木_3_st != "Close All Order" )   return;
 子_7_st = "Do you want close all order?" ;
 PlaySound("alert.wav"); 
 子_8_in = MessageBox(子_7_st,"Close All Order",4) ;
 if ( 子_8_in == 6 )
 {
   lizong_9(-1); 
 }
 ObjectSetInteger(0,"Close All Order",OBJPROP_STATE,0); 
 }
//OnChartEvent <<==--------   --------
 void OnDeinit( const int 木_0_in)
 {
 }
//OnDeinit <<==--------   --------
 void lizong_7()
 {
 int        临_in_1;
 int        临_in_2;
 int        临_in_3;
 int        临_in_4;
 int        临_in_5;
 int        临_in_6;

 总_58_do_1B0 = 0.0 ;
 总_60_do_1C0 = 0.0 ;
 if ( 总_17_in_84 == 0 )
 {
   if ( TP>0.0 )
   {
     总_58_do_1B0 = TP * 总_47_do_158 + Ask ;
   }
   if ( 总_19_do_90>0.0 )
   {
     总_60_do_1C0 = Ask - 总_19_do_90 * 总_47_do_158 ;
   }
 }
 if ( 总_17_in_84 == 1 )
 {
   if ( TP>0.0 )
   {
     临_in_1 = 1;
     临_in_2 = 0;
     for (临_in_3 = 0 ; 临_in_3 < OrdersTotal() ; 临_in_3=临_in_3 + 1)
     {
       if ( !(OrderSelect(临_in_3,0,0)) )   continue;
       
       if ( OrderSymbol() == Symbol() && OrderType() == 临_in_1 && OrderMagicNumber() == Magic )
       {
         临_in_2=临_in_2 + 1;
       }
       if ( OrderSymbol() != Symbol() || 临_in_1 != -1 || OrderMagicNumber() != Magic )   continue;
       临_in_2=临_in_2 + 1;
       
     }
     if ( 临_in_2 == 0 )
     {
       总_58_do_1B0 = TP * 总_47_do_158 + Ask ;
     }
   }
   if ( 总_19_do_90>0.0 )
   {
     临_in_4 = 1;
     临_in_5 = 0;
     for (临_in_6 = 0 ; 临_in_6 < OrdersTotal() ; 临_in_6=临_in_6 + 1)
     {
       if ( !(OrderSelect(临_in_6,0,0)) )   continue;
       
       if ( OrderSymbol() == Symbol() && OrderType() == 临_in_4 && OrderMagicNumber() == Magic )
       {
         临_in_5=临_in_5 + 1;
       }
       if ( OrderSymbol() != Symbol() || 临_in_4 != -1 || OrderMagicNumber() != Magic )   continue;
       临_in_5=临_in_5 + 1;
       
     }
     if ( 临_in_5 == 0 )
     {
       总_60_do_1C0 = Ask - 总_19_do_90 * 总_47_do_158 ;
     }
   }
 }
 总_63_in_1D4 = OrderSend(Symbol(),0,总_50_do_170,Ask,总_38_in_12C,总_60_do_1C0,总_58_do_1B0,总_37_st_120 + "# " + IntegerToString(1,0,32),Magic,0,Green) ;
 }
//lizong_7 <<==--------   --------
 void lizong_8()
 {
 int        临_in_1;
 int        临_in_2;
 int        临_in_3;
 int        临_in_4;
 int        临_in_5;
 int        临_in_6;

 总_58_do_1B0 = 0.0 ;
 总_60_do_1C0 = 0.0 ;
 if ( 总_17_in_84 == 0 )
 {
   if ( TP>0.0 )
   {
     总_58_do_1B0 = Bid - TP * 总_47_do_158 ;
   }
   if ( 总_19_do_90>0.0 )
   {
     总_60_do_1C0 = 总_19_do_90 * 总_47_do_158 + Bid ;
   }
 }
 if ( 总_17_in_84 == 1 )
 {
   if ( TP>0.0 )
   {
     临_in_1 = 0;
     临_in_2 = 0;
     for (临_in_3 = 0 ; 临_in_3 < OrdersTotal() ; 临_in_3=临_in_3 + 1)
     {
       if ( !(OrderSelect(临_in_3,0,0)) )   continue;
       
       if ( OrderSymbol() == Symbol() && OrderType() == 临_in_1 && OrderMagicNumber() == Magic )
       {
         临_in_2=临_in_2 + 1;
       }
       if ( OrderSymbol() != Symbol() || 临_in_1 != -1 || OrderMagicNumber() != Magic )   continue;
       临_in_2=临_in_2 + 1;
       
     }
     if ( 临_in_2 == 0 )
     {
       总_58_do_1B0 = Bid - TP * 总_47_do_158 ;
     }
   }
   if ( 总_19_do_90>0.0 )
   {
     临_in_4 = 0;
     临_in_5 = 0;
     for (临_in_6 = 0 ; 临_in_6 < OrdersTotal() ; 临_in_6=临_in_6 + 1)
     {
       if ( !(OrderSelect(临_in_6,0,0)) )   continue;
       
       if ( OrderSymbol() == Symbol() && OrderType() == 临_in_4 && OrderMagicNumber() == Magic )
       {
         临_in_5=临_in_5 + 1;
       }
       if ( OrderSymbol() != Symbol() || 临_in_4 != -1 || OrderMagicNumber() != Magic )   continue;
       临_in_5=临_in_5 + 1;
       
     }
     if ( 临_in_5 == 0 )
     {
       总_60_do_1C0 = 总_19_do_90 * 总_47_do_158 + Bid ;
     }
   }
 }
 总_63_in_1D4 = OrderSend(Symbol(),1,总_50_do_170,Bid,总_38_in_12C,总_60_do_1C0,总_58_do_1B0,总_37_st_120 + "# " + IntegerToString(1,0,32),Magic,0,Gold) ;
 }
//lizong_8 <<==--------   --------
 int lizong_9( int 木_0_in)
 {
  int       子_2_in;
//----- -----

 总_64_in_1D8 = 0 ;
 子_2_in = OrdersTotal() ;
 for (总_62_in_1D0=子_2_in - 1 ; 总_62_in_1D0 >= 0 ; 总_62_in_1D0 --)
 {
   if ( !(OrderSelect(总_62_in_1D0,0,0)) )   continue;
   
   if ( OrderSymbol() == Symbol() && OrderType() == 0 && 木_0_in == 0 && OrderMagicNumber() == Magic )
   {
     总_64_in_1D8 = OrderClose(OrderTicket(),OrderLots(),MarketInfo(OrderSymbol(),MODE_BID),5,0xFFFFFFFF) ;
   }
   if ( OrderSymbol() == Symbol() && OrderType() == 1 && 木_0_in == 1 && OrderMagicNumber() == Magic )
   {
     总_64_in_1D8 = OrderClose(OrderTicket(),OrderLots(),MarketInfo(OrderSymbol(),MODE_ASK),5,0xFFFFFFFF) ;
   }
   if ( OrderSymbol() == Symbol() && OrderType() == 3 && 木_0_in == 3 && OrderMagicNumber() == Magic )
   {
     总_64_in_1D8 = OrderDelete(OrderTicket(),0xFFFFFFFF) ;
   }
   if ( OrderSymbol() == Symbol() && OrderType() == 2 && 木_0_in == 2 && OrderMagicNumber() == Magic )
   {
     总_64_in_1D8 = OrderDelete(OrderTicket(),0xFFFFFFFF) ;
   }
   if ( OrderSymbol() == Symbol() && OrderType() == 5 && 木_0_in == 5 && OrderMagicNumber() == Magic )
   {
     总_64_in_1D8 = OrderDelete(OrderTicket(),0xFFFFFFFF) ;
   }
   if ( OrderSymbol() == Symbol() && OrderType() == 4 && 木_0_in == 4 && OrderMagicNumber() == Magic )
   {
     总_64_in_1D8 = OrderDelete(OrderTicket(),0xFFFFFFFF) ;
   }
   if ( 木_0_in != -1 )   continue;
   
   if ( OrderType() == 1 )
   {
     总_64_in_1D8 = OrderClose(OrderTicket(),OrderLots(),MarketInfo(OrderSymbol(),MODE_ASK),5,0xFFFFFFFF) ;
   }
   if ( OrderType() == 0 )
   {
     总_64_in_1D8 = OrderClose(OrderTicket(),OrderLots(),MarketInfo(OrderSymbol(),MODE_BID),5,0xFFFFFFFF) ;
   }
   if ( OrderType() <= 1 )   continue;
   总_64_in_1D8 = OrderDelete(OrderTicket(),0xFFFFFFFF) ;
   
 }
 return(总_64_in_1D8); 
 }
//lizong_9 <<==--------   --------
 void lizong_10()
 {
  int       子_1_in = 0;
  double    子_2_do = 0.0;
  double    子_3_do = 0.0;
  double    子_4_do = 0.0;
  double    子_5_do = 0.0;
  double    子_6_do = 0.0;
  double    子_7_do = 0.0;
  int       子_8_in;
  int       子_9_in;
  double    子_10_do;
  double    子_11_do;
  int       子_12_in;
  int       子_13_in;
  long      子_14_lo;
  double    子_15_do;
  double    子_16_do;
  double    子_17_do;
  double    子_18_do;
  double    子_19_do;
  int       子_20_in;
  int       子_21_in;
//----- -----
 int        临_in_1;
 double     临_do_2;
 double     临_do_3;
 double     临_do_4;
 double     临_do_5;
 int        临_in_6;
 double     临_do_7;
 int        临_in_8;
 double     临_do_9;
 double     临_do_10;
 double     临_do_11;
 double     临_do_12;
 int        临_in_13;
 double     临_do_14;
 int        临_in_15;
 double     临_do_16;
 double     临_do_17;
 double     临_do_18;
 double     临_do_19;
 int        临_in_20;
 double     临_do_21;
 int        临_in_22;
 double     临_do_23;
 double     临_do_24;
 double     临_do_25;
 double     临_do_26;
 int        临_in_27;
 double     临_do_28;
 double     临_do_29;
 int        临_in_30;
 double     临_do_31;
 double     临_do_32;
 int        临_in_33;
 double     临_do_34;

 子_8_in = 0 ;
 子_9_in = 0 ;
 for (子_1_in = 0 ; 子_1_in < OrdersTotal() ; 子_1_in ++)
 {
   总_63_in_1D4 = OrderSelect(子_1_in,0,0) ;
   if ( OrderType() == 0 && OrderSymbol() == Symbol() && OrderMagicNumber() == Magic )
   {
     if ( 子_2_do==0.0 )
     {
       子_2_do = OrderOpenPrice() ;
     }
     if ( 子_2_do>OrderOpenPrice() )
     {
       子_2_do = OrderOpenPrice() ;
     }
     if ( 子_4_do==0.0 )
     {
       子_4_do = OrderLots() ;
     }
     if ( 子_4_do>OrderLots() )
     {
       子_4_do = OrderLots() ;
     }
     if ( 子_6_do<OrderLots() )
     {
       子_6_do = OrderLots() ;
     }
     子_8_in ++;
   }
   if ( OrderType() != 1 || OrderSymbol() != Symbol() || OrderMagicNumber() != Magic )   continue;
   
   if ( 子_3_do==0.0 )
   {
     子_3_do = OrderOpenPrice() ;
   }
   if ( 子_3_do<OrderOpenPrice() )
   {
     子_3_do = OrderOpenPrice() ;
   }
   if ( 子_5_do==0.0 )
   {
     子_5_do = OrderLots() ;
   }
   if ( 子_5_do>OrderLots() )
   {
     子_5_do = OrderLots() ;
   }
   if ( 子_7_do<OrderLots() )
   {
     子_7_do = OrderLots() ;
   }
   子_9_in ++;
   
 }
 子_10_do = 子_4_do ;
 子_11_do = 子_5_do ;
 if ( 总_24_in_C4 == 1 )
 {
   for (子_12_in = 0 ; 子_12_in < 子_8_in ; 子_12_in ++)
   {
     子_10_do = 子_10_do * 总_25_do_C8 ;
   }
   for (子_13_in = 0 ; 子_13_in < 子_9_in ; 子_13_in ++)
   {
     子_11_do = 子_11_do * 总_25_do_C8 ;
   }
 }
 else
 {
   子_10_do = 子_6_do + 总_26_do_D0 ;
   子_11_do = 子_7_do + 总_26_do_D0 ;
 }
 子_10_do = NormalizeDouble(子_10_do,2) ;
 子_11_do = NormalizeDouble(子_11_do,2) ;
 子_14_lo=Volume[0] + 100;
 if ( 总_29_in_E4 )
 {
   子_14_lo = 15 ;
 }
 子_15_do = iIchimoku(Symbol(),总_11_in_64,总_13_in_6C,总_14_in_70,总_15_in_74,3,1) ;
 子_16_do = iIchimoku(Symbol(),总_11_in_64,总_13_in_6C,总_14_in_70,总_15_in_74,4,1) ;
 子_17_do = iClose(Symbol(),总_11_in_64,1) ;
 子_18_do = 子_17_do>子_16_do || 子_17_do>子_15_do ;
 子_19_do = 子_17_do<子_15_do || 子_17_do<子_16_do ;
 if ( 子_8_in >  0 && Ask<=子_2_do - 总_27_do_D8 * 总_47_do_158 && 子_8_in <  总_28_in_E0 && Volume[0] <  子_14_lo )
 {
   子_20_in=子_8_in + 1;
   总_60_do_1C0 = 0.0 ;
   if ( 总_19_do_90>0.0 && 总_56_do_1A0>0.0 )
   {
     总_60_do_1C0 = 总_56_do_1A0 ;
   }
   总_63_in_1D4 = OrderSend(Symbol(),0,子_10_do,Ask,3,总_60_do_1C0,0.0,总_37_st_120 + " #  " + IntegerToString(子_20_in,0,32),Magic,16711680,0xFFFFFFFF) ;
 }
 if ( 子_9_in >  0 && Bid>=总_27_do_D8 * 总_47_do_158 + 子_3_do && 子_9_in <  总_28_in_E0 && Volume[0] <  子_14_lo )
 {
   子_21_in=子_9_in + 1;
   总_61_do_1C8 = 0.0 ;
   if ( 总_19_do_90>0.0 && 总_57_do_1A8>0.0 )
   {
     总_61_do_1C8 = 总_57_do_1A8 ;
   }
   总_63_in_1D4 = OrderSend(Symbol(),1,子_11_do,Bid,3,总_61_do_1C8,0.0,总_37_st_120 + " #  " + IntegerToString(子_21_in,0,32),Magic,55295,0xFFFFFFFF) ;
 }
 if ( 总_17_in_84 == 0 )
 {
   if ( 子_9_in >  1 && TP>0.0 )
   {
     临_in_1 = 1;
     临_do_2 = 0.0;
     临_do_3 = 0.0;
     for (总_62_in_1D0 = 0 ; 总_62_in_1D0 < OrdersTotal() ; 总_62_in_1D0 ++)
     {
       总_63_in_1D4 = OrderSelect(总_62_in_1D0,0,0) ;
       if ( OrderSymbol() != Symbol() || OrderMagicNumber() != Magic || OrderType() != 临_in_1 )   continue;
       临_do_2 = 临_do_2 + OrderLots();
       临_do_3 = OrderLots() * OrderOpenPrice() + 临_do_3;
       
     }
     if ( 临_do_2!=0.0 )
     {
       临_do_4 = (临_do_3) / (临_do_2);
     }
     else
     {
       临_do_4 = 0.0;
     }
     临_do_5 = 临_do_4 - TP * 总_47_do_158;
     临_in_6 = 1;
     for (总_62_in_1D0 = OrdersTotal() ; 总_62_in_1D0 >= 0 ; 总_62_in_1D0 --)
     {
       总_63_in_1D4 = OrderSelect(总_62_in_1D0,0,0) ;
       if ( OrderSymbol() != Symbol() || OrderMagicNumber() != Magic || OrderType() != 临_in_6 )   continue;
       临_do_7 = NormalizeDouble(OrderTakeProfit(),Digits);
       if ( !(临_do_7!=NormalizeDouble(临_do_5,Digits)) )   continue;
       总_63_in_1D4 = OrderModify(OrderTicket(),OrderOpenPrice(),OrderStopLoss(),NormalizeDouble(临_do_5,Digits),0,0xFFFFFFFF) ;
       
     }
   }
   if ( 子_8_in >  1 && TP>0.0 )
   {
     临_in_8 = 0;
     临_do_9 = 0.0;
     临_do_10 = 0.0;
     for (总_62_in_1D0 = 0 ; 总_62_in_1D0 < OrdersTotal() ; 总_62_in_1D0 ++)
     {
       总_63_in_1D4 = OrderSelect(总_62_in_1D0,0,0) ;
       if ( OrderSymbol() != Symbol() || OrderMagicNumber() != Magic || OrderType() != 临_in_8 )   continue;
       临_do_9 = 临_do_9 + OrderLots();
       临_do_10 = OrderLots() * OrderOpenPrice() + 临_do_10;
       
     }
     if ( 临_do_9!=0.0 )
     {
       临_do_11 = (临_do_10) / (临_do_9);
     }
     else
     {
       临_do_11 = 0.0;
     }
     临_do_12 = TP * 总_47_do_158 + 临_do_11;
     临_in_13 = 0;
     for (总_62_in_1D0 = OrdersTotal() ; 总_62_in_1D0 >= 0 ; 总_62_in_1D0 --)
     {
       总_63_in_1D4 = OrderSelect(总_62_in_1D0,0,0) ;
       if ( OrderSymbol() != Symbol() || OrderMagicNumber() != Magic || OrderType() != 临_in_13 )   continue;
       临_do_14 = NormalizeDouble(OrderTakeProfit(),Digits);
       if ( !(临_do_14!=NormalizeDouble(临_do_12,Digits)) )   continue;
       总_63_in_1D4 = OrderModify(OrderTicket(),OrderOpenPrice(),OrderStopLoss(),NormalizeDouble(临_do_12,Digits),0,0xFFFFFFFF) ;
       
     }
   }
 }
 if ( 总_17_in_84 != 1 )   return;
 
 if ( 子_9_in >  1 && 子_8_in == 0 && TP>0.0 )
 {
   临_in_15 = 1;
   临_do_16 = 0.0;
   临_do_17 = 0.0;
   for (总_62_in_1D0 = 0 ; 总_62_in_1D0 < OrdersTotal() ; 总_62_in_1D0 ++)
   {
     总_63_in_1D4 = OrderSelect(总_62_in_1D0,0,0) ;
     if ( OrderSymbol() != Symbol() || OrderMagicNumber() != Magic || OrderType() != 临_in_15 )   continue;
     临_do_16 = 临_do_16 + OrderLots();
     临_do_17 = OrderLots() * OrderOpenPrice() + 临_do_17;
     
   }
   if ( 临_do_16!=0.0 )
   {
     临_do_18 = (临_do_17) / (临_do_16);
   }
   else
   {
     临_do_18 = 0.0;
   }
   临_do_19 = 临_do_18 - TP * 总_47_do_158;
   临_in_20 = 1;
   for (总_62_in_1D0 = OrdersTotal() ; 总_62_in_1D0 >= 0 ; 总_62_in_1D0 --)
   {
     总_63_in_1D4 = OrderSelect(总_62_in_1D0,0,0) ;
     if ( OrderSymbol() != Symbol() || OrderMagicNumber() != Magic || OrderType() != 临_in_20 )   continue;
     临_do_21 = NormalizeDouble(OrderTakeProfit(),Digits);
     if ( !(临_do_21!=NormalizeDouble(临_do_19,Digits)) )   continue;
     总_63_in_1D4 = OrderModify(OrderTicket(),OrderOpenPrice(),OrderStopLoss(),NormalizeDouble(临_do_19,Digits),0,0xFFFFFFFF) ;
     
   }
 }
 if ( 子_8_in >  1 && 子_9_in == 0 && TP>0.0 )
 {
   临_in_22 = 0;
   临_do_23 = 0.0;
   临_do_24 = 0.0;
   for (总_62_in_1D0 = 0 ; 总_62_in_1D0 < OrdersTotal() ; 总_62_in_1D0 ++)
   {
     总_63_in_1D4 = OrderSelect(总_62_in_1D0,0,0) ;
     if ( OrderSymbol() != Symbol() || OrderMagicNumber() != Magic || OrderType() != 临_in_22 )   continue;
     临_do_23 = 临_do_23 + OrderLots();
     临_do_24 = OrderLots() * OrderOpenPrice() + 临_do_24;
     
   }
   if ( 临_do_23!=0.0 )
   {
     临_do_25 = (临_do_24) / (临_do_23);
   }
   else
   {
     临_do_25 = 0.0;
   }
   临_do_26 = TP * 总_47_do_158 + 临_do_25;
   临_in_27 = 0;
   for (总_62_in_1D0 = OrdersTotal() ; 总_62_in_1D0 >= 0 ; 总_62_in_1D0 --)
   {
     总_63_in_1D4 = OrderSelect(总_62_in_1D0,0,0) ;
     if ( OrderSymbol() != Symbol() || OrderMagicNumber() != Magic || OrderType() != 临_in_27 )   continue;
     临_do_28 = NormalizeDouble(OrderTakeProfit(),Digits);
     if ( !(临_do_28!=NormalizeDouble(临_do_26,Digits)) )   continue;
     总_63_in_1D4 = OrderModify(OrderTicket(),OrderOpenPrice(),OrderStopLoss(),NormalizeDouble(临_do_26,Digits),0,0xFFFFFFFF) ;
     
   }
 }
 if ( 子_9_in >  0 && 子_8_in >  0 && TP>0.0 )
 {
   临_do_29 = 0.0;
   临_in_30 = 1;
   for (总_62_in_1D0 = OrdersTotal() ; 总_62_in_1D0 >= 0 ; 总_62_in_1D0 --)
   {
     总_63_in_1D4 = OrderSelect(总_62_in_1D0,0,0) ;
     if ( OrderSymbol() != Symbol() || OrderMagicNumber() != Magic || OrderType() != 临_in_30 )   continue;
     临_do_31 = NormalizeDouble(OrderTakeProfit(),Digits);
     if ( !(临_do_31!=NormalizeDouble(临_do_29,Digits)) )   continue;
     总_63_in_1D4 = OrderModify(OrderTicket(),OrderOpenPrice(),OrderStopLoss(),NormalizeDouble(临_do_29,Digits),0,0xFFFFFFFF) ;
     
   }
 }
 if ( 子_8_in <= 0 || 子_9_in <= 0 || !(TP>0.0) )   return;
 临_do_32 = 0.0;
 临_in_33 = 0;
 for (总_62_in_1D0 = OrdersTotal() ; 总_62_in_1D0 >= 0 ; 总_62_in_1D0 --)
 {
   总_63_in_1D4 = OrderSelect(总_62_in_1D0,0,0) ;
   if ( OrderSymbol() != Symbol() || OrderMagicNumber() != Magic || OrderType() != 临_in_33 )   continue;
   临_do_34 = NormalizeDouble(OrderTakeProfit(),Digits);
   if ( !(临_do_34!=NormalizeDouble(临_do_32,Digits)) )   continue;
   总_63_in_1D4 = OrderModify(OrderTicket(),OrderOpenPrice(),OrderStopLoss(),NormalizeDouble(临_do_32,Digits),0,0xFFFFFFFF) ;
   
 }
 }
//<<==lizong_10 <<==

