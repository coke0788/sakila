package com.gd.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.sakila.vo.Actor;
import com.gd.sakila.vo.Page;

@Mapper
public interface ActorMapper {
	int insertActor(Actor actor);
	List<Actor> selectActorInfoList(Map<String, Object> map);
	int selectActorTotal(Map<String, Object> map);
}
