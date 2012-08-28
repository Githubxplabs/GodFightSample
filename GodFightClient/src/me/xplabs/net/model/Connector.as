package me.xplabs.net.model 
{
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	import flash.events.TimerEvent;
	import flash.net.Socket;
	import flash.utils.ByteArray;
	import flash.utils.Timer;
	import me.xplabs.constant.ConnectState;
	import me.xplabs.interfaces.net.IConnector;
	import me.xplabs.interfaces.servers.IMessageInfo;
	import me.xplabs.net.events.NetEvent;
	import me.xplabs.servers.BaseMessage;
	import me.xplabs.servers.lander.CSLogin;
	import starling.events.EventDispatcher;
	
	
	
	/** 当网络连接成功时调度*/
	[Event(name="netConnected", type="me.xplabs.net.events.NetEvent")]
	/** 当网络连接失败时调度*/
	[Event(name="netFail", type="me.xplabs.net.events.NetEvent")]
	/** 当网络连接断开时调度*/
	[Event(name="netBreak", type="me.xplabs.net.events.NetEvent")]
	/** 当网络连接接收数据时调度*/
	[Event(name="netReceive", type="me.xplabs.net.events.NetEvent")]
	
	
	/**
	 * ...
	 * @author xiaohan
	 */
	public class Connector extends EventDispatcher implements IConnector
	{
		/**
		 * Socket 对象
		 */
		private var _socket:Socket;
		/**
		 * 网络连接的状态
		 */
		private var _connectState:int;
		/**
		 * 要连接到的主机的名称或 IP 地址
		 */
		private var _host:String;
		/**
		 * 要连接到的端口号
		 */
		private var _port:int;
		/**
		 * 网络连接的计时器
		 */
		private var _timeoutTimer:Timer;
		/**
		 * 发送到服务器的数据
		 */
		private var _sendBytes:ByteArray;
		/**
		 * 来自服务器的数据
		 */
		private var _recvBytes:ByteArray;
		/**
		 * 完整的一个数据包
		 */
		private var _bytesNode:ByteArray;
		/**
		 * Connector 网络连接器，负责握手以及消息收发
		 */
		public function Connector() 
		{
			super();
			_sendBytes = new ByteArray();
			_recvBytes = new ByteArray();
			_bytesNode = new ByteArray();
			
		}
		/**
		 * 网络是否连接
		 */
		public function get connected():Boolean 
		{
			return _connectState==ConnectState.CONNECT_SUCCES;
		}
		/**
		 * 请求网络连接
		 * @param	host 要连接到的主机的名称或 IP 地址
		 * @param	port 要连接到的端口号
		 * @param	delayTime 指示建立连接时需等待的毫秒数。
		 */
		public function connect(host:String, port:int, timeout:uint = 30000):void
		{
			
			if (_connectState == ConnectState.CONNECTING) return;
			_connectState = ConnectState.CONNECTING;
			
			_host = host;
			_port = port;
			
			startTime(timeout);
			if (_socket == null) creatSocket(timeout);
			
			try {
				_socket.connect(_host, _port);
			}catch (err:Error)
			{
				trace(err);
				removeSocket();
			}
		}
		
		/**
		 * 向服务器发送消息
		 * @param	message 消息
		 */
		public function send(message:IMessageInfo):void 
		{
			if (!_socket) 
			{
				trace("socket没有连通！！");
				return;
			}
			if (!_socket.connected) {
				closeHandler(null);
				return;
			}
			message.bytes.position = 0;
			_socket.writeUnsignedInt(message.bytes.length + 4);
			_socket.writeShort(message.type);
			_socket.writeBytes(message.bytes);
			
			var bytesss:ByteArray = new ByteArray();
			bytesss.writeUnsignedInt(message.bytes.length + 4);
			bytesss.writeShort(message.type);
			bytesss.writeBytes(message.bytes);
			trace(bytesss.length);
			
			_socket.flush();
		}
		
		
		/**
		 * 开启连接主机的计时器
		 * @param	delayTime
		 */
		private function startTime(timeout:uint = 30000):void
		{
			if (_timeoutTimer==null)
			{
				_timeoutTimer = new Timer(timeout);
				_timeoutTimer.addEventListener(TimerEvent.TIMER,connectedFalilHandler);
			}
			else
			{
				_timeoutTimer.reset();
				_timeoutTimer.delay = timeout;
			}
			_timeoutTimer.start();
		}
		/**
		 * 停止连接主机的计时器
		 */
		private function stopTime():void
		{
			if (_timeoutTimer == null) return;
			_timeoutTimer.stop();
			_timeoutTimer.removeEventListener(TimerEvent.TIMER, connectedFalilHandler);
			_timeoutTimer = null;
		}
		/**
		 * 计时结束连接失败
		 * @param	e
		 */
		private function connectedFalilHandler(e:TimerEvent):void 
		{
			_connectState = ConnectState.NONE_CONNECT;
			removeSocket();
			stopTime();
		}
		
		
		/**
		 * 创建Socket对象
		 * @param	delayTime Socket建立连接时需等待的毫秒数
		 */
		private function creatSocket(timeout:uint):void
		{
			_connectState = ConnectState.NONE_CONNECT;
			_socket = new Socket();
			_socket.timeout = timeout*2;
			_socket.addEventListener(Event.CONNECT, connectedHanlder);
			
			_socket.addEventListener(IOErrorEvent.IO_ERROR, iOErrorHandler);
			_socket.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
		}
		/**
		 * 断开网络连接
		 * @param	e
		 */
		private function closeHandler(e:Event):void 
		{
			_connectState = ConnectState.NONE_CONNECT;
			_sendBytes.clear();
			_recvBytes.clear();
			
			stopTime();		
			removeSocket();
			dispatchEvent(new NetEvent(NetEvent.NET_BREAK));
		}
		
		private function securityErrorHandler(e:SecurityErrorEvent):void 
		{
			try {
				removeSocket();
			}catch (err:Error)
			{
				trace(err);
			}
		}
		
		private function iOErrorHandler(e:IOErrorEvent):void 
		{
			try {
				removeSocket();
			}catch (err:Error)
			{
				trace(err);
			}
		}
		
		/**
		 * 在套接字接收到数据后调度
		 * @param	e
		 */
		private function socketDataHanlder(e:ProgressEvent):void 
		{
			_recvBytes.clear();
			_socket.readBytes(_recvBytes, _recvBytes.length);
			if (_recvBytes.bytesAvailable < 2) return;
			//_pos = _recvBytes.readShort();
			var position:int = _recvBytes.readUnsignedInt();
			_recvBytes.position -= 2;
			while ( position<= _recvBytes.bytesAvailable)
			{
				_bytesNode.clear();
				_recvBytes.readBytes(_bytesNode, 0, position);
				dispatchEvent(new NetEvent(NetEvent.NET_RECEIVE, _bytesNode, false ));
				if (_recvBytes.bytesAvailable > 2)
				{
					position = _recvBytes.readUnsignedInt();
					_recvBytes.position -= 2;
				}
				else 
				{
					if (_recvBytes.bytesAvailable == 0) _recvBytes.clear();
					return;
				}
			}
		}
		/**
		 * 连接服务器成功
		 * @param	e
		 */
		private function connectedHanlder(e:Event):void 
		{
			stopTime();
			_connectState = ConnectState.CONNECT_SUCCES;
			_socket.addEventListener(ProgressEvent.SOCKET_DATA, socketDataHanlder);
			_socket.addEventListener(Event.CLOSE, closeHandler);
			
			dispatchEvent(new NetEvent(NetEvent.NET_CONNECTED));
		}
		/**
		 * 移除连接器
		 */
		private function removeSocket():void 
		{
			if (_socket == null) return;
			_socket.removeEventListener(Event.CONNECT,connectedHanlder);
			_socket.removeEventListener(Event.CLOSE, closeHandler);
			_socket.removeEventListener(ProgressEvent.SOCKET_DATA, socketDataHanlder);
			_socket.removeEventListener(IOErrorEvent.IO_ERROR,iOErrorHandler);
        	_socket.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
			if(_socket.connected) _socket.close();
			_socket = null;
		}
		
	}

}