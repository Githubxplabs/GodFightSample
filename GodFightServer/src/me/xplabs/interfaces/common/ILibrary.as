package me.xplabs.interfaces.common 
{
	
	/**
	 * ...
	 * @author xiaohan
	 */
	public interface ILibrary 
	{
		function getData(pkey:String):*;
		function setData(pkey:String, data:*):void;
	}
	
}