 //+------------------------------------------------------------------+
 //|                                                                  |
 //|                                                                  |
 //|                                      www.arabictrader.com/vb     |
 //|                                                                  |
 //|                                          mrdollar.cs@gmail.com   |
 //+------------------------------------------------------------------+
 
#property copyright "MR.dollarEA"
#property link      "mrdollar.cs@gmail.com"

          
 input bool  UseHourTrade = false;        
 input int  FromHourTrade = 7;            
 input int  ToHourTrade = 17; 
 input bool OpenHedgeFirstTime=false;
 input double HedgeLots=0.1;
 input int HedgeTP=0;
 input int HedgeSL=0;
 input bool AddOrdersAfterClose=true;
 input bool ReverseClosedOrders=false;
 input bool CloseIfLastOrderProfit=false;
 input string S1="BuyStop Orders Settings ";
 input bool OpenBuyStopOrders=true;
 input int NumberOfBuyStopOrders=50;
 input double BuyStopFirstLot=0.1;
  input int DistanceFromCurrentPriceBS=0;
 input int DistanceBetweenBuyS=20;
 input int Distance_AddBuyS=0;
 input int BuyStopTakeProfit=0;
 input int BuyStopSL=0;
 input string S2="BuyLimit Orders Settings";
 input bool OpenBuyLimitOrders=true;
 extern int NumberOfBuyLimitOrders=50;
 input double BuyLimitFirstLot=0.1;
  input int DistanceFromCurrentPriceBL=0;
input int DistanceBetweenBuyL=20;
 input int Distance_AddBuyL=0;
 input int BuyLimitTakeProfit=0;
 input int BuyLimitSL=0;
 input string S3="SellStop Orders Settings";
 input bool OpenSellStopOrders=true;
 input int NumberOfSellStopOrders=50;
 input double SellStopFirstLot=0.1;
  input int DistanceFromCurrentPriceSS=0;
 input int DistanceBetweenSellS=20;
  input int Distance_AddSellS=0;
 input int SellStopTakeProfit=0;
 input int SellStopSL=0;
 input string S4="SellLimit Orders Settings";
 input bool OpenSellLimitOrders=true;
 input int NumberOfSellLimitOrders=50;
 input double SellLimitFirstLot=0.1;
  input int DistanceFromCurrentPriceSL=0;
 input int DistanceBetweenSellL=20;
  input int Distance_AddSellL=0;
 input int SellLimitTakeProfit=0;
 input int SellLimitSL=0;
input string S5=" Lots Multiplier ";
 input bool UseMultiplier=true;
 input bool X_Multiplier=true;
 input double Multiplier=2;

 
 input string S6=" Order Open Time/Price Settings ";
  input bool HighLowCandle=false;
 input bool OpenAtChoosenHour=false;
 input int Hour_=12;
 input double StartPrice=0;
 input int Gap=3;

 input bool OnlyOnce=false;
 input string S7=" Close and Delete Orders ";
 input bool FridayOpenOrdersFilter=true;
 input bool FridayDeleteOrders=false;
 input bool FridayCloseOrders=false;
 input int _Hour=20;
 input bool CloseAfterPassMinutes=false;
 input int MinutesPass=100;
 input bool CloseOrdersAfterProfit=true;
 input bool DeleteOrdersAfterProfit=true;
 input int Profit=200;
  input bool CloseOrdersAfterLoss=false;
 input double Loss=-200;
input string S8=" Order Management";

input int TrailingStop=0;
input int TrailingProfit=0;
input int TrailingStep=0;

input string S9="Time Filter";
input bool FridayCloseEA=false;
input int Friday_CloseHour=20;


     
 bool enter;
 double point;double Price;
 int digits;int i,Q,Qq;
 extern int MagicNumber=2533;
                         
 void OnInit()
{
  if(OpenBuyStopOrders&&OpenBuyLimitOrders){Q=NumberOfBuyLimitOrders+NumberOfBuyStopOrders;}
  else if((OpenBuyStopOrders==false&&OpenBuyLimitOrders)){Q=NumberOfBuyLimitOrders;}
  else if((OpenBuyStopOrders&&OpenBuyLimitOrders==false)){Q=NumberOfBuyStopOrders;}
  else{Q=0;}
  if(OpenSellStopOrders&&OpenSellLimitOrders){Qq=NumberOfSellLimitOrders+NumberOfSellStopOrders;}
  else if((OpenSellStopOrders&&OpenSellLimitOrders==false)){Qq=NumberOfSellStopOrders;}
    else if((OpenSellStopOrders==false&&OpenSellLimitOrders)){Qq=NumberOfSellLimitOrders;}
     else{Qq=0;}
  enter=true;
    if(Digits<4)
   {
      point=0.01;
      digits=2;
   }
   else
   {
      point=0.0001;
      digits=4;
   }
}

 //+------------------------------------------------------------------+
 //| FUNCTION DEFINITIONS    deinitialization function                |
 //+------------------------------------------------------------------+

 void OnDeinit(const int reason) 
 {
    Comment("");
 }
 
 int orderscnt()
 {
 int cnt=0;
   for(int i =0;i<OrdersTotal();i++){
     if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES)){
       if(OrderSymbol()==Symbol() && OrderMagicNumber()==MagicNumber){
         cnt++;
       }
     }
   }
    return(cnt);
  }
