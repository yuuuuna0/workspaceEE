<%@page import="java.text.DecimalFormat"%>
<%@page import="com.itwill.bookbread.dto.Cart"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.bookbread.service.CartService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="login_check.jspf"%>

<%
CartService cartService = new CartService();
List<Cart> cartList = cartService.cartItemList(sUserId);
Cart cart = null;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Delicious Book Cart</title>
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
	function cart_view_form_order_submit() {
		document.cart_view_form.method = 'POST';
		document.cart_view_form.buyType.value = 'cart';
		document.cart_view_form.action = 'order_create_form.jsp';
		document.cart_view_form.submit();
	}
	/*
	 카트 아이템 카운트 체크박스
	*/
	function cart_item_select_count(){
		var cart_item_no_check_list = document.getElementsByName("cart_item_no_check");
		var cart_item_check_selected_count = 0;
		document.cart_view_form.innerHTML ='';
		document.cart_view_form.innerHTML +="<input type='hidden' name='buyType'>";
		var tot_order_price=0;
		for (var i = 0; i < cart_item_no_check_list.length; i++) {
			if (cart_item_no_check_list.item(i).checked === true) {
				document.cart_view_form.innerHTML += "<input type='hidden' name='cart_item_no' value='"+ cart_item_no_check_list.item(i).value + "'>";
				var updateFormId='cart_update_form_'+ cart_item_no_check_list.item(i).value;
				var cart_qty=document.getElementById(updateFormId).cart_qty.value;
				var cart_product_unit_price=document.getElementById(updateFormId).cart_product_unit_price.value;
				tot_order_price+=cart_qty*cart_product_unit_price;
				cart_item_check_selected_count++;
			}
		}
		document.getElementById('cart_item_select_count').innerHTML = cart_item_check_selected_count;
		document.getElementById('tot_order_price').innerHTML = tot_order_price.toLocaleString();
		
}
	
	function changeNumber(desc, formId) {
		console.log(formId);
		var form = document.getElementById(formId);
		if (desc == '+') {
			form.cart_qty.value = parseInt(form.cart_qty.value) + 1;

		} else if (desc == '-') {
			if (form.cart_qty.value - 1 >= 0) {
				form.cart_qty.value = parseInt(form.cart_qty.value) - 1;
			}
		}

		form.method = 'POST';
		form.action = 'cart_update_item_action.jsp';
		form.submit();
	}
	/*
	cart 아이템전체선택해제
	*/
	function cart_item_all_select(e){
		var cart_item_no_check_list = document.getElementsByName("cart_item_no_check");
		if(e.target.checked){
			for (var i = 0; i < cart_item_no_check_list.length; i++) {
				cart_item_no_check_list.item(i).checked=true;
			}
		}else{
			for (var i = 0; i < cart_item_no_check_list.length; i++) {
				cart_item_no_check_list.item(i).checked=false;
			}
		}
	}
	function cart_view_form_select_submit() {
		var cart_item_no_check_list = document
				.getElementsByName("cart_item_no_check");
		var isChecked = false;
		for (var i = 0; i < cart_item_no_check_list.length; i++) {
			if (cart_item_no_check_list.item(i).checked === true) {
				isChecked = true;
				break;
			}
		}
		if (!isChecked) {
			alert('제품을선택해주세요');

			return;
		}
		document.cart_view_form.buyType.value = 'cart_select';
		document.cart_view_form.method = 'POST';
		document.cart_view_form.action = 'order_create_form.jsp';
		document.cart_view_form.submit();
	}
	function cart_item_all_select_checkbox_deselect(){
		document.getElementById('all_select_checkbox').checked=false;
	}
	/*
	cart item1개삭제하기
	 */
	function cart_delete_item_action(formId) {
		if(window.confirm('해당상품을 장바구니에서 삭제하시겠습니까?')){
			var form = document.getElementById(formId);
			form.method = 'POST';
			form.action = 'cart_delete_item_action.jsp';
			form.submit();
		}
		
	}
	function cart_delete() {
		if(window.confirm('장바구니를 전체 삭제하시겠습니까?')){
			
		
		document.cart_view_form.method = 'POST';
		document.cart_view_form.action = 'cart_delete_action.jsp';
		document.cart_view_form.submit();
		}
	}
</script>


</head>
<body onload="cart_item_select_count();" bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0
	marginwidth=0 marginheight=0>
