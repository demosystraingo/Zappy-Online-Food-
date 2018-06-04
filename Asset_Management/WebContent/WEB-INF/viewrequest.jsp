<%@page import="bean.RequestBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>request</title>
</head>
<body>
<%String msg = (String)request.getAttribute("msg"); 
if(msg!=null){
%>
<script>alert("<%=msg%>");</script>
<%}%>
<a href="userlogout">Logout</a>
	<center>
	<h1>View Pending Request</h1>
<hr />
<%ArrayList<RequestBean> al = (ArrayList<RequestBean>) request.getAttribute("data");
if(al.isEmpty()){
%><h1>No Pending Request</h1>
<%}else{ %>
<table border="1">
<tr>
					<th>request id</th>
					<th>employee id</th>
					<th>support id</th>
					<th>asset name</th>
					<th>request status</th>
					<th>request date</th>
					<th>Approval</th>
				</tr>
<%
	
	for (RequestBean b : al) {
		
%>
<tr>
<td><%=b.getRequestid()%></td>
<td><%=b.getEmployeeid()%></td>
<td><%=b.getSupportid()%></td>
<td><%=b.getAssetname()%></td>
<td>Pending</td>
<td><%=b.getRequestdate()%></td>
<td><a href="approve?requestid=<%=b.getRequestid()%>">Approve</a></td>
</tr>
<%
	}}
%>
</table>
	</center>
</body>
</html>