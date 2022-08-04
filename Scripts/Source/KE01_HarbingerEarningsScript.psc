Scriptname KE01_HarbingerEarningsScript extends Quest 

GlobalVariable Property HarbingerCurrentEarnings Auto
Faction Property HarbingerFaction Auto

; Farkas & Aela handles real medium jobs
int FarkasQuestEarnings = 0
int AelaQuestEarnings = 0
; Vilkas handles real difficult jobs
int VilkasQuestEarnings = 0
; Njada, Ria, Athis, Torvar handles grunt work
int WorthlessCompanionEarnings = 0

int TotalEarnings = 0
int PreviousEarnings = 0

; Should only run once character is Harbinger
; Should run once every week
Event OnInit()
    ; if (Game.GetPlayer().IsInFaction(HarbingerFaction))
    ;     RegisterForSingleUpdateGameTime(24.0)
    ; endif
    RegisterForSingleUpdateGameTime(168.0)
EndEvent

Event OnUpdateGameTime()
    Debug.Notification("Gathering Harbinger Earnings")
    FarkasQuestEarnings = Utility.RandomInt(50, 100)
    AelaQuestEarnings = Utility.RandomInt(50, 100)
    VilkasQuestEarnings = Utility.RandomInt(100, 250)
    WorthlessCompanionEarnings = Utility.RandomInt(70, 100)

    TotalEarnings = FarkasQuestEarnings + AelaQuestEarnings + VilkasQuestEarnings + WorthlessCompanionEarnings
    PreviousEarnings = HarbingerCurrentEarnings.GetValueInt()

    HarbingerCurrentEarnings.SetValue(TotalEarnings + PreviousEarnings)

    ; Poll this once every day
    RegisterForSingleUpdateGameTime(168.0)
EndEvent