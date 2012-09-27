package me.xplabs.net.view {
	import me.xplabs.net.events.ServerEvent;

	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldType;

	[Event(name = "bindClick", type = "me.xplabs.net.events.ServerEvent")]
	[Event(name = "sendClick", type = "me.xplabs.net.events.ServerEvent")]
	/**
	 * ...
	 * @author xiaohan
	 */
	public class BindServerView extends Sprite {
		private var localIP : TextField;
		private var localPort : TextField;
		private var logField : TextField;
		private var message : TextField;

		public function BindServerView() {
		}

		public function get port() : int {
			return int(localPort.text);
		}

		public function get adress() : String {
			return localIP.text;
		}

		public function setupUI() : void {
			localIP = createTextField(10, 10, "Local IP", "127.0.0.1");
			//localIP = createTextField(10, 10, "Local IP", "10.188.60.32");
			localPort = createTextField(10, 35, "Local port", "80");
			createTextButton(170, 60, "Bind", bind);
			message = createTextField(10, 85, "Message", "Lucy can't drink milk.");
			createTextButton(170, 110, "Send", send);
			logField = createTextField(10, 135, "Log", "", false, 200)

			this.stage.nativeWindow.activate();
		}

		public function log(text : String) : void {
			logField.appendText(text + "\n");
			logField.scrollV = logField.maxScrollV;
			trace(text);
		}

		private function send(e : MouseEvent) : void {
			dispatchEvent(new ServerEvent(ServerEvent.SEND_CLICK));
		}

		private function bind(e : MouseEvent) : void {
			dispatchEvent(new ServerEvent(ServerEvent.BIND_CLICK));
			// log( "Bound to: " + serverSocket.localAddress + ":" + serverSocket.localPort );
		}

		private function createTextField(x : int, y : int, label : String, defaultValue : String = '', editable : Boolean = true, height : int = 20) : TextField {
			var labelField : TextField = new TextField();
			labelField.text = label;
			labelField.type = TextFieldType.DYNAMIC;
			labelField.width = 100;
			labelField.x = x;
			labelField.y = y;

			var input : TextField = new TextField();
			input.text = defaultValue;
			input.type = TextFieldType.INPUT;
			input.border = editable;
			input.selectable = editable;
			input.width = 280;
			input.height = height;
			input.x = x + labelField.width;
			input.y = y;

			this.addChild(labelField);
			this.addChild(input);

			return input;
		}

		private function createTextButton(x : int, y : int, label : String, clickHandler : Function) : TextField {
			var button : TextField = new TextField();
			button.htmlText = "<u><b>" + label + "</b></u>";
			button.type = TextFieldType.DYNAMIC;
			button.selectable = false;
			button.width = 180;
			button.x = x;
			button.y = y;
			button.addEventListener(MouseEvent.CLICK, clickHandler);

			this.addChild(button);
			return button;
		}
	}
}