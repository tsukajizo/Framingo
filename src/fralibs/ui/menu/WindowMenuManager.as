package fralibs.ui.menu 
{
	import flash.desktop.NativeApplication;
	import flash.display.NativeMenu;
	import flash.display.Sprite;
	import flash.events.Event;
	import fralibs.ui.menu.data.MenuObject;
	import flash.display.NativeMenuItem;
	/**
	 * ...ウィンドウメニューを扱うためのクラスライブラリ。
	 * @author Shuzo Kuwako
	 */
	public class WindowMenuManager 
	{
		private var _target:Sprite;
		private var _chromeMenu:NativeMenu;
		private var _menuList:Object;
		
		/**
		 * コンストラクタ
		 * @param	target
		 */
		public function WindowMenuManager(target:Sprite) 
		{
			_target = target;
			initMenu();
		}
		
		/**
		 * 各パラメーターの初期化
		 */
		private function initMenu():void 
		{
			_chromeMenu = new NativeMenu();
			_menuList = new Object();
		}
		
		/**
		 * ウィンドウバーに表示するためのメニュー。処理は追加できない。
		 * @param	label
		 */
		public function addBarMenu(label:String):void
		{
			var nativeMenu:NativeMenuItem = new NativeMenuItem();
			nativeMenu = _chromeMenu.addSubmenu(new NativeMenu(),label);
			_menuList[label] = nativeMenu;
		}
		
		/**
		 * サブメニューを追加する。
		 * @param	item　　
		 * @param	targetMenu ターゲットになるメニューのラベル
		 */
		public function addDropMenu(item:MenuObject,targetMenu:String):void
		{
			NativeMenuItem(_menuList[targetMenu]).submenu.addItem(item.item);
			_target.addChild(item);
		}
		
		/**
		 * メニューの処理を追加する。
		 */
		public function addMenu():void
		{
			_target.addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
		}
		
		private function addedToStageHandler(e:Event):void 
		{
			_target.removeEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
			if(NativeMenu.isSupported){
				_target.stage.nativeWindow.menu = _chromeMenu;
			}

		}
		
	}

}