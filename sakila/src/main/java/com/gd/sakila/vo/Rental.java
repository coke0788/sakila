package com.gd.sakila.vo;

import lombok.Data;

@Data
public class Rental {
	private int rentalId;
	private int rentalDate;
	private int inventoryId;
	private int customerId;
	private String returnDate;
	private int staffId;
	private String lastUpdate;
}
