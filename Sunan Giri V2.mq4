
#property copyright "Copyright © 2024, Victor Adhitya"
#property link      "https://t.me/Victoradhitya"
#property strict
#define _VERSION_ "2.0"
#property version _VERSION_
double slbuy,slsell,tpbuy,tpsell;
color colorrek;
int ACCOUNT1  = 0;   //<===CHANGE NUMBER HERE


string EXPIRE = "9999.12.31";  //<=== CHANGE DATE FOR EXPIRED HERE,
                                      //SAVE AS WITH DIFFERENT NAMA, 
                                      //CLICK COMPILE
                                      //GIVE JUST EX4 FILE TO CLIENT

extern bool blink = false;



//BAGIAN MENU

extern int JAM_ON   = 0;
extern int JAM_OFF  =24;

extern string CommentEA = "EA Sunan Giri";


extern bool CLOSE_BY_STOCH = true;

extern string parameteropen    = "=====Parameter Open=====";
extern bool OPEN_BUY  = true;
extern bool OPEN_SELL = true; 
extern bool    Compounding             = true;
extern double  Pembagi                 = 100000;
double victor;
extern double FixLot  =0.1;

extern double tp_in_money = 5;

extern int TP  = 20;
extern int SL  = 0;

extern string parameterave    = "=====Parameter Averaging=====";
extern bool USE_MARTY = true;

extern int PipStep           = 20;
extern double multiplier     =  2;

extern int Max_Level          = 10;
// BAGIAN MENU INDI



extern int CEK_SIGNAL   = 1;
extern string INDI1     = "Bollinger";
extern int periodbb            = 20;
extern double deviationbb      = 2.0;
extern int shiftbb             = 0;
extern ENUM_APPLIED_PRICE applytobb = PRICE_CLOSE;



extern string INDI2 ="Stochastic";
extern int Kperiod=   5;
extern int Dperiod=   3;
extern int slowing=   3;
extern ENUM_STO_PRICE pricefieldsto  = STO_LOWHIGH;
extern ENUM_MA_METHOD methodsto      = MODE_SMA;

extern double OS = 30;
extern double OB = 70;



extern string INDI3 ="Multi TF Stochastic";

extern ENUM_TIMEFRAMES TF1 = PERIOD_M15;
extern int CEK_SIGNAL_TF1 = 0;

extern ENUM_TIMEFRAMES TF2 = PERIOD_M30;
extern int CEK_SIGNAL_TF2 = 0;

extern ENUM_TIMEFRAMES TF3 = PERIOD_H1;
extern int CEK_SIGNAL_TF3 = 0;






double lotsbuy = 0;
double lotssell= 0;




string kata_mutiara1="Urip mung sepisan, dadio seng manfaat marang liyane..";
string kata_mutiara2="Hidup Hanya sekali, jadilah orang yg bermanfaat bagi orang lain..";


extern int MagicNumber=123455;
int Slippage=3000;


//----
// JUMLAH BUY DAN JUMLAH SELL//

int LOTS,x,f,g,h,k,y,z,jumlahbuy,jumlahbuylimit,jumlahselllimit,jumlahsell,jumlahbuystop,jumlahsellstop;
double BUY[99], SELL[99], BUYLIMIT[99], SELLLIMIT[99], BUYSTOP[99], SELLSTOP[99],BATAS;
int prec=0;
int a=0;
int b=0;
int c=0;
double pt,minlot,stoplevel;
int i;
double min_volume=SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MIN);
double max_volume=SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MAX);
//WARNA FONT//

color  FontColorUp1 = Red;  
color  FontColorDn1 = White; 
color  FontColor = Blue;
color  FontColorUp2 = Yellow;  
color  FontColorDn2 = Lime; 
color  FontUP = Lime;  
color  Font = White; 
color  FontDOWN = Red; 
//+------------------------------------------------------------------+
//| expert initialization function                                   |
//+------------------------------------------------------------------+


int init()
  {

 //if(TimeCurrent()>expDate){MessageBox("The Trial version has expired, Silahkan Hubungi 081296929899 telegram https://t.me/victoradhitya ");ExpertRemove(); return(INIT_FAILED);}
 // if(AccountName()!="Inda Sari"){MessageBox("Maaf BOSS Nama Anda Salah, Silahkan Hubungi :081296929899 telegram https://t.me/victoradhitya  ");   ExpertRemove();   return(INIT_FAILED); }
//if(AccountNumber()!="271022568"){MessageBox("Maaf BOSS Nomer Anda Salah, Silahkan Hubungi :081296929899 telegram https://t.me/victoradhitya");   ExpertRemove();   return(INIT_FAILED); }

//BROKER 3-5 DIGIT//

    if(Digits==3 || Digits==5) pt=10*Point;
    else                       pt=Point;
    minlot=MarketInfo(Symbol(),MODE_MINLOT);
    stoplevel=MarketInfo(Symbol(),MODE_STOPLEVEL);
    if(minlot==0.01) prec=2;
    else
    if(minlot==0.1)  prec=1;
    else             prec=0;
    return(0);
  }    

//+------------------------------------------------------------------+
//| expert deinitialization function                                 |
//+------------------------------------------------------------------+
int deinit()
  {
  ObjectsDeleteAll();
//----
    ObjectDelete("Market_Price_Label1"); 
    ObjectDelete("Market_Price_Label2"); 
    ObjectDelete("Market_Price_Label3"); 
    ObjectDelete("Market_Price_Label4"); 
    ObjectDelete("Market_Price_Label5"); 
    ObjectDelete("Market_Price_Label6"); 
    ObjectDelete("Market_Price_Label7"); 
    ObjectDelete("Market_Price_Label8"); 
    ObjectDelete("Market_Price_Label9"); 
    ObjectDelete("Market_Price_Label10"); 
    ObjectDelete("Market_Price_Label11"); 
    ObjectDelete("Market_Price_Label12"); 
    ObjectDelete("Market_Price_Label13"); 
    ObjectDelete("Market_Price_Label14"); 
    ObjectDelete("Market_Price_Label15"); 
    ObjectDelete("Market_Price_Label16"); 
    ObjectDelete("Market_Price_Label17"); 
    ObjectDelete("Market_Price_Label18"); 
    ObjectDelete("Market_Price_Label19"); 
    ObjectDelete("Market_Price_Label20"); 
    ObjectDelete("Market_Price_Label21"); 
    ObjectDelete("Market_Price_Label22"); 
    ObjectDelete("Market_Price_Label23"); 
    ObjectDelete("Market_Price_Label24"); 
    ObjectDelete("Market_Price_Label25"); 
    ObjectDelete("Market_Price_Label26"); 
    ObjectDelete("Market_Price_Label27"); 
    ObjectDelete("Market_Price_Label28"); 
    ObjectDelete("Market_Price_Label29"); 
    ObjectDelete("Market_Price_Label30"); 
    ObjectDelete("Market_Price_Label31"); 
    ObjectDelete("Market_Price_Label32"); 
    ObjectDelete("Market_Price_Label33"); 
    ObjectDelete("Market_Price_Label34"); 
    ObjectDelete("Market_Price_Label35"); 
    ObjectDelete("Market_Price_Label36"); 
    ObjectDelete("Market_Price_Label37"); 
    ObjectDelete("Market_Price_Label38"); 
    ObjectDelete("Market_Price_Label39"); 
    ObjectDelete("Market_Price_Label40"); 
    ObjectDelete("Market_Price_Label41"); 
    ObjectDelete("Market_Price_Label42"); 
    ObjectDelete("Market_Price_Label43"); 
    ObjectDelete("Market_Price_Label44"); 
    ObjectDelete("Market_Price_Label45"); 
    ObjectDelete("Market_Price_Label46"); 
    ObjectDelete("Market_Price_Label47"); 
    ObjectDelete("Market_Price_Label48"); 
    ObjectDelete("Market_Price_Label49"); 
    ObjectDelete("Market_Price_Label50");
//----
   return(0);
  }
