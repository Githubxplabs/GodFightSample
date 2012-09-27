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
		 * 获取成员
		 */
		function get members():Vector.<RoomMember>;
		/**
		 * 添加成员
		 * @param	memberId 成员Id
		 * @param	memberName 成员的名字
		 * @param	camp 阵营
		 * @param	houseOwner 是否是房主
		 * @return
		 */
		function addMember(memberId:int, memberName:String, camp:int, houseOwner:Boolean):RoomMember;
		/**
		 * 删除成员
		 * @param	memberId 成员id
		 * @return
		 */
		function delMember(memberId:int):RoomMember;
		/**
		 * 提升房主
		 * @param	memberId 成员id
		 */
		function advanceHouseOwner(memberId:int):void;
		/**
		 * 是否都已经已经准备
		 * @param	memberId 成员id
		 * @return
		 */
		function get isAllPrepare():Boolean;
		/**
		 * 获取房间里的成员
		 * @param	memberId
		 */
		function roomMember(memberId:int):RoomMember
	}
	
}
