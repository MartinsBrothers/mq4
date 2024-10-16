//+------------------------------------------------------------------+
//|                                                       TopBottomEA.mq4 |
//|                        Copyright 2022, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright ""
#property version "1.31"
#property link ""

#property description "         The advantages of TopBottomEA: the first EA to support"
#property description " the work of small capital, real trading for more than 4 years;"
#property description "this EA is based on volatility adaptive mechanism, only one sing"
#property description "le at a time, each single with a stop loss, an average of about"
#property description "4 single per day, holding a single length of about 12 hours, usi"
#property description "ng Dukascopy real historical data, with $20 limit capital challe"
#property description "nge back test run through more than 10 years"

extern double Lots = 0.1;                   // 6B594B0
extern bool Compoundinterestswitch = false; // byte_6B594B8
extern int Risk = 40;                       // 6B594C0
extern bool ParameterSwitching = false;     // byte_6B594C8
extern int Volatility = 110;                // 6B594D0
extern int StopLoss = 800;                  // 6B594D8
extern int Profit = 300;                    // 6B594E0
extern double Pointdifferencelimit = 50.0;  // 6B594E8
extern bool Displayswitch = false;          // 6B594F0
extern int Magic = 888999;                  // 6B594F8
extern string CommentName = "TopBottomEA";  // 6B59500

double qword_6B59510 = 1000000; // 6B59510
double  qword_6B58FB0=Point();
int dword_6B59520 = 1000;
int dword_6B59524 = 150;
int dword_6B59528 = 5;
int dword_6B5952C = 5;
int dword_6B59530 = 20;
int dword_6B59534 = 24;
int dword_6B59538 = 0;
int dword_6B5953C = 3;
int dword_6B59540 = 30;
bool byte_6B59544 = 1;
int qword_6B59548 = 0;
int qword_6B59550 = 0;
int qword_6B59558 = 0;
int qword_6B59560 = 0;
int dword_6B59568 = 0;
int dword_6B5956C = 0;
int dword_6B59570 = 0;
double  qword_6B59578 = 0;
int qword_6B59580 = 0;
int dword_6B59588 = 0;
int qword_6B59590 = 0;
int dword_6B59598 = 0;
int dword_6B5959C = 0;
int dword_6B595A0 = 0;
int dword_6B595A4 = 0;
int dword_6B595A8 = 0;
int dword_6B595AC = 0;
int qword_6B595B0 = 0;
int qword_6B595B8 = 0;
int qword_6B595C0 = 0;
int qword_6B595C8 = 0;
double dbl_6B595D0 = 0.0;
double dbl_6B595D8 = 0.0;
double dword_6B595E0 = 0;
double dword_6B595E4 = 0;
double dword_6B595E8 = 0;
double dword_6B595EC = 0;
double dword_6B595F0 = 0;
double dword_6B595F4 = 0;
double qword_6B595F8 = 0;
double qword_6B59600 = 0;
double qword_6B59608 = 0;
double qword_6B59610 = 0;
double qword_6B59618 = 0;
int qword_6B59620 = 0;
int dword_6B59628 = 0;
int dword_6B5962C = 0;
int dword_6B59630 = 0;
int dword_6B59634 = 0;
int dword_6B59638 = 0;
int dword_6B5963C = 0;
int dword_6B59640 = 0;
int dword_6B59644 = 0;
int dword_6B59648 = 0;
int dword_6B5964C = 0;
int dword_6B59650 = 0;
int dword_6B59658 = 0;
int dword_6B5965C = 0;
int qword_6B59660 = 0;
int dword_6B59668 = 0;
int dword_6B5966C = 0;
int qword_6B59670 = 0;
int dword_6B59678 = 0;
int dword_6B5967C = 0;
int dword_6B59680 = 0;
int dword_6B59684 = 0;
int dword_6B59688 = 0;
int dword_6B5968C = 0;
int qword_6B59690 = 0;
int qword_6B59698 = 0;
int dword_6B596A0 = 0;
int dword_6B596A4 = 0;
int dword_6B596A8 = 0;
int dword_6B596AC = 0;
int dword_6B596B0 = 0;
int dword_6B596B4 = 0;
int dword_6B596B8 = 0;
int dword_6B596BC = 0;
int dword_6B596C0 = 0;
int dword_6B596C4 = 0;
int dword_6B596C8 = 0;
int dword_6B596CC = 0;
int dword_6B596D0 = 0;
int dword_6B596D4 = 0;
bool byte_6B596D8 = 1;
bool byte_6B596D9 = 1;
bool byte_6B596DA = 1;
int dword_6B596DC = 0;
bool byte_6B596E0 = 0;
bool byte_6B596E1 = 0;
int dword_6B596E4 = 0;
int dword_6B596E8 = 0;
int dword_6B596EC = 0;
int dword_6B596F0 = 0;
int dword_6B596F4 = 0;
int dword_6B596F8 = 0;
int dword_6B596FC = 0;
int dword_6B59700 = 0;
int dword_6B59704 = 0;
int dword_6B59708 = 0;
int dword_6B5970C = 0;

int dword_6B58FA8;

int dword_6B59710 = Volatility;
int dword_6B59714 = StopLoss;
// result = int Profit;
int dword_6B59718 = Profit;

