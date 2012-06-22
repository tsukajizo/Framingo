package framingo.data.action 
{
	/**
	 * ...
	 * @author Shuzo Kuwako
	 */
	public class DialogAction extends AbstractAction 
	{
		public static const POP_ACT:String = "pop";
		public static const CLOSE_ACT:String = "close";
		private var _act:String = "";
		
		public function DialogAction(dialogType:String,act:String) 
		{
			_act = act;
			super(dialogType);
		}
		
		public function get act():String 
		{
			return _act;
		}
		
		public function set act(value:String):void 
		{
			_act = value;
		}
		
	}

}