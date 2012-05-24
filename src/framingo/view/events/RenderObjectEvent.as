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
	public class RenderObjectEvent extends Event 
	{
		public static const COMPLETE:String = "RenederComplete";
		public function RenderObjectEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			super(type, bubbles, cancelable);
			
		} 
		
		public override function clone():Event 
		{ 
			return new RenderObjectEvent(type, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("RenderObjectEvent", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
	}
	
}