package com.mixtest.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mixtest.domain.Criteria;
import com.mixtest.domain.ReplyPageDTO;
import com.mixtest.domain.ReplyVO;
import com.mixtest.mapper.BoardMapper;
import com.mixtest.mapper.ReplyMapper;
import com.mixtest.service.ReplyService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
@Service
@Log4j
public class ReplyServiceImpl implements ReplyService{

	//의존적인 관계이기 때문에 AllArgsConstructor를 이용하여 처리하는것이 더 편리하다
	
	@Setter(onMethod_ = @Autowired)
	private BoardMapper boardMapper;
	
	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;
	
	@Transactional
	@Override
	public int register(ReplyVO vo) {
			
		log.info("register...." + vo);
		boardMapper.updateReplyCnt(vo.getBno(), 1);
		return mapper.insert(vo);
	}

	@Override
	public ReplyVO get(Long rno) {
		
		log.info("get......" + rno);
		
		return mapper.read(rno);
		
	}

	@Override
	public int modify(ReplyVO vo) {
		
		log.info("modify......" + vo);
				
		return mapper.update(vo);
	}
	
	@Transactional
	@Override
	public int remove(Long rno) {
		log.info("remove...." + rno);
		ReplyVO vo = mapper.read(rno);
		
		boardMapper.updateReplyCnt(vo.getBno(), -1);
		return mapper.delete(rno);
	}


	@Override
	public ReplyPageDTO getListPage(Criteria cri, Long bno) {
	
		return new ReplyPageDTO(
				mapper.getCountByBno(bno),
				mapper.getListwithPaging(cri, bno));
	}
	

}
