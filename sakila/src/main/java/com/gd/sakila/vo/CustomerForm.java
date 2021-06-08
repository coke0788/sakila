package com.gd.sakila.vo;

import lombok.Data;

@Data
public class CustomerForm {
	private int addressId;
	private String address;
	private String address2;
	private String district;
	private int cityId;
	private int postalCode;
	private String phone;
	private int customerId;
	private int storeId;
	private String firstName;
	private String lastName;
	private String email;
	private int active;
}
