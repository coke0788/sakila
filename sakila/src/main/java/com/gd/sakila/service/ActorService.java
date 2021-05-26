package com.gd.sakila.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.sakila.mapper.ActorMapper;
import com.gd.sakila.vo.Actor;
import com.gd.sakila.vo.Page;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class ActorService {
	@Autowired ActorMapper actorMapper;
	public int addActor(Actor actor) {
		log.debug("==================배우 입력 : " + actor);
		return actorMapper.insertActor(actor);
	}
	public Map<String, Object> getActorList(int currentPage, int rowPerPage, String searchWord, String searchWordForFilm){
		Map<String, Object> paramMap = new HashMap<>();
		int beginRow = ((currentPage-1)*rowPerPage);
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		paramMap.put("searchWord", searchWord);
		paramMap.put("searchWordForFilm", searchWordForFilm);
		int actorTotal = actorMapper.selectActorTotal(paramMap);
		int lastPage = actorTotal/rowPerPage;
		if(actorTotal%rowPerPage!=0) {
			lastPage += 1;
		}
		List<Actor> actorList = actorMapper.selectActorInfoList(paramMap);
		log.debug("==================배우 목록 영화용 검색어"+searchWordForFilm);
		log.debug("==================배우 목록"+actorList);
		Map<String, Object> map = new HashMap<>();
		map.put("lastPage", lastPage);
		map.put("actorList", actorList);
		return map;
	}
}
