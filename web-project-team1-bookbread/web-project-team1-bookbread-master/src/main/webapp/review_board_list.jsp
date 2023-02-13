<%@page import="com.itwill.bookbread.dto.Product"%>
<%@page import="com.itwill.bookbread.service.MemberService"%>
<%@page import="com.itwill.bookbread.dto.ReviewBoard"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.bookbread.service.ReviewBoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="login_check.jspf"%>
<%
MemberService memberService = new MemberService();
Member member = memberService.findMember(sUserId);
/*
if(request.getMethod().equalsIgnoreCase("GET")){
	response.sendRedirect("member_view.jsp");
	return;
}
*/

ReviewBoardService reviewBoardService = new ReviewBoardService();
List<ReviewBoard> reviewBoardList = reviewBoardService.findReviewById(member.getUserId());
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>내가 쓴 리뷰</title>
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
	
	function reviewRemove() {
		if (confirm("정말 삭제하시겠습니까?")) {
			f.action = "review_board_remove_action.jsp";
			f.submit();
		}
	}
</script>


</head>
<body>
	<!-- include_common_top_menu.jsp start-->
	<jsp:include page="include_common_top_menu.jsp" />
	<!-- include_common_top_menu.jsp end-->
	<!-- include_common_top.jsp start-->
	<jsp:include page="include_common_top.jsp" />
	<jsp:include page="html/mouse_effect.html" />
	<!-- include_common_top.jsp end-->
	<br />
	<br />
	<table style="margin: auto" border=0 width="70%" height=376
		align=center>

		<tr valign=middle>
			<td width=5% align=center class=t1><font size=2 color=#000000><b>작성
						번호</b> </font></td>
			<td width=20% align=center class=t1><font size=2 color=#000000><b>도서
						이름</b> </font></td>
			<td width=15% align=center class=t1><font size=2 color=#000000><b>작성
						날짜</b></font></td>
			<td width=15% align=center class=t1><font size=2 color=#000000><b>리뷰
						제목</b></font></td>
			<td width=45% align=center class=t1><font size=2 color=#000000><b>리뷰
						내용</b></font></td>
			<td width=5% align=center class=t1><font size=2 color=#000000><b>비
						고</b></font></td>
		</tr>

		<%
		for (int i = 0; i < reviewBoardList.size(); i++) {
		%>
		<form method="post" name="f">
		<tr valign=middle>
			<td width=5% align=center class=t1><font size=2 color=#000000><input
					type="hidden" name="rno"
					value="<%=reviewBoardList.get(i).getR_no()%>"><%=reviewBoardList.get(i).getR_no()%></td>
			<td width=5% align=center class=t1><font size=2 color=#000000><b><%=reviewBoardList.get(i).getProduct().getP_name()%></b></font></td>
			<td width=15% align=center class=t1><font size=2 color=#000000><b><%=reviewBoardList.get(i).getR_date()%></b></font></td>
			<td width=15% align=center class=t1><font size=2 color=#000000><b><%=reviewBoardList.get(i).getR_title()%></b></font></td>
			<td width=55% align=center class=t1><font size=2 color=#000000><b><%=reviewBoardList.get(i).getR_content()%></b></font></td>
			<td align=center class=t1><input type=submit
				onclick="javascript: form.action='review_board_remove_action.jsp';"
				value="삭제" /></td>
		
		</tr>
		</form>
		<%
		}
		%>
	</table>
</body>
</html>