package me.xplabs.interfaces.player 
{
	
	/**
	 * 用于操作和管理玩家
	 * ...
	 * @author xiaohan
	 */
	public interface IPlayerManager 
	{
		/**
		 * 获取一个玩家的信息
		 * @param	playerId 玩家的id
		 * @return
		 */
		function getPlayerByPlayerId(playerId:int):IPlayer;
		/**
		 * 添加一个玩家到管理器中
		 * @param	clientId 客户端id
		 * @return
		 */
		function addPlayer(clientId:String, userName:String):IPlayer;
		/**
		 * 设置玩家的阵营
		 * @param	playerId 玩家的id
		 * @param	camp 阵营类型，详情参见CampType.as
		 * @return
		 */
		function setCamp(playerId:int, camp:int):void;
		/**
		 * 提升玩家为房主
		 * @param	playerId 玩家的id
		 */
		function advanceHouseOwner(playerId:int):void;
	}
	
}