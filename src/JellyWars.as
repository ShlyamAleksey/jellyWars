package
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	import Assets.Content;
	import Assets.EmbededFont;
	
	import console.ConsoleAssets;
	
	import constant.SocketEvent;
	
	import display.managers.ScreenManager;
	
	import events.SAEvent;
	
	import game.GameScreen;
	
	import socket.SocketHandler;

	[SWF(width="1280", height="900", frameRate="60")]

	public class JellyWars extends Sprite
	{
		[Embed(source="../assets/mainGUI.xml", mimeType="application/octet-stream")]
		static public const dataXMLClass:Class;
		static public var dataXML:XML;
		
		static public var TEST:Boolean = true;
		static public var __loader:Sprite;
		
		public function JellyWars()
		{
			super();
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
			addEventListener(Event.REMOVED_FROM_STAGE, destroy);
		}
		
		private function init(e:Event = null):void
		{
			
			EmbededFont.Consolas;
			
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			createLoader();
			addChild( ConsoleAssets.instance );
			ConsoleAssets.style = ConsoleAssets.DARK_BLUE;
			ConsoleAssets.command = Command;
		}
		
		private function createLoader():void
		{
			__loader = new Preloader();
			addChild(__loader);
			
//			createSocket();	
			createStarling();
		}
		
		private function createSocket():void
		{
			new SocketHandler();
			
			SocketHandler.INSTANCE.addEventListener(SocketEvent.SERVER_CONNECTED, onConnected);	
			SocketHandler.INSTANCE.startConnection(SocketHandler.CONNECT_PATH, 8080);
		}
		
		private function onConnected(e:SAEvent):void
		{
			SocketHandler.INSTANCE.removeEventListener(SocketEvent.SERVER_CONNECTED, onConnected);
			//createStarling();
		}
		
		private function onComplete():void
		{
			ScreenManager.show(GameScreen);
			
			
			removeChild( __loader );
		}
		
		private function createStarling():void
		{
			Connections.STATIC_PATH = "http://dev.purpurgames.com/jelly-total-wars/assets/"
//			Connection.STATIC_PATH = "../assets/"
				
			Content.atfList = ["BGPack_1", "BGPack_2", "gameUI", "Window_GameOver", "Jellies"];
			Content.IS_NEW = true;
			
			appMain.loadComplete = onComplete;
			dataXML = XML(new dataXMLClass());
			
			new StarlingManager(stage);
		}
		
		private function destroy(event:Event):void
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, destroy);	
		}
	}
}