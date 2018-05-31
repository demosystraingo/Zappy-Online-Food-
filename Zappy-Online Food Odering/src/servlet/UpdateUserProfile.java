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
 * Servlet implementation class UpdateUserProfile
 */
@WebServlet("/UpdateUserProfile")
public class UpdateUserProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateUserProfile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MyDao md = new MyDao();
		HttpSession session =request.getSession(); 
		String user = (String)session.getAttribute("uid");
		String msg=(String)request.getAttribute("msg");
		String email = request.getParameter("email");
		if(user==null) {
			CustomerBean b = md.updateProfile(email);
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
			if(b!=null) {
				RequestDispatcher rd = request.getRequestDispatcher("viewcustomerdetails.jsp");
				request.setAttribute("data", b);
				request.setAttribute("msg", msg);
				request.setAttribute("count", cnt);
				rd.forward(request, response);
			}else {
				PrintWriter out = response.getWriter();
				out.println("not success");
			}
		}else if(email==null) {
		CustomerBean b = md.updateProfile(user);
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
		if(b!=null) {
			RequestDispatcher rd = request.getRequestDispatcher("updateprofile.jsp");
			request.setAttribute("data", b);
			request.setAttribute("msg", msg);
			request.setAttribute("count", cnt);
			rd.forward(request, response);
		}else {
			PrintWriter out = response.getWriter();
			out.println("not success");
		}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
