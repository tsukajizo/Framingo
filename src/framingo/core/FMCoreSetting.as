////////////////////////////////////////////////////////////////////////////////
//
//
// Copyright 2012 Shuzo Kuwako
// All Rights Reserved.
//
//
//////////////////////////////////////////////////////////////////////////////////
package framingo.core 
{
	import flash.display.Sprite;
	/**
	 * ...アプリケーションの細かい設定を定義するものです。
	 * こちらを継承した、設定を読み込んで、
	 * FMApplicationで必要とされるすべてのクラスが動的に定義され、グローバル変数として一意に扱われます。
	 * 
	 * こちらを受け渡すことによって、すべてのアプリケーションの設定を行いアプリケーションごとの個別の設定を、フレームワークから切り離す役割をします。
	 * @author Shuzo Kuwako
	 */
	public class FMCoreSetting 
	{
		public static const VERSION:Number = 0.10;
		
		protected static var _global:Sprite;
		
		public function FMCoreSetting() 
		{
			init();
		}
		
		private function init():void 
		{
			_global = new Sprite();
		}
		
		public static function get GLOBAL():Sprite 
		{
			return _global;
		}
		
	}

}