package AI
{
	import flash.geom.Point;
	
	import game.model.gameplay.FieldModel;

	public class PatternConvertor
	{
		private var __patternLenght:uint;
		static public var INSTANCE:PatternConvertor;
		private var patternORIGN:Pattern 
		public function PatternConvertor()
		{
			INSTANCE = this;	
			patternORIGN = new Pattern(99);
		}
		
		private function createChildPattern():void
		{
			__patternLenght = patternORIGN.p0.length;
			
			var pattern_90:Vector.<PointInfo> = invertAngle( patternORIGN.p0, "p90" );
			var pattern_180:Vector.<PointInfo> = invertAngle( pattern_90, "p180" );
			var pattern_270:Vector.<PointInfo> = invertAngle( pattern_180, "p270" );
			
			var pattern_reflex:Vector.<PointInfo> = invertDirection( patternORIGN.p0, "pr0" );
			var pattern_90_reflex:Vector.<PointInfo> = invertDirection( pattern_90, "pr90" );
			var pattern_180_reflex:Vector.<PointInfo> = invertDirection( pattern_180, "pr180" );
			var pattern_270_reflex:Vector.<PointInfo> = invertDirection( pattern_270, "pr270" );
		}
		
		private function invertAngle(pattern:Vector.<PointInfo>, info:String):Vector.<PointInfo>
		{
			var list:Vector.<PointInfo> = new Vector.<PointInfo>();
			var p:PointInfo;
			var str:String = "";
			
			for (var i:int = 0; i < __patternLenght; i++) 
			{
					p = pattern[i];
					
					list.push( new PointInfo(-p.y, p.type, p.x ));
					str += "new PointInfo(" + String(-p.y) + ", " + p.type + ", " + String(p.x) + "),";						
			}
			
			trace(info + ".push(" +  str.slice(0,  str.length - 1)  +  ");");
			return list;
			}
					
		private function invertDirection(pattern:Vector.<PointInfo>, info:String):Vector.<PointInfo>
		{
			var list:Vector.<PointInfo> = new Vector.<PointInfo>();
			var p:PointInfo;
			var str:String = "";
			
			for (var i:int = 0; i < __patternLenght; i++) 
			{
				p = pattern[i];
				
				if(p.x != 0)
				{
					list.push( new PointInfo(-p.x, p.type, p.y ));
					str += "new PointInfo(" + String(-p.x) + ", " + p.type + ", " + String(p.y) + "),";			
				}
				else 
				{
					list.push( new PointInfo(p.x, p.type, p.y ));
					str += "new PointInfo(" + String(p.x) + ", " + p.type + ", " + String(p.y) + "),";			
				}	
			}
			trace(info + ".push(" +  str.slice(0, str.length - 1)  +  ");");
			return list;
		}
		
		public function createPattern():void
		{
			//create_pattern
			var field:Array = [	[ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
								[ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
								[ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
								[ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
								[ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
								[ 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
								[ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
								[ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
								[ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
								[ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
								[ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
								[ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
								[ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
								[ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
								[ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
								[ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]];;
			var tp:Point = new Point(10, 6);
			var str:String = "";
			
			for (var h:int = 0; h < FieldModel.INSTANCE.height; h++) 
			{
				for (var w:int = 0; w < FieldModel.INSTANCE.width; w++) 
				{
					if(field[h][w] == FieldModel.BLUE || field[h][w] == FieldModel.RED)
					{
						str += "new PointInfo(" + String(w - tp.x) + ", " + field[h][w] + ", " + String(h - tp.y) + "),\n";
						patternORIGN.p0.push( new PointInfo(w - tp.x, field[h][w], h - tp.y));
					}
				}
			}
			str += "new PointInfo(0, CENTER, 0)";
			trace("p0.push(" +  str  +  ");");
			
			patternORIGN.p0.push(new PointInfo(0, FieldModel.CENTER, 0));
			createChildPattern();
			
		}
	}
}