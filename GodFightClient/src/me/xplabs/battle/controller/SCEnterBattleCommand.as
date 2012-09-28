package me.xplabs.battle.controller 
{
	import me.xplabs.room.events.RoomEvent;
	import me.xplabs.servers.battle.SCEnterBattle;
	import me.xplabs.servers.MsgCommand;
	
	/**
	 * ...
	 * @author xiaohan
	 */
	public class SCEnterBattleCommand extends MsgCommand 
	{
		
		public function SCEnterBattleCommand() 
		{
			super();
		}
		override public function execute():void 
		{
			super.execute();
			dispatch(new RoomEvent(RoomEvent.REMOVE_ROOM_SCENE));
			
			var sCEnterBattle:SCEnterBattle = baseMessage as SCEnterBattle;
		}
		
	}

}