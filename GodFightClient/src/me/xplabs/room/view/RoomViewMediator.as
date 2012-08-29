package me.xplabs.room.view 
{
	import me.xplabs.interfaces.room.IRoomManager;
	import me.xplabs.room.events.RoomEvent;
	import org.robotlegs.mvcs.Mediator;
	
	/**
	 * ...
	 * @author xiaohan
	 */
	public class RoomViewMediator extends Mediator 
	{
		[Inject]
		public var roomView:RoomView;
		[Inject]
		public var roomManager:IRoomManager;
		public function RoomViewMediator() 
		{
			super();
			
		}
		override public function onRegister():void 
		{
			roomView.init();
			roomView.updateRoomMembers(roomManager.members);
			
			addContextListener(RoomEvent.ROOM_MEMBER_JOIN, roomMemberJoinHandler, RoomEvent);
			addContextListener(RoomEvent.ROOM_MEMBER_EXIT, roomMemberExitHandler, RoomEvent);
		}
		
		private function roomMemberExitHandler(e:RoomEvent):void 
		{
			roomView.updateRoomMembers(roomManager.members);
		}
		
		private function roomMemberJoinHandler(e:RoomEvent):void 
		{
			roomView.updateRoomMembers(roomManager.members);
		}
		override public function onRemove():void 
		{
		}
		
	}

}