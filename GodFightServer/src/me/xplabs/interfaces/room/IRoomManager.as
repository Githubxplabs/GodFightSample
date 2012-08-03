package me.xplabs.interfaces.room 
{
	import me.xplabs.room.model.vo.RoomMember;
	
	/**
	 * 房间管理
	 * ...
	 * @author xiaohan
	 */
	public interface IRoomManager 
	{
		function get members():Vector.<RoomMember>;
		function addMember(memberId:int, memberName:String, camp:int, houseOwner:Boolean):RoomMember;
		function delMember(memberId:int):RoomMember;
	}
	
}
