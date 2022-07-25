package game.model.graph
{
	public class Edge
	{
		public var begin:Vertex;
		public var end:Vertex;
		public var distanse:Number;
		
		public function Edge(begin:Vertex, end:Vertex)
		{
			this.begin = begin;
			this.end = end;
		}
	}
}