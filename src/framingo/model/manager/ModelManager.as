
package framingo.model.manager
{
	import flash.events.EventDispatcher;
	import framingo.core.system.SystemManager;
	import framingo.data.AbstractDataGroup;
	import framingo.data.action.AbstractAction;
	import framingo.data.action.FlowAction;
	import framingo.model.events.FlowEvent;
	import framingo.model.events.ProcessActionEvent;
	import framingo.model.factory.FlowFactory;
	import framingo.model.process.ProcessFlow;
	
	/**
	 * ...すべてのデータのインスタンスを管理する場所。
	 *
	 * @author Shuzo Kuwako
	 */
	public class ModelManager extends EventDispatcher
	{
		/**
		 * ModelとViewの動作の情報を格納し、橋渡しするためのオブジェクト
		 */
		public var _currentProcessFlow:ProcessFlow
		public var _flowFactory:FlowFactory;
		public var _dataManager:DataManager;
		
		public function ModelManager()
		{
			initSetting();
			//setIndexProcess();
		}
		
		/**
		 * 初期設定。
		 */
		private function initSetting():void
		{
			_flowFactory = SystemManager.core.getProcessFactory();
			_dataManager = SystemManager.core.getDataManager();
		}
		/**
		 * 最初のシーンに結び付けられたプロセスを設定する。
		 */
		/*
		private function setIndexProcess():void
		{
			_currentProcessFlow = _flowFactory.getIndexFlow();
			_currentProcessFlow.addEventListener(FlowEvent.FINISH, processFinishEvent);
			var dataGroup:AbstractDataGroup = _dataManager.getIndexDataGroupByType();
			_currentProcessFlow.setDataGroup(dataGroup);
		}
		*/
		
		/**
		 * シーンと結び付けられたプロセスを作成し、データグループを取得する。
		 * @param	type
		 */
		public function setSelectedFlow(type:String):void
		{
			trace(type)
			_currentProcessFlow = _flowFactory.getFlowByName(type);
			_currentProcessFlow.addEventListener(FlowEvent.FINISH, processFinishEvent);
			var dataGroup:AbstractDataGroup = _dataManager.getDataGroupByType(type);
			trace("setSelectedFlow" , type, dataGroup);
			_currentProcessFlow.setDataGroup(dataGroup);
		}
		
		/**
		 * 挿入されたアクションを実行する。
		 * シーンアクションが或る場合ほかのアクションは受け付けない。
		 * @param	actions
		 */
		public function execAction(action:AbstractAction):void
		{
			//シーンアクションが或る場合ほかのアクションは受け付けない。
			trace(action)
			if (!(action is FlowAction)) return;
			setSelectedFlow(action.type);
			_currentProcessFlow.execAction(action);
		}
		
		private function processFinishEvent(e:FlowEvent):void 
		{
			throwSceneAction(e.action);
		}
		
		public function throwSceneAction(action:AbstractAction):void
		{
			dispatchEvent(new ProcessActionEvent(ProcessActionEvent.THROW, action));
		}
	
	}

}