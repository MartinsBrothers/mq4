#property copyright "Copyright © 2021,NNoby"
#property link      "https://t.me/mo_elnoby"
#property description "Forex Cybory Darwinex" 
#property description "It is a high-quality night scalp EA"
#property description "PAIR:AUDCAD, EURCAD, EURGBP, EURAUD, EURUSD, GBPUSD, USDCHF,AUDCHF, AUDUSD, CADCHF, EURCHF, GBPAUD, GBPCAD, USDCAD"
#property description "TF: M15"
#property strict

 enum _DST {
      None = 0,
      US = 1,
      Europe = 2,
          };
 enum _MoneyManagement {
      MM_OFF = 0,//Fixed lot
      MM_SL = 1,//Risk per Trade
      MM_Depo = 2,//Percent of Balance
          };
 enum _PresetType {
      ST_Normal = 0,//Normal
      ST_Conservative = 1,//Conservative
          };
extern string GENERAL_SETTINGS="GENERAL SETTINGS"  ;  
extern string Comment="Forex Cyborg vDarwinex"  ;   //Comment
extern long  LicenceKey=22222222  ;    //License key
extern int   MagicNumber=1604  ;    //Magic Number
extern string Seperator0="-------------------------"  ;   //-------------------
extern string Info0="\'GMT Offset\' and \'DST\' will only be used, during backtests and if \'GMT Auto calculation\' is not set"  ;   //Information
extern bool GMT_autocalc=true  ;    //GMT Auto calculation
extern int   GMT_offset=0  ;    //GMT Offset
extern  _DST  DST=0  ;   
extern string Seperator2="-------------------------"  ;   //-------------------
extern string MM_SETTINGS="MONEY MANAGEMENT SETTINGS"  ;  
extern  _MoneyManagement  MoneyManagement=1  ;    //MM Type
extern double Auto_Risk=3.5  ;    //MM Size
extern string Seperator3="-------------------------"  ;   //-------------------
extern string RISK_CONTROL="RISK CONTROL SETTINGS"  ;  
extern bool MinimizeRiskCorrelation=true  ;   
extern int   MaxCorrelatedTradesPerCurrency=2  ;   
extern string SymbolPrefix=""  ;  
extern string Seperator1="-------------------------"  ;   //-------------------
extern string Info2="Presets available for the following pairs "  ;   //Information
extern string Info3="in the BASIC-version: "  ;   //Information
extern string Info4="AUDCAD, EURCAD, EURGBP, EURAUD, EURUSD, GBPUSD, USDCHF "  ;   //Information
extern string Info5="in the STANDARD + GOLD-version additionally: "  ;   //Information
extern string Info51="AUDCHF, AUDUSD, CADCHF, EURCHF, GBPAUD, GBPCAD, USDCAD "  ;   //Information
extern string ADDITIONAL_SETTINGS="ADDITIONAL SETTINGS"  ;  
extern  _PresetType  PresetType=0  ;    //Preset Type
extern bool StopTradingOnFridayClosing=false ;   
extern bool StopTradingOnMondayOpening=false ;   

 double    总_do_1 = 0.0;
 bool      总_bo_2 = true;
 int       总_in_3 = 1800;
 int       总_in_4 = 300;
 bool      总_bo_5 = false;
 int       总_in_6 = 2140;
 int       总_in_7 = 2220;
 bool      总_bo_8 = false;
 int       总_in_9 = 700;
 int       总_in_10 = 2;
 int       总_in_11 = 2000;
 int       总_in_12 = 2300;
 int       总_in_13 = 60;
 int       总_in_14 = 120;
 double    总_do_15 = 5.0;
 int       总_in_16 = 15;
 int       总_in_17 = 22;
 int       总_in_18 = 5;
 int       总_in_19 = 100;
 int       总_in_20 = 130;
 int       总_in_21 = 16;
 double    总_do_22 = 2.0;
 double    总_do_23 = 0.0;
 double    总_do_24 = 22.0;
 bool      总_bo_25 = true;
 int       总_in_26 = 250;
 int       总_in_27 = -250;
 bool      总_bo_28 = true;
 bool      总_bo_29 = true;
 int       总_in_30 = 120;
 bool      总_bo_31 = true;
 double    总_do_32 = 0.0;
 double    总_do_33 = 0.0;
 bool      总_bo_34 = true;
 int       总_in_35 = 10;
 double    总_do_36 = 100.0;
 double    总_do_37 = -10.0;
 double    总_do_38 = 0.0;
 int       总_in_39 = 5;
 int       总_in_40 = 0;
 int       总_in_41 = 0;
 int       总_in_42 = 0;
 int       总_in_43 = 0;
 int       总_in_44 = 0;
 double    总_do_45 = 5.0;
 int       总_in_46 = 15;
 int       总_in_47 = 22;
 int       总_in_48 = 5;
 int       总_in_49 = 100;
 int       总_in_50 = 130;
 int       总_in_51 = 16;
 double    总_do_52 = 2.0;
 double    总_do_53 = 0.0;
 double    总_do_54 = 22.0;
 bool      总_bo_55 = true;
 int       总_in_56 = 250;
 int       总_in_57 = -250;
 bool      总_bo_58 = true;
 bool      总_bo_59 = true;
 int       总_in_60 = 120;
 bool      总_bo_61 = true;
 double    总_do_62 = 0.0;
 double    总_do_63 = 0.0;
 bool      总_bo_64 = true;
 int       总_in_65 = 10;
 double    总_do_66 = 100.0;
 double    总_do_67 = -10.0;
 double    总_do_68 = 0.0;
 int       总_in_69 = 5;
 int       总_in_70 = 0;
 int       总_in_71 = 0;
 int       总_in_72 = 0;
 int       总_in_73 = 0;
 int       总_in_74 = 0;
 int       总_in_75 = 0;
 int       总_in_76 = 0;
 string    总_st_77;
 string    总_st_78;
 string    总_st_79;
 string    总_st_80;
 string    总_st_81;
 string    总_st_82;
 string    总_st_83;
 string    总_st_84;
 double    总_do_85 = 0.0;
 double    总_do_86 = 0.0;
 bool      总_bo_87 = false;
 bool      总_bo_88 = true;
 double    总_do_89 = 0.0;
 double    总_do_90 = 0.01;
 double    总_do_91 = 0.01;
 double    总_do_92 = 0.01;
 int       总_in_93 = 0;
 string    总_st_94 = "";
 string    总_st_95 = "";
 string    总_st_96 = "";
 string    总_st_97 = "";
 long      总_lo_98 = 0;
 long      总_lo_99 = 0;
 long      总_lo_100 = 0;
 long      总_lo_101 = 0;
 bool      总_bo_102 = true;
 bool      总_bo_103 = false;
 bool      总_bo_104 = false;
 bool      总_bo_105 = false;
 long      总_lo_106 = D'2097.04.01';
 bool      总_bo_107 = true;
 int       总_in_108 = 35060;
 int       总_in_109 = 57019;
 int       总_in_110 = 2889024;
 bool      总_bo_111 = true;
 int       总_in_112 = 0;
 bool      总_bo_113 = false;
 bool      总_bo_114 = false;
 int       总_in_115 = 0;
 long      总_lo_116 = 0;
 long      总_lo_117 = 0;
 long      总_lo_118 = 0;
 double    总_do_119 = 0.0;
 double    总_do_120 = 0.0;
 double    总_do_121 = 0.0;
 double    总_do_122 = 0.0;
 double    总_do_123 = 0.0;
 double    总_do_124 = 0.0;
 double    总_do_125 = 0.0;
 double    总_do_126 = 0.0;
 double    总_do_127 = 0.0;
 double    总_do_128 = 0.0;
 string    总_st_129 = "";
 long      总_lo_130 = TimeCurrent();


//----------------------------

 void OnInit ()
 {

//----------------------------

 lizong_17(); 
 lizong_10(); 
  总_in_115= 1;
 if ( 总_bo_88 && ( Digits() == 3 || Digits() == 5 ) )
  {
   总_in_115= 10;
  }
 if ( Digits() == 5 )
  {
  总_do_89 = 0.0001 ;
  }
 if ( Digits() == 4 )
  {
  总_do_89 = 0.001 ;
  }
 if ( Digits() == 3 )
  {
  总_do_89 = 0.01 ;
  }
 if ( Digits() == 2 )
  {
  总_do_89 = 0.1 ;
  }
 ChartSetInteger(0,1,0,0); 
 ObjectCreate(0,"rect",OBJ_RECTANGLE_LABEL,0,0,0.0); 
 ObjectSetInteger(0,"rect",OBJPROP_XDISTANCE,3); 
 ObjectSetInteger(0,"rect",OBJPROP_YDISTANCE,25); 
 ObjectSetInteger(0,"rect",OBJPROP_BACK,0); 
 ObjectSetInteger(0,"rect",OBJPROP_XSIZE,200); 
 ObjectSetInteger(0,"rect",OBJPROP_YSIZE,450); 
 ObjectSetInteger(0,"rect",OBJPROP_BGCOLOR,ChartGetInteger(0,21,0)); 
 lizong_16(); 
 lizong_6(LicenceKey);
 } 
