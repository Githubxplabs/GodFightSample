package me.xplabs.interfaces.account 
{
	
	/**
	 * 验证帐户
	 * ...
	 * @author xiaohan
	 */
	public interface IAccountChecking
	{
		/**
		 * 验证帐户是否通过
		 * @param	userName 用户名
		 * @param	passWord 密码
		 * @return 验证的结果状态，参见AccountCheckingType.as
		 */
		function checking(userName:String, passWord:String):int;
	}
	
}