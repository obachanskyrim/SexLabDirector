ScriptName SSLDirector_HUD Extends Quest

Function TranslateMsg(String asMessage)
	If(!HUD_Prepare())
		Return
	EndIf
	UI.InvokeString("HUD Menu", "_root.HUDMovieBaseInstance.DirectorHUD_container.DirectorHUD.TranslateMsg", asMessage)
EndFunction

Function ShowMessage(String asMessage, String asColor = "#FFFFFF")
	If(!HUD_Prepare())
		Return
	EndIf
	Int iHandle = UICallback.Create("HUD Menu", "_root.HUDMovieBaseInstance.DirectorHUD_container.DirectorHUD.ShowMessage")
	If(iHandle)
		UICallback.PushString(iHandle, asMessage)
		UICallback.PushString(iHandle, asColor)
		UICallback.Send(iHandle)
	EndIf
EndFunction

Bool Function HUD_Prepare() global
	Int iVersion = UI.GetInt("HUD Menu", "_global.oba.DirectorHUD.DirectorHUD_VERSION")
	If(iVersion == 0)
		Int iHandle = UICallback.Create("HUD Menu", "_root.HUDMovieBaseInstance.createEmptyMovieClip")
		If(!iHandle)
			Return False
		EndIf
		UICallback.PushString(iHandle, "DirectorHUD_container")
		UICallback.PushInt(iHandle, -999)
		If(!UICallback.Send(iHandle))
			Return False
		EndIf
		UI.InvokeString("HUD Menu", "_root.HUDMovieBaseInstance.DirectorHUD_container.loadMovie", "obachan/DirectorHUD.swf")
		Utility.Wait(0.5)
		iVersion = UI.GetInt("HUD Menu", "_global.oba.DirectorHUD.DirectorHUD_VERSION")
		If(iVersion == 0)
			UI.InvokeString("HUD Menu", "_root.HUDMovieBaseInstance.DirectorHUD_container.loadMovie", "exported/obachan/DirectorHUD.swf")
			Utility.Wait(0.5)
			iVersion = UI.GetInt("HUD Menu", "_global.oba.DirectorHUD.DirectorHUD_VERSION")
			If(iVersion == 0)
				Debug.Trace("@ DirectorHUD - HUDの割り込みに失敗しました")
				Return False
			EndIf
			UI.InvokeString("HUD Menu", "_root.HUDMovieBaseInstance.DirectorHUD_container.SetRootPath", "exported/")
		EndIf
	EndIf
	Return True
EndFunction

string Function GetHudversionVer()
	int ver = GetHUDversion()
	If ver == 10
		Return "v1.0 [OK]"
	else
		Return "DirectHUD cannot Load [Error]"
	endIf
EndFunction

int Function GetHUDversion()
	Int iVersion = 0
	iVersion = UI.GetInt("HUD Menu", "_global.oba.DirectorHUD.DirectorHUD_VERSION")
	If(iVersion == 0)
		Int iHandle = UICallback.Create("HUD Menu", "_root.HUDMovieBaseInstance.createEmptyMovieClip")
		If(!iHandle)
			Return iVersion
		EndIf
		UICallback.PushString(iHandle, "DirectorHUD_container")
		UICallback.PushInt(iHandle, -999)
		If(!UICallback.Send(iHandle))
			Return iVersion
		EndIf
		UI.InvokeString("HUD Menu", "_root.HUDMovieBaseInstance.DirectorHUD_container.loadMovie", "obachan/DirectorHUD.swf")
		Utility.Wait(0.5)
		iVersion = UI.GetInt("HUD Menu", "_global.oba.DirectorHUD.DirectorHUD_VERSION")
		If(iVersion == 0)
			UI.InvokeString("HUD Menu", "_root.HUDMovieBaseInstance.DirectorHUD_container.loadMovie", "exported/obachan/DirectorHUD.swf")
			Utility.Wait(0.5)
			iVersion = UI.GetInt("HUD Menu", "_global.oba.DirectorHUD.DirectorHUD_VERSION")
			If(iVersion == 0)
				Debug.Trace("@ DirectorHUD - HUDの割り込みに失敗しました")
			Return iVersion
			EndIf
			UI.InvokeString("HUD Menu", "_root.HUDMovieBaseInstance.DirectorHUD_container.SetRootPath", "exported/")
			Return iVersion
		else
			Return iVersion
		EndIf
	else
		Return iVersion
	EndIf
EndFunction
