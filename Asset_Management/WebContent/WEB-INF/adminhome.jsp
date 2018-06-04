<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Home</title>
</head>
<body>
<%String msg=(String)request.getAttribute("msg"); 
if(msg!=null){
%>
<script>alert("<%=msg%>");</script>
<%} %>
<body>
<center>
<h1>Welcome Admin</h1>
<hr/>
<pre>
<a href= "createEmp">create Employee Account</a>

<a href= "viewEmp">View Employee Account</a>
</pre>
</center>

</body>
</html>