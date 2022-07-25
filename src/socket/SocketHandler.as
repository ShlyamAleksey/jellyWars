package socket
{
	import flash.events.DataEvent;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.XMLSocket;
	import flash.system.Security;
	
	import constant.SocketEvent;
	
	import events.SAEvent;
	
	import starling.events.EventDispatcher;
	
	public class SocketHandler extends EventDispatcher
	{
		static public var INSTANCE:SocketHandler;
		static public var CONNECT_PATH:String = '192.168.70.76';
		
		private var __xmlSocket:XMLSocket;
		private var __connectStatus:Boolean = false;
		
		public function SocketHandler()
		{
			INSTANCE = this;
			
			Security.loadPolicyFile("xmlsocket://192.168.70.76:843");
			
			var __socketModule:SocketDataMolel = new SocketDataMolel();	
			
			createConnect();
		}
		
		private function createConnect():void
		{
			__xmlSocket = new XMLSocket();
			__xmlSocket.addEventListener(DataEvent.DATA, onDataHandler);
			__xmlSocket.addEventListener(Event.CONNECT, onConnectHandler);
			__xmlSocket.addEventListener(Event.CLOSE, onCloseHandler);
			__xmlSocket.addEventListener(IOErrorEvent.IO_ERROR, onErrorHandler);	
		}
		
		public function startConnection(host:String = '127.0.0.1', port:int = 843):void
		{
			__xmlSocket.connect(host, port);
		}
		
		public function closeConnection():void
		{
			__xmlSocket.close();
		}
		
		public function sendData(data:Object):void
		{
			if(__connectStatus) __xmlSocket.send( JSON.stringify(data));
		}
		
		protected function onDataHandler(e:DataEvent):void
		{
			dispatchEvent( new SAEvent( SocketEvent.SERVER_DATA, {"data": e.data} ));
		}
		
		protected function onConnectHandler(e:Event):void
		{
			__connectStatus = true;
			dispatchEvent( new SAEvent( SocketEvent.SERVER_CONNECTED ));
		}
		
		protected function onCloseHandler(e:Event):void
		{
			dispatchEvent( new SAEvent( SocketEvent.SERVER_CLOSED ));
		}
		
		protected function onErrorHandler(e:IOErrorEvent):void
		{
			dispatchEvent( new SAEvent( SocketEvent.SERVER_ERROR ));
		}
	}
}