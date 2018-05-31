<!--
author: W3layouts
author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<%@page import="bean.CustomerBean"%>
<html>
<head>
<style> 
input[type=button] {
    background-color: #4CAF50;
    border: none;
    color: white;
    padding: 16px 32px;
    text-decoration: none;
    margin: 4px 2px;
    cursor: pointer;
}
</style>
<%String count1=(String)request.getAttribute("count"); 
	if(count1==null){
		response.sendRedirect("Index");
	}
	%>
<title>Grocery Store a Ecommerce Online Shopping Category Flat Bootstrap Responsive Website Template | Sign In & Sign Up :: w3layouts</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Grocery Store Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- font-awesome icons -->
<link href="css/font-awesome.css" rel="stylesheet" type="text/css" media="all" /> 
<!-- //font-awesome icons -->
<!-- js -->
<script src="js/jquery-1.11.1.min.js"></script>
<!-- //js -->
<link href='//fonts.googleapis.com/css?family=Ubuntu:400,300,300italic,400italic,500,500italic,700,700italic' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
<!-- start-smoth-scrolling -->
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event){		
			event.preventDefault();
			$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
		});
	});
</script>
<!-- start-smoth-scrolling -->
</head>
<script>
function show(){
	var pass = document.getElementById("pass").value;
	var cpass = document.getElementById("cpass").value;
	
	if(pass!=cpass){
		alert("password And Confirm Password Do not Match")
		document.getElementById("pass").value="";
		document.getElementById("cpass").value="";
	}
}
function call(){
	var pass = document.getElementById("pass");
	var cpass = document.getElementById("cpass");
	if(pass.type=="password"&&cpass.type=="password"){
		pass.type="text";
		cpass.type="text";
	}else{
		pass.type="password";
		cpass.type="password"
	}
}
</script>
	<%String msg=(String)request.getAttribute("msg"); 
if(msg!=null){
%>
<script>alert("<%=msg%>");</script>
<%} %>
<body>
<!-- header -->
	<div class="agileits_header">
		<div class="w3l_offers">
		<%String name=(String)session.getAttribute("name"); 
		if(name!=null){ %>
			<a href="OrderHistory">Order History</a>
			<%}%>
		</div>
		<div class="w3l_search">
			<form action="SearchByCategory" method="post">
				<input type="text" name="category" value="Search by Category..."
					onFocus="this.value = '';"
					onBlur="if (this.value == '') {this.value = 'Search by Category...';}"
					required=""> <input type="submit" value=" ">
			</form>
		</div>
		<div class="product_list_header">  
			<form action="CheckOut" method="post" class="last">
                <fieldset>
                    <input type="hidden" name="cmd" value="_cart" />
                    <input type="hidden" name="display" value="1" />
                    <input type="submit" name="submit" value="Cart <%=count1%> item(s)" class="button" />
                </fieldset>
            </form>
		</div>
		<div class="w3l_header_right">
			<ul>
				<li class="dropdown profile_details_drop">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user" aria-hidden="true"></i><span class="caret"></span></a>
					<div class="mega-dropdown-menu">
						<div class="w3ls_vegetables">
							<ul class="dropdown-menu drp-mnu">
							<%
							if(name==null){%>
								<li><a href="login.jsp?pagename=indexnew.jsp">Login</a></li> 
								<li><a href="login.jsp?pagename=indexnew.jsp">Sign Up</a></li>
								<%}else{%>
									<li>Welcome <%=name %></li> 
									<li><a href="CustomerLogout">Logout</a></li>
									<li>My Profile</li>
								<%} %>
							</ul>
						</div>                  
					</div>	
				</li>
			</ul>
		</div>
		<%if (name != null) {
								%>
		<div class="product_list_header">
			<form action="MyOrder" method="post" class="last">
				<fieldset>
					<input type="hidden" name="cmd" value="_cart" /> <input
						type="hidden" name="display" value="1" /> <input type="hidden"
						name="pagename" value="CheckOut" /> <input type="submit"
						name="submit" value="My Orders" class="button" style="width: 100px"/>
				</fieldset>
			</form>
		</div><%} %>
		<!-- <div class="w3l_header_right1">
			<h2><a href="mail.html">Contact Us</a></h2>
		</div> -->
		<div class="clearfix"> </div>
	</div>
