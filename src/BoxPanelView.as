package
{
	import starling.events.Event;
	
	import tools.Container;
	
	dynamic public class BoxPanelView extends Container
	{
		public function BoxPanelView()
		{
			//_init = this;
			data = XML(JellyWars.dataXML.BoxPanel);
		}
		
		override protected function init(e:Event = null):void
		{
			super.init(e);
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			stage.addEventListener(Event.RESIZE, onResize);
			onResize(null);
		}
		
		override protected function onResize(e:Event):void{}
		
		override protected function destroy(e:Event):void
		{
			super.destroy(e);
			removeEventListener(Event.REMOVED_FROM_STAGE, destroy);	
		}
	}
}