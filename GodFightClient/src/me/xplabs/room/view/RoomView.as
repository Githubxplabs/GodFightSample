package me.xplabs.room.view 
{
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.textures.Texture;
	
	/**
	 * 房间场景
	 * ...
	 * @author xiaohan
 	 */
	public class RoomView extends Sprite 
	{
		private var _backGround:Image;
		private var _huangDiSymbol:Image;
		private var _chiYouSymbol:Image;
		public function RoomView() 
		{
			super();
			
		}
		
		public function init():void
		{
			_backGround = new Image(Texture.fromBitmapData(new RoomBackground()));
			addChild(_backGround);
			
			_huangDiSymbol = new Image(Texture.fromBitmapData(new RoomHuangDi()));
			_huangDiSymbol.x = 30;
			_huangDiSymbol.y = 135;
			addChild(_huangDiSymbol);
			
			_chiYouSymbol = new Image(Texture.fromBitmapData(new RoomChiYou()));
			_chiYouSymbol.x = 30;
			_chiYouSymbol.y = 425;
			addChild(_chiYouSymbol);
			
			
			
		}
		override public function dispose():void 
		{
			super.dispose();
		}
	}

}