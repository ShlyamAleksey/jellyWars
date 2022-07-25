package game.model.graph
{
	import flash.geom.Point;

	public class Vertex
	{
		public var position:Point;
		public var index:uint;	
		//public var active:Boolean;	
		
		private var __neighbors:Vector.<Vertex>;
		
		public function Vertex()
		{
			__neighbors = new Vector.<Vertex>();
		}
		
		public function set neighbors(value:Vector.<Vertex>):void
		{
			__neighbors = value;
		}

		public function addNeighbor(vertex:Vertex):void
		{
			__neighbors.push(vertex);
		}
		
		public function get neighbors():Vector.<Vertex>
		{	
			return __neighbors;
		}
	}
}