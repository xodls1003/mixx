package com.mixtest.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.mixtest.domain.BoardVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	
	@Test
	public void testGetList() {
		mapper.getList()
		.forEach(board-> log.info(board));
		}
	
	@Test
	public void testRead() {
		BoardVO board = mapper.read(5L);
		
		log.info(board);
	}
	
	@Test
	public void testInsert() {
		BoardVO board = new BoardVO();
		board.setTitle("테스트 새로 작성글 제목");
		board.setContent("테스트 새로 작성 글 내용");
		board.setWriter("테스트 새로 작성자");
		
		mapper.insert(board);
		log.info(board);
	}
	
	@Test
	public void testInsertSelectKey() {
		BoardVO board = new BoardVO();
		board.setTitle("select key로 새로 작성하는 글");
		board.setContent("selectKey로 새로 작성하는 내용");
		board.setWriter("selectkey 작성자");
		
		mapper.insertSelectKey(board);
		log.info(board);
	}
	
	@Test
	public void testDelete() {
		log.info("DELETE COUNT: " + mapper.delete(3L));
	}
	
	@Test
	public void testUpdate() {
		BoardVO board = new BoardVO();
		board.setBno(5L);
		board.setTitle("테스트로 수정제목");
		board.setContent("테스트로 수정내용");
		board.setWriter("테스트로 수정작성자");
		
		int count = mapper.update(board);
		log.info("UPDATE COUNT: " + count);
		
	}
}
