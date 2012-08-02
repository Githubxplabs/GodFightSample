package {
	import flash.display.DisplayObjectContainer;
	import me.xplabs.common.controller.GameManagerCommand;
	import me.xplabs.common.model.GameManager;
	import me.xplabs.interfaces.common.IGameManager;
	import me.xplabs.interfaces.common.IGameManagerStateControl;
	import me.xplabs.interfaces.common.IUpdate;

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
			
			initGameManager();
			initSocketServer();
			initCommand();
			super.startup();
			trace("程序启动啦");
		}
		private function initGameManager():void
		{
			var gameManager:GameManager = new GameManager();
			injector.mapValue(IGameManager, gameManager);
			injector.mapValue(IUpdate, gameManager);
			injector.mapValue(IGameManagerStateControl, gameManager);
			gameManager = null;
		}
		
		private function initSocketServer():void
		{
			var socketServer : SocketServer = new SocketServer();
			MessageHandle.socketServer = socketServer;
			injector.mapValue(IServerSocket, socketServer);
			socketServer = null;
			
			injector.mapSingletonOf(IMessageRecognizer, MessageRecognizer);
		}
		private function initCommand():void
		{
			commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, GameManagerCommand, ContextEvent);
			commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, BindServerCommand, ContextEvent);
			commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, SocketServerCommand, ContextEvent);
		}
	}
}