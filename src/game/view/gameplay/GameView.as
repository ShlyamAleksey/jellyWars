package game.view.gameplay
{
	import Assets.Content;
	
	import constant.Options;
	
	import display.SimpleImage;
	import display.SimpleShape;
	import display.SimpleSprite;
	
	import game.model.gameplay.FieldModel;
	import game.ui.GameUI;
	import game.ui.TapAreaUI;
	
	import starling.events.Event;
	import starling.utils.HAlign;
	import starling.utils.VAlign;
	
	public class GameView extends SimpleSprite
	{
		private var __fieldModel:FieldModel;
		
		private var __background:SimpleImage;
		private var __pointsCanvas:PointsCanvas;
		private var __decoreCanvas:SimpleSprite;
		private var __gameUI:GameUI;
		
		//align
		private var __canvasWidth:Number; 
		private var __canvasHeight:Number; 
		private var __currentScale:Number;
		
		public function GameView()
		{
			super();
		}
		
		override protected function init(e:Event = null):void
		{
			super.init(e);
			__fieldModel = FieldModel.INSTANCE;

			__canvasWidth = Options.TAP_SIZE*__fieldModel.width;
			__canvasHeight = Options.TAP_SIZE*__fieldModel.height;
			
			drawBackground();
			drawDecor();
			drawUI();
			drawPointsCanvas();

			onResize(null);
		}
	
		private function drawBackground():void
		{
			__background = new SimpleImage(assets.getTexture("background_4"));
			__background.alignPivot(HAlign.CENTER, VAlign.CENTER);
			this.addChild(__background);
			__background.touchable = false;
		}
		
		private function drawDecor():void
		{
			__decoreCanvas = new SimpleSprite();
			addChild(__decoreCanvas);
			__decoreCanvas.alignPivot(HAlign.CENTER, VAlign.CENTER);
			
			for (var h:int = 0; h < __fieldModel.height; h++) 
			{
				for (var w:int = 0; w < __fieldModel.width; w++) 
				{
					switch(__fieldModel.gameField[h][w])
					{
						case FieldModel.DECOR_1:
							var decore:SimpleImage = new SimpleImage(assets.getTexture("object_1"));
							__decoreCanvas.addChild( decore );
							decore.x = w*Options.TAP_SIZE; decore.y = h*Options.TAP_SIZE;
							break;
						case FieldModel.DECOR_2:
							decore = new SimpleImage(assets.getTexture("object_2"));
							__decoreCanvas.addChild( decore );
							decore.x = w*Options.TAP_SIZE; decore.y = h*Options.TAP_SIZE;
							break;
					}
				}
			}	
		}
		
		private function drawPointsCanvas():void
		{
			__pointsCanvas = new PointsCanvas();
			addChild(__pointsCanvas);
		}
		
		private function drawUI():void
		{
			__gameUI = new GameUI();
			addChild(__gameUI);
		}
		
		override protected function onResize(e:Event):void
		{
			backgroundResize();
			decoreResize();
			pointsCanvasResize();
		}
		
		private function decoreResize():void
		{
			__decoreCanvas.scaleY = __decoreCanvas.scaleX = __currentScale;
			
			__decoreCanvas.x = (stage.stageWidth - __canvasWidth*__currentScale) >> 1;
			__decoreCanvas.y = (stage.stageHeight - __canvasHeight*__currentScale) >> 1;
		}
		
		private function backgroundResize():void
		{
			__background.x = stage.stageWidth >> 1;
			__background.y = stage.stageHeight >> 1;
			
			__background.height = stage.stageHeight;
			__background.scaleX = __background.scaleY;
			
			if(__background.width < stage.stageWidth)
			{
				__background.width = stage.stageWidth;
				__background.scaleY = __background.scaleX;
			}
			
			__currentScale = __background.scaleY;
		}
		
		private function pointsCanvasResize():void
		{			
			__pointsCanvas.scaleX = __gameUI.scaleX = __pointsCanvas.scaleY = __gameUI.scaleY = __currentScale;
			
			__gameUI.x = __pointsCanvas.x = (stage.stageWidth - (__canvasWidth - Options.TAP_SIZE)*__currentScale) >> 1;
			__gameUI.y = __pointsCanvas.y = (stage.stageHeight - (__canvasHeight - Options.TAP_SIZE)*__currentScale) >> 1;
		}
		
		override protected function destroy(e:Event):void
		{
			super.destroy(e);
		}
	}
}