package me.xplabs.interfaces.net {
	import me.xplabs.interfaces.servers.IMessageInfo;

	/**
	 * ...
	 * @author xiaohan
	 */
	public interface IServerSocket {
		/**
		 * 将此套接字绑定到指定的本地地址和端口
		 * @param	localPort 绑定到本地计算机的端口数量
		 * @param	localAddress 要绑定到的本地计算机上的 IP 地址
		 */
		function bind(localPort : int = 0, localAddress : String = "0.0.0.0") : void;

		/**
		 * 向客户端发送消息
		 * @param	clinetId 客户端ID
		 * @param	message 消息
		 */
		function send(clinetId : String, message : IMessageInfo) : void;

		/**
		 * 套接字所侦听的 IP 地址。
		 */
		function get localAddress() : String;

		/**
		 * 套接字所侦听的端口。
		 */
		function get localPort() : int;
		/**
		 * 刷新客户端socket连接服务器的状态
		 */
		function updateSockeConnected():void
	}
}