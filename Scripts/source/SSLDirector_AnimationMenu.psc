ScriptName SSLDirector_AnimationMenu Extends Quest
{ SexLab Animation Menu Control }

import Utility

SSLDirector_Controller Property Director auto ; Director Main Control
SSLDirector_ConfigMenu Property DirectorMCM auto;

; SexLab Data (Get by Director)
SexLabFramework SexLab
int SSLversion
sslSystemConfig Config
sslAnimationSlots AnimSlots
sslCreatureAnimationSlots CreatureSlots

; Current Playing Animation Data (Get by Director)
sslBaseAnimation PlayerThreadAnimation
Bool isPlayerThreadActive
Bool isPlayerThreadAggressive
int currentStage
int maxStage

; Animation Detail Data
sslBaseAnimation[] Anim1 ; Human Animation 0 - 124
sslBaseAnimation[] Anim2 ; 125 - 249
sslBaseAnimation[] Anim3 ; 250 - 349
sslBaseAnimation[] c_Anim1 ; Creature Animation 0 - 124
sslBaseAnimation[] c_Anim2 ; 125 - 249
sslBaseAnimation[] c_Anim3 ; 250 - 349
int PageCount = 0 ; the total pages
int RegisteredCount = 0 ; the total Registered animations
int c_PageCount = 0 ; the total pages(creature)
int c_RegisteredCount = 0 ; the total Registered animations(creature)
string[] Names1
string[] Names2
string[] Names3
string[] Registry1
string[] Registry2
string[] Registry3
Bool[] Enabled1
Bool[] Enabled2
Bool[] Enabled3
Bool[] LeadIn1
Bool[] LeadIn2
Bool[] LeadIn3
Bool[] Aggressive1
Bool[] Aggressive2
Bool[] Aggressive3
string[] c_Names1
string[] c_Names2
string[] c_Names3
string[] c_Registry1
string[] c_Registry2
string[] c_Registry3
Bool[] c_Enabled1
Bool[] c_Enabled2
Bool[] c_Enabled3
Bool bMenuOpen
Bool AllowCreatures
string TagWord1 = "Vaginal"
string TagWord2 = "Anal"
string TagWord3 = "Vaginal"
string TagWord4 = "Doggystyle"
string TagSelectWord1
string TagSelectWord2
string TagSelectWord3
string TagSelectWord4
string TagSelectWord5
string TagSelectWord6
string TagSelectWord7
string TagSelectWord8
string TagSelectWord9
string TagSelectWord10
string TagSelectWord11
string TagSelectWord12
string TagSelectWord13
string TagSelectWord14
string TagSelectWord15
string TagSelectWord16
string TagSelectWord1_c
string TagSelectWord2_c
string TagSelectWord3_c
string TagSelectWord4_c
string TagSelectWord5_c
string TagSelectWord6_c
string TagSelectWord7_c
string TagSelectWord8_c
string TagSelectWord9_c
string TagSelectWord10_c
string TagSelectWord11_c
string TagSelectWord12_c
string TagSelectWord13_c
string TagSelectWord14_c
string TagSelectWord15_c
string TagSelectWord16_c
; for Save data
string[] SaveAnimsArray1
string[] SaveAnimsArray2
int Property SaveAnimCount1 = 0 Auto
int Property SaveAnimCount2 = 0 Auto

