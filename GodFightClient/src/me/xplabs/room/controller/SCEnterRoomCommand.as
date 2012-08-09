package me.xplabs.room.controller 
{
	import me.xplabs.interfaces.player.IPlayerInfo;
	import me.xplabs.interfaces.room.IRoomManager;
	import me.xplabs.login.events.LoginEvent;
	import me.xplabs.player.model.RoomManager;
	import me.xplabs.room.model.vo.RoomMember;
	import me.xplabs.room.view.RoomView;
	import me.xplabs.room.view.RoomViewMediator;
	import me.xplabs.servers.MsgCommand;
	import me.xplabs.servers.room.SCEnterRoom;
	
	/**
	 * ...
	 * @author xiaohan
	 */
	public class SCEnterRoomCommand extends MsgCommand 
	{
		[Inject]
		public var playerInfo:IPlayerInfo;
		public function SCEnterRoomCommand() 
		{
			super();
			
		}
		override public function execute():void 
		{
			super.execute();
			
			var roomManager:IRoomManager = new RoomManager();
			var scEnterRoom:SCEnterRoom = baseMessage as SCEnterRoom;
			roomManager.members = scEnterRoom.members;
			
			
			injector.mapValue(IRoomManager, roomManager);
			mediatorMap.mapView(RoomView, RoomViewMediator);
			
			dispatch(new LoginEvent(LoginEvent.REMOVE_LOGIN_SCENE));
			
			contextView.addChild(new RoomView());
		}
		
	}

}