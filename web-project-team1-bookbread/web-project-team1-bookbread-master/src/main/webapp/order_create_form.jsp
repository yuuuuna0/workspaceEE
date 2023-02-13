<%@page import="java.text.DecimalFormat"%>
<%@page import="com.itwill.bookbread.dto.Product"%>
<%@page import="com.itwill.bookbread.dto.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itwill.bookbread.service.CartService"%>
<%@page import="com.itwill.bookbread.service.ProductService"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.bookbread.dto.Orders"%>
<%@page import="com.itwill.bookbread.service.OrdersService"%>
<%@page import="com.itwill.bookbread.service.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="login_check.jspf"%>
<%
/*
if(request.getMethod().equalsIgnoreCase("GET")){
	response.sendRedirect("order_list.jsp");
	return;
}
*/
String buyType = request.getParameter("buyType");
String p_noStr= request.getParameter("p_no");
String p_qtyStr = request.getParameter("p_qty");
String[] cart_no_array = request.getParameterValues("cart_item_no");
String address = request.getParameter("address");

if(buyType==null)buyType="";
if(p_noStr==null)p_noStr="";
if(p_qtyStr==null)p_qtyStr="";
if(cart_no_array==null)cart_no_array=new String[]{};
MemberService memberService = new MemberService();
Member member =memberService.findMember(sUserId);
OrdersService orderService = new OrdersService();
ProductService productService = new ProductService();
CartService cartService = new CartService();
List<Cart> cartList = new ArrayList<Cart>();


//3가지 방법 모두 카트리스트에 임시로 담아서 뽑아낸다.
if(buyType.equals("cart")){
	cartList = cartService.cartItemList(sUserId);
}else if(buyType.equals("cart_select")){
	for(String cart_no_select : cart_no_array){
		cartList.add(cartService.getCartItem(Integer.parseInt(cart_no_select)));
	}
}else if(buyType.equals("direct")){
	Product product = productService.selectByNO(Integer.parseInt(p_noStr));
	cartList.add(new Cart(0,Integer.parseInt(p_qtyStr),member,product));
}
%>

<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Delicious Book Order</title>
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
<!--
/*
수량변경
*/
/*
function cart_qty_change(){
	//alert('확인');
	var cart_qty_select = document.getElementById("cart_qty_select");
	var cart_qty_value = (cart_qty_select.options[cart_qty_select.selectedIndex].value);
	var product_price_select = update_order_count.p_price.value;
	var tot_price=0;
	tot_price=cart_qty_value*product_price_select;
	alert("cart_qty_value=" + cart_qty_value+"product_price_select="+product_price_select+
			"tot_price="+tot_price);
	/*
	for(var i=0; i<cart_qty_list.item(i).length; i++){
		var order_qty = console.log(option_values[i].value);
		var product_price = update_order_count.p_price;
		tot_price+= order_qty*product_price;
		
	}
	//tot_price=cart_qty_value*
	document.getElementById("tot_price_span").innerHTML = tot_price;
	document.getElementById("cart_item_select_count").innerHTML = cart_qty_value;
}
-->

/*
 * 팝업창을 따로 만들어도 안되는구나...
 function addressModifyAction(){
		var left = Math.ceil(( window.screen.width)/3);
		var top = Math.ceil(( window.screen.height)/3); 
		console.log(left);
		console.log(top);
		var cartWin = window.open("about:blank","cartForm","width=300,height=200,top="+top+",left="+left+",location=no, directories=no, status=no, menubar=no, scrollbars=no,copyhistory=no");
		f.action = "address_modify_action.jsp";
		f.method = 'POST';
		f.submit();
} //readonly, disabled 도 다 안됨. form을 여러개로 나눠서 이름을 줘도 안됨 ㅎ..
 */
function deliveryCheck() {
	var tot_price=0;
	tot_price = document.getElementById('total_price').value;
	var d_price = 0;
	var t_d_price=0;
	if(tot_price<50000){
		d_price=2500;
	}else{
		d_price=0;
	}
	t_d_price=Number(tot_price)+Number(d_price);
	document.getElementById('d_price').innerHTML=d_price.toLocaleString();
	document.getElementById('total_price_deliver').innerHTML=t_d_price.toLocaleString();
}
function promptAddress(){
	
	document.address_modify.method = 'POST';
	document.address_modify.action = "address_modify_action.jsp";
	document.address_modify.submit();
}

function addressModifyAction() {
	if(window.confirm('주소를 변경하시겠습니까? 변경하시면 기본배송지로 설정됩니다')){
		var address1 = prompt("배송지를 입력하세요");
		
		$('input[name=address]').attr('value',address1);
	alert("주소가 변경되었습니다.");
}
	
}
function orderAll(){
	order_create_form.action = "order_create_action.jsp";
	order_create_form.method='POST';
	order_create_form.submit();
	alert("주문이 완료되었습니다.");
}


