<% 
if(session.getAttribute("uid")==null ){
		response.sendRedirect("userSignupLogin.jsp"); 
	}

%>

<%@include file="includes/header.jsp" %>
<%@ page import="java.util.List" %>
<%@ page import="com.store.entity.Product" %>
<%@ page import="com.store.entity.Seller" %>

	<!-- Slide1 -->
	
	
	<section class="slide1">
		<div class="wrap-slick1">
			<div class="slick1">
				<div class="item-slick1 item1-slick1" style="background-image: url(images/crousel3.jpg) ;">
					<div class="wrap-content-slide1 sizefull flex-col-c-m p-l-15 p-r-15 p-t-150 p-b-170">
						<span class="caption1-slide1 m-text1 t-center animated visible-false m-b-15" data-appear="fadeInDown">
							Grocerry Store
						</span>

						<h2 class="caption2-slide1 xl-text1 t-center animated visible-false m-b-37" data-appear="fadeInUp">
							New Products
						</h2>

						<div class="wrap-btn-slide1 w-size1 animated visible-false" data-appear="zoomIn">
							<!-- Button -->
							<a href="${pageContext.request.contextPath}/site?page=usersellerlist" class="flex-c-m size2 bo-rad-23 s-text2 bgwhite hov1 trans-0-4">
								Shop Now
							</a>
						</div>
					</div>
				</div>


			</div>
		</div>
	</section>

<h3 class="sec-title m-text5 t-center p-t-45">
					Nearby Sellers
				</h3>
		
				<h6 class="  t-center " style="text-transform: uppercase;">
					@<%=session.getAttribute("city") %>
				</h6>
				 
				
	<!-- Banner -->
	<section class="banner bgwhite p-t-40 p-b-0">
		<div class="container">
		
			<div class="row">
			<%			String tempurl1;
			List<Seller> sellerList = (List)request.getAttribute("sellerList"); 
			for(int i=0;i<sellerList.size(); i++){ 
				tempurl1 = request.getContextPath()+"/site?page=productsbysid"+
						"&sid="+sellerList.get(i).getSid();
				%>
				<div class="col-sm-4 col-md-3 col-lg-4 p-b-30" style="max-width: 25%;">
				
					<div class=" hov-img-zoom pos-relative m-b-5">
						<img src="<%=request.getContextPath()+"/images/seller/"+sellerList.get(i).getSellerImage()%>" style="width:270px; height:247px"alt="IMG-PRODUCT" class="img-responsive">

						<div class="block1-wrapbtn w-size2">
							<!-- Button -->
							<a href=<%=""+tempurl1+"" %> class="flex-c-m size2 m-text2 bg3 hov1 trans-0-4">
								Click Here
							</a>
						</div>
						
					</div>
					<div class="block2-txt p-t-20">
								<a href=<%=""+tempurl1+"" %> class="block2-name dis-block s-text3 p-b-5">
									<%= sellerList.get(i).getSname() %>
								</a>

								<span class="block2-price m-text6 p-r-5">
									<%= sellerList.get(i).getScity()%>
								</span>
							</div>
							
						
					
						
					</div>
					<% }%>
					
					<div class="col-sm-4 col-md-3 col-lg-4 p-b-30" style="max-width: 25%;">
					
					<div class=" hov-img-zoom pos-relative m-b-5">
						<img src="images/icons/bg-01.jpg" alt="IMG-BENNER">

						<div class="block2-content sizefull ab-t-l flex-col-c-m">
							<h4 class="m-text4 t-center w-size3 p-b-8">
								See More Sellers
							</h4>

							<p class="t-center w-size4">
								From Other cities
							</p>

							<div class="w-size2 p-t-25">
								<!-- Button -->
								<a href="${pageContext.request.contextPath}/site?page=usersellerlist" class="flex-c-m size2 bg4 bo-rad-23 hov1 m-text3 trans-0-4">
									See More
								</a>
							</div>
						</div>
					
						
					</div>
					
				
					
					</div>
				</div>
		</div>	
	</section>

	<!-- New Product -->
	<section class="newproduct bgwhite p-t-45 p-b-30">
		<div class="container">
			<div class="sec-title p-b-60">
				<h3 class="m-text5 t-center">
					Featured Products
				</h3>
				<h6 class=" t-center">
					by @SahajKaryanaStore
				</h6>
			</div>

		<div class="wrap-slick2 " style="font-family: Montserrat-Regular;
font-size: 15px;">
		<div class="slick2">
