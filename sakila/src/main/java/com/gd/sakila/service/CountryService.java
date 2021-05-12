package com.gd.sakila.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.sakila.mapper.CountryMapper;
import com.gd.sakila.vo.Country;
import com.gd.sakila.vo.PageParam;

@Service
@Transactional
public class CountryService {
	@Autowired //생성자 생성 따로 안 해줘도 됨. (객체가 자동으로 만들어짐.)
	private CountryMapper countryMapper;
	public Map<String, Object> getCountryList(int currentPage, int rowPerPage){
		//컨트롤러에서 보내준 매개값을 가공
		int beginRow = (currentPage-1) * rowPerPage;
		PageParam pageParam = new PageParam();
		pageParam.setBeginRow(beginRow);
		pageParam.setRowPerPage(rowPerPage);
		
		//dao 호출
		List<Country> list = countryMapper.selectCountryList(pageParam);
		int total = countryMapper.selectCountryTotal();
		System.out.println(list.size());

		//dao 반환값 가공
		int lastPage = total / rowPerPage;
		if(lastPage%rowPerPage!=0) {
			lastPage += 1;
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("lastPage", lastPage);
		return map;
	}
}
