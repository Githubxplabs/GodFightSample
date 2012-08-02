package me.xplabs.login.controller 
{
	import me.xplabs.login.view.LoginView;
	import me.xplabs.login.view.LoginViewMediator;
	import org.robotlegs.mvcs.Command;
	
	/**
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
			mediatorMap.mapView(LoginView, LoginViewMediator);
			contextView.addChild(new LoginView());
		}
		
	}

}