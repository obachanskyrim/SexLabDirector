ScriptName DirectorUtil hidden

int function GetVersion() global
	return 10 ; 2015.9.19 v1.0
endFunction

string function GetStringVer() global
	return "1.0"
endFunction

bool function DirectorIsActive() global
	return GetAPI() != none
endFunction

SSLDirector_Controller function GetAPI() global
	return Game.GetFormFromFile(0xD62, "SexLabDirector.esp") as SSLDirector_Controller
endFunction
