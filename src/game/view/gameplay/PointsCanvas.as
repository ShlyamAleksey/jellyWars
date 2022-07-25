package game.view.gameplay
{
	import flash.geom.Point;
	
	import AI.AIModel;
	
	import constant.GamePlayEvent;
	import constant.Options;
	
	import display.SimpleSprite;
	import display.managers.WindowsManager;
	
	import events.SAEvent;
	
	import game.model.gameplay.GameModel;
	
	import starling.display.Canvas;
	import starling.events.Event;
	import starling.geom.Polygon;
	
	import tools.stageRender;
	
	public class PointsCanvas extends SimpleSprite
	{
		private var __model:GameModel;		
		private var __edgesCanvasBLUE:SimpleSprite;
		private var __vertexesCanvas:SimpleSprite;
		
		private var __itemSize:Number;	
		
		public function PointsCanvas()
		{
		}
		
		override protected function init(e:Event = null):void
		{
			super.init(e);

			__model = GameModel.INSTANCE;
			
			__model.addEventListener( GamePlayEvent.ON_STEP, onStep);
			__model.addEventListener( GamePlayEvent.ON_CREATE_EDGE, onEdgeCreate);
			
			__itemSize = Options.TAP_SIZE;

			createCanvases();
		}
		
		private function createCanvases():void
		{
			__edgesCanvasBLUE = new SimpleSprite();
			this.addChild(__edgesCanvasBLUE);
			//__edgesCanvasBLUE.alpha = 0.5;
			
			__vertexesCanvas = new SimpleSprite();
			this.addChild(__vertexesCanvas);
		}		
		
		private function onStep(e:SAEvent):void
		{
			if(!JellyWars.TEST )
			{
				if(GameModel.INSTANCE.curentStep == GameModel.RED)  WindowsManager.show(SimpleSprite);
				else WindowsManager.hide();
			}

			var data:Object = e.eventData;
			
			var pv:PointView = new PointView(data.index, data.position, data.currentStep);
				pv.x = __itemSize*data.position.x; pv.y = __itemSize*data.position.y;
				pv.drawPoint(data.currentStep);
			
			__vertexesCanvas.addChild(pv);
			stageRender(stage, onPointDrow, data);	
		}
		
		private function onPointDrow(data:Object = null):void
		{
			AIModel.INSTANCE.setAIMove(data);
		}
		
		private function onEdgeCreate(e:SAEvent):void
		{
			__edgesCanvasBLUE.addChild( drawPolygon(e.eventData["list"]) );
		}
		
		private function drawPolygon(data:Vector.<Point>):Canvas
		{
			var polygonData:Array = new Array();

			for (var i:int = 0; i < data.length; i++) 
			{
				polygonData.push( new Point( data[i].x*__itemSize, data[i].y*__itemSize) );
			}	
			
			var polygon:Polygon = new Polygon(polygonData);

			var area:Number = polygon.area; polygon.reverse(); 
			if(polygon.area < area) polygon.reverse(); 
			
			var polygonCanvas:Canvas = new Canvas();
				if(__model.curentStep == GameModel.RED) polygonCanvas.beginFill( 0xBD1E1A );
				else polygonCanvas.beginFill( 0x996699 );
				
				polygonCanvas.drawPolygon(polygon);
			
			return polygonCanvas;
		}
		
		override protected function onResize(e:Event):void{}
		
		override protected function destroy(e:Event):void
		{
			super.destroy(e);
			__model.removeEventListener( GamePlayEvent.ON_STEP, onStep);
			__model.removeEventListener( GamePlayEvent.ON_CREATE_EDGE, onEdgeCreate);
		}
	}
}