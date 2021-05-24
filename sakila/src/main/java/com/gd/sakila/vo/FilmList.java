package com.gd.sakila.vo;

import lombok.Data;

@Data
public class FilmList {
	int FID;
	String title;
	String description;
	String category;
	double price;
	int length;
	String rating;
	String actors;
}
