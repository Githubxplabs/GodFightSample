package me.xplabs.room.model 
{
	import me.xplabs.interfaces.common.IPlayerIdConvert;
	import me.xplabs.interfaces.room.IRoomManager;
	import me.xplabs.room.model.vo.RoomMember;
	import me.xplabs.servers.room.SCAdvanceHouseOwner;
	import me.xplabs.servers.room.SCRoomMemberExit;
	import me.xplabs.servers.room.SCRoomMemberJoin;
	import me.xplabs.utils.sendMsg;
	/**
	 * ...
	 * @author xiaohan
	 */
	public class RoomManager implements IRoomManager 
	{
		private var _members:Vector.<RoomMember>;
		[Inject]
		public var playerIdConvert:IPlayerIdConvert;
		public function RoomManager() 
		{
			_members = new Vector.<RoomMember>();
		}
		
		/* INTERFACE me.xplabs.interfaces.room.IRoomManager */
		
		public function get members():Vector.<RoomMember> 
		{
			return _members;
		}
		
		public function addMember(memberId:int, memberName:String, camp:int, houseOwner:Boolean):RoomMember 
		{
			var member:RoomMember = new RoomMember();
			member.memberId = memberId;
			member.memberName = memberName
			member.camp = camp;
			member.houseOwner = houseOwner;
			roomBroadcastByAddMember(member);
			_members[_members.length] = member;
			return member;
		}
		
		private function roomBroadcastByAddMember(member:RoomMember):void
		{
			var len:int = _members.length;
			if (len == 0) return;
			var tempMember:RoomMember = member.clone();
			var sCRoomMemberJoin:SCRoomMemberJoin = new SCRoomMemberJoin();
			sCRoomMemberJoin.member = tempMember;
			for (var i:int = 0; i < len; i++) 
			{
				sendMsg(playerIdConvert.getClientId(_members[i].memberId), sCRoomMemberJoin);
			}
		}
		
		
		public function delMember(memberId:int):RoomMember 
		{
			var len:int = _members.length;
			for (var i:int = 0; i < len; i++) 
			{
				if (_members[i].memberId == memberId)
				{
					var member:RoomMember = _members.splice(i, 1)[0];
					break;
				}
			}
			var sCRoomMemberExit:SCRoomMemberExit = new SCRoomMemberExit();
			sCRoomMemberExit.memberId = memberId;
			len = _members.length;
			for (i = 0; i < len; i++) 
			{
				sendMsg(playerIdConvert.getClientId(_members[i].memberId), sCRoomMemberExit);
			}
			
			
			if (member && member.houseOwner && _members.length > 0)
			{
				advanceHouseOwner(_members[0].memberId);
			}
			
			return member;
		}
		public function advanceHouseOwner(memberId:int):void
		{
			var len:int = _members.length;
			for (var i:int = 0; i < len; i++) 
			{
				if (_members[i].memberId == memberId)
				{
					_members[i].houseOwner = true;
				}else {
					_members[i].houseOwner = false;
				}
			}
			
			var scAdvanceHouseOwner:SCAdvanceHouseOwner = new SCAdvanceHouseOwner();
			scAdvanceHouseOwner.memberId = memberId;
			sendMsg(playerIdConvert.getClientId(memberId), scAdvanceHouseOwner);
			
		}
		
		
		public function roomMember(memberId:int):RoomMember 
		{
			var len:int = _members.length;
			for (var i:int = 0; i < len; i++) 
			{
				if (_members[i].memberId == memberId)
				{
					return _members[i];
				}
			}
			return null;
		}
		
		public function get isAllPrepare():Boolean 
		{
			return true;
		}
		
	}

}