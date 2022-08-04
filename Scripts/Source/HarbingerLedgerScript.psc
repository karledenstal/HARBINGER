Scriptname HarbingerLedgerScript extends ObjectReference

Faction Property HarbingerFaction auto
MiscObject Property EarningReward auto
Message Property HarbingerLedgerMessage auto

GlobalVariable Property HarbingerCurrentEarnings auto

Event OnActivate(ObjectReference akActionRef)
    ; Check that player is Hrabinger to open the menu.
    if (Game.GetPlayer().IsInFaction(HarbingerFaction))
        LedgerMenu()
    else
        Debug.Notification("This doesn't belong to you.")
    endif
EndEvent

Function LedgerMenu(int aButton = 0)
    aButton = HarbingerLedgerMessage.Show()
        if (aButton == 0)
            int reward = HarbingerCurrentEarnings.GetValueInt()
            if (reward == 0)
                Debug.Notification("There is nothing to collect")
            else
                ; Set earnings variable to 0 to start over
                HarbingerCurrentEarnings.SetValue(0)
                ; Add earnings into player pocket
                Game.GetPlayer().AddItem(EarningReward, reward, false)
                Debug.Notification("Collected total earnings of: " + reward)
                Debug.Notification("Resetting earnings")
            endif
            
        elseif (aButton == 1)
            Debug.Notification("Closed menu")
        endif
EndFunction