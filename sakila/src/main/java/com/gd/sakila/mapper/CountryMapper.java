package com.gd.sakila.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gd.sakila.vo.Country;
import com.gd.sakila.vo.PageParam;

//Mapper 애노테이션 만들어놓으면 spring이 mapper를 찾아서 자식클래스를 알아서 만들어준다.
@Mapper
public interface CountryMapper {
	List<Country> selectCountryList(PageParam pageParam);
	int selectCountryTotal();
}
