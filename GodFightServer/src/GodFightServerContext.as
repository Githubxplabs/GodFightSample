package {
	import flash.display.DisplayObjectContainer;

	import me.xplabs.interfaces.net.IMessageRecognizer;
	import me.xplabs.interfaces.net.IServerSocket;
	import me.xplabs.net.controller.BindServerCommand;
	import me.xplabs.net.controller.SocketServerCommand;
	import me.xplabs.net.model.MessageRecognizer;
	import me.xplabs.net.model.SocketServer;
	import me.xplabs.utils.MessageHandle;

	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.Context;

	/**
	 * ...
	 * @author xiaohan
	 */
	public class GodFightServerContext extends Context {
		public function GodFightServerContext(contextView : DisplayObjectContainer = null, autoStartup : Boolean = true) {
			super(contextView, autoStartup);
		}

		override public function startup() : void {
			var socketServer : SocketServer = new SocketServer();
			MessageHandle.socketServer = socketServer;
			injector.mapValue(IServerSocket, socketServer);
			socketServer = null;

			injector.mapSingletonOf(IMessageRecognizer, MessageRecognizer);

			commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, BindServerCommand, ContextEvent);
			commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, SocketServerCommand, ContextEvent);

			super.startup();
			trace("程序启动啦");
		}
	}
}