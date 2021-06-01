package com.gd.sakila.service;

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
		
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("filmTotal", filmTotal);
		map.put("beginRow", beginRow);
		map.put("lastPage", lastPage);
		return map;
	}
}
