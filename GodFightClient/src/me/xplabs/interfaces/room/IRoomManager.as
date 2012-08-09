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
		/**
		 * 房间成员
		 */
		function get members():Vector.<RoomMember>;
		function set members(value:Vector.<RoomMember>):void;
		/**
		 * 添加一个成员
		 * @param	memberId 成员的id
		 * @param	memberName 成员的名字
		 * @param	camp 成员的阵营，类型参见CampType.as
		 * @param	houseOwner 是否是房主
		 * @return
		 */
		function addMember(memberId:int, memberName:String, camp:int, houseOwner:Boolean):RoomMember;
		/**
		 * 删除一个房间的成员
		 * @param	memberId 房间成员的id
		 * @return
		 */
		function delMember(memberId:int):RoomMember;
		/**
		 * 提升成员为房主
		 * @param	memberId 房间成员的id
		 */
		function advanceHouseOwner(memberId:int):void;
	}
	
}