//+------------------------------------------------------------------+
//|                                             119.e-3stoch_299.mq4 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                                                     e-3Stoch.mq4 |
//|                                           ��� ����� �. aka KimIV |
//|                                              http://www.kimiv.ru |
//|                                                                  |
//|   26.11.2005  �������� �� ���� �����������.                      |
//+------------------------------------------------------------------+
#property copyright "��� ����� �. aka KimIV"
#property link      "http://www.kimiv.ru"
#define   MAGIC     20051126

//------- ������� ��������� ��������� --------------------------------
extern string _Parameters_Trade = "----- ��������� ��������";
extern double Lots        = 0.1;    // ������ ���������� ����
extern int    StopLoss    = 10;     // ������ �������������� �����
extern int    TakeProfit  = 5;      // ������ �������������� �����
extern int    Slippage    = 3;      // ��������������� ����

extern string _Parameters_Expert = "----- ��������� ���������";
extern color clOpenBuy    = LightBlue;    // ���� �������� �������
extern color clOpenSell   = LightCoral;   // ���� �������� �������
extern color clModifyBuy  = Aqua;         // ���� ����������� �������
extern color clModifySell = Tomato;       // ���� ����������� �������
extern color clCloseBuy   = Blue;         // ���� �������� �������
extern color clCloseSell  = Red;          // ���� �������� �������

//---- ���������� ���������� ��������� -------------------------------

void deinit() { Comment(""); }

//+------------------------------------------------------------------+
//| expert start function                                            |
//+------------------------------------------------------------------+
void start() {
  if (Volume[0]<2) OpenPosition();
}

//+------------------------------------------------------------------+
//| �������� �������                                                 |
//+------------------------------------------------------------------+
void OpenPosition() {
  double ldStop=0, ldTake=0;
  int    bs=GetSignal();

  if (!ExistPosition()) {
    if (bs>0) {
      if (StopLoss!=0) ldStop=Ask-StopLoss*Point;
      if (TakeProfit!=0) ldTake=Ask+TakeProfit*Point;
      SetOrder(OP_BUY, Ask, ldStop, ldTake);
    }
    if (bs<0) {
     if (StopLoss!=0) ldStop=Bid+StopLoss*Point;
      if (TakeProfit!=0) ldTake=Bid-TakeProfit*Point;
      SetOrder(OP_SELL, Bid, ldStop, ldTake);
    }
  }
}

//+------------------------------------------------------------------+
//| ���������� �������� ������                                       |
//+------------------------------------------------------------------+
int GetSignal() {
  double st241=iStochastic(NULL,PERIOD_H4,5,3,3,MODE_EMA,0,MODE_MAIN,1);
  double st301=iStochastic(NULL,PERIOD_M30,5,3,3,MODE_EMA,0,MODE_MAIN,1);
  double st052=iStochastic(NULL,PERIOD_M5,5,3,3,MODE_EMA,0,MODE_MAIN,2);
  double st051=iStochastic(NULL,PERIOD_M5,5,3,3,MODE_EMA,0,MODE_MAIN,1);
  int    bs=0;

  if (st052<20 && st051>20 && st301<20 && st241<20) bs=1;
  if (st052>80 && st051<80 && st301>80 && st241>80) bs=-1;
  return(bs);
}

//+------------------------------------------------------------------+
//| ���������� ���� ������������� ������� �� ������                  |
//+------------------------------------------------------------------+
bool ExistPosition() {
  bool Exist=False;
  for (int i=0; i<OrdersTotal(); i++) {
    if (OrderSelect(i, SELECT_BY_POS, MODE_TRADES)) {
      if (OrderSymbol()==Symbol() && OrderMagicNumber()==MAGIC) {
        if (OrderType()==OP_BUY || OrderType()==OP_SELL) {
          Exist=True; break;
        }
      }
    }
  }
  return(Exist);
}

//+------------------------------------------------------------------+
//| ��������� ������                                                 |
//| ���������:                                                       |
//|   op     - ��������                                              |
//|   pp     - ����                                                  |
//|   ldStop - ������� ����                                          |
//|   ldTake - ������� ����                                          |
//+------------------------------------------------------------------+
void SetOrder(int op, double pp, double ldStop, double ldTake) {
  color clOpen;

  if (op==OP_BUY) clOpen=clOpenBuy; else clOpen=clOpenSell;
  OrderSend(Symbol(),op,Lots,pp,Slippage,ldStop,ldTake,"",MAGIC,0,clOpen);
}
//+------------------------------------------------------------------+


        
