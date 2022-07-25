package temp
{
	import starling.events.EventDispatcher;
	
	public class PlayerModel extends EventDispatcher
	{
		static private var __init:PlayerModel
		
		public function get bonus():BonusPlayerModel
		{
			return __bonus;
		}

		public function set bonus(value:BonusPlayerModel):void
		{
			__bonus = value;
		}

		static public function get instance():PlayerModel
		{
			if(!__init) __init = new PlayerModel();
			return __init;
		}
		
		private var __resource:ResourcePlayerModel;
		private var __bonus:BonusPlayerModel;
		
		public function PlayerModel()
		{
			super();
			__resource = new ResourcePlayerModel();
			__bonus = new BonusPlayerModel();
		}
			
		public function get resource():ResourcePlayerModel
		{
			return __resource;
		}

		public function set resource(value:ResourcePlayerModel):void
		{
			__resource = value;
		}

	}
}