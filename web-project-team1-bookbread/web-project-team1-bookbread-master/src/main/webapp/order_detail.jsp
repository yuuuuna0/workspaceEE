
<%@page import="com.itwill.bookbread.service.MemberService"%>
<%@page import="com.itwill.bookbread.dto.OrderItem"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.bookbread.dto.Orders"%>
<%@page import="com.itwill.bookbread.service.OrdersService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="login_check.jspf"%>
<%
String o_noStr=request.getParameter("o_no");
if(o_noStr==null|| o_noStr.equals("")){
	response.sendRedirect("order_list.jsp");
	return;
}
OrdersService ordersService= new OrdersService();
Orders order = ordersService.detail(sUserId, Integer.parseInt(o_noStr));
MemberService memberService = new MemberService();
Member member = memberService.findMember(sUserId);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<script type="text/javascript">
function deleteSelect() {
	if(window.confirm('주문내역을 삭제하시겠습니까?')){
		
	f.action="order_delete_action.jsp";
	f.method='POST';
	f.submit();
	 alert('주문내역을 삭제하였습니다.');
	
	}
}




</script>

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
						
						<td align="center" class=t1><font size=4 color=#000000><b>주문상세</b></font></td>
							</table>
							
							</table> <!--form-->
							<br>
							<br>
							<form name="f" method="post" action="order_delete_action.jspß">
							<input type="hidden" name="o_no" value="<%=order.getO_no()%>"></input>
								<table align=center width=80%  border="0" cellpadding="0"
									cellspacing="1" bgcolor="BBBBBB">
									<tr>
										<td width=250 height=35 bgcolor=#ffe18f align=center class=t1><font color=#8d8d8d>주문번호</font></td>
										<td width=250 height=35 bgcolor=#ffe18f align=center class=t1><font color=#8d8d8d>주문날짜</font></td>
										<td width=250 height=35 bgcolor=#ffe18f align=center class=t1><font color=#8d8d8d>주문자</font></td>
										<td width=250 height=35 bgcolor=#ffe18f align=center class=t1><font color=#8d8d8d>주문가격</font></td>
										<td width=250 height=35 bgcolor=#ffe18f align=center class=t1><font color=#8d8d8d>배송지</font></td>
									
									</tr>
									<%
										int tot_final_price=0;
										tot_final_price=order.getO_price();
										if(tot_final_price<50000){ 
												tot_final_price=tot_final_price+2500;
										}else{
											
										}
										 %>
									<tr>
										<td width=145 height=40 align=center bgcolor="ffffff" class=t1><%=order.getO_no()%></td>
										<td width=145 height=40 align=center bgcolor="ffffff" class=t1><%=order.getO_date()%></td>
										<td width=112 height=40 align=center bgcolor="ffffff" class=t1><%=order.getUserId()%></td>
										
										<td width=112 height=40 align=center bgcolor="ffffff" class=t1><%=new DecimalFormat("#,###").format(tot_final_price)%></td>
										<td width=112 height=40 align=center bgcolor="ffffff" class=t1><%=member.getAddress()%></td>
										
									</tr>
									
								</table>
<br>
<br>
<br>
<br>
<br>
	<table align=center width=80%  border="0" cellpadding="0"
									cellspacing="1" bgcolor="BBBBBB">
									<tr>
									<td width=250 height=35 bgcolor=#ffe18f align=center class=t1><font color=#8d8d8d></font></td>
										<td width=250 height=35 bgcolor=#ffe18f align=center class=t1><font color=#8d8d8d>책 제목</font></td>
										<td width=250 height=35 bgcolor=#ffe18f align=center class=t1><font color=#8d8d8d>수량</font></td>
										<td width=250 height=35 bgcolor=#ffe18f align=center class=t1><font color=#8d8d8d>가격</font></td>
										
									
									</tr>
									<%
									int tot_price=0;
									for(OrderItem orderItem : order.getOrderItemList()){
										tot_price+=orderItem.getOi_qty()*orderItem.getProduct().getP_price();
									
									%>
									<tr>
									
									<td width=136 height=40 align=center bgcolor="ffffff" class=t1><img border=0 src='images/<%=orderItem.getProduct().getP_image()%>' style="width:130px;"></td>
									<td width=145 height=40 align=center bgcolor="ffffff" class=t1><a href="product_detail.jsp?p_no=<%=orderItem.getProduct().getP_no()%>"><%=orderItem.getProduct().getP_name()%></a></td>
								
										<td width=145 height=40 align=center bgcolor="ffffff" class=t1><%=orderItem.getOi_qty()%></td>
										<td width=112 height=40 align=center bgcolor="ffffff" class=t1><%=new DecimalFormat("#,###").format(orderItem.getProduct().getP_price())%></td>

									</tr>
<%} %>
</table>
		</form>
<br>
<br>
<br>
<br>
<table align=center border="0" cellpadding="0"
								cellspacing="1" width="400">
								<tr>
									<td align=center>&nbsp;
										<a href="order_list.jsp">목록으로 가기</a>
									</td>
									<td align=center>&nbsp;
										총 주문금액 : <%=new DecimalFormat("#,###").format(tot_final_price)%></a> 
									</td>
									<td width=136 height=40 align=center bgcolor="ffffff" class=t1>
												<a href = "javascript:deleteSelect();">삭제</a>
										</td>
									
								</tr>
							</table>



</div>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>   
<br>
			<!-- include_content.jsp end-->
			<!-- content end -->
		</div>
		<!--wrapper end-->
		<div id="footer">
			<!-- include_common_bottom.jsp start-->
			<jsp:include page="include_common_bottom.jsp"/>
			<!-- include_common_bottom.jsp end-->
		</div>
	</div>
	<!--container end-->

</body>
</html>
