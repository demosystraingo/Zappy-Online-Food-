package bean;

public class OrderBean {
	String oid;
	String pid;
	String quantity;
	String user;
	String status;
	String amount;
	String date;
	String address;
	String image;
	
	
	public void setAddress(String address) {
		this.address = address;
	}


	@Override
	public String toString() {
		return "OrderBean [oid=" + oid + ", quantity=" + quantity + ", user=" + user + ", status="
				+ status + ", amount=" + amount + ", date=" + date + ", image=" + image +"pid = "+pid+ "]";
	}


	public String getImage() {
		return image;
	}


	public void setImage(String image) {
		this.image = image;
	}


	public OrderBean() {
		
	}
	
	
	public OrderBean(String oid,String status,String amount,String date,String user,String address) {
		this.oid=oid;
		this.status = status;
		this.amount = amount;
		this.date = date;
		this.user=user;
		this.address=address;
	}
	
	public OrderBean(String pid,String quantity,String amount,String date,String user) {
		this.pid=pid;
		this.quantity = quantity;
		this.amount = amount;
		this.date = date;
		this.user=user;
	}
	public OrderBean(String oid, String pid, String quantity, String user, String status, String amount, String date) {
		
		this.oid = oid;
		this.pid = pid;
		this.quantity = quantity;
		this.user = user;
		this.status = status;
		this.amount = amount;
		this.date = date;
	}


	public String getOid() {
		return oid;
	}


	public void setOid(String oid) {
		this.oid = oid;
	}


	public String getPid() {
		return pid;
	}


	public void setPid(String pid) {
		this.pid = pid;
	}


	public String getQuantity() {
		return quantity;
	}


	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}


	public String getUser() {
		return user;
	}

	public String getAddress() {
		return address;
	}
	public void setUser(String user) {
		this.user = user;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public String getAmount() {
		return amount;
	}


	public void setAmount(String amount) {
		this.amount = amount;
	}


	public String getDate() {
		return date;
	}


	public void setDate(String date) {
		this.date = date;
	}
	
	
	
}
