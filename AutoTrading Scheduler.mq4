﻿#property copyright "EarnForex.com"
#property link      "https://www.earnforex.com/metatrader-expert-advisors/AutoTrading-Scheduler/"
#property version   "1.01"
string    Version = "1.01";
#property strict

#property description "Creates a weekly schedule when AutoTrading is enabled."
#property description "Disables AutoTrading during all other times."
#property description "Can also close all trades before disabling AutoTrading.\r\n"
#property description "WARNING: There is no guarantee that the expert advisor will work as intended. Use at your own risk."
#property icon        "EF-Icon-64x64px.ico"

#include "AutoTrading Scheduler.mqh";

input string ____Notifications = "================";
input bool EnableNativeAlerts = false;
input bool EnableEmailAlerts = false;
input bool EnablePushAlerts = false;
input string ____Defaults = "================";
input bool DefaultTurnedOn = false; // Default state of the scheduler: ON or OFF
input ENUM_TIME_TYPE DefaultTime = Local; // Default time type
input string DefaultMonday = ""; // Default enabled Monday periods
input string DefaultTuesday = ""; // Default enabled Tuesday periods
input string DefaultWednesday = ""; // Default enabled Wednesday periods
input string DefaultThursday = ""; // Default enabled Thursday periods
input string DefaultFriday = ""; // Default enabled Friday periods
input string DefaultSaturday = ""; // Default enabled Saturday periods
input string DefaultSunday = ""; // Default enabled Sunday periods
input bool DefaultClosePos = false; // Close all positions before turning AutoTrading OFF?
input bool DefaultEnforce = true; // Always enforce schedule?
input string ____Miscellaneous = "================";
input int Slippage = 2; // Slippage

CScheduler Panel;

int DeinitializationReason = -1;

//+------------------------------------------------------------------+
//| Initialization function                                          |
//+------------------------------------------------------------------+
int OnInit()
{
    if (DeinitializationReason != REASON_CHARTCHANGE)
    {
        if (!Panel.LoadSettingsFromDisk())
        {
            sets.TurnedOn = DefaultTurnedOn;
            sets.TimeType = DefaultTime;
            sets.Monday = DefaultMonday;
            sets.Tuesday = DefaultTuesday;
            sets.Wednesday = DefaultWednesday;
            sets.Thursday = DefaultThursday;
            sets.Friday = DefaultFriday;
            sets.Saturday = DefaultSaturday;
            sets.Sunday = DefaultSunday;
            sets.Enforce = DefaultEnforce;
            sets.ClosePos = DefaultClosePos;
        }

        if (!Panel.Create(0, "AutoTrading Scheduler (ver. " + Version + ")", 0, 20, 20)) return(-1);
        Panel.Run();
        Panel.IniFileLoad();
    
        // Brings panel on top of other objects without actual maximization of the panel.
        Panel.HideShowMaximize();
    
        Panel.RefreshPanelControls();
        Panel.RefreshValues();
    }

    EventSetTimer(1);

    return INIT_SUCCEEDED;
}

//+------------------------------------------------------------------+
//| Deinitialization function                                        |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
{
    DeinitializationReason = reason; // Remember reason to avoid recreating the panel in the OnInit() if it is not deleted here.
    EventKillTimer();
    if ((reason == REASON_REMOVE) || (reason == REASON_CHARTCLOSE) || (reason == REASON_PROGRAM))
    {
        Panel.DeleteSettingsFile();
        Print("Trying to delete ini file.");
        if (!FileIsExist(Panel.IniFileName() + ".dat")) Print("File doesn't exist.");
        else if (!FileDelete(Panel.IniFileName() + ".dat")) Print("Failed to delete file: " + Panel.IniFileName() + ".dat. Error: " + IntegerToString(GetLastError()));
        else Print("Deleted ini file successfully.");
    }
    else if (reason != REASON_CHARTCHANGE)
    {
        // It is deinitialization due to input parameters change - save current parameters values (that are also changed via panel) to global variables.
        if (reason == REASON_PARAMETERS) GlobalVariableSet("ATS-" + IntegerToString(ChartID()) + "-Parameters", 1);
        Panel.SaveSettingsOnDisk();
        Panel.IniFileSave();
    }
    
    if (reason != REASON_CHARTCHANGE) Panel.Destroy();
}

//+------------------------------------------------------------------+
//| ChartEvent function                                              |
//+------------------------------------------------------------------+
void OnChartEvent(const int id,
                  const long &lparam,
                  const double &dparam,
                  const string &sparam)
{
    // Remember the panel's location to have the same location for minimized and maximized states.
    if ((id == CHARTEVENT_CUSTOM + ON_DRAG_END) && (lparam == -1))
    {
        Panel.remember_top = Panel.Top();
        Panel.remember_left = Panel.Left();
    }

    // Call Panel's event handler only if it is not a CHARTEVENT_CHART_CHANGE - workaround for minimization bug on chart switch.
    if (id != CHARTEVENT_CHART_CHANGE) Panel.OnEvent(id, lparam, dparam, sparam);

    if (Panel.Top() < 0) Panel.Move(Panel.Left(), 0);
}

void OnTick()
{
    Panel.RefreshValues();
    Panel.CheckTimer();
    ChartRedraw();
}

//+------------------------------------------------------------------+
//| Timer event handler                                              |
//+------------------------------------------------------------------+
void OnTimer()
{
    Panel.RefreshValues();
    Panel.CheckTimer();
    ChartRedraw();
}
//+------------------------------------------------------------------+