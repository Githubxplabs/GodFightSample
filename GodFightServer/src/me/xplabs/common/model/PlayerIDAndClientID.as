package me.xplabs.common.model 
{
	import flash.utils.Dictionary;
	import me.xplabs.interfaces.common.IPlayerIdConvert;
	/**
	 * ...
	 * @author xiaohan
	 */
	public class PlayerIDAndClientID implements IPlayerIdConvert
	{
		private var ids:Dictionary;
		public function PlayerIDAndClientID() 
		{
			ids = new Dictionary();
		}
		
		/* INTERFACE me.xplabs.interfaces.common.IPlayerIdConvert */
		
		public function getClientId(playerId:int):String 
		{
			for(var name:String in ids) 
			{
				if (ids[name] == playerId)
				{
					return name;
				}
			}
			return "";
		}
		
		public function getPlayerId(clientId:String):int 
		{
			return ids[clientId];
		}
		
		public function setId(clientId:String, playerId:int):void 
		{
			ids[clientId] = playerId;
		}

	}

}