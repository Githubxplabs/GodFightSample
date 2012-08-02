package me.xplabs.common.events 
{
	import flash.events.Event;
	
	/**
	 * 开启和关闭主循环事件
	 * ...
	 * @author xiaohan
	 */
	public class GameManagerEvent extends Event 
	{
		/**
		 * 开启主循环事件
		 */
		public static const START_GAME_UPDATE:String = "startGameUpdate";
		/**
		 * 关闭主循环事件
		 */
		public static const STOP_GAME_UPDATE:String = "stopGameUpdate";
		public function GameManagerEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{
			super(type, bubbles, cancelable);
			
		}
		
	}

}