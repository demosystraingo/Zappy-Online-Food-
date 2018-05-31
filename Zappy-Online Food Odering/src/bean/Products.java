package bean;

public class Products {
	String name;
	String category;
	String price;
	String weight;
	String discription;
	String image;

	@Override
	public String toString() {
		return "Products [name=" + name + ", category=" + category + ", price=" + price + ", weight=" + weight
				+ ", discription=" + discription + "]";
	}

	public Products() {

	}

	public Products(String name, String category, String price, String weight, String discription, String image) {

		this.name = name;
		this.category = category;
		this.price = price;
		this.weight = weight;
		this.discription = discription;
		this.image = image;
	}

	public String getName() {
		return name;
	}

	public String getPrice() {
		return price;
	}

	public String getWeight() {
		return weight;
	}

	public String getDiscription() {
		return discription;
	}

	public String getCategory() {
		return category;
	}

	public String getImage() {
		return image;
	}
}
