//+------------------------------------------------------------------+
//|                                        122.EA_Cleopatra_v1.0.mq4 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
//+��������������������������������������������������������������������+
//              === EA_Cleopatra v 1.0 ===                            


//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// EA_Cleopatra    - �������� ����������� ���� ����������                                                                 |
//                 1. ������ �� �������� ����������                                                                       |
//                 2. ������ �� �������� ��������                                                                         |
//                 3. ������ ���� ���������� ������������                                                                 |
//                 4. ���.���. ������ �� ���������� �� ����� ������                                                       |
//                 5. ��������� �������� ���������� �� ����� ������.                                                      |
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#property copyright ""
#property link      ""

//+------------------------------------------------------------------+
//| #import                                                          |
//+------------------------------------------------------------------+
#import "user32.dll"
   int GetDC(int hWnd);
   int ReleaseDC(int hWnd, int hDC);
#import "Gdi32.dll"
   bool GetTextExtentPoint32A(int hdc, string lpString, int size, int& lpSize[]);
   int CreateFontA(int nHeight,int nWidth,int nEscapement,int nOrientation,int fnWeight,int fdwItalic,int fdwUnderline,
                  int fdwStrikeOut,int fdwCharSet,int fdwOutputPrecision,int fdwClipPrecision,int fdwQuality,
                  int fdwPitchAndFamily,string lpszFace);
  int SelectObject(int hdc,int hgdiobj);
  bool DeleteObject(int hObject);
  int GetDeviceCaps(int hdc,int nIndex);
#import

//+------------------------------------------------------------------+
//| #define                                                          |
//+------------------------------------------------------------------+
#define DEFAULT_CHARSET 1
#define OUT_DEFAULT_PRECIS 0
#define CLIP_DEFAULT_PRECIS 0
#define DEFAULT_QUALITY 0
#define DEFAULT_PITCH 0
#define FF_MODERN 48
#define LOGPIXELSX 88

//+------------------------------------------------------------------+
//| extern variables                                                 |
//+------------------------------------------------------------------+
extern string T0 = "�� ��";
extern double DefaultProfit = 10;   // ���� ������ ������������� � ������� �� ����� ��� ������. 
                                    // ������� ����� ������ ������� �� ����� ��� ������ ��� �������� �������
extern double StopLoss      =  0;   // ��� ���������� ������ ������ � ������ �������� ������� ��� ������. 
                                    // ���� 0 �� ���������.
//---------------------------------------
extern string T1 = "��������� ���������";
extern bool   Trall_on      = true; // ���.����. ������������ �������� �����
extern double Tral_Start    = 10;   // ���������� ������ ����� �� ����� Profit � ������� (������������ �� � �������).
extern double Tral_Size     = 5;    // �������� ����� ����� Tral_Start � �������. (��������)
                                    
//---------------------------------------
extern string T2 = "��������� MM";
extern double Risk          =   1;  // ������ ������ �������� � % �� ��������� ������� 0.1.....10, 
                                    // ���� Risk=0 �� ������ ������ ����������� �������� DefaultLot
extern double DefaultLot    = 0.1;  // ������������� ���, ���� ��������� Risk = 0
extern double MaxLot        = 10;   // ����������� ��������� ��� ��� ��������
//---------------------------------------
extern string T2.1 = "����� ������ ��������";
extern int    Metod         = 1;    // 1 - ���� � ����� ������ ����� �������� ��������� ��.
                                    //     � ������ �������� � ����������� �� �������� MartinOn PiramidOn. ����� �� ��� ��������.
                                    // 2 � ���� � ����� ������ ����� �������� ��������� ��. 
                                    //     ����� �������� ����������� ��������. ���� ����� ��� � ������ ������� 
                                    //     ������ �� ������� ������� ������ �� ��������� ��� � ������ ��������,
                                    //     � ���������� ���������� ������ �� ��������� ��������� � ��������� 
                                    //     Dist �� ������� ����.
extern bool   NewCycle_ON   = true; // ��� ������� - ���� �������������� �� �����, ����� ���� �� ����������
//---------------------------------------
extern string T3 = "��������� ���������� �������";
extern double Dist          = 3;    // ����������, �� ������� ������������ ���������� ������ 
                                    // �������� ����������� Pipstep. � � �������� ��������
                                    // ��� �������� �� ����. ���������� ���� �� �������� �� ������
                                    // �������� �2 �� ������� ��������� ������� ���������� � ����������
                                    // MartinStep � PiramidStep (� ����������� ��� �������� ������ �������� ��� ��� ���)
                                    // ������������ ���������� ����� �� ���������� N ������� �� ������� ����.
extern double Step          = 3;    // ��� ������� ���� - ��� �������� ������ �� �����. ��� ���-�� ���� ����� ������� �� �����
//---------------------------------------
extern string T4 = "��������� �������";
extern bool   MartinOn      = true; // ���. ����. ������ �� ������ �����������
extern double MartinStep    = 30;   // ��� � ������� ��� �������� ���������� ������ �� �����������
extern double MartinLotExponent = 2;// ��������� ���� ��� �������. ��������� ����������� ������� ������ ������ �����
extern int    MartinMaxOrders = 12; // ���������� ����������� ����������� �������
//---------------------------------------
extern string T4.1 = "��������� ��������� ����� N-�� ������ �������";
extern bool   MartinOnNew   = false;// ������������ �� ��������� ������ ����������� ������� ����� N-�� ������.
extern int    LotNoM        = 10;   // ����� ���������� ����� ������ ����������� ������� ���������� ���� 
                                    // ������ ���� MartinOnNew =true
extern double PiramidStart  = 5;    // ��� ���������� ����� �������� � % ���������, �������� ����������� ��������.
                                    // ���� ������� ����� ������������. ���� 0 �� ���������
extern int    LotN_M        = 4;    // � ������ ������ ����� �������� ��������� �������
extern double MartinLotExponenNew=3;// ����������� ���������� ����
extern double MartinStepNew = 50;   // ��� �������� ����� � �������
extern double MartinK_Step  = 1.5;  // ����������� ���������� ���� ����� ��������� ����������� �������. 
//---------------------------------------
extern string T5 = "��������� ��������";
extern bool   PiramidOn     = true; // ���.����. �� ������ ��������.
extern double PiramidStep   = 30;   // ��� � ������� ��� �������� ���������� ������ ��������.
extern double PiramidLotExponent = 1.5;// ��������� ���� ��� ��������. �� �� ����� ��� � ������� ������ 
                                    // ��������� ������� ���������� �� ���� �����
extern int    PiramidMaxOrders = 12;// ���������� ����������� ����������� �������
//---------------------------------------
extern string T5.1 = "��������� ��������� ����� N-�� ������ ��������";
extern bool   PiramidOnNew  = false;// ������������ �� ��������� ������ ����������� �������� ����� N-�� ������
extern int    LotNoP        = 10;   // ����� ���������� ����� ������ ����������� �������� 
                                    // ���������� ���� ������ ���� PiramidOnNew =true
extern int    LotN_P        = 4;    // � ������ ������ ����� �������� ���������
extern double PiramidLotExponenNew = 3;// ����������� ���������� ����
extern double PiramidStepNew= 50;   // ��� �������� ����� � �������
//---------------------------------------
extern string T6 = "�������� ���������";
extern bool   CloseBy       = false;// ���� TRUE, �� �������� ��������� �������,  ���� FALSE � �������� ������;( �� ����������� )
//---------------------------------------
extern string T7 = "��������� ���������";
extern bool   Info          = true; // ��� ���������, ��������� ������������� �������� ����� � ���������� ����������������
extern int    PositionX     = 10;   // ��������� ������������� ����� �� ��� � �� ������ ������� �������
extern int    PositionY     = 15;   // ��������� ������������� ����� �� ��� Y �� ������� ������� �������
extern int    FontSize      = 9;    // ������ ������ � ������������ �����
extern color  BULineColor   = Yellow; // ���� ����� ���������
extern color  TPLineColor   = Gray;   // ���� ����� ��
extern color  TralLineColor = DarkOrange;// ���� ����� �����
extern color  BuyStopColor  = DeepSkyBlue;// ���� ������� �� �������
extern color  SellStopColor = Red;  // ���� ������� �� �������

//---------------------------------------
extern string T8 = "����� ���������";
extern int    MagicMartin   = 777;  // ���������� ����� �������
extern int    MagicPiramid  = 888;  // ���������� ����� ��������
extern int    PauseTrade    = 6;    // ����� �������� ����� ��������� ��������� � ���
extern int    PauseTrade2   = 1;    // ����� �������� ����� ������ � �����, �� ������ ����� � ����� � �������.
extern int    Slippege      = 2;    // ���������� ��������������� ���� � ������� ��� �������� ������

//+------------------------------------------------------------------+
//| global variables                                                 |
//+------------------------------------------------------------------+
string _Symbol = "";    // �������� ��������� �����������
string sPref = "Cleopatra_";  // ������� ����������� ��������
string sPrefIndPan = "CleoInfoPan_"; // ������� ����������� �������� � �������������� ������
int iDigitLot = 0;      // ���-�� ������ ����� ������� � �������� ����
bool isWorking = true;  // ���� ��������� �� ����������� ����������� ��������
int iTicket = -1;       // ����� ������ ����� ������
bool PiramidAutoStart = false; // ��������� �� ��������� �������� ��� ���������� �������� ��������

double MBuyStop = 0.0;   // ���� �������� ������ martin BuyStop
double MBuyStopLot = 0.0;// ��� ������ martin BuyStop
int MBuyStopNumb = 0.0;  // ����� ������ martin BuyStop

double MSellStop = 0.0;   // ���� �������� ������ martin SellStop
double MSellStopLot = 0.0;// ��� ������ martin BuyStop
int MSellStopNumb = 0.0;  // ����� ������ martin BuyStop

double PBuyStop = 0.0;   // ���� �������� ������ piramid BuyStop
double PBuyStopLot = 0.0;// ��� ������ piramid BuyStop
int PBuyStopNumb = 0.0;  // ����� ������ martin BuyStop

double PSellStop = 0.0;   // ���� �������� ������ piramid SellStop
double PSellStopLot = 0.0;// ��� ������ piramid SellStop
int PSellStopNumb = 0.0;  // ����� ������ piramid SellStop

double TralStartPrice = 0.0;  // ���� � ������� �������� �������� �������
double TralPrice = 0.0; // ������� ������� ����� ���������
int TralType = 0;       // ��� ������� ����������� �� �����

string FontName = "Arial"; // �������� ������ � ������������ ����� �����
color BaseColor = White;

int DC_hWnd = 0;
int DC_hFont = 0;
int DC_hnd = 0;

bool StopMartin = false;
bool StopPiramid = false;
double AveregeLine = 0.0;
double TPLine = 0.0;

