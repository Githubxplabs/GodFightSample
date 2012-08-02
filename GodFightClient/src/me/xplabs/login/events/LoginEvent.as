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
		public static const ENTER_LOGIN_SCENE:String = "enterLoginScene";
		public static const CLICK_ENTER_GAME:String = "clickEnterGame";
		public function LoginEvent(type:String, bubbles:Boolean=false, data:Object=null) 
		{
			super(type, bubbles, data);
			
		}
		
	}

}