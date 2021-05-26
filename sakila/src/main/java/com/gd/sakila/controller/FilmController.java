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

import com.gd.sakila.service.FilmService;
import com.gd.sakila.vo.Actor;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@Transactional
@RequestMapping("/admin")
public class FilmController {
	@Autowired FilmService filmService;
	
	@GetMapping("/getFilmOne")
	public String getFilmOne(Model model, @RequestParam(value="filmId", required=true) int filmId, 
							@RequestParam(value="storeId", defaultValue="1",required=true) int storeId) {
		Map<String, Object> map = filmService.getFilmOne(filmId, storeId);
		model.addAttribute("filmId", filmId);
		model.addAttribute("storeId", storeId);
		model.addAttribute("filmMap", map.get("filmMap"));
		model.addAttribute("filmCount", map.get("filmCount"));
		log.debug("================상세보기 filmId"+filmId);
		log.debug("================상세보기 storeId"+storeId);
		log.debug("================상세보기 filmCount" + map.get("filmCount"));
		log.debug("================상세보기 filmList : "+ map.get("filmMap"));
		return "getFilmOne";
	}

	@GetMapping("/getFilmList")
	public String getFilmList(Model model, @RequestParam(value="currentPage", defaultValue="1") int currentPage, 
							@RequestParam(value="rowPerPage", defaultValue="10") int rowPerPage, 
							@RequestParam(value="searchWord", required=false) String searchWord,
							@RequestParam(value="searchWordForActor", required=false) String searchWordForActor,
							@RequestParam(value="categoryName", required=false) String categoryName,
							@RequestParam(value="orderWord", defaultValue="FID") String orderWord,
							@RequestParam(value="price", required=false ) Double price,
							@RequestParam(value="rating", required=false ) String rating) {
		if(categoryName != null && categoryName.equals("")) {
			categoryName = null;
		}
		if(price != null && price == 0) {
			price = null;
		}
		if(rating != null && rating.equals("")) {
			rating = null;
		}
		
		Map<String, Object> map = filmService.getFilmList(currentPage, rowPerPage, searchWord, categoryName, orderWord, price, rating, searchWordForActor);
		log.debug("=============page 값" + rowPerPage);
		log.debug("=============categoryNameList"+map.get("categoryNameList"));
		log.debug("=============가격 값" + price);
		model.addAttribute("filmList", map.get("filmList"));
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("searchWordForActor", searchWordForActor);
		model.addAttribute("categoryNameList", map.get("categoryNameList"));
		model.addAttribute("ratingList", map.get("ratingList"));
		model.addAttribute("categoryName", categoryName);
		model.addAttribute("orderWord", orderWord);
		model.addAttribute("price", price);
		model.addAttribute("rating", rating);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("beginRow", map.get("beginRow"));
		
		return "getFilmList";
	}
	@GetMapping("/getActorListForFilm")
	public String getActorListForFilm(Model model,
			@RequestParam(value="filmId", required=true) int filmId) {
		List<String> actorList = filmService.getActorListForFilm(filmId);
			log.debug("==================배우 목록 :"+actorList);
			model.addAttribute("actorList", actorList);
			model.addAttribute("filmId", filmId);
		return "getActorListForFilm";
	}
	/*
	@GetMapping("/getActorListForFilmSearch")
	public String getActorListForFilm(@RequestParam(value="searchWord", required=false) String searchWord) {
		return "getActorListForFilm";
	}
	*/

}
