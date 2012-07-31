package me.xplabs.interfaces.servers 
{
	import flash.utils.ByteArray;
	
	/**
	 * 发送的消息信息
	 * ...
	 * @author xiaohan
	 */
	public interface IMessageInfo 
	{
		/**
		 * 消息的类型
		 */
		function get type() : int;
		/**
		 * 消息的数据
		 */
		function get bytes():ByteArray;
		function set bytes(value:ByteArray):void;
	}
	
}