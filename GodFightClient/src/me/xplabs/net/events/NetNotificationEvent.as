package me.xplabs.net.events 
{
	import me.xplabs.interfaces.servers.IBaseMessage;
	import starling.events.Event;
	
	/**
	 * 收到消息并解析后广播消息
	 * ...
	 * @author xiaohan
	 */
	public class NetNotificationEvent extends Event 
	{
		public var baseMessage:IBaseMessage;
		public function NetNotificationEvent(type:String, baseMessage:IBaseMessage, bubbles:Boolean = false, data:Object = null)
		{
			this.baseMessage = baseMessage;
			super(type, bubbles, data);
			
		}
		
	}

}