int ordersPen()
{
 int cnt=0;
   for(int i =0;i<OrdersTotal();i++){
     if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES)){
       if(OrderSymbol()==Symbol() && OrderMagicNumber()==MagicNumber&&OrderType()>OP_SELL){
         cnt++;
       }
     }
   }
    return(cnt);
  }
 int orders(){
 int cnt=0;
   for(int i =0;i<OrdersTotal();i++){
     if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES)){
       if(OrderSymbol()==Symbol() && OrderMagicNumber()==MagicNumber&&OrderType()<=OP_SELL){
         cnt++;
       }
     }
   }
    return(cnt);
  }
 //+------------------------------------------------------------------+
 //| FUNCTION DEFINITIONS   Start function                            |
 //+------------------------------------------------------------------+
 void OnTick()
   {
    Comment("Programmed by MR.dollar"+"\n"+"منتدى المتداول العربي"+"\n"+"www.arabictrader.com/vb"+"\n"+
    "Number Of Pending Orders = "+ordersPen()+"\n"+"Number Of Market Orders = "+orders()+"\n"+
    "Account Free Margin = "+DoubleToStr(AccountFreeMargin(),2)+"\n"+"Profit Value = "+DoubleToStr(AccountProfit(),2));
    
       bool ss=true;
        if(Qq+Q==orderscnt()&&!((FromHourTrade < ToHourTrade && TimeHour(TimeCurrent()) >= FromHourTrade && TimeHour(TimeCurrent()) < ToHourTrade) || (FromHourTrade > ToHourTrade && TimeHour(TimeCurrent()) >= FromHourTrade ||
               TimeHour(TimeCurrent()) < ToHourTrade))&&UseHourTrade){
       DeletePendingOrders();
       }
       if (UseHourTrade){
        if(!((FromHourTrade < ToHourTrade && TimeHour(TimeCurrent()) >= FromHourTrade && TimeHour(TimeCurrent()) < ToHourTrade) || (FromHourTrade > ToHourTrade && TimeHour(TimeCurrent()) >= FromHourTrade ||
               TimeHour(TimeCurrent()) < ToHourTrade))){
           Comment("Non-Trading Hours!");
           ss=false;
         }
       }
       
        if(TrailingStop>0)MoveTrailingStop();
        if(FridayCloseEA&&Hour()>=Friday_CloseHour&&DayOfWeek()==5)
           return;
        /////////////////////////add orders again//////////////////
        if(AddOrdersAfterClose&&orderscnt()>0){
         OpenClosedOrders();
        }
        int totalNumber=0;
        //////////////////////////////////////////////////
        if(ss==true&&orderscnt()<1&&(OnlyOnce==false||enter==true)&&(FridayOpenOrdersFilter==false||DayOfWeek()!=5||Hour()<_Hour)&&(Hour()==Hour_||OpenAtChoosenHour==false)){
       double lastlot;double newlot;double TP,SL;
       lastlot=0;
        if(OpenHedgeFirstTime)
         {
          if(HedgeSL==0){SL=0;}else{SL=Ask-HedgeSL*point;}
          if(HedgeTP==0){TP=0;}else{TP=Ask+HedgeTP*point;}
          OrderSend(Symbol(),OP_BUY,HedgeLots,NormalizeDouble(Ask,Digits),3*Q,NormalizeDouble(SL,Digits),NormalizeDouble(TP,Digits),"MR.dollar EA",MagicNumber,0,Blue);
          if(HedgeSL==0){SL=0;}else{SL=Bid+HedgeSL*point;}
          if(HedgeTP==0){TP=0;}else{TP=Bid-HedgeTP*point;}
          OrderSend(Symbol(),OP_SELL,HedgeLots,NormalizeDouble(Bid,Digits),3*Q,NormalizeDouble(SL,Digits),NormalizeDouble(TP,Digits),"MR.dollar EA",MagicNumber,0,Red); 
         }
       if(OpenSellLimitOrders){
        for(i=1;i<=NumberOfSellLimitOrders;i++)
        {
         if(UseMultiplier){
          if(X_Multiplier){
           newlot=Multiplier*lastlot;
          }
          else{newlot=lastlot+SellLimitFirstLot;}
          }
         else{newlot=SellLimitFirstLot;}
        if(newlot==0){newlot=SellLimitFirstLot;}
         lastlot=newlot;
       
         if(StartPrice==0){Price=Bid+(DistanceFromCurrentPriceSL*point)+(i*DistanceBetweenSellL*point+i*Distance_AddSellL*point);}
         else{Price=StartPrice+(DistanceFromCurrentPriceSL*point)+(i*DistanceBetweenSellL*point);}
         if(HighLowCandle){Price=High[1]+(DistanceFromCurrentPriceSL*point)+(i*DistanceBetweenSellL*point);}
         if(SellLimitTakeProfit==0){TP=0;}else{TP=Price-SellLimitTakeProfit*point;}
         if(SellLimitSL==0){SL=0;}else{SL=Price+SellLimitSL*point;}
         
         if((StartPrice==0&&HighLowCandle==false)||(HighLowCandle==true&&Hour()==Hour_+1)||(Close[0]>=StartPrice-Gap*point&&Close[0]<=StartPrice+Gap*point)){  
            OrderSend(Symbol(),OP_SELLLIMIT,newlot,Price,3,SL,TP,"MR.dollarEA"+totalNumber+"_",MagicNumber,0,Red);
             totalNumber++;
          }
         }
        }
       
       lastlot=0;
       if(OpenBuyLimitOrders){
        for(i=1;i<=NumberOfBuyLimitOrders;i++)
        {
         if(UseMultiplier){
        if(X_Multiplier){
         newlot=Multiplier*lastlot;
        }
        else{newlot=lastlot+BuyLimitFirstLot;}
       }
       else{newlot=BuyLimitFirstLot;}
         if(newlot==0){newlot=BuyLimitFirstLot;}
         lastlot=newlot;
     
         if(StartPrice==0){Price=Ask-(DistanceFromCurrentPriceBL*point)-(i*DistanceBetweenBuyL*point+i*Distance_AddBuyL*point);} 
         else{Price=StartPrice-(DistanceFromCurrentPriceBL*point)-(i*DistanceBetweenBuyL*point);}
         if(HighLowCandle){Price=Low[1]-(DistanceFromCurrentPriceBL*point)-(i*DistanceBetweenBuyL*point);}
          if(BuyLimitTakeProfit==0){TP=0;}else{TP=Price+BuyLimitTakeProfit*point;}
          if(BuyLimitSL==0){SL=0;}else{SL=Price-BuyLimitSL*point;}
          if((StartPrice==0&&HighLowCandle==false)||(HighLowCandle==true&&Hour()==Hour_+1)||(Close[0]>=StartPrice-Gap*point&&Close[0]<=StartPrice+Gap*point)){ 
            OrderSend(Symbol(),OP_BUYLIMIT,newlot,Price,3,SL,TP,"MR.dollarEA"+totalNumber+"_",MagicNumber,0,Green);
           totalNumber++;
          }  
         }
       }
        lastlot=0;
       if(OpenSellStopOrders){ 
        for(i=1;i<=NumberOfSellStopOrders;i++)
        {
       if(UseMultiplier){
        if(X_Multiplier){
        newlot=Multiplier*lastlot;
        }else{newlot=lastlot+SellStopFirstLot;}
        }else{newlot=SellStopFirstLot;}
         if(newlot==0){newlot=SellStopFirstLot;}
         lastlot=newlot;
        if(StartPrice==0){Price=Bid-(DistanceFromCurrentPriceSS*point)-(i*DistanceBetweenSellS*point+i*Distance_AddSellS*point);}
        else{Price=StartPrice-(DistanceFromCurrentPriceSS*point)-(i*DistanceBetweenSellS*point);}
        if(HighLowCandle){Price=Low[1]-(DistanceFromCurrentPriceSS*point)-(i*DistanceBetweenSellS*point);}
         if(SellStopTakeProfit==0){TP=0;}else{TP=Price-SellStopTakeProfit*point;}
         if(SellStopSL==0){SL=0;}else{SL=Price+SellStopSL*point;}
         if((StartPrice==0&&HighLowCandle==false)||(HighLowCandle==true&&Hour()==Hour_+1)||(Close[0]>=StartPrice-Gap*point&&Close[0]<=StartPrice+Gap*point)){ 
          OrderSend(Symbol(),OP_SELLSTOP,newlot,Price,3,SL,TP,"MR.dollarEA"+totalNumber+"_",MagicNumber,0,Red);
           totalNumber++;
          } 
         }
        }
        
         lastlot=0;
        if(OpenBuyStopOrders){
        for(i=1;i<=NumberOfBuyStopOrders;i++)
        {
      if(UseMultiplier){
        if(X_Multiplier){
        newlot=Multiplier*lastlot;
        }else{newlot=lastlot+BuyStopFirstLot;}
        }else{newlot=BuyStopFirstLot;}
         if(newlot==0){newlot=BuyStopFirstLot;}
         lastlot=newlot;
     //     if(i>1){DistanceFromCurrentPriceBS=0;}
         if(StartPrice==0){Price=Ask+(DistanceFromCurrentPriceBS*point)+(i*DistanceBetweenBuyS*point+i*Distance_AddBuyS*point);} 
         else{Price=StartPrice+(DistanceFromCurrentPriceBS*point)+(i*DistanceBetweenBuyS*point);}
         if(HighLowCandle){Price=High[1]+(DistanceFromCurrentPriceBS*point)+(i*DistanceBetweenBuyS*point);}
         if(BuyStopTakeProfit==0){TP=0;}else{TP=Price+BuyStopTakeProfit*point;}
         if(BuyStopSL==0){SL=0;}else{SL=Price-BuyStopSL*point;}
         if((StartPrice==0&&HighLowCandle==false)||(HighLowCandle==true&&Hour()==Hour_+1)||(Close[0]>=StartPrice-Gap*point&&Close[0]<=StartPrice+Gap*point)){ 
          OrderSend(Symbol(),OP_BUYSTOP,newlot,Price,3,SL,TP,"MR.dollarEA"+totalNumber+"_",MagicNumber,0,Green);
          totalNumber++;
          } 
         }
        }
       } 
   ////////////////////////////////////////////////////
      int m1;
    
     if(Q+Qq>orderscnt()&&CloseIfLastOrderProfit){
     DeletePendingOrders();
     while(orders()>=1){CloseAllOrders();}
     }
     if (profit()>=Profit)
        {
        if(CloseOrdersAfterProfit){
        while(orders()>=1){CloseAllOrders();
        }
        if(DeleteOrdersAfterProfit){DeletePendingOrders();}
        
         }
          }
        if((profit()<Loss&&CloseOrdersAfterLoss)||(CloseAfterPassMinutes&&TimePassed())){
       while(orders()>=1&&m1<20){
       CloseAllOrders();
       DeletePendingOrders();
       m1++;
       }
      }
     if(DayOfWeek()==5&&Hour()>=_Hour){
     if(FridayDeleteOrders==true){  
        DeletePendingOrders();}
     if(FridayCloseOrders==true){
       CloseAllOrders();}
       } 
     }
   
  
