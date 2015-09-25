ScriptName SSLDirector_Controller Extends Quest
{SexLab Director Main Control}
import Utility

; SexLab
SexLabFramework Property SexLab auto
int Property SSLversion auto
Quest SexLabQuestFramework ; SexLab MainQuest(SexLab config)
Quest SexLabQuestAnimations ; SexLab AnimationSlots Registry Quest
Quest SexLabQuestRegistry ; SexLab CreatureAnimationSlots Registry Quest
sslSystemConfig Property sslConfig auto
sslAnimationSlots Property AnimSlots auto
sslCreatureAnimationSlots Property CreatureSlots auto
Bool Property AllowCreatures auto
string Property SexLab_Status = "" auto
string Property SexLab_Status_Creature = "$CreatureAnimation_default" auto
bool Property SKSE_OK auto
string Property SKSE_Status = "" auto

; Player Thread Info
Bool Property isPlayerThreadActive auto
sslThreadController Property PlayerThreadController auto
string Property PlayerThreadID auto
Bool Property isPlayerThreadAggressive auto
Actor[] Property PlayerThreadPositions auto
int Property currentStage auto
int Property maxStage auto
sslBaseAnimation Property PlayerThreadAnimation auto
string Property PlayerThreadAnimationName auto

; Director common var
Actor Player
int property hotkey_AnimationMenu = -1 auto
Bool Property debugMode = false auto
bool Property ShowThumbnail = true auto
String translateMsg ; SKSE translator string temp
Quest property myQuest auto
SSLDirector_AnimationMenu Property AnimationMenu auto
SSLDirector_HUD Property DirectorHUD auto
string Property DirectorHUD_Status = "" auto
string Property SaveTimeString1 = "No Data" auto
string Property SaveTimeString2 = "No Data" auto

;/===============================================/;

Function InitialSetup()
	Player = Game.GetPlayer()
	AnimationMenu = myQuest as SSLDirector_AnimationMenu
	DirectorHUD_Status = DirectorHUD.GetHudversionVer()
EndFunction

Function Setup()
	log("SSLDirector_Controller Setup...")
	ClearSet()
	RegisterEventSet()
	If CheckSexLab()
		log("Check SexLab OK")
		GetSexLab()
		RegisterMenuKey()
		RegisterSexLabCommonEvent()
	endif
EndFunction

Function ClearSet()
	log("ClearSet")
	UnregisterMenuKey()
	UnregisterEventSet()
	UnregisterSexLabCommonEvent()
EndFunction

Event OnKeyDown(Int KeyCode)
	If KeyCode == hotkey_AnimationMenu
		if !CheckSexLab()
			string msg = GetTranslateMsg(SexLab_Status)
			If (msg == "Error")
				Debug.MessageBox("[ AnimationMenu cannot open ! ]\n\nSexLab is not active.\n")
			else
				Debug.MessageBox("[ AnimationMenu cannot open ! ]\n\nSexLab " + msg + "\n")
			endif
		else
			AnimationMenu.ShowAnimationEditorMenu()
		endIf
	endIf
EndEvent


;/===========================================
	SexLab Section
============================================/;
Event OnAnimationStart(string eventName, string argString, float argNum, form sender)
	sslThreadController controller = SexLab.HookController(argString)
	isPlayerThreadActive = controller.HasPlayer
	if isPlayerThreadActive
		PlayerThreadID = argString
		PlayerThreadController = controller
		isPlayerThreadAggressive = controller.IsAggressive
		PlayerThreadPositions = controller.Positions
		log("Player SexScene Start - ID : " + PlayerThreadID + " - [Aggressive = " + isPlayerThreadAggressive + "]")
	else
		log("OnAnimationStart - Thread ID : " + argString + " - not with Player !")
	endIf

EndEvent
Event OnStageStart(string eventName, string argString, float argNum, form sender)
	sslThreadController controller = SexLab.HookController(argString)
	If controller.HasPlayer
		PlayerThreadAnimation = SexLab.HookAnimation(argString)
		currentStage = SexLab.HookStage(argString)
		maxStage = PlayerThreadAnimation.StageCount
		PlayerThreadAnimationName = PlayerThreadAnimation.name
		log("Player SexScene ID : " + PlayerThreadID + " - [" + PlayerThreadAnimation.name + "] " + currentStage + " / " + maxStage)
	else
		log("OnStageStart - Thread ID : " + argString + " - not with Player !")
	endif
