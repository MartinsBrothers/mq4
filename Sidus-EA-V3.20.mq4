#property description "Sidus-Crossover-EA v3.20 (2020)"
extern string comment="Sidus-EA"; // comment to display in the order
extern string s1="Money Management";
extern double lots=0.01;                  // lots size
extern bool lotsoptimized=false;  // enable risk management
extern double risk=1;             // risk in percentage of the account
extern bool martingale=false;     // enable the martingale
extern double multiplier=1.5;     // multiplier used for the martingale
extern double minlot=0.01;        // minimum lot allowed by the expert
extern double maxlot=0.04;        // maximum lot allowed by the expert
extern double lotdigits=2;        // 1 for minilot, 2 for microlot
extern bool basketpercent=false;  // enable the basket percent
extern double profit=10;          // close all orders if a profit of 10 percents has been reached
extern double loss=30;            // close all orders if a loss of 30 percents has been reached
extern string s2="Order Management";
extern bool oppositeclose=true;   // close the orders on an opposite signal
bool reversesignals=false;        // reverse the signals, long if short, short if long
extern int maxtrades=100;         // maximum trades allowed by the traders
extern int tradesperbar=1;        // maximum trades per bar allowed by the expert
extern int long_stoploss=80;      // long stop loss
extern int short_stoploss=80;     // short stop loss
extern int long_takeprofit=700;   // long take profit
int long_takeprofit2=0;           // long take profit 2
int long_takeprofit3=0;           // long take profit 3
int long_takeprofit4=0;           // long take profit 4
int long_takeprofit5=0;           // long take profit 5
extern int short_takeprofit=700;  // short take profit
int short_takeprofit2=0;          // short take profit 2
int short_takeprofit3=0;          // short take profit 3
int short_takeprofit4=0;          // short take profit 4
int short_takeprofit5=0;          // short take profit 5
extern int trailingstart=100;     // profit in pips required to enable the trailing stop
extern int trailingstop=50;       // trailing stop
extern int trailingstep=50;       // margin allowed to the market to enable the trailing stop
extern int breakevengain=0;       // gain in pips required to enable the break even
extern int breakeven=0;           // break even
int expiration=0;                 // expiration in minutes for pending orders
int slippage=0;                   // maximum difference in pips between signal and order
double maxspread=70;              // maximum spread allowed by the expert
bool open5orders=false;           // true=open five orders as per the rule with different sl and tp, false=open one order with buystop (sl) and buytarget (tp)
bool closeonbadconditions=false;  // true=close the orders if all conditions are not met anymore, false=don't close the orders if all conditions are not met anymore
bool closeonarrows=false;         // true=we exit on arrows
bool autostop=false;              // true=stoploss based on the sniper stopv2, false=stoploss not based on the sniper stop v2
int autostopmargin=0;             // margin to add to the autostop, positive value=value to add, negative value=value to withdraw
int minimumstop=300;              // minimum stop loss when autostop is enabled
int maximumstop=1000;             // maximum stop loss when autostop is enabled
bool notradeovermaxstop=false;    // true=don't trade if the distance between the price and the sniper stop v2 is higher thanmaximumstop, false=disregard this distance
bool trailonsniperstop=false;     // true=trailing stop based on the sniper stop v2, false=trailingstop not based on the sniper stop v2
bool onlycross=false;             // true=enter only as soon as the conditions are met, false=enter as longs as the conditions are met
bool usesniper=true;              // true=use sniper indicator for the signal, false=don't use this indicator for the signal
int SniperPeriod=30;              // period of the sniper indicator
int SniperType=3;                 // type of the sniper indicator
int arrow_shift=30;               // shift of the sniper indicator's arrow
int Alerts=1;                     // alerts of the sniper indicator
bool usestop=false;               // true=use the sniper stop v2 indicator for the signal, false=don't use this indicator for the signal
bool usetrenda=false;             // true=use the sniper trend a indicator for the signal, false=don't use this indicator for the signal
bool usetrendb=false;             // true=use the sniper trend b indicator for the signal, false=don't use this indicator for the signal
double Sniper=0.01;               // sniper value of the sniper trend b indicator
double SniperSS=0.1;              // sniperss value of the sniper trend b indicator
int SniperP=7;                    // sniperp value of the sniper trend b indicator
bool AlertsEnabled=false;         // true=enable the alerts of the sniper trend b indicator, false=disable the alerts
extern int shift=0;               // bar in the past to take in consideration for the signal
bool usefilter=false;             // enable a second sniper system on another timeframe to filter the signals
int timeframe=240;                // timeframe of the filter
bool onlycrosstf=false;           // true=enter only as soon as the conditions are met, false=enter as longs as the conditions are met
bool usesnipertf=true;            // true=use sniper indicator for this filter, false=don't use this indicator for the filter
int SniperPeriodtf=30;            // period of the sniper indicator
int SniperTypetf=3;               // type of the sniper indicator
int arrow_shifttf=30;             // shift of the sniper indicator's arrow
int Alertstf=1;                   // alerts of the sniper indicator
bool usestoptf=false;             // true=use the sniper stop v2 indicator for the filter, false=don't use this indicator for the filter
bool usetrendatf=false;           // true=use the sniper trend a indicator for the filter, false=don't use this indicator for the filter
bool usetrendbtf=false;           // true=use the sniper trend b indicator for the filter, false=don't use this indicator for the filter
double Snipertf=0.01;             // sniper value of the sniper trend b indicator
double SniperSStf=0.1;            // sniperss value of the sniper trend b indicator
int SniperPtf=7;                  // sniperp value of the sniper trend b indicator
bool AlertsEnabledtf=true;        // true=enable the alerts of the sniper trend b indicator, false=disable the alerts
bool samedirection=true;          // true=we continue to open orders if a new signal in the same direction than the previous appears, false=the EA will wait the opposite signal to enter new trades
bool minclosetime=false;          // true=we close the trade only after a certain time (mincloseminutes), false=disregard the time
int mincloseminutes=61;           // minimum time determined in minutes
//extern string s3="Indicator Settings";
//extern int FasterLWMA = 2;        // Faster LWMA
//extern int SlowerLWMA = 15;       // Slower LWMA
//extern int FasterSidusEMA = 18;   // Faster MA
//extern int SlowerSidusEMA = 25;   // Slower MA 
extern string s4="Time Filter";
extern int gmtshift=2;            // gmt offset of the broker
extern bool filter=false;         // enable time filter
extern int start=4;               // start to trade after this hour
extern int end=20;                // stop to trade after this hour
extern bool tradesunday=true;     // trade on sunday
extern bool fridayfilter=false;   // enable special time filter on friday
extern int fridayend=24;          // stop to trade after this hour
datetime t0,t1,lastbuyopentime,lastsellopentime;
double lastbuyopenprice,lastsellopenprice,lastbuyprofit,lastsellprofit,lastprofit;
double lotsfactor=1,initiallotsfactor=1,ilots,lastbuylot,lastselllot,lastlot,mlots;
double ask,bid,cb,sl,tp,min,max;
int i,bc=-1,tpb,tps,cnt,istart,iend,total,ticket;
int lastorder,buyorderprofit,sellorderprofit,history,iSignal,iTrend;
int MagicNumber;
int directioninstance=0;
double pt,mt;
int dg;
int init()
  {
   // Unique sting id.    
   string id = WindowExpertName() + Symbol() + Period();   
   // If there isn't already a Global Variable with the id in wich search for the MagicNumber create it  
   if(!GlobalVariableCheck(id))
   {
      MagicNumber = WindowHandle(Symbol(),0);   
      GlobalVariableSet(id,MagicNumber);
   }
   else // Just get the MagicNumber for the unique id
   {
      MagicNumber = GlobalVariableGet(id);
   t0=Time[0];
   t1=Time[0];
   dg=Digits;
   if(dg==3 || dg==5){pt=Point*10;mt=10;}else{pt=Point;mt=1;}
   return(0);
  }
}
int start(){

   GlobalVariableSet("vGrafBalance",AccountBalance());
   GlobalVariableSet("vGrafEquity",AccountEquity());

   RefreshRates();
   ask=MarketInfo(Symbol(),MODE_ASK);
   bid=MarketInfo(Symbol(),MODE_BID);

   if(breakevengain>0)movebreakeven(breakevengain,breakeven);
   if(trailingstop>0)movetrailingstop(trailingstart,trailingstop);
   if(trailonsniperstop){
      //double Price = iOpen(Symbol(), NULL,shift);
      double STBs=iCustom(Symbol(),0,"sidus-crossover_signal",0,shift);
      double STRs=iCustom(Symbol(),0,"sidus-crossover_signal",1,shift);
      for(i=0;i<OrdersTotal();i++){
         OrderSelect(i,SELECT_BY_POS,MODE_TRADES);
         if(OrderType()<=OP_SELL && OrderSymbol()==Symbol() && OrderMagicNumber()==MagicNumber){
            if(OrderType()==OP_BUY){
               if(((NormalizeDouble(OrderStopLoss(),dg)<NormalizeDouble(STBs,dg))||(OrderStopLoss()==0)) && STBs!=0 && STBs!=EMPTY_VALUE
               && NormalizeDouble((Ask-STBs)/pt,dg)>=MarketInfo(Symbol(),MODE_STOPLEVEL)){
                  OrderModify(OrderTicket(),OrderOpenPrice(),NormalizeDouble(STBs,dg),OrderTakeProfit(),0,Blue);
                  return(0);
               }
            }
            else{
               if(((NormalizeDouble(OrderStopLoss(),dg)>NormalizeDouble(STRs,dg))||(OrderStopLoss()==0)) && STRs!=0 && STRs!=EMPTY_VALUE
               && NormalizeDouble((STRs-Bid)/pt,dg)>=MarketInfo(Symbol(),MODE_STOPLEVEL)){                 
                  OrderModify(OrderTicket(),OrderOpenPrice(),NormalizeDouble(STRs,dg),OrderTakeProfit(),0,Red);
                  return(0);
               }
            }
         }
      }
   }
   if(basketpercent)closebasketpercent(profit,loss);

   lastbuylot=0;
   lastselllot=0;
   lastorder=0;

   history=OrdersHistoryTotal();
   if(history>0){
      for(i=0;i<history;i++){
         OrderSelect(i,SELECT_BY_POS,MODE_HISTORY);
         if(OrderSymbol()==Symbol() && OrderMagicNumber()==MagicNumber){
            lastprofit=OrderProfit();
            lastlot=OrderLots();
            if(OrderType()==OP_BUY){
               lastbuyprofit=OrderProfit();
               lastbuylot=OrderLots();
               lastorder=1;
            }
            if(OrderType()==OP_SELL){
               lastsellprofit=OrderProfit();
               lastselllot=OrderLots();
               lastorder=2;
            }
         }
      }
   }
   mlots=0;
   if(martingale && lastprofit<0)mlots=NormalizeDouble(lastlot*multiplier,lotdigits);else mlots=lots;

   total=OrdersTotal();
   if(total>0){
      for(i=0;i<total;i++){
         OrderSelect(i,SELECT_BY_POS,MODE_TRADES);
         if(OrderSymbol()==Symbol() && OrderMagicNumber()==MagicNumber && OrderCloseTime()==0){
            if(OrderType()==OP_BUY){
               lastbuyopentime=OrderOpenTime();
               lastbuyopenprice=OrderOpenPrice();
               buyorderprofit=OrderProfit();
            }
            if(OrderType()==OP_SELL){
               lastsellopentime=OrderOpenTime();
               lastsellopenprice=OrderOpenPrice();
               sellorderprofit=OrderProfit();
            }
         }
      }
   } 


   if(tradesperbar==1 && (((TimeCurrent()-lastbuyopentime)<Period()) || ((TimeCurrent()-lastsellopentime)<Period()))){tpb=1;tps=1;}
   if(bc!=Bars){tpb=0;tps=0;bc=Bars;}
   
   if(usesniper){
      double SNI0=iCustom(Symbol(),0,"sidus-crossover_signal",0,shift);
      double SNI1=iCustom(Symbol(),0,"sidus-crossover_signal",1,shift);
      
   }
   if(usestop || autostop){
      double STB=iCustom(Symbol(),0,"Sniper Stop_v2",0,shift);double STR=iCustom(Symbol(),0,"Sniper Stop_v2",1,shift);
      double STBa=iCustom(Symbol(),0,"Sniper Stop_v2",0,shift+1);double STRa=iCustom(Symbol(),0,"Sniper Stop_v2",1,shift+1);
   }
   if(usetrenda){
      double TAB=iCustom(Symbol(),0,"Sniper Trend A",0,shift);double TAR=iCustom(Symbol(),0,"Sniper Trend A",1,shift);
      double TABa=iCustom(Symbol(),0,"Sniper Trend A",0,shift+1);double TARa=iCustom(Symbol(),0,"Sniper Trend A",1,shift+1);
   }
   if(usetrendb){
      double TBB=iCustom(Symbol(),0,"Sniper Trend B",Sniper,SniperSS,SniperP,AlertsEnabled,1,shift);double TBR=iCustom(Symbol(),0,"Sniper Trend B",Sniper,SniperSS,SniperP,AlertsEnabled,0,shift);
      double TBBa=iCustom(Symbol(),0,"Sniper Trend B",Sniper,SniperSS,SniperP,AlertsEnabled,1,shift+1);double TBRa=iCustom(Symbol(),0,"Sniper Trend B",Sniper,SniperSS,SniperP,AlertsEnabled,0,shift+1);
   }

   double signal=0;
   double signala=0;
   
   if((usesniper==false || (usesniper && SNI0<350))
   && (usestop==false || (usestop && STB<350)) && (usetrenda==false || (usetrenda && TAB!=0)) && (usetrendb==false || (usetrendb && TBB!=0)))signal=1;
   if((usesniper==false || (usesniper && SNI1<350))
   && (usestop==false || (usestop && STR<350)) && (usetrenda==false || (usetrenda && TAR!=0)) && (usetrendb==false || (usetrendb && TBR!=0)))signal=2;
   
   if(usefilter){
      if(usesniper){
         double SNI0tf=iCustom(Symbol(),timeframe,"Sniper",SniperPeriodtf,SniperTypetf,arrow_shifttf,Alertstf,0,shift);
         double SNI2tf=iCustom(Symbol(),timeframe,"Sniper",SniperPeriodtf,SniperTypetf,arrow_shifttf,Alertstf,2,shift);
         double SNI4tf=iCustom(Symbol(),timeframe,"Sniper",SniperPeriodtf,SniperTypetf,arrow_shifttf,Alertstf,4,shift);
         double SNI1tf=iCustom(Symbol(),timeframe,"Sniper",SniperPeriodtf,SniperTypetf,arrow_shifttf,Alertstf,1,shift);
         double SNI3tf=iCustom(Symbol(),timeframe,"Sniper",SniperPeriodtf,SniperTypetf,arrow_shifttf,Alertstf,3,shift);
         double SNI5tf=iCustom(Symbol(),timeframe,"Sniper",SniperPeriodtf,SniperTypetf,arrow_shifttf,Alertstf,5,shift);
   
         double SNI0atf=iCustom(Symbol(),timeframe,"Sniper",SniperPeriodtf,SniperTypetf,arrow_shifttf,Alertstf,0,shift+1);
         double SNI2atf=iCustom(Symbol(),timeframe,"Sniper",SniperPeriodtf,SniperTypetf,arrow_shifttf,Alertstf,2,shift+1);
         double SNI4atf=iCustom(Symbol(),timeframe,"Sniper",SniperPeriodtf,SniperTypetf,arrow_shifttf,Alertstf,4,shift+1);
         double SNI1atf=iCustom(Symbol(),timeframe,"Sniper",SniperPeriodtf,SniperTypetf,arrow_shifttf,Alertstf,1,shift+1);
         double SNI3atf=iCustom(Symbol(),timeframe,"Sniper",SniperPeriodtf,SniperTypetf,arrow_shifttf,Alertstf,3,shift+1);
         double SNI5atf=iCustom(Symbol(),timeframe,"Sniper",SniperPeriodtf,SniperTypetf,arrow_shifttf,Alertstf,5,shift+1);
      }
      if(usestoptf){
         double STBtf=iCustom(Symbol(),timeframe,"Sniper Stop_v2",0,shift);double STRtf=iCustom(Symbol(),timeframe,"Sniper Stop_v2",1,shift);
         double STBatf=iCustom(Symbol(),timeframe,"Sniper Stop_v2",0,shift+1);double STRatf=iCustom(Symbol(),timeframe,"Sniper Stop_v2",1,shift+1);
      }
   
      if(usetrendatf){
         double TABtf=iCustom(Symbol(),timeframe,"Sniper Trend A",0,shift);double TARtf=iCustom(Symbol(),timeframe,"Sniper Trend A",1,shift);
         double TABatf=iCustom(Symbol(),timeframe,"Sniper Trend A",0,shift+1);double TARatf=iCustom(Symbol(),timeframe,"Sniper Trend A",1,shift+1);
      }
   
      if(usetrendbtf){
         double TBBtf=iCustom(Symbol(),timeframe,"Sniper Trend B",Snipertf,SniperSStf,SniperPtf,AlertsEnabledtf,1,shift);
         double TBRtf=iCustom(Symbol(),timeframe,"Sniper Trend B",Snipertf,SniperSStf,SniperPtf,AlertsEnabledtf,0,shift);
         double TBBatf=iCustom(Symbol(),timeframe,"Sniper Trend B",Snipertf,SniperSStf,SniperPtf,AlertsEnabledtf,1,shift+1);
         double TBRatf=iCustom(Symbol(),timeframe,"Sniper Trend B",Snipertf,SniperSStf,SniperPtf,AlertsEnabledtf,0,shift+1);
      }

      double signaltf=0;
      double signalatf=0;
   
      if((usesnipertf==false || (usesnipertf && SNI0tf<350 && SNI2tf<350 && SNI4tf<350 && SNI1tf>350 && SNI3tf>350 && SNI5tf>350))
      && (usestoptf==false || (usestoptf && STBtf<350)) && (usetrendatf==false || (usetrendatf && TABtf!=0)) && (usetrendbtf==false || (usetrendbtf && TBBtf!=0)))signaltf=1;
      if((usesnipertf==false || (usesnipertf && SNI1tf<350 && SNI3tf<350 && SNI5tf<350 && SNI0tf>350 && SNI2tf>350 && SNI4tf>350))
      && (usestoptf==false || (usestoptf && STRtf<350)) && (usetrendatf==false || (usetrendatf && TARtf!=0)) && (usetrendbtf==false || (usetrendbtf && TBRtf!=0)))signaltf=2;
      if((usesnipertf==false || (usesnipertf && SNI0atf<350 && SNI2atf<350 && SNI4atf<350 && SNI1atf>350 && SNI3atf>350 && SNI5atf>350))
      && (usestoptf==false || (usestoptf && STBatf<350)) && (usetrendatf==false || (usetrendatf && TABatf!=0)) && (usetrendbtf==false || (usetrendbtf && TBBatf!=0)))signalatf=1;
      if((usesnipertf==false || (usesnipertf && SNI1atf<350 && SNI3atf<350 && SNI5atf<350 && SNI0atf>350 && SNI2atf>350 && SNI4atf>350))
      && (usestoptf==false || (usestoptf && STRatf<350)) && (usetrendatf==false || (usetrendatf && TARatf!=0)) && (usetrendbtf==false || (usetrendbtf && TBRatf!=0)))signalatf=2;
   }
   
   if(autostop){
      long_stoploss=(ask-STB)/pt-autostopmargin;
      short_stoploss=(STR-bid)/pt+autostopmargin;
      if(long_stoploss<minimumstop)long_stoploss=minimumstop;if(long_stoploss>maximumstop)long_stoploss=maximumstop;
      if(short_stoploss<minimumstop)short_stoploss=minimumstop;if(short_stoploss>maximumstop)short_stoploss=maximumstop;
   }

   bool buy=false;
   bool sell=false;
   
   if(
   ((onlycross==false && signal==1) || (onlycross && signal==1 && signala!=1))
   && (samedirection || (samedirection==false && (directioninstance==0 || directioninstance==2)))
   ){if(reversesignals)sell=true;else buy=true;if(samedirection==false)directioninstance=1;}
   
   if(
   ((onlycross==false && signal==2) || (onlycross && signal==2 && signala!=2))
   && (samedirection || (samedirection==false && (directioninstance==0 || directioninstance==1)))
   ){if(reversesignals)buy=true;else sell=true;if(samedirection==false)directioninstance=2;}

   //Comment("\nhau = "+DoubleToStr(hau,4),"\nhad = "+DoubleToStr(had,4));

   if((oppositeclose && sell) || (closeonbadconditions && signal==0)
   || (closeonarrows ))closebuy();

   if((oppositeclose && buy) || (closeonbadconditions && signal==1)
   || (closeonarrows ))closesell();


   istart=start+(gmtshift);if(istart>23)istart=istart-24;
   iend=end+(gmtshift);if(iend>23)iend=iend-24;

   if((tradesunday==false && DayOfWeek()==0) || (filter && DayOfWeek()>0 && ((istart<=iend && !(Hour()>=(istart) && Hour()<=(iend)))
   || (istart>iend && !((Hour()>=(istart) && Hour()<=23) || (Hour()>=0 && Hour()<=(iend)))))) || (fridayfilter && DayOfWeek()==5 && !(Hour()<(fridayend+(gmtshift))))){return(0);}

   if((ask-bid)>maxspread*pt)return(0);
   if((count(OP_BUY)+count(OP_SELL))>=maxtrades)return(0);

   if(lotsoptimized && (martingale==false || (martingale && lastprofit>=0)))lots=NormalizeDouble((AccountBalance()/1000)*minlot*risk,lotdigits);

   int expire=0;
   if(expiration>0)expire=TimeCurrent()+(expiration*60)-5;

   if(buy && tpb<tradesperbar && (notradeovermaxstop==false || (notradeovermaxstop && long_stoploss<=maximumstop))){
      if(martingale)ilots=mlots;else ilots=lots;
      ticket=open(OP_BUY,ilots,ask,long_stoploss,long_takeprofit,expire,Blue);
      if(open5orders){
         ticket=open(OP_BUY,ilots,ask,long_stoploss,long_takeprofit2,expire,Blue);
         ticket=open(OP_BUY,ilots,ask,long_stoploss,long_takeprofit3,expire,Blue);
         ticket=open(OP_BUY,ilots,ask,long_stoploss,long_takeprofit4,expire,Blue);
         ticket=open(OP_BUY,ilots,ask,long_stoploss,long_takeprofit5,expire,Blue);
      }
      if(ticket<=0){Print("Error Occured : "+errordescription(GetLastError()));}else tpb++;
   }
   if(sell && tps<tradesperbar && (notradeovermaxstop==false || (notradeovermaxstop && short_stoploss<=maximumstop))){
      if(martingale)ilots=mlots;else ilots=lots;
      ticket=open(OP_SELL,ilots,bid,short_stoploss,short_takeprofit,expire,Red);
      if(open5orders){
         ticket=open(OP_SELL,ilots,bid,short_stoploss,short_takeprofit2,expire,Red);
         ticket=open(OP_SELL,ilots,bid,short_stoploss,short_takeprofit3,expire,Red);
         ticket=open(OP_SELL,ilots,bid,short_stoploss,short_takeprofit4,expire,Red);
         ticket=open(OP_SELL,ilots,bid,short_stoploss,short_takeprofit5,expire,Red);
      }
      if(ticket<=0){Print("Error Occured : "+errordescription(GetLastError()));}else tps++;
   }
   return(0);
}

