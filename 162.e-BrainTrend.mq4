//+------------------------------------------------------------------+
//|                                             162.e-BrainTrend.mq4 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                                                 e-BrainTrend.mq4 |
//|                      Copyright � 2005, MetaQuotes Software Corp. |
//|                                        http://www.metaquotes.net |
//+------------------------------------------------------------------+
#property copyright "Copyright � 2005, MetaQuotes Software Corp."
#property link      "http://www.metaquotes.net"

//1� ������
extern int     BR1TF          = 15;
extern int     BR1Bars        = 500;
extern int     ShftBR1        = 0;
//2� ������
extern int     BR2TF          = 15;
extern int     BR2Bars        = 500;
extern int     ShftBR2        = 0;
//������� TF ������
extern int     BRLowTF        = 5;
extern int     BRLowBars      = 500;
extern int     ShftBRLow      = 0;
//TRStop ������
extern int     BRTRStopTF    = 1;
extern int     BRTRStopBars  = 500;
extern int     ShftBRTRStop  = 0;
//�������������� ������
extern int     TF2Signal     = 15;
extern int     Period2Signal = 14;
extern int     Shft0         = 0;
extern int     Shft1         = 1;

extern int     TPext         = 0;
extern int     SLext         = 0;
extern int     MagicNumber   = 20051029;
int handle;
int trCount;
//+------------------------------------------------------------------+
//| expert initialization function                                   |
//+------------------------------------------------------------------+
int init()
  {
//---- 
   trCount = 0;

/*
   handle = FileOpen("BrainTrendDebug.csv", FILE_CSV|FILE_WRITE);
   FileWrite(handle, "CurTime", "Ask", "Bid", 
            "BR1Bar1", "BR1Bar2", "BR1Sig1", "BR1Sig2", "BR1Stop1", "BR1Stop2",
            "BR2Bar1", "BR2Bar2", "BR2Sig1", "BR2Sig2", "BR2Stop1", "BR2Stop2",
            "BRLowBar1", "BRLowBar2", "BRLowSig1", "BRLowSig2", "BRLowStop1", "BRLowStop2",
            "BRTRBar1", "BRTRBar2", "BRTRSig1", "BRTRSig2", "BRTRStop1", "BRTRStop2",
            "ADXADXCurr", "ADXADXPrev", "ADXPlsCurr", "ADXMnsCurr", "ADXPlsPrev", "ADXMnsPrev");
   FileFlush(handle);
*/
//----
   return(0);
  }
//+------------------------------------------------------------------+
//| expert deinitialization function                                 |
//+------------------------------------------------------------------+
int deinit()
  {
//---- 
   FileClose(handle);
//----
   return(0);
  }
