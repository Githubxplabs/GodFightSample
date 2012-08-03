package me.xplabs.servers.player 
{
	import me.xplabs.servers.BaseMessage;
	import me.xplabs.servers.MessageType;
	
	/**
	 * 玩家的基本信息
	 * ...
	 * @author xiaohan
	 */
	public class SCPlayerInfo extends BaseMessage 
	{
		/**
		 * 玩家的id
		 */
		public var playerId:int;
		/**
		 * 玩家的名字
		 */
		public var playerName:String;
		
		public function SCPlayerInfo() 
		{
			super();
			
		}
		override public function get type():int 
		{
			return MessageType.SC_PLAYER_INFO;
		}		
		override public function read():void 
		{
			playerId = readInt();
			playerName = readString();
		}
		override public function write():void 
		{
			writeInt(playerId);
			writeString(playerName);
		}
		
	}

}