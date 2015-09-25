/*詳細画面の表示*/
private function showDetail(a_num: Number, a_page: Number): Void{
	CurrentDetailNum = a_num;
	if (isCreature == true){
		if (a_page == 3){
			CurrentDetailPage = 3;
			skse.SendModEvent("CheackDetail", "c_Anim3", a_num);
			setDetailSlotNum(a_num, 3);
			displayDetailName(a_num, 3);
			displayDetailRegist(a_num, 3);
			displayDetailIcon(a_num, 3);
		} else if (a_page == 2){
			CurrentDetailPage = 2;
			skse.SendModEvent("CheackDetail", "c_Anim2", a_num);
			setDetailSlotNum(a_num, 2);
			displayDetailName(a_num, 2);
			displayDetailRegist(a_num, 2);
			displayDetailIcon(a_num, 2);
		} else {
			CurrentDetailPage = 1;
			skse.SendModEvent("CheackDetail", "c_Anim1", a_num);
			setDetailSlotNum(a_num, 1);
			displayDetailName(a_num, 1);
			displayDetailRegist(a_num, 1);
			displayDetailIcon(a_num, 1);
		}
	} else {
		if (a_page == 3){
			CurrentDetailPage = 3;
			skse.SendModEvent("CheackDetail", "Anim3", a_num);
			setDetailSlotNum(a_num, 3);
			displayDetailName(a_num, 3);
			displayDetailRegist(a_num, 3);
			displayDetailIcon(a_num, 3);
		} else if (a_page == 2){
			CurrentDetailPage = 2;
			skse.SendModEvent("CheackDetail", "Anim2", a_num);
			setDetailSlotNum(a_num, 2);
			displayDetailName(a_num, 2);
			displayDetailRegist(a_num, 2);
			displayDetailIcon(a_num, 2);
		} else {
			CurrentDetailPage = 1;
			skse.SendModEvent("CheackDetail", "Anim1", a_num);
			setDetailSlotNum(a_num, 1);
			displayDetailName(a_num, 1);
			displayDetailRegist(a_num, 1);
			displayDetailIcon(a_num, 1);
		}
	}
	hideButtons();
	if (IsNowPlaying(a_num, a_page)){showNowPlaying();}
	DetailWindow._visible = true;
	gfx.managers.FocusHandler.instance.setFocus(btn_detail_Enabled, 0);
	PlaySound("MenuOpen");
}
/*詳細ウィンドウ・レジスト名＆サムネイル画像*/
private function displayDetailRegist(a_num: Number, a_page: Number): Void{
	var reg: String;
	var thumbPath: String = "../../../Textures/obachan/SSLanimationMenu/";
	if (isCreature == true){
		if (a_page == 3){
			reg = c_RegisterNames3[a_num];
		} else if(a_page == 2){
			reg = c_RegisterNames2[a_num];
		} else {
			reg = c_RegisterNames1[a_num];
		}
	} else {
		if (a_page == 3){
			reg = RegisterNames3[a_num];
		} else if(a_page == 2){
			reg = RegisterNames2[a_num];
		} else {
			reg = RegisterNames1[a_num];
		}
	}
	var d_reg: String;
	if (reg.charAt(0) == "$"){
		d_reg = reg.slice(1);
		detail_resist._x = ic_d_anchor + 16;
		ic_d._visible = true;
	} else {
		d_reg = reg;
		detail_resist._x = ic_d_anchor;
		ic_d._visible = false;
	}
	detail_resist.text = d_reg;

	unloadImage();
	if (showThumbnail){
		thumb1 = imageHolder1.createEmptyMovieClip("thumb1_mc", imageHolder1.getNextHighestDepth());
		thumb2 = imageHolder2.createEmptyMovieClip("thumb2_mc", imageHolder2.getNextHighestDepth());
		thumb3 = imageHolder3.createEmptyMovieClip("thumb3_mc", imageHolder3.getNextHighestDepth());
		thumb4 = imageHolder4.createEmptyMovieClip("thumb4_mc", imageHolder4.getNextHighestDepth());
		thumb5 = imageHolder5.createEmptyMovieClip("thumb5_mc", imageHolder5.getNextHighestDepth());
		thumb6 = imageHolder6.createEmptyMovieClip("thumb6_mc", imageHolder6.getNextHighestDepth());
		thumb7 = imageHolder7.createEmptyMovieClip("thumb7_mc", imageHolder7.getNextHighestDepth());
		thumb8 = imageHolder8.createEmptyMovieClip("thumb8_mc", imageHolder8.getNextHighestDepth());
		thumb9 = imageHolder9.createEmptyMovieClip("thumb9_mc", imageHolder9.getNextHighestDepth());
		thumb10 = imageHolder10.createEmptyMovieClip("thumb10_mc", imageHolder10.getNextHighestDepth());
		thumb1.loadMovie(thumbPath + reg + "_1.dds");
		thumb2.loadMovie(thumbPath + reg + "_2.dds");
		thumb3.loadMovie(thumbPath + reg + "_3.dds");
		thumb4.loadMovie(thumbPath + reg + "_4.dds");
		thumb5.loadMovie(thumbPath + reg + "_5.dds");
		thumb6.loadMovie(thumbPath + reg + "_6.dds");
		thumb7.loadMovie(thumbPath + reg + "_7.dds");
		thumb8.loadMovie(thumbPath + reg + "_8.dds");
		thumb9.loadMovie(thumbPath + reg + "_9.dds");
		thumb10.loadMovie(thumbPath + reg + "_10.dds");
	}
}
private function unloadImage(): Void{
	if (!thumb1){
	}else{
		thumb1.removeMovieClip();
		thumb1 = undefined;
	}
	if (!thumb2){
	}else{
		thumb2.removeMovieClip();
		thumb2 = undefined;
	}
	if (!thumb3){
	}else{
		thumb3.removeMovieClip();
		thumb3 = undefined;
	}
	if (!thumb4){
	}else{
		thumb4.removeMovieClip();
		thumb4 = undefined;
	}
	if (!thumb5){
	}else{
		thumb5.removeMovieClip();
		thumb5 = undefined;
	}
	if (!thumb6){
	}else{
		thumb6.removeMovieClip();
		thumb6 = undefined;
	}
	if (!thumb7){
	}else{
		thumb7.removeMovieClip();
		thumb7 = undefined;
	}
	if (!thumb8){
	}else{
		thumb8.removeMovieClip();
		thumb8 = undefined;
	}
	if (!thumb9){
	}else{
		thumb9.removeMovieClip();
		thumb9 = undefined;
	}
	if (!thumb10){
	}else{
		thumb10.removeMovieClip();
		thumb10 = undefined;
	}
}
/*人数・ステージ数の取得*/
public function initDetailData(a_stage: Number, a_male: Number, a_female:Number, a_c_male: Number, a_c_female: Number): Void{
	detail_stage.text = a_stage.toString();
	detail_male.text = a_male.toString();
	detail_female.text = a_female.toString();
	detail_c_male.text = a_c_male.toString();
	detail_c_female.text = a_c_female.toString();
}
/*タグを取得*/
public function initDetailTags(/* values */): Void{
	var s: String = "";
	for (var i=0; i<arguments.length; i++) {
		DetailTags.push(arguments[i]);
		if (arguments[i] != "") {
			s = s + arguments[i];
			if (i != (arguments.length - 1)){
				s = s + " , ";
			}
		}
	}
	detail_tags.text = s;
}
/*詳細ウィンドウ・アイコン表示*/
private function displayDetailIcon(a_num: Number, a_page: Number): Void{
	var en: Array;
	var lea: Array;
	var agg: Array;
	if (isCreature == true){
		if (a_page == 3){
			en = c_EnabledArray3;
		} else if(a_page == 2){
			en = c_EnabledArray2;
		} else {
			en = c_EnabledArray1;
		}
		if (en[a_num] == true){
			ic_enabled_detail.gotoAndPlay("on");
		} else {
			ic_enabled_detail.gotoAndPlay("off");
		}
		ic_leadin_detail.gotoAndPlay("off");
		ic_aggressive_detail.gotoAndPlay("off");
		btn_detail_LeadIn._visible = false;
		btn_detail_aggressive._visible = false;
	} else {
		if (a_page == 3){
			en = EnabledArray3;
			lea = LeadInArray3;
			agg = AggressiveArray3;
		} else if(a_page == 2){
			en = EnabledArray2;
			lea = LeadInArray2;
			agg = AggressiveArray2;
		} else {
			en = EnabledArray1;
			lea = LeadInArray1;
			agg = AggressiveArray1;
		}
		if (en[a_num] == true){
			ic_enabled_detail.gotoAndPlay("on");
		} else {
			ic_enabled_detail.gotoAndPlay("off");
		}
		btn_detail_LeadIn._visible = true;
		btn_detail_aggressive._visible = true;
		if (lea[a_num] == true){
			ic_leadin_detail.gotoAndPlay("on");
		} else {
			ic_leadin_detail.gotoAndPlay("off");
		}
		if (agg[a_num] == true){
			ic_aggressive_detail.gotoAndPlay("on");
		} else {
			ic_aggressive_detail.gotoAndPlay("off");
		}
	}
}
/*詳細ウィンドウ・通し番号*/
private function setDetailSlotNum(a_num: Number, a_page: Number): Void{
	if (a_page == 3) {
		detail_num.text = "" + (a_num + 251);
	} else if (a_page == 2) {
		detail_num.text = "" + (a_num + 126);
	} else{
		if ((a_num + 1) < 10) {
			detail_num.text = "00" + (a_num + 1);
		} else if ((a_num + 1) < 100){
			detail_num.text = "0" + (a_num + 1);
		} else {
			detail_num.text = "" + (a_num + 1);
		}
	}
}
/*詳細ウィンドウ・名前*/
private function displayDetailName(a_num: Number, a_page: Number): Void{
	var n: String;
	if (isCreature == true){
		if (a_page == 3){
			n = c_AnimationNames3[a_num];
		} else if(a_page == 2){
			n = c_AnimationNames2[a_num];
		} else {
			n = c_AnimationNames1[a_num];
		}
	} else {
		if (a_page == 3){
			n = AnimationNames3[a_num];
		} else if(a_page == 2){
			n = AnimationNames2[a_num];
		} else {
			n = AnimationNames1[a_num];
		}
	}
	if (n == ""){
		n = " --- undefined ---";
	}
	detail_Name.text = n;
}
/*詳細画面・エディットボタン*/
private function onBP_detail_Enabled(): Void{
	if (isCreature == true){
		if (CurrentDetailPage == 3){
			if (c_EnabledArray3[CurrentDetailNum] == true){
				c_EnabledArray3[CurrentDetailNum] = false;
				ic_enabled_detail.gotoAndPlay("off");
				if(CurrentPage == 3){ IconEnabledArray[CurrentDetailNum].gotoAndStop("off");}
				PlaySound("default");
			} else {
				c_EnabledArray3[CurrentDetailNum] = true;
				ic_enabled_detail.gotoAndPlay("on");
				if(CurrentPage == 3){ IconEnabledArray[CurrentDetailNum].gotoAndStop("on");}
				PlaySound("select");
			}
		} else if (CurrentDetailPage == 2){
			if (c_EnabledArray2[CurrentDetailNum] == true){
				c_EnabledArray2[CurrentDetailNum] = false;
				ic_enabled_detail.gotoAndPlay("off");
				if(CurrentPage == 2){ IconEnabledArray[CurrentDetailNum].gotoAndStop("off");}
				PlaySound("default");
			} else {
				c_EnabledArray2[CurrentDetailNum] = true;
				ic_enabled_detail.gotoAndPlay("on");
				if(CurrentPage == 2){ IconEnabledArray[CurrentDetailNum].gotoAndStop("on");}
				PlaySound("select");
			}
		} else {
			if (c_EnabledArray1[CurrentDetailNum] == true){
				c_EnabledArray1[CurrentDetailNum] = false;
				ic_enabled_detail.gotoAndPlay("off");
				if(CurrentPage == 1){ IconEnabledArray[CurrentDetailNum].gotoAndStop("off");}
				PlaySound("default");
			} else {
				c_EnabledArray1[CurrentDetailNum] = true;
				ic_enabled_detail.gotoAndPlay("on");
				if(CurrentPage == 1){ IconEnabledArray[CurrentDetailNum].gotoAndStop("on");}
				PlaySound("select");
			}
		}
	} else {
		if (CurrentDetailPage == 3){
			if (EnabledArray3[CurrentDetailNum] == true){
				EnabledArray3[CurrentDetailNum] = false;
				ic_enabled_detail.gotoAndPlay("off");
				if(CurrentPage == 3){ IconEnabledArray[CurrentDetailNum].gotoAndStop("off");}
				PlaySound("default");
			} else {
				EnabledArray3[CurrentDetailNum] = true;
				ic_enabled_detail.gotoAndPlay("on");
				if(CurrentPage == 3){ IconEnabledArray[CurrentDetailNum].gotoAndStop("on");}
				PlaySound("select");
			}
		} else if (CurrentDetailPage == 2){
			if (EnabledArray2[CurrentDetailNum] == true){
				EnabledArray2[CurrentDetailNum] = false;
				ic_enabled_detail.gotoAndPlay("off");
				if(CurrentPage == 2){ IconEnabledArray[CurrentDetailNum].gotoAndStop("off");}
				PlaySound("default");
			} else {
				EnabledArray2[CurrentDetailNum] = true;
				ic_enabled_detail.gotoAndPlay("on");
				if(CurrentPage == 2){ IconEnabledArray[CurrentDetailNum].gotoAndStop("on");}
				PlaySound("select");
			}
		} else {
			if (EnabledArray1[CurrentDetailNum] == true){
				EnabledArray1[CurrentDetailNum] = false;
				ic_enabled_detail.gotoAndPlay("off");
				if(CurrentPage == 1){ IconEnabledArray[CurrentDetailNum].gotoAndStop("off");}
				PlaySound("default");
			} else {
				EnabledArray1[CurrentDetailNum] = true;
				ic_enabled_detail.gotoAndPlay("on");
				if(CurrentPage == 1){ IconEnabledArray[CurrentDetailNum].gotoAndStop("on");}
				PlaySound("select");
			}
		}
	}
	displayEditCount("Enabled");
	btn_detail_Enabled.gotoAndStop("up");
}
private function onBP_detail_LeadIn(): Void{
	if (CurrentDetailPage == 3){
		if (LeadInArray3[CurrentDetailNum] == true){
			LeadInArray3[CurrentDetailNum] = false;
			ic_leadin_detail.gotoAndPlay("off");
			if(CurrentPage == 3){ IconLeadInArray[CurrentDetailNum].gotoAndStop("off");}
			PlaySound("default");
		} else {
			LeadInArray3[CurrentDetailNum] = true;
			ic_leadin_detail.gotoAndPlay("on");
			if(CurrentPage == 3){ IconLeadInArray[CurrentDetailNum].gotoAndStop("on");}
			PlaySound("select");
		}
	} else if (CurrentDetailPage == 2){
		if (LeadInArray2[CurrentDetailNum] == true){
			LeadInArray2[CurrentDetailNum] = false;
			ic_leadin_detail.gotoAndPlay("off");
			if(CurrentPage == 2){ IconLeadInArray[CurrentDetailNum].gotoAndStop("off");}
			PlaySound("default");
		} else {
			LeadInArray2[CurrentDetailNum] = true;
			ic_leadin_detail.gotoAndPlay("on");
			if(CurrentPage == 2){ IconLeadInArray[CurrentDetailNum].gotoAndStop("on");}
			PlaySound("select");
		}
	} else {
		if (LeadInArray1[CurrentDetailNum] == true){
			LeadInArray1[CurrentDetailNum] = false;
			ic_leadin_detail.gotoAndPlay("off");
			if(CurrentPage == 1){ IconLeadInArray[CurrentDetailNum].gotoAndStop("off");}
			PlaySound("default");
		} else {
			LeadInArray1[CurrentDetailNum] = true;
			ic_leadin_detail.gotoAndPlay("on");
			if(CurrentPage == 1){ IconLeadInArray[CurrentDetailNum].gotoAndStop("on");}
			PlaySound("select");
		}
	}
	displayEditCount("LeadIn");
	btn_detail_LeadIn.gotoAndStop("up");
}
private function onBP_detail_aggressive(): Void{
	if (CurrentDetailPage == 3){
		if (AggressiveArray3[CurrentDetailNum] == true){
			AggressiveArray3[CurrentDetailNum] = false;
			ic_aggressive_detail.gotoAndPlay("off");
			if(CurrentPage == 3){ IconAggressiveArray[CurrentDetailNum].gotoAndStop("off");}
			PlaySound("default");
		} else {
			AggressiveArray3[CurrentDetailNum] = true;
			ic_aggressive_detail.gotoAndPlay("on");
			if(CurrentPage == 3){ IconAggressiveArray[CurrentDetailNum].gotoAndStop("on");}
			PlaySound("select");
		}
	} else if (CurrentDetailPage == 2){
		if (AggressiveArray2[CurrentDetailNum] == true){
			AggressiveArray2[CurrentDetailNum] = false;
			ic_aggressive_detail.gotoAndPlay("off");
			if(CurrentPage == 2){ IconAggressiveArray[CurrentDetailNum].gotoAndStop("off");}
			PlaySound("default");
		} else {
			AggressiveArray2[CurrentDetailNum] = true;
			ic_aggressive_detail.gotoAndPlay("on");
			if(CurrentPage == 2){ IconAggressiveArray[CurrentDetailNum].gotoAndStop("on");}
			PlaySound("select");
		}
	} else {
		if (AggressiveArray1[CurrentDetailNum] == true){
			AggressiveArray1[CurrentDetailNum] = false;
			ic_aggressive_detail.gotoAndPlay("off");
			if(CurrentPage == 1){ IconAggressiveArray[CurrentDetailNum].gotoAndStop("off");}
			PlaySound("default");
		} else {
			AggressiveArray1[CurrentDetailNum] = true;
			ic_aggressive_detail.gotoAndPlay("on");
			if(CurrentPage == 1){ IconAggressiveArray[CurrentDetailNum].gotoAndStop("on");}
			PlaySound("select");
		}
	}
	displayEditCount("Aggressive");
	btn_detail_aggressive.gotoAndStop("up");
}

