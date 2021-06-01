package com.gd.sakila.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.sakila.service.InventoryService;
import com.gd.sakila.vo.Page;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@Transactional
@RequestMapping("/admin")
public class InventoryController {
	@Autowired InventoryService inventoryService;
	
	@GetMapping("/getInventoryInfoList")
	public String getInventoryInfoList(Model model, @RequestParam(value="rowPerPage", defaultValue="10") int rowPerPage,
													@RequestParam(value="currentPage", defaultValue="1") int currentPage,
													@RequestParam(value="searchWord", required=false) String searchWord) {
		if(searchWord!=null && searchWord.equals("")) {
			searchWord = null;
		}
		Map<String, Object> map = inventoryService.getInventoryInfoList(currentPage, rowPerPage, searchWord);
		model.addAttribute("rowPerPage", map.get("rowPerPage"));
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("lastPage", map.get("lastPage"));
		log.debug("==================인벤토리 리스트:"+map.get("list"));
		log.debug("==================인벤토리 리스트 검색어:"+searchWord);
		return "getInventoryInfoList";
	}
}
