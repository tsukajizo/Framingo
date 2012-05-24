////////////////////////////////////////////////////////////////////////////////
//
//
// Copyright 2012 Shuzo Kuwako
// All Rights Reserved.
//
//
//////////////////////////////////////////////////////////////////////////////////
package framingo.view.events 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Shuzo Kuwako
	 */
	public class SceneEvent extends Event 
	{
		public static const INIT:String = "SceneInit";
		public function SceneEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			super(type, bubbles, cancelable);
			
		} 
		
		public override function clone():Event 
		{ 
			return new SceneEvent(type, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("SceneEvent", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
	}
	
}