int dword_6B5971C = 1000;
int dword_6B59720 = 150;
double dbl_6B59728 = 0.0;

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
{
    //---

    string v1;  // [esp+8h] [ebp-174h] BYREF
    string v2;  // [esp+14h] [ebp-168h] BYREF
    string v3;  // [esp+20h] [ebp-15Ch] BYREF
    string v4;  // [esp+2Ch] [ebp-150h] BYREF
    string v5;  // [esp+38h] [ebp-144h] BYREF
    string v6;  // [esp+44h] [ebp-138h] BYREF
    string v7;  // [esp+50h] [ebp-12Ch] BYREF
    string v8;  // [esp+5Ch] [ebp-120h] BYREF
    string v9;  // [esp+68h] [ebp-114h] BYREF
    string v10; // [esp+74h] [ebp-108h] BYREF
    string v11; // [esp+80h] [ebp-FCh] BYREF
    string v12; // [esp+8Ch] [ebp-F0h] BYREF
    string v13; // [esp+98h] [ebp-E4h] BYREF
    string v14; // [esp+A4h] [ebp-D8h] BYREF
    string v15; // [esp+B0h] [ebp-CCh] BYREF
    string v16; // [esp+BCh] [ebp-C0h] BYREF
    string v17; // [esp+C8h] [ebp-B4h] BYREF
    string v18; // [esp+D4h] [ebp-A8h] BYREF
    string v19; // [esp+E0h] [ebp-9Ch] BYREF
    string v20; // [esp+ECh] [ebp-90h] BYREF
    string v21; // [esp+F8h] [ebp-84h] BYREF
    string v22; // [esp+104h] [ebp-78h] BYREF
    string v23; // [esp+110h] [ebp-6Ch] BYREF
    string v24; // [esp+11Ch] [ebp-60h] BYREF
    string v25; // [esp+128h] [ebp-54h] BYREF
    int v26;    // [esp+138h] [ebp-44h]
    int v27;    // [esp+13Ch] [ebp-40h]
    int v28;    // [esp+140h] [ebp-3Ch]
    string v29; // [esp+148h] [ebp-34h]
    string v30; // [esp+149h] [ebp-33h]
    string v31; // [esp+14Ah] [ebp-32h]
    string v32; // [esp+14Bh] [ebp-31h]
    int v33;    // [esp+14Ch] [ebp-30h]
    int v34;    // [esp+150h] [ebp-2Ch]
    int v35;    // [esp+154h] [ebp-28h]
    int v36;    // [esp+158h] [ebp-24h]
    string v37; // [esp+15Ch] [ebp-20h] BYREF
    int v38;    // [esp+168h] [ebp-14h]
    string v39; // [esp+16Ch] [ebp-10h] BYREF
    int v40;    // [esp+178h] [ebp-4h]

    v39 = "TradeButton";
    v38 = 0;

    v37 = "Arial";
    v36 = 10;
    v35 = 0xFAE6E6;
    v34 = 0x575757;
    v33 = 0x696969;
    v32 = 0;
    v31 = 0;
    v30 = 0;
    v29 = 0;
    v27 = 0;
    v28 = 0;
    v26 = 0x575757;

    qword_6B59590 = MarketInfo(0, 13); // 返回最后 报价时间整数

    /*

     if ( Displayswitch == 1 )
     {
       sub_554698E(0, 0, 84520750, 0, 25, 15, 150, 60, 0, 84520770, v37, 10, 16443110, 3947580, 0, 0, 0, 0, 0, 0, 0);
       sub_554698E(0, 0, 84520790, 0, 175, 15, 150, 60, 0, 84520770, v37, 10, 16443110, 3947580, 0, 0, 0, 0, 0, 0, 0);
       sub_554698E(0, 0, 84520810, 0, 325, 15, 150, 60, 0, 84520770, v37, 10, 16443110, 3947580, 0, 0, 0, 0, 0, 0, 0);
       DoubleToString(qword_6B595B8, 2);


   v25="SellLots : "


      // sub_173B880(v25, dword_6B58FD4);

   v24="";
       v23="FEIGE_SellLots";
       dword_6B58FA8 = 0;

     //  Print(, 274, 6, 5570565, 0, 0, 5832712, v23, 5373956, 23, 5373956, 0, 5373957, 0, 0, 5373959, 0, 0);

       ObjectSetInteger(0, v23, 102, 30, 0);
       ObjectSetInteger(0, v23, 103, 25, 0);
       ObjectSetInteger(0, v23, 101, 0, 0);
       ObjectSetString(0, v23, 999, v25);
       ObjectSetString(0, v23, 1001, v24);
       ObjectSetInteger(0, v23, 100, 11, 0);
       ObjectSetDouble(0, 0, v23, 13, 0);
       ObjectSetInteger(0, v23, 1011, 0, 0);
       ObjectSetInteger(0, v23, 6, 2139610, 0);
       ObjectSetInteger(0, v23, 9, 0, 0);
       ObjectSetInteger(0, v23, 1000, 0, 0);
       ObjectSetInteger(0, v23, 17, 0, 0);
       ObjectSetInteger(0, v23, 208, 0, 0);
       ObjectSetInteger(0, v23, 207, 0, 0);
       DoubleToString(qword_6B595B0, 2);

   /*
   sub_173C190(0, 84520890, v22);

   sub_173B880(v22, dword_6B58FD4);

       sub_173C190(0, v22, v22);
       sub_173C190(0, 84520770, v21);
       sub_173C190(0, 84520870, v20);


    dword_6B58FA8 = 0;

   //Print(, 274, 6, 5570565, 0, 0, 5832712, v20, 5373956, 23, 5373956, 0, 5373957, 0, 0, 5373959, 0, 0);

       ObjectSetInteger(0, v20, 102, 30, 0);
       ObjectSetInteger(0, v20, 103, 50, 0);
       ObjectSetInteger(0, v20, 101, 0, 0);
       ObjectSetString(0, v20, 999, v22);
       ObjectSetString(0, v20, 1001, v21);
       ObjectSetInteger(0, v20, 100, 11, 0);
       ObjectSetDouble(0, 0, v20, 13, 0);
       ObjectSetInteger(0, v20, 1011, 0, 0);
       ObjectSetInteger(0, v20, 6, 2139610, 0);
       ObjectSetInteger(0, v20, 9, 0, 0);
       ObjectSetInteger(0, v20, 1000, 0, 0);
       ObjectSetInteger(0, v20, 17, 0, 0);
       ObjectSetInteger(0, v20, 208, 0, 0);
       ObjectSetInteger(0, v20, 207, 0, 0);

   v19="SellProfit : ";
   v18="";
   v17="FEIGE_BuyLots";
          dword_6B58FA8 = 0;
     //  Print(, 274, 6, 5570565, 0, 0, 5832712, v17, 5373956, 23, 5373956, 0, 5373957, 0, 0, 5373959, 0, 0);

   ObjectSetInteger(0, v17, 102, 180, 0);
       ObjectSetInteger(0, v17, 103, 25, 0);
       ObjectSetInteger(0, v17, 101, 0, 0);
       ObjectSetString(0, v17, 999, v19);
       ObjectSetString(0, v17, 1001, v18);
       ObjectSetInteger(0, v17, 100, 11, 0);
       ObjectSetDouble(0, 0, v17, 13, 0);
       ObjectSetInteger(0, v17, 1011, 0, 0);
       ObjectSetInteger(0, v17, 6, 16760576, 0);
       ObjectSetInteger(0, v17, 9, 0, 0);
       ObjectSetInteger(0, v17, 1000, 0, 0);
       ObjectSetInteger(0, v17, 17, 0, 0);
       ObjectSetInteger(0, v17, 208, 0, 0);
       ObjectSetInteger(0, v17, 207, 0, 0);
       sub_173C190(0, 84520970, v16);
       sub_173C190(0, 84520770, v15);
       sub_173C190(0, 84520950, v14);
       dword_6B58FA8 = 0;
       Print(, 274, 6, 5570565, 0, 0, 5832712, v14, 5373956, 23, 5373956, 0, 5373957, 0, 0, 5373959, 0, 0);
       ObjectSetInteger(0, v14, 102, 180, 0);
       ObjectSetInteger(0, v14, 103, 50, 0);
       ObjectSetInteger(0, v14, 101, 0, 0);
       ObjectSetString(0, v14, 999, v16);
       ObjectSetString(0, v14, 1001, v15);
       ObjectSetInteger(0, v14, 100, 11, 0);
       ObjectSetDouble(0, 0, v14, 13, 0);
       ObjectSetInteger(0, v14, 1011, 0, 0);
       ObjectSetInteger(0, v14, 6, 16760576, 0);
       ObjectSetInteger(0, v14, 9, 0, 0);
       ObjectSetInteger(0, v14, 1000, 0, 0);
       ObjectSetInteger(0, v14, 17, 0, 0);
       ObjectSetInteger(0, v14, 208, 0, 0);
       ObjectSetInteger(0, v14, 207, 0, 0);

   v13="0.00";
   v12="";
    v11="FEIGE_SellProfit1";

       dword_6B58FA8 = 0;
    //   Print(, 274, 6, 5570565, 0, 0, 5832712, v11, 5373956, 23, 5373956, 0, 5373957, 0, 0, 5373959, 0, 0);
       ObjectSetInteger(0, v11, 102, 260, 0);
       ObjectSetInteger(0, v11, 103, 25, 0);
       ObjectSetInteger(0, v11, 101, 0, 0);
       ObjectSetString(0, v11, 999, v13);
       ObjectSetString(0, v11, 1001, v12);
       ObjectSetInteger(0, v11, 100, 11, 0);
       ObjectSetDouble(0, 0, v11, 13, 0);
       ObjectSetInteger(0, v11, 1011, 0, 0);
       ObjectSetInteger(0, v11, 6, 0xFFFFFF, 0);
       ObjectSetInteger(0, v11, 9, 0, 0);
       ObjectSetInteger(0, v11, 1000, 0, 0);
       ObjectSetInteger(0, v11, 17, 0, 0);
       ObjectSetInteger(0, v11, 208, 0, 0);
       ObjectSetInteger(0, v11, 207, 0, 0);
       sub_173C190(0, 84521010, v10);
       sub_173C190(0, 84520770, v9);
       sub_173C190(0, 84521030, v8);
       dword_6B58FA8 = 0;
     //  Print(, 274, 6, 5570565, 0, 0, 5832712, v8, 5373956, 23, 5373956, 0, 5373957, 0, 0, 5373959, 0, 0);
       ObjectSetInteger(0, v8, 102, 260, 0);
       ObjectSetInteger(0, v8, 103, 50, 0);
       ObjectSetInteger(0, v8, 101, 0, 0);
       ObjectSetString(0, v8, 999, v10);
       ObjectSetString(0, v8, 1001, v9);
       ObjectSetInteger(0, v8, 100, 11, 0);
       ObjectSetDouble(0, 0, v8, 13, 0i64);
       ObjectSetInteger(0, v8, 1011, 0, 0);
       ObjectSetInteger(0, v8, 6, 0xFFFFFF, 0);
       ObjectSetInteger(0, v8, 9, 0, 0);
       ObjectSetInteger(0, v8, 1000, 0, 0);
       ObjectSetInteger(0, v8, 17, 0, 0);
       ObjectSetInteger(0, v8, 208, 0, 0);
       ObjectSetInteger(0, v8, 207, 0, 0);
       /*
   sub_173C190(0, 84521070, v7);
       sub_173C190(0, 84520770, v6);
       sub_173C190(0, 84521050, v5);


       dword_6B58FA8 = 0;
     //  Print(, 274, 6, 5570565, 0, 0, 5832712, v5, 5373956, 23, 5373956, 0, 5373957, 0, 0, 5373959, 0, 0);
       ObjectSetInteger(0, v5, 102, 360, 0);
       ObjectSetInteger(0, v5, 103, 25, 0);
       ObjectSetInteger(0, v5, 101, 0, 0);
       ObjectSetString(0, v5, 999, v7);
       ObjectSetString(0, v5, 1001, v6);
       ObjectSetInteger(0, v5, 100, 11, 0);
       ObjectSetDouble(0, 0, v5, 13, 0);
       ObjectSetInteger(0, v5, 1011, 0, 0);
       ObjectSetInteger(0, v5, 6, 255, 0);
       ObjectSetInteger(0, v5, 9, 0, 0);
       ObjectSetInteger(0, v5, 1000, 0, 0);
       ObjectSetInteger(0, v5, 17, 0, 0);
       ObjectSetInteger(0, v5, 208, 0, 0);
       ObjectSetInteger(0, v5, 207, 0, 0);
       DoubleToString(qword_6B59590, 0);
       sub_173C190(1, dword_6B58FD4, v4);
       sub_173C190(0, 84520770, v3);
       sub_173C190(0, 84521090, v2);


       dword_6B58FA8 = 0;
    //   Print(, 274, 6, 5570565, 0, 0, 5832712, v2, 0x520004, 23, 0x520004, 0, 0x520005, 0, 0, 5373959, 0, 0);
       ObjectSetInteger(0, v2, 102, 360, 0);
       ObjectSetInteger(0, v2, 103, 50, 0);
       ObjectSetInteger(0, v2, 101, 0, 0);
       ObjectSetString(0, v2, 999, v4);
       ObjectSetString(0, v2, 1001, v3);
       ObjectSetInteger(0, v2, 100, 11, 0);
       ObjectSetDouble(0, 0, v2, 13, 0);
       ObjectSetInteger(0, v2, 1011, 0, 0);
       ObjectSetInteger(0, v2, 6, 0xFFFFFF, 0);
       ObjectSetInteger(0, v2, 9, 0, 0);
       ObjectSetInteger(0, v2, 1000, 0, 0);
       ObjectSetInteger(0, v2, 17, 0, 0);
       ObjectSetInteger(0, v2, 208, 0, 0);
       ObjectSetInteger(0, v2, 207, 0, 0);
     }
     if ( dword_6B58FBC == 1 )
     {

   v1="FEIGE_period";

   //    sub_1730490(v1);
     }




     */

    v40 = 0;

    return 0;

    //---
}
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
{
    //---

    char v1[12]; // [esp+4h] [ebp-20h] BYREF
    char v2[12]; // [esp+10h] [ebp-14h] BYREF
    int i;       // [esp+1Ch] [ebp-8h]
    int v4;      // [esp+20h] [ebp-4h]
                 /*
                memset(v2, 0, sizeof(v2));
                memset(v1, 0, sizeof(v1));
                for ( i = sub_1730B50(-1) - 1; i >= 0; --i )
                {
                  sub_17306C0(i);
                  sub_173C190(1, dword_6B58FD4, v2);
                  if ( StringFind(v2, 84521250, 0) >= 0 )
                  {
                    sub_17306C0(i);
                    sub_173C190(1, dword_6B58FD4, v1);
                    ObjectDelete(0, 0, v1);
                  }
                }
             
             
             
                */
    v4 = 0;
}

