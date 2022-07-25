package temp
{
	import constant.PlayerEvent;
	
	import events.SAEvent;

	public class BonusPlayerModel
	{
		private var __addTime:uint = 4;
		private var __removeOne:uint = 4;
		private var __removeFive:uint = 4;
		private var __drawFive:uint = 4;
		
		public function BonusPlayerModel()
		{
		}

		public function get drawFive():uint
		{
			return __drawFive;
		}

		public function set drawFive(value:uint):void
		{
			__drawFive = value;
			player.dispatchEvent( new SAEvent(PlayerEvent.UPDATE_BONUS));
		}

		public function get removeFive():uint
		{
			return __removeFive;
		}

		public function set removeFive(value:uint):void
		{
			__removeFive = value;
			player.dispatchEvent( new SAEvent(PlayerEvent.UPDATE_BONUS));
		}

		public function get removeOne():uint
		{
			return __removeOne;
		}

		public function set removeOne(value:uint):void
		{
			__removeOne = value;
			player.dispatchEvent( new SAEvent(PlayerEvent.UPDATE_BONUS));
		}

		public function get addTime():uint
		{
			return __addTime;
		}

		public function set addTime(value:uint):void
		{
			__addTime = value;
			player.dispatchEvent( new SAEvent(PlayerEvent.UPDATE_BONUS));
		}

	}
}