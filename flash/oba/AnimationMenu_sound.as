/*サウンド*/
private function PlaySound(a_sd: String): Void{
	if (a_sd == "plus"){
		GameDelegate.call("PlaySound", ["UIShoutLearnSingle"]);
	} else if (a_sd == "minus"){
		GameDelegate.call("PlaySound", ["UIObjectiveNew"]);
	} else if (a_sd == "default"){
		GameDelegate.call("PlaySound", ["UISelectOff"]);
	} else if (a_sd == "select"){
		GameDelegate.call("PlaySound", ["UISelectOn"]);
	} else if (a_sd == "AllSelect"){
		GameDelegate.call("PlaySound", ["UIEnchantingItemCreate"]);
	} else if (a_sd == "AllDefault"){
		GameDelegate.call("PlaySound", ["UIEnchantingItemDestroy"]);
	} else if (a_sd == "MenuEnd"){
		GameDelegate.call("PlaySound", ["UIStartNewGame"]);
	} else if (a_sd == "MenuOpen"){
		GameDelegate.call("PlaySound", ["UIJournalOpen"]);
	} else if (a_sd == "Button"){
		GameDelegate.call("PlaySound", ["UIQuestActive"]);
	} else if (a_sd == "Fail"){
		GameDelegate.call("PlaySound", ["MAGFailShoutSD"]);
	} else if (a_sd == "Tag"){
		GameDelegate.call("PlaySound", ["UIAlchemyLearnEffect"]);
	} else if (a_sd == "MagFail"){
		GameDelegate.call("PlaySound", ["MAGFailSD"]);
	} else if (a_sd == "CloakIn"){
		GameDelegate.call("PlaySound", ["MAGCloakInSD"]);
	} else if (a_sd == "Flesh"){
		GameDelegate.call("PlaySound", ["MAGAlterationIronFleshFireSD"]);
	}
}
