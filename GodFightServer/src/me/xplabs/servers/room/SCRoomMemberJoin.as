package me.xplabs.servers.room 
{
	import me.xplabs.room.model.vo.RoomMember;
	import me.xplabs.servers.BaseMessage;
	import me.xplabs.servers.MessageType;
	
	/**
	 * 有成员加入
	 * ...
	 * @author xiaohan
	 */
	public class SCRoomMemberJoin extends BaseMessage 
	{
		/**
		 * 成员
		 */
		public var member:RoomMember;
		public function SCRoomMemberJoin() 
		{
			super();
			
		}
		override public function get type():int 
		{
			return MessageType.SC_ROOM_MEMBER_JOIN;
		}
		override public function read():void 
		{
			member = new RoomMember();
			member.memberId = readInt();
			member.memberName = readString();
			member.camp = readShort();
			member.houseOwner = readBoolean();
		}
		override public function write():void 
		{
			writeInt(member.memberId);
			writeString(member.memberName);
			writeShort(member.camp);
			writeBoolean(member.houseOwner);
		}
		
	}

}