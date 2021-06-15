package com.gd.sakila.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.sakila.mapper.RentalMapper;
import com.gd.sakila.vo.Payment;
import com.gd.sakila.vo.Rental;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class RentalService {
	@Autowired RentalMapper rentalMapper;
	public void getReturn(int rentalId) {
		log.debug("========================빌림 rentalId:"+rentalId);
		int row = rentalMapper.updateRentalReturn(rentalId);
		log.debug("========================반납 row값:"+row);
	}
	public void addPayment(int rentalId, int customerId, int staffId, double amount) {
		Payment payment = new Payment();
		payment.setAmount(amount);
		payment.setCustomerId(customerId);
		payment.setRentalId(rentalId);
		payment.setStaffId(staffId);
		int row = rentalMapper.insertPaymentByReturn(payment);
		log.debug("========================대여료 row값:"+row);
	}
	public Map<String, Object> getDuration(int rentalId, int customerId){
		Map<String, Object> map = new HashMap<>();
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("rentalId", rentalId);
		paramMap.put("customerId", customerId);
		map = rentalMapper.selectRentalDurationAndDate(paramMap);
		log.debug("========================대여기간:"+map);
		return map;
	}
	public void addRental(int inventoryId, int customerId, int staffId) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("inventoryId", inventoryId);
		paramMap.put("customerId", customerId);
		paramMap.put("staffId", staffId);
		int row = rentalMapper.insertRentalData(paramMap);
		log.debug("========================반납 row값:"+row);
	}
}
