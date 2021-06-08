package com.gd.sakila.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.gd.sakila.service.StaffService;
import com.gd.sakila.vo.Staff;

import jdk.internal.org.jline.utils.Log;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class HomeController {
	@Autowired StaffService staffService;

	//Logger log = LoggerFactory.getLogger(this.getClass()); //getLogger(클래스타입)  this.getClass 본인의 클래스를 매개변수로 호출한다.
	@GetMapping({"/","/home","/index"})
	public String home() {
		log.debug("home");
		return "home";
	}
	@GetMapping("/admin/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@PostMapping("/login")
	public String login(HttpSession session, Staff staff) {
		log.debug("=========== 로그인 시 staff : "+staff.toString());
		Staff loginStaff = staffService.login(staff);
		log.debug("=========== 로그인 시 loginstaff : "+loginStaff);
		if(loginStaff!=null) { //로그인 성공
			session.setAttribute("loginStaff", loginStaff); //new Staff를 넣을 것임.
		}
		return "redirect:/admin/getBoardList";
	}
}
