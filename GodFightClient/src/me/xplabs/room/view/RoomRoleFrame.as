package me.xplabs.room.view 
{
	import flash.display.BitmapData;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.textures.Texture;
	
	/**
	 * 房间系统人物框
	 * ...
	 * @author xiaohan
	 */
	public class RoomRoleFrame extends Sprite 
	{
		private var _background:Image;
		public function RoomRoleFrame() 
		{
			
		}
		public function show(texture:Texture):void
		{
			_background = new Image(texture);
			addChild(_background);
		}
		public function changeRole():void
		{
			
		}
		override public function dispose():void 
		{
			super.dispose();
			if (_background.parent) _background.parent.removeChild(_background);
			_background = null;
		}
	}

}