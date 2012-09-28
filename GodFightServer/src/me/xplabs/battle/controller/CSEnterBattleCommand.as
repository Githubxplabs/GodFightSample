package me.xplabs.battle.controller 
{
	import me.xplabs.battle.model.BattleManager;
	import me.xplabs.battle.model.HeroInfo;
	import me.xplabs.interfaces.battle.IBattleManager;
	import me.xplabs.interfaces.battle.IPlayerGroup;
	import me.xplabs.interfaces.common.IPlayerIdConvert;
	import me.xplabs.interfaces.room.IRoomManager;
	import me.xplabs.player.vo.PlayerInfo;
	import me.xplabs.room.model.vo.RoomMember;
	import me.xplabs.servers.battle.SCEnterBattle;
	import me.xplabs.servers.MsgCommand;
	import me.xplabs.servers.room.CSEnterBattle;
	import me.xplabs.utils.sendMsg;
	
	/**
	 * ...
	 * @author xiaohan
	 */
	public class CSEnterBattleCommand extends MsgCommand 
	{
		[Inject]
		public var roomManager:IRoomManager;
		[Inject]
		public var playerIdConvert:IPlayerIdConvert;
		public function CSEnterBattleCommand() 
		{
			super();
		}
		override public function execute():void 
		{
			super.execute();
			
			
			var battleManager:IBattleManager = new BattleManager();
			injector.mapValue(IBattleManager, battleManager);
			
			var cSEnterBattle:CSEnterBattle = baseMessage as CSEnterBattle;
			if (roomManager.isAllPrepare)
			{
				var members:Vector.<RoomMember> = roomManager.members;
				var playerGroup:IPlayerGroup = battleManager.playerGroup;
				var len:int = members.length;
				for (var i:int = 0; i < len; i++) 
				{
					var heroInfo:HeroInfo = playerGroup.addPlayer(members[i].memberId, members[i].memberName, members[i].camp);
					var sCEnterBattle:SCEnterBattle = new SCEnterBattle();
					sCEnterBattle.battleId = 1001;
					sCEnterBattle.heroInfo = heroInfo.clone();
					sendMsg(playerIdConvert.getClientId(heroInfo.heroId), sCEnterBattle);
				}
				
				
				
				
				//playerGroup.addPlayer
				
				//var sCEnterBattle:SCEnterBattle = new SCEnterBattle();
				//sCEnterBattle.battleId = 1001;
				//var heroInfo:HeroInfo = new HeroInfo();
				//var member:RoomMember = roomManager.roomMember;
				//heroInfo.heroName = member.memberName;
				//heroInfo.heroCamp = member.camp;
				//heroInfo.heroId = member.memberId;
				//heroInfo.x = 200;
				//heroInfo.y = 200;
				//heroInfo.resId = 1;
				
			}
			
		}
		
	}

}