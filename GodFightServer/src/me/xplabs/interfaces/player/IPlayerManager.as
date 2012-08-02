package me.xplabs.interfaces.player 
{
	
	/**
	 * ...
	 * @author xiaohan
	 */
	public interface IPlayerManager 
	{
		function getPlayer(name:String):IPlayer;
		function addPlayer(name:String):IPlayer;
		
		
	}
	
}