//OnInit
//---------------------  ----------------------------------------

 void OnTick ()
 {

//----------------------------
 bool       临_bo_1;
 bool       临_bo_2;
 double     临_do_8;
 double     临_do_9;
 string     临_st_10;
 int        临_in_11;
 int        临_in_12;
 int        临_in_13;
 int        临_in_15;
 bool       临_bo_18;
 double     临_do_20;
 double     临_do_21;
 string     临_st_22;
 int        临_in_23;
 int        临_in_24;
 int        临_in_25;
 int        临_in_27;
 bool       临_bo_30;
 bool       临_bo_32;
 bool       临_bo_34;
 string     临_st_35;
 double     临_do_39;
 double     临_do_41;
 double     临_do_42;
 string     临_st_43;
 int        临_in_44;
 int        临_in_45;
 int        临_in_46;
 int        临_in_48;
 bool       临_bo_51;
 bool       临_bo_53;
 bool       临_bo_54;
 string     临_st_55;
 double     临_do_57;
 double     临_do_59;
 if ( IsTradeAllowed() )
  {
  临_bo_1 = true;
  if ( IsTesting() )
   {
   临_bo_2 = true;
   }
  else
   {
   if ( 总_in_112 == 1 && !(总_bo_113) )
    {
    临_bo_1 = false;
    }
   if ( 总_in_112 == 2 && !(总_bo_114) )
    {
    临_bo_1 = false;
    }
   if ( !(总_bo_111) )
    {
    临_bo_1 = false;
    if ( !(总_bo_107) )
     {
     PrintFormat("Wrong licence key."); 
     Alert("Wrong licence key."); 
     }
    总_bo_107 = true ;
    }
   if ( 总_bo_103 )
    {
    if ( 总_bo_104 && TimeGMT() > 总_lo_106 )
     {
     临_bo_1 = false;
     if ( !(总_bo_107) )
      {
      PrintFormat("Forex Cyborg has expired. Please contact the support."); 
      Alert("Forex Cyborg has expired. Please contact the support."); 
      }
     总_bo_107 = true ;
     }
    if ( 总_in_108 > 0 && 总_in_108  !=  AccountNumber() && 总_in_109  !=  AccountNumber() && 总_in_110  !=  AccountNumber() )
     {
     临_bo_1 = false;
     if ( !(总_bo_107) )
      {
      PrintFormat("Wrong account-no. Please contact the support."); 
      Alert("Wrong account-no. Please contact the support."); 
      }
     总_bo_107 = true ;
     }
    if ( 总_bo_105 && !(IsDemo()) )
     {
     临_bo_1 = false;
     if ( !(总_bo_107) )
      {
      PrintFormat("This version can only be used at a demo account."); 
      Alert("This version can only be used at a demo account."); 
      }
     总_bo_107 = true ;
    }}
   临_bo_2 = 临_bo_1;
   }
  if ( 临_bo_2 )
   {
   总_lo_118 = TimeCurrent() ;
   if ( 总_st_80 == "00:00" )
    {
    总_lo_98 = StringToTime(TimeToString(TimeCurrent(),TIME_DATE) + " " + 总_st_77) ;
    总_lo_99 = StringToTime(TimeToString(TimeCurrent(),TIME_DATE) + " " + 总_st_78) ;
    }
   else
    {
    总_lo_98 = StringToTime(总_st_77) ;
    总_lo_99 = StringToTime(总_st_78) ;
    }
   总_lo_100 = StringToTime(TimeToString(总_lo_118,TIME_DATE) + " " + 总_st_79) ;
   总_lo_101 = StringToTime(TimeToString(总_lo_118,TIME_DATE) + " " + 总_st_80) ;
   lizong_16(); 
   临_do_8 = -1.0;
   临_do_9 = -1.0;
   临_st_10 = "NULL";
   临_in_11 = -1;
   临_in_12 = -1;
   临_in_13 = MagicNumber;
    临_bo_18 = false;
   for (临_in_15 = OrdersTotal() - 1 ; 临_in_15 >= 0 ; 临_in_15=临_in_15 - 1)
    {
    if ( !(OrderSelect(临_in_15,SELECT_BY_POS,MODE_TRADES)) )
     break;
    if ( ( OrderType() == 临_in_12 || 临_in_12 == -1 ) && ( OrderMagicNumber() == 临_in_13 || 临_in_13 == -1 ) && ( OrderSymbol() == 临_st_10 || (临_st_10 == "NULL" && OrderSymbol() == Symbol()) ) && ( OrderOpenTime() >= 临_in_11 || 临_in_11 == -1 ) && ( OrderLots()==临_do_8 || 临_do_8==-1.0 ) && ( NormalizeDouble(OrderOpenPrice(),Digits())==NormalizeDouble(临_do_9,Digits()) || 临_do_9==-1.0 ) )
     {
     临_bo_18 = true;
     break;
     }
    }
   
   if ( 临_bo_18 )
    {
    lizong_11(); 
    if ( lizong_14() )
     {
     lizong_13(MagicNumber,总_in_10,0); 
     }
    if ( lizong_15() )
     {
     lizong_13(MagicNumber,总_in_10,1); 
    }}
   临_do_20 = -1.0;
   临_do_21 = -1.0;
   临_st_22 = "NULL";
   临_in_23 = -1;
   if ( 总_bo_87 )
    {
    临_in_24 = -1;
    }
   else
    {
    临_in_24 = 0;
    }
   临_in_24 = 临_in_24;
   临_in_25 = MagicNumber;
    临_bo_30 = false;
   for (临_in_27 = OrdersTotal() - 1 ; 临_in_27 >= 0 ; 临_in_27=临_in_27 - 1)
    {
    if ( !(OrderSelect(临_in_27,SELECT_BY_POS,MODE_TRADES)) )
     break;
    if ( ( OrderType() == 临_in_24 || 临_in_24 == -1 ) && ( OrderMagicNumber() == 临_in_25 || 临_in_25 == -1 ) && ( OrderSymbol() == 临_st_22 || (临_st_22 == "NULL" && OrderSymbol() == Symbol()) ) && ( OrderOpenTime() >= 临_in_23 || 临_in_23 == -1 ) && ( OrderLots()==临_do_20 || 临_do_20==-1.0 ) && ( NormalizeDouble(OrderOpenPrice(),Digits())==NormalizeDouble(临_do_21,Digits()) || 临_do_21==-1.0 ) )
     {
     临_bo_30 = true;
     break;
     }
    }
  
   if ( !(临_bo_30) && lizong_8(0,MagicNumber) )
    {
    lizong_11(); 
    if ( ( ( TimeCurrent() > 总_lo_98 && TimeCurrent() < 总_lo_99 ) || (TimeCurrent() > 总_lo_100 && TimeCurrent() <  总_lo_101) ) )
     {
     if ( lizong_7() )
      {
      临_bo_32 = true;
      }
     else
      {
      临_bo_32 = false;
     }}
    else
     {
     临_bo_32 = false;
     }
    if ( 临_bo_32 == true && 总_do_128<=总_in_50 && 总_do_127>=总_do_54 && Ask<=总_do_122 && 总_do_121< -(总_in_49) && 总_do_120<=总_do_45 )
     {
     临_bo_34 = true;
     }
    else
     {
     临_bo_34 = false;
     }
    if ( 临_bo_34 && 总_lo_116  !=  iTime(Symbol(),Period(),0) )
     {
     总_lo_116 = iTime(Symbol(),Period(),0) ;
     临_st_35 = "NONE";
     总_do_92 = MarketInfo(Symbol(),23) ;
     总_do_90 = MarketInfo(Symbol(),25) ;
     总_in_93 = MarketInfo(Symbol(),15) ;
     总_do_91 = MarketInfo(Symbol(),24) ;
     if ( MoneyManagement == 0 )
      {
      总_do_1 = Auto_Risk ;
      }
     if ( MoneyManagement == 1 )
      {
      临_do_39 = MathFloor(AccountBalance() * Auto_Risk / 100.0 / MarketInfo(Symbol(),16) / (总_in_43 * 总_do_89 / Point()) / 总_do_91) * 总_do_91;
      if ( 总_do_90 >= MathFloor(AccountBalance() * Auto_Risk / 100.0 / MarketInfo(Symbol(),16) / (总_in_43 * 总_do_89 / Point()) / 总_do_91) * 总_do_91 )
       {
       临_do_39 = 临_do_39;
       }
      else
       {
       临_do_39 = 总_do_90;
       }
      总_do_1 = MathMax(总_do_92,临_do_39) ;
      }
     if ( MoneyManagement == 2 )
      {
      if ( Auto_Risk <= 100 )
       {
       临_do_39 = Auto_Risk;
       }
      else
       {
       临_do_39 = 100.0;
       }
      临_do_41 = MathCeil(临_do_39 / 100.0 * AccountBalance() / 总_do_91 / (总_in_93 / 100)) * 总_do_91;
      if ( 总_do_90 >= MathCeil(临_do_39 / 100.0 * AccountBalance() / 总_do_91 / (总_in_93 / 100)) * 总_do_91 )
       {
       临_do_41 = 临_do_41;
       }
      else
       {
       临_do_41 = 总_do_90;
       }
      总_do_1 = MathMax(总_do_92,临_do_41) ;
      }
     lizong_12(0,总_do_1,0.0,临_st_35,0); 
    }}
   临_do_41 = -1.0;
   临_do_42 = -1.0;
   临_st_43 = "NULL";
   临_in_44 = -1;
   if ( 总_bo_87 )
    {
    临_in_45 = -1;
    }
   else
    {
    临_in_45 = 1;
    }
   临_in_45 = 临_in_45;
   临_in_46 = MagicNumber;临_bo_51 = false;
   for (临_in_48 = OrdersTotal() - 1 ; 临_in_48 >= 0 ; 临_in_48=临_in_48 - 1)
    {
    if ( !(OrderSelect(临_in_48,SELECT_BY_POS,MODE_TRADES)) )
     break;
    if ( ( OrderType() == 临_in_45 || 临_in_45 == -1 ) && ( OrderMagicNumber() == 临_in_46 || 临_in_46 == -1 ) && ( OrderSymbol() == 临_st_43 || (临_st_43 == "NULL" && OrderSymbol() == Symbol()) ) && ( OrderOpenTime() >= 临_in_44 || 临_in_44 == -1 ) && ( OrderLots()==临_do_41 || 临_do_41==-1.0 ) && ( NormalizeDouble(OrderOpenPrice(),Digits())==NormalizeDouble(临_do_42,Digits()) || 临_do_42==-1.0 ) )
     {
     临_bo_51 = true;
     break;
     }
    }
   
   if (!(!(临_bo_51)) )  return;
   if (!(lizong_8(1,MagicNumber)) )  return;
   lizong_11(); 
   if ( ( ( TimeCurrent() > 总_lo_98 && TimeCurrent() < 总_lo_99 ) || (TimeCurrent() > 总_lo_100 && TimeCurrent() <  总_lo_101) ) )
    {
    if ( lizong_7() )
     {
     临_bo_53 = true;
     }
    else
     {
     临_bo_53 = false;
    }}
   else
    {
    临_bo_53 = false;
    }
   if ( 临_bo_53 == true && 总_do_128<=总_in_50 && 总_do_127>=总_do_54 && Bid>=总_do_123 && 总_do_121>总_in_49 && 总_do_120<=总_do_45 * 2.0 )
    {
    临_bo_54 = true;
    }
   else
    {
    临_bo_54 = false;
    }
   if (!(临_bo_54) )  return;
   if (!(总_lo_117  !=  iTime(Symbol(),Period(),0)) )  return;
   总_lo_117 = iTime(Symbol(),Period(),0) ;
   临_st_55 = "NONE";
   总_do_92 = MarketInfo(Symbol(),23) ;
   总_do_90 = MarketInfo(Symbol(),25) ;
   总_in_93 = MarketInfo(Symbol(),15) ;
   总_do_91 = MarketInfo(Symbol(),24) ;
   if ( MoneyManagement == 0 )
    {
    总_do_1 = Auto_Risk ;
    }
   if ( MoneyManagement == 1 )
    {
    临_do_57 = MathFloor(AccountBalance() * Auto_Risk / 100.0 / MarketInfo(Symbol(),16) / (总_in_43 * 总_do_89 / Point()) / 总_do_91) * 总_do_91;
    if ( 总_do_90 >= MathFloor(AccountBalance() * Auto_Risk / 100.0 / MarketInfo(Symbol(),16) / (总_in_43 * 总_do_89 / Point()) / 总_do_91) * 总_do_91 )
     {
     临_do_57 = 临_do_57;
     }
    else
     {
     临_do_57 = 总_do_90;
     }
    总_do_1 = MathMax(总_do_92,临_do_57) ;
    }
   if ( MoneyManagement == 2 )
    {
    if ( Auto_Risk <= 100 )
     {
     临_do_57 = Auto_Risk;
     }
    else
     {
     临_do_57 = 100.0;
     }
    临_do_59 = MathCeil(临_do_57 / 100.0 * AccountBalance() / 总_do_91 / (总_in_93 / 100)) * 总_do_91;
    if ( 总_do_90 >= MathCeil(临_do_57 / 100.0 * AccountBalance() / 总_do_91 / (总_in_93 / 100)) * 总_do_91 )
     {
     临_do_59 = 临_do_59;
     }
    else
     {
     临_do_59 = 总_do_90;
     }
    总_do_1 = MathMax(总_do_92,临_do_59) ;
    }
   lizong_12(1,总_do_1,0.0,临_st_55,0); 
   return;
  }}
 lizong_16(); 
 }
//OnTick
//---------------------  ----------------------------------------

 void OnDeinit (const int 木_0)
 {

//----------------------------


 ObjectDelete(0,"rect"); 
 Comment(""); 
 }
//OnDeinit
//---------------------  ----------------------------------------


//----------------------------


//----------------------------

 void lizong_6 (long 木_0)
 {
 string      子_st_1;

//----------------------------
 bool       临_bo_6;
 bool       临_bo_7;

 总_bo_111 = false ;
 if (总_bo_102 )//木_0 > 1 && 总_bo_102 )
  {
  //子_st_1 = IntegerToString((木_0 + 124321) / 2) ;
 // if ( AccountNumber() == StringToInteger(StringSubstr(子_st_1,0,1) + StringSubstr(子_st_1,2,2) + StringSubstr(子_st_1,5)) )

 
   {
   总_bo_111 = true ;
   总_bo_113 = true ;
   总_bo_114 = true ;
   //总_in_112 =2;// StringToInteger(StringSubstr(子_st_1,4,1)) ;
    子_st_1 = IntegerToString(木_0 ) ;
   总_in_112 = StringToInteger(StringSubstr(子_st_1,4,1)) ; 
   if ( ( 总_in_112 < 1 || 总_in_112 > 3 ) )
    {
    总_bo_111 = false ;
    }
   if ( 总_in_112 == 1 )
    {
    if ( ( StringFind(Symbol(),"AUDCAD",0) > -1 || StringFind(Symbol(),"EURCAD",0) > -1 || StringFind(Symbol(),"EURGBP",0) > -1 || StringFind(Symbol(),"EURAUD",0) > -1 || StringFind(Symbol(),"EURUSD",0) > -1 || StringFind(Symbol(),"GBPUSD",0) > -1 || StringFind(Symbol(),"USDCHF",0) > -1 ) )
     {
     临_bo_6 = true;
     }
    else
     {
     临_bo_6 = false;
     }
    if ( !(临_bo_6) )
     {
     总_bo_113 = false ;
    }}
   if ( 总_in_112 == 2 )
    {
    if ( ( StringFind(Symbol(),"AUDCAD",0) > -1 || StringFind(Symbol(),"AUDCHF",0) > -1 || StringFind(Symbol(),"AUDUSD",0) > -1 || StringFind(Symbol(),"CADCHF",0) > -1 || StringFind(Symbol(),"EURAUD",0) > -1 || StringFind(Symbol(),"EURCAD",0) > -1 || StringFind(Symbol(),"EURCHF",0) > -1 || StringFind(Symbol(),"EURGBP",0) > -1 || StringFind(Symbol(),"EURUSD",0) > -1 || StringFind(Symbol(),"GBPAUD",0) > -1 || StringFind(Symbol(),"GBPCAD",0) > -1 || StringFind(Symbol(),"GBPUSD",0) > -1 || StringFind(Symbol(),"USDCAD",0) > -1 || StringFind(Symbol(),"USDCHF",0) > -1 ) )
     {
     临_bo_7 = true;
     }
    else
     {
     临_bo_7 = false;
     }
    if ( !(临_bo_7) )
     {
     总_bo_114 = false ;
   }}}
  return;
  }
 if ((总_bo_102) )  return;
 总_bo_111 = true ;
 总_in_112 = 3 ;
 }
