package me.xplabs.common.events 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author xiaohan
	 */
	public class LoaderEvent extends Event 
	{
		public static const URLLOADER_COMPLETE:String = "urlLoaderComplete";
		public function LoaderEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{
			super(type, bubbles, cancelable);
			
		}
		
	}

}