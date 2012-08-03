package me.xplabs.servers.room 
{
	import me.xplabs.servers.BaseMessage;
	import me.xplabs.servers.MessageType;
	
	/**
	 * 端请求进入战斗
	 * ...
	 * @author xiaohan
	 */
	public class CSEnterBattle extends BaseMessage 
	{
		public function CSEnterBattle() 
		{
			super();
		}
		override public function get type():int 
		{
			return MessageType.CS_ENTER_BATTLE;
		}
		
		override public function read():void 
		{
			
		}
		
		override public function write():void 
		{
		}
	}
}