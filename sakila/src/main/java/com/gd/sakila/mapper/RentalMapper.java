package com.gd.sakila.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.sakila.vo.Payment;
import com.gd.sakila.vo.Rental;

@Mapper
public interface RentalMapper {
	int updateRentalReturn(int rentalId);
	int insertPaymentByReturn(Payment payment);
	Map<String, Object> selectRentalDurationAndDate(Map<String, Object> map);
	int insertRentalData(Map<String, Object> map);
}
