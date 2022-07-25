package temp
{
	import constant.PlayerEvent;
	
	import events.SAEvent;

	public class ResourcePlayerModel
	{
		private var __yellow:uint = 0;
		private var __red:uint = 0;
		private var __blue:uint = 0;
		private var __purple:uint = 0;
		
		public function ResourcePlayerModel()
		{
		}

		public function get purple():uint
		{
			return __purple;
		}

		public function set purple(value:uint):void
		{
			__purple = value;
			player.dispatchEvent( new SAEvent(PlayerEvent.UPDATE_STONES));
		}

		public function get blue():uint
		{
			return __blue;
		}

		public function set blue(value:uint):void
		{
			__blue = value;
			player.dispatchEvent( new SAEvent(PlayerEvent.UPDATE_STONES));
		}

		public function get red():uint
		{
			return __red;
		}

		public function set red(value:uint):void
		{
			__red = value;
			player.dispatchEvent( new SAEvent(PlayerEvent.UPDATE_STONES));
		}

		public function get yellow():uint
		{
			return __yellow;
		}

		public function set yellow(value:uint):void
		{
			__yellow = value;
			player.dispatchEvent( new SAEvent(PlayerEvent.UPDATE_STONES));
		}

	}
}