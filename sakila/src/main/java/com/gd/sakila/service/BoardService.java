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
	public int deleteComment(Comment comment) {
		log.debug("========코멘트 삭제 comment"+comment.toString());
		return commentMapper.deleteCommentByBoard(comment);
	}
	public int modifyBoard(Board board){
		log.debug("=========수정 Board : " + board.toString());
		return boardMapper.updateBoard(board);
	}
	
	public int removeBoard(Board board) {
		log.debug("======= 삭제 Board :"+board.toString());
		return boardMapper.deleteBoard(board);
	}
	public int addBoard(Board board) {
		log.debug("======= 등록 Board :"+board.toString());
		return boardMapper.insertBoard(board);
	}
	public Map<String, Object> getBoardOne(int boardId) {
		log.debug("======= Board리스트 boardId :"+boardId);
		// 상세보기
		Map<String, Object> boardMap = boardMapper.selectBoardOne(boardId);
		log.debug("map : "+boardMap);
		//댓글 리스트
		List<Comment> commentList = commentMapper.selectCommentListByBoard(boardId);
		log.debug("댓글 목록 크기 : "+commentList.size());
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
