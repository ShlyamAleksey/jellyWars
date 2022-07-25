package game.model
{
	import flash.geom.Point;
	
	import constant.BonusEvent;
	
	import events.SAEvent;
	
	import game.model.gameplay.FieldModel;
	import game.model.gameplay.GameModel;
	import game.model.graph.Vertex;
	
	import starling.events.EventDispatcher;
	
	public class BonusModel extends EventDispatcher
	{
		static public var INSTANCE:BonusModel
		
		private var __model:GameModel;
		private var __field:FieldModel;

		private var __destroyOneTurn:Boolean = false;
		
		public function BonusModel()
		{
			INSTANCE = this;
			super();
			__model = GameModel.INSTANCE;
			__field = FieldModel.INSTANCE;
		}
		
		public function addClock():void
		{
		
		}
		
		public function removeOne(position:Point):void
		{
			if(__destroyOneTurn && __model.allowRemove(position) )
			{
				__destroyOneTurn = false;
				__model.destroyVertex( position );	
				__field.addToPossible(position);
				dispatchEvent( new SAEvent(BonusEvent.ON_DESTROY_POINT, {"position" : position }));
			}
		}

		public function cancelBonus():void
		{
			__destroyOneTurn = false;
			dispatchEvent( new SAEvent(BonusEvent.ON_UNDO));
		}

		public function choosePoint():void
		{
			__destroyOneTurn = true;
			dispatchEvent( new SAEvent(BonusEvent.CHOOSE_POINT));
		}
		
		public function removeFive():void
		{
			for (var i:int = 0; i < 5; i++) 
			{
				var vertex:Vertex = getFreeVertex();
				if(vertex)
				{
					__model.destroyVertex( vertex.position );	
					__field.possibleMove.push( vertex.position );
					dispatchEvent( new SAEvent(BonusEvent.ON_DESTROY_POINT, {"position" : vertex.position }));
				}	
			}
		}
		
		private function getFreeVertex():Vertex
		{
			if(__model.redGraph.vertexList.length != 0)
			{
				var rand:uint = uint(Math.random()*__model.redGraph.vertexList.length);
				var vertex:Vertex = __model.redGraph.vertexList[rand];
				
				try
				{
					if(__model.allowRemove(vertex.position)) return vertex;
					else return getFreeVertex();
				} 
				catch(error:Error) 
				{
					trace("NO POINTS FOR DESTROY")
					return null;
				}
				
			}
			return null;
		}
		
		public function drawFive():void
		{
			if(__field.possibleMove.length < 5) return;
			for (var i:int = 0; i < 5; i++) 
			{
				var rand:uint = uint(Math.random()*__field.possibleMove.length);
				dispatchEvent( new SAEvent(BonusEvent.ON_DRAW_POINT, {"position" : __field.possibleMove[rand].clone()}));
				__model.drawVertex(__field.possibleMove[rand].clone());		
			}			
		}
		
		public function destroy():void
		{
		}
	}
}