//+------------------------------------------------------------------+
//| expert initialization function                                   |
//+------------------------------------------------------------------+
int init()
  {
   _Symbol = Symbol();  
   iDigitLot = Info.Get.LotDigit(_Symbol);
   
//---- �������� ��������� ������������� ������
   if(DefaultProfit < 0.0) DefaultProfit = 0.0;
   if(StopLoss < 0.0) StopLoss = 0.0;
   if(StopLoss > AccountEquity()) Alert("������� StopLoss ��������� ������ ��������� ������� �� �����!");
   if(Tral_Start < 0.0) Tral_Start = 0.0;
   if(Tral_Size < 0.0) Tral_Size = 0.0;
   if(Risk < 0.0) Risk = 0.0;
   if(Metod < 1){ Alert("����������� ������ �����, �������� �� ����� � 1");Metod = 1; }else if(Metod > 2){ Alert("����������� ������ �����, �������� �� ����� � 2");Metod = 2; }
   if(Dist < 1.0) Dist = 1.0;
   if(Step < 1.0) Step = 1.0;
   if(MartinStep < 1.0) MartinStep = 1.0;
   if(MartinLotExponent < 0.0) MartinLotExponent = 1.0;
   if(Slippege < 0) Slippege = 0;
   if(MaxLot > MarketInfo(_Symbol,MODE_MAXLOT)) MaxLot = MarketInfo(_Symbol,MODE_MAXLOT);
      
//---- ����������� �������   
   Info.ChangeToDigit(_Symbol, DefaultProfit);
   Info.ChangeToDigit(_Symbol, Tral_Start);
   Info.ChangeToDigit(_Symbol, Tral_Size);
   DefaultLot = Info.NormalizeVolume(_Symbol, DefaultLot);
   Info.ChangeToDigit(_Symbol, Dist);
   Info.ChangeToDigit(_Symbol, Step);
   Info.ChangeToDigit(_Symbol, MartinStep);
   Info.ChangeToDigit(_Symbol, MartinStepNew);
   Info.ChangeToDigit(_Symbol, PiramidStep);
   Info.ChangeToDigit(_Symbol, PiramidStepNew);
   PiramidAutoStart = PiramidOn;

//---- ������� ������ �� ������� ������� ����� ������� ���������� �������   
   MBuyStop    = 0.0;
   MBuyStopLot = 0.0;
   MBuyStopNumb= 0.0;
   
   MSellStop    = 0.0;
   MSellStopLot = 0.0;
   MSellStopNumb= 0.0;
   
   PBuyStop    = 0.0;
   PBuyStopLot = 0.0;
   PBuyStopNumb= 0.0;
   
   PSellStop    = 0.0;
   PSellStopLot = 0.0;
   PSellStopNumb= 0.0;
      
//---- ���� ��� ���� ���������� ����� - ������������ ���������� ��� ��������� ����� �����
   int _martin_cnt = Orders.Get.Count(_Symbol, 99, MagicMartin, "", 0, 0);
   int _piramid_cnt = Orders.Get.Count(_Symbol, 99, MagicPiramid, "", 0, 0);
   if(_martin_cnt+_piramid_cnt == 0){
      // �������� �������� ���-�� ������
      Comment("�������� �������. �� �������� �������� "+PauseTrade+" ���.");
      Sleep(PauseTrade*1000);
      Comment("");
      //
      SendOrder(OP_BUY, GetLot(), Ask, MagicMartin, "1:start");
      SendOrder(OP_SELL, GetLot(), Bid, MagicMartin, "1:start");
   }
//---- 
   GetDCWithFontNameAndSize(FontName, FontSize);   
//----
   return(0);
  }
//+------------------------------------------------------------------+
//| expert deinitialization function                                 |
//+------------------------------------------------------------------+
int deinit()
  {
//----
   Graph.Delete(sPref);
   Graph.Delete(sPrefIndPan);
//----
   DCRelease();
//----
   return(0);
  }
//+------------------------------------------------------------------+
//| expert start function                                            |
//+------------------------------------------------------------------+
int start()
  {
//----
   // �������� ����� ������ ����� ���������� �������� ����� - ������� �� ��������� NewCycle_ON
   if(isWorking){
      // �������� ���-�� �������� �������
      int _martin_cnt = Orders.Get.Count(_Symbol, 99, MagicMartin, "", 0, 0);
      int _piramid_cnt = Orders.Get.Count(_Symbol, 99, MagicPiramid, "", 0, 0);      
      if(_martin_cnt+_piramid_cnt == 0){
         // ���� �������� ������� ��� - �������� �������������� �����
         SendOrder(OP_BUY, GetLot(), Ask, MagicMartin, "1:start");
         SendOrder(OP_SELL, GetLot(), Bid, MagicMartin, "1:start");
         
         Sleep(PauseTrade*1000);
         
         // �������������� ������������� �������� � ���������� ������� ������ �������������
         PiramidAutoStart = PiramidOn;
         StopMartin = false;
         StopPiramid = false;
      }else{
         //----------------------------------
         // �������� �� ������������� �������� ������ ��� ���������� ��������� StopLoss � ������ ��������
         if(!CloseByStopLoss()){
            //----------------------------------
            // �������� �� �������� �� �� ��� �� ���������
            if(!CloseByTPAndTral()){
               //----------------------------------
               // �������� �� ����������� ��������� �������� ��� ���������� �������� �������� � ���������
               EnablePiramid();
               //----------------------------------
               // ������������� ������������ ����������� ������
               TrailVirtPendOrd();
               // �������� ����������� ���������� �������
               OpenVirtPendOrd();
               //----------------------------------
               // ������� ���������� � ��������� �������� Sell ������
               double dSellInfo[]; string sSellInfo[];
               bool _sell_opened = Orders.Get.LastOpenInfo(_Symbol, OP_SELL, 99, "", dSellInfo, sSellInfo);
               //������� ���������� � ��������� �������� Buy ������
               double dBuyInfo[]; string sBuyInfo[];
               bool _buy_opened = Orders.Get.LastOpenInfo(_Symbol, OP_BUY, 99, "", dBuyInfo, sBuyInfo);       
               //----------------------------------
               if(_sell_opened){
                  // ��������� ������ ����������� ������
                  int _order_number = StrToInteger(StringSubstr(sSellInfo[1],0,StringFind(sSellInfo[1],":")));
                  // �������� - ����� �� ��������� ������ ������
                  if(MartinOn &&                
                     (StringFind(sSellInfo[1],":start")>-1 || StringFind(sSellInfo[1],":martin")>-1) &&
                     (!_buy_opened || StringFind(sBuyInfo[1],":martin")==-1))
                  {
                     // �������� �� ���������� �� ������������ ���-�� ������ �������
                     if(_order_number+1 < MartinMaxOrders){
                        // �������� �� ���������� ������ ������� ����� ���������� ��������� ���-�� �����
                        if(!fStopMartin(_order_number)){
                           // �������� - ���������� �� �������� ���-�� ������� ��� �������� ������ ������
                           if(NormalizeDouble(Bid-dSellInfo[3],Digits) >= GetMartinStepPip(_order_number)){                  
                              // �������� ������ ������ � ����������� �� ������
                              switch(Metod){
                                 case 1:
                                    SendOrder(OP_SELL, GetLot(2, dSellInfo[6], _order_number), Bid, MagicMartin, (_order_number+1)+":martin");
                                    
                                    Sleep(PauseTrade*1000);
         
                                    break;
                                 case 2:
                                    // �������� ��� �� �������� ���� ������ - ������ � ��� ��� ���������� ����� ����������
                                    if(MSellStop == 0.0){
                                       MSellStop = NormalizeDouble(Bid-Dist,Digits);
                                       MSellStopLot = GetLot(2, dSellInfo[6], _order_number);
                                       MSellStopNumb= _order_number+1;
                                    }
                                    break;
                              }
                           }
                        }
                     }
                  }
                  // �������� ����� �� ����������� ������ ��������
                  if((PiramidOn || PiramidAutoStart) && 
                     (StringFind(sSellInfo[1],":start")>-1 || StringFind(sSellInfo[1],":piramid")>-1) &&
                     (!_buy_opened || StringFind(sBuyInfo[1],":piramid")==-1))
                  {
                     // �������� �� ���������� �� ������������ ���-�� ������� � ��������
                     if(_order_number+1 < PiramidMaxOrders){
                        // �������� �� ���������� ������ �������� ����� ���������� ��������� ���-�� �����
                        if(!fStopPiramid(_order_number)){
                           // �������� - ���������� �� �������� ���-�� ������� ��� �������� ������ ��������
                           if(NormalizeDouble(dSellInfo[3]-Bid,Digits) >= GetPiramidStepPip(_order_number)){                  
                              // �������� ������ �������� � ����������� �� ������
                              switch(Metod){
                                 case 1:
                                    SendOrder(OP_SELL, GetLot(3, dSellInfo[6], _order_number), Bid, MagicPiramid, (_order_number+1)+":piramid");
                                    
                                    Sleep(PauseTrade*1000);
         
                                    break;
                                 case 2:
                                    if(PSellStop == 0.0){
                                       PSellStop = NormalizeDouble(Bid-Dist,Digits);
                                       PSellStopLot = GetLot(3, dSellInfo[6], _order_number);
                                       PSellStopNumb= _order_number+1;
                                    }
                                    break;
                              }
                           }
                        }
                     }
                  }
               }
               //----------------------------------
               if(_buy_opened){
                  // ��������� ������ ����������� ������
                  _order_number = StrToInteger(StringSubstr(sBuyInfo[1],0,StringFind(sBuyInfo[1],":")));
                  // �������� - ����� �� ��������� ������ ������
                  if(MartinOn &&                
                     (StringFind(sBuyInfo[1],":start")>-1 || StringFind(sBuyInfo[1],":martin")>-1) &&
                     (!_sell_opened || StringFind(sSellInfo[1],":martin")==-1))
                  {
                     // �������� �� ���������� �� ������������ ���-�� ������ �������
                     if(_order_number+1 < MartinMaxOrders){
                        // �������� �� ���������� ������ ������� ����� ���������� ��������� ���-�� �����
                        if(!fStopMartin(_order_number)){
                           // �������� - ���������� �� �������� ���-�� ������� ��� �������� ������ ������
                           if(NormalizeDouble(dBuyInfo[3]-Ask,Digits) >= GetMartinStepPip(_order_number)){                  
                              // �������� ������ ������ � ����������� �� ������
                              switch(Metod){
                                 case 1:
                                    SendOrder(OP_BUY, GetLot(2, dBuyInfo[6], _order_number), Ask, MagicMartin, (_order_number+1)+":martin");
                                    
                                    Sleep(PauseTrade*1000);
         
                                    break;
                                 case 2:
                                    // �������� ��� �� �������� ���� ������ - ������ � ��� ��� ���������� ����� ����������
                                    if(MBuyStop == 0.0){
                                       MBuyStop = NormalizeDouble(Ask+Dist,Digits);
                                       MBuyStopLot = GetLot(2, dBuyInfo[6], _order_number);
                                       MBuyStopNumb= _order_number+1;
                                    }
                                    break;
                              }
                           }
                        }
                     }
                  }
                  // �������� ����� �� ����������� ������ ��������
                  if((PiramidOn || PiramidAutoStart) && 
                     (StringFind(sBuyInfo[1],":start")>-1 || StringFind(sBuyInfo[1],":piramid")>-1) &&
                     (!_sell_opened || StringFind(sSellInfo[1],":piramid")==-1))
                  {
                     // �������� �� ���������� �� ������������ ���-�� ������� � ��������
                     if(_order_number+1 < PiramidMaxOrders){
                        // �������� �� ���������� ������ �������� ����� ���������� ��������� ���-�� �����
                        if(!fStopPiramid(_order_number)){
                           // �������� - ���������� �� �������� ���-�� ������� ��� �������� ������ ��������
                           if(NormalizeDouble(Ask-dBuyInfo[3],Digits) >= GetPiramidStepPip(_order_number)){
                              // �������� ������ �������� � ����������� �� ������
                              switch(Metod){
                                 case 1:
                                    SendOrder(OP_BUY, GetLot(3, dBuyInfo[6], _order_number), Ask, MagicPiramid, (_order_number+1)+":piramid");
                                    
                                    Sleep(PauseTrade*1000);
         
                                    break;
                                 case 2:
                                    // �������� ��� �� �������� ���� ������ - ������ � ��� ��� ���������� ����� ����������
                                    if(PBuyStop == 0.0){
                                       PBuyStop = NormalizeDouble(Ask+Dist,Digits);
                                       PBuyStopLot = GetLot(3, dBuyInfo[6], _order_number);
                                       PBuyStopNumb= _order_number+1;
                                    }
                                    break;
                              }
                           }
                        }
                     }
                  }            
               }
            }
         }         
      }
      //----------------------------------
      // ��������������� ������������
      DrawInfo();
   }   
//----
   return(0);
  }
