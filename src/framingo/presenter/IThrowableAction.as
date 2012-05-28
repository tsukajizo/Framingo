package framingo.presenter 
{
	import framingo.data.action.AbstractAction;
	
	/**
	 * ...
	 * @author Shuzo Kuwako
	 */
	public interface IThrowableAction 
	{
		function throwAction():void;
		function get action():AbstractAction 
	}
	
}