package me.xplabs.room.events 
{
	import starling.events.Event;
	
	/**
	 * ...
	 * @author xiaohan
	 */
	public class RoomEvent extends Event 
	{
		/** 有成员加入*/
		public static const ROOM_MEMBER_JOIN:String = "roomMemberJoin";
		/** 有退出加入*/
		public static const ROOM_MEMBER_EXIT:String = "roomMemberExit";
		/** 点击进入战斗按钮*/
		public static const ENTER_BATTLE:String = "enterBattle";
		/** 移除房间场景*/
		public static const REMOVE_ROOM_SCENE:String = "removeRoomScene";
		
		public function RoomEvent(type:String, bubbles:Boolean=false, data:Object=null) 
		{
			super(type, bubbles, data);
			
		}
		
	}

}