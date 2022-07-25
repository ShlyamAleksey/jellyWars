package game.model.graph
{
	import flash.geom.Point;
	import flash.utils.ByteArray;
	
	import constant.GraphEvent;
	
	import events.SAEvent;
	
	import game.model.algorithms.DepthFirstSearch;
	import game.model.algorithms.LoopSearch;
	
	import starling.events.EventDispatcher;

	public class Graph extends EventDispatcher
	{
		protected var __vertex_arr:Vector.<Vertex>;
		protected var __edge_arr:Vector.<Edge>;
		protected var __depthSearch:DepthFirstSearch;
		protected var __lastIndex:uint = 0;
		public var name:String;
		public var loops:Vector.<Vector.<Vertex>>;
		public var coveredLoops:Vector.<Vector.<Vertex>> = new Vector.<Vector.<Vertex>>();

		public function Graph(name:String) 
		{
			__vertex_arr = new Vector.<Vertex>();
			__edge_arr = new Vector.<Edge>();
			__depthSearch = new LoopSearch();
			
			this.name = name;
		}

		public function addVertex(vertex:Vertex):void
		{
			__vertex_arr.push(vertex);
			vertex.index = __lastIndex;
			__lastIndex++;
		}
		
		public function addEdge(edge:Edge):void
		{
			__edge_arr.push(edge);
			//dispatchEvent( new SAEvent( GraphEvent.ON_ADD_EDGE, { "edge" : edge}));
		}

		public function get vertexList():Vector.<Vertex>
		{
			return __vertex_arr;
		}
		
		public function get edgeList():Vector.<Edge>
		{
			return __edge_arr;
		}
		static public var NEIGHDORS:int = 0;
		public function createEdges(vertex:Vertex):void
		{
			var pt:Point = vertex.position.clone();
			for each (var v:Vertex in __vertex_arr) 
			{
				var sqrt:uint = Math.sqrt( 	Math.pow( Math.abs(v.position.x - pt.x), 2) + 
					Math.pow( Math.abs(v.position.y - pt.y), 2));
				
				if(sqrt == 1) 
				{
					addEdge( new Edge(v, vertex) );
					vertex.addNeighbor(v);
					v.addNeighbor(vertex);
				}	
			}
		}
		
		public function destroyEdge(vertex:Vertex = null):void
		{
			var i:int = __edge_arr.length;
			while( i > 0)
			{		
				i--;
				if( __edge_arr[i].begin.index == vertex.index ||
					__edge_arr[i].end.index == vertex.index	)
				{
					__edge_arr.splice(i, 1);
				}
			}
		}
		
		public function destroyVertex(vertex:Vertex):void
		{
			for (var i:int = 0; i < __vertex_arr.length; i++) 
			{
				if(__vertex_arr[i].index == vertex.index)
				{
					__vertex_arr[i].neighbors = new Vector.<Vertex>();
					removeNeightbor(__vertex_arr[i]);
					updateIndexes(i);
					__vertex_arr.splice(i, 1);
					__lastIndex--;
					break;
				}
			}
		}
		
		public function removeNeightbor(neighbor:Vertex):void
		{
			for (var i:int = 0; i < vertexList.length; i++) 
			{
				var v:Vertex = vertexList[i];
				for (var j:int = 0; j < v.neighbors.length; j++) 
				{
					var pt:Point = v.neighbors[j].position.clone();
					if(pt.x == neighbor.position.x && pt.y == neighbor.position.y)
					{
						v.neighbors.splice(j, 1);
						break;
					}
				}
			}
		}
		
		private function updateIndexes(from:uint):void
		{
			for (var i:int = from; i < vertexList.length; i++) 
			{
				vertexList[i].index--;
			}
		}
		
		public function depthFirstSearch():Vector.<Vector.<Vertex>>
		{
			__depthSearch.start(this);
			loops = (__depthSearch as LoopSearch).loopList;
			return loops;
		}
	}
}