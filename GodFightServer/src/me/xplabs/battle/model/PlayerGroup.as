package me.xplabs.battle.model 
{
	import me.xplabs.interfaces.battle.IPlayerGroup;
	/**
	 * ...
	 * @author xiaohan
	 */
	public class PlayerGroup implements IPlayerGroup 
	{
		private var _players:Vector.<HeroInfo>;
		
		public function PlayerGroup() 
		{
			_players = new Vector.<HeroInfo>();
		}
		
		/* INTERFACE me.xplabs.interfaces.battle.IPlayerGroup */
		
		public function addPlayer(playerId:int, playerName:String, playerCamp:int):HeroInfo 
		{
			var heroInfo:HeroInfo = new HeroInfo();
			heroInfo.heroId = playerId;
			heroInfo.heroName = playerName;
			heroInfo.heroCamp = playerCamp;
			heroInfo.x = 200;
			heroInfo.y = 200;
			heroInfo.resId = 1;
			_players[_players.length] = heroInfo;
			return heroInfo;
		}
		
		public function delPlayer(playerId:int):void 
		{
			
		}
		
		public function get players():Vector.<HeroInfo> 
		{
			return _players;
		}
		
		public function player(playerId:int):HeroInfo 
		{
			return null;
		}
		
		public function dispose():void 
		{
			
		}
		
	}

}