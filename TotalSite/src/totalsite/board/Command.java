package totalsite.board;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Command {
	Object processCommand(HttpServletRequest req, HttpServletResponse resp)
		throws UnsupportedEncodingException;
}
