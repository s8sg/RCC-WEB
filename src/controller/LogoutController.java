package controller;


import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LogoutController
 */
public class LogoutController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LogoutController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("deprecation")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession(false);
		String runame = request.getParameter("user");
		System.out.println("userreqname = " + runame);
		String suname = (String) request.getSession().getAttribute("uname");
		System.out.println("usersesname = " + suname);
		if(suname != null && session != null)
		{
			session.removeAttribute("uname");
			session.removeValue(runame);
			session.invalidate();
			response.sendRedirect("index.html");
		}
		else
		{
			out.println("<h3>Problem !!</h3>" + runame);
		}
	}

}