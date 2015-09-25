/*タグ編集*/
private function onBP_tagedit1(): Void{
	TagEditMode = 1;
	if (isCreature == true){
		textInput.text = TagWord3;
	} else {
		textInput.text = TagWord1;
	}
	gfx.managers.FocusHandler.instance.setFocus(btn_tagword1, 0);
	PlaySound("MenuOpen");
	skse.AllowTextInput(true);
	TagInput._visible = true;
	hideButtons();
}
private function onBP_tagedit2(): Void{
	TagEditMode = 2;
	if (isCreature == true){
		textInput.text = TagWord4;
	} else {
		textInput.text = TagWord2;
	}
	gfx.managers.FocusHandler.instance.setFocus(btn_tagword1, 0);
	PlaySound("MenuOpen");
	skse.AllowTextInput(true);
	TagInput._visible = true;
	hideButtons();
}
private function onBP_taginput_ok(): Void{
	if (TagEditMode == 1){
		if (isCreature == true){
			TagWord3 = textInput.text;
			tag3.TagName.text = TagWord3;
		} else {
			TagWord1 = textInput.text;
			tag3.TagName.text = TagWord1;
		}
	} else if (TagEditMode == 2){
		if (isCreature == true){
			TagWord4 = textInput.text;
			tag4.TagName.text = TagWord4;
		} else {
			TagWord2 = textInput.text;
			tag4.TagName.text = TagWord2;
		}
	}
	PlaySound("MenuOpen");
	skse.AllowTextInput(false);
	TagInput._visible = false;
	showButtons();
}
private function onBP_taginput_cancel(): Void{
	PlaySound("MenuOpen");
	skse.AllowTextInput(false);
	TagInput._visible = false;
	showButtons();
}
private function onBP_tagword1(): Void{
	if (isCreature == true){
		textInput.text = c_TagSelectWord1;
	} else {
		textInput.text = TagSelectWord1;
	}
	PlaySound("select");
	btn_tagword1.gotoAndStop("up");
}
private function onBP_tagword2(): Void{
	if (isCreature == true){
		textInput.text = c_TagSelectWord2;
	} else {
		textInput.text = TagSelectWord2;
	}
	PlaySound("select");
	btn_tagword2.gotoAndStop("up");
}
private function onBP_tagword3(): Void{
	if (isCreature == true){
		textInput.text = c_TagSelectWord3;
	} else {
		textInput.text = TagSelectWord3;
	}
	PlaySound("select");
	btn_tagword2.gotoAndStop("up");
}
private function onBP_tagword4(): Void{
	if (isCreature == true){
		textInput.text = c_TagSelectWord4;
	} else {
		textInput.text = TagSelectWord4;
	}
	PlaySound("select");
	btn_tagword2.gotoAndStop("up");
}
private function onBP_tagword5(): Void{
	if (isCreature == true){
		textInput.text = c_TagSelectWord5;
	} else {
		textInput.text = TagSelectWord5;
	}
	PlaySound("select");
	btn_tagword2.gotoAndStop("up");
}
private function onBP_tagword6(): Void{
	if (isCreature == true){
		textInput.text = c_TagSelectWord6;
	} else {
		textInput.text = TagSelectWord6;
	}
	PlaySound("select");
	btn_tagword2.gotoAndStop("up");
}
private function onBP_tagword7(): Void{
	if (isCreature == true){
		textInput.text = c_TagSelectWord7;
	} else {
		textInput.text = TagSelectWord7;
	}
	PlaySound("select");
	btn_tagword2.gotoAndStop("up");
}
private function onBP_tagword8(): Void{
	if (isCreature == true){
		textInput.text = c_TagSelectWord8;
	} else {
		textInput.text = TagSelectWord8;
	}
	PlaySound("select");
	btn_tagword2.gotoAndStop("up");
}
private function onBP_tagword9(): Void{
	if (isCreature == true){
		textInput.text = c_TagSelectWord9;
	} else {
		textInput.text = TagSelectWord9;
	}
	PlaySound("select");
	btn_tagword2.gotoAndStop("up");
}
private function onBP_tagword10(): Void{
	if (isCreature == true){
		textInput.text = c_TagSelectWord10;
	} else {
		textInput.text = TagSelectWord10;
	}
	PlaySound("select");
	btn_tagword2.gotoAndStop("up");
}
private function onBP_tagword11(): Void{
	if (isCreature == true){
		textInput.text = c_TagSelectWord11;
	} else {
		textInput.text = TagSelectWord11;
	}
	PlaySound("select");
	btn_tagword2.gotoAndStop("up");
}
private function onBP_tagword12(): Void{
	if (isCreature == true){
		textInput.text = c_TagSelectWord12;
	} else {
		textInput.text = TagSelectWord12;
	}
	PlaySound("select");
	btn_tagword2.gotoAndStop("up");
}
private function onBP_tagword13(): Void{
	if (isCreature == true){
		textInput.text = c_TagSelectWord13;
	} else {
		textInput.text = TagSelectWord13;
	}
	PlaySound("select");
	btn_tagword2.gotoAndStop("up");
}
private function onBP_tagword14(): Void{
	if (isCreature == true){
		textInput.text = c_TagSelectWord14;
	} else {
		textInput.text = TagSelectWord14;
	}
	PlaySound("select");
	btn_tagword2.gotoAndStop("up");
}
private function onBP_tagword15(): Void{
	if (isCreature == true){
		textInput.text = c_TagSelectWord15;
	} else {
		textInput.text = TagSelectWord15;
	}
	PlaySound("select");
	btn_tagword2.gotoAndStop("up");
}
private function onBP_tagword16(): Void{
	if (isCreature == true){
		textInput.text = c_TagSelectWord16;
	} else {
		textInput.text = TagSelectWord16;
	}
	PlaySound("select");
	btn_tagword2.gotoAndStop("up");
}
private function hideButtons(): Void{
	for (var i=0; i<125; i++) {
		SelectButtonArray[i]._visible = false;
	}
}
private function showButtons(): Void{
	var showmax: Number;
	if (isCreature == true){
		if (CurrentPage == 1){
			showmax = c_RegisterCount1;
		} else if (CurrentPage == 2){
			showmax = c_RegisterCount2;
		} else if (CurrentPage == 3){
			showmax = c_RegisterCount3;
		}
	} else {
		if (CurrentPage == 1){
			showmax = RegisterCount1;
		} else if (CurrentPage == 2){
			showmax = RegisterCount2;
		} else if (CurrentPage == 3){
			showmax = RegisterCount3;
		}
	}
	for (var i=0; i<showmax; i++) {
		SelectButtonArray[i]._visible = true;
	}
}