<!-- script-for sticky-nav -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {

	$("#opass").blur(function() {

		var pass = $("#opass").val();
		//alert(email);
		var data = "id=" + pass;
		$.ajax({
			url : 'CheckPassword',
			data : data,
			type : 'post',
			success : function(response) {
				//	alert(response);
				
				if(response.trim()==="<font color=red>Invalid Password</font>"){
					$("#opass").val("");
					$("#confirm").html(response);
				}else{
					$("#confirm").html(response);
				}
			}
		});

	});
});
</script>

</script>
	<script>
	$(document).ready(function() {
		 var navoffeset=$(".agileits_header").offset().top;
		 $(window).scroll(function(){
			var scrollpos=$(window).scrollTop(); 
			if(scrollpos >=navoffeset){
				$(".agileits_header").addClass("fixed");
			}else{
				$(".agileits_header").removeClass("fixed");
			}
		 });
		 
	});
	</script>
	<script>
	$(document).ready(function() {

		$("#opass").hide();
		$("#npass").hide();
		$("#cpass").hide();
		$("#spass").hide();
		$("#bttn2").hide();
		$("#bttn1").click(function() {
			$("#opass").show();
			$("#npass").show();
			$("#cpass").show();
			$("#spass").show();
			$("#bttn2").show();
			$("#bttn1").hide();
			$("#confirm").show();
			
		});
		$("#bttn2").click(function() {
			$("#opass").hide();
			$("#npass").hide();
			$("#cpass").hide();
			$("#spass").hide();
			$("#bttn2").hide();
			$("#bttn1").show();
			$("#confirm").hide();
			$("#confirm").html("");
		});
	});
	function disable(){
		document.getElementById("opass").value="";
		document.getElementById("npass").value="";
		document.getElementById("cpass").value="";
	}
</script>
<!-- //script-for sticky-nav -->
	<div class="logo_products">
		<div class="container">
			<div class="w3ls_logo_products_left">
				<h1><a href="Index"><span>Grocery</span> Zappy</a></h1>
			</div>
			<!-- <div class="w3ls_logo_products_left1">
				<ul class="special_items">
					<li><a href="events.html">Events</a><i>/</i></li>
					<li><a href="about.html">About Us</a><i>/</i></li>
					<li><a href="products.html">Best Deals</a><i>/</i></li>
					<li><a href="services.html">Services</a></li>
				</ul>
			</div> -->
			<div class="w3ls_logo_products_left1">
				<ul class="phone_email">
					<li><i class="fa fa-phone" aria-hidden="true"></i>+91-8602585475</li>
					<li><i class="fa fa-envelope-o" aria-hidden="true"></i><a href="mailto:store@grocery.com">mustafaali784@gmail.com</a></li>
				</ul>
			</div>
			<div class="clearfix"> </div>
		</div>
	</div>
<!-- //header -->
<!-- products-breadcrumb -->
	<div class="products-breadcrumb">
		<div class="container">
			<ul>
				<li><i class="fa fa-home" aria-hidden="true"></i><a href="indexnew.jsp">Home</a><span>|</span></li>
				<li>My Profile</li>
			</ul>
		</div>
	</div>
