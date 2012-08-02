package me.xplabs.net.events
{
	import flash.events.Event;
	import flash.utils.ByteArray;
	
	/**
	 * ...
	 * @author xiaohan
	 */
	public class NetEvent extends Event
	{
		public static const NET_RECEIVE:String = "netReceive";
		public static const NET_CLIENT_CLOSE:String = "netClientClose";
		public var byteArray:ByteArray;
		public var clientId:String;
		
		public function NetEvent(type:String, byteArray:ByteArray = null, clientId:String = "", bubbles:Boolean = false, cancelable:Boolean = false)
		{
			this.byteArray = byteArray;
			this.clientId = clientId;
			super(type, bubbles, cancelable);
		}
	}
}