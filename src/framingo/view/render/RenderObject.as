package framingo.view.render 
{
	import flash.display.Sprite;
	import framingo.data.action.IDataTransfer;
	import framingo.data.action.RenderAction;
	import framingo.view.events.RenderObjectEvent;
	/**
	 * ...シーン上に表示をするためのオブジェクト。シーン上に作成されるオブジェクトはすべてこのレンダーオブジェクトを継承している必要があります。
	 * @author Shuzo Kuwako
	 */
	public class RenderObject extends Sprite implements IRenderableData
	{
		/**
		 * アクションを実行するためのID
		 */
		private var _objectId:int;
		protected var _transferObject:IDataTransfer
		
		/**
		 * コンストラクタ
		 * @param	objectId
		 */
		public function RenderObject(id:int = 0) 
		{
			_objectId = id;
		}
		
		/**
		 * シーンから受け渡されたアクションを実行するための関数。
		 * オブジェクトの振る舞いを指定します。
		 * @param	action
		 */
		public function execAction(action:RenderAction):void
		{
			_transferObject = action.transferObject;
		}
		
		
		protected function execComplete():void
		{
			dispatchEvent(new RenderObjectEvent(RenderObjectEvent.COMPLETE));
		}

		
		override public function toString():String
		{
			return "[ RenderObject : objectId=" + _objectId + "]";
		}
		
		public function get objectId():int 
		{
			return _objectId;
		}
		
		public function set objectId(value:int):void 
		{
			_objectId = value;
		}
	}

}