; ==============================================
Function ResetData()
	SSLversion = 0;
	isPlayerThreadActive = false
	sslBaseAnimation[] emptyAnim
	Anim1 = emptyAnim
	Anim2 = emptyAnim
	Anim3 = emptyAnim
	c_Anim1 = emptyAnim
	c_Anim2 = emptyAnim
	c_Anim3 = emptyAnim
	PageCount = 0
	RegisteredCount = 0
	c_PageCount = 0
	c_RegisteredCount = 0
	string[] emptyStrings
	Bool[] emptyBools
	Names1 = emptyStrings
	Names2 = emptyStrings
	Names3 = emptyStrings
	Registry1 = emptyStrings
	Registry2 = emptyStrings
	Registry3 = emptyStrings
	Enabled1 = emptyBools
	Enabled2 = emptyBools
	Enabled3 = emptyBools
	LeadIn1 = emptyBools
	LeadIn2 = emptyBools
	LeadIn3 = emptyBools
	Aggressive1 = emptyBools
	Aggressive2 = emptyBools
	Aggressive3 = emptyBools
	c_Names1 = emptyStrings
	c_Names2 = emptyStrings
	c_Names3 = emptyStrings
	c_Registry1 = emptyStrings
	c_Registry2 = emptyStrings
	c_Registry3 = emptyStrings
	c_Enabled1 = emptyBools
	c_Enabled2 = emptyBools
	c_Enabled3 = emptyBools
	bMenuOpen = false
	AllowCreatures = false
	TagSelectWord1 = "Missionary"
	TagSelectWord2 = "DoggyStyle"
	TagSelectWord3 = "Cowgirl"
	TagSelectWord4 = "Standing"
	TagSelectWord5 = "Vaginal"
	TagSelectWord6 = "Anal"
	TagSelectWord7 = "Oral"
	TagSelectWord8 = "Laying"
	TagSelectWord9 = "Loving"
	TagSelectWord10 = "Blowjob"
	TagSelectWord11 = "Holding"
	TagSelectWord12 = "Handjob"
	TagSelectWord13 = "Footjob"
	TagSelectWord14 = "AP"
	TagSelectWord15 = "Arrok"
	TagSelectWord16 = "Leito"
	TagSelectWord1_c = "Vaginal"
	TagSelectWord2_c = "Doggystyle"
	TagSelectWord3_c = "Holding"
	TagSelectWord4_c = "Hugging"
	TagSelectWord5_c = "Anal"
	TagSelectWord6_c = "Missionary"
	TagSelectWord7_c = "Oral"
	TagSelectWord8_c = "Draugr"
	TagSelectWord9_c = "Gangbang"
	TagSelectWord10_c = "Rough"
	TagSelectWord11_c = "Troll"
	TagSelectWord12_c = "Panicforever"
	TagSelectWord13_c = "Fondling"
	TagSelectWord14_c = "Bestiality"
	TagSelectWord15_c = "Riekling"
	TagSelectWord16_c = "Falmer"
EndFunction
bool Function Setup()
	If Director.CheckSexLab()
		ResetData()
		If !Director.GetSexLab()
			return false
		else
			SexLab = Director.SexLab
			SSLversion = Director.SSLversion
			Config = Director.sslConfig
			AnimSlots = Director.AnimSlots
			AllowCreatures = Director.AllowCreatures
			CreatureSlots = Director.CreatureSlots
			isPlayerThreadActive = Director.isPlayerThreadActive
			If isPlayerThreadActive
				isPlayerThreadAggressive = Director.isPlayerThreadAggressive
				currentStage = Director.currentStage
				PlayerThreadAnimation = Director.PlayerThreadAnimation
			endIf
			If SexLab && Config
				return true
			else
				return false
			endif
		EndIf
	else
		return false
	endIf
endFunction
; ==============================================
Function ShowAnimationEditorMenu()
	If Setup()
		If(bMenuOpen)
			Return
		EndIf
		bMenuOpen = True
		AnimationEditor_Open(Self)
		While(bMenuOpen)
			WaitMenuMode(0.4)
		EndWhile
		AnimationEditor_Release(Self)
	else
		Director.log("ShowAnimationEditorMenu - Setup Error - SexLab is disable." , true)
		string msg = Director.GetTranslateMsg(Director.SexLab_Status)
		If (msg == "Error")
			Debug.MessageBox("[ AnimationMenu cannot open ! ]\n\nSexLab is not active.\n")
		else
			Debug.MessageBox("[ AnimationMenu cannot open ! ]\n\nSexLab " + msg + "\n")
		endif
	endIf
EndFunction
Function AnimationEditor_Open(Form akClient)
	akClient.RegisterForModEvent("AnimationEditorOpen", "OnAnimationEditorOpen")
	akClient.RegisterForModEvent("AnimationEditorClose", "OnAnimationEditorClose")
	akClient.RegisterForModEvent("EditEnabled", "OnEditStatus")
	akClient.RegisterForModEvent("EditLeadIn", "OnEditStatus")
	akClient.RegisterForModEvent("EditAggressive", "OnEditStatus")
	akClient.RegisterForModEvent("EditCreature", "OnEditStatus_c")
	akClient.RegisterForModEvent("SaveTagWord", "OnSaveTagWord")
	akClient.RegisterForModEvent("TagSearch", "OnTagSearch")
	akClient.RegisterForModEvent("TagSearch_c", "OnTagSearch")
	akClient.RegisterForModEvent("CheackDetail", "OnCheackDetail")
	akClient.RegisterForModEvent("SaveAnims", "OnSaveAnims")
	akClient.RegisterForModEvent("LoadAnims", "OnLoadAnims")
	UI.OpenCustomMenu("exported/obachan/SSLAnimationMenu", 0)
