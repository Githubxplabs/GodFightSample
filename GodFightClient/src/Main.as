package {
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.geom.Point;
	import flash.ui.Mouse;
	import flash.ui.MouseCursorData;

	import me.xplabs.mouse.MouseManager;

	import net.hires.debug.Stats;

	import starling.core.Starling;

	/**
	 * ...
	 * @author xiaohan
	 */
	[SWF(width = "1280", height = "752", frameRate = "60", backgroundColor = "#002143")]
	public class Main extends Sprite {
		private var _starling : Starling;

		public function Main() : void {
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}

		private function init(e : Event = null) : void {
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			addChild(new Stats());
			// addChild(new ARE2DStats());

			_starling = new Starling(StarlingMain, stage);
			_starling.antiAliasing = 1;
			_starling.start();
		}
	}
}