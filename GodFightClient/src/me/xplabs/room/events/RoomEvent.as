package me.xplabs.room.events 
{
	import starling.events.Event;
	
	/**
	 * ...
	 * @author xiaohan
	 */
	public class RoomEvent extends Event 
	{
		
		public static var ROOM_MEMBER_JOIN:String = "roomMemberJoin";
		public static var ROOM_MEMBER_EXIT:String = "roomMemberExit";
		public function RoomEvent(type:String, bubbles:Boolean=false, data:Object=null) 
		{
			super(type, bubbles, data);
			
		}
		
	}

}