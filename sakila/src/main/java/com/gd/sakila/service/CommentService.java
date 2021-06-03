package com.gd.sakila.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.sakila.mapper.CommentMapper;
import com.gd.sakila.vo.Comment;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional

public class CommentService {
	@Autowired CommentMapper commentMapper;
	//댓글 삭제
	public int removeComment(int commentId) {
		int row = commentMapper.deleteCommentByCommentId(commentId);
		log.debug("============댓글 삭제 row 값 :" + row);
		log.debug("============댓글 삭제 commentId 값 :" + commentId);
		return row;
	}
	//댓글 등록
	public int addComment(Comment comment) {
		log.debug("============댓글 등록 comment:"+comment.toString());
		return commentMapper.insertComment(comment);
	}
}
