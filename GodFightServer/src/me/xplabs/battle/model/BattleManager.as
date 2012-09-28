package me.xplabs.battle.model 
{
	import me.xplabs.interfaces.battle.IBattleManager;
	import me.xplabs.interfaces.battle.IPlayerGroup;
	import org.robotlegs.mvcs.Actor;
	
	/**
	 * ...
	 * @author xiaohan
	 */
	public class BattleManager implements IBattleManager
	{
		private var _players:Vector.<HeroInfo>;
		private var _playerGroup:IPlayerGroup;
		public function BattleManager() 
		{
			init();
		}
		public function init():void
		{
			_playerGroup = new PlayerGroup();
		}
		
		/* INTERFACE me.xplabs.interfaces.battle.IBattleManager */
		
		public function get playerGroup():IPlayerGroup 
		{
			return _playerGroup;
		}
		
	}

}