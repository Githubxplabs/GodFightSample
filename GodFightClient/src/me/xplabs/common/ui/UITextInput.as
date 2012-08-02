package me.xplabs.common.ui 
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	
	/**
	 * ...
	 * @author xiaohan
	 */
	public class UITextInput extends Sprite 
	{
		private var _textField:TextField;
		public function UITextInput() 
		{
			super();
			_textField = new TextField();
			_textField.type = TextFieldType.INPUT;
			_textField.textColor = 0xFFFFFF;
			addChild(_textField);
		}
		public function get text():String
		{
			return _textField.text;
		}
		
		public function set text(value:String):void
		{
			_textField.text = value;
		}
		public function get displayAsPassword():Boolean
		{
			return _textField.displayAsPassword;
		}
		public function set displayAsPassword(value:Boolean):void
		{
			_textField.displayAsPassword = value;
		}
		public function setWH(pw:int = 0, ph:int = 0):void
		{
			if (pw != 0) _textField.width = pw;
			if (ph != 0) _textField.height = ph;
		}
		public function get maxChars():int
		{
			return _textField.maxChars;
		}
		public function set maxChars(value:int):void
		{
			_textField.maxChars = value;
		}
		


		
	}

}