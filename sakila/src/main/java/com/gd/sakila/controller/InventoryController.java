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

import com.gd.sakila.service.InventoryService;
import com.gd.sakila.vo.Inventory;
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
		model.addAttribute("stockCnt", map.get("stockCnt"));
		model.addAttribute("notStockCnt", map.get("notStockCnt"));
		log.debug("==================마지막페이지:"+map.get("lastPage"));
		log.debug("==================대여가능수량 리스트:"+map.get("stockCnt"));
		log.debug("==================대여중수량 리스트:"+map.get("notStockCnt"));
		log.debug("==================인벤토리 리스트:"+map.get("list"));
		log.debug("==================인벤토리 리스트 검색어:"+searchWord);
		return "getInventoryInfoList";
	}
	
	@GetMapping("/getInventoryOne")
	public String getInventoryOne(Model model, @RequestParam(value="filmId", required=true) int filmId,
												@RequestParam(value="currentPage", required=true) int currentPage,
												@RequestParam(value="searchWord", required=false) String searchWord,
												@RequestParam(value="rowPerPage", defaultValue="10") int rowPerPage,
												@RequestParam(value="title", required=true) String title) {
		Map<String, Object> map = inventoryService.getInventoryOne(filmId);
		model.addAttribute("stockList1",map.get("stockList1"));
		model.addAttribute("stockList2",map.get("stockList2"));
		model.addAttribute("notStockList1",map.get("notStockList1"));
		model.addAttribute("notStockList2",map.get("notStockList2"));
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("title", title);
		model.addAttribute("filmId", filmId);
		return "getInventoryOne";
	}
	
	@GetMapping("/removeInventory")
	public String removeInventory (@RequestParam(value="filmId", required=true) int filmId,
								@RequestParam(value="inventoryId", required=true) int inventoryId,
								@RequestParam(value="currentPage", required=true) int currentPage,
								@RequestParam(value="searchWord", required=false) String searchWord,
								@RequestParam(value="rowPerPage", defaultValue="10") int rowPerPage,
								@RequestParam(value="title", required=true) String title) {
		log.debug("===================인벤토리 삭제 inventoryId:"+inventoryId);
		int row=inventoryService.removeInventory(inventoryId);
		log.debug("===================인벤토리 삭제 row:"+row);
		return "redirect:/admin/getInventoryOne?filmId="+filmId+"&currentPage="+currentPage+"&searchWord="+searchWord+"&title="+title;
	}
	@GetMapping("/addInventory")
	public String addInventory (Model model,
								@RequestParam(value="filmId", required=true) int filmId,
								@RequestParam(value="currentPage", required=true) int currentPage,
								@RequestParam(value="searchWord", required=false) String searchWord,
								@RequestParam(value="rowPerPage", defaultValue="10") int rowPerPage,
								@RequestParam(value="title", required=true) String title) {
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("title", title);
		model.addAttribute("filmId", filmId);
		return "addInventory";
	}
	@PostMapping("/addInventory")
	public String addInventory (Inventory inventory,
								@RequestParam(value="currentPage", required=true) int currentPage,
								@RequestParam(value="searchWord", required=false) String searchWord,
								@RequestParam(value="rowPerPage", defaultValue="10") int rowPerPage) {
		int row = inventoryService.addInventory(inventory);
		int filmId = inventory.getFilmId();
		String title = inventory.getTitle();
		log.debug("====================인벤토리 입력 row :"+row);
		return "redirect:/admin/getInventoryOne?filmId="+filmId+"&currentPage="+currentPage+"&searchWord="+searchWord+"&title="+title;
	}
	
	
}