EndEvent

Event OnOrgasmStart(string eventName, string argString, float argNum, form sender)
EndEvent

Event OnAnimationEnd(string eventName, string argString, float argNum, form sender)
	sslThreadController controller = SexLab.HookController(argString)
	If controller.HasPlayer
		log("Player SexScene Start - ID : " + PlayerThreadID + " , Animation End")
		CleanPlayerThreadInfo()
	else
		log("OnAnimationEnd - Thread ID : " + argString + " - not with Player !")
	endif
EndEvent

Function CleanPlayerThreadInfo()
	isPlayerThreadActive = false
	PlayerThreadID = ""
	isPlayerThreadAggressive = false
	Actor[] emptyActors
	PlayerThreadPositions = emptyActors
	currentStage = -1
	maxStage = -1
	PlayerThreadAnimationName = ""
EndFunction

bool Function CheckSexLab()
	If SKSE.GetScriptVersionRelease() >= 48
		SKSE_OK = true
		SKSE_Status = "installed [OK]"
	else
		SKSE_OK = false
		SKSE_Status = "out of version [NG]"
	endif
	if !(SexLabUtil.SexLabIsActive())
		SexLab_Status = "$SexLab_not_active"
		return false
	else
		SexLab = SexLabUtil.GetAPI()
		SSLversion = SexLabUtil.GetVersion()
		if SSLversion == 15903 ; ver1.59c
			if !(SexLab.Enabled)
				SexLab_Status = "$SexLab_1.59c_disabled"
				return false
			else
				SexLab_Status = "$SexLab_1.59c_enabled"
				return true
			endif
		elseif SSLversion >= 16002 ; ver1.602 hotfix2+
			; SexLab Manual install pending check
			bool SexLabIsReady
			SexLabQuestFramework  = Game.GetFormFromFile(0xD62, "SexLab.esm") as Quest
			If SexLabQuestFramework
				ReferenceAlias PlayerAlias = SexLabQuestFramework.GetAlias(3) as ReferenceAlias
				If PlayerAlias.getReference()
					sslSystemAlias SystemAlias = PlayerAlias as sslSystemAlias
					If SystemAlias
						SexLabIsReady = SystemAlias.IsInstalled
					else
						log("SexLab Manual install pending check - cannot get SystemAlias", true)
					endIf
				else
					log("SexLab Manual install pending check - cannot get PlayerAlias", true)
				endif
			else
				log("SexLab Manual install pending check - cannot get SexLabQuestFramework", true)
			endif

			If !SexLabIsReady
				SexLab_Status = "$SexLab_1.60+_not_ready"
				return false
			else
				if !(SexLab.Enabled)
					SexLab_Status = "$SexLab_1.60+_disabled"
					return false
				else
					SexLab_Status = "$SexLab_1.60+_enabled"
					return true
				endif
			endIf
		else
			SexLab_Status = "$SexLab_out_of_version"
			return false
		endif
	endif
EndFunction
Bool Function GetSexLab()
	SexLabQuestFramework  = Game.GetFormFromFile(0xD62, "SexLab.esm") as Quest
	SexLabQuestAnimations = Game.GetFormFromFile(0x639DF, "SexLab.esm") as Quest
	SexLabQuestRegistry = Game.GetFormFromFile(0x664FB, "SexLab.esm") as Quest
	sslConfig = SexLabQuestFramework as sslSystemConfig
	AnimSlots = SexLabQuestAnimations as sslAnimationSlots
	if sslConfig && sslConfig.AllowCreatures
		CreatureSlots = SexLabQuestRegistry as sslCreatureAnimationSlots
		If CreatureSlots.Slotted < 1
			AllowCreatures = false
			SexLab_Status_Creature = "$CreatureAnimation_not_registered"
		else
			AllowCreatures = true
			SexLab_Status_Creature = "$CreatureAnimation_ready"
		endif
	else
		AllowCreatures = false
		SexLab_Status_Creature = "$CreatureAnimation_not_allowed"
	endIf
	If sslConfig && AnimSlots
		return true
	else
		return false
	endIf
