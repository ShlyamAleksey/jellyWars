package game.view.windows
{
	import com.greensock.TweenLite;
	import com.greensock.easing.Back;
	
	import display.managers.ScreenManager;
	import display.managers.WindowsManager;
	
	import game.GameScreen;
	import game.model.gameplay.ScoreModel;
	
	import starling.events.Event;
	import starling.text.TextField;
	
	import temp.player;
	
	import tools.Container;
	import tools.Sprite2Button;
	
	dynamic public class GameOverView extends Container
	{
		private var __isVictory:Boolean = true;
		
		public function GameOverView()
		{
			data = XML(JellyWars.dataXML.VictoryWindow);
		}
		
		override protected function init(e:Event = null):void
		{
			super.init(e);
			alignPivot();
			
			setupButtons();
			setupTextFields();
			prepearWindow();
			onResize(null);	
		}
		
		private function prepearWindow():void
		{
			if(__isVictory)
			{
				this.scoreDefeat.visible = false;
				this.title_defeat.visible = false;
				
				this.pipeIco_1.visible = this.pipeIco_2.visible = this.pipeIco_3.visible = false;
				this.flag_right.visible = this.flag_left.visible = false; 
				this.congratulationTF.text = "ПОЗДРАВЛЯЕМ!";
				this.congratulationTF.fontSize = 24;	
			}
			else
			{
				this.scoreVictory.visible = false;
				this.title_win.visible = false;
				this.titleTF.visible = false;	
				this.congratulationTF.text = "Ваш опыт уменшился.";
				this.congratulationTF.fontSize = 32;	
			}
			
			this.congratulationTF.color = 0xFFF6CC;
			(this.congratulationTF as TextField).bold = true;
		}
		
		private function setupTextFields():void
		{			
			this.scoreTF.text = ScoreModel.INSTANCE.blueScore + ":" + ScoreModel.INSTANCE.redScore;
			
			this.redStoneTF.text = String(player.resource.red);
			this.blueStoneTF.text = String(player.resource.blue);
			this.yellowStoneTF.text = String(player.resource.yellow);
			this.purpleStoneTF.text = String(player.resource.purple);
		}
		
		private function setupButtons():void
		{			
			new Sprite2Button(this.closeBtn, closeWindow);
			new Sprite2Button(this.replayBtn, closeWindow, Sprite2Button.BRIGHT);
			new Sprite2Button(this.nextBtn, closeWindow, Sprite2Button.BRIGHT);
			new Sprite2Button(this.levelBtn, closeWindow, Sprite2Button.BRIGHT);
		}
		
		private function closeWindow(e:Event):void
		{
			WindowsManager.hide(onHide);
		}
		
		private function onHide():void
		{
			ScreenManager.show(GameScreen);
		}
		
		public function show():void
		{			
			this.levelBtn.alpha = this.replayBtn.alpha = this.nextBtn.alpha =
			this.closeBtn.alpha = this.title_defeat.alpha = this.titleTF.alpha = this.title_win.alpha = 0;
			
			TweenLite.from(this, 0.75, { alpha:0, scaleX:0.1, scaleY:0.1, ease:Back.easeOut } );
			TweenLite.from(this, 0.35, { onComplete: onShowMain } );
		}
		
		private function onShowMain():void
		{
			this.levelBtn.alpha = this.closeBtn.alpha = this.title_defeat.alpha = this.titleTF.alpha = this.title_win.alpha = 1;
			
			TweenLite.from(this.title_defeat, 0.75, { alpha:0, y:-100, ease:Back.easeOut } );
			
			TweenLite.from(this.titleTF, 0.75, { alpha:0, y:-100, ease:Back.easeOut } );
			TweenLite.from(this.title_win, 0.75, { alpha:0, y:-100, ease:Back.easeOut } );
			
			TweenLite.from(this.closeBtn, 0.75, { alpha:0, x:600, ease:Back.easeOut } );
			
			TweenLite.from(this.levelBtn, 0.5, { alpha:0, scaleX:0.2, scaleY:0.2, ease:Back.easeOut } );
			TweenLite.from(this, 0.15, { onComplete: onShowLevelBtn } );
		}
		
		private function onShowLevelBtn():void
		{
			this.replayBtn.alpha = 1;
			TweenLite.from(this.replayBtn, 0.5, { alpha:0, scaleX:0.2, scaleY:0.2, ease:Back.easeOut } );
			TweenLite.from(this, 0.15, { onComplete: ReplayBtn } );
		}
		
		private function ReplayBtn():void
		{
			this.nextBtn.alpha = 1;
			TweenLite.from(this.nextBtn, 0.5, { alpha:0, scaleX:0.2, scaleY:0.2, ease:Back.easeOut } );	
		}
		override protected function onResize(e:Event):void
		{
			this.x = int(stage.stageWidth >> 1);
			this.y = int(stage.stageHeight >> 1);
		}
		
		override protected function destroy(e:Event):void
		{
			super.destroy(e);
		}
	}
}