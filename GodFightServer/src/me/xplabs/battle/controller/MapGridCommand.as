package me.xplabs.battle.controller 
{
	import me.xplabs.battle.model.MapGridActor;
	import me.xplabs.interfaces.battle.IMapGrid;
	import org.robotlegs.mvcs.Command;
	
	/**
	 * ...
	 * @author xiaohan
	 */
	public class MapGridCommand extends Command 
	{
		public function MapGridCommand() 
		{
			super();
			
		}
		
		override public function execute():void 
		{
			super.execute();
			
			var mapGrid:IMapGrid = new MapGridActor();
			mapGrid.mapSize(209, 209);
			injector.mapValue(IMapGrid, mapGrid);
			
		}
	}

}