</script>
</head>
<body onload="deliveryCheck();">
	<!-- include_common_top_menu.jsp start-->
	<jsp:include page="include_common_top_menu.jsp"/>
	<!-- include_common_top_menu.jsp end-->
	<!-- include_common_top.jsp start-->
	<jsp:include page="include_common_top.jsp"/>
	<jsp:include page="html/mouse_effect.html"/>
	<!-- include_common_top.jsp end-->
	<form name="order_create_form" method="post">
		<input type="hidden" name="buyType" value="<%=buyType%>"> <input
			type="hidden" name="p_no" value="<%=p_noStr%>"> <input
			type="hidden" name="p_qty" value="<%=p_qtyStr%>">
			<input
			type="hidden" name="address" value="<%=member.getAddress()%>">
		<%
		for (String cart_noStr : cart_no_array) {
		%>
		<input type="hidden" name="cart_item_no" value="<%=cart_noStr%>">
		<%
		}
		%>
	</form>
	<br>
	<table>
		<center>
	<b><font size=5>주문/결제</font></b>
	</center>
	</table>
	
	<br>
	<br>

	<table width=50% align=center>
	<tr>
	<td bgcolor=#ffe18f align=center height=50><font color=#8d8d8d size=3.5>구매자정보</font></td>
	</tr>
	</table>

	

	<br>
	
	<form name="address_modify">
	<table align=center width=50%  border="0" cellpadding="0"
			cellspacing="1" bgcolor="BBBBBB">
			
	<tr>
	<td width=200 height=40 bgcolor="white" align=center class=t1><font color=#8d8d8d size=3>아이디</font></td>
	<td width=200 height=40 bgcolor="white" align=center class=t1 colspan="2"><font color=black size=3><%=member.getUserId() %></font></td>
	</tr>
	
	<tr>
	<td width=200 height=40 bgcolor="white" align=center class=t1><font color=#8d8d8d size=3>이름</font></td>
	<td width=200 height=40 bgcolor="white" align=center class=t1 colspan="2"><font color=black size=3><%=member.getName() %></font></td>
	</tr>
	
	<tr>
	
	<td width=200 height=40 bgcolor="white" align=center class=t1><font color=#8d8d8d size=3>주소</font></td>
	<td width=150 height=40 bgcolor="white" align=center class=t1><font color=black size=3>
	<input type="text" name="address" id="address_modify" value="<%=member.getAddress()%>">
	</font>
	</td>
	
	<td width=50 align=center>
	<a href="javascript:addressModifyAction();" class=m1>주소 변경</a>
	</td>
	
	</tr>
	
</table>
<br>
</form>
<div id="please">
<table width=50% align=center>
	<tr>
	<td bgcolor=#ffe18f align=center height=50><font color=#8d8d8d size=3.5>주문제품목록</font></td>
	</tr>
	</table>

<form name="please">
<table align=center width=50%  border="0" cellpadding="0"
			cellspacing="1" bgcolor="BBBBBB";>
			
	<tr>
	<td width=200 height=40 bgcolor="white" align=center class=t1><font color=#8d8d8d size=3>책&nbsp;제목</font></td>
	<td width=200 height=40 bgcolor="white" align=center class=t1><font color=black size=3>수량</font></td>
	<td width=200 height=40 bgcolor="white" align=center class=t1><font color=black size=3>가격</font></td>
	</tr>
	<%
	int tot_price=0;
	for(Cart cart:cartList){
		tot_price+=cart.getCart_qty()*cart.getProduct().getP_price();
	%>
	<tr>
	<td width=200 height=40 bgcolor="white" align=center class=t1><a href='product_detail.jsp?p_no=<%=cart.getProduct().getP_no()%>'><font color=#8d8d8d size=3><%=cart.getProduct().getP_name() %></font>
	</a></td>
	<td width=200 height=40 bgcolor="white" align=center class=t1><font color=black size=3>
	
	
	 <%=cart.getCart_qty() %>권
	</font></td>
	<!-- <input type="hidden" name = "p_price" value=<cart.getProduct().getP_price() >> -->
	<td width=200 height=40 bgcolor="white" align=center class=t1><font color=black size=3><%=new DecimalFormat("#,###").format(cart.getCart_qty()*cart.getProduct().getP_price())%>원</font></td>
	</tr>
	<%} %>
	<%
	int d_price=0;
	if(tot_price<50000){
	d_price = 2500;
	}else{
		d_price=0;
	}
	 %>
</table>
</form>

<br>
<br>
<br>
<br>
<br>
<br>
<br>
<table align=center border="0" cellpadding="0" cellspacing="1" width="400">
<tr>
<td align=center>

&nbsp;&nbsp;&nbsp;배송비 : <span id="d_price"><%=d_price %></span>원
</td>
</table>

<br>

		<table align=center border="0" cellpadding="0"
								cellspacing="1" width="400">
								<tr>
									<td align=center>&nbsp;
										<a href="shop_main.jsp">취소하기</a>
									</td>
										<td><input type="hidden" id="total_price" value="<%=tot_price %>"></td>
									<td align=center>&nbsp;
										총 주문금액 : <span id="tot_price_deliver"><%=new DecimalFormat("#,###").format(tot_price+d_price)%></span>원
									
									</td>
								
									<td align=center>&nbsp;
										<a href ="javascript:orderAll();">구매하기</a>  
									</td>
									
								</tr>
							</table>

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