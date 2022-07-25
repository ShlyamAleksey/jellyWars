package AI
{
	import flash.geom.Point;
	import flash.utils.getTimer;
	
	import constant.AIEvent;
	import constant.BonusEvent;
	import constant.GamePlayEvent;
	
	import events.SAEvent;
	
	import game.model.BonusModel;
	import game.model.gameplay.FieldModel;
	import game.model.gameplay.GameModel;
	import game.model.graph.Graph;
	import game.model.graph.Vertex;
	
	import starling.events.EventDispatcher;
	
	public class AIModel extends EventDispatcher
	{
		static public var INSTANCE:AIModel;
		static public var AI_STATUS:Boolean = false;
		
		private var __model:GameModel;
		private var __field:FieldModel;
		
		private var __patternFinder:PatternModel;
		private var __loopStorage:Vector.<String> = new Vector.<String>();
		
		private var dataGraph:Graph;
		
		public function AIModel()
		{
			INSTANCE = this;
			__model = GameModel.INSTANCE;
			__field = FieldModel.INSTANCE;
			
			__patternFinder = new PatternModel();
			__patternFinder.createPaterns();

		}
		
		public function setAIMove(data:Object):void
		{
			if(data.currentStep == GameModel.RED && AI_STATUS && data.needMoveEnemy && __field.possibleMove.length > 0) 
			{
				dispatchEvent( new SAEvent(AIEvent.ON_MOVE, { "position" : findBestPoint().clone()}));
			}
		}
		
		private function findBestPoint():Point
		{
			var bestPoint:Point;
			
			bestPoint = findChain(__model.blueGraph);
			if(bestPoint == null)bestPoint = findChain(__model.redGraph);
			if(bestPoint == null) bestPoint = findDoubleChain();
			if(bestPoint == null) bestPoint = findPatterns();
			
			return bestPoint;
		}
	
		private function findDoubleChain():Point
		{
			dataGraph = __model.redGraph;
			for each (var p:Point in __field.possibleMove) 
			{
				var v:Vertex = new Vertex(); v.position = p.clone();
				dataGraph.addVertex( v) ;
				dataGraph.createEdges(v);
				
				for each (var pT:Point in __field.possibleMove) 
				{
					if(pT != p)
					{
						var vT:Vertex = new Vertex(); vT.position = pT.clone();
						dataGraph.addVertex( vT) ;
						dataGraph.createEdges(vT);

						var __loopList:Vector.<Vector.<Vertex>> = dataGraph.depthFirstSearch();

						for (var i:int = 0; i < __loopList.length; i++) 
						{	
							if(__loopList[i].length > 5)
							{
								if(checkLoop(__model.loop2String(__loopList[i])))
								{
									destroyTempVertex(v);
									destroyTempVertex(vT);
									return p.clone();
								}
							}
						}	
						
						destroyTempVertex(vT);
					}
				}				
				destroyTempVertex(v);
			}
			return null;
		}
		
		private function findChain(graph:Graph):Point
		{
			dataGraph = graph;
			for each (var p:Point in __field.possibleMove) 
			{
				var v:Vertex = new Vertex(); v.position = p.clone();
				dataGraph.addVertex(v) ;
				dataGraph.createEdges(v);
				
				var __loopList:Vector.<Vector.<Vertex>> = dataGraph.depthFirstSearch();
				for (var i:int = 0; i < __loopList.length; i++) 
				{	
					if(__loopList[i].length > 5)
					{
						if(checkLoop(__model.loop2String(__loopList[i])))
						{
							destroyTempVertex(v);
							return p.clone();
						}						
					}
				}	
				destroyTempVertex(v);
			}
			return null;
		}
		
		private function destroyTempVertex(v:Vertex):void
		{
			dataGraph.destroyEdge(v);
			dataGraph.destroyVertex(v);
			dataGraph.removeNeightbor(v);
		}
		
		private function checkLoop(loopString:String):Boolean
		{
			//trace(loopString);
			var consist:Boolean = false;
			for each (var j:String in __loopStorage) 
			{
				if(j == loopString)
//				if(loopString.search(j) != -1)
				{
					consist = true; break;
				}
			}
			if(!consist) 
			{
				__loopStorage.push(loopString);
				return true;
			}
			else return false;
		}
		
		private function findPatterns():Point
		{
			var bestPoint:Point;
			var bestPriority:Number = -1;
			var tempPriority:Number = -1;
			var bestPattern:uint;
			
			var start:int = getTimer();
			var log:String = "";
			for each (var p:Point in __field.possibleMove) 
			{
				tempPriority = __patternFinder.findPattern(p);
				if(bestPriority < tempPriority) 
				{
					bestPriority = tempPriority;
					bestPoint = p.clone();
					bestPattern = __patternFinder.bestPattern;
				}
			}	
			
			//console("PATTERN #" + bestPattern + ":", bestPriority)
			if(bestPriority == -1) 
			{
				var rand:int = int(__field.possibleMove.length*Math.random());
				return __field.possibleMove[rand];
			}
			else return bestPoint;
		}
	}
}