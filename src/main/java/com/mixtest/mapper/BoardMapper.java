package com.mixtest.mapper;

import java.util.List;

import com.mixtest.domain.BoardVO;
import com.mixtest.domain.Criteria;

public interface BoardMapper {

	/* @Select("select * from tbl_board where bno>0") */
	/* public List<BoardVO> getList(); */
	
	public List<BoardVO> getListWithPaging(Criteria cri);
	
	public Long selectNextBno();
	
	public void insert(BoardVO board);
	
	public void insertSelectKey(BoardVO board);
	
	public BoardVO read(Long bno);
	
	public int delete(Long bno);
	
	public int update(BoardVO board);
	
	
}
