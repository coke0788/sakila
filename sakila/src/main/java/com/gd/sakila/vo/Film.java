package com.gd.sakila.vo;

import lombok.Data;

@Data
public class Film {
	int filmId;
	String title;
	String description;
	String releaseYear;
	String actors;
	int language;
	int rentalDuration;
	double rentalRate;
	int length;
	double replacementCost;
	String rating;
	String specialFeatures;
	String lastUpdate;
}
