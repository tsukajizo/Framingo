package framingo.core 
{
	import framingo.core.error.ErrorManager;
	import framingo.core.error.UnimplementedError;
	import framingo.model.factory.FlowFactory;
	import framingo.model.manager.DataManager;
	import framingo.view.factory.DialogFactory;
	import framingo.view.factory.SceneFactory;
	/**
	 * ...アプリケーションの細かいクラスを定義するものです。
	 * こちらを継承した、クラスの定義を読み込んで、
	 * FMApplicationで必要とされるすべてのクラスが動的に定義され、グローバル変数として一意に扱われます。
	 * 
	 * 
	 * こちらを受け渡すことによって、すべてのアプリケーションの設定を行いアプリケーションごとの個別の設定を、フレームワークから切り離す役割をします。
	 * 
	 * 
	 * @author Shuzo Kuwako
	 */
	public class FMCoreClass
	{
		/**
		 * コンストラクタ
		 */
		public function FMCoreClass() 
		{
			
		}
		
		
		//------------------------------------------
		//
		//　ファクトリクラスの抽象クラス設定
		//
		//------------------------------------------		
		/**
		 * 各種シーンを作成するファクトリクラスを作成する。
		 * @return
		 */
		public function getSceneFactory():SceneFactory
		{
			throw new UnimplementedError();
			return new SceneFactory();
		}
		
		/**
		 * ダイアログを作成するファクトリクラスを作成する。
		 * @return
		 */
		public function getDialogFactory():DialogFactory
		{
			return new DialogFactory();
		}
		
		/**
		 * 各種プロセスを作成するファクトリクラスを作成する。
		 * @return
		 */
		public function getProcessFactory():FlowFactory
		{
			throw new UnimplementedError();
			return new FlowFactory();
		}
		
		//------------------------------------------
		//
		//　マネージャークラスの抽象クラス設定
		//
		//------------------------------------------		
		/**
		 * オンメモリデータを保持するためのマネージャークラスを作成する。
		 * @return
		 */
		public function getDataManager():DataManager 
		{
			throw new UnimplementedError();
			return new DataManager();
		}
		
		public function getErrorManager():ErrorManager
		{
			throw new UnimplementedError();
			return new ErrorManager();
		}
		
	}

}