//+------------------------------------------------------------------+
//| expert start function                                            |
//+------------------------------------------------------------------+
//int start()
void OnTick()
  {
   min_volume=SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MIN);
   max_volume=SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MAX);  
if(Compounding ) 
   {
      victor=AccountBalance() / Pembagi;
      if (victor < min_volume)
         victor=min_volume;
   } 
else 
   {
      victor= FixLot;
      if (victor < min_volume)
         victor=min_volume;  
   } 

  if(TimeCurrent()<StrToTime(EXPIRE))
    {
    Comment("");
    }
 
    if(TimeCurrent()>=StrToTime(EXPIRE))
    {
    Comment("EA EXPIRED !!");
    ObjectsDeleteAll();
    //return(0);
    }




  if(AccountNumber()!=ACCOUNT1  && ACCOUNT1 >0)
     {
        
     }
   
   
   
  if( (AccountNumber()==ACCOUNT1&&ACCOUNT1>0) || ACCOUNT1==0)
     {
   
  //////////
     
  
  

   
 //BAGIAN JUMLAH OP  
y=0; f=0; g=0; h=0; k=0; z=0; jumlahbuy=0; jumlahsell=0; jumlahbuylimit=0; jumlahselllimit=0; jumlahsellstop=0; jumlahbuystop=0;
   for(x=0; x<OrdersTotal(); x++)
   {
      int check = OrderSelect(x, SELECT_BY_POS, MODE_TRADES);
      if (OrderSymbol()!=Symbol()|| OrderMagicNumber()!=MagicNumber ) continue;
      if (OrderType()==OP_BUY)
      {  BUY[y] = OrderOpenPrice();
         y++;
         jumlahbuy++;
      }
      else
      if (OrderType()==OP_SELL)
      {  SELL[z] = OrderOpenPrice();
         z++;
         jumlahsell++;
      }
   else
      if (OrderType()==OP_BUYLIMIT)
      {  BUYLIMIT[f] = OrderOpenPrice();
         f++;
         jumlahbuylimit++;
      }
        else
      if (OrderType()==OP_SELLLIMIT)
      {  SELLLIMIT[g] = OrderOpenPrice();
         g++;
         jumlahselllimit++;
      }
       else
      if (OrderType()==OP_SELLSTOP)
      {  SELLSTOP[h] = OrderOpenPrice();
         h++;
         jumlahsellstop++;
      }
     else 
     if (OrderType()==OP_BUYSTOP)
      {  BUYSTOP[k] = OrderOpenPrice();
         k++;
         jumlahbuystop++;
      }
        
   }




double SPREAD = (Ask-Bid)/pt;

double floating = (AccountEquity()-AccountBalance())/AccountBalance()*100;

    string lastkomen="";
   for(i=0; i<OrdersHistoryTotal(); i++)
   {
      int check = OrderSelect(OrdersHistoryTotal()-1,SELECT_BY_POS,MODE_HISTORY);
      if(OrderSymbol()!=Symbol() || OrderMagicNumber()!=MagicNumber ) continue;
      lastkomen=OrderComment();
   }
 
  
   double lastlot=0;
   for(i=0; i<OrdersTotal(); i++)
   {
      int check = OrderSelect(i,SELECT_BY_POS,MODE_TRADES);
      if(OrderSymbol()!=Symbol() || OrderMagicNumber()!=MagicNumber ) continue;
      lastlot=OrderLots();
   }
   

 //PROFIT//  
  
     double profit=0;
     double lotstotal=0;
   for(i=0; i<OrdersTotal(); i++)
   {
      int check=OrderSelect(i,SELECT_BY_POS,MODE_TRADES);
      if(OrderSymbol()!=Symbol() || OrderMagicNumber()!=MagicNumber ) continue;
      profit+=(OrderProfit()+OrderCommission()+OrderSwap());
      lotstotal+=OrderLots();
   }
   
  
     double profitbuy    = 0;
     double lastlotbuy   = 0;
     double totallotbuy  = 0;
     double totalhargabuy= 0;
     double hargaratabuy = 0;
   for(i=0; i<OrdersTotal(); i++)
   {
      int check = OrderSelect(i,SELECT_BY_POS,MODE_TRADES);
      if(OrderSymbol()!=Symbol() || OrderMagicNumber()!=MagicNumber || OrderType()==OP_SELL) continue;
      if(OrderType()==OP_BUY)
      {
      profitbuy+=(OrderProfit()+OrderCommission()+OrderSwap());
      lastlotbuy = OrderLots();
      totallotbuy+=OrderLots();
      totalhargabuy+=(OrderLots()*OrderOpenPrice());
      hargaratabuy= totalhargabuy/(totallotbuy);
      }
   }
   
     double profitsell    = 0;
     double lastlotsell   = 0;
     double totallotsell  = 0;
     double totalhargasell= 0;
     double hargaratasell = 0;
   for(i=0; i<OrdersTotal(); i++)
   {
      int check = OrderSelect(i,SELECT_BY_POS,MODE_TRADES);
      if(OrderSymbol()!=Symbol() || OrderMagicNumber()!=MagicNumber || OrderType()==OP_BUY) continue;
      if(OrderType()==OP_SELL)
      {
      profitsell+=(OrderProfit()+OrderCommission()+OrderSwap());
      lastlotsell = OrderLots();
      totallotsell+=OrderLots();
      totalhargasell+=(OrderLots()*OrderOpenPrice());
      hargaratasell= totalhargasell/(totallotsell);
      }
   }
   
  
   
   
  
  
  
   
   
   
   
        






   {
    
    if (iOpen(Symbol(),0,0) > iOpen(Symbol(),0,1)) FontColor = FontColorUp1;
    if (iOpen(Symbol(),0,0)<  iOpen(Symbol(),0,1)) FontColor = FontColorDn1;
    if (iClose(Symbol(),0,0) > iClose(Symbol(),0,1) ) FontColor = FontColorUp2;
    if (iClose(Symbol(),0,0) < iClose(Symbol(),0,1) ) FontColor = FontColorDn2;
    if (Ask>iOpen(Symbol(),0,0)) Font=FontUP;
    if (Bid>iOpen(Symbol(),0,0)) Font=FontUP;
    if (Ask<iOpen(Symbol(),0,0)) Font=FontDOWN;
    if (Bid<iOpen(Symbol(),0,0)) Font=FontDOWN;
   
   }
   
   
   

  
  
  
  //BAGIAN INDI

double OPEN_DAILY    = iOpen(Symbol(),PERIOD_D1,0);



double CLOSE    = iClose(Symbol(),0,CEK_SIGNAL);
double  OPEN    =  iOpen(Symbol(),0,CEK_SIGNAL);


double  HIGH    = iHigh(Symbol(),0,CEK_SIGNAL);
double   LOW    =  iLow(Symbol(),0,CEK_SIGNAL);

double BULL = CLOSE>OPEN;
double BEAR = CLOSE<OPEN;
double FLAT = CLOSE==OPEN;


string textcandle = "wait";
color colorcandle = clrWhite;
if(BULL)
{
   textcandle = "BULL";
   colorcandle= clrLime;
}
if(BEAR)
{
   textcandle = "BEAR";
   colorcandle= clrRed;
}
if(FLAT)
{
   textcandle = "BULL";
   colorcandle= clrYellow;
}

double CLOSE_LAMA   = iClose(Symbol(),0,CEK_SIGNAL+1);

 
///////////////BOLINGER BAND////////////////2
double BBAND_ATAS =iBands(Symbol(),0,periodbb,deviationbb,shiftbb,applytobb,MODE_UPPER,CEK_SIGNAL);
double BBAND_BAWAH=iBands(Symbol(),0,periodbb,deviationbb,shiftbb,applytobb,MODE_LOWER,CEK_SIGNAL);

double BBAND_MIDDLE = (BBAND_ATAS+BBAND_BAWAH)/2;

double BBAND_ATAS_LAMA =iBands(Symbol(),0,periodbb,deviationbb,shiftbb,applytobb,MODE_UPPER,CEK_SIGNAL+1);
double BBAND_BAWAH_LAMA=iBands(Symbol(),0,periodbb,deviationbb,shiftbb,applytobb,MODE_LOWER,CEK_SIGNAL+1);

 ////////////////STOCHASTIC//////////////
 //a
double STOCH        =iStochastic(Symbol(),0,Kperiod,Dperiod,slowing,methodsto,pricefieldsto,MODE_MAIN,CEK_SIGNAL  );
double STOCH_LAMA   =iStochastic(Symbol(),0,Kperiod,Dperiod,slowing,methodsto,pricefieldsto,MODE_MAIN,CEK_SIGNAL+1);

double SIGNAL        =iStochastic(Symbol(),0,Kperiod,Dperiod,slowing,methodsto,pricefieldsto,MODE_SIGNAL,CEK_SIGNAL  );
double SIGNAL_LAMA   =iStochastic(Symbol(),0,Kperiod,Dperiod,slowing,methodsto,pricefieldsto,MODE_SIGNAL,CEK_SIGNAL+1);



//TF 1


 ////////////////STOCHASTIC//////////////
 //a
double STOCH1        =iStochastic(Symbol(),TF1,Kperiod,Dperiod,slowing,methodsto,pricefieldsto,MODE_MAIN,CEK_SIGNAL_TF1);
double STOCH2        =iStochastic(Symbol(),TF2,Kperiod,Dperiod,slowing,methodsto,pricefieldsto,MODE_MAIN,CEK_SIGNAL_TF2);
double STOCH3        =iStochastic(Symbol(),TF3,Kperiod,Dperiod,slowing,methodsto,pricefieldsto,MODE_MAIN,CEK_SIGNAL_TF3);

string texttf1 = "wait";
if(TF1==PERIOD_M1 ) texttf1="M1";
if(TF1==PERIOD_M5 ) texttf1="M5";
if(TF1==PERIOD_M15) texttf1="M15";
if(TF1==PERIOD_M30) texttf1="M30";
if(TF1==PERIOD_H1 ) texttf1="H1";
if(TF1==PERIOD_H4 ) texttf1="H4";
if(TF1==PERIOD_D1 ) texttf1="D1";
if(TF1==PERIOD_W1 ) texttf1="W1";
if(TF1==PERIOD_MN1) texttf1="MN1";

string texttf2 = "wait";
if(TF2==PERIOD_M1 ) texttf2="M1";
if(TF2==PERIOD_M5 ) texttf2="M5";
if(TF2==PERIOD_M15) texttf2="M15";
if(TF2==PERIOD_M30) texttf2="M30";
if(TF2==PERIOD_H1 ) texttf2="H1";
if(TF2==PERIOD_H4 ) texttf2="H4";
if(TF2==PERIOD_D1 ) texttf2="D1";
if(TF2==PERIOD_W1 ) texttf2="W1";
if(TF2==PERIOD_MN1) texttf2="MN1";

string texttf3 = "wait";
if(TF3==PERIOD_M1 ) texttf3="M1";
if(TF3==PERIOD_M5 ) texttf3="M5";
if(TF3==PERIOD_M15) texttf3="M15";
if(TF3==PERIOD_M30) texttf3="M30";
if(TF3==PERIOD_H1 ) texttf3="H1";
if(TF3==PERIOD_H4 ) texttf3="H4";
if(TF3==PERIOD_D1 ) texttf3="D1";
if(TF3==PERIOD_W1 ) texttf3="W1";
if(TF3==PERIOD_MN1) texttf3="MN1";


color color1 = clrWhite;
string text1 = "wait";
if(STOCH1<=OS) 
{
color1 = clrLime;
text1  = "OS";
}
if(STOCH1>=OB) 
{
color1 = clrOrangeRed;
text1  = "OB";
}

color color2 = clrWhite;
string text2 = "wait";
if(STOCH2<=OS) 
{
color2 = clrLime;
text2  = "OS";
}
if(STOCH2>=OB) 
{
color2 = clrOrangeRed;
text2  = "OB";
}


color color3 = clrWhite;
string text3 = "wait";
if(STOCH3<=OS) 
{
color3 = clrLime;
text3  = "OS";
}
if(STOCH3>=OB) 
{
color3 = clrOrangeRed;
text3  = "OB";
}


double HOKI_BUY   = CLOSE_LAMA>BBAND_BAWAH_LAMA && LOW<=BBAND_BAWAH &&
                    STOCH <= OS &&
                    text1=="OS" && text2=="OS" && text3=="OS" &&
                    STOCH>0 && STOCH1>0 && STOCH2>0 && STOCH3>0 && LOW>0 && BBAND_BAWAH>0;


double HOKI_SELL  = CLOSE_LAMA<BBAND_ATAS_LAMA && HIGH>=BBAND_ATAS &&
                    STOCH >= OB &&
                    text1=="OB" && text2=="OB" && text3=="OB" &&
                    STOCH>0 && STOCH1>0 && STOCH2>0 && STOCH3>0 && HIGH>0 && BBAND_ATAS>0;

//BAGIAN LOT
{
if(jumlahbuy==0)        lotsbuy  = victor;
if(jumlahbuy> 0)        lotsbuy  = NormalizeDouble(lastlotbuy*multiplier,2);

if(jumlahsell==0)        lotssell  = victor;
if(jumlahsell> 0)        lotssell  = NormalizeDouble(lastlotsell*multiplier,2);
}




//BAGIAN OP PERTAMA
  //
  if( Hour()>= (JAM_ON) && Hour()< (JAM_OFF) )
{

  if(jumlahbuy+jumlahsell==0)
  {
    if (OPEN_BUY && HOKI_BUY && bNewBar1())        
       {
            min_volume=SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MIN);
            max_volume=SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MAX);         
            if (victor < min_volume)
               victor=min_volume;  
            if(CheckMoneyForTrade(Symbol(), victor,OP_BUY))     
               double snd = OrderSend(Symbol(),OP_BUY,victor,Ask,Slippage,0,0,CommentEA,MagicNumber,0,clrBlue);
            }                 
    if (OPEN_SELL && HOKI_SELL && bNewBar2())
        {
            min_volume=SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MIN);
            max_volume=SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MAX);          
            if (victor < min_volume)
               victor=min_volume;
            if(CheckMoneyForTrade(Symbol(), victor,OP_SELL))            
               double snd = OrderSend(Symbol(),OP_SELL,victor,Bid,Slippage,0,0,CommentEA,MagicNumber,0,clrRed);
           } 
 }
 
 
 //BAGIAN OP MARTY
 if(USE_MARTY==true)
   {
   int max_allowed_orders=(int)AccountInfoInteger(ACCOUNT_LIMIT_ORDERS);
if (jumlahbuy>0 && BUY[jumlahbuy-1]-Ask>=PipStep*pt && jumlahbuy<Max_Level && OPEN_BUY &&jumlahbuy<max_allowed_orders)//buy
         {
            min_volume=SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MIN);
            max_volume=SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MAX);         
            if (lastlotbuy>max_volume) lastlotbuy=max_volume;
            if (lastlotbuy<min_volume) lastlotbuy=min_volume;
            if(CheckMoneyForTrade(Symbol(), NormalizeDouble(lastlotbuy*multiplier,2),OP_BUY)) 
               double snd = OrderSend(Symbol(),OP_BUY,NormalizeDouble(lastlotbuy*multiplier,2),Ask,Slippage,0,0,CommentEA,MagicNumber,0,clrBlue);
          }
