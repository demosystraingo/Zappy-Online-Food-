package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import bean.EmpBean;
import bean.RequestBean;
import dao.MyDao;

@Controller
public class BackController {

	@RequestMapping("/")
	public String index() {
		return "userlogin";
	}

	@RequestMapping("/adminlogin")
	public String admin() {
		return "adminlogin";
	}
	
	@RequestMapping("/userlogout")
	public String userlogout(HttpServletRequest request) {
		HttpSession hs = request.getSession();
		hs.invalidate();
		return "userlogin";
	}
	
	@RequestMapping("/viewrequest")
	public ModelAndView viewRequest(HttpServletRequest request) {
		HttpSession hs = request.getSession();
		String id = (String) hs.getAttribute("uid");
		System.out.println(id);
		ModelAndView mv = null;
		ArrayList<RequestBean> al = new MyDao().viewrequest(id);
		if (al != null) {
			mv = new ModelAndView("viewrequest");
			mv.addObject("data", al);
		}
		return mv;
	}

	@RequestMapping("/logout")
	public String adminlogin() {
		return "adminlogin";
	}

	@RequestMapping("/approve")
	public ModelAndView approveRequest(@RequestParam int requestid,HttpServletRequest request) {
		HttpSession hs = request.getSession();
		String id = (String) hs.getAttribute("uid");
		ModelAndView mv = new ModelAndView("viewrequest");
		int x = new MyDao().requestApprove(requestid);
		ArrayList<RequestBean> al = new MyDao().viewrequest(id);
		mv.addObject("msg", "request Approved");
		mv.addObject("data", al);
		return mv;
	}
	
	@RequestMapping("/user")
	public ModelAndView userLogin(@RequestParam String aid, @RequestParam String pwd, HttpServletRequest request) {
		ModelAndView mv = null;
		String des = new MyDao().userLogin(aid, pwd);
		HttpSession hs = request.getSession();
		hs.setAttribute("uid", aid);
		System.out.println(aid);
		if (des != "") {
			if (des.equals("deactivated")) {

				mv = new ModelAndView("userlogin", "msg", "Your Account Has Been Deactivated");
			}
			if (aid.startsWith("e") && des.equals("employee")) {

				mv = new ModelAndView("employeehome", "msg", "Login Success");

			} else if (aid.startsWith("m") && des.equals("manager")) {

				mv = new ModelAndView("managerhome", "msg", "Login Success");

			} else if (aid.startsWith("s") && des.equals("support")) {

				mv = new ModelAndView("supporthome", "msg", "Login Success");

			}

		} else {

			mv = new ModelAndView("userlogin", "msg", "Login Failed");

		}

		return mv;
	}

	@RequestMapping("/login")
	public ModelAndView login(@RequestParam String aid, @RequestParam String pwd) {

		int x = new MyDao().adminLogin(aid, pwd);
		if (x != 0) {
			ModelAndView mv = new ModelAndView("adminhome");
			mv.addObject("msg", "Login Success");
			return mv;
		} else {
			ModelAndView mv = new ModelAndView("adminlogin");
			mv.addObject("msg", "Login failed");
			return mv;
		}
	}

	@RequestMapping("/createEmp")
	public String createPage() {
		return "createaccount";
	}

	@RequestMapping("/deactivate")
	public ModelAndView deactivate(@RequestParam("email") String user) {
		ModelAndView mv = new ModelAndView();
		int x = new MyDao().deactivate(user);
		if (x != 0) {
			mv = new BackController().viewemp();
		}
		return mv;
	}

	@RequestMapping("/activate")
	public ModelAndView activate(@RequestParam("email") String user) {
		ModelAndView mv = new ModelAndView();
		int x = new MyDao().activate(user);
		if (x != 0) {
			mv = new BackController().viewemp();
		}
		return mv;
	}

	@RequestMapping("/createaccount")
	public ModelAndView createEmp(@ModelAttribute("EmpBean") EmpBean b) {
		ModelAndView mv = new ModelAndView("createaccount");
		int x = new MyDao().register(b);
		if (x != 0) {
			mv.addObject("msg", "Registered Sucessfully");
		} else {
			mv.addObject("msg", "Not Registered Sucessfully");
		}
		return mv;
	}

	@RequestMapping("/viewEmp")
	public ModelAndView viewemp() {
		ModelAndView mv = new ModelAndView("viewemp");
		ArrayList<EmpBean> al = new MyDao().viewEmp();
		mv.addObject("data", al);
		return mv;
	}

}
