package semi;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class SemiController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		req.setCharacterEncoding("euc-kr");
		resp.setCharacterEncoding("euc-kr");
		 
		String cmd = req.getParameter("command");
		String url="";
			
		CommandFactory factory = CommandFactory.getInstance();		
		Command icmd = factory.createCommand(cmd);
		url = (String)icmd.processCommand(req, resp);
		System.out.println(url);
			
		RequestDispatcher view = req.getRequestDispatcher(url);
		view.forward(req, resp);
	}
}
