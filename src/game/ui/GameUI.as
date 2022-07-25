package game.ui
{
	import flash.geom.Point;
	
	import constant.Options;
	
	import display.SimpleSprite;
	
	import game.model.gameplay.FieldModel;
	import game.view.gameplay.StoneView;
	
	import starling.events.Event;
	
	public class GameUI extends SimpleSprite
	{
		private var __model:FieldModel;
		
		public function GameUI()
		{
		}
		
		override protected function init(e:Event = null):void
		{
			super.init(e);
			__model = FieldModel.INSTANCE;
			createTapGrid();
			
			onResize(null);
		}
		
		private function createTapGrid():void
		{
			for (var h:int = 0; h < __model.height; h++) 
			{
				for (var w:int = 0; w < __model.width; w++) 
				{
					switch(__model.gameField[h][w])
					{
						case 0:
							break;
						case FieldModel.FREE:
							var ta:TapAreaUI = new TapAreaUI();
								ta.x = Options.TAP_SIZE*w; ta.y = Options.TAP_SIZE*h; 
							this.addChild(ta);
							break;
						case FieldModel.BLUE_STONE:
						case FieldModel.RED_STONE:
						case FieldModel.YELLOW_STONE:
						case FieldModel.PURPLE_STONE:
							ta = new TapAreaUI();
							ta.x = Options.TAP_SIZE*w; ta.y = Options.TAP_SIZE*h; 
							this.addChild(ta);
							
							var stone:StoneView = new StoneView(__model.gameField[h][w], new Point(w, h));
								stone.x = Options.TAP_SIZE*w; stone.y = Options.TAP_SIZE*h; 
							this.addChild(stone);
							break;
					}
				}
			}	
		}
		
		override protected function onResize(e:Event):void
		{
		}
		
		override protected function destroy(e:Event):void
		{
			super.destroy(e);
		}
	}
}