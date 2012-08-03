package me.xplabs.login.controller {
	import me.xplabs.constant.AccountCheckingType;
	import me.xplabs.interfaces.account.IAccountChecking;
	import me.xplabs.interfaces.player.IPlayerManager;
	import me.xplabs.servers.lander.CSLogin;
	import me.xplabs.servers.lander.SCLoginResult;
	import me.xplabs.servers.MsgCommand;
	import me.xplabs.utils.sendMsg;

	/**
	 * ...
	 * @author xiaohan
	 */
	public class CSLoginCommand extends MsgCommand {
		[Inject]
		public var playerManager:IPlayerManager;
		[Inject]
		public var account:IAccountChecking;

		public function CSLoginCommand() {
			super();
		}

		override public function execute() : void {
			super.execute();
			var msg:CSLogin = baseMessage as CSLogin;
			var checking:int = account.checking(msg.userName, msg.passWord);
			
			var scLoginResult : SCLoginResult = new SCLoginResult();
			scLoginResult.checkedType = checking;
			sendMsg(msg.clientId, scLoginResult);
			
			if (checking == AccountCheckingType.CHECK_PASS)
			{
				playerManager.addPlayer(msg.clientId, msg.userName);
				
			}
			//trace("客户端=="msg.clientId, "用户名==" + msg.userName, "登陆成功了!!");
		}
	}
}