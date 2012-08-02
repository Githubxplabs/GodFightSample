package me.xplabs.net.events
{
	import flash.events.Event;
	import me.xplabs.interfaces.servers.IBaseMessage;
	
	/**
	 * 收到消息并解析后广播消息
	 * ...
	 * @author xiaohan
	 */
	public class NetNotificationEvent extends Event
	{
		public var baseMessage:IBaseMessage;
		public function NetNotificationEvent(type:String, baseMessage:IBaseMessage, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			this.baseMessage = baseMessage;
			super(type, bubbles, cancelable);
		}
	}
}