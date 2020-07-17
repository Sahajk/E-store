
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

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
	<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/icons/favicon.png"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/fonts/themify/themify-icons.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/fonts/elegant-font/html-css/style.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/vendor/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/vendor/slick/slick.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/vendor/lightbox2/css/lightbox.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/util.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">
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
					Free shipping for standard order over 1000 INR
				</span>

				<div class="topbar-child2">
					<span class="topbar-email">
					<% if(session.getAttribute("uid")==null) { %>
					Hiii Guest!!!!
					  <% } else { %>
						<%= session.getAttribute("uid") %>
						<% } %>
					</span>

					<div class="topbar-language rs1-select2">
						<select class="selection-1" name="time">
							<option>IND</option>
							
						</select>
					</div>
				</div>
			</div>

			<div class="wrap_header">
				<!-- Logo -->
				<a href="${pageContext.request.contextPath}/site?page=home"  class="logo">
					<h4>E-Store</h4>
				</a>

				<!-- Menu -->
				<div class="wrap_menu">
					<nav class="menu">
						<ul class="main_menu">
							<li>
								<a href="${pageContext.request.contextPath}/site?page=home">Home</a>
								
								</li>
							<li>
								<a href="${pageContext.request.contextPath}/site?page=usersellerlist">Shop</a>
							</li>
<li>
								<a href="${pageContext.request.contextPath}/site?page=about">About</a>
							</li>

							<li>
								<a href="${pageContext.request.contextPath}/site?page=contact">Contact</a>
							</li>
							<li>
								<a href="${pageContext.request.contextPath}/site?page=beaseller">Be A Seller</a>
							</li>
						</ul>
					</nav>
				</div>

  <div class="header-icons">
					<div class="header-wrapicon2 dis-block">
						<img src="images/icons/icon-header-01.png" class="header-icon1 js-show-header-dropdown" alt="ICON">
					<div class="header-cart header-dropdown " style="width: 150px; padding-bottom: 2px;padding-top: 2px;">
							<ul class="header-cart-wrapitem">
							<li class="header-cart-item p-t-0 p-b-0">
									<div class="header-cart-item-txt">
									
										Hii <%= session.getAttribute("uname") %>

									</div>
								</li>
								<hr style="margin-top: 0px;margin-bottom: 0px;">
								
								<li class="header-cart-item p-t-0 p-b-0">
									<div class="header-cart-item-txt">
										<a href="${pageContext.request.contextPath}/site?page=userprofile" class="header-cart-item-name" style="padding-top: 5px;margin-bottom: 5px;">
											Profile
										</a>

									</div>
								</li><hr style="margin-top: 0px;margin-bottom: 0px;">
								<li class="header-cart-item p-t-0 p-b-0">
									<div class="header-cart-item-txt">
										<a href="${pageContext.request.contextPath}/site?page=userorder" class="header-cart-item-name" style="padding-top: 5px;margin-bottom: 5px;">
											Your Orders
										</a>

									</div>
								</li><hr style="margin-top: 0px;margin-bottom: 0px;">
								
								<li class="header-cart-item p-t-0 p-b-0">
									<div class="header-cart-item-txt">
										<a href="${pageContext.request.contextPath}/site?page=logout" class="header-cart-item-name" style="padding-top: 5px;margin-bottom: 5px;">
											Logout
										</a>

									</div>
								</li>
							</ul></div></div>
					<span class="linedivide1"></span>

					<div class="header-wrapicon2"><a href="${pageContext.request.contextPath}/site?page=cart">
						<img src="images/icons/icon-header-02.png" class="header-icon1 js-show-header-dropdown" alt="ICON">
						
						</a>
					</div>
				</div>
			</div>
		</div>
    
  
		<!-- Header Mobile -->
		<div class="wrap_header_mobile">
			<!-- Logo moblie -->
			<a href="${pageContext.request.contextPath}/site?page=home" class="logo-mobile">
					
					<h4>E-Store</h4>
			</a>

			<!-- Button show menu -->
			<div class="btn-show-menu">
				<!-- Header Icon mobile -->
				<div class="header-icons-mobile">
					<a href="#" class="header-wrapicon1 dis-block">
						<img src="images/icons/icon-header-01.png" class="header-icon1" alt="ICON">
					</a>

					<span class="linedivide2"></span>

					
					<div class="header-wrapicon2"><a href="${pageContext.request.contextPath}/site?page=cart">
						<img src="images/icons/icon-header-02.png" class="header-icon1 js-show-header-dropdown" alt="ICON">
						
						</a>
					</div>
					
				</div>

				<div class="btn-show-menu-mobile hamburger hamburger--squeeze">
					<span class="hamburger-box">
						<span class="hamburger-inner"></span>
					</span>
				</div>
			</div>
		</div>

		<!-- Menu Mobile -->
		<div class="wrap-side-menu" >
			<nav class="side-menu">
				<ul class="main-menu">
					<li class="item-topbar-mobile p-l-20 p-t-8 p-b-8">
						<span class="topbar-child1">
							Free shipping for standard order over 1000 INR
						</span>
					</li>

					<li class="item-topbar-mobile p-l-20 p-t-8 p-b-8">
						<div class="topbar-child2-mobile">
							<span class="topbar-email">
								
							</span>

							<div class="topbar-language rs1-select2">
								<select class="selection-1" name="time">
									<option>IND</option>
								
								</select>
							</div>
						</div>
					</li>

					<li class="item-topbar-mobile p-l-10">
						<div class="topbar-social-mobile">
							<a href="#" class="topbar-social-item fa fa-facebook"></a>
							<a href="#" class="topbar-social-item fa fa-instagram"></a>
							<a href="#" class="topbar-social-item fa fa-pinterest-p"></a>
							<a href="#" class="topbar-social-item fa fa-snapchat-ghost"></a>
							<a href="#" class="topbar-social-item fa fa-youtube-play"></a>
						</div>
					</li>

					<li class="item-menu-mobile">
						<a href="${pageContext.request.contextPath}/site?page=home">Home</a>
						
						<i class="arrow-main-menu fa fa-angle-right" aria-hidden="true"></i>
					</li>

					<li class="item-menu-mobile">
						<a href="${pageContext.request.contextPath}/site?page=usersellerlist">Shop</a>
					</li>

					

					<li class="item-menu-mobile">
						<a href="${pageContext.request.contextPath}/site?page=about">About</a>
					</li>

					<li class="item-menu-mobile">
						<a href="${pageContext.request.contextPath}/site?page=contact">Contact</a>
					</li>
					
					<li class="item-menu-mobile">
					<a href="${pageContext.request.contextPath}/site?page=beaseller">Be A Seller</a>
					</li>
					
				</ul>
			</nav>
		</div>
	</header>