/*エディット周りの色やテキスト設定（Enabled・LeadIn・Aggressive）*/
private function setEditColor(a_edit: String){
	var color_edit: Number;
	var name_edit: String;
	if (a_edit == "Enabled"){
		color_edit = 0xFFFFFF;
		name_edit = "Enabled";
		plus = Edit_Enabled.plus;
		minus = Edit_Enabled.minus;
		EditCount = Edit_Enabled.EditCount;
		EditName = Edit_Enabled.EditName;
	} else if (a_edit == "LeadIn"){
		color_edit = 0x00A0E9;
		name_edit = "LeadIn";
		plus = Edit_LeadIn.plus;
		minus = Edit_LeadIn.minus;
		EditCount = Edit_LeadIn.EditCount;
		EditName = Edit_LeadIn.EditName;
	} else if (a_edit == "Aggressive"){
		color_edit = 0xFF0000;
		name_edit = "Aggressive";
		plus = Edit_Aggressive.plus;
		minus = Edit_Aggressive.minus;
		EditCount = Edit_Aggressive.EditCount;
		EditName = Edit_Aggressive.EditName;
	} else if (a_edit == "disable_LeadIn"){
		color_edit = 0x333333;
		name_edit = "unknown";
		plus = Edit_LeadIn.plus;
		minus = Edit_LeadIn.minus;
		EditCount = Edit_LeadIn.EditCount;
		EditName = Edit_LeadIn.EditName;
	} else if (a_edit == "disable_Aggressive"){
		color_edit = 0x333333;
		name_edit = "unknown";
		plus = Edit_Aggressive.plus;
		minus = Edit_Aggressive.minus;
		EditCount = Edit_Aggressive.EditCount;
		EditName = Edit_Aggressive.EditName;
	}
	var color_transform : ColorTransform = new ColorTransform();
	color_transform.rgb = color_edit;
	plus.transform.colorTransform = color_transform;
	minus.transform.colorTransform = color_transform;
	EditCount.textColor = color_edit;
	EditName.textColor = color_edit;
	EditName.textAutoSize = "shrink";
	EditName.text = name_edit;
}
/* 現在のページと連番表示の変更*/
private function setSlotNum(a_page: Number): Void{
	CurrentPage = a_page;
	if (CurrentPage == 3) {
		for (var i=0; i<125; i++) {
			var iplus = i + 251;
			var numString: String;
			if (iplus < 351) {
				numString = iplus;
			} else {
				numString = "";
			}
			NumTexts[i].text = numString;
		}
	} else if (CurrentPage == 2) {
		for (var i=0; i<125; i++) {
			var iplus = i + 126;
			NumTexts[i].text = iplus;
		}
	} else{
		for (var i=0; i<125; i++) {
			var iplus = i + 1;
			var numString: String;
			if (iplus < 10) {
				numString = "00" + iplus;
			} else if (iplus < 100){
				numString = "0" + iplus;
			} else {
				numString = iplus;
			}
			NumTexts[i].text = numString;
		}
	}
}
/*各エディットアイコンの表示・非表示*/
private function displayIcon(a_ic: String): Void{
	if (a_ic == "Enabled"){
		var EnabledArray: Array;
		if (isCreature == true){
			if (CurrentPage == 3){
				EnabledArray = c_EnabledArray1;
			} else if (CurrentPage == 2){
				EnabledArray = c_EnabledArray2;
			} else {
				EnabledArray = c_EnabledArray1;
			}
		} else {
			if (CurrentPage == 3){
				EnabledArray = EnabledArray1;
			} else if (CurrentPage == 2){
				EnabledArray = EnabledArray2;
			} else {
				EnabledArray = EnabledArray1;
			}
		}
		for (var i=0; i<125; i++) {
			if (EnabledArray[i] == true){
				IconEnabledArray[i].gotoAndStop("on");
			} else {
				IconEnabledArray[i].gotoAndStop("off");
			}
		}
	} else if (a_ic == "LeadIn"){
		var LeadInArray: Array;
		if (isCreature == true){
		} else {
			if (CurrentPage == 3){
				LeadInArray = LeadInArray1;
			} else if (CurrentPage == 2){
				LeadInArray = LeadInArray2;
			} else {
				LeadInArray = LeadInArray1;
			}
		}
		for (var i=0; i<125; i++) {
			if (LeadInArray[i] == true){
				IconLeadInArray[i].gotoAndStop("on");
			} else {
				IconLeadInArray[i].gotoAndStop("off");
			}
		}
	} else if (a_ic == "Aggressive"){
		var AggressiveArray: Array;
		if (isCreature == true){
		} else {
			if (CurrentPage == 3){
				AggressiveArray = AggressiveArray1;
			} else if (CurrentPage == 2){
				AggressiveArray = AggressiveArray2;
			} else {
				AggressiveArray = AggressiveArray1;
			}
		}
		for (var i=0; i<125; i++) {
			if (AggressiveArray[i] == true){
				IconAggressiveArray[i].gotoAndStop("on");
			} else {
				IconAggressiveArray[i].gotoAndStop("off");
			}
		}
	}
}
/*各エディットのカウント数*/
private function displayEditCount(a_edit: String): Void{
	var EditCount: Number = 0;
	if (isCreature == true){
		if (a_edit == "Enabled"){
			for (var i=0; i<c_EnabledArray1.length; i++) {
				if (c_EnabledArray1[i] == true){
					EditCount = EditCount + 1;
				}
			}
			for (var i=0; i<c_EnabledArray2.length; i++) {
				if (c_EnabledArray2[i] == true){
					EditCount = EditCount + 1;
				}
			}
			for (var i=0; i<c_EnabledArray3.length; i++) {
				if (c_EnabledArray3[i] == true){
					EditCount = EditCount + 1;
				}
			}
			Edit_Enabled.EditCount.text = EditCount;
		} else if (a_edit == "LeadIn"){
			Edit_LeadIn.EditCount.text = 0;
		} else if (a_edit == "Aggressive"){
			Edit_Aggressive.EditCount.text = 0;
		}
	} else {
		if (a_edit == "Enabled"){
			for (var i=0; i<EnabledArray1.length; i++) {
				if (EnabledArray1[i] == true){
					EditCount = EditCount + 1;
				}
			}
			for (var i=0; i<EnabledArray2.length; i++) {
				if (EnabledArray2[i] == true){
					EditCount = EditCount + 1;
				}
			}
			for (var i=0; i<EnabledArray3.length; i++) {
				if (EnabledArray3[i] == true){
					EditCount = EditCount + 1;
				}
			}
			Edit_Enabled.EditCount.text = EditCount;
		} else if (a_edit == "LeadIn"){
			for (var i=0; i<LeadInArray1.length; i++) {
				if (LeadInArray1[i] == true){
					EditCount = EditCount + 1;
				}
			}
			for (var i=0; i<LeadInArray2.length; i++) {
				if (LeadInArray2[i] == true){
					EditCount = EditCount + 1;
				}
			}
			for (var i=0; i<LeadInArray3.length; i++) {
				if (LeadInArray3[i] == true){
					EditCount = EditCount + 1;
				}
			}
			Edit_LeadIn.EditCount.text = EditCount;
		} else if (a_edit == "Aggressive"){
			for (var i=0; i<AggressiveArray1.length; i++) {
				if (AggressiveArray1[i] == true){
					EditCount = EditCount + 1;
				}
			}
			for (var i=0; i<AggressiveArray2.length; i++) {
				if (AggressiveArray2[i] == true){
					EditCount = EditCount + 1;
				}
			}
			for (var i=0; i<AggressiveArray3.length; i++) {
				if (AggressiveArray3[i] == true){
					EditCount = EditCount + 1;
				}
			}
			Edit_Aggressive.EditCount.text = EditCount;
		}
	}
}
/*アニメーション名の表示（空欄の不可視化も含む）*/
private function displayNameData(a_page: Number): Void{
	// すべてのスロットを表示
	for (var i=0; i<125; i++) {
		SelectButtonArray[i]._visible = true;
		SlotsArray[i]._visible = true;
		detailButtonArray[i]._visible = true;
	}
	var len: Number;
	var Names: Array;
	if (isCreature == true){
		if (a_page == 3){
			len = c_RegisterCount3;
			Names = c_AnimationNames3;
		} else if(a_page == 2){
			len = c_RegisterCount2;
			Names = c_AnimationNames2;
		} else {
			len = c_RegisterCount1;
			Names = c_AnimationNames1;
		}
	} else {
		if (a_page == 3){
			len = RegisterCount3;
			Names = AnimationNames3;
		} else if(a_page == 2){
			len = RegisterCount2;
			Names = AnimationNames2;
		} else {
			len = RegisterCount1;
			Names = AnimationNames1;
		}
	}
	// 空欄は非表示
	if (len < 125){
		for (var i=len; i<125; i++) {
			SelectButtonArray[i]._visible = false;
			SlotsArray[i]._visible = false;
			detailButtonArray[i]._visible = false;
		}
	}
	if (len != Names.length){
		skse.SendModEvent("UIlog", "displayNameData - レジスト数とアニメーション名の個数が不一致です");
	}
	for (var i=0; i<len; i++) {
		if (Names[i]) {
			if (Names[i].length > 27){
//				skse.SendModEvent("UIlog", "Names[" + i + "] は文字数オーバーです");
				var short: String = Names[i].substr(0, 25);
				short = short + " ...";
				AnimationNameTexts[i].text = short;
			} else {
				AnimationNameTexts[i].text = Names[i];
			}
		}
	}
}
