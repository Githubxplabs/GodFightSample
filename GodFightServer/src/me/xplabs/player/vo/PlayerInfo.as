package me.xplabs.player.vo 
{
	import me.xplabs.interfaces.player.IPlayer;
	/**
	 * ...
	 * @author xiaohan
	 */
	public class PlayerInfo implements IPlayer
	{
		private var _playerId:int;
		private var _clientId:String;
		private var _playerName:String;
		private var _camp:int;
		private var _houseOwner:Boolean;
		
		public function PlayerInfo() 
		{
			
		}
		
		/* INTERFACE me.xplabs.interfaces.player.IPlayer */
		
		public function get playerId():int 
		{
			return _playerId;
		}
		
		public function set playerId(value:int):void 
		{
			_playerId = value;
		}
		
		public function get clientId():String 
		{
			return _clientId;
		}
		
		public function set clientId(value:String):void 
		{
			_clientId = value;
		}
		
		public function get playerName():String 
		{
			return _playerName;
		}
		
		public function set playerName(value:String):void 
		{
			_playerName = value;
		}
		
		public function get camp():int 
		{
			return _camp;
		}
		
		public function set camp(value:int):void 
		{
			_camp = value;
		}
		
		public function get houseOwner():Boolean 
		{
			return _houseOwner;
		}
		
		public function set houseOwner(value:Boolean):void 
		{
			_houseOwner = value;
		}
		
	}

}