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
	 * ...各メニューを設定するためのクラス。
	 * @author Shuzo Kuwako
	 */
	public class MenuObject extends Sprite implements IThrowableAction
	{
		private var _item:NativeMenuItem;
		private var _customItem:ContextMenuItem;
		private var _label:String;
		protected var _action:AbstractAction;
		private var _shortCut:String;
		
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
			
			if(_shortCut != ""){
				_item.keyEquivalent = _shortCut;
				_customItem.keyEquivalent = _shortCut;
			}			
			_item.addEventListener(Event.SELECT, itemSelectedHandler);
			_customItem.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT, itemSelectedHandler);
		}
		
		/**
		 * 選択されたときの処理。
		 * @param	e
		 */
		protected function itemSelectedHandler(e:Event):void 
		{
			throwAction();
		}

		/**
		 * 指定したアクションを投げる。
		 */
		public function throwAction():void {
			trace(_action);
			dispatchEvent( new ActionObjectEvent(ActionObjectEvent.THROW,_action));
		}
		
		
		public function get label():String 
		{
			return _label;
		}
		
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