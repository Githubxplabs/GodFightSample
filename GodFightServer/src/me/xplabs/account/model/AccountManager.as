package me.xplabs.account.model 
{
	import me.xplabs.constant.AccountCheckingType;
	import me.xplabs.interfaces.account.IAccount;
	import me.xplabs.interfaces.account.IAccountChecking;
	import me.xplabs.interfaces.account.IAccountManager;
	import org.robotlegs.mvcs.Actor;
	
	/**
	 * ...
	 * @author xiaohan
	 */
	public class AccountManager extends Actor implements IAccountChecking, IAccountManager 
	{
		private var _accountList:Vector.<IAccount>;
		public function AccountManager() 
		{
			super();
			
			_accountList = new Vector.<IAccount>();
			var account:Account = new Account();
			account.userName = "韩贤明";
			account.passWord = "123456789";
			account.playerName = "韩贤明";
			_accountList[_accountList.length] = account;
			
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
			
		}
		
		public function getAccountByUserName(userName:String):IAccount 
		{
			return null;
		}
		
		public function getAccountByPlayerName(playerName:String):IAccount 
		{
			return null;
		}
		
		public function addAccountList(xml:XML):void 
		{
			
		}
		
	}

}