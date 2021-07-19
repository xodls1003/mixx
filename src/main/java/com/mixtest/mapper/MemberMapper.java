package com.mixtest.mapper;

import com.mixtest.domain.AuthVO;
import com.mixtest.domain.MemberVO;

public interface MemberMapper {
	
	public MemberVO read(String userid);
	
	public void insert(MemberVO member);
	
	public void insertAuth(AuthVO auth);
}
