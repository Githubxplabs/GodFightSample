package me.xplabs.room.view 
{
	import me.xplabs.room.model.vo.RoomMember;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.textures.Texture;
	
	/**
	 * 房间场景
	 * ...
	 * @author xiaohan
 	 */
	public class RoomView extends Sprite 
	{
		private var _backGround:Image;
		private var _huangDiSymbol:Image;
		private var _chiYouSymbol:Image;
		
		private var _members:Vector.<RoomFigureFrame>;
		public function RoomView() 
		{
			super();
			
		}
		/**
		 * 初始化房间系统界面
		 */
		public function init():void
		{
			_backGround = new Image(Texture.fromBitmapData(new RoomBackground()));
			addChild(_backGround);
			
			_huangDiSymbol = new Image(Texture.fromBitmapData(new RoomHuangDi()));
			_huangDiSymbol.x = 30;
			_huangDiSymbol.y = 135;
			addChild(_huangDiSymbol);
			
			_chiYouSymbol = new Image(Texture.fromBitmapData(new RoomChiYou()));
			_chiYouSymbol.x = 30;
			_chiYouSymbol.y = 425;
			addChild(_chiYouSymbol);
			
			/*var tempFrame:RoomFigureFrame = new RoomFigureFrame();
			tempFrame.show(Texture.fromBitmapData(new RoomRoleFrame()));
			addChild(tempFrame);
			tempFrame.x = 350;
			tempFrame.y = 110;*/
			_members = new Vector.<RoomFigureFrame>();
			
		}
		/**
		 * 更新房间所有成员
		 * @param	members
		 */
		public function updateRoomMembers(members:Vector.<RoomMember>):void 
		{
			clearMembers();
			var len:int = members.length;
			for (var i:int = 0; i < len; i++) 
			{
				var tempFrame:RoomFigureFrame = new RoomFigureFrame();
				tempFrame.show(Texture.fromBitmapData(new RoomRoleFrame()));
				tempFrame.changeRole(Texture.fromBitmapData(new RoomHead_1()));
				tempFrame.changeTitle(members[i].memberName);
				addChild(tempFrame);
				tempFrame.x = 350;
				tempFrame.y = 110 + i * 320;
				_members[_members.length] = tempFrame;
			}
		}
		/**
		 * 移除房间内所有成员
		 */
		private function clearMembers():void
		{
			var len:int = _members.length;
			for (var i:int = 0; i < len; i++) 
			{
				if (_members[i].parent) 
				{
					_members[i].dispose();
					_members[i].parent.removeChild(_members[i]);
				}
			}
			_members.length = 0;
		}
		
	}

}