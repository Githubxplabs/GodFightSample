package me.xplabs.login.events 
{
	import starling.events.Event;
	
	/**
	 * ...
	 * @author xiaohan
	 */
	public class LoginEvent extends Event 
	{
		public static const ENTER_LOGIN_SCENE:String = "enterLoginScene";
		public function LoginEvent(type:String, bubbles:Boolean=false, data:Object=null) 
		{
			super(type, bubbles, data);
			
		}
		
	}

}