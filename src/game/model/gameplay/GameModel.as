package game.model.gameplay
{
	import flash.geom.Point;
	
	import console.console;
	
	import constant.GamePlayEvent;
	
	import display.SimpleSprite;
	import display.managers.WindowsManager;
	
	import events.SAEvent;
	
	import game.model.algorithms.PointInPolygon;
	import game.model.graph.AIGrahp;
	import game.model.graph.Graph;
	import game.model.graph.Vertex;
	
	import starling.events.EventDispatcher;
	
	public class GameModel extends EventDispatcher
	{
		static public var INSTANCE:GameModel;
		
		static public const BLUE:String = "0x0000ff";
		static public const RED:String = "0xff0000";
		
		private var __curentStep:String;
		
		private var __blueGraph:Graph;
		private var __redGraph:Graph;
		
		private var __pointSearch:PointInPolygon;
		private var __currentGraph:Graph;
		private var __enemyGraph:Graph;
		
		public var loopStorage:Vector.<String>;
		
		

		public function GameModel()
		{
			INSTANCE = this;
		}
		
		public function get curentStep():String
		{
			return __curentStep;
		}

		public function start():void
		{
			__curentStep = BLUE;
//			__curentStep = RED;
			
			__blueGraph = new Graph(BLUE);
			__redGraph = new Graph(RED);
			
			if(!JellyWars.TEST )
			{
				if(__curentStep == RED) WindowsManager.show(SimpleSprite);
			}
			
			__pointSearch = new PointInPolygon();
			loopStorage = new Vector.<String>();
		}
		
		public function addVertex(position:Point):void
		{
			//console("GameModel.INSTANCE.addVertex(new Point(" + position.x + "," + position.y + "));")

			switch(__curentStep)
			{
				case BLUE:
					__currentGraph = __blueGraph;
					__enemyGraph = __redGraph;
					__curentStep = RED;
					break;
				case RED: 
					__currentGraph = __redGraph;
					__enemyGraph = __blueGraph;
					__curentStep = BLUE;
					break;
			}	
			
			var vertex:Vertex = new Vertex(); vertex.position = position.clone();
			
			__currentGraph.addVertex( vertex );
			__currentGraph.createEdges( vertex );

			findCapture();
			dispatchEvent( new SAEvent( GamePlayEvent.ON_STEP, {"currentStep" : __curentStep, "position" : position, "index":vertex.index, "needMoveEnemy" : true}));
		}
		
		public function drawVertex(position:Point):void
		{
			__currentGraph = __redGraph;
			__enemyGraph = __blueGraph;
			__curentStep = BLUE;
			
			var v:Vertex = new Vertex(); v.position = position.clone();
			__blueGraph.addVertex( v );
			__blueGraph.createEdges( v );
			findCapture();
			dispatchEvent( new SAEvent( GamePlayEvent.ON_STEP, {"currentStep" : RED, "position" : v.position, "index":v.index, "needMoveEnemy" : false}));
		}
		
		private function findCapture():void
		{
			var __loopList:Vector.<Vector.<Vertex>> = __currentGraph.depthFirstSearch();
			var enemyVertexes:Vector.<Vertex> = __enemyGraph.vertexList;
			var destroyList:Vector.<Vertex> = new Vector.<Vertex>();
			
			for (var v:int = 0; v < enemyVertexes.length; v++) 
			{
				for (var i:int = 0; i < __loopList.length; i++) 
				{
					if( __pointSearch.pointInPolygon(__loopList[i], enemyVertexes[v].position) )
					{
						destroyList.push(enemyVertexes[v]);
						__currentGraph.coveredLoops.push(__loopList[i]);
						showCaptureLoop(__loopList[i]);
						break;
					}
				}	
			}	
			
			destroyVertexes(destroyList);
		}
		
		private function destroyVertexes(list:Vector.<Vertex>):void
		{
			for each (var i:Vertex in list) 
			{
				dispatchEvent( new SAEvent( GamePlayEvent.ON_DESTROY_VERTEX, {"position" : i.position}));
				ScoreModel.INSTANCE.setScore();
				__enemyGraph.destroyEdge(i);
				__enemyGraph.destroyVertex(i);
			}	
		}
		
		public function destroyVertex(p:Point):void
		{		
			for (var i:int = 0; i < __redGraph.vertexList.length; i++) 
			{
				var v:Vertex = __redGraph.vertexList[i];
				for (var j:int = 0; j < v.neighbors.length; j++) 
				{
					var pt:Point = v.neighbors[j].position.clone();
					if(pt.x == p.x && pt.y == p.y)
					{
						v.neighbors.splice(j, 1);
						break;
					}
				}
				
				if(v.position.x == p.x && v.position.y == p.y)
				{
					__redGraph.destroyEdge(v);
					__redGraph.destroyVertex(v);
					break;
				}
			}
		}
		
		public function allowRemove(p:Point):Boolean
		{
			if(__redGraph.coveredLoops)
			{
				for (var k:int = 0; k < __redGraph.coveredLoops.length; k++) 
				{
					for (var m:int = 0; m < __redGraph.coveredLoops[k].length; m++) 
					{
						if(	redGraph.coveredLoops[k][m].position.x == p.x &&
							redGraph.coveredLoops[k][m].position.y == p.y) return false;
					}
				}
			}
			return true;
		}
		
		private function showCaptureLoop(loop:Vector.<Vertex>):void
		{
			var pointsList:Vector.<Point> = new Vector.<Point>();
			var loopString:String = "";
			for (var i:int = 0; i < loop.length; i++) 
			{
				pointsList.push(loop[i].position.clone());
				loopString += loop[i].index + "-";
			}		
			sendLoop(loopString, pointsList);
		}
		
		public function loop2String(loop:Vector.<Vertex>):String
		{
			var loopString:String = "";
			for (var i:int = 0; i < loop.length; i++) 
			{
				loopString += loop[i].index + "-";
			}	
			
			return loopString;
		}
		
		private function sendLoop(loopString:String, pointsList:Vector.<Point>):void
		{
			var consist:Boolean = false;
			for each (var j:String in loopStorage) 
			{
				if(j == loopString)
//				if(loopString.search(j) != -1)
				{
					consist = true; break;
				}
			}
			
			if(!consist)
			{
				dispatchEvent( new SAEvent(GamePlayEvent.ON_CREATE_EDGE, {"list" : pointsList}));
				loopStorage.push(loopString);
			}	
		}
		
		public function get redGraph():Graph
		{
			return __redGraph;
		}
		
		public function get blueGraph():Graph
		{
			return __blueGraph;
		}
		
		public function destroy():void
		{
			
		}	
	}
}