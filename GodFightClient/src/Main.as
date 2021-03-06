package {
	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.net.URLLoader;
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
			
			//stage.align = StageAlign.LEFT;
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
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