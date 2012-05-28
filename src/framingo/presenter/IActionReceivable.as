package framingo.presenter 
{
	import flash.events.Event;
	import framingo.data.action.AbstractAction;
	
	/**
	 * ...
	 * @author Shuzo Kuwako
	 */
	public interface IActionReceivable 
	{
		function execAction(action:AbstractAction):void;
		function addEventListener(type:String, listener:Function, useCapture:Boolean=false, priority:int=0, useWeakReference:Boolean=false) :void;
		function removeEventListener(type:String, listener:Function, useCapture:Boolean=false ):void;
	}
	
}