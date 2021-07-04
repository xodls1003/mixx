package com.mixtest.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {
	
	private int pageNum;
	private int amount;
	private int startNum;
	
	public Criteria() {
		this.pageNum=1;
		this.amount =10;
		this.startNum=0;
	}
	
	public Criteria(int pageNum) {
		this.pageNum = pageNum;
		this.amount=10;
		this.startNum= (pageNum-1)*10;
	}
}
