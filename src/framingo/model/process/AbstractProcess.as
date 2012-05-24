////////////////////////////////////////////////////////////////////////////////
//
//
// Copyright 2012 Shuzo Kuwako
// All Rights Reserved.
//
//
//////////////////////////////////////////////////////////////////////////////////
package framingo.model.process 
{
	import flash.events.EventDispatcher;
	import flash.utils.IDataInput;
	import framingo.core.error.UnimplementedError;
	import framingo.data.AbstractDataGroup;
	import framingo.data.action.AbstractAction;
	import framingo.data.action.IDataTransfer;
	import framingo.model.events.ProcessActionEvent;
	import framingo.model.events.ProcessEvent;
	import framingo.presenter.IThrowableAction;
	/**
	 * ...Processの抽象クラス。こちらを継承して
	 * @author Shuzo Kuwako
	 */
	public class AbstractProcess extends EventDispatcher implements IThrowableAction
	{
		private var _type:String = "";
		protected var _action:AbstractAction;
		protected var _dataGroup:AbstractDataGroup;
		protected var _transfarData:IDataTransfer;
		protected var _state:String = "";
		protected var _followed:Array = [];
		
		protected var _before:AbstractProcess;
		protected var _after:AbstractProcess;
		
		
		
		public function AbstractProcess(type:String) 
		{
			_type = type;
		}
		
		
		/**
		 * 処理に必要なデータを受け渡す。
		 * @param	group
		 */
		public function mapData(group:AbstractDataGroup):void {
			_dataGroup = group;
		}
		
		
		public function mapTransfarData(transferObject:IDataTransfer):void 
		{
			_transfarData = transferObject;
		}
		
		/**
		 * 実行する処理。継承が必須。
		 */
		public function execute():void
		{
			throw new UnimplementedError();
		}
		
		/**
		 * 次に実行する処理の設定
		 * ステートの変更によって次の処理の内容が変更される。
		 * とりあえずコメントアウト
		 */
		protected function getAfterProcess(state:String):AbstractProcess
		{
			return _after;
		}
		
		/**
		 * 処理の終了のみを通知する関数。
		 */
		public final function throwFinish():void
		{
			_after = getAfterProcess(_state);
			dispatchEvent(new ProcessEvent(ProcessEvent.FINISH));
		}
		
		/**
		 * 処理の終了後、何らかの処理が走る場合にアクションを投げる関数。
		 */
		public final function throwAction():void
		{
			_after = getAfterProcess(_state);
			dispatchEvent(new ProcessActionEvent(ProcessActionEvent.THROW, _action));
		}
		
		/**
		 * アクションを追加する。
		 * @param	action
		 */
		public function addAction(action:AbstractAction):void
		{
			_action = action;
		}
		

		

		public function get action():AbstractAction
		{
			return _action;
		}
		
		public function get type():String 
		{
			return _type;
		}
		
		
		
		public function get before():AbstractProcess 
		{
			return _before;
		}
		
		public function set before(value:AbstractProcess):void 
		{
			_before = value;
		}
		
		public function get after():AbstractProcess 
		{
			return _after;
		}
		
		public function set after(value:AbstractProcess):void 
		{
			_after = value;
		}
		
		public function get followed():Array 
		{
			return _followed;
		}
		
		public function set followed(value:Array):void 
		{
			_followed = value;
		}
	}

}