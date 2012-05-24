////////////////////////////////////////////////////////////////////////////////
//
//
// Copyright 2012 Shuzo Kuwako
// All Rights Reserved.
//
//
//////////////////////////////////////////////////////////////////////////////////
package framingo.core 
{
	import flash.display.Sprite;
	import framingo.core.system.SystemManager;
	import framingo.model.manager.ModelManager;
	import framingo.presenter.ActionPresenter;
	import framingo.view.manager.ViewManager;
	/**
	 * ...アプリケーションのメインクラス。
	 * @author Shuzo Kuwako
	 */
	public final class FMApplication extends Sprite
	{
		private var viewManager:ViewManager;
		private var modelManager:ModelManager;
		private var systemManager:SystemManager;
		private var presenter:ActionPresenter;
		
		/**
		 * コンストラクタ
		 * @param	core　アプリケーションの各機能,シーンなどを設定します。
		 * @param	config アプリケーションの細かい設定を保持します。
		 */
		public function FMApplication(core:FMCoreClass,config:FMCoreSetting) 
		{
			initSystem(core,config);
		}
		
		/**
		 * アプリケーションに関係するオブジェクトの初期化。
		 */
		private function initSystem(core:FMCoreClass,config:FMCoreSetting):void 
		{
			systemManager = new SystemManager(core, config);
		}
		
		/**
		 * 各マネージャークラスの初期化。
		 */
		public function exec():void 
		{
	
			viewManager = new ViewManager();
			modelManager = new ModelManager();
			presenter = new ActionPresenter(viewManager, modelManager);
			addChild(viewManager);
		}
		

	}

}