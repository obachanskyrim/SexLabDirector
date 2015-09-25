/*選択したアニメのレジスト名のセーブ*/
private function SaveAnims(): Void{
//	SaveArray.length = 0;
	SaveArray = [];

	// セーブ日時の送信用
	var date: Date;
	date = new Date();
	var d_minutes: String;
	if ((date.getMinutes()) < 10){
		d_minutes = "0" + (date.getMinutes());
	} else {
		d_minutes = "" + (date.getMinutes());
	}
	var d_year:String = "" + (date.getFullYear());
	var d_month: Number = (date.getMonth() + 1);
	var d_month2: String = "" + d_month;
	var d_hours: String = "" + (date.getHours());
	var d_day: String = "" + (date.getDate());
	var mydate = d_year + "/" + d_month2 + "/" + d_day + " " + d_hours + ":" + d_minutes;

	if (isCreature){
		if (c_RegisterCount1 > 0){
			for (var i=0; i<c_RegisterCount1; i++) {
				if (c_SelectSlots[i] == true){
					skse.SendModEvent("UIlog", "c_RegisterNames1[" + i + "] = " + c_RegisterNames1[i]);
					SaveArray.push(c_RegisterNames1[i]);}
			}
		}
		if (c_RegisterCount2 > 0){
			for (var i=0; i<c_RegisterCount2; i++) {
				if (c_SelectSlots2[i] == true){
					skse.SendModEvent("UIlog", "c_RegisterNames2[" + i + "] = " + c_RegisterNames2[i]);
					SaveArray.push(c_RegisterNames2[i]);}
			}
		}
		if (c_RegisterCount3 > 0){
			for (var i=0; i<c_RegisterCount3; i++) {
				if (c_SelectSlots3[i] == true){
					skse.SendModEvent("UIlog", "c_RegisterNames3[" + i + "] = " + c_RegisterNames3[i]);
					SaveArray.push(c_RegisterNames3[i]);}
			}
		}
		var data: String = MakeArg(SaveArray);
		skse.SendModEvent("SaveAnims", data, 2);
		skse.SendModEvent("SaveAnims", mydate, 4);
	} else {
		if (RegisterCount1 > 0){
			for (var i=0; i<RegisterCount1; i++) {
				if (SelectSlots[i] == true){
					skse.SendModEvent("UIlog", "RegisterNames1[" + i + "] = " + RegisterNames1[i]);
					SaveArray.push(RegisterNames1[i]);}
			}
		}
		if (RegisterCount2 > 0){
			for (var i=0; i<RegisterCount2; i++) {
				if (SelectSlots2[i] == true){
					skse.SendModEvent("UIlog", "RegisterNames2[" + i + "] = " + RegisterNames2[i]);
					SaveArray.push(RegisterNames2[i]);}
			}
		}
		if (RegisterCount3 > 0){
			for (var i=0; i<RegisterCount3; i++) {
				if (SelectSlots3[i] == true){
					skse.SendModEvent("UIlog", "RegisterNames3[" + i + "] = " + RegisterNames3[i]);
					SaveArray.push(RegisterNames3[i]);}
			}
		}
		var data: String = MakeArg(SaveArray);
		skse.SendModEvent("SaveAnims", data, 1);
		skse.SendModEvent("SaveAnims", mydate, 3);
	}
	OpenMessage(mydate + "　　" + SaveArray.length + "個のアニメーションの選択状態を保存しました");
	requestDataId_ = setInterval(this, "WaitCloseMessage", 4000);
}
/*登録アニメレジスト名のロード*/
private function LoadAnims(): Void{
	skse.SendModEvent("UIlog", "LoadAnims実行");
	FinishLoad = false;
	if (isCreature){
		skse.SendModEvent("LoadAnims", "", 2);
	} else {
		skse.SendModEvent("LoadAnims", "", 1);
	}
	requestDataId_ = setInterval(this, "checkFinishLoad", 1000);
}
// ゲームからSaveArrayにアニメ登録情報をもってくる
public function initLoadAnims(/* values */): Void{
//	SaveArray.length = 0;
	SaveArray = [];
	for (var i=0; i<arguments.length; i++) {
		SaveArray.push(arguments[i]);
	}
	FinishLoad = true;
}
private function checkFinishLoad(): Void{
	clearInterval(requestDataId_);
	if (FinishLoad){
		FinishLoad = false;
		DisplayLoadAnims();
	} else {
		requestDataId_ = setInterval(this, "checkFinishLoad", 1000);
	}
}
// ロードしたアニメ登録情報を選択状態に反映
private function DisplayLoadAnims(): Void{
	for (var i=0; i<SaveArray.length; i++) {
		if (isCreature){
			if (c_RegisterCount3 > 0){
				for (var j=0; j<c_RegisterCount3; j++) {
					if (SaveArray[i] == c_RegisterNames3[j]){
						c_SelectSlots3[j] = true;
						if (CurrentPage == 3){ SlotsArray[j]. gotoAndPlay("select");}
					}
				}
			}
			if (c_RegisterCount2 > 0){
				for (var j=0; j<c_RegisterCount2; j++) {
					if (SaveArray[i] == c_RegisterNames2[j]){
						c_SelectSlots2[j] = true;
						if (CurrentPage == 2){ SlotsArray[j]. gotoAndPlay("select");}
					}
				}
			}
			if (c_RegisterCount1 > 0){
				for (var j=0; j<c_RegisterCount1; j++) {
					if (SaveArray[i] == c_RegisterNames1[j]){
						c_SelectSlots[j] = true;
						if (CurrentPage == 1){ SlotsArray[j]. gotoAndPlay("select");}
					}
				}
			}
		}else{
			if (RegisterCount3 > 0){
				for (var j=0; j<RegisterCount3; j++) {
					if (SaveArray[i] == RegisterNames3[j]){
						SelectSlots3[j] = true;
						if (CurrentPage == 3){ SlotsArray[j]. gotoAndPlay("select");}
					}
				}
			}
			if (RegisterCount2 > 0){
				for (var j=0; j<RegisterCount2; j++) {
					if (SaveArray[i] == RegisterNames2[j]){
						SelectSlots2[j] = true;
						if (CurrentPage == 2){ SlotsArray[j]. gotoAndPlay("select");}
					}
				}
			}
			if (RegisterCount1 > 0){
				for (var j=0; j<RegisterCount1; j++) {
					if (SaveArray[i] == RegisterNames1[j]){
						SelectSlots[j] = true;
						if (CurrentPage == 1){ SlotsArray[j]. gotoAndPlay("select");}
					}
				}
			}
		}
	} // for (var i=0; i<SaveArray.length; i++)
	PlaySound("AllSelect");
}

/*配列をテキストにする*/
private function MakeArg(a_ary: Array): String{
	var output: String = "";
	for (var i=0; i<a_ary.length; i++) {
		output += a_ary[i];
		if (i != (a_ary.length - 1)){
			output += ",";
		}
	}
	return output;
}
// メッセージウィンドウ
private function OpenMessage(a_msg: String): Void{
	MessageText.text = a_msg;
	MessageWindow._visible = true;
	PlaySound("MenuOpen");
}
private function CloseMessage(): Void{
	MessageWindow._visible = false;
	PlaySound("MenuOpen");
}
/*指定秒後にメッセージウィンドウを閉じる*/
private function WaitCloseMessage(): Void{
	clearInterval(requestDataId_);
	CloseMessage();
}
