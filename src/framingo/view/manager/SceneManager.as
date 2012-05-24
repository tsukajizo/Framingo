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
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import framingo.data.action.AbstractAction;
	import framingo.data.action.IDataTransfer;
	import framingo.data.action.SceneAction;
	import framingo.presenter.IActionReceivable;
	import framingo.view.factory.SceneFactory;
	import framingo.view.scenes.AbstractScene;
	import framingo.view.events.SceneEvent;
	import framingo.view.events.SceneManagerEvent;
	import framingo.core.system.SystemManager;
	import framingo.view.events.ActionObjectEvent;
	

	/**
	 * ...Sceneを管理するためのクラス。このクラスは継承することができません。
	 * 各シーンは、ずっとシーンとして保持されるのではなくファクトリパターンによって必要なタイミングで生成されます。
	 * ファクトリパターンで生成される内容に関してはXMLで記述し、builder.phpを実行することにより自動的に
	 * 生成できるように設計します。
	 * @author Shuzo Kuwako
	 */
	public final class SceneManager extends Sprite implements IActionReceivable
	{
		private var _stage:Stage;
		private var _currentScene:AbstractScene;
		private var _sceneFactory:SceneFactory
		
		public function SceneManager() 
		{
			initSetting();
			addStageFunc();
		}
		
		/**
		 * 初期化処理を行う。
		 */
		private function initSetting():void 
		{
			_sceneFactory = SystemManager.core.getSceneFactory();
		}
		
		/**
		 * ステージに追加されたときのイベントの追加をする。
		 */
		private function addStageFunc():void
		{
			this.addEventListener(Event.ADDED_TO_STAGE, addedStageHandler);
			this.addEventListener(Event.REMOVED_FROM_STAGE, removedStageHandler);
		}
		
		/**
		 * 、ステージから削除されたときのイベントを削除する。
		 * @param	e
		 */
		private function removedStageHandler(e:Event):void 
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, addedStageHandler);
			this.removeEventListener(Event.REMOVED_FROM_STAGE, removedStageHandler);
		}
		
		/**
		 * ステージに追加されたときの処理。
		 * @param	e
		 */
		private function addedStageHandler(e:Event):void
		{
			_stage = this.root.stage;
			setIndexScene();
		}
		
		/**
		 * 最初のシーンを設定する。
		 */
		private function setIndexScene():void
		{
			_currentScene = _sceneFactory.getIndexScnene();
			setSceneFunc(_currentScene);
			_currentScene.addEventListener(SceneEvent.INIT, initMainScene);
			addChild(_currentScene);
		}
		
		/**
		 * 最初のシーンの配置が完了したときに実行される。
		 * //現在利用されていません。
		 * @param	e
		 */
		private function initMainScene(e:SceneEvent):void
		{
			e.currentTarget.removeEventListener(SceneEvent.INIT, initMainScene);
			dispatchEvent(new SceneManagerEvent(SceneManagerEvent.INIT_STAGE));
		}
		
		/**
		 * シーンに機能をつける
		 * //現在利用されていません
		 * @param	scene
		 */
		private function setSceneFunc(scene:AbstractScene):void
		{
			scene.setSceneSize(_stage.stageWidth, _stage.stageHeight);
		}
		
		/**
		 * 現在のシーンを削除し、指定したシーンを表示すし、現在のシーンとして登録する。
		 * @param	type
		 */
		public function setSelectedScene(type:String,data:IDataTransfer):void
		{
			removeChild(_currentScene);
			_currentScene = _sceneFactory.getSceneByType(type);
			_currentScene.transferObject = data;
			addChild(_currentScene);
		}
		

		
		/*
		public function removeFromWindow():void
		{
			_currentScene.removeFromWindow();
		}
		
		public function returnInWindow():void
		{
			_currentScene.returnInWindow();
		}
		*/
		
		/**
		 * アクションを実行する。
		 * シーンアクションが或る場合ほかのアクションは受け付けない。
		 * @param	actions
		 */
		public function execAction(action:AbstractAction):void
		{

				if (action is SceneAction) {
					setSelectedScene(SceneAction(action).next,action.transferObject);
					return;
				}

			_currentScene.execAction(action);
		}

	}

}