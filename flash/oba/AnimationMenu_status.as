/* Enabled ボタンを押した時*/
private function onBP_Enabled_plus(): Void{
	if (isCreature == true){
		for (var i=0; i<c_RegisterCount3; i++) {
			if (c_SelectSlots3[i] == true){
				c_EnabledArray3[i] = true;
			}
		}
		for (var i=0; i<c_RegisterCount2; i++) {
			if (c_SelectSlots2[i] == true){
				c_EnabledArray2[i] = true;
			}
		}
		for (var i=0; i<c_RegisterCount1; i++) {
			if (c_SelectSlots[i] == true){
				c_EnabledArray1[i] = true;
			}
		}
	} else {
		for (var i=0; i<RegisterCount3; i++) {
			if (SelectSlots3[i] == true){
				EnabledArray3[i] = true;
			}
		}
		for (var i=0; i<RegisterCount2; i++) {
			if (SelectSlots2[i] == true){
				EnabledArray2[i] = true;
			}
		}
		for (var i=0; i<RegisterCount1; i++) {
			if (SelectSlots[i] == true){
				EnabledArray1[i] = true;
			}
		}
	}
	displayIcon("Enabled");
	displayEditCount("Enabled");
	btn_Enabled_plus.gotoAndStop("up");
	PlaySound("AllSelect");
}
private function onBP_Enabled_minus(): Void{
	if (isCreature == true){
		for (var i=0; i<c_RegisterCount3; i++) {
			if (c_SelectSlots3[i] == true){
				c_EnabledArray3[i] = false;
			}
		}
		for (var i=0; i<c_RegisterCount2; i++) {
			if (c_SelectSlots2[i] == true){
				c_EnabledArray2[i] = false;
			}
		}
		for (var i=0; i<c_RegisterCount1; i++) {
			if (c_SelectSlots[i] == true){
				c_EnabledArray1[i] = false;
			}
		}
	} else {
		for (var i=0; i<RegisterCount3; i++) {
			if (SelectSlots3[i] == true){
				EnabledArray3[i] = false;
			}
		}
		for (var i=0; i<RegisterCount2; i++) {
			if (SelectSlots2[i] == true){
				EnabledArray2[i] = false;
			}
		}
		for (var i=0; i<RegisterCount1; i++) {
			if (SelectSlots[i] == true){
				EnabledArray1[i] = false;
			}
		}
	}
	displayIcon("Enabled");
	displayEditCount("Enabled");
	btn_Enabled_minus.gotoAndStop("up");
	PlaySound("AllDefault");
}
/* LeadIn ボタンを押した時*/
private function onBP_LeadIn_plus(): Void{
	if (isCreature == true){
	} else {
		for (var i=0; i<RegisterCount3; i++) {
			if (SelectSlots3[i] == true){
				LeadInArray3[i] = true;
			}
		}
		for (var i=0; i<RegisterCount2; i++) {
			if (SelectSlots2[i] == true){
				LeadInArray2[i] = true;
			}
		}
		for (var i=0; i<RegisterCount1; i++) {
			if (SelectSlots[i] == true){
				LeadInArray1[i] = true;
			}
		}
	}
	PlaySound("AllSelect");
	displayIcon("LeadIn");
	displayEditCount("LeadIn");
	btn_LeadIn_plus.gotoAndStop("up");
}
private function onBP_LeadIn_minus(): Void{
	if (isCreature == true){
	} else {
		for (var i=0; i<RegisterCount3; i++) {
			if (SelectSlots3[i] == true){
				LeadInArray3[i] = false;
			}
		}
		for (var i=0; i<RegisterCount2; i++) {
			if (SelectSlots2[i] == true){
				LeadInArray2[i] = false;
			}
		}
		for (var i=0; i<RegisterCount1; i++) {
			if (SelectSlots[i] == true){
				LeadInArray1[i] = false;
			}
		}
	}
	PlaySound("AllDefault");
	displayIcon("LeadIn");
	displayEditCount("LeadIn");
	btn_LeadIn_minus.gotoAndStop("up");
}
/* Aggressive ボタンを押した時*/
private function onBP_Aggressive_plus(): Void{
	if (isCreature == true){
	} else {
		for (var i=0; i<RegisterCount3; i++) {
			if (SelectSlots3[i] == true){
				AggressiveArray3[i] = true;
			}
		}
		for (var i=0; i<RegisterCount2; i++) {
			if (SelectSlots2[i] == true){
				AggressiveArray2[i] = true;
			}
		}
		for (var i=0; i<RegisterCount1; i++) {
			if (SelectSlots[i] == true){
				AggressiveArray1[i] = true;
			}
		}
	}	PlaySound("AllSelect");
	displayIcon("Aggressive");
	displayEditCount("Aggressive");
	btn_Aggressive_plus.gotoAndStop("up");
}
private function onBP_Aggressive_minus(): Void{
	if (isCreature == true){
	} else {
		for (var i=0; i<RegisterCount3; i++) {
			if (SelectSlots3[i] == true){
				AggressiveArray3[i] = false;
			}
		}
		for (var i=0; i<RegisterCount2; i++) {
			if (SelectSlots2[i] == true){
				AggressiveArray2[i] = false;
			}
		}
		for (var i=0; i<RegisterCount1; i++) {
			if (SelectSlots[i] == true){
				AggressiveArray1[i] = false;
			}
		}
	}
	PlaySound("AllDefault");
	displayIcon("Aggressive");
	displayEditCount("Aggressive");
	btn_Aggressive_minus.gotoAndStop("up");
}