EndFunction
Function AnimationEditor_Release(Form akClient)
	akClient.UnregisterForModEvent("AnimationEditorOpen")
	akClient.UnregisterForModEvent("AnimationEditorClose")
	akClient.UnregisterForModEvent("EditEnabled")
	akClient.UnregisterForModEvent("EditLeadIn")
	akClient.UnregisterForModEvent("EditAggressive")
	akClient.UnregisterForModEvent("EditCreature")
	akClient.UnregisterForModEvent("SaveTagWord")
	akClient.UnregisterForModEvent("TagSearch")
	akClient.UnregisterForModEvent("TagSearch_c")
	akClient.UnregisterForModEvent("CheackDetail")
	akClient.UnregisterForModEvent("SaveAnims")
	akClient.UnregisterForModEvent("LoadAnims")
EndFunction
Event OnAnimationEditorOpen(String asEventName, String asStringArg, Float afNumArg, Form akSender)
	If(asEventName == "AnimationEditorOpen")
		GetAnimations()
		If SSLversion == 15903
			UI.InvokeInt("CustomMenu", "_root.SSLAnimationMenu.initMaxRegistered", 125)
		else
			UI.InvokeInt("CustomMenu", "_root.SSLAnimationMenu.initMaxRegistered", 350)
		endIf
		UI.InvokeInt("CustomMenu", "_root.SSLAnimationMenu.initPageCount", PageCount)
		UI.InvokeBool("CustomMenu", "_root.SSLAnimationMenu.initShowThumbnail", Director.ShowThumbnail)
		Int iHandle = UICallback.Create("CustomMenu", "_root.SSLAnimationMenu.initRegisteredCount")
		If(iHandle)
			If SSLversion == 15903
				UICallback.PushInt(iHandle, RegisteredCount)
				UICallback.PushInt(iHandle, 0)
				UICallback.PushInt(iHandle, 0)
				UICallback.PushString(iHandle, (RegisteredCount as String))
			else
				UICallback.PushInt(iHandle, Anim1.length)
				UICallback.PushInt(iHandle, Anim2.length)
				UICallback.PushInt(iHandle, Anim3.length)
				UICallback.PushString(iHandle, (RegisteredCount as String))
			endIf
			UICallback.Send(iHandle)
		EndIf
		Int iHandle2 = UICallback.Create("CustomMenu", "_root.SSLAnimationMenu.initTagWord")
		If(iHandle2)
			UICallback.PushString(iHandle2, TagWord1)
			UICallback.PushString(iHandle2, TagWord2)
			UICallback.PushString(iHandle2, TagWord3)
			UICallback.PushString(iHandle2, TagWord4)
			UICallback.Send(iHandle2)
		EndIf
		Int iHandle3 = UICallback.Create("CustomMenu", "_root.SSLAnimationMenu.initTagSelectWord")
		If(iHandle3)
			UICallback.PushString(iHandle3, TagSelectWord1)
			UICallback.PushString(iHandle3, TagSelectWord2)
			UICallback.PushString(iHandle3, TagSelectWord3)
			UICallback.PushString(iHandle3, TagSelectWord4)
			UICallback.PushString(iHandle3, TagSelectWord5)
			UICallback.PushString(iHandle3, TagSelectWord6)
			UICallback.PushString(iHandle3, TagSelectWord7)
			UICallback.PushString(iHandle3, TagSelectWord8)
			UICallback.PushString(iHandle3, TagSelectWord9)
			UICallback.PushString(iHandle3, TagSelectWord10)
			UICallback.PushString(iHandle3, TagSelectWord11)
			UICallback.PushString(iHandle3, TagSelectWord12)
			UICallback.PushString(iHandle3, TagSelectWord13)
			UICallback.PushString(iHandle3, TagSelectWord14)
			UICallback.PushString(iHandle3, TagSelectWord15)
			UICallback.PushString(iHandle3, TagSelectWord16)
			UICallback.Send(iHandle3)
		EndIf
		UI.InvokeStringA("CustomMenu", "_root.SSLAnimationMenu.initName1Data", Names1)
		UI.InvokeStringA("CustomMenu", "_root.SSLAnimationMenu.initName2Data", Names2)
		UI.InvokeStringA("CustomMenu", "_root.SSLAnimationMenu.initName3Data", Names3)
		UI.InvokeStringA("CustomMenu", "_root.SSLAnimationMenu.initRegistry1Data", Registry1)
		UI.InvokeStringA("CustomMenu", "_root.SSLAnimationMenu.initRegistry2Data", Registry2)
		UI.InvokeStringA("CustomMenu", "_root.SSLAnimationMenu.initRegistry3Data", Registry3)
		UI.InvokeBoolA("CustomMenu", "_root.SSLAnimationMenu.initEnabled1", Enabled1)
		UI.InvokeBoolA("CustomMenu", "_root.SSLAnimationMenu.initEnabled2", Enabled2)
		UI.InvokeBoolA("CustomMenu", "_root.SSLAnimationMenu.initEnabled3", Enabled3)
		UI.InvokeBoolA("CustomMenu", "_root.SSLAnimationMenu.initLeadIn1", LeadIn1)
		UI.InvokeBoolA("CustomMenu", "_root.SSLAnimationMenu.initLeadIn2", LeadIn2)
		UI.InvokeBoolA("CustomMenu", "_root.SSLAnimationMenu.initLeadIn3", LeadIn3)
		UI.InvokeBoolA("CustomMenu", "_root.SSLAnimationMenu.initAggressive1", Aggressive1)
		UI.InvokeBoolA("CustomMenu", "_root.SSLAnimationMenu.initAggressive2", Aggressive2)
		UI.InvokeBoolA("CustomMenu", "_root.SSLAnimationMenu.initAggressive3", Aggressive3)
		; Send Creature Data
		UI.InvokeInt("CustomMenu", "_root.SSLAnimationMenu.initPageCount_c", c_PageCount)
		If AllowCreatures
			Int iHandle_c = UICallback.Create("CustomMenu", "_root.SSLAnimationMenu.initRegisteredCount_c")
			If(iHandle_c)
				If SSLversion == 15903
					UICallback.PushInt(iHandle_c, c_RegisteredCount)
					UICallback.PushInt(iHandle_c, 0)
					UICallback.PushInt(iHandle_c, 0)
					UICallback.PushString(iHandle_c, (c_RegisteredCount as String))
				else
					UICallback.PushInt(iHandle_c, c_Anim1.length)
					UICallback.PushInt(iHandle_c, c_Anim2.length)
					UICallback.PushInt(iHandle_c, c_Anim3.length)
					UICallback.PushString(iHandle_c, (c_RegisteredCount as String))
				EndIf
				UICallback.Send(iHandle_c)
			EndIf
			Int iHandle3_c = UICallback.Create("CustomMenu", "_root.SSLAnimationMenu.initTagSelectWord_c")
			If(iHandle3_c)
				UICallback.PushString(iHandle3_c, TagSelectWord1_c)
				UICallback.PushString(iHandle3_c, TagSelectWord2_c)
				UICallback.PushString(iHandle3_c, TagSelectWord3_c)
				UICallback.PushString(iHandle3_c, TagSelectWord4_c)
				UICallback.PushString(iHandle3_c, TagSelectWord5_c)
				UICallback.PushString(iHandle3_c, TagSelectWord6_c)
				UICallback.PushString(iHandle3_c, TagSelectWord7_c)
				UICallback.PushString(iHandle3_c, TagSelectWord8_c)
				UICallback.PushString(iHandle3_c, TagSelectWord9_c)
				UICallback.PushString(iHandle3_c, TagSelectWord10_c)
				UICallback.PushString(iHandle3_c, TagSelectWord11_c)
				UICallback.PushString(iHandle3_c, TagSelectWord12_c)
				UICallback.PushString(iHandle3_c, TagSelectWord13_c)
				UICallback.PushString(iHandle3_c, TagSelectWord14_c)
				UICallback.PushString(iHandle3_c, TagSelectWord15_c)
				UICallback.PushString(iHandle3_c, TagSelectWord16_c)
				UICallback.Send(iHandle3_c)
			EndIf
			UI.InvokeStringA("CustomMenu", "_root.SSLAnimationMenu.initName1Data_c", c_Names1)
			UI.InvokeStringA("CustomMenu", "_root.SSLAnimationMenu.initName2Data_c", c_Names2)
			UI.InvokeStringA("CustomMenu", "_root.SSLAnimationMenu.initName3Data_c", c_Names3)
			UI.InvokeStringA("CustomMenu", "_root.SSLAnimationMenu.initRegistry1Data_c", c_Registry1)
			UI.InvokeStringA("CustomMenu", "_root.SSLAnimationMenu.initRegistry2Data_c", c_Registry2)
			UI.InvokeStringA("CustomMenu", "_root.SSLAnimationMenu.initRegistry3Data_c", c_Registry3)
			UI.InvokeBoolA("CustomMenu", "_root.SSLAnimationMenu.initEnabled1_c", c_Enabled1)
			UI.InvokeBoolA("CustomMenu", "_root.SSLAnimationMenu.initEnabled2_c", c_Enabled2)
			UI.InvokeBoolA("CustomMenu", "_root.SSLAnimationMenu.initEnabled3_c", c_Enabled3)
		endIf
		; Send Current Playing Animation Data
		If isPlayerThreadActive
			Bool hitOK = ParticularPlayingAnimation()
			Director.log("OnAnimationEditorOpen - SexLab is playing animation now. hitOK = " + hitOK)
		EndIf
	EndIf
