package com.gd.sakila.vo;

import lombok.Data;

@Data //lombok 이용. lombok 이 해주는 편리한 기능들을 모두 사용함. 여기서 사용할건 getter setter
public class Page {
	private int rowPerPage;
	private int beginRow;
}
