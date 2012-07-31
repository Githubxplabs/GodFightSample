package me.xplabs.interfaces.mouse 
{
	
	/**
	 * 鼠标样式管理
	 * ...
	 * @author xiaohan
	 */
	public interface IMouse 
	{
		/**
		 * 获取当前鼠标的样式类型，鼠标样式参见MouseType.as
		 */
		function get mosueType():String;
		/**
		 * 切换游戏鼠标的样式，鼠标样式参见MouseType.as
		 * @param	ptype 参见MouseType
		 */
		function changeMouseType(ptype : String):void;
	}
	
}