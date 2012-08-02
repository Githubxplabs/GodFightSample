package me.xplabs.login.controller 
{
	import me.xplabs.constant.AccountCheckingType;
	import me.xplabs.servers.lander.SCLoginResult;
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
			
			var msg:SCLoginResult = baseMessage as SCLoginResult;
			if (msg.checkedType == AccountCheckingType.CHECK_PASS)
			{
				trace("验证通过了");
			}else if (msg.checkedType == AccountCheckingType.ERROR_PASS_WORD)
			{
				trace("密码错误了");
			}else
			{
				trace("用户名错误了");
			}
			
		}
	}

}