EndEvent

Function SendPlayingData(int AnimSetNum, int AnimNum)
	Int iHandle = UICallback.Create("CustomMenu", "_root.SSLAnimationMenu.initPlayingAnimation")
	If(iHandle)
		UICallback.PushBool(iHandle, PlayerThreadAnimation.isCreature)
		UICallback.PushInt(iHandle, AnimSetNum)
		UICallback.PushInt(iHandle, AnimNum)
		UICallback.PushBool(iHandle, isPlayerThreadAggressive)
		UICallback.PushInt(iHandle, currentStage)
		UICallback.Send(iHandle)
	endIf
EndFunction

Bool Function ParticularPlayingAnimation()
	If PlayerThreadAnimation.isCreature
		int hit = getAnimNum(PlayerThreadAnimation, c_Anim1)
		If (hit != -1)
			SendPlayingData(1, hit)
			return true
		else
			If (c_Anim2.length > 0)
				hit = getAnimNum(PlayerThreadAnimation, c_Anim2)
				if (hit != -1)
					SendPlayingData(2, hit)
					return true
				else
					If (c_Anim3.length > 0)
						hit = getAnimNum(PlayerThreadAnimation, c_Anim3)
						if (hit != -1)
							SendPlayingData(3, hit)
							return true
						else
							return false
						endif
					else
						return false
					endif
				endif
			else
				return false
			endif
		endif
	else
		int hit = getAnimNum(PlayerThreadAnimation, Anim1)
		If (hit != -1)
			SendPlayingData(1, hit)
			return true
		else
			If (Anim2.length > 0)
				hit = getAnimNum(PlayerThreadAnimation, Anim2)
				if (hit != -1)
					SendPlayingData(2, hit)
					return true
				else
					If (Anim3.length > 0)
						hit = getAnimNum(PlayerThreadAnimation, Anim3)
						if (hit != -1)
							SendPlayingData(3, hit)
							return true
						else
							return false
						endif
					else
						return false
					endif
				endif
			else
				return false
			endif
		endif
	endIf
