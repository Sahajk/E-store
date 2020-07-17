

<%@include file="includes/header.jsp" %>
  <%@ page import="com.store.entity.Product" %>
    <%@ page import="java.util.List" %>
	

	<!-- Product Detail -->
	<div class="container bgwhite p-t-35 p-b-80">
			<%
			String tempurl4;
			List<Product> productDetailList = (List)request.getAttribute("productDetailList"); 
			for(int i=0;i<productDetailList.size(); i++){ 
			
						
					%>
		<div class="flex-w flex-sb">
			<div class="w-size13 p-t-30 respon5">
				<div class="wrap-slick3 flex-sb flex-w">
					

					<div class="slick3">
						

						<div class="item-slick3" data-thumb="images/thumb-item-03.jpg">
							<div class="wrap-pic-w">
								<img src="<%= request.getContextPath()+"/images/product/"+productDetailList.get(i).getP_image()%>" style="width:500px;height: 570px" class="img-responsive"alt="IMG-PRODUCT">
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="w-size14 p-t-30 respon5">
				<h4 class="product-detail-name m-text16 p-b-13">
					<%= productDetailList.get(i).getP_name() %>
				</h4>

				<span class="m-text17">
				<b>Price : <%= productDetailList.get(i).getP_mrp() %> INR</b>
				</span>

				

				<!--  -->
				<div class="p-t-33 p-b-45">
					


					
						<div class="w-size16 flex-m flex-w">
	
							<div class="btn-addcart-product-detail size9 trans-0-4 m-t-10 m-b-10">
								<!-- Button -->
								<button class="flex-c-m sizefull bg1 bo-rad-23 hov1 s-text1 trans-0-4" id="<%=productDetailList.get(i).getS_no()%>_<%=productDetailList.get(i).getS_id()%>_1" onclick="add()">
									Add to Cart
								</button>
							</div>
						</div>
					
				</div>

				<div class="p-b-45">
					<span class="s-text8 m-r-35">Sold by <%=productDetailList.get(i).getS_id() %></span>
					<span class="s-text8">Main Category Id:<%=productDetailList.get(i).getMc_id() %></span>
					<span class="s-text8">Sub Category Id:<%=productDetailList.get(i).getSc_id()%></span>
				</div>

				<!--  -->
				<div class="wrap-dropdown-content bo6 p-t-15 p-b-14 active-dropdown-content">
					<h5 class="js-toggle-dropdown-content flex-sb-m cs-pointer m-text19 color0-hov trans-0-4">
						Description
						<i class="down-mark fs-12 color1 fa fa-minus dis-none" aria-hidden="true"></i>
						<i class="up-mark fs-12 color1 fa fa-plus" aria-hidden="true"></i>
					</h5>

					<div class="dropdown-content dis-none p-t-15 p-b-23">
						<p class="s-text8">
							<%=productDetailList.get(i).getP_des() %>
						</p>
					</div>
				</div>

			
			</div>
		</div>
		<%} %>
	</div>


	


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

		$('.btn-addcart-product-detail').each(function(){
			var nameProduct = $('.product-detail-name').html();
			$(this).on('click', function(){
				swal(nameProduct, "is added to wishlist !", "success");
			});
		});
	</script>
 <script type="text/javascript">
    
    		
            $(function add(){
            	
            
            $( "button" ).click(function(event) {
            
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
	<script src="js/main.js"></script>
	