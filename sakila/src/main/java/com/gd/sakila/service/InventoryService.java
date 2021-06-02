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
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("page", page);
		int filmTotal = filmMapper.selectFilmTotal(paramMap);
		int lastPage = filmTotal/page.getRowPerPage();
		if(filmTotal%page.getRowPerPage()!=0) {
			lastPage += 1;
		}
		List<Map<String, Object>> list = inventoryMapper.selectInventoryInfoList(page);
		List<Integer> storeIdList = new ArrayList<>();
		List<Integer> filmIdList = new ArrayList<>();
		Map<String, Object> inMap = new HashMap<>();
		List<Integer> stockCnt = new ArrayList<>();
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
		}
		
		log.debug("==================inMap:"+inMap);
		log.debug("==================stockCnt:"+stockCnt);
		
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("filmTotal", filmTotal);
		map.put("beginRow", beginRow);
		map.put("lastPage", lastPage);
		map.put("stockCnt", stockCnt);
		map.put("rowPerPage", rowPerPage);
		return map;
	}
	public List<Integer> getInventoryOne(int filmId) {
		int store1Id = 1;
		int store2Id = 2;
		int stockCount = 0;
		int inventoryId = 0;
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("storeId", store1Id);
		paramMap.put("filmId", filmId);
		List<Integer> list = inventoryMapper.selectInventory(paramMap);
		log.debug("-===============리스트"+list);
		return list;
	}
}
