package game.model.gameplay
{
	import flash.geom.Point;

	public class Resource
	{
		public var type:uint;
		public var position:Point;
		
		public function Resource(type:uint, position:Point)
		{
			this.type = type;
			this.position = position;
		}
	}
}