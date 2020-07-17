
	
<%@include file="includes/header.jsp" %>
<%@ page import="java.util.List" %>

<%@ page import="com.store.entity.Seller" %>


<h3 class="sec-title m-text5 t-center p-t-45">
					All Sellers
				</h3>
	<!-- Banner -->
	<section class="banner bgwhite p-t-40 p-b-0">
		<div class="container">
		
			<div class="row">
			<%			String tempurl2;
			List<Seller> allsellerList = (List)request.getAttribute("allsellerList"); 
			for(int i=0;i<allsellerList.size(); i++){ 
				tempurl2 = request.getContextPath()+"/site?page=productsbysid"+
						"&sid="+allsellerList.get(i).getSid();
				%>
				<div class="col-sm-4 col-md-3 col-lg-4 p-b-30" style="max-width: 25%;">
					
					<div class=" hov-img-zoom pos-relative m-b-5">
						<img src="<%=request.getContextPath()+"/images/seller/"+allsellerList.get(i).getSellerImage()%>" style="width:270px; height:247px"alt="IMG-PRODUCT">

						<div class="block1-wrapbtn w-size2">
							<!-- Button -->
							<a href=<%=""+tempurl2+"" %> class="flex-c-m size2 m-text2 bg3 hov1 trans-0-4">
								Click Here
							</a>
						</div>
						
					</div>
					
					<div class="block2-txt p-t-20">
								<a href=<%=""+tempurl2+"" %> class="block2-name dis-block s-text3 p-b-5">
									<%= allsellerList.get(i).getSname() %>
								</a>

								<span class="block2-price m-text6 p-r-5">
									<%= allsellerList.get(i).getScity()%>
								</span>
							</div>
							
							
					
						
					</div>
					<% }%>
					
					
				</div>
			</div>
	</section>


	<%@include file="includes/footer.jsp" %>


	<!-- Back to top -->
	<div class="btn-back-to-top bg0-hov" id="myBtn">
		<span class="symbol-btn-back-to-top">
			<i class="fa fa-angle-double-up" aria-hidden="true"></i>
		</span>
	</div>
	
	
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
	<script type="text/javascript">
		$(".selection-1").select2({
			minimumResultsForSearch: 20,
			dropdownParent: $('#dropDownSelect1')
		});
	</script>
<!--===============================================================================================-->
	<script type="text/javascript" src="vendor/slick/slick.min.js"></script>
	<script type="text/javascript" src="js/slick-custom.js"></script>
<!--===============================================================================================-->
	<script type="text/javascript" src="vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script type="text/javascript" src="vendor/lightbox2/js/lightbox.min.js"></script>
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
	<script src="js/main.js"></script>

</body>
</html>
