package me.xplabs.battle.view 
{
	import flash.display.BitmapData;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.textures.Texture;
	
	/**
	 * 地图视图
	 * ...
	 * @author xiaohan
	 */
	public class MapView extends Sprite 
	{
		private var _bitmapData:BitmapData;
		private var _image:Image;
		public function MapView() 
		{
		}
		
		public function init():void
		{
			_bitmapData = new BitmapData();
			//for (var i:int = 0; i < ; i++) 
			//{
				//
			//}
			
			_image = new Image(Texture.fromBitmapData(_bitmapData));
			_image.texture.
			addChild(_image);
		}
		
	}

}