package me.xplabs.room.controller 
{
	import me.xplabs.interfaces.player.IPlayer;
	import me.xplabs.interfaces.room.IRoomManager;
	import me.xplabs.room.events.EnterRoomEvent;
	import me.xplabs.servers.room.SCEnterRoom;
	import me.xplabs.utils.sendMsg;
	import org.robotlegs.mvcs.Command;
	
	/**
	 * 进入房间
	 * ...
	 * @author xiaohan
	 */
	public class EnterRoomCommand extends Command 
	{
		[Inject]
		public var roomManager:IRoomManager;
		[Inject]
		public var event:EnterRoomEvent;
		public function EnterRoomCommand() 
		{
			super();
			
		}
		
		override public function execute():void 
		{
			var player:IPlayer = event.player;
			roomManager.addMember(player.playerId, player.playerName, player.camp, player.houseOwner);
			var scEnterRoom:SCEnterRoom = new SCEnterRoom();
			scEnterRoom.members = roomManager.members;
			sendMsg(player.clientId, scEnterRoom);
		}
		
	}

}