<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create Account</title>
</head>
<body>
	<%
		String msg = (String) request.getAttribute("msg");
		if (msg != null) {
	%>
	<script>alert("<%=msg%>");
	</script>
	<%
		}
	%>
	<center>
		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
		<script>
			$(document).ready(function() {
				$("#add").hide();
				$("#emp").click(function() {
					$("#eid").show();
					$("#mid").show();
					$("#sid").show();
				});
				$("#mgr").click(function() {
					$("#eid").hide();
					$("#mid").show();
					$("#sid").show();
				});
				$("#sprt").click(function() {
					$("#eid").hide();
					$("#mid").hide();
					$("#sid").show();
				});
			});
		</script>
		<h1>Create Employee Account</h1>
		
		<hr />
		<a href="viewEmp">View Employee Account</a>
		<pre>
<form action="createaccount" method="post">

Name	<input type="text" name="name" placeholder="Full Name" required=" ">

email	<input type="email" name="email" placeholder="Email Address"
					required=" " pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$">

Mobile	<input type="text" name="mobile" placeholder="Phone Number"
					required=" " pattern="[789][0-9]{9}" maxlength="10">

<textarea name="address" placeholder="Address" id="add"></textarea>

joining date	<input type="date" name="joiningdate"
					placeholder="Joining Date" required=" ">

Designation	<select name="designation">
<option>---Designation----</option>
<option value="employee" id="emp">employee</option>
<option value="manager" id="mgr">manager</option>
<option value="support" id="sprt">Support</option>
</select>
	
<div id="eid">Employee id	e-<input type="text" name="eid">
				</div>

<div id="mid">manager id	m-<input type="text" name="managerid">
				</div>

<div id="sid">support id	s-<input type="text" name="supportid">
				</div>

password	<input type="password" name="password" id="pass"
					placeholder="Password" required=" ">

<input type="submit" value="Register">
</form>
</pre>
	</center>

</body>