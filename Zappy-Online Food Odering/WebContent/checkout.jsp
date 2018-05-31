
<!--
author: W3layouts
author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<%@page import="bean.CartBean"%>
<%@page import="java.util.ArrayList"%>
<html>
<head>
<%-- <%
	String uid = (String) session.getAttribute("uid");
	if (uid == null) {
%>

<script>
	confirm("You Need To Login First To Proceed");
</script>
<%
	RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
		request.setAttribute("pagename1", "CheckOut");
		rd.forward(request, response);
	}
%> --%>
</script>
<%
	String msg = (String) request.getAttribute("msg");
	if (msg == null)
		msg = "NA";
	if (!msg.equals("NA")) {
%>
<script>alert("<%=msg%>");
</script>
<%
	}
%>
<title>Grocery Store a Ecommerce Online Shopping Category Flat
	Bootstrap Responsive Website Template | Checkout :: w3layouts</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Grocery Store Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript">
	
	
	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } 



</script>
<!-- //for-mobile-apps -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- font-awesome icons -->
<link href="css/font-awesome.css" rel="stylesheet" type="text/css"
	media="all" />
<!-- //font-awesome icons -->

<link
	href='//fonts.googleapis.com/css?family=Ubuntu:400,300,300italic,400italic,500,500italic,700,700italic'
	rel='stylesheet' type='text/css'>
<link
	href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic'
	rel='stylesheet' type='text/css'>
<%
	int count = (int) request.getAttribute("count");
%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
</head>
<script>
	$(document).ready(function() {

		$("#newadd").hide();
		$("#bttn1").hide();
		$("#bttn1").click(function() {
			$("#newadd").hide();
			$("#bttn1").hide();
			$("#bttn2").show();
		});
		$("#bttn2").click(function() {
			$("#newadd").show();
			$("#bttn1").show();
			$("#bttn2").hide();
		});

	});
