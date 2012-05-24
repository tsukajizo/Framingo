////////////////////////////////////////////////////////////////////////////////
//
//
// Copyright 2012 Shuzo Kuwako
// All Rights Reserved.
//
//
//////////////////////////////////////////////////////////////////////////////////
package framingo.view.render 
{
	import framingo.data.action.RenderAction;
	
	/**
	 * ...
	 * @author Shuzo Kuwako
	 */
	public interface IRenderableData 
	{
		function execAction(action:RenderAction):void;
		function get objectId():int;
		function toString():String;
	}
	
}