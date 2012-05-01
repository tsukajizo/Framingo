
package framingo.view.manager 
{
	import flash.display.Sprite;
	import framingo.data.action.AbstractAction;
	/**
	 * ...View全体を管理するための
	 * @author Shuzo Kuwako
	 */
	public final class ViewManager extends Sprite
	{
		public var sceneManager:SceneManager;
		public var dialogManager:DialogManager;
		
		
		public function ViewManager() 
		{

			initSettings();
		}
		
		
		public function initSettings():void
		{
			sceneManager = new SceneManager();

			addChild(sceneManager);
		}

		

		
		public function execAction(action:AbstractAction):void 
		{
			trace("ViewManager:",action)
			sceneManager.execAction(action);
		}
		

		
	}

}