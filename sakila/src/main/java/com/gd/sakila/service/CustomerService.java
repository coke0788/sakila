package com.gd.sakila.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.sakila.mapper.CustomerMapper;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
@Transactional
public class CustomerService {
	@Autowired CustomerMapper customerMapper;
	public void modifyCustomerActiveByScheduler() {
		log.debug("================고객 비활성화 조건 실행");
		int row = customerMapper.updateCustomerActiveByScheduler();
		log.debug("================고객 비활서화 조건 실행 row 값 : "+row);
	}
}
