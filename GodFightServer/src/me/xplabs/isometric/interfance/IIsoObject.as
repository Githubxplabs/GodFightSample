package me.xplabs.isometric.interfance 
{
	import me.xplabs.isometric.gemo.Point3D;
	
	/**
	 * ...
	 * @author xiaohan
	 */
	public interface IIsoObject extends ISortable
	{
		/**
		 * x轴向的3d坐标
		 */
		function get x():Number;
		function set x(value:Number):void;
		/**
		 * y轴线的3d坐标
		 */
		function get y():Number;
		function set y(value:Number):void;
		/**
		 * z轴线的3d坐标
		 */
		function get z():Number;
		function set z(value:Number):void;
		/**
		 * 3d坐标点
		 */
		function get point3d():Point3D;
		function set point3d(value:Point3D):void;
		/**
		 * 是否为障碍
		 */
		function get walkable():Boolean;
		function set walkable(value:Boolean):void;
		/**
		 * 地图区块元素类型
		 */
		function get objType():int;
		function set objType(value:int):void;
		/**
		 * observers
		 */
		function pointAddObservers(call:Function):void;
		function pointDelObjservers(call:Function):void;
		/**
		 * 上次的横向格子索引
		 */
		function get prevRow():int;
		function set prevRow(value:int):void;
		/**
		 * 上次的纵向格子索引 
		 */
		function get prevCol():int;
		function set prevCol(value:int):void;
		/**
		 * 层级类型
		 */
		function get layerType():int;
		function set layerType(value:int):void;
		/**
		 * 显示对象，指定的显示对象必须包含父级属性parent
		 */
		function get displayObject():Object;
		function set displayObject(value:Object):void;
		
	}
	
}