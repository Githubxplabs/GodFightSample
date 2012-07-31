package me.xplabs.net.view {
	import flash.events.IEventDispatcher;
	import flash.events.ServerSocketConnectEvent;
	import flash.net.Socket;

	import me.xplabs.interfaces.net.IServerSocket;
	import me.xplabs.net.events.ServerEvent;

	import org.robotlegs.mvcs.Mediator;

	/**
	 * ...
	 * @author xiaohan
	 */
	public class BindServerMediator extends Mediator {
		[Inject]
		public var bindServerView : BindServerView;
		[Inject]
		public var socketServer : IServerSocket;

		public function BindServerMediator() {
			super();
		}

		override public function onRegister() : void {
			bindServerView.setupUI();
			eventMap.mapListener(bindServerView, ServerEvent.BIND_CLICK, bindHandler);
			addContextListener(ServerSocketConnectEvent.CONNECT, connectHandler);
		}

		private function connectHandler(e : ServerSocketConnectEvent) : void {
			var clientSocket : Socket = e.socket;
			bindServerView.log("Connection from " + clientSocket.remoteAddress + ":" + clientSocket.remotePort);
		}

		private function bindHandler(e : ServerEvent) : void {
			socketServer.bind(bindServerView.port, bindServerView.adress);
			bindServerView.log("Bound to: " + socketServer.localAddress + ":" + socketServer.localPort);
		}
	}
}