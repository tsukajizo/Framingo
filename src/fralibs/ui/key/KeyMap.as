package fralibs.ui.key 
{
	/**
	 * ...
	 * @author Shuzo Kuwako
	 */
	public class KeyMap 
	{
		
		public function KeyMap() 
		{
			
		}
		
		public static function unicodeToAcii(str:String):int
		{
			switch(str) {
				case "l":
					return 76;
				case "o":
					return 79;
				case "q":
					return 81;
				default:
			}
			return -1;
		}
		
	}

}