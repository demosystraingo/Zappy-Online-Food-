package servlet;

import java.io.IOException;

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
 * Servlet implementation class UpdateProduct
 */
@WebServlet("/UpdateProduct")
public class UpdateProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProduct() {
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
		String name=request.getParameter("pname");
		String cat=request.getParameter("category");
		String rate=request.getParameter("price");
		String weight=request.getParameter("weight");
		String disc=request.getParameter("discription");
		
		ZappyBean b = new ZappyBean(name, cat, rate, weight, disc);
		HttpSession hs = request.getSession();
		String pid =(String)hs.getAttribute("pid");
		MyDao md =new MyDao();
		int x =md.updateProduct(b, pid);
		if(x!=0) {
			RequestDispatcher rd = request.getRequestDispatcher("ViewProducts");
			request.setAttribute("msg", "Product Updated Successfully");
			rd.forward(request, response);
		}else {
			RequestDispatcher rd = request.getRequestDispatcher("Update");
			request.setAttribute("msg", "Process Failed");
			rd.forward(request, response);
		}
		
	}

}