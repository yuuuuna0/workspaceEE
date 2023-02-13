package com.itwill.bookbread.dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import com.itwill.bookbread.dto.BookType;
import com.itwill.bookbread.dto.Cart;
import com.itwill.bookbread.dto.Member;
import com.itwill.bookbread.dto.Product;
import com.itwill.bookbread.sql.CartSQL;

public class CartDao {
	private DataSource dataSource;
	public CartDao() throws Exception{
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
	 * 장바구니에 해당 상품이 존재하는지 확인
	 */
	public int checkProduct(Cart cart) throws Exception{
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(CartSQL.CHECK_CART_PRODUCT);
		
		pstmt.setString(1, cart.getMember().getUserId());
		pstmt.setInt(2, cart.getProduct().getP_no());
		ResultSet rs = pstmt.executeQuery();
		int count = -999;
		
		rs.next();
		count = rs.getInt(1);
		
			
		
		con.close();
		return count;
	}
	
	/*
	 * 해당 상품이 존재하지 않으면 삽입
	 */
	public int insert(Cart newCart) throws Exception{
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(CartSQL.INSERT_CART_PRODUCT);
		
		pstmt.setInt(1, newCart.getCart_qty());
		pstmt.setString(2, newCart.getMember().getUserId());
		pstmt.setInt(3, newCart.getProduct().getP_no());
		int insertCount = pstmt.executeUpdate();
		
		con.close();
		return insertCount;
	}
	/*
	 * 해당 상품이 존재하면 수량 업데이트
	 */
	public int add(Cart cart) throws Exception{
	 Connection con = dataSource.getConnection();
	 PreparedStatement pstmt = con.prepareStatement(CartSQL.ADD_CART_PRODUCT);
	 
	 pstmt.setInt(1, cart.getCart_qty());
	 pstmt.setString(2, cart.getMember().getUserId());
	 pstmt.setInt(3, cart.getProduct().getP_no());
	 int addCount = pstmt.executeUpdate();
	 
	 con.close();
	 return addCount;
	}
	/*
	 * 장바구니에서 해당 제품 수량 수정
	 */
	public int update(Cart cart) throws Exception{
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(CartSQL.UPDATE_CART_QTY);
		
		pstmt.setInt(1, cart.getCart_qty());
		pstmt.setInt(2, cart.getCart_no());
		int updateCount = pstmt.executeUpdate();
		
		return updateCount;
	}
	/*
	 * 장바구니 선택 삭제
	 */
	public int selectDelete(int cart_no) throws Exception{
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(CartSQL.SELECT_DELETE_BY_CART_NO);
		
		pstmt.setInt(1, cart_no);
		
		int deleteCount = pstmt.executeUpdate();
		
		con.close();
		return deleteCount;
	}
	/*
	 * 장바구니 전체 삭제
	 */
	public int deleteAll(String userId) throws Exception{
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(CartSQL.DELETE_ALL_BY_USERID);
		
		pstmt.setString(1, userId);
		
		int deleteAllCount = pstmt.executeUpdate();
		
		return deleteAllCount;
	}
	/*
	 * 장바구니 해당 상품 가져오기
	 */
	public Cart getCartItem(int cart_no) throws Exception{
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(CartSQL.SELECT_CART_ITEM_BY_CART_NO);
		Cart cartItem = null;
		pstmt.setInt(1,cart_no);
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()) {
			cartItem = new Cart(rs.getInt("cart_no"), 
								rs.getInt("cart_qty"), 
								new Member(), 
								new Product(rs.getInt("p_no"), 
											rs.getString("p_name"), 
											rs.getString("p_author"), 
											rs.getString("p_publisher"),
											rs.getString("p_publish_date"), 
											rs.getInt("p_price"), 
											rs.getString("p_image"), 
											rs.getString("p_detail"), 
											new BookType()));
		}
		con.close();
		return cartItem;
	}
	/*
	 * 장바구니 전체 보기
	 */
	public List<Cart> getCartList(String userId) throws Exception{
		List<Cart> cartItemList = new ArrayList<Cart>();
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(CartSQL.CART_LIST);
		pstmt.setString(1, userId);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Cart cart = new Cart(rs.getInt("cart_no"),
									rs.getInt("cart_qty"), 
									new Member(),
									new Product(rs.getInt("p_no"), 
											rs.getString("p_name"), 
											rs.getString("p_author"),
											rs.getString("p_publisher"), 
											rs.getString("p_publish_date"),
											rs.getInt("p_price"),
											rs.getString("p_image"),
											rs.getString("p_detail"),
											new BookType()));
			cartItemList.add(cart);
		}
		
		con.close();
		return cartItemList;
	}
	
	
}
