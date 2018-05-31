package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MyDao;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Login() {
		super();
		
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uid = request.getParameter("uid");
		String pwd = request.getParameter("pwd");
		String pagename = request.getParameter("pagename");
		String pagename1 = request.getParameter("pagename1");
		System.out.println("Page1 name is " + pagename1);
		System.out.println("page name is " + pagename);
		MyDao md = new MyDao();
		
		System.out.println(pagename+">>> e f g h>>>>>> "+pagename);
		if (pagename.equals("NA")) 
		{
			String name = md.Customerlogin(uid, pwd);
			if (name != null) {
				System.out.println("a b c d");
				HttpSession hs = request.getSession();
				hs.setAttribute("uid", uid);
				hs.setAttribute("name", name);
				response.sendRedirect(pagename1);
			} else {
				RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
				request.setAttribute("msg", "Login Failed");
				request.setAttribute("pagename1", pagename1);
				rd.forward(request, response);
			}
		} else  {
			String name = md.Customerlogin(uid, pwd);
			if (name != null) {
				System.out.println("e f g h "+pagename);
				HttpSession hs = request.getSession();
				hs.setAttribute("uid", uid);
				hs.setAttribute("name", name);
				response.sendRedirect(pagename);
			} else {
				RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
				request.setAttribute("msg", "Login Failed");
				request.setAttribute("pagename1", pagename);
				rd.forward(request, response);
			}
		}

	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		doGet(request, response);
	}

}