//|---------open

int open(int type,double lots,double price,int stoploss,int takeprofit,int expire,color clr){
   //RefreshRates
   //ask=MarketInfo(Symbol(),MODE_ASK);
   //bid=MarketInfo(Symbol(),MODE_BID);
   int i=0;int tries=100;int error=0;int ticket=0;
   if(lots<minlot)lots=minlot;
   if(lots>maxlot)lots=maxlot;
   if(type==OP_BUY || type==OP_BUYSTOP || type==OP_BUYLIMIT){
      if(/*hidesl==false &&*/ stoploss>0){sl=price-stoploss*pt;}else{sl=0;}
      if(/*hidetp==false &&*/ takeprofit>0){tp=price+takeprofit*pt;}else{tp=0;}
   }
   if(type==OP_SELL || type==OP_SELLSTOP || type==OP_SELLLIMIT){
      if(/*hidesl==false &&*/ stoploss>0){sl=price+stoploss*pt;}else{sl=0;}
      if(/*hidetp==false &&*/ takeprofit>0){tp=price-takeprofit*pt;}else{tp=0;}
   }
   for(i=0;i<tries;i++){
      ticket=OrderSend(Symbol(),type,lots,price,slippage*mt,sl,tp,comment+". Magic: "+DoubleToStr(MagicNumber,0),MagicNumber,expire,clr);
      error=GetLastError();
      if(error==0/* NO_ERROR */)break;
      if(!(error==4/* SERVER_BUSY */ || error==137/* BROKER_BUSY */ || error==146/* TRADE_CONTEXT_BUSY */ || error==136/* OFF_QUOTES */))break;
      Sleep(1000);
   }
   if(type==OP_BUY && ticket>0){Print("Order opened : "+Symbol()+" Buy @ "+ask+" SL @ "+sl+" TP @"+tp+" ticket ="+ticket);}
   if(type==OP_SELL && ticket>0){Print("Order opened : "+Symbol()+" Sell @ "+bid+" SL @ "+sl+" TP @"+tp+" ticket ="+ticket);}
   return(ticket);
}

