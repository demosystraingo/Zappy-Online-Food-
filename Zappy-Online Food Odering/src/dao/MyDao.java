package dao;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Scanner;

import bean.CartBean;
import bean.CustomerBean;
import bean.OrderBean;
import bean.PlacedOrderBean;
import bean.Products;
import bean.ZappyBean;

public class MyDao {

	public static Connection start() { // FOR ESTAIBLISH THE CONNECTION
		Connection con = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/zappy", "root", "");
		} catch (Exception e) {
			System.out.println(e);
		}
		return con;
	}

	public ArrayList<ZappyBean> category(String category) {
		ArrayList<ZappyBean> al = new ArrayList<>();
		Connection con = MyDao.start();
		try {
			PreparedStatement ps = con.prepareStatement("select * from zappyproducts where category = ?");
			ps.setString(1, category);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ZappyBean b = new ZappyBean(rs.getString("product_id"), rs.getString("Productname"),
						rs.getString("category"), rs.getString("price"), rs.getString("weight"),
						rs.getString("discription"), rs.getString("image"));
				al.add(b);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return al;
	}

	public ArrayList<OrderBean> orderhistory(String user) {
		ArrayList<OrderBean> al = new ArrayList<>();

		Connection con = MyDao.start();
		try {
			PreparedStatement ps = con.prepareStatement(
					"select orderid,quantity,status,amount,date,image,pid from zappyorder INNER JOIN zappyproducts ON zappyorder.pid=zappyproducts.product_id where user=? and status NOT IN (0)");
			ps.setString(1, user);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				OrderBean b = new OrderBean();
				b.setOid(rs.getString(1));
				b.setQuantity(rs.getString(2));
				b.setStatus(rs.getString(3));
				b.setAmount(rs.getString(4));
				b.setDate(rs.getString(5));
				b.setImage(rs.getString(6));
				b.setPid(rs.getString(7));
				al.add(b);
				System.out.println(b);
			}
			return al;
		} catch (Exception e) {
			System.out.println(e);
		}
		return al;
	}

	public int updateAdmin(String email, String password) {
		int x = 0;
		Connection con = MyDao.start();
		try {
			PreparedStatement ps = con.prepareStatement("update zappyadmin set password=? where email=?");
			ps.setString(1, password);
			ps.setString(2, email);
			x = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
		return x;
	}

	public ArrayList<OrderBean> viewAllOrders() {
		ArrayList<OrderBean> al = new ArrayList<>();
		Connection con = MyDao.start();
		try {
			PreparedStatement ps = con.prepareStatement("select * from zappyorder where status NOT IN(0)");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				OrderBean b = new OrderBean(rs.getString("orderid"), rs.getString("pid"), rs.getString("quantity"),
						rs.getString("user"), rs.getString("status"), rs.getString("amount"), rs.getString("date"));
				al.add(b);
			}
		} catch (Exception e) {
			System.out.println(e);
		}

		return al;
	}

	public int pendingStatus(String user, String orderid) {
		Connection con = MyDao.start();
		int x = 0;
		try {
			PreparedStatement ps = con.prepareStatement("select status from zappyorder where orderid=? and user=?");
			ps.setString(1, orderid);
			ps.setString(2, user);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				if (!rs.getString(1).equals("0")) {
					PreparedStatement ps1 = con
							.prepareStatement("update zappyplacedorder set status = 1 where user = ? and orderid=?");
					ps1.setString(1, user);
					ps1.setString(2, orderid);
					x = ps1.executeUpdate();
				} else {
					PreparedStatement ps1 = con
							.prepareStatement("update zappyplacedorder set status = 0 where user = ? and orderid=?");
					ps1.setString(1, user);
					ps1.setString(2, orderid);
					x = ps1.executeUpdate();
				}
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return x;
	}

	public int notAvailable(String user, String pid, String orderid) {
		int x = 0;
		Connection con = MyDao.start();
		try {
			PreparedStatement ps = con.prepareStatement("update zappyorder set status=? where user=? and pid=?");
			ps.setString(1, "3");
			ps.setString(2, user);
			ps.setString(3, pid);
			x = ps.executeUpdate();
			if (x != 0) {
				x = new MyDao().pendingStatus(user, orderid);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return x;
	}

	public int dispatch(String user, String pid, String orderid) {
		int x = 0;
		Connection con = MyDao.start();
		try {
			PreparedStatement ps = con.prepareStatement("update zappyorder set status=? where user=? and pid=?");
			ps.setString(1, "1");
			ps.setString(2, user);
			ps.setString(3, pid);
			x = ps.executeUpdate();
			if (x != 0) {
				x = new MyDao().pendingStatus(user, orderid);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return x;
	}

	public int insertQuantity(String user, String pid, String quantity) {
		int x = 0;
		Connection con = MyDao.start();
		try {
			PreparedStatement ps = con.prepareStatement("update zappycart set quantity = ? where pid = ? and user=?");
			ps.setString(1, quantity);
			ps.setString(2, pid);
			ps.setString(3, user);

			x = ps.executeUpdate();
			if (x != 0) {
				return x;
			}
		} catch (Exception e) {
			System.out.println(e);
		}

		return x;
	}

	public String checkAdminPassword(String user, String password) {
		Connection con = MyDao.start();
		String msg = null;
		try {
			PreparedStatement ps = con.prepareStatement("select * from zappyadmin where email=? and password=?");
			ps.setString(1, user);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				msg = "<font color=green>Valid Password</font>";
			} else {
				msg = "<font color=red>Invalid Password</font>";
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return msg;
	}

	public String checkPassword(String user, String password) {
		Connection con = MyDao.start();
		String msg = null;
		try {
			PreparedStatement ps = con.prepareStatement("select * from zappyaccount where email=? and password=?");
			ps.setString(1, user);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				msg = "<font color=green>Valid Password</font>";
			} else {
				msg = "<font color=red>Invalid Password</font>";
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return msg;
	}

	public String forgetPassword(String user) {
		Connection con = MyDao.start();
		try {
			PreparedStatement ps = con.prepareStatement("select password from zappyaccount where email=?");
			ps.setString(1, user);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				String pass = rs.getString("password");
				return pass;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;

	}

	public String AdminPassword(String user) {
		Connection con = MyDao.start();
		try {
			PreparedStatement ps = con.prepareStatement("select password from zappyadmin where user=?");
			ps.setString(1, user);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				String pass = rs.getString("password");
				return pass;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;

	}

	public int cart(String pid, String quantity, String user) {

		Connection con = MyDao.start();
		int x = 0;
		try {
			PreparedStatement ps = con.prepareStatement("insert into zappycart(pid,quantity,user) values(?,?,?)");
			ps.setString(1, pid);
			ps.setString(2, quantity);
			ps.setString(3, user);

			x = ps.executeUpdate();

		} catch (SQLException e) {
			System.out.println(e);
		}

		return x;
	}

	public int userCartupdate(String eid) {
		Connection con = MyDao.start();
		MyDao md = new MyDao();
		String ip = md.ip();
		System.out.println("My ip Is " + ip);
		try {
			PreparedStatement ps1 = con.prepareStatement("UPDATE zappycart SET USER = ? WHERE USER =?");
			ps1.setString(1, eid);
			ps1.setString(2, ip);
			System.out.println("my email id is " + eid);
			int x = ps1.executeUpdate();
			System.out.println("the god is " + x);
			if (x != 0) {
				return x;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return 0;
	}

	public String Customerlogin(String eid, String pwd) {

		Connection con = MyDao.start();
		try {
			PreparedStatement ps = con.prepareStatement("select * from zappyaccount where email=? and password=?");
			ps.setString(1, eid);
			ps.setString(2, pwd);

			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				int x = new MyDao().userCartupdate(eid);

				String name = rs.getString("name");
				System.out.println(name + " is my name");
				return name;

			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	public String adminLogin(String eid, String pwd) {
		Connection con = MyDao.start();
		try {
			PreparedStatement ps = con.prepareStatement("select * from zappyadmin where email=? and password=?");
			ps.setString(1, eid);
			ps.setString(2, pwd);

			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				String name = rs.getString(1);
				return name;
			}
		} catch (SQLException e) {
			System.out.println(e);
		}
		return null;
	}

	public String ip() {
		InetAddress ipAddr = null;
		try {
			ipAddr = InetAddress.getLocalHost();
			System.out.println(ipAddr.getHostAddress());
		} catch (UnknownHostException ex) {
			ex.printStackTrace();
		}
		String ip = ipAddr.toString();
		return ip;
	}

	public int customerRegister(CustomerBean b) {

		Connection con = MyDao.start();
		int x = 0;
		try {
			PreparedStatement ps = con.prepareStatement("insert into zappyaccount values(?,?,?,?,?,?)");
			ps.setString(1, b.getName());
			ps.setString(2, b.getLastname());
			ps.setString(3, b.getMob());
			ps.setString(4, b.getAddress());
			ps.setString(5, b.getEmail());
			ps.setString(6, b.getPassword());

			x = ps.executeUpdate();
			if (x != 0) {
				return x;
			}
		} catch (SQLException e) {
			System.out.println(e);
		}

		return x;
	}

	public int customerUpdate(CustomerBean b, String user, String password) {
		Connection con = MyDao.start();
		int x = 0;
		try {
			PreparedStatement ps = con.prepareStatement(
					"update zappyaccount set name=?,lastname=?,mobile=?,address=?,email=?,password=? where email=? and password=?");
			PreparedStatement ps1 = con.prepareStatement("update zappycart set user=? where user=?");
			PreparedStatement ps2 = con.prepareStatement("update zappyorder set user=? where user=?");
			PreparedStatement ps3 = con.prepareStatement("update zappyplacedorder set user=? where user=?");
			ps.setString(1, b.getName());
			ps.setString(2, b.getLastname());
			ps.setString(3, b.getMob());
			ps.setString(4, b.getAddress());
			ps.setString(5, b.getEmail());
			ps.setString(6, b.getPassword());
			ps.setString(7, user);
			ps.setString(8, password);
			ps1.setString(1, b.getEmail());
			ps1.setString(2, user);
			ps2.setString(1, b.getEmail());
			ps2.setString(2, user);
			ps3.setString(1, b.getEmail());
			ps3.setString(2, user);
			con.setAutoCommit(false);
			x = ps.executeUpdate();
			int y = ps1.executeUpdate();
			int z = ps2.executeUpdate();
			int i = ps3.executeUpdate();
			con.commit();
			if (x != 0 && y != 0 && z != 0 && i != 0) {
				return x;
			}
		} catch (SQLException e) {
			System.out.println(e);
		}

		return x;
	}

	public ArrayList<OrderBean> adminPendingOrder() {
		ArrayList<OrderBean> al = new ArrayList<>();

		Connection con = MyDao.start();
		try {
			PreparedStatement ps = con
					.prepareStatement("select * from zappyplacedorder where status = 0 or status = 4");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				OrderBean b = new OrderBean();
				b.setOid(rs.getString("orderid"));
				b.setUser(rs.getString("user"));
				b.setStatus(rs.getString("status"));
				b.setAddress(rs.getString("shipmentaddress"));
				b.setAmount(rs.getString("amount"));
				b.setDate(rs.getString("date"));
				al.add(b);
				System.out.println(b);
			}
			return al;
		} catch (Exception e) {
			System.out.println(e);
		}
		return al;
	}

	public ArrayList<OrderBean> myOrder(String user) {
		ArrayList<OrderBean> al = new ArrayList<>();

		Connection con = MyDao.start();
		try {
			PreparedStatement ps = con.prepareStatement("select * from zappyplacedorder where user =? and status=0");
			ps.setString(1, user);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				OrderBean b = new OrderBean(rs.getString("orderid"), rs.getString("status"), rs.getString("amount"),
						rs.getString("date"), rs.getString("user"), rs.getString("shipmentaddress"));
				al.add(b);
			}
			return al;
		} catch (Exception e) {
			System.out.println(e);
		}
		return al;
	}

	public int updateAddress(CustomerBean b) {
		Connection con = MyDao.start();
		int x = 0;
		try {
			PreparedStatement ps = con
					.prepareStatement("update zappyaccount set name=?,lastname=?,mobile=?,address=? where email=?");
			ps.setString(1, b.getName());
			ps.setString(2, b.getLastname());
			ps.setString(3, b.getMob());
			ps.setString(4, b.getAddress());
			ps.setString(5, b.getEmail());
			x = ps.executeUpdate();
			if (x != 0) {
				return x;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return 0;
	}

	public int Login(String eid, String pwd) {
		Connection con = MyDao.start();
		try {
			PreparedStatement ps = con.prepareStatement("select * from zappyaccount where email=? and password=?");
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

	public int delete(String pid) {
		int x = 0;
		Connection con = MyDao.start();
		try {
			PreparedStatement ps = con.prepareStatement("DELETE from zappyproducts where product_id =?");
			ps.setString(1, pid);

			x = ps.executeUpdate();
			if (x == 1) {
				return x;
			}

		} catch (Exception e) {
			System.out.println(e);
		}
		return x;
	}

	public int register(ZappyBean b) {

		Connection con = MyDao.start();
		int x = 0;
		try {
			PreparedStatement ps = con.prepareStatement(
					"insert into zappyproducts(productname,category,price,weight,discription,image) values(?,?,?,?,?,?)");
			ps.setString(1, b.getProductName());
			ps.setString(2, b.getCategory());
			ps.setString(3, b.getRate());
			ps.setString(4, b.getWeight());
			ps.setString(5, b.getDiscription());
			ps.setString(6, b.getImage());
			x = ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e);
		}

		return x;
	}

	public int updateImage(ZappyBean b, String pid) {
		Connection con = MyDao.start();
		int x = 0;
		try {
			PreparedStatement ps = con.prepareStatement("update zappyproducts set image=? where product_id=?");
			ps.setString(1, b.getImage());
			ps.setString(2, pid);
			x = ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e);
		}

		return x;
	}

	public int updateProduct(ZappyBean b, String pid) {
		Connection con = MyDao.start();
		int x = 0;
		try {
			PreparedStatement ps = con.prepareStatement(
					"update zappyproducts set productname=?,category=?,price=?,weight=?,discription=? where product_id=?");
			ps.setString(1, b.getProductName());
			ps.setString(2, b.getCategory());
			ps.setString(3, b.getRate());
			ps.setString(4, b.getWeight());
			ps.setString(5, b.getDiscription());
			ps.setString(6, pid);
			x = ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e);
		}
		return x;
	}

	public ArrayList<CustomerBean> viewCustomers() {
		ArrayList<CustomerBean> al = new ArrayList<>();
		Connection con = MyDao.start();
		try {
			PreparedStatement ps = con.prepareStatement("select * from zappyaccount");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				CustomerBean b = new CustomerBean(rs.getString("name"), rs.getString("lastname"),
						rs.getString("mobile"), rs.getString("address"), rs.getString("email"));
				al.add(b);
			}
		} catch (SQLException e) {
			System.out.println(e);
		}
		return al;

	}

	public ArrayList<ZappyBean> viewProduct() {
		ArrayList<ZappyBean> al = new ArrayList<>();
		Connection con = MyDao.start();
		try {
			PreparedStatement ps = con.prepareStatement("select * from zappyproducts");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ZappyBean b = new ZappyBean(rs.getString("product_id"), rs.getString("Productname"),
						rs.getString("category"), rs.getString("price"), rs.getString("weight"),
						rs.getString("discription"), rs.getString("image"));
				al.add(b);
			}
		} catch (SQLException e) {
			System.out.println(e);
		}
		return al;
	}

	public ArrayList<OrderBean> viewPendingOrder(String user, String orderid) {
		ArrayList<OrderBean> al = new ArrayList<>();
		Connection con = MyDao.start();
		try {
			PreparedStatement ps = con.prepareStatement(
					"select orderid,pid,quantity,user,status,amount,date,image from zappyorder INNER JOIN zappyproducts ON product_id=pid where status=? and orderid=? and user=?");
			ps.setString(1, "0");
			ps.setString(3, user);
			ps.setString(2, orderid);
			System.out.println(orderid + "My oid");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				OrderBean b = new OrderBean(rs.getString("orderid"), rs.getString("pid"), rs.getString("quantity"),
						rs.getString("user"), rs.getString("status"), rs.getString("amount"), rs.getString("date"));
				b.setImage(rs.getString("image"));
				al.add(b);
				System.out.println("Zappy Order");
				System.out.println(b);
			}
			System.out.println("my skjocnj" + al);
		} catch (SQLException e) {
			System.out.println(e);
		}
		return al;
	}

	public ArrayList<OrderBean> viewCustomerOrder(String user, String orderid) {
		ArrayList<OrderBean> al = new ArrayList<>();
		Connection con = MyDao.start();
		try {
			PreparedStatement ps = con.prepareStatement(
					"select orderid,quantity,status,amount,date,image,pid from zappyorder INNER JOIN zappyproducts ON zappyorder.pid=zappyproducts.product_id where user=? and orderid=?");
			ps.setString(1, user);
			ps.setString(2, orderid);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				OrderBean b = new OrderBean();
				b.setOid(rs.getString(1));
				b.setQuantity(rs.getString(2));
				b.setStatus(rs.getString(3));
				b.setAmount(rs.getString(4));
				b.setDate(rs.getString(5));
				b.setImage(rs.getString(6));
				b.setPid(rs.getString(7));
				al.add(b);
			}
			for (OrderBean b : al) {
				System.out.println(b);
			}
		} catch (SQLException e) {
			System.out.println(e);
		}
		return al;
	}

	public int order(String user, String amount) {

		Connection con = MyDao.start();
		System.out.println("Sdvxcbv" + amount);
		int x = 0;
		int y = 0;
		long oid = System.currentTimeMillis();
		String od = oid + " ";
		String orderid = "OD-I" + od.substring(9);
		String address = null;
		int gtotal = 0;
		try {
			PreparedStatement ps = con.prepareStatement(
					"select quantity,pid,price,address from zappycart INNER JOIN zappyproducts ON zappycart.pid=zappyproducts.product_id INNER JOIN zappyaccount ON zappyaccount.email=zappycart.user where user = ? ");
			ps.setString(1, user);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				String quantity = rs.getString(1);
				String pid = rs.getString(2);
				String price = rs.getString(3);
				address = rs.getString(4);
				int unit = Integer.parseInt(quantity);
				int rate = Integer.parseInt(price);
				int total = unit * rate;
				gtotal = gtotal + total;
				PreparedStatement ps1 = con
						.prepareStatement("insert into zappyorder(orderid,pid,quantity,user,amount) value(?,?,?,?,?)");
				ps1.setString(1, orderid);
				ps1.setString(2, pid);
				ps1.setString(3, quantity);
				ps1.setString(4, user);
				ps1.setInt(5, total);

				PreparedStatement ps2 = con.prepareStatement("delete from zappycart where pid=? and user=?");
				ps2.setString(1, pid);
				ps2.setString(2, user);
				con.setAutoCommit(false);
				y = ps2.executeUpdate();
				x = ps1.executeUpdate();
				con.commit();
			}
			con.setAutoCommit(true);
			PreparedStatement ps3 = con.prepareStatement(
					"insert into zappyplacedorder(orderid,user,shipmentaddress,amount) value(?,?,?,?)");
			ps3.setString(1, orderid);
			ps3.setString(2, user);
			ps3.setString(3, address);
			ps3.setInt(4, gtotal);
			System.out.println(orderid + " " + user + " " + address + " " + gtotal);
			int z = ps3.executeUpdate();
			if (x != 0 && y != 0 && z != 0) {
				System.out.println(z + " aaja aaja aaja");
				return x;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return 0;
	}

	public ArrayList<PlacedOrderBean> placedorder(String email) {
		ArrayList<PlacedOrderBean> al = new ArrayList<>();
		Connection con = MyDao.start();
		try {
			PreparedStatement ps = con.prepareStatement(
					"SELECT zappyplacedorder.orderid,zappyplacedorder.status,shipmentaddress,zappyplacedorder.amount,zappyplacedorder.date FROM zappyplacedorder INNER JOIN zappyorder ON zappyplacedorder.orderid=zappyorder.orderid WHERE zappyorder.user = ?");
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			PlacedOrderBean p = null;
			while (rs.next()) {
				p = new PlacedOrderBean(rs.getString(1), rs.getString(2), rs.getString(5), rs.getString(3),
						rs.getString(4));
			}
			al.add(p);
		} catch (Exception e) {
			System.out.println(e);
		}
		return al;
	}

	public ArrayList<ZappyBean> viewSingle(String pid) {
		ArrayList<ZappyBean> al = new ArrayList<>();
		Connection con = MyDao.start();
		try {
			PreparedStatement ps = con.prepareStatement("select * from zappyproducts where product_id=?");
			ps.setString(1, pid);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				ZappyBean b = new ZappyBean(rs.getString("product_id"), rs.getString("Productname"),
						rs.getString("category"), rs.getString("price"), rs.getString("weight"),
						rs.getString("discription"), rs.getString("image"));
				al.add(b);
			}
		} catch (SQLException e) {
			System.out.println(e);
		}
		return al;
	}

	public CustomerBean updateProfile(String user) {
		Connection con = MyDao.start();
		CustomerBean b = null;
		try {
			PreparedStatement ps = con.prepareStatement("select * from zappyaccount where email = ?");
			ps.setString(1, user);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				b = new CustomerBean(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(5),
						rs.getString(4), rs.getString(6));
				System.out.println(b);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return b;
	}

	public OrderBean updateStatusShow(String user, String pid) {
		OrderBean p = null;
		Connection con = MyDao.start();

		try {
			PreparedStatement ps = con.prepareStatement("select * from zappyorder where pid=? and user =?");
			ps.setString(1, pid);
			ps.setString(2, user);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				String productid = rs.getString("pid");
				String quantity = rs.getString("quantity");
				String amount = rs.getString("amount");
				String date = rs.getTimestamp("date").toString();
				String eid = rs.getString("user");
				p = new OrderBean(productid, quantity, amount, date, eid);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return p;
	}

	public int updateStatus(String pid, String user, String status) {
		Connection con = MyDao.start();
		int x = 0;
		try {
			PreparedStatement ps = con.prepareStatement("update zappyorder set status=? where pid=? and user =?");
			ps.setString(1, status);
			ps.setString(2, pid);
			ps.setString(3, user);
			x = ps.executeUpdate();
			if (x != 0) {
				return x;
			}
		} catch (Exception e) {

		}
		return x;
	}

	public Products update(String pid) {

		Products p = null;
		Connection con = MyDao.start();
		try {
			PreparedStatement ps = con.prepareStatement("select * from zappyproducts where product_id=?");
			ps.setString(1, pid);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				String name = rs.getString(2);
				String category = rs.getString(3);
				String price = rs.getString(4);
				String weight = rs.getString(5);
				String discription = rs.getString(6);
				String image = rs.getString(7);

				p = new Products(name, category, price, weight, discription, image);

			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return p;
	}

	public int addToCart(String pid, String quantity, String user) {
		Connection con = MyDao.start();
		int x = 0;
		try {
			PreparedStatement ps = con.prepareStatement("select * from zappycart where user=?");
			ps.setString(1, user);
			ResultSet rs = ps.executeQuery();

			int p = 0;
			while (rs.next()) {
				if (rs.getString("pid").equals(pid)) {
					p = Integer.parseInt(rs.getString("quantity"));
					int quant = Integer.parseInt(quantity);
					p = p + quant;
				}
			}
			if (p != 0) {
				PreparedStatement ps1 = con
						.prepareStatement("update zappycart set quantity = ? where user =? and pid=?");
				ps1.setString(2, user);
				ps1.setInt(1, p);
				ps1.setString(3, pid);
				ps1.executeUpdate();
				x++;
				return x;
			} else {
				PreparedStatement ps1 = con.prepareStatement("insert into zappycart(pid,quantity,user) values(?,?,?)");
				ps1.setString(3, user);
				ps1.setString(2, quantity);
				ps1.setString(1, pid);
				ps1.executeUpdate();
				x++;
				return x;
			}
		} catch (Exception e) {
			System.out.println(e);
		}

		return x;

	}

	public ArrayList<CartBean> checkCart(String user) {
		ArrayList<CartBean> al = new ArrayList<>();
		Connection con = MyDao.start();
		int x = 0;
		try {
			PreparedStatement ps = con.prepareStatement(
					"select Productname,price,weight,quantity,user,image,pid from zappyproducts INNER JOIN zappycart ON zappyproducts.product_id=zappycart.pid where zappycart.user=?");
			ps.setString(1, user);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				CartBean b = new CartBean(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getString(5), rs.getString(6), rs.getString(7));
				al.add(b);
			}
		} catch (Exception e) {

		}
		return al;
	}

	public int count(String user) {

		Connection con = MyDao.start();
		try {
			PreparedStatement ps = con.prepareStatement("select COUNT(user) FROM zappycart where user=?");
			ps.setString(1, user);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				int x = rs.getInt(1);
				return x;
			}

		} catch (SQLException e) {
			System.out.println(e);
		}

		return 0;
	}

	public int remove(String pid, String user) {
		Connection con = MyDao.start();
		int x = 0;
		try {
			PreparedStatement ps = con.prepareStatement("delete from zappycart where pid=? and user=?");
			ps.setString(1, pid);
			ps.setString(2, user);

			x = ps.executeUpdate();
			if (x != 0) {
				return x;
			}

		} catch (Exception e) {

		}
		return x;
	}

	public int userProfile(CustomerBean b, String email) {
		Connection con = MyDao.start();
		int x = 0;
		try {
			PreparedStatement ps = con.prepareStatement(
					"update zappyaccount set name=?,lastname=?,mobile=?,address=?,email=? where email=?");
			PreparedStatement ps1 = con.prepareStatement("update zappycart set user=? where user=?");
			PreparedStatement ps2 = con.prepareStatement("update zappyorder set user=? where user=?");
			PreparedStatement ps3 = con.prepareStatement("update zappyplacedorder set user=? where user=?");
			ps.setString(1, b.getName());
			ps.setString(2, b.getLastname());
			ps.setString(3, b.getMob());
			ps.setString(4, b.getAddress());
			ps.setString(5, b.getEmail());
			ps.setString(6, email);
			ps1.setString(1, b.getEmail());
			ps1.setString(2, email);
			ps2.setString(1, b.getEmail());
			ps2.setString(2, email);
			ps3.setString(1, b.getEmail());
			ps3.setString(2, email);
			con.setAutoCommit(false);
			x = ps.executeUpdate();
			int y = ps1.executeUpdate();
			int z = ps2.executeUpdate();
			int i = ps3.executeUpdate();
			con.commit();
			if (x != 0 && y != 0 && z != 0 && i != 0) {
				return x;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return x;
	}

	public static void main(String[] args) {
		ArrayList<OrderBean> al = new ArrayList<>();
		Connection con = MyDao.start();
		try {
			PreparedStatement ps = con.prepareStatement(
					"select orderid,quantity,status,amount,date,image from zappyorder INNER JOIN zappyproducts ON zappyorder.pid=zappyproducts.product_id where user=? and orderid=?");
			ps.setString(1, "prafuljaora@gmail.com");
			ps.setString(2, "OD-I7254");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				OrderBean b = new OrderBean();
				b.setOid(rs.getString(1));
				b.setQuantity(rs.getString(2));
				b.setStatus(rs.getString(3));
				b.setAmount(rs.getString(4));
				b.setDate(rs.getString(5));
				b.setImage(rs.getString(6));
				al.add(b);
			}
			System.out.println(al);
		} catch (SQLException e) {
			System.out.println(e);
		}
	}
}