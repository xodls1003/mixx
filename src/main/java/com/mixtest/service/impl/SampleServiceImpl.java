package com.mixtest.service.impl;

import org.springframework.stereotype.Service;

import com.mixtest.service.SampleService;

@Service
public class SampleServiceImpl implements SampleService{

	@Override
	public Integer doAdd(String str1, String str2) throws Exception {
		// TODO Auto-generated method stub
		return Integer.parseInt(str1)+ Integer.parseInt(str2);
	}

}
