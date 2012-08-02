package {
	import me.xplabs.interfaces.mouse.IMouse;
	import me.xplabs.interfaces.net.IConnector;
	import me.xplabs.interfaces.net.IMessageRecognizer;
	import me.xplabs.mouse.MouseManager;
	import me.xplabs.net.controller.NetManagerCommand;
	import me.xplabs.net.model.Connector;
	import me.xplabs.net.model.MessageRecognizer;
	import me.xplabs.StartUpCommand;
	import me.xplabs.utils.MessageHandle;
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.Context;
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	import starling.display.Image;
	import starling.textures.Texture;
	/**
	 * ...
	 * @author xiaohan
	 */
	public class FlashGodFightContext extends Context {
		public function FlashGodFightContext(contextView : DisplayObjectContainer = null, autoStartup : Boolean = true) {
			super(contextView, autoStartup);
		}

		override public function startup() : void {
			trace("Robotlegs启动啦!");

			
			injector.mapValue(IMouse, new MouseManager());
			//injector.mapValue(IConnector, new Connector());
			
			var connector:Connector = new Connector();
			MessageHandle.connector = connector;
			injector.mapValue(IConnector, connector);
			connector = null;
			
			injector.mapSingletonOf(IMessageRecognizer, MessageRecognizer);
			
			commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, NetManagerCommand, ContextEvent);
			commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, StartUpCommand, ContextEvent);
			
			//contextView.addChild(new Image(Texture.fromBitmap(new PhotoTest())));
			super.startup();
		}
	}
}