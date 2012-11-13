package me.xplabs.isometric.iso 
{
	import flash.utils.Dictionary;
	import me.xplabs.isometric.interfance.IIsoObject;
	import me.xplabs.isometric.interfance.IIsoTile;
	/**
	 * ...
	 * @author xiaohan
	 */
	public class IsoTile implements IIsoTile 
	{
		private var _col:int;
		private var _row:int;
		private var _walkable:Boolean;
		private var _itemsDict:Dictionary;
		
		public function IsoTile() 
		{
		}
		
		/**
		 * 获取一种类型的等角对象
		 * @param	ptype 等角对象的类型，可自定义类型常量
		 * @return 返回等角对象的列表集合
		 */		
		public function isoObjects(ptype:int):Vector.<IIsoObject> 
		{
			return _itemsDict[ptype];
		}
		/**
		 * 添加等角对象到区块中
		 * @param	isoObject 需要被添加的等角对象
		 */		
		public function addItem(isoObject:IIsoObject):void
		{
			if (!_itemsDict) _itemsDict = new Dictionary();
			var items:Vector.<IIsoObject> = _itemsDict[isoObject.layerType];
			if (!items)
			{
				items = new Vector.<IIsoObject>();
				_itemsDict[isoObject.layerType] = items;
			}
			items[items.length] = isoObject;
		}
		/**
		 * 从区块中移除等角对象
		 * @param	isoObject
		 */		
		public function removeItem(isoObject:IIsoObject):void 
		{
			var items:Vector.<IIsoObject> = _itemsDict[isoObject.layerType];
			if (!items) return;
			var len:int = items.length;
			for (var i:int = 0; i < len; i++) 
			{
				if (items[i] == isoObject)
				{
					items.splice(i, 0);
					break;
				}
			}
		}
		/**
		 * 是否为障碍
		 */		
		public function get walkable():Boolean 
		{
			if (!_itemsDict || !_walkable) return _walkable;
			for each (var items: Vector.<IIsoObject> in _itemsDict) 
			{
				var len:int = items.length;
				for (var i:int = 0; i < len; i++) 
				{
					if (!items[i].walkable) return false;
				}
			}
			return _walkable;
		}
		
		public function set walkable(value:Boolean):void 
		{
			_walkable = value;
		}
		/**
		 * z轴向的坐标索引
		 */		
		public function get col():int 
		{
			return _col;
		}
		
		public function set col(value:int):void 
		{
			_col = value;
		}
		/**
		 * x轴向的坐标索引
		 */		
		public function get row():int 
		{
			return _row;
		}
		
		public function set row(value:int):void 
		{
			_row = value;
		}
		
	}

}