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
import com.itwill.bookbread.sql.BookTypeSQL;

public class BookTypeDao {
	
	private DataSource dataSource;
	
	public BookTypeDao() throws Exception{
		Properties properties = new Properties();
		properties.load(this.getClass().getResourceAsStream("/com/itwill/bookbread/common/jdbc.properties"));
		BasicDataSource basicDataSource = new BasicDataSource();
		basicDataSource.setDriverClassName(properties.getProperty("driverClass"));
		basicDataSource.setUrl(properties.getProperty("url"));
		basicDataSource.setUsername(properties.getProperty("user"));
		basicDataSource.setPassword(properties.getProperty("password"));
		dataSource = basicDataSource;
	}
	
	// 타입 리스트
	public List<BookType> selectAll() throws Exception {
		List<BookType> booktypeAll = new ArrayList<BookType>();
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(BookTypeSQL.TYPE_LIST);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			booktypeAll.add(new BookType(rs.getInt("type_no"),
							 			   rs.getString("p_type")));
		}
		con.close();
		return booktypeAll;
	}
	
	// 번호로 도서 타입 선택
	public BookType BooktypeByNo(BookType booktype)throws Exception {
		BookType BooktypeByNo = null;
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(BookTypeSQL.TYPE_SELECT_BY_NO);
		pstmt.setInt(1, booktype.getType_no());
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()) {
			BooktypeByNo = new BookType(rs.getInt("type_no"),
										rs.getString("p_type"));
		}
		return BooktypeByNo;
	}
	
	// 타입추가
	public int insertBookType(BookType booktype)throws Exception{
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(BookTypeSQL.TYPE_INSERT);
		pstmt.setInt(1, booktype.getType_no());
		pstmt.setString(2, booktype.getP_type());
		int rowCount =pstmt.executeUpdate();
		return rowCount;
	}
	
	// 타입수정
	public int UpdateBookType(BookType booktype) throws Exception {
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(BookTypeSQL.TYPE_UPDATE);
		pstmt.setInt(1, booktype.getType_no());
		pstmt.setString(2, booktype.getP_type());
		int rowCount = pstmt.executeUpdate();
		con.close();
		return rowCount;
	}
	
	// 타입삭제
	public int DeleteBookType(BookType booktype) throws Exception {
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(BookTypeSQL.TYPE_DELETE);
		pstmt.setInt(1, booktype.getType_no());
		int rowCount = pstmt.executeUpdate();
		con.close();
		return rowCount;
	}
	
}