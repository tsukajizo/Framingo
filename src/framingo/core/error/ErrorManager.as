package framingo.core.error 
{
	import framingo.core.log.Logger;
	/**
	 * ...
	 * @author Shuzo Kuwako
	 */
	public class ErrorManager 
	{
		public function ErrorManager() 
		{
			
		}
		
		public function catchError(e:Error):void
		{
			Logger.errorLog(e);
		}
		
	}

}