package AI
{
	import flash.geom.Point;
	import flash.utils.getTimer;
	
	import game.model.gameplay.FieldModel;

	public class PatternModel
	{
		private var __field:FieldModel;
		private var  __pointsField:Vector.<Vector.<uint>>;
		private var __currentPriority:Number = -1;
		private var __priority:Number = -1;
		private var __targetPoint:Point;
		private var __patternLenght:uint;
		private var __paterns:Vector.<Pattern>;
		
		public var bestPattern:uint = 0;
		
		private const WHITE_MASK:uint = FieldModel.RED | FieldModel.BLUE;
		private const RED_MASK:uint = FieldModel.GREEN | FieldModel.BLUE | FieldModel.WHITE;
		private const BLUE_MASK:uint = FieldModel.RED | FieldModel.PINK | FieldModel.WHITE;
		
		private var chain:Vector.<uint> = new <uint>[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18,
														19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 32, 33, 34,
														35, 36, 37, 38, 39, 40, 41,
														99	];
		
		public function PatternModel()
		{
			__field = FieldModel.INSTANCE;
			__pointsField = __field.pointsField;
		}
		
		public function findPattern(targetPoint:Point):Number
		{		
			var patternORIGN:Pattern;
			__targetPoint = targetPoint;
			__priority = -1;
			
			for (var i:uint = 0; i < chain.length; i++) 
			{
				bestPattern = chain[i];
				patternORIGN = __paterns[i];
				
				__currentPriority = patternORIGN.priority;
				__patternLenght = patternORIGN.p0.length;
				
				if(findMatch(patternORIGN.p0)) return __priority;
				if(findMatch(patternORIGN.pr0)) return __priority;
				
				if(findMatch(patternORIGN.p90)) return __priority;
				if(findMatch(patternORIGN.pr90)) return __priority;
				
				if(findMatch(patternORIGN.p180)) return __priority;
				if(findMatch(patternORIGN.pr180)) return __priority;
				
				if(findMatch(patternORIGN.p270)) return __priority;
				if(findMatch(patternORIGN.pr270)) return __priority;
			}	
			return __priority;
		}
		
		public function createPaterns():void
		{
			new PatternConvertor();
			__paterns = new Vector.<Pattern>();	
			for (var i:uint = 0; i < chain.length; i++) 
			{
				__paterns.push(new Pattern(chain[i]));
			}
		}
		
		private function findMatch(pattern:Vector.<PointInfo>):Boolean
		{
			var pX:uint, pY:uint, __type:uint;
	
			for (var i:uint = 0; i < __patternLenght; i++) 
			{
				__type = pattern[i].type;
				
				pX = __targetPoint.x + pattern[i].x
				pY = __targetPoint.y + pattern[i].y;
				
				if(pX > -1 && pY > -1 && pX < __field.width && pY < __field.height) 
				{
					switch(__pointsField[pY][pX])
					{
						case FieldModel.EMPTY:
							return false;
							break;
						case FieldModel.WHITE:
							if(__type & WHITE_MASK) return false;
							break;
						case FieldModel.BLUE:
							if(__type & BLUE_MASK) return false;
							break;
						case FieldModel.RED:
							if(__type & RED_MASK) return false;
							break;
					}
				}
				else return false;
			}	
			
			__priority = (__currentPriority > __priority) ? __currentPriority : __priority;
			return true;
		}
	}
}