package framingo.model.manager 
{
	import framingo.core.error.UnimplementedError;
	import framingo.data.AbstractDataGroup;
	/**
	 * ...アプリケーションのオンメモリのデータを管理するためのクラス。
	 * 必要に応じてデータをアプリケーションのモデルに参照を渡す。
	 * 
	 * @author Shuzo Kuwako
	 */
	public class DataManager 
	{
		/**
		 * コンストラクタ
		 * TODO:シングルトン化する。
		 */
		public function DataManager() 
		{
			initData();
			initDataGroup();
		}
		
		/**
		 * データを初期化する
		 */
		public function initData():void
		{
			throw new UnimplementedError();
		}
		
		
				/**
		 * データグループを初期化する
		 */
		public function initDataGroup():void
		{
			throw new UnimplementedError();
		}
		
		
		/**
		 * データのグループを取得するファクトリメソッド。
		 * @param	type
		 * @return
		 */
		public function getDataGroupByType(type:String):AbstractDataGroup 
		{
			throw new UnimplementedError();
			
			//実装サンプル
			var group:AbstractDataGroup;

			switch(type) {
				default:
					group = new AbstractDataGroup("DEFAULT");
			}
			return group;
		}
		
		
		/**
		 * 最初のデータのグループを取得するファクトリメソッド。
		 * @return
		 */
		public function getIndexDataGroupByType():AbstractDataGroup 
		{
			throw new UnimplementedError();
			return new AbstractDataGroup("DEFAULT");
		}
		
	}

}