if (jumlahsell>0 && Bid-SELL[jumlahsell-1]>=PipStep*pt && jumlahsell<Max_Level && OPEN_SELL &&jumlahsell<max_allowed_orders)//sell
         {
            min_volume=SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MIN);
            max_volume=SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_MAX);          
            if (lastlotsell>max_volume) lastlotsell=max_volume;
            if (lastlotsell<min_volume) lastlotsell=min_volume;
            if(CheckMoneyForTrade(Symbol(), NormalizeDouble(lastlotsell*multiplier,2),OP_SELL)) 
               double snd = OrderSend(Symbol(),OP_SELL,NormalizeDouble(lastlotsell*multiplier,2),Bid,Slippage,0,0,CommentEA,MagicNumber,0,clrRed);
          }
    }     
 
   }
 



   //BAGIAN TP IN MONEY
     if(tp_in_money>0)
   {
    if( profit>tp_in_money || a>0) 
   {
      closeall();
      closeall();
      closeall();
      a++;
      if(total()==0) a=0;
   }
  
  }
   
 
 if(CLOSE_BY_STOCH==true)
 {
  if(jumlahbuy>0 && text1=="OB"&&text2=="OB"&&text3=="OB")
  {
     closeallbuy();
     closeallbuy();
     closeallbuy();
  }
 if(jumlahsell>0 && text1=="OS"&&text2=="OS"&&text3=="OS")
  {
     closeallsell();
     closeallsell();
     closeallsell();
  }



  }








 //BAGIAN TP PERTAMA
    
     
     for(i=OrdersTotal()-1; i>=0; i--)
     {
       double check = OrderSelect(i,SELECT_BY_POS,MODE_TRADES);
       if(OrderSymbol()!=Symbol() || OrderMagicNumber()!=MagicNumber || OrderType()>1||OrderType()==OP_SELL) continue;
       if(OrderType()==OP_BUY && jumlahbuy==1)
       {
       
 if(SL>0)
 { 
int stops_level=(int)SymbolInfoInteger(_Symbol,SYMBOL_TRADE_STOPS_LEVEL); 
bool SL_checkbuy=(Bid-SL>stops_level*_Point); 
bool SL_checksell=(SL-Ask>stops_level*_Point);
bool TP_checkbuy=(TP-Bid>stops_level*_Point);
bool TP_checksell=(Ask-TP>stops_level*_Point);
if (SL_checkbuy)slbuy = OrderOpenPrice() -SL*pt;
if(SL_checksell)slsell= OrderOpenPrice() +SL*pt;
 }
 if(SL==0)
 { 
slbuy =0;
slsell=0;
 }
 if(TP>0)
 {
   int stops_level=(int)SymbolInfoInteger(_Symbol,SYMBOL_TRADE_STOPS_LEVEL); 
   bool TP_checkbuy=(TP-Bid>stops_level*_Point);
   bool TP_checksell=(Ask-TP>stops_level*_Point); 
   if (TP_checkbuy)tpbuy = OrderOpenPrice() +TP*pt;
   if (TP_checksell)tpsell= OrderOpenPrice() -TP*pt;
}
if(TP==0)
 {
tpbuy =0;
tpsell=0;
}
       
          if((OrderStopLoss()==0 && SL>0)||(OrderTakeProfit()==0 && TP>0))
          {
            if(OrderModifyCheck(OrderTicket(),OrderOpenPrice(),slbuy,tpbuy))
               double mod = OrderModify(OrderTicket(),OrderOpenPrice(),slbuy,tpbuy,0,CLR_NONE);
          }
          
          
       }
     }
   
   ///tp sell  
  
    
     for(i=OrdersTotal()-1; i>=0; i--)
     {
       int check = OrderSelect(i,SELECT_BY_POS,MODE_TRADES);
       if(OrderSymbol()!=Symbol() || OrderMagicNumber()!=MagicNumber || OrderType()>1||OrderType()==OP_BUY) continue;
       if(OrderType()==OP_SELL && jumlahsell==1)
       {
       
       
 if(SL>0)
 { 
  slbuy = OrderOpenPrice() -SL*pt;
  slsell= OrderOpenPrice() +SL*pt;
 }
 if(SL==0)
 { 
slbuy =0;
slsell=0;
 }
 if(TP>0)
 {
  tpbuy = OrderOpenPrice() +TP*pt;
  tpsell= OrderOpenPrice() -TP*pt;
}
if(TP==0)
 {
tpbuy =0;
tpsell=0;
}
       
          if((OrderStopLoss()==0 && SL>0)||(OrderTakeProfit()==0 && TP>0))
          {
            if(OrderModifyCheck(OrderTicket(),OrderOpenPrice(),slsell,tpsell))
               double mod = OrderModify(OrderTicket(),OrderOpenPrice(),slsell,tpsell,0,CLR_NONE);
          }
           
          
       }
     }
         




