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

import bean.ZappyBean;
import dao.MyDao;

/**
 * Servlet implementation class Single
 */
@WebServlet("/Single")
public class Single extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Single() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String user = (String)session.getAttribute("uid");
		String pid = request.getParameter("pid");
		MyDao mdo=new MyDao();
		int count=0;
		String cnt=null;
		if(user!=null) {
		count = mdo.count(user);
		cnt=String.valueOf(count);
		System.out.println(count+" "+user);
		}else {
			String ip = mdo.ip();
			count = mdo.count(ip);
			cnt=String.valueOf(count);
			System.out.println(count+" "+ip);
		}

		if (pid != null) {
			HttpSession hs = request.getSession();
			hs.setAttribute("pid", pid);
			MyDao md = new MyDao();
			ArrayList<ZappyBean> al = md.viewSingle(pid);
			RequestDispatcher rd = request.getRequestDispatcher("singlezappy.jsp");
			request.setAttribute("data", al);
			request.setAttribute("count", cnt);
			rd.forward(request, response);
		} else {
			HttpSession hs = request.getSession();
			String id = (String) hs.getAttribute("pid");
			MyDao md = new MyDao();
			ArrayList<ZappyBean> al = md.viewSingle(id);
			RequestDispatcher rd = request.getRequestDispatcher("singlezappy.jsp");
			request.setAttribute("data", al);
			request.setAttribute("count", cnt);
			rd.forward(request, response);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
