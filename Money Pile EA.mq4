//EA交易     =>  ...\MT4\MQL4\Experts

#property  copyright "Money Pile EA"
#property  link      "www.moneypileea.com"
#property strict

  enum Corner      {Upper_left = 0,Upper_right = 1,Lower_left = 2,Lower_right = 3  };


//------------------
extern double Lots=0.01  ;   
extern double PipStep=80  ;   
extern bool MM=false ;   
extern double TakeProfit=100  ;   
extern bool UseStopLoss=true  ;   
extern double StopLoss=4000  ;   
extern bool UseTrailingStop=true  ;   
extern double TrailStart=13  ;   
extern double TrailStop=3  ;   
  bool      总_1_bo = false;
  bool      总_2_bo = true;
  bool      总_3_bo = false;
  string    总_4_st = "SETTINGS";
  double    总_5_do = 1.11;
  int       总_6_in = 2;
  double    总_7_do = 50.0;
  bool      总_8_bo = false;
  double    总_9_do = 20.0;
  double    总_10_do = 5.0;
  string    总_11_st = "Blazer1";
  int       总_12_in = 100;
  bool      总_13_bo = false;
  double    总_14_do = 48.0;
  double    总_15_do = StopLoss;
  double    总_16_do = 0.0;
  int       总_17_in = 10278;
  double    总_18_do = 0.0;
  double    总_19_do = 0.0;
  double    总_20_do = 0.0;
  double    总_21_do = 0.0;
  double    总_22_do = 0.0;
  double    总_23_do = 0.0;
  double    总_24_do = 0.0;
  double    总_25_do = 0.0;
  double    总_26_do = 0.0;
  double    总_27_do = 0.0;
  double    总_28_do = 0.0;
  double    总_29_do = 0.0;
  bool      总_30_bo = false;
  string    总_31_st = "";
  int       总_32_in = 0;
  int       总_33_in = 0;
  int       总_34_in = 0;
  double    总_35_do = 0.0;
  int       总_36_in = 0;
  int       总_37_in = 0;
  double    总_38_do = 0.0;
  bool      总_39_bo = false;
  bool      总_40_bo = false;
  bool      总_41_bo = false;
  int       总_42_in = 0;
  bool      总_43_bo = false;
  double    总_44_do = 0.0;
  double    总_45_do = 0.0;
  string    总_46_st = "Blazer2";
  int       总_47_in = 100;
  int       总_48_in = 60;
  double    总_49_do = StopLoss;
  bool      总_50_bo = false;
  double    总_51_do = 48.0;
  double    总_52_do = 0.0;
  int       总_53_in = 22324;
  double    总_54_do = 0.0;
  double    总_55_do = 0.0;
  double    总_56_do = 0.0;
  double    总_57_do = 0.0;
  double    总_58_do = 0.0;
  double    总_59_do = 0.0;
  double    总_60_do = 0.0;
  double    总_61_do = 0.0;
  double    总_62_do = 0.0;
  double    总_63_do = 0.0;
  bool      总_64_bo = false;
  string    总_65_st = "";
  int       总_66_in = 0;
  int       总_67_in = 0;
  int       总_68_in = 0;
  double    总_69_do = 0.0;
  int       总_70_in = 0;
  int       总_71_in = 0;
  double    总_72_do = 0.0;
  bool      总_73_bo = false;
  bool      总_74_bo = false;
  bool      总_75_bo = false;
  int       总_76_in = 0;
  bool      总_77_bo = false;
  double    总_78_do = 0.0;
  double    总_79_do = 0.0;
  int       总_80_in = 1;
  string    总_81_st = "Blazer3";
  int       总_82_in = 100;
  int       总_83_in = 1;
  double    总_84_do = StopLoss;
  bool      总_85_bo = false;
  double    总_86_do = 48.0;
  double    总_87_do = 0.0;
  int       总_88_in = 23794;
  double    总_89_do = 0.0;
  double    总_90_do = 0.0;
  double    总_91_do = 0.0;
  double    总_92_do = 0.0;
  double    总_93_do = 0.0;
  double    总_94_do = 0.0;
  double    总_95_do = 0.0;
  double    总_96_do = 0.0;
  double    总_97_do = 0.0;
  double    总_98_do = 0.0;
  bool      总_99_bo = false;
  string    总_100_st = "";
  int       总_101_in = 0;
  int       总_102_in = 0;
  int       总_103_in = 0;
  double    总_104_do = 0.0;
  int       总_105_in = 0;
  int       总_106_in = 0;
  double    总_107_do = 0.0;
  bool      总_108_bo = false;
  bool      总_109_bo = false;
  bool      总_110_bo = false;
  int       总_111_in = 0;
  bool      总_112_bo = false;
  double    总_113_do = 0.0;
  double    总_114_do = 0.0;
  int       总_115_in = 1;
  int       总_116_in = 1;
  int       总_117_in = 5;
  int       总_118_in = 15;
  int       总_119_in = 30;
  int       总_120_in = 60;
  int       总_121_in = 240;
  int       总_122_in = 1440;
  bool      总_123_bo = true;
  int       总_124_in = 0;
  int       总_125_in = 10;
  int       总_126_in = 0;
  bool      总_127_bo = true;
  bool      总_128_bo = true;
  bool      总_129_bo = false;
  int       总_130_in = 8421504;
  int       总_131_in = 8421504;
  int       总_132_in = 8421504;
  int       总_133_in = 36095;
  int       总_134_in = 36095;
  int       总_135_in = 65280;
  int       总_136_in = 17919;
  int       总_137_in = 65280;
  int       总_138_in = 17919;
  int       总_139_in = 65280;
  int       总_140_in = 255;
  int       总_141_in = 42495;
  int       总_142_in = 8;
  int       总_143_in = 17;
  int       总_144_in = 9;
  int       总_145_in = 0;
  int       总_146_in = 65280;
  int       总_147_in = 4678655;
  int       总_148_in = 32768;
  int       总_149_in = 255;
  string    总_150_st = "<<<< STR Indicator Settings >>>>>>>>>>>>>";
  string    总_151_st = "<<<< RSI Settings >>>>>>>>>>>>>";
  int       总_152_in = 9;
  int       总_153_in = 0;
  string    总_154_st = "<<<< CCI Settings >>>>>>>>>>>>>>";
  int       总_155_in = 13;
  int       总_156_in = 0;
  string    总_157_st = "<<<< STOCH Settings >>>>>>>>>>>";
  int       总_158_in = 5;
  int       总_159_in = 3;
  int       总_160_in = 3;
  int       总_161_in = 1;
  string    总_162_st = "<<<< STR Colors >>>>>>>>>>>>>>>>";
  int       总_163_in = 65280;
  int       总_164_in = 255;
  int       总_165_in = 42495;
  string    总_166_st = "<<<< MA Settings >>>>>>>>>>>>>>";
  int       总_167_in = 5;
  int       总_168_in = 9;
  int       总_169_in = 1;
  int       总_170_in = 0;
  string    总_171_st = "<<<< MA Colors >>>>>>>>>>>>>>";
  int       总_172_in = 65280;
  int       总_173_in = 255;
  string    总_174_st;
  string    总_175_st;
  string    总_176_st;
  string    总_177_st = "";
  string    总_178_st = "";
  int       总_179_in = 2263842;
  bool      总_180_bo = true;
  bool      总_181_bo = true;
  datetime  总_182_da = D'2099.01.17';
  bool      总_183_bo = false;
  string    总_184_st = "<<=== News Alert Setting ===>>";
  bool      总_185_bo = true;
  int       总_186_in = 60;
  int       总_187_in = 20;
  bool      总_188_bo = true;
  bool      总_189_bo = false;
  bool      总_190_bo = false;
  bool      总_191_bo = true;
  bool      总_192_bo = false;
  bool      总_193_bo = false;
  bool      总_194_bo = false;
  bool      总_195_bo = false;
  bool      总_196_bo = false;
  bool      总_197_bo = false;
  bool      总_198_bo = false;
  bool      总_199_bo = false;
  bool      总_200_bo = false;
  bool      总_201_bo = false;
  bool      总_202_bo = false;
  bool      总_203_bo = false;
  int       总_204_in = 0;

#import     

 int OnInit()
 {
  int       子_2_in;
  int       子_3_in;
//----- -----

 if ( !(IsDemo()) && !(总_181_bo) )
  {
  //Alert("Money Pile EA Only For Demo Account, Please contact : support@moneypileea.com"); 
  //return(1); 
  }
 if ( IsDemo() && !(总_180_bo) )
  {
  //Alert("Money Pile EA Only For Real Account, Please contact : support@moneypileea.com"); 
  //return(1); 
  }
 if ( TimeCurrent() >  总_182_da )
  {
  //Alert("Money Pile EA Expired, Please contact : support@moneypileea.com!"); 
  //return(1); 
  }
 if ( IsTesting() )
  {
 // Alert("EA can\'t backtesting"); 
 // return(1); 
  }
 子_2_in = 999027385 ;
 子_3_in = 8051112 ;
 if ( AccountNumber() != 999027385 && AccountNumber() != 8051112 )
  {
  //Alert("This EA is not licensed to your account number!"); 
  //return(1); 
  }
 Alert("Congratulations Money Pile EA Work Fine."); 
 总_29_do = MarketInfo(Symbol(),13) * Point() ;
 总_63_do = MarketInfo(Symbol(),13) * Point() ;
 总_98_do = MarketInfo(Symbol(),13) * Point() ;
 ObjectCreate("Lable1",OBJ_LABEL,0,0,1.0,0,0.0,0,0.0); 
 ObjectSet("Lable1",OBJPROP_CORNER,2.0); 
 ObjectSet("Lable1",OBJPROP_XDISTANCE,23.0); 
 ObjectSet("Lable1",OBJPROP_YDISTANCE,21.0); 
 总_176_st = "" ;
 ObjectSetText("Lable1",总_176_st,16,"Times New Roman",Aqua); 
 ObjectCreate("Lable",OBJ_LABEL,0,0,1.0,0,0.0,0,0.0); 
 ObjectSet("Lable",OBJPROP_CORNER,1.0); 
 ObjectSet("Lable",OBJPROP_XDISTANCE,23.0); 
 ObjectSet("Lable",OBJPROP_YDISTANCE,133.0); 
 总_175_st = "Money Pile EA" ;
 ObjectSetText("Lable",总_175_st,16,"Times New Roman",Aqua); 
 return(0); 
 }
