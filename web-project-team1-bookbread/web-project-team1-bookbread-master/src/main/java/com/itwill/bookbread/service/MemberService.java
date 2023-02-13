package com.itwill.bookbread.service;

import java.util.ArrayList;
import java.util.List;

import com.itwill.bookbread.dao.MemberDao;
import com.itwill.bookbread.dto.Member;
import com.itwill.bookbread.user.exception.ExistedUserException;
import com.itwill.bookbread.user.exception.PasswordMismatchException;
import com.itwill.bookbread.user.exception.UserNotFoundException;

public class MemberService {
	private MemberDao memberDao;

	public MemberService() throws Exception {
		memberDao = new MemberDao();
	}

	// 회원가입
	public int create(Member member) throws Exception {
		if (memberDao.existedUser(member.getUserId())) {
			throw new ExistedUserException(member.getUserId() + "는 이미 존재하는 아이디 입니다");
		}
		return memberDao.create(member);
	}

	// 로그인
	public Member login(String userId, String password) throws Exception {
		Member member = memberDao.findMember(userId);
		if (member == null) {
			throw new UserNotFoundException("아이디 틀림ㅎㅋㅎ");// 아이디 존재하지 않을때
		} else {
			if (!member.isMatchPassword(password)) {
				throw new PasswordMismatchException("비밀번호 틀림ㅎㅎㅋ"); // 비밀번호 틀렸을때
			}
		}
		return member;
	}
	
	// 회원정보 전체출력
	public List<Member> findAllMember() throws Exception{
		List<Member> findAllmember = memberDao.findMemeber();
		return findAllmember;
	}
	
	// 회원정보
	public Member findMember(String userId) throws Exception {
		Member findMember = memberDao.findMember(userId);
		return findMember;
	}

	// 회원수정
	public int update(Member member) throws Exception {
		return memberDao.update(member);
	}

	// 관리자가 회원수정
	public int updateAdmin(Member member) throws Exception {
		return memberDao.updateAdmin(member);
	}
	
	// 관리자가 회원삭제
	public int deleteAdmin(Member member) throws Exception {
		return memberDao.deleteAdmin(member);
	}

	
	// 회원수정
	
	public int updateAddress(Member member) throws Exception {
		return memberDao.updateAddress(member);
	}

	// 회원탈퇴
	public int remove(String userId) throws Exception {
		return memberDao.delete(userId);
	}

	// 아이디 중복체크
	public boolean existedUser(String userId) throws Exception {
		boolean isExist = memberDao.existedUser(userId);
		if (isExist) {
			return true;
		} else {
			return false;
		}
	}

	// 아이디 찾기
	public String findId(String name, String phone) throws Exception {
		return memberDao.findId(name, phone);
	}

	// 비밀번호 찾기
	public String findPassword(String userId, String email) throws Exception {
		return memberDao.findPassword(userId, email);
	}
	
	//주소변경
	public int modifyAddress(String address, String userId) throws Exception{
		
		return memberDao.modifyAddress(address, userId);
	}

}
