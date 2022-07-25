package game.view.gameplay
{
	import constant.Options;
	
	import display.SimpleShape;
	import display.SimpleSprite;
	
	import starling.events.Event;
	
	public class EdgeView extends SimpleSprite
	{
		private var baseQuad:SimpleShape;
		private var __thickness:Number = 4;
		private var __color:uint = 0x00FF00;
		
		public function EdgeView()
		{
			super();
		}
		
		override protected function init(e:Event = null):void
		{
			super.init(e);
			
			baseQuad = new SimpleShape(1, __thickness, __color);
			addChild(baseQuad);
			
			this.pivotY = __thickness >> 1;
			onResize(null);
		}
		
		public function lineTo(toX:int, toY:int):void
		{
			baseQuad.width = Math.round(Math.sqrt((toX*toX)+(toY*toY)));
			baseQuad.rotation = Math.atan2(toY, toX);
		}
		
		public function set thickness(t:Number):void
		{
			var currentRotation:Number = baseQuad.rotation;
			baseQuad.rotation = 0;
			baseQuad.height = __thickness = t;
			baseQuad.rotation = currentRotation;
		}
		
		public function get thickness():Number
		{
			return __thickness;
		}
		
		public function set color(c:uint):void
		{
			baseQuad.color = __color = c;
		}
		
		public function get color():uint
		{
			return __color;
		}
		
		override protected function onResize(e:Event):void{}
		
		override protected function destroy(e:Event):void
		{
			super.destroy(e);
		}
	}
}