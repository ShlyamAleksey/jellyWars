package game.view.gameplay
{
	import com.greensock.TweenLite;
	
	import flash.geom.Point;
	
	import AI.AIModel;
	
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
	import starling.utils.HAlign;
	import starling.utils.VAlign;
	
	public class PointView extends SimpleSprite
	{
		static public var RED_TEXTURE:String = "jelly_1";
		static public var BLUE_TEXTURE:String = "jelly_2";
		
		private var __pointImage:SimpleImage;
		private var __index:String;
		private var __position:Point;
		private var __type:String;
		
		
		public function PointView(ind:uint, position:Point, type:String)
		{
			__type = type;
			__index = ind.toString();
			__position = position.clone();
			BonusModel.INSTANCE.addEventListener( BonusEvent.ON_DESTROY_POINT, destroyPointAssets);	
			GameModel.INSTANCE.addEventListener( GamePlayEvent.ON_DESTROY_VERTEX, destroyPointAssets);
			addEventListener(TouchEvent.TOUCH, onTouch);
		}
		
		override protected function init(e:Event = null):void
		{
			super.init(e);
			onResize(null);
		}
		
		private function onTouch(e:TouchEvent):void
		{
			var touches:Vector.<Touch> = e.getTouches(e.currentTarget as DisplayObject);
			//(e.currentTarget as DisplayObject).useHandCursor = true;
			
			for each (var touch:Touch in touches)
			{
				if(touch.phase == TouchPhase.ENDED)
				{
					if(__type == GameModel.BLUE) BonusModel.INSTANCE.removeOne(__position.clone());
				}
			}
		}
		
		public function drawPoint(color:String):void
		{
			if(color == GameModel.BLUE)  __pointImage = new SimpleImage(assets.getTexture(RED_TEXTURE));
			else __pointImage = new SimpleImage(assets.getTexture(BLUE_TEXTURE));


			__pointImage.y = Options.TAP_SIZE >> 2;
			__pointImage.alignPivot(HAlign.CENTER, VAlign.BOTTOM);
			//__pointImage.touchable = false; 
			
			addChild(__pointImage);
		}
		
		private function destroyPointAssets(e:SAEvent):void
		{
			var pt:Point = e.eventData.position.clone();
			if( __position.x == pt.x && __position.y == pt.y )
			{
				TweenLite.to(this, 1, {scaleX : 0, scaleY : 0, onComplete: removeFromParent});
			}		
		}

		override protected function destroy(e:Event):void
		{
			super.destroy(e);
			BonusModel.INSTANCE.removeEventListener( BonusEvent.ON_DESTROY_POINT, destroyPointAssets);
			GameModel.INSTANCE.removeEventListener( GamePlayEvent.ON_DESTROY_VERTEX, destroyPointAssets);
		}
	}
}