EndFunction

int Function getAnimNum(sslBaseAnimation a_anim, sslBaseAnimation[] Anims)
	If Anims.length > 0
		int len = 0
		while (len < Anims.length)
			if (Anims[len] == a_anim)
				return len
			endIf
			len += 1
		endWhile
		return -1
	else
		return -1
	endif
EndFunction

Function GetAnimations()
	If SSLversion >= 16002
		PageCount = AnimSlots.PageCount(perpage = 125)
		Anim1 = AnimSlots.GetSlots(page = 1)
		Anim2 = AnimSlots.GetSlots(page = 2)
		Anim3 = AnimSlots.GetSlots(page = 3)
		RegisteredCount = (Anim1.length + Anim2.length + Anim3.length)
		Names1 = GetNames(Anim1)
		Names2 = GetNames(Anim2)
		Names3 = GetNames(Anim3)
		Registry1 = GetRegistryNames(Anim1)
		Registry2 = GetRegistryNames(Anim2)
		Registry3 = GetRegistryNames(Anim3)
		Enabled1 = GetAnimationEnabled(Anim1)
		Enabled2 = GetAnimationEnabled(Anim2)
		Enabled3 = GetAnimationEnabled(Anim3)
		LeadIn1 = GetAnimationLeadIn(Anim1)
		LeadIn2 = GetAnimationLeadIn(Anim2)
		LeadIn3 = GetAnimationLeadIn(Anim3)
		Aggressive1 = GetAnimationAggressive(Anim1)
		Aggressive2 = GetAnimationAggressive(Anim2)
		Aggressive3 = GetAnimationAggressive(Anim3)
		If AllowCreatures
			c_PageCount = CreatureSlots.PageCount(perpage = 125)
			c_Anim1 = CreatureSlots.GetSlots(page = 1)
			c_Anim2 = CreatureSlots.GetSlots(page = 2)
			c_Anim3 = CreatureSlots.GetSlots(page = 3)
			c_RegisteredCount = (c_Anim1.length + c_Anim2.length + c_Anim3.length)
			c_Names1 = GetNames(c_Anim1)
			c_Names2 = GetNames(c_Anim2)
			c_Names3 = GetNames(c_Anim3)
			c_Registry1 = GetRegistryNames(c_Anim1)
			c_Registry2 = GetRegistryNames(c_Anim2)
			c_Registry3 = GetRegistryNames(c_Anim3)
			c_Enabled1 = GetAnimationEnabled(c_Anim1)
			c_Enabled2 = GetAnimationEnabled(c_Anim2)
			c_Enabled3 = GetAnimationEnabled(c_Anim3)
		endif
	elseif SSLversion == 15903 ; ver 1.59c
		PageCount = 1
		Anim1 = AnimSlots.Animations
		RegisteredCount = AnimSlots.Slotted
		Names1 = GetNames(Anim1)
		Registry1 = GetRegistryNames(Anim1)
		Enabled1 = GetAnimationEnabled(Anim1)
		LeadIn1 = GetAnimationLeadIn(Anim1)
		Aggressive1 = GetAnimationAggressive(Anim1)
		c_PageCount = 0
		If AllowCreatures
			c_PageCount = 1
			c_Anim1 = CreatureSlots.Animations
			c_RegisteredCount = CreatureSlots.Slotted
			c_Names1 = GetNames(c_Anim1)
			c_Registry1 = GetRegistryNames(c_Anim1)
			c_Enabled1 = GetAnimationEnabled(c_Anim1)
		endif
	else
		debug.trace("@ [SexLab AnimationMenu] GetAnimations Error - SexLab do not install.")
	endIf
