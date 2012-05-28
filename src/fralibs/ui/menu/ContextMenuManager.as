package fralibs.ui.menu 
{
	import flash.display.Sprite;
	import fralibs.ui.menu.data.MenuObject;
	/**
	 * ...
	 * @author Shuzo Kuwako
	 */
	public class ContextMenuManager 
	{
		private var _target:Sprite
		public function ContextMenuManager() 
		{
			
		}
		public function setContextMenu():void
		{
			_target.contextMenu = _contextMenu;
		}
		
		public function addContext(item:MenuObject):void
		{
			_contextMenu.customItems.push(item.customItem)
		}
		
		public function addMenu():void
		{
			setDockTrayMenu();
			setContextMenu();
		}
	}

}