package me.xplabs.interfaces.common 
{
	
	/**
	 * 游戏的主循环管理
	 * ...
	 * @author xiaohan
	 */
	public interface IGameManager 
	{
		/**
		 * 添加函数到主帧循环中
		 * @param	func 需要添加的函数
		 */
		function addUpdate(func:Function):void;
		/**
		 * 从主帧循环中删除函数
		 * @param	func 被删除的函数
		 * @return
		 */
		function removeUpdate(func:Function):Function;
	}
	
}