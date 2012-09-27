package me.xplabs.servers {
	import flash.events.Event;

	/**
	 * ...
	 * @author xiaohan
	 */
	public class MessageType extends Event {
		public static const CS_LOGIN : int = 1;
		public static const SC_LOGIN_RESULT : int = 2;
		static public const SC_PLAYER_INFO:int = 3;
		static public const SC_ENTER_ROOM:int = 4;
		static public const SC_ROOM_MEMBER_JOIN:int = 5;
		static public const SC_ROOM_MEMBER_EXIT:int = 6;
		static public const CS_ENTER_BATTLE:int = 7;
		static public const SC_ADVANCE_HOUSE_OWNER:int = 8;
		static public const SC_ENTER_BATTLE:int = 9;

		public function MessageType(type : String, bubbles : Boolean = false, cancelable : Boolean = false) {
			super(type, bubbles, cancelable);
		}
	}
}