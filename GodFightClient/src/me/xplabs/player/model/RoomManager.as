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
			return null;
		}
		
		public function delMember(memberId:int):RoomMember 
		{
			return null;
		}
		
		public function advanceHouseOwner(memberId:int):void 
		{
			
		}
		
	}

}