//OnInit <<==--------   --------
 void OnTick()
 {
  int       子_1_in;
  int       子_2_in;
  int       子_3_in;
  int       子_4_in;
  int       子_5_in;
  int       子_6_in;
  int       子_7_in;
  uint      子_8_ui;
  uint      子_9_ui;
  uint      子_10_ui;
  uint      子_11_ui;
  uint      子_12_ui;
  uint      子_13_ui;
  uint      子_14_ui;
  string    子_15_st;
  uint      子_16_ui;
  uint      子_17_ui;
  uint      子_18_ui;
  uint      子_19_ui;
  uint      子_20_ui;
  uint      子_21_ui;
  uint      子_22_ui;
  uint      子_23_ui;
  string    子_24_st;
  uint      子_25_ui;
  int       子_26_in;
  double    子_27_do;
  double    子_28_do;
  double    子_29_do;
  double    子_30_do;
  double    子_31_do;
  double    子_32_do;
  double    子_33_do;
  int       子_34_in;
  int       子_35_in;
  double    子_36_do;
  double    子_37_do;
  int       子_38_in;
  int       子_39_in;
  int       子_40_in;
  int       子_41_in;
  string    子_42_st;
  string    子_43_st;
  string    子_44_st;
  string    子_45_st;
  string    子_46_st;
  string    子_47_st;
  string    子_48_st;
  string    子_49_st;
  string    子_50_st;
  string    子_51_st;
  string    子_52_st;
  string    子_53_st;
  string    子_54_st;
  string    子_55_st;
  string    子_56_st;
  string    子_57_st;
  double    子_58_do;
  double    子_59_do;
  double    子_60_do;
  double    子_61_do;
  double    子_62_do;
  double    子_63_do;
  double    子_64_do;
  double    子_65_do;
  double    子_66_do;
  double    子_67_do;
  double    子_68_do;
  double    子_69_do;
  double    子_70_do;
  double    子_71_do;
  double    子_72_do;
  double    子_73_do;
  double    子_74_do;
  double    子_75_do;
  double    子_76_do;
  double    子_77_do;
  double    子_78_do;
  double    子_79_do;
  double    子_80_do;
  double    子_81_do;
  double    子_82_do;
  double    子_83_do;
  double    子_84_do;
  double    子_85_do;
  double    子_86_do;
  double    子_87_do;
  double    子_88_do;
  double    子_89_do;
  double    子_90_do;
  double    子_91_do;
  double    子_92_do;
  string    子_93_st;
  string    子_94_st;
  string    子_95_st;
  string    子_96_st;
  string    子_97_st;
  string    子_98_st;
  string    子_99_st;
  string    子_100_st;
  string    子_101_st;
  uint      子_102_ui;
  uint      子_103_ui;
  uint      子_104_ui;
  uint      子_105_ui;
  uint      子_106_ui;
  uint      子_107_ui;
  uint      子_108_ui;
  double    子_109_do;
  double    子_110_do;
  double    子_111_do;
  double    子_112_do;
  double    子_113_do;
  double    子_114_do;
  double    子_115_do;
  double    子_116_do;
  double    子_117_do;
  double    子_118_do;
  double    子_119_do;
  double    子_120_do;
  double    子_121_do;
  double    子_122_do;
  string    子_123_st;
  string    子_124_st;
  string    子_125_st;
  string    子_126_st;
  string    子_127_st;
  string    子_128_st;
  string    子_129_st;
  string    子_130_st;
  string    子_131_st;
  double    子_132_do;
  double    子_133_do;
  string    子_134_st;
  int       子_135_in;
  int       子_136_in;
  int       子_137_in;
  int       子_138_in;
  int       子_139_in;
  int       子_140_in;
  string    子_141_st;
  string    子_142_st;
  string    子_143_st;
  string    子_144_st;
  string    子_145_st;
  string    子_146_st;
  string    子_147_st;
  string    子_148_st;
  string    子_149_st;
  double    子_150_do;
  double    子_151_do;
  double    子_152_do;
  double    子_153_do;
  double    子_154_do;
  double    子_155_do;
  double    子_156_do;
  double    子_157_do;
  int       子_158_in;
  double    子_159_do;
  bool      子_160_bo;
  double    子_161_do;
  bool      子_162_bo;
  double    子_163_do;
  double    子_164_do;
  double    子_165_do;
  double    子_166_do;
  double    子_167_do;
  double    子_168_do;
  double    子_169_do;
  int       子_170_in;
  double    子_171_do;
  bool      子_172_bo;
  double    子_173_do;
  bool      子_174_bo;
  double    子_175_do;
  double    子_176_do;
  double    子_177_do;
  double    子_178_do;
  int       子_179_in;
  double    子_180_do;
  double    子_181_do;
  int       子_182_in;
  double    子_183_do;
  bool      子_184_bo;
  double    子_185_do;
  bool      子_186_bo;
  double    子_187_do;
  double    子_188_do;
  double    子_189_do;
  double    子_190_do;
  int       子_191_in;
  double    子_192_do;
//----- -----
 int        临_in_1;
 double     临_do_2;
 double     临_do_3;
 int        临_in_4;
 int        临_in_5;
 int        临_in_6;
 int        临_in_7;
 int        临_in_8;
 double     临_do_9;
 int        临_in_10;
 int        临_in_11;
 int        临_in_12;
 double     临_do_13;
 int        临_in_14;
 int        临_in_15;
 int        临_in_16;
 double     临_do_17;
 int        临_in_18;
 int        临_in_19;
 int        临_in_20;
 double     临_do_21;
 int        临_in_22;
 int        临_in_23;
 int        临_in_24;
 double     临_do_25;
 int        临_in_26;
 int        临_in_27;
 int        临_in_28;
 double     临_do_29;
 int        临_in_30;
 int        临_in_31;
 int        临_in_32;
 double     临_do_33;
 int        临_in_34;
 int        临_in_35;
 int        临_in_36;
 double     临_do_37;
 int        临_in_38;
 int        临_in_39;
 int        临_in_40;
 int        临_in_41;
 int        临_in_42;
 int        临_in_43;
 int        临_in_44;
 double     临_do_45;
 double     临_do_46;
 int        临_in_47;
 int        临_in_48;
 int        临_in_49;
 int        临_in_50;
 int        临_in_51;
 double     临_do_52;
 int        临_in_53;
 int        临_in_54;
 int        临_in_55;
 double     临_do_56;
 int        临_in_57;
 int        临_in_58;
 int        临_in_59;
 double     临_do_60;
 int        临_in_61;
 int        临_in_62;
 int        临_in_63;
 double     临_do_64;
 int        临_in_65;
 int        临_in_66;
 int        临_in_67;
 double     临_do_68;
 int        临_in_69;
 int        临_in_70;
 int        临_in_71;
 double     临_do_72;
 int        临_in_73;
 int        临_in_74;
 int        临_in_75;
 double     临_do_76;
 int        临_in_77;
 int        临_in_78;
 int        临_in_79;
 double     临_do_80;
 int        临_in_81;
 int        临_in_82;
 int        临_in_83;
 int        临_in_84;
 int        临_in_85;
 int        临_in_86;
 int        临_in_87;
 double     临_do_88;
 double     临_do_89;
 int        临_in_90;
 int        临_in_91;
 int        临_in_92;
 int        临_in_93;
 int        临_in_94;
 double     临_do_95;
 int        临_in_96;
 int        临_in_97;
 int        临_in_98;
 double     临_do_99;
 int        临_in_100;
 int        临_in_101;
 int        临_in_102;
 double     临_do_103;
 int        临_in_104;
 int        临_in_105;
 int        临_in_106;
 double     临_do_107;
 int        临_in_108;
 int        临_in_109;
 int        临_in_110;
 double     临_do_111;
 int        临_in_112;
 int        临_in_113;
 int        临_in_114;
 double     临_do_115;
 int        临_in_116;
 int        临_in_117;
 int        临_in_118;
 double     临_do_119;
 int        临_in_120;
 int        临_in_121;
 int        临_in_122;
 double     临_do_123;
 int        临_in_124;
 int        临_in_125;
 int        临_in_126;
 int        临_in_127;
 int        临_in_128;
 int        临_in_129;



 子_40_in = IndicatorCounted() ;
 if ( Lots>总_7_do )
  {
  Lots = 总_7_do ;
  }
 Comment("\n"); 
 总_22_do = NormalizeDouble(AccountBalance(),2) ;
 总_23_do = NormalizeDouble(AccountEquity(),2) ;
 if ( 总_23_do>=总_22_do / 6.0 * 5.0 )
  {
  总_179_in = 16748574 ;
  }
 if ( 总_23_do>=总_22_do / 6.0 * 4.0 && 总_23_do<总_22_do / 6.0 * 5.0 )
  {
  总_179_in = 16760576 ;
  }
 if ( 总_23_do>=总_22_do / 6.0 * 3.0 && 总_23_do<总_22_do / 6.0 * 4.0 )
  {
  总_179_in = 55295 ;
  }
 if ( 总_23_do>=总_22_do / 6.0 * 2.0 && 总_23_do<总_22_do / 6.0 * 3.0 )
  {
  总_179_in = 17919 ;
  }
 if ( 总_23_do>=总_22_do / 6.0 && 总_23_do<总_22_do / 6.0 * 2.0 )
  {
  总_179_in = 3937500 ;
  }
 if ( 总_23_do<总_22_do / 5.0 )
  {
  总_179_in = 255 ;
  }
 ObjectDelete("Lable2"); 
 ObjectCreate("Lable2",OBJ_LABEL,0,0,1.0,0,0.0,0,0.0); 
 ObjectSet("Lable2",OBJPROP_CORNER,2.0); 
 ObjectSet("Lable2",OBJPROP_XDISTANCE,23.0); 
 ObjectSet("Lable2",OBJPROP_YDISTANCE,31.0); 
 总_177_st = DoubleToString(AccountBalance(),2) ;
 ObjectSetText("Lable2","Account BALANCE:  " + 总_177_st + "",16,"Times New Roman",0); 
 ObjectDelete("Lable3"); 
 ObjectCreate("Lable3",OBJ_LABEL,0,0,1.0,0,0.0,0,0.0); 
 ObjectSet("Lable3",OBJPROP_CORNER,2.0); 
 ObjectSet("Lable3",OBJPROP_XDISTANCE,23.0); 
 ObjectSet("Lable3",OBJPROP_YDISTANCE,11.0); 
 总_178_st = DoubleToString(AccountEquity(),2) ;
 ObjectSetText("Lable3","Account EQUITY:  " + 总_178_st + "",16,"Times New Roman",0); 
 子_41_in = IndicatorCounted() ;
 子_42_st = "" ;
 子_43_st = "" ;
 子_44_st = "" ;
 子_45_st = "" ;
 子_46_st = "" ;
 子_47_st = "" ;
 子_48_st = "" ;
 if ( 总_116_in == 1 )
  {
  子_42_st = "M1" ;
  }
 if ( 总_116_in == 5 )
  {
  子_42_st = "M5" ;
  }
 if ( 总_116_in == 15 )
  {
  子_42_st = "M15" ;
  }
 if ( 总_116_in == 30 )
  {
  子_42_st = "M30" ;
  }
 if ( 总_116_in == 60 )
  {
  子_42_st = "H1" ;
  }
 if ( 总_116_in == 240 )
  {
  子_42_st = "H4" ;
  }
 if ( 总_116_in == 1440 )
  {
  子_42_st = "D1" ;
  }
 if ( 总_116_in == 10080 )
  {
  子_42_st = "W1" ;
  }
 if ( 总_116_in == 43200 )
  {
  子_42_st = "MN" ;
  }
 if ( 总_117_in == 1 )
  {
  子_43_st = "M1" ;
  }
 if ( 总_117_in == 5 )
  {
  子_43_st = "M5" ;
  }
 if ( 总_117_in == 15 )
  {
  子_43_st = "M15" ;
  }
 if ( 总_117_in == 30 )
  {
  子_43_st = "M30" ;
  }
 if ( 总_117_in == 60 )
  {
  子_43_st = "H1" ;
  }
 if ( 总_117_in == 240 )
  {
  子_43_st = "H4" ;
  }
 if ( 总_117_in == 1440 )
  {
  子_43_st = "D1" ;
  }
 if ( 总_117_in == 10080 )
  {
  子_43_st = "W1" ;
  }
 if ( 总_117_in == 43200 )
  {
  子_43_st = "MN" ;
  }
 if ( 总_118_in == 1 )
  {
  子_44_st = "M1" ;
  }
 if ( 总_118_in == 5 )
  {
  子_44_st = "M5" ;
  }
 if ( 总_118_in == 15 )
  {
  子_44_st = "M15" ;
  }
 if ( 总_118_in == 30 )
  {
  子_44_st = "M30" ;
  }
 if ( 总_118_in == 60 )
  {
  子_44_st = "H1" ;
  }
 if ( 总_118_in == 240 )
  {
  子_44_st = "H4" ;
  }
 if ( 总_118_in == 1440 )
  {
  子_44_st = "D1" ;
  }
 if ( 总_118_in == 10080 )
  {
  子_44_st = "W1" ;
  }
 if ( 总_118_in == 43200 )
  {
  子_44_st = "MN" ;
  }
 if ( 总_119_in == 1 )
  {
  子_45_st = "M1" ;
  }
 if ( 总_119_in == 5 )
  {
  子_45_st = "M5" ;
  }
 if ( 总_119_in == 15 )
  {
  子_45_st = "M15" ;
  }
 if ( 总_119_in == 30 )
  {
  子_45_st = "M30" ;
  }
 if ( 总_119_in == 60 )
  {
  子_45_st = "H1" ;
  }
 if ( 总_119_in == 240 )
  {
  子_45_st = "H4" ;
  }
 if ( 总_119_in == 1440 )
  {
  子_45_st = "D1" ;
  }
 if ( 总_119_in == 10080 )
  {
  子_45_st = "W1" ;
  }
 if ( 总_119_in == 43200 )
  {
  子_45_st = "MN" ;
  }
 if ( 总_120_in == 1 )
  {
  子_46_st = "M1" ;
  }
 if ( 总_120_in == 5 )
  {
  子_46_st = "M5" ;
  }
 if ( 总_120_in == 15 )
  {
  子_46_st = "M15" ;
  }
 if ( 总_120_in == 30 )
  {
  子_46_st = "M30" ;
  }
 if ( 总_120_in == 60 )
  {
  子_46_st = "H1" ;
  }
 if ( 总_120_in == 240 )
  {
  子_46_st = "H4" ;
  }
 if ( 总_120_in == 1440 )
  {
  子_46_st = "D1" ;
  }
 if ( 总_120_in == 10080 )
  {
  子_46_st = "W1" ;
  }
 if ( 总_120_in == 43200 )
  {
  子_46_st = "MN" ;
  }
 if ( 总_121_in == 1 )
  {
  子_47_st = "M1" ;
  }
 if ( 总_121_in == 5 )
  {
  子_47_st = "M5" ;
  }
 if ( 总_121_in == 15 )
  {
  子_47_st = "M15" ;
  }
 if ( 总_121_in == 30 )
  {
  子_47_st = "M30" ;
  }
 if ( 总_121_in == 60 )
  {
  子_47_st = "H1" ;
  }
 if ( 总_121_in == 240 )
  {
  子_47_st = "H4" ;
  }
 if ( 总_121_in == 1440 )
  {
  子_47_st = "D1" ;
  }
 if ( 总_121_in == 10080 )
  {
  子_47_st = "W1" ;
  }
 if ( 总_121_in == 43200 )
  {
  子_47_st = "MN" ;
  }
 if ( 总_122_in == 1 )
  {
  子_48_st = "M1" ;
  }
 if ( 总_122_in == 5 )
  {
  子_48_st = "M5" ;
  }
 if ( 总_122_in == 15 )
  {
  子_48_st = "M15" ;
  }
 if ( 总_122_in == 30 )
  {
  子_48_st = "M30" ;
  }
 if ( 总_122_in == 60 )
  {
  子_48_st = "H1" ;
  }
 if ( 总_122_in == 240 )
  {
  子_48_st = "H4" ;
  }
 if ( 总_122_in == 1440 )
  {
  子_48_st = "D1" ;
  }
 if ( 总_122_in == 10080 )
  {
  子_48_st = "W1" ;
  }
 if ( 总_122_in == 43200 )
  {
  子_48_st = "MN" ;
  }
 if ( 总_116_in == 15 )
  {
  子_1_in = -2 ;
  }
 if ( 总_116_in == 30 )
  {
  子_1_in = -2 ;
  }
 if ( 总_117_in == 15 )
  {
  子_2_in = -2 ;
  }
 if ( 总_117_in == 30 )
  {
  子_2_in = -2 ;
  }
 if ( 总_118_in == 15 )
  {
  子_3_in = -2 ;
  }
 if ( 总_118_in == 30 )
  {
  子_3_in = -2 ;
  }
 if ( 总_119_in == 15 )
  {
  子_4_in = -2 ;
  }
 if ( 总_119_in == 30 )
  {
  子_4_in = -2 ;
  }
 if ( 总_120_in == 15 )
  {
  子_5_in = -2 ;
  }
 if ( 总_120_in == 30 )
  {
  子_5_in = -2 ;
  }
 if ( 总_121_in == 15 )
  {
  子_6_in = -2 ;
  }
 if ( 总_121_in == 30 )
  {
  子_6_in = -2 ;
  }
 if ( 总_122_in == 15 )
  {
  子_7_in = -2 ;
  }
 if ( 总_121_in == 30 )
  {
  子_7_in = -2 ;
  }
 if ( 总_124_in <  0 )
  {
  return;
  }
 ObjectDelete("SIG_BARS_TF1"); 
 ObjectCreate("SIG_BARS_TF1",OBJ_LABEL,总_126_in,0,0.0,0,0.0,0,0.0); 
 ObjectSetText("SIG_BARS_TF1",子_42_st,7,"Arial Bold",总_130_in); 
 ObjectSet("SIG_BARS_TF1",OBJPROP_CORNER,总_123_bo); 
 ObjectSet("SIG_BARS_TF1",OBJPROP_XDISTANCE,总_125_in + 134 + 子_1_in); 
 ObjectSet("SIG_BARS_TF1",OBJPROP_YDISTANCE,总_124_in + 25); 
 ObjectDelete("SIG_BARS_TF2"); 
 ObjectCreate("SIG_BARS_TF2",OBJ_LABEL,总_126_in,0,0.0,0,0.0,0,0.0); 
 ObjectSetText("SIG_BARS_TF2",子_43_st,7,"Arial Bold",总_130_in); 
 ObjectSet("SIG_BARS_TF2",OBJPROP_CORNER,总_123_bo); 
 ObjectSet("SIG_BARS_TF2",OBJPROP_XDISTANCE,总_125_in + 114 + 子_2_in); 
 ObjectSet("SIG_BARS_TF2",OBJPROP_YDISTANCE,总_124_in + 25); 
 ObjectDelete("SIG_BARS_TF3"); 
 ObjectCreate("SIG_BARS_TF3",OBJ_LABEL,总_126_in,0,0.0,0,0.0,0,0.0); 
 ObjectSetText("SIG_BARS_TF3",子_44_st,7,"Arial Bold",总_130_in); 
 ObjectSet("SIG_BARS_TF3",OBJPROP_CORNER,总_123_bo); 
 ObjectSet("SIG_BARS_TF3",OBJPROP_XDISTANCE,总_125_in + 94 + 子_3_in); 
 ObjectSet("SIG_BARS_TF3",OBJPROP_YDISTANCE,总_124_in + 25); 
 ObjectDelete("SIG_BARS_TF4"); 
 ObjectCreate("SIG_BARS_TF4",OBJ_LABEL,总_126_in,0,0.0,0,0.0,0,0.0); 
 ObjectSetText("SIG_BARS_TF4",子_45_st,7,"Arial Bold",总_130_in); 
 ObjectSet("SIG_BARS_TF4",OBJPROP_CORNER,总_123_bo); 
 ObjectSet("SIG_BARS_TF4",OBJPROP_XDISTANCE,总_125_in + 74 + 子_4_in); 
 ObjectSet("SIG_BARS_TF4",OBJPROP_YDISTANCE,总_124_in + 25); 
 ObjectDelete("SIG_BARS_TF5"); 
 ObjectCreate("SIG_BARS_TF5",OBJ_LABEL,总_126_in,0,0.0,0,0.0,0,0.0); 
 ObjectSetText("SIG_BARS_TF5",子_46_st,7,"Arial Bold",总_130_in); 
 ObjectSet("SIG_BARS_TF5",OBJPROP_CORNER,总_123_bo); 
 ObjectSet("SIG_BARS_TF5",OBJPROP_XDISTANCE,总_125_in + 54 + 子_5_in); 
 ObjectSet("SIG_BARS_TF5",OBJPROP_YDISTANCE,总_124_in + 25); 
 ObjectDelete("SIG_BARS_TF6"); 
 ObjectCreate("SIG_BARS_TF6",OBJ_LABEL,总_126_in,0,0.0,0,0.0,0,0.0); 
 ObjectSetText("SIG_BARS_TF6",子_47_st,7,"Arial Bold",总_130_in); 
 ObjectSet("SIG_BARS_TF6",OBJPROP_CORNER,总_123_bo); 
 ObjectSet("SIG_BARS_TF6",OBJPROP_XDISTANCE,总_125_in + 34 + 子_6_in); 
 ObjectSet("SIG_BARS_TF6",OBJPROP_YDISTANCE,总_124_in + 25); 
 ObjectDelete("SIG_BARS_TF7"); 
 ObjectCreate("SIG_BARS_TF7",OBJ_LABEL,总_126_in,0,0.0,0,0.0,0,0.0); 
 ObjectSetText("SIG_BARS_TF7",子_48_st,7,"Arial Bold",总_130_in); 
 ObjectSet("SIG_BARS_TF7",OBJPROP_CORNER,总_123_bo); 
 ObjectSet("SIG_BARS_TF7",OBJPROP_XDISTANCE,总_125_in + 14 + 子_7_in); 
 ObjectSet("SIG_BARS_TF7",OBJPROP_YDISTANCE,总_124_in + 25); 
 子_49_st = "" ;
 子_50_st = "" ;
 子_51_st = "" ;
 子_52_st = "" ;
 子_53_st = "" ;
 子_54_st = "" ;
 子_55_st = "" ;
 子_56_st = "" ;
 子_57_st = "" ;
 子_58_do = iMACD(NULL,总_116_in,总_142_in,总_143_in,总_144_in,总_145_in,0,0) ;
 子_59_do = iMACD(NULL,总_116_in,总_142_in,总_143_in,总_144_in,总_145_in,1,0) ;
 子_60_do = iMACD(NULL,总_117_in,总_142_in,总_143_in,总_144_in,总_145_in,0,0) ;
 子_61_do = iMACD(NULL,总_117_in,总_142_in,总_143_in,总_144_in,总_145_in,1,0) ;
 子_62_do = iMACD(NULL,总_118_in,总_142_in,总_143_in,总_144_in,总_145_in,0,0) ;
 子_63_do = iMACD(NULL,总_118_in,总_142_in,总_143_in,总_144_in,总_145_in,1,0) ;
 子_64_do = iMACD(NULL,总_119_in,总_142_in,总_143_in,总_144_in,总_145_in,0,0) ;
 子_65_do = iMACD(NULL,总_119_in,总_142_in,总_143_in,总_144_in,总_145_in,1,0) ;
 子_66_do = iMACD(NULL,总_120_in,总_142_in,总_143_in,总_144_in,总_145_in,0,0) ;
 子_67_do = iMACD(NULL,总_120_in,总_142_in,总_143_in,总_144_in,总_145_in,1,0) ;
 子_68_do = iMACD(NULL,总_121_in,总_142_in,总_143_in,总_144_in,总_145_in,0,0) ;
 子_69_do = iMACD(NULL,总_121_in,总_142_in,总_143_in,总_144_in,总_145_in,1,0) ;
 子_70_do = iMACD(NULL,总_122_in,总_142_in,总_143_in,总_144_in,总_145_in,0,0) ;
 子_71_do = iMACD(NULL,总_122_in,总_142_in,总_143_in,总_144_in,总_145_in,1,0) ;
 if ( 子_58_do>子_59_do )
  {
  子_52_st = "-" ;
  子_11_ui = 总_148_in ;
  }
 if ( 子_58_do<=子_59_do )
  {
  子_52_st = "-" ;
  子_11_ui = 总_147_in ;
  }
 if ( 子_58_do>子_59_do && 子_58_do>0.0 )
  {
  子_52_st = "-" ;
  子_11_ui = 总_146_in ;
  }
 if ( 子_58_do<=子_59_do && 子_58_do<0.0 )
  {
  子_52_st = "-" ;
  子_11_ui = 总_149_in ;
  }
 if ( 子_60_do>子_61_do )
  {
  子_53_st = "-" ;
  子_12_ui = 总_148_in ;
  }
 if ( 子_60_do<=子_61_do )
  {
  子_53_st = "-" ;
  子_12_ui = 总_147_in ;
  }
 if ( 子_60_do>子_61_do && 子_60_do>0.0 )
  {
  子_53_st = "-" ;
  子_12_ui = 总_146_in ;
  }
 if ( 子_60_do<=子_61_do && 子_60_do<0.0 )
  {
  子_53_st = "-" ;
  子_12_ui = 总_149_in ;
  }
 if ( 子_62_do>子_63_do )
  {
  子_54_st = "-" ;
  子_13_ui = 总_148_in ;
  }
 if ( 子_62_do<=子_63_do )
  {
  子_54_st = "-" ;
  子_13_ui = 总_147_in ;
  }
 if ( 子_62_do>子_63_do && 子_62_do>0.0 )
  {
  子_54_st = "-" ;
  子_13_ui = 总_146_in ;
  }
 if ( 子_62_do<=子_63_do && 子_62_do<0.0 )
  {
  子_54_st = "-" ;
  子_13_ui = 总_149_in ;
  }
 if ( 子_64_do>子_65_do )
  {
  子_55_st = "-" ;
  子_14_ui = 总_148_in ;
  }
 if ( 子_64_do<=子_65_do )
  {
  子_55_st = "-" ;
  子_14_ui = 总_147_in ;
  }
 if ( 子_64_do>子_65_do && 子_64_do>0.0 )
  {
  子_55_st = "-" ;
  子_14_ui = 总_146_in ;
  }
 if ( 子_64_do<=子_65_do && 子_64_do<0.0 )
  {
  子_55_st = "-" ;
  子_14_ui = 总_149_in ;
  }
 if ( 子_66_do>子_67_do )
  {
  子_50_st = "-" ;
  子_9_ui = 总_148_in ;
  }
 if ( 子_66_do<=子_67_do )
  {
  子_50_st = "-" ;
  子_9_ui = 总_147_in ;
  }
 if ( 子_66_do>子_67_do && 子_66_do>0.0 )
  {
  子_50_st = "-" ;
  子_9_ui = 总_146_in ;
  }
 if ( 子_66_do<=子_67_do && 子_66_do<0.0 )
  {
  子_50_st = "-" ;
  子_9_ui = 总_149_in ;
  }
 if ( 子_68_do>子_69_do )
  {
  子_51_st = "-" ;
  子_10_ui = 总_148_in ;
  }
 if ( 子_68_do<=子_69_do )
  {
  子_51_st = "-" ;
  子_10_ui = 总_147_in ;
  }
 if ( 子_68_do>子_69_do && 子_68_do>0.0 )
  {
  子_51_st = "-" ;
  子_10_ui = 总_146_in ;
  }
 if ( 子_68_do<=子_69_do && 子_68_do<0.0 )
  {
  子_51_st = "-" ;
  子_10_ui = 总_149_in ;
  }
 if ( 子_70_do>子_71_do )
  {
  子_49_st = "-" ;
  子_8_ui = 总_148_in ;
  }
 if ( 子_70_do<=子_71_do )
  {
  子_49_st = "-" ;
  子_8_ui = 总_147_in ;
  }
 if ( 子_70_do>子_71_do && 子_70_do>0.0 )
  {
  子_49_st = "-" ;
  子_8_ui = 总_146_in ;
  }
 if ( 子_70_do<=子_71_do && 子_70_do<0.0 )
  {
  子_49_st = "-" ;
  子_8_ui = 总_149_in ;
  }
 ObjectDelete("SSignalMACD_TEXT"); 
 ObjectCreate("SSignalMACD_TEXT",OBJ_LABEL,总_126_in,0,0.0,0,0.0,0,0.0); 
 ObjectSetText("SSignalMACD_TEXT","MACD",6,"Tahoma Narrow",总_131_in); 
 ObjectSet("SSignalMACD_TEXT",OBJPROP_CORNER,总_123_bo); 
 ObjectSet("SSignalMACD_TEXT",OBJPROP_XDISTANCE,总_125_in + 153); 
 ObjectSet("SSignalMACD_TEXT",OBJPROP_YDISTANCE,总_124_in + 35); 
 ObjectDelete("SSignalMACDM1"); 
 ObjectCreate("SSignalMACDM1",OBJ_LABEL,总_126_in,0,0.0,0,0.0,0,0.0); 
 ObjectSetText("SSignalMACDM1",子_52_st,45,"Tahoma Narrow",子_11_ui); 
 ObjectSet("SSignalMACDM1",OBJPROP_CORNER,总_123_bo); 
 ObjectSet("SSignalMACDM1",OBJPROP_XDISTANCE,总_125_in + 130); 
 ObjectSet("SSignalMACDM1",OBJPROP_YDISTANCE,总_124_in + 2); 
 ObjectDelete("SSignalMACDM5"); 
 ObjectCreate("SSignalMACDM5",OBJ_LABEL,总_126_in,0,0.0,0,0.0,0,0.0); 
 ObjectSetText("SSignalMACDM5",子_53_st,45,"Tahoma Narrow",子_12_ui); 
 ObjectSet("SSignalMACDM5",OBJPROP_CORNER,总_123_bo); 
 ObjectSet("SSignalMACDM5",OBJPROP_XDISTANCE,总_125_in + 110); 
 ObjectSet("SSignalMACDM5",OBJPROP_YDISTANCE,总_124_in + 2); 
 ObjectDelete("SSignalMACDM15"); 
 ObjectCreate("SSignalMACDM15",OBJ_LABEL,总_126_in,0,0.0,0,0.0,0,0.0); 
 ObjectSetText("SSignalMACDM15",子_54_st,45,"Tahoma Narrow",子_13_ui); 
 ObjectSet("SSignalMACDM15",OBJPROP_CORNER,总_123_bo); 
 ObjectSet("SSignalMACDM15",OBJPROP_XDISTANCE,总_125_in + 90); 
 ObjectSet("SSignalMACDM15",OBJPROP_YDISTANCE,总_124_in + 2); 
 ObjectDelete("SSignalMACDM30"); 
 ObjectCreate("SSignalMACDM30",OBJ_LABEL,总_126_in,0,0.0,0,0.0,0,0.0); 
 ObjectSetText("SSignalMACDM30",子_55_st,45,"Tahoma Narrow",子_14_ui); 
 ObjectSet("SSignalMACDM30",OBJPROP_CORNER,总_123_bo); 
 ObjectSet("SSignalMACDM30",OBJPROP_XDISTANCE,总_125_in + 70); 
 ObjectSet("SSignalMACDM30",OBJPROP_YDISTANCE,总_124_in + 2); 
 ObjectDelete("SSignalMACDH1"); 
 ObjectCreate("SSignalMACDH1",OBJ_LABEL,总_126_in,0,0.0,0,0.0,0,0.0); 
 ObjectSetText("SSignalMACDH1",子_50_st,45,"Tahoma Narrow",子_9_ui); 
 ObjectSet("SSignalMACDH1",OBJPROP_CORNER,总_123_bo); 
 ObjectSet("SSignalMACDH1",OBJPROP_XDISTANCE,总_125_in + 50); 
 ObjectSet("SSignalMACDH1",OBJPROP_YDISTANCE,总_124_in + 2); 
 ObjectDelete("SSignalMACDH4"); 
 ObjectCreate("SSignalMACDH4",OBJ_LABEL,总_126_in,0,0.0,0,0.0,0,0.0); 
 ObjectSetText("SSignalMACDH4",子_51_st,45,"Tahoma Narrow",子_10_ui); 
 ObjectSet("SSignalMACDH4",OBJPROP_CORNER,总_123_bo); 
 ObjectSet("SSignalMACDH4",OBJPROP_XDISTANCE,总_125_in + 30); 
 ObjectSet("SSignalMACDH4",OBJPROP_YDISTANCE,总_124_in + 2); 
 ObjectDelete("SSignalMACDD1"); 
 ObjectCreate("SSignalMACDD1",OBJ_LABEL,总_126_in,0,0.0,0,0.0,0,0.0); 
 ObjectSetText("SSignalMACDD1",子_49_st,45,"Tahoma Narrow",子_8_ui); 
 ObjectSet("SSignalMACDD1",OBJPROP_CORNER,总_123_bo); 
 ObjectSet("SSignalMACDD1",OBJPROP_XDISTANCE,总_125_in + 10); 
 ObjectSet("SSignalMACDD1",OBJPROP_YDISTANCE,总_124_in + 2); 
 子_72_do = iRSI(NULL,总_122_in,总_152_in,总_153_in,0) ;
 子_73_do = iRSI(NULL,总_121_in,总_152_in,总_153_in,0) ;
 子_74_do = iRSI(NULL,总_120_in,总_152_in,总_153_in,0) ;
 子_75_do = iRSI(NULL,总_119_in,总_152_in,总_153_in,0) ;
 子_76_do = iRSI(NULL,总_118_in,总_152_in,总_153_in,0) ;
 子_77_do = iRSI(NULL,总_117_in,总_152_in,总_153_in,0) ;
 子_78_do = iRSI(NULL,总_116_in,总_152_in,总_153_in,0) ;
 子_79_do = iStochastic(NULL,总_122_in,总_158_in,总_159_in,总_160_in,总_161_in,0,0,0) ;
 子_80_do = iStochastic(NULL,总_121_in,总_158_in,总_159_in,总_160_in,总_161_in,0,0,0) ;
 子_81_do = iStochastic(NULL,总_120_in,总_158_in,总_159_in,总_160_in,总_161_in,0,0,0) ;
 子_82_do = iStochastic(NULL,总_119_in,总_158_in,总_159_in,总_160_in,总_161_in,0,0,0) ;
 子_83_do = iStochastic(NULL,总_118_in,总_158_in,总_159_in,总_160_in,总_161_in,0,0,0) ;
 子_84_do = iStochastic(NULL,总_117_in,总_158_in,总_159_in,总_160_in,总_161_in,0,0,0) ;
 子_85_do = iStochastic(NULL,总_116_in,总_158_in,总_159_in,总_160_in,总_161_in,0,0,0) ;
 子_86_do = iCCI(NULL,总_122_in,总_155_in,总_156_in,0) ;
 子_87_do = iCCI(NULL,总_121_in,总_155_in,总_156_in,0) ;
 子_88_do = iCCI(NULL,总_120_in,总_155_in,总_156_in,0) ;
 子_89_do = iCCI(NULL,总_119_in,总_155_in,总_156_in,0) ;
 子_90_do = iCCI(NULL,总_118_in,总_155_in,总_156_in,0) ;
 子_91_do = iCCI(NULL,总_117_in,总_155_in,总_156_in,0) ;
 子_92_do = iCCI(NULL,总_116_in,总_155_in,总_156_in,0) ;
 子_93_st = "" ;
 子_94_st = "" ;
 子_95_st = "" ;
 子_96_st = "" ;
 子_97_st = "" ;
 子_98_st = "" ;
 子_99_st = "" ;
 子_100_st = "" ;
 子_101_st = "" ;
 子_99_st = "-" ;
 子_102_ui = 总_165_in ;
 子_97_st = "-" ;
 子_103_ui = 总_165_in ;
 子_93_st = "-" ;
 子_104_ui = 总_165_in ;
 子_98_st = "-" ;
 子_105_ui = 总_165_in ;
 子_94_st = "-" ;
 子_106_ui = 总_165_in ;
 子_95_st = "-" ;
 子_107_ui = 总_165_in ;
 子_96_st = "-" ;
 子_108_ui = 总_165_in ;
 if ( 子_72_do>50.0 && 子_79_do>40.0 && 子_86_do>0.0 )
  {
  子_99_st = "-" ;
  子_102_ui = 总_163_in ;
  }
 if ( 子_73_do>50.0 && 子_80_do>40.0 && 子_87_do>0.0 )
  {
  子_97_st = "-" ;
  子_103_ui = 总_163_in ;
  }
 if ( 子_74_do>50.0 && 子_81_do>40.0 && 子_88_do>0.0 )
  {
  子_93_st = "-" ;
  子_104_ui = 总_163_in ;
  }
 if ( 子_75_do>50.0 && 子_82_do>40.0 && 子_89_do>0.0 )
  {
  子_98_st = "-" ;
  子_105_ui = 总_163_in ;
  }
 if ( 子_76_do>50.0 && 子_83_do>40.0 && 子_90_do>0.0 )
  {
  子_94_st = "-" ;
  子_106_ui = 总_163_in ;
  }
 if ( 子_77_do>50.0 && 子_84_do>40.0 && 子_91_do>0.0 )
  {
  子_95_st = "-" ;
  子_107_ui = 总_163_in ;
  }
 if ( 子_78_do>50.0 && 子_85_do>40.0 && 子_92_do>0.0 )
  {
  子_96_st = "-" ;
  子_108_ui = 总_163_in ;
  }
 if ( 子_72_do<50.0 && 子_79_do<60.0 && 子_86_do<0.0 )
  {
  子_99_st = "-" ;
  子_102_ui = 总_164_in ;
  }
 if ( 子_73_do<50.0 && 子_80_do<60.0 && 子_87_do<0.0 )
  {
  子_97_st = "-" ;
  子_103_ui = 总_164_in ;
  }
 if ( 子_74_do<50.0 && 子_81_do<60.0 && 子_88_do<0.0 )
  {
  子_93_st = "-" ;
  子_104_ui = 总_164_in ;
  }
 if ( 子_75_do<50.0 && 子_82_do<60.0 && 子_89_do<0.0 )
  {
  子_98_st = "-" ;
  子_105_ui = 总_164_in ;
  }
 if ( 子_76_do<50.0 && 子_83_do<60.0 && 子_90_do<0.0 )
  {
  子_94_st = "-" ;
  子_106_ui = 总_164_in ;
  }
 if ( 子_77_do<50.0 && 子_84_do<60.0 && 子_91_do<0.0 )
  {
  子_95_st = "-" ;
  子_107_ui = 总_164_in ;
  }
 if ( 子_78_do<50.0 && 子_85_do<60.0 && 子_92_do<0.0 )
  {
  子_96_st = "-" ;
  子_108_ui = 总_164_in ;
  }
 ObjectDelete("SSignalSTR_TEXT"); 
 ObjectCreate("SSignalSTR_TEXT",OBJ_LABEL,总_126_in,0,0.0,0,0.0,0,0.0); 
 ObjectSetText("SSignalSTR_TEXT","STR",6,"Tahoma Narrow",总_131_in); 
 ObjectSet("SSignalSTR_TEXT",OBJPROP_CORNER,总_123_bo); 
 ObjectSet("SSignalSTR_TEXT",OBJPROP_XDISTANCE,总_125_in + 153); 
 ObjectSet("SSignalSTR_TEXT",OBJPROP_YDISTANCE,总_124_in + 43); 
 ObjectDelete("SignalSTRM1"); 
 ObjectCreate("SignalSTRM1",OBJ_LABEL,总_126_in,0,0.0,0,0.0,0,0.0); 
 ObjectSetText("SignalSTRM1",子_96_st,45,"Tahoma Narrow",子_108_ui); 
 ObjectSet("SignalSTRM1",OBJPROP_CORNER,总_123_bo); 
 ObjectSet("SignalSTRM1",OBJPROP_XDISTANCE,总_125_in + 130); 
 ObjectSet("SignalSTRM1",OBJPROP_YDISTANCE,总_124_in + 10); 
 ObjectDelete("SignalSTRM5"); 
 ObjectCreate("SignalSTRM5",OBJ_LABEL,总_126_in,0,0.0,0,0.0,0,0.0); 
 ObjectSetText("SignalSTRM5",子_95_st,45,"Tahoma Narrow",子_107_ui); 
 ObjectSet("SignalSTRM5",OBJPROP_CORNER,总_123_bo); 
 ObjectSet("SignalSTRM5",OBJPROP_XDISTANCE,总_125_in + 110); 
 ObjectSet("SignalSTRM5",OBJPROP_YDISTANCE,总_124_in + 10); 
 ObjectDelete("SignalSTRM15"); 
 ObjectCreate("SignalSTRM15",OBJ_LABEL,总_126_in,0,0.0,0,0.0,0,0.0); 
 ObjectSetText("SignalSTRM15",子_94_st,45,"Tahoma Narrow",子_106_ui); 
 ObjectSet("SignalSTRM15",OBJPROP_CORNER,总_123_bo); 
 ObjectSet("SignalSTRM15",OBJPROP_XDISTANCE,总_125_in + 90); 
 ObjectSet("SignalSTRM15",OBJPROP_YDISTANCE,总_124_in + 10); 
 ObjectDelete("SignalSTRM30"); 
 ObjectCreate("SignalSTRM30",OBJ_LABEL,总_126_in,0,0.0,0,0.0,0,0.0); 
 ObjectSetText("SignalSTRM30",子_98_st,45,"Tahoma Narrow",子_105_ui); 
 ObjectSet("SignalSTRM30",OBJPROP_CORNER,总_123_bo); 
 ObjectSet("SignalSTRM30",OBJPROP_XDISTANCE,总_125_in + 70); 
 ObjectSet("SignalSTRM30",OBJPROP_YDISTANCE,总_124_in + 10); 
 ObjectDelete("SignalSTRH1"); 
 ObjectCreate("SignalSTRH1",OBJ_LABEL,总_126_in,0,0.0,0,0.0,0,0.0); 
 ObjectSetText("SignalSTRH1",子_93_st,45,"Tahoma Narrow",子_104_ui); 
 ObjectSet("SignalSTRH1",OBJPROP_CORNER,总_123_bo); 
 ObjectSet("SignalSTRH1",OBJPROP_XDISTANCE,总_125_in + 50); 
 ObjectSet("SignalSTRH1",OBJPROP_YDISTANCE,总_124_in + 10); 
 ObjectDelete("SignalSTRH4"); 
 ObjectCreate("SignalSTRH4",OBJ_LABEL,总_126_in,0,0.0,0,0.0,0,0.0); 
 ObjectSetText("SignalSTRH4",子_97_st,45,"Tahoma Narrow",子_103_ui); 
 ObjectSet("SignalSTRH4",OBJPROP_CORNER,总_123_bo); 
 ObjectSet("SignalSTRH4",OBJPROP_XDISTANCE,总_125_in + 30); 
 ObjectSet("SignalSTRH4",OBJPROP_YDISTANCE,总_124_in + 10); 
 ObjectDelete("SignalSTRD1"); 
 ObjectCreate("SignalSTRD1",OBJ_LABEL,总_126_in,0,0.0,0,0.0,0,0.0); 
 ObjectSetText("SignalSTRD1",子_99_st,45,"Tahoma Narrow",子_102_ui); 
 ObjectSet("SignalSTRD1",OBJPROP_CORNER,总_123_bo); 
 ObjectSet("SignalSTRD1",OBJPROP_XDISTANCE,总_125_in + 10); 
 ObjectSet("SignalSTRD1",OBJPROP_YDISTANCE,总_124_in + 10); 
 子_109_do = iMA(Symbol(),总_116_in,总_167_in,0,总_169_in,总_170_in,0) ;
 子_110_do = iMA(Symbol(),总_116_in,总_168_in,0,总_169_in,总_170_in,0) ;
 子_111_do = iMA(Symbol(),总_117_in,总_167_in,0,总_169_in,总_170_in,0) ;
 子_112_do = iMA(Symbol(),总_117_in,总_168_in,0,总_169_in,总_170_in,0) ;
 子_113_do = iMA(Symbol(),总_118_in,总_167_in,0,总_169_in,总_170_in,0) ;
 子_114_do = iMA(Symbol(),总_118_in,总_168_in,0,总_169_in,总_170_in,0) ;
 子_115_do = iMA(Symbol(),总_119_in,总_167_in,0,总_169_in,总_170_in,0) ;
 子_116_do = iMA(Symbol(),总_119_in,总_168_in,0,总_169_in,总_170_in,0) ;
 子_117_do = iMA(Symbol(),总_120_in,总_167_in,0,总_169_in,总_170_in,0) ;
 子_118_do = iMA(Symbol(),总_120_in,总_168_in,0,总_169_in,总_170_in,0) ;
 子_119_do = iMA(Symbol(),总_121_in,总_167_in,0,总_169_in,总_170_in,0) ;
 子_120_do = iMA(Symbol(),总_121_in,总_168_in,0,总_169_in,总_170_in,0) ;
 子_121_do = iMA(Symbol(),总_122_in,总_167_in,0,总_169_in,总_170_in,0) ;
 子_122_do = iMA(Symbol(),总_122_in,总_168_in,0,总_169_in,总_170_in,0) ;
 子_123_st = "" ;
 子_124_st = "" ;
 子_125_st = "" ;
 子_126_st = "" ;
 子_127_st = "" ;
 子_128_st = "" ;
 子_129_st = "" ;
 子_130_st = "" ;
 子_131_st = "" ;
 if ( 子_109_do>子_110_do )
  {
  子_123_st = "-" ;
  子_16_ui = 总_172_in ;
  }
 if ( 子_109_do<=子_110_do )
  {
  子_123_st = "-" ;
  子_16_ui = 总_173_in ;
  }
 if ( 子_111_do>子_112_do )
  {
  子_124_st = "-" ;
  子_17_ui = 总_172_in ;
  }
 if ( 子_111_do<=子_112_do )
  {
  子_124_st = "-" ;
  子_17_ui = 总_173_in ;
  }
 if ( 子_113_do>子_114_do )
  {
  子_125_st = "-" ;
  子_18_ui = 总_172_in ;
  }
 if ( 子_113_do<=子_114_do )
  {
  子_125_st = "-" ;
  子_18_ui = 总_173_in ;
  }
 if ( 子_115_do>子_116_do )
  {
  子_126_st = "-" ;
  子_19_ui = 总_172_in ;
  }
 if ( 子_115_do<=子_116_do )
  {
  子_126_st = "-" ;
  子_19_ui = 总_173_in ;
  }
 if ( 子_117_do>子_118_do )
  {
  子_127_st = "-" ;
  子_20_ui = 总_172_in ;
  }
 if ( 子_117_do<=子_118_do )
  {
  子_127_st = "-" ;
  子_20_ui = 总_173_in ;
  }
 if ( 子_119_do>子_120_do )
  {
  子_128_st = "-" ;
  子_21_ui = 总_172_in ;
  }
 if ( 子_119_do<=子_120_do )
  {
  子_128_st = "-" ;
  子_21_ui = 总_173_in ;
  }
 if ( 子_121_do>子_122_do )
  {
  子_129_st = "-" ;
  子_22_ui = 总_172_in ;
  }
 if ( 子_121_do<=子_122_do )
  {
  子_129_st = "-" ;
  子_22_ui = 总_173_in ;
  }
 ObjectDelete("SignalEMA_TEXT"); 
 ObjectCreate("SignalEMA_TEXT",OBJ_LABEL,总_126_in,0,0.0,0,0.0,0,0.0); 
 ObjectSetText("SignalEMA_TEXT","EMA",6,"Tahoma Narrow",总_131_in); 
 ObjectSet("SignalEMA_TEXT",OBJPROP_CORNER,总_123_bo); 
 ObjectSet("SignalEMA_TEXT",OBJPROP_XDISTANCE,总_125_in + 153); 
 ObjectSet("SignalEMA_TEXT",OBJPROP_YDISTANCE,总_124_in + 51); 
 ObjectDelete("SignalEMAM1"); 
 ObjectCreate("SignalEMAM1",OBJ_LABEL,总_126_in,0,0.0,0,0.0,0,0.0); 
 ObjectSetText("SignalEMAM1",子_123_st,45,"Tahoma Narrow",子_16_ui); 
 ObjectSet("SignalEMAM1",OBJPROP_CORNER,总_123_bo); 
 ObjectSet("SignalEMAM1",OBJPROP_XDISTANCE,总_125_in + 130); 
 ObjectSet("SignalEMAM1",OBJPROP_YDISTANCE,总_124_in + 18); 
 ObjectDelete("SignalEMAM5"); 
 ObjectCreate("SignalEMAM5",OBJ_LABEL,总_126_in,0,0.0,0,0.0,0,0.0); 
 ObjectSetText("SignalEMAM5",子_124_st,45,"Tahoma Narrow",子_17_ui); 
 ObjectSet("SignalEMAM5",OBJPROP_CORNER,总_123_bo); 
 ObjectSet("SignalEMAM5",OBJPROP_XDISTANCE,总_125_in + 110); 
 ObjectSet("SignalEMAM5",OBJPROP_YDISTANCE,总_124_in + 18); 
 ObjectDelete("SignalEMAM15"); 
 ObjectCreate("SignalEMAM15",OBJ_LABEL,总_126_in,0,0.0,0,0.0,0,0.0); 
 ObjectSetText("SignalEMAM15",子_125_st,45,"Tahoma Narrow",子_18_ui); 
 ObjectSet("SignalEMAM15",OBJPROP_CORNER,总_123_bo); 
 ObjectSet("SignalEMAM15",OBJPROP_XDISTANCE,总_125_in + 90); 
 ObjectSet("SignalEMAM15",OBJPROP_YDISTANCE,总_124_in + 18); 
 ObjectDelete("SignalEMAM30"); 
 ObjectCreate("SignalEMAM30",OBJ_LABEL,总_126_in,0,0.0,0,0.0,0,0.0); 
 ObjectSetText("SignalEMAM30",子_126_st,45,"Tahoma Narrow",子_19_ui); 
 ObjectSet("SignalEMAM30",OBJPROP_CORNER,总_123_bo); 
 ObjectSet("SignalEMAM30",OBJPROP_XDISTANCE,总_125_in + 70); 
 ObjectSet("SignalEMAM30",OBJPROP_YDISTANCE,总_124_in + 18); 
 ObjectDelete("SignalEMAH1"); 
 ObjectCreate("SignalEMAH1",OBJ_LABEL,总_126_in,0,0.0,0,0.0,0,0.0); 
 ObjectSetText("SignalEMAH1",子_127_st,45,"Tahoma Narrow",子_20_ui); 
 ObjectSet("SignalEMAH1",OBJPROP_CORNER,总_123_bo); 
 ObjectSet("SignalEMAH1",OBJPROP_XDISTANCE,总_125_in + 50); 
 ObjectSet("SignalEMAH1",OBJPROP_YDISTANCE,总_124_in + 18); 
 ObjectDelete("SignalEMAH4"); 
 ObjectCreate("SignalEMAH4",OBJ_LABEL,总_126_in,0,0.0,0,0.0,0,0.0); 
 ObjectSetText("SignalEMAH4",子_128_st,45,"Tahoma Narrow",子_21_ui); 
 ObjectSet("SignalEMAH4",OBJPROP_CORNER,总_123_bo); 
 ObjectSet("SignalEMAH4",OBJPROP_XDISTANCE,总_125_in + 30); 
 ObjectSet("SignalEMAH4",OBJPROP_YDISTANCE,总_124_in + 18); 
 ObjectDelete("SignalEMAD1"); 
 ObjectCreate("SignalEMAD1",OBJ_LABEL,总_126_in,0,0.0,0,0.0,0,0.0); 
 ObjectSetText("SignalEMAD1",子_129_st,45,"Tahoma Narrow",子_22_ui); 
 ObjectSet("SignalEMAD1",OBJPROP_CORNER,总_123_bo); 
 ObjectSet("SignalEMAD1",OBJPROP_XDISTANCE,总_125_in + 10); 
 ObjectSet("SignalEMAD1",OBJPROP_YDISTANCE,总_124_in + 18); 
 子_132_do = NormalizeDouble(MarketInfo(Symbol(),9),Digits()) ;
 子_133_do = iMA(Symbol(),1,1,0,MODE_EMA,PRICE_CLOSE,1) ;
 子_134_st = "" ;
 if ( 子_133_do>子_132_do )
  {
  子_134_st = "" ;
  子_23_ui = 总_140_in ;
  }
 if ( 子_133_do<子_132_do )
  {
  子_134_st = "" ;
  子_23_ui = 总_139_in ;
  }
 if ( 子_133_do==子_132_do )
  {
  子_134_st = "" ;
  子_23_ui = 总_141_in ;
  }
 ObjectDelete("cja"); 
 ObjectCreate("cja",OBJ_LABEL,总_126_in,0,0.0,0,0.0,0,0.0); 
 ObjectSetText("cja","cja",8,"Tahoma Narrow",DimGray); 
 ObjectSet("cja",OBJPROP_CORNER,总_123_bo); 
 ObjectSet("cja",OBJPROP_XDISTANCE,总_125_in + 153); 
 ObjectSet("cja",OBJPROP_YDISTANCE,总_124_in + 23); 
 if ( 总_129_bo == 0 && 总_127_bo == 1 )
  {
  ObjectDelete("Signalprice"); 
  ObjectCreate("Signalprice",OBJ_LABEL,总_126_in,0,0.0,0,0.0,0,0.0); 
  ObjectSetText("Signalprice",DoubleToString(子_132_do,Digits()),35,"Arial",子_23_ui); 
  ObjectSet("Signalprice",OBJPROP_CORNER,总_123_bo); 
  ObjectSet("Signalprice",OBJPROP_XDISTANCE,总_125_in + 10); 
  ObjectSet("Signalprice",OBJPROP_YDISTANCE,总_124_in + 56); 
  }
 if ( 总_129_bo == 1 && 总_127_bo == 1 )
  {
  ObjectDelete("Signalprice"); 
  ObjectCreate("Signalprice",OBJ_LABEL,总_126_in,0,0.0,0,0.0,0,0.0); 
  ObjectSetText("Signalprice",DoubleToString(子_132_do,Digits()),15,"Arial",子_23_ui); 
  ObjectSet("Signalprice",OBJPROP_CORNER,总_123_bo); 
  ObjectSet("Signalprice",OBJPROP_XDISTANCE,总_125_in + 10); 
  ObjectSet("Signalprice",OBJPROP_YDISTANCE,总_124_in + 60); 
  }
 子_135_in = 0 ;
 子_136_in = 0 ;
 子_137_in = 0 ;
 子_138_in = 0 ;
 子_139_in = 0 ;
 子_140_in = 0 ;
 子_135_in = (iHigh(NULL,PERIOD_D1,1) - iLow(NULL,PERIOD_D1,1)) / Point() ;
 for (子_140_in = 1 ; 子_140_in <= 5 ; 子_140_in = 子_140_in + 1)
  {
  子_136_in = 子_136_in + (iHigh(NULL,PERIOD_D1,子_140_in) - iLow(NULL,PERIOD_D1,子_140_in)) / Point() ;
  }
 for (子_140_in = 1 ; 子_140_in <= 10 ; 子_140_in = 子_140_in + 1)
  {
  子_137_in = 子_137_in + (iHigh(NULL,PERIOD_D1,子_140_in) - iLow(NULL,PERIOD_D1,子_140_in)) / Point() ;
  }
 for (子_140_in = 1 ; 子_140_in <= 20 ; 子_140_in = 子_140_in + 1)
  {
  子_138_in = 子_138_in + (iHigh(NULL,PERIOD_D1,子_140_in) - iLow(NULL,PERIOD_D1,子_140_in)) / Point() ;
  }
 子_136_in = 子_136_in / 5;
 子_137_in = 子_137_in / 10;
 子_138_in = 子_138_in / 20;
 子_139_in = (子_135_in + 子_136_in + 子_137_in + 子_138_in) / 4;
 子_141_st = "" ;
 子_142_st = "" ;
 子_143_st = "" ;
 子_144_st = "" ;
 子_145_st = "" ;
 子_146_st = "" ;
 子_147_st = "" ;
 子_148_st = "" ;
 子_149_st = "" ;
 子_150_do = iOpen(NULL,1440,0) ;
 子_151_do = iClose(NULL,1440,0) ;
 子_152_do = (Ask - Bid) / Point() ;
 子_153_do = iHigh(NULL,PERIOD_D1,0) ;
 子_154_do = iLow(NULL,PERIOD_D1,0) ;
 子_144_st = DoubleToString((子_151_do - 子_150_do) / Point(),0) ;
 子_143_st = DoubleToString(子_152_do,Digits() - 4) ;
 子_145_st = DoubleToString(子_139_in,Digits() - 4) ;
 子_149_st = string((iHigh(NULL,PERIOD_D1,1) - iLow(NULL,PERIOD_D1,1)) / Point()) ;
 子_146_st = DoubleToString((子_153_do - 子_154_do) / Point(),0) ;
 if ( 子_151_do>=子_150_do )
  {
  子_147_st = "-" ;
  子_25_ui = 总_135_in ;
  }
 if ( 子_151_do<子_150_do )
  {
  子_147_st = "-" ;
  子_25_ui = 总_136_in ;
  }
 if ( 子_145_st >= 子_149_st )
  {
  子_148_st = "-" ;
  子_26_in = 总_137_in ;
  }
 if ( 子_145_st <  子_149_st )
  {
  子_148_st = "-" ;
  子_26_in = 总_138_in ;
  }
 ObjectDelete("SIG_DETAIL_1"); 
 ObjectCreate("SIG_DETAIL_1",OBJ_LABEL,总_126_in,0,0.0,0,0.0,0,0.0); 
 ObjectSetText("SIG_DETAIL_1","Spread",14,"Times New Roman",总_132_in); 
 ObjectSet("SIG_DETAIL_1",OBJPROP_CORNER,总_123_bo); 
 ObjectSet("SIG_DETAIL_1",OBJPROP_XDISTANCE,总_125_in + 65); 
 ObjectSet("SIG_DETAIL_1",OBJPROP_YDISTANCE,总_124_in + 100); 
 ObjectDelete("SIG_DETAIL_2"); 
 ObjectCreate("SIG_DETAIL_2",OBJ_LABEL,总_126_in,0,0.0,0,0.0,0,0.0); 
 ObjectSetText("SIG_DETAIL_2","" + 子_143_st + "",14,"Times New Roman",总_133_in); 
 ObjectSet("SIG_DETAIL_2",OBJPROP_CORNER,总_123_bo); 
 ObjectSet("SIG_DETAIL_2",OBJPROP_XDISTANCE,总_125_in + 10); 
 ObjectSet("SIG_DETAIL_2",OBJPROP_YDISTANCE,总_124_in + 100); 
 ObjectDelete("SIG_DETAIL_3"); 
 ObjectCreate("SIG_DETAIL_3",OBJ_LABEL,总_126_in,0,0.0,0,0.0,0,0.0); 
 ObjectSetText("SIG_DETAIL_3","Volatility Ratio",14,"Times New Roman",总_132_in); 
 ObjectSet("SIG_DETAIL_3",OBJPROP_CORNER,总_123_bo); 
 ObjectSet("SIG_DETAIL_3",OBJPROP_XDISTANCE,总_125_in + 65); 
 ObjectSet("SIG_DETAIL_3",OBJPROP_YDISTANCE,总_124_in + 115); 
 ObjectDelete("SIG_DETAIL_4"); 
 ObjectCreate("SIG_DETAIL_4",OBJ_LABEL,总_126_in,0,0.0,0,0.0,0,0.0); 
 ObjectSetText("SIG_DETAIL_4","" + 子_144_st + "",14,"Times New Roman",子_25_ui); 
 ObjectSet("SIG_DETAIL_4",OBJPROP_CORNER,总_123_bo); 
 ObjectSet("SIG_DETAIL_4",OBJPROP_XDISTANCE,总_125_in + 10); 
 ObjectSet("SIG_DETAIL_4",OBJPROP_YDISTANCE,总_124_in + 115); 
 if ( 总_185_bo )
  {
  子_155_do = iCustom(NULL,0,"NewsAlert",总_188_bo,总_189_bo,总_190_bo,总_191_bo,总_192_bo,总_193_bo,总_194_bo,总_195_bo,总_196_bo,总_197_bo,总_198_bo,总_199_bo,总_200_bo,总_201_bo,总_202_bo,总_203_bo,总_204_in,1,0) ;
  子_156_do = iCustom(NULL,0,"NewsAlert",总_188_bo,总_189_bo,总_190_bo,总_191_bo,总_192_bo,总_193_bo,总_194_bo,总_195_bo,总_196_bo,总_197_bo,总_198_bo,总_199_bo,总_200_bo,总_201_bo,总_202_bo,总_203_bo,总_204_in,1,1) ;
  if ( ( 子_155_do<=总_187_in || 子_156_do<=总_186_in ) )
   {
   return;
  }}
 子_157_do = 总_5_do ;
 子_158_in = 总_6_in ;
 子_159_do = TakeProfit ;
 子_160_bo = 总_8_bo ;
 子_161_do = 总_9_do ;
 子_162_bo = UseTrailingStop ;
 子_163_do = TrailStart ;
 子_164_do = TrailStop ;
 子_165_do = PipStep ;
 子_166_do = 总_10_do ;
 if ( MM == 1 )
  {
  if ( MathCeil(AccountBalance())<200000.0 )
   {
   子_31_do = Lots ;
   }
  else
   {
   子_31_do = MathCeil(AccountBalance()) * 0.00001 ;
  }}
 else
  {
  子_31_do = Lots ;
  }
 if ( 子_162_bo )
  {
  lizong_7(子_163_do,子_164_do,总_24_do); 
  }
 if ( 总_13_bo && TimeCurrent() >= 总_33_in )
  {
  for (临_in_1 = OrdersTotal() - 1 ; 临_in_1 >= 0 ; 临_in_1=临_in_1 - 1)
   {
   总_183_bo = OrderSelect(临_in_1,SELECT_BY_POS,MODE_TRADES) ;
   if ( OrderSymbol() != Symbol() )   continue;
   
   if ( OrderSymbol() == Symbol() && OrderMagicNumber() == 总_17_in )
    {
    if ( OrderType() == 0 )
     {
     OrderClose(OrderTicket(),OrderLots(),Bid,总_16_do,Blue); 
     }
    if ( OrderType() == 1 )
     {
     OrderClose(OrderTicket(),OrderLots(),Ask,总_16_do,Red); 
    }}
   Sleep(1000); 
   
   }
  Print("Closed All due_Hilo to TimeOut"); 
  }
 if ( 总_32_in == Time[0] )
  {
  return;
  }
 总_32_in = Time[0] ;
 临_do_2 = 0.0;
 for (总_36_in=OrdersTotal() - 1 ; 总_36_in >= 0 ; 总_36_in=总_36_in - 1)
  {
  总_183_bo = OrderSelect(总_36_in,SELECT_BY_POS,MODE_TRADES) ;
  if ( OrderSymbol() != Symbol() || OrderMagicNumber() != 总_17_in || OrderSymbol() != Symbol() || OrderMagicNumber() != 总_17_in )   continue;
  
  if ( ( OrderType() != 0 && OrderType() != 1 ) )   continue;
  临_do_2 = 临_do_2 + OrderProfit();
  
  }
 子_167_do = 临_do_2 ;
 if ( 子_160_bo && 子_167_do<0.0 )
  {
  临_do_3 = 子_161_do / 100.0;
  临_in_4 = 0;
  for (临_in_5 = OrdersTotal() - 1 ; 临_in_5 >= 0 ; 临_in_5=临_in_5 - 1)
   {
   总_183_bo = OrderSelect(临_in_5,SELECT_BY_POS,MODE_TRADES) ;
   if ( OrderSymbol() != Symbol() || OrderMagicNumber() != 总_17_in || OrderSymbol() != Symbol() || OrderMagicNumber() != 总_17_in )   continue;
   
   if ( ( OrderType() != 1 && OrderType() != 0 ) )   continue;
   临_in_4=临_in_4 + 1; 
   
   }
  if ( 临_in_4 == 0 )
   {
   总_44_do = AccountEquity() ;
   }
  if ( 总_44_do<总_45_do )
   {
   总_44_do = 总_45_do ;
   }
  else
   {
   总_44_do = AccountEquity() ;
   }
  总_45_do = AccountEquity() ;
  if ( MathAbs(子_167_do)>临_do_3 * 总_44_do )
   {
   for (临_in_6 = OrdersTotal() - 1 ; 临_in_6 >= 0 ; 临_in_6=临_in_6 - 1)
    {
    总_183_bo = OrderSelect(临_in_6,SELECT_BY_POS,MODE_TRADES) ;
    if ( OrderSymbol() != Symbol() )   continue;
    
    if ( OrderSymbol() == Symbol() && OrderMagicNumber() == 总_17_in )
     {
     if ( OrderType() == 0 )
      {
      OrderClose(OrderTicket(),OrderLots(),Bid,总_16_do,Blue); 
      }
     if ( OrderType() == 1 )
      {
      OrderClose(OrderTicket(),OrderLots(),Ask,总_16_do,Red); 
     }}
    Sleep(1000); 
    
    }
   Print("Closed All due_Hilo to Stop Out"); 
   总_43_bo = false ;
  }}
 临_in_7 = 0;
 for (临_in_8 = OrdersTotal() - 1 ; 临_in_8 >= 0 ; 临_in_8=临_in_8 - 1)
  {
  总_183_bo = OrderSelect(临_in_8,SELECT_BY_POS,MODE_TRADES) ;
  if ( OrderSymbol() != Symbol() || OrderMagicNumber() != 总_17_in || OrderSymbol() != Symbol() || OrderMagicNumber() != 总_17_in )   continue;
  
  if ( ( OrderType() != 1 && OrderType() != 0 ) )   continue;
  临_in_7=临_in_7 + 1; 
  
  }
 总_37_in = 临_in_7 ;
 if ( 总_37_in == 0 )
  {
  总_30_bo = false ;
  }
 for (总_36_in=OrdersTotal() - 1 ; 总_36_in >= 0 ; 总_36_in=总_36_in - 1)
  {
  总_183_bo = OrderSelect(总_36_in,SELECT_BY_POS,MODE_TRADES) ;
  if ( OrderSymbol() != Symbol() || OrderMagicNumber() != 总_17_in )   continue;
  
  if ( OrderSymbol() == Symbol() && OrderMagicNumber() == 总_17_in && OrderType() == 0 )
   {
   总_40_bo = true ;
   总_41_bo = false ;
   break;
   }
  if ( OrderSymbol() != Symbol() || OrderMagicNumber() != 总_17_in || OrderType() != 1 )   continue;
  总_40_bo = false ;
  总_41_bo = true ;
  break;
  
  }
 if ( 总_37_in >  0 && 总_37_in <= 总_12_in )
  {
  RefreshRates(); 
  临_do_9 = 0.0;
  临_in_10 = 0;
  临_in_11 = 0;
  for (临_in_12 = OrdersTotal() - 1 ; 临_in_12 >= 0 ; 临_in_12=临_in_12 - 1)
   {
   总_183_bo = OrderSelect(临_in_12,SELECT_BY_POS,MODE_TRADES) ;
   if ( OrderSymbol() != Symbol() || OrderMagicNumber() != 总_17_in || OrderSymbol() != Symbol() || OrderMagicNumber() != 总_17_in || OrderType() != 0 )   continue;
   临_in_10 = OrderTicket();
   if ( 临_in_10 <= 临_in_11 )   continue;
   临_do_9 = OrderOpenPrice();
   临_in_11 = 临_in_10;
   
   }
  总_27_do = 临_do_9 ;
  临_do_13 = 0.0;
  临_in_14 = 0;
  临_in_15 = 0;
  for (临_in_16 = OrdersTotal() - 1 ; 临_in_16 >= 0 ; 临_in_16=临_in_16 - 1)
   {
   总_183_bo = OrderSelect(临_in_16,SELECT_BY_POS,MODE_TRADES) ;
   if ( OrderSymbol() != Symbol() || OrderMagicNumber() != 总_17_in || OrderSymbol() != Symbol() || OrderMagicNumber() != 总_17_in || OrderType() != 1 )   continue;
   临_in_14 = OrderTicket();
   if ( 临_in_14 <= 临_in_15 )   continue;
   临_do_13 = OrderOpenPrice();
   临_in_15 = 临_in_14;
   
   }
  总_28_do = 临_do_13 ;
  if ( 总_40_bo && 总_27_do - Ask>=子_165_do * Point() )
   {
   总_39_bo = true ;
   }
  if ( 总_41_bo && Bid - 总_28_do>=子_165_do * Point() )
   {
   总_39_bo = true ;
  }}
 if ( 总_37_in <  1 )
  {
  总_41_bo = false ;
  总_40_bo = false ;
  总_39_bo = true ;
  总_19_do = AccountEquity() ;
  }
 if ( 总_39_bo )
  {
  临_do_17 = 0.0;
  临_in_18 = 0;
  临_in_19 = 0;
  for (临_in_20 = OrdersTotal() - 1 ; 临_in_20 >= 0 ; 临_in_20=临_in_20 - 1)
   {
   总_183_bo = OrderSelect(临_in_20,SELECT_BY_POS,MODE_TRADES) ;
   if ( OrderSymbol() != Symbol() || OrderMagicNumber() != 总_17_in || OrderSymbol() != Symbol() || OrderMagicNumber() != 总_17_in || OrderType() != 0 )   continue;
   临_in_18 = OrderTicket();
   if ( 临_in_18 <= 临_in_19 )   continue;
   临_do_17 = OrderOpenPrice();
   临_in_19 = 临_in_18;
   
   }
  总_27_do = 临_do_17 ;
  临_do_21 = 0.0;
  临_in_22 = 0;
  临_in_23 = 0;
  for (临_in_24 = OrdersTotal() - 1 ; 临_in_24 >= 0 ; 临_in_24=临_in_24 - 1)
   {
   总_183_bo = OrderSelect(临_in_24,SELECT_BY_POS,MODE_TRADES) ;
   if ( OrderSymbol() != Symbol() || OrderMagicNumber() != 总_17_in || OrderSymbol() != Symbol() || OrderMagicNumber() != 总_17_in || OrderType() != 1 )   continue;
   临_in_22 = OrderTicket();
   if ( 临_in_22 <= 临_in_23 )   continue;
   临_do_21 = OrderOpenPrice();
   临_in_23 = 临_in_22;
   
   }
  总_28_do = 临_do_21 ;
  if ( 总_41_bo && 总_1_bo )
   {
   总_34_in = 总_37_in ;
   总_35_do = NormalizeDouble(子_31_do * MathPow(子_157_do,总_37_in),子_158_in) ;
   RefreshRates(); 
   总_42_in = lizong_6(1,总_35_do,Bid,子_166_do,Ask,0,0,总_31_st,总_17_in,0,HotPink) ;
   if ( 总_42_in <  0 )
    {
    Print("Error: ",GetLastError()); 
    return;
    }
   临_do_25 = 0.0;
   临_in_26 = 0;
   临_in_27 = 0;
   for (临_in_28 = OrdersTotal() - 1 ; 临_in_28 >= 0 ; 临_in_28=临_in_28 - 1)
    {
    总_183_bo = OrderSelect(临_in_28,SELECT_BY_POS,MODE_TRADES) ;
    if ( OrderSymbol() != Symbol() || OrderMagicNumber() != 总_17_in || OrderSymbol() != Symbol() || OrderMagicNumber() != 总_17_in || OrderType() != 1 )   continue;
    临_in_26 = OrderTicket();
    if ( 临_in_26 <= 临_in_27 )   continue;
    临_do_25 = OrderOpenPrice();
    临_in_27 = 临_in_26;
    
    }
   总_28_do = 临_do_25 ;
   总_39_bo = false ;
   总_43_bo = true ;
   }
  else
   {
   if ( 总_40_bo && 总_1_bo )
    {
    总_34_in = 总_37_in ;
    总_35_do = NormalizeDouble(子_31_do * MathPow(子_157_do,总_37_in),子_158_in) ;
    总_42_in = lizong_6(0,总_35_do,Ask,子_166_do,Bid,0,0,总_31_st,总_17_in,0,Lime) ;
    if ( 总_42_in <  0 )
     {
     Print("Error: ",GetLastError()); 
     return;
     }
    临_do_29 = 0.0;
    临_in_30 = 0;
    临_in_31 = 0;
    for (临_in_32 = OrdersTotal() - 1 ; 临_in_32 >= 0 ; 临_in_32=临_in_32 - 1)
     {
     总_183_bo = OrderSelect(临_in_32,SELECT_BY_POS,MODE_TRADES) ;
     if ( OrderSymbol() != Symbol() || OrderMagicNumber() != 总_17_in || OrderSymbol() != Symbol() || OrderMagicNumber() != 总_17_in || OrderType() != 0 )   continue;
     临_in_30 = OrderTicket();
     if ( 临_in_30 <= 临_in_31 )   continue;
     临_do_29 = OrderOpenPrice();
     临_in_31 = 临_in_30;
     
     }
    总_27_do = 临_do_29 ;
    总_39_bo = false ;
    总_43_bo = true ;
  }}}
 if ( 总_39_bo && 总_37_in <  1 && 总_1_bo )
  {
  子_27_do = iHigh(Symbol(),0,1) ;
  子_28_do = iLow(Symbol(),0,2) ;
  总_25_do = Bid ;
  总_26_do = Ask ;
  if ( !(总_41_bo) && !(总_40_bo) )
   {
   总_34_in = 总_37_in ;
   总_35_do = NormalizeDouble(子_31_do * MathPow(子_157_do,总_37_in),子_158_in) ;
   if ( 子_27_do>子_28_do )
    {
    if ( iRSI(NULL,60,14,0,1)>30.0 )
     {
     总_42_in = lizong_6(1,总_35_do,总_25_do,子_166_do,总_25_do,0,0,总_31_st,总_17_in,0,HotPink) ;
     if ( 总_42_in <  0 )
      {
      Print("Error: ",GetLastError()); 
      return;
      }
     临_do_33 = 0.0;
     临_in_34 = 0;
     临_in_35 = 0;
     for (临_in_36 = OrdersTotal() - 1 ; 临_in_36 >= 0 ; 临_in_36=临_in_36 - 1)
      {
      总_183_bo = OrderSelect(临_in_36,SELECT_BY_POS,MODE_TRADES) ;
      if ( OrderSymbol() != Symbol() || OrderMagicNumber() != 总_17_in || OrderSymbol() != Symbol() || OrderMagicNumber() != 总_17_in || OrderType() != 0 )   continue;
      临_in_34 = OrderTicket();
      if ( 临_in_34 <= 临_in_35 )   continue;
      临_do_33 = OrderOpenPrice();
      临_in_35 = 临_in_34;
      
      }
     总_27_do = 临_do_33 ;
     总_43_bo = true ;
    }}
   else
    {
    if ( iRSI(NULL,60,14,0,1)<70.0 )
     {
     总_42_in = lizong_6(0,总_35_do,总_26_do,子_166_do,总_26_do,0,0,总_31_st,总_17_in,0,Lime) ;
     if ( 总_42_in <  0 )
      {
      Print("Error: ",GetLastError()); 
      return;
      }
     临_do_37 = 0.0;
     临_in_38 = 0;
     临_in_39 = 0;
     for (临_in_40 = OrdersTotal() - 1 ; 临_in_40 >= 0 ; 临_in_40=临_in_40 - 1)
      {
      总_183_bo = OrderSelect(临_in_40,SELECT_BY_POS,MODE_TRADES) ;
      if ( OrderSymbol() != Symbol() || OrderMagicNumber() != 总_17_in || OrderSymbol() != Symbol() || OrderMagicNumber() != 总_17_in || OrderType() != 1 )   continue;
      临_in_38 = OrderTicket();
      if ( 临_in_38 <= 临_in_39 )   continue;
      临_do_37 = OrderOpenPrice();
      临_in_39 = 临_in_38;
      
      }
     总_28_do = 临_do_37 ;
     总_43_bo = true ;
    }}
   if ( 总_42_in >  0 )
    {
    总_33_in = TimeCurrent() + 总_14_do * 60.0 * 60.0 ;
    }
   总_39_bo = false ;
  }}
 临_in_41 = 0;
 for (临_in_42 = OrdersTotal() - 1 ; 临_in_42 >= 0 ; 临_in_42=临_in_42 - 1)
  {
  总_183_bo = OrderSelect(临_in_42,SELECT_BY_POS,MODE_TRADES) ;
  if ( OrderSymbol() != Symbol() || OrderMagicNumber() != 总_17_in || OrderSymbol() != Symbol() || OrderMagicNumber() != 总_17_in )   continue;
  
  if ( ( OrderType() != 1 && OrderType() != 0 ) )   continue;
  临_in_41=临_in_41 + 1; 
  
  }
 总_37_in = 临_in_41 ;
 总_24_do = 0.0 ;
 子_168_do = 0.0 ;
 for (总_36_in=OrdersTotal() - 1 ; 总_36_in >= 0 ; 总_36_in=总_36_in - 1)
  {
  总_183_bo = OrderSelect(总_36_in,SELECT_BY_POS,MODE_TRADES) ;
  if ( OrderSymbol() != Symbol() || OrderMagicNumber() != 总_17_in || OrderSymbol() != Symbol() || OrderMagicNumber() != 总_17_in )   continue;
  
  if ( ( OrderType() != 0 && OrderType() != 1 ) )   continue;
  总_24_do = OrderOpenPrice() * OrderLots() + 总_24_do ;
  子_168_do = 子_168_do + OrderLots() ;
  
  }
 if ( 总_37_in >  0 )
  {
  总_24_do = NormalizeDouble(总_24_do / 子_168_do,Digits()) ;
  }
 if ( 总_43_bo )
  {
  for (总_36_in=OrdersTotal() - 1 ; 总_36_in >= 0 ; 总_36_in=总_36_in - 1)
   {
   总_183_bo = OrderSelect(总_36_in,SELECT_BY_POS,MODE_TRADES) ;
   if ( OrderSymbol() != Symbol() || OrderMagicNumber() != 总_17_in )   continue;
   
   if ( OrderSymbol() == Symbol() && OrderMagicNumber() == 总_17_in && OrderType() == 0 )
    {
    总_18_do = 子_159_do * Point() + 总_24_do ;
    总_20_do = 总_18_do ;
    if ( UseStopLoss )
     {
     总_38_do = 总_24_do - 总_15_do * Point() ;
     }
    总_30_bo = true ;
    }
   if ( OrderSymbol() != Symbol() || OrderMagicNumber() != 总_17_in || OrderType() != 1 )   continue;
   总_18_do = 总_24_do - 子_159_do * Point() ;
   总_21_do = 总_18_do ;
   if ( UseStopLoss )
    {
    总_38_do = 总_15_do * Point() + 总_24_do ;
    }
   总_30_bo = true ;
   
   }
   }
 if ( 总_43_bo )
  {
  临_in_43 = 总_30_bo;
  if ( 临_in_43 == 1 )
   {
   for (总_36_in=OrdersTotal() - 1 ; 总_36_in >= 0 ; 总_36_in=总_36_in - 1)
    {
    总_183_bo = OrderSelect(总_36_in,SELECT_BY_POS,MODE_TRADES) ;
    if ( OrderSymbol() != Symbol() || OrderMagicNumber() != 总_17_in )   continue;
    
    if ( OrderSymbol() == Symbol() && OrderMagicNumber() == 总_17_in )
     {
     临_in_43 = OrderTicket();
     while (!(OrderModify(临_in_43,总_24_do,总_38_do,总_18_do,0,Yellow)))
      {
      Sleep(1000); 
      RefreshRates(); 
      临_in_43 = OrderTicket();
      }
      }
    总_43_bo = false ;
    
    }
   }}
 子_169_do = 总_5_do ;
 子_170_in = 总_6_in ;
 子_171_do = TakeProfit ;
 子_172_bo = 总_8_bo ;
 子_173_do = 总_9_do ;
 子_174_bo = UseTrailingStop ;
 子_175_do = TrailStart ;
 子_176_do = TrailStop ;
 子_177_do = PipStep ;
 子_178_do = 总_10_do ;
 if ( MM == 1 )
  {
  if ( MathCeil(AccountBalance())<200000.0 )
   {
   子_32_do = Lots ;
   }
  else
   {
   子_32_do = MathCeil(AccountBalance()) * 0.00001 ;
  }}
 else
  {
  子_32_do = Lots ;
  }
 if ( 子_174_bo )
  {
  lizong_9(子_175_do,子_176_do,总_58_do); 
  }
 if ( 总_50_bo && TimeCurrent() >= 总_67_in )
  {
  for (临_in_44 = OrdersTotal() - 1 ; 临_in_44 >= 0 ; 临_in_44=临_in_44 - 1)
   {
   总_183_bo = OrderSelect(临_in_44,SELECT_BY_POS,MODE_TRADES) ;
   if ( OrderSymbol() != Symbol() )   continue;
   
   if ( OrderSymbol() == Symbol() && OrderMagicNumber() == 总_53_in )
    {
    if ( OrderType() == 0 )
     {
     OrderClose(OrderTicket(),OrderLots(),Bid,总_52_do,Blue); 
     }
    if ( OrderType() == 1 )
     {
     OrderClose(OrderTicket(),OrderLots(),Ask,总_52_do,Red); 
    }}
   Sleep(1000); 
   
   }
  Print("Closed All due to TimeOut"); 
  }
 if ( 总_66_in != Time[0] )
  {
  总_66_in = Time[0] ;
  临_do_45 = 0.0;
  for (总_70_in=OrdersTotal() - 1 ; 总_70_in >= 0 ; 总_70_in=总_70_in - 1)
   {
   总_183_bo = OrderSelect(总_70_in,SELECT_BY_POS,MODE_TRADES) ;
   if ( OrderSymbol() != Symbol() || OrderMagicNumber() != 总_53_in || OrderSymbol() != Symbol() || OrderMagicNumber() != 总_53_in )   continue;
   
   if ( ( OrderType() != 0 && OrderType() != 1 ) )   continue;
   临_do_45 = 临_do_45 + OrderProfit();
   
   }
  子_33_do = 临_do_45 ;
  if ( 子_172_bo && 子_33_do<0.0 )
   {
   临_do_46 = 子_173_do / 100.0;
   临_in_47 = 0;
   for (临_in_48 = OrdersTotal() - 1 ; 临_in_48 >= 0 ; 临_in_48=临_in_48 - 1)
    {
    总_183_bo = OrderSelect(临_in_48,SELECT_BY_POS,MODE_TRADES) ;
    if ( OrderSymbol() != Symbol() || OrderMagicNumber() != 总_53_in || OrderSymbol() != Symbol() || OrderMagicNumber() != 总_53_in )   continue;
    
    if ( ( OrderType() != 1 && OrderType() != 0 ) )   continue;
    临_in_47=临_in_47 + 1; 
    
    }
   if ( 临_in_47 == 0 )
    {
    总_78_do = AccountEquity() ;
    }
   if ( 总_78_do<总_79_do )
    {
    总_78_do = 总_79_do ;
    }
   else
    {
    总_78_do = AccountEquity() ;
    }
   总_79_do = AccountEquity() ;
   if ( MathAbs(子_33_do)>临_do_46 * 总_78_do )
    {
    for (临_in_49 = OrdersTotal() - 1 ; 临_in_49 >= 0 ; 临_in_49=临_in_49 - 1)
     {
     总_183_bo = OrderSelect(临_in_49,SELECT_BY_POS,MODE_TRADES) ;
     if ( OrderSymbol() != Symbol() )   continue;
     
     if ( OrderSymbol() == Symbol() && OrderMagicNumber() == 总_53_in )
      {
      if ( OrderType() == 0 )
       {
       OrderClose(OrderTicket(),OrderLots(),Bid,总_52_do,Blue); 
       }
      if ( OrderType() == 1 )
       {
       OrderClose(OrderTicket(),OrderLots(),Ask,总_52_do,Red); 
      }}
     Sleep(1000); 
     
     }
    Print("Closed All due to Stop Out"); 
    总_77_bo = false ;
   }}
  临_in_50 = 0;
  for (临_in_51 = OrdersTotal() - 1 ; 临_in_51 >= 0 ; 临_in_51=临_in_51 - 1)
   {
   总_183_bo = OrderSelect(临_in_51,SELECT_BY_POS,MODE_TRADES) ;
   if ( OrderSymbol() != Symbol() || OrderMagicNumber() != 总_53_in || OrderSymbol() != Symbol() || OrderMagicNumber() != 总_53_in )   continue;
   
   if ( ( OrderType() != 1 && OrderType() != 0 ) )   continue;
   临_in_50=临_in_50 + 1; 
   
   }
  总_71_in = 临_in_50 ;
  if ( 总_71_in == 0 )
   {
   总_64_bo = false ;
   }
  for (总_70_in=OrdersTotal() - 1 ; 总_70_in >= 0 ; 总_70_in=总_70_in - 1)
   {
   总_183_bo = OrderSelect(总_70_in,SELECT_BY_POS,MODE_TRADES) ;
   if ( OrderSymbol() != Symbol() || OrderMagicNumber() != 总_53_in )   continue;
   
   if ( OrderSymbol() == Symbol() && OrderMagicNumber() == 总_53_in && OrderType() == 0 )
    {
    总_74_bo = true ;
    总_75_bo = false ;
    break;
    }
   if ( OrderSymbol() != Symbol() || OrderMagicNumber() != 总_53_in || OrderType() != 1 )   continue;
   总_74_bo = false ;
   总_75_bo = true ;
   break;
   
   }
  if ( 总_71_in >  0 && 总_71_in <= 总_47_in )
   {
   RefreshRates(); 
   临_do_52 = 0.0;
   临_in_53 = 0;
   临_in_54 = 0;
   for (临_in_55 = OrdersTotal() - 1 ; 临_in_55 >= 0 ; 临_in_55=临_in_55 - 1)
    {
    总_183_bo = OrderSelect(临_in_55,SELECT_BY_POS,MODE_TRADES) ;
    if ( OrderSymbol() != Symbol() || OrderMagicNumber() != 总_53_in || OrderSymbol() != Symbol() || OrderMagicNumber() != 总_53_in || OrderType() != 0 )   continue;
    临_in_53 = OrderTicket();
    if ( 临_in_53 <= 临_in_54 )   continue;
    临_do_52 = OrderOpenPrice();
    临_in_54 = 临_in_53;
    
    }
   总_61_do = 临_do_52 ;
   临_do_56 = 0.0;
   临_in_57 = 0;
   临_in_58 = 0;
   for (临_in_59 = OrdersTotal() - 1 ; 临_in_59 >= 0 ; 临_in_59=临_in_59 - 1)
    {
    总_183_bo = OrderSelect(临_in_59,SELECT_BY_POS,MODE_TRADES) ;
    if ( OrderSymbol() != Symbol() || OrderMagicNumber() != 总_53_in || OrderSymbol() != Symbol() || OrderMagicNumber() != 总_53_in || OrderType() != 1 )   continue;
    临_in_57 = OrderTicket();
    if ( 临_in_57 <= 临_in_58 )   continue;
    临_do_56 = OrderOpenPrice();
    临_in_58 = 临_in_57;
    
    }
   总_62_do = 临_do_56 ;
   if ( 总_74_bo && 总_61_do - Ask>=子_177_do * Point() )
    {
    总_73_bo = true ;
    }
   if ( 总_75_bo && Bid - 总_62_do>=子_177_do * Point() )
    {
    总_73_bo = true ;
   }}
  if ( 总_71_in <  1 )
   {
   总_75_bo = false ;
   总_74_bo = false ;
   总_73_bo = true ;
   总_55_do = AccountEquity() ;
   }
  if ( 总_73_bo && 总_2_bo )
   {
   临_do_60 = 0.0;
   临_in_61 = 0;
   临_in_62 = 0;
   for (临_in_63 = OrdersTotal() - 1 ; 临_in_63 >= 0 ; 临_in_63=临_in_63 - 1)
    {
    总_183_bo = OrderSelect(临_in_63,SELECT_BY_POS,MODE_TRADES) ;
    if ( OrderSymbol() != Symbol() || OrderMagicNumber() != 总_53_in || OrderSymbol() != Symbol() || OrderMagicNumber() != 总_53_in || OrderType() != 0 )   continue;
    临_in_61 = OrderTicket();
    if ( 临_in_61 <= 临_in_62 )   continue;
    临_do_60 = OrderOpenPrice();
    临_in_62 = 临_in_61;
    
    }
   总_61_do = 临_do_60 ;
   临_do_64 = 0.0;
   临_in_65 = 0;
   临_in_66 = 0;
   for (临_in_67 = OrdersTotal() - 1 ; 临_in_67 >= 0 ; 临_in_67=临_in_67 - 1)
    {
    总_183_bo = OrderSelect(临_in_67,SELECT_BY_POS,MODE_TRADES) ;
    if ( OrderSymbol() != Symbol() || OrderMagicNumber() != 总_53_in || OrderSymbol() != Symbol() || OrderMagicNumber() != 总_53_in || OrderType() != 1 )   continue;
    临_in_65 = OrderTicket();
    if ( 临_in_65 <= 临_in_66 )   continue;
    临_do_64 = OrderOpenPrice();
    临_in_66 = 临_in_65;
    
    }
   总_62_do = 临_do_64 ;
   if ( 总_75_bo )
    {
    总_68_in = 总_71_in ;
    总_69_do = NormalizeDouble(子_32_do * MathPow(子_169_do,总_71_in),子_170_in) ;
    RefreshRates(); 
    总_76_in = lizong_8(1,总_69_do,Bid,子_178_do,Ask,0,0,总_65_st,总_53_in,0,HotPink) ;
    if ( 总_76_in <  0 )
     {
     Print("Error: ",GetLastError()); 
     return;
     }
    临_do_68 = 0.0;
    临_in_69 = 0;
    临_in_70 = 0;
    for (临_in_71 = OrdersTotal() - 1 ; 临_in_71 >= 0 ; 临_in_71=临_in_71 - 1)
     {
     总_183_bo = OrderSelect(临_in_71,SELECT_BY_POS,MODE_TRADES) ;
     if ( OrderSymbol() != Symbol() || OrderMagicNumber() != 总_53_in || OrderSymbol() != Symbol() || OrderMagicNumber() != 总_53_in || OrderType() != 1 )   continue;
     临_in_69 = OrderTicket();
     if ( 临_in_69 <= 临_in_70 )   continue;
     临_do_68 = OrderOpenPrice();
     临_in_70 = 临_in_69;
     
     }
    总_62_do = 临_do_68 ;
    总_73_bo = false ;
    总_77_bo = true ;
    }
   else
    {
    if ( 总_74_bo && 总_2_bo )
     {
     总_68_in = 总_71_in ;
     总_69_do = NormalizeDouble(子_32_do * MathPow(子_169_do,总_71_in),子_170_in) ;
     总_76_in = lizong_8(0,总_69_do,Ask,子_178_do,Bid,0,0,总_65_st,总_53_in,0,Lime) ;
     if ( 总_76_in <  0 )
      {
      Print("Error: ",GetLastError()); 
      return;
      }
     临_do_72 = 0.0;
     临_in_73 = 0;
     临_in_74 = 0;
     for (临_in_75 = OrdersTotal() - 1 ; 临_in_75 >= 0 ; 临_in_75=临_in_75 - 1)
      {
      总_183_bo = OrderSelect(临_in_75,SELECT_BY_POS,MODE_TRADES) ;
      if ( OrderSymbol() != Symbol() || OrderMagicNumber() != 总_53_in || OrderSymbol() != Symbol() || OrderMagicNumber() != 总_53_in || OrderType() != 0 )   continue;
      临_in_73 = OrderTicket();
      if ( 临_in_73 <= 临_in_74 )   continue;
      临_do_72 = OrderOpenPrice();
      临_in_74 = 临_in_73;
      
      }
     总_61_do = 临_do_72 ;
     总_73_bo = false ;
     总_77_bo = true ;
  }}}}
 if ( 总_80_in != iTime(NULL,总_48_in,0) )
  {
  子_34_in = OrdersTotal() ;
  子_35_in = 0 ;
  for (子_179_in = 子_34_in ; 子_179_in >= 1 ; 子_179_in = 子_179_in - 1)
   {
   总_183_bo = OrderSelect(子_179_in - 1,SELECT_BY_POS,MODE_TRADES) ;
   if ( OrderSymbol() != Symbol() || OrderMagicNumber() != 总_53_in || OrderSymbol() != Symbol() || OrderMagicNumber() != 总_53_in )   continue;
   子_35_in = 子_35_in + 1;
   
   }
  if ( ( 子_34_in == 0 || (子_35_in <  1 && 总_2_bo) ) )
   {
   子_29_do = iClose(Symbol(),0,2) ;
   子_30_do = iClose(Symbol(),0,1) ;
   总_59_do = Bid ;
   总_60_do = Ask ;
   总_68_in = 总_71_in ;
   总_69_do = 子_32_do ;
   if ( 子_29_do>子_30_do )
    {
    总_76_in = lizong_8(1,子_32_do,Bid,子_178_do,Bid,0,0,总_65_st,总_53_in,0,HotPink) ;
    if ( 总_76_in <  0 )
     {
     Print("Error: ",GetLastError()); 
     return;
     }
    临_do_76 = 0.0;
    临_in_77 = 0;
    临_in_78 = 0;
    for (临_in_79 = OrdersTotal() - 1 ; 临_in_79 >= 0 ; 临_in_79=临_in_79 - 1)
     {
     总_183_bo = OrderSelect(临_in_79,SELECT_BY_POS,MODE_TRADES) ;
     if ( OrderSymbol() != Symbol() || OrderMagicNumber() != 总_53_in || OrderSymbol() != Symbol() || OrderMagicNumber() != 总_53_in || OrderType() != 0 )   continue;
     临_in_77 = OrderTicket();
     if ( 临_in_77 <= 临_in_78 )   continue;
     临_do_76 = OrderOpenPrice();
     临_in_78 = 临_in_77;
     
     }
    总_61_do = 临_do_76 ;
    总_77_bo = true ;
    }
   else
    {
    总_76_in = lizong_8(0,总_69_do,总_60_do,子_178_do,总_60_do,0,0,总_65_st,总_53_in,0,Lime) ;
    if ( 总_76_in <  0 )
     {
     Print("Error: ",GetLastError()); 
     return;
     }
    临_do_80 = 0.0;
    临_in_81 = 0;
    临_in_82 = 0;
    for (临_in_83 = OrdersTotal() - 1 ; 临_in_83 >= 0 ; 临_in_83=临_in_83 - 1)
     {
     总_183_bo = OrderSelect(临_in_83,SELECT_BY_POS,MODE_TRADES) ;
     if ( OrderSymbol() != Symbol() || OrderMagicNumber() != 总_53_in || OrderSymbol() != Symbol() || OrderMagicNumber() != 总_53_in || OrderType() != 1 )   continue;
     临_in_81 = OrderTicket();
     if ( 临_in_81 <= 临_in_82 )   continue;
     临_do_80 = OrderOpenPrice();
     临_in_82 = 临_in_81;
     
     }
    总_62_do = 临_do_80 ;
    总_77_bo = true ;
    }
   if ( 总_76_in >  0 )
    {
    总_67_in = TimeCurrent() + 总_51_do * 60.0 * 60.0 ;
    }
   总_73_bo = false ;
   }
  总_80_in = iTime(NULL,总_48_in,0) ;
  }
 临_in_84 = 0;
 for (临_in_85 = OrdersTotal() - 1 ; 临_in_85 >= 0 ; 临_in_85=临_in_85 - 1)
  {
  总_183_bo = OrderSelect(临_in_85,SELECT_BY_POS,MODE_TRADES) ;
  if ( OrderSymbol() != Symbol() || OrderMagicNumber() != 总_53_in || OrderSymbol() != Symbol() || OrderMagicNumber() != 总_53_in )   continue;
  
  if ( ( OrderType() != 1 && OrderType() != 0 ) )   continue;
  临_in_84=临_in_84 + 1; 
  
  }
 总_71_in = 临_in_84 ;
 总_58_do = 0.0 ;
 子_180_do = 0.0 ;
 for (总_70_in=OrdersTotal() - 1 ; 总_70_in >= 0 ; 总_70_in=总_70_in - 1)
  {
  总_183_bo = OrderSelect(总_70_in,SELECT_BY_POS,MODE_TRADES) ;
  if ( OrderSymbol() != Symbol() || OrderMagicNumber() != 总_53_in || OrderSymbol() != Symbol() || OrderMagicNumber() != 总_53_in )   continue;
  
  if ( ( OrderType() != 0 && OrderType() != 1 ) )   continue;
  总_58_do = OrderOpenPrice() * OrderLots() + 总_58_do ;
  子_180_do = 子_180_do + OrderLots() ;
  
  }
 if ( 总_71_in >  0 )
  {
  总_58_do = NormalizeDouble(总_58_do / 子_180_do,Digits()) ;
  }
 if ( 总_77_bo )
  {
  for (总_70_in=OrdersTotal() - 1 ; 总_70_in >= 0 ; 总_70_in=总_70_in - 1)
   {
   总_183_bo = OrderSelect(总_70_in,SELECT_BY_POS,MODE_TRADES) ;
   if ( OrderSymbol() != Symbol() || OrderMagicNumber() != 总_53_in )   continue;
   
   if ( OrderSymbol() == Symbol() && OrderMagicNumber() == 总_53_in && OrderType() == 0 )
    {
    总_54_do = 子_171_do * Point() + 总_58_do ;
    总_56_do = 总_54_do ;
    if ( UseStopLoss )
     {
     总_72_do = 总_58_do - 总_49_do * Point() ;
     }
    总_64_bo = true ;
    }
   if ( OrderSymbol() != Symbol() || OrderMagicNumber() != 总_53_in || OrderType() != 1 )   continue;
   总_54_do = 总_58_do - 子_171_do * Point() ;
   总_57_do = 总_54_do ;
   if ( UseStopLoss )
    {
    总_72_do = 总_49_do * Point() + 总_58_do ;
    }
   总_64_bo = true ;
   
   }
   }
 if ( 总_77_bo )
  {
  临_in_86 = 总_64_bo;
  if ( 临_in_86 == 1 )
   {
   for (总_70_in=OrdersTotal() - 1 ; 总_70_in >= 0 ; 总_70_in=总_70_in - 1)
    {
    总_183_bo = OrderSelect(总_70_in,SELECT_BY_POS,MODE_TRADES) ;
    if ( OrderSymbol() != Symbol() || OrderMagicNumber() != 总_53_in )   continue;
    
    if ( OrderSymbol() == Symbol() && OrderMagicNumber() == 总_53_in )
     {
     临_in_86 = OrderTicket();
     while (!(OrderModify(临_in_86,总_58_do,总_72_do,总_54_do,0,Yellow)))
      {
      Sleep(1000); 
      RefreshRates(); 
      临_in_86 = OrderTicket();
      }
      }
    总_77_bo = false ;
    
    }
   }}
 子_181_do = 总_5_do ;
 子_182_in = 总_6_in ;
 子_183_do = TakeProfit ;
 子_184_bo = 总_8_bo ;
 子_185_do = 总_9_do ;
 子_186_bo = UseTrailingStop ;
 子_187_do = TrailStart ;
 子_188_do = TrailStop ;
 子_189_do = PipStep ;
 子_190_do = 总_10_do ;
 if ( MM == 1 )
  {
  if ( MathCeil(AccountBalance())<200000.0 )
   {
   子_36_do = Lots ;
   }
  else
   {
   子_36_do = MathCeil(AccountBalance()) * 0.00001 ;
  }}
 else
  {
  子_36_do = Lots ;
  }
 if ( 子_186_bo )
  {
  lizong_11(子_187_do,子_188_do,总_93_do); 
  }
 if ( 总_85_bo && TimeCurrent() >= 总_102_in )
  {
  for (临_in_87 = OrdersTotal() - 1 ; 临_in_87 >= 0 ; 临_in_87=临_in_87 - 1)
   {
   总_183_bo = OrderSelect(临_in_87,SELECT_BY_POS,MODE_TRADES) ;
   if ( OrderSymbol() != Symbol() )   continue;
   
   if ( OrderSymbol() == Symbol() && OrderMagicNumber() == 总_88_in )
    {
    if ( OrderType() == 0 )
     {
     OrderClose(OrderTicket(),OrderLots(),Bid,总_87_do,Blue); 
     }
    if ( OrderType() == 1 )
     {
     OrderClose(OrderTicket(),OrderLots(),Ask,总_87_do,Red); 
    }}
   Sleep(1000); 
   
   }
  Print("Closed All due to TimeOut"); 
  }
 if ( 总_101_in != Time[0] )
  {
  总_101_in = Time[0] ;
  临_do_88 = 0.0;
  for (总_105_in=OrdersTotal() - 1 ; 总_105_in >= 0 ; 总_105_in=总_105_in - 1)
   {
   总_183_bo = OrderSelect(总_105_in,SELECT_BY_POS,MODE_TRADES) ;
   if ( OrderSymbol() != Symbol() || OrderMagicNumber() != 总_88_in || OrderSymbol() != Symbol() || OrderMagicNumber() != 总_88_in )   continue;
   
   if ( ( OrderType() != 0 && OrderType() != 1 ) )   continue;
   临_do_88 = 临_do_88 + OrderProfit();
   
   }
  子_37_do = 临_do_88 ;
  if ( 子_184_bo && 子_37_do<0.0 )
   {
   临_do_89 = 子_185_do / 100.0;
   临_in_90 = 0;
   for (临_in_91 = OrdersTotal() - 1 ; 临_in_91 >= 0 ; 临_in_91=临_in_91 - 1)
    {
    总_183_bo = OrderSelect(临_in_91,SELECT_BY_POS,MODE_TRADES) ;
    if ( OrderSymbol() != Symbol() || OrderMagicNumber() != 总_88_in || OrderSymbol() != Symbol() || OrderMagicNumber() != 总_88_in )   continue;
    
    if ( ( OrderType() != 1 && OrderType() != 0 ) )   continue;
    临_in_90=临_in_90 + 1; 
    
    }
   if ( 临_in_90 == 0 )
    {
    总_113_do = AccountEquity() ;
    }
   if ( 总_113_do<总_114_do )
    {
    总_113_do = 总_114_do ;
    }
   else
    {
    总_113_do = AccountEquity() ;
    }
   总_114_do = AccountEquity() ;
   if ( MathAbs(子_37_do)>临_do_89 * 总_113_do )
    {
    for (临_in_92 = OrdersTotal() - 1 ; 临_in_92 >= 0 ; 临_in_92=临_in_92 - 1)
     {
     总_183_bo = OrderSelect(临_in_92,SELECT_BY_POS,MODE_TRADES) ;
     if ( OrderSymbol() != Symbol() )   continue;
     
     if ( OrderSymbol() == Symbol() && OrderMagicNumber() == 总_88_in )
      {
      if ( OrderType() == 0 )
       {
       OrderClose(OrderTicket(),OrderLots(),Bid,总_87_do,Blue); 
       }
      if ( OrderType() == 1 )
       {
       OrderClose(OrderTicket(),OrderLots(),Ask,总_87_do,Red); 
      }}
     Sleep(1000); 
     
     }
    Print("Closed All due to Stop Out"); 
    总_112_bo = false ;
   }}
  临_in_93 = 0;
  for (临_in_94 = OrdersTotal() - 1 ; 临_in_94 >= 0 ; 临_in_94=临_in_94 - 1)
   {
   总_183_bo = OrderSelect(临_in_94,SELECT_BY_POS,MODE_TRADES) ;
   if ( OrderSymbol() != Symbol() || OrderMagicNumber() != 总_88_in || OrderSymbol() != Symbol() || OrderMagicNumber() != 总_88_in )   continue;
   
   if ( ( OrderType() != 1 && OrderType() != 0 ) )   continue;
   临_in_93=临_in_93 + 1; 
   
   }
  总_106_in = 临_in_93 ;
  if ( 总_106_in == 0 )
   {
   总_99_bo = false ;
   }
  for (总_105_in=OrdersTotal() - 1 ; 总_105_in >= 0 ; 总_105_in=总_105_in - 1)
   {
   总_183_bo = OrderSelect(总_105_in,SELECT_BY_POS,MODE_TRADES) ;
   if ( OrderSymbol() != Symbol() || OrderMagicNumber() != 总_88_in )   continue;
   
   if ( OrderSymbol() == Symbol() && OrderMagicNumber() == 总_88_in && OrderType() == 0 )
    {
    总_109_bo = true ;
    总_110_bo = false ;
    break;
    }
   if ( OrderSymbol() != Symbol() || OrderMagicNumber() != 总_88_in || OrderType() != 1 )   continue;
   总_109_bo = false ;
   总_110_bo = true ;
   break;
   
   }
  if ( 总_106_in >  0 && 总_106_in <= 总_82_in )
   {
   RefreshRates(); 
   临_do_95 = 0.0;
   临_in_96 = 0;
   临_in_97 = 0;
   for (临_in_98 = OrdersTotal() - 1 ; 临_in_98 >= 0 ; 临_in_98=临_in_98 - 1)
    {
    总_183_bo = OrderSelect(临_in_98,SELECT_BY_POS,MODE_TRADES) ;
    if ( OrderSymbol() != Symbol() || OrderMagicNumber() != 总_88_in || OrderSymbol() != Symbol() || OrderMagicNumber() != 总_88_in || OrderType() != 0 )   continue;
    临_in_96 = OrderTicket();
    if ( 临_in_96 <= 临_in_97 )   continue;
    临_do_95 = OrderOpenPrice();
    临_in_97 = 临_in_96;
    
    }
   总_96_do = 临_do_95 ;
   临_do_99 = 0.0;
   临_in_100 = 0;
   临_in_101 = 0;
   for (临_in_102 = OrdersTotal() - 1 ; 临_in_102 >= 0 ; 临_in_102=临_in_102 - 1)
    {
    总_183_bo = OrderSelect(临_in_102,SELECT_BY_POS,MODE_TRADES) ;
    if ( OrderSymbol() != Symbol() || OrderMagicNumber() != 总_88_in || OrderSymbol() != Symbol() || OrderMagicNumber() != 总_88_in || OrderType() != 1 )   continue;
    临_in_100 = OrderTicket();
    if ( 临_in_100 <= 临_in_101 )   continue;
    临_do_99 = OrderOpenPrice();
    临_in_101 = 临_in_100;
    
    }
   总_97_do = 临_do_99 ;
   if ( 总_109_bo && 总_96_do - Ask>=子_189_do * Point() )
    {
    总_108_bo = true ;
    }
   if ( 总_110_bo && Bid - 总_97_do>=子_189_do * Point() )
    {
    总_108_bo = true ;
   }}
  if ( 总_106_in <  1 )
   {
   总_110_bo = false ;
   总_109_bo = false ;
   总_90_do = AccountEquity() ;
   }
  if ( 总_108_bo )
   {
   临_do_103 = 0.0;
   临_in_104 = 0;
   临_in_105 = 0;
   for (临_in_106 = OrdersTotal() - 1 ; 临_in_106 >= 0 ; 临_in_106=临_in_106 - 1)
    {
    总_183_bo = OrderSelect(临_in_106,SELECT_BY_POS,MODE_TRADES) ;
    if ( OrderSymbol() != Symbol() || OrderMagicNumber() != 总_88_in || OrderSymbol() != Symbol() || OrderMagicNumber() != 总_88_in || OrderType() != 0 )   continue;
    临_in_104 = OrderTicket();
    if ( 临_in_104 <= 临_in_105 )   continue;
    临_do_103 = OrderOpenPrice();
    临_in_105 = 临_in_104;
    
    }
   总_96_do = 临_do_103 ;
   临_do_107 = 0.0;
   临_in_108 = 0;
   临_in_109 = 0;
   for (临_in_110 = OrdersTotal() - 1 ; 临_in_110 >= 0 ; 临_in_110=临_in_110 - 1)
    {
    总_183_bo = OrderSelect(临_in_110,SELECT_BY_POS,MODE_TRADES) ;
    if ( OrderSymbol() != Symbol() || OrderMagicNumber() != 总_88_in || OrderSymbol() != Symbol() || OrderMagicNumber() != 总_88_in || OrderType() != 1 )   continue;
    临_in_108 = OrderTicket();
    if ( 临_in_108 <= 临_in_109 )   continue;
    临_do_107 = OrderOpenPrice();
    临_in_109 = 临_in_108;
    
    }
   总_97_do = 临_do_107 ;
   if ( 总_110_bo && 总_3_bo )
    {
    总_103_in = 总_106_in ;
    总_104_do = NormalizeDouble(子_36_do * MathPow(子_181_do,总_106_in),子_182_in) ;
    RefreshRates(); 
    总_111_in = lizong_10(1,总_104_do,Bid,子_190_do,Ask,0,0,总_100_st,总_88_in,0,HotPink) ;
    if ( 总_111_in <  0 )
     {
     Print("Error: ",GetLastError()); 
     return;
     }
    临_do_111 = 0.0;
    临_in_112 = 0;
    临_in_113 = 0;
    for (临_in_114 = OrdersTotal() - 1 ; 临_in_114 >= 0 ; 临_in_114=临_in_114 - 1)
     {
     总_183_bo = OrderSelect(临_in_114,SELECT_BY_POS,MODE_TRADES) ;
     if ( OrderSymbol() != Symbol() || OrderMagicNumber() != 总_88_in || OrderSymbol() != Symbol() || OrderMagicNumber() != 总_88_in || OrderType() != 1 )   continue;
     临_in_112 = OrderTicket();
     if ( 临_in_112 <= 临_in_113 )   continue;
     临_do_111 = OrderOpenPrice();
     临_in_113 = 临_in_112;
     
     }
    总_97_do = 临_do_111 ;
    总_108_bo = false ;
    总_112_bo = true ;
    }
   else
    {
    if ( 总_109_bo && 总_3_bo )
     {
     总_103_in = 总_106_in ;
     总_104_do = NormalizeDouble(子_36_do * MathPow(子_181_do,总_106_in),子_182_in) ;
     总_111_in = lizong_10(0,总_104_do,Ask,子_190_do,Bid,0,0,总_100_st,总_88_in,0,Lime) ;
     if ( 总_111_in <  0 )
      {
      Print("Error: ",GetLastError()); 
      return;
      }
     临_do_115 = 0.0;
     临_in_116 = 0;
     临_in_117 = 0;
     for (临_in_118 = OrdersTotal() - 1 ; 临_in_118 >= 0 ; 临_in_118=临_in_118 - 1)
      {
      总_183_bo = OrderSelect(临_in_118,SELECT_BY_POS,MODE_TRADES) ;
      if ( OrderSymbol() != Symbol() || OrderMagicNumber() != 总_88_in || OrderSymbol() != Symbol() || OrderMagicNumber() != 总_88_in || OrderType() != 0 )   continue;
      临_in_116 = OrderTicket();
      if ( 临_in_116 <= 临_in_117 )   continue;
      临_do_115 = OrderOpenPrice();
      临_in_117 = 临_in_116;
      
      }
     总_96_do = 临_do_115 ;
     总_108_bo = false ;
     总_112_bo = true ;
  }}}}
 if ( 总_115_in != iTime(NULL,总_83_in,0) )
  {
  子_38_in = OrdersTotal() ;
  子_39_in = 0 ;
  for (子_191_in = 子_38_in ; 子_191_in >= 1 ; 子_191_in = 子_191_in - 1)
   {
   总_183_bo = OrderSelect(子_191_in - 1,SELECT_BY_POS,MODE_TRADES) ;
   if ( OrderSymbol() != Symbol() || OrderMagicNumber() != 总_88_in || OrderSymbol() != Symbol() || OrderMagicNumber() != 总_88_in )   continue;
   子_39_in = 子_39_in + 1;
   
   }
  if ( ( 子_38_in == 0 || (子_39_in <  1 && 总_3_bo) ) )
   {
   子_29_do = iClose(Symbol(),0,2) ;
   子_30_do = iClose(Symbol(),0,1) ;
   总_94_do = Bid ;
   总_95_do = Ask ;
   总_103_in = 总_106_in ;
   总_104_do = 子_36_do ;
   if ( 子_29_do>子_30_do )
    {
    if ( iRSI(NULL,60,14,0,1)>30.0 )
     {
     总_111_in = lizong_10(1,子_36_do,总_94_do,子_190_do,总_94_do,0,0,总_100_st,总_88_in,0,HotPink) ;
     if ( 总_111_in <  0 )
      {
      Print("Error: ",GetLastError()); 
      return;
      }
     临_do_119 = 0.0;
     临_in_120 = 0;
     临_in_121 = 0;
     for (临_in_122 = OrdersTotal() - 1 ; 临_in_122 >= 0 ; 临_in_122=临_in_122 - 1)
      {
      总_183_bo = OrderSelect(临_in_122,SELECT_BY_POS,MODE_TRADES) ;
      if ( OrderSymbol() != Symbol() || OrderMagicNumber() != 总_88_in || OrderSymbol() != Symbol() || OrderMagicNumber() != 总_88_in || OrderType() != 0 )   continue;
      临_in_120 = OrderTicket();
      if ( 临_in_120 <= 临_in_121 )   continue;
      临_do_119 = OrderOpenPrice();
      临_in_121 = 临_in_120;
      
      }
     总_96_do = 临_do_119 ;
     总_112_bo = true ;
    }}
   else
    {
    if ( iRSI(NULL,60,14,0,1)<70.0 )
     {
     总_111_in = lizong_10(0,总_104_do,总_95_do,子_190_do,总_95_do,0,0,总_100_st,总_88_in,0,Lime) ;
     if ( 总_111_in <  0 )
      {
      Print("Error: ",GetLastError()); 
      return;
      }
     临_do_123 = 0.0;
     临_in_124 = 0;
     临_in_125 = 0;
     for (临_in_126 = OrdersTotal() - 1 ; 临_in_126 >= 0 ; 临_in_126=临_in_126 - 1)
      {
      总_183_bo = OrderSelect(临_in_126,SELECT_BY_POS,MODE_TRADES) ;
      if ( OrderSymbol() != Symbol() || OrderMagicNumber() != 总_88_in || OrderSymbol() != Symbol() || OrderMagicNumber() != 总_88_in || OrderType() != 1 )   continue;
      临_in_124 = OrderTicket();
      if ( 临_in_124 <= 临_in_125 )   continue;
      临_do_123 = OrderOpenPrice();
      临_in_125 = 临_in_124;
      
      }
     总_97_do = 临_do_123 ;
     总_112_bo = true ;
    }}
   if ( 总_111_in >  0 )
    {
    总_102_in = TimeCurrent() + 总_86_do * 60.0 * 60.0 ;
    }
   总_108_bo = false ;
   }
  总_115_in = iTime(NULL,总_83_in,0) ;
  }
 临_in_127 = 0;
 for (临_in_128 = OrdersTotal() - 1 ; 临_in_128 >= 0 ; 临_in_128=临_in_128 - 1)
  {
  总_183_bo = OrderSelect(临_in_128,SELECT_BY_POS,MODE_TRADES) ;
  if ( OrderSymbol() != Symbol() || OrderMagicNumber() != 总_88_in || OrderSymbol() != Symbol() || OrderMagicNumber() != 总_88_in )   continue;
  
  if ( ( OrderType() != 1 && OrderType() != 0 ) )   continue;
  临_in_127=临_in_127 + 1; 
  
  }
 总_106_in = 临_in_127 ;
 总_93_do = 0.0 ;
 子_192_do = 0.0 ;
 for (总_105_in=OrdersTotal() - 1 ; 总_105_in >= 0 ; 总_105_in=总_105_in - 1)
  {
  总_183_bo = OrderSelect(总_105_in,SELECT_BY_POS,MODE_TRADES) ;
  if ( OrderSymbol() != Symbol() || OrderMagicNumber() != 总_88_in || OrderSymbol() != Symbol() || OrderMagicNumber() != 总_88_in )   continue;
  
  if ( ( OrderType() != 0 && OrderType() != 1 ) )   continue;
  总_93_do = OrderOpenPrice() * OrderLots() + 总_93_do ;
  子_192_do = 子_192_do + OrderLots() ;
  
  }
 if ( 总_106_in >  0 )
  {
  总_93_do = NormalizeDouble(总_93_do / 子_192_do,Digits()) ;
  }
 if ( 总_112_bo )
  {
  for (总_105_in=OrdersTotal() - 1 ; 总_105_in >= 0 ; 总_105_in=总_105_in - 1)
   {
   总_183_bo = OrderSelect(总_105_in,SELECT_BY_POS,MODE_TRADES) ;
   if ( OrderSymbol() != Symbol() || OrderMagicNumber() != 总_88_in )   continue;
   
   if ( OrderSymbol() == Symbol() && OrderMagicNumber() == 总_88_in && OrderType() == 0 )
    {
    总_89_do = 子_183_do * Point() + 总_93_do ;
    总_91_do = 总_89_do ;
    if ( UseStopLoss )
     {
     总_107_do = 总_93_do - 总_84_do * Point() ;
     }
    总_99_bo = true ;
    }
   if ( OrderSymbol() != Symbol() || OrderMagicNumber() != 总_88_in || OrderType() != 1 )   continue;
   总_89_do = 总_93_do - 子_183_do * Point() ;
   总_92_do = 总_89_do ;
   if ( UseStopLoss )
    {
    总_107_do = 总_84_do * Point() + 总_93_do ;
    }
   总_99_bo = true ;
   
   }
   }
 if ( 总_112_bo )
  {
  临_in_129 = 总_99_bo;
  if ( 临_in_129 == 1 )
   {
   for (总_105_in=OrdersTotal() - 1 ; 总_105_in >= 0 ; 总_105_in=总_105_in - 1)
    {
    总_183_bo = OrderSelect(总_105_in,SELECT_BY_POS,MODE_TRADES) ;
    if ( OrderSymbol() != Symbol() || OrderMagicNumber() != 总_88_in )   continue;
    
    if ( OrderSymbol() == Symbol() && OrderMagicNumber() == 总_88_in )
     {
     临_in_129 = OrderTicket();
     while (!(OrderModify(临_in_129,总_93_do,总_107_do,总_89_do,0,Yellow)))
      {
      Sleep(1000); 
      RefreshRates(); 
      临_in_129 = OrderTicket();
      }
      }
    总_112_bo = false ;
    
    }
   }}
 }