//lizong_6
//---------------------  ----------------------------------------

 bool lizong_7()
 {
 bool        子_bo_1;
 long        子_lo_2;
 long        子_lo_3;
 long        子_lo_4;
 long        子_lo_5;

//----------------------------
 long       临_lo_1;
 string     临_st_3;
 long       临_lo_2;
 string     临_st_6;
 long       临_lo_5;
 string     临_st_9;

 子_bo_1 = true ;
 if ( 总_bo_5 )
  {
  子_lo_2 = StringToTime(总_st_81) ;
  子_lo_3 = StringToTime(总_st_82) ;
  子_lo_4 = StringToTime(总_st_83) ;
  子_lo_5 = StringToTime(总_st_84) ;
  if ( ( ( TimeCurrent() > 子_lo_2 && TimeCurrent() < 子_lo_3 ) || (TimeCurrent() > 子_lo_4 && TimeCurrent() <  子_lo_5) ) )
   {
   子_bo_1 = false ;
  }}
 if ( StopTradingOnFridayClosing && DayOfWeek() >= 5 )
  {
  临_lo_1 = TimeCurrent();
  临_st_3 = IntegerToString(总_in_75);
  if ( StringLen(IntegerToString(总_in_75))  == 1 )
   {
   临_st_3 = "000" + IntegerToString(总_in_75);
   }
  if ( StringLen(临_st_3)  == 2 )
   {
   临_st_3 = "00" + 临_st_3;
   }
  if ( StringLen(临_st_3)  == 3 )
   {
   临_st_3 = "0" + 临_st_3;
   }
  if ( 临_lo_1 >= StringToTime(StringSubstr(临_st_3,0,2) + ":" + StringSubstr(临_st_3,2,2)) )
   {
   子_bo_1 = false ;
  }}
 if ( StopTradingOnMondayOpening )
  {
  if ( 总_in_76 <= 总_in_4 )
   {
   if ( DayOfWeek() == 0 )
    {
    子_bo_1 = false ;
    }
   if ( DayOfWeek() == 1 )
    {
    临_lo_2 = TimeCurrent();
    临_st_6 = IntegerToString(总_in_76);
    if ( StringLen(IntegerToString(总_in_76))  == 1 )
     {
     临_st_6 = "000" + IntegerToString(总_in_76);
     }
    if ( StringLen(临_st_6)  == 2 )
     {
     临_st_6 = "00" + 临_st_6;
     }
    if ( StringLen(临_st_6)  == 3 )
     {
     临_st_6 = "0" + 临_st_6;
     }
    if ( 临_lo_2 <  StringToTime(StringSubstr(临_st_6,0,2) + ":" + StringSubstr(临_st_6,2,2)) )
     {
     子_bo_1 = false ;
   }}}
  else
   {
   if ( DayOfWeek() == 0 )
    {
    临_lo_5 = TimeCurrent();
    临_st_9 = IntegerToString(总_in_76);
    if ( StringLen(IntegerToString(总_in_76))  == 1 )
     {
     临_st_9 = "000" + IntegerToString(总_in_76);
     }
    if ( StringLen(临_st_9)  == 2 )
     {
     临_st_9 = "00" + 临_st_9;
     }
    if ( StringLen(临_st_9)  == 3 )
     {
     临_st_9 = "0" + 临_st_9;
     }
    if ( 临_lo_5 <  StringToTime(StringSubstr(临_st_9,0,2) + ":" + StringSubstr(临_st_9,2,2)) )
     {
     子_bo_1 = false ;
  }}}}
 return(子_bo_1); 
 }
//lizong_7
//---------------------  ----------------------------------------

 bool lizong_8 (int 木_0,int 木_1)
 {
 bool        子_bo_1;
 string      子_st_2;
 string      子_st_3;
 string      子_st_4;
 int         子_in_5;
 int         子_in_6;
 int         子_in_7;
 string      子_st_8;
 string      子_st_9;
 string      子_st_10;
 int         子_in_11;

//----------------------------

 子_bo_1 = true ;
 if ( MinimizeRiskCorrelation && !(IsTesting()) && !(IsOptimization()) )
  {
  子_st_2 = Symbol() ;
  if ( SymbolPrefix  !=  "" )
   {
   子_st_2 = StringSubstr(子_st_2,StringLen(SymbolPrefix) ,6) ;
   }
  子_st_3 = StringSubstr(子_st_2,0,3) ;
  子_st_4 = StringSubstr(子_st_2,3,3) ;
  for (子_in_7 = OrdersTotal() - 1 ; 子_in_7 >= 0 ; 子_in_7 = 子_in_7 - 1)
   {
   if ( !(OrderSelect(子_in_7,SELECT_BY_POS,MODE_TRADES)) )
    break;
   if ( OrderMagicNumber() == 木_1 )
    {
    子_st_8 = OrderSymbol() ;
    if ( SymbolPrefix  !=  "" )
     {
     子_st_8 = StringSubstr(子_st_8,StringLen(SymbolPrefix) ,6) ;
     }
    子_st_9 = StringSubstr(子_st_8,0,3) ;
    子_st_10 = StringSubstr(子_st_8,3,3) ;
    子_in_11 = OrderType() ;
    if ( ( ( 子_st_3 == 子_st_9 && 木_0 == 子_in_11 ) || (子_st_3 == 子_st_10 && 木_0  !=  子_in_11) ) )
     {
     子_in_5 = 子_in_5 + 1;
     }
    if ( ( ( 子_st_4 == 子_st_10 && 木_0 == 子_in_11 ) || (子_st_4 == 子_st_9 && 木_0  !=  子_in_11) ) )
     {
     子_in_6 = 子_in_6 + 1;
     }
    if ( ( 子_in_5 >= MaxCorrelatedTradesPerCurrency || 子_in_6 >= MaxCorrelatedTradesPerCurrency ) )
     {
     子_bo_1 = false ;
     }
    }
   }
  }
 return(子_bo_1); 
 }
//lizong_8
//---------------------  ----------------------------------------

 int lizong_9 (string 木_0,long 木_1)
 {
 int         子_in_1;
 int         子_in_2;

//----------------------------

 子_in_2 = TimeDay(木_1) + TimeMonth(木_1) * 100;
 if ( 木_0 == "US" )
  {
  if ( 子_in_2 > 310 && 子_in_2 <  1103 )
   {
   子_in_1 = 1 ;
   }
  if ( 子_in_2 > 311 && 子_in_2 <  1104 && TimeYear(木_1) == 2007 )
   {
   子_in_1 = 1 ;
   }
  if ( 子_in_2 > 309 && 子_in_2 <  1102 && TimeYear(木_1) == 2008 )
   {
   子_in_1 = 1 ;
   }
  if ( 子_in_2 > 308 && 子_in_2 <  1101 && TimeYear(木_1) == 2009 )
   {
   子_in_1 = 1 ;
   }
  if ( 子_in_2 > 314 && 子_in_2 <  1107 && TimeYear(木_1) == 2010 )
   {
   子_in_1 = 1 ;
   }
  if ( 子_in_2 > 313 && 子_in_2 <  1106 && TimeYear(木_1) == 2011 )
   {
   子_in_1 = 1 ;
   }
  if ( 子_in_2 > 311 && 子_in_2 <  1104 && TimeYear(木_1) == 2012 )
   {
   子_in_1 = 1 ;
   }
  if ( 子_in_2 > 310 && 子_in_2 <  1103 && TimeYear(木_1) == 2013 )
   {
   子_in_1 = 1 ;
   }
  if ( 子_in_2 > 309 && 子_in_2 <  1102 && TimeYear(木_1) == 2014 )
   {
   子_in_1 = 1 ;
   }
  if ( 子_in_2 > 308 && 子_in_2 <  1101 && TimeYear(木_1) == 2015 )
   {
   子_in_1 = 1 ;
   }
  if ( 子_in_2 > 313 && 子_in_2 <  1106 && TimeYear(木_1) == 2016 )
   {
   子_in_1 = 1 ;
   }
  if ( 子_in_2 > 312 && 子_in_2 <  1105 && TimeYear(木_1) == 2017 )
   {
   子_in_1 = 1 ;
   }
  if ( 子_in_2 > 311 && 子_in_2 <  1104 && TimeYear(木_1) == 2018 )
   {
   子_in_1 = 1 ;
   }
  if ( 子_in_2 > 310 && 子_in_2 <  1103 && TimeYear(木_1) == 2019 )
   {
   子_in_1 = 1 ;
  }}
 if ( 木_0 == "Europe" )
  {
  if ( 子_in_2 > 331 && 子_in_2 <  1030 )
   {
   子_in_1 = 1 ;
   }
  if ( 子_in_2 > 325 && 子_in_2 <  1028 && TimeYear(木_1) == 2007 )
   {
   子_in_1 = 1 ;
   }
  if ( 子_in_2 > 330 && 子_in_2 <  1026 && TimeYear(木_1) == 2008 )
   {
   子_in_1 = 1 ;
   }
  if ( 子_in_2 > 329 && 子_in_2 <  1025 && TimeYear(木_1) == 2009 )
   {
   子_in_1 = 1 ;
   }
  if ( 子_in_2 > 328 && 子_in_2 <  1031 && TimeYear(木_1) == 2010 )
   {
   子_in_1 = 1 ;
   }
  if ( 子_in_2 > 327 && 子_in_2 <  1030 && TimeYear(木_1) == 2011 )
   {
   子_in_1 = 1 ;
   }
  if ( 子_in_2 > 325 && 子_in_2 <  1028 && TimeYear(木_1) == 2012 )
   {
   子_in_1 = 1 ;
   }
  if ( 子_in_2 > 331 && 子_in_2 <  1027 && TimeYear(木_1) == 2013 )
   {
   子_in_1 = 1 ;
   }
  if ( 子_in_2 > 330 && 子_in_2 <  1026 && TimeYear(木_1) == 2014 )
   {
   子_in_1 = 1 ;
   }
  if ( 子_in_2 > 329 && 子_in_2 <  1025 && TimeYear(木_1) == 2015 )
   {
   子_in_1 = 1 ;
   }
  if ( 子_in_2 > 327 && 子_in_2 <  1030 && TimeYear(木_1) == 2016 )
   {
   子_in_1 = 1 ;
   }
  if ( 子_in_2 > 326 && 子_in_2 <  1029 && TimeYear(木_1) == 2017 )
   {
   子_in_1 = 1 ;
   }
  if ( 子_in_2 > 325 && 子_in_2 <  1028 && TimeYear(木_1) == 2018 )
   {
   子_in_1 = 1 ;
   }
  if ( 子_in_2 > 331 && 子_in_2 <  1027 && TimeYear(木_1) == 2019 )
   {
   子_in_1 = 1 ;
  }}
 return(子_in_1); 
 }
