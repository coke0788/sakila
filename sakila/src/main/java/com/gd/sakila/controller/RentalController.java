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
	
	@GetMapping("/getReturn")
	public String getReturn(Model model, @RequestParam(value= "customerId", required=true) int customerId,
										@RequestParam(value= "rentalId", required=true) int rentalId,
										@RequestParam(value="filmId", required=true) int filmId) {
		int storeId = 1;
		//대여료 받아오기 위해서 film의 상세페이지 메서드 호출.
		Map<String, Object> map = filmService.getFilmOne(filmId, storeId);
		//선택용 staffList 받아오기 위해서 메서드 호출
		List<StaffList> staffList = staffService.getStaffList(null);
		model.addAttribute("rentalId",rentalId);
		model.addAttribute("customerId",customerId);
		model.addAttribute("film", map.get("filmMap"));
		model.addAttribute("staff", staffList);
		log.debug("=====================렌탈 아이디:"+rentalId);
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
}
