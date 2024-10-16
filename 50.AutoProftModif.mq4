//+------------------------------------------------------------------+
//|                                            50.AutoProftModif.mq4 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+

double YYg_maxLotRobo3_80 = 0.0;
string Ygs_88 = "AP_v.3.0";
double YYgd_96 = 2.0;
string Ygs_104 = "AutoP_v.3.0";

extern int MMTypeRobo3 = 1;
bool YYgi_128 = TRUE;
extern double LotRobo3MultiplicadorRobo3 = 1.667;
double YYgd_148;
double YYg_slippage_156 = 5.0;
extern bool YLotRobo3Const_or_not = FALSE;
extern double LotRobo3 = 0.01;
extern double RiskPercentRobo3 = 30.0;
double YYgd_200;

extern double TakeProfitRobo3 = 5.0;
double YYgd_224;
double Yg_pips_232 = 0.0;
double Ygd_240 = 10.0;
double Ygd_248 = 10.0;
extern double StepRobo3 = 5.0;
double Ygd_272;
extern int MaxTradesRobo3 = 30;
extern bool UseEquityStopRobo3 = FALSE;
extern double TotalEquityRiskRobo3 = 20.0;
bool Ygi_312 = FALSE;
bool Ygi_316 = FALSE;
bool Ygi_320 = FALSE;
double Ygd_324 = 48.0;
bool Ygi_332 = FALSE;
int Ygi_336 = 2;
int Ygi_340 = 16;
extern int Magic = 1111111;
int Ygi_356;
extern bool ShowTableOnTesting = TRUE;
double Yg_price_380;
double Ygd_388;
double Ygd_unused_396;
double Ygd_unused_404;
double Yg_price_412;
double Yg_bid_420;
double Yg_ask_428;
double Ygd_436;
double Ygd_444;
double Ygd_452;
bool Ygi_460;
int Yg_time_464 = 0;
int Ygi_468;
int Ygi_472 = 0;
double Ygd_476;
int Yg_pos_484 = 0;
int Ygi_488;
double Ygd_492 = 0.0;
bool Ygi_500 = FALSE;
bool Ygi_504 = FALSE;
bool Ygi_508 = FALSE;
int Ygi_512;
bool Ygi_516 = FALSE;
int Yg_datetime_520 = 0;
int Yg_datetime_524 = 0;
double Ygd_528;
double Ygd_536;
int Yg_fontsize_544 = 14;
int Yg_color_548 = Gold;
int Yg_color_552 = Orange;
int Yg_color_556 = Gray;
int Ygi_unused_560 = 5197615;

int init()
{
    Ygd_452 = MarketInfo(Symbol(), MODE_SPREAD) * Point;
    if (IsTesting() == TRUE) Yf0_9();
    if (IsTesting() == FALSE) Yf0_9();
    return (0);
}

int deinit()
{
    return (0);
}