//BAGIAN TP MARTY

{
  if(jumlahbuy>0 && hargaratabuy>0)
  {
 ///tp buy  
  {
     double s_lbuy=0, t_pbuy=0;
     for(i=0; i<OrdersTotal(); i++)
     {
         int check = OrderSelect(i,SELECT_BY_POS,MODE_TRADES);
         if(OrderSymbol()!=Symbol() || OrderMagicNumber()!=MagicNumber || OrderType()>1||OrderType()==OP_SELL) continue;
         if (OrderType()==OP_BUY)
         if(SL>0)
         {
         s_lbuy=hargaratabuy-SL*pt;
         }
         if(SL==0)
         {
         s_lbuy=0;
         }
         if(TP>0)
         {
         t_pbuy=hargaratabuy+TP*pt;
         }
          if(TP==0)
         {
         t_pbuy=0;
         }
     }
   
     
     
     for(i=OrdersTotal()-1; i>=0; i--)
     {
       int check = OrderSelect(i,SELECT_BY_POS,MODE_TRADES);
       if(OrderSymbol()!=Symbol() || OrderMagicNumber()!=MagicNumber || OrderType()>1||OrderType()==OP_SELL) continue;
       if(OrderType()==OP_BUY)
       {
          if(
            (NormalizeDouble(OrderStopLoss()  ,Digits)!=NormalizeDouble(s_lbuy,Digits) && SL>0)||
            (NormalizeDouble(OrderTakeProfit(),Digits)!=NormalizeDouble(t_pbuy,Digits) && TP>0)
            )
          {
            if(OrderModifyCheck(OrderTicket(),OrderOpenPrice(),NormalizeDouble(s_lbuy,Digits),NormalizeDouble(t_pbuy,Digits)))
               double mod = OrderModify(OrderTicket(),OrderOpenPrice(),NormalizeDouble(s_lbuy,Digits),NormalizeDouble(t_pbuy,Digits),0,CLR_NONE);
          }
       }
     }
   }
   }
   
   
   
   if(jumlahsell>0 && hargaratasell>0)
   {
   ///tp sell  
  {
     double s_lsell=0, t_psell=0;
     for(i=0; i<OrdersTotal(); i++)
     {
         int check = OrderSelect(i,SELECT_BY_POS,MODE_TRADES);
         if(OrderSymbol()!=Symbol() || OrderMagicNumber()!=MagicNumber || OrderType()>1||OrderType()==OP_BUY) continue;
         if (OrderType()==OP_SELL)
         if(SL>0)
         {
         s_lsell=hargaratasell+SL*pt;
         }
         if(SL==0)
         {
         s_lsell=0;
         }
         if(TP>0)
         {
         t_psell=hargaratasell-TP*pt;
         }
          if(TP==0)
         {
         t_psell=0;
         }
     }
   
     
     
     for(i=OrdersTotal()-1; i>=0; i--)
     {
     
       int check = OrderSelect(i,SELECT_BY_POS,MODE_TRADES);
       if(OrderSymbol()!=Symbol() || OrderMagicNumber()!=MagicNumber || OrderType()>1||OrderType()==OP_BUY) continue;
       if(OrderType()==OP_SELL)
       {
           if(
            (NormalizeDouble(OrderStopLoss()  ,Digits)!=NormalizeDouble(s_lsell,Digits) && SL>0)||
            (NormalizeDouble(OrderTakeProfit(),Digits)!=NormalizeDouble(t_psell,Digits) && TP>0)
            )
          {
            if(OrderModifyCheck(OrderTicket(),OrderOpenPrice(),NormalizeDouble(s_lsell,Digits),NormalizeDouble(t_psell,Digits)))
               double mod= OrderModify(OrderTicket(),OrderOpenPrice(),NormalizeDouble(s_lsell,Digits),NormalizeDouble(t_psell,Digits),0,CLR_NONE);
          }
       }
     }
   }       
   }
   
   }