<!-- //products-breadcrumb -->
<!-- banner -->
	<div class="banner">
	  <div class="w3l_banner_nav_left">
		<!-- <nav class="navbar nav_bottom">
			 Brand and toggle get grouped for better mobile display
			  <div class="navbar-header nav_2">
				  <button type="button" class="navbar-toggle collapsed navbar-toggle1" data-toggle="collapse" data-target="#bs-megadropdown-tabs">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				  </button>
			   </div> 
			   Collect the nav links, forms, and other content for toggling
				<div class="collapse navbar-collapse" id="bs-megadropdown-tabs">
					<ul class="nav navbar-nav nav_1">
						<li><a href="products.html">Branded Foods</a></li>
						<li><a href="household.html">Households</a></li>
						<li class="dropdown mega-dropdown active">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">Veggies & Fruits<span class="caret"></span></a>				
							<div class="dropdown-menu mega-dropdown-menu w3ls_vegetables_menu">
								<div class="w3ls_vegetables">
									<ul>	
										<li><a href="vegetables.html">Vegetables</a></li>
										<li><a href="vegetables.html">Fruits</a></li>
									</ul>
								</div>                  
							</div>		
									
						</li>
						<li><a href="kitchen.html">Kitchen</a></li>
						<li><a href="short-codes.html">Short Codes</a></li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">Beverages<span class="caret"></span></a>
							<div class="dropdown-menu mega-dropdown-menu w3ls_vegetables_menu">
								<div class="w3ls_vegetables">
									<ul>
										<li><a href="drinks.html">Soft Drinks</a></li>
										<li><a href="drinks.html">Juices</a></li>
									</ul>
								</div>                  
							</div>	
						</li>
						<li><a href="pet.html">Pet Food</a></li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">Frozen Foods<span class="caret"></span></a>
							<div class="dropdown-menu mega-dropdown-menu w3ls_vegetables_menu">
								<div class="w3ls_vegetables">
									<ul>
										<li><a href="frozen.html">Frozen Snacks</a></li>
										<li><a href="frozen.html">Frozen Nonveg</a></li>
									</ul>
								</div>                  
							</div>	
						</li>
						<li><a href="bread.html">Bread & Bakery</a></li>
					</ul>
				 </div>/.navbar-collapse
			</nav> -->
			<%CustomerBean b = (CustomerBean)request.getAttribute("data"); %>
	  </div>
		<div class="w3l_banner_nav_center">
<!-- login -->
		<div class="w3_login">
			<h3>Update Profile </h3>
			<div class="w3_login_module">
				<div class="module form-module">
				  <div class="form">
				  <%String pagename=request.getParameter("pagename");
					   if(pagename==null)
						   pagename="NA";
					   String pagename1=(String)request.getAttribute("pagename1");
					   System.out.println("the name of The login page is "+pagename1);
					   System.out.println("the name of The Non login page is "+pagename);%>
					<h2>Login to your account</h2>
					<form action="Login" method="post">
					  <input type="text" name="uid" placeholder="Email" required=" ">
					  <input type="hidden" name="pagename" value="<%=pagename %>" >
					  <input type="hidden" name="pagename1" value="<%=pagename1 %>" >
					  <input type="password" name="pwd" placeholder="Password" required=" ">
					  <input type="submit" value="Login">
					</form>
				  </div>
				  <div class="form">
					<h2>Update My Profile</h2>
					  <form action="UserProfile" method="post">
					  <input type="text" name="fname" placeholder="First Name" value="<%=b.getName()%>" required=" ">
					  <input type="text" name="lname" placeholder="Last Name" value="<%=b.getLastname()%>" required=" ">
					  <input type="email" name="email" placeholder="Email Address" value="<%=b.getEmail()%>" required=" " pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$">
					  <input type="text" name="mob" placeholder="Phone Number" required=" " value="<%=b.getMob()%>"pattern="[789][0-9]{9}" maxlength="10">
					  <textarea name="add" placeholder="   Address" required=" " style="height:100px;width:320px" value="<%=b.getAddress()%>" ><%=b.getAddress()%></textarea><br/><br/>
					  <input type="button" value = "Change Password" id="bttn1" /><br/>
					  <p id = "confirm"></p>
					  <input type="password" name="opwd" id ="opass" placeholder="Old-Password" >
					  <input type="password" name="npwd" id ="npass" placeholder="New-Password" >
					  <input type="password" name="cpwd" id = "cpass" placeholder="Confirm-Password" onblur="show()" >
					  <div id="spass"><input type="checkbox" onclick="call()" />Show Password<br/><br/></div>
					  <input type="button" value = "No Need To change Password" id="bttn2" onclick="disable()"/><br/><br/>
					  <input type="submit" value="Update">
					</form>
				  </div>
				  <!-- <div class="cta"><a href="forgetpassword.jsp">Forgot your password?</a></div> -->
			  </div>
			</div>
			<script>
				$('.toggle').click(function(){
				  // Switches the Icon
				  $(this).children('i').toggleClass('fa-pencil');
				  // Switches the forms  
				  $('.form').animate({
					height: "toggle",
					'padding-top': 'toggle',
					'padding-bottom': 'toggle',
					opacity: "toggle"
				  }, "slow");
				});
			</script>
		</div>
