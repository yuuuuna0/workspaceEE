<%@page import="com.itwill.bookbread.service.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	boolean existedUser=false;
	String msg = "";
	String userId = request.getParameter("userId");
	if(userId==null||userId.equals("")){
		userId="";
		msg="";
		existedUser=true;
	}else{
		MemberService memberService = new MemberService();
		existedUser = memberService.existedUser(userId);
		if(existedUser){
			msg="사용 불가능한 아이디입니다";
		}else {
			msg="사용 가능한 아이디입니다";
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복 체크</title>

<script type="text/javascript">
	function idCheck() {
		var userId=document.getElementById("userId").value;
		if(userId==null|| userId==''){
			alert('사용하실 아이디를 입력하세요');
			return;
		}
		document.getElementById('checkForm').action="member_id_check_form.jsp";
		document.getElementById('checkForm').method='POST';
		document.getElementById('checkForm').submit();
	}
	
	function sendCheckValue() {
		opener.document.f.userId.value = window.document.getElementById('userId').value;
		window.close();
	}
</script>

</head>
<body>

	<div id="chk">
		<form id="checkForm">
			<input type="text" name="userId" id="userId" value="<%=userId%>">
			<input type="button" value="ID중복확인" onClick="idCheck()">
		</form>
		<div id="msg"><%=msg %></div>
		<br>
		<input id="cancelBtn" type="button" value="취소" onClick="window.close();">
		<%if(!existedUser){ %>
		<input id="useBtn" type="button" value="사용하기" onClick="sendCheckValue();">
		<%} %>
	</div>

</body>
</html>