//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
{
    //---

    double v67, v68, v66;

    // MarketInfo(0, 13);
    // qword_6B59590 = Lots;
    // bool v65 = Lots > Pointdifferencelimit;
    if (MarketInfo(0, 13) <= Pointdifferencelimit)
    {
        // Print(, 4, 1, 5832712, 84520770);
        byte_6B59544 = 1;
    }
    else
    {
        byte_6B59544 = 0;
    }

    if (ParameterSwitching)
    {

        if (StringFind(Symbol(), "CHFSGD", 0) < 0 && StringFind(Symbol(), "GBPSGD", 0) < 0)
        // if ( (StringFind(Symbol(), "CHFSGD", 0) < 0 && StringFind(Symbol(), "GBPSGD", 0) < 0 )
        {
            dword_6B59710 = Volatility;
            dword_6B59714 = StopLoss;
            dword_6B59718 = Profit;
            dword_6B5971C = dword_6B59520;
            dword_6B59720 = dword_6B59524;
        }
        else
        {
            dword_6B59710 = 35;
            dword_6B59714 = StopLoss;
            dword_6B59718 = Profit;
            dword_6B5971C = dword_6B59520;
            dword_6B59720 = 0;
        }
    }
    else
    {
        if (StringFind(Symbol(), "GBPCAD", 0) >= 0)
        {
            dword_6B59710 = 110;
            dword_6B59714 = 800;
            dword_6B59718 = 300;
            dword_6B5971C = dword_6B59520;
            dword_6B59720 = dword_6B59524;
        }
        if (StringFind(Symbol(), "EURSGD", 0) >= 0)
        {
            dword_6B59710 = 140;
            dword_6B59714 = 700;
            dword_6B59718 = 160;
            dword_6B5971C = dword_6B59520;
            dword_6B59720 = dword_6B59524;
        }
        if (StringFind(Symbol(), "GBPCHF", 0) >= 0)
        {
            dword_6B59710 = 110;
            dword_6B59714 = 600;
            dword_6B59718 = 200;
            dword_6B5971C = dword_6B59520;
            dword_6B59720 = dword_6B59524;
        }
        if (StringFind(Symbol(), "CHFSGD", 0) >= 0)
        {
            dword_6B59710 = 60;
            dword_6B59714 = 700;
            dword_6B59718 = 160;
            dword_6B5971C = dword_6B59520;
            dword_6B59720 = 0;
        }
        if (StringFind(Symbol(), "GBPSGD", 0) >= 0)
        {
            dword_6B59710 = 35;
            dword_6B59714 = 700;
            dword_6B59718 = 160;
            dword_6B5971C = dword_6B59520;
            dword_6B59720 = 0;
        }
    }

    TesterHideIndicators(1);

    // 2.0  2.0

    v68 = iBands(0, 1, 20, 2.0, 0, 0, 1, 0);

    v67 = iBands(0, 1, 20, 2.0, 0, 0, 2, 0);

    v66 = iWPR(0, 1, dword_6B59710, 0);

    TesterHideIndicators(0);
    qword_6B59550 = iTime(0, 1, 1);
    qword_6B59560 = iTime(0, 1, 1);
    sub_5546348();
    if (Compoundinterestswitch == 1)
    {

        dbl_6B59728 = StringToDouble(DoubleToString(AccountEquity() * Risk / qword_6B59510, 2));
    }
    else
    {
        dbl_6B59728 = Lots;
    }

    if (IsTesting() == 1)
    {
        if (Hour() >= dword_6B59530 && Hour() <= dword_6B59534 || Hour() >= dword_6B59538 && Hour() <= dword_6B5953C)
        {

            // *(double *)&qword_6B58FF4 = (double)dword_6B5971C * *(double *)&qword_6B58FB0;

            if (v68-v67< dword_6B5971C*qword_6B58FB0)
            {
                // qword_6B58FF4 =dword_6B59720 * qword_6B58FB0;

                if (v68-v67 > dword_6B59720 * qword_6B58FB0)
                {

                    if (dword_6B595A0 + dword_6B59598 < 1 && byte_6B59544 == 1)
                    {

                        if (v66 < dword_6B59528 - 100 && qword_6B59548 != qword_6B59550)
                        {
                            
                        
                            dword_6B59570 = -1;
                            qword_6B59578 = 0;
                            dword_6B59588 = 0;
                            qword_6B59548 = qword_6B59550;

                          //qword_6B59578 = NormalizeDouble(Ask-dword_6B59714 *qword_6B58FB0 , 5);
                          qword_6B59578 = NormalizeDouble(Ask-dword_6B59714 *qword_6B58FB0 , 5);
                              
                            //  qword_6B59578 = Ask-0.008;
                             
                            qword_6B59580 = 0;

                /*            // LOBYTE(v59) = dbl_6B59728 >;
                            if (dbl_6B59728 < SymbolInfoDouble(0, 35))
                                dbl_6B59728 = SymbolInfoDouble(0, 35);//最小交易量
                            // LOBYTE(v59) = dbl_6B59728 <  SymbolInfoDouble(0, 34);
                            if (dbl_6B59728 > SymbolInfoDouble(0, 34))
                                dbl_6B59728 = SymbolInfoDouble(0, 34);//最大交易量


*/
                            //    LOBYTE(v60) = Lots > dbl_6B59518;
                            
                            //AccountFreeMarginCheck  检查可用保证金
                            if (AccountFreeMarginCheck(Symbol(),1, dbl_6B59728) > 0 && dword_6B59570 < 0 && dword_6B59588 < 10)
                            {
                                do
                                {
                                    dword_6B59570 = OrderSend(
                                        Symbol(),
                                        0,
                                        dbl_6B59728,//开仓量
                                        Ask,//开仓价
                                        dword_6B59540,//滑点
                                        
                                       // Ask-0.008,
                                        qword_6B59578,//止损
                                        qword_6B59580,//止盈
                                        CommentName,
                                        Magic,
                                        0,

                                        16711680);
                                    if (dword_6B59570 < 0)
                                    {
                                        //  LODWORD(v60) = dword_6B58FA8;
                                        dword_6B58FA8 = 0;
                                        //  Print(, 2, 2, 5832712, 84521270, 5373956, LODWORD(v60));
                                    }
                                    ++dword_6B59588;
                                } while (dword_6B59570 < 0 && dword_6B59588 < 10);
                            }
                        }
                    }
                    // LODWORD(v63) = dword_6B595A0 + dword_6B59598;

                    if (dword_6B595A0 + dword_6B59598 < 1 && byte_6B59544 == 1)
                    {
                        // LODWORD(v63) = -dword_6B59528;

                        //   LOBYTE(v63) = v66 > *(double *)&qword_6B58FF4;
                        if (v66 > -dword_6B59528 && qword_6B59558 != qword_6B59560)
                        {
                            dword_6B59570 = -1;
                            qword_6B59578 = 0;
                            dword_6B59588 = 0;
                            qword_6B59558 = qword_6B59560;

         qword_6B59578 = NormalizeDouble(Bid+dword_6B59714 *qword_6B58FB0 , 5);
                            qword_6B59580 = 0;
/*
                             if (dbl_6B59728 < SymbolInfoDouble(0, 35))
                                dbl_6B59728 = SymbolInfoDouble(0, 35);//最小交易量
                            // LOBYTE(v59) = dbl_6B59728 <  SymbolInfoDouble(0, 34);
                            if (dbl_6B59728 > SymbolInfoDouble(0, 34))
                                dbl_6B59728 = SymbolInfoDouble(0, 34);//最大交易量
*/
                            //    LOBYTE(v60) = Lots > dbl_6B59518;
                            if (AccountFreeMarginCheck(Symbol(), 1, dbl_6B59728) > 0 && dword_6B59570 < 0 && dword_6B59588 < 10)

                            {
                                do
                                {
                                    dword_6B59570 = OrderSend(
                                        Symbol(),
                                        1,
                                        dbl_6B59728,
                                      Bid,
                                        dword_6B59540,
                                        qword_6B59578,
                                        qword_6B59580,
                                        CommentName,
                                        Magic,
                                        0,

                                        255);
                                    if (dword_6B59570 < 0)
                                    {
                                        // LODWORD(v62) = dword_6B58FA8;
                                        dword_6B58FA8 = 0;
                                        //  Print(, 2, 2, 5832712, 84521290, 5373956, LODWORD(v62));
                                    }
                                    ++dword_6B59588;
                                } while (dword_6B59570 < 0 && dword_6B59588 < 10);
                            }
                        }
                    }
                }
            }
        }
    }

    else

    {

        if (TimeHour(TimeGMT()) >= 18 || TimeHour(TimeGMT()) <= 1)
            {



               if (v68-v67 <dword_6B5971C*qword_6B58FB0)
            {
                // qword_6B58FF4 =dword_6B59720 * qword_6B58FB0;

                if (v68-v67 > dword_6B59720 * qword_6B58FB0)
                {

                    if (dword_6B595A0 + dword_6B59598 < 1 && byte_6B59544 == 1)
                    {

                        if (v66 < dword_6B59528 - 100 && qword_6B59548 != qword_6B59550)
                        {
                            
                            
                            dword_6B59570 = -1;
                            qword_6B59578 = 0;
                            dword_6B59588 = 0;
                            qword_6B59548 = qword_6B59550;

                          qword_6B59578 = NormalizeDouble(Ask-dword_6B59714 *qword_6B58FB0 , 5);
                            qword_6B59580 = 0;
/*
                            // LOBYTE(v59) = dbl_6B59728 >;
                            if (dbl_6B59728 < SymbolInfoDouble(0, 35))
                                dbl_6B59728 = SymbolInfoDouble(0, 35);//最小交易量
                            // LOBYTE(v59) = dbl_6B59728 <  SymbolInfoDouble(0, 34);
                            if (dbl_6B59728 > SymbolInfoDouble(0, 34))
                                dbl_6B59728 = SymbolInfoDouble(0, 34);//最大交易量
*/
                            //    LOBYTE(v60) = Lots > dbl_6B59518;
                            
                            //AccountFreeMarginCheck  检查可用保证金
                            if (AccountFreeMarginCheck(Symbol(),1, dbl_6B59728) > 0 && dword_6B59570 < 0 && dword_6B59588 < 10)
                            {
                                do
                                {
                                    dword_6B59570 = OrderSend(
                                        Symbol(),
                                        0,
                                        dbl_6B59728,//开仓量
                                        Ask,//开仓价
                                        dword_6B59540,//滑点
                                        qword_6B59578,//止损
                                        qword_6B59580,//止盈
                                        CommentName,
                                        Magic,
                                        0,

                                        16711680);
                                    if (dword_6B59570 < 0)
                                    {
                                        //  LODWORD(v60) = dword_6B58FA8;
                                        dword_6B58FA8 = 0;
                                        //  Print(, 2, 2, 5832712, 84521270, 5373956, LODWORD(v60));
                                    }
                                    ++dword_6B59588;
                                } while (dword_6B59570 < 0 && dword_6B59588 < 10);
                            }
                        }
                    }
                    // LODWORD(v63) = dword_6B595A0 + dword_6B59598;

                    if (dword_6B595A0 + dword_6B59598 < 1 && byte_6B59544 == 1)
                    {
                        // LODWORD(v63) = -dword_6B59528;

                        //   LOBYTE(v63) = v66 > *(double *)&qword_6B58FF4;
                        if (v66 > -dword_6B59528 && qword_6B59558 != qword_6B59560)
                        {
                            dword_6B59570 = -1;
                            qword_6B59578 = 0;
                            dword_6B59588 = 0;
                            qword_6B59558 = qword_6B59560;

         qword_6B59578 = NormalizeDouble(Bid+dword_6B59714 *qword_6B58FB0 , 5);
                            qword_6B59580 = 0;
/*
                             if (dbl_6B59728 < SymbolInfoDouble(0, 35))
                                dbl_6B59728 = SymbolInfoDouble(0, 35);//最小交易量
                            // LOBYTE(v59) = dbl_6B59728 <  SymbolInfoDouble(0, 34);
                            if (dbl_6B59728 > SymbolInfoDouble(0, 34))
                                dbl_6B59728 = SymbolInfoDouble(0, 34);//最大交易量

                            //    LOBYTE(v60) = Lots > dbl_6B59518;
   

*/
                         if (AccountFreeMarginCheck(Symbol(), 1, dbl_6B59728) > 0 && dword_6B59570 < 0 && dword_6B59588 < 10)

                            {
                                do
                                {
                                    dword_6B59570 = OrderSend(
                                        Symbol(),
                                        1,
                                        dbl_6B59728,
                                      Bid,
                                        dword_6B59540,
                                        qword_6B59578,
                                        qword_6B59580,
                                        CommentName,
                                        Magic,
                                        0,

                                        255);
                                    if (dword_6B59570 < 0)
                                    {
                                        // LODWORD(v62) = dword_6B58FA8;
                                        dword_6B58FA8 = 0;
                                        //  Print(, 2, 2, 5832712, 84521290, 5373956, LODWORD(v62));
                                    }
                                    ++dword_6B59588;
                                } while (dword_6B59570 < 0 && dword_6B59588 < 10);
                                }
                            }
                        }
                    }
                }
            }

        }
    

    if (dword_6B59598 > 0 && byte_6B59544 == 1)
    {

        // *(double *)&qword_6B58FF4 = (double)-dword_6B5952C;
        // LOBYTE(v59) = v66 > *(double *)&qword_6B58FF4;

        if (v66 > (-dword_6B5952C))
        {

            // LODWORD(v58) = OrdersTotal() - 1;
            for (int i = OrdersTotal() - 1; i >= 0; --i)
            {
                if (OrderSelect(i, 0, 0))
                {
                    // OrderSymbol();

                    if (OrderSymbol() == Symbol() && OrderMagicNumber() == Magic)

                    {
                        // v2 = OrderType();
                        if (OrderType() == 0)
                        {

                            /*
                             OrderClosePrice();
                             v58 = *(_QWORD *)&Lots;
                             OrderLots();
                             v56 = *(_QWORD *)&Lots;
                             v55 = OrderTicket();
                            */

                            OrderClose(OrderTicket(), OrderLots(), OrderClosePrice(), 300, 0xFFFF);
                            
                             printf("多单平仓1");
                        }
                    }
                }
            }
        }
    }

 if (dword_6B595A0 > 0 && byte_6B59544 == 1)
    {

        /*
         v55 = dword_6B5952C - 100;
         *(double *)&qword_6B58FF4 = (double)(dword_6B5952C - 100);
         LOBYTE(v55) = v66 < *(double *)&qword_6B58FF4;
        */

        if (v66 < dword_6B5952C - 100)
        {

            // LODWORD(v54) = OrdersTotal() - 1;
            for (int j = OrdersTotal() - 1; j >= 0; --j)
            {
                if (OrderSelect(j, 0, 0))
                {

                    if (OrderSymbol() == Symbol() && OrderMagicNumber() == Magic)

                    {

                        if (OrderType() == 1)
                        {
                            /*
                            OrderClosePrice();
                            v54 = *(_QWORD *)&Lots;
                            OrderLots();
                            v52 = *(_QWORD *)&Lots;
                            LODWORD(v51) = OrderTicket();
                            OrderClose(LODWORD(v51), v52, v54, 300, 0xFFFF);
                          */
                            OrderClose(OrderTicket(), OrderLots(), OrderClosePrice(), 300, 0xFFFF);
                        }
                    }
                }
            }
        }
    }

    if (dword_6B59598 > 0 && byte_6B59544 == 1)
    {
        /*
         v51 = *(double *)&qword_6B590B4 - *(double *)&qword_6B595F8;
         *(double *)&qword_6B58FF4 = (double)dword_6B59718 * *(double *)&qword_6B58FB0;
         v4 = *(double *)&qword_6B590B4 - *(double *)&qword_6B595F8;

&qword_6B590B4 - *&qword_6B595F8

         LOBYTE(v51) = v4 > *(double *)&qword_6B58FF4;
          */

        if (Bid - qword_6B595F8 > dword_6B59718 * qword_6B58FB0)
        {
            // LODWORD(v51) = 0;
            // LODWORD(v50) = OrdersTotal() - 1;
            for (int k = OrdersTotal() - 1; k >= 0; --k)
            {
                if (OrderSelect(k, 0, 0))
                {

                    if (OrderSymbol() == Symbol() && OrderMagicNumber() == Magic)

                    {

                        // v5 = OrderType();
                        if (OrderType() == 0)
                        {

                            /*
                             OrderClosePrice();
                             v50 = *(_QWORD *)&Lots;
                             OrderLots();
                             v48 = *(_QWORD *)&Lots;
                             LODWORD(v47) = OrderTicket();
                             OrderClose(LODWORD(v47), v48, v50, 300, 0xFFFF);
                             */
                            OrderClose(OrderTicket(), OrderLots(), OrderClosePrice(), 300, 0xFFFF);
                               printf("多单平仓2");
                            
                        }
                    }
                }
            }
        }
    }

    if (dword_6B595A0 > 0 && byte_6B59544 == 1)
    {

        /*
         v47 = *(double *)&qword_6B59600 - *(double *)&qword_6B590BC;
         *(double *)&qword_6B58FF4 = (double)dword_6B59718 * *(double *)&qword_6B58FB0;
         v6 = *(double *)&qword_6B59600 - *(double *)&qword_6B590BC;
         LOBYTE(v47) = v6 > *(double *)&qword_6B58FF4;

        */

        if (qword_6B59600 - Ask > dword_6B59718 * qword_6B58FB0)
        {
            // LODWORD(v47) = 1;

            for (int m = OrdersTotal() - 1; m >= 0; --m)
            {
                if (OrderSelect(m, 0, 0))
                {

                    if (OrderSymbol() == Symbol() && OrderMagicNumber() == Magic)

                    {
                        // v7 = OrderType();
                        if (OrderType() == 1)
                        {

                            OrderClose(OrderTicket(), OrderLots(), OrderClosePrice(), 300, 0xFFFF);
                        }
                    }
                }
            }
        }
    }


}