//lizong_9
//---------------------  ----------------------------------------

 void lizong_10()
 {

//----------------------------
 int        临_in_3;
 int        临_in_4;
 bool       临_bo_5;
 int        临_in_8;
 int        临_in_10;
 bool       临_bo_11;
 int        临_in_14;
 int        临_in_16;
 bool       临_bo_17;
 int        临_in_20;
 int        临_in_22;
 bool       临_bo_23;
 int        临_in_26;
 int        临_in_28;
 bool       临_bo_29;
 int        临_in_32;
 int        临_in_34;
 bool       临_bo_35;
 int        临_in_38;
 int        临_in_40;
 bool       临_bo_41;
 string     临_st_46;
 string     临_st_47;
 string     临_st_48;
 string     临_st_49;
 string     临_st_50;
 string     临_st_51;

 if ( GMT_autocalc )
  {
  总_in_40 = MathRound((TimeCurrent() - TimeGMT()) / 3600.0) ;
  }
 临_in_3 = 总_in_41;
 临_in_4 = GMT_offset;
 if ( GMT_autocalc )
  {
  临_bo_5 = IsTesting();
  if ( !((临_bo_5 || IsOptimization())) )
   {
   临_in_4 = 总_in_40;
  }}
 else
  {
  if ( DST == 1 )
   {
   临_in_4 = lizong_9("US",TimeCurrent()) + 临_in_4;
   }
  if ( DST == 2 )
   {
   临_in_4 = lizong_9("Europe",TimeCurrent()) + 临_in_4;
  }}
 临_in_3 = 临_in_3 + 临_in_4 * 100;
 if ( 临_in_3 >= 2400 )
  {
  临_in_3 = 临_in_3 - 2400;
  }
 if ( 临_in_3 <  0 )
  {
  临_in_3 = 临_in_3 + 2400;
  }
 总_in_70 = 临_in_3 ;
 临_in_8 = 总_in_42;
 临_in_10 = GMT_offset;
 if ( GMT_autocalc )
  {
  临_bo_11 = IsTesting();
  if ( !((临_bo_11 || IsOptimization())) )
   {
   临_in_10 = 总_in_40;
  }}
 else
  {
  if ( DST == 1 )
   {
   临_in_10 = lizong_9("US",TimeCurrent()) + 临_in_10;
   }
  if ( DST == 2 )
   {
   临_in_10 = lizong_9("Europe",TimeCurrent()) + 临_in_10;
  }}
 临_in_8 = 临_in_8 + 临_in_10 * 100;
 if ( 临_in_8 >= 2400 )
  {
  临_in_8 = 临_in_8 - 2400;
  }
 if ( 临_in_8 <  0 )
  {
  临_in_8 = 临_in_8 + 2400;
  }
 总_in_71 = 临_in_8 ;
 临_in_14 = 总_in_6;
 临_in_16 = GMT_offset;
 if ( GMT_autocalc )
  {
  临_bo_17 = IsTesting();
  if ( !((临_bo_17 || IsOptimization())) )
   {
   临_in_16 = 总_in_40;
  }}
 else
  {
  if ( DST == 1 )
   {
   临_in_16 = lizong_9("US",TimeCurrent()) + 临_in_16;
   }
  if ( DST == 2 )
   {
   临_in_16 = lizong_9("Europe",TimeCurrent()) + 临_in_16;
  }}
 临_in_14 = 临_in_14 + 临_in_16 * 100;
 if ( 临_in_14 >= 2400 )
  {
  临_in_14 = 临_in_14 - 2400;
  }
 if ( 临_in_14 <  0 )
  {
  临_in_14 = 临_in_14 + 2400;
  }
 总_in_72 = 临_in_14 ;
 临_in_20 = 总_in_7;
 临_in_22 = GMT_offset;
 if ( GMT_autocalc )
  {
  临_bo_23 = IsTesting();
  if ( !((临_bo_23 || IsOptimization())) )
   {
   临_in_22 = 总_in_40;
  }}
 else
  {
  if ( DST == 1 )
   {
   临_in_22 = lizong_9("US",TimeCurrent()) + 临_in_22;
   }
  if ( DST == 2 )
   {
   临_in_22 = lizong_9("Europe",TimeCurrent()) + 临_in_22;
  }}
 临_in_20 = 临_in_20 + 临_in_22 * 100;
 if ( 临_in_20 >= 2400 )
  {
  临_in_20 = 临_in_20 - 2400;
  }
 if ( 临_in_20 <  0 )
  {
  临_in_20 = 临_in_20 + 2400;
  }
 总_in_73 = 临_in_20 ;
 临_in_26 = 总_in_9;
 临_in_28 = GMT_offset;
 if ( GMT_autocalc )
  {
  临_bo_29 = IsTesting();
  if ( !((临_bo_29 || IsOptimization())) )
   {
   临_in_28 = 总_in_40;
  }}
 else
  {
  if ( DST == 1 )
   {
   临_in_28 = lizong_9("US",TimeCurrent()) + 临_in_28;
   }
  if ( DST == 2 )
   {
   临_in_28 = lizong_9("Europe",TimeCurrent()) + 临_in_28;
  }}
 临_in_26 = 临_in_26 + 临_in_28 * 100;
 if ( 临_in_26 >= 2400 )
  {
  临_in_26 = 临_in_26 - 2400;
  }
 if ( 临_in_26 <  0 )
  {
  临_in_26 = 临_in_26 + 2400;
  }
 总_in_74 = 临_in_26 ;
 临_in_32 = 总_in_3;
 临_in_34 = GMT_offset;
 if ( GMT_autocalc )
  {
  临_bo_35 = IsTesting();
  if ( !((临_bo_35 || IsOptimization())) )
   {
   临_in_34 = 总_in_40;
  }}
 else
  {
  if ( DST == 1 )
   {
   临_in_34 = lizong_9("US",TimeCurrent()) + 临_in_34;
   }
  if ( DST == 2 )
   {
   临_in_34 = lizong_9("Europe",TimeCurrent()) + 临_in_34;
  }}
 临_in_32 = 临_in_32 + 临_in_34 * 100;
 if ( 临_in_32 >= 2400 )
  {
  临_in_32 = 临_in_32 - 2400;
  }
 if ( 临_in_32 <  0 )
  {
  临_in_32 = 临_in_32 + 2400;
  }
 总_in_75 = 临_in_32 ;
 临_in_38 = 总_in_4;
 临_in_40 = GMT_offset;
 if ( GMT_autocalc )
  {
  临_bo_41 = IsTesting();
  if ( !((临_bo_41 || IsOptimization())) )
   {
   临_in_40 = 总_in_40;
  }}
 else
  {
  if ( DST == 1 )
   {
   临_in_40 = lizong_9("US",TimeCurrent()) + 临_in_40;
   }
  if ( DST == 2 )
   {
   临_in_40 = lizong_9("Europe",TimeCurrent()) + 临_in_40;
  }}
 临_in_38 = 临_in_38 + 临_in_40 * 100;
 if ( 临_in_38 >= 2400 )
  {
  临_in_38 = 临_in_38 - 2400;
  }
 if ( 临_in_38 <  0 )
  {
  临_in_38 = 临_in_38 + 2400;
  }
 总_in_76 = 临_in_38 ;
 临_st_46 = IntegerToString(总_in_70);
 if ( StringLen(IntegerToString(总_in_70))  == 1 )
  {
  临_st_46 = "000" + IntegerToString(总_in_70);
  }
 if ( StringLen(临_st_46)  == 2 )
  {
  临_st_46 = "00" + 临_st_46;
  }
 if ( StringLen(临_st_46)  == 3 )
  {
  临_st_46 = "0" + 临_st_46;
  }
 总_st_77 = StringSubstr(临_st_46,0,2) + ":" + StringSubstr(临_st_46,2,2) ;
 总_st_79 = "00:00" ;
 if ( 总_in_70 <  总_in_71 )
  {
  临_st_47 = IntegerToString(总_in_71);
  if ( StringLen(IntegerToString(总_in_71))  == 1 )
   {
   临_st_47 = "000" + IntegerToString(总_in_71);
   }
  if ( StringLen(临_st_47)  == 2 )
   {
   临_st_47 = "00" + 临_st_47;
   }
  if ( StringLen(临_st_47)  == 3 )
   {
   临_st_47 = "0" + 临_st_47;
   }
  总_st_78 = StringSubstr(临_st_47,0,2) + ":" + StringSubstr(临_st_47,2,2) ;
  总_st_80 = "00:00" ;
  }
 else
  {
  总_st_78 = "23:59" ;
  临_st_48 = IntegerToString(总_in_71);
  if ( StringLen(IntegerToString(总_in_71))  == 1 )
   {
   临_st_48 = "000" + IntegerToString(总_in_71);
   }
  if ( StringLen(临_st_48)  == 2 )
   {
   临_st_48 = "00" + 临_st_48;
   }
  if ( StringLen(临_st_48)  == 3 )
   {
   临_st_48 = "0" + 临_st_48;
   }
  总_st_80 = StringSubstr(临_st_48,0,2) + ":" + StringSubstr(临_st_48,2,2) ;
  }
 临_st_49 = IntegerToString(总_in_72);
 if ( StringLen(IntegerToString(总_in_72))  == 1 )
  {
  临_st_49 = "000" + IntegerToString(总_in_72);
  }
 if ( StringLen(临_st_49)  == 2 )
  {
  临_st_49 = "00" + 临_st_49;
  }
 if ( StringLen(临_st_49)  == 3 )
  {
  临_st_49 = "0" + 临_st_49;
  }
 总_st_81 = StringSubstr(临_st_49,0,2) + ":" + StringSubstr(临_st_49,2,2) ;
 总_st_83 = "00:00" ;
 if ( 总_in_72 <  总_in_73 )
  {
  临_st_50 = IntegerToString(总_in_73);
  if ( StringLen(IntegerToString(总_in_73))  == 1 )
   {
   临_st_50 = "000" + IntegerToString(总_in_73);
   }
  if ( StringLen(临_st_50)  == 2 )
   {
   临_st_50 = "00" + 临_st_50;
   }
  if ( StringLen(临_st_50)  == 3 )
   {
   临_st_50 = "0" + 临_st_50;
   }
  总_st_82 = StringSubstr(临_st_50,0,2) + ":" + StringSubstr(临_st_50,2,2) ;
  总_st_84 = "00:00" ;
  return;
  }
 总_st_82 = "23:59" ;
 临_st_51 = IntegerToString(总_in_73);
 if ( StringLen(IntegerToString(总_in_73))  == 1 )
  {
  临_st_51 = "000" + IntegerToString(总_in_73);
  }
 if ( StringLen(临_st_51)  == 2 )
  {
  临_st_51 = "00" + 临_st_51;
  }
 if ( StringLen(临_st_51)  == 3 )
  {
  临_st_51 = "0" + 临_st_51;
  }
 总_st_84 = StringSubstr(临_st_51,0,2) + ":" + StringSubstr(临_st_51,2,2) ;
 }
//lizong_10
//---------------------  ----------------------------------------

 void lizong_11()
 {

//----------------------------
 double     临_do_5;
 double     临_do_7;

 if ( 总_lo_130 <  总_lo_118 )
  {
  总_lo_130=总_lo_118 + 60;
  lizong_10(); 
  HideTestIndicators(true); 
  总_do_122 = iBands(NULL,总_in_46,总_in_51,总_do_52,0,1,2,0) ;
  总_do_123 = iBands(NULL,总_in_46,总_in_51,总_do_52,0,1,1,0) ;
  总_do_124 = 总_do_62 * 总_do_89 + iBands(NULL,总_in_46,总_in_51,总_do_52,0,0,1,1) ;
  总_do_125 = iBands(NULL,总_in_46,总_in_51,总_do_52,0,0,2,1) - 总_do_63 * 总_do_89 ;
  总_do_127 = (总_do_123 - 总_do_122) / 总_do_89 ;
  总_do_122 = 总_do_122 - 总_do_53 * 总_do_89 ;
  总_do_123 = 总_do_123 + 总_do_53 * 总_do_89 ;
  if ( TimeCurrent() > 总_lo_98 && TimeCurrent() <  总_lo_99 )
   {
   总_do_128 = (iHigh(NULL,PERIOD_D1,0) - iLow(NULL,PERIOD_D1,0)) / 总_do_89 ;
   }
  if ( TimeCurrent() > 总_lo_100 && TimeCurrent() <  总_lo_101 )
   {
   总_do_128 = (iHigh(NULL,PERIOD_D1,1) - iLow(NULL,PERIOD_D1,1)) / 总_do_89 ;
  }}
 总_do_92 = MarketInfo(Symbol(),23) ;
 总_do_90 = MarketInfo(Symbol(),25) ;
 总_in_93 = MarketInfo(Symbol(),15) ;
 总_do_91 = MarketInfo(Symbol(),24) ;
 if ( MoneyManagement == 0 )
  {
  总_do_1 = Auto_Risk ;
  }
 if ( MoneyManagement == 1 )
  {
  临_do_5 = MathFloor(AccountBalance() * Auto_Risk / 100.0 / MarketInfo(Symbol(),16) / (总_in_43 * 总_do_89 / Point()) / 总_do_91) * 总_do_91;
  if ( 总_do_90 >= MathFloor(AccountBalance() * Auto_Risk / 100.0 / MarketInfo(Symbol(),16) / (总_in_43 * 总_do_89 / Point()) / 总_do_91) * 总_do_91 )
   {
   临_do_5 = 临_do_5;
   }
  else
   {
   临_do_5 = 总_do_90;
   }
  总_do_1 = MathMax(总_do_92,临_do_5) ;
  }
 if ( MoneyManagement == 2 )
  {
  if ( Auto_Risk <= 100 )
   {
   临_do_5 = Auto_Risk;
   }
  else
   {
   临_do_5 = 100.0;
   }
  临_do_7 = MathCeil(临_do_5 / 100.0 * AccountBalance() / 总_do_91 / (总_in_93 / 100)) * 总_do_91;
  if ( 总_do_90 >= MathCeil(临_do_5 / 100.0 * AccountBalance() / 总_do_91 / (总_in_93 / 100)) * 总_do_91 )
   {
   临_do_7 = 临_do_7;
   }
  else
   {
   临_do_7 = 总_do_90;
   }
  总_do_1 = MathMax(总_do_92,临_do_7) ;
  }
 HideTestIndicators(true); 
 总_do_121 = iCCI(NULL,1,总_in_47,总_in_48,0) ;
 总_do_126 = iMA(NULL,1,255,0,MODE_SMMA,PRICE_CLOSE,0) ;
 总_do_120 = (Ask - Bid) / 总_do_89 ;
 }