//OnTick <<==--------   --------
 void OnDeinit( const int 木_0_in)
 {
 ObjectDelete("cja"); 
 ObjectDelete("Signalprice"); 
 ObjectDelete("SIG_BARS_TF1"); 
 ObjectDelete("SIG_BARS_TF2"); 
 ObjectDelete("SIG_BARS_TF3"); 
 ObjectDelete("SIG_BARS_TF4"); 
 ObjectDelete("SIG_BARS_TF5"); 
 ObjectDelete("SIG_BARS_TF6"); 
 ObjectDelete("SIG_BARS_TF7"); 
 ObjectDelete("SSignalMACD_TEXT"); 
 ObjectDelete("SSignalMACDM1"); 
 ObjectDelete("SSignalMACDM5"); 
 ObjectDelete("SSignalMACDM15"); 
 ObjectDelete("SSignalMACDM30"); 
 ObjectDelete("SSignalMACDH1"); 
 ObjectDelete("SSignalMACDH4"); 
 ObjectDelete("SSignalMACDD1"); 
 ObjectDelete("SSignalSTR_TEXT"); 
 ObjectDelete("SignalSTRM1"); 
 ObjectDelete("SignalSTRM5"); 
 ObjectDelete("SignalSTRM15"); 
 ObjectDelete("SignalSTRM30"); 
 ObjectDelete("SignalSTRH1"); 
 ObjectDelete("SignalSTRH4"); 
 ObjectDelete("SignalSTRD1"); 
 ObjectDelete("SignalEMA_TEXT"); 
 ObjectDelete("SignalEMAM1"); 
 ObjectDelete("SignalEMAM5"); 
 ObjectDelete("SignalEMAM15"); 
 ObjectDelete("SignalEMAM30"); 
 ObjectDelete("SignalEMAH1"); 
 ObjectDelete("SignalEMAH4"); 
 ObjectDelete("SignalEMAD1"); 
 ObjectDelete("SIG_DETAIL_1"); 
 ObjectDelete("SIG_DETAIL_2"); 
 ObjectDelete("SIG_DETAIL_3"); 
 ObjectDelete("SIG_DETAIL_4"); 
 ObjectDelete("SIG_DETAIL_5"); 
 ObjectDelete("SIG_DETAIL_6"); 
 ObjectDelete("SIG_DETAIL_7"); 
 ObjectDelete("SIG_DETAIL_8"); 
 ObjectDelete("Lable"); 
 ObjectDelete("Lable1"); 
 ObjectDelete("Lable2"); 
 ObjectDelete("Lable3"); 
 }
