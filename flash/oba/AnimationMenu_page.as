/*人間・クリーチャー切り替え*/
private function onBP_Human(): Void{
	isCreature = false;
	// 人間・クリーチャー切り替えボタンの表示変更
	Human_on._visible = true;
	Human._visible = false;
	Creature_on._visible = false;
	Creature._visible = true;
	// LeadIn・Aggressiveエディット復活
	setEditColor("LeadIn");
	setEditColor("Aggressive");
	btn_LeadIn_plus._visible = true;
	btn_LeadIn_minus._visible = true;
	btn_Aggressive_plus._visible = true;
	btn_Aggressive_minus._visible = true;

	// レジスト数・タグの表示切替
	CurrentRegistered.text = (RegisterCount1 + RegisterCount2 + RegisterCount3).toString();
	tag3.TagName.text = TagWord1;
	tag4.TagName.text = TagWord2;
	btn_tagword1.tagtext.text = TagSelectWord1;
	btn_tagword2.tagtext.text = TagSelectWord2;
	btn_tagword3.tagtext.text = TagSelectWord3;
	btn_tagword4.tagtext.text = TagSelectWord4;
	btn_tagword5.tagtext.text = TagSelectWord5;
	btn_tagword6.tagtext.text = TagSelectWord6;
	btn_tagword7.tagtext.text = TagSelectWord7;
	btn_tagword8.tagtext.text = TagSelectWord8;
	btn_tagword9.tagtext.text = TagSelectWord9;
	btn_tagword10.tagtext.text = TagSelectWord10;
	btn_tagword11.tagtext.text = TagSelectWord11;
	btn_tagword12.tagtext.text = TagSelectWord12;
	btn_tagword13.tagtext.text = TagSelectWord13;
	btn_tagword14.tagtext.text = TagSelectWord14;
	btn_tagword15.tagtext.text = TagSelectWord15;
	btn_tagword16.tagtext.text = TagSelectWord16;

	// 1ページ目の表示
	CurrentPageText.text = "1";
	setSlotNum(1);
	onBP_DeselectAll(); // 全選択解除
	displaySelect();
	displayNameData(1);
	displayIcon("Enabled");
	displayIcon("LeadIn");
	displayIcon("Aggressive");
	displayEditCount("Enabled");
	displayEditCount("LeadIn");
	displayEditCount("Aggressive");
	btn_prev._visible = false;
	if (RegisterCount2 > 0){
		btn_next._visible = true;
	}
}
private function onBP_Creature(): Void{
	isCreature = true;
	// 人間・クリーチャー切り替えボタンの表示変更
	Human_on._visible = false;
	Human._visible = true;
	Creature_on._visible = true;
	Creature._visible = false;
	// LeadIn・Aggressiveエディット復活
	setEditColor("disable_LeadIn");
	setEditColor("disable_Aggressive");
	btn_LeadIn_plus._visible = false;
	btn_LeadIn_minus._visible = false;
	btn_Aggressive_plus._visible = false;
	btn_Aggressive_minus._visible = false;

	// レジスト数・タグの表示切替
	CurrentRegistered.text = (c_RegisterCount1 + c_RegisterCount2 + c_RegisterCount3).toString();
	tag3.TagName.text = TagWord3;
	tag4.TagName.text = TagWord4;
	btn_tagword1.tagtext.text = c_TagSelectWord1;
	btn_tagword2.tagtext.text = c_TagSelectWord2;
	btn_tagword3.tagtext.text = c_TagSelectWord3;
	btn_tagword4.tagtext.text = c_TagSelectWord4;
	btn_tagword5.tagtext.text = c_TagSelectWord5;
	btn_tagword6.tagtext.text = c_TagSelectWord6;
	btn_tagword7.tagtext.text = c_TagSelectWord7;
	btn_tagword8.tagtext.text = c_TagSelectWord8;
	btn_tagword9.tagtext.text = c_TagSelectWord9;
	btn_tagword10.tagtext.text = c_TagSelectWord10;
	btn_tagword11.tagtext.text = c_TagSelectWord11;
	btn_tagword12.tagtext.text = c_TagSelectWord12;
	btn_tagword13.tagtext.text = c_TagSelectWord13;
	btn_tagword14.tagtext.text = c_TagSelectWord14;
	btn_tagword15.tagtext.text = c_TagSelectWord15;
	btn_tagword16.tagtext.text = c_TagSelectWord16;

	// 1ページ目の表示
	CurrentPageText.text = "1";
	setSlotNum(1);
	onBP_DeselectAll(); // 全選択解除
	displaySelect();
	displayNameData(1);
	displayIcon("Enabled");
	for (var i=0; i<125; i++) {
		IconLeadInArray[i].gotoAndStop("off");
		IconAggressiveArray[i].gotoAndStop("off");
	}
	displayEditCount("Enabled");
	Edit_LeadIn.EditCount.text = 0;
	Edit_Aggressive.EditCount.text = 0;
	btn_prev._visible = false;
	if (c_RegisterCount2 > 0){
		btn_next._visible = true;
	} else {
		btn_next._visible = false;
	}
}
/*ページ遷移*/
private function onBP_PagePrev(): Void{
	PlaySound("MenuOpen");
	if (CurrentPage == 1){
		// 何もしない
	} else if(CurrentPage == 2){
		if (isCreature == true){
			if (c_RegisterCount1 > 0){
				// 1ページ目表示
				CurrentPageText.text = "1";
				setSlotNum(1);
				displaySelect();
				displayNameData(1);
				displayIcon("Enabled");
				displayIcon("LeadIn");
				displayIcon("Aggressive");
				btn_prev._visible = false;
				btn_next._visible = true;
			}
		} else {
			if (RegisterCount1 > 0){
				// 1ページ目表示
				CurrentPageText.text = "1";
				setSlotNum(1);
				displaySelect();
				displayNameData(1);
				displayIcon("Enabled");
				displayIcon("LeadIn");
				displayIcon("Aggressive");
				btn_prev._visible = false;
				btn_next._visible = true;
			}
		}
	} else {
		if (isCreature == true){
			if (c_RegisterCount2 > 0){
				// 2ページ目表示
				CurrentPageText.text = "2";
				setSlotNum(2);
				displaySelect();
				displayNameData(2);
				displayIcon("Enabled");
				displayIcon("LeadIn");
				displayIcon("Aggressive");
				btn_next._visible = true;
				btn_prev._visible = true;
			}
		} else {
			if (RegisterCount2 > 0){
				// 2ページ目表示
				CurrentPageText.text = "2";
				setSlotNum(2);
				displaySelect();
				displayNameData(2);
				displayIcon("Enabled");
				displayIcon("LeadIn");
				displayIcon("Aggressive");
				btn_next._visible = true;
				btn_prev._visible = true;
			}
		}
	}
}
private function onBP_PageNext(): Void{
	PlaySound("MenuOpen");
	if (CurrentPage == 3){
		// 何もしない
	} else if(CurrentPage == 2){
		if (isCreature == true){
			if (c_RegisterCount3 > 0){
				// 3ページ目表示
				CurrentPageText.text = "3";
				setSlotNum(3);
				displaySelect();
				displayNameData(3);
				displayIcon("Enabled");
				displayIcon("LeadIn");
				displayIcon("Aggressive");
				btn_prev._visible = true;
				btn_next._visible = false;
			}
		} else {
			if (RegisterCount3 > 0){
				// 3ページ目表示
				CurrentPageText.text = "3";
				setSlotNum(3);
				displaySelect();
				displayNameData(3);
				displayIcon("Enabled");
				displayIcon("LeadIn");
				displayIcon("Aggressive");
				btn_prev._visible = true;
				btn_next._visible = false;
			}
		}
	} else {
		if (isCreature == true){
			if (c_RegisterCount2 > 0){
				// 2ページ目表示
				CurrentPageText.text = "2";
				setSlotNum(2);
				displaySelect();
				displayNameData(2);
				displayIcon("Enabled");
				displayIcon("LeadIn");
				displayIcon("Aggressive");
				if (RegisterCount3 > 0){
					btn_next._visible = true;
				} else {
					btn_next._visible = false;
				}
				btn_prev._visible = true;
			}
		} else {
			if (RegisterCount2 > 0){
				// 2ページ目表示
				CurrentPageText.text = "2";
				setSlotNum(2);
				displaySelect();
				displayNameData(2);
				displayIcon("Enabled");
				displayIcon("LeadIn");
				displayIcon("Aggressive");
				if (RegisterCount3 > 0){
					btn_next._visible = true;
				} else {
					btn_next._visible = false;
				}
				btn_prev._visible = true;
			}
		}
	}
}
