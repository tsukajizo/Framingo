
package framingo.data.action 
{
	/**
	 * ...シーンの変更を行うためのアクションオブジェクト。
	 * @author Shuzo Kuwako
	 */
	public class SceneAction extends AbstractAction 
	{
		/**
		 * 移動先のシーン
		 */
		public var next:String;
		
		/**
		 * 現在のシーン
		 */
		public var current:String;
		
		/**
		 *　コンストラクタ
		 */
		public function SceneAction() 
		{
			super("SceneActioin")
		}
		
		override public function toString():String
		{
			return String("[SceneActioin : type=" +  type + " current=" +current +" next="+  next);
		}
		
	}
}