
package framingo.view.scenes 
{
	import flash.display.DisplayObject;
	import flash.display.Stage;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.filters.DropShadowFilter;
	import framingo.core.error.UnimplementedError;
	import framingo.data.action.AbstractAction;
	import framingo.data.action.IDataTransfer;
	import framingo.data.action.RenderAction;
	import framingo.presenter.IActionReceivable;
	import framingo.view.interactive.ActionObject;
	import framingo.presenter.IThrowableAction;
	import framingo.view.render.IRenderableData;
	/**
	 * ...シーンの抽象クラス
	 * すべてのシーンはこのクラスを継承し、属しているグループを指定する。
	 * アプリケーションの処理からデータを取得し実行するアクション（VIEW内では完結しないもの）を行うオブジェクトにはすべてIDが振られている必要があり。
	 * そのIDと結び付けられたオブジェクトのみアクションを実行することができる。
	 * @author Shuzo Kuwako
	 */
	public class AbstractScene extends Sprite implements IActionReceivable
	{
		private var _type:String = "";  	/* シーンの名称　*/
		private var _groups:Array = [];		/* シーンの属しているグループ*/
		private var _sceneWidth:Number;
		private var _sceneHeight:Number;
		private var _renderContaner:SceneChildren;
		protected var _transferObject:IDataTransfer;
		
		/**
		 * コンストラクタ
		 * @param	type
		 * @param	groups
		 */
		public function AbstractScene(type:String, groups:Array) 
		{
			_groups = groups
			_type = type;
			init();
		}
		
		/**
		 * 初期化処理
		 */
		private function init():void
		{
			this.addEventListener(Event.ADDED_TO_STAGE, sceneAdded);
			this.addEventListener(Event.REMOVED_FROM_STAGE, sceneRemoved);
			_renderContaner = new SceneChildren();
		}
		
		/**
		 * シーンが追加されたときの処理
		 * @param	e
		 */
		private function sceneAdded(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, sceneAdded);
			_renderContaner = new SceneChildren();
			initScene();
		}
		
		/**
		 * シーンが削除されたときの処理。
		 * @param	e
		 */
		public function sceneRemoved(e:Event):void
		{	
			this.removeEventListener(Event.REMOVED_FROM_STAGE, sceneRemoved)
			var num:Number = this.numChildren
			for (var i:int = 0; i < num; i++ ) {
				removeChildAt(0);
			}
			_renderContaner = null;
		}
		
		public function setSceneSize(width:Number,height:Number):void
		{
			_sceneWidth = width;
			_sceneHeight = height;
		}
		
		/**
		 * シーンを初期化する。
		 */
		protected function initScene():void { }
		
		/*
		public function removeFromWindow():void{}
		public function returnInWindow():void { }
		*/
		/**
		 * 取得したアクションオブジェクトの処理をする。子クラスは必ずこのメソッドを継承する。継承が行われていない場合はUnimplemetedErrorが送出される。
		 * @param	actions
		 */
		public function execActions(actions:Array):void
		{
			for (var i:int = 0; i < actions.length; i++ ) {
				execAction(actions[i]);
			}

		}
		
		/**
		 * シーン中の表示オブジェクトのアクションを実行する。
		 * @param	action
		 */
		public final function execAction(action:AbstractAction):void
		{
			if (action is RenderAction) {
				if (!_renderContaner[RenderAction(action).targetId]) return;
				IRenderableData((_renderContaner[RenderAction(action).targetId])).execAction(RenderAction(action));
			}
		}
		

		/**
		 * シーンに表示ツリーに表示オブジェクトを追加する。各表示オブジェクトには個別のID番号を登録することができる。ことができるが、シーン中に同じIDのものを二つ以上保持することができない。
		 * IDの指定のないものに関しては、すべてIDを0として扱い、IDが0のものに関しては番号が登録されない。
		 * @param	child
		 * @return
		 */
		override public function addChild(child:DisplayObject):DisplayObject
		{
			if (child is IRenderableData) {
				if ( IRenderableData(child).objectId != 0) {
					if (_renderContaner[IRenderableData(child).objectId] != undefined) {
						throw new Error("This id is already used");
					}
					_renderContaner[IRenderableData(child).objectId] = child;
				}
				return super.addChild(child);
				
			}
			
			throw new Error("This is unavailable child");
		}
		
		/**
		 * シーンの表示ツリーの指定のインデックス番号にに表示オブジェクトを追加する。各表示オブジェクトには個別のID番号を登録することができる。ことができるが、シーン中に同じIDのものを二つ以上保持することができない。
		 * IDの指定のないものに関しては、すべてIDを0として扱い、IDが0のものに関しては番号が登録されない。
		 * @param	child
		 * @return
		 */
		override public function addChildAt(child:DisplayObject, index:int):DisplayObject
		{
			if (child is IRenderableData) {
				if ( IRenderableData(child).objectId != 0) {
					if (_renderContaner[IRenderableData(child).objectId] != undefined || IRenderableData(child).objectId != 0) {
						throw new Error("This id is already used");
					}
					_renderContaner[IRenderableData(child).objectId] = child;
				}
				return super.addChild(child);
				
			}
			throw new Error("This is unavailable child");
		}
		
		/**
		 * 表示ツリーから表示オブジェクトを削除する。
		 * @param	child
		 * @return
		 */
		override public function removeChild(child:DisplayObject):DisplayObject
		{
			if(_renderContaner[IRenderableData(child).objectId]){
				delete _renderContaner[IRenderableData(child).objectId];
			}
			return super.removeChild(child);
		}
		
		/**
		 * 表示ツリーから指定の番号の表示オブジェクトを削除する。
		 * @param	index
		 * @return
		 */
		override public function removeChildAt(index:int):DisplayObject
		{
			if(_renderContaner[IRenderableData(getChildAt(index)).objectId]){
				delete _renderContaner[IRenderableData(getChildAt(index)).objectId];
			}
			return super.removeChildAt(index);
		}
		
		
		
		public function get type():String
		{
			return _type;
		}
		
		public function set transferObject(value:IDataTransfer):void 
		{
			_transferObject = value;
		}
		
		
		
	}

}