package com.gd.sakila.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gd.sakila.mapper.CategoryMapper;
import com.gd.sakila.mapper.FilmMapper;
import com.gd.sakila.vo.Category;
import com.gd.sakila.vo.Film;
import com.gd.sakila.vo.FilmForm;
import com.gd.sakila.vo.FilmList;
import com.gd.sakila.vo.Page;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class FilmService {
	@Autowired FilmMapper filmMapper; 
	@Autowired CategoryMapper categoryMapper;
	
	// categoryService.class로 이동?
	public List<Category> getCategoryList(){	
		return categoryMapper.selectCategoryList();
	}
	
	public int addFilm(FilmForm filmForm) { //입력값 : film입력 폼
		Film film = filmForm.getFilm();
		filmMapper.insertFilm(film); //film id 생성 후 film.setFilmId(생성된 값) 호출
		Map<String, Object> map = new HashMap<>();
		map.put("categoryId", filmForm.getCategory().getCategoryId());
		map.put("filmId", film.getFilmId());
		filmMapper.insertFilmCategory(map);
		return film.getFilmId(); //컨트롤러에 filmid를 리턴 한다. 컨트롤러에서 입력된 film의 filmid값을 얻기 위해서 
	}
	
	public Map<String, Object> getFilmList(int currentPage, int rowPerPage, String searchWord, 
											String categoryName, String orderWord, Double price, 
											String rating, String searchWordForActor){
		Map<String, Object> paramMap = new HashMap<>();
		int beginRow = ((currentPage-1)*rowPerPage);
		paramMap.put("categoryName", categoryName);
		paramMap.put("orderWord", orderWord);
		paramMap.put("searchWord", searchWord);
		paramMap.put("searchWordForActor", searchWordForActor);
		paramMap.put("rating", rating);
		paramMap.put("price", price);
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		log.debug("================카테고리 이름 값 : "+categoryName);
		
		int filmTotal = filmMapper.selectFilmTotal(paramMap);
		int lastPage = filmTotal/rowPerPage;
		if(filmTotal%rowPerPage!=0) {
			lastPage += 1;
		}
		List<Map<String, Object>> filmList = filmMapper.selectFilmListByFilmId(paramMap);
		List<Category> categoryNameList = categoryMapper.selectCategoryList();
		List<String> ratingList = filmMapper.selectRatingList();
		
		Map<String, Object> map = new HashMap<>();
		map.put("filmList", filmList);
		map.put("filmTotal", filmTotal);
		map.put("categoryNameList", categoryNameList);
		map.put("ratingList", ratingList);
		map.put("beginRow", beginRow);
		map.put("lastPage", lastPage);
		log.debug("=================등급 리스트 list :"+ratingList);
		log.debug("=================카테고리 리스트 list :"+categoryNameList);
		log.debug("=================영화 리스트 list :"+filmList);
		log.debug("=================시작 페이지 : " + beginRow);
		log.debug("=================마지막 페이지 : " + lastPage);
		
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
		map.put("filmCount", paramMap.get("filmCount"));
		map.put("filmMap",filmMap);
		log.debug("================상세보기 filmId :"+filmId);
		log.debug("================재고조사 filmCount : "+map.get("filmCount"));
		log.debug("================재고조사 list : " + list);
		log.debug("================필름 상세보기 map : "+filmMap);
		return map;
	}
	//영화에 출연한 배우 목록
	public List<Map<String, Object>> getActorListForFilm(int filmId, String searchWord){
		Map<String, Object> map = new HashMap<>();
		map.put("searchWord", searchWord);
		map.put("filmId", filmId);
		List<Map<String, Object>> actorList = filmMapper.selectActorForFilm(map);
		log.debug("================배우 목록:"+actorList);
		return actorList;
	}
	//영화에 배우 추가
	public void addActorForFilm(int filmId, int[] actorId) {
		int rowCnt=0;
		for(int a : (int[])actorId) {
			Map<String, Object> map = new HashMap<>();
			map.put("filmId", filmId);
			map.put("actorId", a);
			rowCnt = filmMapper.insertActorForFilm(map);
			log.debug("=================영화에 배우 삽입 :" + a);
		}
		log.debug("=================영화에 배우 삽입 :" + rowCnt);
	}
}
