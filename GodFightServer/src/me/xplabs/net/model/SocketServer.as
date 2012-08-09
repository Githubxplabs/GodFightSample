package me.xplabs.net.model {
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.ProgressEvent;
	import flash.events.ServerSocketConnectEvent;
	import flash.net.ServerSocket;
	import flash.net.Socket;
	import flash.utils.ByteArray;

	import me.xplabs.interfaces.servers.IMessageInfo;
	import me.xplabs.interfaces.net.IServerSocket;
	import me.xplabs.net.events.NetEvent;

	import org.robotlegs.mvcs.Actor;

	/**
	 * Dispatched when a remote socket seeks to connect to this server socket.
	 * @eventType	flash.events.ServerSocketConnectEvent.CONNECT
	 */
	[Event(name="connect", type="flash.events.ServerSocketConnectEvent")]
	/**
	 * Dispatched when the operating system closes this socket.
	 * @eventType	flash.events.Event.CLOSE
	 */
	[Event(name="close", type="flash.events.Event")]
	/**
	 * ...
	 * @author xiaohan
	 */
	public class SocketServer extends EventDispatcher implements IServerSocket {
		private var _sockets : Object;
		private var _serverSocket : ServerSocket;
		private var _bytesNode : ByteArray;
		private var _recvBytes : ByteArray;
		
		private var _clientCount:int;
		public function SocketServer() {
			super();
			
			_clientCount = 0;
			_sockets = { };
			_serverSocket = new ServerSocket();

			_recvBytes = new ByteArray();
			_bytesNode = new ByteArray();
		}

		/**
		 * 将此套接字绑定到指定的本地地址和端口
		 * @param	localPort 绑定到本地计算机的端口数量
		 * @param	localAddress 要绑定到的本地计算机上的 IP 地址
		 */
		public function bind(localPort : int = 0, localAddress : String = "0.0.0.0") : void {
			if (_serverSocket.bound) {
				_serverSocket.close();
				_serverSocket = new ServerSocket();
			}
			_serverSocket.bind(localPort, localAddress);
			_serverSocket.addEventListener(ServerSocketConnectEvent.CONNECT, connectHandler);
			_serverSocket.addEventListener(Event.CLOSE, closeHandler);
			_serverSocket.listen();
		}

		private function closeHandler(e : Event) : void {
			trace("有socket连接关闭了");
		}

		private function connectHandler(e : ServerSocketConnectEvent) : void {
			var socket : Socket = e.socket;
			socket.addEventListener(ProgressEvent.SOCKET_DATA, receiveHandler);
			dispatchEvent(e);
			_sockets["client" + _clientCount++] = socket;
		}

		private function receiveHandler(e : ProgressEvent) : void {
			
			var socket : Socket = Socket(e.currentTarget);
			try 
			{
			var cliendId:String = getClientIdBySocket(socket);
				socket.readBytes(_recvBytes, _recvBytes.length);
				if (_recvBytes.bytesAvailable < 2) return;
				var position : int = _recvBytes.readUnsignedInt();
				_recvBytes.position -= 2;
				while ( position <= _recvBytes.bytesAvailable) {
					_bytesNode.clear();
					_recvBytes.readBytes(_bytesNode, 0, position);
					dispatchEvent(new NetEvent(NetEvent.NET_RECEIVE, _bytesNode, cliendId));
					if (_recvBytes.bytesAvailable > 2) {
						position = _recvBytes.readUnsignedInt();
						_recvBytes.position -= 2;
					} else {
						if (_recvBytes.bytesAvailable == 0) _recvBytes.clear();
						return;
					}
				}
			}catch (e:Error)
			{
				socket.close();
				trace("关闭无效连接");
			}
		}

		/**
		 * 向客户端发送消息
		 * @param	clinetId 客户端ID
		 * @param	message 消息
		 */
		public function send(clinetId : String, message : IMessageInfo) : void {
			var socket : Socket = getSocketByClientId(clinetId);
			if (!socket) return;
			message.bytes.position = 0;
			socket.writeUnsignedInt(message.bytes.length + 4);
			socket.writeShort(message.type);
			socket.writeBytes(message.bytes);
			socket.flush();
		}
		
		public function updateSockeConnected():void 
		{
			for(var name:String in _sockets) 
			{
				if (!Socket(_sockets[name]).connected)
				{
					trace("删除无效连接");
					dispatchEvent(new NetEvent(NetEvent.NET_CLIENT_CLOSE, null, name));
					delete _sockets[name];
				}
			}
		}

		public function get localAddress() : String {
			return _serverSocket.localAddress;
		}

		public function get localPort() : int {
			return _serverSocket.localPort;
		}

		/**
		 * 获取客户端Socket对象
		 * @param	clientId 客户端Id
		 * @return
		 */
		private function getSocketByClientId(clientId : String) : Socket {
			if ("" == clientId) return _sockets["0"] as Socket;
			return _sockets[clientId] as Socket;
		}
		/**
		 * 根据Socket获取存储的客户端Id
		 * @param	socket
		 * @return
		 */
		private function getClientIdBySocket(socket:Socket):String
		{
			for (var name:String in _sockets) 
			{
				if (_sockets[name] == socket) return name;
			}
			return "";
		}
	}
}