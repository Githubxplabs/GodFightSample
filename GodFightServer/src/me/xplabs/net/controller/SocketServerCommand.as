package me.xplabs.net.controller {
	import me.xplabs.interfaces.net.IMessageRecognizer;
	import me.xplabs.interfaces.net.IMessageRecognizerServers;
	import me.xplabs.login.controller.CSLoginCommand;
	import me.xplabs.net.events.NetNotificationEvent;
	import me.xplabs.servers.MessageType;
	import me.xplabs.utils.msgFormat;

	import org.robotlegs.mvcs.Command;

	/**
	 * ...
	 * @author xiaohan
	 */
	public class SocketServerCommand extends Command {
		[Inject]
		public var messageRecognize : IMessageRecognizer

		public function SocketServerCommand() {
			super();
		}

		override public function execute() : void {
			commandMap.mapEvent(msgFormat(MessageType.CS_LOGIN), CSLoginCommand, NetNotificationEvent);

			injector.mapValue(IMessageRecognizerServers, messageRecognize);

			messageRecognize.listener();
		}
	}
}