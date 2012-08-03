package me.xplabs.servers.room 
{
	import me.xplabs.room.model.vo.RoomMember;
	import me.xplabs.servers.BaseMessage;
	import me.xplabs.servers.MessageType;
	
	/**
	 * ...
	 * @author xiaohan
	 */
	public class SCEnterRoom extends BaseMessage 
	{
		public var members:Vector.<RoomMember>;
		public function SCEnterRoom() 
		{
			super();
			
		}
		override public function get type():int 
		{
			return MessageType.SC_ENTER_ROOM;
		}		
		override public function read():void 
		{
			var len:int = readShort();
			members = new Vector.<RoomMember>(len);
			for (var i:int = 0; i < len; i++) 
			{
				members[i] = new RoomMember();
				members[i].memberId = readInt();
				members[i].memberName = readString();
				members[i].camp = readShort();
				members[i].houseOwner = readBoolean();
			}
		}
		override public function write():void 
		{
			var len:int = members.length;
			writeShort(len);
			for (var i:int = 0; i < len; i++) 
			{
				writeInt(members[i].memberId);
				writeString(members[i].memberName);
				writeShort(members[i].camp);
				writeBoolean(members[i].houseOwner);
			}
		}
		
	}

}