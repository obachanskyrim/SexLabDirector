/*メニューを閉じる処理*/
private function exitMenu(): Void{
	MessageText.text = "$AnimationMenu_waitfor_SexLab_save_status";
	MessageWindow._visible = true;
	skse.SendModEvent("SaveTagWord", TagWord1, 1);
	skse.SendModEvent("SaveTagWord", TagWord2, 2);
	skse.SendModEvent("SaveTagWord", TagWord3, 3);
	skse.SendModEvent("SaveTagWord", TagWord4, 4);
	if (RegisterCount3 > 0){
		SendEditStatus("EditEnabled", 1)
		SendEditStatus("EditEnabled", 2)
		SendEditStatus("EditEnabled", 3)
		SendEditStatus("EditLeadIn", 1)
		SendEditStatus("EditLeadIn", 2)
		SendEditStatus("EditLeadIn", 3)
		SendEditStatus("EditAggressive", 1)
		SendEditStatus("EditAggressive", 2)
		SendEditStatus("EditAggressive", 3)
	} else if (RegisterCount2 > 0){
		SendEditStatus("EditEnabled", 1)
		SendEditStatus("EditEnabled", 2)
		SendEditStatus("EditLeadIn", 1)
		SendEditStatus("EditLeadIn", 2)
		SendEditStatus("EditAggressive", 1)
		SendEditStatus("EditAggressive", 2)
	} else if (RegisterCount1 > 0){
		SendEditStatus("EditEnabled", 1)
		SendEditStatus("EditLeadIn", 1)
		SendEditStatus("EditAggressive", 1)
	}
	// creature data

	if (c_RegisterCount3 > 0){
		SendEditStatus("EditCreature", 1)
		SendEditStatus("EditCreature", 2)
		SendEditStatus("EditCreature", 3)
	} else if (c_RegisterCount2 > 0){
		SendEditStatus("EditCreature", 1)
		SendEditStatus("EditCreature", 2)
	} else if (c_RegisterCount1 > 0){
		SendEditStatus("EditCreature", 1)
	}
	requestDataId_ = setInterval(this, "checkFinishStatus", 1000);
}
/* ステータス変更のためのデータを送る */
private function SendEditStatus(a_edit: String, a_num: Number): Void{
	var EditArray: Array;
	var EditArg: String = "";
	if (a_edit == "EditEnabled"){
		if (a_num == 3){
			EditArray = EnabledArray3;
		} else if (a_num == 2){
			EditArray = EnabledArray2;
		} else {
			EditArray = EnabledArray1;
		}
	} else if (a_edit == "EditLeadIn"){
		if (a_num == 3){
			EditArray = LeadInArray3;
		} else if (a_num == 2){
			EditArray = LeadInArray2;
		} else {
			EditArray = LeadInArray1;
		}
	} else if (a_edit == "EditAggressive"){
		if (a_num == 3){
			EditArray = AggressiveArray3;
		} else if (a_num == 2){
			EditArray = AggressiveArray2;
		} else {
			EditArray = AggressiveArray1;
		}
	} else if (a_edit == "EditCreature"){
		if (a_num == 3){
			EditArray = c_EnabledArray3;
		} else if (a_num == 2){
			EditArray = c_EnabledArray2;
		} else {
			EditArray = c_EnabledArray1;
		}
	}
	for (var i=0; i<EditArray.length; i++) {
		if (EditArray[i] == true){
			EditArg = EditArg + "true";
		} else {
			EditArg = EditArg + "false";
		}
		if (i != (EditArray.length - 1)){
			EditArg = EditArg + ",";
		}
	}
	skse.SendModEvent(a_edit, EditArg, a_num);
}
/*ステータス変更終了のコールバックが揃っているかの確認*/
private function checkFinishStatus(): Void{
	clearInterval(requestDataId_);
	var CreatureOK: Boolean = false;
	// creature check
	if (c_RegisterCount3 > 0){
		if (FinishedCreature >= 3){ CreatureOK = true; }
	} else if (c_RegisterCount2 > 0){
		if (FinishedCreature >= 2){ CreatureOK = true; }
	} else if (c_RegisterCount1 > 0) {
		if (FinishedCreature >= 1){ CreatureOK = true; }
	} else {
		CreatureOK = true;
	}
	// Human check
	if (CreatureOK == true) {
		if (RegisterCount3 > 0){
			if ((FinishedEnabled == 3) && (FinishedLeadIn == 3) && (FinishedAggressive == 3)){
				endMenu();
			} else {
				requestDataId_ = setInterval(this, "checkFinishStatus", 1000);
			}
		} else if (RegisterCount2 > 0){
			if ((FinishedEnabled == 2) && (FinishedLeadIn == 2) && (FinishedAggressive == 2)){
				endMenu();
			} else {
				requestDataId_ = setInterval(this, "checkFinishStatus", 1000);
			}
		} else {
			if ((FinishedEnabled == 1) && (FinishedLeadIn == 1) && (FinishedAggressive == 1)){
				endMenu();
			} else {
				requestDataId_ = setInterval(this, "checkFinishStatus", 1000);
			}
		}
	} else {
		requestDataId_ = setInterval(this, "checkFinishStatus", 1000);
	}
}
private function endMenu(): Void{
	skse.AllowTextInput(false);
	skse.SendModEvent("AnimationEditorClose");
	PlaySound("MenuEnd");
	skse.CloseMenu("CustomMenu");
}