//|---------counter

int count(int type){
   cnt=0;
   if(OrdersTotal()>0){
      for(i=OrdersTotal();i>=0;i--){
         OrderSelect(i,SELECT_BY_POS,MODE_TRADES);
         if(OrderSymbol()==Symbol() && OrderType()==type && OrderMagicNumber()==MagicNumber)cnt++;
      }
      return(cnt);
   }
}

//|---------close

void closebuy(){
   if(OrdersTotal()>0){
      for(i=OrdersTotal();i>=0;i--){
         OrderSelect(i,SELECT_BY_POS,MODE_TRADES);
         if(OrderSymbol()==Symbol() && OrderMagicNumber()==MagicNumber && OrderType()==OP_BUY && (minclosetime==false || (minclosetime && TimeCurrent()-OrderOpenTime()>=mincloseminutes*60))){
            OrderClose(OrderTicket(),OrderLots(),bid,slippage*mt);
         }
      }
   }
}

void closesell(){
   if(OrdersTotal()>0){
      for(i=OrdersTotal();i>=0;i--){
         OrderSelect(i,SELECT_BY_POS,MODE_TRADES);
         if(OrderSymbol()==Symbol() && OrderMagicNumber()==MagicNumber && OrderType()==OP_SELL && (minclosetime==false || (minclosetime && TimeCurrent()-OrderOpenTime()>=mincloseminutes*60))){
            OrderClose(OrderTicket(),OrderLots(),ask,slippage*mt);
         }
      }
   }
}
//|---------breakeven