</script>
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
			<form action="#" method="post" class="last">
				<fieldset>
					<input type="hidden" name="cmd" value="_cart" /> <input
						type="hidden" name="display" value="1" /> <input type="submit"
						name="submit" value="Cart <%=count%> Item(s)" class="button" />
				</fieldset>
			</form>
		</div>
		<div class="w3l_header_right">
			<ul>
				<li class="dropdown profile_details_drop"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown"><i
						class="fa fa-user" aria-hidden="true"></i><span class="caret"></span></a>
					<div class="mega-dropdown-menu">
						<div class="w3ls_vegetables">
							<ul class="dropdown-menu drp-mnu">
								<%
									
									if (name == null) {
								%>
								<li><a href="login.jsp?pagename=CheckOut">Login</a></li>
								<li><a href="login.jsp?pagename=CheckOut">Sign Up</a></li>
								<%
									} else {
								%>
								<li>Welcome <%=name%></li>
								<li><a href="CustomerLogout">Logout</a></li>
								<li><a href="UpdateUserProfile">Update Profile</a></li>
								<%
									}
								%>
							
						</div>
					</div></li>
			</ul>
		</div>
		<%
			if (name != null) {
		%>
		<div class="product_list_header">
			<form action="MyOrder" method="post" class="last">
				<fieldset>
					<input type="hidden" name="cmd" value="_cart" /> <input
						type="hidden" name="display" value="1" /> <input type="hidden"
						name="pagename" value="CheckOut" /> <input type="submit"
						name="submit" value="My Orders" class="button"
						style="width: 100px" />
				</fieldset>
			</form>
		</div>
		<%
			}
		%>
		<!-- <div class="w3l_header_right1">
			<h2>
				<a href="mail.html">Contact Us</a>
			</h2>
		</div> -->
		<div class="clearfix"></div>
	</div>

	<div class="logo_products">
		<div class="container">
			<div class="w3ls_logo_products_left">
				<h1>
					<a href="indexnew.jsp"><span>Grocery</span> zappy </a>
				</h1>
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
					<li><i class="fa fa-envelope-o" aria-hidden="true"></i><a
						href="mailto:store@grocery.com">mustafaali784@gmail.com</a></li>
				</ul>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<!-- //header -->
	<!-- products-breadcrumb -->
	<div class="products-breadcrumb">
		<div class="container">
			<ul>
				<li><i class="fa fa-home" aria-hidden="true"></i><a
					href="indexnew.jsp">Home</a><span>|</span></li>
				<li>Checkout</li>
			</ul>
		</div>
	</div>
	<!-- //products-breadcrumb -->
	<!-- banner -->
	<div class="banner">
		<!-- <div class="w3l_banner_nav_left">
			<nav class="navbar nav_bottom">
				Brand and toggle get grouped for better mobile display
				<div class="navbar-header nav_2">
					<button type="button"
						class="navbar-toggle collapsed navbar-toggle1"
						data-toggle="collapse" data-target="#bs-megadropdown-tabs">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
				</div>
				Collect the nav links, forms, and other content for toggling
				<div class="collapse navbar-collapse" id="bs-megadropdown-tabs">
					<ul class="nav navbar-nav nav_1">
						<li><a href="products.html">Branded Foods</a></li>
						<li><a href="household.html">Households</a></li>
						<li class="dropdown mega-dropdown active"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown">Veggies &
								Fruits<span class="caret"></span>
						</a>
							<div
								class="dropdown-menu mega-dropdown-menu w3ls_vegetables_menu">
								<div class="w3ls_vegetables">
									<ul>
										<li><a href="vegetables.html">Vegetables</a></li>
										<li><a href="vegetables.html">Fruits</a></li>
									</ul>
								</div>
							</div></li>
						<li><a href="kitchen.html">Kitchen</a></li>
						<li><a href="short-codes.html">Short Codes</a></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown">Beverages<span class="caret"></span></a>
							<div
								class="dropdown-menu mega-dropdown-menu w3ls_vegetables_menu">
								<div class="w3ls_vegetables">
									<ul>
										<li><a href="drinks.html">Soft Drinks</a></li>
										<li><a href="drinks.html">Juices</a></li>
									</ul>
								</div>
							</div></li>
						<li><a href="pet.html">Pet Food</a></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown">Frozen Foods<span class="caret"></span></a>
							<div
								class="dropdown-menu mega-dropdown-menu w3ls_vegetables_menu">
								<div class="w3ls_vegetables">
									<ul>
										<li><a href="frozen.html">Frozen Snacks</a></li>
										<li><a href="frozen.html">Frozen Nonveg</a></li>
									</ul>
								</div>
							</div></li>
						<li><a href="bread.html">Bread & Bakery</a></li>
					</ul>
				</div>
				/.navbar-collapse
			</nav>
		</div> -->
		
		<div class="w3l_banner_nav_center">
			<!-- about -->
			<div class="privacy about">
				<h3>
					Chec<span>kout</span>
				</h3>

				<div class="checkout-right">
				<%if(count==0){
				out.println("<center><h1>Your Shopping Cart Is Empty<h1><center>");
				}else{
					%>
				
					<center>
						<h4>
							Your shopping cart contains: <span><%=count%> Products</span>
						</h4>
					</center>
					<table class="timetable_sub">
						<thead>
							<tr>
								<th>SL No.</th>
								<th>Product</th>
								<th>Quantity</th>
								<th>Product Name</th>

								<th>UnitPrice</th>
								<th>TotalPrice</th>
								<th>Remove</th>
							</tr>
						</thead>
						<%
							ArrayList<CartBean> al = (ArrayList<CartBean>) request.getAttribute("data");
							int x = 1;
							int gttl = 0;
							int ttl = 0;
							for (CartBean b : al) {
								int rate = Integer.parseInt(b.getPrice());
								int quan = Integer.parseInt(b.getQuantity());
								ttl = rate * quan;
								gttl = ttl + gttl;
						%>
						<script>
		function total(i){
			var qnt = document.getElementById("quant"+i).value;
			var price =document.getElementById("price"+i).value;
			
			var rate= qnt*price;
			document.getElementById("rate"+i).innerHTML=rate;
			document.getElementById("ttl"+i).innerHTML=rate;
			document.getElementById("rate"+i).value=rate;
			return rate;
		}
		</script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	
	$("#quant"+<%=x%>).change(function(){
	    
		var qnt=$("#quant"+<%=x%>).val();
		var pid =$("#pid"+<%=x%>).val();
		//alert(email);
	var	data="quant="+qnt+"&pid="+pid;
		$.ajax({
			url:'InsertQuantity',
			data:data,
			type:'post',
			success:function(response){
			//	alert(response);
				$("#msg").html(response);
			}
		 });
	});
});
</script>
							<tbody>
							<tr class="rem1">
								<td class="invert"><%=x%></td>
								<td class="invert-image"><a
									href="Single?pid=<%=b.getPid()%>"><img
										src="images/<%=b.getImage()%>" alt=" "
										class="img-responsive" style="height: 50px; width: 50px"></a></td>
										<input type="hidden" value="<%=b.getPid()%>" id="pid<%=x%>">
								<td class="invert">
									<!-- <div class="quantity">
										<div class="quantity-select">
											<div class="entry value-minus">&nbsp;</div>
											<div class="entry value"> --> <%-- <input type="number" id="quantity" value="<%=b.getQuantity()%>"> --%>
									<div class="quantity">
										<input type="number" min="1" step="1" value="<%=b.getQuantity()%>"
											style="width: 100px" id= "quant<%=x%>" onchange="total(<%=x%>)">
									</div> <!-- </div>
											<div class="entry value-plus active">&nbsp;</div>
										</div>
									</div> -->
								</td>
								<td class="invert"><%=b.getProductName()%></td>
								<%-- <%
									int rate = Integer.parseInt(b.getPrice());
										int quan = Integer.parseInt(b.getQuantity());
										int ttl = rate * quan;
								%> --%>
								<input type="hidden" id="price<%=x%>" value="<%=b.getPrice()%>" />
								<td class="invert"><%=b.getPrice()%></td>
								<td class="invert" id ="rate<%=x%>"><%=ttl%></td>
								<td class="invert">
									<div class="rem">
										<!-- <div class="close1"></div> -->
										<a href="RemoveFromcart?pid=<%=b.getPid()%>"
											onclick="return confirm('You Want To Remove The Product From The Cart')"
											style="background-color: #40bf40; color: white; padding: 20px; width: 25px">Remove</a>
									</div>
								</td>
							</tr>
							<!--<tr class="rem2">
						<td class="invert">2</td>
						<td class="invert-image"><a href="single.html"><img src="images/3.png" alt=" " class="img-responsive"></a></td>
						<td class="invert">
							 <div class="quantity"> 
								<div class="quantity-select">                           
									<div class="entry value-minus">&nbsp;</div>
									<div class="entry value"><span>1</span></div>
									<div class="entry value-plus active">&nbsp;</div>
								</div>
							</div>
						</td>-->

						</tbody>
						<%
							x++;
							}
						%>

					</table>
				</div>
				<div class="checkout-left">

					<div class="col-md-4 checkout-left-basket">
						<form action="Order" method="post">
							<input type="submit" value="Place Order"
								style="background-color: #40bf40; color: white; padding: 20px; width: 250px">
						</form>
						<br />
						<ul>
							<%
								int price = 0;
								int grttl = 0;
								int x1=1;
								for (CartBean b : al) {
									int rate = Integer.parseInt(b.getPrice());
									int quan = Integer.parseInt(b.getQuantity());
									int ttl1 = rate * quan;
									grttl = ttl1 + grttl;
							%>
							<li><%=b.getProductName()%> <i>-</i> <span id=ttl<%=x1%>><%=ttl1%>
							</span></li>
							<%
								x1++;}
							%>
							<!-- <li>Total Service Charges <i>-</i> <span>Rs 150.00</span></li><br/><br/> -->
							<li>Total <i>-</i> <span id= "grandtotal">Rs <%=grttl%></span></li>
						</ul>
					</div><% if(name!=null){%>
					<input type="button" value="Use Already Existing Address"
						id="bttn1"
						style="background-color: #40bf40; color: white; padding: 20px; width: 250px">&nbsp;&nbsp;&nbsp;<input
						type="button" value="Add New Details" id="bttn2"
						style="background-color: #40bf40; color: white; padding: 20px; width: 250px" /><br />
						<%} %>
					<br />
					<div class="col-md-8 address_form_agile" id="newadd">
						<h4>Add a new Details</h4>
						<form action="AddNewDetails" method="post"
							class="creditly-card-form agileinfo_form">
							<section class="creditly-wrapper wthree, w3_agileits_wrapper">
								<div class="information-wrapper">
									<div class="first-row form-group">
										<div class="controls">
											<label class="control-label">First name: </label> <input
												class="billing-address-name form-control" type="text"
												name="fname" placeholder="First name">
										</div>
										<div class="controls">
											<label class="control-label">Last name: </label> <input
												class="billing-address-name form-control" type="text"
												name="lname" placeholder="Last name" required="required">
										</div>
										<div class="w3_agileits_card_number_grids">
											<div class="w3_agileits_card_number_grid_left">
												<div class="controls">
													<label class="control-label">Mobile number:</label> <input
														type="text" name="mob" placeholder="Mobile number"
														pattern="[789][0-9]{9}" maxlength="10"
														class="form-control" required="required">
												</div>
											</div>
											<div class="w3_agileits_card_number_grid_right">
												<div class="controls">
													<label class="control-label">Landmark: </label> <input
														class="form-control" type="text" name="lndm"
														placeholder="Landmark" required="required">
												</div>
											</div>
											<div class="clear"></div>
										</div>
										<div class="controls">
											<label class="control-label">Town/City: </label> <input
												class="form-control" type="text" name="town"
												placeholder="Town/City" required="required">
										</div>
										<div class="controls">
											<label class="control-label">Address type: </label> <select
												class="form-control option-w3ls" name="addtype"
												style="width: 320px; height: 50px">
												<option value="office">Office</option>
												<option value="home">Home</option>
												<option value="commercial">Commercial</option>

											</select>
										</div>
									</div>
									<br />
									<button class="submit check_out">Delivery to this
										Address</button>
								</div>
							</section>
						</form>
						<%}%>
						<!-- <div class="checkout-right-basket">
							<a href="payment.html">Make a Payment</a>
						</div> -->
					</div>

					<div class="clearfix"></div>

				</div>

			</div>
			<!-- //about -->
		</div>
		<div class="clearfix"></div>
	</div>
	<!-- //banner -->


	<!-- newsletter -->
	<!-- <div class="newsletter">
		<div class="container">
			<div class="clearfix"></div>
		</div>
	</div> -->
	<!-- //newsletter -->
	<!-- footer -->
	<div class="footer">
		<div class="container">
			<div class="col-md-3 w3_footer_grid">
				<h3>information</h3>
				<ul class="w3_footer_grid_list">
					<li><a href="events.html">Events</a></li>
					<li><a href="about.html">About Us</a></li>
					<li><a href="products.html">Best Deals</a></li>
					<li><a href="services.html">Services</a></li>
					<li><a href="short-codes.html">Short Codes</a></li>
				</ul>
			</div>
			<div class="col-md-3 w3_footer_grid">
				<h3>policy info</h3>
				<ul class="w3_footer_grid_list">
					<li><a href="faqs.html">FAQ</a></li>
					<li><a href="privacy.html">privacy policy</a></li>
					<li><a href="privacy.html">terms of use</a></li>
				</ul>
			</div>
			<div class="col-md-3 w3_footer_grid">
				<h3>what in stores</h3>
				<ul class="w3_footer_grid_list">
					<li><a href="pet.html">Pet Food</a></li>
					<li><a href="frozen.html">Frozen Snacks</a></li>
					<li><a href="kitchen.html">Kitchen</a></li>
					<li><a href="products.html">Branded Foods</a></li>
					<li><a href="household.html">Households</a></li>
				</ul>
			</div>
			<div class="clearfix"></div>
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
							<li><a href="#" class="facebook"><i
									class="fa fa-facebook" aria-hidden="true"></i></a></li>
							<li><a href="#" class="twitter"><i class="fa fa-twitter"
									aria-hidden="true"></i></a></li>
							<li><a href="#" class="google"><i
									class="fa fa-google-plus" aria-hidden="true"></i></a></li>
							<li><a href="#" class="instagram"><i
									class="fa fa-instagram" aria-hidden="true"></i></a></li>
							<li><a href="#" class="dribbble"><i
									class="fa fa-dribbble" aria-hidden="true"></i></a></li>
						</ul>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="wthree_footer_copy">
				<p>
					© 2016 Grocery Store. All rights reserved | Design by <a
						href="http://w3layouts.com/">W3layouts</a>
				</p>
			</div>
		</div>
	</div>
	<!-- //footer -->
	<!-- js -->
	<script src="js/jquery-1.11.1.min.js"></script>
	<!--quantity-->
	<script>
		$('.value-plus')
				.on(
						'click',
						function() {
							var divUpd = $(this).parent().find('.value'), newVal = parseInt(
									divUpd.text(), 10) + 1;
							divUpd.text(newVal);
						});

		$('.value-minus')
				.on(
						'click',
						function() {
							var divUpd = $(this).parent().find('.value'), newVal = parseInt(
									divUpd.text(), 10) - 1;
							if (newVal >= 1)
								divUpd.text(newVal);
						});
	</script>
	<!--quantity-->
	<script>
		$(document).ready(function(c) {
			$('.close1').on('click', function(c) {
				$('.rem1').fadeOut('slow', function(c) {
					$('.rem1').remove();
				});
			});
		});
	</script>
	<script>
		$(document).ready(function(c) {
			$('.close2').on('click', function(c) {
				$('.rem2').fadeOut('slow', function(c) {
					$('.rem2').remove();
				});
			});
		});
	</script>
	<script>
		$(document).ready(function(c) {
			$('.close3').on('click', function(c) {
				$('.rem3').fadeOut('slow', function(c) {
					$('.rem3').remove();
				});
			});
		});
	</script>

	<!-- //js -->
	<!-- script-for sticky-nav -->
	<script>
		$(document).ready(function() {
			var navoffeset = $(".agileits_header").offset().top;
			$(window).scroll(function() {
				var scrollpos = $(window).scrollTop();
				if (scrollpos >= navoffeset) {
					$(".agileits_header").addClass("fixed");
				} else {
					$(".agileits_header").removeClass("fixed");
				}
			});

		});
	</script>
	<!-- //script-for sticky-nav -->
	<!-- start-smoth-scrolling -->
	<script type="text/javascript" src="js/move-top.js"></script>
	<script type="text/javascript" src="js/easing.js"></script>
	<script type="text/javascript">
		jQuery(document).ready(function($) {
			$(".scroll").click(function(event) {
				event.preventDefault();
				$('html,body').animate({
					scrollTop : $(this.hash).offset().top
				}, 1000);
			});
		});
	</script>
	<!-- start-smoth-scrolling -->
	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>
	<script>
		$(document).ready(function() {
			$(".dropdown").hover(function() {
				$('.dropdown-menu', this).stop(true, true).slideDown("fast");
				$(this).toggleClass('open');
			}, function() {
				$('.dropdown-menu', this).stop(true, true).slideUp("fast");
				$(this).toggleClass('open');
			});
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

			$().UItoTop({
				easingType : 'easeOutQuart'
			});

		});
	</script>
	<!-- //here ends scrolling icon -->
	<script src="js/minicart.js"></script>
	<style>
