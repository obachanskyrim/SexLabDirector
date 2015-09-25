import skyui.util.GlobalFunctions;
import skyui.util.Translator;

import oba.Messages4;

class oba.DirectorHUD extends MovieClip{

	public static var DirectorHUD_VERSION: Number = 10;
	public var HUDcontents: MovieClip;
	public var messageHolder: Messages4;
	public var translateText: TextField;
	private var myMaster_: Object = null;
	private var isActive_: Boolean = false;
	private var rootPath_: String = "";

	public function DirectorHUD(){
		super();
		GlobalFunctions.addArrayFunctions();
		messageHolder = HUDcontents.messageHolder;
		translateText = HUDcontents.translateText;
	}

	public function onLoad(): Void{
		var curMaster = _root.HUD_MASTER_INSTANCE;
		if (curMaster != null) {
			var curVersion = curMaster.GetVersion();
			if (curVersion < DirectorHUD_VERSION) {
				_root.HUD_MASTER_INSTANCE = this;
				curMaster.ForwardTo(this);
			} else {
				this.ForwardTo(curMaster);
			}
		} else {
			_root.HUD_MASTER_INSTANCE = this;
		}
		if (myMaster_ == null)
			InitHook();
		translateText._visible = false;
	}

	public function GetVersion(): Number{
		return DirectorHUD_VERSION;
	}

	public function SetRootPath(a_path: String): Void{
		rootPath_ = a_path;
	}

	public function TranslateMsg(a_msg: String): Void{
		translateText.text = a_msg;
		skse.SendModEvent("ReturnTranslate", translateText.text);
	}

	public function ShowMessage(a_message: String, a_color: String): Void{
		skse.SendModEvent("UIlog", a_message);
		if (myMaster_ != null) {
			myMaster_.ShowMessage(a_message, a_color);
			return;
		}
		var translated = Translator.translateNested(a_message);
		var msgData = {text: "<font color='" + a_color + "'>" + translated + "</font>"};
		messageHolder.MessageArray.push(msgData);
		messageHolder.Update()
	}

	public function ForwardTo(master: Object): Void{
		myMaster_ = master;
		if (isActive_){
			isActive_ = false;
			var hudMovie = _root.HUDMovieBaseInstance;
			var hudElements = hudMovie.HudElements;
			var idx = hudElements.indexOf(HUDcontents);
			if (idx != undefined){
				hudElements.splice(idx,1);
			}
			HUDcontents._visible = false;
		}
	}
	public function InitHook(): Void{
		var hudMovie = _root.HUDMovieBaseInstance;
		var hudElements = hudMovie.HudElements;
		HUDcontents._x = -617;
		HUDcontents._y = -475;
		hudElements.push(HUDcontents);
		HUDcontents["All"] = true;
		HUDcontents["Favor"] = true;
		HUDcontents["InventoryMode"] = true;
		HUDcontents["TweenMode"] = true;
		HUDcontents["BookMode"] = true;
		HUDcontents["DialogueMode"] = true;
		HUDcontents["BarterMode"] = true;
		HUDcontents["WorldMapMode"] = true;
		HUDcontents["MovementDisabled"] = true;
		HUDcontents["StealthMode"] = true;
		HUDcontents["Swimming"] = true;
		HUDcontents["HorseMode"] = true;
		HUDcontents["WarHorseMode"] = true;
		HUDcontents["CartMode"] = true;
		var hudMode: String = hudMovie.HUDModes[hudMovie.HUDModes.length - 1];
		HUDcontents._visible = HUDcontents.hasOwnProperty(hudMode);
		isActive_ = true;
	}
}