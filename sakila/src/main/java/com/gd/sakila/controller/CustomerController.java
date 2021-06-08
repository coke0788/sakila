package com.gd.sakila.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.sakila.mapper.CustomerMapper;
import com.gd.sakila.service.CustomerService;
import com.gd.sakila.vo.CustomerForm;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@Transactional
@RequestMapping("/admin")
public class CustomerController {
	@Autowired CustomerService customerService;
	@Autowired CustomerMapper customerMapper;
	
	@GetMapping("/addCustomer")
	public String addCustomer(Model model) {
		List<Map<String, Object>> list = customerMapper.selectCityList();
		model.addAttribute("list", list);
		return "addCustomer";
	}
	
	@PostMapping("/addCustomer")
	public String addCustomer(CustomerForm customerForm) {
		customerService.addCustomer(customerForm);
		return "redirect:/admin/getCustomerList";
	}
	
	@GetMapping("/getCustomerList")
	public String getCustomerList (Model model, @RequestParam(value="rowPerPage", defaultValue="10") int rowPerPage,
												@RequestParam(value="currentPage", defaultValue="1") int currentPage,
												@RequestParam(value="storeId", defaultValue="0") int storeId,
												@RequestParam(value="active", defaultValue="2") int active,
												@RequestParam(value="searchWord", required=false) String searchWord) {
		if(searchWord!=null && searchWord.equals("")) {
			searchWord = null;
		}
		Map<String, Object> map = customerService.getCustomerList(currentPage, rowPerPage, searchWord, storeId, active);
		log.debug("=======================고객리스트:"+map.get("list"));
		log.debug("=======================고객리스트 검색어:"+searchWord);
		log.debug("=======================고객리스트 시작 페이지:"+map.get("beginRow"));
		log.debug("=======================고객리스트 rowPerPage:"+rowPerPage);
		model.addAttribute("rowPerPage", rowPerPage);
		model.addAttribute("beginRow", map.get("beginRow"));
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("storeId", storeId);
		model.addAttribute("active", active);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("blackList", map.get("blackList"));
		model.addAttribute("VIPList", map.get("VIPList"));
		log.debug("=======================고객리스트 :"+map.get("list"));
		return "getCustomerList";
	}
	
	@GetMapping("/getCustomerOne") 
	public String getCustomerOne (Model model, @RequestParam(value="rowPerPage", defaultValue="10") int rowPerPage,
												@RequestParam(value="currentPage", defaultValue="1") int currentPage,
												@RequestParam(value="storeId", defaultValue="0") int storeId,
												@RequestParam(value="active", defaultValue="2") int active,
												@RequestParam(value="customerId", required=true) int customerId,
												@RequestParam(value="searchWord", required=false) String searchWord) {
		Map<String, Object> map = customerService.getCustoemrOne(customerId);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("storeId", storeId);
		model.addAttribute("active", active);
		model.addAttribute("map", map.get("map"));
		model.addAttribute("blackList", map.get("blackList"));
		model.addAttribute("VIPList", map.get("VIPList"));
		model.addAttribute("rentalList", map.get("rentalList"));
		log.debug("==============================VIP"+map.get("VIPList"));
		log.debug("==============================BLACK"+map.get("blackList"));
		return "getCustomerOne";	
	} 
}
