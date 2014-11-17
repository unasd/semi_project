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
		else if(cmd.equals("final-sal-search1"))
			return new final_sal_search1Command();
		else if(cmd.equals("input-all-search"))
			return new Input_all_searchCommand();
		else if(cmd.equals("list-search"))
			return new List_searchCommand();
		else if(cmd.equals("input-search"))
			return new aInput_SearchCommand();
		else if(cmd.equals("CurrentState"))
			return new CurrentState();
		else if(cmd.equals("SelectDate"))
			return new SelectDate();
		else if(cmd.equals("AlldateTest"))
			return new AlldateTest();
		else if(cmd.equals("stock-chart"))//테스트 커맨드
			return new Stock_chartCommand();
		return null;
	}
	
}
