////////////////////////////////////////////////////////////////////////////////
//
//
// Copyright 2012 Shuzo Kuwako
// All Rights Reserved.
//
//
//////////////////////////////////////////////////////////////////////////////////
package framingo.core.error 
{
	/**
	 * ...実装上で継承な機能を継承せずに利用している場合、実装エラーを創出する。
	 * @author Shuzo Kuwako
	 */
	public class UnimplementedError extends Error 
	{
		public static const MESSAGE:String = "Unimplemented Error";
		public function UnimplementedError() 
		{
			super(MESSAGE, 1);
		}
		
	}

}