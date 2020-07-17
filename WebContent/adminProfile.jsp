<%@include file="includes/adminheader.jsp" %>

<%@ page import="com.store.entity.Seller" %>
    <%@ page import="java.util.List" %>
<!-- Title Page -->
	<section class="bg-title-page p-t-40 p-b-50 flex-col-c-m" style="background-image: url(images/adminback.jpg);">
		<h2 class="l-text2 t-center">
			Admin Profile
		</h2>
	</section>

	<section class="bgwhite p-t-66 p-b-60">
		<div class="container">
			<div class="row">
			<div class="col-md-1"></div>
				<div class="col-md-5 p-b-30">
				<%
						List<Seller> sellerDetail = (List)request.getAttribute("sellerDetail");
						for(int i=0;i<sellerDetail.size(); i++){ 
						
			%>
					<form action="AdminController"  method="post">
						<h4 class="m-text26 p-b-36 p-t-15">
							Admin Details
						</h4>
				<input type="hidden" name="sno"  value="<%=sellerDetail.get(i).getS_no()%>">
						<div class="bo4 of-hidden size15 m-b-20">
							<input class="sizefull s-text7 p-l-22 p-r-22" type="text" name="name" value="<%= sellerDetail.get(i).getSname() %>" placeholder="Full Name" required>
						</div>

						<div class="bo4 of-hidden size15 m-b-20">
							<input class="sizefull s-text7 p-l-22 p-r-22" type="text" name="address" value="<%= sellerDetail.get(i).getSaddress() %>" placeholder="Address" required>
						</div>

						<div class="bo4 of-hidden size15 m-b-20">
							<input class="sizefull s-text7 p-l-22 p-r-22" type="text" name="city" value="<%= sellerDetail.get(i).getScity() %>" placeholder="City" required>
						</div>
						
						<div class="bo4 of-hidden size15 m-b-20">
							<input class="sizefull s-text7 p-l-22 p-r-22" type="text" name="sid" value="<%= sellerDetail.get(i).getSid() %>" placeholder="Email" required disabled>
						</div>
						<input type="hidden" name="form" value="updateAdminOperation">
						<div class="bo4 of-hidden size15 m-b-20">
							<input class="sizefull s-text7 p-l-22 p-r-22" type="password" name="password" value="<%= sellerDetail.get(i).getSpass() %>" placeholder="Password" required>
						</div>
						

						<br>
						
						<div class="w-size25">
							<!-- Button -->
							<button class="flex-c-m size2 bg1 bo-rad-23 hov1 m-text3 trans-0-4">
								Update Details
							</button>
							
						</div>
						
					</form>
					
				</div>
				<div class="col-md-1"></div>
				<div class="col-md-3">
				<h4 class="m-text26 p-b-36 p-t-15">
							Profile Pic
						</h4>
						<img src="<%=request.getContextPath() +"/images/seller/"+sellerDetail.get(i).getSellerImage()%>" style="width:200px ; height:200px" alt="IMG-BENNER"><br><br>
						
				<form action="AdminController" method="Post" enctype="multipart/form-data">
				<label for="simage">Change Image:</label>
						<div class="row ">
						<div class="bo4   size13 m-l-15" style="max-width: 500px;">
							<input class="sizefull s-text7 m-r-10  p-t-7" type="file"  name="simage" required>
							<input type="hidden" name="form" value="updateadminimageoperation">
							
						</div>
						<div class="p-l-12" ><br>
							<div class="w-size25">
							<button class="flex-c-m size2 bg1 bo-rad-23 hov1 m-text3 trans-0-4">
								Upload
							</button></div>
						</div></div></form>
				</div>
			</div><%} %>
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