EndFunction
string[] function GetNames(sslBaseAnimation[] SlotList)
	int i
	If SSLversion == 15903
		If SlotList == c_Anim1
			i = c_RegisteredCount
		else
			i = RegisteredCount
		endIf
	else
		i = SlotList.Length
	endIf
	string[] Names = CreateStringArray(i)
	while i
		i -= 1
		if SlotList[i]
			Names[i] = SlotList[i].Name
		endIf
	endWhile
	return Names
endFunction
string[] function GetRegistryNames(sslBaseAnimation[] SlotList)
	int i
	If SSLversion == 15903
		If SlotList == c_Anim1
			i = c_RegisteredCount
		else
			i = RegisteredCount
		endIf
	else
		i = SlotList.Length
	endIf
	string[] Names = CreateStringArray(i)
	while i
		i -= 1
		if SlotList[i]
			Names[i] = SlotList[i].Registry
		endIf
	endWhile
	return Names
endFunction
Bool[] Function GetAnimationEnabled(sslBaseAnimation[] Anims)
	int len
	If SSLversion == 15903
		If Anims == c_Anim1
			len = c_RegisteredCount
		else
			len = RegisteredCount
		endIf
	else
		len = Anims.Length
	endIf
	Bool[] Enabled = CreateBoolArray(len, false)
	int i = 0
	While(i < len)
		If Anims[i]
			Enabled[i] = Anims[i].Enabled
		else
			Enabled[i] = false
		EndIf
		i = i +1
	EndWhile
	return Enabled
EndFunction
Bool[] Function GetAnimationLeadIn(sslBaseAnimation[] Anims)
	int len
	If SSLversion == 15903
		If Anims == c_Anim1
			len = c_RegisteredCount
		else
			len = RegisteredCount
		endIf
	else
		len = Anims.Length
	endIf
	Bool[] LeadIn = CreateBoolArray(len, false)
	int i = 0
	While(i < len)
		If Anims[i]
			LeadIn[i] = Anims[i].HasTag("LeadIn")
		else
			LeadIn[i] = false
		EndIf
		i = i +1
	EndWhile
	return LeadIn
EndFunction

Bool[] Function GetAnimationAggressive(sslBaseAnimation[] Anims)
	int len
	If SSLversion == 15903
		If Anims == c_Anim1
			len = c_RegisteredCount
		else
			len = RegisteredCount
		endIf
	else
		len = Anims.Length
	endIf
	Bool[] Aggressive = CreateBoolArray(len, false)
	int i = 0
	While(i < len)
		If Anims[i]
			Aggressive[i] = Anims[i].HasTag("Aggressive")
		else
			Aggressive[i] = false
		EndIf
		i = i +1
	EndWhile
	return Aggressive
EndFunction

Event OnEditStatus(String asEventName, String asStringArg, Float afNumArg, Form akSender)
	sslBaseAnimation[] Anims
	If (afNumArg == 1)
		Anims = Anim1
	elseIf (afNumArg == 2)
		Anims = Anim2
	elseIf (afNumArg ==3)
		Anims = Anim3
	endIf
	string[] EditStatus
	int len
	If (SSLversion == 15903)
		EditStatus = sslUtility.ArgString(asStringArg)
		len = RegisteredCount
	elseif (SSLversion >= 16002)
		EditStatus = PapyrusUtil.StringSplit(asStringArg)
		len = Anims.length
	endIf
	If (len != EditStatus.length)
		Director.log("[OnEditStatus] Anims.length = " + len + " , EditStatus.length = " + EditStatus.length + ", don't match !!")
	else
		int i = 0
		While (i < len)
			If (EditStatus[i] == "true")
				If (asEventName == "EditEnabled")
					Anims[i].Enabled = true
				elseIf (asEventName == "EditLeadIn")
					Anims[i].AddTag("LeadIn")
				elseIf (asEventName == "EditAggressive")
					Anims[i].AddTag("Aggressive")
				endif
			else
				If (asEventName == "EditEnabled")
					Anims[i].Enabled = false
				elseIf (asEventName == "EditLeadIn")
					Anims[i].RemoveTag("LeadIn")
				elseIf (asEventName == "EditAggressive")
					Anims[i].RemoveTag("Aggressive")
				endif
			endIf
			i = i +1
		EndWhile
	endif
	; Send editing finished to UI
	Int iHandle = UICallback.Create("CustomMenu", "_root.SSLAnimationMenu.initFinishEdit")
	If(iHandle)
		UICallback.PushString(iHandle, asEventName)
		UICallback.PushFloat(iHandle, afNumArg)
		UICallback.Send(iHandle)
	EndIf
