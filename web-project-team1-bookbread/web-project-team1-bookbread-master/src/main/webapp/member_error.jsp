<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>책빵</title>
<meta http-equiv='Content-Type' content='text/html; charset=euc-kr'>
<link href='/challenge/neo_include/good2.css' rel='stylesheet'
	type='text/css'>
<script Language='JavaScript' >
function mainBack() {
	f.action = "shop_main.jsp";
	f.submit();
}
</script>
</head>


<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
	<br>
	<br>
	<br>
	<br>
	<br>
	<center>
		<table width="200" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td><img
					src="image/BookBreadLogo.png"
					width="150" height="150"></td>
			</tr>
			<tr>
				<td align="center"
					background=""><table
						width="200" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td height="10"></td>
						</tr>
						<tr>
							<td>고객님 죄송합니다.요청하신 페이지를 찾을 수 없습니다.<%--=exception.getMessage()--%></td>
						</tr>
						<tr>
							<td></td>
						</tr>
						<tr>
							<td height="10"></td>
						</tr>
					</table></td>
			</tr>
			<tr>
				<td height="47" align="center"
					background=""><table
						width="50" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td><a href="shop_main.jsp" onclick="mainBack();"><img
									src="image/close.JPG"
									width="60" height="30" border="0"></a></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
					</table></td>
			</tr>
		</table>
	</center>
</body>
</html>
