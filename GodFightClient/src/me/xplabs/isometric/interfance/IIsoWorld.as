package me.xplabs.isometric.interfance 
{
	
	/**
	 * ...
	 * @author xiaohan
	 */
	public interface IIsoWorld 
	{
		/**
		 * 地图的规格大小
		 * @param	rows x轴向地图格子总数
		 * @param	cols y轴向地图格子总数
		 */
		//function worldSize(rows:int, cols:int):void;
		/**
		 * 添加对象到等角世界中
		 * @param	isoObject
		 */
		function addChildToWorld(isoObject:IIsoObject):void;
		/**
		 * 从等角世界中删除对象
		 * @param	isoObject
		 */
		function removeChildByWorld(isoObject:IIsoObject):void;
		/**
		 * 注册等角世界层级
		 * @param	ptype
		 * @param	layer
		 */
		function registerLayer(ptype:int, layer:IIsoLayer):void;
		/**
		 * 移除等角世界层级
		 * @param	ptype
		 * @param	layer
		 */
		function removeLayer(ptype:int, layer:IIsoLayer):void;
		/**
		 * 排序
		 * @param	ptype
		 */
		function sort(ptype:int = 0):void;
		/**
		 * 根据索引获取地图区块
		 * @param	row
		 * @param	col
		 * @return
		 */
		function getTile(row:int, col:int):IIsoTile;
	}
}