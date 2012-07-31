package me.xplabs.net.events {
	import flash.events.Event;

	/**
	 * 服务器启动器事件
	 * ...
	 * @author xiaohan
	 */
	public class ServerEvent extends Event {
		public static const BIND_CLICK : String = "bindClick";
		public static const SEND_CLICK : String = "sendClick";

		public function ServerEvent(type : String, bubbles : Boolean = false, cancelable : Boolean = false) {
			super(type, bubbles, cancelable);
		}
	}
}