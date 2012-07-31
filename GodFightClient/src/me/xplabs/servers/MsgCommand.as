package me.xplabs.servers 
{
	import me.xplabs.interfaces.net.IMessageRecognizerServers;
	import me.xplabs.interfaces.servers.IBaseMessage;
	import org.robotlegs.mvcs.Command;
	
	/**
	 * 处理消息的Command，收到消息后执行的Command必须执行MsgCommand
	 * ...
	 * @author xiaohan
	 */
	public class MsgCommand extends Command 
	{
		/**
		 * 收到消息后，获取当前收到的消息的类引用
		 */
		[Inject]
		public var messageRecognizerServers:IMessageRecognizerServers;
		/**
		 * 收到的具体消息
		 */
		protected var baseMessage:IBaseMessage;
		/**
		 * 处理消息的Command，收到消息后执行的Command必须执行MsgCommand
		 */
		public function MsgCommand() 
		{
			super();
			
		}
		override public function execute():void 
		{
			baseMessage = messageRecognizerServers.baseMessage;
		}
		
	}

}