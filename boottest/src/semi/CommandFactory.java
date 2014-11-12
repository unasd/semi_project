package semi;

public class CommandFactory {
	private CommandFactory(){}
	private static CommandFactory instance = new CommandFactory();
	
	public static CommandFactory getInstance(){
		return instance;
	}
	
	public Command createCommand(String cmd){
		System.out.println(cmd);
		if(cmd.equals("input"))
			return new InputCommand();
		else if(cmd.equals("output"))
			return new OutputCommand();
		else if(cmd.equals("final-sal-search"))
			return new final_sal_searchCommand();
		else if(cmd.equals("input-all-search"))
			return new Input_all_searchCommand();
		else if(cmd.equals("list-search"))
			return new List_searchCommand();
		else if(cmd.equals("plist-search"))
			return new Plist_searchCommand();
		else if(cmd.equals("output-all-search"))
			return new Output_all_searchCommand();
		else if(cmd.equals("stock-search"))
			return new Stock_searchCommand();
		
		return null;
	}
}
