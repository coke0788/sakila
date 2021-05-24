package com.gd.sakila.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gd.sakila.mapper.FilmMapper;
import com.gd.sakila.vo.FilmList;
import com.gd.sakila.vo.Page;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class FilmService {
	@Autowired FilmMapper filmMapper; 
	//타이틀 기준으로 영화 목록 보여주기
	public Map<String, Object> getFilmListAsTitle(int currentPage, int rowPerPage, String searchWord, String orderWord){
		Page page = new Page();
		int filmTotal = filmMapper.selectFilmTotalSearchAsTitle(searchWord);
		int lastPage = filmTotal/rowPerPage;
		if(filmTotal%rowPerPage!=0) {
			lastPage += 1;
		}
		page.setBeginRow((currentPage-1)*rowPerPage);
		page.setRowPerPage(rowPerPage);
		page.setSearchWord(searchWord);
		page.setOrderWord(orderWord);
		log.debug("================영화 리스트 page 값 : "+page);
		List<FilmList> list = filmMapper.selectFilmListByFilmIdSearchAsTitle(page);
		Map<String, Object> map = new HashMap<>();
		map.put("filmList", list);
		map.put("lastPage", lastPage);
		map.put("filmTotal", filmTotal);
		log.debug("=================영화 리스트 list :"+list);
		return map;
	}
	//배우 기준으로 영화 목록 보여주기
	public Map<String, Object> getFilmListAsActor(int currentPage, int rowPerPage, String searchWord, String orderWord){
		Page page = new Page();
		int filmTotal = filmMapper.selectFilmTotalSearchAsActor(searchWord);
		int lastPage = filmTotal/rowPerPage;
		if(filmTotal%rowPerPage!=0) {
			lastPage += 1;
		}
		page.setBeginRow((currentPage-1)*rowPerPage);
		page.setRowPerPage(rowPerPage);
		page.setSearchWord(searchWord);
		page.setOrderWord(orderWord);
		log.debug("================영화 리스트 page 값 : "+page);
		List<FilmList> list = filmMapper.selectFilmListByFilmIdSearchAsActor(page);
		Map<String, Object> map = new HashMap<>();
		map.put("filmList", list);
		map.put("lastPage", lastPage);
		map.put("filmTotal", filmTotal);
		log.debug("=================영화 리스트 list :"+list);
		return map;
	}
	//영화 상세보기
	//map 안에는 film과 count가 있다.
	public Map<String, Object> getFilmOne(int filmId, int storeId){
		Map<String, Object> paramMap = new HashMap<String, Object>(); //이거는 procedure의 In (입력값)
		paramMap.put("filmId", filmId);
		paramMap.put("storeId", storeId);
		int filmCount = 0;
		paramMap.put("filmCount", filmCount);
		List<Integer> list = filmMapper.selectFilmInStock(paramMap);
		Map<String,Object> filmMap = filmMapper.selectFilmOne(filmId);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("filcount", paramMap.get("filmCount"));
		map.put("filmMap",filmMap);
		log.debug("================상세보기 filmId :"+filmId);
		log.debug("================재고조사 filmCount : "+paramMap.get("filmCount"));
		log.debug("================재고조사 list : " + list);
		log.debug("================필름 상세보기 map : "+filmMap);
		return map;
	}
}
