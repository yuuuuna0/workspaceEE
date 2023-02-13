package com.itwill.bookbread.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.jasper.tagplugins.jstl.core.Remove;
import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import com.itwill.bookbread.dto.Member;
import com.itwill.bookbread.dto.Product;
import com.itwill.bookbread.dto.ReviewBoard;
import com.itwill.bookbread.sql.ReviewBoardSQL;

public class ReviewBoardDao {
	private BasicDataSource dataSource;

	public ReviewBoardDao() throws Exception {
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
	 * 새로운 리뷰생성
	 */

	public int create(ReviewBoard reviewBoard) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		int insertRowCount = 0;
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(ReviewBoardSQL.REVIEW_INSERT);
			/*
			 	R_TITLE	VARCHAR2(200 BYTE)
				R_CONTENT	VARCHAR2(1000 BYTE)
				R_COUNT	NUMBER(20,0)
				USERID	VARCHAR2(100 BYTE)
				P_NO	NUMBER(10,0)
			 */
			pstmt.setString(1, reviewBoard.getR_title());
			pstmt.setString(2, reviewBoard.getR_content());
			pstmt.setInt(3, reviewBoard.getR_count());
			pstmt.setString(4, reviewBoard.getMember().getUserId());
			pstmt.setInt(5, reviewBoard.getProduct().getP_no());
			insertRowCount = pstmt.executeUpdate();
		} finally {
			if (pstmt != null) {
				pstmt.close();
			}
			if (con != null) {
				con.close();
			}
		}
		return insertRowCount;
	}

	/*
	 * 리뷰수정
	 */

	public int update(ReviewBoard reviewBoard) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		int updateRowCount = 0;
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(ReviewBoardSQL.REVIEW_UPDATE);
			pstmt.setString(1, reviewBoard.getR_title());
			pstmt.setString(2, reviewBoard.getR_content());
			pstmt.setInt(3, reviewBoard.getR_no());
			updateRowCount = pstmt.executeUpdate();
		} finally {
			if (pstmt != null) {
				pstmt.close();
			}
			if (con != null) {
				con.close();
			}
		}
		return updateRowCount;
	}

	/*
	 * 리뷰삭제
	 */
	public int removeByUserId(String userId) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		int removeRowCount = 0;
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(ReviewBoardSQL.REVIEW_DELETE);
			pstmt.setString(1, userId);
			removeRowCount = pstmt.executeUpdate();

		} finally {
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();

		}
		return removeRowCount;
	}

	/*
	 * userId가쓴 리뷰 보기
	 */
	public ArrayList<ReviewBoard> findReviewById(String userId) throws Exception{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<ReviewBoard> findReviewById = new ArrayList<ReviewBoard>();
		/*
	 	R_TITLE	VARCHAR2(200 BYTE)
		R_CONTENT	VARCHAR2(1000 BYTE)
		R_COUNT	NUMBER(20,0)
		USERID	VARCHAR2(100 BYTE)
		P_NO	NUMBER(10,0)
		*/
		try {
			con = dataSource.getConnection();
			pstmt=con.prepareStatement(ReviewBoardSQL.REVIEW_SELECET_BY_ID);
			pstmt.setString(1, userId);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				findReviewById.add( new ReviewBoard(rs.getInt("r_no"),
											 rs.getDate("r_date"),
											 rs.getString("r_title"),
											 rs.getString("r_content"),
											 rs.getInt("r_count"),
											 	new Member(rs.getString("userId"),null,null,null,null,null,null,null),
											 	new Product(rs.getInt("p_no"),rs.getString("p_name"),rs.getString("p_author"),null,null,0,null,null,null)
											 ));
			}	
			} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();
		}
		return findReviewById;
	}
	

	/*
	 * 전체리뷰보기
	 */
	public ArrayList<ReviewBoard> findReviewList() throws Exception{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<ReviewBoard> findReviewList = new ArrayList<ReviewBoard>();
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(ReviewBoardSQL.REVIEW_SELECT_ALL);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				findReviewList.add(new ReviewBoard(rs.getInt("r_no"),
											       rs.getDate("r_date"),
											       rs.getString("r_title"),
											       rs.getString("r_content"),
											       rs.getInt("r_count"),
											       new Member(rs.getString("userId"),null,null,null,null,null,null,null),
												   new Product(rs.getInt("p_no"),null,null,null,null,0,null,null,null)));
			}
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();
		}
		return findReviewList;
	}
	/*
	 * 리뷰조회수 증가
	 */
	public int countUpdate(int r_count) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		int updateRowCount = 0;
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(ReviewBoardSQL.REVIEW_COUNT);
			pstmt.setInt(1, r_count);
			updateRowCount = pstmt.executeUpdate();
		} finally {
			if (pstmt != null) {
				pstmt.close();
			}
			if (con != null) {
				con.close();
			}
		}
		return updateRowCount;
	}
	/*
	 * 상품번호로 리뷰검색
	 */
	public ArrayList<ReviewBoard> findReviewListByPno(int p_no) throws Exception{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<ReviewBoard> findReviewListByPno = new ArrayList<ReviewBoard>();
	
		try {
			con = dataSource.getConnection();
			pstmt=con.prepareStatement(ReviewBoardSQL.REVIEW_SELECT_BY_P_NO);
			pstmt.setInt(1,p_no);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				findReviewListByPno.add(new ReviewBoard(rs.getInt("r_no"),
											       rs.getDate("r_date"),
											       rs.getString("r_title"),
											       rs.getString("r_content"),
											       rs.getInt("p_no"),
											       new Member(rs.getString("userId"),null,null,null,null,null,null,null),
												   new Product(rs.getInt("p_no"),null,null,null,null,0,null,null,null)));
			}
			} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();
		}
		return findReviewListByPno;
	}
	/*
	 * 게시판번호로 리뷰한개 삭제
	 */
	public int removeByNo(int r_no) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		int removeRowCount = 0;
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(ReviewBoardSQL.REVIEW_DELETE_BY_R_NO);
			pstmt.setInt(1,r_no);
			removeRowCount = pstmt.executeUpdate();

		} finally {
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();

		}
		return removeRowCount;
	}

	
}// 끝
