package com.gd.sakila.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.sakila.mapper.CustomerMapper;
import com.gd.sakila.vo.Customer;
import com.gd.sakila.vo.CustomerForm;
import com.gd.sakila.vo.Page;

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
	
	public void addCustomer(CustomerForm customerForm) {
		int addressRow = customerMapper.insertAddressForCustomer(customerForm);
		int row = customerMapper.insertCustomer(customerForm);
		log.debug("=======================주소 등록:"+addressRow);
		log.debug("=======================회원 등록:"+row);
	}
	
	public Map<String, Object> getCustomerList(int currentPage, int rowPerPage, String searchWord, int storeId, int active){
		int beginRow = (currentPage-1)*rowPerPage;
		log.debug("=======================고객리스트 페이지:"+rowPerPage);
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		paramMap.put("searchWord", searchWord);
		paramMap.put("storeId", storeId);
		paramMap.put("active", active);
		
		int totalRow = customerMapper.selectCustomerTotal(paramMap);
		int lastPage = totalRow/rowPerPage;
		if(totalRow%rowPerPage!=0) {
			lastPage += 1;
		}
		
		List<Integer> blackList = new ArrayList<>();
		List<Integer> VIPList = new ArrayList<>();
		List<Customer> list = customerMapper.selectCustomerList(paramMap);
		log.debug("=======================고객리스트:"+list);
		int customerId = 0;
		for(Customer data : list) {
			customerId = (int) data.getCustomerId();
			blackList.addAll(customerMapper.selectBlackConsumer(customerId));
			VIPList.addAll(customerMapper.selectVIPCustomer(customerId));
		}
		log.debug("=======================블랙리스트:"+blackList);
		
		Map<String, Object> map = new HashMap<>();
		map.put("beginRow", beginRow);
		map.put("lastPage", lastPage);
		map.put("list", list);
		map.put("blackList", blackList);
		map.put("VIPList", VIPList);
		return map;
	}
	
	public Map<String, Object> getCustoemrOne(int customerId){
		Map<String, Object> map = customerMapper.selectCustomerOne(customerId);
		Map<String, Object> returnMap = new HashMap<>();
		List<Map<String, Object>> rentalList = customerMapper.selectRentalListByCustomerId(customerId);
		List<Integer> blackList = customerMapper.selectBlackConsumer(customerId);
		List<Integer> VIPList = customerMapper.selectVIPCustomer(customerId);
		returnMap.put("map", map);
		returnMap.put("VIPList", VIPList);
		returnMap.put("blackList", blackList);
		returnMap.put("rentalList", rentalList);
		log.debug("=======================고객리스트:"+map.get("storeId"));
		log.debug("=======================고객리스트:"+map.get("email"));
		log.debug("=======================블랙:"+map.get("blackList"));
		log.debug("=======================븨아피:"+map.get("VIPList"));
		log.debug("=======================빌린거:"+map.get("rentalList"));
		return returnMap;
	}
}
