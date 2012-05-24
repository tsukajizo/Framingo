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
	import framingo.data.action.AbstractAction;
	
	/**
	 * ...
	 * @author Shuzo Kuwako
	 */
	public class ActionObjectEvent extends Event 
	{
		private var _action:AbstractAction;
		public static const THROW:String = "ActionObjectThrow";
		public static const RECEIVE:String = "ActionObjectReceive";
		public function ActionObjectEvent(type:String, action:AbstractAction,bubbles:Boolean=true, cancelable:Boolean=false) 
		{ 
			_action = action;
			super(type, bubbles, cancelable);
			
		} 
		
		public override function clone():Event 
		{ 
			return new ActionObjectEvent(type, _action,bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("ActionObjectEvent", "type", "action" ,"bubbles", "cancelable", "eventPhase"); 
		}
		
		public function get action():AbstractAction 
		{
			return _action;
		}
		
		
	}
	
}