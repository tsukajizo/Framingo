package framingo.view.manager 
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import framingo.core.error.DialogError;
	import framingo.data.action.AbstractAction;
	import framingo.data.action.DialogAction;
	import framingo.view.factory.DialogFactory;
	import framingo.core.system.SystemManager;
	import framingo.view.dialog.Dialog;
	/**
	 * ...ダイアログを管理するためのクラス。このクラスは継承することができない。
	 * 各ダイアログは、ずっとシーンとして保持されるのではなくファクトリパターンによって必要なタイミングで生成されます。
	 * ファクトリパターンで生成される内容に関してはXMLで記述し、builder.phpを実行することにより自動的に
	 * 生成できるように設計します。
	 * @author Shuzo Kuwako
	 */
	public final class DialogManager extends Sprite 
	{
		private var _dialogs:Array = [];
		private var _dialog:Dialog;
		private var _dialogFactory:DialogFactory;
		private var _initialized:Boolean = false;
		
		private static var _instance:DialogManager;
		public var _scene:SceneManager;

		/**
		 * コンストラクタ
		 */
		public function DialogManager() 
		{
			if (_instance != null) {
				throw new Error("Singleton Error");
			}else {
				_dialogFactory = SystemManager.core.getDialogFactory();
				addStageFunc();
			}
		}
		
		/**
		 * 新スタンスを作成 / 取得する。
		 * @param	scene　ダイアログを出現させる対象のシーン
		 * @return
		 */
		public static function getInstance(scene:SceneManager):DialogManager
		{
			if (_instance == null) {
				_instance = new DialogManager();
				_instance.setScene(scene);
			}
			return _instance;
		}
		
		/**
		 * シーンを設定する。
		 * @param	scene
		 */
		private function setScene(scene:SceneManager):void 
		{
			_scene = scene;
		}
		
		/**
		 * ステージの設定を行う。
		 */
		private final function addStageFunc():void
		{
			this.addEventListener(Event.ADDED_TO_STAGE, addedStageHandler);
			this.addEventListener(Event.REMOVED_FROM_STAGE, removedStageHandler);
		}
		
		private final function removedStageHandler(e:Event):void 
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, addedStageHandler);
			this.removeEventListener(Event.REMOVED_FROM_STAGE, removedStageHandler);
		}
		
		private final function addedStageHandler(e:Event):void
		{
			//未実装。
			_initialized = true;
		}
		
		/**
		 * アクションを実行する。
		 * @param	action
		 */
		public final function execAction(action:AbstractAction):void
		{
			trace("execAction", action.type);
			if (!_initialized) {
				return;
			}
			
			if ( !(action is DialogAction)) {
				return;
			}
			
			switch(DialogAction(action).act) {
				case DialogAction.POP_ACT:
					popDialog(action);
								trace("aaaaaaaaaaaa")
					break;
				
				case DialogAction.CLOSE_ACT:
					closeDialog();
					break;
					
				default:
					execDilaogAction(action);
			}
			
			
		}
		
		/**
		 * ダイアログを開く。
		 * @param	action
		 */
		private final function popDialog(action:AbstractAction):void 
		{
			if(_dialog != null){
				if (_dialog.isPop) {
					throw new DialogError("ダイアログを2重に開くことはできません。");
				}
			}
			_dialog = _dialogFactory.getDialogByAction(DialogAction(action));
			addChild(_dialog);
			_dialog.pop(action);
			_scene.mouseEnabled = false;
		}
		
		/**
		 * ダイアログを閉じる
		 */
		private final function closeDialog():void 
		{
			if (_dialog == null) {
				throw new DialogError("開いているダイアログがありません。");
			}
			
			if (!_dialog.isPop) {
				throw new DialogError("開いているダイアログがありません。");
			}
			_dialog.close();
			removeChild(_dialog);
			
			_scene.mouseEnabled = true;
		}
		
		/**
		 * ダイアログに設定されたアクションを実行する。
		 * @param	action
		 */
		private final function execDilaogAction(action:AbstractAction):void 
		{
			if (_dialog == null) {
				throw new DialogError("開いているダイアログがありません。");
			}
			
			if (!_dialog.isPop) {
				throw new DialogError("開いているダイアログがありません。");
			}
			_dialog.executeAction(action);
		}
		
		
	}

}