int start()
{
    double order_LotRobo3s_52;
    double order_LotRobo3s_60;
    double iclose_68;
    double iclose_76;
    int li_unused_0 = MarketInfo(Symbol(), MODE_STOPLEVEL);
    int li_unused_4 = MarketInfo(Symbol(), MODE_SPREAD);
    double point_8 = MarketInfo(Symbol(), MODE_POINT);
    double bid_16 = MarketInfo(Symbol(), MODE_BID);
    double ask_24 = MarketInfo(Symbol(), MODE_ASK);
    int li_unused_32 = MarketInfo(Symbol(), MODE_DIGITS);
    if (YYg_maxLotRobo3_80 == 0.0) YYg_maxLotRobo3_80 = MarketInfo(Symbol(), MODE_MAXLOT);
    double minLotRobo3_36 = MarketInfo(Symbol(), MODE_MINLOT);
    double LotRobo3StepRobo3_44 = MarketInfo(Symbol(), MODE_LOTSTEP);
    /* if (AccountNumber() != Yg_acc_number_76 && (!IsDemo())) {
        Comment("Ñîâåòíèê ìîæåò ðàáîòàòü òîëüêî íà ñ÷¸òå " + Yg_acc_number_76 + ", äëÿ áåñïëàòíîãî ïîäêëþ÷åíèÿ ê äðóãîìó ñ÷¸òó ïåðåéäèòå íà ñàéò invest-system.net");
        Sleep(1000);
        Print("Ñîâåòíèê ìîæåò ðàáîòàòü òîëüêî íà ñ÷¸òå " + Yg_acc_number_76 + ", äëÿ ïîäêëþ÷åíèÿ ê äðóãîìó ñ÷¸òó ïðîèäèòå íà ñàéò invest-system.net");
        return;
     }*/
    if (((!IsOptimization()) && !IsTesting() && (!IsVisualMode())) || (ShowTableOnTesting && IsTesting() && (!IsOptimization())))
    {
        YYf0_13();
        YYf0_10();
    }
    if (YLotRobo3Const_or_not) YYgd_200 = LotRobo3;
    else YYgd_200 = AccountBalance() * RiskPercentRobo3 / 100.0 / 10000.0;
    if (YYgd_200 < minLotRobo3_36) Print("Ðàñ÷åòíûé ëîò  " + YYgd_200 + "  ìåíüøå ìèíèìàëüíî äîïóñòèìîãî äëÿ òîðãîâëè  " + minLotRobo3_36);
    if (YYgd_200 > YYg_maxLotRobo3_80 && YYg_maxLotRobo3_80 > 0.0) Print("Ðàñ÷åòíûé ëîò  " + YYgd_200 + "  áîëüøå ìàêñèìàëüíî äîïóñòèìîãî äëÿ òîðãîâëè  " + YYg_maxLotRobo3_80);
    YYgd_148 = LotRobo3MultiplicadorRobo3;
    YYgd_224 = TakeProfitRobo3;
    Ygd_272 = StepRobo3;
    Ygi_356 = Magic;
    string ls_84 = "false";
    string ls_92 = "false";
    if (Ygi_332 == FALSE || (Ygi_332 && (Ygi_340 > Ygi_336 && (Hour() >= Ygi_336 && Hour() <= Ygi_340)) || (Ygi_336 > Ygi_340 && (!(Hour() >= Ygi_340 && Hour() <= Ygi_336))))) ls_84 = "true";
    if (Ygi_332 && (Ygi_340 > Ygi_336 && (!(Hour() >= Ygi_336 && Hour() <= Ygi_340))) || (Ygi_336 > Ygi_340 && (Hour() >= Ygi_340 && Hour() <= Ygi_336))) ls_92 = "true";
    if (Ygi_316) YYf0_18(Ygd_240, Ygd_248, Yg_price_412);
    if (Ygi_320)
    {
        if (TimeCurrent() >= Ygi_468)
        {
            Yf0_3();
            Print("Closed All due to TimeOut");
        }
    }
    if (Yg_time_464 == Time[0]) return (0);
    Yg_time_464 = Time[0];
    double ld_100 = Yf0_5();
    if (UseEquityStopRobo3)
    {
        if (ld_100 < 0.0 && MathAbs(ld_100) > TotalEquityRiskRobo3 / 100.0 * Yf0_7())
        {
            Yf0_3();
            Print("Closed All due to Stop Out");
            Ygi_516 = FALSE;
        }
    }
    Ygi_488 = YYf0_16();
    if (Ygi_488 == 0) Ygi_460 = FALSE;
    for (Yg_pos_484 = OrdersTotal() - 1; Yg_pos_484 >= 0; Yg_pos_484--)
    {
        OrderSelect(Yg_pos_484, SELECT_BY_POS, MODE_TRADES);
        if (OrderSymbol() != Symbol() || OrderMagicNumber() != Ygi_356) continue;
        if (OrderSymbol() == Symbol() && OrderMagicNumber() == Ygi_356)
        {
            if (OrderType() == OP_BUY)
            {
                Ygi_504 = TRUE;
                Ygi_508 = FALSE;
                order_LotRobo3s_52 = OrderLots();
                break;
            }
        }
        if (OrderSymbol() == Symbol() && OrderMagicNumber() == Ygi_356)
        {
            if (OrderType() == OP_SELL)
            {
                Ygi_504 = FALSE;
                Ygi_508 = TRUE;
                order_LotRobo3s_60 = OrderLots();
                break;
            }
        }
    }
    if (Ygi_488 > 0 && Ygi_488 <= MaxTradesRobo3)
    {
        RefreshRates();
        Ygd_436 = Yf0_2();
        Ygd_444 = Yf0_6();
        if (Ygi_504 && Ygd_436 - Ask >= Ygd_272 * Point) Ygi_500 = TRUE;
        if (Ygi_508 && Bid - Ygd_444 >= Ygd_272 * Point) Ygi_500 = TRUE;
    }
    if (Ygi_488 < 1)
    {
        Ygi_508 = FALSE;
        Ygi_504 = FALSE;
        Ygi_500 = TRUE;
        Ygd_388 = AccountEquity();
    }
    if (Ygi_500)
    {
        Ygd_436 = Yf0_2();
        Ygd_444 = Yf0_6();
        if (Ygi_508)
        {
            if (Ygi_312 || ls_92 == "true")
            {
                Yf0_1(0, 1);
                Ygd_476 = NormalizeDouble(YYgd_148 * order_LotRobo3s_60, YYgd_96);
            }
            else Ygd_476 = YYf0_14(OP_SELL);
            if (YYgi_128 && ls_84 == "true")
            {
                Ygi_472 = Ygi_488;
                if (Ygd_476 > 0.0)
                {
                    RefreshRates();
                    Ygi_512 = YYf0_15(1, Ygd_476, Bid, YYg_slippage_156, Ask, 0, 0, Symbol() + "-" + Ygs_88 + "-" + Ygi_472, Ygi_356, 0, HotPink);
                    if (Ygi_512 < 0)
                    {
                        Print("Error: ", GetLastError());
                        return (0);
                    }
                    Ygd_444 = Yf0_6();
                    Ygi_500 = FALSE;
                    Ygi_516 = TRUE;
                }
            }
        }
        else
        {
            if (Ygi_504)
            {
                if (Ygi_312 || ls_92 == "true")
                {
                    Yf0_1(1, 0);
                    Ygd_476 = NormalizeDouble(YYgd_148 * order_LotRobo3s_52, YYgd_96);
                }
                else Ygd_476 = YYf0_14(OP_BUY);
                if (YYgi_128 && ls_84 == "true")
                {
                    Ygi_472 = Ygi_488;
                    if (Ygd_476 > 0.0)
                    {
                        Ygi_512 = YYf0_15(0, Ygd_476, Ask, YYg_slippage_156, Bid, 0, 0, Symbol() + "-" + Ygs_88 + "-" + Ygi_472, Ygi_356, 0, Lime);
                        if (Ygi_512 < 0)
                        {
                            Print("Error: ", GetLastError());
                            return (0);
                        }
                        Ygd_436 = Yf0_2();
                        Ygi_500 = FALSE;
                        Ygi_516 = TRUE;
                    }
                }
            }
        }
    }
    if (Ygi_500 && Ygi_488 < 1)
    {
        iclose_68 = iClose(Symbol(), 0, 2);
        iclose_76 = iClose(Symbol(), 0, 1);
        Yg_bid_420 = Bid;
        Yg_ask_428 = Ask;
        if ((!Ygi_508) && !Ygi_504 && ls_84 == "true")
        {
            Ygi_472 = Ygi_488;
            if (iclose_68 > iclose_76)
            {
                Ygd_476 = YYf0_14(OP_SELL);
                if (Ygd_476 > 0.0)
                {
                    Ygi_512 = YYf0_15(1, Ygd_476, Yg_bid_420, YYg_slippage_156, Yg_bid_420, 0, 0, Symbol() + "-" + Ygs_88 + "-" + Ygi_472, Ygi_356, 0, HotPink);
                    if (Ygi_512 < 0)
                    {
                        Print(Ygd_476, "Error: ", GetLastError());
                        return (0);
                    }
                    Ygd_436 = Yf0_2();
                    Ygi_516 = TRUE;
                }
            }
            else
            {
                Ygd_476 = YYf0_14(OP_BUY);
                if (Ygd_476 > 0.0)
                {
                    Ygi_512 = YYf0_15(0, Ygd_476, Yg_ask_428, YYg_slippage_156, Yg_ask_428, 0, 0, Symbol() + "-" + Ygs_88 + "-" + Ygi_472, Ygi_356, 0, Lime);
                    if (Ygi_512 < 0)
                    {
                        Print(Ygd_476, "Error: ", GetLastError());
                        return (0);
                    }
                    Ygd_444 = Yf0_6();
                    Ygi_516 = TRUE;
                }
            }
        }
        if (Ygi_512 > 0) Ygi_468 = TimeCurrent() + 60.0 * (60.0 * Ygd_324);
        Ygi_500 = FALSE;
    }
    Ygi_488 = YYf0_16();
    Yg_price_412 = 0;
    double ld_108 = 0;
    for (Yg_pos_484 = OrdersTotal() - 1; Yg_pos_484 >= 0; Yg_pos_484--)
    {
        OrderSelect(Yg_pos_484, SELECT_BY_POS, MODE_TRADES);
        if (OrderSymbol() != Symbol() || OrderMagicNumber() != Ygi_356) continue;
        if (OrderSymbol() == Symbol() && OrderMagicNumber() == Ygi_356)
        {
            if (OrderType() == OP_BUY || OrderType() == OP_SELL)
            {
                Yg_price_412 += OrderOpenPrice() * OrderLots();
                ld_108 += OrderLots();
            }
        }
    }
    if (Ygi_488 > 0) Yg_price_412 = NormalizeDouble(Yg_price_412 / ld_108, Digits);
    if (Ygi_516)
    {
        for (Yg_pos_484 = OrdersTotal() - 1; Yg_pos_484 >= 0; Yg_pos_484--)
        {
            OrderSelect(Yg_pos_484, SELECT_BY_POS, MODE_TRADES);
            if (OrderSymbol() != Symbol() || OrderMagicNumber() != Ygi_356) continue;
            if (OrderSymbol() == Symbol() && OrderMagicNumber() == Ygi_356)
            {
                if (OrderType() == OP_BUY)
                {
                    Yg_price_380 = Yg_price_412 + YYgd_224 * Point;
                    Ygd_unused_396 = Yg_price_380;
                    Ygd_492 = Yg_price_412 - Yg_pips_232 * Point;
                    Ygi_460 = TRUE;
                }
            }
            if (OrderSymbol() == Symbol() && OrderMagicNumber() == Ygi_356)
            {
                if (OrderType() == OP_SELL)
                {
                    Yg_price_380 = Yg_price_412 - YYgd_224 * Point;
                    Ygd_unused_404 = Yg_price_380;
                    Ygd_492 = Yg_price_412 + Yg_pips_232 * Point;
                    Ygi_460 = TRUE;
                }
            }
        }
    }
    if (Ygi_516)
    {
        if (Ygi_460 == TRUE)
        {
            for (Yg_pos_484 = OrdersTotal() - 1; Yg_pos_484 >= 0; Yg_pos_484--)
            {
                OrderSelect(Yg_pos_484, SELECT_BY_POS, MODE_TRADES);
                if (OrderSymbol() != Symbol() || OrderMagicNumber() != Ygi_356) continue;
                if (OrderSymbol() == Symbol() && OrderMagicNumber() == Ygi_356) OrderModify(OrderTicket(), Yg_price_412, OrderStopLoss(), Yg_price_380, 0, Yellow);
                Ygi_516 = FALSE;
            }
        }
    }
    return (0);
}

