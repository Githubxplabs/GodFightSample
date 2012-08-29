package me.xplabs.room.controller 
{
	import me.xplabs.interfaces.room.IRoomManager;
	import me.xplabs.room.events.RoomEvent;
	import me.xplabs.servers.MsgCommand;
	import me.xplabs.servers.room.SCRoomMemberExit;
	
	/**
	 * 成员退出房间
	 * ...
	 * @author xiaohan
	 */
	public class SCRoomMemberExitCommand extends MsgCommand 
	{
		[Inject]
		public var roomManager:IRoomManager;
		public function SCRoomMemberExitCommand() 
		{
			super();
			
		}
		
		override public function execute():void 
		{
			super.execute();
			
			var scRoomMemberExit:SCRoomMemberExit = baseMessage as SCRoomMemberExit;
			roomManager.delMember(scRoomMemberExit.memberId);
			
			dispatch(new RoomEvent(RoomEvent.ROOM_MEMBER_EXIT));
		}
		
	}

}