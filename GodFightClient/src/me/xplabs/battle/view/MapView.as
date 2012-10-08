package me.xplabs.battle.view 
{
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.utils.Dictionary;
	import flash.utils.getTimer;
	import me.xplabs.constant.MapConst;
	import me.xplabs.resource.Library;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.EnterFrameEvent;
	import starling.textures.Texture;
	
	/**
	 * 地图视图
	 * ...
	 * @author xiaohan
	 */
	public class MapView extends Sprite 
	{
		/**
		 * 当前运行帧数量
		 */
		private var _curFrame:int;
		/**
		 * 地图image的集合
		 */
		private var _images:Dictionary;
		/**
		 * 缓冲区地图区块的key值集合
		 */
		private var _buffers:Vector.<String>;
		/**
		 * 上一次的区块的索引坐标
		 */
		private var _prevTilePt:Point;
		/**
		 * 当前区块的索引坐标
		 */
		private var _curTilePt:Point;
		/**
		 * 当前的显示地图区块的key值集合
		 */
		private var _curDisplayKeys:Vector.<String>;
		/**
		 * 上一次的显示地图区块的key值集合
		 */
		private var _prevDisplayKeys:Vector.<String>;
		/**
		 * 是否需要刷新地图区块
		 */
		private var _canUpdateBlock:Boolean;
		/**
		 * 是否是第一次初始化地图
		 */
		private var _firstInitMap:Boolean;
		public function MapView() 
		{
		}
		
		public function init():void
		{
			_prevTilePt = new Point();
			_curTilePt = new Point();
 			
			_curDisplayKeys = new Vector.<String>();
			_prevDisplayKeys = new Vector.<String>();
			
			
			_images = new Dictionary();
			_buffers = new Vector.<String>();
			
			mapToTarget(0, 0);
			addEventListener(EnterFrameEvent.ENTER_FRAME, onEneterframe);
		}
		
		/**
		 * 根据像素坐标显示地图
		 * @param	tx x轴向像素坐标
		 * @param	ty y轴向像素坐标
		 */
		public function mapToTarget(tx:int, ty:int):void
		{
			this.x = -tx;
			this.y = -ty;
			_canUpdateBlock = true;
		}
		/**
		 * 地图移动
		 * @param	mx x方向移动的坐标
		 * @param	my y方向移动的坐标
		 */
		public function moveMap(mx:int, my:int):void
		{
			this.x += mx;
			this.y += my;
			_canUpdateBlock = true;
		}
		/**
		 * 更新地图区块
		 */
		private function updateBlock():void
		{
			if (_buffers.length == 0) 
			{
				if (!_canUpdateBlock)
				{
					_curFrame = 0;
					//trace("弹出了");
					return;
				}
			}
			_canUpdateBlock = false;
			_curFrame++;
			if (_curFrame % 2 == 0)
			{
				if (_buffers.length != 0)
				{
					var str:String = _buffers.shift();
					var texture:Texture = Texture.fromBitmapData(Library.library.getBitmapDataByName("Map" + str), false);
					image = new Image(texture);
					var tempStr:Array = str.split("_");
					var tempX:int = tempStr[1];
					var tempY:int = tempStr[0];
					_images["Map" + str] = image;
					image.x = tempX * MapConst.tileW;
					image.y = tempY * MapConst.tileH;
					addChild(image);
					//_curDisplayImages.push(image);
				}
			}
			//if ((Math.abs(this.x) / MapConst.tileW >= _curTilePt.x + 1) 
			//|| (Math.abs(this.x) / MapConst.tileW <= _curTilePt.x - 1) 
			//|| (Math.abs(this.y) / MapConst.tileH >= _curTilePt.y + 1) 
			//|| (Math.abs(this.y) / MapConst.tileH <= _curTilePt.y - 1))
			//{
			
			_curTilePt.x = Math.ceil(-this.x/MapConst.tileW);
			_curTilePt.y = Math.ceil( -this.y / MapConst.tileH);
				
			if (_curTilePt.x != _prevTilePt.x || _curTilePt.y != _prevTilePt.y || !_firstInitMap)
			{
				if (!_firstInitMap) _firstInitMap = true;
				var loadTileX:int = Math.max(0, _curTilePt.x - 1);
				var loadTileY:int = Math.max(0, _curTilePt.y - 1);
				//var loadTileX:int = int(MapConst.mapH / MapConst.tileH) - MapConst.bufferCol;
				//var loadTileY:int = int(MapConst.mapW / MapConst.tileW) - MapConst.bufferRow;
				
				if (_curTilePt.y > int(MapConst.mapH / MapConst.tileH) - MapConst.bufferCol) loadTileY = int(MapConst.mapH / MapConst.tileH) - MapConst.bufferCol;
				if (_curTilePt.x > int(MapConst.mapW / MapConst.tileW) - MapConst.bufferRow) loadTileX = int(MapConst.mapW / MapConst.tileW) - MapConst.bufferRow;
				
				_prevTilePt.x = _curTilePt.x;
				_prevTilePt.y = _curTilePt.y;
				trace(this.x, this.y, _curTilePt, loadTileX, loadTileY);
				
				removeOutOfRange(loadTileX,loadTileY);
				
				for (var i:int = 0; i < MapConst.bufferRow; i++) 
				{
					for (var j:int = 0; j < MapConst.bufferCol; j++) 
					{
						//_curDisplayKeys[_curDisplayKeys.length] = "Map" + (j + loadTileY) + "_" + (i + loadTileX);
						var image:Image = _images["Map" + (j + loadTileY) + "_" + (i + loadTileX)];
						if (!image)
						{
							_buffers[_buffers.length] = (j + loadTileY) + "_" + (i + loadTileX);
						}else
						{
							image.x = (loadTileX + i) * MapConst.tileW;
							image.y = (loadTileY + j) * MapConst.tileH;
							if(!image.parent) addChild(image);
						}
					}
				}
				
			}
				//trace(this.numChildren, len);
			//}
		}
		/**
		 * TODO: 把需要加载到地图中的部分也删掉了
		 * 移除超出范围的地图区块
		 * @param	loadTileX
		 * @param	loadTileY
		 */
		private function removeOutOfRange(loadTileX:int, loadTileY:int):void
		{
			
			_curDisplayKeys.length = 0;
			for (var i:int = 0; i < MapConst.bufferRow; i++) 
			{
				for (var j:int = 0; j < MapConst.bufferCol; j++) 
				{
					_curDisplayKeys[_curDisplayKeys.length] = "Map" + (j + loadTileY) + "_" + (i + loadTileX);
				}
			}
			
			var sameKeys:Vector.<String> = checkSameKeys(_curDisplayKeys, _prevDisplayKeys);
			var len:int = sameKeys.length;
			for (var k:int = 0; k < len; k++) 
			{
				if (_images[sameKeys[k]] && _images[sameKeys[k]].parent) _images[sameKeys[k]].parent.removeChild(_images[sameKeys[k]]);
			}
			_prevDisplayKeys = _curDisplayKeys.slice();
		}
		/**
		 * 检测是否有相同的部分
		 * @param	keys1
		 * @param	keys2
		 * @return 返回不相同的部分集合
		 */
		private function checkSameKeys(keys1:Vector.<String>,keys2:Vector.<String>):Vector.<String>
		{
			//trace(keys1.length, keys2.length+"---------");
			var sames:Object = { };
			var keys:Vector.<String> = new Vector.<String>();
			var len:int = keys1.length;
			for (var i:int = 0; i < len; i++) 
			{
				sames[keys1[i]] = true;
			}
			len = keys2.length
			for (i= 0; i < len; i++) 
			{
				if (!sames[keys2[i]])
				{
					keys[keys.length] = keys2[i];
				}
			}
			return keys;
		}
		/**
		 * 地图移动超出范围的处理方式
		 */
		private function outAreaHandler():void
		{
			if (this.x >= 0) this.x = 0;
			else if (Math.abs(this.x) >= (MapConst.mapW - MapConst.stageW)) this.x = -(MapConst.mapW - MapConst.stageW);
			
			if (this.y >= 0) this.y = 0;
			else if (Math.abs(this.y) >= MapConst.mapH - MapConst.stageH) this.y = -(MapConst.mapH - MapConst.stageH);
		}
		private function onEneterframe(e:EnterFrameEvent):void 
		{
			//moveMap( -1, -1);
			outAreaHandler();
			updateBlock();
		}
		
	}

}