package fralibs.ui.menu.data 
{
	import flash.display.InteractiveObject;
	import flash.display.NativeMenuItem;
	import flash.display.Sprite;
	import flash.events.ContextMenuEvent;
	import flash.events.EventDispatcher;
	import flash.ui.ContextMenuItem;
	import flash.events.Event;
	import framingo.data.action.AbstractAction;
	import framingo.presenter.IThrowableAction;
	import framingo.view.events.ActionObjectEvent;
	/**
	 * ...メニュー設定用のオブジェクト　
	 * コンテキストメニュー、Docメニュー、ウィンドウメニューを同じインターフェースで利用できるようにするためのライブラリです。
	 * キーボードショートカット用のライブラリと、こちらのメニューのショートカットを同時に設定した場合、こちらで設定したショートカットが優先されます。
	 * @author Shuzo Kuwako
	 */
	public class MenuObject extends Sprite implements IThrowableAction
	{
		private var _item:NativeMenuItem;
		private var _customItem:ContextMenuItem;
		private var _label:String;
		protected var _action:AbstractAction;
		private var _shortCut:String;
		
		/**
		 * コンストラクタ
		 * @param	label　メニューのラベル
		 * @param	shortCut　ショートカット
		 */
		public function MenuObject(label:String = "item",shortCut:String = "") 
		{
			_label = label;
			_shortCut = shortCut;
			initMenu();
		}
		
		/**
		 * メニューを初期化する。
		 */
		private function initMenu():void
		{
			_item = new NativeMenuItem(_label);
			_customItem = new ContextMenuItem(_label);
			
			//ショートカットの設定
			if(_shortCut != ""){
				_item.keyEquivalent = _shortCut;
				_customItem.keyEquivalent = _shortCut;
			}			
			_item.addEventListener(Event.SELECT, itemSelectedHandler);
			_customItem.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT, itemSelectedHandler);
		}
		
		/**
		 * メニューが選ばれた時の処理。
		 * @param	e
		 */
		protected function itemSelectedHandler(e:Event):void 
		{
			throwAction();
		}
		
		/**
		 * 　アクションを実行する。
		 */
		public function throwAction():void {
			dispatchEvent( new ActionObjectEvent(ActionObjectEvent.THROW,_action));
		}
		
		
		/*******************************
		 * 
		 *   setter / getter
		 * 
		 ******************************/
		
		 
		/**
		 * ラベルを取得する。
		 */
		public function get label():String 
		{
			return _label;
		}

		/**
		 * ラベルを設定する。
		 */
		public function set label(value:String):void 
		{
			_label = value;
			if(_item != null){
			_item.label = _label;
			}
			if (_customItem != null){
			
				_customItem.label = _label;
			}
		}
		
		public function get item():NativeMenuItem 
		{
			return _item;
		}
		
		public function get customItem():ContextMenuItem 
		{
			return _customItem;
		}
		
		public function set action(value:AbstractAction):void 
		{
			_action = value;
		}
		
		public function get action():AbstractAction
		{
			return action;
		}
	}

}