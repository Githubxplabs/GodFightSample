package me.xplabs.common.controller 
{
	import me.xplabs.account.controller.AccountManagerCommand;
	import me.xplabs.account.model.AccountManager;
	import me.xplabs.common.events.LoaderEvent;
	import me.xplabs.common.model.PlayerIDAndClientID;
	import me.xplabs.interfaces.account.IAccountManager;
	import me.xplabs.interfaces.common.ILocalFileManager;
	import me.xplabs.interfaces.common.IPlayerIdConvert;
	import me.xplabs.net.controller.BindServerCommand;
	import me.xplabs.net.controller.SocketServerCommand;
	import org.robotlegs.mvcs.Command;
	
	/**
	 * ...
	 * @author xiaohan
	 */
	public class LocalFileCommand extends Command 
	{
		[Inject]
		public var localFile:ILocalFileManager;
		public function LocalFileCommand() 
		{
			super();
			
		}
		override public function execute():void 
		{
			commandMap.mapEvent(LoaderEvent.URLLOADER_COMPLETE, GameManagerCommand, LoaderEvent);
			commandMap.mapEvent(LoaderEvent.URLLOADER_COMPLETE, BindServerCommand, LoaderEvent);
			commandMap.mapEvent(LoaderEvent.URLLOADER_COMPLETE, SocketServerCommand, LoaderEvent);
			commandMap.mapEvent(LoaderEvent.URLLOADER_COMPLETE, AccountManagerCommand, LoaderEvent);
			injector.mapSingletonOf(IPlayerIdConvert, PlayerIDAndClientID);
			injector.mapSingletonOf(IAccountManager, AccountManager);
			localFile.init();
		}
		
	}

}