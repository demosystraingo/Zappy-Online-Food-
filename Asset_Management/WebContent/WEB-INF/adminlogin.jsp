<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Login</title>
</head>
<body>
<%String msg=(String)request.getAttribute("msg"); 
if(msg!=null){
%>
<script>alert("<%=msg%>");</script>
<%} %>
<body>
<center>
<h1>Login To your Account</h1>
<hr/>
<pre>
<form action = "login" method = "post">
Enter your Admin-Id <input type="text" name = "aid" required/>

Enter your Password <input type="password" name = "pwd" required/>

				<input type="submit" value = "Login" />
</form>
</pre>
</center>
</body>
</html>