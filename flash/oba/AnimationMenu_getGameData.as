/*ページの総数を取得*/
public function initPageCount(a_count: Number): Void{
	PageCount = a_count;
	if (PageCount == 1){
		btn_next._visible = false;
	}
}
public function initPageCount_c(a_count: Number): Void{
	c_PageCount = a_count;
	if (c_PageCount == 0){
		// No Creature
		Creature._visible = false;
		Creature_on._visible = false;
		Creature_off._visible = true;
	}
}
public function initMaxRegistered(a_count: Number): Void{
	RegisterMax = a_count;
	MaxRegistered.text = "" + a_count;
}
public function initShowThumbnail(a_ok: Boolean): Void{
	showThumbnail = a_ok;
}

/*現在セックス中の場合、再生中のアニメ情報を取得*/
public function initPlayingAnimation(a_iscreature: Boolean, a_setnum: Number, a_animnum: Number, a_isaggressive: Boolean, a_currentstage: Number): Void{
	isPlayingNow = true;
	if (a_iscreature){
		isCreatureNow = true;
		onBP_Creature()
	} else {
		isCreatureNow = false;
	}
	NowAnimSetNum = a_setnum;
	NowAnimNum = a_animnum;
	NowCurrentStage = a_currentstage;
	if (a_isaggressive){
		isAggressiveNow = true;
	} else {
		isAggressiveNow = false;
	}
	showDetail(a_animnum, a_setnum);
}

