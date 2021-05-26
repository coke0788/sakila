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
	public Map<String, Object> getActorList(int currentPage, int rowPerPage, String searchWord){
		int actorTotal = actorMapper.selectActorTotal(searchWord);
		int lastPage = actorTotal/rowPerPage;
		if(actorTotal%rowPerPage!=0) {
			lastPage += 1;
		}
		int beginRow = ((currentPage-1)*rowPerPage);
		Page page = new Page();
		page.setBeginRow(beginRow);
		page.setRowPerPage(rowPerPage);
		page.setSearchWord(searchWord);
		List<Actor> actorList = actorMapper.selectActorInfoList(page);
		log.debug("==================배우 목록 페이지"+page);
		log.debug("==================배우 목록"+actorList);
		Map<String, Object> map = new HashMap<>();
		map.put("lastPage", lastPage);
		map.put("actorList", actorList);
		return map;
	}
}
