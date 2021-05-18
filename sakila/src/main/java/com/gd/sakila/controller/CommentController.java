package com.gd.sakila.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.sakila.service.CommentService;
import com.gd.sakila.vo.Comment;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@Transactional
public class CommentController {
	@Autowired CommentService commentService;
	
	//댓글 삭제
	@PostMapping("/removeComment")
	public String removeComment (Comment comment) {
		int row = commentService.removeComment(comment.getCommentId());
		log.debug("============댓글 삭제 commentId : "+comment.getCommentId());
		log.debug("============댓글 삭제 row : "+row);
		return "redirect:/getBoardOne?boardId="+comment.getBoardId();
	}
	
	//댓글 입력
	@GetMapping("/addComment")
	public String insertComment (Model model, Comment comment, @RequestParam(value="boardId", required=true) int boardId) {
		model.addAttribute("boardId", boardId);
		log.debug("===============댓글 입력 board id : "+boardId);
		return "addComment";
	}
	@PostMapping("/addComment")
	public String insertComment (Comment comment) {
		commentService.addComment(comment);
		log.debug("==============댓글입력 comment :"+comment.toString());
		return "redirect:/getBoardOne?boardId="+comment.getBoardId();
	}
}
