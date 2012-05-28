package fralibs.ui.menu 
{
	import flash.display.NativeMenu;
	import flash.display.Sprite;
	import fralibs.ui.menu.data.MenuObject;
	/**
	 * ...
	 * @author Shuzo Kuwako
	 */
	public class WindowMenuManager 
	{
		private var _target:Sprite;
		private var _chromeMenu:NativeMenu;
		
		public function WindowMenuManager(target:Sprite) 
		{
			_target = target;
			initMenu();
		}
		
		private function initMenu():void 
		{
			_docMenu = new NativeMenu();
			_contextMenu = new ContextMenu();
		}
		
		public function addItem(item:MenuObject):void
		{
			_chromeMenu.addItem(item.item);
			_target.addChild(item);
		}
	}

}