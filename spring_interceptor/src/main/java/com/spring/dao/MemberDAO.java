package com.spring.dao;

import java.sql.SQLException;

import com.spring.dto.MemberVO;

public interface MemberDAO {
	

	void insertMember(MemberVO member)throws SQLException;
	
	MemberVO selectMember(String id)throws SQLException;
}
