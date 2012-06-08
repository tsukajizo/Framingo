package fralibs.ui.key 
{
	import flash.display.Sprite;
	import fralibs.ui.key.data.KeyShortcutObject;
	/**
	 * ...キーボードショートカットを保持しておくためのクラス。
	 * @author Shuzo Kuwako
	 */
	public class KeyShortcutManager
	{
		public var _target:Sprite;
		public var _shortCuts:Array = [];
		private static var _init:Boolean = true;
		
		public function KeyShortcutManager(target:Sprite) 
		{
			_target = target
		}
		
		/**
		 * ショートカットをリストに追加する。
		 * @param	shortcut
		 */
		public function addShortCut(shortcut:KeyShortcutObject):void
		{
			_shortCuts.push(shortcut);
			_target.addChild(shortcut);
		}
		
		/**
		 * ショートカットをリストから削除する。
		 * @param	shortcut
		 */
		public function removeShortCut(shortcut:KeyShortcutObject):void
		{
			_shortCuts.splice(_shortCuts.indexOf(shortcut), 1);
			_target.removeChild(shortcut);
		}
		
	}

}