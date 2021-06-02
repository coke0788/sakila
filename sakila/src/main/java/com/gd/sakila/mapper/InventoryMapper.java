package com.gd.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.sakila.vo.Page;

@Mapper
public interface InventoryMapper {
	List<Map<String, Object>> selectInventoryInfoList(Page page);
	List<Integer> selectInventoryTotal();
	int selectInventoryStockCnt(Map<String, Object> map);
	List<Integer> selectInventory(Map<String, Object> map);
}
