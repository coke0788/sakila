package com.gd.sakila.vo;

import lombok.Data;

@Data
public class Inventory {
	private int inventoryId;
	private int filmId;
	private int storeId;
	private int lastUpdate;
	private String title;
	private int total;
}