double Yf0_11(double ad_0)
{
    return (NormalizeDouble(ad_0, Digits));
}

int Yf0_1(bool ai_0 = TRUE, bool ai_4 = TRUE)
{
    int li_ret_8 = 0;
    for (int pos_12 = OrdersTotal() - 1; pos_12 >= 0; pos_12--)
    {
        if (OrderSelect(pos_12, SELECT_BY_POS, MODE_TRADES))
        {
            if (OrderSymbol() == Symbol() && OrderMagicNumber() == Ygi_356)
            {
                if (OrderType() == OP_BUY && ai_0)
                {
                    RefreshRates();
                    if (!IsTradeContextBusy())
                    {
                        if (!OrderClose(OrderTicket(), OrderLots(), Yf0_11(Bid), 5, CLR_NONE))
                        {
                            Print("Error close BUY " + OrderTicket());
                            li_ret_8 = -1;
                        }
                    }
                    else
                    {
                        if (Yg_datetime_520 == iTime(NULL, 0, 0)) return (-2);
                        Yg_datetime_520 = iTime(NULL, 0, 0);
                        Print("Need close BUY " + OrderTicket() + ". Trade Context Busy");
                        return (-2);
                    }
                }
                if (OrderType() == OP_SELL && ai_4)
                {
                    RefreshRates();
                    if (!IsTradeContextBusy())
                    {
                        if (!(!OrderClose(OrderTicket(), OrderLots(), Yf0_11(Ask), 5, CLR_NONE))) continue;
                        Print("Error close SELL " + OrderTicket());
                        li_ret_8 = -1;
                        continue;
                    }
                    if (Yg_datetime_524 == iTime(NULL, 0, 0)) return (-2);
                    Yg_datetime_524 = iTime(NULL, 0, 0);
                    Print("Need close SELL " + OrderTicket() + ". Trade Context Busy");
                    return (-2);
                }
            }
        }
    }
    return (li_ret_8);
}

