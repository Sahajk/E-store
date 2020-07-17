

<%@include file="includes/header.jsp" %>
 <%@ page import="com.store.entity.User" %>
    <%@ page import="java.util.List" %>

<!-- Title Page -->
	<section class="bg-title-page p-t-40 p-b-50 flex-col-c-m" style="background-image: url(images/adminback.jpg);">
		<h2 class="l-text2 t-center">
			User Profile
		</h2>
	</section>

	<section class="bgwhite p-t-66 p-b-60">
		<div class="container">
			<div class="row">
			<div class="col-md-1"></div>
				<div class="col-md-5 p-b-30">
				<%
						List<User> userDetail = (List)request.getAttribute("userDetail");
				
						
						for(int i=0;i<userDetail.size(); i++){ 
						
			%>
					<form action="operation"  method="post">
						<h4 class="m-text26 p-b-36 p-t-15">
							User Details
						</h4>
					<input  type="hidden" name="sno" value="<%= userDetail.get(i).getS_no()%>" >
						<div class="bo4 of-hidden size15 m-b-20">
							<input class="sizefull s-text7 p-l-22 p-r-22" type="text" name="name" value="<%= userDetail.get(i).getName()%>" placeholder="Full Name" required>
						</div>

						<div class="bo4 of-hidden size15 m-b-20">
							<input class="sizefull s-text7 p-l-22 p-r-22" type="text" name="address" value="<%= userDetail.get(i).getAddress()%>" placeholder="Address" required>
						</div>

						<div class="bo4 of-hidden size15 m-b-20">
							<input class="sizefull s-text7 p-l-22 p-r-22" type="text" name="city" value="<%= userDetail.get(i).getCity()%>"placeholder="City" required>
						</div>
						<div class="bo4 of-hidden size15 m-b-20">
							<input class="sizefull s-text7 p-l-22 p-r-22" type="text" name="pincode"value="<%= userDetail.get(i).getPincode()%>" placeholder="Password" required>
						</div>
						
						<div class="bo4 of-hidden size15 m-b-20">
							<input class="sizefull s-text7 p-l-22 p-r-22" type="text" name="uid"value="<%= userDetail.get(i).getUid()%>" placeholder="Email" required disabled>
						</div>
						<input type="hidden" name="form" value="updateUserOperation">
						<div class="bo4 of-hidden size15 m-b-20">
							<input class="sizefull s-text7 p-l-22 p-r-22" type="password" name="password"value="<%= userDetail.get(i).getPass()%>" placeholder="Password" required>
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
							<img src="<%=request.getContextPath() +"/images/user/"+userDetail.get(i).getUimage()%>" style="width:200px ; height:200px" alt="IMG-BENNER"><br><br>
				
				<form action="operation" method="post" enctype="multipart/form-data">
				
				<label for="uimage">Change Image:</label>
						<div class="row">
						<div class="bo4  size13 m-l-15" style="max-width: 500px;">
							<input class="sizefull s-text7 m-r-10  p-t-7" type="file"  name="uimage" required>
							<input type="hidden" name="form" value="updateuserimageoperation">
							
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

<%@include file="includes/footer.jsp" %>

	<!-- Back to top -->
	<div class="btn-back-to-top bg0-hov" id="myBtn">
		<span class="symbol-btn-back-to-top">
			<i class="fa fa-angle-double-up" aria-hidden="true"></i>
		</span>
	</div>

	<!-- Container Selection -->
	<div id="dropDownSelect1"></div>
	<div id="dropDownSelect2"></div>



<!--===============================================================================================-->
	<script type="text/javascript" src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script type="text/javascript" src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script type="text/javascript" src="vendor/bootstrap/js/popper.js"></script>
	<script type="text/javascript" src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script type="text/javascript" src="vendor/select2/select2.min.js"></script>
	<script type="text/javascript">
		$(".selection-1").select2({
			minimumResultsForSearch: 20,
			dropdownParent: $('#dropDownSelect1')
		});

		$(".selection-2").select2({
			minimumResultsForSearch: 20,
			dropdownParent: $('#dropDownSelect2')
		});
	</script>
<!--===============================================================================================-->
	<script type="text/javascript" src="vendor/daterangepicker/moment.min.js"></script>
	<script type="text/javascript" src="vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script type="text/javascript" src="vendor/slick/slick.min.js"></script>
	<script type="text/javascript" src="js/slick-custom.js"></script>
<!--===============================================================================================-->
	<script type="text/javascript" src="vendor/sweetalert/sweetalert.min.js"></script>
	<script type="text/javascript">
		$('.block2-btn-addcart').each(function(){
			var nameProduct = $(this).parent().parent().parent().find('.block2-name').html();
			$(this).on('click', function(){
				swal(nameProduct, "is added to cart !", "success");
			});
		});

		$('.block2-btn-addwishlist').each(function(){
			var nameProduct = $(this).parent().parent().parent().find('.block2-name').html();
			$(this).on('click', function(){
				swal(nameProduct, "is added to wishlist !", "success");
			});
		});
	</script>

<!--===============================================================================================-->
	<script type="text/javascript" src="vendor/noui/nouislider.min.js"></script>
	<script type="text/javascript">
		/*[ No ui ]
	    ===========================================================*/
	    var filterBar = document.getElementById('filter-bar');

	    noUiSlider.create(filterBar, {
	        start: [ 50, 200 ],
	        connect: true,
	        range: {
	            'min': 50,
	            'max': 200
	        }
	    });

	    var skipValues = [
	    document.getElementById('value-lower'),
	    document.getElementById('value-upper')
	    ];

	    filterBar.noUiSlider.on('update', function( values, handle ) {
	        skipValues[handle].innerHTML = Math.round(values[handle]) ;
	    });
	</script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>

</body>
</html>
