package fralibs.ui.menu 
{
	import flash.display.DisplayObject;
	import flash.display.InteractiveObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.ui.ContextMenu;
	import fralibs.ui.menu.data.MenuObject;
	import framingo.view.interactive.ActionObject;
	/**
	 * ...コンテキストメニューを扱うクラス。
	 * @author Shuzo Kuwako
	 */
	public class ContextMenuManager 
	{
		private var _target:InteractiveObject;
		private var _contextMenu:ContextMenu;
		private var _targetField:TextField;
		
		/**
		 * コンストラクタ
		 * @param	target
		 */
		public function ContextMenuManager(target:InteractiveObject) 
		{
			_target = target;
			initMenu();
		}
		
		private function initMenu():void
		{
			_contextMenu = new ContextMenu();
			if (_target is ActionObject) {
				//AbstractActionにもメニューを追加できるようにする。
				setObjectWrapper();
			}
		}
		
		/**
		 * AIRの場合テキスト関連のオブジェクトにしかメニューがつけられないため、
		 * ActionObjectにもメニューをつけられるようにするための処理。
		 */
		private function setObjectWrapper():void 
		{
			_targetField = new TextField();
			_targetField.width = _target.width;
			_targetField.height = _target.height;
			_targetField.alpha = 0;
			var target:ActionObject = _target as ActionObject;
			
			target.addChild(_targetField);
			target.mouseChildren = false;
			target.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
		}
		
		/**
		 * テキストフィールドにマウスが乗ってしまうと、カーソルが変わってしまうため、それを避けるための処理。
		 * @param	e
		 */
		private function mouseDownHandler(e:MouseEvent):void 
		{
			if (e.ctrlKey) {
				_contextMenu.display(_target.stage, _target.mouseX ,_target.mouseY);
				_targetField.dispatchEvent(new MouseEvent(MouseEvent.CONTEXT_MENU));
			}
		}
		
		/**
		 * メニューを追加する。
		 * @param	item
		 */
		public function addItem(item:MenuObject):void
		{
			_contextMenu.customItems.push(item.customItem)
		}
		
		/**
		 * メニューを設定する。
		 */
		public function addMenu():void
		{
			if(_target is ActionObject){
				_targetField.contextMenu = _contextMenu;
			}else {
				_target.contextMenu = _contextMenu;
			}
		}
		
		public function get contextMenu():ContextMenu 
		{
			return _contextMenu;
		}
	}

}