////////////////////////////////////////////////////////////////////////////////
//
//
// Copyright 2012 Shuzo Kuwako
// All Rights Reserved.
//
//
//////////////////////////////////////////////////////////////////////////////////
package framingo.data.action 
{
	import framingo.data.AbstractProcessData;
	/**
	 * ...これから実行するプロセスを通知するためのアクション。
	 * @author Shuzo Kuwako
	 */
	public class FlowAction extends AbstractAction 
	{
		private var _data:AbstractProcessData;
		
		public function FlowAction() 
		{
			super("FlowAction");
		}
		
		
		override public function toString():String
		{
			return String("[FlowAction : type=" +  type   + " ]");
		}
		
		
	}

}