//lizong_11
//---------------------  ----------------------------------------

 void lizong_12 (int 木_0,double 木_1,double   木_2,string 木_3, int  x4)
 {
 int         子_in_1;
 string      子_st_2;
 uint        子_ui_3;
 int         子_in_4;
 int         子_in_5;
 int         子_in_6;
 int         子_in_7;
 double      子_do_8;
 double      子_do_9;

//----------------------------
 string     临_st_5;
 double     临_do_6;
 int        临_in_7;
 int        临_in_10;
 int        临_in_12;
 double     临_do_13;
 double     临_do_16;
 int        临_in_19;
 int        临_in_22;
 double     临_do_23;
 string     临_st_24;
 int        临_in_26;
 double     临_do_28;

 if ( AccountFreeMarginCheck(Symbol(),1,总_do_1)>0.0 )
  {
  RefreshRates(); 
  子_st_2 = 木_3 ;
  if ( 子_st_2 == "NONE" )
   {
   子_in_1 = Digits() ;
   子_st_2 = Symbol() ;
   }
  else
   {
   子_in_1 = MarketInfo(子_st_2,12) ;
   }
  if ( 木_0 == 0 )
   {
   木_2 = NormalizeDouble(MarketInfo(子_st_2,10),子_in_1) ;
   子_ui_3 = Blue ;
   }
  if ( 木_0 == 1 )
   {
   木_2 = NormalizeDouble(MarketInfo(子_st_2,9),子_in_1) ;
   子_ui_3 = Red ;
   }
  for ( ; 子_in_5 <= 5 ; 子_in_5 = 子_in_5 + 1)
   {
   RefreshRates(); 
   PrintFormat("Spread on entry: " + DoubleToString(总_do_120,2)); 
   子_in_6 = OrderSend(子_st_2,木_0,木_1,NormalizeDouble(木_2,子_in_1),总_in_10 * 总_in_115,0.0,0.0,Comment,MagicNumber,0,子_ui_3) ;
  
   if ( 子_in_6  !=  -1 )
    {
    子_in_4 = 0 ;
    if ( !(IsTesting()) )
     {
     Sleep(1000); 
     }
    RefreshRates();    
    if ( ( 总_in_43 == 0 || 总_in_44 == 0 ) )
     break;      
    for ( ; 子_in_7 <= 5 ; 子_in_7 = 子_in_7 + 1)
     {
     RefreshRates(); 
     if ( OrderSelect(子_in_6,SELECT_BY_TICKET,MODE_TRADES) )
      {
      临_st_5 = 子_st_2;
      临_do_6 = 木_2;
      临_in_7 = 木_0;
      临_in_10 = 总_in_43 * 总_in_115;
      if ( 子_st_2 == "NONE" )
       {
       临_st_5 = Symbol();
       }
      临_in_12 = MarketInfo(临_st_5,12);
      临_do_13 = MarketInfo(临_st_5,11);
      if ( 临_do_6==0.0 )
       {
       if ( 临_in_7 == 0 )
        {
        临_do_6 = NormalizeDouble(MarketInfo(临_st_5,10),临_in_12);
        }
       if ( 临_in_7 == 1 )
        {
        临_do_6 = NormalizeDouble(MarketInfo(临_st_5,9),临_in_12);
       }}
      if ( 临_in_10 > 0 )
       {
       if ( 临_in_7 == 0 )
        {
        临_do_16 = NormalizeDouble(临_do_6 - 临_in_10 * 临_do_13,临_in_12);
        }
       else
        {
        if ( 临_in_7 == 1 )
         {
         临_do_16 = NormalizeDouble(临_in_10 * 临_do_13 + 临_do_6,临_in_12);
       }}}
      else
       {
       临_do_16 = 0.0;
       }
      子_do_8 = NormalizeDouble(临_do_16,子_in_1) ;
      临_in_19 = 木_0;
      临_in_22 = 总_in_44 * 总_in_115;
      临_do_23 = 木_2;
      临_st_24 = 子_st_2;
      if ( 子_st_2 == "NONE" )
       {
       临_st_24 = Symbol();
       }
      临_in_26 = MarketInfo(临_st_24,12);
      if ( 临_do_23==0.0 )
       {
       if ( 临_in_19 == 0 )
        {
        临_do_23 = NormalizeDouble(MarketInfo(临_st_24,10),临_in_26);
        }
       if ( 临_in_19 == 1 )
        {
        临_do_23 = NormalizeDouble(MarketInfo(临_st_24,9),临_in_26);
       }}
      if ( 临_in_22 > 0 )
       {
       if ( 临_in_19 == 0 )
        {
        临_do_28 = NormalizeDouble(临_in_22 * MarketInfo(临_st_24,11) + 临_do_23,临_in_26);
        }
       else
        {
        if ( 临_in_19 == 1 )
         {
         临_do_28 = NormalizeDouble(临_do_23 - 临_in_22 * MarketInfo(临_st_24,11),临_in_26);
       }}}
      else
       {
       临_do_28 = 0.0;
       }
      子_do_9 = NormalizeDouble(临_do_28,子_in_1) ;
      if ( ( ( !(子_do_8!=0.0) && !(子_do_9!=0.0) ) || OrderModify(OrderTicket(),OrderOpenPrice(),子_do_8,子_do_9,OrderExpiration(),0xFFFFFFFF) ) )
       break;
      子_in_4 = GetLastError() ;
      }
     if ( !(IsTesting()) )
      {
      Sleep(子_in_7 * 1000); 
      }
     }
    if ( 子_in_4 == 0 )
     break;
    Alert("SL/TP error: #" + string(子_in_4)); 
    break;
    }
   子_in_4 = GetLastError() ;
   if ( 子_in_4 == 0 )
    break;
   子_in_5 = 子_in_5 + 1;
   if ( !(IsTesting()) )
    {
    Sleep(子_in_5 * 500); 
    }
   }
  if ( 子_in_4 != 0 )
   {
   if ( 木_0 == 0 )
    {
    总_lo_116 = 0 ;
    }
   if ( 木_0 == 1 )
    {
    总_lo_117 = 0 ;
    }
   Alert("Error: #" + string(子_in_4)); 
   }
  return;
  }
 PrintFormat("Not enought money to open position!"); 
 }
//lizong_12
//---------------------  ----------------------------------------

 bool lizong_13 (int 木_0,int 木_1,int 木_2)
 {
 int         子_in_1;
 int         子_in_2;

//----------------------------
 int        临_in_1;
 int        临_in_3;
 double     临_do_4;
 uint       临_ui_5;
 bool       临_bo_11;

 RefreshRates(); 
 for (子_in_2 = OrdersTotal() - 1 ; 子_in_2 >= 0 ; 子_in_2 = 子_in_2 - 1)
  {
  if ( !(OrderSelect(子_in_2,SELECT_BY_POS,MODE_TRADES)) )
   break;
  if ( OrderType() == 木_2 && OrderMagicNumber() == 木_0 && Symbol() == OrderSymbol() )
   {
   临_in_1 = 木_1;
   if ( OrderSelect(OrderTicket(),SELECT_BY_TICKET,MODE_TRADES) )
    {
    for (临_in_3 = 0 ; 临_in_3 < 5 ; 临_in_3=临_in_3 + 1)
     {
     RefreshRates(); 
     临_do_4 = 0.0;
     临_ui_5 = 0;
     if ( OrderType() == 0 )
      {
      临_do_4 = NormalizeDouble(SymbolInfoDouble(OrderSymbol(),1),SymbolInfoInteger(OrderSymbol(),17));
      临_ui_5 = Blue;
      }
     if ( OrderType() == 1 )
      {
      临_do_4 = NormalizeDouble(SymbolInfoDouble(OrderSymbol(),4),SymbolInfoInteger(OrderSymbol(),17));
      临_ui_5 = Red;
      }
     临_bo_11 = false;
     if ( OrderType() <= 1 )
      {
      临_bo_11 = OrderClose(OrderTicket(),OrderLots(),临_do_4,临_in_1 * 总_in_115,临_ui_5);
      }
     else
      {
      临_bo_11 = OrderDelete(OrderTicket(),0xFFFFFFFF);
      }
     if ( 临_bo_11 )
      break;
     if ( GetLastError() != 0 )
      {
      Print("Error of close_by_ticket() #" + string(GetLastError())); 
      }
     Sleep(临_in_3 * 300); 
     }
    }
   子_in_1 = 子_in_1 + 1;
   }
  }
 if ( 子_in_1 > 0 )
  {
  return(true); 
  }
 return(false); 
 }
//lizong_13
//---------------------  ----------------------------------------

 bool lizong_14()
 {

//----------------------------
 double     临_do_6;
 double     临_do_7;
 double     临_do_5;
 double     临_do_13;
 double     临_do_14;
 double     临_do_12;
 double     临_do_20;
 double     临_do_21;
 double     临_do_19;
 double     临_do_31;
 double     临_do_32;
 double     临_do_30;
 long       临_lo_36;
 string     临_st_38;
 long       临_lo_37;
 string     临_st_41;

 if ( OrderType() == 0 )
  {
  临_do_6 = 总_do_68 * OrderLots();
  临_do_7 = 总_do_67 * OrderLots() * (((TimeCurrent() - OrderOpenTime()) / 60.0) / 总_in_69) + 总_do_66 * OrderLots();
  if ( 总_do_68 * OrderLots()<=总_do_67 * OrderLots() * (((TimeCurrent() - OrderOpenTime()) / 60.0) / 总_in_69) + 总_do_66 * OrderLots() )
   {
   临_do_5 = OrderProfit() + OrderCommission() + OrderSwap() - 临_do_7;
   }
  else
   {
   临_do_5 = OrderProfit() + OrderCommission() + OrderSwap() - 临_do_6;
   }
 //  Print("  总_do_120="+总_do_120+"  总_do_45="+总_do_45+"  总_do_121="+总_do_121+"  总_in_57="+总_in_57+"  总_bo_55="+总_bo_55);
  if ( ( ( 临_do_5>0.0 && 总_do_120<总_do_45 ) || (Bid - OrderOpenPrice()>总_in_65 * 总_do_89 && 总_do_120>总_do_45) ) && 总_do_121>总_in_56 && 总_bo_55 )
   {
   PrintFormat("Order have been closed by filter #1"); 
   return(true); 
   }
  临_do_13 = 总_do_68 * OrderLots();
  临_do_14 = 总_do_67 * OrderLots() * (((TimeCurrent() - OrderOpenTime()) / 60.0) / 总_in_69) + 总_do_66 * OrderLots();
  if ( 总_do_68 * OrderLots()<=总_do_67 * OrderLots() * (((TimeCurrent() - OrderOpenTime()) / 60.0) / 总_in_69) + 总_do_66 * OrderLots() )
   {
   临_do_12 = OrderProfit() + OrderCommission() + OrderSwap() - 临_do_14;
   }
  else
   {
   临_do_12 = OrderProfit() + OrderCommission() + OrderSwap() - 临_do_13;
   }
  if ( ( ( 临_do_12>0.0 && 总_do_120<总_do_45 ) || (Bid - OrderOpenPrice()>总_in_65 * 总_do_89 && 总_do_120>总_do_45) ) && Bid>=总_do_126 && 总_bo_58 )
   {
   PrintFormat("Order have been closed by filter #2"); 
   return(true); 
   }
  临_do_20 = 总_do_68 * OrderLots();
  临_do_21 = 总_do_67 * OrderLots() * (((TimeCurrent() - OrderOpenTime()) / 60.0) / 总_in_69) + 总_do_66 * OrderLots();
  if ( 总_do_68 * OrderLots()<=总_do_67 * OrderLots() * (((TimeCurrent() - OrderOpenTime()) / 60.0) / 总_in_69) + 总_do_66 * OrderLots() )
   {
   临_do_19 = OrderProfit() + OrderCommission() + OrderSwap() - 临_do_21;
   }
  else
   {
   临_do_19 = OrderProfit() + OrderCommission() + OrderSwap() - 临_do_20;
   }
  if ( ( ( 临_do_19>0.0 && 总_do_120<总_do_45 ) || (Bid - OrderOpenPrice()>总_in_65 * 总_do_89 && 总_do_120>总_do_45) ) && TimeCurrent() - OrderOpenTime() > 总_in_60 * 60 && 总_bo_59 )
   {
   PrintFormat("Order have been closed by filter #3"); 
   return(true); 
   }
  if ( ( 总_do_120<总_do_45 || (Bid - OrderOpenPrice()>总_in_65 * 总_do_89 && 总_do_120>总_do_45) ) && Bid>=总_do_124 && 总_bo_61 )
   {
   PrintFormat("Order have been closed by filter #4"); 
   return(true); 
   }
  if ( Bid - OrderOpenPrice()>总_in_65 * 总_do_89 )
   {
   临_do_31 = 总_do_68 * OrderLots();
   临_do_32 = 总_do_67 * OrderLots() * (((TimeCurrent() - OrderOpenTime()) / 60.0) / 总_in_69) + 总_do_66 * OrderLots();
   if ( 总_do_68 * OrderLots()<=总_do_67 * OrderLots() * (((TimeCurrent() - OrderOpenTime()) / 60.0) / 总_in_69) + 总_do_66 * OrderLots() )
    {
    临_do_30 = OrderProfit() + OrderCommission() + OrderSwap() - 临_do_32;
    }
   else
    {
    临_do_30 = OrderProfit() + OrderCommission() + OrderSwap() - 临_do_31;
    }
   if ( ( ( 临_do_30>0.0 && 总_do_120<总_do_45 ) || (Bid - OrderOpenPrice()>总_in_65 * 总_do_89 && 总_do_120>总_do_45) ) )
    {
    总_do_85 = iMA(NULL,1,2,0,MODE_SMA,PRICE_CLOSE,1) ;
    总_do_86 = iMA(NULL,1,2,0,MODE_SMA,PRICE_CLOSE,2) ;
    if ( 总_do_85<iMA(NULL,1,2,0,MODE_SMA,PRICE_CLOSE,2) && 总_bo_64 )
     {
     PrintFormat("Order have been closed by filter #5"); 
     return(true); 
   }}}
  if ( 总_bo_8 )
   {
   临_lo_36 = TimeCurrent();
   临_st_38 = IntegerToString(总_in_74);
   if ( StringLen(IntegerToString(总_in_74))  == 1 )
    {
    临_st_38 = "000" + IntegerToString(总_in_74);
    }
   if ( StringLen(临_st_38)  == 2 )
    {
    临_st_38 = "00" + 临_st_38;
    }
   if ( StringLen(临_st_38)  == 3 )
    {
    临_st_38 = "0" + 临_st_38;
    }
   if ( 临_lo_36 >= StringToTime(StringSubstr(临_st_38,0,2) + ":" + StringSubstr(临_st_38,2,2)) )
    {
    临_lo_37 = TimeCurrent();
    临_st_41 = IntegerToString(总_in_74);
    if ( StringLen(IntegerToString(总_in_74))  == 1 )
     {
     临_st_41 = "000" + IntegerToString(总_in_74);
     }
    if ( StringLen(临_st_41)  == 2 )
     {
     临_st_41 = "00" + 临_st_41;
     }
    if ( StringLen(临_st_41)  == 3 )
     {
     临_st_41 = "0" + 临_st_41;
     }
    if ( 临_lo_37 <  StringToTime(StringSubstr(临_st_41,0,2) + ":" + StringSubstr(临_st_41,2,2)) + 60 )
     {
     PrintFormat("Order has been closed by Cut-Timefilter"); 
     return(true); 
   }}}
  return(false); 
  }
 return(false); 
 }
