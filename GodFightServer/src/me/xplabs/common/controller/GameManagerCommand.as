package me.xplabs.common.controller 
{
	import flash.events.Event;
	import me.xplabs.interfaces.common.IUpdate;
	import org.robotlegs.mvcs.Command;
	
	/**
	 * ...
	 * @author xiaohan
	 */
	public class GameManagerCommand extends Command 
	{
		[Inject]
		public var gameManager:IUpdate;
		public function GameManagerCommand() 
		{
			super();
			
		}
		override public function execute():void 
		{
			contextView.addEventListener(Event.ENTER_FRAME, gameManager.update);
		}
	}

}