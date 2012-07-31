package me.xplabs.mouse {
	import flash.display.BitmapData;
	import flash.ui.Mouse;
	import flash.ui.MouseCursorData;
	import me.xplabs.constant.MouseType;
	import me.xplabs.interfaces.mouse.IMouse;


	/**
	 * ...
	 * @author xiaohan
	 */
	public class MouseManager implements IMouse {
		[Embed(source="../../../assets/mouse/normalHand.png")]
		private static var NormalHand : Class;
		[Embed(source="../../../assets/mouse/blueHand.png")]
		private static var BlueHand : Class;
		/**
		 * 鼠标样式的类型
		 */
		private var _mouseType : String;
		/**
		 * 鼠标样式管理
		 */
		public function MouseManager() {
			registerCursor();
		}
		/**
		 * 注册鼠标的样式
		 */
		private function registerCursor() : void {
			_mouseType = MouseType.normal;
			if (!Mouse.supportsNativeCursor) return;
			registerNormalHand();
			registerBlueHand();
			changeMouseType(MouseType.normalHand);
		}
		/**
		 * 注册普通的手型鼠标
		 */
		private function registerNormalHand() : void {
			Mouse.registerCursor(MouseType.normalHand, getMouseCursorDataByType(MouseType.normalHand));
		}
		/**
		 * 注册蓝色的手型鼠标
		 */
		private function registerBlueHand() : void {
			Mouse.registerCursor(MouseType.blueHand, getMouseCursorDataByType(MouseType.blueHand));
		}
		/**
		 * 获取鼠标样式图标或动画
		 * @param	mouseType 参见MouseType
		 * @return
		 */
		private function getMouseCursorDataByType(mouseType : String) : MouseCursorData {
			var mouseCursorData : MouseCursorData = new MouseCursorData();
			var hands : Vector.<BitmapData> = new Vector.<BitmapData>();
			switch(mouseType) {
				case MouseType.normalHand:
					hands[0] = (new NormalHand()).bitmapData;
					break;
				case MouseType.blueHand:
					hands[0] = (new BlueHand()).bitmapData;
					break;
			}
			mouseCursorData.data = hands;
			return mouseCursorData;
		}
		/**
		 * 获取当前鼠标的样式类型，鼠标样式参见MouseType.as
		 */
		public function get mosueType() : String {
			return _mouseType;
		}
		/**
		 * 切换游戏鼠标的样式，鼠标样式参见MouseType.as
		 * @param	ptype 参见MouseType
		 */
		public function changeMouseType(ptype : String) : void {
			switch(ptype) {
				case MouseType.normal:
					break;
				default:
					Mouse.cursor = ptype;
					break;
			}
			_mouseType = ptype;
		}
	}
}