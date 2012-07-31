package {
	import starling.display.Sprite;
	import starling.events.Event;

	/**
	 * ...
	 * @author xiaohan
	 */
	public class StarlingMain extends Sprite {
		private var _godFightContext : FlashGodFightContext;

		public function StarlingMain() {
			addEventListener(Event.ADDED_TO_STAGE, init);
		}

		private function init(e : Event) : void {
			// removeEventListener(Event.ADDED_TO_STAGE, init);
			trace("Starling启动啦");

			_godFightContext = new FlashGodFightContext(this);
		}
	}
}