
    <!DOCTYPE html>
<html lang="en">
<head>
	<title><% 
    if( request.getAttribute("title") == null){
        out.print("Homepage");
    }else{
    	out.print(request.getAttribute("title"));
    }
    %></title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
	<link rel="icon" type="image/png" href="images/icons/favicon.png"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/themify/themify-icons.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/elegant-font/html-css/style.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/slick/slick.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/lightbox2/css/lightbox.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
</head>
<body class="animsition">

	<!-- Header -->
	<header class="header1">
		<!-- Header desktop -->
		<div class="container-menu-header">
			<div class="topbar">
				<div class="topbar-social">
					<a href="#" class="topbar-social-item fa fa-facebook"></a>
					<a href="#" class="topbar-social-item fa fa-instagram"></a>
					<a href="#" class="topbar-social-item fa fa-pinterest-p"></a>
					<a href="#" class="topbar-social-item fa fa-snapchat-ghost"></a>
					<a href="#" class="topbar-social-item fa fa-youtube-play"></a>
				</div>

				<span class="topbar-child1">
					AdminPanel For Sellers
				</span>

				<div class="topbar-child2">
					<span class="topbar-email">
					<% if(session.getAttribute("sid")==null) { %>
					Hiii Seller!!!!
					  <% } else { %>
						<%= session.getAttribute("sid") %>
						<% } %>
					</span>

					<div class="topbar-language rs1-select2">
						
					</div>
				</div>
			</div>

			<div class="wrap_header">
				<!-- Logo -->
				<a href="${pageContext.request.contextPath}/AdminController?page=adminhome"  class="logo">
					<h4>E-Store</h4>
				</a>

				<!-- Menu -->
				<div class="wrap_menu">
					<nav class="menu">
						<ul class="main_menu">
							<li>
								<a href="${pageContext.request.contextPath}/AdminController?page=adminhome">Home</a>
								</li>
							<li>
								<a href="${pageContext.request.contextPath}/AdminController?page=adminaddproduct">Add Product</a>
							</li>

							<li>
								<a href="${pageContext.request.contextPath}/AdminController?page=adminproducts">Product List</a>
							</li>
							<li>
								<a href="${pageContext.request.contextPath}/AdminController?page=adminorder">Order List</a>
							</li>
							
							
							
						</ul>
					</nav>
				</div>

				<!-- Header Icon -->
				<div class="header-icons">
				<li>
								<a href="${pageContext.request.contextPath}/AdminController?page=adminprofile">Profile</a>
							</li>
							<span class="linedivide1"></span>
					<div class="header-wrapicon2 dis-block">
					<li>
								<a href="${pageContext.request.contextPath}/AdminController?page=adminlogout">Logout</a>
							</li>	
					
					</div>
					
				</div>
			</div>
		</div>


  
			</div>
		</div>
    
  
		
	</header>