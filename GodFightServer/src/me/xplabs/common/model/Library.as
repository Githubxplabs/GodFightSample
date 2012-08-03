package me.xplabs.common.model 
{
	import flash.utils.Dictionary;
	import me.xplabs.interfaces.common.ILibrary;
	import org.robotlegs.mvcs.Actor;
	
	/**
	 * ...
	 * @author xiaohan
	 */
	public class Library extends Actor implements ILibrary 
	{
		private var _dataLib:Dictionary;
		public function Library() 
		{
			super();
			_dataLib = new Dictionary();
		}
		
		
		public function getData(pkey:String):* 
		{
			return _dataLib[pkey];
		}
		
		
		public function setData(pkey:String, data:*):void 
		{
			_dataLib[pkey] = data;
		}
		
	}

}