/*現在再生中のアニメかどうか*/
private function IsNowPlaying(a_num: Number, a_page: Number): Boolean{
	if (isPlayingNow == true){
		if ((isCreature == true) && (isCreatureNow == true)){
			if ((a_page == NowAnimSetNum) && (a_num == NowAnimNum)){
				return true;
			}
		}
		if ((isCreature == false) && (isCreatureNow == false)){
			if ((a_page == NowAnimSetNum) && (a_num == NowAnimNum)){
				return true;
			}
		}
		return false;
	} else {
		return false;
	}
}
/*現在再生中のアニメ情報の表示*/
private function showNowPlaying(): Void{
	CurrentPlayingInfo._visible = true;
	CurrentStageText.text = "" + NowCurrentStage;
	if (isAggressiveNow){
		isAggressiveMark._visible = true;
	} else {
		isAggressiveMark._visible = false;
	}
}

/*詳細画面・前へボタン*/
private function onBP_detail_pageprev(): Void{
	CurrentPlayingInfo._visible = false;
	if ((CurrentDetailNum - 1) < 0){ // ページをまたぐ場合
		if (isCreature == true){
			if (CurrentDetailPage == 3){
				showDetail((c_RegisterCount2 - 1), 2);
			} else if (CurrentDetailPage == 2){
				showDetail((c_RegisterCount1 - 1), 1);
			} else {
				if (c_RegisterCount3 > 0){
					showDetail((c_RegisterCount3 - 1), 3);
				} else if (c_RegisterCount2 > 0){
					showDetail((c_RegisterCount2 - 1), 2);
				} else {
					showDetail((c_RegisterCount1 - 1), 1);
				}
			}
		} else {
			if (CurrentDetailPage == 3){
				showDetail((RegisterCount2 - 1), 2);
			} else if (CurrentDetailPage == 2){
				showDetail((RegisterCount1 - 1), 1);
			} else {
				if (RegisterCount3 > 0){
					showDetail((RegisterCount3 - 1), 3);
				} else if (RegisterCount2 > 0){
					showDetail((RegisterCount2 - 1), 2);
				} else {
					showDetail((RegisterCount1 - 1), 1);
				}
			}
		}
	} else {
		showDetail((CurrentDetailNum - 1), CurrentDetailPage);
	}
}
/*詳細画面・次へボタン*/
private function onBP_detail_pagenext(): Void{
	CurrentPlayingInfo._visible = false;
	var maxnum: Number;
	if (isCreature == true){
		if (CurrentDetailPage == 3){
			maxnum = c_RegisterCount3;
		} else if (CurrentDetailPage == 2){
			maxnum = c_RegisterCount2;
		} else {
			maxnum = c_RegisterCount1;
		}
		if ((CurrentDetailNum+1) >= maxnum){ // ページをまたぐ場合
			if (CurrentDetailPage == 3){
				showDetail(0, 1);
			} else if (CurrentDetailPage == 2){
				if (c_RegisterCount3 > 0){
					showDetail(0, 3);
				} else {
					showDetail(0, 1);
				}
			} else {
				if (c_RegisterCount2 > 0){
					showDetail(0, 2);
				} else {
					showDetail(0, 1);
				}
			}
		} else {
			showDetail((CurrentDetailNum +1), CurrentDetailPage);
		}
	} else {
		if (CurrentDetailPage == 3){
			maxnum = RegisterCount3;
		} else if (CurrentDetailPage == 2){
			maxnum = RegisterCount2;
		} else {
			maxnum = RegisterCount1;
		}
		if ((CurrentDetailNum+1) >= maxnum){ // ページをまたぐ場合
			if (CurrentDetailPage == 3){
				showDetail(0, 1);
			} else if (CurrentDetailPage == 2){
				if (RegisterCount3 > 0){
					showDetail(0, 3);
				} else {
					showDetail(0, 1);
				}
			} else {
				if (RegisterCount2 > 0){
					showDetail(0, 2);
				} else {
					showDetail(0, 1);
				}
			}
		} else {
			showDetail((CurrentDetailNum +1), CurrentDetailPage);
		}
	}
}
/*詳細画面・閉じるボタン*/
private function onBP_detail_close(): Void{
	unloadImage();
	DetailWindow._visible = false;
	PlaySound("MenuOpen");
	showButtons();
	gfx.managers.FocusHandler.instance.setFocus(buttonHolder.SelectButton1, 0);
}

