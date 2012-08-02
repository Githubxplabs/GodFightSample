package me.xplabs.common.controller 
{
	import flash.events.Event;
	import me.xplabs.common.events.GameManagerEvent;
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
			commandMap.mapEvent(GameManagerEvent.START_GAME_UPDATE, StartUpdateCommand, GameManagerEvent);
			commandMap.mapEvent(GameManagerEvent.STOP_GAME_UPDATE, StopUpdateCommand, GameManagerEvent);
			
			dispatch(new GameManagerEvent(GameManagerEvent.START_GAME_UPDATE));
		}
	}

}