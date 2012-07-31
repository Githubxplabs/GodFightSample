package me.xplabs.login.controller {
	import me.xplabs.servers.lander.CSLogin;
	import me.xplabs.servers.lander.SCLoginResult;
	import me.xplabs.servers.MsgCommand;
	import me.xplabs.utils.sendMsg;

	/**
	 * ...
	 * @author xiaohan
	 */
	public class CSLoginCommand extends MsgCommand {
		public function CSLoginCommand() {
			super();
		}

		override public function execute() : void {
			super.execute();
			trace("有客户端登录成功了");
			var scLoginResult : SCLoginResult = new SCLoginResult();
			scLoginResult.isLoginSucceed = true;
			sendMsg("", scLoginResult);
		}
	}
}