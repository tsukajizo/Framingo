////////////////////////////////////////////////////////////////////////////////
//
//
// Copyright 2012 Shuzo Kuwako
// All Rights Reserved.
//
//
//////////////////////////////////////////////////////////////////////////////////
package fralibs.ui.key.data 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import framingo.data.action.AbstractAction;
	import framingo.presenter.IThrowableAction;
	import framingo.view.events.ActionObjectEvent;
	import framingo.view.interactive.ActionObject;
	import fralibs.ui.key.KeyMap;
	
	/**
	 * ...
	 * @author Shuzo Kuwako
	 */
	public class KeyShortcutObject extends ActionObject implements IThrowableAction 
	{
		private var _type:String;
		private var _keyType:int;
		private var _action:AbstractAction
		
		//シフトキー操作
		private var _withShift:Boolean;
		private var _onShift:Boolean;
		
		//コントロールキー操作
		private var _withCtrl:Boolean;
		private var _onCtrl:Boolean;
		
		public function KeyShortcutObject(keyType:String,action:AbstractAction) 
		{
			_keyType = KeyMap.unicodeToAcii(keyType);
			super(action);
			initKeyAction();
		}
		
		private function initKeyAction():void 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);

		}
		
		private function addedToStageHandler(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownActionHandler);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyUpActionHandler);
		}
		
		private function keyUpActionHandler(e:KeyboardEvent):void 
		{
			switch (e.keyCode) {
				case Keyboard.CONTROL:
					_onCtrl = false;
					break;
				case Keyboard.SHIFT:
					_onShift = false;
					break;
				default:
					break;
			}
		}
		
		private function keyDownActionHandler(e:KeyboardEvent):void 
		{

			switch(e.keyCode) {
				case Keyboard.CONTROL:
					_onCtrl = true;
					break;
				case Keyboard.SHIFT:
					_onShift = true;
					break;
				case _keyType:
					keyPressed();
					break;
				default:
					break;
			}
		}
		
		private function keyPressed():void 
		{
			if (_withCtrl && _withShift) {
				if (!_onCtrl) return;
				if (!_onShift) return;
				throwAction();
				return;
			}else if (_withCtrl) {

				if (!_onCtrl) return;

				throwAction();
				return;
			}else if (_withShift) {
				if (!_onShift) return;
				throwAction();
				return;
			}

			throwAction();
		}
		
		
		public function set onShift(value:Boolean):void 
		{
			_onShift = value;
		}
		
		public function set withCtrl(value:Boolean):void 
		{
			_withCtrl = value;
		}
		
		public function set withShift(value:Boolean):void 
		{
			_withShift = value;
		}
		


		
	}

}