double YYf0_14(int a_cmd_0)
{
    double ld_ret_4;
    int datetime_12;
    switch (MMTypeRobo3)
    {
        case 0:
            ld_ret_4 = YYgd_200;
            break;
        case 1:
            ld_ret_4 = NormalizeDouble(YYgd_200 * MathPow(YYgd_148, Ygi_472), YYgd_96);
            break;
        case 2:
            datetime_12 = 0;
            ld_ret_4 = YYgd_200;
            for (int pos_20 = OrdersHistoryTotal() - 1; pos_20 >= 0; pos_20--)
            {
                if (!(OrderSelect(pos_20, SELECT_BY_POS, MODE_HISTORY))) return (-3);
                if (OrderSymbol() == Symbol() && OrderMagicNumber() == Ygi_356)
                {
                    if (datetime_12 < OrderCloseTime())
                    {
                        datetime_12 = OrderCloseTime();
                        if (OrderProfit() < 0.0)
                        {
                            ld_ret_4 = NormalizeDouble(OrderLots() * YYgd_148, YYgd_96);
                            continue;
                        }
                        ld_ret_4 = YYgd_200;
                        continue;
                        return (-3);
                    }
                }
            }
    }
    if (AccountFreeMarginCheck(Symbol(), a_cmd_0, ld_ret_4) <= 0.0) return (-1);
    if (GetLastError() == 134/* NOT_ENOUGH_MONEY */) return (-2);
    return (ld_ret_4);
}

