package me.xplabs.resource 
{
	import flash.display.BitmapData;
	import flash.display.Bitmap;
	import flash.utils.Dictionary;
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;
	import me.xplabs.interfaces.resource.ILibrary;
	import me.xplabs.interfaces.resource.RES;
	
	/**
	 * ...
	 * @author xiaohan
	 */
	public class Library implements ILibrary 
	{
		private var bmdLib:Dictionary;
		private static var _instance:ILibrary;
		public function Library() 
		{
			bmdLib = new Dictionary();
			new RES();
		}
		
		/* INTERFACE me.xplabs.interfaces.resource.ILibrary */
		
		public static function get library():ILibrary
		{
			return _instance ||= new Library();
		}
		public function getBitmap(pkey:String):Bitmap 
		{
			return null;
		}
		
		public function getBitmapDataByName(pkey:*, cache:Boolean = true):BitmapData
		{
			
			
			if (cache)
			{
				var bmd:BitmapData = bmdLib[pkey];
				if (!bmd) 
				{
					bmd = new (getDefinitionByName(pkey) as Class)();
					bmdLib[pkey] = bmd;
				}
				return bmd;
			}
			return BitmapData(new (getDefinitionByName(pkey) as Class)());
		}
		
	}

}