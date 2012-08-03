package me.xplabs.interfaces.common 
{
	
	/**
	 * ...
	 * @author xiaohan
	 */
	public interface ILocalFileManager 
	{
		function save(pkey:String, data:Object):void;
		function init():void;
	}
	
}