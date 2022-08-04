Scriptname HarbingerEarningsScript extends ObjectReference  

MiscObject property HarbingerGold auto
GlobalVariable Property HarbingerCurrentEarnings auto

Event OnOpen(ObjectReference akActionRef)
    int earnings = HarbingerCurrentEarnings.Value as int
    if (earnings > 0)
        AddItem(HarbingerGold, earnings, false)
    endif
EndEvent