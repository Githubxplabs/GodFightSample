package me.xplabs.account.controller 
{
	import me.xplabs.account.model.AccountManager;
	import me.xplabs.interfaces.account.IAccountChecking;
	import me.xplabs.interfaces.account.IAccountManager;
	import org.robotlegs.mvcs.Command;
	
	/**
	 * ...
	 * @author xiaohan
	 */
	public class AccountManagerCommand extends Command 
	{
		
		public function AccountManagerCommand() 
		{
			super();
			
		}
		override public function execute():void 
		{
			var account:AccountManager = new AccountManager();
			
			
			injector.mapValue(IAccountChecking, account);
			injector.mapValue(IAccountManager, account);
		}
		
	}

}