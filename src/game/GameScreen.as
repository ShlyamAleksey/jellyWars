package game
{
	import flash.geom.Point;
	
	import AI.AIModel;
	
	import Assets.Content;
	
	import constant.GamePlayEvent;
	import constant.Options;
	
	import display.SimpleSprite;
	import display.managers.WindowsManager;
	
	import game.model.BonusModel;
	import game.model.gameplay.FieldModel;
	import game.model.gameplay.GameModel;
	import game.model.gameplay.ResourceModel;
	import game.model.gameplay.ScoreModel;
	import game.ui.BonusUI;
	import game.view.gameplay.GameView;
	import game.view.panels.BottomPanelView;
	import game.view.panels.TopPanelView;
	import game.view.windows.GameOverView;
	
	import socket.SocketGameModel;
	
	import starling.events.Event;
	import starling.text.TextField;
	
	public class GameScreen extends SimpleSprite
	{
		private var __gameModel:GameModel;
		private var __fieldModel:FieldModel;
		private var __resourceModel:ResourceModel;
		private var __scoreModel:ScoreModel;
		private var __bonusModel:BonusModel;
		private var __ai:AIModel;
		
		private var __gameView:GameView;
		private var __bonusUI:BonusUI;
		private var __socketData:SocketGameModel;
		
		public function GameScreen()
		{
			
		}
		
		override protected function init(e:Event = null):void
		{
			super.init(e);
			
			options();
			
			__gameModel = new GameModel();
			__fieldModel = new FieldModel();
			__resourceModel = new ResourceModel();
			__scoreModel = new ScoreModel();
			__bonusModel = new BonusModel();
			__ai = new AIModel();
			
			__gameView = new GameView();
			__bonusUI = new BonusUI();
			
			if(!JellyWars.TEST ) __socketData = new SocketGameModel();
				
			addChild(__gameView);
			addChild( new TopPanelView());
			addChild( new BottomPanelView());
			addChild( __bonusUI );
			
			__gameModel.start();
			
//			GameModel.INSTANCE.addVertex(new Point(9,8));
//			GameModel.INSTANCE.addVertex(new Point(10,8));
//			GameModel.INSTANCE.addVertex(new Point(10,7));
//			GameModel.INSTANCE.addVertex(new Point(15,8));
//			GameModel.INSTANCE.addVertex(new Point(11,7));
//			GameModel.INSTANCE.addVertex(new Point(15,7));
//			GameModel.INSTANCE.addVertex(new Point(10,9));
//			GameModel.INSTANCE.addVertex(new Point(16,8));
//			GameModel.INSTANCE.addVertex(new Point(11,9));
//			GameModel.INSTANCE.addVertex(new Point(17,8));
//			GameModel.INSTANCE.addVertex(new Point(12,8));
			
			AIModel.AI_STATUS = true;

			onResize(null);
			
			__fieldModel.addEventListener(GamePlayEvent.COMPLETE_LEVEL, endLevel);
		}
		
		private function endLevel():void
		{
			WindowsManager.show( GameOverView );
		}
		
		private function options():void
		{
			Options.TAP_AREA_SIZE =  Content.instance.manager.getTexture("cell").width >> 1;
			Options.TAP_SIZE = (Options.TAP_AREA_SIZE*2 + Options.TAP_AREA_DISTANCE);
		}
		
		override protected function onResize(e:Event):void
		{
		
		}
		
		override protected function destroy(e:Event):void
		{
			super.destroy(e);
			__fieldModel.removeEventListener(GamePlayEvent.COMPLETE_LEVEL, endLevel);
			
			__gameModel.destroy();
			__fieldModel.destroy();
			__resourceModel.destroy();
			__scoreModel.destroy();
			__bonusModel.destroy();
			
		}
	}
}