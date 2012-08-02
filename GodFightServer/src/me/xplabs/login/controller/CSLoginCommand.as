package me.xplabs.login.controller {
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
		public function CSLoginCommand() {
			super();
		}

		override public function execute() : void {
			super.execute();
			var msg:CSLogin = baseMessage as CSLogin;
			playerManager.addPlayer(msg.clientId, msg.userName);
			
			
			trace("有客户端登录成功了");
			var scLoginResult : SCLoginResult = new SCLoginResult();
			scLoginResult.isLoginSucceed = true;
			sendMsg("", scLoginResult);
		}
	}
}