package me.xplabs.net.events {
	import flash.events.Event;
	import flash.utils.ByteArray;

	/**
	 * ...
	 * @author xiaohan
	 */
	public class NetEvent extends Event {
		public static const NET_RECEIVE : String = "netReceive";
		public var byteArray : ByteArray;

		public function NetEvent(type : String, byteArray : ByteArray, bubbles : Boolean = false, cancelable : Boolean = false) {
			this.byteArray = byteArray;
			super(type, bubbles, cancelable);
		}
	}
}