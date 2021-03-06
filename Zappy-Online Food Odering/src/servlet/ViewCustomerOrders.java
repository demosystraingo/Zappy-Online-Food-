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

import bean.OrderBean;
import dao.MyDao;

/**
 * Servlet implementation class ViewCustomerOrders
 */
@WebServlet("/ViewCustomerOrders")
public class ViewCustomerOrders extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewCustomerOrders() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String orderid=request.getParameter("oid");
		HttpSession hs = request.getSession();
		String user = (String)hs.getAttribute("uid");
		ArrayList<OrderBean> al = new MyDao().viewCustomerOrder(user, orderid);
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
		if(al!=null) {
			RequestDispatcher rd = request.getRequestDispatcher("individualorders.jsp"); 
			request.setAttribute("data", al);
			request.setAttribute("count", cnt);
			rd.forward(request, response);
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
