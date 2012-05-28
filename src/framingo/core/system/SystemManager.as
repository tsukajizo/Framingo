package framingo.core.system 
{
	import framingo.core.FMCoreClass;
	import framingo.core.FMCoreSetting;
	/**
	 * ...アプリケーション全体の設定を行う。アプリケーション生成時に、アプリケーションの個別設定を外部から読み込み、個別の設定とは独立したアプリケーションフレームワークとして動作するように作成されます。アプリケーション内部からの再設定はできません。
	 * 
	 * TODO:シングルトン化
	 * @author Shuzo Kuwako
	 */
	public class SystemManager 
	{
		/**
		 * アプリケーション全体のクラス定義を行います。
		 * 設定されたデータはシングルトン化され、取得のみが可能になります。
		 */
		private static var _core:FMCoreClass;
		private static var _config:FMCoreSetting;
		private static var _system:SystemManager;
		private static var _intialized:Boolean = false;
		/**
		 * 
		 * @param	core FMApplicationの全体ののクラスの定義を行います。
		 * @param	config　FMApplicationの全体の設定を行います。
		 */
		public function SystemManager(core:FMCoreClass,config:FMCoreSetting) 
		{
			if(!_intialized){
				_core = core;
				_config = config;
				_system = this;
				_intialized = true;
			}
		}
		
		static public function get core():FMCoreClass 
		{
			return _core;
		}
		
		static public function get config():FMCoreSetting 
		{
			return _config;
		}
		
	}

}