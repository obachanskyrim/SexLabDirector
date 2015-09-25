ScriptName DirectorUtil hidden

int function GetVersion() global
	return 101 ; 2015.9.25 v1.01
	return 10 ; 2015.9.19 v1.0
endFunction

string function GetStringVer() global
	return "1.01"
endFunction

bool function DirectorIsActive() global
	return GetAPI() != none
endFunction

SSLDirector_Controller function GetAPI() global
	Quest DirectorMainQuest = Game.GetFormFromFile(0xD62, "SexLabDirector.esp") as Quest
	If DirectorMainQuest
		return DirectorMainQuest as SSLDirector_Controller
	else
		return none
	endIf
endFunction
