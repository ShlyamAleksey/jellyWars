package game.ui
{
	import flash.geom.Point;
	
	import AI.AIModel;
	
	import Assets.Content;
	
	import constant.AIEvent;
	import constant.BonusEvent;
	import constant.GamePlayEvent;
	import constant.Options;
	
	import display.SimpleImage;
	import display.SimpleSprite;
	
	import events.SAEvent;
	
	import game.model.BonusModel;
	import game.model.gameplay.GameModel;
	
	import starling.display.DisplayObject;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	public class TapAreaUI extends SimpleSprite
	{
		private var __tapArea:SimpleImage;
		private var position:Point;
		
		public function TapAreaUI()
		{
				
		}
		
		override protected function init(e:Event = null):void
		{
			super.init(e);
			
			__tapArea =	new SimpleImage(assets.getTexture("cell"));			
			addChild( __tapArea );
			
			__tapArea.alignPivot(); __tapArea.alpha = 0.5;
			
			position = new Point(this.x / Options.TAP_SIZE, this.y / Options.TAP_SIZE);
			
			addListeners();	
			BonusModel.INSTANCE.addEventListener( BonusEvent.ON_DESTROY_POINT, rebornTapArea);
		}
		
		private function onStep(e:SAEvent):void
		{
			var pt:Point = e.eventData.position.clone();
			if( position.x == pt.x && position.y == pt.y ) 
			{
				removeListeners();
			}
		}
		
		private function onTouch(e:TouchEvent):void
		{
			var touches:Vector.<Touch> = e.getTouches(e.currentTarget as DisplayObject);		
			for each (var touch:Touch in touches)
			{
				if(touch.phase == TouchPhase.ENDED)
				{
					GameModel.INSTANCE.addVertex(position);
				}
			}
		}
		
		private function rebornTapArea(e:SAEvent):void
		{
			var pt:Point = e.eventData.position.clone();
			if( position.x == pt.x && position.y == pt.y )
			{			
				addListeners();
				__tapArea.touchable = true;
			}			
		}
		
		private function onAIMove(e:SAEvent):void
		{	
			var pt:Point = e.eventData.position.clone();
			if( position.x == pt.x && position.y == pt.y )
			{
				GameModel.INSTANCE.addVertex(position);	
			}
		}
		
		private function onDrawPoint(e:SAEvent):void
		{
			var pt:Point = e.eventData.position.clone();
			if( position.x == pt.x && position.y == pt.y )
			{
				removeListeners(); 
			}
		}
		
		private function removeListeners():void
		{
			BonusModel.INSTANCE.removeEventListener( BonusEvent.ON_DRAW_POINT, onDrawPoint);
			
			GameModel.INSTANCE.removeEventListener(GamePlayEvent.ON_STEP, onStep);
			AIModel.INSTANCE.removeEventListener( AIEvent.ON_MOVE, onAIMove);
			__tapArea.removeEventListener(TouchEvent.TOUCH, onTouch);
			
			__tapArea.touchable = false;
		}
		
		private function addListeners():void
		{
			
			BonusModel.INSTANCE.addEventListener( BonusEvent.ON_DRAW_POINT, onDrawPoint);
			
			AIModel.INSTANCE.addEventListener( AIEvent.ON_MOVE, onAIMove);
			GameModel.INSTANCE.addEventListener(GamePlayEvent.ON_STEP, onStep);
			
			__tapArea.addEventListener(TouchEvent.TOUCH, onTouch);
		}
	
		override protected function destroy(e:Event):void
		{
			super.destroy(e);
			removeListeners();	
			BonusModel.INSTANCE.removeEventListener( BonusEvent.ON_DESTROY_POINT, rebornTapArea);
		}
	}
}