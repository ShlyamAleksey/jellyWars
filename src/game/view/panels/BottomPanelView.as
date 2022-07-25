package game.view.panels
{
	import constant.BonusEvent;
	
	import display.SimpleImage;
	import display.button.SimpleButton;
	
	import events.SAEvent;
	
	import game.model.BonusModel;
	
	import starling.display.DisplayObject;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.text.TextField;
	import starling.utils.HAlign;
	import starling.utils.VAlign;
	
	import temp.player;
	
	import tools.Container;
	import tools.Sprite2Button;
	
	dynamic public class BottomPanelView extends Container
	{
		static private var INSTANCE:BottomPanelView;
		
		//Align
		private var __scale:Number = 1;
		
		public function BottomPanelView()
		{
			data = XML(JellyWars.dataXML.BottomPanel);
		}
		
		override protected function init(e:Event = null):void
		{
			INSTANCE = this;
			super.init(e);
			alignPivot(HAlign.CENTER, VAlign.TOP);

			setupIcons();
			updateBonus();

			BonusModel.INSTANCE.addEventListener( BonusEvent.CHOOSE_POINT, OFFTouch);	
			BonusModel.INSTANCE.addEventListener( BonusEvent.ON_DESTROY_POINT, ONTouch);	
			BonusModel.INSTANCE.addEventListener( BonusEvent.ON_UNDO, ONTouch);	
			onResize(null);
		}
		
		private function setupIcons():void
		{
			new Sprite2Button(this.iconClock, onTouch);			
			new Sprite2Button(this.iconRemoveOne, onTouch);		
			new Sprite2Button(this.iconRemoveFive, onTouch);
			new Sprite2Button(this.iconDrawFive, onTouch);
		}
		
		private function setupIcon(target:SimpleImage):void
		{	
			target.addEventListener( TouchEvent.TOUCH, onTouch);
			target.alignPivot();
			target.x += target.width >> 1;
			target.y += target.height >> 1;
		}
		
		private function removeListeners():void
		{	
			this.iconClock.removeEventListener( TouchEvent.TOUCH, onTouch);
			this.iconRemoveOne.removeEventListener( TouchEvent.TOUCH, onTouch);
			this.iconRemoveFive.removeEventListener( TouchEvent.TOUCH, onTouch);
			this.iconDrawFive.removeEventListener( TouchEvent.TOUCH, onTouch);
		}

		private function OFFTouch():void
		{
			this.iconClock.touchable = this.iconRemoveOne.touchable = this.iconRemoveFive.touchable = this.iconDrawFive.touchable = false;
		}
		
		private function ONTouch():void
		{
			this.iconClock.touchable = this.iconRemoveOne.touchable = this.iconRemoveFive.touchable = this.iconDrawFive.touchable = true;
		}
		
		private function updateBonus(e:SAEvent = null):void
		{
			this.clockCount.countTF.text = String(player.bonus.addTime)		
			this.destroyOneCount.countTF.text = String(player.bonus.removeOne)		
			this.destroyFiveCount.countTF.text = String(player.bonus.removeFive)		
			this.drawFiveCount.countTF.text = String(player.bonus.drawFive)		
		}
		
		protected function onTouch(e:TouchEvent):void
		{
			var target:DisplayObject = (e.currentTarget as DisplayObject);
				target.scaleX = target.scaleY = __scale;
				switch(target.name)
				{
					case "iconDrawFive":
						BonusModel.INSTANCE.drawFive();
						break;
					case "iconClock":
						break;
					case "iconRemoveOne":
						BonusModel.INSTANCE.choosePoint();
						break;
					case "iconRemoveFive":
						BonusModel.INSTANCE.removeFive();
						break;
				}		

		}
		
		static public function getScale():Number
		{
			return INSTANCE.scaleX;
		}
		
		override protected function onResize(e:Event):void
		{
			this.width = stage.stageWidth*0.75;
			this.scaleY = this.scaleX;
			this.x = stage.stageWidth >> 1;
			this.y = stage.stageHeight - this.height;
		}
		 
		override protected function destroy(e:Event):void
		{
			super.destroy(e);
			removeListeners();
			BonusModel.INSTANCE.removeEventListener( BonusEvent.CHOOSE_POINT, OFFTouch);	
			BonusModel.INSTANCE.removeEventListener( BonusEvent.ON_DESTROY_POINT, ONTouch);
			BonusModel.INSTANCE.removeEventListener( BonusEvent.ON_UNDO, ONTouch);	
			INSTANCE = null;
		}
	}
}