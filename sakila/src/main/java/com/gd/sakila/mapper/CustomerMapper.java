package com.gd.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.sakila.vo.Customer;
import com.gd.sakila.vo.CustomerForm;


@Mapper
public interface CustomerMapper {
	int updateCustomerActiveByScheduler();	
	List<Customer> selectCustomerList(Map<String, Object> map);
	int selectCustomerTotal(Map<String, Object> map);
	Map<String, Object> selectCustomerOne(int customerId);
	List<Integer> selectBlackConsumer(int customerId);
	List<Integer> selectVIPCustomer(int customerId);
	List<Map<String, Object>> selectRentalListByCustomerId(int customerId);
	int insertCustomer(CustomerForm customerForm);
	int insertAddressForCustomer(CustomerForm customerForm);
	List<Map<String, Object>> selectCityList ();
}
