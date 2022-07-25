package game.model.algorithms
{
	import game.model.graph.Graph;
	import game.model.graph.Vertex;

	public class DepthFirstSearch
	{
		protected var __graph:Graph;
		protected var __vertexList:Vector.<Vertex>;
		protected var visited:Vector.<Boolean>; 
		
		public function DepthFirstSearch()
		{
			
		}
		
		public function start(graph:Graph):void
		{
			__graph = graph;
			__vertexList = graph.vertexList;
			
			//trace("_____________");
			visited = new Vector.<Boolean>();
			for (var i:int = 0; i < __vertexList.length; i++) 
			{
				visited.push(false);
			}
			сonnectedСomponent(0);
		}
		
		private function сonnectedСomponent(index:uint):void
		{
			dps(__vertexList[index], 0);
			for (var i:int = 0; i < visited.length; i++) 
			{
				if( !visited[i] )
				{
					сonnectedСomponent(i);
					break;
				}
			}	
		}			
			
		protected function dps(vertex:Vertex, parentIndex:uint):void
		{
			var neighbors:Vector.<Vertex> = vertex.neighbors;
			var index:uint = vertex.index;
			visited[index] = true;
			trace("IN ", index);
			for (var i:int = 0; i < neighbors.length; i++) 
			{
				if( !visited[neighbors[i].index] )
				{
					dps(neighbors[i], index);
				}
			}
			trace("OUT ", index);
		}
	}
}