package me.xplabs.interfaces.battle 
{
	import me.xplabs.battle.model.HeroInfo;
	
	/**
	 * 战斗中玩家群组管理
	 * ...
	 * @author xiaohan
	 */
	public interface IPlayerGroup 
	{
		function addPlayer(playerId:int, playerName:String, playerCamp:int):HeroInfo;
		function delPlayer(playerId:int):void;
		function get players():Vector.<HeroInfo>;
		function player(playerId:int):HeroInfo;
		function dispose():void;
		
	}
	
}