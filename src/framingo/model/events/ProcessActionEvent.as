
package framingo.model.events 
{
	import flash.events.Event;
	import framingo.data.action.AbstractAction;
	
	/**
	 * ...各処理から次のアクションを通知するためのイベント
	 * @author Shuzo Kuwako
	 */
	public class ProcessActionEvent extends Event 
	{
		private var _action:AbstractAction;
		public static const THROW:String = "throwAction";
		public function ProcessActionEvent(type:String, action:AbstractAction, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			_action = action;
			super(type, bubbles, cancelable);
			
		} 
		
		public override function clone():Event 
		{ 
			return new ProcessActionEvent(type, _action, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("ProcessActionEvent", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
		public function get action():AbstractAction 
		{
			return _action;
		}
		
	}
	
}