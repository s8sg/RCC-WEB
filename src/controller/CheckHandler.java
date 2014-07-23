package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ProcessLoader;

/**
 * Servlet implementation class CheckHandler
 */
public class CheckHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckHandler() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String type = request.getParameter("type");
		String comp = request.getParameter("comp");
		String uname= request.getParameter("uname");
		if(type.equals("ans"))
		{
			//we have to write the and to the file
			String ans = request.getParameter("ans");
			String arr[] = ans.split(" ");
			ArrayList<String> plist = new ArrayList<String>();
			for(int i=0;i<arr.length;i++)
			{
				System.out.println(arr[i]);
				plist.add(arr[i]);
			}
			if(ProcessLoader.writeKillProcessList(plist,uname,comp))
			{	
				String str = "";
				for(int i=0;i<arr.length;i++)
				{
					str = str + arr[i] + ", ";
				}
				response.getWriter().write(str);
				
				
			}
			else
			{
			System.out.println("Communication error !!!  WebServersite User Process write to file error !!");
			response.getWriter().write("no");
			}
		}
		else if(type.equals("query"))
		{
			ArrayList<String> plist = ProcessLoader.getProcessList(uname,comp);
			String str = "";
			int i = 1;
			for(String line: plist)
			{
				if(i>3)
				{
				int pos = line.indexOf(".exe");
				pos = pos + 4;
				String substring = line.substring(0,pos);
				str = str +"<option value=\"" +  substring + "\">"+ substring + "</option>" +"<br>";
				i++;
				}
				else
					i++;
			}
			
			response.getWriter().write(str);
		}
		else if(type.equals("newp"))
		{
			String ans = request.getParameter("ans");
			String arr[] = ans.split(" ");
			ArrayList<String> plist = new ArrayList<String>();
			for(int i=0;i<arr.length;i++)
			{
				System.out.println(arr[i]);
				plist.add(arr[i]);
			}
			if(ProcessLoader.writeNewProcessList(plist,uname,comp))
			{	
				String str = "";
				for(int i=0;i<arr.length;i++)
				{
					str = str + arr[i] + ", ";
				}
				response.getWriter().write(str);	
			}
			else
			{
			System.out.println("Communication error !!!  WebServersite User Process write to file error !!");
			response.getWriter().write("no");
			}
		}
	}

}