int YYf0_16()
{
    int count_0 = 0;
    for (int pos_4 = OrdersTotal() - 1; pos_4 >= 0; pos_4--)
    {
        OrderSelect(pos_4, SELECT_BY_POS, MODE_TRADES);
        if (OrderSymbol() != Symbol() || OrderMagicNumber() != Ygi_356) continue;
        if (OrderSymbol() == Symbol() && OrderMagicNumber() == Ygi_356)
            if (OrderType() == OP_SELL || OrderType() == OP_BUY) count_0++;
    }
    return (count_0);
}

void Yf0_3()
{
    for (int pos_0 = OrdersTotal() - 1; pos_0 >= 0; pos_0--)
    {
        OrderSelect(pos_0, SELECT_BY_POS, MODE_TRADES);
        if (OrderSymbol() == Symbol())
        {
            if (OrderSymbol() == Symbol() && OrderMagicNumber() == Ygi_356)
            {
                if (OrderType() == OP_BUY) OrderClose(OrderTicket(), OrderLots(), Bid, YYg_slippage_156, Blue);
                if (OrderType() == OP_SELL) OrderClose(OrderTicket(), OrderLots(), Ask, YYg_slippage_156, Red);
            }
            Sleep(1000);
        }
    }
}

int YYf0_15(int ai_0, double a_LotRobo3s_4, double a_price_12, int a_slippage_20, double ad_24, int ai_unused_32, int ai_36, string a_comment_40, int a_magic_48, int a_datetime_52, color a_color_56)
{
    int ticket_60 = 0;
    int error_64 = 0;
    int count_68 = 0;
    int li_72 = 100;
    switch (ai_0)
    {
        case 2:
            for (count_68 = 0; count_68 < li_72; count_68++)
            {
                ticket_60 = OrderSend(Symbol(), OP_BUYLIMIT, a_LotRobo3s_4, a_price_12, a_slippage_20, YYf0_12(ad_24, Yg_pips_232), YYf0_17(a_price_12, ai_36), a_comment_40, a_magic_48, a_datetime_52,
                   a_color_56);
                error_64 = GetLastError();
                if (error_64 == 0/* NO_ERROR */) break;
                if (!((error_64 == 4/* SERVER_BUSY */ || error_64 == 137/* BROKER_BUSY */ || error_64 == 146/* TRADE_CONTEXT_BUSY */ || error_64 == 136/* OFF_QUOTES */))) break;
                Sleep(1000);
            }
            break;
        case 4:
            for (count_68 = 0; count_68 < li_72; count_68++)
            {
                ticket_60 = OrderSend(Symbol(), OP_BUYSTOP, a_LotRobo3s_4, a_price_12, a_slippage_20, YYf0_12(ad_24, Yg_pips_232), YYf0_17(a_price_12, ai_36), a_comment_40, a_magic_48, a_datetime_52,
                   a_color_56);
                error_64 = GetLastError();
                if (error_64 == 0/* NO_ERROR */) break;
                if (!((error_64 == 4/* SERVER_BUSY */ || error_64 == 137/* BROKER_BUSY */ || error_64 == 146/* TRADE_CONTEXT_BUSY */ || error_64 == 136/* OFF_QUOTES */))) break;
                Sleep(5000);
            }
            break;
        case 0:
            for (count_68 = 0; count_68 < li_72; count_68++)
            {
                RefreshRates();
                ticket_60 = OrderSend(Symbol(), OP_BUY, a_LotRobo3s_4, Ask, a_slippage_20, YYf0_12(Bid, Yg_pips_232), YYf0_17(Ask, ai_36), a_comment_40, a_magic_48, a_datetime_52, a_color_56);
                error_64 = GetLastError();
                if (error_64 == 0/* NO_ERROR */) break;
                if (!((error_64 == 4/* SERVER_BUSY */ || error_64 == 137/* BROKER_BUSY */ || error_64 == 146/* TRADE_CONTEXT_BUSY */ || error_64 == 136/* OFF_QUOTES */))) break;
                Sleep(5000);
            }
            break;
        case 3:
            for (count_68 = 0; count_68 < li_72; count_68++)
            {
                ticket_60 = OrderSend(Symbol(), OP_SELLLIMIT, a_LotRobo3s_4, a_price_12, a_slippage_20, Yf0_0(ad_24, Yg_pips_232), Yf0_4(a_price_12, ai_36), a_comment_40, a_magic_48, a_datetime_52,
                   a_color_56);
                error_64 = GetLastError();
                if (error_64 == 0/* NO_ERROR */) break;
                if (!((error_64 == 4/* SERVER_BUSY */ || error_64 == 137/* BROKER_BUSY */ || error_64 == 146/* TRADE_CONTEXT_BUSY */ || error_64 == 136/* OFF_QUOTES */))) break;
                Sleep(5000);
            }
            break;
        case 5:
            for (count_68 = 0; count_68 < li_72; count_68++)
            {
                ticket_60 = OrderSend(Symbol(), OP_SELLSTOP, a_LotRobo3s_4, a_price_12, a_slippage_20, Yf0_0(ad_24, Yg_pips_232), Yf0_4(a_price_12, ai_36), a_comment_40, a_magic_48, a_datetime_52,
                   a_color_56);
                error_64 = GetLastError();
                if (error_64 == 0/* NO_ERROR */) break;
                if (!((error_64 == 4/* SERVER_BUSY */ || error_64 == 137/* BROKER_BUSY */ || error_64 == 146/* TRADE_CONTEXT_BUSY */ || error_64 == 136/* OFF_QUOTES */))) break;
                Sleep(5000);
            }
            break;
        case 1:
            for (count_68 = 0; count_68 < li_72; count_68++)
            {
                ticket_60 = OrderSend(Symbol(), OP_SELL, a_LotRobo3s_4, Bid, a_slippage_20, Yf0_0(Ask, Yg_pips_232), Yf0_4(Bid, ai_36), a_comment_40, a_magic_48, a_datetime_52, a_color_56);
                error_64 = GetLastError();
                if (error_64 == 0/* NO_ERROR */) break;
                if (!((error_64 == 4/* SERVER_BUSY */ || error_64 == 137/* BROKER_BUSY */ || error_64 == 146/* TRADE_CONTEXT_BUSY */ || error_64 == 136/* OFF_QUOTES */))) break;
                Sleep(5000);
            }
    }
    return (ticket_60);
}

