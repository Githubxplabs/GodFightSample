package me.xplabs.interfaces.net 
{
	import me.xplabs.interfaces.servers.IMessageInfo;
	
	/**
	 * 网络连接器接口
	 * ...
	 * @author xiaohan
	 */
	public interface IConnector 
	{
		/**
		 * 网络是否连接
		 */
		function get connected():Boolean;
		/**
		 * 请求网络连接
		 * @param	host 要连接到的主机的名称或 IP 地址
		 * @param	port 要连接到的端口号
		 * @param	delayTime 指示建立连接时需等待的毫秒数。
		 */
		function connect(host:String, port:int, delayTime:uint = 30000):void
		/**
		 * 向服务器发送消息
		 * @param	message 消息
		 */
		function send(message:IMessageInfo):void;
	}
	
}