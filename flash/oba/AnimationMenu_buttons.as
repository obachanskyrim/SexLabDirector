﻿function setInitButtons(): Void{
	/*人間・クリーチャー切り替え*/
	Human.addEventListener("press", this, "onBP_Human");
	Creature.addEventListener("press", this, "onBP_Creature");

	/*ページネ－ション*/
	btn_prev.addEventListener("press", this, "onBP_PagePrev");
	btn_next.addEventListener("press", this, "onBP_PageNext");

	/*詳細画面のボタン*/
	btn_detail_Enabled.addEventListener("press", this, "onBP_detail_Enabled");
	btn_detail_LeadIn.addEventListener("press", this, "onBP_detail_LeadIn");
	btn_detail_aggressive.addEventListener("press", this, "onBP_detail_aggressive");
	btn_detail_pageprev.addEventListener("press", this, "onBP_detail_pageprev");
	btn_detail_pagenext.addEventListener("press", this, "onBP_detail_pagenext");
	btn_close_detail.addEventListener("press", this, "onBP_detail_close");

	/*ステータス編集ボタン*/
	btn_Enabled_plus.addEventListener("press", this, "onBP_Enabled_plus");
	btn_Enabled_minus.addEventListener("press", this, "onBP_Enabled_minus");
	btn_LeadIn_plus.addEventListener("press", this, "onBP_LeadIn_plus");
	btn_LeadIn_minus.addEventListener("press", this, "onBP_LeadIn_minus");
	btn_Aggressive_plus.addEventListener("press", this, "onBP_Aggressive_plus");
	btn_Aggressive_minus.addEventListener("press", this, "onBP_Aggressive_minus");

	/*タグ選択ボタン*/
	tag1.addEventListener("press", this, "onBP_SelectAll");
	tag2.addEventListener("press", this, "onBP_DeselectAll");
	tag3.addEventListener("press", this, "onBP_TagWord1");
	tag4.addEventListener("press", this, "onBP_TagWord2");
	btn_edit1.addEventListener("press", this, "onBP_tagedit1");
	btn_edit2.addEventListener("press", this, "onBP_tagedit2");

	/*タグ編集画面*/
	btn_tagword1.addEventListener("press", this, "onBP_tagword1");
	btn_tagword2.addEventListener("press", this, "onBP_tagword2");
	btn_tagword3.addEventListener("press", this, "onBP_tagword3");
	btn_tagword4.addEventListener("press", this, "onBP_tagword4");
	btn_tagword5.addEventListener("press", this, "onBP_tagword5");
	btn_tagword6.addEventListener("press", this, "onBP_tagword6");
	btn_tagword7.addEventListener("press", this, "onBP_tagword7");
	btn_tagword8.addEventListener("press", this, "onBP_tagword8");
	btn_tagword9.addEventListener("press", this, "onBP_tagword9");
	btn_tagword10.addEventListener("press", this, "onBP_tagword10");
	btn_tagword11.addEventListener("press", this, "onBP_tagword11");
	btn_tagword12.addEventListener("press", this, "onBP_tagword12");
	btn_tagword13.addEventListener("press", this, "onBP_tagword13");
	btn_tagword14.addEventListener("press", this, "onBP_tagword14");
	btn_tagword15.addEventListener("press", this, "onBP_tagword15");
	btn_tagword16.addEventListener("press", this, "onBP_tagword16");
	btn_ok.addEventListener("press", this, "onBP_taginput_ok");
	btn_cancel.addEventListener("press", this, "onBP_taginput_cancel");

	/*スロット枠のセレクトボタン*/
	SelectButton1.addEventListener("press", this, "onBP_SelectButton1");
		SelectButton2.addEventListener("press", this, "onBP_SelectButton2");
		SelectButton3.addEventListener("press", this, "onBP_SelectButton3");
		SelectButton4.addEventListener("press", this, "onBP_SelectButton4");
		SelectButton5.addEventListener("press", this, "onBP_SelectButton5");
		SelectButton6.addEventListener("press", this, "onBP_SelectButton6");
		SelectButton7.addEventListener("press", this, "onBP_SelectButton7");
		SelectButton8.addEventListener("press", this, "onBP_SelectButton8");
		SelectButton9.addEventListener("press", this, "onBP_SelectButton9");
		SelectButton10.addEventListener("press", this, "onBP_SelectButton10");
		SelectButton11.addEventListener("press", this, "onBP_SelectButton11");
		SelectButton12.addEventListener("press", this, "onBP_SelectButton12");
		SelectButton13.addEventListener("press", this, "onBP_SelectButton13");
		SelectButton14.addEventListener("press", this, "onBP_SelectButton14");
		SelectButton15.addEventListener("press", this, "onBP_SelectButton15");
		SelectButton16.addEventListener("press", this, "onBP_SelectButton16");
		SelectButton17.addEventListener("press", this, "onBP_SelectButton17");
		SelectButton18.addEventListener("press", this, "onBP_SelectButton18");
		SelectButton19.addEventListener("press", this, "onBP_SelectButton19");
		SelectButton20.addEventListener("press", this, "onBP_SelectButton20");
		SelectButton21.addEventListener("press", this, "onBP_SelectButton21");
		SelectButton22.addEventListener("press", this, "onBP_SelectButton22");
		SelectButton23.addEventListener("press", this, "onBP_SelectButton23");
		SelectButton24.addEventListener("press", this, "onBP_SelectButton24");
		SelectButton25.addEventListener("press", this, "onBP_SelectButton25");
		SelectButton26.addEventListener("press", this, "onBP_SelectButton26");
		SelectButton27.addEventListener("press", this, "onBP_SelectButton27");
		SelectButton28.addEventListener("press", this, "onBP_SelectButton28");
		SelectButton29.addEventListener("press", this, "onBP_SelectButton29");
		SelectButton30.addEventListener("press", this, "onBP_SelectButton30");
		SelectButton31.addEventListener("press", this, "onBP_SelectButton31");
		SelectButton32.addEventListener("press", this, "onBP_SelectButton32");
		SelectButton33.addEventListener("press", this, "onBP_SelectButton33");
		SelectButton34.addEventListener("press", this, "onBP_SelectButton34");
		SelectButton35.addEventListener("press", this, "onBP_SelectButton35");
		SelectButton36.addEventListener("press", this, "onBP_SelectButton36");
		SelectButton37.addEventListener("press", this, "onBP_SelectButton37");
		SelectButton38.addEventListener("press", this, "onBP_SelectButton38");
		SelectButton39.addEventListener("press", this, "onBP_SelectButton39");
		SelectButton40.addEventListener("press", this, "onBP_SelectButton40");
		SelectButton41.addEventListener("press", this, "onBP_SelectButton41");
		SelectButton42.addEventListener("press", this, "onBP_SelectButton42");
		SelectButton43.addEventListener("press", this, "onBP_SelectButton43");
		SelectButton44.addEventListener("press", this, "onBP_SelectButton44");
		SelectButton45.addEventListener("press", this, "onBP_SelectButton45");
		SelectButton46.addEventListener("press", this, "onBP_SelectButton46");
		SelectButton47.addEventListener("press", this, "onBP_SelectButton47");
		SelectButton48.addEventListener("press", this, "onBP_SelectButton48");
		SelectButton49.addEventListener("press", this, "onBP_SelectButton49");
		SelectButton50.addEventListener("press", this, "onBP_SelectButton50");
		SelectButton51.addEventListener("press", this, "onBP_SelectButton51");
		SelectButton52.addEventListener("press", this, "onBP_SelectButton52");
		SelectButton53.addEventListener("press", this, "onBP_SelectButton53");
		SelectButton54.addEventListener("press", this, "onBP_SelectButton54");
		SelectButton55.addEventListener("press", this, "onBP_SelectButton55");
		SelectButton56.addEventListener("press", this, "onBP_SelectButton56");
		SelectButton57.addEventListener("press", this, "onBP_SelectButton57");
		SelectButton58.addEventListener("press", this, "onBP_SelectButton58");
		SelectButton59.addEventListener("press", this, "onBP_SelectButton59");
		SelectButton60.addEventListener("press", this, "onBP_SelectButton60");
		SelectButton61.addEventListener("press", this, "onBP_SelectButton61");
		SelectButton62.addEventListener("press", this, "onBP_SelectButton62");
		SelectButton63.addEventListener("press", this, "onBP_SelectButton63");
		SelectButton64.addEventListener("press", this, "onBP_SelectButton64");
		SelectButton65.addEventListener("press", this, "onBP_SelectButton65");
		SelectButton66.addEventListener("press", this, "onBP_SelectButton66");
		SelectButton67.addEventListener("press", this, "onBP_SelectButton67");
		SelectButton68.addEventListener("press", this, "onBP_SelectButton68");
		SelectButton69.addEventListener("press", this, "onBP_SelectButton69");
		SelectButton70.addEventListener("press", this, "onBP_SelectButton70");
		SelectButton71.addEventListener("press", this, "onBP_SelectButton71");
		SelectButton72.addEventListener("press", this, "onBP_SelectButton72");
		SelectButton73.addEventListener("press", this, "onBP_SelectButton73");
		SelectButton74.addEventListener("press", this, "onBP_SelectButton74");
		SelectButton75.addEventListener("press", this, "onBP_SelectButton75");
		SelectButton76.addEventListener("press", this, "onBP_SelectButton76");
		SelectButton77.addEventListener("press", this, "onBP_SelectButton77");
		SelectButton78.addEventListener("press", this, "onBP_SelectButton78");
		SelectButton79.addEventListener("press", this, "onBP_SelectButton79");
		SelectButton80.addEventListener("press", this, "onBP_SelectButton80");
		SelectButton81.addEventListener("press", this, "onBP_SelectButton81");
		SelectButton82.addEventListener("press", this, "onBP_SelectButton82");
		SelectButton83.addEventListener("press", this, "onBP_SelectButton83");
		SelectButton84.addEventListener("press", this, "onBP_SelectButton84");
		SelectButton85.addEventListener("press", this, "onBP_SelectButton85");
		SelectButton86.addEventListener("press", this, "onBP_SelectButton86");
		SelectButton87.addEventListener("press", this, "onBP_SelectButton87");
		SelectButton88.addEventListener("press", this, "onBP_SelectButton88");
		SelectButton89.addEventListener("press", this, "onBP_SelectButton89");
		SelectButton90.addEventListener("press", this, "onBP_SelectButton90");
		SelectButton91.addEventListener("press", this, "onBP_SelectButton91");
		SelectButton92.addEventListener("press", this, "onBP_SelectButton92");
		SelectButton93.addEventListener("press", this, "onBP_SelectButton93");
		SelectButton94.addEventListener("press", this, "onBP_SelectButton94");
		SelectButton95.addEventListener("press", this, "onBP_SelectButton95");
		SelectButton96.addEventListener("press", this, "onBP_SelectButton96");
		SelectButton97.addEventListener("press", this, "onBP_SelectButton97");
		SelectButton98.addEventListener("press", this, "onBP_SelectButton98");
		SelectButton99.addEventListener("press", this, "onBP_SelectButton99");
		SelectButton100.addEventListener("press", this, "onBP_SelectButton100");
		SelectButton101.addEventListener("press", this, "onBP_SelectButton101");
		SelectButton102.addEventListener("press", this, "onBP_SelectButton102");
		SelectButton103.addEventListener("press", this, "onBP_SelectButton103");
		SelectButton104.addEventListener("press", this, "onBP_SelectButton104");
		SelectButton105.addEventListener("press", this, "onBP_SelectButton105");
		SelectButton106.addEventListener("press", this, "onBP_SelectButton106");
		SelectButton107.addEventListener("press", this, "onBP_SelectButton107");
		SelectButton108.addEventListener("press", this, "onBP_SelectButton108");
		SelectButton109.addEventListener("press", this, "onBP_SelectButton109");
		SelectButton110.addEventListener("press", this, "onBP_SelectButton110");
		SelectButton111.addEventListener("press", this, "onBP_SelectButton111");
		SelectButton112.addEventListener("press", this, "onBP_SelectButton112");
		SelectButton113.addEventListener("press", this, "onBP_SelectButton113");
		SelectButton114.addEventListener("press", this, "onBP_SelectButton114");
		SelectButton115.addEventListener("press", this, "onBP_SelectButton115");
		SelectButton116.addEventListener("press", this, "onBP_SelectButton116");
		SelectButton117.addEventListener("press", this, "onBP_SelectButton117");
		SelectButton118.addEventListener("press", this, "onBP_SelectButton118");
		SelectButton119.addEventListener("press", this, "onBP_SelectButton119");
		SelectButton120.addEventListener("press", this, "onBP_SelectButton120");
		SelectButton121.addEventListener("press", this, "onBP_SelectButton121");
		SelectButton122.addEventListener("press", this, "onBP_SelectButton122");
		SelectButton123.addEventListener("press", this, "onBP_SelectButton123");
		SelectButton124.addEventListener("press", this, "onBP_SelectButton124");
		SelectButton125.addEventListener("press", this, "onBP_SelectButton125");

	/*スロット枠の詳細ボタン*/
	btn_detail1.addEventListener("press", this, "onBP_detail1");
		btn_detail2.addEventListener("press", this, "onBP_detail2");
		btn_detail3.addEventListener("press", this, "onBP_detail3");
		btn_detail4.addEventListener("press", this, "onBP_detail4");
		btn_detail5.addEventListener("press", this, "onBP_detail5");
		btn_detail6.addEventListener("press", this, "onBP_detail6");
		btn_detail7.addEventListener("press", this, "onBP_detail7");
		btn_detail8.addEventListener("press", this, "onBP_detail8");
		btn_detail9.addEventListener("press", this, "onBP_detail9");
		btn_detail10.addEventListener("press", this, "onBP_detail10");
		btn_detail11.addEventListener("press", this, "onBP_detail11");
		btn_detail12.addEventListener("press", this, "onBP_detail12");
		btn_detail13.addEventListener("press", this, "onBP_detail13");
		btn_detail14.addEventListener("press", this, "onBP_detail14");
		btn_detail15.addEventListener("press", this, "onBP_detail15");
		btn_detail16.addEventListener("press", this, "onBP_detail16");
		btn_detail17.addEventListener("press", this, "onBP_detail17");
		btn_detail18.addEventListener("press", this, "onBP_detail18");
		btn_detail19.addEventListener("press", this, "onBP_detail19");
		btn_detail20.addEventListener("press", this, "onBP_detail20");
		btn_detail21.addEventListener("press", this, "onBP_detail21");
		btn_detail22.addEventListener("press", this, "onBP_detail22");
		btn_detail23.addEventListener("press", this, "onBP_detail23");
		btn_detail24.addEventListener("press", this, "onBP_detail24");
		btn_detail25.addEventListener("press", this, "onBP_detail25");
		btn_detail26.addEventListener("press", this, "onBP_detail26");
		btn_detail27.addEventListener("press", this, "onBP_detail27");
		btn_detail28.addEventListener("press", this, "onBP_detail28");
		btn_detail29.addEventListener("press", this, "onBP_detail29");
		btn_detail30.addEventListener("press", this, "onBP_detail30");
		btn_detail31.addEventListener("press", this, "onBP_detail31");
		btn_detail32.addEventListener("press", this, "onBP_detail32");
		btn_detail33.addEventListener("press", this, "onBP_detail33");
		btn_detail34.addEventListener("press", this, "onBP_detail34");
		btn_detail35.addEventListener("press", this, "onBP_detail35");
		btn_detail36.addEventListener("press", this, "onBP_detail36");
		btn_detail37.addEventListener("press", this, "onBP_detail37");
		btn_detail38.addEventListener("press", this, "onBP_detail38");
		btn_detail39.addEventListener("press", this, "onBP_detail39");
		btn_detail40.addEventListener("press", this, "onBP_detail40");
		btn_detail41.addEventListener("press", this, "onBP_detail41");
		btn_detail42.addEventListener("press", this, "onBP_detail42");
		btn_detail43.addEventListener("press", this, "onBP_detail43");
		btn_detail44.addEventListener("press", this, "onBP_detail44");
		btn_detail45.addEventListener("press", this, "onBP_detail45");
		btn_detail46.addEventListener("press", this, "onBP_detail46");
		btn_detail47.addEventListener("press", this, "onBP_detail47");
		btn_detail48.addEventListener("press", this, "onBP_detail48");
		btn_detail49.addEventListener("press", this, "onBP_detail49");
		btn_detail50.addEventListener("press", this, "onBP_detail50");
		btn_detail51.addEventListener("press", this, "onBP_detail51");
		btn_detail52.addEventListener("press", this, "onBP_detail52");
		btn_detail53.addEventListener("press", this, "onBP_detail53");
		btn_detail54.addEventListener("press", this, "onBP_detail54");
		btn_detail55.addEventListener("press", this, "onBP_detail55");
		btn_detail56.addEventListener("press", this, "onBP_detail56");
		btn_detail57.addEventListener("press", this, "onBP_detail57");
		btn_detail58.addEventListener("press", this, "onBP_detail58");
		btn_detail59.addEventListener("press", this, "onBP_detail59");
		btn_detail60.addEventListener("press", this, "onBP_detail60");
		btn_detail61.addEventListener("press", this, "onBP_detail61");
		btn_detail62.addEventListener("press", this, "onBP_detail62");
		btn_detail63.addEventListener("press", this, "onBP_detail63");
		btn_detail64.addEventListener("press", this, "onBP_detail64");
		btn_detail65.addEventListener("press", this, "onBP_detail65");
		btn_detail66.addEventListener("press", this, "onBP_detail66");
		btn_detail67.addEventListener("press", this, "onBP_detail67");
		btn_detail68.addEventListener("press", this, "onBP_detail68");
		btn_detail69.addEventListener("press", this, "onBP_detail69");
		btn_detail70.addEventListener("press", this, "onBP_detail70");
		btn_detail71.addEventListener("press", this, "onBP_detail71");
		btn_detail72.addEventListener("press", this, "onBP_detail72");
		btn_detail73.addEventListener("press", this, "onBP_detail73");
		btn_detail74.addEventListener("press", this, "onBP_detail74");
		btn_detail75.addEventListener("press", this, "onBP_detail75");
		btn_detail76.addEventListener("press", this, "onBP_detail76");
		btn_detail77.addEventListener("press", this, "onBP_detail77");
		btn_detail78.addEventListener("press", this, "onBP_detail78");
		btn_detail79.addEventListener("press", this, "onBP_detail79");
		btn_detail80.addEventListener("press", this, "onBP_detail80");
		btn_detail81.addEventListener("press", this, "onBP_detail81");
		btn_detail82.addEventListener("press", this, "onBP_detail82");
		btn_detail83.addEventListener("press", this, "onBP_detail83");
		btn_detail84.addEventListener("press", this, "onBP_detail84");
		btn_detail85.addEventListener("press", this, "onBP_detail85");
		btn_detail86.addEventListener("press", this, "onBP_detail86");
		btn_detail87.addEventListener("press", this, "onBP_detail87");
		btn_detail88.addEventListener("press", this, "onBP_detail88");
		btn_detail89.addEventListener("press", this, "onBP_detail89");
		btn_detail90.addEventListener("press", this, "onBP_detail90");
		btn_detail91.addEventListener("press", this, "onBP_detail91");
		btn_detail92.addEventListener("press", this, "onBP_detail92");
		btn_detail93.addEventListener("press", this, "onBP_detail93");
		btn_detail94.addEventListener("press", this, "onBP_detail94");
		btn_detail95.addEventListener("press", this, "onBP_detail95");
		btn_detail96.addEventListener("press", this, "onBP_detail96");
		btn_detail97.addEventListener("press", this, "onBP_detail97");
		btn_detail98.addEventListener("press", this, "onBP_detail98");
		btn_detail99.addEventListener("press", this, "onBP_detail99");
		btn_detail100.addEventListener("press", this, "onBP_detail100");
		btn_detail101.addEventListener("press", this, "onBP_detail101");
		btn_detail102.addEventListener("press", this, "onBP_detail102");
		btn_detail103.addEventListener("press", this, "onBP_detail103");
		btn_detail104.addEventListener("press", this, "onBP_detail104");
		btn_detail105.addEventListener("press", this, "onBP_detail105");
		btn_detail106.addEventListener("press", this, "onBP_detail106");
		btn_detail107.addEventListener("press", this, "onBP_detail107");
		btn_detail108.addEventListener("press", this, "onBP_detail108");
		btn_detail109.addEventListener("press", this, "onBP_detail109");
		btn_detail110.addEventListener("press", this, "onBP_detail110");
		btn_detail111.addEventListener("press", this, "onBP_detail111");
		btn_detail112.addEventListener("press", this, "onBP_detail112");
		btn_detail113.addEventListener("press", this, "onBP_detail113");
		btn_detail114.addEventListener("press", this, "onBP_detail114");
		btn_detail115.addEventListener("press", this, "onBP_detail115");
		btn_detail116.addEventListener("press", this, "onBP_detail116");
		btn_detail117.addEventListener("press", this, "onBP_detail117");
		btn_detail118.addEventListener("press", this, "onBP_detail118");
		btn_detail119.addEventListener("press", this, "onBP_detail119");
		btn_detail120.addEventListener("press", this, "onBP_detail120");
		btn_detail121.addEventListener("press", this, "onBP_detail121");
		btn_detail122.addEventListener("press", this, "onBP_detail122");
		btn_detail123.addEventListener("press", this, "onBP_detail123");
		btn_detail124.addEventListener("press", this, "onBP_detail124");
		btn_detail125.addEventListener("press", this, "onBP_detail125");

}
