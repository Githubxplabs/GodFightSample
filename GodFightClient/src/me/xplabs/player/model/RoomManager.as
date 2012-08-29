package me.xplabs.player.model 
{
	import me.xplabs.interfaces.room.IRoomManager;
	import me.xplabs.room.model.vo.RoomMember;
	/**
	 * ...
	 * @author xiaohan
	 */
	public class RoomManager implements IRoomManager 
	{
		private var _members:Vector.<RoomMember>;
		
		public function RoomManager() 
		{
			
		}
		
		/* INTERFACE me.xplabs.interfaces.room.IRoomManager */
		
		public function get members():Vector.<RoomMember> 
		{
			return _members;
		}
		
		public function set members(value:Vector.<RoomMember>):void 
		{
			_members = value;
		}
		
		public function addMember(memberId:int, memberName:String, camp:int, houseOwner:Boolean):RoomMember 
		{
			var member:RoomMember = new RoomMember();
			member.memberId = memberId;
			member.memberName = memberName;
			member.camp = camp;
			member.houseOwner = houseOwner;
			_members[_members.length] = member;
			return member;
		}
		
		public function delMember(memberId:int):RoomMember 
		{
			var len:int = _members.length;
			for (var i:int = 0; i < len; i++) 
			{
				if (_members[i].memberId == memberId)
				{
					return _members.splice(i, 1)[0];
				}
			}
			return null;
		}
		
		public function advanceHouseOwner(memberId:int):void 
		{
			
		}
		
	}

}