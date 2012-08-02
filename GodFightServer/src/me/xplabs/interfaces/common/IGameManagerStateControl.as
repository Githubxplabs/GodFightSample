package me.xplabs.interfaces.common 
{
	
	/**
	 * ...
	 * @author xiaohan
	 */
	public interface IGameManagerStateControl 
	{
		/**
		 * 开启主帧循环
		 */
		function startUpdate():void;
		/**
		 * 停止主帧循环
		 */
		function stopUpdate():void;
	}
	
}