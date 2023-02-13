package com.itwill.bookbread.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import com.itwill.bookbread.dto.Product;
import com.itwill.bookbread.dto.BookType;
import com.itwill.bookbread.dto.Member;
import com.itwill.bookbread.sql.MemberSQL;
import com.itwill.bookbread.sql.ProductSQL;

public class ProductDao {

	private DataSource dataSource;

	public ProductDao() throws Exception{
		Properties properties = new Properties();
		properties.load(this.getClass().getResourceAsStream("/com/itwill/bookbread/common/jdbc.properties"));
		BasicDataSource basicDataSource = new BasicDataSource();
		basicDataSource.setDriverClassName(properties.getProperty("driverClass"));
		basicDataSource.setUrl(properties.getProperty("url"));
		basicDataSource.setUsername(properties.getProperty("user"));
		basicDataSource.setPassword(properties.getProperty("password"));
		dataSource = basicDataSource;
	}
	//관리자가 신규도서추가
	public int insert(Product product) throws Exception {
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(ProductSQL.PRODUCT_ADMIN_INSERT);
		pstmt.setString(1, product.getP_name());
		pstmt.setString(2, product.getP_author());
		pstmt.setString(3, product.getP_publisher());
		pstmt.setString(4, product.getP_publish_date());
		pstmt.setInt(5, product.getP_price());
		pstmt.setString(6, product.getP_detail());
		pstmt.setInt(7, product.getBookType().getType_no());
		int insertRowCount = pstmt.executeUpdate();
		pstmt.close();
		con.close();
		return insertRowCount;
	}
	
	//관리자가 도서정보수정
		public int updateAdmin(Product product)throws Exception{
			Connection con = dataSource.getConnection();
			PreparedStatement pstmt = con.prepareStatement(ProductSQL.PRODUCT_ADMIN_UPDATE);
			pstmt.setString(1, product.getP_name());
			pstmt.setString(2, product.getP_author());
			pstmt.setString(3, product.getP_publisher());
			pstmt.setString(4, product.getP_publish_date());
			pstmt.setInt(5, product.getP_price());
			pstmt.setString(6, product.getP_detail());
			pstmt.setInt(7, product.getBookType().getType_no());
			pstmt.setInt(8, product.getP_no());
			int updateRowCount = pstmt.executeUpdate();
			pstmt.close();
			con.close();
			return updateRowCount;
		}
		
	// 전체 도서 리스트
	public List<Product> selectAll() throws Exception {
		List<Product> productList = new ArrayList<Product>();
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(ProductSQL.PRODUCT_LIST_DETAIL);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			Product product = new Product(rs.getInt("p_no"), 
											rs.getString("p_name"), 
											rs.getString("p_author"),
											rs.getString("p_publisher"), 
											rs.getString("p_publish_date"),
											rs.getInt("p_price"),
											rs.getString("p_image"),
											rs.getString("p_detail"),
											new BookType(rs.getInt("type_no"),
														 rs.getString("p_type")));
			productList.add(product);
		}

