package com.mixtest.domain;

import org.springframework.web.util.UriComponentsBuilder;

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
	
	private String type;
	private String keyword;
	
	public Criteria() {
		this(1,10,0);
	}
	
	public Criteria(int pageNum,int amount, int startNum) {
		this.pageNum = pageNum;
		this.amount=amount;
		this.startNum= startNum;
	}
	public String[] getTypeArr() {
		return type == null? new String[] {}:type.split("");
	}
	//여러개의 파라미터를 연결하여 URL의 형태로 만들어줌 -> 리다이렉트,form태그를 사용하는 일 줄일 수 있음
	public String getListLink() {
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("pageNum", this.pageNum)
				.queryParam("amount", this.getAmount())
				.queryParam("type", this.getType())
				.queryParam("keyword", this.getKeyword());
		return builder.toUriString();
	}
}
