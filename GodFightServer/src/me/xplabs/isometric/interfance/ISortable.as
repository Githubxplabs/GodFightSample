package me.xplabs.isometric.interfance 
{
	
	/**
	 * 排序接口
	 * ...
	 * @author xiaohan
	 */
	public interface ISortable 
	{
		/**
		 * z轴向的格子索引
		 */
		function get col():int;
		function set col(value:int):void;
		/**
		 * x轴向的格子索引
		 */
		function get row():int;
		function set row(value:int):void;
		/**
		 * z轴向所占的格子数量
		 */
		function get cols():int;
		function set cols(value:int):void;
		/**
		 * x轴向所占的格子数量
		 */
		function get rows():int;
		function set rows(value:int):void;
	}
	
}