EndEvent
Event OnEditStatus_c(String asEventName, String asStringArg, Float afNumArg, Form akSender)
	sslBaseAnimation[] Anims
	If (afNumArg == 1)
		Anims = c_Anim1
	elseIf (afNumArg == 2)
		Anims = c_Anim2
	elseIf (afNumArg ==3)
		Anims = c_Anim3
	endIf
	string[] EditStatus
	int len
	If (SSLversion == 15903)
		EditStatus = sslUtility.ArgString(asStringArg)
		len = c_RegisteredCount
	elseif (SSLversion >= 16001)
		EditStatus = PapyrusUtil.StringSplit(asStringArg)
		len = Anims.length
	endIf
	If (len != EditStatus.length)
		Director.log("[OnEditStatus_c] Anims.length = " + len + " , EditStatus.length = " + EditStatus.length + ", don't match !!")
	else
		int i = 0
		While (i < len)
			If (EditStatus[i] == "true")
				Anims[i].Enabled = true
			else
				Anims[i].Enabled = false
			endif
			i = i +1
		EndWhile
	endif
	; Send editing finished to UI
	Int iHandle = UICallback.Create("CustomMenu", "_root.SSLAnimationMenu.initFinishEdit")
	If(iHandle)
		UICallback.PushString(iHandle, asEventName)
		UICallback.PushFloat(iHandle, afNumArg)
		UICallback.Send(iHandle)
	EndIf
EndEvent

Event OnSaveTagWord(String asEventName, String asStringArg, Float afNumArg, Form akSender)
	If(asEventName == "SaveTagWord")
		If (afNumArg == 1)
			TagWord1 = asStringArg
		elseif (afNumArg == 2)
			TagWord2 = asStringArg
		elseif (afNumArg == 3)
			TagWord3 = asStringArg
		elseif (afNumArg == 4)
			TagWord4 = asStringArg
		EndIf
	endIf
EndEvent

Event OnTagSearch(String asEventName, String asStringArg, Float afNumArg, Form akSender)
	Bool[] Tags
	Bool[] Tags2
	Bool[] Tags3
	If(asEventName == "TagSearch")
		If SSLversion == 15903
			If RegisteredCount > 0
				Tags = GetAnimationTag(Anim1, asStringArg)
				UI.InvokeBoolA("CustomMenu", "_root.SSLAnimationMenu.initTagBool", Tags)
			endIf
		else
			If (Anim1.length > 0)
				Tags = GetAnimationTag(Anim1, asStringArg)
				UI.InvokeBoolA("CustomMenu", "_root.SSLAnimationMenu.initTagBool", Tags)
			endIf
			If (Anim2.length > 0)
				Tags2 = GetAnimationTag(Anim2, asStringArg)
				UI.InvokeBoolA("CustomMenu", "_root.SSLAnimationMenu.initTagBool2", Tags2)
			endIf
			If (Anim3.length > 0)
				Tags3 = GetAnimationTag(Anim3, asStringArg)
				UI.InvokeBoolA("CustomMenu", "_root.SSLAnimationMenu.initTagBool3", Tags3)
			endIf
		EndIf
	elseif (asEventName == "TagSearch_c")
		If SSLversion == 15903
			If c_RegisteredCount > 0
				Tags = GetAnimationTag(c_Anim1, asStringArg)
				UI.InvokeBoolA("CustomMenu", "_root.SSLAnimationMenu.initTagBool_c", Tags)
			endIf
		else
			If (c_Anim1.length > 0)
				Tags = GetAnimationTag(c_Anim1, asStringArg)
				UI.InvokeBoolA("CustomMenu", "_root.SSLAnimationMenu.initTagBool_c", Tags)
			endIf
			If (c_Anim2.length > 0)
				Tags2 = GetAnimationTag(c_Anim2, asStringArg)
				UI.InvokeBoolA("CustomMenu", "_root.SSLAnimationMenu.initTagBool2_c", Tags2)
			endIf
			If (c_Anim3.length > 0)
				Tags3 = GetAnimationTag(c_Anim3, asStringArg)
				UI.InvokeBoolA("CustomMenu", "_root.SSLAnimationMenu.initTagBool3_c", Tags3)
			endIf
		EndIf
	endIf
