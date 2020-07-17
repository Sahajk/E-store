<%@include file="includes/adminheader.jsp" %>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>

	<section class="bg-title-page p-t-40 p-b-50 flex-col-c-m" style="background-image: url(images/crousel2.jpg);">
		<h2 class="l-text2 t-center">
			Welcome Seller !!!
		</h2>
	</section>

<h3 class="sec-title m-text5 t-center p-t-45">
					Web Analytics
				</h3>
		
	<!-- Banner -->
	<section class="banner bgwhite p-t-40 p-b-100">
		<div class="container">
		
			<div class="row">
				<%
						
				Map<String,Long> cList = (Map)request.getAttribute("cList");
				
	%>
				<div class="col-sm-4 col-md-3 col-lg-4 p-b-30" style="max-width: 25%;">
					
					<div class=" hov-img-zoom pos-relative m-b-5">
						<img src="images/icons/bg-01.jpg" alt="IMG-BENNER">

						<div class="block2-content sizefull ab-t-l flex-col-c-m">
							<i class=" fa fa-user fa-5x " aria-hidden="true"></i>

							<p class="t-center w-size4" >
								<h3 style="padding-top: 15px"><%=cList.get("userCount")%></h3>
							</p>

							<div class="w-size2 p-t-25">
								<!-- Button -->
								<button class="flex-c-m size2 bg4 bo-rad-23 hov1 m-text3 trans-0-4">
									Active User
								</button>
							</div>
						</div>
				</div>
				</div>
				
				
				<div class="col-sm-4 col-md-3 col-lg-4 p-b-30" style="max-width: 25%;">
					
					<div class=" hov-img-zoom pos-relative m-b-5">
						<img src="images/icons/bg-01.jpg" alt="IMG-BENNER">

						<div class="block2-content sizefull ab-t-l flex-col-c-m">
							<i class=" fa fa-user fa-5x " aria-hidden="true"></i>

							<p class="t-center w-size4" >
								<h3 style="padding-top: 15px"><%=cList.get("sellerCount")%></h3>
							</p>

							<div class="w-size2 p-t-25">
								<!-- Button -->
								<button class="flex-c-m size2 bg4 bo-rad-23 hov1 m-text3 trans-0-4">
									Active Sellers
								</button>
							</div>
						</div>
				</div>
				</div>
				
				
				<div class="col-sm-4 col-md-3 col-lg-4 p-b-30" style="max-width: 25%;">
					
					<div class=" hov-img-zoom pos-relative m-b-5">
						<img src="images/icons/bg-01.jpg" alt="IMG-BENNER">

						<div class="block2-content sizefull ab-t-l flex-col-c-m">
							<i class=" fa fa-inr fa-5x " aria-hidden="true"></i>

							<p class="t-center w-size4" >
								<h3 style="padding-top: 15px"><%=cList.get("orderCount")%></h3>
							</p>

							<div class="w-size2 p-t-25">
								<!-- Button -->
								<button class="flex-c-m size2 bg4 bo-rad-23 hov1 m-text3 trans-0-4">
									Total Orders
								</button>
							</div>
						</div>
				</div>
				</div>
				
				
				<div class="col-sm-4 col-md-3 col-lg-4 p-b-30" style="max-width: 25%;">
					
					<div class=" hov-img-zoom pos-relative m-b-5">
						<img src="images/icons/bg-01.jpg" alt="IMG-BENNER">

						<div class="block2-content sizefull ab-t-l flex-col-c-m">
							<i class=" fa fa-shopping-cart fa-5x " aria-hidden="true"></i>

							<p class="t-center w-size4" >
								<h3 style="padding-top: 15px"><%=cList.get("productCount")%></h3>
							</p>

							<div class="w-size2 p-t-25">
								<!-- Button -->
								<button class="flex-c-m size2 bg4 bo-rad-23 hov1 m-text3 trans-0-4">
									Total Products
								</button>
							</div>
						</div>
				</div>
				</div>
		
				</div>
				
			
	</section>


	
	
	
	<!-- Container Selection1 -->
	<div id="dropDownSelect1"></div>



<!--===============================================================================================-->
	<script type="text/javascript" src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script type="text/javascript" src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script type="text/javascript" src="vendor/bootstrap/js/popper.js"></script>
	<script type="text/javascript" src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script type="text/javascript" src="vendor/select2/select2.min.js"></script>
	
<!--===============================================================================================-->
	<script type="text/javascript" src="vendor/slick/slick.min.js"></script>
	<script type="text/javascript" src="js/slick-custom.js"></script>
<!--===============================================================================================-->
	<script type="text/javascript" src="vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script type="text/javascript" src="vendor/lightbox2/js/lightbox.min.js"></script>
<!--===============================================================================================-->


<!--===============================================================================================-->
	<script src="js/main.js"></script>

</body>
</html>
