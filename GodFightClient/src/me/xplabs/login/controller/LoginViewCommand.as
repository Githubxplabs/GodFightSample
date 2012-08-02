package me.xplabs.login.controller 
{
	import me.xplabs.login.events.LoginEvent;
	import me.xplabs.login.view.LoginView;
	import me.xplabs.login.view.LoginViewMediator;
	import org.robotlegs.mvcs.Command;
	
	/**
	 * 登陆界面Command
	 * ...
	 * @author xiaohan
	 */
	public class LoginViewCommand extends Command 
	{
		
		public function LoginViewCommand() 
		{
			super();
			
		}
		
		override public function execute():void 
		{
			
			commandMap.mapEvent(LoginEvent.CLICK_ENTER_GAME, LoginGameCommand, LoginEvent);
			mediatorMap.mapView(LoginView, LoginViewMediator);
			contextView.addChild(new LoginView());
		}
		
	}

}