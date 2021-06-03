package com.gd.sakila.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.sakila.mapper.FilmMapper;
import com.gd.sakila.mapper.InventoryMapper;
import com.gd.sakila.vo.Inventory;
import com.gd.sakila.vo.Page;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class InventoryService {
	@Autowired InventoryMapper inventoryMapper;
	@Autowired FilmMapper filmMapper;
	
	public Map<String, Object> getInventoryInfoList(int currentPage, int rowPerPage, String searchWord){
		Page page = new Page();
		page.setBeginRow((currentPage-1)*rowPerPage);
		page.setRowPerPage(rowPerPage);
		page.setSearchWord(searchWord);
		log.debug("=======Page"+page);
		int beginRow = ((currentPage-1)*page.getRowPerPage());
		int filmTotal = inventoryMapper.selectInventoryTotalCount(page);
		int lastPage = filmTotal/page.getRowPerPage();
		if(filmTotal%page.getRowPerPage()!=0) {
			lastPage += 1;
		}
		log.debug("=======마지막 페이지:"+lastPage);
		log.debug("=======전체 영화 수:"+filmTotal);
		
		List<Map<String, Object>> list = inventoryMapper.selectInventoryInfoList(page);
		List<Integer> storeIdList = new ArrayList<>();
		List<Integer> filmIdList = new ArrayList<>();
		Map<String, Object> inMap = new HashMap<>();
		List<Integer> stockCnt = new ArrayList<>();
		List<Integer> notStockCnt = new ArrayList<>();
		int storeId=0;
		int filmId=0;
		
		for(Map<String, Object> data : list) {
			storeId = (int) data.get("storeId");
			storeIdList.add(storeId);
			filmId = (int) data.get("filmId");
			filmIdList.add(filmId);
			inMap.put("storeId", storeId);
			inMap.put("filmId", filmId);
			stockCnt.add(inventoryMapper.selectInventoryStockCnt(inMap));
			notStockCnt.add(inventoryMapper.selectInventoryNotStockCnt(inMap));
		}
		
		log.debug("==================inMap:"+inMap);
		log.debug("==================stockCnt:"+stockCnt);
		log.debug("==================notStockCnt:"+notStockCnt);
		
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("filmTotal", filmTotal);
		map.put("beginRow", beginRow);
		map.put("lastPage", lastPage);
		map.put("stockCnt", stockCnt);
		map.put("rowPerPage", rowPerPage);
		map.put("notStockCnt", notStockCnt);
		return map;
	}
	public Map<String, Object> getInventoryOne(int filmId) {
		int store1Id = 1;
		int store2Id = 2;
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("storeId", store1Id);
		paramMap.put("filmId", filmId);
		List<Integer> stockList1 = inventoryMapper.selectInventoryOneStock(paramMap);
		List<Integer> notStockList1 = inventoryMapper.selectInventoryOneNotStock(paramMap);
		paramMap.put("storeId", store2Id);
		List<Integer> stockList2 = inventoryMapper.selectInventoryOneStock(paramMap);
		List<Integer> notStockList2 = inventoryMapper.selectInventoryOneNotStock(paramMap);
		
		
		log.debug("-===============1매장 대여가능 리스트"+stockList1);
		log.debug("-===============2매장 대여가능 리스트"+stockList2);
		Map<String, Object> map = new HashMap<>();
		map.put("stockList1", stockList1);
		map.put("stockList2", stockList2);
		map.put("notStockList1", notStockList1);
		map.put("notStockList2", notStockList2);
		return map;
	}
	public int removeInventory(int inventoryId) {
		int row = inventoryMapper.deleteInventoryByInventoryId(inventoryId);
		log.debug("=================인벤토리 삭제 row : "+row);
		return row;
	}
	public int addInventory(Inventory inventory) {
		int row = inventoryMapper.insertInventory(inventory);
		log.debug("=================인벤토리 추가 row : "+row);
		return row;
	}
	
}
