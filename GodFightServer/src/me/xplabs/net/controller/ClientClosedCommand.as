package me.xplabs.net.controller 
{
	import me.xplabs.interfaces.common.IPlayerIdConvert;
	import me.xplabs.interfaces.player.IPlayerManager;
	import me.xplabs.interfaces.room.IRoomManager;
	import me.xplabs.net.events.NetEvent;
	import org.robotlegs.mvcs.Command;
	
	/**
	 * 有客户端关闭
	 * ...
	 * @author xiaohan
	 */
	public class ClientClosedCommand extends Command 
	{
		[Inject]
		public var event:NetEvent;
		[Inject]
		public var playerIdConvert:IPlayerIdConvert;
		[Inject]
		public var playerManager:IPlayerManager;
		[Inject]
		public var roomManager:IRoomManager;
		public function ClientClosedCommand() 
		{
			super();
		}
		
		override public function execute():void 
		{
			var clientId:String = event.clientId;
			if (playerIdConvert)
			{
				var playerId:int = playerIdConvert.getPlayerId(clientId);
				playerIdConvert.delIdByClientId(clientId);
			}
			if (playerManager)
				playerManager.delPlayer(playerId);
				
			if (roomManager)
			{
				roomManager.delMember(playerId);
			}
			
		}
		
	}

}