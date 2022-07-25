package game.model.gameplay
{
	import flash.geom.Point;
	
	import constant.GamePlayEvent;
	
	import events.SAEvent;
	
	import game.model.algorithms.PointInPolygon;
	import game.model.graph.Graph;
	import game.model.graph.Vertex;
	
	import starling.events.EventDispatcher;
	
	public class FieldModel extends EventDispatcher
	{
	
		static public var FREE:uint = 1;
		static public var DECOR_1:uint = 2;
		static public var DECOR_2:uint = 3;
		
		static public var BLUE_STONE:uint = 4;
		static public var RED_STONE:uint = 5;
		static public var YELLOW_STONE:uint = 6;
		static public var PURPLE_STONE:uint = 7;
		
		static public const RED:uint = 1 << 0;
		static public const BLUE:uint = 1 << 1;
		static public const PINK:uint = 1 << 2;
		static public const GREEN:uint = 1 << 3;
		static public const CENTER:uint = 1 << 4;
		static public const EMPTY:uint = 1 << 5;
		static public const WHITE:uint = 1 << 6;
			
		static public var INSTANCE:FieldModel;
		
		private var __gameField:Array;
		private var __pointsField:Vector.<Vector.<uint>>;
		
		private var __model:GameModel;
		
		public var width:uint;
		public var height:uint;
		
		public var possibleMove:Vector.<Point>;
		
		public function FieldModel()
		{
			INSTANCE = this;
			
			createGameField();
	
			height = __gameField.length;
			width = __gameField[0].length;
			
			createPointsField();
			createPossibleList();
			
			__model = GameModel.INSTANCE;
			__model.addEventListener(GamePlayEvent.ON_STEP, onStep);
		}
		
		private function onStep(e:SAEvent):void
		{
			var current:Point = e.eventData.position.clone();
				removeFromPossible(current);
				removeCovered(__model.blueGraph);
				removeCovered(__model.redGraph);
				changeField( e.eventData.currentStep, current);
		}
		
		private function createGameField():void
		{
			__gameField = [	[ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
							[ 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0],
							[ 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 3, 0, 0, 0, 0, 0, 0, 0, 0],
							[ 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0],
							[ 0, 1, 1, 2, 0, 0, 1, 1, 7, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0],
							[ 0, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0],
							[ 0, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0],
							[ 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0],
							[ 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0],
							[ 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 5, 1, 1, 1, 0, 0, 0],
							[ 0, 0, 0, 0, 1, 1, 6, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0],
							[ 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0],
							[ 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0],
							[ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
							[ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
							[ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]];
		}
		
		private function createPointsField():void
		{
			__pointsField = new Vector.<Vector.<uint>>();
			
			for (var h:int = 0; h < height; h++) 
			{
				__pointsField.push( new Vector.<uint>() );
				for (var w:int = 0; w < width; w++) 
				{
					if(__gameField[h][w] == 1) __pointsField[h].push( WHITE );
					else __pointsField[h].push( EMPTY );	
				}
			}
		}
		
		public function changeField(type:String, position:Point):void
		{
			if(type == GameModel.BLUE) __pointsField[position.y][position.x] = BLUE;
			else __pointsField[position.y][position.x] = RED;
			
			console();
		} 
		
		public function get gameField():Array
		{
			return __gameField;
		}	
		
		public function get pointsField():Vector.<Vector.<uint>>
		{
			return __pointsField;
		}
		
		private function createPossibleList():void
		{
			possibleMove = new Vector.<Point>();
			for (var h:int = 0; h < height; h++) 
			{
				for (var w:int = 0; w < width; w++) 
				{
					if(gameField[h][w] == 1) possibleMove.push( new Point(w, h));
				}
			}
		}
		
		
		public function addToPossible(position:Point):void
		{
			possibleMove.push( position.clone());
		}
		
		public function removeFromPossible(p:Point):void
		{
			var point:Point;
			for (var i:int = 0; i < possibleMove.length; i++) 
			{
				point = possibleMove[i]; 
				if(point.x == p.x && point.y == p.y)
				{
					possibleMove.splice(i, 1);
					break;
				}
			}	
			
			if(possibleMove.length == 0) dispatchEvent( new SAEvent(GamePlayEvent.COMPLETE_LEVEL));
		}
		
		public function removeCovered(graph:Graph):void
		{
			var __pointSearch:PointInPolygon = new PointInPolygon();
			var __loops:Vector.<Vector.<Vertex>> = graph.coveredLoops;
			for (var v:int = possibleMove.length - 1; v >= 0; v--) 
			{
				for (var i:int = 0; i < __loops.length; i++) 
				{
					if( __pointSearch.pointInPolygon(__loops[i], possibleMove[v]) )
					{
						possibleMove.splice(v, 1);
						break;
					}
				}	
			}			
		}
		
		private function console():void
		{
			return;
			var str:String = '';
			
			for (var i:int = 0; i < height; i++) 
			{
				for (var j:int = 0; j < width; j++) 
				{
					if( __pointsField[i][j] == WHITE) str += "-  ";
					else 
					{
						if(__pointsField[i][j] > 9) str += __pointsField[i][j] + " ";
						else str += __pointsField[i][j] + "  ";
					}
				}
				str = str + "\n";
			}
			
			trace(str);
			trace('----------------------');
		}
		
		public function destroy():void
		{
			__model.removeEventListener(GamePlayEvent.ON_STEP, onStep);
		}
	}
}