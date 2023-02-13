package com.itwill.bookbread.dto;

public class Member {
	private String userId;
	private String password;
	private String name;
	private String phone;
	private String birth;
	private String address;
	private String email;
	private String interest;

	public Member() {
		// TODO Auto-generated constructor stub
	}

	public Member(String userId, String password, String name, String phone, String birth, String address, String email,
			String interest) {
		super();
		this.userId = userId;
		this.password = password;
		this.name = name;
		this.phone = phone;
		this.birth = birth;
		this.address = address;
		this.email = email;
		this.interest = interest;
	}
	
	

	public Member(String userId, String password, String name, String phone, String birth, String address,
			String email) {
		super();
		this.userId = userId;
		this.password = password;
		this.name = name;
		this.phone = phone;
		this.birth = birth;
		this.address = address;
		this.email = email;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getInterest() {
		return interest;
	}

	public void setInterest(String interest) {
		this.interest = interest;
	}
	//password 일치여부
	public boolean isMatchPassword(String password) {
		boolean isMatch=false;
		if(this.password.equals(password)) {
			isMatch=true;
		}
		return isMatch;
	}
	

	@Override
	public String toString() {
		return "Member [userId=" + userId + ", password=" + password + ", name=" + name + ", phone=" + phone
				+ ", birth=" + birth + ", address=" + address + ", email=" + email + ", interest=" + interest + "]";
	}

}