void movebreakeven(int breakevengain,int breakeven){
   RefreshRates();
   ask=MarketInfo(Symbol(),MODE_ASK);
   bid=MarketInfo(Symbol(),MODE_BID);
   if(OrdersTotal()>0){
      for(i=OrdersTotal();i>=0;i--){
         OrderSelect(i,SELECT_BY_POS,MODE_TRADES);
         if(OrderType()<=OP_SELL && OrderSymbol()==Symbol() && OrderMagicNumber()==MagicNumber){
            if(OrderType()==OP_BUY){
               if(NormalizeDouble((bid-OrderOpenPrice()),dg)>=NormalizeDouble(breakevengain*pt,dg)){
                  if((NormalizeDouble((OrderStopLoss()-OrderOpenPrice()),dg)<NormalizeDouble(breakeven*pt,dg))||OrderStopLoss()==0){
                     OrderModify(OrderTicket(),OrderOpenPrice(),NormalizeDouble(OrderOpenPrice()+breakeven*pt,dg),OrderTakeProfit(),0,Blue);
                     return(0);
                  }
               }
            }
            else{
               if(NormalizeDouble((OrderOpenPrice()-ask),dg)>=NormalizeDouble(breakevengain*pt,dg)){
                  if((NormalizeDouble((OrderOpenPrice()-OrderStopLoss()),dg)<NormalizeDouble(breakeven*pt,dg))||OrderStopLoss()==0){
                     OrderModify(OrderTicket(),OrderOpenPrice(),NormalizeDouble(OrderOpenPrice()-breakeven*pt,dg),OrderTakeProfit(),0,Red);
                     return(0);
                  }
               }
            }
         }
      }
   }
}

