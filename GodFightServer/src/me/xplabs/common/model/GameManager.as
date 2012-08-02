package me.xplabs.common.model 
{
	import flash.events.Event;
	import me.xplabs.interfaces.common.IGameManager;
	import me.xplabs.interfaces.common.IGameManagerStateControl;
	import me.xplabs.interfaces.common.IUpdate;
	/**
	 * ...
	 * @author xiaohan
	 */
	public class GameManager implements IGameManager,IUpdate,IGameManagerStateControl
	{
		private var _funcs:Vector.<Function>;
		private var _isStart:Boolean;
		public function GameManager() 
		{
			init();
		}
		
		private function init():void 
		{
			_funcs = new Vector.<Function>();
		}
		/**
		 * 添加函数到主帧循环中
		 * @param	func 需要添加的函数
		 */
		public function addUpdate(func:Function):void 
		{
			_funcs.push(func);
		}
		/**
		 * 从主帧循环中删除函数
		 * @param	func 被删除的函数
		 * @return
		 */		
		public function removeUpdate(func:Function):Function 
		{
			var len:int = _funcs.length;
			for (var i:int = 0; i < len; i++) 
			{
				if (_funcs[i] == func)
				{
					return _funcs.splice(i, 1)[0];
				}
			}
			return null;
		}
		/**
		 * 开启主帧循环
		 */
		public function startUpdate():void 
		{
			_isStart = true;
		}
		/**
		 * 停止主帧循环
		 */		
		public function stopUpdate():void 
		{
			_isStart = false;
		}
		
		/**
		 * 每帧刷新的函数
		 */		
		public function update(e:Event = null):void 
		{
			if (!_isStart) return;
			var len:int = _funcs.length;
			for (var i:int = 0; i < len; i++) 
			{
				_funcs[i]();
			}
		}
	}
}