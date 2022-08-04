Scriptname HarbingerEarningsScript extends ObjectReference  

MiscObject property HarbingerGold auto
ObjectReference Property EarningsBox auto
GlobalVariable Property HarbingerCurrentEarnings auto

Event OnOpen(ObjectReference akActionRef)
    int earnings = HarbingerCurrentEarnings.Value as int
    if (earnings > 0)
        EarningsBox.AddItem(HarbingerGold, earnings, false)
    endif
EndEvent

Event OnClose(ObjectReference akActionRef)
    HarbingerCurrentEarnings.SetValue(0)
EndEvent