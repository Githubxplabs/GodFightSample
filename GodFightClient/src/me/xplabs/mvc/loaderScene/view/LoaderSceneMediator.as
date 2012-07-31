package me.xplabs.mvc.loaderScene.view {
	import flash.utils.ByteArray;
	import me.xplabs.constant.MouseType;
	import me.xplabs.interfaces.mouse.IMouse;
	import me.xplabs.mouse.MouseManager;
	import me.xplabs.servers.lander.CSLogin;
	import me.xplabs.utils.sendMsg;
	import org.robotlegs.mvcs.Mediator;
	import starling.display.DisplayObject;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;



	/**
	 * ...
	 * @author xiaohan
	 */
	public class LoaderSceneMediator extends Mediator {
		[Inject]
		public var view : LoaderSceneView;
		[Inject]
		public var mouseManager : IMouse;

		public function LoaderSceneMediator() {
			super();
		}

		override public function onRegister() : void {
			contextView.addEventListener(TouchEvent.TOUCH, onTouchHandler);
			
		}

		private function onTouchHandler(e : TouchEvent) : void {
			if (!e || !e.currentTarget) return;
			if (e.getTouch(DisplayObject(e.currentTarget)).phase == TouchPhase.ENDED) {
				if (mouseManager.mosueType == MouseType.normalHand) {
					mouseManager.changeMouseType(MouseType.blueHand);
				} else {
					mouseManager.changeMouseType(MouseType.normalHand);
				}
			}
			// trace(e.getTouch(DisplayObject(e.currentTarget)).phase);
		}
	}
}