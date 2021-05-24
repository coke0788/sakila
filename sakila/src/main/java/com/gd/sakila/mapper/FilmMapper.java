package com.gd.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.sakila.vo.FilmList;
import com.gd.sakila.vo.Page;

@Mapper
public interface FilmMapper {
	List<FilmList> selectFilmListByFilmIdSearchAsTitle(Page page);
	List<FilmList> selectFilmListByFilmIdSearchAsActor(Page page);
	int selectFilmTotalSearchAsTitle(String searchWord);
	int selectFilmTotalSearchAsActor(String searchWord);
	List<Integer> selectFilmInStock(Map<String, Object> map);
	Map<String, Object> selectFilmOne(int filmId);
}
