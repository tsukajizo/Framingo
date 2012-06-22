package framingo.view.factory 
{
	import framingo.data.action.DialogAction;
	import framingo.view.dialog.Dialog;
	/**
	 * ...
	 * @author Shuzo Kuwako
	 */
	public class DialogFactory 
	{
		
		public function DialogFactory() 
		{
			
		}
		
		public function getDialogByAction(action:DialogAction):Dialog
		{
			return new Dialog("default");
		}
		
	}

}