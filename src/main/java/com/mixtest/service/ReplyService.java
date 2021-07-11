package com.mixtest.service;

import java.util.List;

import com.mixtest.domain.Criteria;
import com.mixtest.domain.ReplyPageDTO;
import com.mixtest.domain.ReplyVO;

public interface ReplyService {
	
	public int register(ReplyVO vo);
	
	public ReplyVO get(Long rno);
	
	public int modify(ReplyVO vo);
	
	public int remove(Long rno);
	
	public ReplyPageDTO getListPage(Criteria cri, Long bno);
}
