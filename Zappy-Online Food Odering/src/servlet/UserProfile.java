package servlet;

import java.io.IOException;
import java.io.PrintWriter;

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
 * Servlet implementation class UserProfile
 */
@WebServlet("/UserProfile")
public class UserProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserProfile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession hs = request.getSession();
		String email= (String)hs.getAttribute("uid");
		String name=request.getParameter("fname");
		String lname=request.getParameter("lname");
		String eid=request.getParameter("email");
		String mob=request.getParameter("mob");
		String add=request.getParameter("add");
		String opwd=request.getParameter("opwd");
		String npwd=request.getParameter("npwd");
		PrintWriter out = response.getWriter();
		if(opwd.equals(""))
		{
			CustomerBean b = new CustomerBean(name, lname, mob, eid, add);
			int x = new MyDao().userProfile(b, email);
			if(x!=0) {
				hs.setAttribute("name", name);
				hs.setAttribute("uid", eid);
				response.sendRedirect("Index");
			}else {
				out.println(name);
			}
		}else {
			CustomerBean b = new CustomerBean(name, lname, mob, eid, add, npwd);
			int x = new MyDao().customerUpdate(b, email,opwd);
			if(x!=0) {
				hs.setAttribute("name", name);
				hs.setAttribute("uid", eid);
				response.sendRedirect("Index");
			}else {
				RequestDispatcher rd = request.getRequestDispatcher("UpdateUserProfile");
				request.setAttribute("msg", "Please Enter A Valid Password");
				rd.forward(request, response);
			}
		}	
	}
}