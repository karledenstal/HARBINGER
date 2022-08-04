Scriptname HarbingerMCM extends SKI_ConfigBase

GlobalVariable Property HarbingerReqUntilC01 Auto
GlobalVariable Property HarbingerReqUntilC03 Auto
GlobalVariable Property HarbingerReqUntilC04 Auto

Int HarbingerReqUntilC01_OID
Int HarbingerReqUntilC03_OID
Int HarbingerReqUntilC04_OID

Event OnConfigInit()
    ModName = "HARBINGER"
EndEvent

event OnPageReset(string a_page)
    SetCursorFillMode(TOP_TO_BOTTOM)
    AddHeaderOption("Radiant quests required to progress")
    HarbingerReqUntilC01_OID = AddSliderOption("Proving Honor",HarbingerReqUntilC01.GetValue(),"{0}")
    HarbingerReqUntilC03_OID = AddSliderOption("The Silver Hand",HarbingerReqUntilC03.GetValue(),"{0}")
    HarbingerReqUntilC04_OID = AddSliderOption("Blood's Honor",HarbingerReqUntilC04.GetValue(),"{0}")
endEvent

Event OnOptionSliderOpen(int a_option)
    if (a_option == HarbingerReqUntilC01_OID)
        SetSliderDialogStartValue(HarbingerReqUntilC01.GetValue())
        SetSliderDialogDefaultValue(2)
        SetSliderDialogRange(0,20)
        SetSliderDialogInterval(1)
    elseif (a_option == HarbingerReqUntilC03_OID)
        SetSliderDialogStartValue(HarbingerReqUntilC03.GetValue())
        SetSliderDialogDefaultValue(5)
        SetSliderDialogRange(0,20)
        SetSliderDialogInterval(1)
    elseif (a_option == HarbingerReqUntilC04_OID)
        SetSliderDialogStartValue(HarbingerReqUntilC04.GetValue())
        SetSliderDialogDefaultValue(3)
        SetSliderDialogRange(0,20)
        SetSliderDialogInterval(1)
    endif
EndEvent

Event OnOptionSliderAccept(int option, float value)
    if(option == HarbingerReqUntilC01_OID)
        HarbingerReqUntilC01.SetValue(value)
        SetSliderOptionValue(option,value,"{0}")
    elseif(option == HarbingerReqUntilC03_OID)
        HarbingerReqUntilC03.SetValue(value)
        SetSliderOptionValue(option,value,"{0}")
    elseif(option == HarbingerReqUntilC04_OID)
        HarbingerReqUntilC04.SetValue(value)
        SetSliderOptionValue(option,value,"{0}")
    endif
EndEvent

Event OnOptionHighlight(int a_option)
    if (a_option == HarbingerReqUntilC01_OID)
        SetInfoText("Will start Proving Honor once this number of radiant quests have been completed.")
    elseif (a_option == HarbingerReqUntilC03_OID)
        SetInfoText("Will start The Silver Hand once this number of radiant quests have been completed.")
    elseif (a_option == HarbingerReqUntilC04_OID)
        SetInfoText("Will start Blood's Honor once this number of radiant quests have been completed.")
    endif
EndEvent
