package me.xplabs.servers.room 
{
	import me.xplabs.servers.BaseMessage;
	import me.xplabs.servers.MessageType;
	
	/**
	 * 有成员退出
	 * ...
	 * @author xiaohan
	 */
	public class SCRoomMemberExit extends BaseMessage 
	{
		/**
		 * 成员的id
		 */
		public var memberId:int;
		public function SCRoomMemberExit() 
		{
			super();
			
		}
		override public function get type():int 
		{
			return MessageType.SC_ROOM_MEMBER_EXIT;
		}
		
		override public function read():void 
		{
			memberId = readInt();
		}
		override public function write():void 
		{
			writeInt(memberId);
		}
		
	}

}