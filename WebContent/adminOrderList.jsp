<%@include file="includes/adminheader.jsp" %>
<%@ page import="com.store.entity.Order" %>
  <%@ page import="java.util.List" %>
<section class="bg-title-page p-t-40 p-b-50 flex-col-c-m" style="background-image: url(images/adminback.jpg);">
		<h2 class="l-text2 t-center">
			Order List !!!
		</h2>
	</section>

<section class="cart bgwhite p-t-70 p-b-100">
		<div class="container">
			<!-- Cart item -->
			<div class="container-table-cart pos-relative">
				<div class="wrap-table-shopping-cart bgwhite">
					<table class="table-shopping-cart">
				
						<tr class="table-head">
							<th >Order id</th>
							
							<th >Order Date</th>
	
							<th ><center>Name</center></th>
							<th ><center>Address</center></th>
							<th ><center>Contact</center></th>
							<th ><center>User Id</center></th>
							<th ><center>PayMode</center></th>
							<th ><center>Status</center></th>
							<th ></th>
						</tr>
							<%
						String tempurl;
						List<Order> oList = (List)request.getAttribute("oList");
		
						for(int i=0;i<oList.size(); i++){ 
							tempurl = request.getContextPath()+"/AdminController?page=orderedProductDetail"+
									"&oid="+oList.get(i).getOrder_id();
						
							%>
						<tr class="table-row">
							<td style="width:80px; padding-left:20px;"><%=oList.get(i).getOrder_id() %></td>
							
							<td style="width: 100px;"><%=oList.get(i).getOrder_date() %></td>
							<td style="width: 150px;"><center><%=oList.get(i).getName() %></center></td>
							<td style="width: 200px;"><center><%=oList.get(i).getAddress()%></center></td>
							<td style="width: 120px;"><center><%=oList.get(i).getContact()%></center></td>
							<td style="width: 120px;"><center><%=oList.get(i).getUid()%></center></td>
							<td style="width: 80px;"><center><%=oList.get(i).getPay_mode() %></center></td>
							
							<th style="width: 90px; color: green;"><center><%if(oList.get(i).getStatus()==0){%>
							Order Received 
							<%} %>
							<th style="width: 70px;"><center><a href=<%=""+tempurl+""%> >See more Details</a></center></th>
						</tr>
<%} %>
						
					</table>
				</div>
			</div>
	
			</div>
	</section>

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
	
<!--===============================================================================================-->
	<script type="text/javascript" src="vendor/slick/slick.min.js"></script>
	<script type="text/javascript" src="js/slick-custom.js"></script>
<!--===============================================================================================-->
	<script type="text/javascript" src="vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script type="text/javascript" src="vendor/lightbox2/js/lightbox.min.js"></script>
<!--===============================================================================================-->


<!--===============================================================================================-->
	<script src="js/main.js"></script>

</body>
</html>
