<%@page import="bean.EmpBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Employee</title>
</head>
<body>
	<center>
		<h1>View All Employee</h1>
		<a href="logout">Logout</a>
		<hr />
		<a href="createEmp">create Employee Account</a><br />
		<br />
		<br />
		<br />
		<table border="1">
			<tr>
				<th>name	</th>
				<th>email	</th>
				<th>mobile	</th>
				<th>status	</th>
				<th>joining Date	</th>
				<th>designation		</th>
				<th>employee id		</th>
				<th>manager id		</th>
				<th>support id		</th>
				<th>Activation</th>
			</tr>
			<%
				ArrayList<EmpBean> al = (ArrayList<EmpBean>) request.getAttribute("data");
				for (EmpBean b : al) {
			%>
			<tr>
				<td><%=b.getName()%></td>
				<td><%=b.getEmail()%></td>
				<td><%=b.getMobile()%></td>
				<%if(b.getAddress().equals("0")){ %>
				<td>Active</td>
				<%}else{ %>
				<td>Deactivated</td>
				<%} %>
				<td><%=b.getJoiningdate()%></td>
				<td><%=b.getDesignation()%></td>
				<%
					if (!b.getEid().equals("") && !b.getEid().equals("e")) {
				%>
				<td><%=b.getEid()%></td>
				<%
					} else {
				%>
				<td><center>-</center></td>
				<%
					}
				%>
				<%
					if (!b.getManagerid().equals("") && !b.getManagerid().equals("m")) {
				%>
				<td><%=b.getManagerid()%></td>
				<%
					} else {
				%>
				<td><center>-</center></td>
				<%
					}
				%>
				<%
					if (!b.getSupportid().equals("") && !b.getSupportid().equals("s")) {
				%>
				<td><%=b.getSupportid()%></td>
				<%
					} else {
				%>
				<td><center>-</center></td>
				<%
					}if(b.getAddress().equals("0")){
				%>
				<td><a href= "deactivate?email=<%=b.getEmail()%>">Deactivate</a></td>
				<%}else if(b.getAddress().equals("1")){ %>
				
				<td><a href= "activate?email=<%=b.getEmail()%>">Activate</a></td>
				<%} %>
			</tr>
			<%
				}
			%>
		</table>
	</center>
</body>
</html>