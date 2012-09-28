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
			addViewListener(LoginEvent.CLICK_ENTER_GAME, clickEnterGameHandler, LoginEvent);
			addContextListener(LoginEvent.REMOVE_LOGIN_SCENE, removeLoginHandler, LoginEvent);
		}
		/**
		 * 移除登陆场景
		 * @param	e
		 */
		private function removeLoginHandler(e:LoginEvent):void 
		{
			if (loginView.parent != null) loginView.parent.removeChild(loginView);
		}
		/**
		 * 点击进入游戏按钮，抛出事件
		 * @param	e
		 */
		private function clickEnterGameHandler(e:LoginEvent):void 
		{
			dispatch(e);
		}
		override public function onRemove():void 
		{
			removeViewListener(LoginEvent.CLICK_ENTER_GAME, clickEnterGameHandler, LoginEvent);
			removeContextListener(LoginEvent.REMOVE_LOGIN_SCENE, removeLoginHandler, LoginEvent);
			loginView.dispose();
		}
	}
}