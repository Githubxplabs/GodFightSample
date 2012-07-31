package me.xplabs.net.events 
{
	import flash.utils.ByteArray;
	import starling.events.Event;
	
	/**
	 * ...
	 * @author xiaohan
	 */
	public class NetEvent extends Event 
	{
		/**
		 * 网络连接器初始化
		 */
		public static const NET_INITIALIZE:String = "netInitialize";
		/**
		 * 网络连接成功
		 */
		public static const NET_CONNECTED:String = "netConnected";
		/**
		 * 网络连接失败
		 */
		public static const NET_FAIL:String = "netFail";
		/**
		 * 网络连接断开
		 */
		public static const NET_BREAK:String = "netBreak";
		/**
		 * 接收网络消息
		 */
		public static const NET_RECEIVE:String = "netReceive";
		public var byteArray:ByteArray;
		public function NetEvent(type:String, byteArray:ByteArray = null, bubbles:Boolean = false) 
		{
			this.byteArray = byteArray;
			super(type, bubbles, null);
		}
		
	}

}