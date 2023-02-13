
<%@page import="java.util.List"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itwill.bookbread.service.OrdersService"%>
<%@page import="com.itwill.bookbread.dto.Orders"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="login_check.jspf"%>
<%
OrdersService ordersService=new OrdersService();
List<Orders> orderList=ordersService.ordersListAll(sUserId);
%>
<!DOCTYPE html>
<html>
<script type="text/javascript">
	function order_delete_all(){
		f.method='POST';
		f.action='order_delete_all_action.jsp';
		f.submit();
	}
</script>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Delicious Book Order List</title>
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
	<jsp:include page="include_common_top_menu.jsp"/>
	<!-- include_common_top_menu.jsp end-->
	<!-- include_common_top.jsp start-->
	<jsp:include page="include_common_top.jsp"/>
		<jsp:include page="html/mouse_effect.html"/>
	<!-- include_common_top.jsp end-->
		<div id="content" align="center">
		
				<table border=0 cellpadding=0 cellspacing=0>
					<tr>
						<td><br />
						<br><br>
						<td align="center" class=t1><font size=5 color=#000000><b>주문목록</b></font></td>
							</table>
							<br>
							</table> <!--form-->
							<form name="f" method="post" action="order_delete_all_action.jsp">
								<table align=center width=80%  border="0" cellpadding="0"
									cellspacing="1" bgcolor="BBBBBB">
									<tr>
										<td width=170 height=35 align=center class=t1 bgcolor=#ffe18f><font color=#8d8d8d>주문번호</font></td>
										<td width=230 height=35 align=center class=t1 bgcolor=#ffe18f><font color=#8d8d8d>주문이름</font></td>
										<td width=200 height=35 align=center class=t1 bgcolor=#ffe18f><font color=#8d8d8d>주문날짜</font></td>
										<td width=200 height=35 align=center class=t1 bgcolor=#ffe18f><font color=#8d8d8d>주문가격</font></td>
									
										<td width=200 height=30 bgcolor=#ffe18f align=center class=t1><font></font></td>
									</tr>
									<!-- order start -->
									<%if(orderList.size()>=1){ %>
			
			<% }else{%>
			<table align=center>
			<tr>
			<td>
	        	<img src="image/emptyCart.png">
	        	</td>
	        	</tr>
			</table>
			<%} %>
									<%
									int tot_price=0;
									for (Orders orders : orderList) {
										tot_price= orders.getO_price();
										if(tot_price<50000){
											tot_price=tot_price+2500;
										}else{
										}
									%>
									<tr>
										<td width=145 height=60 align=center bgcolor="ffffff" class=t1><%=orders.getO_no()%></td>
										<td width=145 height=60 align=center bgcolor="ffffff" class=t1><%=orders.getO_desc()%></td>
										<td width=112 height=60 align=center bgcolor="ffffff" class=t1><%=new SimpleDateFormat("yyyy/MM/dd").format(orders.getO_date())%></td>
										<td width=136 height=60 align=center bgcolor="ffffff" class=t1><%=new DecimalFormat("#,###").format(tot_price)%></td>
										<td width=80 height=60 align=center bgcolor="ffffff" class=t1><a
											href="order_detail.jsp?o_no=<%=orders.getO_no()%>" class=m1>주문상세</a></td>
										
									</tr>
									<%
									}
									%>
									<!-- order end -->




								</table>
							</form> <br />
							<br>
							<br>
							<br>
							<br>
							<br>
							
							<table border="0" cellpadding="0" cellspacing="1" width="590">
								<tr>
									<td align=center>&nbsp;&nbsp;
									<a href=shop_main.jsp
										class=m1>계속 구경하기&nbsp;&nbsp;&nbsp;&nbsp;</a>
									<a href='javascript:order_delete_all();'
										class=m1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;주문전체삭제</a>
									</td>
									
								</tr>
							</table></td>
					</tr>
				</table>
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
