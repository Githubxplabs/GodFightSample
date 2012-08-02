package me.xplabs.account.model 
{
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
		
		public function AccountManager() 
		{
			super();
			
		}
		
		
		public function addAccount(userName:String, passWord:String, playerName:String):void 
		{
			
		}
		
		public function getAccount(userName:String):IAccount 
		{
			return null;
		}
		
		public function addAccountList(xml:XML):void 
		{
			
		}
		
		
		public function checking(userName:String, passWord:String):int 
		{
			return 1;
		}
		
	}

}