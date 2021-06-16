package com.gd.sakila.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gd.sakila.mapper.ReportMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@Transactional
@RequestMapping("/admin")
public class ReportRestController {
	@Autowired ReportMapper reportMapper;
	
	@GetMapping("/getCategorySales")
	public List<Map<String, Object>> getCategorySales() {
		return reportMapper.selectSalesByCategory();
	}
	@GetMapping("/getStoreSales")
	public List<Map<String, Object>> getStoreSales() {
		return reportMapper.selectSalesByStore();
	}
	@GetMapping("/getBestSeller")
	public List<Map<String, Object>> getBestSeller() {
		return reportMapper.selectBestSeller();
	}
	@GetMapping("/getMonthlySales")
	public List<Map<String, Object>> getMonthlySales() {
		return reportMapper.selectMonthlySales();
	}
}
