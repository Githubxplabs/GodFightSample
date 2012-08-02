package me.xplabs.interfaces.player
{
	
	/**
	 * ...
	 * @author xiaohan
	 */
	public interface IPlayer
	{
		function get clientId():String;
		function set clientId(id:String):void;
		function get playerName():String;
		function set playerName(name:String):void;
		function get camp():int;
		function set camp(campType:int):void;
		function get houseOwner():Boolean;
		function set houseOwner(value:Boolean):void;
		
	}
}