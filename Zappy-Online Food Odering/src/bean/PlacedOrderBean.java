package bean;

public class PlacedOrderBean {

	String oid;
	String status;
	String date;
	String address;
	String amount;

	public PlacedOrderBean() {

	}

	public PlacedOrderBean(String oid, String status, String date, String address, String amount) {
		this.oid = oid;
		this.status = status;
		this.date = date;
		this.address = address;
		this.amount = amount;
	}

	public String getOid() {
		return oid;
	}

	public String getStatus() {
		return status;
	}

	public String getDate() {
		return date;
	}

	public String getAddress() {
		return address;
	}

	public String getAmount() {
		return amount;
	}

	
	
}
