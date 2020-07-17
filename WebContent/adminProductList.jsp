<%@include file="includes/adminheader.jsp" %>
<%@ page import="java.util.List" %>
<%@ page import="com.store.entity.Product" %>
<%@ page import="com.store.entity.MainCategory" %>

	<!-- Title Page -->
	<section class="bg-title-page p-t-40 p-b-50 flex-col-c-m" style="background-image: url(images/adminback.jpg);">
		<h2 class="l-text2 t-center">
			Product List
		</h2>
	</section>

<br>


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
								<a href="<%= request.getContextPath()+"/AdminController?page=adminproducts"+
										"&sid="+request.getParameter("sid") %>"s-text13 active1">
									All Products
								</a>
							</li>
						<%
						String tempurl5;
						String tempurl3;
						List<Product> pList = (List)request.getAttribute("pList"); 
				
						List<MainCategory> mList = (List)request.getAttribute("mList"); 
						for(int i=0;i<mList.size(); i++){ 
						tempurl5 = request.getContextPath()+"/AdminController?page=productsbysidmid"+
							"&mid="+mList.get(i).getS_no()+
							"&sid="+session.getAttribute("sid");
			%>
							<li class="p-t-4">
								<a href=<%=""+tempurl5+"" %> class="s-text13 active1">
									<%=mList.get(i).getC_name() %>
								</a>
							</li>
						<%} %>
						</ul>
				</div>
				</div>
				<div class="col-sm-6 col-md-8 col-lg-9 p-b-50">
					<div class="row">
					<%
					
			for(int i=0;i<pList.size(); i++){ 
				tempurl3 = request.getContextPath()+"/AdminController?page=adminupdateproduct"+"&pid="+pList.get(i).getS_no();
						
					%>
				<div class="col-sm-12 col-md-6 col-lg-4 p-b-50">
							<!-- Block2 -->
							<div class="block2" style=>
								<div class="block2-img wrap-pic-w of-hidden pos-relative " >
									<img src="<%=request.getContextPath()+"/images/product/"+pList.get(i).getP_image()%>" class="img-responsive" style="height: 270px;width: 270px">

									<div class="block2-overlay trans-0-4">
										

										<div class="block2-btn-addcart w-size1 trans-0-4">
											<!-- Button -->
												<a href=<%=""+tempurl3+"" %> class="block2-name dis-block s-text3 p-b-5">
											<button class="flex-c-m size1 bg4 bo-rad-23 hov1 s-text1 trans-0-4">
												Update Details
											</button></a>
										</div>
									</div>
								</div>

								<div class="block2-txt p-t-20">
									<a href=<%=""+tempurl3+"" %> class="block2-name dis-block s-text3 p-b-5">
										<%= pList.get(i).getP_name() %>
										 
										
									</a>

									<span class="block2-price m-text6 p-r-5">
										<%= pList.get(i).getP_mrp() %>
									</span>
								</div>
							</div>
						</div>

						<% }
					 if(pList.size()==0){
						out.println("<h3>No item added in this category</h3>");
					}
					%>
					</div>

					<!-- Pagination -->
					<div class="pagination flex-m flex-w p-t-26">
						<a href="#" class="item-pagination flex-c-m trans-0-4 active-pagination">1</a>
						<a href="#" class="item-pagination flex-c-m trans-0-4">2</a>
					</div>
				</div>
			</div>
		</div>
	</section>
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
	<script src="js/main.js"></script>

</body>
</html>
