package me.xplabs.net.model {
	import flash.events.IEventDispatcher;
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;

	import me.xplabs.interfaces.net.IMessageRecognizer;
	import me.xplabs.interfaces.net.IMessageRecognizerServers;
	import me.xplabs.interfaces.net.IServerSocket;
	import me.xplabs.interfaces.servers.IBaseMessage;
	import me.xplabs.net.events.NetEvent;
	import me.xplabs.net.events.NetNotificationEvent;
	import me.xplabs.servers.lander.CSLogin;
	import me.xplabs.servers.MessageType;
	import me.xplabs.utils.msgFormat;
	import me.xplabs.utils.printMsg;

	import org.robotlegs.mvcs.Actor;

	/**
	 * ...
	 * @author xiaohan
	 */
	public class MessageRecognizer extends Actor implements IMessageRecognizer,IMessageRecognizerServers {
		[Inject]
		public var socketServer : IServerSocket;
		private var _baseMessage : IBaseMessage;
		private var _msgs : Dictionary;

		public function MessageRecognizer() {
		}

		/* INTERFACE me.xplabs.interfaces.net.IMessageRecognizer */
		public function listener() : void {
			initMsgInstance();
			eventMap.mapListener(IEventDispatcher(socketServer), NetEvent.NET_RECEIVE, receiveHandler);
		}

		/* INTERFACE me.xplabs.interfaces.net.IMessageRecognizerServers */
		public function get baseMessage() : IBaseMessage {
			return _baseMessage;
		}

		private function initMsgInstance() : void {
			_msgs = new Dictionary();
			_msgs[MessageType.CS_LOGIN] = new CSLogin();
		}

		private function receiveHandler(e : NetEvent) : void {
			e.byteArray.position = 2;
			var type : int = e.byteArray.readShort();
			_baseMessage = _msgs[type];
			var byteArray : ByteArray = new ByteArray();
			e.byteArray.readBytes(byteArray);
			_baseMessage.bytes = byteArray;
			_baseMessage.read();
			// _baseMessage.execute(eventDispatcher);
			printMsg(_baseMessage.type);
			dispatch(new NetNotificationEvent(msgFormat(_baseMessage.type)));
			byteArray.clear();
			byteArray = null;
			e.byteArray.clear();
			e.byteArray = null;
		}
	}
}