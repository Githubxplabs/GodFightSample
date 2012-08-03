package me.xplabs.account.model 
{
	import me.xplabs.interfaces.account.IAccount;
	/**
	 * ...
	 * @author xiaohan
	 */
	public class Account implements IAccount 
	{
		private var _userName:String;
		private var _passWord:String;
		private var _playerName:String;
		private var _playerId:int;
		
		public function Account() 
		{
			
		}
		
		/* INTERFACE me.xplabs.interfaces.account.IAccount */
		
		public function get playerId():int 
		{
			return _playerId;
		}
		
		public function set playerId(value:int):void 
		{
			_playerId = value;
		}
		
		/* INTERFACE me.xplabs.interfaces.account.IAccount */
		
		public function get userName():String 
		{
			return _userName;
		}
		
		public function set userName(value:String):void 
		{
			_userName = value;
		}
		
		public function get passWord():String 
		{
			return _passWord;
		}
		
		public function set passWord(value:String):void 
		{
			_passWord = value;
		}
		
		public function get playerName():String 
		{
			return _playerName;
		}
		
		public function set playerName(value:String):void 
		{
			_playerName = value;
		}
		
	}

}