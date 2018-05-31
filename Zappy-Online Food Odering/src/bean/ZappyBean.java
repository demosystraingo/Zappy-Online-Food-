package bean;

public class ZappyBean {

	String productName;
	String category;
	String rate;
	String weight;
	String discription;
	String pid;
	String image;

	public String getPid() {
		return pid;
	}

	public ZappyBean() {

	}

	public ZappyBean(String image) {
		this.image=image;
	}
	
	public ZappyBean(String image,String productName, String category, String rate, String weight, String discription) {

		this.productName = productName;
		this.category = category;
		this.rate = rate;
		this.weight = weight;
		this.discription = discription;
		this.image=image;
	}
	
	public ZappyBean(String productName, String category, String rate, String weight, String discription) {

		this.productName = productName;
		this.category = category;
		this.rate = rate;
		this.weight = weight;
		this.discription = discription;
	}
	
	public ZappyBean(String pid,String productName, String category, String rate, String weight, String discription,String image) {
		this.pid=pid;
		this.productName = productName;
		this.category = category;
		this.rate = rate;
		this.weight = weight;
		this.discription = discription;
		this.image=image;
	}
	
	public String getImage() {
		return image;
	}

	public String getProductName() {
		return productName;
	}

	public String getCategory() {
		return category;
	}

	public String getRate() {
		return rate;
	}

	public String getWeight() {
		return weight;
	}

	public String getDiscription() {
		return discription;
	}
}