EndFunction


;/===========================================
	Register & Unregister Event
============================================/;
Function RegisterEventSet()
	RegisterForModEvent("UIlog", "OnUIlog")
	RegisterForModEvent("ReturnTranslate" , "OnReturnTranslate")
EndFunction
Function UnregisterEventSet()
	UnregisterForModEvent("UIlog")
	UnregisterForModEvent("ReturnTranslate")
EndFunction
Function RegisterMenuKey()
	If hotkey_AnimationMenu > -1
		Registerforkey(hotkey_AnimationMenu)
	endif
EndFunction
Function UnregisterMenuKey()
	if hotkey_AnimationMenu > -1
		Unregisterforkey(hotkey_AnimationMenu)
	endIf
EndFunction
Function RegisterSexLabCommonEvent()
	RegisterForModEvent("AnimationStart", "OnAnimationStart")
	RegisterForModEvent("AnimationEnd", "OnAnimationEnd")
	RegisterForModEvent("StageStart", "OnStageStart")
	RegisterForModEvent("AnimationChange", "OnStageStart")
	RegisterForModEvent("OrgasmStart", "OnOrgasmStart")
EndFunction
Function UnregisterSexLabCommonEvent()
	UnregisterForModEvent("AnimationStart")
	UnregisterForModEvent("AnimationEnd")
	UnregisterForModEvent("StageStart")
	UnregisterForModEvent("AnimationChange")
	UnregisterForModEvent("OrgasmStart")
EndFunction
Function RegisterSexLabEvent(string hook)
	RegisterForModEvent("AnimationStart_" + hook, "OnAnimationStart_" + hook)
	RegisterForModEvent("AnimationEnd_" + hook, "OnAnimationEnd_" + hook)
	RegisterForModEvent("StageStart_" + hook, "OnStageStart_" + hook)
	RegisterForModEvent("OrgasmStart_" + hook, "OnOrgasmStart_" + hook)
	RegisterForModEvent("AnimationChange_" + hook, "OnStageStart_" + hook)
EndFunction
Function UnregisterSexLabEvent(string hook)
	UnregisterForModEvent("AnimationStart_" + hook)
	UnregisterForModEvent("AnimationEnd_" + hook)
	UnregisterForModEvent("StageStart_" + hook)
	UnregisterForModEvent("OrgasmStart_" + hook)
	UnregisterForModEvent("AnimationChange_" + hook)
EndFunction


;/===========================================
	Common Utility
============================================/;
Function log(String Msg, Bool isError = false)
	If debugMode
		If isError
			Debug.Trace("@ [SexLabDirector] - Error - " + Msg)
		else
			Debug.Trace("# [SexLabDirector] " + Msg)
		endif
	endIf
EndFunction
Event OnUIlog(String asEventName, String asStringArg, Float afNumArg, Form akSender)
	If debugMode
		Debug.Trace( "[UI] - [SexLabDirector] - " + asStringArg)
	endif
EndEvent
string Function GetTranslateMsg(string a_msg)
	translateMsg = ""
	DirectorHUD.TranslateMsg(a_msg)
	int i = 0
	While !translateMsg
		Wait(0.2)
		i += 1
		if (i >= 5)
			translateMsg = "Error"
			log("GetTranslateMsg - DirectHUD cannot access" , true)
		endif
	endWhile
	return translateMsg
EndFunction
Event OnReturnTranslate(String asEventName, String asStringArg, Float afNumArg, Form akSender)
	translateMsg = asStringArg
EndEvent
string Function getActorName(Actor target)
	If target == Player
		Return Player.getbaseobject().getname()
	else
		string name = target.GetDisplayName()
		If name == ""
			name = target.getbaseobject().getname()
		endIf
		Return name
	endIf
EndFunction

int Function GetSaveAnimCount(int save_num)
	If save_num == 1
		return AnimationMenu.SaveAnimCount1
	elseif save_num == 2
		return AnimationMenu.SaveAnimCount2
	endif
EndFunction