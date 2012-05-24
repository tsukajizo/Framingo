////////////////////////////////////////////////////////////////////////////////
//
//
// Copyright 2012 Shuzo Kuwako
// All Rights Reserved.
//
//
//////////////////////////////////////////////////////////////////////////////////
package framingo.model.factory 
{
	import framingo.model.process.ProcessFlow;
	/**
	 * ...ModelManagerのから呼び出され、各処理を作成するためのクラス。
	 * 各アプリケーションの詳細はFMCoreClassにより設定されます。
	 * @author Shuzo Kuwako
	 */
	public class FlowFactory 
	{
		/**
		 * コンストラクタ
		 */
		public function FlowFactory() 
		{
			
		}
		

		/**
		 * シーンの変更に応じてProcessGroupを作成する処理。
		 * @param	type
		 * @return
		 */
		public function getFlowByName(type:String):ProcessFlow 
		{
			return new ProcessFlow();
		}
		

		/**
		 * 最初のシーンに応じた処理を作成する処理
		 * @return
		 */
		public function getIndexFlow():ProcessFlow 
		{
			return new ProcessFlow();
		}
		
		

	}

}