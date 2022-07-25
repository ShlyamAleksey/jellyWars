package game.view.panels
{
	import com.greensock.TweenLite;
	
	import flash.geom.Point;
	
	import AI.AIModel;
	
	import console.console;
	
	import constant.AnimationDelay;
	import constant.GamePlayEvent;
	import constant.PlayerEvent;
	
	import display.SimpleImage;
	import display.managers.WindowsManager;
	import display.text.SimpleTextField;
	
	import events.SAEvent;
	
	import game.model.gameplay.FieldModel;
	import game.model.gameplay.GameModel;
	import game.model.gameplay.ResourceModel;
	import game.model.gameplay.ScoreModel;
	import game.view.gameplay.PointView;
	import game.view.windows.GameOverView;
	
	import starling.display.Button;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;
	import starling.utils.HAlign;
	import starling.utils.VAlign;
	
	import temp.player;
	
	import tools.Container;
	
	dynamic public class TopPanelView extends Container
	{
		static private var _init:TopPanelView;
		static public function get instance():TopPanelView { return _init; }
		
		private var __redIco:Sprite;
		private var __blueIco:Sprite;
		
		private var __model:GameModel;
		
		//align
		private var __iconGap:Number = 10;
		
		public function TopPanelView()
		{
			_init = this;
			data = XML(JellyWars.dataXML.TopPanel);
		}
		
		override protected function init(e:Event = null):void
		{
			__model = GameModel.INSTANCE;
			
			super.init(e);
			alignPivot(HAlign.CENTER, VAlign.TOP);
			onResize(null);
			
			 this.exitButton.addEventListener(Event.TRIGGERED, onExit);
			
			player.addEventListener(PlayerEvent.UPDATE_STONES, updateTexts);
			ScoreModel.INSTANCE.addEventListener( GamePlayEvent.ADD_SCORE, changeScore);
			updateResource();
			changeScore();
			createIco();
		}
		
		private function createIco():void
		{
			
			var ico2:SimpleImage = new SimpleImage(assets.getTexture(PointView.BLUE_TEXTURE));
			__blueIco = this.getChildByName("blueIco") as Sprite;
			__blueIco.addChild( ico2 );
			
			ico2.x = (__blueIco.width - ico2.width) >> 1;			
			ico2.y = __blueIco.height - ico2.height - __iconGap;
			
			var ico:SimpleImage = new SimpleImage(assets.getTexture(PointView.RED_TEXTURE));
			__redIco = this.getChildByName("redIco") as Sprite;
			__redIco.addChild( ico );
			
			ico.x = (__redIco.width - ico.width) >> 1;	
			ico.y = __redIco.height - ico.height - __iconGap;	
		}
		
		private function changeScore(e:SAEvent = null):void
		{
			this.scoreTF.text = ScoreModel.INSTANCE.blueScore + ":" + ScoreModel.INSTANCE.redScore;
		}
		
		private function updateTexts(e:SAEvent):void
		{
			TweenLite.to(this, AnimationDelay.TOP_PANEL_STONE_COUNT , { onComplete:updateResource})
		}

		private function updateResource():void
		{
			this.pinkCountTF.text = String(player.resource.red);
			this.blueCountTF.text = String(player.resource.blue);
			this.yellowCountTF.text = String(player.resource.yellow);
			this.violetCountTF.text = String(player.resource.purple);
		}
		
		private function onExit(e:Event):void
		{
			WindowsManager.show(GameOverView);
		}
		
		public function iconPosition(type:uint):Point
		{
			switch(type)
			{
				case FieldModel.RED_STONE:
					return localToGlobal( new Point(this.pinkCountTF.x, this.pinkCountTF.y));
					break;
				case FieldModel.PURPLE_STONE:
					return localToGlobal( new Point(this.violetCountTF.x, this.violetCountTF.y));
					break;
				case FieldModel.YELLOW_STONE:
					return localToGlobal( new Point(this.yellowCountTF.x, this.yellowCountTF.y));
					break;
				default:
					return localToGlobal( new Point(this.blueCountTF.x, this.blueCountTF.y));
					break;
			}
		}
		
		override protected function onResize(e:Event):void
		{
			this.width = stage.stageWidth*0.75;
			this.scaleY = this.scaleX;
			this.x = stage.stageWidth >> 1;
		}
		
		override protected function destroy(e:Event):void
		{
			super.destroy(e);
			player.removeEventListener(PlayerEvent.UPDATE_STONES, updateTexts);
			ScoreModel.INSTANCE.removeEventListener( GamePlayEvent.ADD_SCORE, changeScore);
			this.exitButton.removeEventListener(Event.TRIGGERED, onExit);
		}
	}
}