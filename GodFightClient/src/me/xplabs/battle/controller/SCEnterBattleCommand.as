package me.xplabs.battle.controller 
{
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
			var sCEnterBattle:SCEnterBattle = baseMessage as SCEnterBattle;
		}
		
	}

}