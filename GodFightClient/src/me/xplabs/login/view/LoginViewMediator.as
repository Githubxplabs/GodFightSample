package me.xplabs.login.view 
{
	import org.robotlegs.mvcs.Mediator;
	
	/**
	 * ...
	 * @author xiaohan
	 */
	public class LoginViewMediator extends Mediator 
	{
		[Inject]
		public var loginView:LoginView;
		public function LoginViewMediator() 
		{
			super();
			
		}
		override public function onRegister():void 
		{
			super.onRegister();
		}
		
	}

}