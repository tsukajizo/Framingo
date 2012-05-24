////////////////////////////////////////////////////////////////////////////////
//
//
// Copyright 2012 Shuzo Kuwako
// All Rights Reserved.
//
//
//////////////////////////////////////////////////////////////////////////////////
package framingo.view.factory 
{
	import framingo.view.scenes.AbstractScene;
	import framingo.core.error.UnimplementedError;
	/**
	 * ...
	 * @author Shuzo Kuwako
	 */
	public class SceneFactory 
	{
		
		public function SceneFactory() 
		{
			
		}
		
		public function getIndexScnene():AbstractScene
		{
			throw new UnimplementedError();
			return new AbstractScene("Abstract")
		}
		
		public function getSceneByType(type:String):AbstractScene 
		{
			throw new UnimplementedError();
			return new AbstractScene("Abstract")
		}
		
	}

}