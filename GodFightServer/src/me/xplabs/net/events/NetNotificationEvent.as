package me.xplabs.net.events {
	import flash.events.Event;

	/**
	 * 收到消息并解析后广播消息
	 * ...
	 * @author xiaohan
	 */
	public class NetNotificationEvent extends Event {
		// public static const NOTIFICATION:String = "notification";
		public function NetNotificationEvent(type : String, bubbles : Boolean = false, cancelable : Boolean = false) {
			super(type, bubbles, cancelable);
		}
	}
}