//OnDeinit <<==--------   --------
 int lizong_6( int 木_0_in,double 木_1_do,double 木_do_2,int 木_3_in,double 木_do_4,int 木_5_in,int 木_6_in,string 木_7_st,int 木_8_in,int 木_9_in,uint 木_10_ui)
 {
  int       子_2_in;
  int       子_3_in;
  int       子_4_in;
  int       子_5_in;
//----- -----
 datetime   临_da_1;
 double     临_do_2;
 double     临_do_3;
 datetime   临_da_4;
 double     临_do_5;
 double     临_do_6;

 子_5_in = 100 ;
 switch(木_0_in)
  {
  case 0 :
  子_4_in = 0 ;
  if ( 子_5_in <= 0 )   break;
  
  for ( ; 子_4_in < 子_5_in ; 子_4_in = 子_4_in + 1)
   {
   RefreshRates(); 
   临_da_1 = 木_9_in;
   if ( 木_6_in == 0 )
    {
    临_do_2 = 0.0;
    }
   else
    {
    临_do_2 = 木_6_in * Point() + Ask;
    }
   if ( 木_5_in == 0 )
    {
    临_do_3 = 0.0;
    }
   else
    {
    临_do_3 = Bid - 木_5_in * Point();
    }
   子_2_in = OrderSend(Symbol(),OP_BUY,木_1_do,Ask,木_3_in,临_do_3,临_do_2,木_7_st,木_8_in,临_da_1,木_10_ui) ;
   子_3_in = GetLastError() ;
   if ( 子_3_in == 0 || !((子_3_in==4 || 子_3_in==137 || 子_3_in==146 || 子_3_in==136)) )   break;
   Sleep(5000); 
   }
     break;
  case 1 :
  for (子_4_in = 0 ; 子_4_in < 子_5_in ; 子_4_in = 子_4_in + 1)
   {
   临_da_4 = 木_9_in;
   if ( 木_6_in == 0 )
    {
    临_do_5 = 0.0;
    }
   else
    {
    临_do_5 = Bid - 木_6_in * Point();
    }
   if ( 木_5_in == 0 )
    {
    临_do_6 = 0.0;
    }
   else
    {
    临_do_6 = 木_5_in * Point() + Ask;
    }
   子_2_in = OrderSend(Symbol(),OP_SELL,木_1_do,Bid,木_3_in,临_do_6,临_do_5,木_7_st,木_8_in,临_da_4,木_10_ui) ;
   子_3_in = GetLastError() ;
   if ( 子_3_in == 0 || !((子_3_in==4 || 子_3_in==137 || 子_3_in==146 || 子_3_in==136)) )   break;
   Sleep(5000); 
   }
   }
 return(子_2_in); 
 }
