package me.xplabs.net.model
{
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	import me.xplabs.interfaces.net.IConnector;
	import me.xplabs.interfaces.net.IMessageRecognizer;
	import me.xplabs.interfaces.net.IMessageRecognizerServers;
	import me.xplabs.interfaces.servers.IBaseMessage;
	import me.xplabs.net.events.NetEvent;
	import me.xplabs.net.events.NetNotificationEvent;
	import me.xplabs.servers.lander.CSLogin;
	import me.xplabs.servers.lander.SCLoginResult;
	import me.xplabs.servers.MessageType;
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
	public class MessageRecognizer extends Actor implements IMessageRecognizer,IMessageRecognizerServers
	{
		/**
		 * 网络连接器
		 */
		[Inject]
		public var connector:IConnector;
		/**
		 * 收到的当前消息
		 */
		private var _baseMessage:IBaseMessage;
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
			connector.connect("127.0.0.1", 80);
		
		}
		/**
		 * 消息连接成功触发
		 * @param	e
		 */
		private function connectedHandler(e:NetEvent):void 
		{
			trace("网络连接成功了");
			
						
			var cs:CSLogin = new CSLogin();
			cs.userName = "韩贤明";
			cs.passWord = "123456789";
			cs.host = "127.0.0.1";
			cs.port = 80;
			sendMsg(cs);
		}
		/* INTERFACE me.xplabs.interfaces.net.IMessageRecognizerServers */
		/**
		 * 获取当前收到的消息
		 */
		public function get baseMessage():IBaseMessage 
		{
			return _baseMessage;
		}
		/**
		 * 初始化消息库
		 */
		private function initMsgInstance():void
		{
			_msgs = new Dictionary();
			_msgs[MessageType.SC_LOGIN_RESULT] = new SCLoginResult();
			
		}
		/**
		 * 接受消息后触发，并广播消息通知
		 * @param	e
		 */
		private function receiveHandler(e:NetEvent):void
		{
			e.byteArray.position = 2;
			var type:int = e.byteArray.readShort();
			_baseMessage = _msgs[type];
			var byteArray:ByteArray = new ByteArray();
			e.byteArray.readBytes(byteArray);
			_baseMessage.bytes= byteArray;
			_baseMessage.read();
			printMsg(_baseMessage.type);
			dispatch(new NetNotificationEvent(msgFormat(_baseMessage.type)));
			byteArray.clear();
			byteArray = null;
			e.byteArray.clear();
			e.byteArray = null;
		}
	}
}