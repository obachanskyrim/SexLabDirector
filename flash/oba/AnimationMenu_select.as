/* 全選択・全選択解除*/
private function onBP_SelectAll(): Void{
	if (isCreature == true){
		if (c_RegisterCount3 > 0){
			for (var i=0; i<c_RegisterCount3; i++) {
				c_SelectSlots3[i] = true;
			}
		}
		if (c_RegisterCount2 > 0){
			for (var i=0; i<c_RegisterCount2; i++) {
				c_SelectSlots2[i] = true;
			}
		}
		for (var i=0; i<c_RegisterCount1; i++) {
			c_SelectSlots[i] = true;
		}
	} else {
		if (RegisterCount3 > 0){
			for (var i=0; i<RegisterCount3; i++) {
				SelectSlots3[i] = true;
			}
		}
		if (RegisterCount2 > 0){
			for (var i=0; i<RegisterCount2; i++) {
				SelectSlots2[i] = true;
			}
		}
		for (var i=0; i<RegisterCount1; i++) {
			SelectSlots[i] = true;
		}
	}
	displaySelect();
	PlaySound("AllSelect");
}
private function onBP_DeselectAll(): Void{
	if (isCreature == true){
		if (c_RegisterCount3 > 0){
			for (var i=0; i<c_RegisterCount3; i++) {
				c_SelectSlots3[i] = false;
			}
		}
		if (c_RegisterCount2 > 0){
			for (var i=0; i<c_RegisterCount2; i++) {
				c_SelectSlots2[i] = false;
			}
		}
		for (var i=0; i<c_RegisterCount1; i++) {
			c_SelectSlots[i] = false;
		}
	} else {
		if (RegisterCount3 > 0){
			for (var i=0; i<RegisterCount3; i++) {
				SelectSlots3[i] = false;
			}
		}
		if (RegisterCount2 > 0){
			for (var i=0; i<RegisterCount2; i++) {
				SelectSlots2[i] = false;
			}
		}
		for (var i=0; i<RegisterCount1; i++) {
			SelectSlots[i] = false;
		}
	}
	displaySelect();
	PlaySound("AllDefault");
}
private function displaySelect(): Void{
	if (isCreature == true){
		if (CurrentPage == 3){
			for (var i=0; i<c_RegisterCount3; i++) {
				if (c_SelectSlots3[i] == true){
					SlotsArray[i]. gotoAndPlay("select");
				} else {
					SlotsArray[i]. gotoAndPlay("default");
				}
			}
		} else if (CurrentPage == 2){
			for (var i=0; i<c_RegisterCount2; i++) {
				if (c_SelectSlots2[i] == true){
					SlotsArray[i]. gotoAndPlay("select");
				} else {
					SlotsArray[i]. gotoAndPlay("default");
				}
			}
		} else {
			for (var i=0; i<c_RegisterCount1; i++) {
				if (c_SelectSlots[i] == true){
					SlotsArray[i]. gotoAndPlay("select");
				} else {
					SlotsArray[i]. gotoAndPlay("default");
				}
			}
		}
	} else {
		if (CurrentPage == 3){
			for (var i=0; i<RegisterCount3; i++) {
				if (SelectSlots3[i] == true){
					SlotsArray[i]. gotoAndPlay("select");
				} else {
					SlotsArray[i]. gotoAndPlay("default");
				}
			}
		} else if (CurrentPage == 2){
			for (var i=0; i<RegisterCount2; i++) {
				if (SelectSlots2[i] == true){
					SlotsArray[i]. gotoAndPlay("select");
				} else {
					SlotsArray[i]. gotoAndPlay("default");
				}
			}
		} else {
			for (var i=0; i<RegisterCount1; i++) {
				if (SelectSlots[i] == true){
					SlotsArray[i]. gotoAndPlay("select");
				} else {
					SlotsArray[i]. gotoAndPlay("default");
				}
			}
		}
	}
}
/*タグ選択*/
private function onBP_TagWord1(): Void{
	if (isCreature == true){
		if ((TagWord3 == "save") || (TagWord3 == "Save")){
			SaveAnims();
		} else if ((TagWord3 == "load") || (TagWord3 == "Load")){
			LoadAnims();
		} else {
			skse.SendModEvent("TagSearch_c", TagWord3);
		}
	} else {
		if ((TagWord1 == "save") || (TagWord1 == "Save")){
			SaveAnims();
		} else if ((TagWord1 == "load") || (TagWord1 == "Load")){
			LoadAnims();
		} else {
			skse.SendModEvent("TagSearch", TagWord1);
		}
	}
}
private function onBP_TagWord2(): Void{
	if (isCreature == true){
		if ((TagWord4 == "save") || (TagWord4 == "Save")){
			SaveAnims();
		} else if ((TagWord4 == "load") || (TagWord4 == "Load")){
			LoadAnims();
		} else {
			skse.SendModEvent("TagSearch_c", TagWord4);
		}
	} else {
		if ((TagWord2 == "save") || (TagWord2 == "Save")){
			SaveAnims();
		} else if ((TagWord2 == "load") || (TagWord2 == "Load")){
			LoadAnims();
		} else {
			skse.SendModEvent("TagSearch", TagWord2);
		}
	}
}
/*個別の選択*/
private function ClickSlot(a_num: Number): Void{
 	if (isCreature == true){
		if (CurrentPage == 3){
			if (c_SelectSlots3[a_num] == true){
				PlaySound("default");
				c_SelectSlots3[a_num] = false;
				SlotsArray[a_num]. gotoAndPlay("default");
			} else {
				PlaySound("select");
				c_SelectSlots3[a_num] = true;
				SlotsArray[a_num]. gotoAndPlay("select");
			}
		} else if (CurrentPage == 2){
			if (c_SelectSlots2[a_num] == true){
				PlaySound("default");
				c_SelectSlots2[a_num] = false;
				SlotsArray[a_num]. gotoAndPlay("default");
			} else {
				PlaySound("select");
				c_SelectSlots2[a_num] = true;
				SlotsArray[a_num]. gotoAndPlay("select");
			}
		} else {
			if (c_SelectSlots[a_num] == true){
				PlaySound("default");
				c_SelectSlots[a_num] = false;
				SlotsArray[a_num]. gotoAndPlay("default");
			} else {
				PlaySound("select");
				c_SelectSlots[a_num] = true;
				SlotsArray[a_num]. gotoAndPlay("select");
			}
		}
	} else {
		if (CurrentPage == 3){
			if (SelectSlots3[a_num] == true){
				PlaySound("default");
				SelectSlots3[a_num] = false;
				SlotsArray[a_num]. gotoAndPlay("default");
			} else {
				PlaySound("select");
				SelectSlots3[a_num] = true;
				SlotsArray[a_num]. gotoAndPlay("select");
			}
		} else if (CurrentPage == 2){
			if (SelectSlots2[a_num] == true){
				PlaySound("default");
				SelectSlots2[a_num] = false;
				SlotsArray[a_num]. gotoAndPlay("default");
			} else {
				PlaySound("select");
				SelectSlots2[a_num] = true;
				SlotsArray[a_num]. gotoAndPlay("select");
			}
		} else {
			if (SelectSlots[a_num] == true){
				PlaySound("default");
				SelectSlots[a_num] = false;
				SlotsArray[a_num]. gotoAndPlay("default");
			} else {
				PlaySound("select");
				SelectSlots[a_num] = true;
				SlotsArray[a_num]. gotoAndPlay("select");
			}
		}
	}
}
/*各スロット セレクト*/
private function onBP_SelectButton1(): Void{ ClickSlot(0);}
private function onBP_SelectButton2(): Void{ClickSlot(1);}
private function onBP_SelectButton3(): Void{ ClickSlot(2); }
private function onBP_SelectButton4(): Void{ ClickSlot(3); }
private function onBP_SelectButton5(): Void{ ClickSlot(4); }
private function onBP_SelectButton6(): Void{ ClickSlot(5); }
private function onBP_SelectButton7(): Void{ ClickSlot(6); }
private function onBP_SelectButton8(): Void{ ClickSlot(7); }
private function onBP_SelectButton9(): Void{ ClickSlot(8); }
private function onBP_SelectButton10(): Void{ ClickSlot(9); }
private function onBP_SelectButton11(): Void{ ClickSlot(10); }
private function onBP_SelectButton12(): Void{ ClickSlot(11); }
private function onBP_SelectButton13(): Void{ ClickSlot(12); }
private function onBP_SelectButton14(): Void{ ClickSlot(13); }
private function onBP_SelectButton15(): Void{ ClickSlot(14); }
private function onBP_SelectButton16(): Void{ ClickSlot(15); }
private function onBP_SelectButton17(): Void{ ClickSlot(16); }
private function onBP_SelectButton18(): Void{ ClickSlot(17); }
private function onBP_SelectButton19(): Void{ ClickSlot(18); }
private function onBP_SelectButton20(): Void{ ClickSlot(19); }
private function onBP_SelectButton21(): Void{ ClickSlot(20); }
private function onBP_SelectButton22(): Void{ ClickSlot(21); }
private function onBP_SelectButton23(): Void{ ClickSlot(22); }
private function onBP_SelectButton24(): Void{ ClickSlot(23); }
private function onBP_SelectButton25(): Void{ ClickSlot(24); }
private function onBP_SelectButton26(): Void{ ClickSlot(25); }
private function onBP_SelectButton27(): Void{ ClickSlot(26); }
private function onBP_SelectButton28(): Void{ ClickSlot(27); }
private function onBP_SelectButton29(): Void{ ClickSlot(28); }
private function onBP_SelectButton30(): Void{ ClickSlot(29); }
private function onBP_SelectButton31(): Void{ ClickSlot(30); }
private function onBP_SelectButton32(): Void{ ClickSlot(31); }
private function onBP_SelectButton33(): Void{ ClickSlot(32); }
private function onBP_SelectButton34(): Void{ ClickSlot(33); }
private function onBP_SelectButton35(): Void{ ClickSlot(34); }
private function onBP_SelectButton36(): Void{ ClickSlot(35); }
private function onBP_SelectButton37(): Void{ ClickSlot(36); }
private function onBP_SelectButton38(): Void{ ClickSlot(37); }
private function onBP_SelectButton39(): Void{ ClickSlot(38); }
private function onBP_SelectButton40(): Void{ ClickSlot(39); }
private function onBP_SelectButton41(): Void{ ClickSlot(40); }
private function onBP_SelectButton42(): Void{ ClickSlot(41); }
private function onBP_SelectButton43(): Void{ ClickSlot(42); }
private function onBP_SelectButton44(): Void{ ClickSlot(43); }
private function onBP_SelectButton45(): Void{ ClickSlot(44); }
private function onBP_SelectButton46(): Void{ ClickSlot(45); }
private function onBP_SelectButton47(): Void{ ClickSlot(46); }
private function onBP_SelectButton48(): Void{ ClickSlot(47); }
private function onBP_SelectButton49(): Void{ ClickSlot(48); }
private function onBP_SelectButton50(): Void{ ClickSlot(49); }
private function onBP_SelectButton51(): Void{ ClickSlot(50); }
private function onBP_SelectButton52(): Void{ ClickSlot(51); }
private function onBP_SelectButton53(): Void{ ClickSlot(52); }
private function onBP_SelectButton54(): Void{ ClickSlot(53); }
private function onBP_SelectButton55(): Void{ ClickSlot(54); }
private function onBP_SelectButton56(): Void{ ClickSlot(55); }
private function onBP_SelectButton57(): Void{ ClickSlot(56); }
private function onBP_SelectButton58(): Void{ ClickSlot(57); }
private function onBP_SelectButton59(): Void{ ClickSlot(58); }
private function onBP_SelectButton60(): Void{ ClickSlot(59); }
private function onBP_SelectButton61(): Void{ ClickSlot(60); }
private function onBP_SelectButton62(): Void{ ClickSlot(61); }
private function onBP_SelectButton63(): Void{ ClickSlot(62); }
private function onBP_SelectButton64(): Void{ ClickSlot(63); }
private function onBP_SelectButton65(): Void{ ClickSlot(64); }
private function onBP_SelectButton66(): Void{ ClickSlot(65); }
private function onBP_SelectButton67(): Void{ ClickSlot(66); }
private function onBP_SelectButton68(): Void{ ClickSlot(67); }
private function onBP_SelectButton69(): Void{ ClickSlot(68); }
private function onBP_SelectButton70(): Void{ ClickSlot(69); }
private function onBP_SelectButton71(): Void{ ClickSlot(70); }
private function onBP_SelectButton72(): Void{ ClickSlot(71); }
private function onBP_SelectButton73(): Void{ ClickSlot(72); }
private function onBP_SelectButton74(): Void{ ClickSlot(73); }
private function onBP_SelectButton75(): Void{ ClickSlot(74); }
private function onBP_SelectButton76(): Void{ ClickSlot(75); }
private function onBP_SelectButton77(): Void{ ClickSlot(76); }
private function onBP_SelectButton78(): Void{ ClickSlot(77); }
private function onBP_SelectButton79(): Void{ ClickSlot(78); }
private function onBP_SelectButton80(): Void{ ClickSlot(79); }
private function onBP_SelectButton81(): Void{ ClickSlot(80); }
private function onBP_SelectButton82(): Void{ ClickSlot(81); }
private function onBP_SelectButton83(): Void{ ClickSlot(82); }
private function onBP_SelectButton84(): Void{ ClickSlot(83); }
private function onBP_SelectButton85(): Void{ ClickSlot(84); }
private function onBP_SelectButton86(): Void{ ClickSlot(85); }
private function onBP_SelectButton87(): Void{ ClickSlot(86); }
private function onBP_SelectButton88(): Void{ ClickSlot(87); }
private function onBP_SelectButton89(): Void{ ClickSlot(88); }
private function onBP_SelectButton90(): Void{ ClickSlot(89); }
private function onBP_SelectButton91(): Void{ ClickSlot(90); }
private function onBP_SelectButton92(): Void{ ClickSlot(91); }
private function onBP_SelectButton93(): Void{ ClickSlot(92); }
private function onBP_SelectButton94(): Void{ ClickSlot(93); }
private function onBP_SelectButton95(): Void{ ClickSlot(94); }
private function onBP_SelectButton96(): Void{ ClickSlot(95); }
private function onBP_SelectButton97(): Void{ ClickSlot(96); }
private function onBP_SelectButton98(): Void{ ClickSlot(97); }
private function onBP_SelectButton99(): Void{ ClickSlot(98); }
private function onBP_SelectButton100(): Void{ ClickSlot(99); }
private function onBP_SelectButton101(): Void{ ClickSlot(100); }
private function onBP_SelectButton102(): Void{ ClickSlot(101); }
private function onBP_SelectButton103(): Void{ ClickSlot(102); }
private function onBP_SelectButton104(): Void{ ClickSlot(103); }
private function onBP_SelectButton105(): Void{ ClickSlot(104); }
private function onBP_SelectButton106(): Void{ ClickSlot(105); }
private function onBP_SelectButton107(): Void{ ClickSlot(106); }
private function onBP_SelectButton108(): Void{ ClickSlot(107); }
private function onBP_SelectButton109(): Void{ ClickSlot(108); }
private function onBP_SelectButton110(): Void{ ClickSlot(109); }
private function onBP_SelectButton111(): Void{ ClickSlot(110); }
private function onBP_SelectButton112(): Void{ ClickSlot(111); }
private function onBP_SelectButton113(): Void{ ClickSlot(112); }
private function onBP_SelectButton114(): Void{ ClickSlot(113); }
private function onBP_SelectButton115(): Void{ ClickSlot(114); }
private function onBP_SelectButton116(): Void{ ClickSlot(115); }
private function onBP_SelectButton117(): Void{ ClickSlot(116); }
private function onBP_SelectButton118(): Void{ ClickSlot(117); }
private function onBP_SelectButton119(): Void{ ClickSlot(118); }
private function onBP_SelectButton120(): Void{ ClickSlot(119); }
private function onBP_SelectButton121(): Void{ ClickSlot(120); }
private function onBP_SelectButton122(): Void{ ClickSlot(121); }
private function onBP_SelectButton123(): Void{ ClickSlot(122); }
private function onBP_SelectButton124(): Void{ ClickSlot(123); }
private function onBP_SelectButton125(): Void{ ClickSlot(124); }