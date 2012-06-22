package framingo.view.dialog 
{
	import flash.display.Sprite;
	import framingo.data.action.AbstractAction;
	import framingo.data.action.DialogAction;
	import framingo.data.action.IDataTransfer;
	import framingo.presenter.IThrowableAction;
	import framingo.view.events.ActionObjectEvent;
	import framingo.view.interactive.ActionObject;
	/**
	 * ...ダイアログの抽象クラス。
	 * @author Shuzo Kuwako
	 */
	public class Dialog extends Sprite implements IThrowableAction
	{
		private var _actions:Array = [];
		private var _action:AbstractAction;
		private var _isPop:Boolean  = false;
		private var _type:String;
		
		public function Dialog(type:String) 
		{
			_type = type;
			super();
			
		}
		
		
		
		/**************************************************
		 *
		 * interface
		 * 
		 **************************************************/
		
		public final function pop(action:AbstractAction):void
		{
			setPopData(action.transferObject);
			_isPop = true;
			visible = true;
		}
		

		
		public final function close():void
		{
			_isPop = false;
			visible = false;
			closeAfter();
		}
		
		

		
		/**************************************************
		 *
		 * protected function
		 * 
		 **************************************************/
		
		protected function setPopData(obj:IDataTransfer):void 
		{
			
		}
		
		
		protected function closeAfter():void 
		{
			
		}
		
		
		/**************************************************
		 *
		 * アクション関連
		 * 
		 **************************************************/
		
		public function executeAction(action:AbstractAction):void 
		{
			
		}
		
		
		/* INTERFACE framingo.presenter.IThrowableAction */
		
		public function get action():AbstractAction 
		{
			return _action;
		}
		
		
		
		public function throwAction():void 
		{
			dispatchEvent( new ActionObjectEvent(ActionObjectEvent.THROW,_action));
		}
		
		
		/**************************************************
		 *
		 * getter / setter
		 * 
		 **************************************************/
		
		public function get isPop():Boolean 
		{
			return _isPop;
		}

		
	}

}