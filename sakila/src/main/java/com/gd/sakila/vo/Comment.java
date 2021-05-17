package com.gd.sakila.vo;

import lombok.Data;

@Data
public class Comment {
	private int commentId;
	private String commentContent;
	private String username;
	private int boardId;
	private String insertDate;
}
