
<%@include file="includes/header.jsp" %>
    <%@ page import="com.store.entity.Product" %>
    <%@ page import="com.store.entity.MainCategory" %>
    <%@ page import="java.util.List" %>
   

	<!-- Title Page -->
	<section class="bg-title-page p-t-50 p-b-40 flex-col-c-m" style="background-image: url(images/crousel2.jpg);">
		<h2 class="l-text2 t-center">
			Grocery
		</h2>
		<p class="m-text13 t-center">
			New Arrivals 2020
		</p>
	</section>


	<!-- Content page -->
	<section class="bgwhite p-t-55 p-b-65">
		<div class="container">
			<div class="row">
				<div class="col-sm-6 col-md-4 col-lg-3 p-b-50">
					<div class="leftbar p-r-20 p-r-0-sm">
						<!--  -->
						<h4 class="m-text14 p-b-7">
							Categories
						</h4>


					
						<ul class="p-b-54">
						<li class="p-t-4">
								<a href="<%= request.getContextPath()+"/site?page=productsbysid"+
										"&sid="+request.getParameter("sid") %>"s-text13 active1">
									All Products
								</a>
							</li>
						<%
						String tempurl5;
						String tempurl3;
						List<Product> productList = (List)request.getAttribute("productList");
				
						List<MainCategory> mList = (List)request.getAttribute("mList"); 
						for(int i=0;i<mList.size(); i++){ 
						tempurl5 = request.getContextPath()+"/site?page=productsbysidmid"+
							"&mid="+mList.get(i).getS_no()+
							"&sid="+request.getParameter("sid");
			%>
							<li class="p-t-4">
								<a href=<%=""+tempurl5+"" %> class="s-text13 active1">
									<%=mList.get(i).getC_name() %>
								</a>
							</li>
						<%} %>
						</ul>

						
						<%--<h4 class="m-text14 p-b-32">
							Search
						</h4>

						

					

						<div class="search-product pos-relative bo4 of-hidden">
							<input class="s-text7 size6 p-l-23 p-r-50" type="text" name="search-product" placeholder="Search Products...">

							<button class="flex-c-m size5 ab-r-m color2 color0-hov trans-0-4">
								<i class="fs-12 fa fa-search" aria-hidden="true"></i>
							</button>
						</div> --%>
					</div>
				</div>
				

				<div class="col-sm-6 col-md-8 col-lg-9 p-b-50">
					<!--  -->
				<%--	<div class="flex-sb-m flex-w p-b-35">
						<div class="flex-w">
							<div class="rs2-select2 bo4 of-hidden w-size12 m-t-5 m-b-5 m-r-10">
								<select class="selection-2" name="sorting">
									<option>Default Sorting</option>
									<option>Popularity</option>
									<option>Price: low to high</option>
									<option>Price: high to low</option>
								</select>
							</div>

							<div class="rs2-select2 bo4 of-hidden w-size12 m-t-5 m-b-5 m-r-10">
								<select class="selection-2" name="sorting">
									<option>Price</option>
									<option>$0.00 - $50.00</option>
									<option>$50.00 - $100.00</option>
									<option>$100.00 - $150.00</option>
									<option>$150.00 - $200.00</option>
									<option>$200.00+</option>

								</select>
							</div>
						</div>

						<%--<span class="s-text8 p-t-5 p-b-5">
							Showing €“12 of 16 results
						</span>
					</div>--%>

					<!-- Product -->
					<div class="row">
					<%
					
			for(int i=0;i<productList.size(); i++){ 
				tempurl3 = request.getContextPath()+"/site?page=productdetail"+"&pid="+productList.get(i).getS_no();
						
					%>
				<div class="col-sm-12 col-md-6 col-lg-4 p-b-50">
							<!-- Block2 -->
							<div class="block2">
								<div class="block2-img wrap-pic-w of-hidden pos-relative ">
									<img src="<%= request.getContextPath()+"/images/product/"+productList.get(i).getP_image() %>" alt="IMG-PRODUCT" style="height: 250px;width: 270px">

									<div class="block2-overlay trans-0-4">
										

										<div class="block2-btn-addcart w-size1 trans-0-4">
										<input type="hidden" name="pid" value="<%= productList.get(i).getS_no()%>">
									<input type="hidden" name="sid" value="<%= productList.get(i).getS_id()%>">
									<input type="hidden" name="qty" value="1">
									<input type="hidden" name="form" value="addtocart">
											<!-- Button -->
											<button class="flex-c-m size1 bg4 bo-rad-23 hov1 s-text1 trans-0-4" id="<%=productList.get(i).getS_no()%>_<%=productList.get(i).getS_id()%>_1" onclick="add()">
												Add to Cart
											</button>
										</div>
									</div>
								</div>

								<div class="block2-txt p-t-20">
									<a href=<%=""+tempurl3+"" %> class="block2-name dis-block s-text3 p-b-5">
										<%= productList.get(i).getP_name() %>
									</a>

									<span class="block2-price m-text6 p-r-5">
									<b><%= productList.get(i).getP_mrp() %> INR</b>	
									</span>
								</div>
							</div>
						</div>

						<% }
					 if(productList.size()==0){
						out.println("<h3>No item available in this category</h3>");
					}
					%>
					</div>

					<!-- Pagination -->
					<%-- <div class="pagination flex-m flex-w p-t-26">
						<a href="#" class="item-pagination flex-c-m trans-0-4 active-pagination">1</a>
						<a href="#" class="item-pagination flex-c-m trans-0-4">2</a>
					</div> --%>
				</div>
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

</body>
</html>
