package bean;

public class CustomerBean {

	String name;
	String lastname;
	String mob;
	String email;
	String address;
	String password;

	public CustomerBean() {

	}

	public CustomerBean(String name, String lastname, String mob, String email, String address) {

		this.name = name;
		this.lastname = lastname;
		this.mob = mob;
		this.email = email;
		this.address = address;

	}

	public CustomerBean(String name, String lastname, String mob, String email, String address, String password) {
		this.name = name;
		this.lastname = lastname;
		this.mob = mob;
		this.email = email;
		this.address = address;
		this.password = password;

	}

	public String getPassword() {
		return password;
	}

	public String getName() {
		return name;
	}

	public String getLastname() {
		return lastname;
	}

	public String getMob() {
		return mob;
	}

	public String getEmail() {
		return email;
	}

	public String getAddress() {
		return address;
	}
}
