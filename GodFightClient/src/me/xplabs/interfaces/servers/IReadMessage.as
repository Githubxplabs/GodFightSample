package me.xplabs.interfaces.servers 
{
	
	/**
	 * 读取接收的消息数据
	 * ...
	 * @author xiaohan
	 */
	public interface IReadMessage 
	{
		/**
		 * 从套接字读取一个带符号字节。
		 * @return
		 */
		function readByte() : int;
		/**
		 * 从套接字读取一个带符号的 16 位整数。
		 * @return
		 */
		function readShort() : int;
		/**
		 * 从套接字读取一个带符号的 32 位整数。
		 * @return
		 */
		function readInt() : int;
		/**
		 * 从套接字读取一个 IEEE 754 单精度浮点数。
		 * @return
		 */
		function readFloat() : Number;
		/**
		 * 从套接字读取一个 IEEE 754 双精度浮点数。
		 * @return
		 */
		function readDouble() : Number;
		/**
		 * 从套接字读取一个 UTF-8 字符串。
		 * @return
		 */
		function readString() : String;
		/**
		 * 从套接字读取一个布尔值。
		 * @return
		 */
		function readBoolean() : Boolean;
	}
	
}