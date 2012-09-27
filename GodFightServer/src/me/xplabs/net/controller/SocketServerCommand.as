package me.xplabs.net.controller {
	import me.xplabs.battle.controller.CSEnterBattleCommand;
	import me.xplabs.interfaces.net.IMessageRecognizer;
	import me.xplabs.interfaces.player.IPlayerManager;
	import me.xplabs.interfaces.room.IRoomManager;
	import me.xplabs.login.controller.CSLoginCommand;
	import me.xplabs.net.events.NetEvent;
	import me.xplabs.net.events.NetNotificationEvent;
	import me.xplabs.player.model.PlayerManager;
	import me.xplabs.room.controller.EnterRoomCommand;
	import me.xplabs.room.events.EnterRoomEvent;
	import me.xplabs.room.model.RoomManager;
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

			injector.mapSingletonOf(IPlayerManager, PlayerManager);
			injector.mapSingletonOf(IRoomManager, RoomManager);
			
			commandMap.mapEvent(EnterRoomEvent.ENTER_ROOM , EnterRoomCommand, EnterRoomEvent);
			commandMap.mapEvent(NetEvent.NET_CLIENT_CLOSE , ClientClosedCommand, NetEvent);
			
			commandMap.mapEvent(msgFormat(MessageType.CS_LOGIN), CSLoginCommand, NetNotificationEvent);
			commandMap.mapEvent(msgFormat(MessageType.CS_ENTER_BATTLE), CSEnterBattleCommand, NetNotificationEvent);
			messageRecognize.listener();
		}
	}
}