package com.gd.sakila.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.sakila.service.FilmService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@Transactional
@RequestMapping("/admin")
public class FilmController {
	@Autowired FilmService filmservice;
	@GetMapping("/getFilmOne")
	public String getFilmOne(Model model, @RequestParam(value="filmId", required=true) int filmId, @RequestParam(value="storeId", defaultValue="1",required=true) int storeId) {
		Map<String, Object> map = filmservice.getFilmOne(filmId, storeId);
		model.addAttribute("filmId", filmId);
		model.addAttribute("storeId", storeId);
		model.addAttribute("filmMap", map.get("filmMap"));
		model.addAttribute("filmCount", map.get("filmCount"));
		log.debug("================상세보기 filmId"+filmId);
		log.debug("================상세보기 storeId"+storeId);
		log.debug("================상세보기 filmList : "+ map.get("filmList"));
		return "getFilmOne";
	}
	
	@GetMapping("/getFilmList")
	public String getFilmList(Model model, @RequestParam(value="orderWord", defaultValue="title")String orderWord, @RequestParam(value="searchCategory", defaultValue="title") String searchCategory, @RequestParam(value="currentPage", defaultValue="1") int currentPage, @RequestParam(value="rowPerPage", defaultValue="10") int rowPerPage, @RequestParam(value="searchWord", required = false) String searchWord) {
		if(searchCategory.equals("actor")) { //actor로 검색 목록을 출력할지 title로 검색목록을 출력할지 정해야함. default는 타이틀. --> 선택하는거 만들기
			Map<String,Object> map = filmservice.getFilmListAsActor(currentPage, rowPerPage, searchWord, orderWord);
			model.addAttribute("lastPage", map.get("lastPage"));
			model.addAttribute("filmList", map.get("filmList"));
		} else {
			Map<String,Object> map = filmservice.getFilmListAsTitle(currentPage, rowPerPage, searchWord, orderWord);
			model.addAttribute("lastPage", map.get("lastPage"));
			model.addAttribute("filmList", map.get("filmList"));
		}
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("rowPerPage", rowPerPage);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("orderWord", orderWord);
		model.addAttribute("searchCategory", searchCategory);
		return "getFilmList";
	}
}
