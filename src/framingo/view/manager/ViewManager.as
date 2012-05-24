////////////////////////////////////////////////////////////////////////////////
//
//
// Copyright 2012 Shuzo Kuwako
// All Rights Reserved.
//
//
//////////////////////////////////////////////////////////////////////////////////
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
			sceneManager = new SceneManager();
			addChild(FMCoreSetting.GLOBAL);
			addChild(sceneManager);
		}

		

		
		public function execAction(action:AbstractAction):void 
		{
			sceneManager.execAction(action);
		}
		

		
	}

}