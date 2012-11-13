package me.xplabs.isometric.iso 
{
	import me.xplabs.isometric.interfance.IIsoLayer;
	import me.xplabs.isometric.interfance.IIsoObject;
	import me.xplabs.isometric.interfance.ISortable;
	
	/**
	 * ...
	 * @author xiaohan
	 */
	public class IsoLayer implements IIsoLayer 
	{
		protected var _containers:Vector.<IIsoObject>;
		protected var _container:Object;
		public function IsoLayer() 
		{
			_containers = new Vector.<IIsoObject>();
		}
		
		/* INTERFACE me.xplabs.interfance.ILayer */
		/**
		 * 对层级内的等角对象进行排序
		 */
		public function sort():void 
		{
			var list:Vector.<IIsoObject> = _containers.slice(0);
			
			_containers.length = 0;
			
			for (var i:int = 0; i < list.length;++i) {
				var nsi:ISortable = list[i];
				
				var added:Boolean = false;
				for (var j:int = 0; j < _containers.length;++j ) {
					var si:ISortable = _containers[j];
					
					if (nsi.col <= si.col+si.cols-1 && nsi.row <= si.row+si.rows-1) {
						_containers.splice(j, 0, nsi);
						added = true;
						break;
					}
				}
				if (!added) {
					_containers.push(nsi);
				}
			}
			
			for (i = 0; i < _containers.length;++i) {
				_container.addChildAt(_containers[i].displayObject, i);
			}
		}
		/**
		 * 添加对象到层
		 * @param	isoObject 需要被添加的等角对象
		 */		
		public function addChild(isoObject:IIsoObject):void 
		{
			_containers[_containers.length] = isoObject;
		}
		/**
		 * 从层中删除
		 * @param	isoObject 需要被删除的等角对象 
		 */		
		public function removeChild(isoObject:IIsoObject):void 
		{
			var len:int = _containers.length;
			for (var i:int = 0; i < len; i++) 
			{
				if (_containers[i] == isoObject)
				{
					if (_containers[i].displayObject.parent) _containers[i].displayObject.parent.removeChild(_containers[i].displayObject);
					_containers.splice(i, 1);
					break;
				}
			}
		}
		
	}

}