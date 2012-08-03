package me.xplabs.room.model.vo 
{
	/**
	 * 房间成员信息
	 * ...
	 * @author xiaohan
	 */
	public class RoomMember 
	{
		public var memberId:int;
		public var memberName:String;
		public var camp:int;
		public var houseOwner:Boolean;
		public function RoomMember() 
		{
			
		}
		public function clone():RoomMember
		{
			var member:RoomMember = new RoomMember();
			member.memberId = this.memberId;
			member.memberName = this.memberName;
			member.camp = this.camp;
			member.houseOwner = this.houseOwner;
			return member;
		}
	}

}