double YYf0_12(double ad_0, int ai_8)
{
    if (ai_8 == 0) return (0);
    return (ad_0 - ai_8 * Point);
}

double Yf0_0(double ad_0, int ai_8)
{
    if (ai_8 == 0) return (0);
    return (ad_0 + ai_8 * Point);
}

double YYf0_17(double ad_0, int ai_8)
{
    if (ai_8 == 0) return (0);
    return (ad_0 + ai_8 * Point);
}

double Yf0_4(double ad_0, int ai_8)
{
    if (ai_8 == 0) return (0);
    return (ad_0 - ai_8 * Point);
}

double Yf0_5()
{
    double ld_ret_0 = 0;
    for (Yg_pos_484 = OrdersTotal() - 1; Yg_pos_484 >= 0; Yg_pos_484--)
    {
        OrderSelect(Yg_pos_484, SELECT_BY_POS, MODE_TRADES);
        if (OrderSymbol() != Symbol() || OrderMagicNumber() != Ygi_356) continue;
        if (OrderSymbol() == Symbol() && OrderMagicNumber() == Ygi_356)
            if (OrderType() == OP_BUY || OrderType() == OP_SELL) ld_ret_0 += OrderProfit();
    }
    return (ld_ret_0);
}

void YYf0_18(int ai_0, int ai_4, double a_price_8)
{
    int li_16;
    double order_stoploss_20;
    double price_28;
    if (ai_4 != 0)
    {
        for (int pos_36 = OrdersTotal() - 1; pos_36 >= 0; pos_36--)
        {
            if (OrderSelect(pos_36, SELECT_BY_POS, MODE_TRADES))
            {
                if (OrderSymbol() != Symbol() || OrderMagicNumber() != Ygi_356) continue;
                if (OrderSymbol() == Symbol() || OrderMagicNumber() == Ygi_356)
                {
                    if (OrderType() == OP_BUY)
                    {
                        li_16 = NormalizeDouble((Bid - a_price_8) / Point, 0);
                        if (li_16 < ai_0) continue;
                        order_stoploss_20 = OrderStopLoss();
                        price_28 = Bid - ai_4 * Point;
                        if (order_stoploss_20 == 0.0 || (order_stoploss_20 != 0.0 && price_28 > order_stoploss_20)) OrderModify(OrderTicket(), a_price_8, price_28, OrderTakeProfit(), 0, Aqua);
                    }
                    if (OrderType() == OP_SELL)
                    {
                        li_16 = NormalizeDouble((a_price_8 - Ask) / Point, 0);
                        if (li_16 < ai_0) continue;
                        order_stoploss_20 = OrderStopLoss();
                        price_28 = Ask + ai_4 * Point;
                        if (order_stoploss_20 == 0.0 || (order_stoploss_20 != 0.0 && price_28 < order_stoploss_20)) OrderModify(OrderTicket(), a_price_8, price_28, OrderTakeProfit(), 0, Red);
                    }
                }
                Sleep(1000);
            }
        }
    }
}

