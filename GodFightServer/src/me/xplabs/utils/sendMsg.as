package me.xplabs.utils {
	import me.xplabs.interfaces.servers.IBaseMessage;

	/**
	 * 发送消息到客户端
	 * ...
	 * @author xiaohan
	 */
	public function sendMsg(clinetId : String, baseMessage : IBaseMessage) : void {
		MessageHandle.sendMessage(clinetId, baseMessage);
	}
}