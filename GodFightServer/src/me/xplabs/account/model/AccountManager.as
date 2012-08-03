package me.xplabs.account.model 
{
	import me.xplabs.constant.AccountCheckingType;
	import me.xplabs.interfaces.account.IAccount;
	import me.xplabs.interfaces.account.IAccountChecking;
	import me.xplabs.interfaces.account.IAccountManager;
	import me.xplabs.interfaces.common.ILibrary;
	import me.xplabs.interfaces.common.ILocalFileManager;
	import org.robotlegs.mvcs.Actor;
	
	/**
	 * ...
	 * @author xiaohan
	 */
	public class AccountManager extends Actor implements IAccountChecking, IAccountManager 
	{
		[Inject]
		public var library:ILibrary;
		[Inject]
		public var localFile:ILocalFileManager;
		private var _accountList:Vector.<IAccount>;
		public function AccountManager() 
		{
			super();
		}
		
		/* INTERFACE me.xplabs.interfaces.account.IAccountChecking */
		
		public function checking(userName:String, passWord:String):int 
		{
			var len:int = _accountList.length;
			for (var i:int = 0; i < len; i++) 
			{
				if (_accountList[i].userName == userName)
				{
					if (_accountList[i].passWord == passWord)
					{
						return AccountCheckingType.CHECK_PASS
					}else
					{
						return AccountCheckingType.ERROR_PASS_WORD;
					}
				}
			}
			return AccountCheckingType.ERROR_USER_NAME;
		}
		
		/* INTERFACE me.xplabs.interfaces.account.IAccountManager */
		
		public function addAccount(userName:String, passWord:String, playerName:String):void 
		{
			//localFile.save();
		}
		
		public function getAccountByUserName(userName:String):IAccount 
		{
			var len:int = _accountList.length;
			for (var i:int = 0; i < len; i++) 
			{
				if (_accountList[i].userName == userName)
				{
					return _accountList[i]
				}
			}
			return null;
		}
		
		public function getAccountByPlayerName(playerName:String):IAccount 
		{
			return null;
		}
		
		public function init():void 
		{
			_accountList = new Vector.<IAccount>();
			var xml:XML = new XML(library.getData("user.xml"));
			for each (var item:XML in xml.account) 
			{
				var account:Account = new Account();
				account.userName = item.@userName;
				account.passWord = item.@passWord;
				account.playerName = item.@playerName;
				account.playerId = item.@playerId;
				_accountList[_accountList.length] = account;
			}
		}
		
	}

}