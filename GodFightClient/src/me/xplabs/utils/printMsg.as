package me.xplabs.utils 
{
	/**
	 * 消息描述解析
	 * ...
	 * @author xiaohan
	 */
	public function printMsg(messageType:int):void
	{
		trace(MessageHandle.msgMapping(messageType));
	}

}