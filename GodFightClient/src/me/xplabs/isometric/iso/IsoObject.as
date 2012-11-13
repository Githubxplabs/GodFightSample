package me.xplabs.isometric.iso 
{
	import me.xplabs.isometric.gemo.Point3D;
	import me.xplabs.isometric.interfance.IIsoObject;
	
	/**
	 * ...
	 * @author xiaohan
	 */
	public class IsoObject implements IIsoObject 
	{
		private var _x:int;
		private var _y:int;
		private var _z:int;
		private var _point3d:Point3D;
		private var _walkable:Boolean;
		private var _objType:int;
		private var _layerType:int;
		private var _col:int;
		private var _row:int;
		private var _cols:int;
		private var _rows:int;
		private var _prevCol:int;
		private var _prevRow:int;
		private var _displayObject:Object;
		/**
		 * 等角对象的构造函数
		 * @param	pLayerType 显示层的类型，可自定义显示层级类型
		 * @param	pDisplayObject 需要被添加到显示列表中的先是对象
		 */
		public function IsoObject(pLayerType:int, pDisplayObject:Object)
		{
			_layerType = pLayerType;
			_displayObject = pDisplayObject;
		}
		
		/* INTERFACE me.xplabs.interfance.IIsoObject */
		/**
		 * x轴向的3d坐标
		 */		
		public function get x():Number 
		{
			return _x;
		}
		public function set x(value:Number):void 
		{
			_x = value;
		}
	   /**
		* y轴线的3d坐标
		*/
		public function get y():Number 
		{
			return _y;
		}
	
		public function set y(value:Number):void 
		{
			_y = value;
		}
		
	   /**
		* z轴线的3d坐标
		*/
		public function get z():Number 
		{
			return _z;
		}
		
		public function set z(value:Number):void 
		{
			_z = value;
		}
		/**
		 * 3d坐标点
		 */		
		public function get point3d():Point3D 
		{
			return _point3d;
		}
		
		public function set point3d(value:Point3D):void 
		{
			_point3d = value;
		}
		/**
		 * 是否为障碍
		 */		
		public function get walkable():Boolean 
		{
			return _walkable;
		}
		
		public function set walkable(value:Boolean):void 
		{
			_walkable = value;
		}
		/**
		 * 地图区块元素类型
		 */		
		public function get objType():int 
		{
			return _objType;
		}
		
		public function set objType(value:int):void 
		{
			_objType = value;
		}
		/**
		 * 坐标点发生变化的回调
		 * @param	call 需要被回调的函数
		 */
		public function pointAddObservers(call:Function):void 
		{
			
		}
		
		public function pointDelObjservers(call:Function):void 
		{
			
		}
		
		
	   /**
		* 显示对象，指定的显示对象必须包含父级属性parent
		*/
		public function get displayObject():Object 
		{
			return _displayObject;
		}
		public function set displayObject(value:Object):void 
		{
			if (!value.hasOwnProperty("parent"))
			{
				throw new Error("指定的显示对象必须包含父级属性parent");
				
			}
			_displayObject = value;
			
		}
		
	   /**
		* 层级类型
		*/		
	   public function get layerType():int 
	   {
		   return _layerType;
	   }
	   
	   public function set layerType(value:int):void 
	   {
		   _layerType = value;
	   }
	   /**
		* 上次的横向格子索引
		*/		
	   public function get prevRow():int 
	   {
		   return _prevRow;
	   }
	   
	   public function set prevRow(value:int):void 
	   {
		   _prevRow = value;
	   }
	   /**
		* 上次的纵向格子索引 
		*/		
	   public function get prevCol():int 
	   {
		   return _prevCol;
	   }
	   
	   public function set prevCol(value:int):void 
	   {
		   _prevCol = value;
	   }
		/**
		 * z轴向的格子索引
		 */	   
		public function set col(value:int):void 
		{
			_col = value;
		}
		public function get col():int 
		{
			return _col;
		}
		/**
		 * x轴向的格子索引
		 */		
		public function set row(value:int):void 
		{
			_row = value;
		}
		
		public function get row():int 
		{
			return _row;
		}
		/**
		 * z轴向所占的格子数量
		 */		
		public function get cols():int 
		{
			return _cols;
		}
		public function set cols(value:int):void 
		{
			_cols = value;
		}
		/**
		 * x轴向所占的格子数量
		 */		
		public function get rows():int 
		{
			return _rows;
		}
		public function set rows(value:int):void 
		{
			_rows = value;
		}
		
	}

}