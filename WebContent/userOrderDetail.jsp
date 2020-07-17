<%@include file="includes/header.jsp" %>
 <%@ page import="com.store.entity.Product" %>
    <%@ page import="java.util.List" %>
	<!-- Title Page -->
	<h2 style="margin-top: 20px"><center>Your Order Details</center></h2>




<section class="cart bgwhite p-t-70 p-b-100">
		<div class="container">
			<!-- Cart item -->
			<div class="container-table-cart pos-relative">
				<div class="wrap-table-shopping-cart bgwhite">
					<table class="table-shopping-cart">
						<tr class="table-head">
					
							<th class="column-1"></th>
							<th class="column-2">Product</th>
							<th class="column-3">Price</th>
							<th class="column-4"><center>Quantity</center></th>
							<th class="column-5">Total</th>
						</tr>
						
				<% 
					int total=0;
				String tempurl1;
						List<Product> orderedproducts = (List)request.getAttribute("pList");
						for(int i=0;i<orderedproducts.size(); i++){ 
							
						total=total+(orderedproducts.get(i).getQty()*orderedproducts.get(i).getP_mrp());
						tempurl1 = request.getContextPath()+"/site?page=productdetail"+"&pid="+orderedproducts.get(i).getS_no();
				%>
						<tr class="table-row">
						
							<td class="column-1">
								<div class="cart-img-product b-rad-4 o-f-hidden">
									<img src="<%= request.getContextPath()+"/images/product/"+orderedproducts.get(i).getP_image() %>"  alt="IMG-PRODUCT">
								</div>
							</td>
							
							<td class="column-2"><a href=<%=""+tempurl1+"" %> class="block2-name dis-block s-text3 p-b-5"><%= orderedproducts.get(i).getP_name() %></a></td>
							
							<td class="column-3"><%= orderedproducts.get(i).getP_mrp() %></td>
							<td class="column-4 ">
							
						<center><%=orderedproducts.get(i).getQty()%></center>
							</td>
							<td class="column-5"><%= orderedproducts.get(i).getQty()*orderedproducts.get(i).getP_mrp()%></td>
							
							
						</tr>
						
				<%} %>
			
				
				
				
				
					</table>
				</div>
			</div>




			

			<!-- Total -->
			<div class="bo9 w-size18 p-l-40 p-r-40 p-t-30 p-b-38 m-t-30 m-r-0 m-l-auto p-lr-15-sm">
				<h5 class="m-text20 p-b-24">
					Cart Totals
				</h5>

				<div class="flex-w flex-sb-m p-t-26 p-b-30">
					<span class="m-text22 w-size19 w-full-sm">
						Total: 
					</span>

					<span class="m-text21 w-size20 w-full-sm">
						<%=total %> INR
					</span>
				</div>

				
			</div></div>
		
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
	<script src="js/main.js"></script>

</body>
</html>