//lizong_14
//---------------------  ----------------------------------------

 bool lizong_15()
 {

//----------------------------
 double     临_do_6;
 double     临_do_7;
 double     临_do_5;
 double     临_do_13;
 double     临_do_14;
 double     临_do_12;
 double     临_do_20;
 double     临_do_21;
 double     临_do_19;
 double     临_do_31;
 double     临_do_32;
 double     临_do_30;
 long       临_lo_36;
 string     临_st_38;
 long       临_lo_37;
 string     临_st_41;

 if ( OrderType() == 1 )
  {
  临_do_6 = 总_do_68 * OrderLots();
  临_do_7 = 总_do_67 * OrderLots() * (((TimeCurrent() - OrderOpenTime()) / 60.0) / 总_in_69) + 总_do_66 * OrderLots();
  if ( 总_do_68 * OrderLots()<=总_do_67 * OrderLots() * (((TimeCurrent() - OrderOpenTime()) / 60.0) / 总_in_69) + 总_do_66 * OrderLots() )
   {
   临_do_5 = OrderProfit() + OrderCommission() + OrderSwap() - 临_do_7;
   }
  else
   {
   临_do_5 = OrderProfit() + OrderCommission() + OrderSwap() - 临_do_6;
   }
  // Print("  总_do_120="+总_do_120+"  总_do_45="+总_do_45+"  总_do_121="+总_do_121+"  总_in_57="+总_in_57+"  总_bo_55="+总_bo_55);
  if ( ( ( 临_do_5>0.0 && 总_do_120<总_do_45 ) || (OrderOpenPrice() - Ask>总_in_65 * 总_do_89 && 总_do_120>总_do_45) ) && 总_do_121<总_in_57 && 总_bo_55 )
   {
   PrintFormat("Order have been closed by filter #1"); 
   return(true); 
   }
  临_do_13 = 总_do_68 * OrderLots();
  临_do_14 = 总_do_67 * OrderLots() * (((TimeCurrent() - OrderOpenTime()) / 60.0) / 总_in_69) + 总_do_66 * OrderLots();
  if ( 总_do_68 * OrderLots()<=总_do_67 * OrderLots() * (((TimeCurrent() - OrderOpenTime()) / 60.0) / 总_in_69) + 总_do_66 * OrderLots() )
   {
   临_do_12 = OrderProfit() + OrderCommission() + OrderSwap() - 临_do_14;
   }
  else
   {
   临_do_12 = OrderProfit() + OrderCommission() + OrderSwap() - 临_do_13;
   }
  if ( ( ( 临_do_12>0.0 && 总_do_120<总_do_45 ) || (OrderOpenPrice() - Ask>总_in_65 * 总_do_89 && 总_do_120>总_do_45) ) && Ask<=总_do_126 && 总_bo_58 )
   {
   PrintFormat("Order have been closed by filter #2"); 
   return(true); 
   }
  临_do_20 = 总_do_68 * OrderLots();
  临_do_21 = 总_do_67 * OrderLots() * (((TimeCurrent() - OrderOpenTime()) / 60.0) / 总_in_69) + 总_do_66 * OrderLots();
  if ( 总_do_68 * OrderLots()<=总_do_67 * OrderLots() * (((TimeCurrent() - OrderOpenTime()) / 60.0) / 总_in_69) + 总_do_66 * OrderLots() )
   {
   临_do_19 = OrderProfit() + OrderCommission() + OrderSwap() - 临_do_21;
   }
  else
   {
   临_do_19 = OrderProfit() + OrderCommission() + OrderSwap() - 临_do_20;
   }
  if ( 临_do_19>0.0 && 总_do_120<总_do_45 && TimeCurrent() - OrderOpenTime() > 总_in_60 * 60 && 总_bo_59 )
   {
   PrintFormat("Order have been closed by filter #3"); 
   return(true); 
   }
  if ( ( 总_do_120<总_do_45 || (OrderOpenPrice() - Ask>总_in_65 * 总_do_89 && 总_do_120>总_do_45) ) && Ask<=总_do_125 && 总_bo_61 )
   {
   PrintFormat("Order have been closed by filter #4"); 
   return(true); 
   }
  if ( OrderOpenPrice() - Ask>总_in_65 * 总_do_89 )
   {
   临_do_31 = 总_do_68 * OrderLots();
   临_do_32 = 总_do_67 * OrderLots() * (((TimeCurrent() - OrderOpenTime()) / 60.0) / 总_in_69) + 总_do_66 * OrderLots();
   if ( 总_do_68 * OrderLots()<=总_do_67 * OrderLots() * (((TimeCurrent() - OrderOpenTime()) / 60.0) / 总_in_69) + 总_do_66 * OrderLots() )
    {
    临_do_30 = OrderProfit() + OrderCommission() + OrderSwap() - 临_do_32;
    }
   else
    {
    临_do_30 = OrderProfit() + OrderCommission() + OrderSwap() - 临_do_31;
    }
   if ( ( ( 临_do_30>0.0 && 总_do_120<总_do_45 ) || (OrderOpenPrice() - Ask>总_in_65 * 总_do_89 && 总_do_120>总_do_45) ) )
    {
    总_do_85 = iMA(NULL,1,2,0,MODE_SMA,PRICE_CLOSE,1) ;
    总_do_86 = iMA(NULL,1,2,0,MODE_SMA,PRICE_CLOSE,2) ;
    if ( 总_do_85>iMA(NULL,1,2,0,MODE_SMA,PRICE_CLOSE,2) && 总_bo_64 )
     {
     PrintFormat("Order have been closed by filter #5"); 
     return(true); 
   }}}
  if ( 总_bo_8 )
   {
   临_lo_36 = TimeCurrent();
   临_st_38 = IntegerToString(总_in_74);
   if ( StringLen(IntegerToString(总_in_74))  == 1 )
    {
    临_st_38 = "000" + IntegerToString(总_in_74);
    }
   if ( StringLen(临_st_38)  == 2 )
    {
    临_st_38 = "00" + 临_st_38;
    }
   if ( StringLen(临_st_38)  == 3 )
    {
    临_st_38 = "0" + 临_st_38;
    }
   if ( 临_lo_36 >= StringToTime(StringSubstr(临_st_38,0,2) + ":" + StringSubstr(临_st_38,2,2)) )
    {
    临_lo_37 = TimeCurrent();
    临_st_41 = IntegerToString(总_in_74);
    if ( StringLen(IntegerToString(总_in_74))  == 1 )
     {
     临_st_41 = "000" + IntegerToString(总_in_74);
     }
    if ( StringLen(临_st_41)  == 2 )
     {
     临_st_41 = "00" + 临_st_41;
     }
    if ( StringLen(临_st_41)  == 3 )
     {
     临_st_41 = "0" + 临_st_41;
     }
    if ( 临_lo_37 <  StringToTime(StringSubstr(临_st_41,0,2) + ":" + StringSubstr(临_st_41,2,2)) + 60 )
     {
     PrintFormat("Order has been closed by Cut-Timefilter"); 
     return(true); 
   }}}
  return(false); 
  }
 return(false); 
 }
//lizong_15
//---------------------  ----------------------------------------

 void lizong_16()
 {
 string      子_st_1;
 string      子_st_2;
 string      子_st_3;

//----------------------------
 string     临_st_1;
 double     临_do_6;
 double     临_do_8;
 double     临_do_10;
 int        临_in_11;
 int        临_in_12;
 int        临_in_13;
 int        临_in_15;
 bool       临_bo_18;
 bool       临_bo_20;
 string     临_st_23;
 string     临_st_24;
 string     临_st_25;
 string     临_st_26;
 string     临_st_27;
 string     临_st_28;
 bool       临_bo_21;

 if (!(!(IsTesting())) )  return;
 if (!(!(IsOptimization())) )  return;
 if ( MoneyManagement == 0 )
  {
  总_st_94="\n   Fixed risk is activated\n   Lots: " + DoubleToString(Auto_Risk,2);
  }
 if ( MoneyManagement == 1 )
  {
  临_st_1="\n   Risk based per Trade: " + DoubleToString(Auto_Risk,1) + "%" + "\n   Calculated Lots: "; 
  临_do_6 = MathFloor(AccountBalance() * Auto_Risk / 100.0 / MarketInfo(Symbol(),16) / (总_in_43 * 总_do_89 / Point()) / 总_do_91) * 总_do_91;
  if ( 总_do_90 >= MathFloor(AccountBalance() * Auto_Risk / 100.0 / MarketInfo(Symbol(),16) / (总_in_43 * 总_do_89 / Point()) / 总_do_91) * 总_do_91 )
   {
   临_do_6 = 临_do_6;
   }
  else
   {
   临_do_6 = 总_do_90;
   }
  总_st_94 = 临_st_1 + DoubleToString(MathMax(总_do_92,临_do_6),2) + "" ;
  }
 if ( MoneyManagement == 2 )
  {
  临_st_1="\n   Risk based on Balance: " + DoubleToString(Auto_Risk,1) + "%" + "\n   Calculated Lots: "; 
  if ( Auto_Risk <= 100 )
   {
   临_do_6 = Auto_Risk;
   }
  else
   {
   临_do_6 = 100.0;
   }
  临_do_8 = MathCeil(临_do_6 / 100.0 * AccountBalance() / 总_do_91 / (总_in_93 / 100)) * 总_do_91;
  if ( 总_do_90 >= MathCeil(临_do_6 / 100.0 * AccountBalance() / 总_do_91 / (总_in_93 / 100)) * 总_do_91 )
   {
   临_do_8 = 临_do_8;
   }
  else
   {
   临_do_8 = 总_do_90;
   }
  总_st_94 = 临_st_1 + DoubleToString(MathMax(总_do_92,临_do_8),2) + "" ;
  }
 if ( 总_do_120<=总_do_45 )
  {
  总_st_95 = "  Spread OK" ;
  }
 else
  {
  总_st_95 = "  Spread TOO HIGH" ;
  }
 if ( 总_do_128>总_in_50 )
  {
  总_st_96 = "  Too high volantility. Waiting for better trading conditions." ;
  }
 else
  {
  总_st_96 = "  Trading conditions are ok." ;
  }
 总_st_97 = "\n\n  -----------------------------------------------\n   TRADING STATUS:" ;
 临_do_8 = -1.0;
 临_do_10 = -1.0;
 临_st_1 = "NULL";
 临_in_11 = -1;
 临_in_12 = -1;
 临_in_13 = MagicNumber;
 for (临_in_15 = OrdersTotal() - 1 ; 临_in_15 >= 0 ; 临_in_15=临_in_15 - 1)
  {
  if ( !(OrderSelect(临_in_15,SELECT_BY_POS,MODE_TRADES)) )
   break;
  if ( ( OrderType() == 临_in_12 || 临_in_12 == -1 ) && ( OrderMagicNumber() == 临_in_13 || 临_in_13 == -1 ) && ( OrderSymbol() == 临_st_1 || (临_st_1 == "NULL" && OrderSymbol() == Symbol()) ) && ( OrderOpenTime() >= 临_in_11 || 临_in_11 == -1 ) && ( OrderLots()==临_do_8 || 临_do_8==-1.0 ) && ( NormalizeDouble(OrderOpenPrice(),Digits())==NormalizeDouble(临_do_10,Digits()) || 临_do_10==-1.0 ) )
   {
   临_bo_18 = true;
   break;
   }
  }
 临_bo_18 = false;
 if ( 临_bo_18 )
  {
  总_st_97=总_st_97 + "\n   Watching the open trade.\n   Waiting for a good exit-point.";
  }
 else
  {
  if ( ( ( TimeCurrent() > 总_lo_98 && TimeCurrent() < 总_lo_99 ) || (TimeCurrent() > 总_lo_100 && TimeCurrent() <  总_lo_101) ) )
   {
   if ( lizong_7() )
    {
    临_bo_20 = true;
    }
   else
    {
    临_bo_20 = false;
   }}
  else
   {
   临_bo_20 = false;
   }
  if ( 临_bo_20 )
   {
   if ( 总_do_128>总_in_50 )
    {
    总_st_97=总_st_97 + "\n   Too high volantility.\n   Skipping this trading session.";
    }
   else
    {
    if ( 总_do_120>总_do_45 )
     {
     总_st_97=总_st_97 + "\n   Spread too high.\n   Waiting for better conditions.";
     }
    else
     {
     总_st_97=总_st_97 + "\n   Trading timeframe active.";
     if ( MinimizeRiskCorrelation )
      {
      if ( !(lizong_8(0,MagicNumber)) )
       {
       总_st_97=总_st_97 + "\n   Correlation-Check active.\n   Opening of buy-positions is blocked.";
       }
      if ( !(lizong_8(1,MagicNumber)) )
       {
       总_st_97=总_st_97 + "\n   Correlation-Check active.\n   Opening of sell-positions is blocked.";
   }}}}}
  else
   {
   if ( !(lizong_7()) )
    {
    总_st_97=总_st_97 + "\n   Idle - Currently skipping the timeframe";
    }
   else
    {
    总_st_97=总_st_97 + "\n   Idle - Waiting for the trading timeframe";
  }}}
 子_st_1 = "" ;
 子_st_2 = "" ;
 if ( GMT_autocalc )
  {
  if ( 总_in_40 > 0 )
   {
   子_st_1 = " (GMT: +" + IntegerToString(总_in_40) + ")" ;
   }
  else
   {
   子_st_1 = " (GMT: " + IntegerToString(总_in_40) + ")" ;
  }}
 if ( 总_in_112 == 1 )
  {
  子_st_2 = "BASIC" ;
  }
 if ( 总_in_112 == 2 )
  {
  子_st_2 = "STANDARD/GOLD" ;
  }
 if ( 总_in_112 == 3 )
  {
  子_st_2 = "ULTIMATE" ;
  }
 临_st_23="\n\n  -----------------------------------------------\n  Forex Cyborg - vDarwinex\n  Version: " + 子_st_2 + "\n  -----------------------------------------------" + "\n\n   Trading session" + 子_st_1 + ":" + "\n   Open:   "; 
 临_st_24 = IntegerToString(总_in_70);
 if ( StringLen(IntegerToString(总_in_70))  == 1 )
  {
  临_st_24 = "000" + IntegerToString(总_in_70);
  }
 if ( StringLen(临_st_24)  == 2 )
  {
  临_st_24 = "00" + 临_st_24;
  }
 if ( StringLen(临_st_24)  == 3 )
  {
  临_st_24 = "0" + 临_st_24;
  }
 临_st_23=临_st_23 + StringSubstr(临_st_24,0,2) + ":" + StringSubstr(临_st_24,2,2) + "\n   Close:   "; 
 临_st_25 = IntegerToString(总_in_71);
 if ( StringLen(IntegerToString(总_in_71))  == 1 )
  {
  临_st_25 = "000" + IntegerToString(总_in_71);
  }
 if ( StringLen(临_st_25)  == 2 )
  {
  临_st_25 = "00" + 临_st_25;
  }
 if ( StringLen(临_st_25)  == 3 )
  {
  临_st_25 = "0" + 临_st_25;
  }
 子_st_3 = 临_st_23 + StringSubstr(临_st_25,0,2) + ":" + StringSubstr(临_st_25,2,2) + "\n  -----------------------------------------------" ;
 if ( 总_bo_5 )
  {
  临_st_26=子_st_3 + "\n   Skip Timeframe:" + "\n   Open:   "; 
  临_st_27 = IntegerToString(总_in_72);
  if ( StringLen(IntegerToString(总_in_72))  == 1 )
   {
   临_st_27 = "000" + IntegerToString(总_in_72);
   }
  if ( StringLen(临_st_27)  == 2 )
   {
   临_st_27 = "00" + 临_st_27;
   }
  if ( StringLen(临_st_27)  == 3 )
   {
   临_st_27 = "0" + 临_st_27;
   }
  临_st_26=临_st_26 + StringSubstr(临_st_27,0,2) + ":" + StringSubstr(临_st_27,2,2) + "\n   Close:   "; 
  临_st_28 = IntegerToString(总_in_73);
  if ( StringLen(IntegerToString(总_in_73))  == 1 )
   {
   临_st_28 = "000" + IntegerToString(总_in_73);
   }
  if ( StringLen(临_st_28)  == 2 )
   {
   临_st_28 = "00" + 临_st_28;
   }
  if ( StringLen(临_st_28)  == 3 )
   {
   临_st_28 = "0" + 临_st_28;
   }
  子_st_3 = 临_st_26 + StringSubstr(临_st_28,0,2) + ":" + StringSubstr(临_st_28,2,2) + "\n  -----------------------------------------------" ;
  }
 if ( 总_bo_2 )
  {
  子_st_3 = 子_st_3 + "\n\n   Use Presets: Yes";
  if ( ( StringFind(Symbol(),"AUDCAD",0) > -1 || StringFind(Symbol(),"AUDCHF",0) > -1 || StringFind(Symbol(),"AUDUSD",0) > -1 || StringFind(Symbol(),"CADCHF",0) > -1 || StringFind(Symbol(),"EURAUD",0) > -1 || StringFind(Symbol(),"EURCAD",0) > -1 || StringFind(Symbol(),"EURCHF",0) > -1 || StringFind(Symbol(),"EURGBP",0) > -1 || StringFind(Symbol(),"EURUSD",0) > -1 || StringFind(Symbol(),"GBPAUD",0) > -1 || StringFind(Symbol(),"GBPCAD",0) > -1 || StringFind(Symbol(),"GBPUSD",0) > -1 || StringFind(Symbol(),"USDCAD",0) > -1 || StringFind(Symbol(),"USDCHF",0) > -1 ) )
   {
   临_bo_21 = true;
   }
  else
   {
   临_bo_21 = false;
   }
  if ( 临_bo_21 )
   {
   子_st_3 = 子_st_3 + "\n   Presets available: Yes";
   }
  else
   {
   子_st_3 = 子_st_3 + "\n   Presets available: No";
  }}
 else
  {
  子_st_3 = 子_st_3 + "\n\n   Use Presets: No";
  }
 子_st_3 = 子_st_3 + "\n\n   Stop Loss: " + DoubleToString(总_in_43,1) + " pips" + "\n   Max Spread: " + DoubleToString(总_do_45,1) + " pips" + "\n   Current Spread: " + DoubleToString((Ask - Bid) / 总_do_89,1) + " pips" + "\n " + 总_st_94 + "\n " + 总_st_97 ;
 // Print(总_bo_111);
 if ( !(总_bo_111) )
  {
  子_st_3 = "\n\n  -----------------------------------------------\n  Forex Cyborg - v1.0\n  -----------------------------------------------\n\n  WRONG LICENCE KEY\n  EA is deactivated" ;
  }
 else
  {
  if ( 总_in_112 == 1 && !(总_bo_113) )
   {
   子_st_3 = "\n\n  -----------------------------------------------\n  Forex Cyborg - v1.0\n  -----------------------------------------------\n\n  Wrong pair\n  The BASIC - Version support:\n  AUDCAD, EURCAD, EURGBP, EURAUD,\n  EURUSD, GBPUSD and USDCHF\n\n  EA is deactivated" ;
   }
  if ( 总_in_112 == 2 && !(总_bo_114) )
   {
   子_st_3 = "\n\n  -----------------------------------------------\n  Forex Cyborg - v1.0\n  -----------------------------------------------\n\n  Wrong pair\n  Not supported in this version.\n\n  EA is deactivated" ;
  }}

 Comment(子_st_3); 
 }
