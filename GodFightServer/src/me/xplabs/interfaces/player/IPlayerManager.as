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
		 * @param	clientId 客户端id
		 * @return
		 */
		function getPlayerByClientId(clientId:String):IPlayer;
		/**
		 * 添加一个玩家到管理器中
		 * @param	clientId 客户端id
		 * @return
		 */
		function addPlayer(clientId:String, userName:String):IPlayer;
		/**
		 * 设置玩家的阵营
		 * @param	clientId 客户端id
		 * @param	camp 阵营类型，详情参见CampType.as
		 * @return
		 */
		function setCamp(clientId:String, camp:int):void;
		/**
		 * 提升玩家为房主
		 * @param	clientId 客户端id
		 */
		function advanceHouseOwner(clientId:String):void;
	}
	
}