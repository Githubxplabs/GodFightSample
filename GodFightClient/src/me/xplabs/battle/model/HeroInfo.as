package me.xplabs.battle.model 
{
	/**
	 * 英雄的基本信息
	 * ...
	 * @author xiaohan
	 */
	public class HeroInfo 
	{
		
		public var heroId:int;
		public var heroName:String;
		public var heroCamp:int;
		public var x:Number;
		public var y:Number;
		public var resId:int;
		
		public function HeroInfo() 
		{
			
		}
		
		public function clone():HeroInfo
		{
			var heroInfo:HeroInfo = new HeroInfo();
			for (var name:String in this)
			{
				heroInfo[name] = this[name];
			}
			return heroInfo;
		}
	}

}