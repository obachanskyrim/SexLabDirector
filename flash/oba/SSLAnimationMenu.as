import gfx.io.GameDelegate;
import gfx.managers.FocusHandler;
import gfx.ui.InputDetails;
import gfx.ui.NavigationCode;
import Shared.GlobalFunc;
import gfx.controls.Button;
import gfx.controls.TextInput;
import skyui.components.ButtonPanel;
import skyui.defines.Input;
import skyui.util.GlobalFunctions;
import skyui.util.Translator;
import flash.geom.Transform;
import flash.geom.ColorTransform;
import flash.geom.Matrix;

class oba.SSLAnimationMenu extends MovieClip
{
	#include "AnimationMenu_value.as"
	#include "AnimationMenu_contents.as"
	#include "AnimationMenu_array.as"
	#include "AnimationMenu_buttons.as"
	#include "AnimationMenu_initset.as"
	#include "AnimationMenu_sound.as"
	#include "AnimationMenu_status.as"
	#include "AnimationMenu_page.as"
	#include "AnimationMenu_select.as"
	#include "AnimationMenu_TagEdit.as"
	#include "AnimationMenu_EndMenu.as"
	#include "AnimationMenu_getGameData.as"
	#include "AnimationMenu_detail.as"
	#include "AnimationMenu_saveload.as"

/*Private Value*/
	private var requestDataId_: Number; // メニューが開いた際にSKSEとの交信で使用する

	private var isPlayingNow: Boolean; // 現在セックス中かどうか
	private var isCreatureNow: Boolean;
	private var isAggressiveNow: Boolean;
	private var NowAnimSetNum: Number;
	private var NowAnimNum: Number;
	private var NowCurrentStage: Number;

	private var CurrentPage: Number; // 現在の表示ページ
	private var PageCount: Number; // ページの総数
	private var RegisterMax: Number; // 350 or 125
	private var showThumbnail: Boolean; // サムネイルの表示
	private var RegisterCount1: Number; // 登録済のスロット数
	private var RegisterCount2: Number;
	private var RegisterCount3: Number;
	private var TagWord1: String;
	private var TagWord2: String;
	private var TagWord3: String;
	private var TagWord4: String;
	private var TagSelectWord1: String;
	private var TagSelectWord2: String;
	private var TagSelectWord3: String;
	private var TagSelectWord4: String;
	private var TagSelectWord5: String;
	private var TagSelectWord6: String;
	private var TagSelectWord7: String;
	private var TagSelectWord8: String;
	private var TagSelectWord9: String;
	private var TagSelectWord10: String;
	private var TagSelectWord11: String;
	private var TagSelectWord12: String;
	private var TagSelectWord13: String;
	private var TagSelectWord14: String;
	private var TagSelectWord15: String;
	private var TagSelectWord16: String;
	private var TagEditMode: Number; // どちらのEditボタンを編集中か
	private var AnimationNames1: Array; // アニメーション名
	private var AnimationNames2: Array;
	private var AnimationNames3: Array;
	private var RegisterNames1: Array; // レジスト名
	private var RegisterNames2: Array;
	private var RegisterNames3: Array;
	private var EnabledArray1: Array;
	private var EnabledArray2: Array;
	private var EnabledArray3: Array;
	private var LeadInArray1: Array;
	private var LeadInArray2: Array;
	private var LeadInArray3: Array;
	private var AggressiveArray1: Array;
	private var AggressiveArray2: Array;
	private var AggressiveArray3: Array;
	private var AnimationNameTexts: Array; // アニメーション名表示用のテキストフィールドをまとめた配列
	private var NumTexts: Array; // 通しナンバーのテキストフィールドをまとめた配列
	private var SlotsArray: Array; // スロット枠のムービークリップをまとめて格納する
	private var SelectButtonArray: Array; // セレクト用のボタンをまとめて格納する
	private var detailButtonArray: Array; // 詳細ボタンをまとめて格納する
	private var IconEnabledArray: Array; // 各スロットのEnabledアイコンをまとめて格納する
	private var IconLeadInArray: Array; // 各スロットのLeadInアイコンをまとめて格納する
	private var IconAggressiveArray: Array; // 各スロットのAggressiveアイコンをまとめて格納する
	private var SelectSlots: Array; // スロットが選択状態にあるかどうかを格納する
	private var SelectSlots2: Array;
	private var SelectSlots3: Array;
	private var FinishedEnabled: Number; // 設定完了したフラグのカウント
	private var FinishedLeadIn: Number;
	private var FinishedAggressive: Number;
	private var CurrentDetailNum: Number; // 現在詳細画面で表示中のアニメーション番号
	private var CurrentDetailPage: Number; // 現在詳細画面で表示中のアニメーションのページ
	private var DetailTags: Array; // 現在詳細画面で表示中のアニメーションのタグ
	private var ic_d_anchor: Number; // $アイコンのx座標
	private var thumb1: MovieClip;
	private var thumb2: MovieClip;
	private var thumb3: MovieClip;
	private var thumb4: MovieClip;
	private var thumb5: MovieClip;
	private var thumb6: MovieClip;
	private var thumb7: MovieClip;
	private var thumb8: MovieClip;
	private var thumb9: MovieClip;
	private var thumb10: MovieClip;
	private var SaveArray: Array; // 選択したアニメのレジスト名を保存する
	private var FinishLoad: Boolean;

