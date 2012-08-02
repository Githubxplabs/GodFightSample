package me.xplabs.servers 
{
	import me.xplabs.interfaces.servers.IBaseMessage;
	import me.xplabs.net.events.NetNotificationEvent;
	import org.robotlegs.mvcs.Command;
	
	/**
	 * 处理消息的Command，收到消息后执行的Command必须执行MsgCommand
	 * ...
	 * @author xiaohan
	 */
	public class MsgCommand extends Command 
	{
		/**
		 * 收到的具体消息
		 */
		protected var baseMessage:IBaseMessage;
		/**
		 * 消息通信事件
		 */
		[Inject]
		public var event:NetNotificationEvent;
		/**
		 * 处理消息的Command，收到消息后执行的Command必须执行MsgCommand
		 */
		public function MsgCommand() 
		{
			super();
			
		}
		override public function execute():void 
		{
			baseMessage = event.baseMessage;
		}
		
	}

}