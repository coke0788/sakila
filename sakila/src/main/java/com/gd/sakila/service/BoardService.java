package com.gd.sakila.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.sakila.controller.HomeController;
import com.gd.sakila.mapper.BoardMapper;
import com.gd.sakila.mapper.CommentMapper;
import com.gd.sakila.vo.Board;
import com.gd.sakila.vo.Comment;
import com.gd.sakila.vo.Page;

import jdk.internal.org.jline.utils.Log;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class BoardService {
	@Autowired BoardMapper boardMapper;
	@Autowired CommentMapper commentMapper;
	
	//게시글 수정
	public int modifyBoard(Board board){
		log.debug("=========수정 Board : " + board.toString());
		return boardMapper.updateBoard(board);
	}
	
	//게시글 삭제
	public int removeBoard(Board board) {
		log.debug("======= 삭제 Board :"+ board.toString());
		// 2) 게시글 삭제
		int boardRow = boardMapper.deleteBoard(board);
		log.debug("======= 삭제 Board :"+boardRow);
		if(boardRow == 0) {
			return 0;
		}
		// 1) 댓글 삭제
		int commentRow = commentMapper.deleteCommentByBoardId(board.getBoardId());
		log.debug("======= 댓글삭제 BoardId :"+ commentRow);

		return boardRow;
	}
	//게시글 추가
	public int addBoard(Board board) {
		log.debug("======= 등록 Board :"+board.toString());
		return boardMapper.insertBoard(board);
	}
	public Map<String, Object> getBoardOne(int boardId) {
		log.debug("======= Board리스트 boardId :"+boardId);
		// 상세보기
		Map<String, Object> boardMap = boardMapper.selectBoardOne(boardId);
		log.debug("======= map : "+boardMap);
		//댓글 리스트
		List<Comment> commentList = commentMapper.selectCommentListByBoard(boardId);
		log.debug("========= 댓글 목록 크기 : "+commentList.size());
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boardMap", boardMap);
		map.put("commentList", commentList);
		return map;
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
