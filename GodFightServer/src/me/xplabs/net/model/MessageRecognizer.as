package me.xplabs.net.model
{
	import flash.events.IEventDispatcher;
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	import me.xplabs.interfaces.common.IGameManager;
	import me.xplabs.servers.room.CSEnterBattle;
	
	import me.xplabs.interfaces.net.IMessageRecognizer;
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
	public class MessageRecognizer extends Actor implements IMessageRecognizer
	{
		[Inject]
		public var socketServer:IServerSocket;
		[Inject]
		public var gameManager:IGameManager;
		
		private var _msgs:Dictionary;
		
		public function MessageRecognizer()
		{
		}
		
		/* INTERFACE me.xplabs.interfaces.net.IMessageRecognizer */
		public function listener():void
		{
			initMsgInstance();
			eventMap.mapListener(IEventDispatcher(socketServer), NetEvent.NET_RECEIVE, receiveHandler);
			gameManager.addUpdate(socketServer.updateSockeConnected);
		}
		private function initMsgInstance():void
		{
			_msgs = new Dictionary();
			_msgs[MessageType.CS_LOGIN] = new CSLogin();
			_msgs[MessageType.CS_ENTER_BATTLE] = new CSEnterBattle();
		}
		
		private function receiveHandler(e:NetEvent):void
		{
			e.byteArray.position = 2;
			var type:int = e.byteArray.readShort();
			var baseMessage:IBaseMessage = _msgs[type];
			baseMessage.clientId = e.clientId;
			var byteArray:ByteArray = new ByteArray();
			e.byteArray.readBytes(byteArray);
			baseMessage.bytes = byteArray;
			baseMessage.read();
			// _baseMessage.execute(eventDispatcher);
			printMsg(baseMessage.type);
			dispatch(new NetNotificationEvent(msgFormat(baseMessage.type), baseMessage));
			byteArray.clear();
			byteArray = null;
			e.byteArray.clear();
			e.byteArray = null;
		}
	}
}