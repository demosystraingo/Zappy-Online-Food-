package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MyDao;

/**
 * Servlet implementation class RemoveFromcart
 */
@WebServlet("/RemoveFromcart")
public class RemoveFromcart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RemoveFromcart() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession hs = request.getSession();
		String pid = request.getParameter("pid");
		String user = (String) hs.getAttribute("uid");
		if (user != null) {
			int x = new MyDao().remove(pid, user);
			if (x != 0) {
				response.sendRedirect("CheckOut");
			} else {
				response.sendRedirect("CheckOut");
			}
		} else {
			String ip = new MyDao().ip();
			int x = new MyDao().remove(pid, ip);
			if (x != 0) {
				response.sendRedirect("CheckOut");
			} else {
				response.sendRedirect("CheckOut");
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
