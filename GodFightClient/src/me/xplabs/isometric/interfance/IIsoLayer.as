package me.xplabs.isometric.interfance 
{
	
	/**
	 * ...
	 * @author xiaohan
	 */
	public interface IIsoLayer 
	{
		/**
		 * 对层级内的等角对象进行排序
		 */
		function sort():void;
		/**
		 * 添加对象到层
		 * @param	isoObject 需要被添加的等角对象
		 */
		function addChild(isoObject:IIsoObject):void;
		/**
		 * 从层中删除
		 * @param	isoObject 需要被删除的等角对象 
		 */
		function removeChild(isoObject:IIsoObject):void;
	}
	
}