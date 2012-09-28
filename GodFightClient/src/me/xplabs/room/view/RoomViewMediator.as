package me.xplabs.room.view 
{
	import me.xplabs.interfaces.room.IRoomManager;
	import me.xplabs.room.events.RoomEvent;
	import me.xplabs.servers.room.CSEnterBattle;
	import me.xplabs.utils.sendMsg;
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
			addContextListener(RoomEvent.REMOVE_ROOM_SCENE, removeRoomHandler, RoomEvent);
			
			eventMap.mapListener(roomView, RoomEvent.ENTER_BATTLE, enterBattleHandler);
		}
		/**
		 * 移除房间场景
		 * @param	e
		 */
		private function removeRoomHandler(e:RoomEvent):void 
		{
			if (roomView.parent) roomView.parent.removeChild(roomView);
		}
		/**
		 * 请求进入战斗场景
		 * @param	e
		 */
		private function enterBattleHandler(e:RoomEvent):void 
		{
			sendMsg(new CSEnterBattle());
		}
		/**
		 * 有成员退出
		 * @param	e
		 */
		private function roomMemberExitHandler(e:RoomEvent):void 
		{
			roomView.updateRoomMembers(roomManager.members);
		}
		/**
		 * 有成员加入
		 * @param	e
		 */
		private function roomMemberJoinHandler(e:RoomEvent):void 
		{
			roomView.updateRoomMembers(roomManager.members);
		}
		override public function onRemove():void 
		{
			removeContextListener(RoomEvent.ROOM_MEMBER_JOIN, roomMemberJoinHandler, RoomEvent);
			removeContextListener(RoomEvent.ROOM_MEMBER_EXIT, roomMemberExitHandler, RoomEvent);
			removeContextListener(RoomEvent.REMOVE_ROOM_SCENE, removeRoomHandler, RoomEvent);
			
			eventMap.unmapListener(roomView, RoomEvent.ENTER_BATTLE, enterBattleHandler);
			
			roomView.dispose();
		}
		
	}

}