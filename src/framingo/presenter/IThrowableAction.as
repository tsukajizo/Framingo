////////////////////////////////////////////////////////////////////////////////
//
//
// Copyright 2012 Shuzo Kuwako
// All Rights Reserved.
//
//
//////////////////////////////////////////////////////////////////////////////////
package framingo.presenter 
{
	import framingo.data.action.AbstractAction;
	
	/**
	 * ...
	 * @author Shuzo Kuwako
	 */
	public interface IThrowableAction 
	{
		function throwAction():void;
		function get action():AbstractAction 
	}
	
}