int sub_5546348()
{
    int v1;    // [esp+0h] [ebp-10h]
    int v2;    // [esp+0h] [ebp-10h]
    double v3; // [esp+0h] [ebp-10h]
    double v4; // [esp+0h] [ebp-10h]
    int v5;    // [esp+0h] [ebp-10h]
    double v6; // [esp+0h] [ebp-10h]
    double v7; // [esp+0h] [ebp-10h]
    int i;     // [esp+8h] [ebp-8h]

    dword_6B59598 = 0;
    dword_6B595A0 = 0;
    qword_6B595B0 = 0;
    qword_6B595B8 = 0;
    qword_6B595C0 = 0;
    qword_6B595C8 = 0;
    dbl_6B595D0 = 0.0;
    dbl_6B595D8 = 0.0;
    dword_6B595E8 = 0;
    dword_6B595EC = 0;
    dword_6B595F0 = 0;
    dword_6B595F4 = 0;
    qword_6B595F8 = 0;
    qword_6B59600 = 0;
    qword_6B59608 = 0;
    qword_6B59610 = 0;
    qword_6B59618 = 0;
    qword_6B59620 = 0;
    qword_6B59690 = 0;
    qword_6B59698 = 0;
    dword_6B596B0 = 0;
    dword_6B596B4 = 0;
    dword_6B596A0 = 0;
    dword_6B596A4 = 0;
    dword_6B596A8 = 0;
    dword_6B596AC = 0;
    dword_6B596B8 = 0;
    dword_6B596BC = 0;
    dword_6B59678 = 0;
    dword_6B5967C = 0;
    dword_6B59688 = 0;
    dword_6B5968C = 0;
    qword_6B59670 = 0;
    qword_6B59660 = 0;

    for (i = 0; i < OrdersTotal(); ++i)
    {
        if (OrderSelect(i, 0, 0))
        {

            // sub_173B610   Symbol()

            if (OrderSymbol() == Symbol() && OrderMagicNumber() == Magic)

            {
                if (OrderType())
                {
                    if (OrderType() == 1)
                    {
                        if (++dword_6B595A0 > dword_6B595A4)
                            dword_6B595A4 = dword_6B595A0;
                        // OrderLots(, v1);
                        // v1=v1+dbl_6B58FE0;

                        qword_6B595B8 = qword_6B595B8 + OrderLots();

                        //&qword_6B595B8 = *&qword_6B595B8 + dbl_6B58FE0;
                        // OrderLots(, v5);
                        qword_6B595C8 = OrderLots();
                        // OrderProfit();

                        // OrderSwap();
                        dbl_6B595D8 = OrderProfit() + OrderCommission() + OrderSwap() + dbl_6B595D8;
                        // OrderOpenPrice();
                        qword_6B59600 = OrderOpenPrice();
                        // OrderStopLoss();
                        qword_6B59610 = OrderStopLoss();
                        // OrderTakeProfit();
                        qword_6B59620 = OrderTakeProfit();
                        dword_6B596B8 = OrderTicket();
                        // v1 = dword_6B595A4 - 2;
                        if (dword_6B595A0 == dword_6B595A4 - 2)
                        {
                            // OrderOpenPrice();
                            qword_6B59660 = OrderOpenPrice();
                            // OrderLots(, v1);
                            qword_6B59670 = OrderLots();
                            dword_6B596BC = OrderTicket();
                            
                            
                            
                            
                            
                            
                        }
                    }
                }
                else
                {
                    if (++dword_6B59598 > dword_6B5959C)
                        dword_6B5959C = dword_6B59598;

                    qword_6B595B8 = qword_6B595B8 + OrderLots();

                    //&qword_6B595B8 = *&qword_6B595B8 + dbl_6B58FE0;
                    // OrderLots(, v5);
                    qword_6B595C8 = OrderLots();
                    // OrderProfit();

                    // OrderSwap();
                    dbl_6B595D8 = OrderProfit() + OrderCommission() + OrderSwap() + dbl_6B595D8;
                    // OrderOpenPrice();
                    qword_6B595F8 = OrderOpenPrice();
                    // OrderStopLoss();
                    qword_6B59610 = OrderStopLoss();
                    // OrderTakeProfit();
                    qword_6B59620 = OrderTakeProfit();
                    dword_6B596B8 = OrderTicket();

                    if (dword_6B59598 == dword_6B5959C - 2)
                    {
                        // OrderOpenPrice();
                        qword_6B59690 = OrderOpenPrice();

                        qword_6B59698 = OrderLots();
                        dword_6B596B4 = OrderTicket();
                    }
                }
            }
        }
    }

    return 0;
}

