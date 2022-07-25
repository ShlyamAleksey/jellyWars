package game.model.gameplay
{
	import constant.GamePlayEvent;
	
	import events.SAEvent;
	
	import starling.events.EventDispatcher;
	
	public class ScoreModel extends EventDispatcher
	{
		static public var INSTANCE:ScoreModel;
		
		private var __blueScore:uint = 0;
		private var __redScore:uint = 0;
		
		public function ScoreModel()
		{
			INSTANCE = this;
		}

		public function get redScore():uint
		{
			return __redScore;
		}

		public function get blueScore():uint
		{
			return __blueScore;
		}
		
		public function setScore():void
		{
			if(GameModel.INSTANCE.curentStep == GameModel.BLUE) __blueScore++;	
			else __redScore++;	
			
			dispatchEvent( new SAEvent(GamePlayEvent.ADD_SCORE));		
		}

		public function destroy():void
		{
		}
		
	}
}