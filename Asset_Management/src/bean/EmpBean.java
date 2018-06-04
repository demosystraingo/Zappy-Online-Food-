package bean;
/*eid,name,mobile,email,address,joiningdate,
designation(employee/manager/Support) , password,manager id,Support id.
*/
public class EmpBean {
String eid;
String name;
String mobile;
String email;
String address;
String joiningdate; 
String designation;
String password;
String managerid;
String supportid;


public EmpBean() {
	
}
		

public EmpBean(String name, String email, String password, String managerid, String eid ,String supportid, String designation,
		String mobile, String joiningdate, String active) {
	super();
	this.eid = eid;
	this.name = name;
	this.mobile = mobile;
	this.email = email;
	this.address = active;
	this.joiningdate = joiningdate;
	this.designation = designation;
	this.password = password;
	this.managerid = managerid;
	this.supportid = supportid;
}
public String getEid() {
	return eid;
}
public void setEid(String eid) {
	this.eid = "e"+eid;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getMobile() {
	return mobile;
}
public void setMobile(String mobile) {
	this.mobile = mobile;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getAddress() {
	return address;
}
public void setAddress(String address) {
	this.address = address;
}
public String getJoiningdate() {
	return joiningdate;
}
public void setJoiningdate(String joiningdate) {
	this.joiningdate = joiningdate;
}
public String getDesignation() {
	return designation;
}
public void setDesignation(String designation) {
	this.designation = designation;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
public String getManagerid() {
	return managerid;
}
public void setManagerid(String managerid) {
	this.managerid = "m"+managerid;
}
public String getSupportid() {
	return supportid;
}
public void setSupportid(String supportid) {
	this.supportid = "s"+supportid;
}

}