//lizong_6 <<==--------   --------
 void lizong_7( int 木_0_in,int 木_1_in,double 木_2_do)
 {
  int       子_1_in;
  double    子_2_do;
  double    子_3_do;
  int       子_4_in;
  bool      子_5_bo;
  bool      子_6_bo;
//----- -----

 if ( 木_1_in == 0 )   return;
 for (子_4_in = OrdersTotal() - 1 ; 子_4_in >= 0 ; 子_4_in = 子_4_in - 1)
  {
  if ( !(OrderSelect(子_4_in,SELECT_BY_POS,MODE_TRADES)) || OrderSymbol() != Symbol() || OrderMagicNumber() != 总_17_in )   continue;
  
  if ( ( OrderSymbol() == Symbol() || OrderMagicNumber() == 总_17_in ) )
   {
   if ( OrderType() == 0 )
    {
    子_1_in = NormalizeDouble((Bid - 木_2_do) / Point(),0) ;
    if ( 子_1_in < 木_0_in )   continue;
    子_2_do = OrderStopLoss() ;
    子_3_do = Bid - 木_1_in * Point() ;
    if ( ( 子_2_do==0.0 || (子_2_do!=0.0 && 子_3_do>子_2_do) ) )
     {
     子_5_bo = OrderModify(OrderTicket(),木_2_do,子_3_do,OrderTakeProfit(),0,Aqua) ;
    }}
   if ( OrderType() == 1 )
    {
    子_1_in = NormalizeDouble((木_2_do - Ask) / Point(),0) ;
    if ( 子_1_in < 木_0_in )   continue;
    子_2_do = OrderStopLoss() ;
    子_3_do = 木_1_in * Point() + Ask ;
    if ( ( 子_2_do==0.0 || (子_2_do!=0.0 && 子_3_do<子_2_do) ) )
     {
     子_6_bo = OrderModify(OrderTicket(),木_2_do,子_3_do,OrderTakeProfit(),0,Red) ;
   }}}
  Sleep(1000); 
  
  }
 }
