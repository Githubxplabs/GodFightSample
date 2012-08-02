package me.xplabs 
{
	import me.xplabs.login.controller.LoginViewCommand;
	import me.xplabs.login.events.LoginEvent;
	import org.robotlegs.mvcs.Command;
	
	/**
	 * ...
	 * @author xiaohan
	 */
	public class StartUpCommand extends Command 
	{
		
		public function StartUpCommand() 
		{
			super();
			
		}
		override public function execute():void 
		{
			commandMap.mapEvent(LoginEvent.ENTER_LOGIN_SCENE, LoginViewCommand, LoginEvent);
			dispatch(new LoginEvent(LoginEvent.ENTER_LOGIN_SCENE));
		}
		
	}

}