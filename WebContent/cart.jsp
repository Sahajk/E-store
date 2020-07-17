

<%@include file="includes/header.jsp" %>
 <%@ page import="com.store.entity.Cart" %>
    <%@ page import="java.util.List" %>
	<!-- Title Page -->
	<section class="bg-title-page p-t-40 p-b-50 flex-col-c-m" style="background-image: url(images/cart.jpg);">
		<h2 class="l-text2 t-center">
			Cart
		</h2>
	</section>

	<!-- Cart -->
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
							<th class="column-4 p-l-35">Quantity</th>
							<th class="column-5">Total</th>
							<th class="column-6"></th>
						</tr>
						
				<% String tempurl1;
					String tempURLDelete;
					int total=0;
						List<Cart> cartproducts = (List)request.getAttribute("cartproducts");
						for(int i=0;i<cartproducts.size(); i++){ 
							tempurl1 = request.getContextPath()+"/site?page=productdetail"+"&pid="+cartproducts.get(i).getPid();
							tempURLDelete = request.getContextPath()+"/site?page=deleteitem"+
									"&cartsno="+cartproducts.get(i).getS_no();
						total=total+(cartproducts.get(i).getQty()*cartproducts.get(i).getPmrp());
				%>
						<tr class="table-row">
						
							<td class="column-1">
								<div class="cart-img-product b-rad-4 o-f-hidden">
									<img src="<%= request.getContextPath()+"/images/product/"+cartproducts.get(i).getPimage() %>"  alt="IMG-PRODUCT">
								</div>
							</td>
							
							<td class="column-2"><a href=<%=""+tempurl1+"" %> class="block2-name dis-block s-text3 p-b-5"><%= cartproducts.get(i).getPname() %></a></td>
							
							<td class="column-3"><%= cartproducts.get(i).getPmrp() %></td>
							<td class="column-4 ">
							
								<div class="flex-w bo5 of-hidden w-size17" >
								<form action="operation" method="post">
							<input type="hidden" name="form" value="updatecartdec">
							<input type="hidden" name="sno" value="<%=cartproducts.get(i).getS_no()%>">
							<input type="hidden" name="qty" value="<%=cartproducts.get(i).getQty()%>">
							<%if(cartproducts.get(i).getQty()==1){ %>
									 <button class=" color1 flex-c-m size7 bg8 eff2" disabled >
										<i class="fs-12 fa fa-minus" aria-hidden="true"></i>
									</button>
									<%}else { %>
									<button class=" color1 flex-c-m size7 bg8 eff2"  >
										<i class="fs-12 fa fa-minus" aria-hidden="true"></i>
									</button>
									<%} %>
								</form>
								
									<input class="size8 m-text18 t-center num-product" name="showqty" id="showqty" value="<%=cartproducts.get(i).getQty()%>">
							<form action="operation" method="post">
							<input type="hidden" name="form" value="updatecartinc">
							<input type="hidden" name="sno" value="<%=cartproducts.get(i).getS_no()%>">
							<input type="hidden" name="qty" value="<%=cartproducts.get(i).getQty()%>">
									<button class=" color1 flex-c-m size7 bg8 eff2"  >
										<i class="fs-12 fa fa-plus" aria-hidden="true"></i>
									</button>
									
								</div> </form>
							<%--<center><%=cartproducts.get(i).getQty()%></center>--%>
							</td>
							<td class="column-5"><%=cartproducts.get(i).getQty()*cartproducts.get(i).getPmrp()%></td>
							
							<td class="column-6">
							<a href=<%=""+tempURLDelete+"" %> class="block2-name dis-block s-text3 p-b-5"> 
							
										<i class="fs-12 fa fa-times color1 flex-c-m size7 bg8 eff2" aria-hidden="true"></i>
									</a>
							</td>
						</tr>
						
				<%} if(cartproducts.size()==0){%>
					<tr class="table-row">
							
							<td class="column-2"><center><h3>Cart Is empty</h3></center></td>
						
						</tr>
							
				<% }%>
			
				
				
				
				
					</table>
				</div>
			</div>

<form action="operation" method="post">
<div class="row">

<div class="col-lg-6">

<div class="bo9 w-size18 p-l-40 p-r-40 p-t-30 p-b-10 m-t-30  p-lr-15-sm">
				<h5 class="m-text20 p-b-24">
					Delivery Details
				</h5>

				<div class="bo4 of-hidden size15 m-b-20">
							<input class="sizefull s-text7 p-l-22 p-r-22" type="text" name="name" placeholder="Full Name" required>
						</div>
						<div class="m-b-20">
							<textarea class="sizefull s-text7 p-l-22 p-r-22" rows="4" name="address"placeholder="Address"required></textarea>
						</div>
						<div class="bo4 of-hidden size15 m-b-20">
							<input class="sizefull s-text7 p-l-22 p-r-22" type="text" name="phone" placeholder="Phone Number"required>
						</div>
						<input type="hidden" name="form" value="checkout">
						<p>Payment:</p>
					    <label class="radio-inline">
					      <input type="radio" name="optradio" value="Cod" checked> COD
					    </label> <br>
					    <label class="radio-inline" >
					      <input type="radio" name="optradio" value="Online"> ONLINE
				
</div>

</div>
			
<div class="col-lg-6">
			<!-- Total -->
			<div class="bo9 w-size18 p-l-40 p-r-40 p-t-30 p-b-38 m-t-30 m-r-0 m-l-auto p-lr-15-sm">
				<h5 class="m-text20 p-b-24">
					Cart Totals
				</h5>

				<!--  -->
				<div class="flex-w flex-sb-m p-b-12">
					<span class="s-text18 w-size19 w-full-sm">
						Subtotal:
					</span>

					<span class="m-text21 w-size20 w-full-sm">
						<%=total %> INR
					</span>
				</div>

				<!--  -->
				<div class="flex-w flex-sb bo10 p-t-15 p-b-20">
					<span class="s-text18 w-size19 w-full-sm">
						Shipping:
					</span>

					<div class="w-size20 w-full-sm">
						<span class="s-text19">
							Free
						</span>
					</div>
				</div>

				<!--  -->
				<div class="flex-w flex-sb-m p-t-26 p-b-30">
					<span class="m-text22 w-size19 w-full-sm">
						Total: 
					</span>

					<span class="m-text21 w-size20 w-full-sm">
						<%=total %> INR
					</span>
				</div>

				<div class="size15 trans-0-4">
					<!-- Button -->
					<% if(cartproducts.size()==0){ %>
					<button class="flex-c-m sizefull bg1 bo-rad-23 hov1 s-text1 trans-0-4" disabled>
						First Add Product to Cart
					</button>
					<%}else{ %>
					<button class="flex-c-m sizefull bg1 bo-rad-23 hov1 s-text1 trans-0-4">
						Proceed to Checkout
					</button>
					<%} %>
				</div>
			</div></div></div>
		</form></div>
		
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