//lizong_7 <<==--------   --------
 int lizong_8( int 木_0_in,double 木_1_do,double 木_do_2,int 木_3_in,double 木_do_4,int 木_5_in,int 木_6_in,string 木_7_st,int 木_8_in,int 木_9_in,uint 木_10_ui)
 {
  int       子_2_in;
  int       子_3_in;
  int       子_4_in;
  int       子_5_in;
//----- -----
 datetime   临_da_1;
 double     临_do_2;
 double     临_do_3;
 datetime   临_da_4;
 double     临_do_5;
 double     临_do_6;

 子_5_in = 100 ;
 switch(木_0_in)
  {
  case 0 :
  子_4_in = 0 ;
  if ( 子_5_in <= 0 )   break;
  
  for ( ; 子_4_in < 子_5_in ; 子_4_in = 子_4_in + 1)
   {
   RefreshRates(); 
   临_da_1 = 木_9_in;
   if ( 木_6_in == 0 )
    {
    临_do_2 = 0.0;
    }
   else
    {
    临_do_2 = 木_6_in * Point() + Ask;
    }
   if ( 木_5_in == 0 )
    {
    临_do_3 = 0.0;
    }
   else
    {
    临_do_3 = Bid - 木_5_in * Point();
    }
   子_2_in = OrderSend(Symbol(),OP_BUY,木_1_do,Ask,木_3_in,临_do_3,临_do_2,木_7_st,木_8_in,临_da_1,木_10_ui) ;
   子_3_in = GetLastError() ;
   if ( 子_3_in == 0 || !((子_3_in==4 || 子_3_in==137 || 子_3_in==146 || 子_3_in==136)) )   break;
   Sleep(5000); 
   }
     break;
  case 1 :
  for (子_4_in = 0 ; 子_4_in < 子_5_in ; 子_4_in = 子_4_in + 1)
   {
   临_da_4 = 木_9_in;
   if ( 木_6_in == 0 )
    {
    临_do_5 = 0.0;
    }
   else
    {
    临_do_5 = Bid - 木_6_in * Point();
    }
   if ( 木_5_in == 0 )
    {
    临_do_6 = 0.0;
    }
   else
    {
    临_do_6 = 木_5_in * Point() + Ask;
    }
   子_2_in = OrderSend(Symbol(),OP_SELL,木_1_do,Bid,木_3_in,临_do_6,临_do_5,木_7_st,木_8_in,临_da_4,木_10_ui) ;
   子_3_in = GetLastError() ;
   if ( 子_3_in == 0 || !((子_3_in==4 || 子_3_in==137 || 子_3_in==146 || 子_3_in==136)) )   break;
   Sleep(5000); 
   }
   }
 return(子_2_in); 
 }
