package me.xplabs.interfaces.servers {
	/**
	 * 将数据写入消息数据
	 * ...
	 * @author xiaohan
	 */
	public interface IWriteMessage {
		/**
		 * 将一个字节写入套接字。
		 * @param	value
		 */
		function writeByte(value : int) : void;

		/**
		 * 将一个 16 位整数写入套接字。
		 * @param	value
		 */
		function writeShort(value : int) : void;

		/**
		 * 将一个带符号的 32 位整数写入套接字。
		 * @param	value
		 */
		function writeInt(value : int) : void;

		/**
		 * 将一个 IEEE 754 单精度浮点数写入套接字。
		 * @param	value
		 */
		function writeFloat(value : Number) : void;

		/**
		 * 将一个 IEEE 754 双精度浮点数写入套接字。
		 * @param	value
		 */
		function writeDouble(value : Number) : void;

		/**
		 * 将以下数据写入套接字：一个无符号 16 位整数，它指示了指定 UTF-8 字符串的长度（以字节为单位），后面跟随字符串本身。
		 * @param	value
		 */
		function writeString(value : String) : void;

		/**
		 * 将一个布尔值写入套接字。
		 * @param	value
		 */
		function writeBoolean(value : Boolean) : void;
	}
}