package me.xplabs.interfaces.battle 
{
	import me.xplabs.isometric.interfance.IIsoWorld;
	
	/**
	 * ...
	 * @author xiaohan
	 */
	public interface IMapGrid extends IIsoWorld 
	{
		function mapSize(rows:int, cols:int):void;
		
	}
}