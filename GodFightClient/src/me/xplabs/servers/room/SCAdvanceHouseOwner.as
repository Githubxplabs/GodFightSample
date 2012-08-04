package me.xplabs.servers.room 
{
	import me.xplabs.servers.BaseMessage;
	import me.xplabs.servers.MessageType;
	
	/**
	 * 提升房主
	 * ...
	 * @author xiaohan
	 */
	public class SCAdvanceHouseOwner extends BaseMessage 
	{
		public var memberId:int;
		public function SCAdvanceHouseOwner() 
		{
			super();
			
		}
		override public function get type():int 
		{
			return MessageType.SC_ADVANCE_HOUSE_OWNER;
		}
		override public function read():void 
		{
			memberId = readInt();
		}
		
		override public function write():void 
		{
			writeInt(memberId);
		}
	}

}