//+------------------------------------------------------------------+
//| expert start function                                            |
//+------------------------------------------------------------------+
int start()
  {
//---- 
   double BR1Bar1, BR1Bar2;
   double BR1Sig1, BR1Sig2;
   double BR1Stop1, BR1Stop2;
   double BR2Bar1, BR2Bar2;
   double BR2Sig1, BR2Sig2;
   double BR2Stop1, BR2Stop2;
   double BRLowBar1, BRLowBar2;
   double BRLowSig1, BRLowSig2;
   double BRLowStop1, BRLowStop2;
   double BRTRBar1, BRTRBar2;
   double BRTRSig1, BRTRSig2;
   double BRTRStop1, BRTRStop2;
   double ADXADXCurr, ADXADXPrev, ADXPlsCurr, ADXMnsCurr, ADXPlsPrev, ADXMnsPrev;
   double TP, SL;
   int    TradeType, RealTotal, total, cnt, iModFlag;
//----
   //1� ���������
   if(TimeHour(CurTime()) < 7 || TimeDayOfWeek(CurTime()) == 5 || TimeDayOfWeek(CurTime()) == 6 || TimeDayOfWeek(CurTime()) == 0) return(0);
   BR1Bar1  = iCustom(NULL, BR1TF, "BrainTrend1", BR1Bars, 0, ShftBR1);
   BR1Bar2  = iCustom(NULL, BR1TF, "BrainTrend1", BR1Bars, 1, ShftBR1);
   BR1Sig1  = iCustom(NULL, BR1TF, "BrainTrend1Sig", BR1Bars, 0, 0, 0, ShftBR1);
   BR1Sig2  = iCustom(NULL, BR1TF, "BrainTrend1Sig", BR1Bars, 0, 0, 1, ShftBR1);
   BR1Stop1 = iCustom(NULL, BR1TF, "BrainTrend1Stop", BR1Bars, 0, 0, 0, ShftBR1);
   BR1Stop2 = iCustom(NULL, BR1TF, "BrainTrend1Stop", BR1Bars, 0, 0, 1, ShftBR1);
   //2� ���������
   BR2Bar1  = iCustom(NULL, BR2TF, "BrainTrend2", BR2Bars, 0, ShftBR2);
   BR2Bar2  = iCustom(NULL, BR2TF, "BrainTrend2", BR2Bars, 1, ShftBR2);
   BR2Sig1  = iCustom(NULL, BR2TF, "BrainTrend2Sig", BR2Bars, 0, 0, 0, ShftBR2);
   BR2Sig2  = iCustom(NULL, BR2TF, "BrainTrend2Sig", BR2Bars, 0, 0, 1, ShftBR2);
   BR2Stop1 = iCustom(NULL, BR2TF, "BrainTrend2Stop", BR2Bars, 0, 0, 0, ShftBR2);
   BR2Stop2 = iCustom(NULL, BR2TF, "BrainTrend2Stop", BR2Bars, 0, 0, 1, ShftBR2);
   //������� TF ���������
//   BRLowBar1  = iCustom(NULL, BRLowTF, "BrainTrend2", BRLowBars, 0, ShftBRLow);
//   BRLowBar2  = iCustom(NULL, BRLowTF, "BrainTrend2", BRLowBars, 1, ShftBRLow);
   BRLowSig1  = iCustom(NULL, BRLowTF, "BrainTrend2Sig", BRLowBars, 0, 0, 0, ShftBRLow);
   BRLowSig2  = iCustom(NULL, BRLowTF, "BrainTrend2Sig", BRLowBars, 0, 0, 1, ShftBRLow);
   BRLowStop1 = iCustom(NULL, BRLowTF, "BrainTrend2Stop", BRLowBars, 0, 0, 0, ShftBRLow);
   BRLowStop2 = iCustom(NULL, BRLowTF, "BrainTrend2Stop", BRLowBars, 0, 0, 1, ShftBRLow);
   //TRStop TF ���������
//   BRTRBar1  = iCustom(NULL, BRTRStopTF, "BrainTrend2", BRTRStopBars, 0, ShftBRTRStop);
//   BRTRBar2  = iCustom(NULL, BRTRStopTF, "BrainTrend2", BRTRStopBars, 1, ShftBRTRStop);
   BRTRSig1  = iCustom(NULL, BRTRStopTF, "BrainTrend2Sig", BRTRStopBars, 0, 0, 0, ShftBRTRStop);
   BRTRSig2  = iCustom(NULL, BRTRStopTF, "BrainTrend2Sig", BRTRStopBars, 0, 0, 1, ShftBRTRStop);
   BRTRStop1 = iCustom(NULL, BRTRStopTF, "BrainTrend2Stop", BRTRStopBars, 0, 0, 0, ShftBRTRStop);
   BRTRStop2 = iCustom(NULL, BRTRStopTF, "BrainTrend2Stop", BRTRStopBars, 0, 0, 1, ShftBRTRStop);
   
   //��������� ������
   ADXADXCurr = iADX(NULL, TF2Signal, Period2Signal, PRICE_MEDIAN, MODE_MAIN, Shft0);
   ADXADXPrev = iADX(NULL, TF2Signal, Period2Signal, PRICE_MEDIAN, MODE_MAIN, Shft1);
   ADXPlsCurr = iADX(NULL, TF2Signal, Period2Signal, PRICE_MEDIAN, MODE_PLUSDI, Shft0);
   ADXPlsPrev = iADX(NULL, TF2Signal, Period2Signal, PRICE_MEDIAN, MODE_PLUSDI, Shft1);
   ADXMnsCurr = iADX(NULL, TF2Signal, Period2Signal, PRICE_MEDIAN, MODE_MINUSDI, Shft0);
   ADXMnsPrev = iADX(NULL, TF2Signal, Period2Signal, PRICE_MEDIAN, MODE_MINUSDI, Shft1);
   
   TradeType = 0;
   //�������
   if(//���������� ������ 
      (BR1Sig2 > 0 && BR1Sig2 < 1000)   //1� ��������� ��� ������
   && //������������� 2� ����������� 
      (
       (BR2Sig2 > 0 && BR2Sig2 < 1000)   //2� ��������� ��� ������
       || 
       (BR2Stop2 > 0 && BR2Stop2 < 1000)   //2� ��������� ���� �� ������
      )
   && //������������� ������� TF
      (
       (BRLowSig2 > 0 && BRLowSig2 < 1000)   //LowTF� ��������� ��� ������
       || 
       (BRLowStop2 > 0 && BRLowStop2 < 1000)   //LowTF� ��������� ���� �� ������
      )
/*   && //������������� ���������� TF
      (
       (BRTRSig2 > 0 && BRTRSig2 < 1000)   //LowTF� ��������� ��� ������
       || 
       (BRTRStop2 > 0 && BRTRStop2 < 1000)   //LowTF� ��������� ���� �� ������
      )
*/
/*   && //���� ����
      (
       (BR1Bar1 > BR1Bar2)
      )
*/
   && //��������� ������
      (
       (ADXADXCurr > ADXPlsCurr)
//       &&
//       (ADXPlsCurr > ADXMnsCurr)
//       &&
//       (ADXADXCurr > ADXADXPrev)
//       &&
//       (ADXPlsCurr > ADXPlsPrev)
      )

     )
     {
      TradeType = -1;
      if(SLext == 0)
       SL = BR1Sig2;
      else
       SL = Ask + SLext*Point;
     }
   //�������
   if(//���������� ������ 
      (BR1Sig1 > 0 && BR1Sig1 < 1000)   //1� ��������� ��� ������
   && //������������� 2� ����������� 
      (
       (BR2Sig1 > 0 && BR2Sig1 < 1000)   //2� ��������� ��� ������
       || 
       (BR2Stop1 > 0 && BR2Stop1 < 1000)   //2� ��������� ���� �� ������
      )
   && //������������� ������� TF
      (
       (BRLowSig1 > 0 && BRLowSig1 < 1000)   //LowTF� ��������� ��� ������
       || 
       (BRLowStop1 > 0 && BRLowStop1 < 1000)   //LowTF� ��������� ���� �� ������
      )
/*   && //������������� ���������� TF
      (
       (BRTRSig1 > 0 && BRTRSig1 < 1000)   //LowTF� ��������� ��� ������
       || 
       (BRTRStop1 > 0 && BRTRStop1 < 1000)   //LowTF� ��������� ���� �� ������
      )
*/
/*   && //���� ����
      (
       (BR1Bar2 > BR1Bar1)
      )
*/
   && //��������� ������
      (
       (ADXADXCurr > ADXMnsCurr)
//       &&
//       (ADXMnsCurr > ADXPlsCurr)
//       &&
//       (ADXADXCurr > ADXADXPrev)
//       &&
//       (ADXMnsCurr > ADXMnsPrev)
      )

     )
     {
      TradeType = 1;
      if(SLext == 0)
       SL = BR2Stop1;
      else
       SL = Bid - SLext*Point;
     }
/*     
   FileWrite(handle, TimeToStr(CurTime()), Ask, Bid, 
            BR1Bar1, BR1Bar2, BR1Sig1, BR1Sig2, BR1Stop1, BR1Stop2,
            BR2Bar1, BR2Bar2, BR2Sig1, BR2Sig2, BR2Stop1, BR2Stop2,
            BRLowBar1, BRLowBar2, BRLowSig1, BRLowSig2, BRLowStop1, BRLowStop2,
            BRTRBar1, BRTRBar2, BRTRSig1, BRTRSig2, BRTRStop1, BRTRStop2,
            ADXADXCurr, ADXADXPrev, ADXPlsCurr, ADXMnsCurr, ADXPlsPrev, ADXMnsPrev,
            TradeType);
   FileFlush(handle);
*/   
   TP = 0.0;
   
   RealTotal = 0;
   total = OrdersTotal();
   //���� �������� ���� ������� �������
   for (cnt = 0; cnt < total; cnt++)
   {
    OrderSelect(cnt, SELECT_BY_POS, MODE_TRADES);
    if (OrderMagicNumber() == MagicNumber && OrderSymbol() == Symbol())
    {
     RealTotal = RealTotal + 1;
     iModFlag = 0;
     //����� �������
     if(OrderType() == OP_BUY)
     {
//      if(TradeType == -1)
//      {
//       OrderClose(OrderTicket(), OrderLots(), Bid, 3, Yellow);
//       return(0);
//      }
      if(BRTRStop1 > OrderOpenPrice() && BRTRStop1 > OrderStopLoss())
      {
       //���� ������������� ��������� - ����� �� BRTRStop
       SL = BRTRStop1;
       iModFlag = 1;
      }
      else
       if(OrderStopLoss() < MathMin(BR1Sig1, MathMin(BR2Stop1, BRLowStop1)))
       {
        //������ ����������� SL
        SL = MathMin(BR1Sig1, MathMin(BR2Stop1, BRLowStop1));
        iModFlag = 1;
       }
       else
        return(0);
      if((Ask - SL)*Point > MarketInfo(Symbol(), MODE_STOPLEVEL) || SL == 0.0)
       SL = Ask - MarketInfo(Symbol(), MODE_STOPLEVEL)*Point;
     }
     else
     {
//      if(TradeType == 1)
//      {
//       OrderClose(OrderTicket(), OrderLots(), Ask, 3, Yellow);
//       return(0);
//      }
      if(BRTRStop2 < OrderOpenPrice() && BRTRStop2 < OrderStopLoss())
      {
       //���� ������������� ��������� - ����� �� BRTRStop
       SL = BRTRStop2;
       iModFlag = 1;
      }
      else
       if(OrderStopLoss() > MathMax(BR1Sig2, MathMax(BR2Stop2, BRLowStop2)))
       {
        //������ ����������� SL
        SL = MathMax(BR1Sig2, MathMin(BR2Stop2, BRLowStop2));
        iModFlag = 1;
       }
       else
        return(0);
      if((SL - Bid)*Point > MarketInfo(Symbol(), MODE_STOPLEVEL) || SL == 0.0)
       SL = Bid + (MarketInfo(Symbol(), MODE_STOPLEVEL)+1)*Point;
     }
     if(iModFlag == 1)
      IMod(OrderTicket(), 0.0, SL);
     return(0);
    }
   }
   if(RealTotal == 0)
   {
    if(TradeType == 1)
    {
     if(TPext != 0)
      TP = Ask + TPext*Point;
     else
      TP = 0.0;
     IBuy(TP, SL);
    }
    if(TradeType == -1)
    {
     if(TPext != 0)
      TP = Bid - TPext*Point;
     else
      TP = 0.0;
     ISell(TP, SL);
    }
   }
   return(0);
  }



