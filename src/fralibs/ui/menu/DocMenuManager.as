////////////////////////////////////////////////////////////////////////////////
//
//
// Copyright 2012 Shuzo Kuwako
// All Rights Reserved.
//
//
//////////////////////////////////////////////////////////////////////////////////
package fralibs.ui.menu 
{
	import flash.desktop.DockIcon;
	import flash.desktop.NativeApplication;
	import flash.desktop.SystemTrayIcon;
	import flash.display.Bitmap;
	import flash.display.InteractiveObject;
	import flash.display.NativeMenu;
	import flash.display.Sprite;
	import flash.ui.ContextMenu;
	import fralibs.ui.menu.data.MenuObject;
	/**
	 * ...
	 * @author Shuzo Kuwako
	 */
	public class DocMenuManager 
	{
		[Embed(source="./assets/icon_default.png")]
        private var Icon:Class;
		
        private var _iconImage:Bitmap;
		private var _docMenu:NativeMenu;
		private var _contextMenu:ContextMenu;
		private var _target:Sprite;
		
		private var _systemTrayIcon:SystemTrayIcon;
		private var _docIcon:DockIcon;
		
		public function DocMenuManager(target:Sprite)
		{
			_target = target;
			initMenu();
			setDefaultIcon();
		}
		
		private function setDefaultIcon():void
		{
			_iconImage = new Icon() as Bitmap;
		}
		
		private function initMenu():void 
		{
			_docMenu = new NativeMenu();
			_contextMenu = new ContextMenu();
		}
		
		public function addMenu():void
		{
			setDockTrayMenu();
		}
		
		
		public function setDockTrayMenu():void
		{
			var app:NativeApplication = NativeApplication.nativeApplication;
			
			//Mac OS X
			if (NativeApplication.supportsDockIcon) {
                _docIcon = app.icon as DockIcon;
                _docIcon.menu = _docMenu;
				
			//Windows, Linux
             } else if (NativeApplication.supportsSystemTrayIcon) {
                _systemTrayIcon = app.icon as SystemTrayIcon;
                _systemTrayIcon.bitmaps = [_iconImage.bitmapData];
                _systemTrayIcon.menu = _docMenu;
             }
		}
		

		

		
		public function addItem(item:MenuObject):void
		{
			_docMenu.addItem(item.item);
			_target.addChild(item);
		}
		
		public function get systemTrayIcon():SystemTrayIcon 
		{
			return _systemTrayIcon;
		}
		
		public function set iconImage(value:Bitmap):void 
		{
			_iconImage = value;
		}
		
	}

}