package me.xplabs.net.model
{
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	import me.xplabs.interfaces.net.IConnector;
	import me.xplabs.interfaces.net.IMessageRecognizer;
	import me.xplabs.interfaces.servers.IBaseMessage;
	import me.xplabs.net.events.NetEvent;
	import me.xplabs.net.events.NetNotificationEvent;
	import me.xplabs.servers.lander.CSLogin;
	import me.xplabs.servers.lander.SCLoginResult;
	import me.xplabs.servers.MessageType;
	import me.xplabs.servers.player.SCPlayerInfo;
	import me.xplabs.servers.room.SCAdvanceHouseOwner;
	import me.xplabs.servers.room.SCEnterRoom;
	import me.xplabs.servers.room.SCRoomMemberExit;
	import me.xplabs.servers.room.SCRoomMemberJoin;
	import me.xplabs.utils.msgFormat;
	import me.xplabs.utils.printMsg;
	import me.xplabs.utils.sendMsg;
	import org.robotlegs.mvcs.Actor;
	import starling.events.IEventDispatcher;
	
	/**
	 * 消息识别
	 * ...
	 * @author xiaohan
	 */
	public class MessageRecognizer extends Actor implements IMessageRecognizer
	{
		/**
		 * 网络连接器
		 */
		[Inject]
		public var connector:IConnector;
		/**
		 * 消息库
		 */
		private var _msgs:Dictionary;
		/**
		 * 消息识别
		 */
		public function MessageRecognizer()
		{
		
		}
		
		/* INTERFACE me.xplabs.interfaces.net.IMessageRecognizer */
		/**
		 * 消息侦听
		 */
		public function listener():void
		{
			initMsgInstance();
			
			eventMap.mapListener(IEventDispatcher(connector), NetEvent.NET_CONNECTED, connectedHandler);
			eventMap.mapListener(IEventDispatcher(connector), NetEvent.NET_RECEIVE, receiveHandler);
			//connector.connect("127.0.0.1", 80);
			connector.connect("10.188.60.32", 80);
		
		}
		/**
		 * 消息连接成功触发
		 * @param	e
		 */
		private function connectedHandler(e:NetEvent):void 
		{
			trace("网络连接成功了");
		}

		/**
		 * 初始化消息库
		 */
		private function initMsgInstance():void
		{
			_msgs = new Dictionary();
			_msgs[MessageType.SC_LOGIN_RESULT] = new SCLoginResult();
			_msgs[MessageType.SC_ENTER_ROOM] = new SCEnterRoom();
			_msgs[MessageType.SC_ROOM_MEMBER_JOIN] = new SCRoomMemberJoin();
			_msgs[MessageType.SC_ROOM_MEMBER_EXIT] = new SCRoomMemberExit();
			_msgs[MessageType.SC_PLAYER_INFO] = new SCPlayerInfo();
			_msgs[MessageType.SC_ADVANCE_HOUSE_OWNER] = new SCAdvanceHouseOwner();
			
		}
		/**
		 * 接受消息后触发，并广播消息通知
		 * @param	e
		 */
		private function receiveHandler(e:NetEvent):void
		{
			e.byteArray.position = 2;
			var type:int = e.byteArray.readShort();
			var baseMessage:IBaseMessage = _msgs[type];
			var byteArray:ByteArray = new ByteArray();
			e.byteArray.readBytes(byteArray);
			baseMessage.bytes= byteArray;
			baseMessage.read();
			printMsg(baseMessage.type);
			dispatch(new NetNotificationEvent(msgFormat(baseMessage.type), baseMessage));
			byteArray.clear();
			byteArray = null;
			e.byteArray.clear();
			e.byteArray = null;
		}
	}
}