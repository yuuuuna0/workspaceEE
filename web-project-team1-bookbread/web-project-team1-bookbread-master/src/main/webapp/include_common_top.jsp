
<%@page import="com.itwill.bookbread.dto.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.bookbread.service.ProductService"%>
<%@page import="com.itwill.bookbread.service.MemberService"%>
<%@page import="com.itwill.bookbread.dto.Member"%>
<%@page import="com.itwill.bookbread.dto.BookType"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	
	<%--
<jsp:include page="include_common_top_menu.jsp"/>
	 --%>
	 
<script type="text/javascript">



</script>
	 <body>
	<div class="header">
		<div class="container">
			<div class="row">
					<div class="logo">
						<a href="shop_main.jsp">
						<center><img src="image/BookBreadLogo.png"	alt="Book Bread" style="width: 130px;height: 130x;"></center>
						</a>
					</div>
			</div>
		</div>
	</div>
	<div class="navigation">
		<nav class="navbar navbar-theme">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false">
					<span class="sr-only">Menu</span> <span class="icon-bar"></span> <span
						class="icon-bar"></span> <span class="icon-bar"></span>
				</button>
			</div>
			<div class="shop-category nav navbar-nav navbar-left">
				<!-- Single button -->
				<div class="btn-group">
					<button type="button" class="btn btn-shop-category dropdown-toggle"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						도서 종류별 카테고리 <span class="caret"></span>
					</button>
					<ul class="dropdown-menu">
						<li><a href="product_list1.jsp?type_no=1">소설</a></li>
						<li><a href="product_list1.jsp?type_no=2">경영/경제</a></li>
						<li><a href="product_list1.jsp?type_no=3">어린이</a></li>
						<li><a href="product_list1.jsp?type_no=4">교육</a></li>
					</ul>
				</div>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="navbar">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="product_list_month_best.jsp">회원별 추천도서</a></li>
					<li><a href="product_list_month_new.jsp">이달의 신규도서</a></li>
				</ul>
			</div>
			
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid --> </nav>
	</div>
	</body>
