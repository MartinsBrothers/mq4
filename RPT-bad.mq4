#property show_inputs 
#include <stdlib.mqh>


extern double Lots=0.1;
extern bool   GBPJPY=true;
extern int    GBPJPY_t3_period=9;
extern double GBPJPY_b=0.8;
extern int    GBPJPY_TimeFrame=60;
extern int    GBPJPY_SL=50;
/*
extern bool EURUSD=false;
extern bool GBPUSD=false;
extern bool USDJPY=false;
extern bool USDCHF=false;
extern bool AUDUSD=false;
extern bool USDCAD=false;
extern bool EURGBP=false;
extern bool EURCHF=false;
extern bool EURJPY=false;
extern bool GBPCHF=false;
extern bool AUDJPY=false;
extern bool EURCAD=false;
extern bool CADJPY=false;
extern bool CHFJPY=false;
extern bool EURAUD=false;*/
int EURUSD_Bars=0;
int GBPUSD_Bars=0;
int USDJPY_Bars=0;
int USDCHF_Bars=0;
int AUDUSD_Bars=0;
int USDCAD_Bars=0;
int EURGBP_Bars=0;
int EURCHF_Bars=0;
int EURJPY_Bars=0;
int GBPJPY_Bars=0;
int GBPCHF_Bars=0;
int AUDJPY_Bars=0;
int EURCAD_Bars=0;
int CADJPY_Bars=0;
int CHFJPY_Bars=0;
int EURAUD_Bars=0;
extern bool   TextAlert=true;
extern bool   SoundAlert=true;
extern string SoundFile="expert.wav";
extern bool   OpenTrades=true;

int mBar=300;
int Magic=230475609;

int check_stat(string para,int tf,int t3_period,double b)
 {
  RefreshRates();

  double e1, e2, e3, e4, e5, e6, c1, c2, c3, c4, n, w1, w2, b2, b3;
  double P0,P1,P2;
  double t3[];
  int R1=0,R0=0,shift;
  
  ArrayResize(t3, mBar);

  b2=b*b;
  b3=b2*b;
  c1=-b3;
  c2=(3*(b2+b3));
  c3=-3*(2*b2+b+b3);
  c4=(1+3*b+b3+3*b2);
  n=t3_period;
  if (n<1) n=1;
  n=1+0.5*(n-1);
  w1=2/(n+1);
  w2=1-w1;

  for (shift=mBar; shift>=0; shift--)
   {
    e1=w1*iClose(para,tf,shift)+w2*e1;
    e2=w1*e1+w2*e2;
    e3=w1*e2+w2*e3;
    e4=w1*e3+w2*e4;
    e5=w1*e4+w2*e5;
    e6=w1*e5+w2*e6;
    t3[shift]=c1*e6+c2*e5+c3*e4+c4*e3;
   }

    
  if (t3[2]<t3[1]) {R1=1;} else if (P2>P1) {R1=-1;} else R1=0;
  if (t3[1]<t3[0]) {R0=1;} else if (P1>P0) {R0=-1;} else R0=0;

  if (R0!=R1)
   {
Print("R0=",R0," R1=",R1);    
    if (R0==1) string do="�������� (BUY)";
    if (R0==-1) do="��������� (SELL)";
    int res=R0;
    if (TextAlert) Alert("�� ", para," �� ",WhatTF(tf)," ���� ",do);
    if (SoundAlert) PlaySound(SoundFile);
    return(R0);
   } else res=0;
  return(res);
 }

string WhatTF(int ctf)
{
 switch(ctf)
    {
    case PERIOD_M1:  return("M1");  break;
    case PERIOD_M5:  return("M5");  break;
    case PERIOD_M15: return("M15"); break;
    case PERIOD_M30: return("M30"); break;
    case PERIOD_H1:  return("H1");  break;
    case PERIOD_H4:  return("H4");  break;
    case PERIOD_D1:  return("D1");  break;
    case PERIOD_W1:  return("W1");  break;
    case PERIOD_MN1: return("MN1"); break;
    default: return("��� ������ ����������");
    }
}

