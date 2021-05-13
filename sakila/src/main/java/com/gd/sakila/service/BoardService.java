package com.gd.sakila.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.sakila.mapper.BoardMapper;
import com.gd.sakila.vo.Board;
import com.gd.sakila.vo.Page;

@Service
@Transactional
public class BoardService {
	@Autowired
	BoardMapper boardMapper;
	public int addBoard(Board board) {
		return boardMapper.insertBoard(board);
	}
	public Map<String, Object> getBoardOne(int boardId) {
		return boardMapper.selectBoardOne(boardId);
	}
	public Map<String, Object> getBoardList(int currentPage, int rowPerPage, String searchWord) {
		int boardTotal = boardMapper.selectBoardTotal(searchWord); //searchword가 필요
		int lastPage = boardTotal/rowPerPage;
		if(boardTotal%rowPerPage!=0) {
			lastPage += 1;
		}
		Page page = new Page();
		page.setBeginRow((currentPage-1)*rowPerPage);
		page.setRowPerPage(rowPerPage);
		page.setSearchWord(searchWord);
		System.out.println("=======Page"+page);
		
		List<Board> boardList = boardMapper.selectBoardList(page); //page가 필요
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boardTotal", boardTotal);
		map.put("boardList", boardList);
		map.put("lastPage", lastPage);
		System.out.println("=======map"+map);
		return map;
	}
}
