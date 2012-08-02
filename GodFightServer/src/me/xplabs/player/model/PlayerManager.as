package me.xplabs.player.model 
{
	import me.xplabs.interfaces.player.IPlayer;
	import me.xplabs.interfaces.player.IPlayerManager;
	import org.robotlegs.mvcs.Actor;
	
	/**
	 * 玩家管理器
	 * ...
	 * @author xiaohan
	 */
	public class PlayerManager extends Actor implements IPlayerManager
	{
		
		public function PlayerManager() 
		{
			super();
			
		}
		
		/**
		 * 获取一个玩家的信息
		 * @param	clientId 客户端id
		 * @return
		 */		
		public function getPlayerByClientId(clientId:String):IPlayer 
		{
			return null;
		}
		/**
		 * 添加一个玩家到管理器中
		 * @param	clientId 客户端id
		 * @return
		 */		
		public function addPlayer(clientId:String, userName:String):IPlayer 
		{
			return null;
		}
		/**
		 * 设置玩家的阵营
		 * @param	clientId 客户端id
		 * @param	camp 阵营类型，详情参见CampType.as
		 * @return
		 */		
		public function setCamp(clientId:String, camp:int):void 
		{
		}
		/**
		 * 提升玩家为房主
		 * @param	clientId 客户端id
		 */		
		public function advanceHouseOwner(clientId:String):void 
		{
			
		}
		
	}

}