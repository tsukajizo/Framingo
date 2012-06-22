package framingo.view.manager 
{
	import flash.display.Sprite;
	import framingo.data.action.AbstractAction;
	import framingo.core.FMCoreSetting;
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
			sceneManager = SceneManager.getInstance();
			dialogManager = DialogManager.getInstance(sceneManager);
			addChild(FMCoreSetting.GLOBAL);
			addChild(sceneManager);
			addChild(dialogManager);
		}

		

		
		public function execAction(action:AbstractAction):void 
		{
			trace("ViewManager:",action)
			sceneManager.execAction(action);
			dialogManager.execAction(action);
		}
		

		
	}

}