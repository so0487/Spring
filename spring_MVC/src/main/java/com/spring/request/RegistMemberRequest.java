package com.spring.request;

import com.spring.dto.MemberVO;

public class RegistMemberRequest {
	private String id;
	private String password;
	
	
	
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	
	public MemberVO toMemberVO() {
		MemberVO member = new MemberVO();
		member.setId(this.id);
		member.setPwd(this.password);
		
		return member;
	}
}
