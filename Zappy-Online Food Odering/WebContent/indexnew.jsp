<!--
author: W3layouts
author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<%@page import="bean.ZappyBean"%>
<%@page import="java.util.ArrayList"%>
<html>
<head>
<title>Grocery Store a Ecommerce Online Shopping Category Flat
	Bootstrap Responsive Website Template | Products :: w3layouts</title>
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
<!-- js -->
<script src="js/jquery-1.11.1.min.js"></script>
<!-- //js -->
<link
	href='//fonts.googleapis.com/css?family=Ubuntu:400,300,300italic,400italic,500,500italic,700,700italic'
	rel='stylesheet' type='text/css'>
<link
	href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic'
	rel='stylesheet' type='text/css'>
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
<%
	String name = (String) session.getAttribute("name");
	String count1 = (String) request.getAttribute("count");
	if (count1 == null) {
		response.sendRedirect("Index");
	}
%>
<body>
	<!-- header -->
	<div class="agileits_header">
	
		<div class="w3l_offers">
		<%if(name!=null){ %>
			<a href="OrderHistory">Order History</a>
			<%}%>
		</div>
		
		<center><div class="w3l_search">
			<form action="SearchByCategory" method="post">
				<input type="text" name="category" value="Search by Category..."
					onFocus="this.value = '';"
					onBlur="if (this.value == '') {this.value = 'Search by Category...';}"
					required=""> <input type="submit" value=" ">
			</form>
		</div></center>
		<div class="product_list_header">
			<form action="CheckOut" method="post" class="last">
				<fieldset>
					<input type="hidden" name="cmd" value="_cart" /> <input
						type="hidden" name="display" value="1" /> <input type="hidden"
						name="pagename" value="CheckOut" /> <input type="submit"
						name="submit" value="Cart <%=count1%> item(s)" class="button" />
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
								<li><a href="login.jsp?pagename=indexnew.jsp">Login</a></li>
								<li><a href="login.jsp?pagename=indexnew.jsp">Sign Up</a></li>
								<%
									} else {
								%>
								<li>Welcome <%=name%></li>
								<li><a href="CustomerLogout">Logout</a></li>
								<li><a href="UpdateUserProfile">Update Profile</a></li>
								<%
									}
								%>
							</ul>
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
			<h2><a href="mail.html">Contact Us</a></h2>
		</div> -->
		<div class="clearfix"></div>
	</div>
	<!-- script-for sticky-nav -->
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
	<%
		String msg = (String) request.getAttribute("cart");
		if (msg != null) {
	%>

	<script>alert("<%=msg%>");
		
	</script>
	<%
		}
	%>
	<!-- //script-for sticky-nav -->
	<div class="logo_products">
		<div class="container">
			<div class="w3ls_logo_products_left">
				<h1>
					<a href="indexnew.jsp"><span>Grocery</span> ZAPPY </a>
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
				<li>Branded Foods</li>
			</ul>
		</div>
	</div>
	<!-- //products-breadcrumb -->
	<!-- banner -->
	<div class="banner">
		<!-- 	<div class="w3l_banner_nav_left">
			<nav class="navbar nav_bottom">
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
						<li><a href="Index">Branded Foods</a></li>
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
			</nav>
		</div> -->
		<div class="w3l_banner_nav_right">
			<!-- <div class="w3l_banner_nav_right_banner3"> -->
			<!-- <h3>Best Deals For New Products<span class="blink_me"></span></h3> -->
		</div>
		<!-- <div class="w3l_banner_nav_right_banner3_btm">
			  <div class="clearfix"> </div>
		  </div> -->
		<div class="w3ls_w3l_banner_nav_right_grid">
			<h3>STORE</h3>
			<div class="w3ls_w3l_banner_nav_right_grid1">
				<center>
					<h6>READY TO DRINK</h6>
				</center>
				<%
					ArrayList<ZappyBean> al = (ArrayList<ZappyBean>) request.getAttribute("products");

					if (al == null) {
						//response.sendRedirect("Index");
					} else {

						for (ZappyBean b : al) {
							if (b.getCategory().equalsIgnoreCase("ready to drink")) {
				%>
				<div class="col-md-3 w3ls_w3l_banner_left">
					<div class="hover14 column">
						<div
							class="agile_top_brand_left_grid w3l_agile_top_brand_left_grid">
							<div class="agile_top_brand_left_grid_pos">
								<img src="images/offer.png" alt=" " class="img-responsive" />
							</div>
							<div class="agile_top_brand_left_grid1">
								<figure>
									<div class="snipcart-item block">
										<div class="snipcart-thumb">
											<a href="Single?pid=<%=b.getPid()%>"><img
												src="images/<%=b.getImage()%>" alt=" "
												class="img-responsive" /></a>
											<p><%=b.getProductName()%>
												(<%=b.getWeight()%>)
											</p>
											<h4><%=b.getRate()%>Rs <span>0 Rs</span>
											</h4>
										</div>
										<div class="snipcart-details">
											<form action="Addtocart" method="post">
												<fieldset>
													<input type="hidden" name="pid" value="<%=b.getPid()%>" />
													<input type="hidden" name="cmd" value="_cart" />
													<div class="quantity">
														<input type="number" min="1"  step="1" value="1"
															name="add" style="width: 100px">
													</div>
													<br /> <input type="hidden" name="business" value=" " />
													<input type="hidden" name="item_name"
														value="<%=b.getProductName()%>" /> <input type="hidden"
														name="pagename" value="Index" /> <input type="hidden"
														name="amount" value="<%=b.getRate()%>" /> <input
														type="hidden" name="discount_amount" value="10%" /> <input
														type="hidden" name="currency_code" value="INR" /> <input
														type="hidden" name="return" value=" " /> <input
														type="hidden" name="cancel_return" value=" " /> <br /> <br />
													<input type="submit" name="submit" value="Add to cart"
														class="button" />
												</fieldset>
											</form>
										</div>
									</div>
								</figure>
							</div>
						</div>
					</div>
				</div>
				<%
					}
						}
				%>
				<div class="clearfix"></div>
			</div>
			<div class="w3ls_w3l_banner_nav_right_grid1">
				<center>
					<h6>Ready TO COOK</h6>
				</center>
				<%
					/* ArrayList<ZappyBean> al=(ArrayList<ZappyBean>)request.getAttribute("products"); 
												if(al==null){
													response.sendRedirect("Index");
												}
												else{ */

						for (ZappyBean b : al) {
							if (b.getCategory().equalsIgnoreCase("ready to cook")) {
				%>
				<div class="col-md-3 w3ls_w3l_banner_left">
					<div class="hover14 column">
						<div
							class="agile_top_brand_left_grid w3l_agile_top_brand_left_grid">
							<div class="agile_top_brand_left_grid_pos">
								<img src="images/offer.png" alt=" " class="img-responsive" />
							</div>
							<div class="agile_top_brand_left_grid1">
								<figure>
									<div class="snipcart-item block">
										<div class="snipcart-thumb">
											<a href="Single?pid=<%=b.getPid()%>"><img
												src="images/<%=b.getImage()%>" alt=" "
												class="img-responsive" /></a>
											<p><%=b.getProductName()%>
												(<%=b.getWeight()%>)
											</p>
											<h4><%=b.getRate()%>Rs <span>0 Rs</span>
											</h4>
										</div>
										<div class="snipcart-details">
											<form action="Addtocart" method="post">
												<fieldset>
													<input type="hidden" name="pid" value="<%=b.getPid()%>" />
													<input type="hidden" name="cmd" value="_cart" />
													<div class="quantity">
														<input type="number" min="1" step="1" value="1"
															name="add" style="width: 100px">
													</div>
													<br /> <input type="hidden" name="business" value=" " />
													<input type="hidden" name="item_name"
														value="<%=b.getProductName()%>" /> <input type="hidden"
														name="amount" value="<%=b.getRate()%>" /> <input
														type="hidden" name="pagename" value="Index" /> <input
														type="hidden" name="discount_amount" value="10%" /> <input
														type="hidden" name="currency_code" value="INR" /> <input
														type="hidden" name="return" value=" " /> <input
														type="hidden" name="cancel_return" value=" " /> <br />
													<br /> <input type="submit" name="submit"
														value="Add to cart" class="button" />
												</fieldset>
											</form>
										</div>
									</div>
								</figure>
							</div>
						</div>
					</div>
				</div>
				<%
					}
						}
				%>
				<div class="clearfix"></div>
			</div>
			<div class="w3ls_w3l_banner_nav_right_grid1">
				<center>
					<h6>Ready To Eat</h6>
				</center>
				<%
					/* ArrayList<ZappyBean> al=(ArrayList<ZappyBean>)request.getAttribute("products"); 
												if(al==null){
													response.sendRedirect("Index");
												}
												else{ */

						for (ZappyBean b : al) {
							if (b.getCategory().equalsIgnoreCase("ready to eat")) {
				%>
				<div class="col-md-3 w3ls_w3l_banner_left">
					<div class="hover14 column">
						<div
							class="agile_top_brand_left_grid w3l_agile_top_brand_left_grid">
							<div class="agile_top_brand_left_grid_pos">
								<img src="images/offer.png" alt=" " class="img-responsive" />
							</div>
							<div class="agile_top_brand_left_grid1">
								<figure>
									<div class="snipcart-item block">
										<div class="snipcart-thumb">
											<a href="Single?pid=<%=b.getPid()%>"><img
												src="images/<%=b.getImage()%>" alt=" "
												class="img-responsive" /></a>
											<p><%=b.getProductName()%>
												(<%=b.getWeight()%>)
											</p>
											<h4><%=b.getRate()%>Rs <span>0 Rs</span>
											</h4>
										</div>
										<div class="snipcart-details">
											<form action="Addtocart" method="post">
												<fieldset>
													<input type="hidden" name="pid" value="<%=b.getPid()%>" />
													<input type="hidden" name="cmd" value="_cart" />
													<div class="quantity">
														<input type="number" min="1" step="1" value="1"
															name="add" style="width: 100px">
													</div>
													<br /> <input type="hidden" name="business" value=" " />
													<input type="hidden" name="item_name"
														value="<%=b.getProductName()%>" /> <input type="hidden"
														name="amount" value="<%=b.getRate()%>" /> <input
														type="hidden" name="pagename" value="Index" /> <input
														type="hidden" name="discount_amount" value="10%" /> <input
														type="hidden" name="currency_code" value="INR" /> <input
														type="hidden" name="return" value=" " /> <input
														type="hidden" name="cancel_return" value=" " /> <br />
													<br /> <input type="submit" name="submit"
														value="Add to cart" class="button" />
												</fieldset>
											</form>
										</div>
									</div>
								</figure>
							</div>
						</div>
					</div>
				</div>
				<%
					}
						}
					}
				%>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<div class="clearfix"></div>
	</div>
	<!-- //banner -->
	<!-- newsletter -->
	<!-- <!-- <div class="newsletter"> -->
	<div class="container">
		<div class="clearfix"></div>
	</div>
	</div>
	-->
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
					<li><a href="kitchen.html">Kitchen</a></li>
					<li><a href="products.html">Branded Foods</a></li>
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
					© 2018 Zappy Store. All rights reserved | Design by <a
						href="https://www.facebook.com/profile.php?id=100003667232061">Mustafa</a>
				</p>
			</div>
		</div>
	</div>
	<!-- //footer -->
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
	<!-- //here ends scrolling icon -->
	<script src="js/minicart.js"></script>
	<script>
		/* 	paypal.minicart.render();

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