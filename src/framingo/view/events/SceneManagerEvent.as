package framingo.view.events
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Shuzo Kuwako
	 */
	public class SceneManagerEvent extends Event 
	{
		public static const INIT_STAGE:String = "initStageSceneManager"
		public function SceneManagerEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			super(type, bubbles, cancelable);
			
		} 
		
		public override function clone():Event 
		{ 
			return new SceneManagerEvent(type, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("SceneManagerEvent", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
	}
	
}