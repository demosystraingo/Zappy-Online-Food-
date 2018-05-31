package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.CartBean;
import dao.MyDao;

/**
 * Servlet implementation class CheckOut
 */
@WebServlet("/CheckOut")
public class CheckOut extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CheckOut() {
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
		String user = (String) hs.getAttribute("uid");
		String msg = (String)request.getAttribute("msg");
		if(user!=null) {
			int x= new MyDao().count(user);
			ArrayList<CartBean> al = new MyDao().checkCart(user);
			RequestDispatcher rd = request.getRequestDispatcher("checkout.jsp");
			request.setAttribute("data", al);
			request.setAttribute("count", x);
			rd.forward(request, response);
		}else {
			
			String ip =new MyDao().ip();
			int x= new MyDao().count(ip);
			ArrayList<CartBean> al = new MyDao().checkCart(ip);
			RequestDispatcher rd = request.getRequestDispatcher("checkout.jsp");
			request.setAttribute("data", al);
			request.setAttribute("count", x);
			request.setAttribute("msg", msg);
			rd.forward(request, response);
		}

	}

}
