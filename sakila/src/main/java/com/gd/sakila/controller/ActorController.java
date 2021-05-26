package com.gd.sakila.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.sakila.service.ActorService;
import com.gd.sakila.vo.Actor;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
@RequestMapping("/admin")
public class ActorController {
	@Autowired ActorService actorService;
	@GetMapping("/addActor")
	public String addActor() {
		return "addActor";
	}
	@PostMapping("/addActor")
	public String addActor(Model model, Actor actor) {
		actorService.addActor(actor);
		log.debug("=================배우 추가:"+actor);
		return "redirect:/admin/getActorList";
	}
	@GetMapping("/getActorList")
	public String getActorList( Model model,
								@RequestParam(value="currentPage", defaultValue="1") int currentPage,
								@RequestParam(value="rowPerPage", defaultValue="10") int rowPerPage,
								@RequestParam(value="searchWord", required=false) String searchWord) {
		Map<String, Object> map = actorService.getActorList(currentPage, rowPerPage, searchWord);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("rowPerPage", rowPerPage);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("actorList", map.get("actorList"));
		model.addAttribute("lastPage", map.get("lastPage"));
		log.debug("================배우 목록 검색어 : " + searchWord);
		log.debug("================배우 목록 rowPerpage : " + rowPerPage);
		log.debug("================배우 목록 현재 페이지 : " + currentPage);
		log.debug("================배우 목록 마지막 페이지 : " + map.get("lastPage"));
		log.debug("================배우 목록 : " + map.get("actorList"));
		return "getActorList";
	}
}
