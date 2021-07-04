package com.mixtest.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.mixtest.domain.BoardVO;
import com.mixtest.domain.Criteria;
import com.mixtest.mapper.BoardMapper;
import com.mixtest.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class BoardServiceImpl implements BoardService{
	
	@Override
	public List<BoardVO> getList(Criteria cri) {
		// TODO Auto-generated method stub
		log.info("get List with criteria: " + cri);;
		
		return mapper.getListWithPaging(cri);
	}

	private BoardMapper mapper;
	
	@Override
	public void register(BoardVO board) {
		log.info("register....." + board);
		mapper.insertSelectKey(board);
		
	}

	@Override
	public BoardVO get(Long bno) {
		// TODO Auto-generated method stub
		log.info("get.........." + bno);
		return mapper.read(bno);
	}

	@Override
	public boolean modify(BoardVO board) {
		// TODO Auto-generated method stub
		log.info("modify......" + board);
		return mapper.update(board) == 1;
	}

	@Override
	public boolean remove(Long bno) {
		// TODO Auto-generated method stub
		log.info("remove...." + bno);
		return mapper.delete(bno) == 1;
	}

	/*
	 * @Override public List<BoardVO> getList() { // TODO Auto-generated method stub
	 * log.info("getList......"); return mapper.getList(); }
	 */
}
