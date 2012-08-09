package me.xplabs.room.view 
{
	import org.robotlegs.mvcs.Mediator;
	
	/**
	 * ...
	 * @author xiaohan
	 */
	public class RoomViewMediator extends Mediator 
	{
		[Inject]
		public var roomView:RoomView;
		public function RoomViewMediator() 
		{
			super();
			
		}
		override public function onRegister():void 
		{
			roomView.init();
		}
		override public function onRemove():void 
		{
		}
		
	}

}