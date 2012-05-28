package framingo.presenter 
{
	import flash.events.Event;
	import framingo.data.action.AbstractAction;
	import framingo.model.manager.ModelManager;
	import framingo.view.manager.ViewManager;
	import framingo.view.events.ActionObjectEvent
	import framingo.presenter.IThrowableAction;
	import framingo.model.events.ProcessActionEvent;
	/**
	 * ...ModelとViewの動作の情報を格納し、橋渡しするためのオブジェクト
	 * Model,Viewのイベントによって創出されたActionオブジェクトを格納し、それぞれに次の動作を通知するためのクラス。
	 * こちらのクラスの動作は、IActionを実装することによって規定されます。
	 * 
	 * @author Shuzo Kuwako
	 */
	public class ActionPresenter 
	{
		/**
		 * 複数のアクションを保持するための配列。
		 */
		private var _actions:Array = [];
		
		/**
		 * 保持する最大アクション数。
		 */
		public var maxAction:int = 10;
		
		/**
		 * 最新のアクション。
		 */
		public var currentAction:AbstractAction;
		
		/**
		 * 
		 */
		private var _viewManager:ViewManager;
		private var _modelManager:ModelManager;
		
		public function ActionPresenter(viewManager:ViewManager,modelManager:ModelManager) 
		{
			_viewManager = viewManager;
			_modelManager = modelManager;
			setActionEvent();
		}
		
		private function setActionEvent():void 
		{
			_viewManager.addEventListener(ActionObjectEvent.THROW, receieveActionHandler);
			_viewManager.addEventListener(ProcessActionEvent.THROW, receieveProcessActionHandler);
			_modelManager.addEventListener(ProcessActionEvent.THROW, receieveProcessActionHandler);
			_modelManager.addEventListener(ActionObjectEvent.THROW, receieveActionHandler);
		}
		
		//後でまとめる
		private function receieveProcessActionHandler(e:ProcessActionEvent):void 
		{
			_viewManager.execAction(e.action);
			_modelManager.execAction(e.action);
		}
		//後でまとめる		
		private function receieveActionHandler(e:ActionObjectEvent):void 
		{
			if(e.target is IThrowableAction){
				_viewManager.execAction(e.action);
				_modelManager.execAction(e.action);
			}
		}
		
		
		public function addAction(action:AbstractAction):void
		{
			_actions.push(action);
		}
		

		
		public function set actions(value:Array):void
		{
			_actions = value
		}
		
		public function get actions():Array
		{
			return _actions;
		}
		
		public function getActionByIndex(index:int):AbstractAction
		{
			return _actions[index];
		}
		
	}

}