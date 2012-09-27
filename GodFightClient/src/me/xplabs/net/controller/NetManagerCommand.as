package me.xplabs.net.controller 
{
	import me.xplabs.battle.controller.SCEnterBattleCommand;
	import me.xplabs.interfaces.net.IConnector;
	import me.xplabs.interfaces.net.IMessageRecognizer;
	import me.xplabs.login.controller.SCLoginResultCommand;
	import me.xplabs.net.events.NetNotificationEvent;
	import me.xplabs.player.controller.SCPlayerInfoCommand;
	import me.xplabs.room.controller.SCEnterRoomCommand;
	import me.xplabs.room.controller.SCRoomMemberExitCommand;
	import me.xplabs.room.controller.SCRoomMemberJoinCommand;
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
			commandMap.mapEvent(msgFormat(MessageType.SC_PLAYER_INFO), SCPlayerInfoCommand, NetNotificationEvent);
			commandMap.mapEvent(msgFormat(MessageType.SC_ENTER_ROOM), SCEnterRoomCommand, NetNotificationEvent);
			commandMap.mapEvent(msgFormat(MessageType.SC_ROOM_MEMBER_JOIN), SCRoomMemberJoinCommand, NetNotificationEvent);
			commandMap.mapEvent(msgFormat(MessageType.SC_ROOM_MEMBER_EXIT), SCRoomMemberExitCommand, NetNotificationEvent);
			commandMap.mapEvent(msgFormat(MessageType.SC_ENTER_BATTLE), SCEnterBattleCommand, NetNotificationEvent);
			
			messageRecognizer.listener();
		}
	}

}