package
{
	import AI.PatternConvertor;
	
	import console.ICommand;
	import console.console;

	public class Command implements ICommand
	{
		public function Command()
		{
		}
		
		public function execute(command:String):void
		{
			switch(command)
			{
				case "create_pattern":
				{
					PatternConvertor.INSTANCE.createPattern();
					console("create");
					break;
				}
					
				default:
				{
					break;
				}
			}
		}
	}
}