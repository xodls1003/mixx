package com.mixtest.domain;

import lombok.Getter;
import lombok.ToString;
import lombok.extern.log4j.Log4j;

@Getter
@ToString
@Log4j
public class PageDTO {
	private int startPage;
	private int endPage;
	private boolean prev, next;
	
	private int total;
	private Criteria cri;
	
	public PageDTO(Criteria cri, int total) {
		this.cri = cri;
		this.total = total;
		
		this.endPage = (int)(Math.ceil(cri.getPageNum()/10.0))*10;
		log.info("endPage = "+ endPage);
		this.startPage = this.endPage-9;
		int realEnd = (int)(Math.ceil(total*1.0)/cri.getAmount());
		
		log.info("realEnd = "+ realEnd);
		
		if(realEnd<this.endPage) {
			this.endPage= realEnd;
		}
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
		
	}
}
