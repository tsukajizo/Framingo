package fralibs.ui.key.data 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import framingo.data.action.AbstractAction;
	import framingo.presenter.IThrowableAction;
	import framingo.view.events.ActionObjectEvent;
	import framingo.view.interactive.ActionObject;
	import fralibs.ui.key.KeyMap;
	
	/**
	 * ...キーボードショートカットを設定するためのクラス。
	 * メニューオブジェクトにショートカットが設定がされている場合、そちらのデータが優先されて実行される。
	 * @author Shuzo Kuwako
	 */
	public class KeyShortcutObject extends ActionObject implements IThrowableAction 
	{
		private var _type:String;
		private var _keyType:int;
		private var _action:AbstractAction
		
		//シフトキー操作
		private var _withShift:Boolean;
		private var _onShift:Boolean;
		
		//コントロールキー操作
		private var _withCtrl:Boolean;
		private var _onCtrl:Boolean;
		
		/**
		 * コンストラクタ
		 * @param	keyType ショートカットに設定するデータ
		 * @param	action ショートカットで実行するアクション
		 */
		public function KeyShortcutObject(keyType:String,action:AbstractAction) 
		{
			trace("keyType:", keyType)
			_keyType = KeyMap.unicodeToAcii(keyType);
			super(action);
			initKeyAction();
		}
		
		/**
		 * イベントを登録する。
		 * キーボードのイベントはステージから取得するためステージに追加されたときに各イベントを実行できるように追加する。
		 */
		private function initKeyAction():void 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);

		}
		
		/**
		 * ステージに追加されたときの処理（各イベントの追加。）
		 * @param	e
		 */
		private function addedToStageHandler(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownActionHandler);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyUpActionHandler);
		}
		
		/**
		 * キーボードから手が離されたときの処理。
		 * オプションキーの状態の設定を行う。
		 * @param	e
		 */
		private function keyUpActionHandler(e:KeyboardEvent):void 
		{
			switch (e.keyCode) {
				case Keyboard.CONTROL:
					_onCtrl = false;
					break;
				case Keyboard.SHIFT:
					_onShift = false;
					break;
				default:
					break;
			}
		}
		
		/**
		 * キーボードが押されたときの処理。
		 * @param	e
		 */
		private function keyDownActionHandler(e:KeyboardEvent):void 
		{
			switch(e.keyCode) {
				case Keyboard.CONTROL:
					_onCtrl = true;
					break;
				case Keyboard.SHIFT:
					_onShift = true;
					break;
				case _keyType:
					keyPressed();
					break;
				default:
					trace(e.keyCode);
					break;
			}
		}
		
		/**
		 * 設定キーが押されたときの処理を行う。
		 */
		private function keyPressed():void 
		{
			trace("throw")
			if (_withCtrl && _withShift) {
				if (!_onCtrl) return;
				if (!_onShift) return;
				throwAction();
				return;
			}else if (_withCtrl) {

				if (!_onCtrl) return;

				throwAction();
				return;
			}else if (_withShift) {
				if (!_onShift) return;
				throwAction();
				return;
			}

			throwAction();
		}
		
		/**
		 * シフトが押されているか
		 */
		public function set onShift(value:Boolean):void 
		{
			_onShift = value;
		}
		
		/**
		 * コントロールが必要かどうかを設定する。
		 */
		public function set withCtrl(value:Boolean):void 
		{
			_withCtrl = value;
		}
		
		/**
		 * シフトキーが必要かどうかを設定する。
		 */
		public function set withShift(value:Boolean):void 
		{
			_withShift = value;
		}
		


		
	}

}