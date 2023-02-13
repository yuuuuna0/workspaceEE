<%@page import="com.itwill.bookbread.dto.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.bookbread.service.ProductService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
/*
if(request.getMethod().equalsIgnoreCase("GET")){
	response.sendRedirect("shop_main.jsp");
	return;
}
*/
ProductService productService = new ProductService();
List<Product> productList = productService.selectAll();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Delicious Book List</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<!-- Google Font -->
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700|Raleway:400,300,500,700,600'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.css"
	type="text/css">
<!-- Theme Stylesheet -->
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/responsive.css">
<link rel="stylesheet" href="css/newtext.css">
</head>
<script type="text/javascript">
function date_array(){
	
	var date_array_list = document.getElementById("publish_date");
	date_array_list.sort();
	
}

</script>
<body onload="date_array();">
	<!-- include_common_top_menu.jsp start-->
	<jsp:include page="include_common_top_menu.jsp" />
	<!-- include_common_top_menu.jsp end-->
	<!-- include_common_top.jsp start-->
	<jsp:include page="include_common_top.jsp" />
		<jsp:include page="html/mouse_effect.html"/>
	<!-- include_common_top.jsp end-->
<div class="slider">
<div class="container">
<div class="row">
<br>
	<table style="margin: auto" border=0 width=70% align=center>
		<tr valign=bottom>
			<td width=30% align="center" class=t1><font size=5 color=#000000><img src="image/bread.png" style="width:40px; height:20px;">&nbsp;&nbsp;<b>이&nbsp;달의&nbsp;신규도서&nbsp;</b>&nbsp;&nbsp;<img src="image/bread.png" style="width:40px; height:20px;"></font></td>
	</table>
	<br>
	<br>
	<%
	int product_size=productList.size();
	int product_column_size=4;
	int product_line_count = 1;
	String check_date="2021-07-01";
	for(int i = 0; i<productList.size(); i++){
				Product product = productList.get(i);			
					if(product.getP_publish_date().compareTo(check_date)<0){
						
					}else if(product.getP_publish_date().compareTo(check_date)>0){
						Product newProduct = product;
	%>
	
	<%
	if(i%product_column_size==0){}
	%>
		<div class="col-md-4 col-sm-4">
			<div class="slider small-slider">
				<div id="small-featured" class="carousel slide" data-ride="carousel">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#small-featured" data-slide-to="0" class="active"></li>
					</ol>
					<!-- Wrapper for slides -->
					<div class="txt" align=center>
					
  <span>n</span>
  <span>e</span>
  <span>w</span>
  <span>!</span>
  
</div>
<br>

					<div class="carousel-inner" role="listbox">
					<input type="hidden" id="publish_date" value="<%=newProduct.getP_publish_date()%>">
						<div class="item active" style="background-image: url('images/<%=newProduct.getP_image()%>')">
						
							<div class="carousel-caption">
								<a href="product_detail.jsp?p_no=<%=newProduct.getP_no()%>" class="btn btn-theme">자세히&nbsp;&nbsp;&nbsp;&nbsp;</a>
							</div>
						</div>
					</div>
				</div>
		<h1>&nbsp;</h1>
			</div>
			<%if(i%product_column_size==3){}%>
		</div>
		<%} %>
		<%} %>
</div>
</div>
</div>
	<!-- jQuery Library -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
	<!-- Latest compiled and minified JavaScript -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<!-- Script -->
	<script src="js/script.js"></script>
	<h1>&nbsp;</h1>
	<div id="footer">
		<!-- include_common_bottom.jsp start-->
		<jsp:include page="include_common_bottom.jsp" />
		<!-- include_common_bottom.jsp end-->
	</div>
</body>
</html>