double Yf0_7()
{
    if (YYf0_16() == 0) Ygd_528 = AccountEquity();
    if (Ygd_528 < Ygd_536) Ygd_528 = Ygd_536;
    else Ygd_528 = AccountEquity();
    Ygd_536 = AccountEquity();
    return (Ygd_528);
}

double Yf0_2()
{
    double order_open_price_0;
    int ticket_8;
    double ld_unused_12 = 0;
    int ticket_20 = 0;
    for (int pos_24 = OrdersTotal() - 1; pos_24 >= 0; pos_24--)
    {
        OrderSelect(pos_24, SELECT_BY_POS, MODE_TRADES);
        if (OrderSymbol() != Symbol() || OrderMagicNumber() != Ygi_356) continue;
        if (OrderSymbol() == Symbol() && OrderMagicNumber() == Ygi_356 && OrderType() == OP_BUY)
        {
            ticket_8 = OrderTicket();
            if (ticket_8 > ticket_20)
            {
                order_open_price_0 = OrderOpenPrice();
                ld_unused_12 = order_open_price_0;
                ticket_20 = ticket_8;
            }
        }
    }
    return (order_open_price_0);
}

double Yf0_6()
{
    double order_open_price_0;
    int ticket_8;
    double ld_unused_12 = 0;
    int ticket_20 = 0;
    for (int pos_24 = OrdersTotal() - 1; pos_24 >= 0; pos_24--)
    {
        OrderSelect(pos_24, SELECT_BY_POS, MODE_TRADES);
        if (OrderSymbol() != Symbol() || OrderMagicNumber() != Ygi_356) continue;
        if (OrderSymbol() == Symbol() && OrderMagicNumber() == Ygi_356 && OrderType() == OP_SELL)
        {
            ticket_8 = OrderTicket();
            if (ticket_8 > ticket_20)
            {
                order_open_price_0 = OrderOpenPrice();
                ld_unused_12 = order_open_price_0;
                ticket_20 = ticket_8;
            }
        }
    }
    return (order_open_price_0);
}

void Yf0_9()
{
    Comment("            AutoProfit v.3.0  " + Symbol() + "  " + Period(),
       "\n", "            Forex Account Server:", AccountServer(),
       "\n", "            LotRobo3s:  ", YYgd_200,
       "\n", "            Symbol: ", Symbol(),
       "\n", "            Price:  ", NormalizeDouble(Bid, 4),
       "\n", "            Date: ", Month(), "-", Day(), "-", Year(), " Server Time: ", Hour(), ":", Minute(), ":", Seconds(),
    "\n");
}