EndEvent
Bool[] Function GetAnimationTag(sslBaseAnimation[] Anims, string a_tag)
	int len
	If SSLversion == 15903
		If Anims == c_Anim1
			len = c_RegisteredCount
		else
			len = RegisteredCount
		endIf
	else
		len = Anims.Length
	endIf
	Bool[] TagBools = CreateBoolArray(len, false)
	int i = 0
	While(i < len)
		TagBools[i] = Anims[i].HasTag(a_tag)
		i = i +1
	EndWhile
	return TagBools
EndFunction

Event OnCheackDetail(String asEventName, String asStringArg, Float afNumArg, Form akSender)
	sslBaseAnimation[] Anims
	If (asStringArg == "Anim3")
		Anims = Anim3
	elseif (asStringArg == "Anim2")
		Anims = Anim2
	elseif (asStringArg == "Anim1")
		Anims = Anim1
	elseif (asStringArg == "c_Anim3")
		Anims = c_Anim3
	elseif (asStringArg == "c_Anim2")
		Anims = c_Anim2
	elseif (asStringArg == "c_Anim1")
		Anims = c_Anim1
	EndIf
	String[] tags = Anims[(afNumArg as int)].GetTags()
	int male = Anims[(afNumArg as int)].Males
	int female = Anims[(afNumArg as int)].Females
	int c_male
	int c_female
	If SSLversion == 15903
		c_male = Anims[(afNumArg as int)].Creatures
		c_female = 0
	elseif SSLversion >= 16002
		c_male = Anims[(afNumArg as int)].MaleCreatures
		c_female = Anims[(afNumArg as int)].FemaleCreatures
	endif
	int stage = Anims[(afNumArg as int)].StageCount()
	Int iHandle = UICallback.Create("CustomMenu", "_root.SSLAnimationMenu.initDetailData")
	If(iHandle)
		UICallback.PushInt(iHandle, stage)
		UICallback.PushInt(iHandle, male)
		UICallback.PushInt(iHandle, female)
		UICallback.PushInt(iHandle, c_male)
		UICallback.PushInt(iHandle, c_female)
		UICallback.Send(iHandle)
	EndIf
	UI.InvokeStringA("CustomMenu", "_root.SSLAnimationMenu.initDetailTags", tags)
EndEvent
Event OnAnimationEditorClose(String asEventName, String asInput, Float afCancelled, Form akSender)
	If(asEventName == "AnimationEditorClose")
		bMenuOpen = False
		If UI.IsMenuOpen("Journal Menu")
			DirectorMCM.ForcePageReset()
		EndIf
	EndIf
EndEvent

; secret my command
Event OnSaveAnims(String asEventName, String asStringArg, Float afNumArg, Form akSender)
	string[] emptyStrings
	If afNumArg == 1 ; Human Animation select save
		SaveAnimsArray1 = emptyStrings
		If (SSLversion == 15903)
			SaveAnimsArray1 = sslUtility.ArgString(asStringArg)
		elseif (SSLversion >= 16002)
			SaveAnimsArray1 = PapyrusUtil.StringSplit(asStringArg)
		endIf
		SaveAnimCount1 = SaveAnimsArray1.length
	elseif afNumArg == 2 ; Creature Animation select save
		SaveAnimsArray2 = emptyStrings
		If (SSLversion == 15903)
			SaveAnimsArray2 = sslUtility.ArgString(asStringArg)
		elseif (SSLversion >= 16002)
			SaveAnimsArray2 = PapyrusUtil.StringSplit(asStringArg)
		endIf
		SaveAnimCount2 = SaveAnimsArray2.length
	elseif afNumArg == 3 ; save date
		Director.SaveTimeString1 = asStringArg
	elseif afNumArg == 4 ; save date
		Director.SaveTimeString2 = asStringArg
	endif
EndEvent
Event OnLoadAnims(String asEventName, String asStringArg, Float afNumArg, Form akSender)
	If afNumArg == 1
		UI.InvokeStringA("CustomMenu", "_root.SSLAnimationMenu.initLoadAnims", SaveAnimsArray1)
	elseif afNumArg == 2
		UI.InvokeStringA("CustomMenu", "_root.SSLAnimationMenu.initLoadAnims", SaveAnimsArray2)
	endIf
EndEvent
