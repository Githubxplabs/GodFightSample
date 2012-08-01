package me.xplabs.interfaces.common 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author xiaohan
	 */
	public interface IUpdate 
	{
		/**
		 * 每帧刷新的函数
		 */
		function update(e:Event = null):void;
	}
	
}