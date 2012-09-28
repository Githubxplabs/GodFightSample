package me.xplabs.room.view 
{
	import me.xplabs.common.ui.UIButton;
	import me.xplabs.resource.Library;
	import me.xplabs.room.events.RoomEvent;
	import me.xplabs.room.model.vo.RoomMember;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
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
		private var _enterBattleBtn:UIButton;
		
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
			_backGround = new Image(Texture.fromBitmapData(Library.library.getBitmapDataByClass("RoomBackground", false)));
			addChild(_backGround);
			
			_huangDiSymbol = new Image(Texture.fromBitmapData(Library.library.getBitmapDataByClass("RoomHuangDi", false)));
			_huangDiSymbol.x = 30;
			_huangDiSymbol.y = 135;
			addChild(_huangDiSymbol);
			
			_chiYouSymbol = new Image(Texture.fromBitmapData(Library.library.getBitmapDataByClass("RoomChiYou", false)));
			_chiYouSymbol.x = 30;
			_chiYouSymbol.y = 425;
			addChild(_chiYouSymbol);
			
			_enterBattleBtn = new UIButton(Texture.fromBitmapData(Library.library.getBitmapDataByClass("UIEnterBattleButton_UP", false)), "", Texture.fromBitmapData(Library.library.getBitmapDataByClass("UIEnterBattleButton_DOWN", false)), Texture.fromBitmapData(Library.library.getBitmapDataByClass("UIEnterBattleButton_OVER", false)));
			addChild(_enterBattleBtn);
			_enterBattleBtn.addEventListener(Event.TRIGGERED, enterBattleHandler);
			
			/*var tempFrame:RoomFigureFrame = new RoomFigureFrame();
			tempFrame.show(Texture.fromBitmapData(new RoomRoleFrame()));
			addChild(tempFrame);
			tempFrame.x = 350;
			tempFrame.y = 110;*/
			_members = new Vector.<RoomFigureFrame>();
			
		}
		
		private function enterBattleHandler(e:Event):void 
		{
			dispatchEvent(new RoomEvent(RoomEvent.ENTER_BATTLE));
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
		
		override public function dispose():void 
		{
			if (_backGround.parent) _backGround.parent.removeChild(_backGround);
			if (_huangDiSymbol.parent) _huangDiSymbol.parent.removeChild(_huangDiSymbol);
			if (_chiYouSymbol.parent) _chiYouSymbol.parent.removeChild(_chiYouSymbol);
			if (_enterBattleBtn.parent) _enterBattleBtn.parent.removeChild(_enterBattleBtn);
			_backGround = null;
			_huangDiSymbol = null;
			_chiYouSymbol = null;
			_enterBattleBtn = null;
			clearMembers();
			super.dispose();
		}
		
	}

}