<form name="cart_view_form" style="margin:0">
		<input type="hidden" name="buyType">
	</form>
	<!-- include_common_top_menu.jsp start-->
	<jsp:include page="include_common_top_menu.jsp" />
	<!-- include_common_top_menu.jsp end-->
	<!-- include_common_top.jsp start-->
	<jsp:include page="include_common_top.jsp" />
	<!-- include_common_top.jsp end-->
	<br>
	<table style="margin: auto" border=0 width=70% align=center>
		<tr valign=bottom>
			<td width=30% align="center" class=t1><font size=5 color=#000000><b>내&nbsp;장바구니</b></font></td>
	</table>
	<br>
	<div width=70% align=center>
	전체선택<input type="checkbox" id="all_select_checkbox" checked="checked" onchange="cart_item_all_select(event);cart_item_select_count();">
	</div>
	<br>
	<div class="slider">
		<div class="container">
			<div class="row">				<%
				int cart_column_size = 4;
				int cart_line_count = 1;
				int tot_price = 0;

				for (int i=0;i<cartList.size();i++) {
					cart=cartList.get(i);
					tot_price+=cart.getCart_qty()*cart.getProduct().getP_price();
			%>
			
			<%
			if(i%cart_column_size==0){}
			%>
		 
				<div class="col-md-4 col-sm-4">
					<div class="slider small-slider">
						<div id="small-featured" class="carousel slide"
							data-ride="carousel">
							<!-- Indicators -->
							<ol class="carousel-indicators">
								<li data-target="#small-featured" data-slide-to="0"
									class="active"></li>
							</ol>
							<!-- Wrapper for slides -->
							<div class="carousel-inner" role="listbox">
								 <input type="checkbox" name="cart_item_no_check" onchange="cart_item_all_select_checkbox_deselect();cart_item_select_count();" value="<%=cart.getCart_no()%>" checked="checked">
								<!--내 장바구니타이틀이랑 체크박스가 들어가야할 것 같은.. -->
								<div class="item active"
									style="background-image: url('images/<%=cart.getProduct().getP_image()%>')">
									<div class="carousel-caption">
										<a
											href="product_detail.jsp?p_no=<%=cart.getProduct().getP_no()%>"
											class="btn btn-theme">자세히&nbsp;&nbsp;&nbsp;&nbsp;></a>
									</div>
								</div>
								<div align="center">
								
									가격:<%=new DecimalFormat("#,##0").format(cart.getProduct().getP_price() * cart.getCart_qty())%><br> 
									
									
									<form action="cart_update_action.jsp" method="post"
												id="cart_update_form_<%=cart.getCart_no()%>">
												<input type="hidden" name="cart_no"
													value="<%=cart.getCart_no()%>"> <input
													type="button" value="-"
													onclick="changeNumber('-','cart_update_form_<%=cart.getCart_no()%>');"/>
												<input type="text" readonly="readonly" size="2"
													style="text-align: center; width: 15%" name="cart_qty"
													value="<%=cart.getCart_qty()%>"> <input
													type="button" value="+"
													onclick="changeNumber('+','cart_update_form_<%=cart.getCart_no()%>');"/>
												<input type="hidden" name="cart_product_unit_price" value="<%=cart.getProduct().getP_price()%>"/>	
											</form>
										</td>


											<%-- 
											<form action="cart_delete_item_action.jsp" method="post">
												<input type="hidden" name="cart_no" value="<%=cart.getCart_no()%>">
												<input type="submit" value="삭제">
											</form>
											 --%>
											 <br>
											<form id="cart_delete_item_form_<%=cart.getCart_no()%>">
												<input type="hidden" name="cart_no"
													value="<%=cart.getCart_no()%>"> <a
													href="javascript:cart_delete_item_action('cart_delete_item_form_<%=cart.getCart_no()%>');">
													<svg xmlns="http://www.w3.org/2000/svg" width="14"
														height="14" viewBox="0 0 28 28" class="icon--close">
													<g fill="none" fill-rule="evenodd"> <path
														d="M0 0H28V28H0z"></path> <g fill="#9B9BA0"
														transform="translate(6 6)" class="icon--close__group">
													<rect width="2" height="18" x="7" y="-1" rx="1"
														transform="rotate(-135 8 8)"></rect> <rect width="2"
														height="18" x="7" y="-1" rx="1"
														transform="rotate(-45 8 8)"></rect> </g> </g> </svg>
												</a>
											</form>
								</div>

							</div>
						</div>
						<h1>&nbsp;</h1>
					</div>
					<%
					if (i % cart_column_size == 3) {
					}
					%>

				</div>
				<%
				}
				%>
			</div>
		</div>
	</div>
	<%if(cartList.size()>=1){ %>
			
			<% }else{%>
			<table align=center>
			<tr>
			<td>
	        	<img src="image/emptyCart.png">
	        	</td>
	        	</tr>
			</table>
			<%} %>
<table align=center border="0" cellpadding=0">
			<tr>
				<td align>총&nbsp;가격&nbsp;:&nbsp;<span id = "tot_order_price"><%=new DecimalFormat("#,##0").format(tot_price)%>&nbsp;</span>원
				</td>
		</table>
	<br>
	<table align=center border="0" cellpadding="0"
								cellspacing="1" width="590">
								<tr>
									<td align=center>&nbsp;&nbsp; <a href="shop_main.jsp"
										class=m1>계속 구경하기</a>&nbsp;&nbsp;
										 <% if (cartList.size() >= 1) { %> 
										 <a href="javascript:cart_view_form_select_submit();" class=m1>
										 	총 <span style="font-weight: bold;" id="cart_item_select_count"></span>개 주문하기[주문폼]
										 	</a>&nbsp;&nbsp;
											<a href="javascript:cart_delete();" class=m1>장바구니 전체 비우기</a>&nbsp;&nbsp;
											
									</td>
										<%} %>	
								</tr>
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
