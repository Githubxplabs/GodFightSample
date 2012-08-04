package me.xplabs.utils {
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;

	import me.xplabs.interfaces.net.IServerSocket;
	import me.xplabs.interfaces.servers.IBaseMessage;
	import me.xplabs.net.model.SocketServer;
	import me.xplabs.servers.MessageType;
	import me.xplabs.utils.printMsg;

	/**
	 * 
	 * ...
	 * @author xiaohan
	 */
	public class MessageHandle {
		/**
		 * 消息映射的数据描述
		 */
		private static var _msgDescribe : Dictionary;
		/**
		 * socketServer管理器
		 */
		private static var _socketServer : IServerSocket;

		/**
		 * 设置SocketServer管理器
		 */
		public static function set socketServer(socket : IServerSocket) : void {
			_socketServer = socket;
		}

		/**
		 * 写入消息发哦是那个消息到客户端
		 * @param	clinetId 客户端id
		 * @param	baseMessage 消息数据
		 */
		public static function sendMessage(clinetId : String, baseMessage : IBaseMessage) : void {
			printMsg(baseMessage.type);
			baseMessage.bytes = new ByteArray();
			baseMessage.write();
			_socketServer.send(clinetId, baseMessage);
		}

		/**
		 * 获取消息类型描述的映射
		 * @param	msgType 消息类型
		 * @return 消息类型的描述
		 */
		public static function msgMapping(msgType : int) : String {
			if (_msgDescribe) return _msgDescribe[msgType];
			_msgDescribe = new Dictionary();
			_msgDescribe[MessageType.CS_LOGIN] = "收到登录游戏请求--CS_LOGIN=" + MessageType.CS_LOGIN;
			_msgDescribe[MessageType.SC_LOGIN_RESULT] = "发送登录游戏结果--SC_LOGIN_RESULT=" + MessageType.SC_LOGIN_RESULT;
			_msgDescribe[MessageType.SC_PLAYER_INFO] = "发送玩家的基本属性--SC_PLAYER_INFO=" + MessageType.SC_PLAYER_INFO;
			_msgDescribe[MessageType.SC_ENTER_ROOM] = "发送进入房间的消息--SC_ENTER_ROOM=" + MessageType.SC_ENTER_ROOM;
			_msgDescribe[MessageType.SC_ROOM_MEMBER_JOIN] = "发送有成员进入房间的消息--SC_ROOM_MEMBER_JOIN=" + MessageType.SC_ROOM_MEMBER_JOIN;
			_msgDescribe[MessageType.SC_ROOM_MEMBER_EXIT] = "发送成员有退出房间的消息--SC_ROOM_MEMBER_EXIT=" + MessageType.SC_ROOM_MEMBER_EXIT;
			_msgDescribe[MessageType.CS_ENTER_BATTLE] = "收到进入战斗的请求--CS_ENTER_BATTLE=" + MessageType.CS_ENTER_BATTLE;
			_msgDescribe[MessageType.SC_ADVANCE_HOUSE_OWNER] = "发送提升房主的消息--SC_ADVANCE_HOUSE_OWNER=" + MessageType.SC_ADVANCE_HOUSE_OWNER;
			return _msgDescribe[msgType];
		}
	}
}