<%			String tempurl4;
			List<Product> upList = (List)request.getAttribute("upList"); 
			for(int i=0;i<upList.size(); i++){ 
				tempurl4 = request.getContextPath()+"/site?page=productdetail"+"&pid="+upList.get(i).getS_no();
				%>
				<div class="item-slick2 p-l-15 p-r-15">
						<!-- Block2 -->
						<div class="block2">
							<div class="block2-img wrap-pic-w of-hidden pos-relative ">
								<img src="<%=request.getContextPath() + "/images/product/"+upList.get(i).getP_image()%> " style="width:270px; height:200px"  alt="IMG-PRODUCT">

								<div class="block2-overlay trans-0-4">
									<div class="block2-btn-addcart w-size1 trans-0-4">
									
									<input type="hidden" name="pid" value="<%= upList.get(i).getS_no()%>">
									<input type="hidden" name="sid" value="<%= upList.get(i).getS_id()%>">
									<input type="hidden" name="qty" value="1">
									<input type="hidden" name="form" value="addtocart">
									
										
										<button class="bt flex-c-m size1 bg4 bo-rad-23 hov1 s-text1 trans-0-4" id="<%=upList.get(i).getS_no()%>_<%=upList.get(i).getS_id()%>_1" onclick="add()">
											Add to Cart
										</button>
									</div>
								</div>
							</div>

							<div class="block2-txt p-t-20">
								<a href=<%=""+tempurl4+"" %> class="block2-name dis-block s-text3 p-b-5">
									<%= upList.get(i).getP_name()%>
								</a>
							<span class="block2-price m-text6 p-r-5">
								<b>	<%= upList.get(i).getP_mrp()%> INR</b>
								</span>
							</div>
						</div>
			</div>
					
			
	<% }%>
	
	
		</div>
			</div>
			</div>
	</section>

	

	<!-- Shipping -->
	<section class="shipping bgwhite p-t-62 p-b-46">
		<div class="flex-w p-l-15 p-r-15">
			<div class="flex-col-c w-size5 p-l-15 p-r-15 p-t-16 p-b-15 respon1">
				<h4 class="m-text12 t-center">
					Free Delivery Nationwide
				</h4>
			<span class="s-text11 t-center">
					Order over 1000 INR
				</span>
				
			</div>

			<div class="flex-col-c w-size5 p-l-15 p-r-15 p-t-16 p-b-15 bo2 respon2">
				<h4 class="m-text12 t-center">
					30 Days Return
				</h4>

				<span class="s-text11 t-center">
					Simply return it within 30 days for an exchange.
				</span>
			</div>

			<div class="flex-col-c w-size5 p-l-15 p-r-15 p-t-16 p-b-15 respon1">
				<h4 class="m-text12 t-center">
					Store Opening
				</h4>

				<span class="s-text11 t-center">
					Shop open from Monday to Sunday
				</span>
			</div>
		</div>
	</section>


	<!-- Footer -->

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
	<script type="text/javascript" src="<%=request.getContextPath()%>/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script type="text/javascript" src="<%=request.getContextPath()%>/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script type="text/javascript" src="<%=request.getContextPath()%>/vendor/bootstrap/js/popper.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script type="text/javascript" src="<%=request.getContextPath()%>/vendor/select2/select2.min.js"></script>
	<script type="text/javascript">
		$(".selection-1").select2({
			minimumResultsForSearch: 20,
			dropdownParent: $('#dropDownSelect1')
		});
	</script>
<!--===============================================================================================-->
	<script type="text/javascript" src="<%=request.getContextPath()%>/vendor/slick/slick.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/slick-custom.js"></script>
<!--===============================================================================================-->
	<script type="text/javascript" src="<%=request.getContextPath()%>/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script type="text/javascript" src="<%=request.getContextPath()%>/vendor/lightbox2/js/lightbox.min.js"></script>
<!--===============================================================================================-->
	<script type="text/javascript" src="<%=request.getContextPath()%>/vendor/sweetalert/sweetalert.min.js"></script>
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

 <script type="text/javascript">
    
    		
            $(function add(){
            	
            
            $( ".bt" ).click(function(event) {
            
                var term = this.id;
                var sp=term.split("_");
                var sid=sp[1];
                var pid=sp[0];
                var qty=sp[2]
                
                
                
                
                // Send the data using post
                var posting = $.post("operation",{form:"addtocart",pid:pid,sid:sid,qty:qty });
                
                    // When the POST request is done..
                    // data: The output printed in servlet
                    posting.done(function(data) {
                        
                        // Put the results in a div
                        $("#"+term).text(data);
                       
                    });
            });
            });
        </script>

<!--===============================================================================================-->
	<script src="<%=request.getContextPath()%>/js/main.js"></script>

</body>
</html>
