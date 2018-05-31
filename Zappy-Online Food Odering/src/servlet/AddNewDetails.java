package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.CustomerBean;
import dao.MyDao;

/**
 * Servlet implementation class AddNewDetails
 */
@WebServlet("/AddNewDetails")
public class AddNewDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddNewDetails() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession hs = request.getSession();
		String email = (String) hs.getAttribute("uid");
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String mob = request.getParameter("mob");
		String lndm = request.getParameter("lndm");
		String town = request.getParameter("town");
		String addtype = request.getParameter("addtype");
		String address = lndm + " ," + town + " ,Address Type :-" + addtype;
		MyDao md = new MyDao();
		if (email != null) {
			CustomerBean b = new CustomerBean(fname, lname, mob, email, address);
			int x = md.updateAddress(b);
			if (x != 0) {
				RequestDispatcher rd = request.getRequestDispatcher("CheckOut");
				request.setAttribute("msg", "Dear " + fname + " Your details has been Updated");
				rd.forward(request, response);
			}
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			request.setAttribute("msg", "You need to login Before Updating Your Details");
			request.setAttribute("pagename1", "CheckOut");
			rd.forward(request, response);
		}
	}

}
