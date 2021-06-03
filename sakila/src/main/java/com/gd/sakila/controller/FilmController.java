package com.gd.sakila.controller;

import java.util.HashMap;
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
import com.gd.sakila.service.LanguageService;
import com.gd.sakila.vo.Actor;
import com.gd.sakila.vo.Category;
import com.gd.sakila.vo.FilmForm;
import com.gd.sakila.vo.Language;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@Transactional
@RequestMapping("/admin")
public class FilmController {
	@Autowired FilmService filmService;
	@Autowired LanguageService languageService;
	
	@GetMapping("/addFilm")
	public String addFilm(Model model) {
		List<Category> categoryList = filmService.getCategoryList();
		List<Language> languageList = languageService.getLanguageList();
		log.debug("=================필름 추가 시 카테고리목록 사이즈"+categoryList.size());
		log.debug("=================필름 추가 시 언어목록 사이즈"+languageList.size());
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("languageList", languageList);
		return "addFilm";
	}
	@PostMapping("/addFilm")
	public String addFilm(FilmForm filmForm) {  // 기본(값)티입의 경우 매개변수 이름과 name이 같으면 매핑. 참조타입은 필드명과 name이 같으면 매핑.
		int filmId = filmService.addFilm(filmForm);
		log.debug("=================추가 필름 아이디 :"+filmId);
		log.debug("=================입력값 :"+filmForm);
		return "redirect:/admin/getFilmOne?filmId="+filmId;
	}
	
	@GetMapping("/getFilmOne")
	public String getFilmOne(Model model, @RequestParam(value="filmId", required=true) int filmId, 
							@RequestParam(value="currentPage", defaultValue="1") int currentPage,
							@RequestParam(value="storeId", defaultValue="1",required=true) int storeId,
							@RequestParam(value="rowPerPage", defaultValue="10") int rowPerPage, 
							@RequestParam(value="searchWord", required=false) String searchWord,
							@RequestParam(value="searchWordForActor", required=false) String searchWordForActor,
							@RequestParam(value="categoryName", required=false) String categoryName,
							@RequestParam(value="orderWord", defaultValue="FID") String orderWord,
							@RequestParam(value="price", required=false ) Double price,
							@RequestParam(value="rating", required=false ) String rating) {
		Map<String, Object> map = filmService.getFilmOne(filmId, storeId);
		model.addAttribute("filmId", filmId);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("storeId", storeId);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("searchWordForActor", searchWordForActor);
		model.addAttribute("categoryName", categoryName);
		model.addAttribute("orderWord", orderWord);
		model.addAttribute("price", price);
		model.addAttribute("rating", rating);
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
		List<Map<String, Object>> actorList = filmService.getActorListForFilm(filmId);
			log.debug("==================배우 목록 :"+actorList);
			model.addAttribute("actorList", actorList);
			model.addAttribute("filmId", filmId);
		return "getActorListForFilm";
	}
	@PostMapping("/getActorListForFilm")
	public String getActorListForFilm(@RequestParam(value="filmId", required=true) int filmId,
									@RequestParam(value="actorId") int[] actorId) {
		log.debug("==================추가 배우 :"+actorId.length);
		log.debug("==================추가 필름ID :"+filmId);
		filmService.addActorForFilm(filmId, actorId);
		return "redirect:/admin/getFilmOne?filmId="+filmId;
	}
	/*
	@GetMapping("/getActorListForFilmSearch")
	public String getActorListForFilm(Model model,
									@RequestParam(value="searchWord", required=false) String searchWord,
									@RequestParam(value="filmId", required=true) int filmId) {
		List<String> actorList = filmService.getActorListForFilm(filmId);
		log.debug("==================배우 목록 :"+actorList);
		model.addAttribute("actorList", actorList);
		model.addAttribute("filmId", filmId);
		return "redirect:/admin/getActorListForFilm?searchWord="+searchWord+"&filmId="+filmId;
	}
	*/
}
