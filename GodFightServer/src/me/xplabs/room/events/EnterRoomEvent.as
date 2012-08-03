package me.xplabs.room.events 
{
	import flash.events.Event;
	import me.xplabs.interfaces.player.IPlayer;
	
	/**
	 * ...
	 * @author xiaohan
	 */
	public class EnterRoomEvent extends Event 
	{
		public static const ENTER_ROOM:String = "enterRoom";
		public var player:IPlayer;
		public function EnterRoomEvent(type:String, player:IPlayer, bubbles:Boolean = false, cancelable:Boolean = false) 
		{
			this.player = player;
			super(type, bubbles, cancelable);
			
		}
		
	}

}