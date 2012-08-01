package me.xplabs.common.controller 
{
	import me.xplabs.interfaces.common.IGameManager;
	import org.robotlegs.mvcs.Command;
	
	/**
	 * ...
	 * @author xiaohan
	 */
	public class StartUpdateCommand extends Command 
	{
		[Inject]
		public var gameManager:IGameManager;
		public function StartUpdateCommand() 
		{
			super();
			
		}
		override public function execute():void 
		{
			gameManager.startUpdate();
		}
	}

}