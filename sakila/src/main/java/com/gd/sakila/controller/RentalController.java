package com.gd.sakila.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.gd.sakila.service.RentalService;
import com.gd.sakila.vo.Payment;
import com.gd.sakila.vo.Rental;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@Transactional
@RequestMapping("/admin")
public class RentalController {
	@Autowired RentalService rentalService;
	
	@GetMapping("/getReturn")
	public String getReturn(Rental rental) {
		log.debug("=====================렌탈 아이디:"+rental.getRentalId());
		rentalService.getReturn(rental.getRentalId());
		return "redirect:/addPayment?rentalId="+rental.getRentalId();
	}
	@GetMapping("/addPayment")
	public String addPayment(Model model, @RequestParam(value= "customerId", required=true) int customerId) {
		return "addPayment";
	}
	@PostMapping("/addPayment")
	public String addPayment(Payment payment, @RequestParam(value= "customerId", required=true) int customerId) {
		return "redirect:/getCustomerOne?customerId="+customerId;
	}
}