//+------------------------------------------------------------------+
// �������������� �����������
void DrawInfo(){
   if(Info){
      //
      int _x = PositionX;
      int _y = PositionY;
      color _clr = CLR_NONE;
      string sInfo[9];
      //---- ���� ������      
      double _buy_lot = Orders.Get.OpenLot(_Symbol, OP_BUY, 99, "", 0, 0);
      sInfo[0] = DoubleToStr(_buy_lot,iDigitLot);      
      double _sell_lot = Orders.Get.OpenLot(_Symbol, OP_SELL, 99, "", 0, 0);
      sInfo[1] = DoubleToStr(_sell_lot,iDigitLot);      
      double _buy_result = Orders.Get.Profit(99, OP_BUY, _Symbol, "");
      sInfo[2] = DoubleToStr(_buy_result,2);      
      double _sell_result = Orders.Get.Profit(99, OP_SELL, _Symbol, "");
      sInfo[3] = DoubleToStr(_sell_result,2);      
      double _all_result = NormalizeDouble(_buy_result+_sell_result,2);      
      sInfo[4] = DoubleToStr(_all_result,2);      
      // dd
      double _dd = 0.0;
      if(_all_result < 0.0) _dd = NormalizeDouble((_all_result/AccountBalance())*100,2);
      sInfo[5] = DoubleToStr(_dd,2);
      //  balance
      double _balance = AccountBalance();
      sInfo[6] = DoubleToStr(_balance,2);
      // equity
      double _equity = AccountEquity();
      double _equity_persent = NormalizeDouble((_equity/_balance)*100,2);
      sInfo[7] = DoubleToStr(_equity,2);
      // level
      sInfo[8] = DoubleToStr(Info.Get.MarginLevel(),2);      
      //---- ��������� ������ ����� ������� ������
      int _max_size = 0; int _temp_size = 0;
      for(int i=0;i<9;i++){
         _temp_size = GetStringSizeInPix(sInfo[i]);
         if(_temp_size > _max_size) _max_size = _temp_size;
      }
      _max_size += (_x+10);
      // ----
      // �������� / ����������� �������������� ������ 
      if(_buy_lot == 0.0) _clr = White; else _clr = DeepSkyBlue;      
      Label("BuyVolume", _max_size, _y, "����� Buy:", BaseColor);
      Label("vBuyVolume", _x, _y, sInfo[0], _clr);
      
      _y += FontSize + 5;
      
      if(_sell_lot == 0.0) _clr = White; else _clr = Red;      
      Label("SellVolume", _max_size, _y, "����� Sell:", BaseColor);
      Label("vSellVolume", _x, _y, sInfo[1], _clr);
      
      _y += FontSize + 5;
      
      if(_buy_result == 0.0) _clr = White; else if(_buy_result < 0.0) _clr = Red; else _clr = DeepSkyBlue;
      Label("BuyProfit", _max_size, _y, "������ Buy:", BaseColor);
      Label("vBuyProfit", _x, _y, sInfo[2], _clr);
      
      _y += FontSize + 5;
      
      if(_sell_result == 0.0) _clr = White; else if(_sell_result < 0.0) _clr = Red; else _clr = DeepSkyBlue;
      Label("SellProfit", _max_size, _y, "������ Sell:", BaseColor);
      Label("vSellProfit", _x, _y, sInfo[3], _clr);
      
      _y += FontSize + 5;
      
      if(_all_result == 0.0) _clr = White; else if(_all_result < 0.0) _clr = Red; else _clr = DeepSkyBlue;
      Label("AllProfit", _max_size, _y, "��������� ������:", BaseColor);
      Label("vAllProfit", _x, _y, sInfo[4], _clr);
            
      _y += FontSize + 5;
      
      if(_dd == 0.0) _clr = White; else _clr = DarkOrange;
      Label("DD", _max_size, _y, "��������:", BaseColor);
      Label("vDD", _x, _y, sInfo[5], _clr);
      
      _y += FontSize + 10;
      
      Label("Balance", _max_size, _y, "������:", BaseColor);
      Label("vBalance", _x, _y, sInfo[6], DeepSkyBlue);
      
      _y += FontSize + 5;
      
      if(_equity_persent > 80) _clr = Green; else if(_equity_persent > 50) _clr = DeepSkyBlue; else if(_equity_persent > 30) _clr = DarkOrange; else _clr = Red;
      Label("Equity", _max_size, _y, "��������:", BaseColor);
      Label("vEquity", _x, _y, sInfo[7], _clr);
      
      _y += FontSize + 5;
      
      Label("Level", _max_size, _y, "�������:", BaseColor);
      Label("vLevel", _x, _y, sInfo[8], DeepSkyBlue);
      
      _y += FontSize + 15;
         
      if(TralPrice > 0.0){         
         Label("vTral", _x, _y, ">>> �������� �������� ���� <<<", DarkOrange);
         _y += FontSize + 5;
      }else{
         if(ObjectFind(sPrefIndPan+"vTral")>-1) ObjectDelete(sPrefIndPan+"vTral");
      }
      
      if(!NewCycle_ON){         
         Label("vNewCycle_ON", _x, _y, ">>> ������ NewCycle <<<", DarkOrange);
         _y += FontSize + 5;
      }else{
         if(ObjectFind(sPrefIndPan+"vNewCycle_ON")>-1) ObjectDelete(sPrefIndPan+"vNewCycle_ON");
      }
      
      if(!PiramidOn && PiramidAutoStart){
         Label("vPiramidAutoStart", _x, _y, ">>> ����������� �������� ��� <<<", DarkOrange);
         _y += FontSize + 5;
      }else{
         if(ObjectFind(sPrefIndPan+"vPiramidAutoStart")>-1) ObjectDelete(sPrefIndPan+"vPiramidAutoStart");
      }
      
      if(StopMartin){
         Label("vStopMartin", _x, _y, ">>> ����������� ���������� ���� <<<", DarkOrange);
         _y += FontSize + 5;
      }else{
         if(ObjectFind(sPrefIndPan+"vStopMartin")>-1) ObjectDelete(sPrefIndPan+"vStopMartin");
      }
      
      if(StopPiramid){
         Label("vStopPiramid", _x, _y, ">>> ����������� �������� ���� <<<", DarkOrange);
         _y += FontSize + 5;
      }else{
         if(ObjectFind(sPrefIndPan+"vStopPiramid")>-1) ObjectDelete(sPrefIndPan+"vStopPiramid");
      }
      
      //---- ������ � ������� ����� �������
      Graph.Delete(sPref);
      // ���������� ������
      int _bar_on_chart = WindowBarsPerChart();
      int _need_bar = _bar_on_chart / 2; 
      int _first_visible_bar = WindowFirstVisibleBar();
      datetime _time_bar = Time[_first_visible_bar] + ((Period()*60) * _need_bar);
      //
      if(AveregeLine > 0.0){
         Graph.HLine.Create(sPref+"AverLine", AveregeLine, BULineColor, STYLE_SOLID, 1);
         Graph.Text.Create(sPref+"txtAverLine",0, _time_bar, AveregeLine, BULineColor, FontSize, 0.0, "������� ��", FontName);
         
         Graph.HLine.Create(sPref+"TPLine", TPLine, TPLineColor, STYLE_SOLID, 1);
         Graph.Text.Create(sPref+"txtTPLine",0, _time_bar, TPLine, TPLineColor, FontSize, 0.0, "������� ��", FontName);
      }
      if(TralStartPrice > 0.0){
         Graph.HLine.Create(sPref+"TralPrice", TralStartPrice, DarkOrange, STYLE_SOLID, 1);
         Graph.Text.Create(sPref+"txtTralPrice",0, _time_bar, TralStartPrice, DarkOrange, FontSize, 0.0, "������ ������ �����", FontName);
      }else
      if(TralPrice > 0.0){
         Graph.HLine.Create(sPref+"TralPrice", TralPrice, DarkOrange, STYLE_SOLID, 1);
         Graph.Text.Create(sPref+"txtTralPrice",0, _time_bar, TralPrice, DarkOrange, FontSize, 0.0, "�������� ����", FontName);
      }
            
      if(MBuyStop > 0.0){
         Graph.HLine.Create(sPref+"MBuyStop", MBuyStop, BuyStopColor, STYLE_SOLID, 1);
         Graph.Text.Create(sPref+"txtMBuyStop",0, _time_bar, MBuyStop, BuyStopColor, FontSize, 0.0, "BUY", FontName);
      }
      if(MSellStop > 0.0){
         Graph.HLine.Create(sPref+"MSellStop", MSellStop, SellStopColor, STYLE_SOLID, 1);
         Graph.Text.Create(sPref+"txtMSellStop",0, _time_bar, MSellStop, SellStopColor, FontSize, 0.0, "SELL", FontName);
      }
      if(PBuyStop > 0.0){
         Graph.HLine.Create(sPref+"PBuyStop", PBuyStop, BuyStopColor, STYLE_SOLID, 1);
         Graph.Text.Create(sPref+"txtPBuyStop",0, _time_bar, PBuyStop, BuyStopColor, FontSize, 0.0, "BUY", FontName);
      }
      if(PSellStop > 0.0){
         Graph.HLine.Create(sPref+"PSellStop", PSellStop, SellStopColor, STYLE_SOLID, 1);
         Graph.Text.Create(sPref+"txtPSellStop",0, _time_bar, PSellStop, SellStopColor, FontSize, 0.0, "SELL", FontName);
      }      
      //---- ����������� �������� ��� ������� ������      
      string _ord_text = "";
      _bar_on_chart = WindowBarsPerChart();
      _need_bar = _bar_on_chart / 4; 
      _first_visible_bar = WindowFirstVisibleBar();
      _time_bar = Time[_first_visible_bar] + ((Period()*60) * _need_bar);
      //
      for(i=OrdersTotal()-1;i>=0;i--){
         if(OrderSelect(i,SELECT_BY_POS)){
            if(OrderSymbol()==Symbol() && (OrderMagicNumber()==MagicMartin || OrderMagicNumber()==MagicPiramid)){
               _ord_text = "Lot:"+DoubleToStr(OrderLots(),iDigitLot)+" Prof:"+DoubleToStr(OrderProfit()+OrderSwap()+OrderCommission(),2);
               Graph.Text.Create(sPref+":"+OrderTicket(),0, _time_bar, OrderOpenPrice(), DeepSkyBlue, FontSize, 0.0, _ord_text, FontName);
            }
         }
      }
   }
}
//+------------------------------------------------------------------+
// �������� / ��������� �������������� ������
void Label(string _name, int _x, int _y, string _text, color _clr){   
   _name = sPrefIndPan+_name;
   if(ObjectFind(_name)==-1){
      Graph.Label.Create(0, _name, _x, _y, 1, _text, FontSize, FontName, _clr);
   }else{
      if(ObjectGet(_name, OBJPROP_COLOR) != _clr) ObjectSet(_name,OBJPROP_COLOR,_clr);
      if(ObjectGet(_name, OBJPROP_XDISTANCE) != _x) ObjectSet(_name,OBJPROP_XDISTANCE,_x);
      if(ObjectGet(_name, OBJPROP_YDISTANCE) != _y) ObjectSet(_name,OBJPROP_YDISTANCE,_y);
      if(ObjectDescription(_name) != _text) ObjectSetText(_name, _text, FontSize);
   }
}
//+------------------------------------------------------------------+
// ������� ������� ������ Horisontal Line ��������� �����, �����
void Graph.HLine.Create(string sName, double _dPrice, color MyColor, int _iStyle, int _iWidth){ObjectCreate(sName,OBJ_HLINE,0,0,_dPrice);ObjectSet(sName,OBJPROP_COLOR,MyColor);ObjectSet(sName,OBJPROP_STYLE,_iStyle); ObjectSet(sName,OBJPROP_WIDTH,_iWidth); }
//+------------------------------------------------------------------+
// ������� ������� ������ Label � �������� ����(�������) ������� � �������� ���������, �������, �������, �������� ������, ������ ������, � ������������ �� ������ � � y
void Graph.Label.Create(int Handle, string NameObject, int x, int y, int Corn, string text, int FontSize, string FontName, color FontColor){ObjectCreate(NameObject, OBJ_LABEL, Handle, 0, 0);ObjectSet(NameObject, OBJPROP_CORNER, Corn); ObjectSet(NameObject, OBJPROP_XDISTANCE, x); ObjectSet(NameObject, OBJPROP_YDISTANCE, y); ObjectSetText(NameObject, text, FontSize, FontName, FontColor);}
//+------------------------------------------------------------------+
// ������� ������� ������ Text � ��������� ����(�������) ������� � �������� ���������, �������, �������, �������� �����, ������ ������, ����� ������� ������
void Graph.Text.Create(string _n,int _h, datetime x, double y, color _c,int _FontSize, double _Angle, string _text, string _FontName){ ObjectCreate(_n, OBJ_TEXT, _h, x, y); ObjectSet(_n, OBJPROP_ANGLE, _Angle); ObjectSetText(_n, _text, _FontSize, _FontName, _c); }
//+------------------------------------------------------------------+
// ���������� �������� ��������� ��������� ������� ������� � �������� ��������� ������� � �������� ������ 
// ����������� ����� ������� ������� 
void GetDCWithFontNameAndSize(string _font_name, int _font_size){      
   DC_hWnd=WindowHandle(Symbol(), Period());
   DC_hnd = GetDC(DC_hWnd);
   int dpi=GetDeviceCaps(DC_hnd,88);  //88=LOGPIXELSX   
   int fontheight = MathRound(_font_size*dpi/72.0);
   DC_hFont=CreateFontA(fontheight,0,0,0,0,0,0,0,DEFAULT_CHARSET,OUT_DEFAULT_PRECIS,CLIP_DEFAULT_PRECIS,DEFAULT_QUALITY,DEFAULT_PITCH|FF_MODERN,_font_name); 
   SelectObject(DC_hnd,DC_hFont);
}
// ����������� ������� DC � Font
void DCRelease(){ ReleaseDC(DC_hWnd,DC_hnd); DeleteObject(DC_hFont); DC_hWnd = 0; DC_hFont = 0; DC_hnd = 0; }
// �������� ������ ������ � ��������
int GetStringSizeInPix(string _str){ int size[2]; GetTextExtentPoint32A(DC_hnd,_str,StringLen(_str),size); return(size[0]+4); }
//+------------------------------------------------------------------+
// ������� ������������ ������� ����� � ��������� 
double Info.Get.MarginLevel(){ double dMarginNow = AccountMargin(); if(dMarginNow==0) dMarginNow = 1; return(NormalizeDouble(((AccountEquity()/dMarginNow)*100),2)); }
//+------------------------------------------------------------------+
// ������� ���������� ���������� � ��������� �������� ������ (����� ��� �� ������)
////// ��������:
// _symbol     - ���������� ��� ������ ������ ("" - ����� �� ���� ������������)
// _type_order - ��� �������� ������ (-1 - ����� ���)
//               ��������� �����:
//               99 - ��� ������
//               10 - Buy � Sell
//               50 - ���������� (BuyStop, BuyLimit, SellStop, SellLimit)
//               51 - BuyStop � BuyLimit
//               52 - SellStop � SellLimit
//               53 - BuyStop � SellStop
//               54 - BuyLimit � SellLimit
// _magic      - ���������� ����� ������ ���:
//               -1 - ����� �� ������� �� ����������� ������
//               99 - ����� �� �������� MagicMartin � MagicPiramid
// _comment    - ������ ������� ������ ��������� ����������� ������ ("" - ����� �� ������� �� ����������� ������)
////// ����������� ������� (���������):
// dblInfo - ������ ��������� ���� (����� ���������� �������� �������):
//           0 - OrderTicket, ����� ������ ������
//           1 - OrderType, ��� ������
//           2 - OrderOpenTime, ����� �������� ������
//           3 - OrderOpenPrice, ���� �������� ������
//           4 - OrderStopLoss, ���� �������� ������� ��� ���������� ������ �����������
//           5 - OrderTakeProfit, ���� �������� ������� ��� ���������� ������ ������������
//           6 - OrderLots, ����� ������
//           7 - OrderMagicNumber, ���������� ����� ������
//           8 - OrderProfit, �������� ������ ������� 
//           9 - OrderCommission, �������� ������������ �������� 
//           10- OrderSwap, �������� �����
// strInfo - ������ ���������� ����:
//           0 - OrderSymbol, ���������� �� �������� ������ ������
//           1 - OrderComment, ����������� ���������� ������
//-// true ���� ���������� �������, false � ��������� ������
bool Orders.Get.LastOpenInfo(string _symbol, int _type_order, int _magic, string _comment, double& dblInfo[], string& strInfo[]){    
   bool res = false; 
   datetime time = 0;
   int ticket = 0; 
   
   for(int i=OrdersTotal()-1;i>=0;i--){ 
      if(OrderSelect(i,SELECT_BY_POS)){ 
         if((time==0 || OrderOpenTime()>time) && 
            (_symbol=="" || OrderSymbol()==_symbol) && 
            (_type_order==-1 || Info.isTypeOrdPartOfGroup(OrderType(), _type_order)) && 
            (_magic==-1 || _magic==OrderMagicNumber() || (_magic==99 && (MagicMartin==OrderMagicNumber() || MagicPiramid==OrderMagicNumber()))) && 
            (_comment=="" || StringFind(OrderComment(),_comment)!=-1)) 
         { 
            time = OrderOpenTime(); 
            ticket = OrderTicket(); 
         } 
      } 
   } 
   if(time>0){ 
      if(OrderSelect(ticket,SELECT_BY_TICKET)){ 
         ArrayResize(dblInfo,11); ArrayInitialize(dblInfo,0); 
         ArrayResize(strInfo,2); 
         dblInfo[0] = OrderTicket(); 
         dblInfo[1] = OrderType(); 
         dblInfo[2] = OrderOpenTime(); 
         dblInfo[3] = OrderOpenPrice(); 
         dblInfo[4] = OrderStopLoss(); 
         dblInfo[5] = OrderTakeProfit(); 
         dblInfo[6] = OrderLots(); 
         dblInfo[7] = OrderMagicNumber(); 
         dblInfo[8] = OrderProfit(); 
         dblInfo[9] = OrderCommission(); 
         dblInfo[10]= OrderSwap(); 
         strInfo[0] = OrderSymbol(); 
         strInfo[1] = OrderComment(); 
         res = true; 
      } 
   } 
   if(!res){ 
      ArrayResize(dblInfo,0); 
      ArrayResize(strInfo,0); 
   } 
   return(res); 
}
//+------------------------------------------------------------------+
// ��������� �������� �� �� � ���������
//-// ���������� true ���� ������ ���� �������
bool CloseByTPAndTral(){
   bool _res = false;
   //
   if(TralPrice > 0.0){
      switch(TralType){
         case OP_BUY:
            if(Bid <= TralPrice){               
               PlaySound("wait.wav");         
               Orders.Close(33, MagicMartin, true, _Symbol, "");
               Orders.Close(33, MagicPiramid, true, _Symbol, "");
               OpenCloseLineDraw();
               
               if(!NewCycle_ON) isWorking = false;
               else{
                  Sleep(PauseTrade2*60000);
               }
               TralPrice = 0.0;
               StopMartin = false;
               StopPiramid = false;
               return(true);
            }else{
               if(NormalizeDouble(Bid-TralPrice,Digits) >= Tral_Size){
                  TralPrice = NormalizeDouble(Bid-Tral_Size,Digits);
               }               
            }
            break;
         case OP_SELL:
            if(Ask >= TralPrice){
               PlaySound("wait.wav");         
               Orders.Close(33, MagicMartin, true, _Symbol, "");
               Orders.Close(33, MagicPiramid, true, _Symbol, "");
               OpenCloseLineDraw();
               
               if(!NewCycle_ON) isWorking = false;
               else{
                  Sleep(PauseTrade2*60000);
               }
               TralPrice = 0.0;
               StopMartin = false;
               StopPiramid = false;
               return(true);
            }else{
               if(NormalizeDouble(TralPrice-Ask,Digits) >= Tral_Size){
                  TralPrice = NormalizeDouble(Ask+Tral_Size,Digits);
               }               
            }
            break;         
      }
   }else{
      // �������� ���������� ������ StartTral
      if(TralStartPrice > 0.0){
         switch(TralType){
            case OP_BUY:
               if(NormalizeDouble(Bid-TralStartPrice,Digits) >= 0.0){
                  TralPrice = NormalizeDouble(Bid-Tral_Size,Digits);
                  PlaySound("wait.wav");         
                  Orders.Close(2, MagicPiramid, true, _Symbol, "");
                  Orders.Close(2, MagicMartin, true, _Symbol, "");
                  OpenCloseLineDraw();
                  
                  TralStartPrice = 0.0;
                  return(true);
               }
               break;
            case OP_SELL:
               if(NormalizeDouble(TralStartPrice-Ask,Digits) >= 0.0){
                  TralPrice = NormalizeDouble(Ask+Tral_Size,Digits);
                  PlaySound("wait.wav");         
                  Orders.Close(0, MagicPiramid, true, _Symbol, "");
                  Orders.Close(0, MagicMartin, true, _Symbol, "");
                  OpenCloseLineDraw();
                  
                  TralStartPrice = 0.0;
                  return(true);
               }
               break;
         }
      }      
      // ���������� �������� ������ Buy � Sell
      double _buy_lot = Orders.Get.OpenLot(_Symbol, OP_BUY, 99, "", 0, 0);
      double _sell_lot = Orders.Get.OpenLot(_Symbol, OP_SELL, 99, "", 0, 0);
      // ��������� ����� ����������� ����� ������� �����
      int _type_ord_tp = EMPTY; if(_buy_lot > _sell_lot) _type_ord_tp = OP_BUY; else if(_buy_lot < _sell_lot) _type_ord_tp = OP_SELL;
      // ��������� ������� ���� ��� ������������ ����
      double _aver_price = 0.0;      
      double _tp_line = 0.0;
      //
      switch(_type_ord_tp){
         case OP_BUY:
            //_aver_price = Orders.Get.AveragePrice(_Symbol, OP_BUY, 99, "", 0, 0);
            _aver_price = AveragePriceAllSeries(_buy_lot, _sell_lot);
            _tp_line = NormalizeDouble(_aver_price + DefaultProfit,Digits);
            // ���� ���������� ����� ��
            if(Bid >= _tp_line){
               // ������ ��� ���������� ������
               MBuyStop    = 0.0;
               MBuyStopLot = 0.0;
               MBuyStopNumb= 0.0;                        
               PSellStop    = 0.0;
               PSellStopLot = 0.0;
               PSellStopNumb= 0.0;
               // �������� ����� �� ������� ��� ������ ����� ��� ������ ����� - ��������� �������
               if(!Trall_on){
                  // �������� ���� ������ ������� ��������
                  PlaySound("wait.wav");         
                  Orders.Close(33, MagicMartin, true, _Symbol, "");
                  Orders.Close(33, MagicPiramid, true, _Symbol, "");
                  OpenCloseLineDraw();
                  
                  if(!NewCycle_ON) isWorking = false;
                  _res = true;
               }else{
                  // ��������� ������� ������ ���������
                  TralStartPrice = NormalizeDouble(_tp_line+Tral_Start,Digits); 
                  TralType = OP_BUY;
               }
            }else{
               TralStartPrice = 0.0;
               TralType = EMPTY;
            }
            break;
         case OP_SELL:
            //_aver_price = Orders.Get.AveragePrice(_Symbol, OP_SELL, 99, "", 0, 0);
            _aver_price = AveragePriceAllSeries(_buy_lot, _sell_lot);
            _tp_line = NormalizeDouble(_aver_price - DefaultProfit,Digits);
            // ���� ���������� ����� ��
            if(Ask <= _tp_line){
               // ������ ��� ���������� ������
               MSellStop    = 0.0;
               MSellStopLot = 0.0;
               MSellStopNumb= 0.0;   
               PBuyStop    = 0.0;
               PBuyStopLot = 0.0;
               PBuyStopNumb= 0.0;                  
               // �������� ����� �� ������� ��� ������ ����� ��� ������ ����� - ��������� �������
               if(!Trall_on){
                  // �������� ���� ������ ������� ��������
                  PlaySound("wait.wav");         
                  Orders.Close(33, MagicMartin, true, _Symbol, "");
                  Orders.Close(33, MagicPiramid, true, _Symbol, "");
                  OpenCloseLineDraw();
                  
                  if(!NewCycle_ON) isWorking = false;
                  _res = true;                  
               }else{
                  // ��������� ������� ������ ���������                    
                  TralStartPrice = NormalizeDouble(_tp_line-Tral_Start,Digits); 
                  TralType = OP_SELL;                  
               }
            }else{
               TralStartPrice = 0.0;
               TralType = EMPTY;
            }
            break;
      }
      //
      AveregeLine = _aver_price;
      TPLine = _tp_line;
   }
   return(_res);
}
//+------------------------------------------------------------------+
// ������� ����������� ������� ���� ���� �������� ������� ������ �����������
double AveragePriceAllSeries(double _buy_lot, double _sell_lot){
   double _res = 0.0;
   double _buy_aver_price = Orders.Get.AveragePrice(_Symbol, OP_BUY, 99, "", 0, 0);
   double _sell_aver_price = Orders.Get.AveragePrice(_Symbol, OP_SELL, 99, "", 0, 0);   
   double _lock_point = NormalizeDouble((_sell_aver_price-_buy_aver_price)/Point,0);
   double _lock_in_currency = 0.0;
   double _price_of_point = Info.Get.PriceOfPoint(_Symbol);
   
   if(_buy_lot < _sell_lot) _lock_in_currency = NormalizeDouble(_lock_point*(_price_of_point*_buy_lot),2);
   else{ 
      if(_lock_point > 0) _lock_point = -_lock_point;
      else _lock_point = MathAbs(_lock_point);
      _lock_in_currency = NormalizeDouble(_lock_point*(_price_of_point*_sell_lot),2);
   }
   
   double _target_lot = NormalizeDouble(MathAbs(_buy_lot-_sell_lot),iDigitLot);
   int _target_pip = _lock_in_currency / (_target_lot * _price_of_point);
   double _target_point = NormalizeDouble(_target_pip*Point,Digits);
   
   if(_buy_lot > _sell_lot){
      _res = NormalizeDouble(_buy_aver_price + _target_point,Digits);
   }else{
      _res = NormalizeDouble(_sell_aver_price + _target_point,Digits);
   }   
   return(_res);
}
//+------------------------------------------------------------------+
//������� ��������� ��������� ������ ������ �� �������� ���� � ������ �������� � ������� �� 1 ���
double Info.Get.PriceOfPoint(string B){RefreshRates();double S = 0; if(B!=""){S = MarketInfo(B,MODE_TICKVALUE)/(MarketInfo(B,MODE_TICKSIZE)/MarketInfo(B,MODE_POINT));}return(S);}
//+------------------------------------------------------------------+
// ������� ����������� ������� ���� � ������� �� �������� ����������
// _symbol - ���������� ("", ����� ����������)
// _type   - ��� ������� (-1, ����� ��� �������)
// _magic  - ���������� ����� ������� ��������� ���:
//           -1 - �� ������ ����������� ������
//           99 - ����� �� �������� MagicMartin � MagicPiramid
// _comm   - ������ ������� ������ ����������� � ����������� ("", � ����� ������������)
// minOpenTime - ����� �������� ������ ������ ���� ������ ��� ����� ��������� (0 - �� ������������)
// maxOpenTime - ����� �������� ������ ������ ���� ������ ��� ����� ��������� (0 - �� ������������)
//-// ������������ ��������: ������� ���� ��� 0 � ��������� ������
double Orders.Get.AveragePrice(string _symbol, int _type, int _magic, string _comm, datetime minOpenTime, datetime maxOpenTime){ 
   double dRes = 0, dSumLot; 
   
   for(int i=OrdersTotal()-1;i>=0;i--){ 
      if(OrderSelect(i,SELECT_BY_POS)){ 
         if((_symbol=="" || OrderSymbol()==_symbol) && 
            (_magic==-1 || OrderMagicNumber()==_magic || (_magic==99 && (OrderMagicNumber()==MagicMartin || OrderMagicNumber()==MagicPiramid))) && 
            (_type==-1 || OrderType()==_type) && 
            (_comm=="" || StringFind(OrderComment(),_comm)!=-1) && 
            (minOpenTime==0 || OrderOpenTime()>=minOpenTime) && 
            (maxOpenTime==0 || OrderOpenTime()<=maxOpenTime))
         { 
            dRes += OrderOpenPrice()*OrderLots(); 
            dSumLot += OrderLots(); 
         } 
      } 
   } 
   dRes = NormalizeDouble(dRes/dSumLot,MarketInfo(_symbol,MODE_DIGITS)); 
   return(dRes); 
}
//+------------------------------------------------------------------+
// ������� ��������� ���-�� �������� �����
// _symbol - ���������� ("", ����� ����������)
// _type   - ��� ������� (-1, ����� ��� �������)
//           ��������� �����:
//           99 - ��� ������
//           10 - Buy � Sell
//           50 - ���������� (BuyStop, BuyLimit, SellStop, SellLimit)
//           51 - BuyStop � BuyLimit
//           52 - SellStop � SellLimit
//           53 - BuyStop � SellStop
//           54 - BuyLimit � SellLimit
// _magic  - ���������� ����� ������� ��������� ���:
//           -1 - �� ������ ����������� ������
//           99 - ����� �� �������� MagicMartin � MagicPiramid
// _comm   - ������ ������� ������ ����������� � ����������� ("", � ����� ������������)
// minOpenTime - ����� �������� ������ ������ ���� ������ ��� ����� ��������� (0 - �� ������������)
// maxOpenTime - ����� �������� ������ ������ ���� ������ ��� ����� ��������� (0 - �� ������������)
//-// ���������� ���-�� �������� ������� ��� 0
double Orders.Get.OpenLot(string _symbol, int _type, int _magic, string _comm, datetime minOpenTime, datetime maxOpenTime){ 
   int a1,order_type; 
   double lot=0; 
   
   for(a1=OrdersTotal()-1;a1>=0;a1--){ 
      if(OrderSelect(a1,SELECT_BY_POS)){ 
         if((_symbol=="" || OrderSymbol()==_symbol) && 
            (_magic==-1 || OrderMagicNumber()==_magic || (_magic==99 && (OrderMagicNumber()==MagicMartin || OrderMagicNumber()==MagicPiramid))) && 
            (_comm=="" || StringFind(OrderComment(),_comm)!=-1) && 
            (minOpenTime==0 || OrderOpenTime()>=minOpenTime) && 
            (maxOpenTime==0 || OrderOpenTime()<=maxOpenTime))
         { 
            if(_type==99){
               lot +=OrderLots(); 
            }else{ 
               order_type = OrderType(); 
               if((_type==OP_BUY || _type==10) && order_type==OP_BUY) lot +=OrderLots(); 
               if((_type==OP_SELL || _type==10) && order_type==OP_SELL)lot+=OrderLots(); 
               if((_type==OP_SELLSTOP  || _type==50 || _type==52 || _type==53) && order_type==OP_SELLSTOP) lot+=OrderLots(); 
               if((_type==OP_BUYSTOP   || _type==50 || _type==51 || _type==53) && order_type==OP_BUYSTOP)  lot+=OrderLots(); 
               if((_type==OP_SELLLIMIT || _type==50 || _type==52 || _type==54) && order_type==OP_SELLLIMIT)lot+=OrderLots(); 
               if((_type==OP_BUYLIMIT  || _type==50 || _type==51 || _type==54) && order_type==OP_BUYLIMIT) lot+=OrderLots(); 
            } 
         } 
      } 
   } 
   return(lot); 
}
//+------------------------------------------------------------------+
// �������� ���������� ���������� �������
void OpenVirtPendOrd(){
   if(Metod==2){
      if(MSellStop > 0.0){         
         if(Bid <= MSellStop){            
            SendOrder(OP_SELL, MSellStopLot, Bid, MagicMartin, MSellStopNumb+":martin");
            
            Sleep(PauseTrade*1000);
         
            MSellStop = 0.0;
            MSellStopLot = 0.0;
            MSellStopNumb = 0;
         }
      }
      if(MBuyStop > 0.0){
         if(Ask >= MBuyStop){
            SendOrder(OP_BUY, MBuyStopLot, Ask, MagicMartin, MBuyStopNumb+":martin");            
               
            Sleep(PauseTrade*1000);
         
            MBuyStopLot = 0.0;
            MBuyStopNumb = 0;
            MBuyStop = 0.0;
         }
      }
      if(PSellStop > 0.0){
         if(Bid <= PSellStop){
            SendOrder(OP_SELL, PSellStopLot, Bid, MagicPiramid, PSellStopNumb+":piramid");
               
            Sleep(PauseTrade*1000);
                     
            PSellStopLot = 0.0;
            PSellStopNumb = 0;
            PSellStop = 0.0;
         }
      }
      if(PBuyStop > 0.0){
         if(Ask >= PBuyStop){
            SendOrder(OP_BUY, PBuyStopLot, Ask, MagicPiramid, PBuyStopNumb+":piramid");
               
            Sleep(PauseTrade*1000);
         
            PBuyStopLot = 0.0;
            PBuyStopNumb = 0;            
            PBuyStop = 0.0;
         }
      }
   }
}
//+------------------------------------------------------------------+
// ��������� �������� ����������� ���������� ������� �������� �� �������� ��� �������� ��� ������ 2
void TrailVirtPendOrd(){
   double _val = 0.0;
   if(Metod==2){
      if(MSellStop > 0.0){         
         if(NormalizeDouble(Bid-MSellStop,Digits) > Step){
            _val = NormalizeDouble(Bid-Dist,Digits);
            if(_val > MSellStop) MSellStop = _val;
         }
      }
      if(MBuyStop > 0.0){
         if(NormalizeDouble(MBuyStop-Ask,Digits) > Step){
            _val = NormalizeDouble(Ask+Dist,Digits);
            if(_val < MBuyStop) MBuyStop = _val;            
         }
      }
      if(PSellStop > 0.0){
         if(NormalizeDouble(Bid-PSellStop,Digits) > Step){
            _val = NormalizeDouble(Bid-Dist,Digits);
            if(_val > PSellStop) PSellStop = _val;
         }
      }
      if(PBuyStop > 0.0){
         if(NormalizeDouble(PBuyStop-Ask,Digits) > Step){
            _val = NormalizeDouble(Ask+Dist,Digits);
            if(_val < PBuyStop) PBuyStop = _val;
         }
      }               
   }
}
//+------------------------------------------------------------------+
// ��������� ������ ��� ���������� ��������� ������ � ������ ��������
// ���������� true ���� �������� ���������� � false ���� ���
bool CloseByStopLoss(){
   bool _res = false;
   if(StopLoss > 0.0){
      double _all_result = Orders.Get.Profit(99, 11, _Symbol, "");
      if(_all_result <= -StopLoss){         
         PlaySound("wait.wav");
         Orders.Close(33, MagicMartin, true, _Symbol, "");
         Orders.Close(33, MagicPiramid, true, _Symbol, "");
         OpenCloseLineDraw();
         
         if(!NewCycle_ON){
            isWorking = false;
         }else{
            Sleep(PauseTrade2*60000);
         }
         _res = true;
         
         StopMartin = false;
         StopPiramid = false;
      }
   }
   return(_res);
}
//+------------------------------------------------------------------+
// ��������� �������� ��� ���������� �������� ��������
void EnablePiramid(){
   if(!PiramidOn && PiramidStart > 0.0 && !PiramidAutoStart){
      double _all_result = MathAbs(Orders.Get.Profit(99, 11, _Symbol, ""));
      if(NormalizeDouble((_all_result/AccountBalance())*100,2) >= PiramidStart) PiramidAutoStart = true;
   }
}
//+------------------------------------------------------------------+
// ������� ������ ����� ����� ������ �������� � �������� �������
void OpenCloseLineDraw(){
   // ������ � ������ ������
   if(Info && !IsTesting() && !IsOptimization()){
      string _name = "";
      color _clr = CLR_NONE;
      for(int i=OrdersHistoryTotal()-1;i>=0;i--){
         if(OrderSelect(i,SELECT_BY_POS,MODE_HISTORY)){
            if(OrderSymbol()==Symbol() && (OrderMagicNumber() == MagicMartin || OrderMagicNumber() == MagicPiramid) && OrderType()<2){
               _name = "close line by #"+OrderTicket();
               if(ObjectFind(_name)==-1){
                  if(OrderType()==OP_BUY) _clr = Blue; else _clr = Red;
                  Graph.TrendLine.Create(_name, 0, OrderOpenTime(), OrderOpenPrice(), OrderCloseTime(), OrderClosePrice(), false, _clr, STYLE_DOT, 1);
               }
            }            
         }      
      }   
   }
}
//+------------------------------------------------------------------+
// ������� ������� ������ Trend Line � �������� ����(��� ����) �������, � �������� ������, ������������, ������������� ���� ��� �����, �����, ����� ����� � �� ���� ����� 
void Graph.TrendLine.Create(string sName, int _iHandle, datetime _x1, double _y1, datetime _x2, double _y2, bool _isRay, color _MyColor, int _iStyle, int _Width){ ObjectCreate(sName, OBJ_TREND, _iHandle, _x1, _y1, _x2, _y2); ObjectSet(sName, OBJPROP_RAY, _isRay); ObjectSet(sName, OBJPROP_COLOR, _MyColor); ObjectSet(sName, OBJPROP_STYLE, _iStyle); ObjectSet(sName,OBJPROP_WIDTH,_Width); }
//+------------------------------------------------------------------+
// ������� �������� ������� ������ �� ����� ��� ���������� �������� 
// _m - ���������� ����� ������� ���:
//      -1 - �� �����������
//      99 - ����� �� �������� MagicMartin � MagicPiramid
// _type   - ��� ������� (-1, ����� ��� �������), ��������� ���������:
//           11 - �������� �������
//           12 - ���������� ������
// _s      - ���������� (-1, ����� ����������)
// _scomm  - ������ ������� ������ ����������� � ����������� ("", � ����� ������������)
double Orders.Get.Profit(int _m, int _type, string _s, string _scomm){ 
   double dRes = 0; 
   for(int i=OrdersTotal()-1;i>=0;i--){ 
      if(OrderSelect(i,SELECT_BY_POS)){ 
         if((_m==-1 || OrderMagicNumber()==_m || (_m==99 && (MagicMartin==OrderMagicNumber() || MagicPiramid==OrderMagicNumber()))) && 
            (_s=="" || _s==OrderSymbol()) && 
            (_scomm=="" || StringFind(OrderComment(),_scomm)!=-1) && 
            (_type==-1 || _type==OrderType() || (_type==11 && OrderType()<2) || (_type==12 && OrderType()>1)))
         { 
            dRes += OrderProfit()+OrderCommission()+OrderSwap(); 
         } 
      } 
   } 
   return(NormalizeDouble(dRes,2)); 
}
//+------------------------------------------------------------------+
// ������� ���������� ����� ���������� ������ � ����������� �� ����
// 0 - �������� ������ ������� �������
double GetLot(int _type=1, double _lst_lot = 0.0, int _number_order = 0){
   double _res = 0.0;   
   switch(_type){
      case 1:  // ��� ��� ������ �������
         if(Risk==0.0){
            _res = DefaultLot;
         }else{
            _res = Info.Lot.PersentOfDeposit(_Symbol, Risk, iDigitLot);
         }
         break;
      case 2:  // ��� ��� ������ ������
         _res = NormalizeDouble(_lst_lot*GetMartinLotExponent(_number_order),iDigitLot);         
         break;
      case 3:  // ��� ��� ������ ��������
         _res = NormalizeDouble(_lst_lot*GetPiramidLotExponent(_number_order),iDigitLot);         
         break;
   }
   return(_res);
}
//+------------------------------------------------------------------+
// �������� �������
void SendOrder(int _type, double _dlot, double _price, int _magic, string _comment){   
   // ����������� �������� ������� ���� 
   if(_dlot > MaxLot) _dlot = MaxLot;
   // �������� ������� �� �������� ������
   Orders.Open(Info.Get.TypeTrdOperInInterFrm(_type), _dlot, _price, _Symbol, _comment, 0.0, 0.0, iDigitLot, Slippege, _magic, iTicket);
   // ������ �� ��� ������ - ����������� ������
   if(iTicket < 0){
      // ���� ������� �������� ������� ������ �����
      if(_comment == "1:start"){
         Alert("��������!����������� ������ ��� �������� ������� ������ �����!����� �� ��� ������!");
      }
      PlaySound("stops.wav");
   }else{
      PlaySound("ok.wav");
   }
}
//+------------------------------------------------------------------+
// ���������� true ���� ���������� ���������� �������� ������ ������� ����� ��������� ������
bool fStopMartin(int _number_order){
   bool _res = false;
   if(MartinOnNew && _number_order >= LotNoM){
      _res = true;
      StopMartin = true;
   }
   return(_res);
}
//+------------------------------------------------------------------+
// ���������� true ���� ���������� ���������� �������� ������� � �������� ����� ��������� ������
bool fStopPiramid(int _number_order){
   bool _res = false;
   if(PiramidOnNew && _number_order >= LotNoP){
      _res = true;
      StopPiramid = true;
   }
   return(_res);
}
//+------------------------------------------------------------------+
// ���������� ���-�� ������� �� ���� �������� ����������� ������ ��� �������� ������ ������ ������
double GetMartinStepPip(int _number_order){
   double _res = MartinStep;
   if(MartinOnNew && _number_order >= LotN_M){
      if(MartinK_Step > 0.0){
         _res = MartinStepNew * MathPow(MartinK_Step,_number_order-LotN_M);
      }else _res = MartinStepNew;
   }
   return(_res);
}
//+------------------------------------------------------------------+
// ���������� ���-�� ������� �� ���� �������� ����������� ������ ��� �������� ������ ������ � ��������
double GetPiramidStepPip(int _number_order){
   double _res = 0.0;
   if(Metod==2 && PiramidOn && MartinOn){
      _res = MartinStep;
      if(MartinOnNew && _number_order >= LotN_M){
         _res = MartinStepNew;
      }
   }else{
      _res = PiramidStep;
      if(PiramidOnNew && _number_order >= LotN_P){
         _res = PiramidStepNew;
      }
   }
   return(_res);
}
//+------------------------------------------------------------------+
// ���������� ��������� ���� ��� �������� ������ ������
double GetMartinLotExponent(int _number_order){
   double _res = MartinLotExponent;
   if(MartinOnNew && _number_order >= LotN_M){
      _res = MartinLotExponenNew;
   }
   return(_res);
}
//+------------------------------------------------------------------+
// ���������� ��������� ���� ��� �������� ������ � ��������
double GetPiramidLotExponent(int _number_order){
   double _res = PiramidLotExponent;
   if(PiramidOnNew && _number_order >= LotN_P){
      _res = PiramidLotExponenNew;
   }
   return(_res);
}
//+------------------------------------------------------------------+
// ������������ ���� �������� �������� MT �� ���������� ������������� ��� ������� Order.Open
// _type - ��� �������� ��������
//-// ��������� ��� �������� �������� �� ���������� ������������� ��� -1
int Info.Get.TypeTrdOperInInterFrm(int _type){ int _res = -1; switch(_type){ case OP_BUY: _res = 1; break; case OP_SELL: _res = 2; break; case OP_BUYSTOP: _res = 3; break; case OP_SELLSTOP: _res = 4; break; case OP_BUYLIMIT: _res = 5; break; case OP_SELLLIMIT: _res = 6; break; } return(_res); }  
//+------------------------------------------------------------------+
// ������� ����������� ��� �� ��������� ��������� �������� �� ��������
// _Symb       - ���������� �� �������� ����� ������� �������
// _dPersent   - ������� �� ��������
// _iDigitLot  - �������� ����
// _isCalcRealPos - ��������� ������� �������� ������� (true - ��, false - ���). ��� ���� ����������� ������� � ������������ ��
// _imagic - ���������� ����� ������� ������� ����� ��������� (-1, ��������� ��� ������), �� ��������� -1
//-// ���������� ������ ������������ ����
double Info.Lot.PersentOfDeposit(string _Symb, double _dPersent, int _iDigitLot){ 
   double dL = 0; 
   double One_Lot = MarketInfo(_Symb,MODE_MARGINREQUIRED); 
   double Balance = AccountEquity(); 
   double dPriceP = 0; 
   double dLossRes = 0; 
   int iTypeOrder = 0; 
   
   dL = NormalizeDouble(Balance*_dPersent/100/One_Lot,_iDigitLot); 
   if(dL<MarketInfo(_Symb,MODE_MINLOT)){ 
      Print("����������� ���("+dL+") ������ ������������("+MarketInfo(_Symb,MODE_MINLOT)+"). ��� ������� �� �����������."); 
      dL=MarketInfo(_Symb,MODE_MINLOT); 
   } 
   if(dL>MarketInfo(_Symb,MODE_MAXLOT)){ 
      Print("����������� ���("+dL+") ������ �������������("+MarketInfo(_Symb,MODE_MAXLOT)+"). ��� ������� �� ������������."); 
      dL=MarketInfo(_Symb,MODE_MAXLOT); 
   } 
   return(dL); 
}
//+------------------------------------------------------------------+
// ��������� ��������� �����������
//void Log(string _str){ if(Info) Print("_str"); }
//+------------------------------------------------------------------+
// ��������� ��������� ����������� ��� �������
//void Debug(string _str){ Print("DEBUG :: "+_str); }
//+------------------------------------------------------------------+
// ��������� ����� �������� � ������� �� ���-�� ������ � ����������
// symbol - ���������� �� �������� ������������ �������� ���������
// v - �������� ���������� �� ������, ������� ����� ��������������
//--// �� ���������� ��������
void Info.ChangeToDigit(string symbol, double& v) { v *= MarketInfo(symbol,MODE_TICKSIZE); return; }
//+------------------------------------------------------------------+
// ������� ������� ������� ����� ������� �������� ���������� ������
void Graph.Delete(string _sName){ for(int i=0;i<ObjectsTotal();i++){ if(StringFind(ObjectName(i),_sName,0)!=-1){ ObjectDelete(ObjectName(i)); i=-1; } } }
//+------------------------------------------------------------------++
// ������������� ���������� �������� ������ �������
// _symbol - �������� �����������
// _volume - ����� ������� ����� ���������
// _round_met - ������ ����������� (false - ���� (�� ���������), true - �����) 
double Info.NormalizeVolume(string _symbol, double _volume, bool _round_met=false, bool _pre_round = true){ double new_volume = -1, k; if (_symbol=="") _symbol=Symbol(); double lot_step=MarketInfo(_symbol, MODE_LOTSTEP); double min_lot=MarketInfo(_symbol, MODE_MINLOT); double max_lot=MarketInfo(_symbol, MODE_MAXLOT); int digit_lot = Info.Get.LotDigit(_symbol); if(_pre_round) _volume = NormalizeDouble(_volume,digit_lot); if(min_lot>0 && max_lot>0){ if (lot_step>0) k=1/lot_step; else k=1/min_lot; if (_round_met) new_volume = MathCeil(_volume*k)/k; else new_volume = MathFloor(_volume*k)/k; if (new_volume<min_lot) new_volume=min_lot;  if (new_volume>max_lot) new_volume=max_lot; if(NormalizeDouble(_volume-new_volume,digit_lot)!=0) Print("Info.NormalizeVolume : ��� ("+DoubleToStr(_volume,digit_lot)+") ��� �������� �� "+DoubleToStr(new_volume,digit_lot)); } return(NormalizeDouble(new_volume,digit_lot)); }
//+------------------------------------------------------------------++
//������� ���������� �������� ����
// symbol - ���������� �� �������� ������������� �������� ��������
//--// ���-�� ������ ����� ������� ��� 0
int Info.Get.LotDigit(string symbol){ return(MathCeil(MathAbs(MathLog( MarketInfo(Symbol(), MODE_MINLOT) )/MathLog(10)))); }
//+------------------------------------------------------------------+
// ������� ������� ���-�� �������
// _symbol - ���������� ("", ����� ����������)
// _type   - ��� ������� (-1, ����� ��� �������)
//           ��������� �����:
//           99 - ��� ������
//           10 - Buy � Sell
//           50 - ���������� (BuyStop, BuyLimit, SellStop, SellLimit)
//           51 - BuyStop � BuyLimit
//           52 - SellStop � SellLimit
//           53 - BuyStop � SellStop
//           54 - BuyLimit � SellLimit
// _magic  - ���������� ����� ������� ��������� (-1, �� ������ ����������� ������)
// _comm   - ������ ������� ������ ����������� � ����������� ("", � ����� ������������)
// minOpenTime - ����� �������� ������ ������ ���� ������ ��� ����� ��������� (0 - �� ������������)
// maxOpenTime - ����� �������� ������ ������ ���� ������ ��� ����� ��������� (0 - �� ������������)
//-// ���������� ���-�� �������� ������� ��� 0
int Orders.Get.Count(string _symbol, int _type, int _magic, string _comm, datetime minOpenTime, datetime maxOpenTime){ int iCount=0; if(OrdersTotal()<=0) return(0); for(int a1=OrdersTotal()-1;a1>=0;a1--){ if(OrderSelect(a1,SELECT_BY_POS)){ if((_symbol=="" || _symbol==OrderSymbol()) && (_magic==-1 || _magic==OrderMagicNumber()) && (_comm=="" || StringFind(OrderComment(),_comm)!=-1) &&  (minOpenTime==0 || OrderOpenTime()>=minOpenTime) && (maxOpenTime==0 || OrderOpenTime()<=maxOpenTime)){ if(_type==99){ iCount++; }else{ switch(OrderType()){ case OP_BUY: if(_type==OP_BUY || _type==10) iCount++; break; case OP_BUYSTOP: if(_type==OP_BUYSTOP || _type==50 || _type==51 || _type==53) iCount++; break; case OP_BUYLIMIT: if(_type==OP_BUYLIMIT || _type==50 || _type==51 || _type==54) iCount++; break; case OP_SELL: if(_type==OP_SELL || _type==10) iCount++; break; case OP_SELLSTOP: if(_type==OP_SELLSTOP || _type==50 || _type==52 || _type==53) iCount++; break; case OP_SELLLIMIT: if(_type==OP_SELLLIMIT || _type==50 || _type==52 || _type==54) iCount++; break; } } } } } return(iCount); }
//+------------------------------------------------------------------+
// ������� ������������� ������
// 1 - Buy, 2 - Sell, 3 - BuyStop, 4 - SellStop, 5 - BuyLimit, 6 - SellLimit
void Orders.Open(int type_order, double Lot, double price, string SymbolSend, string Comm, double SL, double TP, int dlot, int slip, int mag, int& tick, color clr=CLR_NONE)
{int l_error_64, l_error_130=0; double takeprofit, stoplosse;
switch(type_order){
  case 1 :
      while(true){
       if(IsTradeAllowed())
       {RefreshRates();          
          tick = OrderSend(SymbolSend,OP_BUY,NormalizeDouble(Lot,dlot),NormalizeDouble(MarketInfo(SymbolSend,MODE_ASK),MarketInfo(SymbolSend,MODE_DIGITS)),slip,0,0,Comm,mag,0,clr);
          if(tick==-1) { if(Error.Check(GetLastError(),l_error_130)) return; }else{ break; }
          continue;
      } }
      if(tick!=-1 && (SL!=0 || TP!=0)){  
          while(true){
            if(IsTradeAllowed()){
              RefreshRates();
               if(OrderSelect(tick,SELECT_BY_TICKET)){                  
                  if(SL==0) { stoplosse = 0; }else{ stoplosse = OrderOpenPrice()-SL; }
                  if(TP==0) { takeprofit = 0;}else{ takeprofit= OrderOpenPrice()+TP; }
                 if(OrderModify(OrderTicket(),OrderOpenPrice(),NormalizeDouble(stoplosse,MarketInfo(SymbolSend,MODE_DIGITS)),NormalizeDouble(takeprofit,MarketInfo(SymbolSend,MODE_DIGITS)),0)) break;
                 if(Error.Check(GetLastError(),l_error_130)) break;
                 continue;                 
               }else{ Print("OrderSelectError "+GetLastError()); }
      } } }        
      break;
  case 2 :
      while(true){   
       if(IsTradeAllowed()){
          RefreshRates();
          tick = OrderSend(SymbolSend,OP_SELL,NormalizeDouble(Lot,dlot),NormalizeDouble(MarketInfo(SymbolSend,MODE_BID),MarketInfo(SymbolSend,MODE_DIGITS)),slip,0,0,Comm,mag,0,clr);
          if(tick==-1) { if(Error.Check(GetLastError(),l_error_130)) return(-1); }else{ break; }
          continue;
      } }
      if(tick!=-1 && (SL!=0 || TP!=0)){  
          while(true){
            if(IsTradeAllowed()){
               RefreshRates();
               if(OrderSelect(tick,SELECT_BY_TICKET)){                  
                  if(SL==0) { stoplosse = 0; }else{ stoplosse = OrderOpenPrice()+SL; }
                  if(TP==0) { takeprofit = 0;}else{ takeprofit= OrderOpenPrice()-TP; }
                 if(OrderModify(OrderTicket(),OrderOpenPrice(),NormalizeDouble(stoplosse,MarketInfo(SymbolSend,MODE_DIGITS)),NormalizeDouble(takeprofit,MarketInfo(SymbolSend,MODE_DIGITS)),0)) break;
                 if(Error.Check(GetLastError(),l_error_130)) break;
                 continue;                 
               }else{ Print("OrderSelectError "+GetLastError()); }
      } } }        
     break;  
  case 3 :
      while(true){   
       if(IsTradeAllowed()){
          RefreshRates();
          if(SL==0) { stoplosse = 0; }else{ stoplosse = price-SL;}
          if(TP==0) { takeprofit = 0;}else{ takeprofit= price+TP;}
          tick = OrderSend(SymbolSend,OP_BUYSTOP,NormalizeDouble(Lot,dlot),NormalizeDouble(price,MarketInfo(SymbolSend,MODE_DIGITS)),slip,NormalizeDouble(stoplosse,MarketInfo(SymbolSend,MODE_DIGITS)),NormalizeDouble(takeprofit,MarketInfo(SymbolSend,MODE_DIGITS)),Comm,mag,0,clr);
          if(tick==-1){if(Error.Check(GetLastError(),l_error_130)) break;}else{ break; }
          continue;   
      } }                
      break;
  case 4 :
      while(true){   
         if(IsTradeAllowed()){
            RefreshRates();             
             if(SL==0) { stoplosse = 0; }else{ stoplosse = price+SL;}
             if(TP==0) { takeprofit = 0;}else{ takeprofit= price-TP;}
             tick = OrderSend(SymbolSend,OP_SELLSTOP,NormalizeDouble(Lot,dlot),NormalizeDouble(price,MarketInfo(SymbolSend,MODE_DIGITS)),slip,NormalizeDouble(stoplosse,MarketInfo(SymbolSend,MODE_DIGITS)),NormalizeDouble(takeprofit,MarketInfo(SymbolSend,MODE_DIGITS)),Comm,mag,0,clr);
             if(tick==-1){if(Error.Check(GetLastError(),l_error_130)) break;}else{ break; }
             continue;    
      } }   
     break; 
  case 5 :
      while(true){   
         if(IsTradeAllowed()){
            RefreshRates();             
             if(SL==0) { stoplosse = 0; }else{ stoplosse = price-SL;}
             if(TP==0) { takeprofit = 0;}else{ takeprofit= price+TP;}
             tick = OrderSend(SymbolSend,OP_BUYLIMIT,NormalizeDouble(Lot,dlot),NormalizeDouble(price,MarketInfo(SymbolSend,MODE_DIGITS)),slip,NormalizeDouble(stoplosse,MarketInfo(SymbolSend,MODE_DIGITS)),NormalizeDouble(takeprofit,MarketInfo(SymbolSend,MODE_DIGITS)),Comm,mag,0,clr);
             if(tick==-1){if(Error.Check(GetLastError(),l_error_130)) break;}else{ break; }
             continue;    
      } }   
     break;
  case 6 :
      while(true){   
         if(IsTradeAllowed()){
            RefreshRates();             
             if(SL==0) { stoplosse = 0; }else{ stoplosse = price+SL;}
             if(TP==0) { takeprofit = 0;}else{ takeprofit= price-TP;}
             tick = OrderSend(SymbolSend,OP_SELLLIMIT,NormalizeDouble(Lot,dlot),NormalizeDouble(price,MarketInfo(SymbolSend,MODE_DIGITS)),slip,NormalizeDouble(stoplosse,MarketInfo(SymbolSend,MODE_DIGITS)),NormalizeDouble(takeprofit,MarketInfo(SymbolSend,MODE_DIGITS)),Comm,mag,0,clr);
             if(tick==-1){if(Error.Check(GetLastError(),l_error_130)) break;}else{ break; }
             continue;    
      } }   
     break;
} }
//+------------------------------------------------------------------+
// ������ ��������� ������
//33 - all, 0 - buy, 2 - sell, 11 - buystop and buylimit, 21 - sellstop and selllimit, 
//31 - selllimit and buylimit, 41 - buystop and sellstop
//51 - buylimit and sellstop, 61 - selllimit and buystop
//_mag = -1 - ��������� �� ������ ������
// ������ ��������� ������
bool Orders.Close(int type, int _mag, bool _isMagic, string _sSymbol, string _scomm, color clr=CLR_NONE){
   if(OrdersTotal()<1) return(true);
   int ordertype, ticket, l_error_130;
   for(int a1=OrdersTotal()-1;a1>=0;a1--){
      if(OrderSelect(a1,SELECT_BY_POS) && ((_isMagic && OrderMagicNumber()==_mag) || (!_isMagic && OrderTicket()==_mag) || _mag==-1 )
                                       && ((_sSymbol!="" && OrderSymbol()==_sSymbol) || _sSymbol=="") && (_scomm=="" || StringFind(OrderComment(),_scomm)!=-1) ){  
         ordertype = OrderType();         
         if((type==33 || type==0) && ordertype==OP_BUY) {
            while(true) {
               RefreshRates();                   
               if(IsTradeAllowed()){ 
                  if(OrderClose(OrderTicket(),OrderLots(),NormalizeDouble(MarketInfo(OrderSymbol(),MODE_BID),MarketInfo(OrderSymbol(),MODE_DIGITS)),0,clr)) break; 
                  else if(Error.Check(GetLastError(),l_error_130)) break;
               }               
         }  }                      
         if((type==33 || type==11 || type==41 || type==61) && ordertype==OP_BUYSTOP) {
            while(true) {
               RefreshRates();                                  
               if(IsTradeAllowed()){ 
                  if(OrderDelete(OrderTicket(),clr)) break; 
                  else if(Error.Check(GetLastError(),l_error_130)) break;
               }               
         }   }                 
         if((type==33 || type==11 || type==31 || type==51) && ordertype==OP_BUYLIMIT) {
            while(true) {
               RefreshRates();                                  
               if(IsTradeAllowed()){ 
                  if(OrderDelete( OrderTicket(),clr)) break; 
                  else if(Error.Check(GetLastError(),l_error_130)) break;
               }               
         }   }        
         if((type==33 || type==2) && ordertype==OP_SELL) {
            while(true) {
               RefreshRates();                   
               if(IsTradeAllowed()){ 
                  if(OrderClose(OrderTicket(),OrderLots(),NormalizeDouble(MarketInfo(OrderSymbol(),MODE_ASK),MarketInfo(OrderSymbol(),MODE_DIGITS)),0,clr)) break; 
                  else if(Error.Check(GetLastError(),l_error_130)) break;
               }
         }    }         
         if((type==33 || type==21 || type==41 || type==51) && ordertype==OP_SELLSTOP) {
            while(true) {
               RefreshRates();                   
               if(IsTradeAllowed()){ 
                  if(OrderDelete(OrderTicket(),clr)) break; 
                  else if(Error.Check(GetLastError(),l_error_130)) break;
               }               
         }    }         
         if((type==33 || type==21 || type==31 || type==61) && ordertype==OP_SELLLIMIT) {
            while(true) {
               RefreshRates();                   
               if(IsTradeAllowed()){ 
                  if(OrderDelete(OrderTicket(),clr)) break; 
                  else if(Error.Check(GetLastError(),l_error_130)) break;
               }               
   } } } } return(true); }   
