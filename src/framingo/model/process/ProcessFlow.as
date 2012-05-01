
package framingo.model.process 
{
	import flash.events.EventDispatcher;
	import framingo.core.error.UnimplementedError;
	import framingo.data.AbstractDataGroup;
	import framingo.data.action.AbstractAction;
	import framingo.data.action.FlowAction;
	import framingo.model.events.FlowEvent;
	import framingo.model.events.ProcessActionEvent;
	import framingo.model.events.ProcessEvent;
	import framingo.model.factory.FlowFactory;
	/**
	 * ...処理のグループを記述している抽象クラス。すべての処理グループはこちらを継承してアプリケーションに設定されます。
	 * このクラスに処理に必要なデータの参照を渡し、それぞれの処理を実行していきます。 また、こちらに渡されるアクション配列の一連が処理されます。
	 * @author Shuzo Kuwako
	 */
	public class ProcessFlow extends EventDispatcher
	{
		private var _name:String;
		private var _indexProcess:AbstractProcess;
		
		protected var _currentProcess:AbstractProcess;
		protected var _action:AbstractAction;
		protected var _currentExecuteIndex:int = 0;
		protected var _processFactory:FlowFactory;
		protected var _currentDataGroup:AbstractDataGroup;
		
		/**
		 * コンストラクタ
		 * @param	name
		 */
		public function ProcessFlow(name:String = "default") 
		{
			_name = name;
			setProcess();
		}
		
		/**
		 * 操作する必要の或るデータの参照を渡す。
		 * 
		 * @param	group
		 */
		public final function setDataGroup(group:AbstractDataGroup):void 
		{
			_currentDataGroup = group;
		}
		
		/**
		 * 
		 * @param	actions
		 */
		public final function execAction(action:AbstractAction):void 
		{

			if (!(action is FlowAction)) return;
			_action = action;
			_currentProcess = _indexProcess;
			trace("bb")
			executeProcess();
		}
		
		/**
		 * 
		 * @param	action
		 */
		public final function executeProcess():void
		{
			trace(_currentProcess.after);
			_currentProcess.addEventListener(ProcessActionEvent.THROW, processActionRecievHandler);
			_currentProcess.addEventListener(ProcessEvent.FINISH, processFinishEvent);
			_currentProcess.mapData(_currentDataGroup);
			//移動してきたデータがあれば
			if(_action.transferObject != null){
				_currentProcess.mapTransfarData(_action.transferObject.clone());
			}
			_currentProcess.execute();
		}
		
		/**
		 * 処理が終了が通知された際に実行される処理。
		 * @param	e
		 */
		private final function processFinishEvent(e:ProcessEvent):void 
		{
			trace("aa")
			_currentProcess = _currentProcess.after;
			if (_currentProcess == null) return;
			executeProcess();	
		}
			
		/**
		 * 処理を設定する。 こちらの処理はサブクラスで継承しなければならない
		 * Unimplemented Error
		 * @param	type
		 * @return
		 */
		protected function setProcess():void 
		{
			throw new UnimplementedError();
		}
		
		protected function setIndexProcess(process:AbstractProcess):void
		{
			_indexProcess = process;
		}
		
		/**
		 * 
		 * @param	e
		 */
		private final function processActionRecievHandler(e:ProcessActionEvent):void 
		{
			dispatchEvent(new FlowEvent(FlowEvent.FINISH, e.action));
		}
		


	}
}