void YYf0_13()
{
    double ld_0 = Yf0_8(0);
    string name_8 = Ygs_104 + "1";
    if (ObjectFind(name_8) == -1)
    {
        ObjectCreate(name_8, OBJ_LABEL, 0, 0, 0);
        ObjectSet(name_8, OBJPROP_CORNER, 1);
        ObjectSet(name_8, OBJPROP_XDISTANCE, 10);
        ObjectSet(name_8, OBJPROP_YDISTANCE, 15);
    }
    ObjectSetText(name_8, "Çàðàáîòîê ñåãîäíÿ: " + DoubleToStr(ld_0, 2), Yg_fontsize_544, "Courier New", Yg_color_548);
    ld_0 = Yf0_8(1);
    name_8 = Ygs_104 + "2";
    if (ObjectFind(name_8) == -1)
    {
        ObjectCreate(name_8, OBJ_LABEL, 0, 0, 0);
        ObjectSet(name_8, OBJPROP_CORNER, 1);
        ObjectSet(name_8, OBJPROP_XDISTANCE, 10);
        ObjectSet(name_8, OBJPROP_YDISTANCE, 33);
    }
    ObjectSetText(name_8, "Çàðàáîòîê â÷åðà: " + DoubleToStr(ld_0, 2), Yg_fontsize_544, "Courier New", Yg_color_548);
    ld_0 = Yf0_8(2);
    name_8 = Ygs_104 + "3";
    if (ObjectFind(name_8) == -1)
    {
        ObjectCreate(name_8, OBJ_LABEL, 0, 0, 0);
        ObjectSet(name_8, OBJPROP_CORNER, 1);
        ObjectSet(name_8, OBJPROP_XDISTANCE, 10);
        ObjectSet(name_8, OBJPROP_YDISTANCE, 51);
    }
    ObjectSetText(name_8, "Çàðàáîòîê ïîçàâ÷åðà: " + DoubleToStr(ld_0, 2), Yg_fontsize_544, "Courier New", Yg_color_548);
    name_8 = Ygs_104 + "4";
    if (ObjectFind(name_8) == -1)
    {
        ObjectCreate(name_8, OBJ_LABEL, 0, 0, 0);
        ObjectSet(name_8, OBJPROP_CORNER, 1);
        ObjectSet(name_8, OBJPROP_XDISTANCE, 10);
        ObjectSet(name_8, OBJPROP_YDISTANCE, 76);
    }
    ObjectSetText(name_8, "Áàëàíñ : " + DoubleToStr(AccountBalance(), 2), Yg_fontsize_544, "Courier New", Yg_color_548);
}

void YYf0_10()
{
    string name_0 = Ygs_104 + "L_1";
    if (ObjectFind(name_0) == -1)
    {
        ObjectCreate(name_0, OBJ_LABEL, 0, 0, 0);
        ObjectSet(name_0, OBJPROP_CORNER, 0);
        ObjectSet(name_0, OBJPROP_XDISTANCE, 390);
        ObjectSet(name_0, OBJPROP_YDISTANCE, 10);
    }
    ObjectSetText(name_0, "I N V E S T", 28, "Arial", Yg_color_552);
    name_0 = Ygs_104 + "L_2";
    if (ObjectFind(name_0) == -1)
    {
        ObjectCreate(name_0, OBJ_LABEL, 0, 0, 0);
        ObjectSet(name_0, OBJPROP_CORNER, 0);
        ObjectSet(name_0, OBJPROP_XDISTANCE, 382);
        ObjectSet(name_0, OBJPROP_YDISTANCE, 50);
    }
    ObjectSetText(name_0, "  S Y S T E M", 16, "Arial", Yg_color_552);
    name_0 = Ygs_104 + "L_3";
    if (ObjectFind(name_0) == -1)
    {
        ObjectCreate(name_0, OBJ_LABEL, 0, 0, 0);
        ObjectSet(name_0, OBJPROP_CORNER, 0);
        ObjectSet(name_0, OBJPROP_XDISTANCE, 397);
        ObjectSet(name_0, OBJPROP_YDISTANCE, 75);
    }
    ObjectSetText(name_0, "www.invest-system.net", 12, "Arial", Yg_color_556);
    name_0 = Ygs_104 + "L_4";
    if (ObjectFind(name_0) == -1)
    {
        ObjectCreate(name_0, OBJ_LABEL, 0, 0, 0);
        ObjectSet(name_0, OBJPROP_CORNER, 0);
        ObjectSet(name_0, OBJPROP_XDISTANCE, 382);
        ObjectSet(name_0, OBJPROP_YDISTANCE, 57);
    }
    ObjectSetText(name_0, "_____________________", 12, "Arial", Gray);
    name_0 = Ygs_104 + "L_5";
    if (ObjectFind(name_0) == -1)
    {
        ObjectCreate(name_0, OBJ_LABEL, 0, 0, 0);
        ObjectSet(name_0, OBJPROP_CORNER, 0);
        ObjectSet(name_0, OBJPROP_XDISTANCE, 382);
        ObjectSet(name_0, OBJPROP_YDISTANCE, 76);
    }
    ObjectSetText(name_0, "_____________________", 12, "Arial", Gray);
}

double Yf0_8(int ai_0)
{
    double ld_ret_4 = 0;
    for (int pos_12 = 0; pos_12 < OrdersHistoryTotal(); pos_12++)
    {
        if (!(OrderSelect(pos_12, SELECT_BY_POS, MODE_HISTORY))) break;
        if (OrderSymbol() == Symbol() && OrderMagicNumber() == Magic)
            if (OrderCloseTime() >= iTime(Symbol(), PERIOD_D1, ai_0) && OrderCloseTime() < iTime(Symbol(), PERIOD_D1, ai_0) + 86400) ld_ret_4 = ld_ret_4 + OrderProfit() + OrderCommission() + OrderSwap();
    }
    return (ld_ret_4);
}
        
