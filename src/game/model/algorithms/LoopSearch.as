package game.model.algorithms
{
	import game.model.graph.Graph;
	import game.model.graph.Vertex;

	public class LoopSearch extends DepthFirstSearch
	{
		public var loopList:Vector.<Vector.<Vertex>> = new Vector.<Vector.<Vertex>>();
		private var __loopPath:Vector.<Vertex> = new Vector.<Vertex>();
		
		public function LoopSearch()
		{

		}
		
		override public function start(graph:Graph):void
		{
			loopList = new Vector.<Vector.<Vertex>>();
			super.start(graph);
		}
		
		override protected function dps(vertex:Vertex, parentIndex:uint):void
		{
			var neighbors:Vector.<Vertex> = vertex.neighbors;
			var index:uint = vertex.index;
			visited[index] = true;
			
			addToPath(vertex);	
			for (var i:int = 0; i < neighbors.length; i++) 
			{
				if( !visited[neighbors[i].index] ) dps(neighbors[i], index);
				else if(parentIndex != neighbors[i].index) 
				{
//					console(getLoopPath(vertex, neighbors[i] ));
					var __path:Vector.<Vertex> = getLoopPath(vertex, neighbors[i]);
//					console(__path);
					if(__path.length > 3 ) loopList.push( __path );
				}
			}
			removeFromPath(vertex);
		}
		
		private function getLoopPath(vertex1:Vertex, vertex2:Vertex):Vector.<Vertex>
		{
			var __record:int = -1;
			
			var __path:Vector.<Vertex> = new Vector.<Vertex>();
			for (var i:int = 0; i < __loopPath.length; i++) 
			{	
				if(__loopPath[i].index == vertex1.index) __record = vertex2.index;
				if(__loopPath[i].index == vertex2.index)  __record = vertex1.index;
				
				if(__record != -1) __path.push(__loopPath[i]);	
				if(__loopPath[i].index == __record) break;
			}

			return __path;
		}
		
		private function console(v:Vector.<Vertex>):void
		{
			var __path:String = "";
			if(v.length < 2) return;
			
			for (var i:int = 0; i < v.length; i++) 
			{
				__path += v[i].index + " ";
			}
			trace(__path);
		}
		
		private function addToPath(vertex:Vertex):void
		{
			__loopPath.push(vertex);
		}
		
		private function removeFromPath(vertex:Vertex):void
		{
			for (var i:int = 0; i < __loopPath.length; i++) 
			{
				if(__loopPath[i].index == vertex.index) 
				{
					__loopPath.splice(i, 1);
					return;
				}
			}
		}
	}
}