//+------------------------------------------------------------------+
//������� ��������� ��� ������
bool Error.Check(int l_error_64, int& error_130){   
   if(l_error_64==0) return(true);
   switch(l_error_64){
      case 4:  Print("�������� ������ �����. ���� 500 ��...");       Sleep(500); return(false);
      case 6:  Print("��� ����� � ��������. ���� 2 ���...");         Sleep(2000);return(false);  
      case 8:  Print("������� ������ �������. ���� 1 ���...");       Sleep(1000);return(false);  
      case 129:Print("������ � ����. ���� 500 �� � ������� ����...");Sleep(500); return(false);
      case 135:Print("���� ����������. ������� ��� ���..");                      return(false);   
      case 136:Print("��� ���. ��� ����� ���..");                   Sleep(1);   return(false);
      case 137:Print("������ �����. ���� 500 ��...");                Sleep(500); return(false);
      case 138:Print("����� ����. �������.");                                    return(false);
      case 141:Print("������� ����� ��������. ���� 1 ������..");     Sleep(60000);return(false);
      case 146:Print("���������� �������� ������. ������� ���..");   Sleep(500); return(false);      
      case 130: if(error_130==0) {Print("������ ����. ������� �������� ����...");Sleep(1000);error_130++;return(false); }else{ Print("����������� ������ � ����."); return(true);}
      default: Print("����������� ������ � "+l_error_64);                        return(true);
   }         
   return(true);
}
//+------------------------------------------------------------------+
// ���������� ������ �� �������� ��� ������ �������� ������ ����� �������
// _type_order - ��� ������ (Buy, Sell, BuyStop, SellStop, BuyLimit, SellLimit)
// _type_group - ��� ������:
//               99 - ��� ������
//               10 - Buy � Sell
//               50 - ���������� (BuyStop, BuyLimit, SellStop, SellLimit)
//               51 - BuyStop � BuyLimit
//               52 - SellStop � SellLimit
//               53 - BuyStop � SellStop
//               54 - BuyLimit � SellLimit
bool Info.isTypeOrdPartOfGroup(int _type_order, int _type_group){ if(_type_order < 0) return(false); bool _res = false; switch(_type_order){ case OP_BUY: switch(_type_group){ case 99: case 10: case OP_BUY: _res = true; } break; case OP_SELL: switch(_type_group){ case 99: case 10: case OP_SELL: _res = true; } break; case OP_BUYSTOP: switch(_type_group){ case 99: case 50: case 51: case 53: case OP_BUYSTOP: _res = true; } break; case OP_SELLSTOP: switch(_type_group){ case 99: case 50: case 52: case 53: case OP_SELLSTOP: _res = true; } break; case OP_BUYLIMIT: switch(_type_group){ case 99: case 50: case 51: case 54: case OP_BUYLIMIT: _res = true; } break; case OP_SELLLIMIT: switch(_type_group){ case 99: case 50: case 52: case 54: case OP_SELLLIMIT: _res = true; } break; } return(_res); }
//+------------------------------------------------------------------+
        
