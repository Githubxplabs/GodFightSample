package me.xplabs.isometric.interfance 
{
	
	/**
	 * ...
	 * @author xiaohan
	 */
	public interface IIsoTile
	{
		/**
		 * 添加等角对象到区块中
		 * @param	isoObject 需要被添加的等角对象
		 */
		function addItem(isoObject:IIsoObject):void;
		/**
		 * 从区块中移除等角对象
		 * @param	isoObject
		 */
		function removeItem(isoObject:IIsoObject):void;
		/**
		 * 获取一种类型的等角对象
		 * @param	ptype 等角对象的类型，可自定义类型常量
		 * @return 返回等角对象的列表集合
		 */
		function isoObjects(ptype:int):Vector.<IIsoObject>;
		/**
		 * z轴向的坐标索引
		 */
		function get col():int;
		function set col(value:int):void;
		/**
		 * x轴向的坐标索引
		 */
		function get row():int;
		function set row(value:int):void;
		/**
		 * 是否为障碍
		 */
		function get walkable():Boolean;
		function set walkable(value:Boolean):void;
	}
	
}