package com.gd.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.sakila.vo.FilmList;
import com.gd.sakila.vo.Page;

@Mapper
public interface FilmMapper {
	List<Map<String, Object>> selectFilmListByFilmId(Map<String, Object> map);
	/*
	List<FilmList> selectFilmListByFilmIdSearchAsActor(Map<String, Object> pageMap);
	int selectFilmTotalSearchAsTitle(String searchWord);
	*/
	int selectFilmTotal(Map<String, Object> map);
	List<Integer> selectFilmInStock(Map<String, Object> map);
	Map<String, Object> selectFilmOne(int filmId);
	List<Map<String, Object>> selectFilmList(Map<String, Object> map);
	List<String> selectRatingList();
}
