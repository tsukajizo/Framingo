////////////////////////////////////////////////////////////////////////////////
//
//
// Copyright 2012 Shuzo Kuwako
// All Rights Reserved.
//
//
//////////////////////////////////////////////////////////////////////////////////
package framingo.view.interactive 
{
	import flash.display.Sprite;
	import framingo.data.action.AbstractAction;
	import framingo.presenter.IThrowableAction;
	import framingo.view.events.ActionObjectEvent;
	import framingo.view.render.RenderObject;
	
	/**
	 * ...アプリケーションに通知し、アプリケーションの状態に直接変更を加えさせるためのオブジェクト。
	 * MVCパターンの中でVIEW内部で完結する場合のデータ操作の場合は、RnderObjectのほうを利用して、View内部でデータを完結させる。
	 * @author Shuzo Kuwako
	 */
	public class ActionObject extends RenderObject implements IThrowableAction
	{
		private var _action:AbstractAction;
		public function ActionObject(action:AbstractAction,id:int = 0) 
		{
			super(id);
			_action =  action;
		}
		
		/**
		 * 
		 */
		public function throwAction():void {
			dispatchEvent( new ActionObjectEvent(ActionObjectEvent.THROW,_action));
		}
		
		
		public function set action(value:AbstractAction):void 
		{
			_action = value;
		}
		
		public function get action():AbstractAction
		{
			return action;
		}
	}

}