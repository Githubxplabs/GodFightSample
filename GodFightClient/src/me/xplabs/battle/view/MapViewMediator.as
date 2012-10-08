package me.xplabs.battle.view 
{
	import me.xplabs.battle.events.MapMoveEvent;
	import org.robotlegs.mvcs.Mediator;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	
	/**
	 * ...
	 * @author xiaohan
	 */
	public class MapViewMediator extends Mediator 
	{
		[Inject]
		public var mapView:MapView;
		public function MapViewMediator() 
		{
			
		}
		
		override public function onRegister():void 
		{
			super.onRegister();
			
			mapView.init(); 
			
			//addContextListener(MapMoveEvent.LEFT_MOVE, leftMoveHandler, MapMoveEvent);
			//addContextListener(MapMoveEvent.RIGHT_MOVE, rightMoveHandler, MapMoveEvent);
			//addContextListener(MapMoveEvent.UP_MOVE, upMoveHandler, MapMoveEvent);
			//addContextListener(MapMoveEvent.DOWN_MOVE, downMoveHandler, MapMoveEvent);
			//addContextListener(MapMoveEvent.STOP_MOVE, stopMoveHandler, MapMoveEvent);
			
			eventMap.mapListener(mapView, TouchEvent.TOUCH, touchEventHandler);
			
		}
		
		private function touchEventHandler(e:TouchEvent):void 
		{
			var touch:Touch = e.getTouch(mapView);
			if (!touch) return;
			trace(touch.phase);
		}
		
		private function stopMoveHandler(e:MapMoveEvent):void 
		{
			
		}
		
		private function downMoveHandler(e:MapMoveEvent):void 
		{
			
		}
		
		private function upMoveHandler(e:MapMoveEvent):void 
		{
			
		}
		
		private function rightMoveHandler(e:MapMoveEvent):void 
		{
			
		}
		
		private function leftMoveHandler(e:MapMoveEvent):void 
		{
			
		}
		
		override public function onRemove():void 
		{
			super.onRemove();
		}
	}

}