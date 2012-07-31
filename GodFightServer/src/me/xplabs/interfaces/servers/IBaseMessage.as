package me.xplabs.interfaces.servers {
	import flash.events.IEventDispatcher;

	/**
	 * 消息基类接口
	 * ...
	 * @author xiaohan
	 */
	public interface IBaseMessage extends IMessageInfo {
		/**
		 * 读取消息
		 */
		function read() : void;

		/**
		 * 写入消息
		 */
		function write() : void;
	}
}