/*アニメーション登録数の総数を取得*/
public function initRegisteredCount(a_count1: Number, a_count2: Number, a_count3: Number, a_count: String): Void{
	RegisterCount1 = a_count1;
	RegisterCount2 = a_count2;
	RegisterCount3 = a_count3;
	CurrentRegistered.text = a_count;
}
/*アニメーション登録数の総数を取得*/
public function initRegisteredCount_c(a_count1: Number, a_count2: Number, a_count3: Number, a_count: String): Void{
	c_RegisterCount1 = a_count1;
	c_RegisterCount2 = a_count2;
	c_RegisterCount3 = a_count3;
}
/* タグの取得 */
public function initTagWord(a_tag1: String, a_tag2: String, a_tag3: String, a_tag4: String): Void{
	TagWord1 = a_tag1;
	TagWord2 = a_tag2;
	TagWord3 = a_tag3;
	TagWord4 = a_tag4;
	tag3.TagName.text = TagWord1;
	tag4.TagName.text = TagWord2;
}
/*選択用タグの取得*/
public function initTagSelectWord(a_tag1: String, a_tag2: String, a_tag3: String, a_tag4: String, a_tag5: String, a_tag6: String, a_tag7: String, a_tag8: String, a_tag9: String, a_tag10: String, a_tag11: String, a_tag12: String, a_tag13: String, a_tag14: String, a_tag15: String, a_tag16: String): Void{
	TagSelectWord1 = a_tag1;
	TagSelectWord2 = a_tag2;
	TagSelectWord3 = a_tag3;
	TagSelectWord4 = a_tag4;
	TagSelectWord5 = a_tag5;
	TagSelectWord6 = a_tag6;
	TagSelectWord7 = a_tag7;
	TagSelectWord8 = a_tag8;
	TagSelectWord9 = a_tag9;
	TagSelectWord10 = a_tag10;
	TagSelectWord11 = a_tag11;
	TagSelectWord12 = a_tag12;
	TagSelectWord13 = a_tag13;
	TagSelectWord14 = a_tag14;
	TagSelectWord15 = a_tag15;
	TagSelectWord16 = a_tag16;
	btn_tagword1.tagtext.textAutoSize = "shrink";
	btn_tagword2.tagtext.textAutoSize = "shrink";
	btn_tagword3.tagtext.textAutoSize = "shrink";
	btn_tagword4.tagtext.textAutoSize = "shrink";
	btn_tagword5.tagtext.textAutoSize = "shrink";
	btn_tagword6.tagtext.textAutoSize = "shrink";
	btn_tagword7.tagtext.textAutoSize = "shrink";
	btn_tagword8.tagtext.textAutoSize = "shrink";
	btn_tagword9.tagtext.textAutoSize = "shrink";
	btn_tagword10.tagtext.textAutoSize = "shrink";
	btn_tagword11.tagtext.textAutoSize = "shrink";
	btn_tagword12.tagtext.textAutoSize = "shrink";
	btn_tagword13.tagtext.textAutoSize = "shrink";
	btn_tagword14.tagtext.textAutoSize = "shrink";
	btn_tagword15.tagtext.textAutoSize = "shrink";
	btn_tagword16.tagtext.textAutoSize = "shrink";
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
}
/*選択用タグの取得*/
public function initTagSelectWord_c(a_tag1: String, a_tag2: String, a_tag3: String, a_tag4: String, a_tag5: String, a_tag6: String, a_tag7: String, a_tag8: String, a_tag9: String, a_tag10: String, a_tag11: String, a_tag12: String, a_tag13: String, a_tag14: String, a_tag15: String, a_tag16: String): Void{
	c_TagSelectWord1 = a_tag1;
	c_TagSelectWord2 = a_tag2;
	c_TagSelectWord3 = a_tag3;
	c_TagSelectWord4 = a_tag4;
	c_TagSelectWord5 = a_tag5;
	c_TagSelectWord6 = a_tag6;
	c_TagSelectWord7 = a_tag7;
	c_TagSelectWord8 = a_tag8;
	c_TagSelectWord9 = a_tag9;
	c_TagSelectWord10 = a_tag10;
	c_TagSelectWord11 = a_tag11;
	c_TagSelectWord12 = a_tag12;
	c_TagSelectWord13 = a_tag13;
	c_TagSelectWord14 = a_tag14;
	c_TagSelectWord15 = a_tag15;
	c_TagSelectWord16 = a_tag16;
}
/*アニメーション名の取得*/
public function initName1Data(/* values */): Void{
	for (var i=0; i<arguments.length; i++) {
		var s = arguments[i];
		if (s == "") {
			s = "- ? undefined ? -";
		}
		AnimationNames1.push(Translator.translateNested(s));
	}
	setSlotNum(1);
	displayNameData(1);
}
public function initName2Data(/* values */): Void{
	for (var i=0; i<arguments.length; i++) {
		var s = arguments[i];
		if (s == "") {
			s = "- ? undefined ? -";
		}
		AnimationNames2.push(Translator.translateNested(s));
	}
}
public function initName3Data(/* values */): Void{
	for (var i=0; i<arguments.length; i++) {
		var s = arguments[i];
		if (s == "") {
			s = "- ? undefined ? -";
		}
		AnimationNames3.push(Translator.translateNested(s));
	}
}
/*アニメーション名の取得*/
public function initName1Data_c(/* values */): Void{
	for (var i=0; i<arguments.length; i++) {
		var s = arguments[i];
		if (s == "") {
			s = "- ? undefined ? -";
		}
		c_AnimationNames1.push(Translator.translateNested(s));
	}
}
public function initName2Data_c(/* values */): Void{
	for (var i=0; i<arguments.length; i++) {
		var s = arguments[i];
		if (s == "") {
			s = "- ? undefined ? -";
		}
		c_AnimationNames2.push(Translator.translateNested(s));
	}
}
public function initName3Data_c(/* values */): Void{
	for (var i=0; i<arguments.length; i++) {
		var s = arguments[i];
		if (s == "") {
			s = "- ? undefined ? -";
		}
		c_AnimationNames3.push(Translator.translateNested(s));
	}
}
/*レジスト名の取得*/
public function initRegistry1Data(/* values */): Void{
	for (var i=0; i<arguments.length; i++) {
		RegisterNames1.push(arguments[i]);
	}
}
public function initRegistry2Data(/* values */): Void{
	for (var i=0; i<arguments.length; i++) {
		RegisterNames2.push(arguments[i]);
	}
}
public function initRegistry3Data(/* values */): Void{
	for (var i=0; i<arguments.length; i++) {
		RegisterNames3.push(arguments[i]);
	}
}
/*レジスト名の取得*/
public function initRegistry1Data_c(/* values */): Void{
	for (var i=0; i<arguments.length; i++) {
		c_RegisterNames1.push(arguments[i]);
	}
}
public function initRegistry2Data_c(/* values */): Void{
	for (var i=0; i<arguments.length; i++) {
		c_RegisterNames2.push(arguments[i]);
	}
}
public function initRegistry3Data_c(/* values */): Void{
	for (var i=0; i<arguments.length; i++) {
		c_RegisterNames3.push(arguments[i]);
	}
}
/* アニメーションのEnabled状況を取得*/
public function initEnabled1(/* values */): Void{
	var len = arguments.length;
	for (var i=0; i<len; i++) {
		EnabledArray1.push(arguments[i]);
	}
}
public function initEnabled2(/* values */): Void{
	var len = arguments.length;
	for (var i=0; i<len; i++) {
		EnabledArray2.push(arguments[i]);
	}
}
public function initEnabled3(/* values */): Void{
	var len = arguments.length;
	for (var i=0; i<len; i++) {
		EnabledArray3.push(arguments[i]);
	}
	displayIcon("Enabled");
	displayEditCount("Enabled");
}
/* アニメーションのEnabled状況を取得*/
public function initEnabled1_c(/* values */): Void{
	var len = arguments.length;
	for (var i=0; i<len; i++) {
		c_EnabledArray1.push(arguments[i]);
	}
}
public function initEnabled2_c(/* values */): Void{
	var len = arguments.length;
	for (var i=0; i<len; i++) {
		c_EnabledArray2.push(arguments[i]);
	}
}
public function initEnabled3_c(/* values */): Void{
	var len = arguments.length;
	for (var i=0; i<len; i++) {
		c_EnabledArray3.push(arguments[i]);
	}
}
/* アニメーションのLeadIn状況を取得*/
public function initLeadIn1(/* values */): Void{
	var len = arguments.length;
	for (var i=0; i<len; i++) {
		LeadInArray1.push(arguments[i]);
	}
}
public function initLeadIn2(/* values */): Void{
	var len = arguments.length;
	for (var i=0; i<len; i++) {
		LeadInArray2.push(arguments[i]);
	}
}
public function initLeadIn3(/* values */): Void{
	var len = arguments.length;
	for (var i=0; i<len; i++) {
		LeadInArray3.push(arguments[i]);
	}
	displayIcon("LeadIn");
	displayEditCount("LeadIn");
}
/* アニメーションのAggressive状況を取得*/
public function initAggressive1(/* values */): Void{
	var len = arguments.length;
	for (var i=0; i<len; i++) {
		AggressiveArray1.push(arguments[i]);
	}
}
public function initAggressive2(/* values */): Void{
	var len = arguments.length;
	for (var i=0; i<len; i++) {
		AggressiveArray2.push(arguments[i]);
	}
}
public function initAggressive3(/* values */): Void{
	var len = arguments.length;
	for (var i=0; i<len; i++) {
		AggressiveArray3.push(arguments[i]);
	}
	displayIcon("Aggressive");
	displayEditCount("Aggressive");
}
/*指定のタグが含まれていたかどうかを受信*/
public function initTagBool(/* values */): Void{
	var len = arguments.length;
	for (var i=0; i<len; i++) {
		if (arguments[i] == true){
			SelectSlots[i] = true;
			if (CurrentPage == 1){
				SlotsArray[i]. gotoAndPlay("select");
			}
		}
	}
	PlaySound("AllSelect");
}
public function initTagBool2(/* values */): Void{
	var len = arguments.length;
	for (var i=0; i<len; i++) {
		if (arguments[i] == true){
			SelectSlots2[i] = true;
			if (CurrentPage == 2){
				SlotsArray[i]. gotoAndPlay("select");
			}
		}
	}
}
public function initTagBool3(/* values */): Void{
	var len = arguments.length;
	for (var i=0; i<len; i++) {
		if (arguments[i] == true){
			SelectSlots3[i] = true;
			if (CurrentPage == 3){
				SlotsArray[i]. gotoAndPlay("select");
			}
		}
	}
}
/*指定のタグが含まれていたかどうかを受信*/
public function initTagBool_c(/* values */): Void{
	var len = arguments.length;
	for (var i=0; i<len; i++) {
		if (arguments[i] == true){
			c_SelectSlots[i] = true;
			if (CurrentPage == 1){
				SlotsArray[i]. gotoAndPlay("select");
			}
		}
	}
	PlaySound("AllSelect");
}
public function initTagBool2_c(/* values */): Void{
	var len = arguments.length;
	for (var i=0; i<len; i++) {
		if (arguments[i] == true){
			c_SelectSlots2[i] = true;
			if (CurrentPage == 2){
				SlotsArray[i]. gotoAndPlay("select");
			}
		}
	}
}
public function initTagBool3_c(/* values */): Void{
	var len = arguments.length;
	for (var i=0; i<len; i++) {
		if (arguments[i] == true){
			c_SelectSlots3[i] = true;
			if (CurrentPage == 3){
				SlotsArray[i]. gotoAndPlay("select");
			}
		}
	}
}

/*ステータス変更の処理終了したかどうかを受け取る*/
public function initFinishEdit(a_eventname:String, a_num:Number): Void{
	if (a_eventname == "EditEnabled"){
		FinishedEnabled += 1;
	} else if (a_eventname == "EditLeadIn"){
		FinishedLeadIn += 1;
	} else if (a_eventname == "EditAggressive"){
		FinishedAggressive += 1;
	} else if (a_eventname == "EditCreature"){
		FinishedCreature += 1;
	}
}
