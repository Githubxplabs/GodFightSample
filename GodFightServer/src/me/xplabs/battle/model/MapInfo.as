package me.xplabs.battle.model 
{
	import flash.geom.Point;
	import flash.utils.ByteArray;
	/**
	 * 地图基本信息
	 * ...
	 * @author xiaohan
	 */
	public class MapInfo 
	{
		public var rows:int;
		public var cols:int;
		public var up_leftPt:Point;
		public var up_rightPt:Point;
		public var down_leftPt:Point;
		public var down_rightPt:Point;
		public var mapBytes:ByteArray;
		public function MapInfo() 
		{
			
		}
		
	}

}