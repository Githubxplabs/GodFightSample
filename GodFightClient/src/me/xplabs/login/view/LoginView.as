package me.xplabs.login.view 
{
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.textures.Texture;
	
	/**
	 * ...
	 * @author xiaohan
	 */
	public class LoginView extends Sprite
	{
		private var image:Image;
		public function LoginView() 
		{
			init();
		}
		
		private function init():void
		{
			image = new Image(Texture.fromBitmapData(new UILoginGround()));
			addChild(image);
			
		}
		
		
	}

}