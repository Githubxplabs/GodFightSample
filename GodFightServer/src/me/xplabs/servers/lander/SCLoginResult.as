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
		 * 验证用户名和密码的状态
		 */
		public var checkedType : int;

		public function SCLoginResult() {
		}

		override public function get type() : int {
			return MessageType.SC_LOGIN_RESULT;
		}

		override public function read() : void {
			checkedType = readInt();
		}

		override public function write() : void {
			writeInt(checkedType);
		}
	}
}