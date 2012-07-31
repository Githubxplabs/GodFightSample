package me.xplabs.servers.lander {
	import me.xplabs.servers.BaseMessage;
	import me.xplabs.servers.MessageType;

	/**
	 * 登陆游戏的结果
	 * ...
	 * @author xiaohan
	 */
	public class SCLoginResult extends BaseMessage {
		/**
		 * 是否登陆成功
		 */
		public var isLoginSucceed : Boolean;

		public function SCLoginResult() {
		}

		override public function get type() : int {
			return MessageType.SC_LOGIN_RESULT;
		}

		override public function read() : void {
			isLoginSucceed = readBoolean();
		}

		override public function write() : void {
			writeBoolean(isLoginSucceed);
		}
	}
}