.quantity {
	position: relative;
}

input[type=number]::-webkit-inner-spin-button, input[type=number]::-webkit-outer-spin-button
	{
	-webkit-appearance: none;
	margin: 0;
}

input[type=number] {
	-moz-appearance: textfield;
}

.quantity input {
	width: 45px;
	height: 42px;
	line-height: 1.65;
	float: left;
	display: block;
	padding: 0;
	margin: 0;
	padding-left: 20px;
	border: 1px solid #eee;
}

.quantity input:focus {
	outline: 0;
}

.quantity-nav {
	float: left;
	position: relative;
	height: 42px;
}

.quantity-button {
	position: relative;
	cursor: pointer;
	border-left: 1px solid #eee;
	width: 20px;
	text-align: center;
	color: #333;
	font-size: 13px;
	font-family: "Trebuchet MS", Helvetica, sans-serif !important;
	line-height: 1.7;
	-webkit-transform: translateX(-100%);
	transform: translateX(-100%);
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	-o-user-select: none;
	user-select: none;
}

.quantity-button.quantity-up {
	position: absolute;
	height: 50%;
	top: 0;
	border-bottom: 1px solid #eee;
}

.quantity-button.quantity-down {
	position: absolute;
	bottom: -1px;
	height: 50%;
}
</style>
	<script type="text/javascript">
		jQuery(
				'<div class="quantity-nav"><div class="quantity-button quantity-up">+</div><div class="quantity-button quantity-down">-</div></div>')
				.insertAfter('.quantity input');
		jQuery('.quantity')
				.each(
						function() {
							var spinner = jQuery(this), input = spinner
									.find('input[type="number"]'), btnUp = spinner
									.find('.quantity-up'), btnDown = spinner
									.find('.quantity-down'), min = input
									.attr('min'), max = input.attr('max');

							btnUp.click(function() {
								var oldValue = parseFloat(input.val());
								if (oldValue >= max) {
									var newVal = oldValue;
								} else {
									var newVal = oldValue + 1;
								}
								spinner.find("input").val(newVal);
								spinner.find("input").trigger("change");
							});

							btnDown.click(function() {
								var oldValue = parseFloat(input.val());
								if (oldValue <= min) {
									var newVal = oldValue;
								} else {
									var newVal = oldValue - 1;
								}
								spinner.find("input").val(newVal);
								spinner.find("input").trigger("change");
							});

						});
	</script>
	<!-- <script>
		
	<!-- paypal.minicart.render();

		paypal.minicart.cart
				.on(
						'checkout',
						function(evt) {
							var items = this.items(), len = items.length, total = 0, i;

							// Count the number of each item in the cart
							for (i = 0; i < len; i++) {
								total += items[i].get('quantity');
							}

							if (total < 3) {
								alert('The minimum order quantity is 3. Please add more to your shopping cart before checking out');
								evt.preventDefault();
							}
						});
	</script>-->
</body>
</html>