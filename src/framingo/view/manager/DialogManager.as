////////////////////////////////////////////////////////////////////////////////
//
//
// Copyright 2012 Shuzo Kuwako
// All Rights Reserved.
//
//
//////////////////////////////////////////////////////////////////////////////////
package framingo.view.manager 
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
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
		private var _stage:Stage;

		public function DialogManager() 
		{
			addStageFunc();
		
		}
		
		private function addStageFunc():void
		{
			this.addEventListener(Event.ADDED_TO_STAGE, addedStageHandler);
			this.addEventListener(Event.REMOVED_FROM_STAGE, removedStageHandler);
		}
		
		private function removedStageHandler(e:Event):void 
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, addedStageHandler);
			this.removeEventListener(Event.REMOVED_FROM_STAGE, removedStageHandler);
		}
		
		private function addedStageHandler(e:Event):void
		{
			_stage = this.root.stage;
		}
	}

}