//BAGIAN DISPLAY
  
  if(blink==true)
  {
   if(Seconds()==0)        colorrek=clrYellow;
   if(Seconds()==1)        colorrek=clrYellowGreen;
   if(Seconds()==2)        colorrek=clrAliceBlue;
   if(Seconds()==3)        colorrek=clrAzure;
   if(Seconds()==4)        colorrek=clrAntiqueWhite;
   if(Seconds()==5)        colorrek=clrAqua;
   if(Seconds()==6)        colorrek=clrBeige;
   if(Seconds()==7)        colorrek=clrBlanchedAlmond;
   if(Seconds()==8)        colorrek=clrBisque;
   if(Seconds()==9)        colorrek=clrBlueViolet;
   if(Seconds()==10)        colorrek=clrBrown;
   if(Seconds()==11)        colorrek=clrBurlyWood;
   if(Seconds()==12)        colorrek=clrCadetBlue;
   if(Seconds()==13)        colorrek=clrCoral;
   if(Seconds()==14)        colorrek=clrChartreuse;
   if(Seconds()==15)        colorrek=clrCornflowerBlue;
   if(Seconds()==16)        colorrek=clrCrimson;
   if(Seconds()==17)        colorrek=clrCyan;
   if(Seconds()==18)        colorrek=clrDarkGoldenrod;
   if(Seconds()==19)        colorrek=clrDarkMagenta;
   if(Seconds()==20)        colorrek=clrDarkOliveGreen;
   if(Seconds()==21)        colorrek=clrDarkKhaki;
   if(Seconds()==22)        colorrek=clrFireBrick;
   if(Seconds()==23)        colorrek=clrFloralWhite;
   if(Seconds()==24)        colorrek=clrForestGreen;
   if(Seconds()==25)        colorrek=clrFuchsia;
   if(Seconds()==26)        colorrek=clrGainsboro;
   if(Seconds()==27)        colorrek=clrGhostWhite;
   if(Seconds()==28)        colorrek=clrGold;
   if(Seconds()==29)        colorrek=clrGreenYellow;
   if(Seconds()==30)        colorrek=clrHotPink;
   if(Seconds()==31)        colorrek=clrHoneydew;
   if(Seconds()==32)        colorrek=clrIndianRed;
   if(Seconds()==33)        colorrek=clrIndigo;
   if(Seconds()==34)        colorrek=clrIvory;
   if(Seconds()==35)        colorrek=clrKhaki;
   if(Seconds()==36)        colorrek=clrLavender;
   if(Seconds()==37)        colorrek=clrLawnGreen;
   if(Seconds()==38)        colorrek=clrLemonChiffon;
   if(Seconds()==39)        colorrek=clrLightBlue;
   if(Seconds()==40)        colorrek=clrLightCoral;
   if(Seconds()==41)        colorrek=clrLightPink;
   if(Seconds()==42)        colorrek=clrLime;
   if(Seconds()==43)        colorrek=clrLightSteelBlue;
   if(Seconds()==44)        colorrek=clrLightSlateGray;
   if(Seconds()==45)        colorrek=clrLightSalmon;
   if(Seconds()==46)        colorrek=clrLinen;
   if(Seconds()==47)        colorrek=clrMaroon;
   if(Seconds()==48)        colorrek=clrMediumSeaGreen;
   if(Seconds()==49)        colorrek=clrMediumOrchid;
   if(Seconds()==50)        colorrek=clrMintCream;
   if(Seconds()==51)        colorrek=clrMistyRose;
   if(Seconds()==52)        colorrek=clrMediumTurquoise;
   if(Seconds()==53)        colorrek=clrNavajoWhite;
   if(Seconds()==54)        colorrek=clrOliveDrab;
   if(Seconds()==55)        colorrek=clrOrange;
   if(Seconds()==56)        colorrek=clrOrchid;
   if(Seconds()==57)        colorrek=clrViolet;
   if(Seconds()==58)        colorrek=clrWhiteSmoke;
   if(Seconds()==59)        colorrek=clrYellowGreen;
 
   }
   
   if(blink==false)
   {
     colorrek = clrWhite;
   }
   
  
  
 // CreateRectangle();

   
   {
   string Market_Price38 =   ("     Link : https://t.me/Victoradhitya" );
   ObjectCreate("Market_Price_Label38", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("Market_Price_Label38", Market_Price38, 8, "Arial Bold", colorrek);
   ObjectSet("Market_Price_Label38", OBJPROP_CORNER, 0);
   ObjectSet("Market_Price_Label38", OBJPROP_XDISTANCE, 250);
   ObjectSet("Market_Price_Label38", OBJPROP_YDISTANCE, 1);
  }

 
  {
    
   string Market_Price1 = kata_mutiara1;
   
   ObjectCreate("Market_Price_Label1", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("Market_Price_Label1", Market_Price1, 9, "Arial", colorrek);
   ObjectSet("Market_Price_Label1", OBJPROP_CORNER, 0);
   ObjectSet("Market_Price_Label1", OBJPROP_XDISTANCE, 60);
   ObjectSet("Market_Price_Label1", OBJPROP_YDISTANCE, 270);
  }
  
  
 
 
 
   {
    
   string Market_Price3 =   kata_mutiara2;
   
   ObjectCreate("Market_Price_Label3", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("Market_Price_Label3", Market_Price3, 9, "Arial", colorrek);
   ObjectSet("Market_Price_Label3", OBJPROP_CORNER, 0);
   ObjectSet("Market_Price_Label3", OBJPROP_XDISTANCE, 60);
   ObjectSet("Market_Price_Label3", OBJPROP_YDISTANCE, 285);
  }
 // CreateRectangle();
  
  
 // if(ObjectFind("Rect")>=0)
  {

//  Create_ClearAllButton();
 // Create_CloseBuyButton();
 // Create_CloseSellButton();
  
  {
    
   string Market_Price2 =   WindowExpertName();
   
   ObjectCreate("Market_Price_Label2", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("Market_Price_Label2", Market_Price2, 10, "Arial Black", FontColor);
   ObjectSet("Market_Price_Label2", OBJPROP_CORNER, 0);
   ObjectSet("Market_Price_Label2", OBJPROP_XDISTANCE, 65);
   ObjectSet("Market_Price_Label2", OBJPROP_YDISTANCE, 25);
  }
 
 
   {
    
   string Market_Price31 =   "My Account       : "+DoubleToStr(AccountNumber(),0);
   
   ObjectCreate("Market_Price_Label31", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("Market_Price_Label31", Market_Price31, 11, "Arial", clrWhite);
   ObjectSet("Market_Price_Label31", OBJPROP_CORNER, 0);
   ObjectSet("Market_Price_Label31", OBJPROP_XDISTANCE, 60);
   ObjectSet("Market_Price_Label31", OBJPROP_YDISTANCE, 50);
  }
  
 
   {
 
   string Market_Price28 =   "Leverage          : "+DoubleToStr(AccountLeverage(),0);
   ObjectCreate("Market_Price_Label28", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("Market_Price_Label28", Market_Price28, 11, "Arial", clrWhite);
   ObjectSet("Market_Price_Label28", OBJPROP_CORNER, 0);
   ObjectSet("Market_Price_Label28", OBJPROP_XDISTANCE, 60);
   ObjectSet("Market_Price_Label28", OBJPROP_YDISTANCE, 70);
  }
  
  {
 
   string Market_Price29 =   "Spread             : "+DoubleToStr(SPREAD,2);
   ObjectCreate("Market_Price_Label29", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("Market_Price_Label29", Market_Price29, 11, "Arial", clrWhite);
   ObjectSet("Market_Price_Label29", OBJPROP_CORNER, 0);
   ObjectSet("Market_Price_Label29", OBJPROP_XDISTANCE, 60);
   ObjectSet("Market_Price_Label29", OBJPROP_YDISTANCE, 90);
  }
 
    {
    
   string Market_Price6 =   "Balance           : "+DoubleToStr(AccountBalance(),2);
   
   ObjectCreate("Market_Price_Label6", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("Market_Price_Label6", Market_Price6, 11, "Arial", clrWhite);
   ObjectSet("Market_Price_Label6", OBJPROP_CORNER, 0);
   ObjectSet("Market_Price_Label6", OBJPROP_XDISTANCE, 60);
   ObjectSet("Market_Price_Label6", OBJPROP_YDISTANCE, 110);
  }
  {
    
   string Market_Price5 = "Equity              : " +DoubleToStr(AccountEquity(),2);
   
   ObjectCreate("Market_Price_Label5", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("Market_Price_Label5", Market_Price5, 11, "Arial", clrWhite);
   ObjectSet("Market_Price_Label5", OBJPROP_CORNER, 0);
   ObjectSet("Market_Price_Label5", OBJPROP_XDISTANCE, 60);
   ObjectSet("Market_Price_Label5", OBJPROP_YDISTANCE, 130);
  }
 
 
  {
    
   string Market_Price7 =   "Buy                 : "+DoubleToStr(jumlahbuy,0)+"("+DoubleToStr(profitbuy,2)+")";
   
   ObjectCreate("Market_Price_Label7", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("Market_Price_Label7", Market_Price7, 11, "Arial", clrWhite);
   ObjectSet("Market_Price_Label7", OBJPROP_CORNER, 0);
   ObjectSet("Market_Price_Label7", OBJPROP_XDISTANCE, 60);
   ObjectSet("Market_Price_Label7", OBJPROP_YDISTANCE, 150);
  }
 
  {
    
   string Market_Price8 =   "Sell                 : "+DoubleToStr(jumlahsell,0)+"("+DoubleToStr(profitsell,2)+")";
   
   ObjectCreate("Market_Price_Label8", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("Market_Price_Label8", Market_Price8, 11, "Arial", clrWhite);
   ObjectSet("Market_Price_Label8", OBJPROP_CORNER, 0);
   ObjectSet("Market_Price_Label8", OBJPROP_XDISTANCE, 60);
   ObjectSet("Market_Price_Label8", OBJPROP_YDISTANCE, 170);
  }
 
  
   {
    
   string Market_Price13 = "Profit            : "+DoubleToStr(profit,2);
   
   ObjectCreate("Market_Price_Label13", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("Market_Price_Label13", Market_Price13, 11, "Arial", clrWhite);
   ObjectSet("Market_Price_Label13", OBJPROP_CORNER, 0);
   ObjectSet("Market_Price_Label13", OBJPROP_XDISTANCE, 60);
   ObjectSet("Market_Price_Label13", OBJPROP_YDISTANCE, 190);
  }
 
  
  
   {
    
   string Market_Price14 = "Bb Up : "+DoubleToStr(BBAND_ATAS,Digits());
   
   ObjectCreate("Market_Price_Label14", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("Market_Price_Label14", Market_Price14, 11, "Arial", clrYellow);
   ObjectSet("Market_Price_Label14", OBJPROP_CORNER, 0);
   ObjectSet("Market_Price_Label14", OBJPROP_XDISTANCE, 60);
   ObjectSet("Market_Price_Label14", OBJPROP_YDISTANCE, 210);
  }
 
   {
    
   string Market_Price15 = "Bb Dn : "+DoubleToStr(BBAND_BAWAH,Digits());
   
   ObjectCreate("Market_Price_Label15", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("Market_Price_Label15", Market_Price15, 11, "Arial", clrYellow);
   ObjectSet("Market_Price_Label15", OBJPROP_CORNER, 0);
   ObjectSet("Market_Price_Label15", OBJPROP_XDISTANCE, 60);
   ObjectSet("Market_Price_Label15", OBJPROP_YDISTANCE, 230);
  }
 {
    
   string Market_Price16 = "Stoch : "+DoubleToStr(STOCH,2);
   
   ObjectCreate("Market_Price_Label16", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("Market_Price_Label16", Market_Price16, 11, "Arial", clrAqua);
   ObjectSet("Market_Price_Label16", OBJPROP_CORNER, 0);
   ObjectSet("Market_Price_Label16", OBJPROP_XDISTANCE, 60);
   ObjectSet("Market_Price_Label16", OBJPROP_YDISTANCE, 250);
  }
  

 {
    
   string Market_Price17 = "Stoch("+texttf1+") : "+text1+"===>"+DoubleToStr(STOCH1,2);
   
   ObjectCreate("Market_Price_Label17", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("Market_Price_Label17", Market_Price17, 11, "Arial", color1);
   ObjectSet("Market_Price_Label17", OBJPROP_CORNER, 0);
   ObjectSet("Market_Price_Label17", OBJPROP_XDISTANCE, 260);
   ObjectSet("Market_Price_Label17", OBJPROP_YDISTANCE, 210);
  }

 {
    
   string Market_Price18 = "Stoch("+texttf2+") : "+text2+"===>"+DoubleToStr(STOCH2,2);
   
   ObjectCreate("Market_Price_Label18", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("Market_Price_Label18", Market_Price18, 11, "Arial", color2);
   ObjectSet("Market_Price_Label18", OBJPROP_CORNER, 0);
   ObjectSet("Market_Price_Label18", OBJPROP_XDISTANCE, 260);
   ObjectSet("Market_Price_Label18", OBJPROP_YDISTANCE, 230);
  }

 {
    
   string Market_Price19 = "Stoch("+texttf3+") : "+text3+"===>"+DoubleToStr(STOCH3,2);
   
   ObjectCreate("Market_Price_Label19", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("Market_Price_Label19", Market_Price19, 11, "Arial", color3);
   ObjectSet("Market_Price_Label19", OBJPROP_CORNER, 0);
   ObjectSet("Market_Price_Label19", OBJPROP_XDISTANCE, 260);
   ObjectSet("Market_Price_Label19", OBJPROP_YDISTANCE, 250);
  }


//////////END DISPLAY///////

  }





////akun number
  }

   //return(0);
  }





//+------------------------------------------------------------------+


//////////////////////////////////////////////////////////////////<          >
bool       bNewBar1 ()                                           //<          >
{                                                               //<          >
//                                                              //<          >
static int iTime_1 = 0                                        ; //<          >
//                                                              //<          >
if       ( iTime_1 < iTime ( 0 , 0 , 0 ) )                      //<          >
         { iTime_1 = iTime ( 0 , 0 , 0 ) ; return ( 1  ) ; } //<          >
else     {                                 return ( 0 ) ; } //<          >
//                                                              //<          >
}                                                               //<          >
//////////////////////////////////////////////////////////////////<          >
     //////////////////////////////////////////////////////////////////<          >
bool       bNewBar2 ()                                           //<          >
{                                                               //<          >
//                                                              //<          >
static int iTime_2 = 0                                        ; //<          >
//                                                              //<          >
if       ( iTime_2 < iTime ( 0 , 0 , 0 ) )                      //<          >
         { iTime_2 = iTime ( 0 , 0 , 0 ) ; return ( 1  ) ; } //<          >
else     {                                 return ( 0 ) ; } //<          >
//                                                              //<          >
}                                                               //<          >
//////////////////////////////////////////////////////////////////<          >
     


/// DAILY TARGET UNTUK MAX TRADE///

double dailyprofit()
{
  int day=Day(); double res=0;
  for(i=0; i<OrdersHistoryTotal(); i++)
  {
      int check = OrderSelect(i,SELECT_BY_POS,MODE_HISTORY);
      if(OrderSymbol()!=Symbol() || OrderMagicNumber()!=MagicNumber) continue;
      if(TimeDay(OrderOpenTime())==day) res+=OrderProfit();
  }
  return(res);
}








int total()
{
  int total=0;
  for(i=0; i<OrdersTotal(); i++)
  {
      int check = OrderSelect(i,SELECT_BY_POS,MODE_TRADES);
      if(OrderSymbol()!=Symbol() || OrderMagicNumber()!=MagicNumber) continue;
      total++;
  }
  return(total);
}

// CLOSING //

void closeall()
{
  for(i=OrdersTotal()-1; i>=0; i--)
  {
      int check = OrderSelect(i,SELECT_BY_POS,MODE_TRADES);
      if(OrderSymbol()!=Symbol() || OrderMagicNumber()!=MagicNumber) continue;
      if(OrderType()>1) double del = OrderDelete(OrderTicket());
      else
      {
        if(OrderType()==0) double cls=OrderClose(OrderTicket(),OrderLots(),Bid,3,CLR_NONE);
        else               double cls=OrderClose(OrderTicket(),OrderLots(),Ask,3,CLR_NONE);
      }
  }
}




int totalbuy()
{
  int totalbuy=0;
  for(i=0; i<OrdersTotal(); i++)
  {
      int check=OrderSelect(i,SELECT_BY_POS,MODE_TRADES);
      if(OrderSymbol()!=Symbol() || OrderMagicNumber()!=MagicNumber || OrderType()==OP_SELL) continue;
      totalbuy++;
  }
  return(totalbuy);
}

// CLOSING //

void closeallbuy()
{
  for(i=OrdersTotal()-1; i>=0; i--)
  {
      int check=OrderSelect(i,SELECT_BY_POS,MODE_TRADES);
      if(OrderSymbol()!=Symbol() || OrderMagicNumber()!=MagicNumber || OrderType()==OP_SELL) continue;
      
        if(OrderType()==OP_BUY) double cls= OrderClose(OrderTicket(),OrderLots(),Bid,3,CLR_NONE);
         
  }
}




int totalsell()
{
  int totalsell=0;
  for(i=0; i<OrdersTotal(); i++)
  {
      int check=OrderSelect(i,SELECT_BY_POS,MODE_TRADES);
      if(OrderSymbol()!=Symbol() || OrderMagicNumber()!=MagicNumber || OrderType()==OP_BUY) continue;
      totalsell++;
  }
  return(totalsell);
}

// CLOSING //

void closeallsell()
{
  for(i=OrdersTotal()-1; i>=0; i--)
  {
      int check = OrderSelect(i,SELECT_BY_POS,MODE_TRADES);
      if(OrderSymbol()!=Symbol() || OrderMagicNumber()!=MagicNumber || OrderType()==OP_BUY) continue;
      
        if(OrderType()==OP_SELL) double close = OrderClose(OrderTicket(),OrderLots(),Ask,3,CLR_NONE);
         
  }
}







   
   
   
   
   
   
void CreateRectangle(const long  chart_ID=0,              
   const string           name="Rect")
  {
   
   
   
   
    ObjectCreate(chart_ID,name,OBJ_RECTANGLE_LABEL, 0, 0, 0);
    ObjectSetInteger(chart_ID,name,OBJPROP_BGCOLOR,clrBlack);
    ObjectSetInteger(chart_ID,name,OBJPROP_XDISTANCE,50);
    ObjectSetInteger(chart_ID,name,OBJPROP_YDISTANCE,18);
    ObjectSetInteger(chart_ID,name,OBJPROP_XSIZE,350);
    ObjectSetInteger(chart_ID,name,OBJPROP_YSIZE,350);
    
    

  
   
} 





  bool Create_ClearAllButton(const long              chart_ID7=0,               // chart's ID
                      const string            name7="Button_ClearAll",        // button name
                      const int               x7=290,                      // X coordinate
                      const int               y7=25,// Y coordinate
                      const int               width7=80,                 // button width
                      const int               height7=18,                // button height
                      const ENUM_BASE_CORNER  corner7=CORNER_LEFT_UPPER, // chart corner for anchoring
                      const string            text7="Close All",               // text
                      const string            font7="Arial Black",       // font
                      const int               font_size7=10,             // font size
                      const color             clr7=clrBlack,             // text color
                      const color             back_clr7=clrWhite,         // background color
                      const bool              back7=false                // in the background
                      )
  {
//--- reset the error value
   ResetLastError();
//--- create the button
   ObjectCreate(chart_ID7,name7,OBJ_BUTTON,0,0,0);
   ObjectSetInteger(chart_ID7,name7,OBJPROP_XDISTANCE,x7);
   ObjectSetInteger(chart_ID7,name7,OBJPROP_YDISTANCE,y7);
   ObjectSetInteger(chart_ID7,name7,OBJPROP_XSIZE,width7);
   ObjectSetInteger(chart_ID7,name7,OBJPROP_YSIZE,height7);
   ObjectSetString(chart_ID7,name7,OBJPROP_TEXT,text7);
   ObjectSetString(chart_ID7,name7,OBJPROP_FONT,font7);
   ObjectSetInteger(chart_ID7,name7,OBJPROP_FONTSIZE,font_size7);
   ObjectSetInteger(chart_ID7,name7,OBJPROP_COLOR,clr7);
   ObjectSetInteger(chart_ID7,name7,OBJPROP_BGCOLOR,back_clr7);
   ObjectSetInteger(chart_ID7,name7,OBJPROP_BACK,back7);
//--- successful execution
   return(true);
  }
  
  
  
  
  void OnChartEvent(const int id,
                  const long &lparam,
                  const double &dparam,
                  const string &sparam)
  {
//---
   if(id==CHARTEVENT_OBJECT_CLICK)
     {
         
      if(sparam=="Button_ClearAll")
        {
         closeall();
         ObjectSetInteger(0,"Button_ClearAll",OBJPROP_STATE,false);
        }  
        
       if(sparam=="Button_CloseBuy")
        {
         closeallbuy();
         ObjectSetInteger(0,"Button_CloseBuy",OBJPROP_STATE,false);
        }   
        if(sparam=="Button_CloseSell")
        {
         closeallsell();
         ObjectSetInteger(0,"Button_CloseSell",OBJPROP_STATE,false);
        }   
     }
  }
  
  
  
bool Create_CloseBuyButton(const long              chart_ID5=0,               // chart's ID
                      const string            name5="Button_CloseBuy",        // button name
                      const int               x5=290,                      // X coordinate
                      const int               y5=55,// Y coordinate
                      const int               width5=78,                 // button width
                      const int               height5=18,                // button height
                      const ENUM_BASE_CORNER  corner5=CORNER_LEFT_UPPER, // chart corner for anchoring
                      const string            text5="Close Buy",               // text
                      const string            font5="Arial Black",       // font
                      const int               font_size5=10,             // font size
                      const color             clr5=clrBlack,             // text color
                      const color             back_clr5=clrWhite,         // background color
                      const bool              back5=false                // in the background
                      )
  {
//--- reset the error value
   ResetLastError();
//--- create the button
   ObjectCreate(chart_ID5,name5,OBJ_BUTTON,0,0,0);
   ObjectSetInteger(chart_ID5,name5,OBJPROP_XDISTANCE,x5);
   ObjectSetInteger(chart_ID5,name5,OBJPROP_YDISTANCE,y5);
   ObjectSetInteger(chart_ID5,name5,OBJPROP_XSIZE,width5);
   ObjectSetInteger(chart_ID5,name5,OBJPROP_YSIZE,height5);
   ObjectSetString(chart_ID5,name5,OBJPROP_TEXT,text5);
   ObjectSetString(chart_ID5,name5,OBJPROP_FONT,font5);
   ObjectSetInteger(chart_ID5,name5,OBJPROP_FONTSIZE,font_size5);
   ObjectSetInteger(chart_ID5,name5,OBJPROP_COLOR,clr5);
   ObjectSetInteger(chart_ID5,name5,OBJPROP_BGCOLOR,back_clr5);
   ObjectSetInteger(chart_ID5,name5,OBJPROP_BACK,back5);
//--- successful execution
   return(true);
  }
//+------------------------------------------------------------------+
//| Create the Sell button                                                |
//+------------------------------------------------------------------+

  
  
  
  
  
  
  bool Create_CloseSellButton(const long              chart_ID6=0,               // chart's ID
                      const string            name6="Button_CloseSell",        // button name
                      const int               x6=290,                      // X coordinate
                      const int               y6=85,// Y coordinate
                      const int               width6=78,                 // button width
                      const int               height6=18,                // button height
                      const ENUM_BASE_CORNER  corner6=CORNER_LEFT_UPPER, // chart corner for anchoring
                      const string            text6="Close Sell",               // text
                      const string            font6="Arial Black",       // font
                      const int               font_size6=10,             // font size
                      const color             clr6=clrBlack,             // text color
                      const color             back_clr6=clrWhite,         // background color
                      const bool              back6=false                // in the background
                      )
  {
//--- reset the error value
   ResetLastError();
//--- create the button
   ObjectCreate(chart_ID6,name6,OBJ_BUTTON,0,0,0);
   ObjectSetInteger(chart_ID6,name6,OBJPROP_XDISTANCE,x6);
   ObjectSetInteger(chart_ID6,name6,OBJPROP_YDISTANCE,y6);
   ObjectSetInteger(chart_ID6,name6,OBJPROP_XSIZE,width6);
   ObjectSetInteger(chart_ID6,name6,OBJPROP_YSIZE,height6);
   ObjectSetString(chart_ID6,name6,OBJPROP_TEXT,text6);
   ObjectSetString(chart_ID6,name6,OBJPROP_FONT,font6);
   ObjectSetInteger(chart_ID6,name6,OBJPROP_FONTSIZE,font_size6);
   ObjectSetInteger(chart_ID6,name6,OBJPROP_COLOR,clr6);
   ObjectSetInteger(chart_ID6,name6,OBJPROP_BGCOLOR,back_clr6);
   ObjectSetInteger(chart_ID6,name6,OBJPROP_BACK,back6);
//--- successful execution
   return(true);
  }
//+------------------------------------------------------------------+
//| Create the Sell button                                                |
//+------------------------------------------------------------------+

  
  
void drawLine1(double a_price_0, string a_name_8, color a_color_16, int ai_20) {
   if (ObjectFind(a_name_8) != 0) {
      ObjectCreate(a_name_8, OBJ_HLINE, 0, Time[0], a_price_0, Time[0], a_price_0);
      if (ai_20 == 1) ObjectSet(a_name_8, OBJPROP_STYLE, STYLE_SOLID);
      else {
         if (ai_20 == 2) ObjectSet(a_name_8, OBJPROP_STYLE, STYLE_DASHDOTDOT);
         else ObjectSet(a_name_8, OBJPROP_STYLE, STYLE_DOT);
      }
      ObjectSet(a_name_8, OBJPROP_COLOR, a_color_16);
      ObjectSet(a_name_8, OBJPROP_WIDTH, 1);
      return;
   }
   ObjectDelete(a_name_8);
   ObjectCreate(a_name_8, OBJ_HLINE, 0, Time[0], a_price_0, Time[0], a_price_0);
   if (ai_20 == 1) ObjectSet(a_name_8, OBJPROP_STYLE, STYLE_SOLID);
   else {
      if (ai_20 == 2) ObjectSet(a_name_8, OBJPROP_STYLE, STYLE_DASHDOTDOT);
      else ObjectSet(a_name_8, OBJPROP_STYLE, STYLE_DOT);
   }
   ObjectSet(a_name_8, OBJPROP_COLOR, a_color_16);
   ObjectSet(a_name_8, OBJPROP_WIDTH, 1);
}


bool CheckMoneyForTrade(string symb, double lots,int type)
  {
   double free_margin=AccountFreeMarginCheck(symb,type, lots);
   //-- if there is not enough money
   if(free_margin<0)
     {
      string oper=(type==OP_BUY)? "Buy":"Sell";
      Print("Not enough money for ", oper," ",lots, " ", symb, " Error code=",GetLastError());
      return(false);
     }
   //--- checking successful
   return(true);
  }
  
bool OrderModifyCheck(int ticket,double price,double sl,double tp)
  {
//--- select order by ticket
   if(OrderSelect(ticket,SELECT_BY_TICKET))
     {
      //--- point size and name of the symbol, for which a pending order was placed
      string symbol=OrderSymbol();
      double point=SymbolInfoDouble(symbol,SYMBOL_POINT);
      //--- check if there are changes in the Open price
      bool PriceOpenChanged=true;
      int type=OrderType();
      if(!(type==OP_BUY || type==OP_SELL))
        {
         PriceOpenChanged=(MathAbs(OrderOpenPrice()-price)>point);
        }
      //--- check if there are changes in the StopLoss level
      bool StopLossChanged=(MathAbs(OrderStopLoss()-sl)>point);
      //--- check if there are changes in the Takeprofit level
      bool TakeProfitChanged=(MathAbs(OrderTakeProfit()-tp)>point);
      //--- if there are any changes in levels
      if(PriceOpenChanged || StopLossChanged || TakeProfitChanged)
         return(true);  // order can be modified      
      //--- there are no changes in the Open, StopLoss and Takeprofit levels
      else
      //--- notify about the error
         PrintFormat("Order #%d already has levels of Open=%.5f SL=%.5f TP=%.5f",
                     ticket,OrderOpenPrice(),OrderStopLoss(),OrderTakeProfit());
     }
//--- came to the end, no changes for the order
   return(false);       // no point in modifying 
  }  