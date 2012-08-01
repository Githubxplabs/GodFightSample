package me.xplabs.common.controller 
{
	import me.xplabs.interfaces.common.IGameManagerStateControl;
	import org.robotlegs.mvcs.Command;
	
	/**
	 * ...
	 * @author xiaohan
	 */
	public class StopUpdateCommand extends Command 
	{
		[Inject]
		public var gameManager:IGameManagerStateControl;
		public function StopUpdateCommand() 
		{
			super();
			
		}
		override public function execute():void 
		{
			gameManager.stopUpdate();
		}
	}

}