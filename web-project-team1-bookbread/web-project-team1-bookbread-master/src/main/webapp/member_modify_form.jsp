<%@page import="com.itwill.bookbread.dto.BookType"%>
<%@page import="com.itwill.bookbread.dto.Product"%>
<%@page import="com.itwill.bookbread.service.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="login_check.jspf"%>
<%
/*
		if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("shop_main.jsp");
		return;
		}
*/
MemberService memberService = new MemberService();
Member member = memberService.findMember(sUserId);
Product product = new Product();
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
	function memberview() {
		f.action = "member_view.jsp";
		f.submit();
	}
	function membermain() {
		f.action = "shop_main.jsp"
		f.submit();
	}
	
	function memberModifyCheck() {
		if (f.password.value == "") {
			alert("비밀번호를 입력하세요");
			f.password.focus();
			return false;
		}
		if (f.password2.value == "") {
			alert("비밀번호확인을 입력하세요");
			f.password2.focus();
			return false;
		}
		if (f.name.value == "") {
			alert("사용자 이름을 입력하세요");
			f.name.focus();
			return false;
		}
		if (f.phone.value == "") {
			alert("전화번호를 입력하세요");
			f.phone.focus();
			return false;
		}
		if (f.birth.value == "") {
			alert("생년월일을 입력하세요");
			f.birth.focus();
			return false;
		}
		if (f.address.value == "") {
			alert("주소를 입력하세요");
			f.address.focus();
			return false;
		}
		if (f.email.value == "") {
			alert("이메일을 입력하세요");
			f.email.focus();
			return false;
		}
		if (f.password.value != f.password2.value){
			alert("비밀번호가 일치하지 않습니다.");
			f.password.focus();
			f.password.select();
			return false;
		}
		f.action = "member_modify_action.jsp";
		f.method = 'POST';
		f.submit();
		alert('수정되었습니다!');
	}
</script>


</head>
<body>
	<!-- include_common_top_menu.jsp start-->
	<jsp:include page="include_common_top_menu.jsp" />
	<!-- include_common_top_menu.jsp end-->
	<!-- include_common_top.jsp start-->
	<jsp:include page="include_common_top.jsp" />
		<jsp:include page="html/mouse_effect.html"/>
	<!-- include_common_top.jsp end-->
	<br/><br/>
		<table>
			<form name="f" method="post">
				<table align=center width="30%" border="1" cellpadding="0" bordercolor="#fff">
					<tr width="40%" height=60 align=center bgcolor="#f4bf6f" class=t1>
						<td><font color="#fff" size=4px><b>회원 정보수정</b></font></td>
					</tr>
				</table>
					
				<table align=center width="30%" border="1" cellpadding="0"
					cellspacing="1" bgcolor="BBBBBB" bordercolor="#fff">
					<tr>
						<td width="40%" height=40 align=center bgcolor="#f4bf6f" class=t1>
							<font color="#fff"><b>회원아이디</b></font>
						</td>
						<td style="padding-left: 15px"><%=member.getUserId()%></td>
					</tr>
					<tr>
						<td width=100 height=40 align=center bgcolor="#f4bf6f" class=t1>
							<font color="#fff"><b>비밀번호</b></font>
						<td style="padding-left: 15px"><input type="password" name="password"
							value="<%=member.getPassword()%>"></td>
					</tr>
					<tr>
						<td width=100 height=40 align=center bgcolor="#f4bf6f" class=t1>
							<font color="#fff"><b>비밀번호 확인</b></font>
						<td style="padding-left: 15px"><input type="password" name="password2"
							value="<%=member.getPassword()%>"></td>
					</tr>
					<tr>
						<td width=100 height=40 align=center bgcolor="#f4bf6f" class=t1>
						<font color="#fff"><b>이 름</b></font>
						</td>
						<td style="padding-left: 15px"><input type="text" name="name"
							value="<%=member.getName()%>">&nbsp;</td>
					</tr>
					<tr>
						<td width=100 height=40 align=center bgcolor="#f4bf6f" class=t1>
						<font color="#fff"><b>전화번호</b></font>
						</td>
						<td style="padding-left: 15px"><input type="text" name="phone"
							value="<%=member.getPhone()%>">&nbsp;</td>
					</tr>
					<tr>
						<td width=100 height=40 align=center bgcolor="#f4bf6f" class=t1>
						<font color="#fff"><b>생년월일</b></font>
						</td>
						<td style="padding-left: 15px"><input type="text" name="birth"
							value="<%=member.getBirth()%>">&nbsp;</td>
					</tr>
					<tr>
						<td width=100 height=40 align=center bgcolor="#f4bf6f" class=t1>
						<font color="#fff"><b>주 소</b></font>
						</td>
						<td style="padding-left: 15px"><input type="text" name="address"
							value="<%=member.getAddress()%>">&nbsp;</td>
					</tr>
					<tr>
						<td width=100 height=40 align=center bgcolor="#f4bf6f" class=t1>
						<font color="#fff"><b>이메일</b></font>
						</td>
						<td style="padding-left: 15px"><input type="text" name="email"
							value="<%=member.getEmail()%>">&nbsp;</td>
					</tr>
					<tr>
						<td width=100 height=40 align=center bgcolor="#f4bf6f" class=t1>
						<font color="#fff"><b>관심 도서분야</b></font>
						</td>
						<td style="padding-left: 15px">
						
						<input type="radio" name="interest" value="소설"  checked
						<% if(member.getInterest().equalsIgnoreCase("소설")){%>checked<%}%>>소설&nbsp;
						<input type="radio" name="interest" value="경영경제" 
						<% if(member.getInterest().equalsIgnoreCase("경영경제")){%>checked<%}%>>경영경제&nbsp;
						<input type="radio" name="interest" value="어린이" 
						<% if(member.getInterest().equalsIgnoreCase("어린이")){%>checked<%}%>>어린이&nbsp;
						<input type="radio" name="interest" value="교육" 
						<% if(member.getInterest().equalsIgnoreCase("교육")){%>checked<%}%>>교육&nbsp;
						</td>


					</tr>
				</table>
	</form>
	<br/><br/>
	<table align=center >
		<tr>
			<td><input type="button" value="수정"
						onClick="memberModifyCheck();">&nbsp;</td>
			<td><input type="button" value="돌아가기" onClick="memberview();">&nbsp;</td>
			<td><input type="button" value="메인" onClick="membermain();">&nbsp;</td>
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
