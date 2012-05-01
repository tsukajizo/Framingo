
package framingo.model.events 
{
	import flash.events.Event;
	
	/**
	 * ...各処理中のイベント。
	 * @author Shuzo Kuwako
	 */
	public class ProcessEvent extends Event 
	{
		public static const FINISH:String = "ProcessEventFinish";
		public function ProcessEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			super(type, bubbles, cancelable);
			
		} 
		
		public override function clone():Event 
		{ 
			return new ProcessEvent(type, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("ProcessEvent", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
	}
	
}