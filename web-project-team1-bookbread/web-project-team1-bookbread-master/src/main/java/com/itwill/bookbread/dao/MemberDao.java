package com.itwill.bookbread.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.print.attribute.standard.PresentationDirection;

import org.apache.jasper.tagplugins.jstl.core.Remove;
import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;
import org.apache.tomcat.jdbc.pool.DataSource;

import com.itwill.bookbread.dto.Member;
import com.itwill.bookbread.sql.MemberSQL;

/*
USERID	VARCHAR2(100 BYTE)	No		1	
PASSWORD	VARCHAR2(100 BYTE)	Yes		2	
NAME	VARCHAR2(100 BYTE)	Yes		3	
PHONE	VARCHAR2(100 BYTE)	Yes		4	
BIRTH	VARCHAR2(100 BYTE)	Yes		5	
ADDRESS	VARCHAR2(100 BYTE)	Yes		6	
EMAIL	VARCHAR2(100 BYTE)	Yes		7	
INTEREST	VARCHAR2(200 BYTE)	Yes		8	
 */
public class MemberDao {
	private BasicDataSource dataSource;
	//데이타소스 연결
	public MemberDao()throws Exception {
		Properties properties = new Properties();
		properties.load(this.getClass().getResourceAsStream("/com/itwill/bookbread/common/jdbc.properties"));
		BasicDataSource basicDataSource = new BasicDataSource();
		basicDataSource.setDriverClassName(properties.getProperty("driverClass"));
		basicDataSource.setUrl(properties.getProperty("url"));
		basicDataSource.setUsername(properties.getProperty("user"));
		basicDataSource.setPassword(properties.getProperty("password"));
		dataSource = basicDataSource;
	}
	//회원가입
	public int create(Member member) throws Exception {
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(MemberSQL.MEMBER_INSERT);
		pstmt.setString(1,member.getUserId());
		pstmt.setString(2,member.getPassword());
		pstmt.setString(3,member.getName());
		pstmt.setString(4,member.getPhone());
		pstmt.setString(5,member.getBirth());
		pstmt.setString(6,member.getAddress());
		pstmt.setString(7,member.getEmail());
		pstmt.setString(8,member.getInterest());
		int insertRowCount = pstmt.executeUpdate();
		pstmt.close();
		con.close();
		return insertRowCount;
	}
	//정보수정
	public int update(Member member)throws Exception{
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(MemberSQL.MEMBER_UPDATE);
		pstmt.setString(1, member.getPassword());
		pstmt.setString(2, member.getName());
		pstmt.setString(3, member.getPhone());
		pstmt.setString(4, member.getBirth());
		pstmt.setString(5, member.getAddress());
		pstmt.setString(6, member.getEmail());
		pstmt.setString(7, member.getInterest());
		pstmt.setString(8, member.getUserId());
		int updateRowCount = pstmt.executeUpdate();
		pstmt.close();
		con.close();
		return updateRowCount;
	}

	//관리자가 회원정보수정
	public int updateAdmin(Member member)throws Exception{
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(MemberSQL.MEMBER_ADMIN_UPDATE);
		pstmt.setString(1, member.getPassword());
		pstmt.setString(2, member.getName());
		pstmt.setString(3, member.getPhone());
		pstmt.setString(4, member.getBirth());
		pstmt.setString(5, member.getAddress());
		pstmt.setString(6, member.getEmail());
		pstmt.setString(7, member.getUserId());
		int updateRowCount = pstmt.executeUpdate();
		pstmt.close();
		con.close();
		return updateRowCount;
	}
	
	/*
	 * 주소수정
	 */
	public int updateAddress(Member member) throws Exception{
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(MemberSQL.MEMBER_UPDATE_ADDRESS);
		pstmt.setString(1, member.getAddress());
		pstmt.setString(2, member.getUserId());
		int updateRowCount = pstmt.executeUpdate();
		pstmt.close();
		con.close();
		return updateRowCount;
	}
	//회원탈퇴
	public int delete(String userId) throws Exception{
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(MemberSQL.MEMBER_DELETE);
		pstmt.setString(1, userId);
		int removeRowCount = pstmt.executeUpdate();
		pstmt.close();
		con.close();
		return removeRowCount;
	}
	
	//관리자가 회원삭제
	public int deleteAdmin(Member member) throws Exception{
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(MemberSQL.MEMBER_DELETE);
		pstmt.setString(1, member.getUserId());
		int removeRowCount = pstmt.executeUpdate();
		pstmt.close();
		con.close();
		return removeRowCount;
	}
	
	//내 정보 보기
	public Member findMember(String userId) throws Exception {
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(MemberSQL.MEMBER_SELECT_BY_ID);
		Member findMember = null;
		pstmt.setString(1, userId);
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()) {
			findMember = new Member(rs.getString("userId"),
									rs.getString("password"),
									rs.getString("name"),
									rs.getString("phone"),
									rs.getString("birth"),
									rs.getString("address"),
									rs.getString("email"),
									rs.getString("interest"));
		}
		rs.close();
		pstmt.close();
		con.close();
		return findMember; 
	}
	
	//회원들 정보 보기
	public List<Member> findMemeber() throws Exception{
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(MemberSQL.MEMBER_SELECT_ALL);
		ResultSet rs = pstmt.executeQuery();
		List<Member> findMemberList = new  ArrayList<Member>();
		while (rs.next()) {
			findMemberList.add(new Member(rs.getString("userId"),
										  rs.getString("password"),
										  rs.getString("name"),
										  rs.getString("phone"),
										  rs.getString("birth"),
										  rs.getString("address"),
										  rs.getString("email"),
										  rs.getString("interest")));
						}
		rs.close();
		pstmt.close();
		con.close();
		return findMemberList;
	}
	//아이디 찾기 
	public String findId(String name, String phone)throws Exception {
		String mid = null;
		
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(MemberSQL.FIND_MEMBER_ID);
		Member findId = null;
		pstmt.setString(1, name);
		pstmt.setString(2, phone);
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()) {
			mid = rs.getString("userId");
		}
		con.close();
		pstmt.close();
		rs.close();
		return mid;
	}
	//비밀번호 찾기
	public String findPassword(String userId,String email)throws Exception{
		String mid= null;
		
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(MemberSQL.FIND_MEMBER_PASSWORD);
		Member findPassword = null;
		pstmt.setString(1, userId);
		pstmt.setString(2, email);
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()) {
			mid = rs.getString("password");
		}
		rs.close();
		pstmt.close();
		con.close();
		return mid;
	}
	//아이디 중복체크
	public boolean existedUser(String userId) throws Exception{
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(MemberSQL.MEMBER_SELECT_BT_ID_COUNT);
		pstmt.setString(1, userId);
		ResultSet rs = pstmt.executeQuery();
		boolean isExist = false;
		rs.next();
		int count = rs.getInt("cnt");
		if(count == 1) {
			isExist = true;
		}
		rs.close();
		pstmt.close();
		con.close();
		return isExist;
	}
	
	//주소만 변경하기
	public int modifyAddress(String address,String userId) throws Exception{
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(MemberSQL.MODIFY_ADDRESS);
		
		pstmt.setString(1, address);
		pstmt.setString(2, userId);
		
		int modifyCount = pstmt.executeUpdate();
		
		return modifyCount;
	}
}
	
	
	

