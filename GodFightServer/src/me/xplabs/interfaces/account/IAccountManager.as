package me.xplabs.interfaces.account 
{
	
	/**
	 * 帐户管理接口
	 * ...
	 * @author xiaohan
	 */
	public interface IAccountManager 
	{
		/**
		 * 添加一个帐户
		 * @param	userName 用户名
		 * @param	passWord 密码
		 * @param	playerName 角色名
		 */
		function addAccount(userName:String, passWord:String, playerName:String):void;
		/**
		 * 获取一个帐户
		 * @param	userName 用户名
		 * @return
		 */
		function getAccountByUserName(userName:String):IAccount;
		/**
		 * 获取一个帐户
		 * @param	playerName 角色名
		 * @return
		 */
		function getAccountByPlayerName(playerName:String):IAccount;
		/**
		 * 添加帐户列表
		 * @param	xml 帐户列表数据
		 */
		function init():void;
	}
	
}