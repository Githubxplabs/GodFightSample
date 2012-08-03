package me.xplabs.common.model 
{
	import flash.events.Event;
	import flash.filesystem.File;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import me.xplabs.common.events.LoaderEvent;
	import me.xplabs.interfaces.common.ILibrary;
	import me.xplabs.interfaces.common.ILocalFileManager;
	import org.robotlegs.mvcs.Actor;
	
	/**
	 * ...
	 * @author xiaohan
	 */
	public class LocalFileManager extends Actor implements ILocalFileManager
	{
		private var _file:File;
		private var _files:Array;
		private var _curIndex:int;
		[Inject]
		public var library:ILibrary;
		public function LocalFileManager() 
		{
			super();
			
		}
		public function init():void
		{
			if(!_file) _file = new File("app:/assets");
			_files = _file.getDirectoryListing();
			var len:int = _files.length;
			_curIndex = 0;
			for (var i:int = 0; i < len; i++) 
			{
				var urlLoader:URLLoader = new URLLoader();
				urlLoader.load(new URLRequest(File(_files[i]).nativePath));
				urlLoader.addEventListener(Event.COMPLETE, urlLoaderCompleteHandler);
			}
		}
		
		private function urlLoaderCompleteHandler(e:Event):void 
		{
			var urlLoader:URLLoader = e.currentTarget as URLLoader;
			switch(_files[_curIndex].name)
			{
				case "user.xml":
					library.setData("user.xml", urlLoader.data);
					break;
			}
			urlLoader.removeEventListener(Event.COMPLETE, urlLoaderCompleteHandler);
			urlLoader.close();
			_curIndex++;
			if (_curIndex >= _files.length) dispatch(new LoaderEvent(LoaderEvent.URLLOADER_COMPLETE));
		}
		public function save(pkey:String, data:Object):void
		{
			
		}
	}

}