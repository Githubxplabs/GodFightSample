package me.xplabs.login.view 
{
	import me.xplabs.login.events.LoginEvent;
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
			loginView.init();
			loginView.addEventListener(LoginEvent.CLICK_ENTER_GAME, clickEnterGameHandler);
		}
		
		private function clickEnterGameHandler(e:LoginEvent):void 
		{
			dispatch(e);
		}
		override public function onRemove():void 
		{
			loginView.dispose();
		}
	}
}