/*詳細画面を開くためのボタンの処理*/
private function onBP_detail1(): Void{ showDetail(0, CurrentPage);}
	private function onBP_detail2(): Void{ showDetail(1, CurrentPage);}
	private function onBP_detail3(): Void{ showDetail(2, CurrentPage);}
	private function onBP_detail4(): Void{ showDetail(3, CurrentPage);}
	private function onBP_detail5(): Void{ showDetail(4, CurrentPage);}
	private function onBP_detail6(): Void{ showDetail(5, CurrentPage);}
	private function onBP_detail7(): Void{ showDetail(6, CurrentPage);}
	private function onBP_detail8(): Void{ showDetail(7, CurrentPage);}
	private function onBP_detail9(): Void{ showDetail(8, CurrentPage);}
	private function onBP_detail10(): Void{ showDetail(9, CurrentPage);}
	private function onBP_detail11(): Void{ showDetail(10, CurrentPage);}
	private function onBP_detail12(): Void{ showDetail(11, CurrentPage);}
	private function onBP_detail13(): Void{ showDetail(12, CurrentPage);}
	private function onBP_detail14(): Void{ showDetail(13, CurrentPage);}
	private function onBP_detail15(): Void{ showDetail(14, CurrentPage);}
	private function onBP_detail16(): Void{ showDetail(15, CurrentPage);}
	private function onBP_detail17(): Void{ showDetail(16, CurrentPage);}
	private function onBP_detail18(): Void{ showDetail(17, CurrentPage);}
	private function onBP_detail19(): Void{ showDetail(18, CurrentPage);}
	private function onBP_detail20(): Void{ showDetail(19, CurrentPage);}
	private function onBP_detail21(): Void{ showDetail(20, CurrentPage);}
	private function onBP_detail22(): Void{ showDetail(21, CurrentPage);}
	private function onBP_detail23(): Void{ showDetail(22, CurrentPage);}
	private function onBP_detail24(): Void{ showDetail(23, CurrentPage);}
	private function onBP_detail25(): Void{ showDetail(24, CurrentPage);}
	private function onBP_detail26(): Void{ showDetail(25, CurrentPage);}
	private function onBP_detail27(): Void{ showDetail(26, CurrentPage);}
	private function onBP_detail28(): Void{ showDetail(27, CurrentPage);}
	private function onBP_detail29(): Void{ showDetail(28, CurrentPage);}
	private function onBP_detail30(): Void{ showDetail(29, CurrentPage);}
	private function onBP_detail31(): Void{ showDetail(30, CurrentPage);}
	private function onBP_detail32(): Void{ showDetail(31, CurrentPage);}
	private function onBP_detail33(): Void{ showDetail(32, CurrentPage);}
	private function onBP_detail34(): Void{ showDetail(33, CurrentPage);}
	private function onBP_detail35(): Void{ showDetail(34, CurrentPage);}
	private function onBP_detail36(): Void{ showDetail(35, CurrentPage);}
	private function onBP_detail37(): Void{ showDetail(36, CurrentPage);}
	private function onBP_detail38(): Void{ showDetail(37, CurrentPage);}
	private function onBP_detail39(): Void{ showDetail(38, CurrentPage);}
	private function onBP_detail40(): Void{ showDetail(39, CurrentPage);}
	private function onBP_detail41(): Void{ showDetail(40, CurrentPage);}
	private function onBP_detail42(): Void{ showDetail(41, CurrentPage);}
	private function onBP_detail43(): Void{ showDetail(42, CurrentPage);}
	private function onBP_detail44(): Void{ showDetail(43, CurrentPage);}
	private function onBP_detail45(): Void{ showDetail(44, CurrentPage);}
	private function onBP_detail46(): Void{ showDetail(45, CurrentPage);}
	private function onBP_detail47(): Void{ showDetail(46, CurrentPage);}
	private function onBP_detail48(): Void{ showDetail(47, CurrentPage);}
	private function onBP_detail49(): Void{ showDetail(48, CurrentPage);}
	private function onBP_detail50(): Void{ showDetail(49, CurrentPage);}
	private function onBP_detail51(): Void{ showDetail(50, CurrentPage);}
	private function onBP_detail52(): Void{ showDetail(51, CurrentPage);}
	private function onBP_detail53(): Void{ showDetail(52, CurrentPage);}
	private function onBP_detail54(): Void{ showDetail(53, CurrentPage);}
	private function onBP_detail55(): Void{ showDetail(54, CurrentPage);}
	private function onBP_detail56(): Void{ showDetail(55, CurrentPage);}
	private function onBP_detail57(): Void{ showDetail(56, CurrentPage);}
	private function onBP_detail58(): Void{ showDetail(57, CurrentPage);}
	private function onBP_detail59(): Void{ showDetail(58, CurrentPage);}
	private function onBP_detail60(): Void{ showDetail(59, CurrentPage);}
	private function onBP_detail61(): Void{ showDetail(60, CurrentPage);}
	private function onBP_detail62(): Void{ showDetail(61, CurrentPage);}
	private function onBP_detail63(): Void{ showDetail(62, CurrentPage);}
	private function onBP_detail64(): Void{ showDetail(63, CurrentPage);}
	private function onBP_detail65(): Void{ showDetail(64, CurrentPage);}
	private function onBP_detail66(): Void{ showDetail(65, CurrentPage);}
	private function onBP_detail67(): Void{ showDetail(66, CurrentPage);}
	private function onBP_detail68(): Void{ showDetail(67, CurrentPage);}
	private function onBP_detail69(): Void{ showDetail(68, CurrentPage);}
	private function onBP_detail70(): Void{ showDetail(69, CurrentPage);}
	private function onBP_detail71(): Void{ showDetail(70, CurrentPage);}
	private function onBP_detail72(): Void{ showDetail(71, CurrentPage);}
	private function onBP_detail73(): Void{ showDetail(72, CurrentPage);}
	private function onBP_detail74(): Void{ showDetail(73, CurrentPage);}
	private function onBP_detail75(): Void{ showDetail(74, CurrentPage);}
	private function onBP_detail76(): Void{ showDetail(75, CurrentPage);}
	private function onBP_detail77(): Void{ showDetail(76, CurrentPage);}
	private function onBP_detail78(): Void{ showDetail(77, CurrentPage);}
	private function onBP_detail79(): Void{ showDetail(78, CurrentPage);}
	private function onBP_detail80(): Void{ showDetail(79, CurrentPage);}
	private function onBP_detail81(): Void{ showDetail(80, CurrentPage);}
	private function onBP_detail82(): Void{ showDetail(81, CurrentPage);}
	private function onBP_detail83(): Void{ showDetail(82, CurrentPage);}
	private function onBP_detail84(): Void{ showDetail(83, CurrentPage);}
	private function onBP_detail85(): Void{ showDetail(84, CurrentPage);}
	private function onBP_detail86(): Void{ showDetail(85, CurrentPage);}
	private function onBP_detail87(): Void{ showDetail(86, CurrentPage);}
	private function onBP_detail88(): Void{ showDetail(87, CurrentPage);}
	private function onBP_detail89(): Void{ showDetail(88, CurrentPage);}
	private function onBP_detail90(): Void{ showDetail(89, CurrentPage);}
	private function onBP_detail91(): Void{ showDetail(90, CurrentPage);}
	private function onBP_detail92(): Void{ showDetail(91, CurrentPage);}
	private function onBP_detail93(): Void{ showDetail(92, CurrentPage);}
	private function onBP_detail94(): Void{ showDetail(93, CurrentPage);}
	private function onBP_detail95(): Void{ showDetail(94, CurrentPage);}
	private function onBP_detail96(): Void{ showDetail(95, CurrentPage);}
	private function onBP_detail97(): Void{ showDetail(96, CurrentPage);}
	private function onBP_detail98(): Void{ showDetail(97, CurrentPage);}
	private function onBP_detail99(): Void{ showDetail(98, CurrentPage);}
	private function onBP_detail100(): Void{ showDetail(99, CurrentPage);}
	private function onBP_detail101(): Void{ showDetail(100, CurrentPage);}
	private function onBP_detail102(): Void{ showDetail(101, CurrentPage);}
	private function onBP_detail103(): Void{ showDetail(102, CurrentPage);}
	private function onBP_detail104(): Void{ showDetail(103, CurrentPage);}
	private function onBP_detail105(): Void{ showDetail(104, CurrentPage);}
	private function onBP_detail106(): Void{ showDetail(105, CurrentPage);}
	private function onBP_detail107(): Void{ showDetail(106, CurrentPage);}
	private function onBP_detail108(): Void{ showDetail(107, CurrentPage);}
	private function onBP_detail109(): Void{ showDetail(108, CurrentPage);}
	private function onBP_detail110(): Void{ showDetail(109, CurrentPage);}
	private function onBP_detail111(): Void{ showDetail(110, CurrentPage);}
	private function onBP_detail112(): Void{ showDetail(111, CurrentPage);}
	private function onBP_detail113(): Void{ showDetail(112, CurrentPage);}
	private function onBP_detail114(): Void{ showDetail(113, CurrentPage);}
	private function onBP_detail115(): Void{ showDetail(114, CurrentPage);}
	private function onBP_detail116(): Void{ showDetail(115, CurrentPage);}
	private function onBP_detail117(): Void{ showDetail(116, CurrentPage);}
	private function onBP_detail118(): Void{ showDetail(117, CurrentPage);}
	private function onBP_detail119(): Void{ showDetail(118, CurrentPage);}
	private function onBP_detail120(): Void{ showDetail(119, CurrentPage);}
	private function onBP_detail121(): Void{ showDetail(120, CurrentPage);}
	private function onBP_detail122(): Void{ showDetail(121, CurrentPage);}
	private function onBP_detail123(): Void{ showDetail(122, CurrentPage);}
	private function onBP_detail124(): Void{ showDetail(123, CurrentPage);}
	private function onBP_detail125(): Void{ showDetail(124, CurrentPage);}
