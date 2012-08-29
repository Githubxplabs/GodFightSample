package me.xplabs.room.controller 
{
	import me.xplabs.interfaces.room.IRoomManager;
	import me.xplabs.room.events.RoomEvent;
	import me.xplabs.room.model.vo.RoomMember;
	import me.xplabs.servers.MsgCommand;
	import me.xplabs.servers.room.SCRoomMemberJoin;
	
	/**
	 * ...
	 * @author xiaohan
	 */
	public class SCRoomMemberJoinCommand extends MsgCommand 
	{
		[Inject]
		public var roomManager:IRoomManager;
		public function SCRoomMemberJoinCommand () 
		{
			super();
			
		}
		override public function execute():void 
		{
			super.execute();
			
			var scRoomMemberJoin:SCRoomMemberJoin = baseMessage as SCRoomMemberJoin;
			var member:RoomMember = scRoomMemberJoin.member;
			roomManager.addMember(member.memberId, member.memberName, member.camp, member.houseOwner);
			
			dispatch(new RoomEvent(RoomEvent.ROOM_MEMBER_JOIN));
		}
		
	}

}