void IMod(int OrderTicketPar, double TPPar, double SLPar)
{
 ShowIndicator("Buy", OBJ_ARROW, Yellow, SYMBOL_CHECKSIGN, 5);
 OrderModify(OrderTicketPar, 0.0, SLPar, TPPar, 0, Yellow);
}

void IBuy(double TPPar, double SLPar)
{
 ShowIndicator("Buy", OBJ_ARROW, Magenta, SYMBOL_THUMBSUP, 5);
 OrderSend(Symbol(), OP_BUY, 0.1, Ask, 3, SLPar, TPPar, "e-BrainTrend", MagicNumber, 0, Blue);
}

void ISell(double TPPar, double SLPar)
{
 ShowIndicator("Sell", OBJ_ARROW, Yellow, SYMBOL_THUMBSDOWN, 5);
 OrderSend(Symbol(), OP_SELL, 0.1, Bid, 3, SLPar, TPPar, "e-BrainTrend", MagicNumber, 0, Red);
}

//+------------------------------------------------------------------+
//| ��������� "����-��"
//+------------------------------------------------------------------+
void ShowIndicator(string TextPr, int TypeIndic, int ColorShow, int SymbolShow, int Width)
{
   ObjectCreate(TextPr+trCount,TypeIndic,0,Time[0],Ask);
   ObjectSet(TextPr+trCount,OBJPROP_ARROWCODE,SymbolShow);
   ObjectSet(TextPr+trCount,OBJPROP_WIDTH,Width);
   ObjectSet(TextPr+trCount,OBJPROP_COLOR,ColorShow);
   ObjectSetText(TextPr+trCount,TextPr,10);
   trCount++;
}
//+------------------------------------------------------------------+
        