//lizong_8 <<==--------   --------
 void lizong_9( int 木_0_in,int 木_1_in,double 木_2_do)
 {
  int       子_1_in;
  double    子_2_do;
  double    子_3_do;
  int       子_4_in;
  bool      子_5_bo;
  bool      子_6_bo;
//----- -----

 if ( 木_1_in == 0 )   return;
 for (子_4_in = OrdersTotal() - 1 ; 子_4_in >= 0 ; 子_4_in = 子_4_in - 1)
  {
  if ( !(OrderSelect(子_4_in,SELECT_BY_POS,MODE_TRADES)) || OrderSymbol() != Symbol() || OrderMagicNumber() != 总_53_in )   continue;
  
  if ( ( OrderSymbol() == Symbol() || OrderMagicNumber() == 总_53_in ) )
   {
   if ( OrderType() == 0 )
    {
    子_1_in = NormalizeDouble((Bid - 木_2_do) / Point(),0) ;
    if ( 子_1_in < 木_0_in )   continue;
    子_2_do = OrderStopLoss() ;
    子_3_do = Bid - 木_1_in * Point() ;
    if ( ( 子_2_do==0.0 || (子_2_do!=0.0 && 子_3_do>子_2_do) ) )
     {
     子_5_bo = OrderModify(OrderTicket(),木_2_do,子_3_do,OrderTakeProfit(),0,Aqua) ;
    }}
   if ( OrderType() == 1 )
    {
    子_1_in = NormalizeDouble((木_2_do - Ask) / Point(),0) ;
    if ( 子_1_in < 木_0_in )   continue;
    子_2_do = OrderStopLoss() ;
    子_3_do = 木_1_in * Point() + Ask ;
    if ( ( 子_2_do==0.0 || (子_2_do!=0.0 && 子_3_do<子_2_do) ) )
     {
     子_6_bo = OrderModify(OrderTicket(),木_2_do,子_3_do,OrderTakeProfit(),0,Red) ;
   }}}
  Sleep(1000); 
  
  }
 }