//|---------trailingstop

void movetrailingstop(int trailingstart,int trailingstop){
   RefreshRates();
   ask=MarketInfo(Symbol(),MODE_ASK);
   bid=MarketInfo(Symbol(),MODE_BID);
   if(OrdersTotal()>0){
      for(i=OrdersTotal();i>=0;i--){
         OrderSelect(i,SELECT_BY_POS,MODE_TRADES);
         if(OrderType()<=OP_SELL && OrderSymbol()==Symbol() && OrderMagicNumber()==MagicNumber){
            if(OrderType()==OP_BUY){
               if(NormalizeDouble(ask,dg)>NormalizeDouble(OrderOpenPrice()+trailingstart*pt,dg)
               && (NormalizeDouble(OrderStopLoss(),dg)<NormalizeDouble(bid-(trailingstop+trailingstep)*pt,dg))||(OrderStopLoss()==0)){
                  OrderModify(OrderTicket(),OrderOpenPrice(),NormalizeDouble(bid-trailingstop*pt,dg),OrderTakeProfit(),0,Blue);
                  return(0);
               }
            }
            else{
               if(NormalizeDouble(bid,dg)<NormalizeDouble(OrderOpenPrice()-trailingstart*pt,dg)
               && (NormalizeDouble(OrderStopLoss(),dg)>(NormalizeDouble(ask+(trailingstop+trailingstep)*pt,dg)))||(OrderStopLoss()==0)){                 
                  OrderModify(OrderTicket(),OrderOpenPrice(),NormalizeDouble(ask+trailingstop*pt,dg),OrderTakeProfit(),0,Red);
                  return(0);
               }
            }
         }
      }
   }
}

