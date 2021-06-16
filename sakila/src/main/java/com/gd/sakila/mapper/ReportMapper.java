package com.gd.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReportMapper {
	List<Map<String, Object>> selectMonthlySales();
	List<Map<String, Object>> selectSalesByStore();
	List<Map<String, Object>> selectSalesByCategory();
	List<Map<String, Object>> selectBestSeller();
}
