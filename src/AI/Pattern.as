package AI
{
	import game.model.gameplay.FieldModel;

	public dynamic class Pattern extends Array
	{
		static public var TOTAL:int = 34;
		private var __priority:Number = -1;
		
		public var p0:Vector.<PointInfo> = new Vector.<PointInfo>();
		public var p90:Vector.<PointInfo> = new Vector.<PointInfo>();
		public var p180:Vector.<PointInfo> = new Vector.<PointInfo>();
		public var p270:Vector.<PointInfo> = new Vector.<PointInfo>();
		
		public var pr0:Vector.<PointInfo> = new Vector.<PointInfo>();
		public var pr90:Vector.<PointInfo> = new Vector.<PointInfo>();
		public var pr180:Vector.<PointInfo> = new Vector.<PointInfo>();
		public var pr270:Vector.<PointInfo> = new Vector.<PointInfo>();
		
		//Добавлять по приоритету на уменшение
		public function Pattern(type:uint = 0)
		{
			list(type);
		}
		
		public function list(type:uint = 0):void
		{
			with(FieldModel)
			{
				switch(type)
				{
					case 1:
						p0.push(	new PointInfo(-1,  WHITE, -1),
										new PointInfo(-2, RED, 0),
										new PointInfo(-1, BLUE, 0),
										new PointInfo(0, CENTER,  0),
										new PointInfo(-1, RED, 1),
										new PointInfo(0, BLUE, 1),
										new PointInfo(1, WHITE, 1),
										new PointInfo(0, RED, 2));
						
						p90.push(new PointInfo(1, WHITE, -1), new PointInfo(0, RED, -2), new PointInfo(0, BLUE, -1), new PointInfo(0, CENTER, 0), new PointInfo(-1, RED, -1), new PointInfo(-1, BLUE, 0), new PointInfo(-1, WHITE, 1), new PointInfo(-2, RED, 0));
						p180.push(new PointInfo(1, WHITE, 1), new PointInfo(2, RED, 0), new PointInfo(1, BLUE, 0), new PointInfo(0, CENTER, 0), new PointInfo(1, RED, -1), new PointInfo(0, BLUE, -1), new PointInfo(-1, WHITE, -1), new PointInfo(0, RED, -2));
						p270.push(new PointInfo(-1, WHITE, 1), new PointInfo(0, RED, 2), new PointInfo(0, BLUE, 1), new PointInfo(0, CENTER, 0), new PointInfo(1, RED, 1), new PointInfo(1, BLUE, 0), new PointInfo(1, WHITE, -1), new PointInfo(2, RED, 0));
						pr0.push(new PointInfo(1, WHITE, -1), new PointInfo(2, RED, 0), new PointInfo(1, BLUE, 0), new PointInfo(0, CENTER, 0), new PointInfo(1, RED, 1), new PointInfo(0, BLUE, 1), new PointInfo(-1, WHITE, 1), new PointInfo(0, RED, 2));
						pr90.push(new PointInfo(-1, WHITE, -1), new PointInfo(0, RED, -2), new PointInfo(0, BLUE, -1), new PointInfo(0, CENTER, 0), new PointInfo(1, RED, -1), new PointInfo(1, BLUE, 0), new PointInfo(1, WHITE, 1), new PointInfo(2, RED, 0));
						pr180.push(new PointInfo(-1, WHITE, 1), new PointInfo(-2, RED, 0), new PointInfo(-1, BLUE, 0), new PointInfo(0, CENTER, 0), new PointInfo(-1, RED, -1), new PointInfo(0, BLUE, -1), new PointInfo(1, WHITE, -1), new PointInfo(0, RED, -2));
						pr270.push(new PointInfo(1, WHITE, 1), new PointInfo(0, RED, 2), new PointInfo(0, BLUE, 1), new PointInfo(0, CENTER, 0), new PointInfo(-1, RED, 1), new PointInfo(-1, BLUE, 0), new PointInfo(-1, WHITE, -1), new PointInfo(-2, RED, 0));
						__priority = 1;
						break;
					case 2:
						p0.push(	new PointInfo(0, BLUE, -1), 
									new PointInfo(-1, RED, 0),
									new PointInfo(0, CENTER,  0),
									new PointInfo(1, RED, 0),
									new PointInfo(0, BLUE, 1));
						
						p90.push(new PointInfo(1, BLUE, 0), new PointInfo(0, RED, -1), new PointInfo(0, CENTER, 0), new PointInfo(0, RED, 1), new PointInfo(-1, BLUE, 0));
						p180.push(new PointInfo(0, BLUE, 1), new PointInfo(1, RED, 0), new PointInfo(0, CENTER, 0), new PointInfo(-1, RED, 0), new PointInfo(0, BLUE, -1));
						p270.push(new PointInfo(-1, BLUE, 0), new PointInfo(0, RED, 1), new PointInfo(0, CENTER, 0), new PointInfo(0, RED, -1), new PointInfo(1, BLUE, 0));
						pr0.push(new PointInfo(0, BLUE, -1), new PointInfo(1, RED, 0), new PointInfo(0, CENTER, 0), new PointInfo(-1, RED, 0), new PointInfo(0, BLUE, 1));
						pr90.push(new PointInfo(-1, BLUE, 0), new PointInfo(0, RED, -1), new PointInfo(0, CENTER, 0), new PointInfo(0, RED, 1), new PointInfo(1, BLUE, 0));
						pr180.push(new PointInfo(0, BLUE, 1), new PointInfo(-1, RED, 0), new PointInfo(0, CENTER, 0), new PointInfo(1, RED, 0), new PointInfo(0, BLUE, -1));
						pr270.push(new PointInfo(1, BLUE, 0), new PointInfo(0, RED, 1), new PointInfo(0, CENTER, 0), new PointInfo(0, RED, -1), new PointInfo(-1, BLUE, 0));

						__priority = 1;
						break;
					case 3:
						p0.push(	new PointInfo(-1, BLUE, -1), 
									new PointInfo(0, PINK, -1),
									new PointInfo(-1, RED, 0),
									new PointInfo(0, CENTER,  0),
									new PointInfo(1, PINK, 0),
									new PointInfo(0, BLUE, 1));
						
						p90.push(new PointInfo(1, BLUE, -1), new PointInfo(1, PINK, 0), new PointInfo(0, RED, -1), new PointInfo(0, CENTER, 0), new PointInfo(0, PINK, 1), new PointInfo(-1, BLUE, 0));
						p180.push(new PointInfo(1, BLUE, 1), new PointInfo(0, PINK, 1), new PointInfo(1, RED, 0), new PointInfo(0, CENTER, 0), new PointInfo(-1, PINK, 0), new PointInfo(0, BLUE, -1));
						p270.push(new PointInfo(-1, BLUE, 1), new PointInfo(-1, PINK, 0), new PointInfo(0, RED, 1), new PointInfo(0, CENTER, 0), new PointInfo(0, PINK, -1), new PointInfo(1, BLUE, 0));
						pr0.push(new PointInfo(1, BLUE, -1), new PointInfo(0, PINK, -1), new PointInfo(1, RED, 0), new PointInfo(0, CENTER, 0), new PointInfo(-1, PINK, 0), new PointInfo(0, BLUE, 1));
						pr90.push(new PointInfo(-1, BLUE, -1), new PointInfo(-1, PINK, 0), new PointInfo(0, RED, -1), new PointInfo(0, CENTER, 0), new PointInfo(0, PINK, 1), new PointInfo(1, BLUE, 0));
						pr180.push(new PointInfo(-1, BLUE, 1), new PointInfo(0, PINK, 1), new PointInfo(-1, RED, 0), new PointInfo(0, CENTER, 0), new PointInfo(1, PINK, 0), new PointInfo(0, BLUE, -1));
						pr270.push(new PointInfo(1, BLUE, 1), new PointInfo(1, PINK, 0), new PointInfo(0, RED, 1), new PointInfo(0, CENTER, 0), new PointInfo(0, PINK, -1), new PointInfo(-1, BLUE, 0));

						__priority = 0.9;
						break;
					
					case 4:
						p0.push(	new PointInfo(-1, BLUE, -1), 
									new PointInfo(0, PINK, -1),
									new PointInfo(-2, RED, 0),
									new PointInfo(-1, RED, 0),
									new PointInfo(0, CENTER,  0),
									new PointInfo(-1, BLUE, 1),
									new PointInfo(0, PINK, 1));
						
						p90.push(new PointInfo(1, BLUE, -1), new PointInfo(1, PINK, 0), new PointInfo(0, RED, -2), new PointInfo(0, RED, -1), new PointInfo(0, CENTER, 0), new PointInfo(-1, BLUE, -1), new PointInfo(-1, PINK, 0));
						p180.push(new PointInfo(1, BLUE, 1), new PointInfo(0, PINK, 1), new PointInfo(2, RED, 0), new PointInfo(1, RED, 0), new PointInfo(0, CENTER, 0), new PointInfo(1, BLUE, -1), new PointInfo(0, PINK, -1));
						p270.push(new PointInfo(-1, BLUE, 1), new PointInfo(-1, PINK, 0), new PointInfo(0, RED, 2), new PointInfo(0, RED, 1), new PointInfo(0, CENTER, 0), new PointInfo(1, BLUE, 1), new PointInfo(1, PINK, 0));
						pr0.push(new PointInfo(1, BLUE, -1), new PointInfo(0, PINK, -1), new PointInfo(2, RED, 0), new PointInfo(1, RED, 0), new PointInfo(0, CENTER, 0), new PointInfo(1, BLUE, 1), new PointInfo(0, PINK, 1));
						pr90.push(new PointInfo(-1, BLUE, -1), new PointInfo(-1, PINK, 0), new PointInfo(0, RED, -2), new PointInfo(0, RED, -1), new PointInfo(0, CENTER, 0), new PointInfo(1, BLUE, -1), new PointInfo(1, PINK, 0));
						pr180.push(new PointInfo(-1, BLUE, 1), new PointInfo(0, PINK, 1), new PointInfo(-2, RED, 0), new PointInfo(-1, RED, 0), new PointInfo(0, CENTER, 0), new PointInfo(-1, BLUE, -1), new PointInfo(0, PINK, -1));
						pr270.push(new PointInfo(1, BLUE, 1), new PointInfo(1, PINK, 0), new PointInfo(0, RED, 2), new PointInfo(0, RED, 1), new PointInfo(0, CENTER, 0), new PointInfo(-1, BLUE, 1), new PointInfo(-1, PINK, 0));

						__priority = 0.9;
						break;
					case 5:
						p0.push(	new PointInfo(0, RED, -1), 
									new PointInfo(1, BLUE, -1),
									new PointInfo(0, CENTER,  0),
									new PointInfo(1, RED, 0),
									new PointInfo(0, BLUE, 1));
						
						p90.push(new PointInfo(1, RED, 0), new PointInfo(1, BLUE, 1), new PointInfo(0, CENTER, 0), new PointInfo(0, RED, 1), new PointInfo(-1, BLUE, 0));
						p180.push(new PointInfo(0, RED, 1), new PointInfo(-1, BLUE, 1), new PointInfo(0, CENTER, 0), new PointInfo(-1, RED, 0), new PointInfo(0, BLUE, -1));
						p270.push(new PointInfo(-1, RED, 0), new PointInfo(-1, BLUE, -1), new PointInfo(0, CENTER, 0), new PointInfo(0, RED, -1), new PointInfo(1, BLUE, 0));
						pr0.push(new PointInfo(0, RED, -1), new PointInfo(-1, BLUE, -1), new PointInfo(0, CENTER, 0), new PointInfo(-1, RED, 0), new PointInfo(0, BLUE, 1));
						pr90.push(new PointInfo(-1, RED, 0), new PointInfo(-1, BLUE, 1), new PointInfo(0, CENTER, 0), new PointInfo(0, RED, 1), new PointInfo(1, BLUE, 0));
						pr180.push(new PointInfo(0, RED, 1), new PointInfo(1, BLUE, 1), new PointInfo(0, CENTER, 0), new PointInfo(1, RED, 0), new PointInfo(0, BLUE, -1));
						pr270.push(new PointInfo(1, RED, 0), new PointInfo(1, BLUE, -1), new PointInfo(0, CENTER, 0), new PointInfo(0, RED, -1), new PointInfo(-1, BLUE, 0));

						__priority = 0.9;
						break;
					case 6:
						p0.push(	new PointInfo(0, RED, -2), 
									new PointInfo(-1,  WHITE, -1),
									new PointInfo(0, WHITE, -1),
									new PointInfo(1, BLUE, -1),
									new PointInfo(0, CENTER,  0),
									new PointInfo(1, WHITE, 0),
									new PointInfo(2, RED, 0),
									new PointInfo(1, WHITE, 1));
						
						p90.push(new PointInfo(2, RED, 0), new PointInfo(1, WHITE, -1), new PointInfo(1, WHITE, 0), new PointInfo(1, BLUE, 1), new PointInfo(0, CENTER, 0), new PointInfo(0, WHITE, 1), new PointInfo(0, RED, 2), new PointInfo(-1, WHITE, 1));
						p180.push(new PointInfo(0, RED, 2), new PointInfo(1, WHITE, 1), new PointInfo(0, WHITE, 1), new PointInfo(-1, BLUE, 1), new PointInfo(0, CENTER, 0), new PointInfo(-1, WHITE, 0), new PointInfo(-2, RED, 0), new PointInfo(-1, WHITE, -1));
						p270.push(new PointInfo(-2, RED, 0), new PointInfo(-1, WHITE, 1), new PointInfo(-1, WHITE, 0), new PointInfo(-1, BLUE, -1), new PointInfo(0, CENTER, 0), new PointInfo(0, WHITE, -1), new PointInfo(0, RED, -2), new PointInfo(1, WHITE, -1));
						pr0.push(new PointInfo(0, RED, -2), new PointInfo(1, WHITE, -1), new PointInfo(0, WHITE, -1), new PointInfo(-1, BLUE, -1), new PointInfo(0, CENTER, 0), new PointInfo(-1, WHITE, 0), new PointInfo(-2, RED, 0), new PointInfo(-1, WHITE, 1));
						pr90.push(new PointInfo(-2, RED, 0), new PointInfo(-1, WHITE, -1), new PointInfo(-1, WHITE, 0), new PointInfo(-1, BLUE, 1), new PointInfo(0, CENTER, 0), new PointInfo(0, WHITE, 1), new PointInfo(0, RED, 2), new PointInfo(1, WHITE, 1));
						pr180.push(new PointInfo(0, RED, 2), new PointInfo(-1, WHITE, 1), new PointInfo(0, WHITE, 1), new PointInfo(1, BLUE, 1), new PointInfo(0, CENTER, 0), new PointInfo(1, WHITE, 0), new PointInfo(2, RED, 0), new PointInfo(1, WHITE, -1));
						pr270.push(new PointInfo(2, RED, 0), new PointInfo(1, WHITE, 1), new PointInfo(1, WHITE, 0), new PointInfo(1, BLUE, -1), new PointInfo(0, CENTER, 0), new PointInfo(0, WHITE, -1), new PointInfo(0, RED, -2), new PointInfo(-1, WHITE, -1));

						__priority = 0.8;
						break;
					case 7:
						p0.push(	new PointInfo(1, WHITE, -1), 
									new PointInfo(2, WHITE, -1),
									new PointInfo(0, CENTER,  0),
									new PointInfo(1, WHITE, 0),
									new PointInfo(2, WHITE, 0),
									new PointInfo(3, BLUE, 0),
									new PointInfo(-1, WHITE, 1),
									new PointInfo(0, WHITE, 1),
									new PointInfo(1, RED, 1),
									new PointInfo(0, BLUE, 2));
						
						p90.push(new PointInfo(1, WHITE, 1), new PointInfo(1, WHITE, 2), new PointInfo(0, CENTER, 0), new PointInfo(0, WHITE, 1), new PointInfo(0, WHITE, 2), new PointInfo(0, BLUE, 3), new PointInfo(-1, WHITE, -1), new PointInfo(-1, WHITE, 0), new PointInfo(-1, RED, 1), new PointInfo(-2, BLUE, 0));
						p180.push(new PointInfo(-1, WHITE, 1), new PointInfo(-2, WHITE, 1), new PointInfo(0, CENTER, 0), new PointInfo(-1, WHITE, 0), new PointInfo(-2, WHITE, 0), new PointInfo(-3, BLUE, 0), new PointInfo(1, WHITE, -1), new PointInfo(0, WHITE, -1), new PointInfo(-1, RED, -1), new PointInfo(0, BLUE, -2));
						p270.push(new PointInfo(-1, WHITE, -1), new PointInfo(-1, WHITE, -2), new PointInfo(0, CENTER, 0), new PointInfo(0, WHITE, -1), new PointInfo(0, WHITE, -2), new PointInfo(0, BLUE, -3), new PointInfo(1, WHITE, 1), new PointInfo(1, WHITE, 0), new PointInfo(1, RED, -1), new PointInfo(2, BLUE, 0));
						pr0.push(new PointInfo(-1, WHITE, -1), new PointInfo(-2, WHITE, -1), new PointInfo(0, CENTER, 0), new PointInfo(-1, WHITE, 0), new PointInfo(-2, WHITE, 0), new PointInfo(-3, BLUE, 0), new PointInfo(1, WHITE, 1), new PointInfo(0, WHITE, 1), new PointInfo(-1, RED, 1), new PointInfo(0, BLUE, 2));
						pr90.push(new PointInfo(-1, WHITE, 1), new PointInfo(-1, WHITE, 2), new PointInfo(0, CENTER, 0), new PointInfo(0, WHITE, 1), new PointInfo(0, WHITE, 2), new PointInfo(0, BLUE, 3), new PointInfo(1, WHITE, -1), new PointInfo(1, WHITE, 0), new PointInfo(1, RED, 1), new PointInfo(2, BLUE, 0));
						pr180.push(new PointInfo(1, WHITE, 1), new PointInfo(2, WHITE, 1), new PointInfo(0, CENTER, 0), new PointInfo(1, WHITE, 0), new PointInfo(2, WHITE, 0), new PointInfo(3, BLUE, 0), new PointInfo(-1, WHITE, -1), new PointInfo(0, WHITE, -1), new PointInfo(1, RED, -1), new PointInfo(0, BLUE, -2));
						pr270.push(new PointInfo(1, WHITE, -1), new PointInfo(1, WHITE, -2), new PointInfo(0, CENTER, 0), new PointInfo(0, WHITE, -1), new PointInfo(0, WHITE, -2), new PointInfo(0, BLUE, -3), new PointInfo(-1, WHITE, 1), new PointInfo(-1, WHITE, 0), new PointInfo(-1, RED, -1), new PointInfo(-2, BLUE, 0));

						__priority = 0.8;
						break;
					case 8:
						p0.push(	new PointInfo(1, WHITE, -1), 
									new PointInfo(2, WHITE, -1),
									new PointInfo(0, CENTER,  0),
									new PointInfo(1, WHITE, 0),
									new PointInfo(2, WHITE, 0),
									new PointInfo(3, BLUE, 0),
									new PointInfo(-1, WHITE, 1),
									new PointInfo(0, WHITE, 1),
									new PointInfo(1, PINK, 1),
									new PointInfo(2, RED, 1),
									new PointInfo(0, BLUE, 2));
						
						p90.push(new PointInfo(1, WHITE, 1), new PointInfo(1, WHITE, 2), new PointInfo(0, CENTER, 0), new PointInfo(0, WHITE, 1), new PointInfo(0, WHITE, 2), new PointInfo(0, BLUE, 3), new PointInfo(-1, WHITE, -1), new PointInfo(-1, WHITE, 0), new PointInfo(-1, PINK, 1), new PointInfo(-1, RED, 2), new PointInfo(-2, BLUE, 0));
						p180.push(new PointInfo(-1, WHITE, 1), new PointInfo(-2, WHITE, 1), new PointInfo(0, CENTER, 0), new PointInfo(-1, WHITE, 0), new PointInfo(-2, WHITE, 0), new PointInfo(-3, BLUE, 0), new PointInfo(1, WHITE, -1), new PointInfo(0, WHITE, -1), new PointInfo(-1, PINK, -1), new PointInfo(-2, RED, -1), new PointInfo(0, BLUE, -2));
						p270.push(new PointInfo(-1, WHITE, -1), new PointInfo(-1, WHITE, -2), new PointInfo(0, CENTER, 0), new PointInfo(0, WHITE, -1), new PointInfo(0, WHITE, -2), new PointInfo(0, BLUE, -3), new PointInfo(1, WHITE, 1), new PointInfo(1, WHITE, 0), new PointInfo(1, PINK, -1), new PointInfo(1, RED, -2), new PointInfo(2, BLUE, 0));
						pr0.push(new PointInfo(-1, WHITE, -1), new PointInfo(-2, WHITE, -1), new PointInfo(0, CENTER, 0), new PointInfo(-1, WHITE, 0), new PointInfo(-2, WHITE, 0), new PointInfo(-3, BLUE, 0), new PointInfo(1, WHITE, 1), new PointInfo(0, WHITE, 1), new PointInfo(-1, PINK, 1), new PointInfo(-2, RED, 1), new PointInfo(0, BLUE, 2));
						pr90.push(new PointInfo(-1, WHITE, 1), new PointInfo(-1, WHITE, 2), new PointInfo(0, CENTER, 0), new PointInfo(0, WHITE, 1), new PointInfo(0, WHITE, 2), new PointInfo(0, BLUE, 3), new PointInfo(1, WHITE, -1), new PointInfo(1, WHITE, 0), new PointInfo(1, PINK, 1), new PointInfo(1, RED, 2), new PointInfo(2, BLUE, 0));
						pr180.push(new PointInfo(1, WHITE, 1), new PointInfo(2, WHITE, 1), new PointInfo(0, CENTER, 0), new PointInfo(1, WHITE, 0), new PointInfo(2, WHITE, 0), new PointInfo(3, BLUE, 0), new PointInfo(-1, WHITE, -1), new PointInfo(0, WHITE, -1), new PointInfo(1, PINK, -1), new PointInfo(2, RED, -1), new PointInfo(0, BLUE, -2));
						pr270.push(new PointInfo(1, WHITE, -1), new PointInfo(1, WHITE, -2), new PointInfo(0, CENTER, 0), new PointInfo(0, WHITE, -1), new PointInfo(0, WHITE, -2), new PointInfo(0, BLUE, -3), new PointInfo(-1, WHITE, 1), new PointInfo(-1, WHITE, 0), new PointInfo(-1, PINK, -1), new PointInfo(-1, RED, -2), new PointInfo(-2, BLUE, 0));

						__priority = 0.8;
						break;
					case 9:
						p0.push(	new PointInfo(1, RED, -2), 
									new PointInfo(-1, RED, -1),
									new PointInfo(0, BLUE, -1),
									new PointInfo(1, WHITE, -1),
									new PointInfo(-1, PINK, 0),
									new PointInfo(0, CENTER,  0),
									new PointInfo(1, PINK, 0),
									new PointInfo(0, BLUE, 1));
						
						p90.push(new PointInfo(2, RED, 1), new PointInfo(1, RED, -1), new PointInfo(1, BLUE, 0), new PointInfo(1, WHITE, 1), new PointInfo(0, PINK, -1), new PointInfo(0, CENTER, 0), new PointInfo(0, PINK, 1), new PointInfo(-1, BLUE, 0));
						p180.push(new PointInfo(-1, RED, 2), new PointInfo(1, RED, 1), new PointInfo(0, BLUE, 1), new PointInfo(-1, WHITE, 1), new PointInfo(1, PINK, 0), new PointInfo(0, CENTER, 0), new PointInfo(-1, PINK, 0), new PointInfo(0, BLUE, -1));
						p270.push(new PointInfo(-2, RED, -1), new PointInfo(-1, RED, 1), new PointInfo(-1, BLUE, 0), new PointInfo(-1, WHITE, -1), new PointInfo(0, PINK, 1), new PointInfo(0, CENTER, 0), new PointInfo(0, PINK, -1), new PointInfo(1, BLUE, 0));
						pr0.push(new PointInfo(-1, RED, -2), new PointInfo(1, RED, -1), new PointInfo(0, BLUE, -1), new PointInfo(-1, WHITE, -1), new PointInfo(1, PINK, 0), new PointInfo(0, CENTER, 0), new PointInfo(-1, PINK, 0), new PointInfo(0, BLUE, 1));
						pr90.push(new PointInfo(-2, RED, 1), new PointInfo(-1, RED, -1), new PointInfo(-1, BLUE, 0), new PointInfo(-1, WHITE, 1), new PointInfo(0, PINK, -1), new PointInfo(0, CENTER, 0), new PointInfo(0, PINK, 1), new PointInfo(1, BLUE, 0));
						pr180.push(new PointInfo(1, RED, 2), new PointInfo(-1, RED, 1), new PointInfo(0, BLUE, 1), new PointInfo(1, WHITE, 1), new PointInfo(-1, PINK, 0), new PointInfo(0, CENTER, 0), new PointInfo(1, PINK, 0), new PointInfo(0, BLUE, -1));
						pr270.push(new PointInfo(2, RED, -1), new PointInfo(1, RED, 1), new PointInfo(1, BLUE, 0), new PointInfo(1, WHITE, -1), new PointInfo(0, PINK, 1), new PointInfo(0, CENTER, 0), new PointInfo(0, PINK, -1), new PointInfo(-1, BLUE, 0));

						__priority = 0.7;
						break;
					case 10:
						p0.push(	new PointInfo(0, RED, -2), 
									new PointInfo(-1, RED, -1),
									new PointInfo(0, BLUE, -1),
									new PointInfo(1, WHITE, -1),
									new PointInfo(0, CENTER,  0));
						
						p90.push(new PointInfo(2, RED, 0), new PointInfo(1, RED, -1), new PointInfo(1, BLUE, 0), new PointInfo(1, WHITE, 1), new PointInfo(0, CENTER, 0));
						p180.push(new PointInfo(0, RED, 2), new PointInfo(1, RED, 1), new PointInfo(0, BLUE, 1), new PointInfo(-1, WHITE, 1), new PointInfo(0, CENTER, 0));
						p270.push(new PointInfo(-2, RED, 0), new PointInfo(-1, RED, 1), new PointInfo(-1, BLUE, 0), new PointInfo(-1, WHITE, -1), new PointInfo(0, CENTER, 0));
						pr0.push(new PointInfo(0, RED, -2), new PointInfo(1, RED, -1), new PointInfo(0, BLUE, -1), new PointInfo(-1, WHITE, -1), new PointInfo(0, CENTER, 0));
						pr90.push(new PointInfo(-2, RED, 0), new PointInfo(-1, RED, -1), new PointInfo(-1, BLUE, 0), new PointInfo(-1, WHITE, 1), new PointInfo(0, CENTER, 0));
						pr180.push(new PointInfo(0, RED, 2), new PointInfo(-1, RED, 1), new PointInfo(0, BLUE, 1), new PointInfo(1, WHITE, 1), new PointInfo(0, CENTER, 0));
						pr270.push(new PointInfo(2, RED, 0), new PointInfo(1, RED, 1), new PointInfo(1, BLUE, 0), new PointInfo(1, WHITE, -1), new PointInfo(0, CENTER, 0));

						__priority = 0.2;
						break;
					case 11:
						p0.push(	new PointInfo(0, RED, -1), 
									new PointInfo(-2, PINK, 0),
									new PointInfo(-1, BLUE, 0),
									new PointInfo(0, CENTER,  0),
									new PointInfo(-1, RED, 1));
						
						p90.push(new PointInfo(1, RED, 0), new PointInfo(0, PINK, -2), new PointInfo(0, BLUE, -1), new PointInfo(0, CENTER, 0), new PointInfo(-1, RED, -1));
						p180.push(new PointInfo(0, RED, 1), new PointInfo(2, PINK, 0), new PointInfo(1, BLUE, 0), new PointInfo(0, CENTER, 0), new PointInfo(1, RED, -1));
						p270.push(new PointInfo(-1, RED, 0), new PointInfo(0, PINK, 2), new PointInfo(0, BLUE, 1), new PointInfo(0, CENTER, 0), new PointInfo(1, RED, 1));
						pr0.push(new PointInfo(0, RED, -1), new PointInfo(2, PINK, 0), new PointInfo(1, BLUE, 0), new PointInfo(0, CENTER, 0), new PointInfo(1, RED, 1));
						pr90.push(new PointInfo(-1, RED, 0), new PointInfo(0, PINK, -2), new PointInfo(0, BLUE, -1), new PointInfo(0, CENTER, 0), new PointInfo(1, RED, -1));
						pr180.push(new PointInfo(0, RED, 1), new PointInfo(-2, PINK, 0), new PointInfo(-1, BLUE, 0), new PointInfo(0, CENTER, 0), new PointInfo(-1, RED, -1));
						pr270.push(new PointInfo(1, RED, 0), new PointInfo(0, PINK, 2), new PointInfo(0, BLUE, 1), new PointInfo(0, CENTER, 0), new PointInfo(-1, RED, 1));

						__priority = 0.2;
						break;
					case 12:
						p0.push(	new PointInfo(-1, BLUE, -1), 
									new PointInfo(-2, PINK, 0),
									new PointInfo(-1, RED, 0),
									new PointInfo(0, CENTER,  0),
									new PointInfo(-1, BLUE, 1));
						
						p90.push(new PointInfo(1, BLUE, -1), new PointInfo(0, PINK, -2), new PointInfo(0, RED, -1), new PointInfo(0, CENTER, 0), new PointInfo(-1, BLUE, -1));
						p180.push(new PointInfo(1, BLUE, 1), new PointInfo(2, PINK, 0), new PointInfo(1, RED, 0), new PointInfo(0, CENTER, 0), new PointInfo(1, BLUE, -1));
						p270.push(new PointInfo(-1, BLUE, 1), new PointInfo(0, PINK, 2), new PointInfo(0, RED, 1), new PointInfo(0, CENTER, 0), new PointInfo(1, BLUE, 1));
						pr0.push(new PointInfo(1, BLUE, -1), new PointInfo(2, PINK, 0), new PointInfo(1, RED, 0), new PointInfo(0, CENTER, 0), new PointInfo(1, BLUE, 1));
						pr90.push(new PointInfo(-1, BLUE, -1), new PointInfo(0, PINK, -2), new PointInfo(0, RED, -1), new PointInfo(0, CENTER, 0), new PointInfo(1, BLUE, -1));
						pr180.push(new PointInfo(-1, BLUE, 1), new PointInfo(-2, PINK, 0), new PointInfo(-1, RED, 0), new PointInfo(0, CENTER, 0), new PointInfo(-1, BLUE, -1));
						pr270.push(new PointInfo(1, BLUE, 1), new PointInfo(0, PINK, 2), new PointInfo(0, RED, 1), new PointInfo(0, CENTER, 0), new PointInfo(-1, BLUE, 1));

						__priority = 0.1;
						break;
					case 13:
						p0.push(	new PointInfo(-1, BLUE, -1), 
									new PointInfo(-2, PINK, 0),
									new PointInfo(-1, RED, 0),
									new PointInfo(0, CENTER,  0),
									new PointInfo(-1, WHITE, 1),
									new PointInfo(0, WHITE, 1),
									new PointInfo(-1, BLUE, 2));
						
						p90.push(new PointInfo(1, BLUE, -1), new PointInfo(0, PINK, -2), new PointInfo(0, RED, -1), new PointInfo(0, CENTER, 0), new PointInfo(-1, WHITE, -1), new PointInfo(-1, WHITE, 0), new PointInfo(-2, BLUE, -1));
						p180.push(new PointInfo(1, BLUE, 1), new PointInfo(2, PINK, 0), new PointInfo(1, RED, 0), new PointInfo(0, CENTER, 0), new PointInfo(1, WHITE, -1), new PointInfo(0, WHITE, -1), new PointInfo(1, BLUE, -2));
						p270.push(new PointInfo(-1, BLUE, 1), new PointInfo(0, PINK, 2), new PointInfo(0, RED, 1), new PointInfo(0, CENTER, 0), new PointInfo(1, WHITE, 1), new PointInfo(1, WHITE, 0), new PointInfo(2, BLUE, 1));
						pr0.push(new PointInfo(1, BLUE, -1), new PointInfo(2, PINK, 0), new PointInfo(1, RED, 0), new PointInfo(0, CENTER, 0), new PointInfo(1, WHITE, 1), new PointInfo(0, WHITE, 1), new PointInfo(1, BLUE, 2));
						pr90.push(new PointInfo(-1, BLUE, -1), new PointInfo(0, PINK, -2), new PointInfo(0, RED, -1), new PointInfo(0, CENTER, 0), new PointInfo(1, WHITE, -1), new PointInfo(1, WHITE, 0), new PointInfo(2, BLUE, -1));
						pr180.push(new PointInfo(-1, BLUE, 1), new PointInfo(-2, PINK, 0), new PointInfo(-1, RED, 0), new PointInfo(0, CENTER, 0), new PointInfo(-1, WHITE, -1), new PointInfo(0, WHITE, -1), new PointInfo(-1, BLUE, -2));
						pr270.push(new PointInfo(1, BLUE, 1), new PointInfo(0, PINK, 2), new PointInfo(0, RED, 1), new PointInfo(0, CENTER, 0), new PointInfo(-1, WHITE, 1), new PointInfo(-1, WHITE, 0), new PointInfo(-2, BLUE, 1));

						__priority = 0.1;
						break;
					case 14:
						p0.push(	new PointInfo(-1, BLUE, -3), 
									new PointInfo(-1, WHITE, -2), 
									new PointInfo(0, WHITE, -2), 
									new PointInfo(-1,  WHITE, -1),
									new PointInfo(0, WHITE, -1),
									new PointInfo(-2, PINK, 0),
									new PointInfo(-1, RED, 0),
									new PointInfo(0, CENTER,  0),
									new PointInfo(-1, WHITE, 1),
									new PointInfo(0, WHITE, 1),
									new PointInfo(-1, BLUE, 2));
						
						p90.push(new PointInfo(3, BLUE, -1), new PointInfo(2, WHITE, -1), new PointInfo(2, WHITE, 0), new PointInfo(1, WHITE, -1), new PointInfo(1, WHITE, 0), new PointInfo(0, PINK, -2), new PointInfo(0, RED, -1), new PointInfo(0, CENTER, 0), new PointInfo(-1, WHITE, -1), new PointInfo(-1, WHITE, 0), new PointInfo(-2, BLUE, -1));
						p180.push(new PointInfo(1, BLUE, 3), new PointInfo(1, WHITE, 2), new PointInfo(0, WHITE, 2), new PointInfo(1, WHITE, 1), new PointInfo(0, WHITE, 1), new PointInfo(2, PINK, 0), new PointInfo(1, RED, 0), new PointInfo(0, CENTER, 0), new PointInfo(1, WHITE, -1), new PointInfo(0, WHITE, -1), new PointInfo(1, BLUE, -2));
						p270.push(new PointInfo(-3, BLUE, 1), new PointInfo(-2, WHITE, 1), new PointInfo(-2, WHITE, 0), new PointInfo(-1, WHITE, 1), new PointInfo(-1, WHITE, 0), new PointInfo(0, PINK, 2), new PointInfo(0, RED, 1), new PointInfo(0, CENTER, 0), new PointInfo(1, WHITE, 1), new PointInfo(1, WHITE, 0), new PointInfo(2, BLUE, 1));
						pr0.push(new PointInfo(1, BLUE, -3), new PointInfo(1, WHITE, -2), new PointInfo(0, WHITE, -2), new PointInfo(1, WHITE, -1), new PointInfo(0, WHITE, -1), new PointInfo(2, PINK, 0), new PointInfo(1, RED, 0), new PointInfo(0, CENTER, 0), new PointInfo(1, WHITE, 1), new PointInfo(0, WHITE, 1), new PointInfo(1, BLUE, 2));
						pr90.push(new PointInfo(-3, BLUE, -1), new PointInfo(-2, WHITE, -1), new PointInfo(-2, WHITE, 0), new PointInfo(-1, WHITE, -1), new PointInfo(-1, WHITE, 0), new PointInfo(0, PINK, -2), new PointInfo(0, RED, -1), new PointInfo(0, CENTER, 0), new PointInfo(1, WHITE, -1), new PointInfo(1, WHITE, 0), new PointInfo(2, BLUE, -1));
						pr180.push(new PointInfo(-1, BLUE, 3), new PointInfo(-1, WHITE, 2), new PointInfo(0, WHITE, 2), new PointInfo(-1, WHITE, 1), new PointInfo(0, WHITE, 1), new PointInfo(-2, PINK, 0), new PointInfo(-1, RED, 0), new PointInfo(0, CENTER, 0), new PointInfo(-1, WHITE, -1), new PointInfo(0, WHITE, -1), new PointInfo(-1, BLUE, -2));
						pr270.push(new PointInfo(3, BLUE, 1), new PointInfo(2, WHITE, 1), new PointInfo(2, WHITE, 0), new PointInfo(1, WHITE, 1), new PointInfo(1, WHITE, 0), new PointInfo(0, PINK, 2), new PointInfo(0, RED, 1), new PointInfo(0, CENTER, 0), new PointInfo(-1, WHITE, 1), new PointInfo(-1, WHITE, 0), new PointInfo(-2, BLUE, 1));

						__priority = 0.1;
						break;
					case 15:
						p0.push(	new PointInfo(-1, BLUE, -3), 
									new PointInfo(-1, WHITE, -2), 
									new PointInfo(0, WHITE, -2), 
									new PointInfo(-1,  WHITE, -1),
									new PointInfo(0, WHITE, -1),
									new PointInfo(-2, PINK, 0),
									new PointInfo(-1, RED, 0),
									new PointInfo(0, CENTER,  0),
									new PointInfo(-1, BLUE, 1));
						
						p90.push(new PointInfo(3, BLUE, -1), new PointInfo(2, WHITE, -1), new PointInfo(2, WHITE, 0), new PointInfo(1, WHITE, -1), new PointInfo(1, WHITE, 0), new PointInfo(0, PINK, -2), new PointInfo(0, RED, -1), new PointInfo(0, CENTER, 0), new PointInfo(-1, BLUE, -1));
						p180.push(new PointInfo(1, BLUE, 3), new PointInfo(1, WHITE, 2), new PointInfo(0, WHITE, 2), new PointInfo(1, WHITE, 1), new PointInfo(0, WHITE, 1), new PointInfo(2, PINK, 0), new PointInfo(1, RED, 0), new PointInfo(0, CENTER, 0), new PointInfo(1, BLUE, -1));
						p270.push(new PointInfo(-3, BLUE, 1), new PointInfo(-2, WHITE, 1), new PointInfo(-2, WHITE, 0), new PointInfo(-1, WHITE, 1), new PointInfo(-1, WHITE, 0), new PointInfo(0, PINK, 2), new PointInfo(0, RED, 1), new PointInfo(0, CENTER, 0), new PointInfo(1, BLUE, 1));
						pr0.push(new PointInfo(1, BLUE, -3), new PointInfo(1, WHITE, -2), new PointInfo(0, WHITE, -2), new PointInfo(1, WHITE, -1), new PointInfo(0, WHITE, -1), new PointInfo(2, PINK, 0), new PointInfo(1, RED, 0), new PointInfo(0, CENTER, 0), new PointInfo(1, BLUE, 1));
						pr90.push(new PointInfo(-3, BLUE, -1), new PointInfo(-2, WHITE, -1), new PointInfo(-2, WHITE, 0), new PointInfo(-1, WHITE, -1), new PointInfo(-1, WHITE, 0), new PointInfo(0, PINK, -2), new PointInfo(0, RED, -1), new PointInfo(0, CENTER, 0), new PointInfo(1, BLUE, -1));
						pr180.push(new PointInfo(-1, BLUE, 3), new PointInfo(-1, WHITE, 2), new PointInfo(0, WHITE, 2), new PointInfo(-1, WHITE, 1), new PointInfo(0, WHITE, 1), new PointInfo(-2, PINK, 0), new PointInfo(-1, RED, 0), new PointInfo(0, CENTER, 0), new PointInfo(-1, BLUE, -1));
						pr270.push(new PointInfo(3, BLUE, 1), new PointInfo(2, WHITE, 1), new PointInfo(2, WHITE, 0), new PointInfo(1, WHITE, 1), new PointInfo(1, WHITE, 0), new PointInfo(0, PINK, 2), new PointInfo(0, RED, 1), new PointInfo(0, CENTER, 0), new PointInfo(-1, BLUE, 1));

					
						__priority = 0.1;
						break;
					case 16:
						p0.push(	new PointInfo(-1,  BLUE, -2), 
									new PointInfo(-1,  WHITE, -1), 
									new PointInfo(0, WHITE, -1), 
									new PointInfo(-2, PINK, 0),
									new PointInfo(-1, RED, 0),
									new PointInfo(0, CENTER,  0),
									new PointInfo(-1, WHITE, 1),
									new PointInfo(0, WHITE, 1),
									new PointInfo(-1, BLUE, 2));
						
						p90.push(new PointInfo(2, BLUE, -1), new PointInfo(1, WHITE, -1), new PointInfo(1, WHITE, 0), new PointInfo(0, PINK, -2), new PointInfo(0, RED, -1), new PointInfo(0, CENTER, 0), new PointInfo(-1, WHITE, -1), new PointInfo(-1, WHITE, 0), new PointInfo(-2, BLUE, -1));
						p180.push(new PointInfo(1, BLUE, 2), new PointInfo(1, WHITE, 1), new PointInfo(0, WHITE, 1), new PointInfo(2, PINK, 0), new PointInfo(1, RED, 0), new PointInfo(0, CENTER, 0), new PointInfo(1, WHITE, -1), new PointInfo(0, WHITE, -1), new PointInfo(1, BLUE, -2));
						p270.push(new PointInfo(-2, BLUE, 1), new PointInfo(-1, WHITE, 1), new PointInfo(-1, WHITE, 0), new PointInfo(0, PINK, 2), new PointInfo(0, RED, 1), new PointInfo(0, CENTER, 0), new PointInfo(1, WHITE, 1), new PointInfo(1, WHITE, 0), new PointInfo(2, BLUE, 1));
						pr0.push(new PointInfo(1, BLUE, -2), new PointInfo(1, WHITE, -1), new PointInfo(0, WHITE, -1), new PointInfo(2, PINK, 0), new PointInfo(1, RED, 0), new PointInfo(0, CENTER, 0), new PointInfo(1, WHITE, 1), new PointInfo(0, WHITE, 1), new PointInfo(1, BLUE, 2));
						pr90.push(new PointInfo(-2, BLUE, -1), new PointInfo(-1, WHITE, -1), new PointInfo(-1, WHITE, 0), new PointInfo(0, PINK, -2), new PointInfo(0, RED, -1), new PointInfo(0, CENTER, 0), new PointInfo(1, WHITE, -1), new PointInfo(1, WHITE, 0), new PointInfo(2, BLUE, -1));
						pr180.push(new PointInfo(-1, BLUE, 2), new PointInfo(-1, WHITE, 1), new PointInfo(0, WHITE, 1), new PointInfo(-2, PINK, 0), new PointInfo(-1, RED, 0), new PointInfo(0, CENTER, 0), new PointInfo(-1, WHITE, -1), new PointInfo(0, WHITE, -1), new PointInfo(-1, BLUE, -2));
						pr270.push(new PointInfo(2, BLUE, 1), new PointInfo(1, WHITE, 1), new PointInfo(1, WHITE, 0), new PointInfo(0, PINK, 2), new PointInfo(0, RED, 1), new PointInfo(0, CENTER, 0), new PointInfo(-1, WHITE, 1), new PointInfo(-1, WHITE, 0), new PointInfo(-2, BLUE, 1));

						__priority = 0.1;
						break;
					case 17:
						p0.push(	new PointInfo(-1, BLUE, -1), 
									new PointInfo(0, RED, -1), 
									new PointInfo(-1, RED, 0), 
									new PointInfo(0, CENTER,  0),
									new PointInfo(1, BLUE, 1));
						
						p90.push(new PointInfo(1, BLUE, -1), new PointInfo(1, RED, 0), new PointInfo(0, RED, -1), new PointInfo(0, CENTER, 0), new PointInfo(-1, BLUE, 1));
						p180.push(new PointInfo(1, BLUE, 1), new PointInfo(0, RED, 1), new PointInfo(1, RED, 0), new PointInfo(0, CENTER, 0), new PointInfo(-1, BLUE, -1));
						p270.push(new PointInfo(-1, BLUE, 1), new PointInfo(-1, RED, 0), new PointInfo(0, RED, 1), new PointInfo(0, CENTER, 0), new PointInfo(1, BLUE, -1));
						pr0.push(new PointInfo(1, BLUE, -1), new PointInfo(0, RED, -1), new PointInfo(1, RED, 0), new PointInfo(0, CENTER, 0), new PointInfo(-1, BLUE, 1));
						pr90.push(new PointInfo(-1, BLUE, -1), new PointInfo(-1, RED, 0), new PointInfo(0, RED, -1), new PointInfo(0, CENTER, 0), new PointInfo(1, BLUE, 1));
						pr180.push(new PointInfo(-1, BLUE, 1), new PointInfo(0, RED, 1), new PointInfo(-1, RED, 0), new PointInfo(0, CENTER, 0), new PointInfo(1, BLUE, -1));
						pr270.push(new PointInfo(1, BLUE, 1), new PointInfo(1, RED, 0), new PointInfo(0, RED, 1), new PointInfo(0, CENTER, 0), new PointInfo(-1, BLUE, -1));

						__priority = 0.1;
						break;
					case 18:
						p0.push(	new PointInfo(0, BLUE, -2), 
									new PointInfo(0, WHITE, -1), 
									new PointInfo(-1, RED, 0), 
									new PointInfo(0, CENTER,  0),
									new PointInfo(-1, BLUE, 1));
						
						p90.push(new PointInfo(2, BLUE, 0), new PointInfo(1, WHITE, 0), new PointInfo(0, RED, -1), new PointInfo(0, CENTER, 0), new PointInfo(-1, BLUE, -1));
						p180.push(new PointInfo(0, BLUE, 2), new PointInfo(0, WHITE, 1), new PointInfo(1, RED, 0), new PointInfo(0, CENTER, 0), new PointInfo(1, BLUE, -1));
						p270.push(new PointInfo(-2, BLUE, 0), new PointInfo(-1, WHITE, 0), new PointInfo(0, RED, 1), new PointInfo(0, CENTER, 0), new PointInfo(1, BLUE, 1));
						pr0.push(new PointInfo(0, BLUE, -2), new PointInfo(0, WHITE, -1), new PointInfo(1, RED, 0), new PointInfo(0, CENTER, 0), new PointInfo(1, BLUE, 1));
						pr90.push(new PointInfo(-2, BLUE, 0), new PointInfo(-1, WHITE, 0), new PointInfo(0, RED, -1), new PointInfo(0, CENTER, 0), new PointInfo(1, BLUE, -1));
						pr180.push(new PointInfo(0, BLUE, 2), new PointInfo(0, WHITE, 1), new PointInfo(-1, RED, 0), new PointInfo(0, CENTER, 0), new PointInfo(-1, BLUE, -1));
						pr270.push(new PointInfo(2, BLUE, 0), new PointInfo(1, WHITE, 0), new PointInfo(0, RED, 1), new PointInfo(0, CENTER, 0), new PointInfo(-1, BLUE, 1));

						
						__priority = 0.1;
						break;
					case 19:
						p0.push(	new PointInfo(-1, BLUE, -1), 
									new PointInfo(1, PINK, -1), 
									new PointInfo(0, CENTER,  0),
									new PointInfo(-1, PINK, 1), 
									new PointInfo(1, BLUE, 1));
						
						p90.push(new PointInfo(1, BLUE, -1), new PointInfo(1, PINK, 1), new PointInfo(0, CENTER, 0), new PointInfo(-1, PINK, -1), new PointInfo(-1, BLUE, 1));
						p180.push(new PointInfo(1, BLUE, 1), new PointInfo(-1, PINK, 1), new PointInfo(0, CENTER, 0), new PointInfo(1, PINK, -1), new PointInfo(-1, BLUE, -1));
						p270.push(new PointInfo(-1, BLUE, 1), new PointInfo(-1, PINK, -1), new PointInfo(0, CENTER, 0), new PointInfo(1, PINK, 1), new PointInfo(1, BLUE, -1));
						pr0.push(new PointInfo(1, BLUE, -1), new PointInfo(-1, PINK, -1), new PointInfo(0, CENTER, 0), new PointInfo(1, PINK, 1), new PointInfo(-1, BLUE, 1));
						pr90.push(new PointInfo(-1, BLUE, -1), new PointInfo(-1, PINK, 1), new PointInfo(0, CENTER, 0), new PointInfo(1, PINK, -1), new PointInfo(1, BLUE, 1));
						pr180.push(new PointInfo(-1, BLUE, 1), new PointInfo(1, PINK, 1), new PointInfo(0, CENTER, 0), new PointInfo(-1, PINK, -1), new PointInfo(1, BLUE, -1));
						pr270.push(new PointInfo(1, BLUE, 1), new PointInfo(1, PINK, -1), new PointInfo(0, CENTER, 0), new PointInfo(-1, PINK, 1), new PointInfo(-1, BLUE, -1));

						
						__priority = 0.05;
						break;
					case 20:
						p0.push(	new PointInfo(0, BLUE, -1), 
									new PointInfo(-1, PINK, 0), 
									new PointInfo(0, CENTER,  0),
									new PointInfo(1, PINK, 0), 
									new PointInfo(0, BLUE, 1));
						
						p90.push(new PointInfo(1, BLUE, 0), new PointInfo(0, PINK, -1), new PointInfo(0, CENTER, 0), new PointInfo(0, PINK, 1), new PointInfo(-1, BLUE, 0));
						p180.push(new PointInfo(0, BLUE, 1), new PointInfo(1, PINK, 0), new PointInfo(0, CENTER, 0), new PointInfo(-1, PINK, 0), new PointInfo(0, BLUE, -1));
						p270.push(new PointInfo(-1, BLUE, 0), new PointInfo(0, PINK, 1), new PointInfo(0, CENTER, 0), new PointInfo(0, PINK, -1), new PointInfo(1, BLUE, 0));
						pr0.push(new PointInfo(0, BLUE, -1), new PointInfo(1, PINK, 0), new PointInfo(0, CENTER, 0), new PointInfo(-1, PINK, 0), new PointInfo(0, BLUE, 1));
						pr90.push(new PointInfo(-1, BLUE, 0), new PointInfo(0, PINK, -1), new PointInfo(0, CENTER, 0), new PointInfo(0, PINK, 1), new PointInfo(1, BLUE, 0));
						pr180.push(new PointInfo(0, BLUE, 1), new PointInfo(-1, PINK, 0), new PointInfo(0, CENTER, 0), new PointInfo(1, PINK, 0), new PointInfo(0, BLUE, -1));
						pr270.push(new PointInfo(1, BLUE, 0), new PointInfo(0, PINK, 1), new PointInfo(0, CENTER, 0), new PointInfo(0, PINK, -1), new PointInfo(-1, BLUE, 0));

						__priority = 0.05;
						break;
					case 21:
						p0.push(	new PointInfo(-1, PINK, -1), 
									new PointInfo(-2, RED, 0),
									new PointInfo(-1, WHITE, 0),
									new PointInfo(0, CENTER,  0),
									new PointInfo(-2, PINK, 1),
									new PointInfo(-1, BLUE, 1),
									new PointInfo(0, WHITE, 1),
									new PointInfo(-1, BLUE, 2));
						
						p90.push(new PointInfo(1, PINK, -1), new PointInfo(0, RED, -2), new PointInfo(0, WHITE, -1), new PointInfo(0, CENTER, 0), new PointInfo(-1, PINK, -2), new PointInfo(-1, BLUE, -1), new PointInfo(-1, WHITE, 0), new PointInfo(-2, BLUE, -1));
						p180.push(new PointInfo(1, PINK, 1), new PointInfo(2, RED, 0), new PointInfo(1, WHITE, 0), new PointInfo(0, CENTER, 0), new PointInfo(2, PINK, -1), new PointInfo(1, BLUE, -1), new PointInfo(0, WHITE, -1), new PointInfo(1, BLUE, -2));
						p270.push(new PointInfo(-1, PINK, 1), new PointInfo(0, RED, 2), new PointInfo(0, WHITE, 1), new PointInfo(0, CENTER, 0), new PointInfo(1, PINK, 2), new PointInfo(1, BLUE, 1), new PointInfo(1, WHITE, 0), new PointInfo(2, BLUE, 1));
						pr0.push(new PointInfo(1, PINK, -1), new PointInfo(2, RED, 0), new PointInfo(1, WHITE, 0), new PointInfo(0, CENTER, 0), new PointInfo(2, PINK, 1), new PointInfo(1, BLUE, 1), new PointInfo(0, WHITE, 1), new PointInfo(1, BLUE, 2));
						pr90.push(new PointInfo(-1, PINK, -1), new PointInfo(0, RED, -2), new PointInfo(0, WHITE, -1), new PointInfo(0, CENTER, 0), new PointInfo(1, PINK, -2), new PointInfo(1, BLUE, -1), new PointInfo(1, WHITE, 0), new PointInfo(2, BLUE, -1));
						pr180.push(new PointInfo(-1, PINK, 1), new PointInfo(-2, RED, 0), new PointInfo(-1, WHITE, 0), new PointInfo(0, CENTER, 0), new PointInfo(-2, PINK, -1), new PointInfo(-1, BLUE, -1), new PointInfo(0, WHITE, -1), new PointInfo(-1, BLUE, -2));
						pr270.push(new PointInfo(1, PINK, 1), new PointInfo(0, RED, 2), new PointInfo(0, WHITE, 1), new PointInfo(0, CENTER, 0), new PointInfo(-1, PINK, 2), new PointInfo(-1, BLUE, 1), new PointInfo(-1, WHITE, 0), new PointInfo(-2, BLUE, 1));

						__priority = 0.05;
						break;
					case 22:
						p0.push(	new PointInfo(0, BLUE, -2), 
									new PointInfo(0, WHITE, -1), 
									new PointInfo(-1, PINK, 0), 
									new PointInfo(0, CENTER,  0),
									new PointInfo(1, PINK, 0), 
									new PointInfo(0, BLUE, 1));
						
						p90.push(new PointInfo(2, BLUE, 0), new PointInfo(1, WHITE, 0), new PointInfo(0, PINK, -1), new PointInfo(0, CENTER, 0), new PointInfo(0, PINK, 1), new PointInfo(-1, BLUE, 0));
						p180.push(new PointInfo(0, BLUE, 2), new PointInfo(0, WHITE, 1), new PointInfo(1, PINK, 0), new PointInfo(0, CENTER, 0), new PointInfo(-1, PINK, 0), new PointInfo(0, BLUE, -1));
						p270.push(new PointInfo(-2, BLUE, 0), new PointInfo(-1, WHITE, 0), new PointInfo(0, PINK, 1), new PointInfo(0, CENTER, 0), new PointInfo(0, PINK, -1), new PointInfo(1, BLUE, 0));
						pr0.push(new PointInfo(0, BLUE, -2), new PointInfo(0, WHITE, -1), new PointInfo(1, PINK, 0), new PointInfo(0, CENTER, 0), new PointInfo(-1, PINK, 0), new PointInfo(0, BLUE, 1));
						pr90.push(new PointInfo(-2, BLUE, 0), new PointInfo(-1, WHITE, 0), new PointInfo(0, PINK, -1), new PointInfo(0, CENTER, 0), new PointInfo(0, PINK, 1), new PointInfo(1, BLUE, 0));
						pr180.push(new PointInfo(0, BLUE, 2), new PointInfo(0, WHITE, 1), new PointInfo(-1, PINK, 0), new PointInfo(0, CENTER, 0), new PointInfo(1, PINK, 0), new PointInfo(0, BLUE, -1));
						pr270.push(new PointInfo(2, BLUE, 0), new PointInfo(1, WHITE, 0), new PointInfo(0, PINK, 1), new PointInfo(0, CENTER, 0), new PointInfo(0, PINK, -1), new PointInfo(-1, BLUE, 0));

						
						__priority = 0.05;
						break;
					case 23:
						p0.push(	new PointInfo(0, BLUE, -2), 
									new PointInfo(0, WHITE, -1), 
									new PointInfo(-1, PINK, 0), 
									new PointInfo(0, CENTER,  0),
									new PointInfo(1, PINK, 0), 
									new PointInfo(0, WHITE, 1), 
									new PointInfo(0, BLUE, 2));
						
						p90.push(new PointInfo(2, BLUE, 0), new PointInfo(1, WHITE, 0), new PointInfo(0, PINK, -1), new PointInfo(0, CENTER, 0), new PointInfo(0, PINK, 1), new PointInfo(-1, WHITE, 0), new PointInfo(-2, BLUE, 0));
						p180.push(new PointInfo(0, BLUE, 2), new PointInfo(0, WHITE, 1), new PointInfo(1, PINK, 0), new PointInfo(0, CENTER, 0), new PointInfo(-1, PINK, 0), new PointInfo(0, WHITE, -1), new PointInfo(0, BLUE, -2));
						p270.push(new PointInfo(-2, BLUE, 0), new PointInfo(-1, WHITE, 0), new PointInfo(0, PINK, 1), new PointInfo(0, CENTER, 0), new PointInfo(0, PINK, -1), new PointInfo(1, WHITE, 0), new PointInfo(2, BLUE, 0));
						pr0.push(new PointInfo(0, BLUE, -2), new PointInfo(0, WHITE, -1), new PointInfo(1, PINK, 0), new PointInfo(0, CENTER, 0), new PointInfo(-1, PINK, 0), new PointInfo(0, WHITE, 1), new PointInfo(0, BLUE, 2));
						pr90.push(new PointInfo(-2, BLUE, 0), new PointInfo(-1, WHITE, 0), new PointInfo(0, PINK, -1), new PointInfo(0, CENTER, 0), new PointInfo(0, PINK, 1), new PointInfo(1, WHITE, 0), new PointInfo(2, BLUE, 0));
						pr180.push(new PointInfo(0, BLUE, 2), new PointInfo(0, WHITE, 1), new PointInfo(-1, PINK, 0), new PointInfo(0, CENTER, 0), new PointInfo(1, PINK, 0), new PointInfo(0, WHITE, -1), new PointInfo(0, BLUE, -2));
						pr270.push(new PointInfo(2, BLUE, 0), new PointInfo(1, WHITE, 0), new PointInfo(0, PINK, 1), new PointInfo(0, CENTER, 0), new PointInfo(0, PINK, -1), new PointInfo(-1, WHITE, 0), new PointInfo(-2, BLUE, 0));

						__priority = 0.05;
						break;
					case 24:
						p0.push(	new PointInfo(0, BLUE, -2), 
									new PointInfo(0, WHITE, -1), 
									new PointInfo(-1, PINK, 0), 
									new PointInfo(0, CENTER,  0),
									new PointInfo(1, PINK, 0), 
									new PointInfo(0, WHITE, 1), 
									new PointInfo(0, WHITE, 2), 
									new PointInfo(0, BLUE, 3));
						
						p90.push(new PointInfo(2, BLUE, 0), new PointInfo(1, WHITE, 0), new PointInfo(0, PINK, -1), new PointInfo(0, CENTER, 0), new PointInfo(0, PINK, 1), new PointInfo(-1, WHITE, 0), new PointInfo(-2, WHITE, 0), new PointInfo(-3, BLUE, 0));
						p180.push(new PointInfo(0, BLUE, 2), new PointInfo(0, WHITE, 1), new PointInfo(1, PINK, 0), new PointInfo(0, CENTER, 0), new PointInfo(-1, PINK, 0), new PointInfo(0, WHITE, -1), new PointInfo(0, WHITE, -2), new PointInfo(0, BLUE, -3));
						p270.push(new PointInfo(-2, BLUE, 0), new PointInfo(-1, WHITE, 0), new PointInfo(0, PINK, 1), new PointInfo(0, CENTER, 0), new PointInfo(0, PINK, -1), new PointInfo(1, WHITE, 0), new PointInfo(2, WHITE, 0), new PointInfo(3, BLUE, 0));
						pr0.push(new PointInfo(0, BLUE, -2), new PointInfo(0, WHITE, -1), new PointInfo(1, PINK, 0), new PointInfo(0, CENTER, 0), new PointInfo(-1, PINK, 0), new PointInfo(0, WHITE, 1), new PointInfo(0, WHITE, 2), new PointInfo(0, BLUE, 3));
						pr90.push(new PointInfo(-2, BLUE, 0), new PointInfo(-1, WHITE, 0), new PointInfo(0, PINK, -1), new PointInfo(0, CENTER, 0), new PointInfo(0, PINK, 1), new PointInfo(1, WHITE, 0), new PointInfo(2, WHITE, 0), new PointInfo(3, BLUE, 0));
						pr180.push(new PointInfo(0, BLUE, 2), new PointInfo(0, WHITE, 1), new PointInfo(-1, PINK, 0), new PointInfo(0, CENTER, 0), new PointInfo(1, PINK, 0), new PointInfo(0, WHITE, -1), new PointInfo(0, WHITE, -2), new PointInfo(0, BLUE, -3));
						pr270.push(new PointInfo(2, BLUE, 0), new PointInfo(1, WHITE, 0), new PointInfo(0, PINK, 1), new PointInfo(0, CENTER, 0), new PointInfo(0, PINK, -1), new PointInfo(-1, WHITE, 0), new PointInfo(-2, WHITE, 0), new PointInfo(-3, BLUE, 0));

						
						__priority = 0.05;
						break;
					case 25:
						p0.push(	new PointInfo(0, BLUE, -3), 
									new PointInfo(0, WHITE, -2), 
									new PointInfo(0, WHITE, -1), 
									new PointInfo(-1, PINK, 0), 
									new PointInfo(0, CENTER,  0),
									new PointInfo(1, PINK, 0), 
									new PointInfo(0, WHITE, 1), 
									new PointInfo(0, WHITE, 2), 
									new PointInfo(0, BLUE, 3));
						
						p90.push(new PointInfo(3, BLUE, 0), new PointInfo(2, WHITE, 0), new PointInfo(1, WHITE, 0), new PointInfo(0, PINK, -1), new PointInfo(0, CENTER, 0), new PointInfo(0, PINK, 1), new PointInfo(-1, WHITE, 0), new PointInfo(-2, WHITE, 0), new PointInfo(-3, BLUE, 0));
						p180.push(new PointInfo(0, BLUE, 3), new PointInfo(0, WHITE, 2), new PointInfo(0, WHITE, 1), new PointInfo(1, PINK, 0), new PointInfo(0, CENTER, 0), new PointInfo(-1, PINK, 0), new PointInfo(0, WHITE, -1), new PointInfo(0, WHITE, -2), new PointInfo(0, BLUE, -3));
						p270.push(new PointInfo(-3, BLUE, 0), new PointInfo(-2, WHITE, 0), new PointInfo(-1, WHITE, 0), new PointInfo(0, PINK, 1), new PointInfo(0, CENTER, 0), new PointInfo(0, PINK, -1), new PointInfo(1, WHITE, 0), new PointInfo(2, WHITE, 0), new PointInfo(3, BLUE, 0));
						pr0.push(new PointInfo(0, BLUE, -3), new PointInfo(0, WHITE, -2), new PointInfo(0, WHITE, -1), new PointInfo(1, PINK, 0), new PointInfo(0, CENTER, 0), new PointInfo(-1, PINK, 0), new PointInfo(0, WHITE, 1), new PointInfo(0, WHITE, 2), new PointInfo(0, BLUE, 3));
						pr90.push(new PointInfo(-3, BLUE, 0), new PointInfo(-2, WHITE, 0), new PointInfo(-1, WHITE, 0), new PointInfo(0, PINK, -1), new PointInfo(0, CENTER, 0), new PointInfo(0, PINK, 1), new PointInfo(1, WHITE, 0), new PointInfo(2, WHITE, 0), new PointInfo(3, BLUE, 0));
						pr180.push(new PointInfo(0, BLUE, 3), new PointInfo(0, WHITE, 2), new PointInfo(0, WHITE, 1), new PointInfo(-1, PINK, 0), new PointInfo(0, CENTER, 0), new PointInfo(1, PINK, 0), new PointInfo(0, WHITE, -1), new PointInfo(0, WHITE, -2), new PointInfo(0, BLUE, -3));
						pr270.push(new PointInfo(3, BLUE, 0), new PointInfo(2, WHITE, 0), new PointInfo(1, WHITE, 0), new PointInfo(0, PINK, 1), new PointInfo(0, CENTER, 0), new PointInfo(0, PINK, -1), new PointInfo(-1, WHITE, 0), new PointInfo(-2, WHITE, 0), new PointInfo(-3, BLUE, 0));

						
						__priority = 0.05;
						break;
					case 26:
						p0.push(	new PointInfo(1, BLUE, -1), 
									new PointInfo(-1, PINK, 0), 
									new PointInfo(0, CENTER,  0),
									new PointInfo(1, PINK, 0), 
									new PointInfo(0, BLUE, 1));
						
						p90.push(new PointInfo(1, BLUE, 1), new PointInfo(0, PINK, -1), new PointInfo(0, CENTER, 0), new PointInfo(0, PINK, 1), new PointInfo(-1, BLUE, 0));
						p180.push(new PointInfo(-1, BLUE, 1), new PointInfo(1, PINK, 0), new PointInfo(0, CENTER, 0), new PointInfo(-1, PINK, 0), new PointInfo(0, BLUE, -1));
						p270.push(new PointInfo(-1, BLUE, -1), new PointInfo(0, PINK, 1), new PointInfo(0, CENTER, 0), new PointInfo(0, PINK, -1), new PointInfo(1, BLUE, 0));
						pr0.push(new PointInfo(-1, BLUE, -1), new PointInfo(1, PINK, 0), new PointInfo(0, CENTER, 0), new PointInfo(-1, PINK, 0), new PointInfo(0, BLUE, 1));
						pr90.push(new PointInfo(-1, BLUE, 1), new PointInfo(0, PINK, -1), new PointInfo(0, CENTER, 0), new PointInfo(0, PINK, 1), new PointInfo(1, BLUE, 0));
						pr180.push(new PointInfo(1, BLUE, 1), new PointInfo(-1, PINK, 0), new PointInfo(0, CENTER, 0), new PointInfo(1, PINK, 0), new PointInfo(0, BLUE, -1));
						pr270.push(new PointInfo(1, BLUE, -1), new PointInfo(0, PINK, 1), new PointInfo(0, CENTER, 0), new PointInfo(0, PINK, -1), new PointInfo(-1, BLUE, 0));

						
						__priority = 0.05;
						break;
					case 27:
						p0.push(	new PointInfo(0, BLUE, -1), 
									new PointInfo(-1, PINK, 0), 
									new PointInfo(0, CENTER,  0),
									new PointInfo(1, PINK, 0), 
									new PointInfo(-1, GREEN, 1), 
									new PointInfo(0, WHITE, 1), 
									new PointInfo(-1, BLUE, 2));
						
						p90.push(new PointInfo(1, BLUE, 0), new PointInfo(0, PINK, -1), new PointInfo(0, CENTER, 0), new PointInfo(0, PINK, 1), new PointInfo(-1, GREEN, -1), new PointInfo(-1, WHITE, 0), new PointInfo(-2, BLUE, -1));
						p180.push(new PointInfo(0, BLUE, 1), new PointInfo(1, PINK, 0), new PointInfo(0, CENTER, 0), new PointInfo(-1, PINK, 0), new PointInfo(1, GREEN, -1), new PointInfo(0, WHITE, -1), new PointInfo(1, BLUE, -2));
						p270.push(new PointInfo(-1, BLUE, 0), new PointInfo(0, PINK, 1), new PointInfo(0, CENTER, 0), new PointInfo(0, PINK, -1), new PointInfo(1, GREEN, 1), new PointInfo(1, WHITE, 0), new PointInfo(2, BLUE, 1));
						pr0.push(new PointInfo(0, BLUE, -1), new PointInfo(1, PINK, 0), new PointInfo(0, CENTER, 0), new PointInfo(-1, PINK, 0), new PointInfo(1, GREEN, 1), new PointInfo(0, WHITE, 1), new PointInfo(1, BLUE, 2));
						pr90.push(new PointInfo(-1, BLUE, 0), new PointInfo(0, PINK, -1), new PointInfo(0, CENTER, 0), new PointInfo(0, PINK, 1), new PointInfo(1, GREEN, -1), new PointInfo(1, WHITE, 0), new PointInfo(2, BLUE, -1));
						pr180.push(new PointInfo(0, BLUE, 1), new PointInfo(-1, PINK, 0), new PointInfo(0, CENTER, 0), new PointInfo(1, PINK, 0), new PointInfo(-1, GREEN, -1), new PointInfo(0, WHITE, -1), new PointInfo(-1, BLUE, -2));
						pr270.push(new PointInfo(1, BLUE, 0), new PointInfo(0, PINK, 1), new PointInfo(0, CENTER, 0), new PointInfo(0, PINK, -1), new PointInfo(-1, GREEN, 1), new PointInfo(-1, WHITE, 0), new PointInfo(-2, BLUE, 1));

						
						__priority = 0.05;
						break;
					case 28:
						p0.push(	new PointInfo(0, BLUE, -2), 
									new PointInfo(0, WHITE, -1), 
									new PointInfo(-1, PINK, 0), 
									new PointInfo(0, CENTER,  0),
									new PointInfo(1, PINK, 0), 
									new PointInfo(-1, GREEN, 1), 
									new PointInfo(0, WHITE, 1), 
									new PointInfo(-1, BLUE, 2));
						
						p90.push(new PointInfo(2, BLUE, 0), new PointInfo(1, WHITE, 0), new PointInfo(0, PINK, -1), new PointInfo(0, CENTER, 0), new PointInfo(0, PINK, 1), new PointInfo(-1, GREEN, -1), new PointInfo(-1, WHITE, 0), new PointInfo(-2, BLUE, -1));
						p180.push(new PointInfo(0, BLUE, 2), new PointInfo(0, WHITE, 1), new PointInfo(1, PINK, 0), new PointInfo(0, CENTER, 0), new PointInfo(-1, PINK, 0), new PointInfo(1, GREEN, -1), new PointInfo(0, WHITE, -1), new PointInfo(1, BLUE, -2));
						p270.push(new PointInfo(-2, BLUE, 0), new PointInfo(-1, WHITE, 0), new PointInfo(0, PINK, 1), new PointInfo(0, CENTER, 0), new PointInfo(0, PINK, -1), new PointInfo(1, GREEN, 1), new PointInfo(1, WHITE, 0), new PointInfo(2, BLUE, 1));
						pr0.push(new PointInfo(0, BLUE, -2), new PointInfo(0, WHITE, -1), new PointInfo(1, PINK, 0), new PointInfo(0, CENTER, 0), new PointInfo(-1, PINK, 0), new PointInfo(1, GREEN, 1), new PointInfo(0, WHITE, 1), new PointInfo(1, BLUE, 2));
						pr90.push(new PointInfo(-2, BLUE, 0), new PointInfo(-1, WHITE, 0), new PointInfo(0, PINK, -1), new PointInfo(0, CENTER, 0), new PointInfo(0, PINK, 1), new PointInfo(1, GREEN, -1), new PointInfo(1, WHITE, 0), new PointInfo(2, BLUE, -1));
						pr180.push(new PointInfo(0, BLUE, 2), new PointInfo(0, WHITE, 1), new PointInfo(-1, PINK, 0), new PointInfo(0, CENTER, 0), new PointInfo(1, PINK, 0), new PointInfo(-1, GREEN, -1), new PointInfo(0, WHITE, -1), new PointInfo(-1, BLUE, -2));
						pr270.push(new PointInfo(2, BLUE, 0), new PointInfo(1, WHITE, 0), new PointInfo(0, PINK, 1), new PointInfo(0, CENTER, 0), new PointInfo(0, PINK, -1), new PointInfo(-1, GREEN, 1), new PointInfo(-1, WHITE, 0), new PointInfo(-2, BLUE, 1));

						
						__priority = 0.05;
						break;
					case 29:
						p0.push(	new PointInfo(0, BLUE, -3), 
										new PointInfo(0, WHITE, -2), 
										new PointInfo(-1, PINK, -1),
										new PointInfo(0, WHITE, -1), 
										new PointInfo(-1, PINK, 0), 
										new PointInfo(0, CENTER,  0),
										new PointInfo(-1, BLUE, 1));
						
						p90.push(new PointInfo(3, BLUE, 0), new PointInfo(2, WHITE, 0), new PointInfo(1, PINK, -1), new PointInfo(1, WHITE, 0), new PointInfo(0, PINK, -1), new PointInfo(0, CENTER, 0), new PointInfo(-1, BLUE, -1));
						p180.push(new PointInfo(0, BLUE, 3), new PointInfo(0, WHITE, 2), new PointInfo(1, PINK, 1), new PointInfo(0, WHITE, 1), new PointInfo(1, PINK, 0), new PointInfo(0, CENTER, 0), new PointInfo(1, BLUE, -1));
						p270.push(new PointInfo(-3, BLUE, 0), new PointInfo(-2, WHITE, 0), new PointInfo(-1, PINK, 1), new PointInfo(-1, WHITE, 0), new PointInfo(0, PINK, 1), new PointInfo(0, CENTER, 0), new PointInfo(1, BLUE, 1));
						pr0.push(new PointInfo(0, BLUE, -3), new PointInfo(0, WHITE, -2), new PointInfo(1, PINK, -1), new PointInfo(0, WHITE, -1), new PointInfo(1, PINK, 0), new PointInfo(0, CENTER, 0), new PointInfo(1, BLUE, 1));
						pr90.push(new PointInfo(-3, BLUE, 0), new PointInfo(-2, WHITE, 0), new PointInfo(-1, PINK, -1), new PointInfo(-1, WHITE, 0), new PointInfo(0, PINK, -1), new PointInfo(0, CENTER, 0), new PointInfo(1, BLUE, -1));
						pr180.push(new PointInfo(0, BLUE, 3), new PointInfo(0, WHITE, 2), new PointInfo(-1, PINK, 1), new PointInfo(0, WHITE, 1), new PointInfo(-1, PINK, 0), new PointInfo(0, CENTER, 0), new PointInfo(-1, BLUE, -1));
						pr270.push(new PointInfo(3, BLUE, 0), new PointInfo(2, WHITE, 0), new PointInfo(1, PINK, 1), new PointInfo(1, WHITE, 0), new PointInfo(0, PINK, 1), new PointInfo(0, CENTER, 0), new PointInfo(-1, BLUE, 1));

						
						__priority = 0.05;
						break;
					case 30:
						p0.push(	new PointInfo(0, BLUE, -2), 
										new PointInfo(-1, PINK, -1),
										new PointInfo(0, WHITE, -1), 
										new PointInfo(-1, PINK, 0), 
										new PointInfo(0, CENTER,  0),
										new PointInfo(-1, BLUE, 1));
						
						p90.push(new PointInfo(2, BLUE, 0), new PointInfo(1, PINK, -1), new PointInfo(1, WHITE, 0), new PointInfo(0, PINK, -1), new PointInfo(0, CENTER, 0), new PointInfo(-1, BLUE, -1));
						p180.push(new PointInfo(0, BLUE, 2), new PointInfo(1, PINK, 1), new PointInfo(0, WHITE, 1), new PointInfo(1, PINK, 0), new PointInfo(0, CENTER, 0), new PointInfo(1, BLUE, -1));
						p270.push(new PointInfo(-2, BLUE, 0), new PointInfo(-1, PINK, 1), new PointInfo(-1, WHITE, 0), new PointInfo(0, PINK, 1), new PointInfo(0, CENTER, 0), new PointInfo(1, BLUE, 1));
						pr0.push(new PointInfo(0, BLUE, -2), new PointInfo(1, PINK, -1), new PointInfo(0, WHITE, -1), new PointInfo(1, PINK, 0), new PointInfo(0, CENTER, 0), new PointInfo(1, BLUE, 1));
						pr90.push(new PointInfo(-2, BLUE, 0), new PointInfo(-1, PINK, -1), new PointInfo(-1, WHITE, 0), new PointInfo(0, PINK, -1), new PointInfo(0, CENTER, 0), new PointInfo(1, BLUE, -1));
						pr180.push(new PointInfo(0, BLUE, 2), new PointInfo(-1, PINK, 1), new PointInfo(0, WHITE, 1), new PointInfo(-1, PINK, 0), new PointInfo(0, CENTER, 0), new PointInfo(-1, BLUE, -1));
						pr270.push(new PointInfo(2, BLUE, 0), new PointInfo(1, PINK, 1), new PointInfo(1, WHITE, 0), new PointInfo(0, PINK, 1), new PointInfo(0, CENTER, 0), new PointInfo(-1, BLUE, 1));

						
						__priority = 0.05;
						break;
					case 31:
						p0.push(	new PointInfo(-2, PINK, 0), 
										new PointInfo(-1, PINK, 0),
										new PointInfo(0, CENTER,  0), 
										new PointInfo(-2, WHITE, 1), 
										new PointInfo(-1, WHITE, 1), 
										new PointInfo(0, WHITE, 1), 
										new PointInfo(-2, PINK, 2), 
										new PointInfo(-1, BLUE, 2), 
										new PointInfo(0, PINK, 2),
										new PointInfo(-1, BLUE, 3));
						
						p90.push(new PointInfo(0, PINK, -2), new PointInfo(0, PINK, -1), new PointInfo(0, CENTER, 0), new PointInfo(-1, WHITE, -2), new PointInfo(-1, WHITE, -1), new PointInfo(-1, WHITE, 0), new PointInfo(-2, PINK, -2), new PointInfo(-2, BLUE, -1), new PointInfo(-2, PINK, 0), new PointInfo(-3, BLUE, -1));
						p180.push(new PointInfo(2, PINK, 0), new PointInfo(1, PINK, 0), new PointInfo(0, CENTER, 0), new PointInfo(2, WHITE, -1), new PointInfo(1, WHITE, -1), new PointInfo(0, WHITE, -1), new PointInfo(2, PINK, -2), new PointInfo(1, BLUE, -2), new PointInfo(0, PINK, -2), new PointInfo(1, BLUE, -3));
						p270.push(new PointInfo(0, PINK, 2), new PointInfo(0, PINK, 1), new PointInfo(0, CENTER, 0), new PointInfo(1, WHITE, 2), new PointInfo(1, WHITE, 1), new PointInfo(1, WHITE, 0), new PointInfo(2, PINK, 2), new PointInfo(2, BLUE, 1), new PointInfo(2, PINK, 0), new PointInfo(3, BLUE, 1));
						pr0.push(new PointInfo(2, PINK, 0), new PointInfo(1, PINK, 0), new PointInfo(0, CENTER, 0), new PointInfo(2, WHITE, 1), new PointInfo(1, WHITE, 1), new PointInfo(0, WHITE, 1), new PointInfo(2, PINK, 2), new PointInfo(1, BLUE, 2), new PointInfo(0, PINK, 2), new PointInfo(1, BLUE, 3));
						pr90.push(new PointInfo(0, PINK, -2), new PointInfo(0, PINK, -1), new PointInfo(0, CENTER, 0), new PointInfo(1, WHITE, -2), new PointInfo(1, WHITE, -1), new PointInfo(1, WHITE, 0), new PointInfo(2, PINK, -2), new PointInfo(2, BLUE, -1), new PointInfo(2, PINK, 0), new PointInfo(3, BLUE, -1));
						pr180.push(new PointInfo(-2, PINK, 0), new PointInfo(-1, PINK, 0), new PointInfo(0, CENTER, 0), new PointInfo(-2, WHITE, -1), new PointInfo(-1, WHITE, -1), new PointInfo(0, WHITE, -1), new PointInfo(-2, PINK, -2), new PointInfo(-1, BLUE, -2), new PointInfo(0, PINK, -2), new PointInfo(-1, BLUE, -3));
						pr270.push(new PointInfo(0, PINK, 2), new PointInfo(0, PINK, 1), new PointInfo(0, CENTER, 0), new PointInfo(-1, WHITE, 2), new PointInfo(-1, WHITE, 1), new PointInfo(-1, WHITE, 0), new PointInfo(-2, PINK, 2), new PointInfo(-2, BLUE, 1), new PointInfo(-2, PINK, 0), new PointInfo(-3, BLUE, 1));

						
						__priority = 0.01;
						break;
					case 32:
						p0.push(	new PointInfo(0, RED, -1), 
									new PointInfo(-1, RED, 0),
									new PointInfo(0, CENTER,  0), 
									new PointInfo(1, RED, 0));
						
						p90.push(new PointInfo(1, RED, 0), new PointInfo(0, RED, -1), new PointInfo(0, CENTER, 0), new PointInfo(0, RED, 1));
						p180.push(new PointInfo(0, RED, 1), new PointInfo(1, RED, 0), new PointInfo(0, CENTER, 0), new PointInfo(-1, RED, 0));
						p270.push(new PointInfo(-1, RED, 0), new PointInfo(0, RED, 1), new PointInfo(0, CENTER, 0), new PointInfo(0, RED, -1));
						pr0.push(new PointInfo(0, RED, -1), new PointInfo(1, RED, 0), new PointInfo(0, CENTER, 0), new PointInfo(-1, RED, 0));
						pr90.push(new PointInfo(-1, RED, 0), new PointInfo(0, RED, -1), new PointInfo(0, CENTER, 0), new PointInfo(0, RED, 1));
						pr180.push(new PointInfo(0, RED, 1), new PointInfo(-1, RED, 0), new PointInfo(0, CENTER, 0), new PointInfo(1, RED, 0));
						pr270.push(new PointInfo(1, RED, 0), new PointInfo(0, RED, 1), new PointInfo(0, CENTER, 0), new PointInfo(0, RED, -1));
						__priority = -0.5;
						break;
					case 33:
						p0.push(	new PointInfo(-1, BLUE, 0), 
									new PointInfo(0, CENTER,  0), 
									new PointInfo(-1, BLUE, 1),
									new PointInfo(0, BLUE, 1));
						
						p90.push(new PointInfo(0, BLUE, -1), new PointInfo(0, CENTER, 0), new PointInfo(-1, BLUE, -1), new PointInfo(-1, BLUE, 0));
						p180.push(new PointInfo(1, BLUE, 0), new PointInfo(0, CENTER, 0), new PointInfo(1, BLUE, -1), new PointInfo(0, BLUE, -1));
						p270.push(new PointInfo(0, BLUE, 1), new PointInfo(0, CENTER, 0), new PointInfo(1, BLUE, 1), new PointInfo(1, BLUE, 0));
						pr0.push(new PointInfo(1, BLUE, 0), new PointInfo(0, CENTER, 0), new PointInfo(1, BLUE, 1), new PointInfo(0, BLUE, 1));
						pr90.push(new PointInfo(0, BLUE, -1), new PointInfo(0, CENTER, 0), new PointInfo(1, BLUE, -1), new PointInfo(1, BLUE, 0));
						pr180.push(new PointInfo(-1, BLUE, 0), new PointInfo(0, CENTER, 0), new PointInfo(-1, BLUE, -1), new PointInfo(0, BLUE, -1));
						pr270.push(new PointInfo(0, BLUE, 1), new PointInfo(0, CENTER, 0), new PointInfo(-1, BLUE, 1), new PointInfo(-1, BLUE, 0));
						
						__priority = -0.5;
						break;
					case 34:
						p0.push(new PointInfo(0, 1, -2),
								new PointInfo(-1, 1, -1),
								new PointInfo(0, 2, -1),
								new PointInfo(1, 1, -1),
								new PointInfo(0, CENTER, 0));
						p90.push(new PointInfo(1, 1, 1),new PointInfo(0, 16, 0),new PointInfo(2, 1, 0),new PointInfo(1, 1, -1),new PointInfo(1, 2, 0),new PointInfo(1, 1, 1),new PointInfo(0, 16, 0));
						p180.push(new PointInfo(-1, 1, 1),new PointInfo(0, 16, 0),new PointInfo(0, 1, 2),new PointInfo(1, 1, 1),new PointInfo(0, 2, 1),new PointInfo(-1, 1, 1),new PointInfo(0, 16, 0));
						p270.push(new PointInfo(-1, 1, -1),new PointInfo(0, 16, 0),new PointInfo(-2, 1, 0),new PointInfo(-1, 1, 1),new PointInfo(-1, 2, 0),new PointInfo(-1, 1, -1),new PointInfo(0, 16, 0));
						pr0.push(new PointInfo(-1, 1, -1),new PointInfo(0, 16, 0),new PointInfo(0, 1, -2),new PointInfo(1, 1, -1),new PointInfo(0, 2, -1),new PointInfo(-1, 1, -1),new PointInfo(0, 16, 0));
						pr90.push(new PointInfo(-1, 1, 1),new PointInfo(0, 16, 0),new PointInfo(-2, 1, 0),new PointInfo(-1, 1, -1),new PointInfo(-1, 2, 0),new PointInfo(-1, 1, 1),new PointInfo(0, 16, 0));
						pr180.push(new PointInfo(1, 1, 1),new PointInfo(0, 16, 0),new PointInfo(0, 1, 2),new PointInfo(-1, 1, 1),new PointInfo(0, 2, 1),new PointInfo(1, 1, 1),new PointInfo(0, 16, 0));
						pr270.push(new PointInfo(1, 1, -1),new PointInfo(0, 16, 0),new PointInfo(2, 1, 0),new PointInfo(1, 1, 1),new PointInfo(1, 2, 0),new PointInfo(1, 1, -1),new PointInfo(0, 16, 0));
						
						__priority = -0.54;
						break;
					case 35:
						p0.push(new PointInfo(0, 2, -1),
								new PointInfo(1, 1, 0),
								new PointInfo(2, 1, 0),
								new PointInfo(0, CENTER, 0));
						p90.push(new PointInfo(1, 2, 0),new PointInfo(0, 1, 1),new PointInfo(0, 1, 2),new PointInfo(0, 16, 0));
						p180.push(new PointInfo(0, 2, 1),new PointInfo(-1, 1, 0),new PointInfo(-2, 1, 0),new PointInfo(0, 16, 0));
						p270.push(new PointInfo(-1, 2, 0),new PointInfo(0, 1, -1),new PointInfo(0, 1, -2),new PointInfo(0, 16, 0));
						pr0.push(new PointInfo(0, 2, -1),new PointInfo(-1, 1, 0),new PointInfo(-2, 1, 0),new PointInfo(0, 16, 0));
						pr90.push(new PointInfo(-1, 2, 0),new PointInfo(0, 1, 1),new PointInfo(0, 1, 2),new PointInfo(0, 16, 0));
						pr180.push(new PointInfo(0, 2, 1),new PointInfo(1, 1, 0),new PointInfo(2, 1, 0),new PointInfo(0, 16, 0));
						pr270.push(new PointInfo(1, 2, 0),new PointInfo(0, 1, -1),new PointInfo(0, 1, -2),new PointInfo(0, 16, 0));
						__priority = -0.55;
						break;
					case 36:
						p0.push(new PointInfo(0, 2, -1),
							new PointInfo(-1, 1, 0),
							new PointInfo(1, 1, 0),
							new PointInfo(0, 2, 1),
							new PointInfo(0, CENTER, 0));
						p90.push(new PointInfo(1, 2, 0),new PointInfo(0, 1, -1),new PointInfo(0, 1, 1),new PointInfo(-1, 2, 0),new PointInfo(0, 16, 0));
						p180.push(new PointInfo(0, 2, 1),new PointInfo(1, 1, 0),new PointInfo(-1, 1, 0),new PointInfo(0, 2, -1),new PointInfo(0, 16, 0));
						p270.push(new PointInfo(-1, 2, 0),new PointInfo(0, 1, 1),new PointInfo(0, 1, -1),new PointInfo(1, 2, 0),new PointInfo(0, 16, 0));
						pr0.push(new PointInfo(0, 2, -1),new PointInfo(1, 1, 0),new PointInfo(-1, 1, 0),new PointInfo(0, 2, 1),new PointInfo(0, 16, 0));
						pr90.push(new PointInfo(-1, 2, 0),new PointInfo(0, 1, -1),new PointInfo(0, 1, 1),new PointInfo(1, 2, 0),new PointInfo(0, 16, 0));
						pr180.push(new PointInfo(0, 2, 1),new PointInfo(-1, 1, 0),new PointInfo(1, 1, 0),new PointInfo(0, 2, -1),new PointInfo(0, 16, 0));
						pr270.push(new PointInfo(1, 2, 0),new PointInfo(0, 1, 1),new PointInfo(0, 1, -1),new PointInfo(-1, 2, 0),new PointInfo(0, 16, 0));

						__priority = -0.55;
						break;
					case 37:
						p0.push(new PointInfo(1, 2, -1),
							new PointInfo(1, 1, 0),
							new PointInfo(2, 1, 0),
							new PointInfo(0, CENTER, 0));
						p90.push(new PointInfo(1, 2, 1),new PointInfo(0, 1, 1),new PointInfo(0, 1, 2),new PointInfo(0, 16, 0));
						p180.push(new PointInfo(-1, 2, 1),new PointInfo(-1, 1, 0),new PointInfo(-2, 1, 0),new PointInfo(0, 16, 0));
						p270.push(new PointInfo(-1, 2, -1),new PointInfo(0, 1, -1),new PointInfo(0, 1, -2),new PointInfo(0, 16, 0));
						pr0.push(new PointInfo(-1, 2, -1),new PointInfo(-1, 1, 0),new PointInfo(-2, 1, 0),new PointInfo(0, 16, 0));
						pr90.push(new PointInfo(-1, 2, 1),new PointInfo(0, 1, 1),new PointInfo(0, 1, 2),new PointInfo(0, 16, 0));
						pr180.push(new PointInfo(1, 2, 1),new PointInfo(1, 1, 0),new PointInfo(2, 1, 0),new PointInfo(0, 16, 0));
						pr270.push(new PointInfo(1, 2, -1),new PointInfo(0, 1, -1),new PointInfo(0, 1, -2),new PointInfo(0, 16, 0));

						__priority = -0.55;
						break;
					case 38:
						p0.push(new PointInfo(0, 2, -3),
							new PointInfo(-1, 2, -2),
							new PointInfo(0, 1, -2),
							new PointInfo(1, 1, -2),
							new PointInfo(0, 1, -1),
							new PointInfo(0, CENTER, 0));
						p90.push(new PointInfo(3, 2, 0),new PointInfo(2, 2, -1),new PointInfo(2, 1, 0),new PointInfo(2, 1, 1),new PointInfo(1, 1, 0),new PointInfo(0, 16, 0));
						p180.push(new PointInfo(0, 2, 3),new PointInfo(1, 2, 2),new PointInfo(0, 1, 2),new PointInfo(-1, 1, 2),new PointInfo(0, 1, 1),new PointInfo(0, 16, 0));
						p270.push(new PointInfo(-3, 2, 0),new PointInfo(-2, 2, 1),new PointInfo(-2, 1, 0),new PointInfo(-2, 1, -1),new PointInfo(-1, 1, 0),new PointInfo(0, 16, 0));
						pr0.push(new PointInfo(0, 2, -3),new PointInfo(1, 2, -2),new PointInfo(0, 1, -2),new PointInfo(-1, 1, -2),new PointInfo(0, 1, -1),new PointInfo(0, 16, 0));
						pr90.push(new PointInfo(-3, 2, 0),new PointInfo(-2, 2, -1),new PointInfo(-2, 1, 0),new PointInfo(-2, 1, 1),new PointInfo(-1, 1, 0),new PointInfo(0, 16, 0));
						pr180.push(new PointInfo(0, 2, 3),new PointInfo(-1, 2, 2),new PointInfo(0, 1, 2),new PointInfo(1, 1, 2),new PointInfo(0, 1, 1),new PointInfo(0, 16, 0));
						pr270.push(new PointInfo(3, 2, 0),new PointInfo(2, 2, 1),new PointInfo(2, 1, 0),new PointInfo(2, 1, -1),new PointInfo(1, 1, 0),new PointInfo(0, 16, 0));

						__priority = -0.55;
						break;
					case 39:
						p0.push(new PointInfo(0, 2, -2),
							new PointInfo(-1, 1, -1),
							new PointInfo(0, 2, -1),
							new PointInfo(1, 1, -1),
							new PointInfo(2, 1, -1),
							new PointInfo(0, CENTER, 0));
						p90.push(new PointInfo(2, 2, 0),new PointInfo(1, 1, -1),new PointInfo(1, 2, 0),new PointInfo(1, 1, 1),new PointInfo(1, 1, 2),new PointInfo(0, 16, 0));
						p180.push(new PointInfo(0, 2, 2),new PointInfo(1, 1, 1),new PointInfo(0, 2, 1),new PointInfo(-1, 1, 1),new PointInfo(-2, 1, 1),new PointInfo(0, 16, 0));
						p270.push(new PointInfo(-2, 2, 0),new PointInfo(-1, 1, 1),new PointInfo(-1, 2, 0),new PointInfo(-1, 1, -1),new PointInfo(-1, 1, -2),new PointInfo(0, 16, 0));
						pr0.push(new PointInfo(0, 2, -2),new PointInfo(1, 1, -1),new PointInfo(0, 2, -1),new PointInfo(-1, 1, -1),new PointInfo(-2, 1, -1),new PointInfo(0, 16, 0));
						pr90.push(new PointInfo(-2, 2, 0),new PointInfo(-1, 1, -1),new PointInfo(-1, 2, 0),new PointInfo(-1, 1, 1),new PointInfo(-1, 1, 2),new PointInfo(0, 16, 0));
						pr180.push(new PointInfo(0, 2, 2),new PointInfo(-1, 1, 1),new PointInfo(0, 2, 1),new PointInfo(1, 1, 1),new PointInfo(2, 1, 1),new PointInfo(0, 16, 0));
						pr270.push(new PointInfo(2, 2, 0),new PointInfo(1, 1, 1),new PointInfo(1, 2, 0),new PointInfo(1, 1, -1),new PointInfo(1, 1, -2),new PointInfo(0, 16, 0));

						__priority = -0.55;
						break;
					case 40:
						p0.push(new PointInfo(-2, 1, 0),
								new PointInfo(-1, 1, 0),
								new PointInfo(0, CENTER, 0));
						p90.push(new PointInfo(1, 1, 1),new PointInfo(0, 16, 0),new PointInfo(0, 1, -2),new PointInfo(0, 1, -1),new PointInfo(0, 16, 0));
						p180.push(new PointInfo(-1, 1, 1),new PointInfo(0, 16, 0),new PointInfo(2, 1, 0),new PointInfo(1, 1, 0),new PointInfo(0, 16, 0));
						p270.push(new PointInfo(-1, 1, -1),new PointInfo(0, 16, 0),new PointInfo(0, 1, 2),new PointInfo(0, 1, 1),new PointInfo(0, 16, 0));
						pr0.push(new PointInfo(-1, 1, -1),new PointInfo(0, 16, 0),new PointInfo(2, 1, 0),new PointInfo(1, 1, 0),new PointInfo(0, 16, 0));
						pr90.push(new PointInfo(-1, 1, 1),new PointInfo(0, 16, 0),new PointInfo(0, 1, -2),new PointInfo(0, 1, -1),new PointInfo(0, 16, 0));
						pr180.push(new PointInfo(1, 1, 1),new PointInfo(0, 16, 0),new PointInfo(-2, 1, 0),new PointInfo(-1, 1, 0),new PointInfo(0, 16, 0));
						pr270.push(new PointInfo(1, 1, -1),new PointInfo(0, 16, 0),new PointInfo(0, 1, 2),new PointInfo(0, 1, 1),new PointInfo(0, 16, 0));
						
						__priority = -0.56;
						break;
					case 41:
						p0.push(new PointInfo(-2, 2, 0),
								new PointInfo(-1, 1, 0),
								new PointInfo(-1, 2, 1),
								new PointInfo(0, CENTER, 0));
						p90.push(new PointInfo(1, 1, 1),new PointInfo(0, 16, 0),new PointInfo(0, 2, -2),new PointInfo(0, 1, -1),new PointInfo(-1, 2, -1),new PointInfo(0, 16, 0));
						p180.push(new PointInfo(-1, 1, 1),new PointInfo(0, 16, 0),new PointInfo(2, 2, 0),new PointInfo(1, 1, 0),new PointInfo(1, 2, -1),new PointInfo(0, 16, 0));
						p270.push(new PointInfo(-1, 1, -1),new PointInfo(0, 16, 0),new PointInfo(0, 2, 2),new PointInfo(0, 1, 1),new PointInfo(1, 2, 1),new PointInfo(0, 16, 0));
						pr0.push(new PointInfo(-1, 1, -1),new PointInfo(0, 16, 0),new PointInfo(2, 2, 0),new PointInfo(1, 1, 0),new PointInfo(1, 2, 1),new PointInfo(0, 16, 0));
						pr90.push(new PointInfo(-1, 1, 1),new PointInfo(0, 16, 0),new PointInfo(0, 2, -2),new PointInfo(0, 1, -1),new PointInfo(1, 2, -1),new PointInfo(0, 16, 0));
						pr180.push(new PointInfo(1, 1, 1),new PointInfo(0, 16, 0),new PointInfo(-2, 2, 0),new PointInfo(-1, 1, 0),new PointInfo(-1, 2, -1),new PointInfo(0, 16, 0));
						pr270.push(new PointInfo(1, 1, -1),new PointInfo(0, 16, 0),new PointInfo(0, 2, 2),new PointInfo(0, 1, 1),new PointInfo(-1, 2, 1),new PointInfo(0, 16, 0));
						
						__priority = -0.56;
						break;
					
					case 99:
						p0.push(	new PointInfo(1, RED, -1), 
									new PointInfo(0, CENTER,  0));
						
						p90.push(new PointInfo(1, RED, 1), new PointInfo(0, CENTER, 0));
						p180.push(new PointInfo(-1, RED, 1), new PointInfo(0, CENTER, 0));
						p270.push(new PointInfo(-1, RED, -1), new PointInfo(0, CENTER, 0));
						pr0.push(new PointInfo(-1, RED, -1), new PointInfo(0, CENTER, 0));
						pr90.push(new PointInfo(-1, RED, 1), new PointInfo(0, CENTER, 0));
						pr180.push(new PointInfo(1, RED, 1), new PointInfo(0, CENTER, 0));
						pr270.push(new PointInfo(1, RED, -1), new PointInfo(0, CENTER, 0));

						__priority = -0.6;
						break;
					/*case 99:
						__priority = -0.55;
						break;*/
				}
			}
		}
		
		public function get priority():Number
		{
			return __priority;
		}

	}
}