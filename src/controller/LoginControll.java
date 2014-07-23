package controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginControll
 */
public class LoginControll extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String uname;
	private String pass;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginControll() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		uname = config.getInitParameter("uname");
		pass = config.getInitParameter("pass");
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		String uname = request.getParameter("username");
		String pass = request.getParameter("password");
		if(uname.equals(this.uname) && pass.equals(this.pass))
		{
			double rndno = (Math.random() * 1000) + (Math.random() * 10);
			HttpSession session = request.getSession(true);
			session.setAttribute("uname", uname+rndno);
			response.sendRedirect("home.jsp?&uname=" + uname+rndno + "&user=" + uname + "&page=" + "CMD.jsp");
		}
		else
		{
			out.println("<h3>Wrong Username Password</h3>");
			out.println("<A HREF=\"index.html\">login</A>");
		}
	}

}
