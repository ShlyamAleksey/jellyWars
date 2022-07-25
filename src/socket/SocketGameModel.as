package socket
{
	import flash.geom.Point;
	
	import constant.GamePlayEvent;
	import constant.SocketEvent;
	
	import events.SAEvent;
	
	import game.model.gameplay.GameModel;
	
	import starling.events.EventDispatcher;
	
	public class SocketGameModel extends EventDispatcher
	{
		private var __gameModel:GameModel;
		public function SocketGameModel()
		{
			__gameModel = GameModel.INSTANCE;
			
			SocketHandler.INSTANCE.addEventListener( SocketEvent.SERVER_DATA, onGetData);
			__gameModel.addEventListener( GamePlayEvent.ON_STEP, sendStep);
		}
		
		private function sendStep(e:SAEvent):void
		{
			if(__gameModel.curentStep == GameModel.BLUE) return;

			var data:Object = 	{ "position" : { 	"x" : e.eventData["position"].x,
													"y" : e.eventData["position"].y }
								};
			SocketHandler.INSTANCE.sendData( data );
		}
		
		private function onGetData(e:SAEvent):void
		{
			var data:Object = JSON.parse(e.eventData.data);
			__gameModel.addVertex(new Point(data.position.x, data.position.y));
		}	
	}
}