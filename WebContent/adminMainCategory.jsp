<%@include file="includes/adminheader.jsp" %>
<%@ page import="java.util.List" %>
<%@ page import="com.store.entity.MainCategory" %>


	<!-- Title Page -->
	<section class="bg-title-page p-t-40 p-b-50 flex-col-c-m" style="background-image: url(images/adminback.jpg);">
		<h2 class="l-text2 t-center">
			Add Product
		</h2>
	</section>

<br><br>
<div class="container mtb">
	
			<div class="row">
	
			<%
			String tempurl;
			List<MainCategory> mList = (List)request.getAttribute("mList"); 
			for(int i=0;i<mList.size(); i++){ tempurl = request.getContextPath()+"/AdminController?page=subcatlist"+
					"&mcId="+mList.get(i).getS_no()+
					"&mcName="+mList.get(i).getC_name().replace("&", "and");
					
						
						%>
				
				<div class="col-lg-2 col-lg-offset-1" style=" height:200px; ">
				<a href="<%=""+tempurl+"" %>">
						
				<img src="<%=request.getContextPath() + "/images/mainCategory/"+mList.get(i).getS_no()+".jpg"%>" class="img-responsive"style= "height:100px;width:100%"><br>
				<center ><b> </a>
				<%= mList.get(i).getS_no() %> </b></center>
				<center>
				<%= mList.get(i).getC_name()%> </center> 
				</div>
				<% }%>
			
		 	</div>
	
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
