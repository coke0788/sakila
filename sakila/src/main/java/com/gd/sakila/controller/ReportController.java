package com.gd.sakila.controller;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@Transactional
@RequestMapping("/admin")
public class ReportController {

	@GetMapping("/getReport")
	public String getReport(Model model) {
		return "/getReport";
	}
}
