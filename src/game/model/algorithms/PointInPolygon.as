package game.model.algorithms
{
	import flash.geom.Point;
	
	import starling.geom.Polygon;
	import game.model.graph.Vertex;

	public class PointInPolygon
	{
		public function PointInPolygon()
		{
		}
		
		public function pointInPolygon(polygon:Vector.<Vertex>, point:Point):Boolean
		{
			var pointsList:Array = new Array();
			var nextPoint:Point;
			
			for (var i:int = 0; i < polygon.length; i++) 
			{
				nextPoint = new Point( polygon[i].position.x, polygon[i].position.y);
				pointsList.push( nextPoint );
			}
			
			var poly:Polygon = new Polygon(pointsList);
			
			var area:Number = poly.area;
			poly.reverse(); 
			if(poly.area < area) poly.reverse(); 
						
			return poly.containsPoint(point);
		}
		
/*		public function pointInPolygon(polygon:Vector.<Vertex>, point:Point):Boolean
		{
			var sum:Number = 0;
			var str:String = "";
			for (var i:int = 0; i < polygon.length; i++) 
			{
				if(i != polygon.length - 1 ) var angle:Number =  getAngle(polygon[i].position, polygon[i + 1].position, point);
				else angle = getAngle(polygon[i].position, polygon[0].position, point);	
				
				str += angle + " + ";
				sum += angle;
			}
			
			if(Math.abs(sum) == 360) return true;
			
			return false;
		}
		
		private function getAngle(pt1:Point,pt2:Point, mainPoint:Point):Number
		{
			var angle1:Number = Math.atan2(mainPoint.y - pt1.y, mainPoint.x - pt1.x) / Math.PI * 180;
			var angle2:Number = Math.atan2(mainPoint.y - pt2.y, mainPoint.x - pt2.x) / Math.PI * 180;
			
			if(angle1 < 0) angle1 = 360 + angle1; 
			if(angle2 < 0) angle2 = 360 + angle2; 
			
			var angle:Number = Math.round(angle2) - Math.round(angle1);
			
			if(angle < -180) angle += 360;
			if(angle > 180) angle -= 360;
			
			return angle;
		}*/
	}
}