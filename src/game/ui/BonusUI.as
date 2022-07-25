package game.ui
{
	import constant.BonusEvent;
	
	import display.SimpleImage;
	import display.SimpleSprite;
	
	import events.SAEvent;
	
	import game.GameScreen;
	import game.model.BonusModel;
	import game.view.panels.BottomPanelView;
	
	import starling.display.DisplayObject;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.textures.Texture;
	
	
	public class BonusUI extends SimpleSprite
	{
		private var __cursor:SimpleImage;
		private var __cursorActive:Boolean = false;
		
		public function BonusUI()
		{
		}
		
		override protected function init(e:Event = null):void
		{
			super.init(e);
			BonusModel.INSTANCE.addEventListener(BonusEvent.CHOOSE_POINT, showCursor);
			BonusModel.INSTANCE.addEventListener( BonusEvent.ON_DESTROY_POINT, hideCursor);
			BonusModel.INSTANCE.addEventListener( BonusEvent.ON_UNDO, hideCursor);	
			createCursor();
			onResize(null);
		}
		
		private function createCursor():void
		{
			var texture:Texture = assets.getTexture("ico_bonus_clean");
			__cursor = new SimpleImage(texture);
			__cursor.alignPivot();
			stage.addChild(__cursor);
			__cursor.touchable = false;
			__cursor.visible = false;
		}
		
		private function onTouch(e:TouchEvent):void
		{
			var touches:Vector.<Touch> = e.getTouches(e.currentTarget as DisplayObject);
			
			for each (var touch:Touch in touches)
			{	
				__cursor.x = touch.previousGlobalX;
				__cursor.y = touch.previousGlobalY;
				__cursor.scaleX = __cursor.scaleY = BottomPanelView.getScale();
				
				if(touch.phase == TouchPhase.ENDED)
				{
					if(__cursorActive) BonusModel.INSTANCE.cancelBonus();
					else __cursorActive = true;
				}
			}
		}
		
		private function showCursor(e:SAEvent):void
		{
			__cursor.visible = true;
			stage.addEventListener(TouchEvent.TOUCH, onTouch);
		}
		
		
		private function hideCursor():void
		{
			__cursor.visible = false;
			__cursorActive = false;
			stage.removeEventListener(TouchEvent.TOUCH, onTouch);
		}
		
		override protected function destroy(e:Event):void
		{
			super.destroy(e);
			BonusModel.INSTANCE.removeEventListener(BonusEvent.CHOOSE_POINT, showCursor);
			BonusModel.INSTANCE.removeEventListener( BonusEvent.ON_DESTROY_POINT, hideCursor);
			BonusModel.INSTANCE.removeEventListener( BonusEvent.ON_UNDO, hideCursor);	
			stage.removeEventListener(TouchEvent.TOUCH, onTouch);
		}
	}
}