//lizong_16
//---------------------  ----------------------------------------

 void lizong_17()
 {

//----------------------------
 bool       临_bo_1;

 总_do_53 = 总_do_23 ;
 if ( 总_bo_2 )
  {
  if ( ( StringFind(Symbol(),"AUDCAD",0) > -1 || StringFind(Symbol(),"AUDCHF",0) > -1 || StringFind(Symbol(),"AUDUSD",0) > -1 || StringFind(Symbol(),"CADCHF",0) > -1 || StringFind(Symbol(),"EURAUD",0) > -1 || StringFind(Symbol(),"EURCAD",0) > -1 || StringFind(Symbol(),"EURCHF",0) > -1 || StringFind(Symbol(),"EURGBP",0) > -1 || StringFind(Symbol(),"EURUSD",0) > -1 || StringFind(Symbol(),"GBPAUD",0) > -1 || StringFind(Symbol(),"GBPCAD",0) > -1 || StringFind(Symbol(),"GBPUSD",0) > -1 || StringFind(Symbol(),"USDCAD",0) > -1 || StringFind(Symbol(),"USDCHF",0) > -1 ) )
   {
   临_bo_1 = true;
   }
  else
   {
   临_bo_1 = false;
   }
  if ( 临_bo_1 )
   {
   if ( StringFind(Symbol(),"AUDCAD",0) > -1 )
    {
    总_in_41 = 2000 ;
    总_in_42 = 2230 ;
    总_in_43 = 70 ;
    总_in_44 = 90 ;
    总_do_45 = 4.0 ;
    总_in_46 = 15 ;
    总_in_49 = 100 ;
    总_in_50 = 145 ;
    总_in_51 = 16 ;
    总_do_52 = 2.0 ;
    总_do_54 = 22.0 ;
    总_bo_55 = true ;
    总_bo_58 = true ;
    总_bo_59 = true ;
    总_bo_61 = true ;
    总_bo_64 = false ;
    总_do_62 = 21.0 ;
    总_do_63 = 11.0 ;
    总_in_65 = 5 ;
    总_in_60 = 180 ;
    总_in_56 = 250 ;
    总_in_57 = -300 ;
    总_in_47 = 22 ;
    总_in_48 = 6 ;
    总_do_66 = 150.0 ;
    总_do_67 = -5.0 ;
    总_do_68 = -5.0 ;
    总_in_69 = 5 ;
    if ( PresetType == 1 )
     {
     总_in_43 = 80 ;
     总_do_62 = -15.0 ;
     总_do_63 = -15.0 ;
    }}
   if ( StringFind(Symbol(),"AUDCHF",0) > -1 )
    {
    总_in_41 = 2100 ;
    总_in_42 = 2230 ;
    总_in_43 = 70 ;
    总_in_44 = 90 ;
    总_do_45 = 6.0 ;
    总_in_46 = 15 ;
    总_in_49 = 75 ;
    总_in_50 = 155 ;
    总_in_51 = 14 ;
    总_do_52 = 2.1 ;
    总_do_54 = 21.0 ;
    总_bo_55 = true ;
    总_bo_58 = false ;
    总_bo_59 = true ;
    总_bo_61 = true ;
    总_bo_64 = true ;
    总_do_62 = 10.0 ;
    总_do_63 = -3.0 ;
    总_in_65 = 11 ;
    总_in_60 = 240 ;
    总_in_56 = 250 ;
    总_in_57 = -300 ;
    总_in_47 = 22 ;
    总_in_48 = 6 ;
    总_do_66 = 0.0 ;
    总_do_67 = 0.0 ;
    总_do_68 = 0.0 ;
    总_in_69 = 5 ;
    if ( PresetType == 1 )
     {
     总_in_41 = 2115 ;
     总_in_42 = 2215 ;
     总_in_49 = 100 ;
     总_in_50 = 140 ;
     总_do_62 = -20.0 ;
     总_do_63 = -20.0 ;
    }}
   if ( StringFind(Symbol(),"AUDUSD",0) > -1 )
    {
    总_in_41 = 2000 ;
    总_in_42 = 2230 ;
    总_in_43 = 80 ;
    总_in_44 = 120 ;
    总_do_45 = 4.0 ;
    总_in_46 = 15 ;
    总_in_49 = 150 ;
    总_in_50 = 140 ;
    总_in_51 = 16 ;
    总_do_52 = 2.0 ;
    总_do_54 = 21.0 ;
    总_bo_55 = true ;
    总_bo_58 = true ;
    总_bo_59 = true ;
    总_bo_61 = true ;
    总_bo_64 = false ;
    总_do_62 = 25.0 ;
    总_do_63 = -3.0 ;
    总_in_65 = 5 ;
    总_in_60 = 120 ;
    总_in_56 = 250 ;
    总_in_57 = -250 ;
    总_in_47 = 21 ;
    总_in_48 = 6 ;
    总_do_66 = 100.0 ;
    总_do_67 = -10.0 ;
    总_do_68 = -5.0 ;
    总_in_69 = 5 ;
    if ( PresetType == 1 )
     {
     总_in_41 = 2030 ;
     总_in_49 = 160 ;
     总_do_62 = -10.0 ;
     总_do_63 = -10.0 ;
    }}
   if ( StringFind(Symbol(),"CADCHF",0) > -1 )
    {
    总_in_41 = 2000 ;
    总_in_42 = 2330 ;
    总_in_43 = 60 ;
    总_in_44 = 60 ;
    总_do_45 = 5.0 ;
    总_in_46 = 15 ;
    总_in_49 = 100 ;
    总_in_50 = 120 ;
    总_in_51 = 14 ;
    总_do_52 = 3.5 ;
    总_do_54 = 17.0 ;
    总_bo_55 = false ;
    总_bo_58 = true ;
    总_bo_59 = true ;
    总_bo_61 = true ;
    总_bo_64 = true ;
    总_do_62 = -5.0 ;
    总_do_63 = 2.0 ;
    总_in_65 = 12 ;
    总_in_60 = 240 ;
    总_in_56 = 250 ;
    总_in_57 = -250 ;
    总_in_47 = 22 ;
    总_in_48 = 6 ;
    总_do_66 = 150.0 ;
    总_do_67 = -10.0 ;
    总_do_68 = 0.0 ;
    总_in_69 = 5 ;
    if ( PresetType == 1 )
     {
     总_do_62 = -8.0 ;
     总_do_63 = -8.0 ;
    }}
   if ( StringFind(Symbol(),"EURAUD",0) > -1 )
    {
    总_in_41 = 1915 ;
    总_in_42 = 2215 ;
    总_in_43 = 90 ;
    总_in_44 = 90 ;
    总_do_45 = 6.0 ;
    总_in_46 = 15 ;
    总_in_49 = 75 ;
    总_in_50 = 170 ;
    总_in_51 = 13 ;
    总_do_52 = 2.3 ;
    总_do_54 = 20.0 ;
    总_bo_55 = true ;
    总_bo_58 = true ;
    总_bo_59 = false ;
    总_bo_61 = true ;
    总_bo_64 = false ;
    总_do_62 = 10.0 ;
    总_do_63 = -5.0 ;
    总_in_65 = 10 ;
    总_in_60 = 240 ;
    总_in_56 = 250 ;
    总_in_57 = -300 ;
    总_in_47 = 22 ;
    总_in_48 = 6 ;
    总_do_66 = 100.0 ;
    总_do_67 = -15.0 ;
    总_do_68 = -5.0 ;
    总_in_69 = 5 ;
    if ( PresetType == 1 )
     {
     总_in_41 = 2015 ;
     总_in_43 = 105 ;
     总_in_50 = 135 ;
     总_do_62 = -5.0 ;
    }}
   if ( StringFind(Symbol(),"EURCAD",0) > -1 )
    {
    总_in_41 = 2015 ;
    总_in_42 = 2215 ;
    总_in_43 = 120 ;
    总_in_44 = 180 ;
    总_do_45 = 6.0 ;
    总_in_46 = 15 ;
    总_in_49 = 100 ;
    总_in_50 = 180 ;
    总_in_51 = 12 ;
    总_do_52 = 2.3 ;
    总_do_54 = 22.0 ;
    总_bo_55 = true ;
    总_bo_58 = true ;
    总_bo_59 = false ;
    总_bo_61 = true ;
    总_bo_64 = false ;
    总_do_62 = 30.0 ;
    总_do_63 = 6.0 ;
    总_in_65 = 10 ;
    总_in_60 = 240 ;
    总_in_56 = 250 ;
    总_in_57 = -300 ;
    总_in_47 = 22 ;
    总_in_48 = 6 ;
    总_do_66 = 0.0 ;
    总_do_67 = 0.0 ;
    总_do_68 = 0.0 ;
    总_in_69 = 5 ;
    if ( PresetType == 1 )
     {
     总_in_42 = 2120 ;
     总_in_43 = 100 ;
     总_in_50 = 130 ;
     总_do_62 = -2.0 ;
     总_do_63 = -2.0 ;
    }}
   if ( StringFind(Symbol(),"EURCHF",0) > -1 )
    {
    总_in_41 = 2000 ;
    总_in_42 = 2330 ;
    总_in_43 = 50 ;
    总_in_44 = 120 ;
    总_do_45 = 5.0 ;
    总_in_46 = 15 ;
    总_in_49 = 100 ;
    总_in_50 = 145 ;
    总_in_51 = 13 ;
    总_do_52 = 2.0 ;
    总_do_54 = 15.0 ;
    总_bo_55 = true ;
    总_bo_58 = true ;
    总_bo_59 = true ;
    总_bo_61 = true ;
    总_bo_64 = true ;
    总_do_62 = 25.0 ;
    总_do_63 = 10.0 ;
    总_in_65 = 11 ;
    总_in_60 = 120 ;
    总_in_56 = 250 ;
    总_in_57 = -225 ;
    总_in_47 = 22 ;
    总_in_48 = 5 ;
    总_do_66 = 100.0 ;
    总_do_67 = -5.0 ;
    总_do_68 = -5.0 ;
    总_in_69 = 5 ;
    if ( PresetType == 1 )
     {
     总_in_43 = 75 ;
     总_in_50 = 80 ;
     总_do_54 = 13.0 ;
     总_do_62 = -1.0 ;
     总_do_63 = -1.0 ;
     总_do_66 = 50.0 ;
     总_do_67 = -15.0 ;
    }}
   if ( StringFind(Symbol(),"EURGBP",0) > -1 )
    {
    总_in_41 = 2015 ;
    总_in_42 = 2145 ;
    总_in_43 = 70 ;
    总_in_44 = 30 ;
    总_do_45 = 6.0 ;
    总_in_46 = 15 ;
    总_in_49 = 200 ;
    总_in_50 = 100 ;
    总_in_51 = 17 ;
    总_do_52 = 2.0 ;
    总_do_54 = 19.0 ;
    总_bo_55 = true ;
    总_bo_58 = true ;
    总_bo_59 = true ;
    总_bo_61 = true ;
    总_bo_64 = false ;
    总_do_62 = 20.0 ;
    总_do_63 = 15.0 ;
    总_in_65 = 15 ;
    总_in_60 = 210 ;
    总_in_56 = 325 ;
    总_in_57 = -375 ;
    总_in_47 = 24 ;
    总_in_48 = 5 ;
    总_do_66 = 150.0 ;
    总_do_67 = -5.0 ;
    总_do_68 = -5.0 ;
    总_in_69 = 5 ;
    if ( PresetType == 1 )
     {
     总_do_62 = 2.0 ;
     总_do_63 = 2.0 ;
    }}
   if ( StringFind(Symbol(),"EURUSD",0) > -1 )
    {
    总_in_41 = 2045 ;
    总_in_42 = 2330 ;
    总_in_43 = 70 ;
    总_in_44 = 120 ;
    总_do_45 = 4.0 ;
    总_in_46 = 15 ;
    总_in_49 = 125 ;
    总_in_50 = 110 ;
    总_in_51 = 16 ;
    总_do_52 = 2.0 ;
    总_do_54 = 20.0 ;
    总_bo_55 = true ;
    总_bo_58 = true ;
    总_bo_59 = true ;
    总_bo_61 = true ;
    总_bo_64 = false ;
    总_do_62 = 30.0 ;
    总_do_63 = 10.0 ;
    总_in_65 = 12 ;
    总_in_60 = 180 ;
    总_in_56 = 300 ;
    总_in_57 = -350 ;
    总_in_47 = 22 ;
    总_in_48 = 6 ;
    总_do_66 = 100.0 ;
    总_do_67 = -10.0 ;
    总_do_68 = -5.0 ;
    总_in_69 = 5 ;
    if ( PresetType == 1 )
     {
     总_in_42 = 2155 ;
     总_in_50 = 85 ;
     总_do_62 = -10.0 ;
     总_do_63 = -10.0 ;
    }}
   if ( StringFind(Symbol(),"GBPAUD",0) > -1 )
    {
    总_in_41 = 1830 ;
    总_in_42 = 2100 ;
    总_in_43 = 120 ;
    总_in_44 = 90 ;
    总_do_45 = 8.0 ;
    总_in_46 = 15 ;
    总_in_49 = 100 ;
    总_in_50 = 190 ;
    总_in_51 = 13 ;
    总_do_52 = 2.3 ;
    总_do_54 = 19.0 ;
    总_bo_55 = true ;
    总_bo_58 = true ;
    总_bo_59 = false ;
    总_bo_61 = true ;
    总_bo_64 = true ;
    总_do_62 = 4.0 ;
    总_do_63 = -1.0 ;
    总_in_65 = 15 ;
    总_in_60 = 300 ;
    总_in_56 = 275 ;
    总_in_57 = -225 ;
    总_in_47 = 22 ;
    总_in_48 = 6 ;
    总_do_66 = 150.0 ;
    总_do_67 = -10.0 ;
    总_do_68 = -5.0 ;
    总_in_69 = 5 ;
    if ( PresetType == 1 )
     {
     总_in_41 = 2015 ;
     总_in_50 = 120 ;
     总_in_51 = 12 ;
     总_do_54 = 18.0 ;
     总_do_62 = -13.0 ;
     总_do_63 = -13.0 ;
    }}
   if ( StringFind(Symbol(),"GBPCAD",0) > -1 )
    {
    总_in_41 = 2000 ;
    总_in_42 = 2130 ;
    总_in_43 = 100 ;
    总_in_44 = 150 ;
    总_do_45 = 5.0 ;
    总_in_46 = 15 ;
    总_in_49 = 50 ;
    总_in_50 = 220 ;
    总_in_51 = 13 ;
    总_do_52 = 2.8 ;
    总_do_54 = 17.0 ;
    总_bo_55 = true ;
    总_bo_58 = true ;
    总_bo_59 = false ;
    总_bo_61 = true ;
    总_bo_64 = false ;
    总_do_62 = 0.0 ;
    总_do_63 = 15.0 ;
    总_in_65 = 10 ;
    总_in_60 = 240 ;
    总_in_56 = 350 ;
    总_in_57 = -300 ;
    总_in_47 = 22 ;
    总_in_48 = 6 ;
    总_do_66 = 200.0 ;
    总_do_67 = -5.0 ;
    总_do_68 = -5.0 ;
    总_in_69 = 5 ;
    if ( PresetType == 1 )
     {
     总_in_41 = 2030 ;
     总_in_50 = 150 ;
     总_do_62 = -1.0 ;
     总_do_63 = -1.0 ;
    }}
   if ( StringFind(Symbol(),"GBPUSD",0) > -1 )
    {
    总_in_41 = 2100 ;
    总_in_42 = 2300 ;
    总_in_43 = 80 ;
    总_in_44 = 40 ;
    总_do_45 = 7.0 ;
    总_in_46 = 15 ;
    总_in_49 = 150 ;
    总_in_50 = 210 ;
    总_in_51 = 17 ;
    总_do_52 = 2.0 ;
    总_do_54 = 20.0 ;
    总_bo_55 = true ;
    总_bo_58 = true ;
    总_bo_59 = true ;
    总_bo_61 = true ;
    总_bo_64 = false ;
    总_do_62 = 5.0 ;
    总_do_63 = 25.0 ;
    总_in_65 = 10 ;
    总_in_60 = 180 ;
    总_in_56 = 300 ;
    总_in_57 = -350 ;
    总_in_47 = 24 ;
    总_in_48 = 6 ;
    总_do_66 = 100.0 ;
    总_do_67 = -10.0 ;
    总_do_68 = -5.0 ;
    总_in_69 = 5 ;
    if ( PresetType == 1 )
     {
     总_in_41 = 2115 ;
     总_in_43 = 160 ;
     总_in_50 = 150 ;
     总_do_62 = -9.0 ;
     总_do_63 = -9.0 ;
    }}
   if ( StringFind(Symbol(),"USDCAD",0) > -1 )
    {
    总_in_41 = 2000 ;
    总_in_42 = 2145 ;
    总_in_43 = 110 ;
    总_in_44 = 120 ;
    总_do_45 = 4.0 ;
    总_in_46 = 15 ;
    总_in_49 = 100 ;
    总_in_50 = 190 ;
    总_in_51 = 12 ;
    总_do_52 = 2.3 ;
    总_do_54 = 21.0 ;
    总_bo_55 = true ;
    总_bo_58 = true ;
    总_bo_59 = false ;
    总_bo_61 = false ;
    总_bo_64 = false ;
    总_do_62 = 5.0 ;
    总_do_63 = 35.0 ;
    总_in_65 = 10 ;
    总_in_60 = 150 ;
    总_in_56 = 250 ;
    总_in_57 = -300 ;
    总_in_47 = 22 ;
    总_in_48 = 6 ;
    总_do_66 = 50.0 ;
    总_do_67 = -10.0 ;
    总_do_68 = -5.0 ;
    总_in_69 = 5 ;
    if ( PresetType == 1 )
     {
     总_in_50 = 90 ;
     总_bo_61 = true ;
     总_do_62 = 2.0 ;
     总_do_63 = 2.0 ;
    }}
   if (!(StringFind(Symbol(),"USDCHF",0) > -1) )  return;
   总_in_41 = 2030 ;
   总_in_42 = 2200 ;
   总_in_43 = 50 ;
   总_in_44 = 90 ;
   总_do_45 = 7.0 ;
   总_in_46 = 15 ;
   总_in_49 = 140 ;
   总_in_50 = 160 ;
   总_in_51 = 14 ;
   总_do_52 = 2.1 ;
   总_do_54 = 16.0 ;
   总_bo_55 = true ;
   总_bo_58 = false ;
   总_bo_59 = true ;
   总_bo_61 = true ;
   总_bo_64 = false ;
   总_do_62 = 12.0 ;
   总_do_63 = -14.0 ;
   总_in_65 = 10 ;
   总_in_60 = 240 ;
   总_in_56 = 400 ;
   总_in_57 = -350 ;
   总_in_47 = 21 ;
   总_in_48 = 5 ;
   总_do_66 = 150.0 ;
   总_do_67 = -10.0 ;
   总_do_68 = -5.0 ;
   总_in_69 = 5 ;
   if (!(PresetType == 1) )  return;
   总_in_41 = 2115 ;
   总_in_43 = 70 ;
   总_in_50 = 110 ;
   return;
  }}
 总_in_41 = 总_in_11 ;
 总_in_42 = 总_in_12 ;
 总_in_43 = 总_in_13 ;
 总_in_44 = 总_in_14 ;
 总_do_45 = 总_do_15 ;
 总_in_46 = 总_in_16 ;
 总_in_47 = 总_in_17 ;
 总_in_48 = 总_in_18 ;
 总_in_49 = 总_in_19 ;
 总_in_50 = 总_in_20 ;
 总_in_51 = 总_in_21 ;
 总_do_52 = 总_do_22 ;
 总_do_54 = 总_do_24 ;
 总_bo_55 = 总_bo_25 ;
 总_in_56 = 总_in_26 ;
 总_in_57 = 总_in_27 ;
 总_bo_58 = 总_bo_28 ;
 总_bo_59 = 总_bo_29 ;
 总_in_60 = 总_in_30 ;
 总_bo_61 = 总_bo_31 ;
 总_do_62 = 总_do_32 ;
 总_do_63 = 总_do_33 ;
 总_bo_64 = 总_bo_34 ;
 总_in_65 = 总_in_35 ;
 总_do_66 = 总_do_36 ;
 总_do_67 = 总_do_37 ;
 总_do_68 = 总_do_38 ;
 总_in_69 = 总_in_39 ;
 }
//lizong_17
//---------------------  ----------------------------------------

