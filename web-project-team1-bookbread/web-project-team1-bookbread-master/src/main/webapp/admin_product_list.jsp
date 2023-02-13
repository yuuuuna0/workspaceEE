<%@page import="com.itwill.bookbread.dto.Product"%>
<%@page import="com.itwill.bookbread.service.ProductService"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="login_check.jspf"%>
<%
ProductService productService = new ProductService();
List<Product> productList = productService.selectAll();
%>

<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Delicious Book Admin</title>
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

</head>
<body>
	<!-- include_common_top_menu.jsp start-->
	<jsp:include page="include_common_top_menu.jsp" />
	<!-- include_common_top_menu.jsp end-->
	<!-- include_common_top.jsp start-->
	<jsp:include page="include_common_top.jsp" />
	<!-- include_common_top.jsp end-->

	<table style="margin: auto" border=0 width=80% height=400 align=center>
		<tr valign=middle>
			<td width=5% align=center class=t1><font size=2 color=#000000><b>도서
						번호</b></font></td>
			<td width=10% align=center class=t1><font size=2 color=#000000><b>도서
						이름</b></font></td>
			<td width=5% align=center class=t1><font size=2 color=#000000><b>저
						자</b></font></td>
			<td width=5% align=center class=t1><font size=2 color=#000000><b>출판사</b></font></td>
			<td width=10% align=center class=t1><font size=2 color=#000000><b>출판일</b></font></td>
			<td width=5% align=center class=t1><font size=2 color=#000000><b>도서
						가격</b></font></td>
			<td width=45% align=center class=t1><font size=2 color=#000000><b>도서
						소개</b></font></td>
			<td width=5% align=center class=t1><font size=2 color=#000000><b>분류
						번호</b></font></td>
			<td width=5% align=center class=t1><font size=2 color=#000000><b>도서
						종류</b></font></td>
			<td width=5% align=center class=t1><font size=2 color=#000000><b>비
						고</b></font></td>
		</tr>
		<tr width=100%>
			<td colspan=3 height=5><hr color=#556b2f></td>
		</tr>
		<%
		for (int i = 0; i < productList.size(); i++) {
		%>

		<form method="post" name="f">
			<tr valign=top>
				<td width=120 align=center class=t1><font size=2 color=#000000><input
						type="hidden" name="pno" readonly
						value="<%=productList.get(i).getP_no()%>" /><b><%=productList.get(i).getP_no()%></b></td>
				<td width=120 align=center class=t1><font size=2 color=#000000><input
						type="hidden" name="pname" readonly
						value="<%=productList.get(i).getP_name()%>" /><b><%=productList.get(i).getP_name()%></b></td>
				<td width=120 align=center class=t1><font size=2 color=#000000><input
						type="hidden" name="pauthor" readonly
						value="<%=productList.get(i).getP_author()%>" /><b><%=productList.get(i).getP_author()%></b></td>
				<td width=400 align=center class=t1><font size=2 color=#000000><input
						type="hidden" name="ppublisher" readonly
						value="<%=productList.get(i).getP_publisher()%>" /><b><%=productList.get(i).getP_publisher()%></b></font></td>
				<td width=120 align=center class=t1><font size=2 color=#000000><input
						type="hidden" name="ppublishdate" readonly
						value="<%=productList.get(i).getP_publish_date()%>" /><b><%=productList.get(i).getP_publish_date()%></b></font></td>
				<td width=120 align=center class=t1><font size=2 color=#000000><input
						type="hidden" name="pprice" readonly
						value="<%=productList.get(i).getP_price()%>" /><b><%=productList.get(i).getP_price()%></b></font></td>
				<td width=120 align=center class=t1 style="text-overflow: ellipsis;"><font
					size=2 color=#000000><input type="hidden" name="pdetail"
						readonly value="<%=productList.get(i).getP_detail()%>" /><b><%=productList.get(i).getP_detail()%></b></font></td>
				<td width=120 align=center class=t1 style="text-overflow: ellipsis;"><font
					size=2 color=#000000><input type="hidden" name="ptypeno"
						readonly
						value="<%=productList.get(i).getBookType().getType_no()%>" /><b><%=productList.get(i).getBookType().getType_no()%></b></font></td>
				<td width=120 align=center class=t1><font size=2 color=#000000><input
						type="hidden" name="ptype" readonly
						value="<%=productList.get(i).getBookType().getP_type()%>" /><b><%=productList.get(i).getBookType().getP_type()%></b></font></td>
				<td align=center class=t1><input type=submit value="수정"
					onclick="javascript: form.action='admin_product_modify_form.jsp';" />
					<input type=submit
					onclick="javascript: form.action='admin_product_remove_action.jsp';"
					value="삭제" /></td>
			</tr>
		</form>


		<%
		}
		%>
	</table>
	<table style="margin: auto" height=100 align=center>
		<tr>
			<td align=center class=t1><input type=submit value="신규도서 추가하기"
				onClick="location.href='admin_product_insert_form.jsp';"/></td></tr>
	</table>
	



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
