package me.xplabs.servers.lander 
{
	import flash.events.Event;
	import me.xplabs.servers.BaseMessage;
	import me.xplabs.servers.MessageType;
	
	/**
	 * 登陆游戏
	 * ...
	 * @author xiaohan
	 */
	public class CSLogin extends BaseMessage 
	{
		/** 登陆用户名*/
		public var userName:String;
		/** 登陆密码*/
		public var passWord:String;
		/** 连接到的主机的名称或 IP 地址*/
		public var host:String;
		/** 连接到的端口号*/
		public var port:int;
		
		public function CSLogin() 
		{
		}
		override public function get type():int 
		{
			return MessageType.CS_LOGIN;
		}
		override public function read():void 
		{
			userName = readString();
			passWord = readString();
			host = readString();
			port = readShort();
		}
		override public function write():void 
		{
			writeString(userName);
			writeString(passWord);
			writeString(host);
			writeShort(port);
		}
	}
}