//+------------------------------------------------------------------+
int TimePassed(){
for(int i=0;i<=OrdersTotal();i++){
OrderSelect(i,SELECT_BY_POS,MODE_TRADES);
if(OrderSymbol()==Symbol()&&OrderMagicNumber()==MagicNumber){
if((TimeCurrent()-OrderOpenTime())/60>=MinutesPass){
return(true);
  }
 }
}
return(false);
}

int CloseAllOrders()
{ 
int total=OrdersTotal();

  for (int cnt = 0 ; cnt < total ; cnt++)
  {
    OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES);
    if (OrderMagicNumber() == MagicNumber && OrderSymbol()==Symbol())
    {
      if (OrderType()==OP_BUY)
      {
        if(OrderClose(OrderTicket(),OrderLots(),NormalizeDouble(Bid,digits),3)==false){
        cnt=0;total=OrdersTotal();}
      }
      if (OrderType()==OP_SELL)
      {
       if(OrderClose(OrderTicket(),OrderLots(),NormalizeDouble(Ask,digits),3)==false){
       cnt=0;total=OrdersTotal();}
      }
    }
  }
  return(0);
}  

 //+------------------------------------------------------------------+
 //| FUNCTION DEFINITIONS   TrailingStop                              |
 //+------------------------------------------------------------------+
    
    //|---------trailing stop

