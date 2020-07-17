<%@include file="includes/adminheader.jsp" %>
<%@ page import="java.util.List" %>
<%@ page import="com.store.entity.MainCategory" %>

<script type="text/javascript">


</script>
	<!-- Title Page -->
	<section class="bg-title-page p-t-40 p-b-50 flex-col-c-m" style="background-image: url(images/adminback.jpg);">
		<h2 class="l-text2 t-center">
			Fill Product Details
		</h2>
	</section>

	<section class="bgwhite p-t-66 p-b-60">
		<div class="container">
			<div class="row">
			<div class="col-md-3 p-b-30"></div>
				<div class="col-md-6 p-b-30">
					<form  action="AdminController" method="post" enctype="multipart/form-data" >
						<h4 class="m-text26 p-b-36 p-t-15">
							
						</h4> 
						Main Category :
						<div class="bo4 of-hidden size15 m-b-20 p-t-15 p-l-10">
						
							
							<%=request.getParameter("mcName") %>
							 
						</div>
						
						Sub Category :
						<div class="bo4 of-hidden size15 m-b-20 p-t-15 p-l-10">
						
							
								<%=request.getParameter("scName") %>
							 
						</div>
						
						
						<div class="bo4 of-hidden size15 m-b-20">
							<input class="sizefull s-text7 p-l-22 p-r-22" type="text" name="pname" placeholder="Product Name" required>
						</div>

						<div class="bo4 of-hidden size15 m-b-20">
							<input class="sizefull s-text7 p-l-22 p-r-22" type="text" name="ptype" placeholder="Product Type" required>
						</div>

						<div class="bo4 of-hidden size15 m-b-20">
							<input class="sizefull s-text7 p-l-22 p-r-22" type="text" name="pdes" placeholder="Product Description" required>
						</div>
						
						
						<div class="bo4 of-hidden size15 m-b-20">
							<input class="sizefull s-text7 p-l-22 p-r-22" type="text" name="pmrp" placeholder="Product Price" required>
						</div>
						<label for="pimage">Select Product Image:</label>
						<div class="bo4 of-hidden  size15 m-b-20">
							<input class="sizefull s-text7  p-t-12" type="file"  name="pimage" required>
						</div>
						
						
						<input type="hidden" name="sellerid" value="<%=session.getAttribute("sid")%>">
						<input type="hidden" name="scid" value="<%=request.getParameter("scId") %>">
						<input type="hidden" name="mcid" value="<%=request.getParameter("mcId") %>">
						<input type="hidden" name="mcName" value="<%=request.getParameter("mcName") %>">
						<input type="hidden" name="scName" value="<%=request.getParameter("scName") %>">
						<input type="hidden" name="form" value="AddProductOperation">
						
						<div class="w-size25">
							<!-- Button -->
							<button class="flex-c-m size2 bg1 bo-rad-23 hov1 m-text3 trans-0-4">
								Add Product
							</button>
						</div>
					</form>
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
