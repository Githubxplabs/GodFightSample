package me.xplabs.login.controller 
{
	import me.xplabs.servers.MsgCommand;
	
	/**
	 * 登陆游戏的结果
	 * ...
	 * @author xiaohan
	 */
	public class SCLoginResultCommand extends MsgCommand 
	{
		
		public function SCLoginResultCommand() 
		{
			super();
			
		}
		override public function execute():void 
		{
			super.execute();
			trace("执行到登录结果了");
		}
	}

}