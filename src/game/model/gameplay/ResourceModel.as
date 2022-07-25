package game.model.gameplay
{
	import flash.geom.Point;

	import constant.ResourceEvent;
	
	import events.SAEvent;
	
	import game.model.algorithms.PointInPolygon;
	
	import starling.events.EventDispatcher;
	
	import temp.player;
	
	public class ResourceModel extends EventDispatcher
	{
		static public var INSTANCE:ResourceModel;
		
		private var __fieldModel:FieldModel;
		private var __gameModel:GameModel;
		private var __recourceList:Vector.<Resource>;
		private var __pointInPoly:PointInPolygon;
		
		public function ResourceModel()
		{
			INSTANCE = this;
			
			__pointInPoly = new PointInPolygon();
			
			__fieldModel = FieldModel.INSTANCE;
			__gameModel = GameModel.INSTANCE;
			recordResource();
		}
		
		private function recordResource():void
		{	
			var lenght:uint = __fieldModel.pointsField.length;
			__recourceList = new Vector.<Resource>();
			for (var i:int = 0; i < __fieldModel.height; i++) 
			{
				for (var j:int = 0; j < __fieldModel.width; j++) 
				{
					var stone:uint  = __fieldModel.gameField[i][j];
					
					if(	stone == FieldModel.BLUE_STONE || 
						stone == FieldModel.PURPLE_STONE ||
						stone == FieldModel.YELLOW_STONE ||
						stone == FieldModel.RED_STONE)
					{
						__recourceList.push( new Resource(stone, new Point(j, i)));
					}
				}
			}
		}
		
		public function addResource(position:Point):void
		{
			for (var r:int = 0; r < __recourceList.length; r++) 
			{
				if(__recourceList[r].position.x == position.x && __recourceList[r].position.y == position.y)
				{
					switch(__recourceList[r].type)
					{
						case FieldModel.RED_STONE:
							player.resource.red = player.resource.red + 1;
							break;
						case FieldModel.PURPLE_STONE:
							player.resource.purple = player.resource.purple + 1;
							break;
						case FieldModel.YELLOW_STONE:
							player.resource.yellow = player.resource.yellow + 1;
							break;
						case FieldModel.BLUE_STONE:
							player.resource.blue = player.resource.blue + 1;
							break;
					}
					
					dispatchEvent(new SAEvent(ResourceEvent.FIND_STONE, {"resource" : __recourceList[r]}));
					__recourceList.splice(r, 1);
					
					
					return;
				}
			}
		}
		
		public function destroy():void
		{
		}
	}
}