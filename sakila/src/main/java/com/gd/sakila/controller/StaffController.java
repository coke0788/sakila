package com.gd.sakila.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.sakila.service.StaffService;
import com.gd.sakila.vo.StaffList;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Controller
@RequestMapping("/admin")
public class StaffController {
	@Autowired StaffService staffService;
	@GetMapping("/getStaffList")
	
	//staff 목록은 staff vo가 아니라 staffList vo 리스트를 가져올 것.
	public String getStaffList(Model model, @RequestParam(value="searchWord", required=false) String searchWord) {
		//서비스 호출
		List<StaffList> staffList = staffService.getStaffList(searchWord);
		//모델에 staffList 값 저장. (=setAttribute랑 비슷한 기능)
		model.addAttribute("staffList", staffList);
		log.debug("===============직원 목록 : "+staffList);
		return "getStaffList";
	}
}
