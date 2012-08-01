package me.xplabs.common.model 
{
	import flash.events.Event;
	import me.xplabs.interfaces.common.IGameManager;
	import me.xplabs.interfaces.common.IGameManagerStateControl;
	import me.xplabs.interfaces.common.IUpdate;
	/**
	 * ...
	 * @author xiaohan
	 */
	public class GameManager implements IGameManager,IUpdate,IGameManagerStateControl
	{
		
		public function GameManager() 
		{
			
		}
		
		/* INTERFACE me.xplabs.interfaces.common.IGameManager */
		
		public function addUpdate(func:Function):void 
		{
			
		}
		
		public function removeUpdate(func:Function):Function 
		{
			return null;
		}
		
		public function startUpdate():void 
		{
			
		}
		
		public function stopUpdate():void 
		{
			
		}
		
		/* INTERFACE me.xplabs.interfaces.common.IUpdate */
		
		public function update(e:Event = null):void 
		{
			
		}
		
	}

}