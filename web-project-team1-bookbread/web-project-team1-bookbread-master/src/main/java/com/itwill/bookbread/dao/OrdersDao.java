package com.itwill.bookbread.dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import com.itwill.bookbread.dto.BookType;
import com.itwill.bookbread.dto.OrderItem;
import com.itwill.bookbread.dto.Orders;
import com.itwill.bookbread.dto.Product;
import com.itwill.bookbread.sql.OrdersSQL;

public class OrdersDao {
	private DataSource dataSource;

	public OrdersDao() throws Exception {
		Properties properties = new Properties();
		properties.load(this.getClass().getResourceAsStream("/com/itwill/bookbread/common/jdbc.properties"));
		BasicDataSource basicDataSource = new BasicDataSource();
		basicDataSource.setDriverClassName(properties.getProperty("driverClass"));
		basicDataSource.setUrl(properties.getProperty("url"));
		basicDataSource.setUsername(properties.getProperty("user"));
		basicDataSource.setPassword(properties.getProperty("password"));
		dataSource = basicDataSource;
	}

	/*
	 * 주문생성
	 */

	public int create(Orders orders) throws Exception {
		Connection con = null;
		PreparedStatement pstmt1 = null;
		PreparedStatement pstmt2 = null;
		try {
			con = dataSource.getConnection();
			con.setAutoCommit(false);
			/*
			 * transaction 시작
			 */
			/*
			 * order 삽입
			 */
			pstmt1 = con.prepareStatement(OrdersSQL.INSERT_ORDERS);
			pstmt1.setString(1, orders.getO_desc());
			pstmt1.setInt(2, orders.getO_price());
			pstmt1.setString(3, orders.getUserId());
			pstmt1.executeUpdate();
			/*
			 * orderitem 삽입
			 */
			pstmt2 = con.prepareStatement(OrdersSQL.INSERT_ORDER_ITEM);
			for (OrderItem orderItem : orders.getOrderItemList()) {
				pstmt2.clearParameters();
				pstmt2.setInt(1, orderItem.getOi_qty());
				pstmt2.setInt(2, orderItem.getProduct().getP_no());
				pstmt2.executeUpdate();

			}
			/*
			 * transaction종료(성공)
			 */
			con.commit();
		} catch (Exception e) {
			e.printStackTrace();
			con.rollback();
			throw e;
		}
		return 0;
	}

	/*
	 * 주문 선택 삭제
	 */
	public int selectDelete(int o_no) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		int deleteCount = 0;
		try {
		con = dataSource.getConnection();
		con.setAutoCommit(false);
		pstmt=con.prepareStatement(OrdersSQL.ORDER_DELETE_BY_NO);
		pstmt.setInt(1, o_no);
		deleteCount = pstmt.executeUpdate();
		con.commit();
		}catch (Exception e) {
			con.rollback();
			e.printStackTrace();
			throw e;
		}
		con.close();
		return deleteCount;
	}

	/*
	 * 주문 전체 삭제
	 */
	public int deleteAll(String userId) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		int deleteAllCount = 0;
		try {
		con= dataSource.getConnection();
		con.setAutoCommit(false);
		pstmt=con.prepareStatement(OrdersSQL.ORDER_DELETE_ALL);
		pstmt.setString(1, userId);
		deleteAllCount = pstmt.executeUpdate();
		con.commit();
		}catch (Exception e) {
			con.rollback();
			e.printStackTrace();
			throw e;
		}
		return deleteAllCount;
	}

	/*
	 * 주문 상세보기
	 */
	public List<Orders> orderList(String userId) throws Exception {
		List<Orders> orderList = new ArrayList<Orders>();

		Connection con = dataSource.getConnection();

		PreparedStatement pstmt1 = con.prepareStatement(OrdersSQL.SELECT_O_NO);
		PreparedStatement pstmt2 = con.prepareStatement(OrdersSQL.ORDER_LIST_BY_O_NO);

		pstmt1.setString(1, userId);
		ResultSet rs1 = pstmt1.executeQuery();

		while (rs1.next()) { // 주문번호
			int tempNo = rs1.getInt("o_no");
			pstmt2.setString(1, userId);
			pstmt2.setInt(2, tempNo);
			ResultSet rs2 = pstmt2.executeQuery();
			Orders orders = null;
			if (rs2.next()) {
				orders = new Orders(rs2.getInt("o_no"), rs2.getString("o_desc"), rs2.getDate("o_date"),
						rs2.getInt("o_price"), userId, null);
				List<OrderItem> orderItemList = new ArrayList<OrderItem>();
				do {// int oi_no, int oi_qty, int o_no, Product product
					orderItemList.add(new OrderItem(rs2.getInt("oi_no"), rs2.getInt("oi_qty"), rs2.getInt("o_no"),
					//int p_no, String p_name, String p_author, String p_publisher, String p_publish_date, int p_price,String p_image, String p_detail, BookType booktype
							new Product(rs2.getInt("p_no"), rs2.getString("p_name"), rs2.getString("p_author"),
									rs2.getString("p_publisher"), rs2.getString("p_publish_date"),
									rs2.getInt("p_price"), rs2.getString("p_image"), rs2.getString("p_detail"), null)));

				} while (rs2.next());
				orders.setOrderItemList(orderItemList);
			} // end if
			orderList.add(orders);
		} // end while
		return orderList;
	}// end method
	/*
	 * 	주문상세보기 아이디/주문번호
	 */
	public Orders detail(String userId, int o_no) throws Exception{
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(OrdersSQL.ORDER_LIST_BY_O_NO);
		pstmt.setString(1, userId);
		pstmt.setInt(2, o_no);
		Orders order = null;
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()) {
			 order = new Orders(rs.getInt("o_no"), rs.getString("o_desc"), 
										rs.getDate("o_date"), rs.getInt("o_price"), rs.getString("userId"));
			
			do {
				order.getOrderItemList().add(new OrderItem
												(rs.getInt("oi_no"), 
												rs.getInt("oi_qty"), 
												rs.getInt("o_no"), 
											new Product(rs.getInt("p_no"), 
														rs.getString("p_name"), 
														rs.getString("p_author"), 
														rs.getString("p_publisher"), 
														rs.getString("p_publish_date"), 
														rs.getInt("p_price"), 
														rs.getString("p_image"),
														rs.getString("p_detail"), 
														new BookType(0,""))));
				
		
			}while(rs.next());
			
		}
		
		return order;
	}
	/*
	 *  주문 전체 조회 
	 */
	public List<Orders> orderListAll(String userId) throws Exception{
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(OrdersSQL.ORDER_LIST_BY_USERID);
		List<Orders> listAll = new ArrayList<Orders>();
		pstmt.setString(1, userId);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Orders newOrder = new Orders(rs.getInt("o_no"), 
										rs.getString("o_desc"), 
										rs.getDate("o_date"), 
										rs.getInt("o_price"), 
										userId, 
										null);
			listAll.add(newOrder);
		}
		
		return listAll;
	}
	
	public List<Orders> orderListAllForAdmin() throws Exception{
		List<Orders> orderList = new ArrayList<Orders>();
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(OrdersSQL.ORDER_LIST_FOR_ADMIN);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			Orders order = new Orders(rs.getInt("o_no"),
									  rs.getString("o_desc"),
									  rs.getDate("o_date"),
									  rs.getInt("o_price"),
									  rs.getString("userid"));
		orderList.add(order);
		}
		return orderList;
	}
	
}