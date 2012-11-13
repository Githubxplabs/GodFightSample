package me.xplabs.isometric.iso 
{
	import flash.display.TriangleCulling;
	import flash.utils.Dictionary;
	import me.xplabs.isometric.astar.GridType;
	import me.xplabs.isometric.astar.IMapTileModel;
	import me.xplabs.isometric.constant.WorldConst;
	import me.xplabs.isometric.interfance.IIsoLayer;
	import me.xplabs.isometric.interfance.IIsoObject;
	import me.xplabs.isometric.interfance.IIsoTile;
	import me.xplabs.isometric.interfance.IIsoWorld;

	/**
	 * 等角世界类
	 * ...
	 * @author xiaohan
	 */
	public class IsoWorld implements IIsoWorld, IMapTileModel
	{
		private var _grid:Vector.<Vector.<IIsoTile>>;
		private var _tileW:int;
		private var _tileH:int;
		private var _layers:Dictionary;
		private var _rows:int;
		private var _cols:int;
		private var _heuristicType:uint;
		public function IsoWorld(rows:int, cols:int, grids:Vector.<Vector.<IIsoTile>>) 
		{
			worldSize(rows, cols);
			_grid = grids;
		}
		/**
		 * 地图的规格大小
		 * @param	rows x轴向地图格子总数
		 * @param	cols y轴向地图格子总数
		 */		
		private function worldSize(rows:int, cols:int):void 
		{
			_tileW = WorldConst.tileW;
			_tileH = WorldConst.tileH;
			_rows = rows;
			_cols = cols;
			if (!_layers) _layers = new Dictionary();
			else for (var name:String in _layers) delete _layers[name];
			/*if (!_grid) _grid = new Vector.<Vector.<IIsoTile>>();
			else _grid.length = 0;
			for (var i:int = 0; i < cols; i++) 
			{
				_grid[i] = new Vector.<IIsoTile>();
				for (var j:int = 0; j < rows; j++) 
				{
					var tile:IIsoTile = new IsoTile();
					tile.row = i;
					tile.col = j;
					_grid[i][j] = tile;
				}
			}*/
		}
		/**
		 * 添加对象到等角世界中
		 * @param	isoObject 需要被添加的等角对象
		 */
		public function addChildToWorld(isoObject:IIsoObject):void 
		{
			var tile:IIsoTile = getTile(isoObject.row, isoObject.col);
			if (!tile) return;
			isoObject.pointAddObservers(updatePositionHandler);
			tile.addItem(isoObject);
			var tempLayer:IIsoLayer = _layers[isoObject.layerType];
			if (!tempLayer)
			{
				throw new Error("此对象的层级没有注册，请先注册对应的IIsoLayer");
				return;
			}
			tempLayer.addChild(isoObject);
		} 
		/**
		 * 更新等角对象的格子索引
		 * @param	isoObject
		 */
		private function updatePositionHandler(isoObject:IIsoObject):void 
		{
			if (isoObject.prevCol == isoObject.col && isoObject.prevRow == isoObject.row) return;
			var tile:IIsoTile = getTile(isoObject.prevRow, isoObject.prevCol);
			tile.removeItem(isoObject);
			tile = getTile(isoObject.row, isoObject.col);
			tile.addItem(isoObject);
			
		}
		/**
		 * 从等角世界中删除对象
		 * @param	isoObject 需要被删除的等角对象
		 */
		public function removeChildByWorld(isoObject:IIsoObject):void 
		{
			var tile:IIsoTile = getTile(isoObject.row, isoObject.col);
			if (!tile) return;
			isoObject.pointDelObjservers(updatePositionHandler);
			tile.removeItem(isoObject);
			var tempLayer:IIsoLayer = _layers[isoObject.layerType];
			if (!tempLayer)
			{
				throw new Error("此对象的层级没有注册，请先注册IIsoLayer");
				return;
			}
			tempLayer.removeChild(isoObject);
		}
		/**
		 * 注册等角世界层级
		 * @param	ptype 层级的类型，可自定义类型
		 * @param	layer 需要被注册的层级
		 */		
		public function registerLayer(ptype:int, layer:IIsoLayer):void 
		{
			_layers[ptype] = layer;
		}
		/**
		 * 移除等角世界层级
		 * @param	ptype 层级的类型，可自定义类型
		 * @param	layer 需要被删除的层级
		 */		
		public function removeLayer(ptype:int, layer:IIsoLayer):void
		{
			_layers[ptype] = null;
		}
		/**
		 * 对层级内的等角对象进行排序
		 * @param	ptype 需要被排序的层级
		 */		
		public function sort(ptype:int = 0):void 
		{
			(_layers[ptype] as IIsoLayer).sort();
		}
		/**
		 * 根据索引获取地图区块
		 * @param	row x轴向的格子索引
		 * @param	col z轴向的各自索引
		 * @return
		 */		
		public function getTile(row:int, col:int):IIsoTile
		{
			var tile:IIsoTile = _grid[row][col];
			return tile;
			
		}
		/**
		 * 是否为障碍
		 * @param p_startX	始点X坐标
		 * @param p_startY	始点Y坐标
		 * @param p_endX	终点X坐标
		 * @param p_endY	终点Y坐标
		 * @return			0为障碍 1为通路
		 */		
		public function isBlock(p_startX:int, p_startY:int, p_endX:int, p_endY:int):int 
		{
			if (p_endX < 0 || p_endY < 0 || p_endX > _cols - 1 || p_endY > _rows - 1) return  GridType.UNABEL;
			return getTile(p_endX, p_endY).walkable?GridType.ABLE:GridType.UNABEL;
		}
		/**
		 * 启发函数类型，常量定义参见AstarHeuristic.as
		 */		
		public function get heuristicType():int 
		{
			return _heuristicType;
		}
		public function set heuristicType(value:int):void 
		{
			_heuristicType = value;
		}
		
	}

}