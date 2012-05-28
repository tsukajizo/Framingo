package framingo.model.events 
{
	import flash.events.Event;
	import framingo.data.action.AbstractAction;
	import framingo.data.action.FlowAction;
	
	/**
	 * ...ProcessGroupでの各処理を通知するためのイベント
	 * @author Shuzo Kuwako
	 */
	public class FlowEvent extends Event
	{
		private var _action:AbstractAction;
		public static const FINISH:String = "ProcessGroupEventSceneChange"
		public function FlowEvent(type:String, action:AbstractAction = null,bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			_action = action;
			super(type, bubbles, cancelable);
			
		} 
		
		public override function clone():Event 
		{ 
			return new FlowEvent(type,_action, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("ProcessGroupEvent", "action","type", "bubbles", "cancelable", "eventPhase"); 
		}
		
		public function get action():AbstractAction 
		{
			return _action;
		}
		
	}
	
}