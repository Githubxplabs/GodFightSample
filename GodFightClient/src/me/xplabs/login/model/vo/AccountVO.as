package me.xplabs.login.model.vo 
{
	/**
	 * ...
	 * @author xiaohan
	 */
	public class AccountVO 
	{
		public var userName:String;
		public var passWord:String;
		public function AccountVO(userName:String, passWord:String) 
		{
			this.userName = userName;
			this.passWord = passWord;
		}
		
	}

}