int start(){
// while(IsStopped()==false) 
  {
   RefreshRates();
/*   if(EURUSD) if(EURUSD_Bars!=iBars("EURUSD",TimeFrame)) {check_stat("EURUSD", TimeFrame); EURUSD_Bars=iBars("EURUSD",TimeFrame);}
   if(GBPUSD) if(GBPUSD_Bars!=iBars("GBPUSD",TimeFrame)) {check_stat("GBPUSD", TimeFrame); GBPUSD_Bars=iBars("GBPUSD",TimeFrame);}
   if(USDJPY) if(USDJPY_Bars!=iBars("USDJPY",TimeFrame)) {check_stat("USDJPY", TimeFrame); USDJPY_Bars=iBars("USDJPY",TimeFrame);}
   if(USDCHF) if(USDCHF_Bars!=iBars("USDCHF",TimeFrame)) {check_stat("USDCHF", TimeFrame); USDCHF_Bars=iBars("USDCHF",TimeFrame);}
   if(AUDUSD) if(AUDUSD_Bars!=iBars("AUDUSD",TimeFrame)) {check_stat("AUDUSD", TimeFrame); AUDUSD_Bars=iBars("AUDUSD",TimeFrame);}
   if(USDCAD) if(USDCAD_Bars!=iBars("USDCAD",TimeFrame)) {check_stat("USDCAD", TimeFrame); USDCAD_Bars=iBars("USDCAD",TimeFrame);}
   if(EURGBP) if(EURGBP_Bars!=iBars("EURGBP",TimeFrame)) {check_stat("EURGBP", TimeFrame); EURGBP_Bars=iBars("EURGBP",TimeFrame);}
   if(EURCHF) if(EURCHF_Bars!=iBars("EURCHF",TimeFrame)) {check_stat("EURCHF", TimeFrame); EURCHF_Bars=iBars("EURCHF",TimeFrame);}
   if(EURJPY) if(EURJPY_Bars!=iBars("EURJPY",TimeFrame)) {check_stat("EURJPY", TimeFrame); EURJPY_Bars=iBars("EURJPY",TimeFrame);}*/
   if(GBPJPY) if(GBPJPY_Bars!=iBars("GBPJPY",GBPJPY_TimeFrame))
    {
     int stat=check_stat("GBPJPY",GBPJPY_TimeFrame,GBPJPY_t3_period,GBPJPY_b);
     
     int cnt1=OrdersTotal()-1;
     for(int cnt2=cnt1;cnt2>=0;cnt2--)
      {
       OrderSelect(cnt2,SELECT_BY_POS,MODE_TRADES);
       if(OrderSymbol()=="GBPJPY" && OrderMagicNumber()==Magic)
        {
         if(OrderType()==OP_BUY && stat==-1)
          OrderClose(OrderTicket(),OrderLots(),MarketInfo("GBPJPY",MODE_BID),3,Aqua);
         if(OrderType()==OP_SELL && stat==1)
          OrderClose(OrderTicket(),OrderLots(),MarketInfo("GBPJPY",MODE_ASK),3,Magenta);
        }
      }
      
     if (stat==1 && OpenTrades)
      {
       OrderSend("GBPJPY",OP_BUY,Lots,MarketInfo("GBPJPY",MODE_ASK),5,MarketInfo("GBPJPY",MODE_BID)-GBPJPY_SL*Point,0,"RPT",Magic,0,Aqua);
       GBPJPY_Bars=iBars("GBPJPY",GBPJPY_TimeFrame);
      }
     if (stat==-1 && OpenTrades)
      {
       OrderSend("GBPJPY",OP_SELL,Lots,MarketInfo("GBPJPY",MODE_BID),5,MarketInfo("GBPJPY",MODE_ASK)+GBPJPY_SL*Point,0,"RPT",Magic,0,Magenta);
       GBPJPY_Bars=iBars("GBPJPY",GBPJPY_TimeFrame);
      }
     GBPJPY_Bars=iBars("GBPJPY",GBPJPY_TimeFrame); 
    }
/*   if(GBPCHF) if(GBPCHF_Bars!=iBars("GBPCHF",TimeFrame)) {check_stat("GBPCHF", TimeFrame); GBPCHF_Bars=iBars("GBPCHF",TimeFrame);}
   if(AUDJPY) if(AUDJPY_Bars!=iBars("AUDJPY",TimeFrame)) {check_stat("AUDJPY", TimeFrame); AUDJPY_Bars=iBars("AUDJPY",TimeFrame);}
   if(EURCAD) if(EURCAD_Bars!=iBars("EURCAD",TimeFrame)) {check_stat("EURCAD", TimeFrame); EURCAD_Bars=iBars("EURCAD",TimeFrame);}
   if(CADJPY) if(CADJPY_Bars!=iBars("CADJPY",TimeFrame)) {check_stat("CADJPY", TimeFrame); CADJPY_Bars=iBars("CADJPY",TimeFrame);}
   if(CHFJPY) if(CHFJPY_Bars!=iBars("CHFJPY",TimeFrame)) {check_stat("CHFJPY", TimeFrame); CHFJPY_Bars=iBars("CHFJPY",TimeFrame);}
   if(EURAUD) if(EURAUD_Bars!=iBars("EURAUD",TimeFrame)) {check_stat("EURAUD", TimeFrame); EURAUD_Bars=iBars("EURAUD",TimeFrame);}*/
   //Comment(TimeToStr(CurTime(),TIME_SECONDS));//+"\nBars=",iBars(Symbol(),TimeFrame));
   Sleep(1000);
  }
 return(0);
}


