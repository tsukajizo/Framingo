package framingo.data 
{
	/**
	 * ...各シーンで処理に使うためのデータグループ。
	 * データマネージャー上で管理しているデータの参照を、各プロセスへ受け渡す役割をします。
	 * @author Shuzo Kuwako
	 */
	public class AbstractDataGroup 
	{
		private var _type:String
		public function AbstractDataGroup(type:String) 
		{
			_type = type;
		}
		
		public function get type():String 
		{
			return _type;
		}
		
		public function set type(value:String):void 
		{
			_type = value;
		}
		
	}

}