<!-- //login -->
		</div>
		<div class="clearfix"></div>
</div>
<!-- //banner -->
<!-- newsletter-top-serv-btm --><!-- //newsletter-top-serv-btm -->
<!-- newsletter -->
<!-- //newsletter -->
<!-- footer -->
<%String validpassword=(String)request.getAttribute("cart");
if(msg!=null){
%>

<script>alert("<%=validpassword%>")</script>
<%}%>
<div class="footer">
		<div class="container">
		  <div class="clearfix"> </div>
			<div class="agile_footer_grids">
				<div class="col-md-3 w3_footer_grid agile_footer_grids_w3_footer">
					<div class="w3_footer_grid_bottom">
						<h4>100% secure payments</h4>
						<img src="images/card.png" alt=" " class="img-responsive" />
					</div>
				</div>
				<div class="col-md-3 w3_footer_grid agile_footer_grids_w3_footer">
					<div class="w3_footer_grid_bottom">
						<h5>connect with us</h5>
						<ul class="agileits_social_icons">
							<li><a href="#" class="facebook"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
							<li><a href="#" class="twitter"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
							<li><a href="#" class="google"><i class="fa fa-google-plus" aria-hidden="true"></i></a></li>
							<li><a href="#" class="instagram"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
							<li><a href="#" class="dribbble"><i class="fa fa-dribbble" aria-hidden="true"></i></a></li>
						</ul>
					</div>
				</div>
				<div class="clearfix"> </div>
			</div>
			<div class="wthree_footer_copy">
				<p>Â© 2016 Grocery Store. All rights reserved | Design by <a href="http://w3layouts.com/">W3layouts</a></p>
			</div>
  </div>
</div>
<!-- //footer -->
<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>
<script>
$(document).ready(function(){
    $(".dropdown").hover(            
        function() {
            $('.dropdown-menu', this).stop( true, true ).slideDown("fast");
            $(this).toggleClass('open');        
        },
        function() {
            $('.dropdown-menu', this).stop( true, true ).slideUp("fast");
            $(this).toggleClass('open');       
        }
    );
});
</script>
<!-- here stars scrolling icon -->
	<script type="text/javascript">
		$(document).ready(function() {
			/*
				var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear' 
				};
			*/
								
			$().UItoTop({ easingType: 'easeOutQuart' });
								
			});
	</script>
<!-- //here ends scrolling icon -->
<script src="js/minicart.js"></script>
<script>
/* 		paypal.minicart.render();

		paypal.minicart.cart.on('checkout', function (evt) {
			var items = this.items(),
				len = items.length,
				total = 0,
				i;

			// Count the number of each item in the cart
			for (i = 0; i < len; i++) {
				total += items[i].get('quantity');
			}

			if (total < 3) {
				alert('The minimum order quantity is 3. Please add more to your shopping cart before checking out');
				evt.preventDefault();
			}
		});
 */
	</script>
</body>
</html>