	private var isCreature: Boolean;
	private var c_PageCount: Number;
	private var c_RegisterCount1: Number;
	private var c_RegisterCount2: Number;
	private var c_RegisterCount3: Number;
	private var c_TagSelectWord1: String;
	private var c_TagSelectWord2: String;
	private var c_TagSelectWord3: String;
	private var c_TagSelectWord4: String;
	private var c_TagSelectWord5: String;
	private var c_TagSelectWord6: String;
	private var c_TagSelectWord7: String;
	private var c_TagSelectWord8: String;
	private var c_TagSelectWord9: String;
	private var c_TagSelectWord10: String;
	private var c_TagSelectWord11: String;
	private var c_TagSelectWord12: String;
	private var c_TagSelectWord13: String;
	private var c_TagSelectWord14: String;
	private var c_TagSelectWord15: String;
	private var c_TagSelectWord16: String;
	private var c_AnimationNames1: Array; // アニメーション名
	private var c_AnimationNames2: Array;
	private var c_AnimationNames3: Array;
	private var c_RegisterNames1: Array; // レジスト名
	private var c_RegisterNames2: Array;
	private var c_RegisterNames3: Array;
	private var c_EnabledArray1: Array;
	private var c_EnabledArray2: Array;
	private var c_EnabledArray3: Array;
	private var c_SelectSlots: Array; // スロットが選択状態にあるかどうかを格納する
	private var c_SelectSlots2: Array;
	private var c_SelectSlots3: Array;
	private var FinishedCreature: Number; // 設定完了したフラグのカウント

/* コンストラクタ */
	public function SSLAnimationMenu(){
		super();
		AnimationNames1 = [];
		AnimationNames2 = [];
		AnimationNames3 = [];
		RegisterNames1 = [];
		RegisterNames2 = [];
		RegisterNames3 = [];
		EnabledArray1 = [];
		EnabledArray2 = [];
		EnabledArray3 = [];
		LeadInArray1 = [];
		LeadInArray2 = [];
		LeadInArray3 = [];
		AggressiveArray1 = [];
		AggressiveArray2 = [];
		AggressiveArray3 = [];
		AnimationNameTexts = [];
		NumTexts = [];
		SlotsArray = [];
		SelectButtonArray = [];
		detailButtonArray = [];
		IconEnabledArray = [];
		IconLeadInArray = [];
		IconAggressiveArray = [];
		SelectSlots = [];
		SelectSlots2 = [];
		SelectSlots3 = [];
		CurrentPage = 1;
		FinishedEnabled = 0;
		FinishedLeadIn = 0;
		FinishedAggressive = 0;
		DetailTags = [];

		c_AnimationNames1 = [];
		c_AnimationNames2 = [];
		c_AnimationNames3 = [];
		c_RegisterNames1 = [];
		c_RegisterNames2 = [];
		c_RegisterNames3 = [];
		c_EnabledArray1 = [];
		c_EnabledArray2 = [];
		c_EnabledArray3 = [];
		c_SelectSlots = [];
		c_SelectSlots2 = [];
		c_SelectSlots3 = [];
		FinishedCreature = 0;
	}

/* コンテンツがロードされた時の初期化処理 */
	public function onLoad(){
		super.onLoad();
		setContents();
		initArray();
		setInitButtons();
		isPlayingNow = false;
		showThumbnail = true;
		isCreatureNow = false;
		isAggressiveNow = false;
		MessageWindow._visible = false;
		MessageText.text = "$AnimationMenu_waitfor_SexLab_save_status";
		TagInput._visible = false;
		infoText.text = "$AnimationMenu_select_or_input_tag";
		DetailWindow._visible = false;
		ic_d_anchor = ic_d._x;
		ic_d._visible = false;
		btn_lock_TagInput._disableFocus = true;
		btn_lock_detail._disableFocus = true;
		detail_num.focusEnabled = false;
		detail_Name.focusEnabled = false;
		detail_resist.focusEnabled = false;
		detail_stage.focusEnabled = false;
		detail_male.focusEnabled = false;
		detail_female.focusEnabled = false;
		detail_c_male.focusEnabled = false;
		detail_c_female.focusEnabled = false;
		detail_tags.focusEnabled = false;
		imageHolder1.focusEnabled = false;
		imageHolder2.focusEnabled = false;
		imageHolder3.focusEnabled = false;
		imageHolder4.focusEnabled = false;
		imageHolder5.focusEnabled = false;
		imageHolder6.focusEnabled = false;
		imageHolder7.focusEnabled = false;
		imageHolder8.focusEnabled = false;
		imageHolder9.focusEnabled = false;
		imageHolder10.focusEnabled = false;
		ic_enabled_detail.focusEnabled = false;
		ic_leadin_detail.focusEnabled = false;
		ic_aggressive_detail.focusEnabled = false;
		CurrentPlayingInfo._visible = false;
		CurrentPageText.text = "1";
		btn_prev._visible = false;
		isCreature = false;
		Human.titleText.text = "Human";
		Creature.titleText.text = "Creature";
		Human_on.titleText.text = "Human";
		Creature_on.titleText.text = "Creature";
 		Human_on._visible = true;
 		Human._visible = false;
		Creature_on._visible = false;
		Creature._visible = true;
		Creature_off._visible = false;
		tag1.TagName.text = "Select All";
		tag2.TagName.text = "Deselect All";
		tag3.TagName.text = "";
		tag4.TagName.text = "";
		setEditColor("Enabled");
		setEditColor("LeadIn");
		setEditColor("Aggressive");
		gfx.managers.FocusHandler.instance.setFocus(buttonHolder.SelectButton1, 0);
		Mouse.addListener(this);
		Key.addListener(this);
		requestDataId_ = setInterval(this, "requestData", 1);
	}
/*ロード後、ゲーム上からデータを取得するためのイベントを送信*/
	private function requestData(): Void
	{
		clearInterval(requestDataId_);
		skse.SendModEvent("AnimationEditorOpen");
		PlaySound("MenuOpen");
	}
/*キーを押した時の挙動*/
	public function handleInput(details: InputDetails, pathToFocus: Array): Boolean
	{
		var bHandledInput: Boolean = false;
		if (GlobalFunc.IsKeyPressed(details)) {
			if(details.navEquivalent == NavigationCode.ENTER) {
//				skse.SendModEvent("UIlog", "Enterキーを押しました");
//				bHandledInput = true;
			}else if(details.navEquivalent == NavigationCode.TAB) {
				if (TagInput._visible == true){
//					onBP_taginput_cancel();
					gfx.managers.FocusHandler.instance.setFocus(btn_tagword1, 0);
					bHandledInput = true;
				} else if (MessageWindow._visible == true){
					bHandledInput = true;
				} else if (DetailWindow._visible == true){
//					onBP_detail_close();
					gfx.managers.FocusHandler.instance.setFocus(btn_detail_Enabled, 0);
					bHandledInput = true;
				} else {
					exitMenu();
					bHandledInput = true;
				}
			}
		}
		if(bHandledInput) {
			return bHandledInput;
		} else {
			/*フォーカスの移動*/
			var nextClip = pathToFocus.shift();
			if (nextClip.handleInput(details, pathToFocus)) {
				return true;
			}
		}
		return false;
	}

}// SSLAnimationMenu

