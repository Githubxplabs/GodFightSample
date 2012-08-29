package me.xplabs.room.view 
{
	import flash.display.BitmapData;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.text.TextField;
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
		private var _titleText:TextField;
		public function RoomFigureFrame() 
		{
			
		}
		public function show(texture:Texture):void
		{
			_background = new Image(texture);
			addChild(_background);
			
			_headIcon = new Image(Texture.fromBitmapData(new RoomHead_1()));
			_headIcon.x = 8;
			_headIcon.y = 10;
			addChild(_headIcon);
			
			_titleText = new TextField(100, 30, "未知");
			_titleText.color = 0xF2AB40;
			_titleText.bold = true;
			_titleText.fontSize = 16;
			_titleText.x = (_background.width - _titleText.width) * .5;
			_titleText.y = 225;
			addChild(_titleText);
		}
		public function changeRole(texture:Texture):void
		{
			_headIcon.texture = texture;
		}
		public function changeTitle(title:String):void
		{
			_titleText.text = title;
		}
		override public function dispose():void 
		{
			super.dispose();
			if (_background.parent) _background.parent.removeChild(_background);
			if (_titleText.parent) _titleText.parent.removeChild(_titleText);
			if (_headIcon && _headIcon.parent) _headIcon.parent.removeChild(_headIcon);
			_background = null;
		}
	}

}