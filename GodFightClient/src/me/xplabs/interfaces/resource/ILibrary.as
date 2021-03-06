package me.xplabs.interfaces.resource 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	
	/**
	 * ...
	 * @author xiaohan
	 */
	public interface ILibrary 
	{
		function getBitmap(pkey:String):Bitmap;
		function getBitmapDataByName(pkey:*, cache:Boolean = true):BitmapData;
	}
	
}