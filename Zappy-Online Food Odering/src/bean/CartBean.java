package bean;

//Productname,price,weight,image,quantity,user
public class CartBean {

	String cid;
	String pid;
	String productName;
	String price;
	String weight;
	String quantity;
	String user;
	String image;

	public CartBean() {

	}

	public CartBean(String productName, String price, String weight, String quantity, String user,
			String image,String pid) {
		this.image = image;
		this.pid = pid;
		this.productName = productName;
		this.price = price;
		this.weight = weight;
		this.quantity = quantity;
		this.user = user;
	}

	public String getImage() {
		return image;
	}

	public String getCid() {
		return cid;
	}

	public String getPid() {
		return pid;
	}

	public String getProductName() {
		return productName;
	}

	public String getPrice() {
		return price;
	}

	public String getWeight() {
		return weight;
	}

	public String getQuantity() {
		return quantity;
	}

	public String getUser() {
		return user;
	}
}