/*


sub_554698E(
        int a1,
        int a2,
        int a3,
        int a4,
        int a5,
        int a6,
        int a7,
        int a8,
        int a9,
        int a10,
        int a11,
        int a12,
        int a13,
        int a14,
        int a15,
        char a16,
        char a17,
        char a18,
        char a19,
        int a20,
        int a21)


dword_6B58FA8 = 0;
  Print(a1, a2,a3, a4,);
  ObjectSetInteger(a2, a3, 102, a5, a5 >> 31);
  ObjectSetInteger(a2, a3, 103, a6, a6 >> 31);
  ObjectSetInteger(a2, a3, 1019, a7, a7 >> 31);
  ObjectSetInteger(a2, a3, 1020, a8, a8 >> 31);
  ObjectSetInteger(a2, a3, 101, a9, a9 >> 31);
  ObjectSetString(a1, a2, a3, 999, a10);
  ObjectSetString(a1, a2, a3, 1001, a11);
  ObjectSetInteger(a2, a3, 100, a12, a12 >> 31);
  ObjectSetInteger(a2, a3, 6, a13, 0);
  ObjectSetInteger(a2, a3, 1025, a14, 0);
  ObjectSetInteger(a2, a3, 1035, a15, 0);
  ObjectSetInteger(a2, a3, 9, a17, a17 >> 32);
  ObjectSetInteger(a2, a3, 1018, a16, a16 >> 32);
  ObjectSetInteger(a2, a3, 1000, a18, a18 >> 32);
  ObjectSetInteger(a2, a3, 17, a18, a18 >> 32);
  ObjectSetInteger(a2, a3, 208, a19, a19 >> 32);
  ObjectSetInteger(a2, a3, 207, a20, a21);
  return 1;
  }*/