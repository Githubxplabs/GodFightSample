package me.xplabs.battle.events 
{
	import starling.events.Event;
	
	/**
	 * 地图移动事件
	 * ...
	 * @author xiaohan
	 */
	public class MapMoveEvent extends Event 
	{
		public static const LEFT_MOVE:String = "leftMove";
		public static const RIGHT_MOVE:String = "rightMove";
		public static const UP_MOVE:String = "upMove";
		public static const DOWN_MOVE:String = "downMove";
		public static const STOP_MOVE:String = "stopMove";
		public function MapMoveEvent(type:String, bubbles:Boolean=false, data:Object=null) 
		{
			super(type, bubbles, data);
			
		}
		
	}

}