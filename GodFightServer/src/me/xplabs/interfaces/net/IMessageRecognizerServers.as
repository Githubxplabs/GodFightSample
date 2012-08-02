package me.xplabs.interfaces.net {
	import me.xplabs.interfaces.servers.IBaseMessage;

	/**
	 * 获取当前收到的消息
	 * ...
	 * @author xiaohan
	 */
	public interface IMessageRecognizerServers {
		function get baseMessage() : IBaseMessage
	}
}