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
 * Servlet implementation class Addtocart
 */
@WebServlet("/Addtocart")
public class Addtocart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Addtocart() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession hs = request.getSession();
		String pid = request.getParameter("pid");
		String quantity = request.getParameter("add");
		String user = (String) hs.getAttribute("uid");
		String pagename=request.getParameter("pagename");
		MyDao md = new MyDao();
		int count=0;
		String cnt=null;
		if(user!=null) {
		count = md.count(user);
		cnt=String.valueOf(count);
		System.out.println(count+" "+user);
		}else {
			String ip = md.ip();
			count = md.count(ip);
			cnt=String.valueOf(count);
			System.out.println(count+" "+ip);
		}
		if (user != null) {
			int x = md.addToCart(pid, quantity, user);
			if (x != 0) {

				RequestDispatcher rd = request.getRequestDispatcher(pagename);
				request.setAttribute("cart", "product added To cart");
				request.setAttribute("count", cnt);
				rd.forward(request, response);
			}

		} else if (user == null) {
			String ip = md.ip();
			int x = md.addToCart(pid, quantity, ip);
			if (x != 0) {

				RequestDispatcher rd = request.getRequestDispatcher(pagename);
				request.setAttribute("cart", "product added To cart");
				request.setAttribute("count", cnt);
				rd.forward(request, response);
			}
		}
	}

}
