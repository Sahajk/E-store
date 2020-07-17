<%@include file="includes/adminheader.jsp" %>
<%@ page import="java.util.List" %>
<%@ page import="com.store.entity.Product" %>

<script type="text/javascript">


</script>
	<!-- Title Page -->
	<section class="bg-title-page p-t-40 p-b-50 flex-col-c-m" style="background-image: url(images/adminback.jpg);">
		<h2 class="l-text2 t-center">
			Update Product Details
		</h2>
	</section>

	<section class="bgwhite p-t-66 p-b-60">
		<div class="container">
			<div class="row">
			<div class="col-md-1 p-b-30"></div>
				<div class="col-md-5 p-b-30">
				<%
						List<Product> productDetailList = (List)request.getAttribute("productDetailList");
				
						
						for(int i=0;i<productDetailList.size(); i++){ 
						
			%>
					<form  action="AdminController" method="post"  >
						<h4 class="m-text26 p-b-36 p-t-15">
							
						</h4> 
						Main Category :
						<div class="bo4 of-hidden size15 m-b-20">
							<input class="sizefull s-text7 p-l-22 p-r-22" type="text" name="mc" value="<%= productDetailList.get(i).getMc_id() %>" disabled>
						</div>
						
						Sub Category :
						<div class="bo4 of-hidden size15 m-b-20">
							<input class="sizefull s-text7 p-l-22 p-r-22" type="text" name="sc" value="<%= productDetailList.get(i).getSc_id() %>" disabled>
						</div>
						<input type="hidden" name="pid" value="<%=productDetailList.get(i).getS_no()%>">
						
						<div class="bo4 of-hidden size15 m-b-20">
							<input class="sizefull s-text7 p-l-22 p-r-22" type="text" name="pname" value="<%= productDetailList.get(i).getP_name() %>" placeholder="Product Name" required>
						</div>

						<div class="bo4 of-hidden size15 m-b-20">
							<input class="sizefull s-text7 p-l-22 p-r-22" type="text" name="ptype" value="<%= productDetailList.get(i).getP_type() %>" placeholder="Product Type" required>
						</div>

						<div class="bo4 of-hidden size15 m-b-20">
							<input class="sizefull s-text7 p-l-22 p-r-22" type="text" name="pdes" value="<%= productDetailList.get(i).getP_des() %>" placeholder="Product Description" required>
						</div>
						
						
						<div class="bo4 of-hidden size15 m-b-20">
							<input class="sizefull s-text7 p-l-22 p-r-22" type="text" name="pmrp" value="<%= productDetailList.get(i).getP_mrp() %>" placeholder="Product Price" required>
						</div>
						
						
						<input type="hidden" name="form" value="updateproductdetailsoperation">
						
						<div class="w-size25">
							<!-- Button -->
							<button class="flex-c-m size2 bg1 bo-rad-23 hov1 m-text3 trans-0-4">
								Update Product
							</button>
						</div>
					</form>
				</div>
				<div class="col-md-1"></div>
				<div class="col-md-3">
				<h4 class="m-text26 p-b-36 p-t-15">
							Product Pic
						</h4>
				<img src="<%=request.getContextPath() +"/images/product/"+productDetailList.get(i).getP_image()%>" style="width:200px ; height:200px" alt="IMG-BENNER"><br>
				<br>
				<form action="AdminController" method="post" enctype="multipart/form-data">
				<label for="pimage">Change Image:</label>
						<div class="row">
						<div class="bo4  size13 m-l-15" style="max-width: 500px;">
							<input class="sizefull s-text7 m-r-10  p-t-7" type="file"  name="pimage" required>
							<input type="hidden" name="pid" value="<%=productDetailList.get(i).getS_no()%>">
							<input type="hidden" name="form" value="updateProductImageOperation">
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
