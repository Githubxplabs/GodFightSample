package me.xplabs.login.view 
{
	import me.xplabs.common.ui.UIButton;
	import me.xplabs.common.ui.UITextInput;
	import me.xplabs.login.events.LoginEvent;
	import me.xplabs.login.model.vo.AccountVO;
	import starling.core.Starling;
	import starling.display.DisplayObject;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.textures.Texture;
	
	/**
	 * 登陆界面View
	 * ...
	 * @author xiaohan
	 */
	public class LoginView extends Sprite
	{
		private var image:Image;
		private var _userNameInput:UITextInput;
		private var _passWordInput:UITextInput;
		private var _enterGameBtn:UIButton;
		public function LoginView() 
		{
		}
		
		public function init():void
		{
			image = new Image(Texture.fromBitmapData(new UILoginGround()));
			addChild(image);
			
			_userNameInput = new UITextInput();
			_userNameInput.text = "韩贤明";
			_userNameInput.x = 599;
			_userNameInput.y = 658;
			_userNameInput.setWH(161);
			_userNameInput.maxChars = 12;
			Starling.current.nativeStage.addChild(_userNameInput);
			
			_passWordInput = new UITextInput();
			_passWordInput.text = "123456";
			_passWordInput.x = 599;
			_passWordInput.y = 697;
			_passWordInput.setWH(161);
			_passWordInput.maxChars = 18;
			_passWordInput.displayAsPassword = true;
			Starling.current.nativeStage.addChild(_passWordInput);
			
			_enterGameBtn = new UIButton(Texture.fromBitmapData(new UIEnterGame_UP()), "", Texture.fromBitmapData(new UIEnterGame_DOWN()), Texture.fromBitmapData(new UIEnterGame_OVER()));
			_enterGameBtn.x = 798;
			_enterGameBtn.y = 670;
			addChild(_enterGameBtn);
			//_enterGameBtn.addEventListener(TouchEvent.TOUCH, touchEventHandler);
			_enterGameBtn.addEventListener(Event.TRIGGERED, touchEventHandler);
			
		}
		
		private function touchEventHandler(e:Event):void 
		{
			dispatchEvent(new LoginEvent(LoginEvent.CLICK_ENTER_GAME, false, new AccountVO(_userNameInput.text, _passWordInput.text)));
		}
		override public function dispose():void 
		{
			super.dispose();
		}
		
	}

}