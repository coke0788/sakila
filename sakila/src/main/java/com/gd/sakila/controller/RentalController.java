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
import org.springframework.web.bind.annotation.RestController;

import com.gd.sakila.service.FilmService;
import com.gd.sakila.service.InventoryService;
import com.gd.sakila.service.RentalService;
import com.gd.sakila.service.StaffService;
import com.gd.sakila.vo.Payment;
import com.gd.sakila.vo.Rental;
import com.gd.sakila.vo.StaffList;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@Transactional
@RequestMapping("/admin")
public class RentalController {
	@Autowired RentalService rentalService;
	@Autowired FilmService filmService;
	@Autowired StaffService staffService;
	@Autowired InventoryService inventoryService;
	
	@GetMapping("/getReturn")
	public String getReturn(Model model, @RequestParam(value= "customerId", required=true) int customerId,
										@RequestParam(value= "rentalId", required=true) int rentalId,
										@RequestParam(value="filmId", required=true) int filmId) {
		//선택용 staffList 받아오기 위해서 메서드 호출
		List<StaffList> staffList = staffService.getStaffList(null);
		//원래 대여기간, 사용자가 반납 할 때 총 대여기간, 대여료 표시용 메서드 호출
		Map<String, Object> durationMap = rentalService.getDuration(rentalId, customerId);
		model.addAttribute("rentalId",rentalId);
		model.addAttribute("customerId",customerId);
		model.addAttribute("staff", staffList);
		model.addAttribute("duration", durationMap);
		log.debug("=====================렌탈 아이디:"+rentalId);
		log.debug("=====================대여기간 표시용"+durationMap);
		return "getReturn";
	}
	@PostMapping("/getReturn")
	public String addPayment(@RequestParam(value= "customerId", required=true) int customerId,
							@RequestParam(value= "rentalId", required=true) int rentalId,
							@RequestParam(value= "staffId", required=true) int staffId,
							@RequestParam(value= "amount", required=true) double amount) {
		rentalService.addPayment(rentalId, customerId, staffId, amount);
		rentalService.getReturn(rentalId);
		log.debug("=====================렌탈 아이디:"+rentalId);
		log.debug("=====================고객 아이디:"+customerId);
		log.debug("=====================스탭 아이디:"+staffId);
		log.debug("=====================대여료:"+amount);
		return "redirect:/admin/getCustomerOne?customerId="+customerId;
	}
	
	@GetMapping("/addPayment")
	public String addPayment(Model model, @RequestParam(value= "customerId", required=true) int customerId,
										@RequestParam(value= "rentalId", required=true) int rentalId) {
		return "addPayment";
	}
	@GetMapping("/addRental")
	public String addRental(Model model, @RequestParam(value= "customerId", required=true) int customerId,
										@RequestParam(value="rowPerPage", defaultValue="10") int rowPerPage,
										@RequestParam(value="currentPage", defaultValue="1") int currentPage,
										@RequestParam(value="searchWord", required=false) String searchWord) {
		if(searchWord!=null && searchWord.equals("")) {
			searchWord = null;
		}
		Map<String, Object> map = inventoryService.getInventoryForRental(currentPage, rowPerPage, searchWord);
		//선택용 staffList 받아오기 위해서 메서드 호출
		List<StaffList> staffList = staffService.getStaffList(null);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("rowPerPage", map.get("rowPerPage"));
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("customerId", customerId);
		model.addAttribute("ck", map.get("stockList"));
		model.addAttribute("staff", staffList);
		return "addRental";
	}
	@PostMapping("/addRental")
	public String addRental(@RequestParam(value= "customerId", required=true) int customerId,
							@RequestParam(value= "staffId", required=true) int staffId,
							@RequestParam(value= "inventoryId", required=true) int inventoryId) {
		rentalService.addRental(inventoryId, customerId, staffId);
		return "redirect:/admin/getCustomerOne?customerId="+customerId;
	}
}
