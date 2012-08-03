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
		[Inject]
		public var account:IAccountManager;
		public function AccountManagerCommand() 
		{
			super();
			
		}
		override public function execute():void 
		{
			injector.mapValue(IAccountChecking, account);
			account.init();
		}
		
	}

}