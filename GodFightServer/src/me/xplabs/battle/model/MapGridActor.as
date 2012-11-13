package me.xplabs.battle.model 
{
	import flash.geom.Point;
	import flash.utils.ByteArray;
	import me.xplabs.isometric.interfance.IIsoTile;
	import me.xplabs.interfaces.battle.IMapGrid;
	import me.xplabs.isometric.interfance.IIsoLayer;
	import me.xplabs.isometric.interfance.IIsoObject;
	import me.xplabs.isometric.interfance.IIsoWorld;
	import me.xplabs.isometric.iso.IsoTile;
	import me.xplabs.isometric.iso.IsoWorld;
	import org.robotlegs.mvcs.Actor;
	
	/**
	 * ...
	 * @author xiaohan
	 */
	public class MapGridActor extends Actor implements IMapGrid 
	{
		private var _isoWorld:IIsoWorld;
		public function MapGridActor() 
		{
			super();
			
		}
		
		/* INTERFACE me.xplabs.interfaces.battle.IMapGrid */
		
		public function mapSize(mapInfo:ByteArray):void 
		{
			/*
			var grids:Vector.<Vector.<IIsoTile>> = new Vector.<Vector.<IIsoTile>>();
			var rows:int = 209;
			var cols:int = 209;
			var up_leftPt:Point = new Point();
			var up_rightPt:Point = ;
			var down_leftPt:Point = ;
			var down_rightPt:Point = ;
			for (var i:int = 0; i < cols; i++) 
			{
				grids[i] = new Vector.<IIsoTile>();
				for (var j:int = 0; j < rows; j++) 
				{
					if(i
					var tile:IIsoTile = new IsoTile();
					tile.row = i;
					tile.col = j;
					grids[i][j] = tile;
				}
			}*/
			//_isoWorld = new IsoWorld(mapInfo.rows, mapInfo.cols);
		}
		
		public function addChildToWorld(isoObject:IIsoObject):void 
		{
			
		}
		
		public function removeChildByWorld(isoObject:IIsoObject):void 
		{
			
		}
		
		public function registerLayer(ptype:int, layer:IIsoLayer):void 
		{
			
		}
		
		public function removeLayer(ptype:int, layer:IIsoLayer):void 
		{
			
		}
		
		public function sort(ptype:int = 0):void 
		{
			
		}
		
		public function getTile(row:int, col:int):IIsoTile 
		{
			
		}
		
	}

}