void MoveTrailingStop()
{
   int cnt,total=OrdersTotal();
   for(cnt=0;cnt<total;cnt++)
   {
      OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES);
      if(OrderType()<=OP_SELL&&OrderSymbol()==Symbol()&&OrderMagicNumber()==MagicNumber)
      {
         if(OrderType()==OP_BUY)
         {
            if(TrailingStop>0&&NormalizeDouble(Ask-TrailingStep*point,digits)>NormalizeDouble(OrderOpenPrice()+TrailingProfit*point,digits))  
            {                 
               if((NormalizeDouble(OrderStopLoss(),digits)<NormalizeDouble(Bid-TrailingStop*point,digits))||(OrderStopLoss()==0))
               {
                  OrderModify(OrderTicket(),OrderOpenPrice(),NormalizeDouble(Bid-TrailingStop*point,digits),OrderTakeProfit(),0,Blue);
                }
            }
         }
         else 
         {
            if(TrailingStop>0&&NormalizeDouble(Bid+TrailingStep*point,digits)<NormalizeDouble(OrderOpenPrice()-TrailingProfit*point,digits))  
            {                 
               if((NormalizeDouble(OrderStopLoss(),digits)>(NormalizeDouble(Ask+TrailingStop*point,digits)))||(OrderStopLoss()==0))
               {
                  OrderModify(OrderTicket(),OrderOpenPrice(),NormalizeDouble(Ask+TrailingStop*point,digits),OrderTakeProfit(),0,Red);
               }
            }
         }
      }
   }
}
int DeletePendingOrders()
{
  int total  = OrdersTotal();
  
  for (int cnt = total-1 ; cnt >= 0 ; cnt--)
  {
    OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES);
    if (OrderMagicNumber() == MagicNumber && OrderSymbol()==Symbol() && (OrderType()>OP_SELL))
    {
      OrderDelete(OrderTicket());
    }
  }
  return(0);
}
 //+---------------------------------------------------------------------------------+
  
 bool CheckOpenedOrders(string comment){
  for(int i=0;i<OrdersTotal();i++){
   OrderSelect(i,SELECT_BY_POS,MODE_TRADES);
   string com=OrderComment();
   if(OrderSymbol()==Symbol()&&OrderMagicNumber()==MagicNumber){
    if(StringFind(comment,com,0)>=0)return(true);
   }
  }
 return(false);
}


