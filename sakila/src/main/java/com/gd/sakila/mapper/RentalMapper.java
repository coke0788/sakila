package com.gd.sakila.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.gd.sakila.vo.Payment;
import com.gd.sakila.vo.Rental;

@Mapper
public interface RentalMapper {
	int updateRentalReturn(int rentalId);
	int insertPaymentByReturn(Payment payment);
}
