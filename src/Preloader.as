package
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	import Assets.Content;
	
	import events.ContentEvent;
	
	import starling.events.Event;

	public class Preloader extends MainPreloader
	{
		private var __progress:Sprite;
		private var __contentCount:uint = 10;

		//align
		private var __barWidth:Number;
		
		public function Preloader()
		{
			super();
			if (stage) init();
			else addEventListener(flash.events.Event.ADDED_TO_STAGE, init);
			addEventListener(flash.events.Event.REMOVED_FROM_STAGE, destroy);
			Content.instance.addEventListener( ContentEvent.ON_PROGRESS, changeProgress);
		}
		
		private function init(e:flash.events.Event = null):void
		{
			removeEventListener(flash.events.Event.ADDED_TO_STAGE, init);
			__progress = this.progressBar.bar;
			__barWidth = __progress.width;
			__progress.width = 0;	
		}
		
		private function changeProgress(e:starling.events.Event):void
		{		
			__progress.width += __barWidth/__contentCount;
		}
		
		private function destroy(event:flash.events.Event):void
		{
			removeEventListener(flash.events.Event.REMOVED_FROM_STAGE, destroy);	
		}
	}
}