		return productList;
	}
	
	// 도서 이름으로 찾기
	public Product selectByName(String p_name) throws Exception {
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(ProductSQL.PRODUCT_BY_NAME);
		pstmt.setString(1, p_name);
		ResultSet rs = pstmt.executeQuery();
		Product findProductName = null;
		if(rs.next()) {
			findProductName = new Product(rs.getInt("p_no"),
										rs.getString("p_name"),
										rs.getString("p_author"),
										rs.getString("p_publisher"),
										rs.getString("p_publish_date"),
										rs.getInt("p_price"),
										rs.getString("p_image"),
										rs.getString("p_detail"),
										new BookType(rs.getInt("type_no"),null)
										);
		}
		rs.close();
		pstmt.close();
		con.close();
		return findProductName;
	}
	
	// 도서이름 리스트 찾기
	public List<Product> selectListName(String p_name)throws Exception{
		List<Product> productListname = new ArrayList<>();
		Connection con =dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(ProductSQL.PRODUCT_BY_NAME);
		pstmt.setString(1, p_name);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			productListname.add(
					new Product(rs.getInt("p_no"),
							rs.getString("p_name"),
							rs.getString("p_author"),
							rs.getString("p_publisher"),
							rs.getString("p_publish_date"),
							rs.getInt("p_price"),
							rs.getString("p_image"),
							rs.getString("p_detail"),
							new BookType(rs.getInt("type_no"),null))
							);
		}
		con.close();
		return productListname;
	}
	
	// 저자 이름으로 찾기
	public Product selectByauthor(String p_author) throws Exception {
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(ProductSQL.PRODUCT_BY_AUTHOR);
		pstmt.setString(1, p_author);
		ResultSet rs = pstmt.executeQuery();
		Product findProductauthor = null;
		if(rs.next()) {
			findProductauthor = new Product(rs.getInt("p_no"),
										rs.getString("p_name"),
										rs.getString("p_author"),
										rs.getString("p_publisher"),
										rs.getString("p_publish_date"),
										rs.getInt("p_price"),
										rs.getString("p_image"),
										rs.getString("p_detail"),
										new BookType(rs.getInt("type_no"),null)
										);
		}
		rs.close();
		pstmt.close();
		con.close();
		return findProductauthor;
	}
	
	// 저자이름 리스트 찾기
	public List<Product> selectListAuthor(String p_author)throws Exception{
		List<Product> productListauthor = new ArrayList<>();
		Connection con =dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(ProductSQL.PRODUCT_BY_AUTHOR);
		pstmt.setString(1, p_author);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			productListauthor.add(
					new Product(rs.getInt("p_no"),
							rs.getString("p_name"),
							rs.getString("p_author"),
							rs.getString("p_publisher"),
							rs.getString("p_publish_date"),
							rs.getInt("p_price"),
							rs.getString("p_image"),
							rs.getString("p_detail"),
							new BookType(rs.getInt("type_no"),null))
					);
		}
		con.close();
		return productListauthor;
	}
	
	
	// 출판사 이름으로 찾기
	public Product selectBypublisher(String p_publisher) throws Exception {
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(ProductSQL.PRODUCT_BY_PUBLISHER);
		pstmt.setString(1, p_publisher);
		ResultSet rs = pstmt.executeQuery();
		Product findProductpublisher = null;
		while(rs.next()) {
			findProductpublisher = new Product(rs.getInt("p_no"),
										rs.getString("p_name"),
										rs.getString("p_author"),
										rs.getString("p_publisher"),
										rs.getString("p_publish_date"),
										rs.getInt("p_price"),
										rs.getString("p_image"),
										rs.getString("p_detail"),
										new BookType(rs.getInt("type_no"),null)
										);
		}
		rs.close();
		pstmt.close();
		con.close();
		return findProductpublisher;
	}
	
	// 출판사이름 리스트 찾기
	public List<Product> selectListPublisher(String p_publisher)throws Exception{
		List<Product> productListpublisher = new ArrayList<>();
		Connection con =dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(ProductSQL.PRODUCT_BY_PUBLISHER);
		pstmt.setString(1, p_publisher);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			productListpublisher.add(
					new Product(rs.getInt("p_no"),
							rs.getString("p_name"),
							rs.getString("p_author"),
							rs.getString("p_publisher"),
							rs.getString("p_publish_date"),
							rs.getInt("p_price"),
							rs.getString("p_image"),
							rs.getString("p_detail"),
							new BookType(rs.getInt("type_no"),null))
					);
		}
		con.close();
		return productListpublisher;
	}
	
	
	// 도서 타입으로 찾기
	public Product selectByTYPE(int type_no) throws Exception {
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(ProductSQL.PRODUCT_BY_TYPE);
		pstmt.setInt(1, type_no);
		ResultSet rs = pstmt.executeQuery();
		Product findProducttype = null;
		if(rs.next()) {
			findProducttype = new Product(rs.getInt("p_no"),
										rs.getString("p_name"),
										rs.getString("p_author"),
										rs.getString("p_publisher"),
										rs.getString("p_publish_date"),
										rs.getInt("p_price"),
										rs.getString("p_image"),
										rs.getString("p_detail"),
										new BookType(rs.getInt("type_no"),null)
										);
		}
		rs.close();
		pstmt.close();
		con.close();
		return findProducttype;
	}
	
	// 타입으로 리스트 찾기
	public List<Product> selectListType(int type_no)throws Exception{
		List<Product> productListType = new ArrayList<>();
		Connection con =dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(ProductSQL.PRODUCT_BY_TYPE);
		pstmt.setInt(1, type_no);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			productListType.add(
					new Product(rs.getInt("p_no"),
							rs.getString("p_name"),
							rs.getString("p_author"),
							rs.getString("p_publisher"),
							rs.getString("p_publish_date"),
							rs.getInt("p_price"),
							rs.getString("p_image"),
							rs.getString("p_detail"),
							new BookType(rs.getInt("type_no"),null))
					);
		}
		con.close();
		return productListType;
	}
	
	
	// 도서 번호로 찾기
	public Product selectByNO(int p_no) throws Exception {
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(ProductSQL.PRODUCT_BY_NO);
		pstmt.setInt(1, p_no);
		ResultSet rs = pstmt.executeQuery();
		Product findProductNO = null;
		if(rs.next()) {
			findProductNO = new Product(rs.getInt("p_no"),
										rs.getString("p_name"),
										rs.getString("p_author"),
										rs.getString("p_publisher"),
										rs.getString("p_publish_date"),
										rs.getInt("p_price"),
										rs.getString("p_image"),
										rs.getString("p_detail"),
										new BookType(rs.getInt("type_no"),rs.getString("p_type"))
										);
		}
		rs.close();
		pstmt.close();
		con.close();
		return findProductNO;
	}
	
	// 도서 가격수정
	public int updatePrice(Product product)throws Exception {
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(ProductSQL.PRODUCT_UPDATE_PRICE);
		pstmt.setInt(1, product.getP_price());
		pstmt.setInt(2, product.getP_no());
		int updateRowCount = pstmt.executeUpdate();
		pstmt.close();
		con.close();
		return updateRowCount;
	}
	
	// 도서추가
	public int InsertProduct(Product product) throws Exception {
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(ProductSQL.PRODUCT_INSERT);
		pstmt.setString(1, product.getP_name());
		pstmt.setString(2, product.getP_author());
		pstmt.setString(3, product.getP_publisher());
		pstmt.setString(4, product.getP_publish_date());
		pstmt.setInt(5, product.getP_price());
		pstmt.setString(6, product.getP_image());
		pstmt.setString(7, product.getP_detail());
		pstmt.setInt(8, product.getBookType().getType_no());
		int insertRowCount = pstmt.executeUpdate();
		pstmt.close();
		con.close();
		return insertRowCount;
	}
	
	// 도서삭제
	public int deleteByProductNo(int p_no)throws Exception {
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt= con.prepareStatement(ProductSQL.PRODUCT_DELETE);
		pstmt.setInt(1, p_no);
		int deleteRowCount = pstmt.executeUpdate();
		pstmt.close();
		con.close();
		return deleteRowCount;
	}
	
	// 출판일로 도서리스트
	public List<Product> selectListDate(String p_publish_date)throws Exception{
		List<Product> productListDate = new ArrayList<>();
		Connection con =dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(ProductSQL.PORDUCT_LIST_DATE);
		pstmt.setString(1, p_publish_date);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			productListDate.add(
					new Product(rs.getInt("p_no"),
							rs.getString("p_name"),
							rs.getString("p_author"),
							rs.getString("p_publisher"),
							rs.getString("p_publish_date"),
							rs.getInt("p_price"),
							rs.getString("p_image"),
							rs.getString("p_detail"),
							new BookType(rs.getInt("type_no"),null))
					);
		}
		con.close();
		return productListDate;
	}
}
