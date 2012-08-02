package me.xplabs.net.controller 
{
	import me.xplabs.interfaces.net.IConnector;
	import me.xplabs.interfaces.net.IMessageRecognizer;
	import me.xplabs.login.controller.SCLoginResultCommand;
	import me.xplabs.net.events.NetNotificationEvent;
	import me.xplabs.servers.lander.SCLoginResult;
	import me.xplabs.servers.MessageType;
	import me.xplabs.utils.msgFormat;
	import org.robotlegs.mvcs.Command;
	
	/**
	 * 
	 * ...
	 * @author xiaohan
	 */
	public class NetManagerCommand extends Command 
	{
		[Inject]
		public var messageRecognizer:IMessageRecognizer;
		public function NetManagerCommand() 
		{
			super();
			
		}
		override public function execute():void 
		{
			
			commandMap.mapEvent(msgFormat(MessageType.SC_LOGIN_RESULT), SCLoginResultCommand, NetNotificationEvent);
			
			messageRecognizer.listener();
		}
	}

}