package me.xplabs.interfaces.player 
{
	
	/**
	 * 玩家的基本信息
	 * ...
	 * @author xiaohan
	 */
	public interface IPlayerInfo 
	{
		/**
		 * 玩家id
		 */
		function get playerId():int;
		function set playerId(value:int):void;
		/**
		 * 玩家姓名
		 */
		function get playerName():String;
		function set playerName(value:String):void;
		/**
		 * 玩家阵营，类型参见CampType.as
		 */
		function get camp():int;
		function set camp(value:int):void;
		/**
		 * 玩家是否为房主
		 */
		function get houseOwner():Boolean;
		function set houseOwner(value:Boolean):void;
	}
	
}