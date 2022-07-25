package Assets
{
	public class EmbededFont
	{
		[Embed(source='../../assets/fonts/Consolas.ttf', fontName = 'Consolas', embedAsCFF='false')]
		public static var Consolas:Class; public static const CONSOLAS:String = 'Consolas';
		
		[Embed(source='../../assets/fonts/Corbel.ttf', fontName = 'Corbel', embedAsCFF='false')]
		public static var Corbel:Class; public static const CORBEL:String = 'Corbel';
		
		[Embed(source='../../assets/fonts/Tahomabd.ttf', fontName = 'Tahoma', embedAsCFF='false')]
		public static var TahomaBold:Class; public static const TAHOMA_BOLD:String = 'TahomaBold';
		
		[Embed(source='../../assets/fonts/Tahoma.ttf', fontName = 'Tahoma', embedAsCFF='false')]
		public static var Tahoma:Class; public static const TAHOMA:String = 'Tahoma';
	}
}