package me.xplabs.interfaces.account 
{
	
	/**
	 * 帐户信息
	 * ...
	 * @author xiaohan
	 */
	public interface IAccount 
	{
		function get userName():String;
		function set userName(value:String):void;
		function get passWord():String;
		function set passWord(value:String):void;
		function get playerName():String;
		function set playerName(value:String):void;
		function get playerId():int;
		function set playerId(value:int):void;
		
	}
	
}