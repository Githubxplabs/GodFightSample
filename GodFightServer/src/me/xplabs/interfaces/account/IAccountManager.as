package me.xplabs.interfaces.account 
{
	
	/**
	 * 帐户管理接口
	 * ...
	 * @author xiaohan
	 */
	public interface IAccountManager 
	{
		function addAccount(userName:String, passWord:String, playerName:String):void;
		function getAccount(userName:String):IAccount;
		function addAccountList(xml:XML):void;
	}
	
}