//lizong_9 <<==--------   --------
 int lizong_10( int 木_0_in,double 木_1_do,double 木_do_2,int 木_3_in,double 木_do_4,int 木_5_in,int 木_6_in,string 木_7_st,int 木_8_in,int 木_9_in,uint 木_10_ui)
 {
  int       子_2_in;
  int       子_3_in;
  int       子_4_in;
  int       子_5_in;
//----- -----
 datetime   临_da_1;
 double     临_do_2;
 double     临_do_3;
 datetime   临_da_4;
 double     临_do_5;
 double     临_do_6;

 子_5_in = 100 ;
 switch(木_0_in)
  {
  case 0 :
  子_4_in = 0 ;
  if ( 子_5_in <= 0 )   break;
  
  for ( ; 子_4_in < 子_5_in ; 子_4_in = 子_4_in + 1)
   {
   RefreshRates(); 
   临_da_1 = 木_9_in;
   if ( 木_6_in == 0 )
    {
    临_do_2 = 0.0;
    }
   else
    {
    临_do_2 = 木_6_in * Point() + Ask;
    }
   if ( 木_5_in == 0 )
    {
    临_do_3 = 0.0;
    }
   else
    {
    临_do_3 = Bid - 木_5_in * Point();
    }
   子_2_in = OrderSend(Symbol(),OP_BUY,木_1_do,Ask,木_3_in,临_do_3,临_do_2,木_7_st,木_8_in,临_da_1,木_10_ui) ;
   子_3_in = GetLastError() ;
   if ( 子_3_in == 0 || !((子_3_in==4 || 子_3_in==137 || 子_3_in==146 || 子_3_in==136)) )   break;
   Sleep(5000); 
   }
     break;
  case 1 :
  for (子_4_in = 0 ; 子_4_in < 子_5_in ; 子_4_in = 子_4_in + 1)
   {
   临_da_4 = 木_9_in;
   if ( 木_6_in == 0 )
    {
    临_do_5 = 0.0;
    }
   else
    {
    临_do_5 = Bid - 木_6_in * Point();
    }
   if ( 木_5_in == 0 )
    {
    临_do_6 = 0.0;
    }
   else
    {
    临_do_6 = 木_5_in * Point() + Ask;
    }
   子_2_in = OrderSend(Symbol(),OP_SELL,木_1_do,Bid,木_3_in,临_do_6,临_do_5,木_7_st,木_8_in,临_da_4,木_10_ui) ;
   子_3_in = GetLastError() ;
   if ( 子_3_in == 0 || !((子_3_in==4 || 子_3_in==137 || 子_3_in==146 || 子_3_in==136)) )   break;
   Sleep(5000); 
   }
   }
 return(子_2_in); 
 }
//lizong_10 <<==--------   --------
 void lizong_11( int 木_0_in,int 木_1_in,double 木_2_do)
 {
  int       子_1_in;
  double    子_2_do;
  double    子_3_do;
  int       子_4_in;
  bool      子_5_bo;
  bool      子_6_bo;
//----- -----

 if ( 木_1_in == 0 )   return;
 for (子_4_in = OrdersTotal() - 1 ; 子_4_in >= 0 ; 子_4_in = 子_4_in - 1)
  {
  if ( !(OrderSelect(子_4_in,SELECT_BY_POS,MODE_TRADES)) || OrderSymbol() != Symbol() || OrderMagicNumber() != 总_88_in )   continue;
  
  if ( ( OrderSymbol() == Symbol() || OrderMagicNumber() == 总_88_in ) )
   {
   if ( OrderType() == 0 )
    {
    子_1_in = NormalizeDouble((Bid - 木_2_do) / Point(),0) ;
    if ( 子_1_in < 木_0_in )   continue;
    子_2_do = OrderStopLoss() ;
    子_3_do = Bid - 木_1_in * Point() ;
    if ( ( 子_2_do==0.0 || (子_2_do!=0.0 && 子_3_do>子_2_do) ) )
     {
     子_5_bo = OrderModify(OrderTicket(),木_2_do,子_3_do,OrderTakeProfit(),0,Aqua) ;
    }}
   if ( OrderType() == 1 )
    {
    子_1_in = NormalizeDouble((木_2_do - Ask) / Point(),0) ;
    if ( 子_1_in < 木_0_in )   continue;
    子_2_do = OrderStopLoss() ;
    子_3_do = 木_1_in * Point() + Ask ;
    if ( ( 子_2_do==0.0 || (子_2_do!=0.0 && 子_3_do<子_2_do) ) )
     {
     子_6_bo = OrderModify(OrderTicket(),木_2_do,子_3_do,OrderTakeProfit(),0,Red) ;
   }}}
  Sleep(1000); 
  
  }
 }
//<<==lizong_11 <<==

