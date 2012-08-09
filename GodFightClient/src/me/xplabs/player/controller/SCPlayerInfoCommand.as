package me.xplabs.player.controller 
{
	import me.xplabs.interfaces.player.IPlayerInfo;
	import me.xplabs.player.model.PlayerInfo;
	import me.xplabs.servers.MsgCommand;
	import me.xplabs.servers.player.SCPlayerInfo;
	
	/**
	 * ...
	 * @author xiaohan
	 */
	public class SCPlayerInfoCommand extends MsgCommand 
	{
		public function SCPlayerInfoCommand() 
		{
			super();
			
		}
		override public function execute():void 
		{
			super.execute();
			var playerInfo:IPlayerInfo = new PlayerInfo();
			var msg:SCPlayerInfo = baseMessage as SCPlayerInfo;
			playerInfo.playerId = msg.playerId;
			playerInfo.playerName = msg.playerName;
			
			injector.mapValue(IPlayerInfo, playerInfo);
			
		}
	}

}