void OpenClosedOrders()
 {
  double TP,SL;
 for(int i=OrdersHistoryTotal()-1;i>=0;i--){
  OrderSelect(i,SELECT_BY_POS,MODE_HISTORY);
  string comment=OrderComment();
  double open=OrderOpenPrice();
  double lott=OrderLots();
  double stop=OrderStopLoss();
  double profit=OrderTakeProfit();
  int type=OrderType();
  string new_comment[];
  ushort u_sep=StringGetCharacter("_",0);

  StringSplit(comment,u_sep,new_comment);
  if(OrderSymbol()==Symbol()&&OrderMagicNumber()==MagicNumber){
   if(CheckOpenedOrders(comment)==false){
   if((type==OP_BUY&&!ReverseClosedOrders)||(type==OP_SELL&&ReverseClosedOrders)){ 
   
   if(profit!=0)TP=open+MathAbs(open-profit);
   if(stop!=0)SL=open-MathAbs(open-stop);
   
    if(Ask>open+MarketInfo(Symbol(),MODE_STOPLEVEL)*Point){
     OrderSend(Symbol(),OP_BUYLIMIT,lott,open,3,SL,TP,new_comment[0]+"_",MagicNumber,0,Green);}
    
    if(Ask<open-MarketInfo(Symbol(),MODE_STOPLEVEL)*Point){
     OrderSend(Symbol(),OP_BUYSTOP,lott,open,3,SL,TP,new_comment[0]+"_",MagicNumber,0,Green);}
      Print("b  "+comment+"  "+new_comment[0]);
   }
   if((type==OP_SELL&&!ReverseClosedOrders)||(type==OP_BUY&&ReverseClosedOrders)){
   if(Bid>open+MarketInfo(Symbol(),MODE_STOPLEVEL)*Point){
   
   if(profit!=0)TP=open-MathAbs(open-profit);
   if(stop!=0)SL=open+MathAbs(open-stop);
     OrderSend(Symbol(),OP_SELLSTOP,lott,open,3,SL,TP,new_comment[0]+"_",MagicNumber,0,Green);}
    
    if(Bid<open-MarketInfo(Symbol(),MODE_STOPLEVEL)*Point){
     OrderSend(Symbol(),OP_SELLLIMIT,lott,open,3,SL,TP,new_comment[0]+"_",MagicNumber,0,Green);}
     Print(comment+"  "+new_comment[0]);
     }
    }
   }
  }
 }


double profit(){
 double c;
 for(int i=0;i<=OrdersTotal();i++){
  OrderSelect(i,SELECT_BY_POS,MODE_TRADES);
  if(OrderSymbol()==Symbol()){
   c+=OrderProfit();
  }
 }
 return(c);
}   
           