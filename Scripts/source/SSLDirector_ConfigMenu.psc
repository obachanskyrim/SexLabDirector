ScriptName SSLDirector_ConfigMenu Extends SKI_ConfigBase
{SexLab Director MCM}

SSLDirector_Controller Property Director auto ; Director Main Control

Event OnConfigInit()
	ModName = "SexLab Director"
	Pages     = new string[1]
	Pages[0]  = "Animation Menu"
EndEvent

event OnGameReload()
	parent.OnGameReload()
	Director.InitialSetup()
	Director.Setup()
endEvent

int function GetVersion()
	return DirectorUtil.GetVersion()
endFunction

Event OnVersionUpdate(int a_version)
	debug.trace("# [SexLab Director] - Update - ver." + CurrentVersion + " --> ver." + a_version)
EndEvent

; ==============================================
event OnPageReset(string page)
	if page == ""
		SetTitleText("$MCM_cover_top")
		LoadCustomContent("exported/obachan/SexLabDirector_Logo.dds", 107, 30)
		return
	endIf
	UnloadCustomContent()
	if page == "Animation Menu"
		Page_AnimationMenu()
	endif
endEvent
; ==============================================
Event OnConfigOpen()
	Director.Setup()
endEvent
Event OnConfigClose()
EndEvent
; ==============================================
Function Page_AnimationMenu()
	SetTitleText("$MCM_AnimationMenu_pagetitle")
	SetCursorFillMode(TOP_TO_BOTTOM)

	int flags
	if Director.CheckSexLab() && Director.SKSE_OK
		flags = OPTION_FLAG_NONE
	else
		flags = OPTION_FLAG_DISABLED
	endIf

	; Main Function
	AddHeaderOption("$MCM_h_MainMenu_AnimationMenu")
	AddTextOptionST("Open_AnimationMenu", "$MCM_open_AnimationMenu", "$Mark_Angle", flags)
	AddKeyMapOptionST("keymap_AnimationMenuHotkey", "$MCM_AnimationMenuHotkey", Director.hotkey_AnimationMenu, flags)
	AddTextOptionST("Unregist_AnimationMenuHotkey", "$MCM_AnimationMenuHotkey_unregist", "$Go_ahead", flags)
	AddEmptyOption()

	; Option Function
	AddHeaderOption("$MCM_h_OptionMenu_AnimationMenu")
	AddToggleOptionST("Toggle_thumbnail","$MCM_show_thumbnail", Director.ShowThumbnail, flags)
	AddToggleOptionST("Toggle_debug","$MCM_debugMode", Director.debugMode, flags)
	; AddTextOptionST("Director_ClearSystem", "$MCM_Director_ClearSystem", "$Go_ahead", flags)

	SetCursorPosition(1)

	; System States
	AddHeaderOption("$MCM_h_Check_System")
	AddTextOption("$MCM_MOD_Version", "v" + DirectorUtil.GetStringVer())
	AddTextOption("$MCM_HUD_Version", Director.DirectorHUD_Status)
	AddEmptyOption()
	AddTextOption("$MCM_SKSE_check", Director.SKSE_Status)
	AddTextOption("SexLab", Director.SexLab_Status)
	AddTextOption("Creature", Director.SexLab_Status_Creature)
	AddEmptyOption()
	AddHeaderOption("$MCM_h_Favorite_AnimationMenu")
	AddTextOption("$MCM_Save1", Director.SaveTimeString1 + " , " + Director.GetSaveAnimCount(1) + " COUNT")
	AddTextOption("$MCM_Save2", Director.SaveTimeString2 + " , " + Director.GetSaveAnimCount(2) + " COUNT")

endFunction

; Open AnimationMenu
state Open_AnimationMenu
	event OnHighlightST()
		SetInfoText("$MCM_open_AnimationMenu_Highlight")
	endEvent
	event OnSelectST()
		Director.AnimationMenu.ShowAnimationEditorMenu()
	endEvent
endState

; Regist AnimationMenu Hotkey
state keymap_AnimationMenuHotkey
	event OnHighlightST()
		SetInfoText("$MCM_AnimationMenuHotkey_highlight")
	endEvent
	event OnKeyMapChangeST(int newKeyCode, string conflictControl, string conflictName)
		if !KeyConflict(newKeyCode, conflictControl, conflictName)
			if (Director.hotkey_AnimationMenu > -1)
				Director.UnregisterForKey(Director.hotkey_AnimationMenu)
			endif
			Director.hotkey_AnimationMenu = newKeyCode
			Director.RegisterForKey(Director.hotkey_AnimationMenu)
			SetKeyMapOptionValueST(Director.hotkey_AnimationMenu)
		endIf
	endEvent
	event OnDefaultST()
		if (Director.hotkey_AnimationMenu > -1)
			Director.UnregisterForKey(Director.hotkey_AnimationMenu)
		endif
		Director.hotkey_AnimationMenu = -1
		SetKeyMapOptionValueST(Director.hotkey_AnimationMenu)
	endEvent
endState
; Unregist AnimationMenu Hotkey
state Unregist_AnimationMenuHotkey
	event OnHighlightST()
		SetInfoText("$MCM_AnimationMenuHotkey_unregist_Highlight")
	endEvent
	event OnSelectST()
		if (Director.hotkey_AnimationMenu > -1)
			Director.UnregisterForKey(Director.hotkey_AnimationMenu)
		endif
		Director.hotkey_AnimationMenu = -1
		ForcePageReset()
		ShowMessage("$MCM_AnimationMenuHotkey_unregist_done", false)
	endEvent
endState

bool function KeyConflict(int newKeyCode, string conflictControl, string conflictName)
	bool continue = true
	if (conflictControl != "")
		string msg
		if (conflictName != "")
			msg = "$MCM_hotkeyWarn1{" + conflictName + "}{" + conflictControl + "}"
		else
			msg = "$MCM_hotkeyWarn2{" + conflictControl + "}"
		endIf
		continue = ShowMessage(msg, true, "$Yes", "$No")
	endIf
	return !continue
endFunction
String Function GetCustomControl(int keyCode)
	if(keyCode == Director.hotkey_AnimationMenu)
		return "AnimationMenu"
	endIf
EndFunction

; Toggle load thumnail images
state Toggle_thumbnail
	event OnHighlightST()
		SetInfoText("$MCM_AnimationMenu_showThumnail_Highlight")
	endEvent
	event OnSelectST()
		Director.ShowThumbnail = !Director.ShowThumbnail
		SetToggleOptionValueST(Director.ShowThumbnail)
	endEvent
	event OnDefaultST()
		Director.ShowThumbnail = true
		SetToggleOptionValueST(Director.ShowThumbnail)
	endEvent
endState

; Toggle debug mode
state Toggle_debug
	event OnHighlightST()
		SetInfoText("$MCM_AnimationMenu_debugMode_Highlight")
	endEvent
	event OnSelectST()
		Director.debugMode = !Director.debugMode
		SetToggleOptionValueST(Director.debugMode)
	endEvent
	event OnDefaultST()
		Director.debugMode = false
		SetToggleOptionValueST(Director.debugMode)
	endEvent
endState

; Director Main control clear
; state Director_ClearSystem
; 	event OnHighlightST()
; 		SetInfoText("$MCM_Director_ClearSystem_Highlight")
; 	endEvent
; 	event OnSelectST()
; 		Director.ClearSet()
; 	endEvent
; endState
