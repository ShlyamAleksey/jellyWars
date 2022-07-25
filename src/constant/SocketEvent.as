package constant
{
	import flash.events.Event;

	public class SocketEvent extends Event
	{
		static public const SERVER_CONNECTED:String = "server connected";
		static public const SERVER_ERROR:String = "server error";
		static public const SERVER_CLOSED:String = "server closed";
		static public const SERVER_DATA:String = "server income chat";
		static public const SERVER_INCOME_GAME:String = "server income game";
		static public const OUTCOME_MESSAGE:String = "outcome message";
	}
}