//|---------basket

void closebasketpercent(double profit,double loss){
   double ipf=profit*(0.01*AccountBalance());
   double ilo=loss*(0.01*AccountBalance());
   cb=AccountEquity()-AccountBalance();
   if(cb>=ipf||cb<=(ilo*(-1))){
      closebuy();
      closesell();
      //delete(OP_BUYSTOP);
      //delete(OP_SELLSTOP);
      //delete(OP_BUYLIMIT);
      //delete(OP_SELLLIMIT);
      return(0);
   }
}

//|---------error

string errordescription(int code){
   string error;
   switch(code){
      case 0:
      case 1:error="no error";break;
      case 2:error="common error";break;
      case 3:error="invalid trade parameters";break;
      case 4:error="trade server is busy";break;
      case 5:error="old version of the client terminal";break;
      case 6:error="no connection with trade server";break;
      case 7:error="not enough rights";break;
      case 8:error="too frequent requests";break;
      case 9:error="malfunctional trade operation";break;
      case 64:error="account disabled";break;
      case 65:error="invalid account";break;
      case 128:error="trade timeout";break;
      case 129:error="invalid price";break;
      case 130:error="invalid stops";break;
      case 131:error="invalid trade volume";break;
      case 132:error="market is closed";break;
      case 133:error="trade is disabled";break;
      case 134:error="not enough money";break;
      case 135:error="price changed";break;
      case 136:error="off quotes";break;
      case 137:error="broker is busy";break;
      case 138:error="requote";break;
      case 139:error="order is locked";break;
      case 140:error="long positions only allowed";break;
      case 141:error="too many requests";break;
      case 145:error="modification denied because order too close to market";break;
      case 146:error="trade context is busy";break;
      case 4000:error="no error";break;
      case 4001:error="wrong function pointer";break;
      case 4002:error="array index is out of range";break;
      case 4003:error="no memory for function call stack";break;
      case 4004:error="recursive stack overflow";break;
      case 4005:error="not enough stack for parameter";break;
      case 4006:error="no memory for parameter string";break;
      case 4007:error="no memory for temp string";break;
      case 4008:error="not initialized string";break;
      case 4009:error="not initialized string in array";break;
      case 4010:error="no memory for array\' string";break;
      case 4011:error="too long string";break;
      case 4012:error="remainder from zero divide";break;
      case 4013:error="zero divide";break;
      case 4014:error="unknown command";break;
      case 4015:error="wrong jump (never generated error)";break;
      case 4016:error="not initialized array";break;
      case 4017:error="dll calls are not allowed";break;
      case 4018:error="cannot load library";break;
      case 4019:error="cannot call function";break;
      case 4020:error="expert function calls are not allowed";break;
      case 4021:error="not enough memory for temp string returned from function";break;
      case 4022:error="system is busy (never generated error)";break;
      case 4050:error="invalid function parameters count";break;
      case 4051:error="invalid function parameter value";break;
      case 4052:error="string function internal error";break;
      case 4053:error="some array error";break;
      case 4054:error="incorrect series array using";break;
      case 4055:error="custom indicator error";break;
      case 4056:error="arrays are incompatible";break;
      case 4057:error="global variables processing error";break;
      case 4058:error="global variable not found";break;
      case 4059:error="function is not allowed in testing mode";break;
      case 4060:error="function is not confirmed";break;
      case 4061:error="send mail error";break;
      case 4062:error="string parameter expected";break;
      case 4063:error="integer parameter expected";break;
      case 4064:error="double parameter expected";break;
      case 4065:error="array as parameter expected";break;
      case 4066:error="requested history data in update state";break;
      case 4099:error="end of file";break;
      case 4100:error="some file error";break;
      case 4101:error="wrong file name";break;
      case 4102:error="too many opened files";break;
      case 4103:error="cannot open file";break;
      case 4104:error="incompatible access to a file";break;
      case 4105:error="no order selected";break;
      case 4106:error="unknown symbol";break;
      case 4107:error="invalid price parameter for trade function";break;
      case 4108:error="invalid ticket";break;
      case 4109:error="trade is not allowed";break;
      case 4110:error="longs are not allowed";break;
      case 4111:error="shorts are not allowed";break;
      case 4200:error="object is already exist";break;
      case 4201:error="unknown object property";break;
      case 4202:error="object is not exist";break;
      case 4203:error="unknown object type";break;
      case 4204:error="no object name";break;
      case 4205:error="object coordinates error";break;
      case 4206:error="no specified subwindow";break;
      default:error="unknown error";
   }
   return(error);
}

