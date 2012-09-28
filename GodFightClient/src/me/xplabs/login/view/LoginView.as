package me.xplabs.login.view 
{
	import flash.display.BitmapData;
	import flash.utils.describeType;
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;
	import flash.utils.getQualifiedSuperclassName;
	import me.xplabs.common.ui.UIButton;
	import me.xplabs.common.ui.UITextInput;
	import me.xplabs.interfaces.resource.ILibrary;
	import me.xplabs.login.events.LoginEvent;
	import me.xplabs.login.model.vo.AccountVO;
	import me.xplabs.resource.Library;
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
		private var _loginFrame:Image;
		private var _userNameInput:UITextInput;
		private var _passWordInput:UITextInput;
		private var _enterGameBtn:UIButton;
		public function LoginView() 
		{
		}
		
		public function init():void
		{
			image = new Image(Texture.fromBitmapData(Library.library.getBitmapDataByName( "UILoginGround", false)));
			addChild(image);
			
			_loginFrame = new Image(Texture.fromBitmapData(Library.library.getBitmapDataByName("UILoginFrame", false)));
			_loginFrame.x = 50;
			_loginFrame.y = 400;
			addChild(_loginFrame);
			
			_userNameInput = new UITextInput();
			_userNameInput.text = "hanxianming";
			_userNameInput.x = 177;
			_userNameInput.y = 477;
			_userNameInput.setWH(161);
			_userNameInput.maxChars = 12;
			Starling.current.nativeStage.addChild(_userNameInput);
			
			_passWordInput = new UITextInput();
			_passWordInput.text = "123456789";
			_passWordInput.x = 177;
			_passWordInput.y = 553;
			_passWordInput.setWH(161);
			_passWordInput.maxChars = 18;
			_passWordInput.displayAsPassword = true;
			Starling.current.nativeStage.addChild(_passWordInput);
			
			_enterGameBtn = new UIButton(Texture.fromBitmapData(Library.library.getBitmapDataByName("UIEnterGame_UP", false)), "", Texture.fromBitmapData(Library.library.getBitmapDataByName( "UIEnterGame_DOWN", false)), Texture.fromBitmapData(Library.library.getBitmapDataByName( "UIEnterGame_OVER", false)));
			//_enterGameBtn = new Button(Texture.fromBitmapData(new UIEnterGame_UP()), "", Texture.fromBitmapData(new UIEnterGame_DOWN()));
			_enterGameBtn.x = 390;
			_enterGameBtn.y = 470;
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
			if (image.parent) image.parent.removeChild(image);
			if (_loginFrame.parent) _loginFrame.parent.removeChild(_loginFrame);
			if (_userNameInput.parent) _userNameInput.parent.removeChild(_userNameInput);
			if (_passWordInput.parent) _passWordInput.parent.removeChild(_passWordInput);
			_enterGameBtn.removeEventListeners();
			image = null;
			_loginFrame = null;
			_userNameInput = null;
			_passWordInput = null;
			_enterGameBtn = null;
			super.dispose();
		}
		
	}

}