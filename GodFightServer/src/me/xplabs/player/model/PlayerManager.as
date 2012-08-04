package me.xplabs.player.model 
{
	import flash.utils.Dictionary;
	import me.xplabs.constant.CampType;
	import me.xplabs.interfaces.account.IAccount;
	import me.xplabs.interfaces.account.IAccountManager;
	import me.xplabs.interfaces.common.IPlayerIdConvert;
	import me.xplabs.interfaces.player.IPlayer;
	import me.xplabs.interfaces.player.IPlayerManager;
	import me.xplabs.player.vo.PlayerInfo;
	import org.robotlegs.mvcs.Actor;
	
	/**
	 * 玩家管理器
	 * ...
	 * @author xiaohan
	 */
	public class PlayerManager extends Actor implements IPlayerManager
	{
		[Inject]
		public var accountManager:IAccountManager;
		[Inject]
		public var playerIdConvert:IPlayerIdConvert;
		private var _players:Vector.<IPlayer>;
		public function PlayerManager() 
		{
			super();
			_players = new Vector.<IPlayer>();
		}
		
		/**
		 * 获取一个玩家的信息
		 * @param	playerId 玩家的id
		 * @return
		 */		
		public function getPlayerByPlayerId(playerId:int):IPlayer 
		{
			var len:int = _players.length;
			for (var i:int = 0; i < len; i++) 
			{
				if (_players[i].playerId == playerId)
				{
					return _players[i];
				}
			}
			return null;
		}
		/**
		 * 添加一个玩家到管理器中
		 * @param	clientId 客户端id
		 * @return
		 */		
		public function addPlayer(clientId:String, userName:String):IPlayer 
		{
			var player:IPlayer = new PlayerInfo();
			player.clientId = clientId;
			var account:IAccount = accountManager.getAccountByUserName(userName);
			player.playerId = account.playerId;
			player.playerName = account.playerName;
			if (_players.length == 0) 
			{
				player.camp = CampType.HUANG_DI;
				player.houseOwner = true;
			}else
			{
				player.houseOwner = false;
				if (_players[0].camp == CampType.HUANG_DI)
				{
					player.camp = CampType.CHI_YOU;
				}else
				{
					player.camp = CampType.HUANG_DI;
				}
			}
			playerIdConvert.setId(clientId, player.playerId);
			_players[_players.length] = player;
			return player;
		}
		/**
		 * 设置玩家的阵营
		 * @param	playerId 玩家的id
		 * @param	camp 阵营类型，详情参见CampType.as
		 * @return
		 */		
		public function setCamp(playerId:int, camp:int):void 
		{
			getPlayerByPlayerId(playerId).camp = camp;
		}
		/**
		 * 提升玩家为房主
		 * @param	playerId 玩家的id
		 */		
		public function advanceHouseOwner(playerId:int):void 
		{
			
		}
		/**
		 * 删除一个玩家
		 * @param	playerId 玩家的id
		 * @return
		 */
		public function delPlayer(playerId:int):IPlayer 
		{
			var len:int = _players.length;
			for (var i:int = 0; i < len; i++) 
			{
				if (_players[i].playerId == playerId)
				{
					_players[i].dispose();
					return _players.splice(i, 1)[0];
				}
			}
			return null;
		}
		
	}

}