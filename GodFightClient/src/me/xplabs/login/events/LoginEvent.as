package me.xplabs.login.events 
{
	import starling.events.Event;
	
	/**
	 * 登陆游戏事件类型定义
	 * ...
	 * @author xiaohan
	 */
	public class LoginEvent extends Event 
	{
		/**
		 * 进入登陆场景
		 */
		public static const ENTER_LOGIN_SCENE:String = "enterLoginScene";
		/**
		 * 点击进入游戏
		 */
		public static const CLICK_ENTER_GAME:String = "clickEnterGame";
		/**
		 * 移除登陆场景
		 */
		public static const REMOVE_LOGIN_SCENE:String = "removeLoginScene";
		public function LoginEvent(type:String, bubbles:Boolean=false, data:Object=null) 
		{
			super(type, bubbles, data);
			
		}
		
	}

}