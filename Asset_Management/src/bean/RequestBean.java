package bean;

public class RequestBean {
String requestid;
String employeeid;
String supportid;
String assetname;
String requestdate;
String approvedate;
String status;
public String getRequestid() {
	return requestid;
}
public void setRequestid(String requestid) {
	this.requestid = requestid;
}
public String getEmployeeid() {
	return employeeid;
}
public void setEmployeeid(String employeeid) {
	this.employeeid = employeeid;
}
public String getSupportid() {
	return supportid;
}
public void setSupportid(String supportid) {
	this.supportid = supportid;
}
public String getAssetname() {
	return assetname;
}
public void setAssetname(String assetname) {
	this.assetname = assetname;
}
public String getRequestdate() {
	return requestdate;
}
public void setRequestdate(String requestdate) {
	this.requestdate = requestdate;
}
public String getApprovedate() {
	return approvedate;
}
public void setApprovedate(String approvedate) {
	this.approvedate = approvedate;
}
public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}
@Override
public String toString() {
	return "RequestBean [requestid=" + requestid + ", employeeid=" + employeeid + ", supportid=" + supportid
			+ ", assetname=" + assetname + ", requestdate=" + requestdate + ", approvedate=" + approvedate + ", status="
			+ status + "]";
}


}
