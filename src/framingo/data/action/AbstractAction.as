////////////////////////////////////////////////////////////////////////////////
//
//
// Copyright 2012 Shuzo Kuwako
// All Rights Reserved.
//
//
//////////////////////////////////////////////////////////////////////////////////
package framingo.data.action 
{
	import framingo.data.action.IDataTransfer;
	/**
	 * ...アクションオブジェクトの抽象クラス。
	 * アクションクラスにはアプリケーションの挙動を記述します。アプリケーションのデータに関連するすべての挙動は、このアクションオブジェクトによって各モデルやビューに通知され、それによって動作を決定します。
	 * また、アクションはIActionThrowableを実装しているオブジェクトからのみ創出されます。
	 * @author Shuzo Kuwako
	 */
	public class AbstractAction 
	{
		/**
		 * アクションのタイプ
		 */
		private var _type:String;
		
		/**
		 * アクションの同期、非同期。
		 */
		private var _sync:String;
		
		private var _transferObject:IDataTransfer
		
		/**
		 * コンストラクタ
		 * @param	type
		 */
		public function AbstractAction(type:String,sync:String = "async") 
		{
			_type = type;
			_sync = sync;
		}
		
		public function toString():String
		{
			return "[ AbstractAction : type=",_type ," ]";
		}
		
		public function get type():String 
		{
			return _type;
		}
		
		public function set type(value:String):void 
		{
			_type = value;
		}
		
		public function get transferObject():IDataTransfer 
		{
			return _transferObject;
		}
		
		public function set transferObject(value:IDataTransfer):void 
		{
			_transferObject = value;
		}
		
		public function get sync():String 
		{
			return _sync;
		}
		
	}

}