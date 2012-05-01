package framingo.core.log 
{
	/**
	 * ...
	 * @author Shuzo Kuwako
	 */
	public class Logger 
	{
		
		public function Logger() 
		{
			
		}
		
		public static function errorLog(e:Error):void{
			trace("Error:Occured: ", new Date());
			trace("------------------------------------");
			trace(e.errorID, e.message);
		}
	}

}