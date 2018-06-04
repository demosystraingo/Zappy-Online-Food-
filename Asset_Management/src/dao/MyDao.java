package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import bean.EmpBean;
import bean.RequestBean;

public class MyDao {
	public static Connection start() { // FOR ESTAIBLISH THE CONNECTION
		Connection con = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/assetmanagement", "root", "");
		} catch (Exception e) {
			System.out.println(e);
		}
		return con;
	}

	public int requestApprove(int requestid) {
		int x= 0;
		Connection con = MyDao.start();
		try {
			PreparedStatement ps = con.prepareStatement("update requesttable set status = 1 where requestid = ?");
			ps.setInt(1, requestid);
			x = ps.executeUpdate();
		}catch(Exception e)
		{
			System.out.println(e);
		}
		return x;
	}
	
	public ArrayList<RequestBean> viewrequest(String Managerid) {
		ArrayList<RequestBean> al = new ArrayList<>();
		Connection con = MyDao.start();
		try {
			PreparedStatement ps = con.prepareStatement("select * from requesttable where managerid=? and status = 0");
			ps.setString(1, Managerid);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				RequestBean b = new RequestBean();
				b.setAssetname(rs.getString("assetname"));
				b.setApprovedate(rs.getString("approveddate"));
				b.setEmployeeid(rs.getString("employeeid"));
				b.setRequestdate(rs.getString("requestdate"));
				b.setSupportid(rs.getString("supportid"));
				b.setRequestid(rs.getString("requestid"));
				System.out.println(b);
				al.add(b);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return al;
	}

	public int deactivate(String email) {
		int x = 0;
		Connection con = MyDao.start();
		try {
			PreparedStatement ps = con.prepareStatement("update users set active=1 where emailid=?");
			ps.setString(1, email);
			x = ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e);
		}
		return x;
	}

	public int activate(String email) {
		int x = 0;
		Connection con = MyDao.start();
		try {
			PreparedStatement ps = con.prepareStatement("update users set active=0 where emailid=?");
			ps.setString(1, email);
			x = ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e);
		}
		return x;
	}

	public int adminLogin(String eid, String pwd) {
		Connection con = MyDao.start();
		try {
			PreparedStatement ps = con.prepareStatement("select * from adminaccount where uid=? and password=?");
			ps.setString(1, eid);
			ps.setString(2, pwd);

			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				return 1;
			}
		} catch (SQLException e) {
			System.out.println(e);
		}
		return 0;
	}

	public String userLogin(String id, String pwd) {
		String designation = "";
		Connection con = MyDao.start();
		try {
			PreparedStatement ps = con.prepareStatement(
					"select * from users where employeeid = ? or managerid = ? or supportid = ? and password = ? ");
			ps.setString(1, id);
			ps.setString(2, id);
			ps.setString(3, id);
			ps.setString(4, pwd);

			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				String active = rs.getString("active");
				if (active.equals("0")) {
					designation = rs.getString("designation");
				} else {
					return "deactivated";
				}
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return designation;
	}

	public int register(EmpBean b) {
		Connection con = MyDao.start();
		int x = 0;
		try {
			PreparedStatement ps = con.prepareStatement("insert into users values(?,?,?,?,?,?,?,?,?,?)");
			ps.setString(5, b.getEid());
			ps.setString(1, b.getName());
			ps.setString(2, b.getEmail());
			ps.setString(8, b.getMobile());
			ps.setString(10, "0");
			ps.setString(9, b.getJoiningdate());
			ps.setString(7, b.getDesignation());
			ps.setString(3, b.getPassword());
			ps.setString(4, b.getManagerid());
			ps.setString(6, b.getSupportid());

			x = ps.executeUpdate();

		} catch (Exception e) {
			System.out.println(e);
		}
		return x;
	}

	public ArrayList<EmpBean> viewEmp() {
		ArrayList<EmpBean> al = new ArrayList<>();
		Connection con = MyDao.start();
		try {
			PreparedStatement ps = con.prepareStatement("select * from users ");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				EmpBean b = new EmpBean(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9),
						rs.getString(10));
				al.add(b);
			}
		} catch (Exception e) {

		}
		return al;
	}
}
