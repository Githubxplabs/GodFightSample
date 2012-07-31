package {
	import flash.display.Sprite;

	/**
	 * ...
	 * @author xiaohan
	 */
	public class GodFight extends Sprite {
		private var _godFightServerContext : GodFightServerContext;

		public function GodFight() {
			init();
		}

		private function init() : void {
			_godFightServerContext = new GodFightServerContext(this);
		}
	}
}