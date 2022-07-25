package game.view.gameplay
{
	import com.greensock.TweenLite;
	
	import flash.geom.Point;
	
	import constant.AnimationDelay;
	import constant.Options;
	import constant.ResourceEvent;
	
	import display.SimpleImage;
	
	import events.SAEvent;
	
	import game.model.gameplay.FieldModel;
	import game.model.gameplay.GameModel;
	import game.model.gameplay.Resource;
	import game.model.gameplay.ResourceModel;
	import game.view.panels.TopPanelView;
	
	import starling.display.DisplayObject;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.textures.Texture;
	import starling.utils.HAlign;
	import starling.utils.VAlign;
	
	import tools.GlobalSize;
	
	public class StoneView extends SimpleImage
	{
		private var __position:Point;
		private var __texture:String;
		private var __type:uint;
		
		public function StoneView(type:uint, position:Point)
		{
			__position = position.clone();
			__type = type;
			
			switch(type)
			{
				case FieldModel.BLUE_STONE:
					__texture = "big_mineral_blue";
					break;
				case FieldModel.RED_STONE:
					__texture = "big_mineral_pink";
					break;
				case FieldModel.YELLOW_STONE:
					__texture = "big_mineral_yellow";
					break;
				case FieldModel.PURPLE_STONE:
					__texture = "big_mineral_violet";
					break;
			}
			var texture:Texture = assets.getTexture(__texture);
			super(texture, onInit);	
			
			addEventListener(TouchEvent.TOUCH, onTouch);
			useHandCursor = true;
		}
		
		private function onTouch(e:TouchEvent):void
		{
			var touches:Vector.<Touch> = e.getTouches(e.currentTarget as DisplayObject);
			
			for each (var touch:Touch in touches)
			{
				if(touch.phase == TouchPhase.ENDED)
				{
					onFind();
				}
			}
		}
		
		private function onFind():void
		{
			ResourceModel.INSTANCE.addResource(__position);
			var stagePosition:Point = this.parent.localToGlobal(new Point(x, y));
			var endPos:Point = stage.globalToLocal(TopPanelView.instance.iconPosition(__type));
			
			var empty:SimpleImage = drawEmpty(); 
				empty.x = stagePosition.x;
				empty.y = stagePosition.y;
				
			BlockScreen.block(appMain.instance);
			TweenLite.to(empty, AnimationDelay.FLY_STONE, {x : endPos.x, y : endPos.y, onComplete:nextTween});
			
			function nextTween():void
			{
				TweenLite.to(empty, AnimationDelay.DESAPEAR_STONE, {alpha : 0, onComplete:remove});
				function remove():void
				{
					GameModel.INSTANCE.addVertex(__position);
					empty.removeFromParent();
					BlockScreen.unblock(appMain.instance);
				}
			}
			
			this.removeFromParent();
		}
		
		private function drawEmpty():SimpleImage
		{
			var empty:SimpleImage = new SimpleImage(assets.getTexture(__texture));
				empty.alignPivot();
				empty.width = GlobalSize.widht(this);
				empty.height = GlobalSize.height(this);
				
			stage.addChild(empty);
			return empty;
		}
		
		private function onInit():void
		{
			this.scaleX = this.scaleY = 0.75;
			this.alignPivot(HAlign.CENTER, VAlign.CENTER);
			alignPivot();
		}
		
		override protected function destroy(event:Event):void
		{
			super.destroy(event);
			removeEventListener(TouchEvent.TOUCH, onTouch);
		} 
	}
}