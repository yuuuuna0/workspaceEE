<%@page import="com.itwill.bookbread.service.ProductService"%>
<%@page import="com.itwill.bookbread.dto.Member"%>
<%@page import="com.itwill.bookbread.dto.BookType"%>
<%@page import="com.itwill.bookbread.dto.Product"%>
<%@page import="com.itwill.bookbread.service.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
/*
		if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("shop_main.jsp");
		return;
		}
*/

String pnoStr = request.getParameter("pno");
String pname = request.getParameter("pname");
String pauthor = request.getParameter("pauthor");
String ppublisher = request.getParameter("ppublisher");
String ppublishdate = request.getParameter("ppublishdate");
String pprice = request.getParameter("pprice");
String pdetail = request.getParameter("pdetail");
String ptype = request.getParameter("ptype");
String ptypenoStr = request.getParameter("ptypeno");

ProductService productService = new ProductService();
Product product = productService.selectByNO(Integer.parseInt(pnoStr));
BookType bookType = new BookType();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원정보 수정</title>
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

<script type="text/javascript">
	function adminProductView() {
		f.action = "admin_product_list.jsp";
		f.submit();
	}
	function adminMain() {
		f.action = "admin_view.jsp"
		f.submit();
	}

	function productModifyCheck() {
		if (f.pname.value == "") {
			alert("도서 이름을 입력하세요");
			f.pname.focus();
			return false;
		}
		if (f.pauthor.value == "") {
			alert("저자를 입력하세요");
			f.pauthor.focus();
			return false;
		}
		if (f.ppublisher.value == "") {
			alert("출판사를 입력하세요");
			f.ppublisher.focus();
			return false;
		}
		if (f.ppublishdate.value == "") {
			alert("출판일을 입력하세요");
			f.ppublishdate.focus();
			return false;
		}
		if (f.pprice.value == "") {
			alert("가격을 입력하세요");
			f.pprice.focus();
			return false;
		}
		if (f.pdetail.value == "") {
			alert("도서 내용을 입력하세요");
			f.pdetail.focus();
			return false;
		}
		
		f.action = "admin_product_modify_action.jsp";
		f.method = 'POST';
		f.submit();
	}
</script>


</head>
<body>
	<!-- include_common_top_menu.jsp start-->
	<jsp:include page="include_common_top_menu.jsp" />
	<!-- include_common_top_menu.jsp end-->
	<!-- include_common_top.jsp start-->
	<jsp:include page="include_common_top.jsp" />
	<!-- include_common_top.jsp end-->
	<br />
	<br />
	<table>
		<form name="f" method="post" action="admin_member_modify_action.jsp">
			<table align=center width="30%" border="1" cellpadding="0"
				bordercolor="#fff">
				<tr width="50%" height=60 align=center bgcolor="#FE2E64" class=t1>
					<td><font color="#fff" size=4px><b>도서정보수정</b></font></td>
				</tr>
			</table>
<br/>
			<table align=center width="20%" border="1" cellpadding="0"
				bgcolor="BBBBBB" bordercolor="#fff">
				<tr>
					<td width="30%" height=40 align=center bgcolor="#f4bf6f" class=t1>
						<font color="#fff"><b>도서 번호</b></font>
					</td>
					<td style="padding-left: 15px"><input type="text"
						name="pnoStr" value="<%=pnoStr%>" readonly></td>
				</tr>
				<tr>
					<td width="30%" height=40 align=center bgcolor="#f4bf6f" class=t1>
						<font color="#fff"><b>도서 이름</b></font>
					<td style="padding-left: 15px"><input type="text"
						name="pname" value="<%=pname%>"></td>
				</tr>
				<tr>
					<td width="30%" height=40 align=center bgcolor="#f4bf6f" class=t1>
						<font color="#fff"><b>저 자</b></font>
					<td style="padding-left: 15px"><input type="text"
						name="pauthor" value="<%=pauthor%>"></td>
				</tr>
				<tr>
					<td width="30%" height=40 align=center bgcolor="#f4bf6f" class=t1>
						<font color="#fff"><b>출판사</b></font>
					</td>
					<td style="padding-left: 15px"><input type="text" name="ppublisher"
						value="<%=ppublisher%>"></td>
				</tr>
				<tr>
					<td width="30%" height=40 align=center bgcolor="#f4bf6f" class=t1>
						<font color="#fff"><b>출판일</b></font>
					</td>
					<td style="padding-left: 15px"><input type="text" name="ppublishdate"
						value="<%=ppublishdate%>"></td>
				</tr>
				<tr>
					<td width="30%" height=40 align=center bgcolor="#f4bf6f" class=t1>
						<font color="#fff"><b>도서 가격</b></font>
					</td>
					<td style="padding-left: 15px"><input type="text" name="pprice"
						value="<%=pprice%>"></td>
				</tr>
				<tr>
					<td width="30%" height=40 align=center bgcolor="#f4bf6f" class=t1>
						<font color="#fff"><b>도서 소개</b></font>
					</td>
					<td style="padding-left: 15px"><input type="text" name="pdetail"
						value="<%=pdetail%>"></td>
				</tr>
				<tr>
						<td width=100 height=40 align=center bgcolor="#f4bf6f" class=t1>
						<font color="#fff"><b>도서 분야</b></font>
						</td>
						<td style="padding-left: 15px">
						
						<input type="radio" name="ptypeno" value="1"  checked
						<% if(product.getBookType().getP_type().equalsIgnoreCase("소설")){%>checked<%}%>>소설&nbsp;
						<input type="radio" name="ptypeno" value="2" 
						<% if(product.getBookType().getP_type().equalsIgnoreCase("경영경제")){%>checked<%}%>>경영경제&nbsp;
						<input type="radio" name="ptypeno" value="3" 
						<% if(product.getBookType().getP_type().equalsIgnoreCase("어린이")){%>checked<%}%>>어린이&nbsp;
						<input type="radio" name="ptypeno" value="4" 
						<% if(product.getBookType().getP_type().equalsIgnoreCase("교육")){%>checked<%}%>>교육&nbsp;
						</td>
			</table>
		</form>
		<br />
		<br />
		<table align=center>
			<tr>
				<td><input type="button" value="수정"
					onClick="productModifyCheck();">&nbsp;</td>
				<td><input type="button" value="돌아가기" onClick="adminProductView();">&nbsp;</td>
				<td><input type="button" value="메인" onClick="adminMain();">&nbsp;</td>
			</tr>
		</table>
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
