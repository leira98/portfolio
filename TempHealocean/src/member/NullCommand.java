package member;

import javax.servlet.*;
import javax.servlet.http.*;

import member.Command;

public class NullCommand extends Command {
	private String next;

	public NullCommand(String next) {
		this.next = next;
	}
	public String execute(HttpServletRequest request,HttpServletResponse response) 
	throws Exception {
		return next;
	}

}