<!--
author: W3layouts
author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<%@page import="bean.PlacedOrderBean"%>
<%@page import="java.util.ArrayList"%>
<html>
<head>
<title>Grocery Store a Ecommerce Online Shopping Category Flat Bootstrap Responsive Website Template | About Us :: w3layouts</title>
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
	
<body>
<%
String msg =(String)request.getAttribute("msg");
	if(msg!=null){%>
		<script>alert("<%=msg%>")</script>
		<% } %>
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
		<%String count1=(String)request.getAttribute("count");
	if(count1==null){
		response.sendRedirect("Index");
	}
	%>
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
									<li><a href = "UpdateUserProfile">Update Profile</a></li>
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
		<div class="clearfix"> </div>
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
<!-- //script-for sticky-nav -->
	<div class="logo_products">
		<div class="container">
			<div class="w3ls_logo_products_left">
				<h1><a href="Index"><span>Grocery</span> zappy </a></h1>
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
					<li><i class="fa fa-envelope-o" aria-hidden="true"></i><a href="mailto:store@grocery.com">mustafaali784@.com</a></li>
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
				<li>Order Status </li>
			</ul>
		</div>
	</div>
	
<!-- //products-breadcrumb -->
<!-- banner -->
		<div class="w3l_banner_nav_right">
<!-- about -->
		<div class="privacy about">
		<%ArrayList<PlacedOrderBean> al = (ArrayList<PlacedOrderBean>)request.getAttribute("data");
			for(PlacedOrderBean b : al){												%>
			<h3>Your Order Has Been Placed </h3>
			<p class="animi">Order Id :- <%=b.getOid()%>  </p>
			<p class="animi">Order Date :-<%=b.getDate() %></p>
			<p class="animi">Shipping Address:-<%=b.getAddress()%> </p>
			<p class="animi">Amount:-Rs <%=b.getAmount()%></p>
			<p class="animi">Payment Method:- Cash On Delivery </p><br/><br/><br/>
			<%} %>
			<table>
			
			<td><form action="Index" method="get"><input type="submit" value="Continue Shopping" style="background-color:#40bf40;color: white;padding: 20px;width: 250px"/></form></td>
			<!-- <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td> -->
			<td><form action="MyOrder" method="get"><input type="submit" value="View Order History" style="background-color:#40bf40;color: white;padding: 20px;width: 250px"/></form></td>
			</table>
			<p class="animi">&nbsp;</p>
			<p class="animi">&nbsp;  </p>
			<div class="agile_about_grids">
			  <div class="clearfix"> </div>
		  </div>
		</div>
<!-- //about -->
		</div>
		<div class="clearfix"></div>
	</div>
<!-- //banner -->
<!-- team -->
	<div class="team">
  <div class="container">
	    <div class="agileits_team_grids">
			  <div class="clearfix"> </div>
    </div>
		</div>
	</div>
<!-- //team -->
<!-- testimonials --><!-- //testimonials -->
<!-- newsletter -->
<!-- //newsletter -->
<!-- footer -->
<div class="footer">
		<div class="container">
		  <div class="clearfix"> </div>
			<div class="agile_footer_grids">
				<div class="col-md-3 w3_footer_grid agile_footer_grids_w3_footer">
				  <div class="w3_footer_grid_bottom">
						<h4>100% secure payments	</h4>
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
				<p>© 2016 Grocery Store. All rights reserved | Design by <a href="http://w3layouts.com/">W3layouts</a></p>
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
<!-- <script>
		paypal.minicart.render();

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

	</script> -->
</body>
</html>