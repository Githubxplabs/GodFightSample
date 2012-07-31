package me.xplabs.net.controller {
	import me.xplabs.net.view.BindServerMediator;
	import me.xplabs.net.view.BindServerView;

	import org.robotlegs.mvcs.Command;

	/**
	 * ...
	 * @author xiaohan
	 */
	public class BindServerCommand extends Command {
		public function BindServerCommand() {
			super();
		}

		override public function execute() : void {
			mediatorMap.mapView(BindServerView, BindServerMediator);
			contextView.addChild(new BindServerView());
		}
	}
}