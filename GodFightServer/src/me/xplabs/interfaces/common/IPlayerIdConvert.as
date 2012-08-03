package me.xplabs.interfaces.common 
{
	
	/**
	 * 玩家的playerId 和ClientId的转换
	 * ...
	 * @author xiaohan
	 */
	public interface IPlayerIdConvert 
	{
		function getClientId(playerId:int):String;
		function getPlayerId(clientId:String):int;
		function setId(clientId:String, playerId:int):void;
		
	}
	
}