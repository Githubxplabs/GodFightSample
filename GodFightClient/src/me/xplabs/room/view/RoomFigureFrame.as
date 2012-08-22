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
	public class RoomFigureFrame extends Sprite 
	{
		private var _background:Image;
		private var _headIcon:Image;
		public function RoomFigureFrame() 
		{
			
		}
		public function show(texture:Texture):void
		{
			_background = new Image(texture);
			addChild(_background);
		}
		public function changeRole(texture:Texture):void
		{
			if (!_headIcon)
			{
				_headIcon = new Image(texture);
				addChild(_headIcon);
			}else
			{
				_headIcon.texture = texture;
			}
		}
		override public function dispose():void 
		{
			super.dispose();
			if (_background.parent) _background.parent.removeChild(_background);
			_background = null;
		}
	}

}