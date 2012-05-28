package framingo.data.action 
{
	/**
	 * ...Viewに表示することを通知しデータを渡すためのオブジェクト
	 * @author Shuzo Kuwako
	 */
	public class RenderAction extends AbstractAction 
	{
		/**
		 * 受け渡す対象の表示オブジェクトID
		 */
		private var _targetId:int;
		
		/**
		 * コンストラクタ
		 */
		public function RenderAction() 
		{
			super("RenderAction");
		}
		
		public function get targetId():int 
		{
			return _targetId;
		}
		
		public function set targetId(value:int):void 
		{
			_targetId = value;
		}
		

	}

}