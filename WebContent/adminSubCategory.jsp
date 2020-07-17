<%@include file="includes/adminheader.jsp" %>
<%@ page import="java.util.List" %>
<%@ page import="com.store.entity.Subcategory" %>


	<!-- Title Page -->
	<section class="bg-title-page p-t-40 p-b-50 flex-col-c-m" style="background-image: url(images/adminback.jpg);">
		<h2 class="l-text2 t-center">
			Add Product in ${param.mcName}
		</h2>
	</section>

<br><br>
<div class="container ">
	
			<div class="col-lg-6 m-l-200  ">
			
			<form>
			<input type="hidden" name="mcId" value="${param.mcId}">
			<input type="hidden" name="mcName" value="${param.mcName}"></form>
			<h3><b>SubCategory List:</b></h3><br><br>
			<%
			String tempurl;
			List<Subcategory> subList = (List)request.getAttribute("subList"); 
			for(int i=0;i<subList.size(); i++){ tempurl = request.getContextPath()+"/AdminController?page=adminproductdetail"+
					"&scId="+subList.get(i).getS_no()+
					"&scName="+subList.get(i).getSc_name()+
					"&mcId="+subList.get(i).getMc_id()
					+
					"&mcName="+request.getParameter("mcName").replace("&","and");%>
					
					
						
						
						
						<div class="list-group "> 
						<a href="<%=""+tempurl+"" %>">
  <button type="button" class="list-group-item list-group-item-action ">
 <%= subList.get(i).getSc_name()%>
  </button></a>

</div>
				<% }%>
			
		 	</div>
	<br><br><br><br>
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
