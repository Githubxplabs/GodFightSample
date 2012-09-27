package me.xplabs.servers.battle 
{
	import me.xplabs.battle.model.HeroInfo;
	import me.xplabs.servers.BaseMessage;
	import me.xplabs.servers.MessageType;
	
	/**
	 * 给客户端发送进入战斗场景的消息
	 * ...
	 * @author xiaohan
	 */
	public class SCEnterBattle extends BaseMessage 
	{
		/**  战场的Id*/
		public var battleId:int;
		/** 玩家英雄的信息*/
		public var heroInfo:HeroInfo;
		
		public function SCEnterBattle() 
		{
			
		}
		override public function get type():int 
		{
			return MessageType.SC_ENTER_BATTLE;
		}
		override public function write():void 
		{
			writeInt(battleId);
			writeInt(heroInfo.resId);
			writeInt(heroInfo.heroId);
			writeInt(heroInfo.heroCamp);
			writeDouble(heroInfo.x);
			writeDouble(heroInfo.y);
			writeString(heroInfo.heroName);
		}
		override public function read():void 
		{
			battleId = readInt();
			heroInfo = new HeroInfo();
			heroInfo.resId = readInt();
			heroInfo.heroId = readInt();
			heroInfo.heroCamp = readInt();
			heroInfo.x = readDouble();
			heroInfo.y = readDouble();
			heroInfo.heroName = readString();
		}
	}

}