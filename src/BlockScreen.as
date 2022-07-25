package
{
	import starling.display.DisplayObject;

	public class BlockScreen
	{
		public function BlockScreen()
		{
		}
		
		static public function block(target:DisplayObject):void
		{
			target.touchable = false;
		}
		
		static public function unblock(target:DisplayObject):void
		{
			target.touchable = true;
		}
	}
}