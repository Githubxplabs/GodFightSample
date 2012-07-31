package me.xplabs.servers {
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	import flash.utils.ByteArray;

	import me.xplabs.interfaces.servers.IBaseMessage;

	import org.robotlegs.mvcs.Actor;

	/**
	 * ...
	 * @author xiaohan
	 */
	public class BaseMessage implements IBaseMessage {
		private var _bytes : ByteArray;

		public function BaseMessage() {
			// _bytes = new ByteArray();
		}

		/* INTERFACE me.xplabs.interfaces.net.ISendMessage */
		public function get type() : int {
			return 0;
		}

		public function get bytes() : ByteArray {
			return _bytes;
		}

		public function set bytes(value : ByteArray) : void {
			_bytes = value;
		}

		/* INTERFACE me.xplabs.interfaces.net.IBaseMessage */
		public function read() : void {
		}

		public function write() : void {
		}

		/* INTERFACE me.xplabs.interfaces.net.IReadMessage */
		protected function readByte() : int {
			return _bytes.readByte();
		}

		protected function readShort() : int {
			return _bytes.readShort();
		}

		protected function readInt() : int {
			return _bytes.readInt();
		}

		protected function readFloat() : Number {
			return _bytes.readFloat();
		}

		protected function readDouble() : Number {
			return _bytes.readDouble();
		}

		protected function readString() : String {
			return _bytes.readUTF();
		}

		protected function readBoolean() : Boolean {
			return _bytes.readByte() == 1;
		}

		/* INTERFACE me.xplabs.interfaces.net.IWriteMessage */
		protected function writeByte(value : int) : void {
			_bytes.writeByte(value);
		}

		protected function writeShort(value : int) : void {
			_bytes.writeShort(value);
		}

		protected function writeInt(value : int) : void {
			_bytes.writeInt(value);
		}

		protected function writeFloat(value : Number) : void {
			_bytes.writeFloat(value);
		}

		protected function writeDouble(value : Number) : void {
			_bytes.writeDouble(value);
		}

		protected function writeString(value : String) : void {
			_bytes.writeUTF(value);
		}

		protected function writeBoolean(value : Boolean) : void {
			_bytes.writeByte(value ? 1 : 0);
		}
	}
}