package me.xplabs.login.controller 
{
	import me.xplabs.interfaces.net.IConnector;
	import me.xplabs.login.events.LoginEvent;
	import me.xplabs.login.model.vo.AccountVO;
	import me.xplabs.servers.lander.CSLogin;
	import me.xplabs.utils.sendMsg;
	import org.robotlegs.mvcs.Command;
	
	/**
	 * 进入游戏
	 * ...
	 * @author xiaohan
	 */
	public class LoginGameCommand extends Command 
	{
		[Inject]
		public var event:LoginEvent;
		public function LoginGameCommand() 
		{
			super();
		}
		override public function execute():void 
		{
			var msg:CSLogin = new CSLogin();
			var data:AccountVO = AccountVO(event.data);
			msg.userName = data.userName;
			msg.passWord = data.passWord;
			sendMsg(msg);
		}
	}

}