package me.xplabs.net.controller {
	import me.xplabs.interfaces.net.IMessageRecognizer;
	import me.xplabs.interfaces.net.IMessageRecognizerServers;
	import me.xplabs.interfaces.player.IPlayerManager;
	import me.xplabs.login.controller.CSLoginCommand;
	import me.xplabs.net.events.NetNotificationEvent;
	import me.xplabs.player.model.PlayerManager;
	import me.xplabs.servers.MessageType;
	import me.xplabs.utils.msgFormat;

	import org.robotlegs.mvcs.Command;

	/**
	 * ...
	 * @author xiaohan
	 */
	public class SocketServerCommand extends Command {
		[Inject]
		public var messageRecognize : IMessageRecognizer;

		public function SocketServerCommand() {
			super();
		}

		override public function execute() : void {

			injector.mapValue(IMessageRecognizerServers, messageRecognize);
			injector.mapSingletonOf(IPlayerManager, PlayerManager);

			commandMap.mapEvent(msgFormat(MessageType.CS_LOGIN), CSLoginCommand, NetNotificationEvent);
			messageRecognize.listener();
		}
	}
}