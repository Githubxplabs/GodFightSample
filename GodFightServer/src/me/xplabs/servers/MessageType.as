package me.xplabs.servers {
	import flash.events.Event;

	/**
	 * ...
	 * @author xiaohan
	 */
	public class MessageType extends Event {
		public static const CS_LOGIN : int = 1;
		public static const SC_LOGIN_RESULT : int = 2;

		public function MessageType(type : String, bubbles : Boolean = false, cancelable : Boolean = false) {
			super(type, bubbles, cancelable);
		}
	}
}